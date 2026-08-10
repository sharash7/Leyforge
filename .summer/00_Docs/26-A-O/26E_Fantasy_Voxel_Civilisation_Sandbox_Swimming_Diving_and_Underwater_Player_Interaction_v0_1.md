# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26E - Swimming, Diving and Underwater Player Interaction

*Version 0.1 - Aquatic Locomotion, Survival, Work, Combat, Rescue and Accessibility Contract Draft*

A governing player-interaction, progression, survival, combat, rescue, interface and technical foundation for entering, traversing, working, fighting, building and surviving in Leyforge's rivers, lakes, coasts, oceans, flooded spaces and underwater regions.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

Prepared 6 August 2026

---

> **Aquatic Player Interaction Statement**
>
> Water in Leyforge must be a traversable, buildable, dangerous and rewarding part of the voxel world rather than a visual boundary or a slow walking state. Players must be able to wade, swim, float, dive, surface, climb out, rescue others, explore caves and ruins, harvest resources, build shelters, use tools, fight, interact with vessels and eventually undertake deep-water expeditions. The system must remain readable and configurable: ordinary water should not constantly punish the player, serious depth and weather hazards must be signposted, and every major risk must have equipment, skill, planning, magic, infrastructure, cooperation or world-setting responses. Aquatic interaction consumes the authoritative liquid, depth, current, wave, tide, temperature, visibility and hazard states established by Documents 26B-26D; it does not secretly calculate a second ocean.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 26E in Document Set 26: Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion. |
| Document Scope | Defines water-contact states, wading, entry and exit, surface swimming, floating, treading water, underwater locomotion, stamina, breath, drowning, recovery, depth and pressure response, temperature, visibility, environmental-force response, equipment, magic, traits, underwater work, building, mining, interaction, combat, stealth, rescue, NPC behaviour, vessel-side interaction, progression, UI, accessibility, difficulty, multiplayer authority, persistence, performance, data contracts, validation and handoffs. |
| Core Philosophy | Aquatic play is a complete extension of the sandbox loop. It must support exploration, survival, construction, civilisation, automation, magic, combat and cooperation without becoming a separate minigame or a realism burden. |
| Fluid Authority | Document 26B owns liquid identity, contact, local volume, displacement, containment, flooding, air/fluid boundaries and pressure/head classes. 26E consumes those queries and owns character response. |
| World Authority | Document 26C owns generated Water Bodies, bathymetry, depth bands, terrain, caves, access classes, structures, refuges and route context. 26E owns how characters traverse and interact with those spaces. |
| Environment Authority | Document 26D owns current, waves, surf, undertow, turbulence, temperature, visibility, ice, storms, lightning and warning state. 26E consumes environment snapshots and applies player-facing locomotion, survival and rescue consequences. |
| Movement Direction | Surface and underwater movement use responsive character locomotion with bounded environmental forces. The player is never treated as an uncontrolled rigid body during ordinary swimming. |
| Breath Direction | Breath is a readable capacity affected by exertion, condition, preparation, equipment, magic and difficulty. It is not a per-molecule oxygen simulation. |
| Drowning Direction | Drowning escalates through clear warning and recoverable stages. Default play provides a rescue/incapacitation window before death; harsh settings may tighten it. |
| Pressure Direction | Depth hazards use authored pressure bands and capability checks. Exact real-world decompression physics are not required. Advanced rapid-ascent stress may exist only as a configurable high-tier rule. |
| Inventory Direction | The existing slot inventory remains authoritative. Aquatic burden uses equipment-load and tagged-heavy-object classes rather than introducing a hidden universal weight simulation. |
| Combat Direction | Underwater combat extends the shared combat system with medium-specific action modifiers, specialised tools and readable counters. It does not create a disconnected second combat game. |
| Trait Direction | Ancestry, culture, equipment, training, magic and temporary effects may change aquatic capability. Ancestry never determines morality, profession or mandatory superiority, and any contextual weakness must have mitigation paths. |
| Accessibility Direction | Auto-surface assistance, simplified vertical controls, hold/toggle options, reduced camera motion, clear depth/breath cues and configurable drowning risk are first-class settings. Accessibility may change input and presentation without invalidating progression. |
| Engine Direction | Godot with Summer Engine remains the production direction. Data-oriented services own authoritative state; CharacterBody-style controllers, animation, shaders, audio and VFX consume validated snapshots. |
| Production Direction | Architecture is defined now; exact speeds, breath times, depth thresholds, equipment tiers and first-release content remain classification and prototype decisions under Set 25 and 26O. |
| Final Authority | Ash retains final authority over realism, survival severity, control feel, drowning defaults, pressure depth, underwater combat scope, accessibility options and production admission. |
| Next Deliverable | 26F - Voxel Vessel Architecture, Structural Roles and Commissioning. |

# Document Purpose

Document 26E defines how players and relevant NPCs physically and systemically interact with water after Documents 26B-26D establish the liquid, generated marine world and changing environmental state. It converts water contact into an integrated gameplay layer: entry, movement, breath, depth, equipment, work, combat, rescue, recovery, progression and player-facing feedback.

The document exists because oceans and vessels cannot become core Leyforge systems while characters treat water as a shallow visual effect. A player must be able to fall overboard, swim to shore, climb a ladder, dive beneath a wreck, mine a reef resource, place a temporary air shelter, cut a trapped NPC free, fight a creature, repair a flooded structure and recover from a storm. These actions must use the same inventory, skills, tools, magic, combat, permissions, quests and living-world consequences as land play.

The proof of concept is retired. No rule assumes a fixed tutorial river, a scripted first dive, universal calm water or a hardcoded wreck. New worlds remain seed-derived. Safe introductions are achieved through capability-aware content placement, readable depth bands, early rescue options, tutorial layers and world settings rather than a fixed map.

This document does not define vessel physics, vessel construction, final marine creature rosters, port economies, full naval combat, final diving-item registries or presentation assets. It defines the player-facing contracts those later documents must consume. Exact numerical balance remains provisional until tested in packaged Godot builds and approved through 26O.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 26E |
| --- | --- | --- |
| Ash - locked project direction | Dedicated maritime expansion including oceans, water overhaul, freeform vessels, NPC crews, trade, piracy and navies. | Applied as locked scope. Aquatic play must support the whole maritime expansion, not only personal swimming. |
| 26A - Maritime and Naval Expansion Foundation | Swimming, diving, breath, pressure, visibility, underwater work, combat, rescue, magic, traits, accessibility and system boundaries. | Primary expansion authority and document map. |
| 26B - Water, Liquid and Fluid Simulation Overhaul | Stable Water Bodies, local fluid cells, contact, displacement, containment, flooding, pressure/head classes, air pockets, hazards, LOD and authority. | Supplies all liquid truth. 26E applies character and action response. |
| 26C - Marine World Generation | Depth bands, bathymetry, caves, structures, freshwater, refuges, light, pressure slots, access classes, hazards and progression readability. | Supplies world spaces and generated access context. |
| 26D - Marine Climate and Storms | Surface motion, current by depth, surf, undertow, turbulence, visibility, temperature, ice, storms, lightning, wave impact, forecast and rescue difficulty. | Supplies dynamic environment snapshots. 26E never recalculates these fields. |
| 00 - Master Game Design Bible | Sandbox freedom, configurable danger, living civilisations, block building, automation, practical magic and multiple player fantasies. | Aquatic play supports survivor, builder, explorer, mage-engineer, trader, ruler, conqueror and peaceful roles. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand; flexible order and configurable survival. | The full primary loop remains valid underwater and at the water surface. |
| 02 - Player Progression | Use-based skills, perks, knowledge, equipment, stamina, mana, temperature and no permanent class locks. | Aquatic capability grows through action, tools, knowledge, infrastructure and optional specialisation. |
| 03-06 - Blocks, Items, Recipes and Resources | Data-driven physical objects, linked item/block forms, exact recipes, old-material utility and special tools. | Underwater actions consume ordinary registry definitions plus aquatic facets; no duplicate water-only registry universe. |
| 07-08 - NPC Villages and Automation | Persistent NPCs, jobs, construction, permissions, warehouses, pumps, power, logistics and LOD. | NPC rescue, divers, flooded works, pumps and underwater projects use existing civilisation rules. |
| 09 - Magic System | Magic supports travel, construction, logistics, defence, healing and world interaction; non-mage viability remains valid. | Aquatic magic augments but does not replace equipment, training, infrastructure or teamwork. |
| 10/24F - Creatures and Ecology | Creatures are living systems with habitat, movement, threat, taming and resource roles. | 26E defines character/companion capability interfaces; roster ownership remains elsewhere. |
| 13 - Peoples, Cultures and Factions | Ancestry, culture and faction are separate; contextual weaknesses need mitigation; ancestry is not morality or profession. | Aquatic traits and cultural techniques follow these protections. |
| 15 - Quest and Event System | Authored and simulation-driven objectives, failure, contribution and persistent aftermath. | Dives, rescues, flood emergencies and underwater expeditions use shared quest/event contracts. |
| 16 - Combat, Gear and Defence | Shared action combat, health, stamina, mana, equipment load, injuries, accessibility and authoritative aftermath. | Underwater modifiers extend the shared combat model and damage pipeline. |
| 17 - UI/UX System | World-first, knowledge-aware, accessible, controller-ready, split-screen-aware interface; UI never invents state. | Defines aquatic HUD, warnings, controls, inspection and accessibility requirements. |
| Sets 21-23 - Forge and Presentation Forge | Semantic assets, animations, sockets, audio, VFX, previews and validation remain replaceable presentation products. | Aquatic presentation consumes gameplay events and never becomes the source of breath, current or collision truth. |
| Atlas 24C and connected Atlas documents | Marine environments, transformed seas, structures, ecology, cultures, dungeons and hazards. | Authored content fills the capability and hazard slots defined here. |
| Amended 25A-25B | Production governance, canonical IDs, schemas, definitions, facets, instances, aliases, validation and classification. | All records and dependencies follow the current amended Set 25 contracts. |
| Legacy 18 | Determinism, authority, saves, LOD, testing and performance; Unreal direction obsolete. | Engine-neutral reliability principles retained. Godot/Summer Engine supersedes Unreal implementation. |

# Supersession Rule

Document 26E supersedes broad, incomplete or POC-limited assumptions about swimming, drowning, underwater movement and pressure in earlier documents. It does not supersede:

- Document 26B's liquid and flooding truth.
- Document 26C's marine topology and generated depth/access truth.
- Document 26D's current, wave, weather, visibility, ice and warning truth.
- Document 16's general combat and damage architecture.
- Document 17's general interface and accessibility architecture.
- Document 13's identity protections.
- Later Set 26 ownership of vessels, ports, fleets, naval combat, ecology and final implementation.

# Static Table of Contents

- Locked Aquatic Player Interaction Identity
- Design Principles and Experience Targets
- Explicit Non-Goals
- Ownership and System Boundaries
- Aquatic Runtime Architecture
- Water Contact and Locomotion State Model
- Entering Water, Falling and Surface Acquisition
- Wading, Shallows and Shore Transitions
- Surface Swimming
- Floating, Treading Water and Rest
- Diving and Submergence Controls
- Underwater Locomotion and Orientation
- Stamina, Exertion and Movement Efficiency
- Breath and Air Supply
- Drowning, Incapacitation and Recovery
- Depth, Pressure and Rapid-Ascent Rules
- Temperature, Exposure and Thermal Protection
- Visibility, Light and Perception
- Currents, Waves, Surf, Undertow and Turbulence
- Storms, Ice, Lightning and Extraordinary Hazards
- Buoyancy, Equipment Load and Heavy Objects
- Aquatic Equipment Categories
- Diving Equipment and Capability Progression
- Magic, Potions, Enchantments and Ritual Support
- Ancestry, Culture, Training and Adaptation
- Underwater Tools, Mining and Harvesting
- Underwater Building and Block Placement
- Air Pockets, Shelters, Doors, Pumps and Flood Boundaries
- Underwater Stations, Automation and Infrastructure
- Interaction, Loot, Containers and Carrying
- Underwater Combat Foundation
- Melee, Blocking, Dodging and Stability Underwater
- Ranged Weapons, Projectiles and Specialised Arms
- Combat Magic and Environmental Reactions
- Injuries, Status Effects and Medical Recovery
- Stealth, Sound, Detection and Communication
- Creatures, Companions, Mounts and Taming Interfaces
- NPC Swimming, Diving, Work and Rescue Behaviour
- Man Overboard, Vessel-Side Interaction and Boarding
- Rescue, Towing, Flotation and Emergency Response
- Death, Item Recovery and Persistent Aftermath
- Skills, Perks, Knowledge and Progression
- Quests, Events, Tutorials and Discovery
- HUD, Inspection, Maps and Player Feedback
- Controls, Camera, Comfort and Accessibility
- Difficulty, World Settings and Assist Options
- Multiplayer, Split-Screen and Authority
- Persistence, Simulation LOD and Performance
- Godot/Summer Engine Technical Boundaries
- Animation, Audio, VFX and Presentation Forge Handoff
- Data Records, Registry Facets and Reason Codes
- Production Classification and Set 25 Integration
- Prototype Laboratories and Acceptance Evidence
- Validation, Failure Codes and Redesign Triggers
- Handoff to Document 26F
- Open Decisions for Later Documents

# 1. Locked Aquatic Player Interaction Identity

The Aquatic Player Interaction system is the character-facing water layer of Leyforge. It defines what water means to a player moment by moment: whether they stand, wade, float, swim, dive, struggle, work, fight, rescue, recover or use equipment and magic to overcome an environment.

> **Locked Rule**
>
> Water must create new choices rather than merely remove land controls. Every major aquatic mechanic must answer at least one useful question: how does the player travel, rest, breathe, see, work, build, fight, rescue, prepare, specialise, cooperate, retreat or recover?

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Traversal Medium | Water supports surface and three-dimensional movement with shore, structure and vessel transitions. | Rivers, flooded caves, reefs, wrecks and oceans become real routes. |
| Survival Environment | Breath, depth, temperature, visibility and weather create preparation needs. | Risk is legible and can be mitigated rather than arbitrary. |
| Sandbox Worksite | Mining, harvesting, building, repair, pumping and automation continue underwater. | Marine content connects to the core voxel loop. |
| Adventure Space | Ruins, caves, resources, creatures, quests and hidden routes occupy meaningful depth bands. | Diving creates discovery and progression, not empty blue volume. |
| Combat Medium | Shared combat adapts to drag, buoyancy, visibility and specialised equipment. | Encounters feel different without discarding learned controls. |
| Civilisation Layer | Divers, rescuers, ship crews, ports, flooded works and underwater infrastructure involve NPCs and settlements. | Water changes jobs, trade, safety and regional development. |
| Cooperation Layer | Towing, rescue, shared air, ropes, lights and vessel recovery reward teamwork. | Multiplayer and NPC companions gain unique maritime roles. |
| Accessible System | Controls, danger, warnings and presentation are configurable independently. | More players can participate without a separate reduced-content mode. |

## 1.1 Experience Promise

The player should understand why they are succeeding or failing. A character who is losing breath should receive escalating, redundant warning. A strong current should visibly and mechanically push in the same direction. A deep zone should be signposted by light, terrain, pressure information, equipment warnings and prior knowledge. An exit should be climbable when its geometry and conditions permit, not according to an invisible arbitrary boundary.

## 1.2 Default Experience

Default aquatic play is adventurous and readable rather than relentlessly lethal:

- Shallow water is easy to enter and leave.
- Ordinary surface swimming is viable without specialist gear.
- Early dives are brief but useful.
- Breath loss provides warning before injury.
- Recoverable incapacitation exists before death where rescue is possible.
- Deep, cold, stormy, toxic, magical and high-pressure water requires preparation.
- The player can retreat, rest, use flotation or seek air in many ordinary situations.
- Peaceful and accessibility settings may reduce or remove drowning and pressure damage while preserving exploration and building.

# 2. Design Principles and Experience Targets

| Principle | Required Outcome |
| --- | --- |
| Responsive Before Realistic | Input response, readable momentum and reliable exits outrank exact hydrodynamics. |
| One Authoritative Environment | Character effects derive from 26B-26D snapshots and never from duplicate local guesses. |
| Consequences, Not Molecules | Breath, depth, temperature and current use understandable classes and rates. |
| Capability, Not Binary Permission | Equipment, skill and conditions change efficiency and safety; ordinary actions are not hidden behind arbitrary unlocks. |
| Preparation Has Value | Better gear, knowledge, magic, teamwork and infrastructure expand range, duration and safety. |
| Old Solutions Remain Useful | Rope, flotation, ladders, pumps, cloth, wood, light and simple tools retain roles beside advanced magitech. |
| Clear Recovery Paths | Surface, air pockets, shelters, allies, flotation and rescue tools create ways to recover. |
| Sandbox Continuity | Building, mining, interaction, combat, quests, NPCs and automation use shared systems underwater. |
| Adjustable Severity | Breath, pressure, cold, motion and rescue windows are world/difficulty settings. |
| No Hidden Trait Determinism | Traits alter capability but never dictate identity, morality or profession. |
| Performance Bounded | Characters query regional fields and bounded local liquid state; they do not simulate surrounding water volumes. |

# 3. Explicit Non-Goals

Document 26E does not require:

- Real-world competitive-swimming simulation.
- Exact lung-volume, blood-gas or decompression medicine models.
- Per-item mass calculation for every inventory stack.
- Uncontrolled ragdoll swimming as the default locomotion method.
- A separate underwater inventory, skill tree, damage system or quest engine.
- Perfectly realistic underwater acoustics or light transport.
- Immediate full support for submarines, diving bells or pressure habitats; later documents may add vehicles and structures through these contracts.
- Automatic ancestry superiority that invalidates gear or player choice.
- Permanent punishment for entering ordinary water accidentally.
- Full NPC pathfinding through every possible flooded voxel arrangement at all simulation ranges.
- Presentation effects that obscure critical controls or warnings.

# 4. Ownership and System Boundaries

| State or Decision | Owner | 26E Responsibility |
| --- | --- | --- |
| Liquid type, local fill, surface and containment | 26B | Query contact, immersion and air/fluid boundary; apply character response. |
| Flooding and displacement | 26B | Request legal player/block interactions; never directly rewrite volume. |
| Water Body, depth, terrain, caves and structures | 26C | Use stable IDs, depth/access bands and geometry. |
| Current, wave, tide, surf, temperature, visibility, ice and storms | 26D | Consume environment snapshot and calculate character consequences. |
| Player health, stamina, mana and shared damage | 02/16 | Add aquatic costs, status and action modifiers through shared APIs. |
| Item, block, recipe and resource identity | 03-06/25B | Define aquatic facets and required references, not duplicate entries. |
| Spell definitions and magical ownership | 09 | Define capability interfaces and safe interaction boundaries. |
| Ancestry, culture and faction identity | 13 | Define aquatic trait/adaptation facets under identity protections. |
| General UI and accessibility | 17 | Define aquatic information and controls; use shared UI infrastructure. |
| Vessel motion and stability | 26G | Define swimmer-vessel contact requests only. |
| Vessel damage and flooding | 26L/26B | Respond to flooded spaces; do not decide hull damage. |
| Final marine creatures and ecology | 26M | Define capability queries for actors and companions. |
| Registry finalisation and production admission | 25/26N/26O | Supply fields, dependencies, validation and prototype evidence. |

## 4.1 No Duplicate Truth Rule

A player in rough water receives one coherent snapshot containing liquid, surface, current, wave, visibility, temperature and hazard information. Movement, UI, audio and VFX consume the same snapshot. A shader may exaggerate a wave visually for style, but it may not create an unreported gameplay push. A client may predict motion, but the server remains authoritative over consequential state.

# 5. Aquatic Runtime Architecture

The system uses definitions, runtime state and presentation layers.

| Layer | Purpose | Examples |
| --- | --- | --- |
| Aquatic Capability Definition | Reusable rules for a character, species, equipment set, spell or status. | breath_capacity, swim_efficiency, pressure_tolerance, rescue ability. |
| Environment Snapshot | Read-only authoritative sample from 26B-26D. | immersion, depth, current, sea state, temperature, clarity, hazard flags. |
| Aquatic Runtime State | Mutable character state. | locomotion state, breath remaining, exertion, wetness, pressure stress, rescue link. |
| Action Context | Validated attempt and result. | dive, surface, climb, mine, place block, grab ally, tow, attack. |
| Presentation Snapshot | Player-specific view of state. | HUD bands, warnings, camera targets, animation parameters, audio/VFX events. |
| Persistent Record | Only state that must survive unload/save. | long-duration injury, equipped air supply, rescue/incapacitation, tutorial knowledge. |

The core update should be event- and threshold-aware. Contact changes, depth-band changes, environment changes, action requests and periodic survival ticks drive work. The system must not perform expensive world scans every rendered frame.

