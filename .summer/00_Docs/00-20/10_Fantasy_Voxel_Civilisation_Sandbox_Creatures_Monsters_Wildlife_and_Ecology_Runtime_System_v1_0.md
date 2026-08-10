# LEYFORGE

## 10 — Creatures, Monsters, Wildlife and Ecology Runtime System

### Creature Identity Integration, Population Ecology, Behaviour Intent, Encounter Assembly, Husbandry, Taming, Harvesting, Ecological Pressure and Persistent Consequence

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `10_Fantasy_Voxel_Civilisation_Sandbox_Creatures_and_Monsters_v0_1` for active production direction  
**Primary Authored Content Authority:** `24F — World Content Atlas: Wildlife, Creatures, Monsters and Ecology Atlas v0.1`  
**Boss/Threat Content Authority:** `24H — Bosses, Titans, Siege Threats and Realm Guardians`  
**Site/Dungeon Ecology Consumer:** `24G — Dungeons, Ruins, Lairs and Megadungeons`  
**World Context Authority:** Document 11 v1.0 + Atlas 24A–24D  
**Physical Registry Inputs:** Documents 03–06 v1.0  
**Persistent People Boundary:** Document 07 v1.0 + Atlas 24E  
**Magic Boundary:** Document 09 v1.0  
**Combat Boundary:** Document 16  
**Maritime Ecology Authority:** Set 26M, consuming Document 10/24F creature foundations  
**Economy Boundary:** Set 27  
**Social/Companion Boundary:** Set 28  
**Biological Runtime Boundary:** Set 29  
**Movement/Navigation Boundary:** Set 30, with aquatic locomotion supplied by Set 26E  
**Production Governance:** Set 25  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale creature and ecology runtime for Leyforge in which wildlife, livestock, predators, monsters, magical beings, undead, constructs, swarms, mounts, work beasts and realm fauna exist as parts of persistent ecosystems rather than interchangeable combat spawns.

> **Creature System Statement**
>
> **Every production creature must meaningfully consume, provide, threaten, protect, reveal, migrate, reproduce, work, trade, teach, infest, stabilise, transform or otherwise affect the world. Combat is one creature role, not the definition of creature gameplay.**

> **Population Before Spawn Rule**
>
> **Normal encounters should resolve from a valid population, nest, territory, migration, dungeon ecology, settlement relationship, event or other authored source. The game should not manufacture unrelated creatures from invisible trigger volumes merely because a player entered an area.**

> **Personhood Is Not Hostility Rule**
>
> **Hostility does not make a being a monster in the ownership sense. A self-aware goblin, awakened construct, intelligent undead, spirit, raider or other recognised person remains governed by personhood, faction, law, dialogue and social systems even when hostile.**

> **Intent Is Not Movement Rule**
>
> **Document 10 decides why a creature wants to hunt, flee, graze, defend, migrate, patrol, follow, return home or reach a nest. Set 30 executes terrestrial/aerial physical navigation; Set 26E owns detailed aquatic locomotion. Creature AI never gains teleport privileges because it is AI.**

> **Ecology Is Persistent Rule**
>
> **Hunting, breeding, predation, disease, habitat change, domestication, settlement expansion, pollution, magic, boss outcomes and migration can change populations. Distance and LOD may simplify representation, but they do not reset the ecosystem whenever the player leaves.**

---

# Document Purpose

Document 10 defines the reusable gameplay systems that make creatures function as living actors inside Leyforge.

The World Content Atlas 24F now owns the authored creature-family catalogue and ecology-package content. It establishes the broad production foundation of:

- **72 Overworld creature families**;
- **60 realm creature families**;
- ecology packages;
- dungeon-fauna modules;
- boss ecology hooks;
- habitat relationships;
- personhood flags;
- content-completeness contracts.

Document 10 therefore does **not** duplicate those 132 foundations into another editable registry.

Instead, Document 10 owns the shared runtime rules required to turn those authored families into:

- populations;
- individuals;
- groups;
- nests;
- territories;
- migrations;
- encounters;
- ecological interactions;
- behaviour intent;
- hunting;
- harvesting;
- taming;
- husbandry;
- ownership;
- work-beast integration;
- persistent pressure;
- population change;
- ecological recovery;
- readable player interaction;
- simulation LOD;
- authoritative save state.

The original Document 10 v0.1 established a useful creature foundation, including:

- passive wildlife;
- livestock;
- night threats;
- cave creatures;
- magical creatures;
- goblin raid actors;
- mini-boss roles;
- biome/time/structure spawning;
- creature drops;
- village consequences;
- basic AI differentiation;
- magic links;
- automation links;
- taming/mount ideas;
- future creature-family breadth.

Those system ideas are preserved.

The fixed POC roster, fixed goblin raid, fixed cave threats, fixed Forest Wisp tutorial logic and fixed valley spawn relationships are archived.

---

# 1. Locked Creature-System Identity

The creature system is Leyforge's living non-civilisation runtime.

It connects:

- terrain;
- climate;
- water;
- vegetation;
- agriculture;
- resources;
- settlements;
- roads;
- trade;
- hunting;
- crafting;
- medicine;
- magic;
- automation;
- movement;
- dungeons;
- realms;
- quests/events;
- combat;
- research;
- conservation;
- player choice.

## 1.1 What Document 10 Owns

Document 10 owns:

- reusable creature-runtime architecture;
- creature-instance identity for non-person creature actors;
- creature family runtime resolution from 24F;
- creature behavioural intent;
- creature motivation;
- creature sensory-profile semantics;
- group behaviour intent;
- herd/flock/pack/swarm coordination intent;
- population records;
- population pressure;
- range;
- local density;
- carrying-capacity ecology abstraction;
- breeding/recruitment ecology rules;
- migration ecology intent;
- nest/den/colony/territory runtime state;
- encounter-source selection;
- encounter assembly from valid populations;
- activity selection;
- wildlife safe-zone response;
- taming eligibility at the species/family layer;
- husbandry compatibility;
- creature ownership/custody at the non-person-animal layer;
- creature training profile;
- creature welfare requirements as ecological/animal-care definitions, while consuming Set 29 biology where applicable;
- managed-wild-population state;
- creature harvest/salvage source contracts;
- ecological consequences of harvesting;
- invasive-population state;
- local depletion/extirpation;
- reintroduction/recovery;
- creature-created habitat pressure;
- ecology event evidence;
- creature LOD;
- population promotion/demotion;
- creature persistence;
- ecology diagnostics;
- creature-facing interfaces to specialist systems.

## 1.2 What Document 10 Does Not Own

Document 10 does not own:

- authored creature-family catalogue identity — Atlas 24F;
- cultures/factions/personhood law — Atlas 24E / Document 13;
- persistent ordinary person/household/job truth — Document 07;
- Block identity — Document 03;
- Item identity — Document 04;
- transformation recipes — Document 05;
- resource progression — Document 06;
- spell/mana truth — Document 09;
- terrain/biome generation — Document 11;
- dungeon room/layout generation — 24G / Document 12;
- full boss encounter/phases — 24H / Document 16;
- combat hit/damage/downing/death — Document 16;
- market prices and contracts — Set 27;
- Trust/Affection/Loyalty/companion agreement — Set 28;
- universal biological runtime state such as Health/Stamina/injury/disease/toxin where Set 29 applies — Set 29;
- physical terrestrial/aerial creature movement/pathfinding — Set 30;
- detailed swimming/diving creature movement — Set 26E;
- vessel movement — Set 26;
- final UI — Document 17;
- visual asset creation — Forge;
- final technical implementation — Document 18 v1.0.

---

# 2. 24F and Document 10 Ownership Relationship

This boundary is essential.

## 2.1 Atlas 24F Owns Authored Creature Content

24F owns authored facts such as:

- creature family stable ID;
- being class;
- personhood state;
- ecological role;
- habitat constraints;
- diet/input relationships;
- lifecycle identity;
- social pattern;
- senses;
- behavioural-profile references;
- resource relationships;
- taming eligibility;
- settlement relationships;
- magic/realm relationships;
- variation limits;
- presentation requirements;
- production classification.

## 2.2 Document 10 Owns Runtime Mechanics

Document 10 resolves:

- how an eligible population exists in a generated region;
- how many are represented;
- whether a nest is active;
- which individuals are promoted;
- what activity a group is performing;
- when a migration should attempt movement;
- how local population loss changes regional pressure;
- how taming/training progresses;
- how animal ownership is persisted;
- how ecological state is reconciled at distance;
- how creature AI submits movement intent;
- how harvesting affects populations;
- how ecology recovers.

## 2.3 No Duplicate Creature Catalogue

Document 10 must not maintain a second editable copy of:

- 72 Overworld families;
- 60 realm families;
- their habitat lists;
- their stable IDs;
- their personhood states;
- their authored family relationships.

A runtime instance stores the 24F family reference.

---

# 3. Source Authority and Reconciliation