# 6. Water Contact and Locomotion State Model

| State | Entry Condition | Core Behaviour |
| --- | --- | --- |
| Dry | No meaningful liquid contact. | Normal land movement. |
| Wet/Ankle Contact | Small contact below wading threshold. | Cosmetic wetness and minor terrain effects only. |
| Wading | Supported by ground with sufficient liquid depth. | Reduced land movement, splash, current resistance, normal breathing. |
| Deep Wading | Ground support remains but buoyancy is significant. | Slower movement, higher current effect, transition-ready. |
| Surface Supported | Character buoyancy intersects surface and head is in breathable space. | Surface swim, float, tread, breath recovery. |
| Submerged | Head/breath point is inside non-breathable liquid. | Underwater locomotion and breath consumption. |
| Grounded Underwater | Submerged and supported by terrain. | Walk/crawl/anchor actions where equipment permits. |
| Climbing/Exiting | Valid edge, ladder, rope, slope or rescue interaction. | Transitional movement with interruption rules. |
| Restrained/Entangled | Net, vegetation, wreckage, creature or status limits motion. | Escape, cut, assist or damage actions. |
| Incapacitated in Water | Drowning/injury threshold reached. | Limited drift, flotation and rescue window. |
| Attached/Towed | Linked to rope, ally, mount, vessel or flotation object. | Constraint and rescue logic. |

State changes use hysteresis to prevent rapid flickering at the surface. The character has separate reference points for feet, body, head and breath intake so slopes, waves and partial cells behave predictably.

# 7. Entering Water, Falling and Surface Acquisition

Entry depends upon fall velocity, angle, surface state, depth, obstruction, equipment and hazards.

| Entry Type | Direction |
| --- | --- |
| Step/Wade Entry | Smoothly transitions through wet and wading states. |
| Controlled Jump/Dive | Preserves intended momentum and grants a clean submergence trajectory if depth is safe. |
| Accidental Fall | Applies impact according to fall speed, water depth, wave state, armour and entry posture. |
| Breaking Surf Entry | May interrupt control briefly but must not create unavoidable repeated stun. |
| Ice Breakthrough | Creates cold shock, local obstruction and a need to locate the opening. |
| Flood Inundation | Contact may rise around the character without a discrete entry animation. |
| Vessel Fall | Uses vessel-relative exit velocity and 26D sea state; 26G supplies frame information. |

Water does not always cancel fall damage. Shallow water, rocks, ice, violent waves, extreme height and heavy equipment may remain dangerous. The player receives a depth/obstruction warning when deliberately attempting a dive into known unsafe water.

# 8. Wading, Shallows and Shore Transitions

Wading preserves ordinary land interaction where practical.

- Movement cost scales by liquid depth, viscosity, current and surface footing.
- Jump height and sprinting reduce progressively rather than disappearing at one block boundary.
- Crouch may become brace/low-profile movement in strong current.
- Shallow swimming should not activate while the player can reliably stand unless the player chooses it or conditions require it.
- Mud, kelp, ice, rubble and loose sediment may alter footing through terrain/hazard tags.
- Shore transitions prefer slopes, stairs, ladders, ropes and ledges with valid clearance.
- Auto-step/auto-climb assists may be enabled independently of combat difficulty.
- Repeated failure to exit must return a reason: too high, obstructed, current too strong, stamina exhausted or interaction reserved.

# 9. Surface Swimming

Surface swimming uses responsive horizontal steering, controlled acceleration and bounded drift.

| Input/Condition | Default Behaviour |
| --- | --- |
| Forward/Strafe | Swim relative to camera or character orientation according to selected control scheme. |
| Sprint | Faster stroke with higher stamina/exertion and wave vulnerability. |
| Crouch/Dive | Begin controlled submergence when permitted. |
| Jump/Surface | Raise body, climb eligible edge or perform a short surface push. |
| No Input | Transition toward float/tread according to buoyancy and settings. |
| Strong Current | Add authoritative drift while preserving steering unless capability is exceeded. |
| Rough Sea | Apply aggregate heave, impact and orientation influence without frame-perfect wave surfing requirements. |

Surface movement should allow the player to look around, interact with nearby objects, call for help and orient toward a visible shore or vessel. Ordinary camera direction must not accidentally force diving unless the selected control profile explicitly uses pitch-based swimming.

# 10. Floating, Treading Water and Rest

Floating and treading separate survival from constant movement input.

- Positive or neutral buoyancy permits an idle float with low stamina cost.
- Heavy/negative-buoyancy configurations require active treading or flotation equipment.
- Treading keeps the head clear while allowing slow rotation and interaction.
- Calm surface rest recovers stamina; rough seas, cold, injury, panic effects or heavy load reduce recovery.
- A player may intentionally adopt a survival float that sacrifices speed for lower exertion.
- Flotation objects, life vests, spells and companions may support unconscious characters.
- Rest does not instantly clear pressure, cold, poisoning or serious injury.

# 11. Diving and Submergence Controls

Diving must support camera-relative, character-relative and simplified control profiles.

| Control Option | Direction |
| --- | --- |
| Pitch Steering | Look up/down to steer depth while moving. |
| Dedicated Ascend/Descend | Vertical inputs independent of camera pitch. |
| Hybrid | Pitch influences direction; ascend/descend overrides. |
| Simplified Two-Layer | Surface and dive states with assisted depth control for accessibility. |
| Hold/Toggle Dive | Player choice; both are fully remappable. |
| Auto-Surface Assist | Optional assist raises the character when breath is critical or input is released. |

The player may cancel a dive unless restrained, incapacitated, under an obstruction or subject to a clearly reported force. Diving through a one-block opening requires validated character clearance rather than camera clearance only.

# 12. Underwater Locomotion and Orientation

Underwater movement uses controlled three-dimensional locomotion with momentum, drag and environment forces.

- The character accelerates toward desired movement rather than teleporting velocity.
- Turn rate, acceleration and braking depend on swim capability, equipment and status.
- Upward/downward movement is distinct from forward movement.
- Roll is presentation-only by default; gameplay orientation remains stable to reduce disorientation.
- Collision response slides along terrain and avoids trapping the player in minor voxel seams.
- Grounded underwater movement supports walking, crawling, bracing and tool use for negative-buoyancy equipment.
- Sprint becomes a burst stroke with high exertion.
- Crouch/brace may reduce current displacement when grounded or attached.
- Ladders, ropes and handholds can be used underwater.
- Tight caves may restrict turning and large equipment through explicit clearance classes.

# 13. Stamina, Exertion and Movement Efficiency

The shared stamina system remains authoritative. 26E adds an aquatic exertion rate.

| Activity | Exertion Direction |
| --- | --- |
| Floating/resting | Very low; may recover stamina in safe conditions. |
| Normal surface swim | Low to moderate. |
| Treading with heavy load | Moderate. |
| Normal underwater swim | Moderate. |
| Sprint/burst, against current or rescue tow | High. |
| Tool use, mining or combat | Action cost plus locomotion context. |
| Panic/critical breath | May increase cost only if enabled; never hidden. |
| Assisted/magical movement | Reduced physical cost but may consume mana, fuel or durability. |

Stamina exhaustion does not instantly cause drowning. It reduces speed, burst ability, climbing success and resistance to current while preserving basic movement or flotation where the character remains buoyant. Breath and stamina are connected through exertion but remain separate resources to avoid an unreadable single bar.

# 14. Breath and Air Supply

Breath represents usable air and breath-hold capability while the breath point is in a non-breathable medium.

## 14.1 Breath Capacity

Capacity can be modified by:

- Base character capability.
- Aquatic skill/perks.
- Current stamina and exertion.
- Injury, illness and status.
- Equipment seal and carried air supply.
- Potions, enchantments, spells or traits.
- Water/liquid hazard profile.
- Difficulty and accessibility settings.

## 14.2 Breath States

| State | Player Meaning | Default Consequence |
| --- | --- | --- |
| Full/Stable | Comfortable reserve. | Normal action. |
| Consuming | Underwater activity. | Visible only when useful or HUD setting requires. |
| Low | Time to surface or find air. | Clear visual, audio and haptic cue. |
| Critical | Immediate danger. | Strong redundant warning; optional auto-surface assist. |
| Empty | No usable air. | Drowning injury begins; not instant death. |
| Supplied | Equipment, shared air or breathable pocket replenishes reserve. | Recovery rate depends on source and exertion. |

Breath consumption uses stable tick/rate logic and does not depend on rendered frame rate. Pausing in solo pauses the simulation according to world rules.

## 14.3 Air Sources

- Open atmosphere above the liquid surface.
- Valid air pockets and sealed breathable spaces from 26B.
- Diving equipment tanks, reservoirs or magical air stores.
- Shared-air or rescue devices.
- Breathing spells, potions, enchantments or species traits.
- Vehicle or structure life-support interfaces in later documents.

An air source must report capacity, flow, ownership, contamination, pressure compatibility and failure state. A visual bubble with no authoritative source does not restore breath.

# 15. Drowning, Incapacitation and Recovery

Drowning is staged and readable.

| Stage | Direction |
| --- | --- |
| Warning | Breath low/critical; full control remains. |
| Drowning Injury | Breath empty; periodic damage/status begins and actions may weaken. |
| Incapacitation | Character loses ordinary control but may remain recoverable for a rescue window. |
| Rescue/Resuscitation | Ally, NPC, flotation, magic or safe air can stabilise according to rules. |
| Death | Occurs after rescue window or catastrophic damage according to world settings. |

Default rules should permit rescue without making drowning trivial:

- Incapacitated characters drift according to buoyancy/current and may be grabbed or towed.
- Recovery requires breathable access and an approved assist/action, not merely touching the surface for one frame.
- Recovered characters may retain exhaustion, cold, injury or reduced stamina.
- Solo worlds may offer a configurable self-rescue grace, automatic shore recovery or immediate death setting.
- Peaceful/accessibility settings may disable drowning damage, provide unlimited breath or teleport an incapacitated player to the nearest safe point with transparent consequences.
- Harsh settings may shorten warnings and rescue windows but may not remove all readable cues.

# 16. Depth, Pressure and Rapid-Ascent Rules

Pressure uses authored depth bands linked to 26C and liquid/pressure classes from 26B.

| Capability Band | Typical Environment | Required Response |
| --- | --- | --- |
| Surface/Shallow | Shores, rivers, reefs, upper caves. | No specialist pressure protection. |
| Recreational/Moderate | Shelf depths and ordinary wrecks. | Basic diving capability and breath planning. |
| Deep | Slopes, deep ruins and advanced resources. | Pressure-rated equipment, magic, vehicle or adapted capability. |
| Abyssal | Dark, cold, high-pressure regions. | Advanced expedition infrastructure and support. |
| Hadal/Extraordinary | Trenches, rifts, magical or dimensional extremes. | Endgame specialist solution; not baseline progression. |

Pressure effects may include warning, stamina/breath inefficiency, equipment stress, injury and hard capability denial where entering would be nonsensical. The denial must be visible before commitment when the player has relevant knowledge.

Exact real-world decompression tables are out of scope. A configurable advanced rule may track accumulated deep exposure and rapid-ascent stress using broad bands. It must be simple, clearly displayed and disabled by default unless testing proves it improves play.

# 17. Temperature, Exposure and Thermal Protection

The shared temperature system consumes 26D water temperature, wind/spray and ice state.

- Water generally changes body temperature faster than air.
- Cold shock may briefly increase exertion or disrupt control, with accessibility reduction options.
- Long exposure causes progressive cold status, reduced stamina recovery and injury according to difficulty.
- Hot, volcanic, alchemical or magical liquids use their own hazard profiles.
- Wetness may affect the player after leaving water until warmed, dried or protected.
- Clothing, armour liners, wetsuit-like equipment, magic, potions, shelters and heat sources provide mitigation.
- Fire/heat magic underwater follows 09 and liquid reaction rules rather than granting free universal warmth.
- Temperature warnings use icons/text and not colour alone.

# 18. Visibility, Light and Perception

Visibility is composed from the 26D environment snapshot plus local disturbance and player capability.

| Input | Effect |
| --- | --- |
| Water clarity/turbidity | Baseline sight range and colour attenuation. |
| Depth/light band | Ambient light and direction cues. |
| Weather/surface | Surface brightness, storm darkness and entry visibility. |
| Sediment/disturbance | Temporary local cloud from movement, mining, collapse or combat. |
| Biological/magical state | Bioluminescence, blooms, corruption, mana haze or concealment. |
| Equipment/magic | Lamps, sonar-like pings, survey tools, night/depth vision, guiding lines. |
| Accessibility | Contrast, outline, marker and reduced-distortion options. |

The gameplay detection service uses visibility classes and occlusion queries. Post-processing alone never decides whether an actor is visible. Critical exits, allies, ropes and surface direction can receive optional accessibility outlines without revealing unexplored content by default.

# 19. Currents, Waves, Surf, Undertow and Turbulence

26E converts 26D environment forces into character-relative effects.

| Environment State | Character Effect |
| --- | --- |
| Gentle current | Drift and route efficiency. |
| Strong current | Increased steering demand, exertion and possible route denial. |
| Rip/undertow | Directed pull with visible cues and escape guidance. |
| Breaking surf | Periodic impact, tumbling risk and difficult shore transition. |
| Turbulence | Reduced control precision and interaction stability. |
| Standing wave/rapid | Strong directional hazard in rivers, channels or floodwater. |
| Rough sea | Surface heave, splash, temporary submergence and rescue difficulty. |

Environmental forces are clamped and integrated through the movement controller. Ordinary swimming preserves agency. When force exceeds capability, the player receives a clear state such as "current overpowering" rather than silently losing input.

Escape is directional and learnable. For example, a rip current may be escaped by moving across the flow or reaching a sheltered region; the exact guidance can be discovered through tutorial, NPC teaching, codex or accessibility hints.

# 20. Storms, Ice, Lightning and Extraordinary Hazards

- Storms use 26D warnings, sea state, visibility, temperature, current and lightning flags.
- Surface swimmers are more exposed to waves, debris, lightning and separation from rescue.
- Lightning targeting and damage are owned by environment/combat rules; 26E applies swimmer exposure and warning.
- Sea ice may block surfacing, create narrow openings, move with current and cause crushing/cold hazards.
- Ice-breaking tools, ropes, markers and companions support rescue.
- Waterspouts, rogue waves and magical storms may apply event-specific forces only through sourced environment snapshots.
- Extraordinary hazards require source, warning, counterplay and owner; "magic" is never an excuse for untelegraphed instant death.
- Reduced-effects presentation may lower screen motion and particles without reducing authoritative force unless the player changes gameplay difficulty separately.

# 21. Buoyancy, Equipment Load and Heavy Objects

Character buoyancy is a gameplay profile, not a full rigid-body volume simulation.

| Buoyancy Class | Direction |
| --- | --- |
| Strong Positive | Naturally rises/floats; easy rest, harder rapid descent. |
| Positive | Default lightly equipped swimmer. |
| Neutral | Holds depth with low effort. |
| Negative | Sinks without upward input; useful for grounded work with risk. |
| Anchored | Attached to terrain, structure, rope or heavy equipment. |

Equipment contributes through tagged load classes and buoyancy modifiers. The slot inventory remains intact. Ordinary collected stacks do not each calculate hidden mass. Explicitly heavy objects, armour sets, ballast, cargo bundles, carried NPCs and quest items may alter the profile.

Dropping or transferring a heavy object may immediately change buoyancy. The UI must preview major equipment effects before the player enters water where knowledge permits.

# 22. Aquatic Equipment Categories

| Category | Examples | Primary Function |
| --- | --- | --- |
| Flotation | Life vest, float, ring, buoyancy charm. | Surface survival, rescue and rest. |
| Breathing | Reed, mask, air bladder, tank, rune lung, magical reservoir. | Extend or replace breath supply. |
| Vision/Light | Goggles, lamp, crystal light, survey lens. | Visibility, navigation and inspection. |
| Thermal | Insulated clothing, dry layer, warming charm. | Cold/hot liquid protection. |
| Pressure | Reinforced suit, pressure ward, enchanted shell. | Depth capability. |
| Mobility | Fins, webbed gloves, propulsion pack, current charm. | Speed, control and efficiency. |
| Ballast/Anchoring | Weight belt, boots, line anchor, magnetic/rune grip. | Grounded work and current resistance. |
| Work Tools | Underwater pick, cutter, scraper, wrench, sealing kit. | Mining, salvage, repair and building. |
| Rescue | Rope, harness, float line, shared-air device, flare/beacon. | Locate, secure and recover characters. |
| Combat | Spear, trident, harpoon, net cutter, specialised shield. | Medium-appropriate combat. |
| Communication | Bell, line signal, light code, speaking charm, relay device. | Team coordination and distress. |

Equipment may combine categories, but definitions should remain modular so cultures, materials and magic styles can produce variants without duplicating behaviour.

# 23. Diving Equipment and Capability Progression

A suggested capability progression is functional rather than strictly linear.

| Band | Typical Capability | Example Access |
| --- | --- | --- |
| Improvised | Brief breath-hold, simple light, rope and flotation. | Rivers, shallows, near-shore resources. |
| Basic Diver | Mask/light, improved movement, small air reserve. | Reefs, shallow caves, ordinary wreck exteriors. |
| Equipped Diver | Reliable air, thermal protection, tools and rescue kit. | Shelf ruins, flooded mines, longer projects. |
| Deep Expedition | Pressure protection, strong light, communications and support. | Slopes, deep dungeons, rare resources. |
| Magitech/Advanced | Powered movement, rune life support, remote supply and specialised tools. | Abyssal operations, underwater infrastructure. |
| Extraordinary | Dimensional, living, cultural or legendary solutions. | Hadal, transformed or boss-controlled zones. |

Players may reach capability through crafting, culture, NPC teaching, research, trade, magic, quests, captured technology or cooperation. No single mandatory path should own all diving progression.

# 24. Magic, Potions, Enchantments and Ritual Support

Magic may provide:

- Temporary water breathing or air generation.
- Pressure warding.
- Thermal protection.
- Current resistance or controlled propulsion.
- Underwater light and perception.
- Dry work bubbles or temporary breathable shelters.
- Rescue beacons, tethering or teleport-to-safety effects with costs.
- Purification or hazard resistance.
- Tool enchantments and underwater casting stability.

Boundaries:

- Magic System owns spell, rune, potion, enchantment, mana, risk and school identity.
- 26B validates liquid displacement, air pocket and fluid reactions.
- 26D owns weather/current truth.
- 26E applies character capability and action response.
- Non-mage characters retain viable equipment, NPC, infrastructure and teamwork solutions.
- Forbidden or unstable methods require visible risk and social consequence.

# 25. Ancestry, Culture, Training and Adaptation

Aquatic capability may derive from several independent sources.

| Source | Allowed Influence |
| --- | --- |
| Ancestry/Lineage | Breathing medium, natural buoyancy, pressure tolerance, movement form or sensory capability. |
| Culture | Techniques, equipment traditions, rescue practices, navigation knowledge, architecture and laws. |
| Training/Skill | Efficiency, breath control, tool use, rescue and combat. |
| Equipment | External capability available to any compatible user. |
| Magic/Status | Temporary or persistent modifiers with explicit source. |
| Individual Trait | Fear, confidence, injury, talent or preference without universal cultural assumption. |

Locked protections:

- No ancestry is automatically a sailor, pirate, diver, trader or enemy.
- Aquatic ancestry does not imply one culture or faction.
- Land-adapted characters must have practical mitigation paths.
- Aquatic characters may have contextual limitations on land only if equally mitigable and meaningfully designed.
- Player character choices must not create an undisclosed permanent meta disadvantage.
- Culture influences institutions and available knowledge, not every individual's personality.

# 26. Underwater Tools, Mining and Harvesting

Underwater work uses ordinary action definitions plus medium compatibility.

| Action | Aquatic Rules |
| --- | --- |
| Mining | Tool swing profile, bracing, visibility, stamina and drop behaviour matter. |
| Cutting/Harvesting | Vegetation, nets, rope, coral-like resources and organic growth use tagged tools. |
| Salvage | Wreck ownership, stability, containers, hazards and tool access apply. |
| Repair | Sealing, replacement, fastening and pump support use recipes/resources. |
| Survey | Measures depth, material, structure, pressure, current, magic or route confidence. |
| Excavation | Sediment clouds, collapse and local fluid updates are bounded. |

Tools may have `aquatic_efficiency`, `requires_brace`, `sealed`, `corrosion_resistance` and `pressure_rating` facets. A normal tool can function poorly underwater rather than being universally disabled. Specialised tools improve speed, safety and durability.

Drops use item buoyancy classes where meaningful: float, neutral, sink, attach to source, enter container or convert to a recoverable pickup. Performance rules prevent hundreds of independent physics pickups from accumulating.