| Source | Direction Consumed |
|---|---|
| Document 10 v0.1 | Creature categories, spawning, AI, drops, village interaction, taming, bosses and broad family roadmap. |
| Atlas 24F | Production creature identities, ecology graph, populations, lifecycle, personhood, taming, realm fauna, LOD and content contracts. |
| Atlas 24E | Personhood, civilisation, culture, faction and hostility separation. |
| Atlas 24G | Dungeon/lair ecology sockets and site persistence. |
| Atlas 24H | Boss/titan/siege/guardian encounter content and aftermath. |
| Set 25G | Core ecology package network: ambient web, herds/domestic/work beasts, predator/scavenger/pest pressure, magical/undead/corruption/construct ecology. |
| Document 11 v1.0 | Habitat/world context and deterministic worldgen. |
| Document 07 v1.0 | Persistent people, ordinary settlement jobs and livestock/workforce operational interfaces. |
| Document 09 v1.0 | Magical creatures, summons, corruption, constructs and mana-facing capability. |
| Set 26M | Marine ecology, fishing, sea creatures, marine dungeons and bosses. |
| Set 27 | Creature goods, livestock and services receive economic value here. |
| Set 28 | Social knowledge, relationships, companion agreements and personhood-social state. |
| Set 29 | Universal biological state for applicable living actors; creature definitions provide Biological Profile refs, sources, vectors and susceptibility. |
| Set 30 | Creature pathfinding and terrestrial/aerial movement execution. |
| Set 26E | Detailed aquatic locomotion. |
| Document 16 | Creature combat actions, damage and death. |
| Forge Sets 21–23 | Models, rigs, animations, VFX, audio and presentation bindings. |

---

# 4. POC Supersession

## 4.1 Archived

The following are not production requirements:

- fixed Forest Hamlet animal roster;
- fixed passive animal near spawn;
- mandatory night monster;
- mandatory cave creature;
- fixed Forest Wisp tutorial;
- fixed goblin camp;
- fixed goblin raid;
- fixed Goblin Captain;
- fixed raid composition;
- fixed creature drops tied to POC progression;
- fixed watchtower defence interaction;
- fixed cave/magic-creature relationship;
- fixed POC spawn coordinates.

## 4.2 Preserved Capabilities

Preserved:

- passive wildlife;
- livestock;
- predators;
- cave fauna;
- nocturnal fauna;
- magical creatures;
- hostile non-person monsters;
- hostile person/faction actors through the personhood boundary;
- settlement pressure;
- raids/events;
- creature drops/resources;
- nests/camps/lairs;
- mini-boss/boss hooks;
- taming;
- mounts;
- work beasts;
- familiar/companion hooks;
- creature research;
- creature reactions to automation/magic;
- readable warning;
- relaxed difficulty.

---

# 5. Creature Classification

Creature content uses multiple independent axes.

No single hierarchy should imply:

- morality;
- intelligence;
- hostility;
- personhood;
- tamability;
- loot eligibility.

## 5.1 Being Class

Examples:

- animal;
- plant-like organism;
- fungal organism;
- spirit;
- elemental;
- undead;
- construct;
- swarm;
- created organism;
- anomaly.

## 5.2 Personhood State

Recommended:

- `non_person`
- `uncertain`
- `emergent`
- `recognised_person`
- `disputed_personhood`
- `collective_personhood`

## 5.3 Ecological Role

Examples:

- pollinator;
- grazer;
- browser;
- predator;
- apex predator;
- scavenger;
- parasite;
- decomposer;
- ecosystem engineer;
- magical regulator;
- pest controller.

## 5.4 Gameplay Role

Examples:

- ambient indicator;
- resource source;
- livestock;
- pet;
- mount;
- work beast;
- nuisance;
- predator;
- environmental hazard;
- dungeon inhabitant;
- territorial guardian;
- regional threat;
- boss ecology hook.

## 5.5 Threat Band

Examples:

- Harmless
- Defensive
- Low
- Moderate
- Severe
- Regional
- Catastrophic

Threat does not equal personhood.

---

# 6. Personhood Boundary

This is a release-blocking classification rule.

A being that demonstrates:

- durable self-identity;
- language/communication sufficient for social agency;
- culture;
- law;
- negotiation;
- moral agency;
- social memory;
- durable goals;

must be evaluated for personhood.

## 6.1 Recognised Persons

Recognised persons cannot be routed through normal:

- taming;
- livestock;
- breeding stock;
- harvest table;
- animal ownership;
- capture-as-pet;
- slaughter;
- trophy logic.

Their identity routes to:

- Atlas 24E;
- Document 07 where persistent-person semantics apply;
- Set 28 social systems;
- Document 13 faction/law/culture;
- Document 16 combat when hostile.

## 6.2 Hostility Is Context

A goblin raider may be hostile.

That does not mean:

`being_class = monster`
and
`personhood = false`

The goblin may be:

- a faction member;
- soldier;
- bandit;
- citizen;
- exile;
- mercenary;
- cultist;
- prisoner;
- diplomat;
- trader.

Combat state does not overwrite personhood.

## 6.3 Awakened Constructs

A non-sentient work golem may be equipment/construct.

An awakened construct with persistent selfhood may be a person.

The body material does not decide rights.

## 6.4 Intelligent Undead

An undead citizen can be:

- socially recognised;
- employed;
- a faction member;
- a companion;
- a ruler;
- hostile or peaceful.

Undead biology and necromantic origin do not automatically erase personhood.

---

# 7. Creature Family Definition Consumption

Document 10 expects 24F families to expose:

```yaml
creature_family_ref:
  family_id: leyforge.atlas.creature.<path>
  being_class: <value>
  personhood_state: <value>
  ecological_roles: []
  gameplay_roles: []
  threat_band: <value>
  social_pattern: <value>
  habitats: []
  exclusions: []
  diet_or_inputs: []
  lifecycle_profile_ref: <id>
  behaviour_profile_ref: <id>
  senses_profile_ref: <id>
  locomotion_profile_refs: []
  biological_profile_ref: <id>?
  population_profile_ref: <id>
  nest_territory_profile_ref: <id>?
  taming_profile_ref: <id>?
  harvest_profile_ref: <id>?
  resource_relationship_refs: []
  magic_refs: []
  settlement_relationship_refs: []
  realm_refs: []
  variant_profile_ref: <id>
  presentation_refs: []
  production_status: <state>
```

Document 10 validates references but does not duplicate authored values.

---

# 8. Creature Instance Identity

A locally represented creature uses a runtime instance.

## 8.1 Creature Instance

```yaml
creature_instance:
  creature_id: creature:<ulid>
  family_ref: <24F_family_id>
  population_ref: population:<id>
  group_ref: creature_group:<id>?
  nest_or_territory_ref: <id>?
  variant_state_ref: <id>
  biological_actor_ref: biology:<id>?
  movement_actor_ref: movement:<id>
  combat_actor_ref: combat:<id>
  social_record_ref: <id>?
  ownership_ref: <id>?
  training_ref: <id>?
  inventory_ref: <id>?
  current_activity: <value>
  current_intent_ref: <id>?
  notable_identity: false
  protected_persistence: false
  lod_state: <value>
  revision: <n>
```

## 8.2 Not Every Creature Must Be Permanently Individual

Persistent individual identity is required for:

- tame animals;
- pets;
- mounts;
- work beasts;
- named animals;
- companions;
- unique variants;
- injured/rescued notable animals;
- boss/elite identities;
- quest-linked creatures;
- owned livestock where individual tracking matters;
- rare breeding lineages;
- creatures carrying persistent gear;
- creatures with meaningful social history.

Routine wild populations may use cohort/group/population state until promotion.

---

# 9. Population Records

Population is the core ecology unit at distance.

A population record may contain:

- population ID;
- creature family;
- region;
- habitat cells/area;
- current population band/count model;
- age-stage bands;
- sex/reproductive structure where relevant;
- nest count;
- current carrying-capacity band;
- food/input availability;
- predator pressure;
- competitor pressure;
- disease pressure;
- civilisation pressure;
- magical pressure;
- harvest pressure;
- migration state;
- population trend;
- local extirpation state;
- notable individuals;
- last reconciliation time;
- source revision.

---

# 10. Population States

Recommended states:

| State | Meaning |
|---|---|
| Absent | Habitat incompatible or no colonisation route. |
| Trace | Stragglers, clues, no durable breeding source. |
| Established | Stable breeding population. |
| Abundant | Above expected density but sustainable. |
| Overpopulated | Above safe carrying capacity. |
| Declining | Loss exceeds recruitment. |
| Locally Extirpated | No local population; recolonisation possible. |
| Recovering | Reintroduced/recolonising. |
| Invasive | Expanding outside normal authored range through a valid cause. |

---

# 11. Carrying Capacity

Leyforge does not need laboratory ecology.

It needs a bounded causal model.

Carrying-capacity inputs may include:

- food;
- water;
- habitat area;
- shelter;
- breeding sites;
- climate;
- season;
- competition;
- predators;
- disease;
- civilisation;
- hunting;
- pollution;
- magic;
- nest capacity;
- event state.

## 11.1 No Infinite Respawn

If a local population is heavily reduced:

- sightings decrease;
- nests become inactive;
- resource availability changes;
- predators may move;
- pests may expand;
- migration may refill the niche later.

The game cannot instantly refill the zone every time the player reloads it.

---

# 12. Ecology Graph

A regional ecology package is a graph of relationships.

Supported edge families include:

- `feeds_on`
- `pollinates`
- `disperses`
- `shelters_in`
- `nests_in`
- `competes_with`
- `preys_on`
- `controls`
- `engineers_habitat`
- `symbiosis`
- `avoids`
- `repelled_by`
- `parasites`
- `infects_or_vectors`
- `scavenges`
- `depends_on_magic`
- `depends_on_machine_waste`
- `depends_on_structure`
- `supports_resource`

## 12.1 Ecology Is Not a Perfect Energy Simulation

The runtime tracks enough relationships to create:

- abundance;
- decline;
- migration;
- pest pressure;
- crop effects;
- predator shift;
- disease pressure;
- settlement requests;
- event triggers;
- resource change.

---