# 27. Underwater Building and Block Placement

The player may build underwater subject to ordinary ownership, reach, collision, recipe and support rules plus fluid displacement from 26B.

- Placement previews show final block orientation, fluid displacement, seal result and obstruction.
- The block is not free of water merely because it was placed; 26B resolves displacement and remaining waterlogging.
- Doors, hatches and valves expose seal and pressure-direction information where known.
- Strong current, turbulence or lack of bracing may slow or destabilise placement rather than make it impossible.
- Temporary construction frames, anchors and guide lines support larger projects.
- Blueprint and NPC construction may operate underwater through project capability requirements.
- Removing a block may create a breach and immediate local flood request.
- Players receive an explicit warning before opening a high-head boundary when inspection knowledge exists.
- Build assists may stabilise the camera/character without changing ownership or material cost.

# 28. Air Pockets, Shelters, Doors, Pumps and Flood Boundaries

A breathable space is authoritative only when 26B reports a valid air region or life-support source.

| Feature | Direction |
| --- | --- |
| Natural Air Pocket | Generated cave/structure air volume with stability and contamination state. |
| Player Shelter | Sealed blocks and doors create a validated air region after water is displaced/removed. |
| Moon Pool/Open Bottom | May retain air only when geometry, pressure class and system rules permit. |
| Airlock | Controlled doors, chamber, pump and pressure sequence. |
| Emergency Bubble | Temporary magic/device source with finite duration/capacity. |
| Pumped Chamber | Water removed through 26B/Automation transactions; leaks and power loss remain meaningful. |
| Flooded Compartment | Breath and movement respond to actual local liquid/air state. |

The player may inspect leak paths, air quality, remaining supply and pump state through tools/UI. Exact gas chemistry is deferred; breathable, stale, contaminated, toxic and magical air classes are sufficient.

# 29. Underwater Stations, Automation and Infrastructure

Underwater infrastructure can include pumps, filters, air systems, lights, power, storage, harvesters, research stations, docks and future vessel/submersible support.

- Automation owns machines, power, throughput and network routing.
- 26B owns liquid transfer and containment.
- 26E defines player access, interaction, breathing, movement and emergency use.
- Stations require pressure/seal ratings appropriate to their environment.
- Wet-compatible interfaces use protected controls, remote links or interior access.
- Failure states expose readable consequences: power loss, leak, air depletion, contamination, blocked hatch or pressure warning.
- NPC jobs may maintain underwater infrastructure only when their capability, schedule, equipment and rescue support are valid.
- Distant simulation uses project and network summaries; it does not path every diver through unloaded rooms.

# 30. Interaction, Loot, Containers and Carrying

Underwater interaction uses the shared interaction system with aquatic context.

- Interaction reach may be shortened by visibility, turbulence or bulky equipment.
- Opening a container may require bracing, a hand free, a key/tool and sufficient time.
- Loose inventory UI does not pause multiplayer; breath and danger remain visible.
- Quick-loot and accessibility options reduce menu exposure.
- Carrying a large object or NPC changes movement, action availability and buoyancy through explicit load class.
- Ownership, theft, salvage rights and faction law remain active underwater.
- Quest items cannot silently disappear because they sink into inaccessible terrain; definitions require a recovery/fallback rule.
- Important interactables provide non-colour cues and optional outlines based on player knowledge.

# 31. Underwater Combat Foundation

Underwater combat extends the shared combat action, damage, stamina, status, AI and authority systems.

> **Combat Continuity Rule**
>
> The player keeps the same conceptual controls - attack, defend, dodge/move, use item, cast and interact - while action definitions resolve medium compatibility and modifiers.

Combat context includes:

- Immersion and movement state.
- Buoyancy/grounding.
- Current/turbulence.
- Visibility and sound.
- Equipment and weapon compatibility.
- Breath and exertion.
- Pressure/temperature hazards.
- Creature movement capability.

Actions report clear reasons for failure or reduced effectiveness. The system must not allow a familiar weapon to become inexplicably useless without preview or feedback.

# 32. Melee, Blocking, Dodging and Stability Underwater

| Action Family | Direction |
| --- | --- |
| Thrusting Weapons | Generally efficient and controllable. |
| Wide Swings | Reduced speed/reach/force unless weapon or capability is adapted. |
| Heavy Blunt Weapons | Strong when grounded/braced; difficult while freely swimming. |
| Knives/Short Tools | Effective in tight spaces, nets and grapples. |
| Shields | Provide block coverage but increase drag; may act as current brace. |
| Dodge | Becomes directional burst, roll-free evade or push-off depending state. |
| Parry | Remains possible for suitable weapons and telegraphed attacks. |
| Grapple | May attach, entangle, tow or destabilise; requires clear escape rules. |
| Grounded Stance | Improves stability with ballast, boots, handhold or terrain. |

Melee damage remains owned by shared combat definitions. The medium modifies animation time, stamina, stability, hit path and knockback through data rather than bespoke hardcoded exceptions.

# 33. Ranged Weapons, Projectiles and Specialised Arms

Projectiles query medium transition and drag profiles.

- Ordinary arrows and bolts lose speed/range according to definition and entry angle.
- Firearms, if ever approved, require explicit underwater compatibility rather than assumptions.
- Harpoons, spears, bolts, nets and magical projectiles may be designed for water.
- Throwing from air into water and firing from water into air are distinct transitions.
- Projectile simulation must be bounded and server-authoritative for hits.
- Trajectory previews may appear only with suitable skill/equipment/settings.
- Ammunition remains recoverable or expendable according to ordinary item rules.
- Tethers and lines use simplified constraints and maximum-segment budgets, not full rope physics everywhere.

# 34. Combat Magic and Environmental Reactions

Magic interactions remain authored and bounded.

| Example | Direction |
| --- | --- |
| Fire/Heat | May weaken, boil locally, create steam/effects or remain contained by magical definition. 26B owns fluid reaction. |
| Lightning | May gain area/conduction behaviour only through approved combat/liquid rules with clear ally risk. |
| Water/Ice | May propel, shield, freeze, shape or manipulate local state through explicit costs and limits. |
| Earth/Metal | May create anchors, barriers or projectiles subject to placement/collision. |
| Air | May create breath supply, bubble, propulsion or pressure interaction through explicit source. |
| Light/Shadow | Affects visibility, concealment and guidance through gameplay detection fields. |
| Space/Portal | Emergency extraction or transfer requires destination, authority and anti-exploit rules. |
| Forbidden/Corrupted | May bypass normal limits with instability, contamination or social consequences. |

No spell should infer all possible chemistry. Each interaction declares outputs, limits, ownership and failure modes.

# 35. Injuries, Status Effects and Medical Recovery

Aquatic states may apply shared status effects such as:

- Drowning injury.
- Exhaustion.
- Cold exposure/hypothermia-like fantasy status.
- Heat or toxic-liquid injury.
- Pressure stress.
- Ear/sense disruption where approved.
- Entanglement.
- Panic/fear only as an optional status with accessibility controls.
- Wetness and corrosion exposure.
- Contamination, poison or magical taint.

Recovery uses existing food, medicine, rest, healer, spell and shelter systems. The document does not create real-world medical treatment guidance. Status descriptions must remain fictional/gameplay-facing and clearly communicate duration, counter and severity.

# 36. Stealth, Sound, Detection and Communication

Underwater stealth uses visibility, movement disturbance, sound class, current and creature senses.

- Fast movement, mining and combat may create detectable disturbance.
- Stillness, terrain, vegetation, darkness and current direction may conceal.
- Creatures may sense vibration, scent/chemistry, magic or pressure rather than sight alone.
- Player communication may be limited by equipment/capability, but party usability must remain practical.
- Text chat, pings and accessibility communication are never removed by fiction.
- Hand signals, light codes, rope signals, bells, speaking charms and communication devices may provide world-facing options.
- Detection results use the shared stealth/AI system and do not depend solely on audio volume.

# 37. Creatures, Companions, Mounts and Taming Interfaces

Actors expose aquatic capability fields:

- breathing medium and breath capacity.
- surface/underwater locomotion profile.
- preferred depth and habitat.
- pressure/temperature tolerance.
- current/wave tolerance.
- buoyancy and incapacitation behaviour.
- rescue, towing, carrying or mount capability.
- equipment compatibility.
- fear, training and command rules.

26M owns the marine roster and ecology. 26E defines how a companion follows, waits, surfaces, refuses unsafe depth, rescues, becomes endangered or uses equipment. A land companion must not repeatedly drown because of ordinary pathfinding; it should avoid, request assistance, use a route or remain safely behind according to command and capability.

# 38. NPC Swimming, Diving, Work and Rescue Behaviour

NPCs use capability-aware goals rather than universal swimming competence.

| NPC Role | Expected Behaviour |
| --- | --- |
| Ordinary Civilian | Avoid hazardous water, use safe crossings/flotation, call for help. |
| Sailor | Surface competence, man-overboard response, ladders and basic rescue. |
| Diver | Equipment checks, depth limits, task planning, air and return reserve. |
| Rescue Worker | Locate, secure, tow and transfer casualties. |
| Builder/Engineer | Work in supported underwater projects with tools, air and evacuation route. |
| Guard/Marine | Water pursuit and combat only within training/equipment capability. |
| Mage/Healer | Use approved rescue, breath, light, ward or recovery actions. |
| Child/Dependent | Strong avoidance and emergency priority according to world settings. |

AI planning considers weather warning, tide, depth, equipment, task duration, buddy support, air reserve, route and shelter. Distant simulation resolves jobs and incidents through summaries, not detailed strokes.

# 39. Man Overboard, Vessel-Side Interaction and Boarding

26E defines the swimmer side of vessel interaction; 26F-26G define vessel structure and motion.

- Falling from a vessel creates a persistent man-overboard event when relevant.
- The swimmer may track vessel direction, lights, rope, ladder and rescue markers based on visibility/knowledge.
- Vessel-relative ladders, nets, steps, low rails, hatches and rescue points expose interaction sockets.
- Climbing success considers relative motion, sea state, current, stamina, injury and assistance.
- Grabbing a fast vessel has force/safety limits and cannot teleport the player aboard.
- A crew may slow, turn, deploy flotation, throw a line, launch a boat or use magic according to AI/orders.
- Reboarding a vessel transfers the character to the vessel-local movement frame through a validated handoff.
- Players cannot exploit boarding to bypass ownership, locked hulls or combat permissions.

# 40. Rescue, Towing, Flotation and Emergency Response

Rescue actions include locate, reach, secure, stabilise, tow, transfer and recover.

| Rescue Tool/Action | Direction |
| --- | --- |
| Grab/Assist | Short-range link; limited by hands, stamina and target state. |
| Tow | Reduced speed and increased exertion; target buoyancy matters. |
| Rope/Line | Extends reach, allows shore/vessel pull and location marking. |
| Flotation | Keeps target at surface and slows breath danger. |
| Shared Air | Transfers finite supply through compatible equipment/action. |
| Rescue Magic | Explicit range, cost, target and failure rules. |
| Beacon/Marker | Improves location for players/NPCs without guaranteed recovery. |
| Shore/Vessel Transfer | Requires valid exit, clearance and receiving space. |

Rescue remains cooperative but not griefable. Consent/party/authority rules govern grabbing conscious players. Emergency override may permit rescue of incapacitated allies while preventing arbitrary forced movement of opponents outside combat rules.

# 41. Death, Item Recovery and Persistent Aftermath

The shared death system remains authoritative.

- Water deaths create a recoverable location record tied to stable Water Body/structure/vessel context.
- Tombstone, dropped inventory or recovery container behaviour is a world setting.
- Recovery objects may float, sink to valid ground, attach to a wreck or relocate to a nearby safe retrieval point according to definition.
- Critical quest/state items require fallback recovery.
- The map/journal records last known position, current/tide drift estimate or rescue report according to knowledge.
- NPC deaths can create search, recovery, mourning, investigation, salvage or legal events.
- Wrecks, lost equipment and rescue failures may become persistent world evidence.
- Reloading must not place the recovery object inside invalid solid terrain or an unreachable regenerated location.

# 42. Skills, Perks, Knowledge and Progression

Aquatic progression should connect to existing skill and perk architecture. Candidate paths include swimming, diving, survival, exploration, athletics, engineering, rescue, combat, magic, navigation and leadership rather than one mandatory "water level."

Possible rewards:

- Reduced swimming exertion.
- Faster surface/underwater movement within caps.
- Better breath efficiency.
- Improved current resistance and exit success.
- Better tool efficiency and bracing.
- Pressure/temperature knowledge and equipment use.
- Rescue speed, towing and shared-air efficiency.
- Improved underwater combat actions.
- Better survey information and route confidence.
- NPC crew/diver coordination.

Knowledge may come from practice, NPC training, books, culture, ruins, research, equipment manuals, quests and experimentation. Level alone should not grant deep-water survival without physical capability.

# 43. Quests, Events, Tutorials and Discovery

Aquatic content may generate:

- Rescue and missing-person events.
- Flooded mine or structure emergencies.
- Wreck survey, salvage and ownership disputes.
- Underwater construction and repair contracts.
- Diving research and resource expeditions.
- Creature attacks, entanglement or trapped-companion events.
- Storm evacuation and man-overboard incidents.
- Air-supply, pump or shelter failures.
- Hidden cave, ruin, route and cultural discovery.
- Competitive/cooperative diving objectives.

Tutorials are optional and contextual. Early guidance should teach surface recovery, breath warnings, exit controls and current cues before requiring complex equipment. A player can learn through UI hints, NPCs, codex, practice spaces, signs or accessibility guidance.

# 44. HUD, Inspection, Maps and Player Feedback

Aquatic UI extends the shared HUD.

| Information | Display Direction |
| --- | --- |
| Breath | Contextual bar/ring/text with low and critical thresholds. |
| Depth/Pressure | Band, trend and capability margin rather than false precision by default. |
| Surface Direction | Optional indicator when submerged, disoriented or critical. |
| Stamina/Exertion | Shared stamina plus aquatic cost feedback. |
| Temperature | Shared status and trend. |
| Current/Wave | Direction, strength class and warning when materially relevant. |
| Air Supply | Remaining capacity, source, flow and failure. |
| Equipment Capability | Pressure, thermal, buoyancy and seal status. |
| Rescue | Ally status, tether, distance, line tension and transfer target. |
| Interaction | Seal/breach warning, brace requirement, tool mismatch and time exposure. |

Inspection may show exact numbers for advanced players through settings/tools. Default UI emphasises readable classes. The UI consumes authoritative view models and never estimates critical breath independently.

# 45. Controls, Camera, Comfort and Accessibility

## 45.1 Input Requirements

- Full remapping for ascend, descend, surface, dive, sprint, brace, grab, interact and rescue.
- Hold/toggle alternatives.
- Separate camera and movement sensitivity underwater.
- Keyboard/mouse and controller parity.
- Input buffering for surface, climb and rescue actions.
- Clear conflict resolution with crouch, jump, fly, mount and vessel controls.
- Touch/specialised-device support through data-driven actions when implemented.

## 45.2 Camera and Comfort

- Reduced or disabled camera roll.
- Adjustable head bob, wave heave, screen droplets, distortion, chromatic effects and blur.
- Stable horizon option at surface.
- Surface lock/assist option.
- Third-person camera collision that does not reveal through terrain.
- First-person body/hand feedback without blocking visibility.
- FOV and motion options retained underwater.

## 45.3 Accessibility Assists

| Assist | Effect |
| --- | --- |
| Auto-Surface | Raises character when breath is critical or input released. |
| Simplified Depth Controls | Dedicated ascend/descend with reduced pitch dependence. |
| Extended/Unlimited Breath | Changes danger while preserving content access. |
| Drowning Rescue | Automatic flotation, longer rescue window or safe relocation. |
| Current Assistance | Reduces player force response independently of visual current. |
| Exit Assistance | Enlarges valid climb tolerance and highlights exits. |
| High-Contrast Aquatic Cues | Surface, ropes, allies, hazards and interactables use shape/outline/text. |
| Reduced Distortion/Particles | Preserves information with calmer presentation. |
| Warning Redundancy | Text, icon, sound, haptic and optional spoken cue. |
| One-Hand/Low-Input Profile | Reduces simultaneous vertical/horizontal input demand. |

Accessibility settings do not reduce XP or progression rewards by default.

# 46. Difficulty, World Settings and Assist Options

| Setting | Example Range |
| --- | --- |
| Breath Severity | Unlimited, forgiving, standard, harsh. |
| Drowning Damage | Off, slow, standard, severe. |
| Rescue Window | Long, standard, short, none after incapacitation. |
| Pressure | Off, capability gate only, standard damage, harsh. |
| Temperature | Atmospheric, moderate, survival, severe. |
| Current Force on Characters | Reduced, standard, strong. |
| Wave Impact | Cosmetic, light, standard, severe. |
| Underwater Visibility | Accessibility minimum, standard environment, harsh realism. |
| Equipment Burden | Simplified, tagged-heavy only, detailed classes. |
| Rapid-Ascent Stress | Off by default, simplified advanced, harsh. |
| NPC Water Risk | Protected, forgiving, standard, permanent consequence. |
| Item Recovery | Safe marker, floating container, physical drop, harsh drift/sink. |
| Tutorial/Guidance | Full, contextual, minimal, off. |

Presets combine settings but never hide individual controls.

# 47. Multiplayer, Split-Screen and Authority

- The authoritative host/server owns locomotion state transitions, breath, drowning, rescue links, damage, inventory and consequential interactions.
- Clients predict ordinary swimming for responsiveness and reconcile against authoritative snapshots.
- Current/wave forces use shared deterministic samples or replicated resolved values.
- Rescue actions validate distance, consent/relationship, target state, obstruction and ownership.
- Split-screen players receive independent camera-comfort and HUD settings.
- Pausing behaviour follows world/server rules; opening inventory does not protect a player in active multiplayer.
- Reconnection restores water/vessel frame, breath, air supply, rescue link and relevant environment snapshot safely.
- Anti-cheat validation rejects impossible depth changes, breath resets, underwater action speeds and unauthorised block changes.
- Network degradation should preserve movement and warning readability before presentation fidelity.

# 48. Persistence, Simulation LOD and Performance

Most aquatic character state is transient and reconstructible. Persist only what matters.

| State | Persistence Direction |
| --- | --- |
| Current locomotion | Save for active/reconnect safety; reconstruct carefully on load. |
| Breath/exertion | Save when character is active in water or danger. |
| Equipment air supply | Persistent item/runtime state. |
| Pressure/temperature/status | Persist if duration/consequence survives unload. |
| Rescue/tether link | Persist only when both endpoints and context are stable; otherwise resolve safely. |
| NPC dive task | Persist project/task summary, equipment and return reserve. |
| Loose bubbles/splashes | Presentation only; never save. |
| Recovery marker | Persistent until resolved/expired by rules. |

LOD direction:

- Nearby player characters always receive full authoritative aquatic simulation.
- Nearby important NPCs use detailed movement and survival.
- Medium-distance NPC divers use route/task segments and resource checks.
- Distant activity uses expedition/project summaries and incident probabilities.
- Unloaded water does not simulate individual strokes, bubbles or pickups.
- Performance budgets limit local disturbance volumes, tethers, loose items, active lights and high-frequency environment queries.

# 49. Godot/Summer Engine Technical Boundaries

The production design should map to data-oriented Godot services rather than a scene-node-per-effect architecture.

## 49.1 Recommended Responsibilities

| Service/Component | Responsibility |
| --- | --- |
| AquaticMovementController | CharacterBody-compatible movement, state transitions, acceleration, forces and collision. |
| AquaticEnvironmentSampler | Bounded queries to 26B-26D with cached snapshot and threshold events. |
| BreathAndExposureService | Breath, air source, temperature, pressure and drowning state. |
| AquaticActionResolver | Validates work, build, interaction, rescue and combat contexts. |
| RescueConstraintService | Simplified grab, tow, rope and flotation links. |
| AquaticCapabilityResolver | Merges character, equipment, trait, skill, magic and status facets. |
| AquaticAIAdapter | Capability-aware navigation/task requests for NPCs/companions. |
| AquaticViewModel | Player-specific HUD and inspection data. |
| AquaticPresentationAdapter | Animation, audio, VFX, shaders and camera parameters. |

## 49.2 Technical Rules

- Use CharacterBody-style controlled movement for players rather than default free rigid-body simulation.
- Query a small number of body sample points; do not scan whole surrounding chunks each frame.
- Cache Water Body, liquid definition and environment snapshot until invalidated or threshold crossed.
- Keep gameplay state in engine-independent data records where practical.
- Use signals/events for state transitions and warnings, not broad global polling.
- Avoid one physics object per bubble, loose item, rope segment or wave crest.
- Use pooled presentation effects.
- Keep movement/collision authoritative and deterministic enough for network reconciliation.
- Profile packaged builds with representative waves, current, structures, multiple players and NPC rescue.
- Maintain automated save/reload tests for submerged, vessel-side and flooded-structure states.