# 13. Worldgen and Habitat Eligibility

Document 11 supplies:

- biome;
- microhabitat;
- climate;
- terrain;
- hydrology;
- geology;
- altitude/depth;
- vegetation;
- magic;
- civilisation pressure;
- history;
- structures;
- realm law;
- dynamic environment state.

Document 10/24F evaluates creature habitat compatibility.

## 13.1 No One-Biome-One-Creature Table

A forest biome does not automatically mean:

- deer;
- wolf;
- spider;
- goblin.

Seed selection chooses compatible ecology packages.

## 13.2 Habitat Exclusions

A family may be excluded by:

- temperature;
- water;
- altitude;
- salinity;
- pressure;
- lack of food;
- no nest substrate;
- warding;
- civilisation;
- anti-magic;
- realm law;
- predator pressure;
- pollution;
- history.

---

# 14. Encounter Source Model

Every normal encounter should resolve a source.

Sources may include:

- established population;
- active nest;
- den;
- roost;
- colony;
- hive;
- herd ground;
- migration;
- territory;
- dungeon population;
- carcass;
- settlement-edge population;
- event;
- invasion;
- portal leak;
- summoned entity;
- created construct;
- escaped captive;
- trader/handler stock;
- boss territory.

## 14.1 Ambient Exceptions

Low-cost ambient clues may be represented without promoted actors if backed by a population.

Examples:

- distant calls;
- tracks;
- insects;
- birds;
- burrows;
- shed material.

---

# 15. Encounter Assembly

Canonical flow:

**Region Eligibility**  
→ **Population/Source**  
→ **Current Activity**  
→ **Group Composition**  
→ **Variant/Age Selection**  
→ **Player/World Context**  
→ **Promotion to Actors**  
→ **Movement/Behaviour Execution**  
→ **Encounter Outcome**  
→ **Population/World Aftermath**

## 15.1 Activity Before Aggression

Creature activity may be:

- feeding;
- drinking;
- resting;
- travelling;
- migrating;
- hunting;
- fleeing;
- guarding;
- courting;
- breeding;
- nesting;
- scavenging;
- caring for young;
- patrolling;
- working;
- infesting;
- investigating;
- hiding.

The player may encounter a predator that is not hunting them.

---

# 16. Safe Zones

Safety should come from visible world systems.

Safety contributors:

- walls;
- lights;
- roads;
- patrols;
- wards;
- guard animals;
- cleared habitat;
- removed nests;
- deterrents;
- fencing;
- settlement density;
- noise;
- fire;
- habitat management.

## 16.1 Safe Is Not Empty

Safe settlements may still contain:

- pets;
- livestock;
- birds;
- pollinators;
- urban scavengers;
- managed species;
- harmless wildlife.

## 16.2 Difficulty

World settings may support:

- Peaceful ecology;
- defensive-only threats;
- reduced predation;
- reduced settlement damage;
- normal ecology;
- harsh ecology.

---

# 17. Behaviour Intent Architecture

Document 10 owns creature decision intent.

A creature decision may consider:

- family behaviour;
- current activity;
- hunger/input pressure;
- thirst/equivalent;
- territory;
- offspring;
- nest;
- group;
- threat;
- injury/biological state from Set 29;
- prey;
- predator;
- player;
- settlement;
- noise;
- light;
- scent;
- magic;
- weather;
- season;
- time;
- memory/home-range state;
- training;
- owner/handler;
- event command;
- faction command for personhood-routed actors;
- route accessibility result.

## 17.1 Behaviour Does Not Write Transforms

Document 10 emits movement intent.

Set 30/26E moves the creature.

---

# 18. Senses

Creature senses may include:

- sight;
- night vision;
- colour sensitivity;
- hearing;
- vibration;
- scent;
- heat;
- mana;
- spirit presence;
- electrical field;
- water pressure;
- movement disturbance;
- memory/resonance;
- line of sight through water.

## 18.1 Sensor Result

Perception should produce:

- detected target/evidence;
- confidence;
- direction;
- freshness;
- intensity;
- identity certainty;
- threat/interest classification.

Perception does not create social omniscience.

---

# 19. Motivation

Examples:

- hunger;
- water/equivalent;
- shelter;
- offspring;
- mating;
- territory;
- group cohesion;
- nest maintenance;
- curiosity;
- fear;
- resource attraction;
- magical source;
- programmed order;
- ritual law;
- defence;
- migration;
- environmental escape.

## 19.1 Revenge

Revenge-like behaviour requires cognition/memory sufficient to support it.

A generic rabbit does not become an avenging faction because the player hunted another rabbit.

---

# 20. Morale and Fear

Creature behavioural confidence may derive from:

- group size;
- leader presence;
- home territory;
- injury;
- casualties;
- fire;
- ward;
- predator presence;
- trapped state;
- hunger;
- command;
- handler;
- shelter;
- distance from nest.

This creature morale is a behavioural control input.

For recognised persons, detailed social fear/relationship meaning routes to Set 28.

---

# 21. Communication

Creature communication may use:

- calls;
- posture;
- colour;
- scent;
- vibration;
- light;
- magical pulse;
- dream image;
- spirit resonance;
- machine signal.

Communication may transmit:

- alarm;
- rally;
- mating;
- territory;
- food;
- route;
- nest threat;
- handler command;
- group movement.

---

# 22. Group Behaviour

Groups may include:

- family;
- herd;
- pack;
- flock;
- school;
- swarm;
- colony;
- hive;
- temporary aggregation;
- migration mass.

Document 10 owns group intent.

Set 30 owns formation/path execution.

## 22.1 Group Roles

Examples:

- leader;
- scout;
- juvenile;
- protector;
- hunter;
- worker;
- carrier;
- queen/core;
- guard;
- wounded member.

## 22.2 Group Tactics

Non-person creatures may use:

- herd defence;
- pack flanking;
- swarm surround;
- alarm relay;
- juvenile protection;
- wounded-member support;
- ambush;
- retreat.

Combat executes attacks.

---

# 23. Movement and Navigation Boundary

Set 30I explicitly owns physical NPC/creature navigation.

Document 10 supplies:

- creature movement goal;
- urgency;
- home range;
- target;
- avoidance intent;
- group intent;
- behavioural constraints;
- locomotion capability references.

Set 30 supplies:

- reachable;
- route/path;
- physical movement;
- position;
- travel time;
- local avoidance;
- formation execution;
- arrival;
- blocked reason.

## 23.1 Creature Navigation Profile

A creature family may expose:

- body envelope;
- step height;
- slope;
- jump;
- climb;
- wall-crawl;
- ceiling-crawl;
- burrow;
- squeeze;
- fly;
- glide;
- phase;
- door interaction;
- block-breaking capability;
- preferred terrain;
- fear/avoidance classes.

Set 30 executes those capabilities.

## 23.2 Same World Rules

AI creatures cannot:

- pass closed solid walls;
- cross impossible gaps;
- ignore bridge capacity;
- walk through buildings;
- teleport out of caves;

unless they possess an explicit capability.

---

# 24. Aquatic Movement Boundary

Set 26E owns detailed swimming/diving movement.

Document 10 owns:

- species aquatic capability;
- preferred depth;
- water habitat;
- schooling intent;
- hunt/flee intent;
- migration intent;
- beaching/air-breathing ecology where relevant.

Set 26E executes physical movement.

Set 26M extends marine ecology content.

---

# 25. Flying Creatures

Document 10 owns:

- flight eligibility;
- behavioural flight intent;
- nesting;
- migration;
- landing preference;
- flock intent.

Set 30 owns:

- takeoff execution;
- flight path;
- wind/gravity integration;
- collision;
- landing;
- movement authority.

## 25.1 Flying Mounts

When ridden:

- Document 10 retains creature identity/taming/needs;
- Set 28 supplies social/ownership permission where applicable;
- Set 29 supplies biological availability;
- Set 30E owns ridden flight.

---

# 26. Burrowing, Climbing and Unusual Locomotion

Creature family definitions may support:

- burrowing;
- tunnelling;
- wall climbing;
- ceiling traversal;
- squeezing;
- phasing;
- teleport-like movement;
- root movement;
- swarm flow.

World mutation remains authoritative.

A burrowing creature cannot destroy infinite terrain without:

- valid ability;
- material interaction;
- cost;
- environmental consequence.

---

# 27. Lifecycle

Lifecycle stages may include:

- egg;
- larva;
- juvenile;
- adolescent;
- adult;
- elder;
- cocoon;
- dormant;
- spectral;
- assembled;
- seasonal form.

Stages may affect:

- size;
- movement;
- behaviour;
- combat;
- breeding;
- taming;
- resources;
- presentation.

---

# 28. Reproduction and Recruitment

Population recruitment may occur through:

- mating/breeding;
- eggs;
- spores;
- budding;
- hive production;
- magical manifestation;
- assembly;
- necromantic creation;
- portal migration;
- transformation.

## 28.1 No Per-Frame Breeding

Distant wild populations use bounded demographic updates.

Tamed/important lineages may track individuals.

## 28.2 Breeding Conditions

May include:

- season;
- food;
- habitat;
- group size;
- nest;
- safety;
- health;
- magic;
- lifecycle stage;
- population cap.

---

# 29. Migration

Migration is a population movement between valid ranges.

Triggers may include:

- season;
- food;
- water;
- weather;
- breeding;
- predators;
- overpopulation;
- fire;
- settlement expansion;
- hunting;
- disease;
- realm event;
- magic.

## 29.1 Migration Intent

Document 10 generates:

- origin;
- destination habitat;
- group/population;
- timing;
- motivation;
- corridor preference.

Set 30/26E executes movement at the appropriate abstraction.

## 29.2 Migration Consequences

Migrations may create:

- hunting opportunity;
- road conflict;
- crop damage;
- predator movement;
- tourism/research;
- settlement festival;
- ecological recovery;
- trade change;
- boss event.

---

# 30. Nests, Dens and Territories

Runtime ecology sites include:

- den;
- burrow;
- nest;
- roost;
- colony;
- hive;
- herd ground;
- breeding ground;
- monster lair;
- spirit anchor;
- elemental source;
- construct facility.

## 30.1 State

Possible states:

- Active
- Dormant
- Seasonal
- Abandoned
- Damaged
- Flooded
- Collapsed
- Occupied by another family
- Cleansed
- Corrupted
- Protected
- Managed
- Destroyed
- Recovering

## 30.2 Clearing Is Not Respawn Reset

Removing a lair creates a vacancy.

Later outcomes may include:

- no reoccupation;
- same family returns;
- another predator arrives;
- settlement expands;
- invasive species occupies;
- restoration project.

---

# 31. Territorial Behaviour

Territories may protect:

- food;
- nest;
- juveniles;
- mineral source;
- mana source;
- ruin;
- sacred site;
- migration path.

Territoriality should be telegraphed through:

- tracks;
- calls;
- markings;
- remains;
- damaged vegetation;
- NPC reports;
- scent/visual clues;
- magic signs.

---

# 32. Predators

Predators should not universally attack on sight.

Behaviour depends on:

- hunger;
- prey availability;
- territory;
- injury;
- group;
- juveniles;
- player threat;
- distance;
- time;
- weather;
- wards;
- settlement danger.

## 32.1 Predator Counterplay

Possible counterplay:

- avoidance;
- light;
- fire;
- noise;
- fencing;
- guard animals;
- wards;
- bait;
- route planning;
- deterrents;
- relocation;
- hunting.

---

# 33. Apex Predators

Apex populations may regulate:

- medium predators;
- pests;
- grazers;
- carrion patterns.

Removing an apex may lead to:

- prey boom;
- crop pressure;
- smaller predator expansion;
- disease;
- replacement apex.

Killing the strongest creature is not automatically ecological improvement.

---

# 34. Scavengers and Decomposers

Scavengers/decomposers may:

- consume carcasses;
- reduce disease pressure;
- compete for harvest;
- distribute seeds;
- return nutrients;
- spread infection;
- create resources.

Carcass removal therefore has ecological consequences.

---

# 35. Pests and Vermin

Pests may target:

- crops;
- grain;
- timber;
- cloth;
- books;
- machines;
- mana conduits;
- ships;
- food storage.

Counterplay may include:

- sealed storage;
- predators;
- traps;
- sanitation;
- repellents;
- environmental management;
- magic;
- inspection.

---

# 36. Ambient Ecology

Not every ecology actor needs full creature AI.

Ambient representation may use:

- pooled insects;
- flock silhouettes;
- calls;
- tracks;
- burrows;
- shells;
- feathers;
- spores;
- shed skins;
- water ripples;
- mana trails.

These still resolve from ecology/population truth.

---

# 37. Livestock

Domestic species are authored relationships, not universal tame outcomes.

Livestock may provide:

- meat;
- milk;
- eggs;
- fibre;
- hide;
- manure;
- hauling;
- guarding;
- magical material;
- prestige;
- transport.

## 37.1 Culture

Different cultures may define different:

- breeds;
- feed;
- housing;
- slaughter customs;
- sacred protections;
- work roles;
- breeding policy;
- trade.

Document 13/24E owns cultural meaning.

---

# 38. Husbandry

Husbandry includes:

- ownership;
- shelter;
- feed;
- water/equivalent;
- group needs;
- breeding;
- handling;
- protection;
- training;
- work;
- health care;
- release;
- sale/transfer.

## 38.1 Anti-Chore Rule

Standard play should not require constant individual feeding clicks for hundreds of livestock.

Settlement facilities, pasture, feed systems and handlers provide scalable care.

---

# 39. Creature Biology Boundary

Set 29 is the universal biological-state authority for applicable living actors.

Creature definitions provide a `BiologicalProfile` reference.

Set 29 may then own:

- Health;
- Stamina;
- Fatigue;
- Hunger;
- Hydration;
- temperature;
- wetness;
- sleep;
- injuries;
- disease;
- toxins;
- treatment.

## 39.1 Lightweight Wildlife

Not every wild creature needs full Hunger/Sleep/Disease simulation.

24F/Document 10 may use ecology-level inputs for distant populations.

When an individual is promoted or relevant, Set 29 may instantiate appropriate biological detail.

## 39.2 Non-Biological Creatures

Constructs/spirits may opt out of biological channels.

Their maintenance/magical needs remain with their appropriate owner.

---

# 40. Welfare

Animal welfare is a creature-care concept that consumes actual biological state.

Welfare concerns may include:

- starvation;
- dehydration;
- injury;
- overwork;
- overcrowding;
- isolation;
- unsafe shelter;
- untreated disease;
- magical instability;
- fear;
- lack of species-appropriate environment.

Document 10 interprets these into:

- training reliability;
- breeding;
- productivity;
- escape;
- refusal;
- behaviour.

Set 29 owns the underlying biological condition where applicable.

---

# 41. Taming

Taming is not universal capture.

A 24F family declares one of:

- no taming;
- temporary calming;
- managed wild coexistence;
- livestock domestication;
- pet relationship;
- work-beast relationship;
- mount relationship;
- companion-capable;
- magical binding/summon only.

## 41.1 Taming Stages

**Eligibility**  
→ **Safe Contact**  
→ **Familiarity/Trust Process**  
→ **Training**  
→ **Ownership/Relationship Validation**  
→ **Role Qualification**  
→ **Ongoing Care**

## 41.2 Trust Boundary

For non-person animals, Document 10 may use a bounded animal familiarity/training value.

For recognised persons or socially complex companion entities, Set 28 owns Trust/Affection/Loyalty.

Do not duplicate Set 28 relationship dimensions.

---

# 42. Training

Training may improve:

- command reliability;
- handler response;
- fear tolerance;
- route familiarity;
- equipment acceptance;
- work capability;
- guarding;
- following;
- return-home behaviour.

Training does not grant physically impossible locomotion.

---

# 43. Pets

Pets may provide:

- household presence;
- morale;
- warning;
- companionship;
- minor utility;
- pest control.

Pets are not expected to become mandatory combat units.

---

# 44. Companions

A creature may become a companion through a creature adapter.

Set 28F owns:

- companion membership;
- companion agreement/autonomy;
- party role;
- social command intent;
- refusal/dismissal.

Document 10 owns:

- creature identity;
- species behaviour;
- animal training;
- ecology;
- creature-specific needs.

Set 30 owns physical following/formation.

---

# 45. Mounts

Document 10 owns:

- species mount candidacy;
- taming;
- care;
- creature identity;
- non-ridden behaviour;
- equipment compatibility tags.

Set 30E owns:

- mount/dismount;
- rider attachment;
- ground gait;
- mounted steering;
- ridden flight;
- mounted traversal;
- route performance.

Set 29 owns biological movement limitations.

Set 27 owns purchase/service value.

---

# 46. Work Beasts

Work animals may support:

- hauling;
- ploughing;
- logging;
- milling;
- guarding;
- pulling carts;
- mining assistance;
- lifting;
- pack transport.

Document 07 supplies ordinary settlement job context.

Set 30F owns towing/cart movement.

Document 10 owns animal eligibility/training/welfare.

---

# 47. Breeding

Breeding can preserve authored variation limits.

Traits may include:

- size;
- coat;
- horn;
- temperament tendencies;
- stamina modifiers;
- climate adaptation;
- work suitability;
- magical adaptation.

## 47.1 No Procedural Super-Creature Exploit

Breeding is bounded.

Players cannot stack every beneficial trait indefinitely unless a deliberately designed high-level system permits it.

---

# 48. Ownership and Transfer

Non-person creature ownership may be:

- individual;
- household;
- settlement;
- guild;
- faction;
- communal;
- wild-managed;
- protected;
- disputed.

Transfer may occur through:

- sale;
- gift;
- inheritance;
- adoption;
- settlement assignment;
- rescue;
- confiscation;
- theft;
- release.

Set 27 handles economic transaction.

Law/social systems handle legality/reputation.

---

# 49. Release and Rewilding

A tamed creature can be:

- released;
- retired;
- moved to sanctuary;
- transferred to managed wild population.

Release requires habitat suitability where relevant.

Dumping a non-native species may create invasive pressure.

---

# 50. Hunting

Hunting interacts with:

- population;
- season;
- law;
- ownership;
- animal behaviour;
- skill;
- weapon;
- tracking;
- carcass;
- resources;
- disease;
- economy;
- ecology.

## 50.1 Ethical/Legal Variation

Document 10 records the physical/ecological act.

Document 13/Set 28/27 interpret:

- law;
- taboo;
- ownership;
- social reaction;
- price.

---

# 51. Harvesting

Creature materials should have provenance.

Sources include:

- non-lethal collection;
- hunting;
- butchery;
- salvage;
- nest harvest;
- shed material;
- elemental condensation;
- spirit resolution.

## 51.1 No Generic Vendor Trash

Resources should connect to:

- food;
- crafting;
- medicine;
- alchemy;
- enchanting;
- construction;
- trade;
- research;
- ritual;
- ecology.

---