# 50. Animation, Audio, VFX and Presentation Forge Handoff

Presentation communicates but does not own gameplay.

| Presentation Domain | Required Inputs |
| --- | --- |
| Character Animation | Locomotion state, desired velocity, effort, buoyancy, grounded/attached state, action and injury. |
| Camera | Surface relation, sea state, movement, comfort settings and collision. |
| Water Shader | Water Body/material, depth, weather, visibility and local disturbance. |
| Particles/VFX | Entry, stroke, bubbles, sediment, impact, breath warning, magic and hazard events. |
| Audio | Immersion, surface proximity, movement effort, current, structure, warning and creature events. |
| UI | Authoritative breath, depth band, environment, capability and rescue state. |

The Forge/Presentation Forge may author animation sets, sockets, event markers, equipment attachment points, rescue grips, light positions, bubbles, audio and VFX profiles. Generated presentation assets remain replaceable products attached to semantic definitions. Missing VFX must not remove warning information.

# 51. Data Records, Registry Facets and Reason Codes

## 51.1 Aquatic Capability Facet

| Field Group | Required Fields |
| --- | --- |
| Identity | capability_facet_id, owner definition ID, version and source. |
| Locomotion | surface speed class, underwater speed class, acceleration, turn, vertical control and brace. |
| Survival | breath capacity/rate, air compatibility, temperature and pressure tolerance. |
| Buoyancy | base class, equipment modifiers, unconscious behaviour and ballast rules. |
| Action | tool, build, combat, rescue and communication permissions/modifiers. |
| Environment | current, wave, turbulence, ice, contamination and magical-hazard tolerance. |
| Accessibility | compatible assists and required warnings. |

## 51.2 Aquatic Runtime Record

| Field Group | Required Fields |
| --- | --- |
| Context | actor ID, Water Body/liquid ID, structure/vessel frame ID and timestamp. |
| Contact | sample states, immersion, surface relation, depth and air region. |
| Movement | locomotion state, velocity, desired movement, external force and attachment. |
| Survival | breath, air source, exertion, temperature, pressure and drowning stage. |
| Capability | resolved facet hash and active equipment/status sources. |
| Interaction | current action, target, brace, rescue/tether and interruption. |
| Persistence | dirty reason, reconnect data and safe-fallback reference. |

## 51.3 Standard Reason Codes

Actions return stable codes such as:

- AQUA-NO-CONTACT
- AQUA-NO-CLEARANCE
- AQUA-NO-BREATHABLE-AIR
- AQUA-AIR-SOURCE-EMPTY
- AQUA-PRESSURE-RATING-LOW
- AQUA-CURRENT-OVERPOWERING
- AQUA-NOT-BRACED
- AQUA-EXIT-TOO-HIGH
- AQUA-EXIT-OBSTRUCTED
- AQUA-TOO-EXHAUSTED
- AQUA-LOAD-TOO-HEAVY
- AQUA-TOOL-NOT-SEALED
- AQUA-PLACEMENT-CREATES-BREACH
- AQUA-RESCUE-TARGET-INVALID
- AQUA-RESCUE-NO-CONSENT
- AQUA-ROPE-OCCLUDED
- AQUA-VESSEL-HANDOFF-UNAVAILABLE

Each code has a localisable explanation and optional suggested response.

# 52. Production Classification and Set 25 Integration

Document 26E supplies candidate packages rather than assuming all features ship together.

| Package | Candidate Classification | Notes |
| --- | --- | --- |
| Basic Water Contact, Wading and Surface Swim | Foundation/Core Candidate | Required for a navigable world. |
| Breath, Drowning and Surface Recovery | Foundation/Core Candidate | Severity configurable. |
| Basic Diving and Underwater Interaction | Core Candidate | Needed for marine exploration. |
| Underwater Building/Mining | Core/Expansion Candidate | Strongly aligned with voxel identity; prototype required. |
| Current/Wave Character Response | Foundation/Expansion Candidate | Requires 26D and movement prototypes. |
| Basic Rescue and Vessel Ladder Interaction | Core Candidate | Essential before crewed vessels. |
| Advanced Pressure and Deep Expedition | Expansion | Depends on content, equipment and 26M. |
| Complex Airlocks/Underwater Bases | Expansion | Depends on 26B, Automation and structures. |
| Advanced Underwater Combat | Expansion | Depends on 16, 26M and content budget. |
| Rapid-Ascent Stress | Experimental/Optional | Off by default pending evidence. |
| Full Rope/Shared-Air Simulation | Expansion/Experimental | Use simplified constraints first. |
| Extraordinary Magical Aquatic Traits | Atlas/Expansion | Requires authored sources and validation. |

Set 25 integration requires:

- Qualified IDs and approved facets from 25B.
- Dependency and source-owner records.
- Content classification, maturity and evidence fields.
- Registry completeness checks for every playable character/equipment/liquid combination.
- Migration rules when breath, pressure or equipment schemas change.
- Validation that no required first-release path depends on unclassified Set 26 content.

# 53. Prototype Laboratories and Acceptance Evidence

| Laboratory | Evidence Required |
| --- | --- |
| Shore Transition Lab | Reliable wade/swim/exit across slopes, blocks, stairs, ladders, waves and network latency. |
| Surface Swim Lab | Responsive control, floating, stamina and current across input devices. |
| Dive Control Lab | First/third person comfort, vertical controls, collision and tight-space recovery. |
| Breath/Drowning Lab | Clear warnings, frame-rate independence, rescue and accessibility variants. |
| Current/Surf Lab | Bounded forces, escape readability and no repeated stun loops. |
| Pressure/Temperature Lab | Capability bands, warning, equipment and recovery. |
| Underwater Work Lab | Mining, placement, breach warning, drops and inventory exposure. |
| Air Pocket/Airlock Lab | 26B integration, leaks, pumps, doors and breath recovery. |
| Combat Lab | Shared action continuity, specialised weapons, visibility and creature AI. |
| Rescue Lab | Grab, tow, rope, flotation, vessel ladder and multiplayer consent. |
| NPC Dive Lab | Task planning, reserve, buddy, failure, rescue and LOD summary. |
| Save/Reconnect Lab | Submerged, incapacitated, tethered, vessel-side and flooded-space reload. |
| Accessibility Lab | Simplified control, reduced motion, cues, unlimited breath and exit assist. |
| Performance Lab | Multiple players/NPCs, currents, particles, lights, loose items and tethers in packaged build. |

Acceptance evidence includes telemetry, automated tests, playtest observation, reason-code logs, frame-time profiles and save/reload comparisons. Exact values remain provisional until evidence is reviewed.

# 54. Validation, Failure Codes and Redesign Triggers

| Code | Meaning | Default Severity |
| --- | --- | --- |
| AQUA-OWN-001 | Character system calculated duplicate liquid/environment truth. | Fatal ownership failure. |
| AQUA-CONTACT-001 | Contact state flickers or disagrees with 26B samples. | Release blocker. |
| AQUA-MOVE-001 | Ordinary swimming loses input agency without reported force/state. | Redesign trigger. |
| AQUA-EXIT-001 | Valid common shore/ladder cannot be exited reliably. | Release blocker. |
| AQUA-BREATH-001 | Breath changes with frame rate or client-only state. | Release blocker. |
| AQUA-WARN-001 | Drowning/pressure hazard lacks redundant warning. | Release blocker. |
| AQUA-RESCUE-001 | Incapacitated target cannot be recovered by declared rescue path. | Block content/admission. |
| AQUA-PRESS-001 | Deep hazard has no capability preview or counter path. | Block content. |
| AQUA-BUILD-001 | Underwater placement bypasses 26B displacement/seal rules. | Fatal ownership failure. |
| AQUA-COMBAT-001 | Underwater action uses conflicting damage/stamina truth. | Fatal integration failure. |
| AQUA-TRAIT-001 | Ancestry/culture facet creates unmitigable mandatory disadvantage. | Governance failure. |
| AQUA-UI-001 | HUD disagrees with authoritative breath/depth state. | Release blocker. |
| AQUA-A11Y-001 | Accessibility mode removes critical information or content access. | Release blocker. |
| AQUA-NET-001 | Client/server disagree on drowning, rescue or consequential interaction. | Release blocker. |
| AQUA-SAVE-001 | Load/reconnect places character in invalid lethal state without fallback. | Release blocker. |
| AQUA-PERF-001 | Character/environment queries exceed approved budget. | Demote frequency/detail and report. |

Redesign triggers include repeated shore trapping, nausea/disorientation, unavoidable drowning loops, unreadable current, underwater building exploits, rescue griefing, excessive network correction, NPC mass drowning, save loss or performance that requires disabling core marine interaction.

# 55. Handoff to Document 26F

Document 26F must consume the player and NPC interaction contracts established here while defining mobile voxel vessel structure and commissioning.

26F receives:

- Character clearance, locomotion and water-contact states.
- Surface, ladder, rope, handhold, hatch and rescue interaction requirements.
- Breathable-space and flooded-space interfaces from 26B/26E.
- Equipment/load and carried-character implications for access design.
- Boarding and vessel-frame handoff requirements.
- Man-overboard and rescue socket needs.
- Interior route, deck edge, waterline and emergency-exit readability requirements.
- NPC crew capability and safe-access expectations.
- Required stable IDs for vessel-local spaces, interaction sockets and ownership.

26F owns vessel voxel selection, structural roles, local grid, commissioning, validation, structural spaces and component placement. 26E does not decide whether a block assembly is a valid ship.

> **26E Completion Statement**
>
> Document 26E establishes Leyforge's complete aquatic player-interaction foundation. It defines water-contact and locomotion states, shore transitions, surface swimming, floating, diving, underwater movement, stamina, breath, drowning, recoverable incapacitation, pressure bands, temperature, visibility, current and wave response, equipment, magic, identity-safe traits, underwater tools, mining, building, air pockets, infrastructure, interaction, combat, rescue, NPC behaviour, vessel-side boarding, death recovery, progression, quests, UI, accessibility, difficulty, multiplayer authority, persistence, Godot/Summer Engine boundaries, Presentation Forge separation, registry contracts, production classification and validation laboratories. The set may now proceed to 26F without duplicating fluid, world-generation, weather, combat or UI truth and without treating ordinary water as either harmless decoration or arbitrary instant death.

# 56. Open Decisions for Later Documents

| Decision ID | Question | Owner/Dependency |
| --- | --- | --- |
| DEC-26E-001 | Exact default breath duration and exertion curves. | 26O prototype evidence. |
| DEC-26E-002 | Default drowning injury interval and rescue window. | Ash/26O. |
| DEC-26E-003 | Whether rapid-ascent stress ships in any standard preset. | Ash/26O; default off. |
| DEC-26E-004 | Final aquatic skill/perk grouping. | 26N and Player Progression revision. |
| DEC-26E-005 | First-release diving equipment families and materials. | 26N/Set 25 classification. |
| DEC-26E-006 | Underwater base/airlock production tier. | 26B, 26J, 26N, 26O. |
| DEC-26E-007 | Final underwater combat weapon roster. | 26L/26N/16 revision. |
| DEC-26E-008 | Rope/tether complexity and network budget. | 26O prototypes. |
| DEC-26E-009 | NPC self-rescue and permanent-death defaults. | 07 revision/world settings. |
| DEC-26E-010 | Exact accessibility preset defaults. | Ash/17 revision/26O. |
| DEC-26E-011 | Vehicle/submersible breathing interface details. | Later Set 26/26O. |
| DEC-26E-012 | Whether ordinary inventory fullness affects buoyancy. | Default no; revisit only with evidence. |

# Appendix A. Canonical Glossary

| Term | Definition |
| --- | --- |
| Breath Point | Character sample used to determine whether breathable air is available. |
| Immersion | Portion/class of the character body inside a liquid. |
| Surface Supported | Locomotion state where buoyancy supports the character at a liquid-air boundary. |
| Aquatic Capability | Resolved character ability from body, equipment, skill, trait, magic and status. |
| Exertion | Aquatic activity demand that modifies stamina and breath consumption. |
| Breath Reserve | Readable usable-air capacity before drowning injury begins. |
| Air Source | Authoritative breathable supply with capacity/flow and ownership. |
| Pressure Band | Authored depth/capability class rather than exact continuous physiology. |
| Buoyancy Class | Strong positive, positive, neutral, negative or anchored character tendency. |
| Rescue Link | Validated connection between rescuer, target and optional tool/anchor. |
| Aquatic Action Context | Environment/capability snapshot used to resolve an action. |
| Safe Fallback | Deterministic recovery placement/state used when load/reconnect context is invalid. |

# Appendix B. Aquatic State Transition Matrix

| From | To | Primary Trigger | Key Validation |
| --- | --- | --- | --- |
| Dry | Wading | Feet/body enter liquid with ground support. | Liquid contact, depth, footing. |
| Wading | Surface Supported | Buoyancy exceeds support or depth threshold. | Clearance, breath point, buoyancy. |
| Surface Supported | Submerged | Dive input, wave, fall or obstruction. | Medium, clearance, state permissions. |
| Submerged | Surface Supported | Breath point crosses valid surface/air. | Surface, obstruction, ice. |
| Submerged | Grounded Underwater | Terrain support/ballast/brace. | Contact normal and capability. |
| Any Water | Climbing/Exiting | Valid interaction and input. | Edge/socket, clearance, stamina, force. |
| Any Water | Attached/Towed | Valid rescue/rope/mount link. | Distance, consent, obstruction, capacity. |
| Submerged | Incapacitated | Drowning/injury threshold. | Shared health/status rules. |
| Incapacitated | Surface Supported/Attached | Flotation/rescue/air source. | Stabilisation and transfer. |
| Water State | Dry | Valid exit and body clear of liquid. | Ground/structure support and clearance. |

# Appendix C. Capability and Equipment Matrix

| Capability | Improvised | Basic | Equipped | Deep | Extraordinary |
| --- | --- | --- | --- | --- | --- |
| Surface Survival | Manual float/rope | Flotation | Reliable rescue gear | Storm-rated support | Magical/legendary aid |
| Breath | Breath-hold | Small reserve | Tank/air system | Redundant supply | Sustained magical/biological |
| Visibility | Torch/light | Goggles/lamp | Survey light | Advanced sensing | Realm/legendary sight |
| Thermal | Clothing/fire after exit | Insulation | Sealed thermal layer | Active heat | Magical/biological immunity |
| Pressure | Shallow only | Moderate | Rated suit/ward | Deep system | Hadal/realm solution |
| Mobility | Basic swim | Fins | Efficient gear | Powered/magical | Special vehicle/trait |
| Work | Hand tool | Sealed tool | Braced kit | Powered tools | Magitech/legendary tools |
| Rescue | Grab/rope | Float line | Harness/shared air | Team system | Exceptional extraction |

# Appendix D. Underwater Action Compatibility Matrix

| Action | Surface | Submerged Free-Swim | Grounded/Braced | Air Pocket/Interior |
| --- | --- | --- | --- | --- |
| Inventory Quick Use | Yes | Yes, exposure continues | Yes | Yes |
| Full Inventory | Yes | Yes with warning | Yes | Yes |
| Basic Mining | Limited | Reduced | Supported | Normal if dry |
| Block Placement | Near surface | Valid with reach/force | Best | Normal if dry |
| Heavy Melee | Limited | Poor | Improved | Normal if dry |
| Thrusting Melee | Good | Good | Good | Normal |
| Bow | Air only/transition | Poor/defined | Poor/defined | Normal if dry |
| Harpoon | Good | Good | Good | Contextual |
| Spellcasting | Definition-based | Definition-based | Definition-based | Definition-based |
| Rescue Grab | Yes | Yes | Yes | Yes |
| Tow | Yes | Yes with cost | Limited | Carry/drag rules |
| Repair/Seal | Yes | Yes with tool | Best | Normal if dry |

# Appendix E. Accessibility and Comfort Checklist

- [x] Surface, breath and exit cues use more than colour.
- [x] Ascend/descend controls are independently remappable.
- [x] Hold and toggle options exist.
- [x] Camera roll, heave, distortion, blur, droplets and particles are adjustable.
- [x] Stable-horizon and simplified-depth profiles are supported.
- [x] Unlimited/extended breath can be enabled without content loss.
- [x] Auto-surface and exit assistance are available.
- [x] Current force and visual current can be adjusted separately.
- [x] Critical warnings may use text, icon, sound, haptic and spoken alternatives.
- [x] Split-screen users may choose independent comfort settings.
- [x] Accessibility does not remove progression rewards by default.
- [x] Reduced presentation never hides authoritative danger state.

# Appendix F. Validation and Failure-Code Catalogue

| Code | Meaning | Default Severity |
| --- | --- | --- |
| AQUA-OWN-001 | Duplicate environment/liquid owner. | Fatal. |
| AQUA-CONTACT-001 | Body samples disagree or flicker beyond tolerance. | Release blocker. |
| AQUA-SURFACE-001 | Character cannot acquire a valid ordinary surface. | Release blocker. |
| AQUA-EXIT-001 | Common exit fails or provides no reason. | Release blocker. |
| AQUA-BREATH-001 | Breath is frame-rate/client dependent. | Release blocker. |
| AQUA-DROWN-001 | Drowning lacks warning/recovery path for selected preset. | Release blocker. |
| AQUA-PRESS-001 | Pressure gate lacks preview/mitigation. | Block content. |
| AQUA-FORCE-001 | Current/wave effect disagrees with 26D snapshot. | Fatal integration. |
| AQUA-BUILD-001 | Placement bypasses 26B fluid rules. | Fatal integration. |
| AQUA-RESCUE-001 | Rescue link invalid, griefable or unrecoverable. | Release blocker. |
| AQUA-NPC-001 | Ordinary NPC path repeatedly enters lethal water without capability. | Redesign. |
| AQUA-NET-001 | Authority disagreement on movement/survival. | Release blocker. |
| AQUA-SAVE-001 | Invalid lethal load/reconnect state. | Release blocker. |
| AQUA-A11Y-001 | Assist removes critical information or access. | Release blocker. |
| AQUA-PERF-001 | Work exceeds approved budget. | Demote/optimise. |

# Appendix G. Prototype and Seed Test Matrix

| Test Class | Required Coverage |
| --- | --- |
| Calm River | Wading, current, shore exits, swimming and simple rescue. |
| Lake | Surface orientation, long swim, boat ladder and night visibility. |
| Rocky Coast | Surf, ledges, waves, exit assist and item recovery. |
| Reef/Shelf | Basic diving, harvesting, visibility, creatures and air reserve. |
| Flooded Mine | Pumps, doors, air pockets, mining, breach and NPC task. |
| Sea Cave | Tight clearance, surface search, light and safe fallback. |
| Storm Sea | Rough surface, man overboard, towing, warning and reduced motion. |
| Polar/Ice | Cold, ice opening, rescue line and visibility. |
| Deep Slope | Pressure band, equipment preview and return reserve. |
| Magical/Contaminated Water | Sourced hazard, protection, purification and UI. |
| Underwater Build | Placement, displacement, sealing, drops and persistence. |
| Combat | Melee, ranged, magic, creature AI, stealth and status. |
| Multiplayer | Prediction, rescue consent, split-screen and reconnect. |
| Accessibility | Simplified controls, auto-surface, unlimited breath and cue alternatives. |
| Save/Migration | Submerged, incapacitated, tethered, air-supplied and recovery object states. |
| Modded Content | New liquid/equipment/trait definitions validate without unrelated ID reshuffle. |

# Appendix H. Completion Checklist

- [x] Aquatic player identity and experience targets defined.
- [x] Fluid, worldgen, environment, combat, UI and identity boundaries defined.
- [x] Water-contact and locomotion state model defined.
- [x] Entry, wading, surface swimming, floating and exits defined.
- [x] Diving, underwater movement, stamina and exertion defined.
- [x] Breath, air supply, drowning, rescue and recovery defined.
- [x] Depth, pressure, temperature and visibility defined.
- [x] Current, wave, surf, storm, ice and extraordinary hazard response defined.
- [x] Buoyancy, load, equipment, magic and identity-safe traits defined.
- [x] Underwater tools, mining, building, air pockets and infrastructure defined.
- [x] Interaction, combat, stealth, creatures and NPC behaviour defined.
- [x] Vessel-side interaction, man overboard and rescue defined.
- [x] Death recovery, progression, quests and tutorials defined.
- [x] HUD, controls, camera, accessibility and difficulty defined.
- [x] Multiplayer, persistence, LOD, Godot and presentation boundaries defined.
- [x] Registry facets, reason codes, production classification and laboratories defined.
- [x] Validation and redesign triggers defined.
- [x] Handoff to Document 26F defined.

**Document 26E Status: Complete for controlled review and downstream drafting.**