# 52. Non-Lethal Collection

Examples:

- milk;
- eggs;
- fibre;
- feathers;
- shed antlers;
- venom;
- honey;
- silk;
- spores;
- mana residue.

Requires:

- compatible family;
- season/cooldown;
- handling;
- ownership/permission;
- welfare;
- biological state;
- real Item/Resource output.

---

# 53. Butchery and Carcasses

Document 10 owns carcass/ecology source state.

Documents 04–06 own output identity.

Document 05 owns processing transformations.

Set 29 owns disease/toxin exposure.

Carcasses may support:

- harvesting;
- scavengers;
- disease;
- decomposition;
- necromancy;
- investigation;
- quest evidence.

---

# 54. Construct Salvage

Construct salvage requires:

- deactivation/destruction state;
- personhood check;
- ownership;
- repair potential;
- hazardous core handling;
- real components.

Awakened persons cannot be automatically dismantled as loot.

---

# 55. Creature Disease and Vector Boundary

Document 10/24F own:

- host susceptibility tags;
- reservoir tags;
- vector tags;
- creature source behaviour;
- ecological disease pressure;
- carcass shedding profile;
- parasite relationships.

Set 29F owns:

- exposure resolution;
- infection;
- incubation;
- disease state;
- toxin burden;
- treatment outcome.

## 55.1 Venom

Creature attack may submit:

- toxin definition;
- dose;
- route;
- attack/event ID.

Set 29 owns biological poison state.

---

# 56. Parasites

Parasites may affect:

- wildlife;
- livestock;
- people;
- plants;
- constructs where non-biological infestation is explicitly defined.

A biological parasite routes relevant biological consequences to Set 29.

A machine infestation may instead route to Document 08.

---

# 57. Magical Creatures

Document 09 owns magic.

Document 10 owns ecological behaviour/creature identity.

Examples:

- mana feeders;
- place spirits;
- fae fauna;
- dream fauna;
- spell-adapted wildlife;
- elementals.

Magic supplies:

- mana source;
- magical field;
- spell/status;
- ward response;
- corruption.

Document 10 decides ecological relationship.

---

# 58. Elementals

Elementals may depend on:

- heat;
- fuel;
- lava;
- water;
- storm;
- stone;
- metal;
- steam;
- sand;
- glass;
- magic.

Their body does not require ordinary biology.

Set 29 applicability may be partial or false.

---

# 59. Undead

Undead categories may include:

- mindless remains;
- bound workers;
- ghosts/echoes;
- undead animals;
- undead citizens.

Personhood is evaluated separately.

## 59.1 Undead Ecology

May depend on:

- battlefield residue;
- curse;
- necromancy;
- memory;
- remains;
- mana.

They can still produce ecological pressure.

---

# 60. Corrupted and Realm-Leak Creatures

Corruption variants require:

- source;
- transmission;
- altered behaviour;
- altered ecology;
- recovery/cleansing rules;
- resource consequences.

They should not simply be:

`normal creature × 2 damage`.

---

# 61. Constructs and Created Organisms

Classes:

- tool construct;
- guardian construct;
- maintenance fauna;
- awakened construct;
- created organism.

Document 09/08 may own construction/magical control.

Document 10 owns ecological/runtime creature behaviour where applicable.

Personhood check remains mandatory.

---

# 62. Dungeon Ecology

24G owns site generation/layout.

Document 10/24F supply:

- population layers;
- nest slots;
- feeding routes;
- habitat constraints;
- reoccupation;
- scavengers;
- parasites;
- guardians.

A dungeon is not an infinite monster dispenser.

---

# 63. Dungeon Reoccupation

After clearing, a site may:

- remain empty;
- be reclaimed by wildlife;
- be occupied by a faction;
- gain pests;
- be restored;
- be sealed;
- become settlement infrastructure;
- attract a new predator.

Reoccupation uses valid ecology/history.

---

# 64. Boss Ecology Boundary

24H owns complete major encounter content.

Document 10/24F own:

- boss ecological role;
- territory;
- population relationship;
- arrival/awakening source;
- evidence;
- succession;
- ecological aftermath.

Document 16 owns fight mechanics/damage.

---

# 65. Boss Alternatives

Where the authored boss permits, resolutions may include:

- avoid;
- wait;
- deter;
- redirect;
- rescue;
- heal;
- protect;
- bargain;
- communicate;
- seal;
- relocate;
- capture;
- kill;
- transform.

Not every boss is a murder objective.

---

# 66. Boss Aftermath

Boss outcome may alter:

- predator/prey;
- migration;
- crops;
- fisheries;
- settlements;
- routes;
- resources;
- weather;
- magic;
- faction state;
- dungeons;
- realm state.

Defeat does not automatically restore equilibrium.

---

# 67. Marine Ecology

Set 26M owns detailed marine ecology runtime extensions.

Document 10/24F provide shared family/system foundations.

Marine systems include:

- schools;
- reef ecology;
- fisheries;
- nursery grounds;
- predators;
- leviathans;
- migration;
- aquaculture;
- pollution;
- marine dungeons;
- boss ecology.

## 67.1 No Duplicate Sea Creature System

Set 26M extends Document 10.

It does not create independent creature identity rules.

---

# 68. Marine Bosses

Set 26M may implement Atlas hooks such as:

- Crown Reef Leviathan;
- Tidebreaker;
- Deepglass Whale;
- Drowned Continent Crab;
- Floodcaller Juvenile;
- Grave-Sea Procession;
- Pressure Titan;
- rare mature marine-species boss.

These remain governed by 24H/24F identity and Set 26 marine execution.

---

# 69. Fishing Boundary

Set 26M owns fishing gameplay.

Document 10 supplies:

- population;
- species;
- season;
- habitat;
- behaviour;
- ecological harvest pressure.

Fishing cannot create fish independent of population truth.

---

# 70. Ecology and Settlements

Settlements may:

- hunt;
- farm;
- tame;
- breed;
- protect;
- worship;
- regulate;
- exploit;
- conserve;
- eradicate;
- introduce;
- trade creatures.

Document 07 operates people/jobs.

Document 20 provides facilities.

Set 27 provides economic value.

Document 10 provides creature/ecology truth.

---

# 71. Farms and Agriculture

Creature relationships may include:

- pollination;
- grazing;
- crop damage;
- manure;
- pest control;
- feed demand;
- disease;
- fencing pressure.

A farm is part of ecology.

---

# 72. Roads and Routes

Creature populations may interact with routes through:

- migration crossings;
- carcass/scavenger areas;
- predation;
- pack animals;
- roadkill risk where implemented;
- wildlife corridors;
- guard/patrol pressure.

Set 30 owns physical route movement.

---

# 73. Automation

Automation may:

- attract creatures through noise/heat/waste;
- repel creatures;
- create infestation;
- automate husbandry;
- monitor populations;
- feed livestock;
- protect storage;
- operate humane deterrents.

Document 08 owns machine state.

Document 10 owns creature reaction.

---

# 74. Magic

Magic may:

- ward;
- summon;
- heal;
- corrupt;
- cleanse;
- communicate;
- bind;
- transform;
- attract;
- repel.

Document 09 owns magical effect.

Document 10 owns ecological response.

---

# 75. Economy

Set 27 owns:

- creature price;
- meat/hide price;
- livestock price;
- mount service cost;
- trophy value;
- scarcity value.

Document 10 supplies:

- population abundance;
- harvest availability;
- breeding output;
- disease pressure;
- ownership;
- committed resources.

## 75.1 Scarcity Comes from World State

If a creature becomes rare, Set 27 may reflect scarcity.

Document 10 does not set a price multiplier itself.

---

# 76. Social Knowledge and Rumours

Set 28C owns knowledge/belief.

Document 10 emits evidence:

- tracks;
- calls;
- sightings;
- nests;
- carcasses;
- migration;
- attack;
- rescue;
- rare variant;
- boss sign.

Set 28 decides what NPCs/players believe through its information systems.

---

# 77. Codex and Creature Research

Creature research may unlock:

- identification;
- tracks;
- habitat;
- diet;
- behaviour;
- counterplay;
- taming;
- harvest;
- medicine;
- cultural names;
- migration;
- boss ecology.

Document 02 owns progression rewards.

Set 28 owns knowledge records where appropriate.

Document 17 owns Codex UI.

---

# 78. Tracking

Tracking evidence may include:

- footprints;
- scat;
- feathers;
- fur;
- scratch marks;
- nests;
- calls;
- kills;
- disturbed vegetation;
- scent;
- magic residue.

Tracking should reveal probability/evidence, not spawn creatures for the player.

---

# 79. Variants

Allowed variation may include:

- age;
- size;
- sex where relevant;
- coat;
- pattern;
- horns;
- seasonal state;
- regional adaptation;
- health;
- magic exposure;
- scars;
- domestication;
- authored morph.

## 79.1 New Family Threshold

A variation that changes:

- core body plan;
- ecological niche;
- locomotion;
- personhood;
- major resource set;
- fundamental behaviour;

may require a new family rather than a variant.

---

# 80. Invasive Species

Invasion requires a cause:

- introduced livestock;
- trade;
- escaped captive;
- portal;
- realm leak;
- climate shift;
- settlement transport;
- deliberate release.

Consequences may include:

- competition;
- predation;
- crop loss;
- new resource;
- disease;
- habitat engineering.

---

# 81. Overhunting and Local Extirpation

Repeated harvest may reduce population.

Effects:

- fewer encounters;
- lost resource;
- predator movement;
- prey increase;
- settlement/economic change;
- conservation response.

## 81.1 Global Extinction

Global permanent extinction is not a casual default.

It requires:

- explicit high-consequence rules;
- settings support;
- strong warning;
- recovery/reintroduction consideration.

---

# 82. Recovery and Reintroduction

Recovery mechanisms:

- natural breeding;
- migration;
- protected habitat;
- reduced hunting;
- predator restoration;
- cleansing;
- reintroduction;
- sanctuary breeding;
- settlement conservation project.

Recovery takes time.

---

# 83. Ecological Events

Events may include:

- migration;
- population boom;
- predator arrival;
- pest outbreak;
- disease;
- breeding season;
- invasive spread;
- corruption bloom;
- stranded migration;
- mass beaching;
- spirit awakening;
- construct swarm;
- boss pressure.

Document 15 owns formal event lifecycle.

Document 10 supplies ecological condition/evidence.

---

# 84. Raids and Settlement Threats

The original goblin raid proved settlement consequences.

Production threats may come from:

- predators;
- siege creatures;
- pests;
- corrupted fauna;
- faction raiders/persons;
- boss pressure;
- invasive populations.

## 84.1 Person Raiders

Sapient raiders use faction/person systems.

They are not converted into non-person monster populations.

---

# 85. Non-Lethal Counterplay

Creature systems should support non-lethal options where appropriate:

- deterrence;
- fencing;
- warding;
- relocation;
- rescue;
- feeding management;
- habitat restoration;
- containment;
- calming;
- route avoidance;
- negotiation for persons;
- cleansing.

---

# 86. Player Freedom

A player can choose:

- hunter;
- naturalist;
- rancher;
- breeder;
- beast tamer;
- mount trainer;
- conservationist;
- monster hunter;
- magical ecologist;
- exterminator;
- rescuer;
- researcher.

No one path is mandatory.

---

# 87. Combat Boundary

Document 16 owns:

- attacks;
- hit detection;
- damage;
- defence;
- status application;
- downing/death;
- loot custody after death.

Document 10 owns:

- attack intent;
- threat behaviour;
- retreat;
- ecological reason for conflict;
- group intent;
- aftermath to population.

## 87.1 Death

When Combat commits death:

Document 10:

- updates population;
- creates carcass/remains source;
- updates group;
- updates nest;
- emits ecology evidence.

Set 29 handles biological death/conditions according to its contract.

---

# 88. Creature Attacks and Biological Hazards

Creature attacks may include:

- bite;
- claw;
- horn;
- venom;
- disease exposure;
- web;
- grapple;
- charge;
- elemental effect;
- magical effect.

Document 16 resolves combat action.

Set 29 resolves biological toxin/disease/injury where applicable.

Document 09 resolves magic.

---

# 89. Loot and Resource Conservation

A creature does not drop arbitrary unrelated loot unless:

- it carried that inventory;
- swallowed/stored it;
- nest contains it;
- magical transformation creates it;
- event/story explicitly justifies it.

Resources derive from real provenance.

---

# 90. Creature Inventory

Some creatures may carry:

- saddlebags;
- equipment;
- stolen goods;
- nest cargo;
- faction gear;
- magical focus.

Use authoritative inventory.

Death does not duplicate carried inventory and harvest resources.

---

# 91. Presentation and Forge

Entity Forge owns:

- body source;
- rig;
- skeleton;
- attachments;
- hitbox semantic markers;
- animation source.

Presentation Forge owns:

- VFX;
- audio;
- tracks;
- telegraphs;
- ambient sound.

Document 10 owns behaviour/ecology truth.

## 91.1 Readable Silhouette

Players should identify:

- harmless;
- territorial;
- predator;
- diseased;
- corrupted;
- juvenile-protective;
- boss;
- tame/owned

through multiple cues where possible.

---

# 92. Animation

Animation follows movement/combat/behaviour state.

Animation cannot:

- move actor independently;
- land an attack;
- change population;
- create harvest output.

---

# 93. Accessibility

Creature warnings should support:

- visual;
- audio;
- subtitle/caption;
- controller/haptic where supported;
- reduced flash;
- reduced motion;
- high-contrast indicator.

## 93.1 Phobia/Comfort Options

Where feasible, certain presentation categories may support alternative presentation without changing gameplay identity.

This must not hide critical threat information.

---

# 94. Difficulty Profiles

Difficulty/world settings may independently affect:

- aggression;
- damage via Combat;
- settlement pressure;
- disease incidence;
- breeding speed;
- resource yield;
- predator density;
- invasive pressure;
- boss frequency;
- extinction severity;
- taming difficulty.

Do not bundle all ecology depth into one punitive slider.

---

# 95. Ecology Simulation LOD

### E0 — Active Individual
- local actor;
- full behaviour intent;
- local senses;
- Set 30/26 movement;
- Combat;
- Set 29 biology where enabled.

### E1 — Local Group
- group-level coordination;
- simplified individual updates;
- exact important creatures.

### E2 — Habitat Population
- population count/bands;
- nests;
- food pressure;
- breeding;
- predation;
- migration intent.

### E3 — Regional Ecology
- family totals;
- carrying capacity;
- major pressures;
- migration corridors;
- notable identities.

### E4 — Dormant/Scheduled
- bounded milestones;
- no per-frame creatures.

---

# 96. LOD Invariants

LOD cannot change:

- persistent tame animal identity;
- boss identity;
- named creature identity;
- ownership;
- population conservation;
- committed births/deaths;
- migration;
- harvest;
- disease outbreak;
- nest destruction;
- ecological aftermath.

---

# 97. Promotion

Promoting a distant population into local actors selects individuals/groups consistent with:

- family total;
- age bands;
- variants;
- injuries/biology if persisted;
- ownership;
- nest;
- group state;
- notable identities.

Promotion cannot create extra animals.

---

# 98. Demotion

Demotion returns local state to:

- population totals;
- losses;
- births;
- notable individual records;
- nest state;
- migration;
- ecological pressure;
- carried/owned state.

No creature disappears merely because it is unloaded.

---

# 99. Distant Catch-Up

Catch-up may resolve:

- breeding;
- natural mortality;
- predation;
- disease;
- harvest;
- migration;
- invasive spread;
- recovery;
- nest state;
- ecology events.

Catch-up must be bounded and deterministic.

## 99.1 Offline Safety

Wall-clock offline progress should not silently cause extreme irreversible ecological disaster unless that behaviour is explicitly enabled and bounded.

---

# 100. Multiplayer Authority

Host/server owns:

- creature population;
- creature promotion;
- behaviour intent authority;
- taming state;
- animal ownership;
- breeding;
- harvesting;
- nest state;
- ecological events;
- migration;
- loot/resource commit.

Clients may render/predict safe presentation.

---

# 101. Save and Persistence

Persist:

- population records;
- notable creature identities;
- tame/owned animals;
- mounts/work beasts;
- nests;
- territories;
- migration;
- breeding;
- population trends;
- local extirpation;
- invasive populations;
- disease/ecology pressure refs;
- boss ecology refs;
- harvest pressure;
- ecology event history;
- source revisions.

---

# 102. Migration and Schema Evolution

Migration must support:

- old Document-10 IDs;
- POC creature IDs;
- old goblin “monster” classification;
- fixed POC spawn tables;
- fixed cave creature bindings;
- old tame-state fields;
- old movement ownership;
- old direct poison/disease state;
- old loot tables;
- old Unreal asset paths.

## 102.1 Personhood Migration

If a legacy creature is now a recognised person:

- retain stable identity where possible;
- route culture/faction/person records;
- disable livestock/taming/harvest rules;
- preserve inventory;
- preserve history.

---

# 103. Production Registries

Document 10 runtime registry families include:

- population profile;
- ecology relationship type;
- lifecycle profile;
- behaviour profile;
- senses profile;
- motivation profile;
- group profile;
- nest/territory runtime profile;
- encounter assembly profile;
- safe-zone response profile;
- taming/training profile;
- husbandry profile;
- ownership profile;
- harvest profile;
- carcass profile;
- invasive profile;
- ecology event profile;
- LOD profile;
- diagnostics.

Creature family content remains 24F-owned.

---

# 104. Diagnostic Codes

| Code | Meaning |
|---|---|
| `CRT-FAM-001` | Creature family ref missing/invalid. |
| `CRT-PERS-001` | Personhood classification conflict. |
| `CRT-HAB-001` | Habitat invalid. |
| `CRT-POP-001` | Population reconciliation failed. |
| `CRT-CAP-001` | Carrying-capacity relationship invalid. |
| `CRT-NEST-001` | Nest/territory state invalid. |
| `CRT-ENC-001` | Encounter has no valid source. |
| `CRT-AI-001` | Behaviour intent unresolved. |
| `CRT-MOVE-001` | Movement provider rejected route/action. |
| `CRT-AQUA-001` | Aquatic movement provider failure. |
| `CRT-BIO-001` | Biological profile/state mismatch. |
| `CRT-DIS-001` | Disease/vector interface invalid. |
| `CRT-TAME-001` | Taming not eligible. |
| `CRT-WEL-001` | Welfare requirement failure. |
| `CRT-OWN-001` | Ownership/custody conflict. |
| `CRT-HARV-001` | Harvest invalid/protected. |
| `CRT-RES-001` | Resource output provenance invalid. |
| `CRT-BOSS-001` | Boss ecology hook invalid. |
| `CRT-LOD-001` | LOD promotion/demotion mismatch. |
| `CRT-MIG-001` | Migration invalid. |
| `CRT-SAVE-001` | Persistence inconsistency. |
| `CRT-AUTH-001` | Unauthorised mutation. |
| `CRT-POC-001` | Retired POC dependency detected. |

---

# 105. Validation

## 105.1 Family Reference Validation

Every runtime family reference must resolve to 24F or an approved content-pack extension.

## 105.2 Personhood Validation

Fail if a recognised person is:

- tameable as livestock;
- harvestable as animal resource;
- sold through animal ownership without explicit person/legal contract;
- automatically hostile because of ancestry/body type.

## 105.3 Habitat Validation

A population requires compatible:

- biome/realm;
- climate;
- food/input;
- water/equivalent;
- nest/shelter;
- movement access;
- exclusions.

## 105.4 Population Validation

Check:

- births;
- deaths;
- harvest;
- migration;
- promotion/demotion;
- no negative population;
- no unexplained creation.

## 105.5 Encounter Validation

Normal creature encounter requires a valid source.

Debug/test-spawn commands are excluded.

---

# 106. Seed Testing

Representative seeds should test:

- biome ecology coverage;
- empty-region validity;
- predator/prey relationships;
- livestock availability alternatives;
- migration routes;
- cave ecology;
- magical ecology;
- realm ecology;
- marine handoff;
- invasive pressure;
- settlement conflict;
- safe-start threat bounds.

---

# 107. Core Production Ecology Packages

Set 25G defines four important Core ecology package networks.

## 107.1 Ambient and Indicator Ecology Web

Provides:

- pollinators;
- insects;
- tracks;
- sounds;
- water indicators;
- decomposers;
- minor resources;
- environmental clues.

## 107.2 Herd, Domestic and Work-Beast Ecology

Provides:

- prey;
- livestock;
- fibre;
- food;
- hauling;
- manure/fertiliser;
- migration pressure.

## 107.3 Predator, Scavenger and Pest Pressure

Provides:

- dynamic threats;
- settlement pressure;
- ecological regulation;
- harvesting resources;
- quests;
- warning clues.

## 107.4 Magical, Undead, Corruption and Construct Ecology

Connects:

- mana;
- ruins;
- corruption;
- death history;
- wards;
- created beings;
- repair/cleansing;
- personhood.

---

# 108. Production Content Scope

Atlas counts demonstrate breadth, not shipping readiness.

The existence of:

- 72 Overworld families;
- 60 realm families;

does not imply all are Core Production.

Set 25 classifies content into:

- Core Production;
- Early Access;
- Full Release;
- Later Expansion;
- Tooling Research;
- Archived Validation.

Document 10 runtime must support the complete Atlas model while individual content packages ship according to governance.

---

# 109. Realm Ecology

Each major realm should eventually support a complete ecology package.

24F's v0.1 target includes:

- at least five authored families per realm;
- ordinary ecology;
- specialists/rare family;
- dungeon fauna;
- apex/regional threat;
- society relationship;
- cross-realm consequence.

Document 14/24D owns realm laws.

Document 10 applies creature ecology under those laws.

---

# 110. Realm Adaptation

Realm-native fauna should not be recoloured Overworld animals.

They may have:

- non-standard feeding;
- gravity adaptation;
- dream/memory needs;
- magical embodiment;
- alternate lifecycle;
- realm-specific movement;
- unusual personhood.

---

# 111. Cross-Realm Migration

Creatures may cross realms through:

- stable portals;
- accidents;
- faction transport;
- migration event;
- boss event;
- ritual.

Cross-realm introduction may create:

- invasive ecology;
- trade species;
- adapted migrants;
- quarantine;
- conservation issue.

---

# 112. Ecology and History

Procedural history may explain:

- domestication;
- extinction;
- sacred species;
- abandoned breeding;
- invasive population;
- monster territory;
- ancient construct fauna;
- corrupted wildlife;
- migration routes.

Worldgen/history provides the context.

Document 10 persists current ecology.

---

# 113. Settlement Pressure

Ecology pressure may affect:

- Provisions;
- Safety;
- Work;
- Infrastructure;
- Health;
- Morale.

Document 20 owns the seven needs.

Document 10 emits factual pressure.

---

# 114. Creature Labour

Creature labour may support civilisation.

Examples:

- pack animal;
- plough animal;
- guard animal;
- messenger;
- mount;
- mill/power animal;
- mining animal;
- magical worker;
- construct.

Work task integrates with Document 07.

Movement integrates with Set 30.

---

# 115. Animal Facilities

Document 20 may provide:

- stable;
- pen;
- barn;
- pasture;
- coop;
- aviary;
- kennel;
- sanctuary;
- hatchery;
- veterinary/healing space;
- magical containment.

Document 10 supplies creature requirements.

A decorative pen does not automatically satisfy welfare.

---

# 116. Settlement Population and Animal Population Separation

A town population of 500 people is not the same record as:

- 200 chickens;
- 30 cattle;
- 12 horses;
- local wolf population.

People remain Document 07/24E.

Creature populations remain Document 10/24F.

---

# 117. AI and Future Bounded Intelligence

Creature behaviour may later consume bounded AI assistance.

Authoritative rules remain deterministic.

AI may propose:

- target;
- activity;
- behaviour style;
- adaptive response.

The game validates:

- family capability;
- knowledge;
- movement;
- combat;
- ecology;
- permissions.

AI cannot invent new creature powers.

---

# 118. Procedural Variation Boundary

Generated variation may select from authored compatible traits.

It must not randomly combine:

- wings;
- fire breath;
- telepathy;
- poison;
- armour;
- treasure;

without a coherent family definition.

---

# 119. Creature Forge Integration

Entity Forge can author:

- body plan;
- voxels;
- skeleton;
- rigs;
- locomotion clips;
- attack clips;
- sockets;
- equipment points;
- variants.

Gameplay definition remains separate.

## 119.1 Creature Creator

Future Creature Forge tooling may create a new family package.

Publication requires:

- stable ID;
- personhood classification;
- habitat;
- ecology;
- movement profile;
- biology profile;
- resources;
- behaviour;
- production validation.

---

# 120. Performance Budgets

Creature simulation can be expensive.

Optimise through:

- population abstraction;
- group agents;
- pooled ambient life;
- sensory query budgets;
- path request budgets;
- LOD;
- animation LOD;
- relevance;
- deterministic catch-up.

## 120.1 No Creature Per Region Node Explosion

Distant ecology should not instantiate every animal as a Godot node.

---

# 121. Low-End Computer Profiles

Low-end settings may reduce:

- visible herd size;
- ambient swarm particles;
- distant actor promotion;
- animation detail;
- sense update frequency;
- local group AI frequency.

They cannot alter:

- population truth;
- ownership;
- rare creature existence;
- boss existence;
- harvest history;
- migration history;
- ecological consequences.

---

# 122. Multiplayer Taming and Ownership

Multiplayer requires authoritative rules for:

- who owns the animal;
- who can command;
- who can ride;
- who can breed;
- who can harvest outputs;
- who can transfer/sell/release.

Socially complex companions may use Set 28 permissions.

---

# 123. Creature Save Safety

A save cannot contain:

- same tame animal duplicated;
- negative population;
- dead animal still active;
- harvested carcass regenerated;
- creature in two nests;
- mount owned by two mutually exclusive owners;
- boss duplicated;
- recognised person treated as harvestable animal.

---

# 124. POC Regression Fixture

The old POC may continue to validate:

- passive creature;
- livestock;
- night threat;
- cave creature;
- magical creature;
- raid;
- mini-boss;
- drops;
- settlement consequence;
- automation targeting;
- ward interaction;
- taming;
- save/load.

It must be isolated under Archived Validation.

---

# 125. Main-Document Reconciliation Requirements

| Document | Required Follow-On |
|---|---|
| 12 — Structures | Lairs, nests, pens, stables, sanctuaries and creature-access markers consume Document 10/24F. |
| 13 — Peoples/Factions | Explicit personhood and hostility boundary must supersede old “monster race” assumptions. |
| 14 — Dimensions | Realm ecology consumes 24F families and Document-10 runtime. |
| 15 — Quests/Events | Ecology conditions create event hooks; event runtime remains 15. |
| 16 — Combat | Creature attacks/death integrate with population and personhood boundaries. |
| 17 — UI/UX | Codex, tracking, taming, ownership and population warnings consume view models. |
| 18 — Technical | Implement population service, behaviour intent, adapters, LOD and persistence in Godot/Summer. |
| 19/20 | Settlement growth/building systems consume livestock, work beasts, pests and ecology pressure. |

---

# 126. Production Acceptance Criteria

Document 10 v1.0 is accepted when:

- [x] 24F is recognised as authored creature-family authority;
- [x] Document 10 owns reusable runtime mechanics rather than duplicating the Atlas;
- [x] the 72 Overworld + 60 realm foundations remain referenced, not mirrored;
- [x] POC creature/spawn assumptions are archived;
- [x] passive/livestock/predator/monster/magic/boss capability survives;
- [x] personhood is independent from hostility;
- [x] sapient peoples are protected from monster/taming/harvesting classification;
- [x] populations precede ordinary spawning;
- [x] nests/territories/migration are persistent;
- [x] ecology changes after hunting/settlement/magic/events;
- [x] creature AI owns intent only;
- [x] Set 30 owns terrestrial/aerial movement;
- [x] Set 26E owns detailed aquatic locomotion;
- [x] Set 29 owns applicable biological runtime;
- [x] Set 28 owns social companion/relationship truth;
- [x] Set 27 owns prices;
- [x] Document 16 owns combat resolution;
- [x] Set 26M extends marine ecology without duplicating creature identity;
- [x] harvesting uses canonical Item/Resource/Recipe definitions;
- [x] taming is not universal;
- [x] mounts retain creature identity while Set 30 owns ridden movement;
- [x] LOD conserves populations;
- [x] local depletion and recovery work;
- [x] global extinction is high-consequence only;
- [x] multiplayer/save safety is explicit;
- [x] Godot/Summer direction is current;
- [x] Document 12 can reconcile against a stable creature/ecology foundation.

---

# Appendix A — Population Record Template

```yaml
creature_population:
  population_id: creature_population:<ulid>
  family_ref: <24F_family_id>
  region_ref: region:<id>
  habitat_refs: []
  state: established
  population_model:
    count_or_band: <value>
    juvenile_band: <value>
    adult_band: <value>
    elder_band: <value>
  ecology:
    carrying_capacity_band: <value>
    food_input_band: <value>
    predator_pressure: <value>
    competition_pressure: <value>
    disease_pressure: <value>
    civilisation_pressure: <value>
    magic_pressure: <value>
    harvest_pressure: <value>
  sites:
    nest_refs: []
    territory_refs: []
  migration:
    migration_intent_ref: null
  notable_individual_refs: []
  trend: stable
  last_reconciled_world_time: <time>
  revision: 1
```

---

# Appendix B — Encounter Source Record

```yaml
creature_encounter_source:
  source_id: encounter_source:<ulid>
  source_type: population
  family_ref: <id>
  population_ref: <id>
  site_ref: <id>?
  world_position_or_area_ref: <id>
  activity: feeding
  group_profile_ref: <id>
  eligible_variant_refs: []
  world_context_revision: <rev>
  source_population_revision: <rev>
  encounter_seed: <stable>
```

---

# Appendix C — Behaviour Intent

```yaml
creature_behaviour_intent:
  intent_id: creature_intent:<ulid>
  creature_or_group_ref: <id>
  intent_type: flee
  target_ref: <id>?
  destination_context_ref: <id>?
  urgency: high
  motivation_refs:
    - threat
  prohibited_actions: []
  locomotion_capability_refs: []
  world_time: <time>
  source_revision: <rev>
```

Set 30/26E returns movement result.

---

# Appendix D — Taming Profile

```yaml
taming_profile:
  taming_profile_id: <qualified_id>
  eligibility: mount_capable
  personhood_allowed: false
  safe_contact_requirements: []
  familiarity_actions: []
  training_categories: []
  handler_skill_requirements: []
  equipment_compatibility_refs: []
  welfare_requirements: []
  ownership_modes: []
  breeding_allowed: true
  release_profile_ref: <id>
  social_adapter_required: false
```

Recognised persons fail the ordinary animal-taming profile.

---

# Appendix E — Harvest Profile

```yaml
creature_harvest_profile:
  harvest_profile_id: <qualified_id>
  methods:
    - nonlethal
    - carcass
  outputs:
    - resource_ref: <id>
      method: carcass
      provenance_required: true
      tool_capability_tags: []
      season_or_stage_constraints: []
  legality_tags: []
  ownership_required: false
  ecology_cost_profile_ref: <id>
  disease_exposure_refs: []
```

Physical Items/Resources are owned by Documents 04/06.

---

# Appendix F — Nest / Territory Record

```yaml
creature_ecology_site:
  ecology_site_id: <ulid>
  site_type: den
  family_refs: []
  population_ref: <id>
  world_site_ref: <id>
  state: active
  breeding_capacity: <value>
  stored_resource_refs: []
  juvenile_refs_or_band: <value>
  protection_state: <value>
  damage_state: <value>
  discovered_by_refs: []
  last_activity_world_time: <time>
  revision: 1
```

---

# Appendix G — Personhood Routing Matrix

| Being | Non-Person Creature Runtime | Person/Civilisation Runtime |
|---|---:|---:|
| Ordinary deer | Yes | No |
| Wolf | Yes | No |
| Domestic horse | Yes | No |
| Magical animal | Usually | Only if personhood says so |
| Mindless skeleton | Yes | No |
| Intelligent undead citizen | Creature body adapters possible | **Yes** |
| Tool golem | Yes/construct | No |
| Awakened golem | Creature/entity adapters possible | **Yes** |
| Spirit echo | Depends | Depends on personhood |
| Goblin citizen | No livestock/monster ownership | **Yes** |
| Goblin raider | Combat actor may use shared AI capabilities | **Yes** |
| Collective hive mind | Review | If collective personhood recognised |

---

# Appendix H — Ecology Cause and Consequence Examples

## H.1 Predator Removed

**Cause:** player heavily hunts apex predator.

Possible consequence:

- predator population declines;
- grazer population rises;
- crops suffer;
- pests/medium predators change;
- settlement requests emerge;
- reintroduction/protection becomes possible.

## H.2 Settlement Expansion

**Cause:** town clears forest.

Possible consequence:

- nest habitat falls;
- browser migration;
- urban scavenger increases;
- road-crossing incidents;
- new managed habitat project.

## H.3 Magical Corruption

**Cause:** mana accident.

Possible consequence:

- base population receives valid corrupted variant;
- breeding falls;
- magical predator arrives;
- Set 29 disease/toxin pressure changes;
- cleansing project can restore habitat.

---

# Appendix I — Cross-System Responsibility Quick Reference

| Question | Owner |
|---|---|
| Which creature family is this? | 24F |
| Is it a recognised person? | 24F/24E + personhood governance |
| How many exist in this region? | Document 10 runtime |
| Why is it hunting/fleeing/migrating? | Document 10 |
| Can it physically reach the target? | Set 30 / 26E |
| What is its Health/injury/disease state? | Set 29 where applicable |
| Did its attack hit? | Document 16 |
| What spell does it use? | Document 09 |
| What Item/Resource comes from it? | Documents 04/06 |
| How is carcass processed? | Document 05 |
| What is the meat/hide worth? | Set 27 |
| Does a person trust it / is it a companion? | Set 28 |
| Is the stable functional? | Document 20 |
| What lives in the dungeon? | 24F + Document 10 ecology; 24G site |
| How does the boss fight work? | 24H + Document 16 |
| Where did the population generate? | Document 11 + Atlas habitat |
| How is it modelled/animated? | Forge |
| How is runtime implemented? | Document 18 v1.0 |

---

# Appendix J — POC Migration Map

| Legacy POC Concept | Production Treatment |
|---|---|
| Passive forest animal | Generic compatible wildlife from 24F ecology package. |
| Livestock animal | Generated/domestic livestock family tied to settlement/culture. |
| Night monster | Night-active predator/monster capability, not guaranteed species. |
| Cave creature | Underground ecology family selected by habitat. |
| Forest Wisp | Magical creature capability retained only if approved as production family; fixed tutorial binding removed. |
| Goblin Raider | Person/faction actor if goblin is sapient; not non-person monster. |
| Goblin Captain | Faction/elite/boss combat role, not creature-personhood override. |
| Goblin Camp | 24E/24G faction site, not generic monster nest. |
| Raid | Document 15/16 faction or ecology event. |
| Creature Drop Table | Provenance-aware harvest/resource relationship. |
| Fixed POC spawn table | Population/habitat/source encounter assembly. |

---

# Appendix K — Definition of Done for Implemented Creature Foundation

The implemented creature system is not complete because an animal can wander and attack.

Production proof requires:

- 24F family definitions resolve through stable IDs;
- no duplicate creature-family catalogue exists in Document 10;
- representative biomes assemble coherent populations;
- normal encounters resolve from real sources;
- removing a nest changes local encounter pressure;
- hunting changes population;
- migration can restore or relocate populations;
- predators react to prey availability;
- settlement growth changes ecology;
- livestock use real ownership/care;
- taming rejects ineligible species;
- personhood rejects animal ownership/harvesting;
- mounts preserve creature identity while Set 30 owns movement;
- aquatic creatures use Set 26E;
- Set 29 handles applicable creature biology;
- creature venom/disease routes through Set 29;
- drops/resources use canonical registries;
- combat death updates ecology;
- dungeon inhabitants persist/reoccupy according to rules;
- boss outcome produces ecology aftermath;
- marine ecology integrates through Set 26M;
- LOD promotion/demotion conserves populations;
- named/tame creatures survive save/load;
- multiplayer cannot duplicate tames/harvests;
- low-end settings reduce representation, not ecology truth;
- POC fixture still works in Archived Validation;
- production worlds contain no fixed goblin raid/Forest Hamlet creature dependency.

---

# Completion Statement

**Document 10 v1.0 replaces the original POC-focused Creatures and Monsters system with Leyforge's production creature/ecology runtime contract.**

The Atlas now supplies the breadth of authored content.

Document 10 supplies the living mechanics.

That means:

- creatures are populations before they are spawn points;
- populations have habitat, food, migration and pressure;
- encounters have sources;
- hunting changes the world;
- livestock and work beasts belong to civilisation;
- taming requires suitability and care;
- mounts remain creatures even while ridden;
- disease/venom hand off to biology;
- movement hand offs to Set 30/26E;
- bosses have ecological aftermath;
- marine fauna remains part of the same creature identity system;
- sapient beings cannot be reduced to “monsters” because they are hostile.

The POC's passive animals, cave threats, magical creature, goblin pressure and settlement consequences remain useful capability proofs, but the fixed scenario no longer determines production creature content.

**Next foundation reconciliation dependency: Document 12 — Structures, Landmarks, Ruins and Procedural Structure Runtime v1.0.**
