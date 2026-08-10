# LEYFORGE

## 11 — Biomes, World Generation and Procedural World Assembly System

### Deterministic Topology, Climate, Terrain, Biomes, Procedural History, Site Placement, Progression Guarantees and Persistent World State

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Supersedes:** `11_Fantasy_Voxel_Civilisation_Sandbox_Biomes_and_World_Generation_v0_1` for active production direction  
**Primary Vision Authority:** `00_Fantasy_Voxel_Civilisation_Sandbox_Master_Game_Design_Bible_v1_0.md`  
**Primary Gameplay-Loop Authority:** `01_Fantasy_Voxel_Civilisation_Sandbox_Core_Gameplay_Loop_v1_0.md`  
**Physical Registry Inputs:** Documents `03–06 v1.0`  
**World Content Authority:** World Content Atlas, Document Set 24  
**Production Governance:** Document Set 25  
**Marine Worldgen Authority:** Document 26C, with fluid and dynamic marine-environment interfaces from 26B and 26D  
**Movement Consumer:** Document Set 30  
**Project Lead and Final Authority:** Ash

A production-scale world-generation authority for Leyforge defining how approved authored content becomes deterministic, coherent, explorable, persistent voxel worlds without relying on a fixed tutorial valley, mandatory settlement, named encounter, exact resource pocket or other proof-of-concept arrangement.

> **World Generation Statement**
>
> **Every normal Leyforge world is derived from a seed, a versioned world profile and approved content packs. Generation assembles authored families through deterministic topology, climate, geology, hydrology, magic, procedural history, civilisation, ecology, site-placement, route and progression-safety rules. Randomness selects among valid possibilities; it does not replace design constraints.**

> **Production World Rule**
>
> **The player is guaranteed viable capabilities and meaningful choices, not a specific story set-piece. A valid seed must provide survivable starts and reachable progression routes through category-equivalent resources, trade, salvage, knowledge, settlements, structures, routes or other approved providers without hardcoding the retired Forest Hamlet scenario.**

> **Generated Base + Persistent Delta Rule**
>
> **Seed-derived world identity is reconstructible. Player edits, settlement growth, extraction, destruction, restoration, disasters, ownership, ecology change, route changes and other history become persistent deltas or promoted runtime records. Updating a generator must not silently rewrite explored or stateful terrain.**

---

# Document Purpose

Document 11 is the production execution contract for turning Leyforge's authored World Content Atlas into playable worlds.

The World Content Atlas owns the identity and content contracts for regions, natural and special biomes, realms, peoples, ecology, dungeons, bosses, structures, resources, history and events. Document 11 does **not** duplicate those catalogues. It owns the shared world-generation orchestration required to select, place, connect, validate, materialise, persist and query those definitions in normal worlds.

This document therefore answers questions such as:

- how world seeds and derived seeds are used;
- how continents, regions, terrain provinces, watersheds and biome mosaics fit together;
- how climate, geology, hydrology and magical influence create coherent geography;
- how local voxel terrain is materialised from higher-level records;
- how settlements, structures, resources, ecological habitats, dungeons and routes receive valid placement contexts;
- how starting areas are validated without prescribing one opening scenario;
- how generated history shapes ruins, roads, faction presence and environmental states;
- how the game repairs an invalid seed through category-equivalent alternatives rather than hidden POC fallback;
- how explored terrain is protected across generator revisions;
- how nearby voxel detail and distant regional summaries coexist;
- how world-creation settings scale density, simulation and presentation without changing ownership boundaries; and
- how Set 26 marine world generation and Set 30 movement consume the same physical world without duplicating truth.

This is a **complete production replacement** of Document 11 v0.1. The original document's useful principles—biomes as gameplay systems, layered climate, cave depth, resources, civilisation suitability, dynamic biome states and readable landmarks—are retained. The controlled POC valley, fixed starter meadow, fixed village, exact cave/resource/camp relationships and other demonstration geography are archived as regression evidence only.

---

# 1. Locked System Identity

The Biomes, World Generation and Procedural World Assembly System is the physical-context authority for Leyforge's generated world.

It does not own every thing that exists in that world. Instead, it creates the spatial, environmental and historical context in which specialist-owned content can exist coherently.

> **Locked Rule — Generate Relationships Before Decoration**
>
> A biome, road candidate, ruin socket, settlement site, resource deposit, cave entrance, harbour candidate or boss territory must arise from compatible topology and relationships before local decoration is added.

## 1.1 What Document 11 Owns

Document 11 owns:

- common seed and derived-seed orchestration for terrestrial world generation;
- world-profile application to world-generation scope;
- world spatial hierarchy and generated record relationships;
- continental and terrestrial macro-topology execution;
- terrestrial terrain-province generation;
- terrestrial climate-field generation and baseline environmental fields;
- terrestrial hydrology and watershed assembly;
- terrestrial geological context;
- natural-surface biome mosaic assembly from Atlas definitions;
- shared generation staging and dependency order;
- general site-candidate generation and suitability handoff;
- category-based start and progression validation;
- deterministic repair/fallback orchestration;
- local terrain materialisation contracts;
- generated-base identity and explored-area freezing rules;
- world-generation diagnostics, provenance and validation evidence;
- generated terrain/topology interfaces consumed by routes, settlements, ecology, structures and movement;
- general dynamic-environment state hooks that do not belong to a specialist owner; and
- the common world-generation boundary into Godot/Summer implementation.

## 1.2 What Document 11 Does Not Own

Document 11 does not own:

- authored biome catalogues, region archetype identities or Atlas content rosters;
- final creature families, ecology behaviours or spawning algorithms owned by Document 10 / Atlas 24F;
- settlement simulation, population or household truth owned by Document 07 / 19 / 20 and Atlas 24E;
- structure definitions or building functionality owned by Documents 12 and 20 / Atlas 24I;
- resource identity, material progression or extraction transformation owned by Documents 03–06 / Atlas 24J;
- quest/event lifecycle or narrative ownership owned by Document 15 / Atlas 24K;
- combat threat execution owned by Document 16;
- final realm topology and realm-biome identity owned by Document 14 / Atlas 24D;
- water-liquid simulation owned by Document 26B;
- detailed marine topology, basin, coast, island, bathymetry and underwater generation owned by Document 26C;
- time-varying marine wind, wave, tide, current and storm state owned by Document 26D;
- mover-specific accessibility, path cost or travel time owned by Set 30;
- trade-route value or profitability owned by Set 27;
- player knowledge, rumours or route belief owned by Set 28; or
- biological exposure consequences owned by Set 29.

## 1.3 System Promise

A generated world should feel as if its geography, ecology, civilisations and history belong together.

The player should be able to infer useful facts from the world:

- rivers imply watersheds and downstream travel;
- mountains influence rain shadows, geology and routes;
- forests imply wood, ecology and settlement opportunities;
- wetlands imply water, food, disease/exposure context and difficult infrastructure;
- roads imply origin, destination, ownership or historical use;
- ruins imply a history and former function;
- ports require suitable coasts and water access;
- caves connect to geology and depth;
- magical regions require a source or history;
- dangerous territories show signs and leave aftermath; and
- settlements occupy places that could plausibly support them or clearly reveal how they overcome local constraints.

---

# 2. Source Authority and Supersession

| Source | Authority Consumed by Document 11 | Treatment |
|---|---|---|
| Document 00 v1.0 | Sandbox-first living-world vision, seed-generated production world, interconnected systems. | Governing vision. |
| Document 01 v1.0 | Flexible gameplay loop and capability-equivalent world starts. | Worldgen must provide multiple viable routes into play. |
| Document 02 v1.0 | Character progression does not replace world requirements. | Worldgen supplies discoverable opportunities, not character progression values. |
| Documents 03–06 v1.0 | Canonical Blocks, Items, Recipes and Resources. | Worldgen references canonical physical identities and resource-provider rules without duplicating them. |
| Document 07 | NPC settlements and living civilisation. | Worldgen supplies settlement contexts and generated site records; settlement simulation owns residents and growth. |
| Documents 08–09 | Automation and practical magic. | Worldgen supplies water, wind, geology, leylines, terrain and site context; specialist systems own networks and runtime effects. |
| Document 10 / Atlas 24F | Creature identity and ecology. | Worldgen supplies habitat, climate, terrain and population-space context. |
| Atlas 24A | Seed derivation, relationship graph, procedural history, progression safety, dynamic state and POC retirement. | Core production-generation doctrine. |
| Atlas 24B | Continents, macro-regions, climate, hydrology, landforms, twelve natural surface-biome families and ninety-six initial biome entries. | Authored terrestrial content authority. |
| Atlas 24C | Oceans, coasts, islands, skylands, underground and special Overworld biome identities. | Authored non-standard Overworld content authority. |
| Atlas 24D | Realm topology and realm biomes. | Realm content authority. |
| Atlas 24E–24K | Civilisations, ecology, dungeons, bosses, structures, resources, history/events. | Own final authored content selected into generated contexts. |
| Atlas 24L | Registry cross-links, completeness, content status, production roadmap. | Production integration boundary. |
| Set 25 | Stable IDs, schemas, package status, validation, migration, release evidence. | Governs production admission and validation. |
| Document 26B | Water Bodies and local liquid mechanics. | Document 11/26C generate water topology; 26B owns liquid behaviour. |
| Document 26C | Executable marine topology and generation. | Specialist worldgen authority for oceans/coasts/islands/underwater. |
| Document 26D | Dynamic marine environment. | Consumes generated climate/topology and owns live marine fields. |
| Set 27 | Economy and trade-route economics. | Worldgen may create routes and resource geography but never price them. |
| Set 28 | Social knowledge, rumours and belief. | World truth and known truth remain separate. |
| Set 29 | Biological survival and health. | Worldgen exposes temperature, water, hazard and environmental facts; biology calculates consequences. |
| Set 30 | Movement, traversal, route accessibility and travel time. | Document 11 exposes terrain/topology/route evidence; Set 30 resolves mover-specific execution. |
| Legacy Document 18 | Stable IDs, deterministic generation, seed-plus-delta persistence, LOD and validation. | Engine-neutral principles retained; Unreal direction discarded. |

## 2.1 Superseded POC Geography

The following are **not production generation requirements**:

- Forest Hamlet;
- the controlled POC valley;
- Hearthplain or any equivalent mandatory starter meadow;
- a guaranteed nearby village;
- the fixed watchtower site;
- fixed goblin-camp distance or orientation;
- fixed cave, mana pocket, rune ruin or portal teaser;
- a mandatory river/cave/ruin/camp relationship;
- a guaranteed Day-4 raid approach;
- fixed named villagers or settlement rosters;
- fixed tutorial roads; and
- any special-case seed check whose purpose is to recreate the old demonstration.

Their underlying reusable capabilities remain valid where specialist systems still support them.

---

# 3. Production World Principles

## 3.1 Authored Randomness

“Procedural” does not mean arbitrary.

World generation selects from authored definitions using:

- eligibility;
- compatibility;
- weighted preference;
- scarcity;
- adjacency;
- spacing;
- uniqueness;
- history;
- progression;
- world-profile settings;
- package availability;
- deterministic seed lineage; and
- validation.

## 3.2 Determinism

For the same:

- root seed;
- world profile;
- enabled content-pack set;
- generator version;
- registry versions; and
- unchanged generation inputs,

the unexplored generated base must reproduce the same authoritative output.

Presentation microvariation may be non-authoritative where it cannot change gameplay, saves, discovery or multiplayer truth.

## 3.3 Coherence Before Quantity

A smaller set of well-connected regions is preferable to a huge list of disconnected terrain skins.

Every production biome family should expose enough context for:

- terrain;
- climate;
- hydrology;
- resource opportunity;
- ecology;
- traversal;
- settlement suitability;
- structures/adventure;
- dynamic state;
- presentation;
- validation; and
- cross-system ownership.

## 3.4 No Universal Best Biome

Every biome can provide advantages and constraints.

Safe fertile areas may offer:

- reliable food;
- easy building;
- accessible water; and
- common materials,

while trading away:

- rarity;
- defensive terrain;
- special resources;
- secrecy; or
- magical opportunities.

Harsh areas may provide strategic resources, isolation or unique content, but must remain understandable and survivable according to world settings.

## 3.5 Travel Must Matter

World generation should create meaningful regional difference.

Travel matters because:

- resources are unevenly distributed;
- climates differ;
- cultures occupy and adapt to different regions;
- routes cross difficult terrain;
- seasonal access changes;
- dangers and opportunities are regional;
- ports and coasts connect distant economies;
- caves and vertical spaces create alternate movement networks;
- magic and realm access may be geographically concentrated; and
- player infrastructure can change effective distance.

## 3.6 Older Regions Stay Useful

Early or common regions remain relevant through:

- agriculture;
- settlement growth;
- construction;
- trade;
- restoration;
- transport hubs;
- culture;
- low-risk production;
- social ties;
- strategic routes; and
- player-created infrastructure.

---

# 4. World Definition and Runtime Record Separation

Leyforge separates authored definitions from generated instances and persistent state.

| Layer | Meaning | Example |
|---|---|---|
| World Profile Definition | Reusable rules for scale, climate, density, difficulty-facing generation and enabled systems. | Balanced, Gentle Builder, Wild Frontier. |
| Atlas Definition | Authored family or content contract. | A region archetype or biome definition. |
| Generated World Record | One seeded world instance. | `world:<ULID>` |
| Generated Region Record | Persistent instance selected from an Atlas family. | One named highland river basin. |
| Generated Biome Instance | One spatial biome mosaic or special-state region. | One cloud-forest belt. |
| Generated Site Record | Deterministic site opportunity/placement. | One ruin, cave entrance or settlement site. |
| Runtime State | Current mutable state. | Burned, flooded, occupied, depleted, restored. |
| World Delta | Persistent player/simulation alteration to generated base. | Excavation, road, destroyed bridge, altered riverbank. |
| Knowledge Record | What a player/faction believes or knows. | Map discovery or route confidence; owned outside world truth. |

> **No Duplicate World Truth**
>
> A generated instance may reference an Atlas definition, but the definition does not become a mutable save object and the runtime instance does not become a new authored definition.

---

# 5. Seed Architecture

## 5.1 Root Seed

Each world has one authoritative root seed.

The player may enter a numeric or text seed where supported. World creation resolves that input into a stable root seed representation.

## 5.2 Derived Seeds

Generation stages derive scoped seeds from stable keys rather than consuming one global random stream.

Recommended derivation dimensions include:

- world ID;
- root seed;
- generator version;
- stage ID;
- realm/world layer;
- continent/region coordinates;
- generated record ID;
- content family ID;
- sub-stage ID; and
- explicit variant salt.

This prevents unrelated generation additions from needlessly shifting every downstream choice.

## 5.3 Seed Lineage

Every persistent generated record should be able to identify enough provenance to explain:

- which world generated it;
- which generation version produced it;
- which definition family it resolved from;
- which stage created it;
- what repair/fallback changed it, if any; and
- whether it is still reconstructible or has been frozen.

## 5.4 Deterministic Repair

Validation repair must also be deterministic.

An invalid candidate does not permit:

- an arbitrary runtime reroll;
- player-targeted secret placement;
- hidden spawning of a named POC substitute; or
- nondeterministic “try until something works” behaviour.

Repair uses ordered, recorded fallback rules.

---

# 6. World Spatial Hierarchy

The Overworld is assembled in nested spatial layers.

| Scale | Purpose |
|---|---|
| World | Root save, world profile, seed lineage and enabled content packs. |
| Major Landmass / Ocean Basin | World-scale topology and broad circulation/geographic separation. |
| Macro-Region | Large coherent climate/terrain/history area. |
| Watershed / Marine Region | Connected water and drainage context. |
| Terrain Province | Dominant landform/geology/traversal context. |
| Biome Mosaic | Local ecological and environmental composition. |
| Territory | Political/ecological/creature ownership overlay; specialist-owned state may change. |
| Site | Settlement, ruin, dungeon, resource field, structure, boss territory, landmark or other generated opportunity. |
| Chunk / Local Voxel Area | Materialised terrain and local interactive world. |
| Dynamic Overlay | Fire, flood, corruption, warding, civilisation, extraction, restoration or other state. |

The hierarchy is a relationship model, not a requirement that every layer use the same runtime grid size.

---

# 7. World Profile and World-Creation Inputs

World creation chooses a profile plus optional overrides.

A profile may influence:

- world scale;
- land-to-water balance;
- continent fragmentation;
- terrain drama;
- climate spread;
- season strength;
- settlement density;
- structure/adventure density;
- ecology pressure;
- resource distribution;
- magic prevalence;
- corruption/anomaly prevalence;
- route density;
- maritime prominence;
- cave/underground prominence;
- skyland prominence;
- starting-region tolerance;
- simulation complexity;
- event density;
- regeneration/change intensity; and
- performance/scalability targets.

## 7.1 Settings Do Not Rewrite Ownership

A setting may scale or enable a system, but it does not transfer ownership.

Examples:

- “Low biological survival complexity” is still consumed from Set 29.
- “Low civilisation simulation” still leaves settlement identity with its owner.
- “Reduced movement simulation” still leaves route accessibility with Set 30.
- “Simplified maritime environment” still leaves marine fields with Set 26.
- “Sparse magic” still leaves magic effects with Document 09.

## 7.2 Capability Preservation

A world profile may make a capability rarer or harder to access, but an ordinary valid world must not accidentally dead-end required baseline progression unless the player explicitly selects a challenge profile that permits such failure.

---

# 8. Generation Pipeline Overview

The production generation pipeline is staged.

A recommended high-level order is:

1. validate world profile and enabled packs;
2. resolve root seed and generation versions;
3. create broad world topology;
4. create terrestrial landmass structure and marine basin skeleton;
5. establish elevation/terrain-province context;
6. establish climate baselines;
7. generate watersheds, rivers, lakes and connected-water interfaces;
8. establish geological provinces and deep-layer context;
9. establish baseline magical/extraordinary fields from valid sources;
10. assemble macro-regions;
11. resolve natural biome mosaics;
12. invoke specialist non-standard generation such as marine, skyland, underground and special-biome contracts;
13. generate procedural history;
14. create civilisation/faction suitability and history contexts;
15. create route and infrastructure candidates;
16. create resource, ecology, structure, dungeon, boss and settlement content sockets;
17. select compatible authored content through Atlas relationships;
18. validate progression, ecology, civilisation and reachability;
19. deterministically repair invalid relationships;
20. choose valid world-start candidates;
21. freeze generated records required for discovered/stateful areas;
22. materialise local voxel terrain as chunks are required;
23. attach runtime state and simulations; and
24. preserve persistent deltas rather than regenerating changed world state.

Specialist generators may insert additional internal stages while respecting this dependency order.

---

# 9. Terrain and Landform Generation

## 9.1 Terrain Is Structured Before Local Noise

Terrain generation begins with meaningful large-scale structure such as:

- mountain systems;
- plateaus;
- basins;
- plains;
- escarpments;
- canyons;
- volcanic arcs;
- glacial forms;
- rifts;
- river valleys;
- coastal margins; and
- special-history landforms.

Local variation adds detail without destroying the large-scale identity.

## 9.2 Buildability

Dramatic terrain is allowed.

Buildability does not mean every area must be flat. Instead, a region may offer:

- natural terraces;
- ridges;
- sheltered basins;
- cliff ledges;
- valley floors;
- islands;
- bridgeable gaps;
- tunnel opportunities;
- stilts;
- retaining structures;
- carving;
- floating construction; or
- other engineering solutions.

## 9.3 Terrain Practicality Fields

Generated terrain should expose world-facing facts such as:

- elevation;
- slope;
- surface material;
- soil depth;
- substrate;
- cliff/ledge context;
- stability class where relevant;
- water proximity;
- flood exposure;
- route-crossing opportunity;
- excavation context;
- support/foundation context;
- vegetation density;
- hazard overlays; and
- relevant magical/environmental modifiers.

These are facts for specialist consumers. Document 11 does not determine the final building, movement or biological outcome by itself.

---

# 10. Climate Foundation

Atlas 24B establishes deterministic multi-field climate using:

- temperature;
- moisture;
- seasonality;
- continentality;
- altitude;
- exposure;
- storm pressure;
- hydrology; and
- justified magical influence.

Document 11 executes and publishes compatible baseline terrestrial fields.

## 10.1 Climate Coherence

Climate must explain broad geography.

Examples:

- mountain ranges create altitude and rain-shadow effects;
- large water bodies moderate nearby climate where the profile supports it;
- wetlands require water/hydrology support;
- arid basins require moisture explanation;
- snow/ice correlates with temperature, altitude and season;
- magical climate anomalies require a source, history or Atlas rule.

## 10.2 Climate Versus Weather

Document 11 owns baseline climate/topology context.

Live weather belongs to the appropriate environmental owner and technical implementation. For maritime areas, Document 26D explicitly owns time-varying marine wind, waves, tides, currents, storms, fog and ice state.

## 10.3 Seasons

Worldgen definitions may expose:

- season length;
- temperature ranges;
- precipitation tendency;
- snow/ice eligibility;
- flood/drought tendency;
- vegetation seasonality;
- migration context; and
- route seasonality.

The downstream owning systems determine actual crop, creature, survival, economy or movement effects.

---

# 11. Hydrology and Inland Water

Terrestrial hydrology connects:

- drainage basins;
- rivers;
- tributaries;
- lakes;
- springs;
- wetlands;
- waterfalls;
- floodplains;
- deltas;
- estuaries; and
- groundwater/aquifer context where supported.

Water should not be painted independently after terrain generation.

## 11.1 River Rules

Rivers should generally:

- originate from plausible watershed context;
- follow terrain;
- join other water bodies;
- create crossings and route opportunities;
- influence soil and settlement suitability;
- provide environmental/resource context;
- support downstream structures and histories; and
- connect to 26C/26B water records when they become persistent Water Bodies.

## 11.2 Water Authority Boundary

Document 11 may create terrain and connected-water topology.

Document 26B owns:

- actual liquid volume;
- containment;
- flooding;
- local fluid islands;
- displacement;
- local liquid persistence; and
- fluid queries.

Document 26C owns the executable large marine/connected-water generation contracts that specialise the world-generation model.

---

# 12. Geology, Underground and Deep Context

The underground is not merely surface terrain with caves punched through it.

World generation establishes:

- geological provinces;
- depth bands;
- strata;
- faults;
- volcanic/thermal context;
- ore/mineral suitability;
- aquifers;
- cave-system potential;
- ancient excavation/history;
- magical deep influences; and
- deep special-region interfaces.

Atlas 24C owns underground and special-biome identities.

Document 11 provides the common terrestrial/deep context and invokes the specialist content definitions rather than recreating their catalogue.

## 12.1 Cave Connectivity

Caves may include:

- local caverns;
- tunnel networks;
- vertical shafts;
- underground rivers;
- deep regions;
- ancient mines;
- natural chambers;
- creature habitats;
- settlement possibilities;
- dungeon interfaces; and
- realm/magical anomalies where valid.

## 12.2 Reachability

A cave can be dangerous, hidden or progression-gated, but required progression content may not be accidentally impossible due to:

- sealed entrances with no alternative;
- unreachable vertical placement;
- incompatible tools;
- impossible water/pressure state;
- overlapping protected structures; or
- contradictory dungeon locks.

---

# 13. Natural Surface Biome Assembly

Atlas 24B is the authored authority for **twelve major natural surface-biome families and ninety-six initial biome entries**.

Document 11 does not reproduce those entries as a second editable registry.

Instead, each biome candidate is selected using:

- climate ranges;
- terrain province;
- hydrology;
- substrate/geology;
- altitude;
- exposure;
- adjacency;
- history;
- magic;
- civilisation effects;
- rarity;
- world-profile tags; and
- compatible content-pack status.

## 13.1 Biome Mosaic Rule

Large regions should be mosaics rather than hard single-biome rectangles.

A macro-region can contain:

- dominant biomes;
- secondary biomes;
- riparian strips;
- wetlands;
- ridge/altitude variants;
- ecotones;
- clearings;
- cliffs;
- water edges;
- disturbed/civilised states; and
- rare special overlays.

## 13.2 Ecotones

Biome transitions should be meaningful where practical.

Transitions may change:

- vegetation density;
- ground palette;
- soil;
- humidity;
- snow cover;
- water behaviour;
- creature habitat;
- resource clues;
- route cost;
- civilisation suitability; and
- ambience.

They should not require every boundary to blend over enormous distances.

## 13.3 Biomes Are Gameplay Context

A biome should provide one or more meaningful contributions to:

- survival;
- gathering;
- building;
- automation;
- magic;
- civilisation;
- trade;
- traversal;
- ecology;
- adventure;
- restoration;
- defence; or
- world history.

---

# 14. Special, Magical, Ancient and Transformed Overworld Environments

Atlas 24C owns strongly magical, corrupted, ancient, blessed, realm-leaking, dream-touched, gravity-altered, machine-altered and other special Overworld identities.

Document 11 supports them through one of two patterns:

1. **Overlay:** the base biome remains recognisable and an additional state modifies it.
2. **Dedicated Biome/Region:** the transformation is deep enough to require its own terrain/ecology/environment contract.

## 14.1 Source Requirement

Exceptional environments require a valid source such as:

- leyline/node;
- ancient structure;
- historical catastrophe;
- realm leak;
- ritual;
- boss influence;
- corruption source;
- blessing;
- machine complex;
- colossal remains; or
- persistent world event.

They do not appear solely because a noise field crossed a threshold.

## 14.2 Dynamic Examples

Potential state families include:

- burned;
- flooded;
- drought;
- overharvested;
- blighted;
- corrupted;
- warded;
- blessed;
- civilised;
- war-damaged;
- reclaimed;
- restored;
- abandoned;
- polluted/contaminated where supported;
- realm-touched; and
- machine-altered.

The actual causes/effects remain owned by the relevant gameplay systems.

---

# 15. Oceans, Coasts, Islands and Underwater Generation Boundary

Document 26C supersedes Document 11's old broad/POC-limited marine generation assumptions.

Document 26C owns executable generation for:

- ocean basins;
- seas;
- Marine Regions;
- Water Body graph integration;
- bathymetry;
- shelves;
- slopes;
- trenches;
- Coast Segments;
- islands;
- inland-water integration;
- estuaries and deltas;
- underwater terrain;
- marine habitat/content sockets;
- harbour suitability;
- navigability corridors;
- marine route context;
- persistent generated marine records; and
- specialist marine validation.

> **Marine Boundary Rule**
>
> Document 11 coordinates the whole world-generation dependency graph; it does not re-run marine generation through a second terrain/noise system.

## 15.1 Shared Inputs

Document 26C consumes terrestrial/world inputs such as:

- landmass structure;
- climate;
- geology;
- watershed/rivers;
- history;
- magic;
- world profile; and
- seed lineage.

It returns stable marine/world-facing records that other systems consume.

## 15.2 Dynamic Marine State

Document 26D owns live:

- wind;
- waves;
- swell;
- tides;
- currents;
- storms;
- surge;
- fog;
- visibility;
- sea ice; and
- extraordinary marine weather.

Document 11 must not calculate a competing live weather state for marine gameplay.

---

# 16. Skylands and Aerial Provinces

Atlas 24C establishes skylands as connected aerial provinces rather than decorative floating rocks.

Worldgen context may include:

- altitude bands;
- floating terrain;
- cloud layers;
- wind corridors;
- updrafts;
- aerial bridges;
- debris chains;
- waterfalls;
- aerial structures;
- settlements;
- ecology;
- routes;
- resource contexts;
- magical/gravity sources; and
- high-altitude hazards.

Set 30 owns whether a particular mover can traverse those environments.

## 16.1 Aerial Connectivity

Generated aerial spaces should include enough context for valid access methods such as:

- climbing;
- gliding;
- mounts;
- lifts;
- towers;
- air-capable transport;
- portals;
- constructed bridges; or
- other specialist capabilities.

A content package that requires an aerial capability must expose how that capability can be acquired or substituted.

---

# 17. Procedural History

Worlds should contain evidence of a past that explains their present.

Procedural history may influence:

- abandoned roads;
- destroyed bridges;
- ruins;
- old settlements;
- migration;
- graves/battlefields;
- former borders;
- faction claims;
- sacred sites;
- resource depletion;
- ancient mines;
- changed rivers;
- magical scars;
- lost infrastructure;
- boss territories;
- wrecks; and
- settlement age/style.

## 17.1 History Is Constrained

History generation must use valid actors and world conditions.

It may not invent:

- a culture that is not enabled;
- a technology that the culture/package cannot support;
- a battle in an unreachable location without route context;
- a drowned city with no water-history explanation;
- a magical disaster without a valid source; or
- a ruin whose structure family is unavailable.

## 17.2 History Becomes Evidence

Generated history should leave one or more of:

- structures;
- terrain deltas;
- resource state;
- ownership claims;
- names;
- roads;
- artefacts;
- graves;
- ecological change;
- faction memory;
- rumours; or
- event records.

Atlas 24K and specialist systems own the authored history/event content; Document 11 provides the generated spatial binding and provenance.

---

# 18. Civilisation, Settlement and Territory Placement

Worldgen does not generate “a village” as a decorative object.

It provides valid settlement contexts.

A settlement candidate may consider:

- water;
- food potential;
- terrain;
- climate;
- construction materials;
- jobs/resource economy;
- route access;
- danger;
- defensibility;
- culture adaptation;
- existing territory;
- magic;
- history;
- nearby structures;
- port/harbour potential where relevant; and
- world-profile density.

Document 07/19/20 and Atlas 24E own the settlement and its living state.

## 18.1 No Ancestry-Biome Lock

Ancestry does not biologically dictate:

- habitat;
- morality;
- technology;
- profession; or
- settlement eligibility.

Cultures may have preferences, adaptations and architectural requirements, but migration and mixed settlements remain possible.

## 18.2 Settlement Validation

Where a world profile requires generated civilisation access, candidate settlements must have a viable combination of:

- water;
- provisions;
- work;
- access;
- safety model; and
- supporting physical context.

Validation may reposition, substitute archetype or adjust surrounding suitability; it may not conjure a fixed POC hamlet.

---

# 19. Resources, Deposits and Material Ecology Placement

Document 06 owns resource progression and provider identity.

Document 11 supplies generated environmental source context.

Resource placement may depend on:

- geology;
- biome;
- depth;
- climate;
- hydrology;
- ecology;
- magical field;
- history;
- settlement extraction;
- renewability;
- rarity;
- deposit scale; and
- world-profile settings.

## 19.1 Provider Categories

Worldgen can provide:

- surface gatherables;
- renewable ecology;
- hand-mined veins;
- large deposits;
- agricultural sources;
- creature-linked sources;
- salvage sites;
- trade-linked regional availability;
- magical sources;
- realm-linked sources; and
- conditional transformed sources.

## 19.2 No Named-Resource Dead End

If progression requires a capability, validation should check the **capability/provider category**, not merely demand one exact named deposit near spawn.

Approved alternatives may include:

- different material;
- trade;
- salvage;
- settlement specialist;
- structure;
- renewable source;
- recipe substitution;
- magical provider; or
- later route access,

where Documents 02, 05 and 06 permit them.

---

# 20. Structures, Landmarks, Dungeons and Boss Context

Document 11 creates context-rich placement opportunities.

The final authored definitions belong to Atlas 24G–24I and their main-document owners.

## 20.1 Placement Context

A site candidate can expose:

- terrain bounds;
- slope/elevation;
- biome;
- substrate;
- water;
- route relation;
- nearby settlement;
- territory;
- danger;
- history;
- magical state;
- structure spacing;
- dungeon access;
- resource context;
- visibility/discovery profile; and
- protected-anchor requirements.

## 20.2 Landmark Purpose

Landmarks support:

- navigation;
- curiosity;
- resource clues;
- cultural identity;
- threats;
- routes;
- stories;
- magic;
- settlement orientation; and
- memorable seeds.

## 20.3 Boss Territory

A boss or titan territory should have:

- compatible habitat;
- signs/evidence;
- spatial footprint;
- pressure on nearby systems;
- access;
- encounter alternatives where authored;
- aftermath; and
- reward/world-change relationships.

Document 16/24H owns the actual encounter.

---

# 21. Roads, Routes and Physical Connectivity

World generation may create:

- natural passes;
- river crossings;
- historical roads;
- settlement road candidates;
- ancient roadlands;
- cave connections;
- coastal approaches;
- navigable corridors;
- aerial connections;
- realm-interface anchors; and
- route landmarks.

Document 20D / structure owners define physical infrastructure.

Set 30 owns mover-specific:

- route accessibility;
- traversal cost;
- route selection;
- travel time; and
- execution.

Set 27 owns economic use/profitability of trade routes.

## 21.1 Route Truth Versus Route Knowledge

The physical route can exist even if the player does not know it.

Set 28 and UI/knowledge systems may expose:

- rumours;
- map confidence;
- misinformation;
- learned hazards; and
- known destinations.

Document 11 remains physical world truth.

---

# 22. Ecology and Creature Habitat

Document 10 / Atlas 24F owns creature families and ecology.

Document 11 exposes:

- habitat;
- temperature;
- moisture;
- vegetation;
- water;
- caves;
- depth;
- prey/producer opportunity;
- migration corridors;
- territory space;
- nest/lair sockets;
- human/civilisation pressure;
- magical influence; and
- dynamic environmental state.

## 22.1 Ecology Validation

Major generated creature populations should not appear without plausible support.

Validation can:

- reduce population;
- add compatible producer/prey context;
- move the habitat;
- choose a different creature family; or
- leave the ecological slot empty if the package allows it.

It should not spawn unrelated food or prey solely to support a creature that failed its habitat contract.

---

# 23. Magic, Leylines and Extraordinary Fields

Document 09 owns magic rules.

Document 11/Atlas world generation may create:

- leyline paths;
- nodes;
- mana-density fields;
- magical-site suitability;
- realm-thin areas;
- ancient magical scars;
- corruption source sockets;
- ward-friendly contexts; and
- magical resource opportunities.

## 23.1 Source-of-Magic Rule

A magical environmental state must reference a valid source or history.

Worldgen does not independently decide spell effects, ritual costs, mana-network behaviour or corruption formulas.

## 23.2 Magic Discovery Progression

Where a world profile expects magic to be discoverable, validation requires at least one valid category-equivalent path such as:

- magical resource;
- ruin;
- teacher/specialist;
- creature;
- structure;
- event;
- book/research route; or
- realm-linked clue,

subject to the owning systems' unlock rules.

---

# 24. World Start Generation

A new normal production world begins from a valid generated location, not a fixed scripted valley.

## 24.1 Start Candidate Requirements

A standard start should evaluate:

- immediate hazard escape;
- basic gathering;
- basic shelter/buildability;
- food or equivalent survival route;
- basic tool/material route;
- reachable terrain;
- no unavoidable lethal environmental trap;
- enough nearby variety to support meaningful choice; and
- profile-specific tutorial/accessibility constraints.

## 24.2 What Is Not Guaranteed

A start does not require:

- a village;
- a road;
- a cave entrance in sight;
- copper;
- iron;
- mana crystal;
- a ruin;
- a hostile camp;
- a river;
- a specific biome;
- a specific creature;
- a specific quest; or
- a fixed cardinal arrangement.

## 24.3 Capability Guarantees

The world may instead guarantee categories such as:

- `start.basic_gathering`;
- `start.shelter`;
- `start.food_or_equivalent`;
- `progress.early_tools`;
- `progress.automation_path`;
- `progress.magic_discovery`;
- `civilisation.access` when required by profile;
- `route.escape`;
- `hazard.recovery`; and
- `realm.accessible` when a realm route is mandatory for the selected content profile.

---

# 25. Progression Validation and Deterministic Repair

The world-generation validator runs after major stages and before a world is accepted.

## 25.1 Canonical Validation Families

| Validation | Pass Condition | Deterministic Repair Examples |
|---|---|---|
| `spawn.survivable` | Gathering, shelter, food/equivalent and hazard escape exist. | Choose another start candidate; expose equivalent resource; adjust local hazard. |
| `progress.early_tools` | At least one valid early material/trade/salvage/teaching route. | Add equivalent provider or route clue. |
| `progress.magic_discovery` | At least one valid magic-discovery path if enabled/required. | Place category-equivalent eligible provider. |
| `progress.automation` | Mechanism materials, knowledge and power opportunity exist through at least one path. | Substitute deposit/trade/salvage/power context. |
| `civilisation.viable` | Required settlement access has basic water/food/work/route/safety model. | Reposition site or select another archetype. |
| `ecology.viable` | Major populations have habitat/support. | Reduce/move/substitute ecological package. |
| `dungeon.reachable` | Entrance and required route are physically valid. | Adjust entrance, terrain, lock or alternate path. |
| `boss.coherent` | Boss territory has context, signs, objective and aftermath. | Choose another boss/site or lower scope. |
| `realm.accessible` | Required realm route has at least one valid access chain. | Select alternate anchor/ritual/faction route. |
| `distribution.healthy` | Density, spacing, rarity and uniqueness are within profile. | Replace/move/reduce candidates. |
| `poc.absent` | No retired POC IDs/names/hooks are in shipping generation. | Fail build and remove/test-namespace content. |

## 25.2 Repair Cannot Override Specialist Rules

A repair cannot:

- invent an item that Document 04 does not define;
- bypass a recipe requirement from Document 05;
- create a resource provider Document 06 prohibits;
- create a settlement unsupported by its owner;
- ignore aquatic ownership from Set 26;
- bypass movement capability from Set 30; or
- change biological survival rules from Set 29.

---

# 26. Dynamic World State

The generated base is not the final state forever.

The world may change through:

- seasons;
- fire;
- flood;
- drought;
- erosion where supported;
- extraction;
- regrowth;
- farming;
- settlement expansion;
- roads;
- bridges;
- war;
- occupation;
- raids;
- boss outcomes;
- magical corruption;
- cleansing;
- warding;
- realm leaks;
- industrial/magical infrastructure;
- ruins being restored;
- dungeons being cleared/claimed;
- ports being built;
- river/shore engineering; and
- player construction.

## 26.1 State Layering

Use explicit state layers rather than silently replacing the biome definition.

A region can remain derived from a natural biome while also being:

- civilised;
- burned;
- flooded;
- corrupted;
- warded; and
- partially restored,

when the compatibility rules allow those layers.

## 26.2 Permanent Versus Temporary Change

A temporary storm wetness state should not require rewriting millions of blocks.

A permanent road, quarry, settlement, collapsed cliff, restored ruin or engineered shoreline should persist as world state/delta as appropriate.

---

# 27. Existing-World Safety

Generator updates must distinguish unexplored from stateful world space.

## 27.1 Generated Base

Unexplored areas may be generated using the world/version migration policy.

## 27.2 Frozen Generated Instances

A generated region/site should become frozen when necessary because it has:

- been explored;
- been discovered and referenced;
- received persistent state;
- gained ownership;
- been modified;
- entered a quest/event;
- been settled;
- been mapped as a protected anchor; or
- otherwise become part of world history.

## 27.3 No Silent Rewrite

A content update must not move or regenerate a known settlement, river, dungeon, port, coastline, road or resource site behind the player's back simply because a new generator version would place it differently.

## 27.4 Migration

Migration can:

- preserve old generated records;
- alias old definitions;
- add compatible unexplored content;
- repair invalid references;
- convert schemas; and
- explicitly migrate approved world state.

It cannot treat deletion/recreation as the default.

---

# 28. Simulation LOD and Streaming

World scale requires separation between definition, generated record, local voxel materialisation and active simulation.

## 28.1 LOD Layers

A useful conceptual hierarchy is:

- **Active Local:** loaded voxels, physics, entities and high-frequency interaction.
- **Loaded Regional:** nearby world records, navigation, ecology/settlement summaries and environmental fields.
- **Distant Persistent:** compact region/site/settlement/ecology/environment state.
- **Dormant Deterministic:** reconstructible generated base with minimal mutable state.
- **Unexplored:** not yet materialised; generation remains deterministic from seed/version.

## 28.2 No Node-Per-World-Cell Requirement

The Godot implementation must not require a scene node for every block, ocean cell, distant site, creature or region.

Runtime representation should match simulation needs.

## 28.3 Promotion/Demotion

Promotion into detailed simulation must preserve:

- identity;
- quantity/state;
- ownership;
- history;
- position/context;
- reservations;
- damage;
- ecological/civilisation summaries; and
- authoritative time progression.

Demotion must not duplicate or erase state.

---

# 29. Multiplayer Authority

World generation and persistent world mutation are authoritative.

Clients may:

- request chunks;
- receive generated record snapshots;
- render presentation;
- predict non-authoritative visuals where safe; and
- submit validated world-edit requests.

Clients may not independently decide:

- biome identity;
- structure placement;
- resource deposits;
- loot sources;
- settlement existence;
- dynamic world state;
- route topology; or
- persistent terrain mutation.

All players in a world resolve the same generated base and authoritative deltas.

---

# 30. Knowledge, Discovery and Maps

Physical truth and player knowledge are separate.

Worldgen can expose:

- discoverable landmarks;
- clues;
- smoke;
- sounds;
- roads;
- signs;
- geological markers;
- resource clues;
- magical glows;
- weather/environment evidence; and
- map-relevant topology.

The knowledge systems decide:

- whether the player knows the name;
- whether a route is mapped;
- confidence;
- rumours;
- false information;
- cultural names; and
- hidden information.

A world-generation debug map may show truth that normal player UI must not expose.

---

# 31. Naming and Generated Identity

Generated locations may receive names from:

- neutral geographic generators;
- culture/language systems;
- historical events;
- notable resources;
- landmarks;
- rulers/factions;
- player naming; and
- later occupation/history.

Generated display names are not stable IDs.

A region changing ownership does not require changing its underlying generated identity.

---

# 32. Block, Material and Voxel Materialisation

Document 03 owns canonical Blocks.

When local terrain is materialised, worldgen resolves:

- biome palette roles;
- geology;
- soil;
- vegetation;
- water interfaces;
- resources;
- special overlays;
- historical structures; and
- local variation

into canonical Block IDs and approved runtime states.

## 32.1 No Duplicate Worldgen Blocks

Worldgen may not create temporary hidden “worldgen-only” canonical Blocks that duplicate Document 03 merely for convenience.

Generated helper representations may exist as non-content technical data, but persistent block identity resolves to the canonical registry.

## 32.2 Block Inventory Boundary

Mining a world Block uses Document 03's recovery/drop contract and Document 04's true Items.

Worldgen does not create duplicate block-item records.

---

# 33. Forge and Presentation Integration

Forge systems own editable source assets and presentation tooling.

A biome/world-content package may require:

- material palettes;
- vegetation assets;
- terrain variants;
- structure kits;
- particles;
- weather visuals;
- ambience;
- audio loops;
- icons;
- map presentation;
- VFX sockets; and
- preview scenes.

Document 11 consumes their runtime-ready products but does not turn visual assets into gameplay truth.

## 33.1 Preview Laboratory

Worldgen authoring should support previews of:

- region layout;
- climate;
- hydrology;
- biome mosaic;
- site distribution;
- resource suitability;
- route topology;
- start candidates;
- marine interfaces;
- underground links;
- dynamic overlays; and
- validation failures.

---

# 34. Godot and Summer Engine Direction

Document 11 remains primarily a gameplay/data contract.

The replacement Document 18 will own exact Godot/Summer technical architecture.

Document 11 nevertheless requires the implementation to support:

- versioned data-driven definitions;
- deterministic derived-seed services;
- asynchronous/bounded generation;
- chunked voxel materialisation;
- generated record persistence;
- seed-plus-delta saves;
- schema migrations;
- content-pack validation;
- background-safe generation tasks;
- generation provenance;
- diagnostic overlays;
- deterministic test fixtures;
- simulated LOD;
- authority boundaries; and
- no Unreal-specific `/Game/...` asset-path dependence.

Summer Engine may assist implementation and authoring, but generated content and code changes remain reviewable and source-controlled.

---

# 35. Performance and Scalability Principles

World generation must scale to different hardware and world settings without creating different authoritative rules for the same world.

Scalable features may include:

- chunk generation concurrency;
- view/stream distance;
- vegetation presentation density;
- local decoration density;
- LOD distance;
- distant ecology update frequency;
- distant settlement update frequency;
- environmental field resolution;
- presentation particles;
- shadow/render quality;
- procedural preview quality; and
- background generation budgets.

## 35.1 Gameplay Versus Presentation

Reducing presentation density must not:

- remove authoritative resources;
- remove a route;
- change biome identity;
- change settlement existence;
- alter economic truth;
- change a boss;
- remove a dungeon;
- alter save state; or
- produce multiplayer disagreement.

---

# 36. Validation Architecture

World-generation validation occurs at multiple layers.

## 36.1 Schema Validation

Check:

- required fields;
- valid IDs;
- correct owner;
- legal enums/tags;
- version;
- package dependency;
- migration policy; and
- no planning-only fields in runtime definitions.

## 36.2 Reference Validation

Check:

- biome -> blocks/resources;
- region -> biome families;
- site -> structure/dungeon family;
- ecology -> habitat;
- settlement -> suitability;
- route -> topology;
- marine -> Water Body/Coast records;
- realm -> access anchors;
- dynamic state -> valid source; and
- content pack -> dependencies.

## 36.3 Seed Validation

Use representative seed suites for:

- start safety;
- region variety;
- biome distribution;
- adjacency;
- route connectivity;
- settlement viability;
- resource capability;
- magic discovery;
- automation capability;
- dungeon reachability;
- ecology;
- boss coherence;
- maritime integration;
- realm access where required;
- rare-content spacing; and
- POC leakage.

## 36.4 Persistence Validation

Test:

- save/load before and after exploration;
- generator version updates;
- changed content packs;
- frozen generated instances;
- world deltas;
- renamed/aliased definitions;
- removed optional content;
- settlements changing generated sites;
- restored/destroyed structures;
- shoreline/cave edits;
- multiplayer reconnect; and
- LOD promotion/demotion.

---

# 37. Required Failure Codes

The implementation should expose stable reason families such as:

| Code | Meaning |
|---|---|
| `WGEN-SEED-001` | Invalid/unresolvable seed input. |
| `WGEN-PACK-001` | Required content pack missing/incompatible. |
| `WGEN-REF-001` | Generated candidate references missing definition. |
| `WGEN-TOPO-001` | Invalid topology relationship. |
| `WGEN-CLIMATE-001` | Climate/biome incompatibility. |
| `WGEN-HYDRO-001` | Invalid water/hydrology relationship. |
| `WGEN-SITE-001` | Site suitability failed. |
| `WGEN-START-001` | Start survivability failed. |
| `WGEN-PROG-001` | Required progression capability unreachable. |
| `WGEN-ECO-001` | Ecology viability failed. |
| `WGEN-ROUTE-001` | Required topology connection unavailable. |
| `WGEN-REALM-001` | Required realm access chain invalid. |
| `WGEN-MARINE-001` | Marine generation contract failed. |
| `WGEN-MIG-001` | Generated-record migration failed. |
| `WGEN-DELTA-001` | Persistent delta cannot reconcile with generated base. |
| `WGEN-POC-001` | Retired POC identity/hook detected in production generation. |
| `WGEN-AUTH-001` | Non-authoritative client attempted persistent generation mutation. |

Failure codes should include contextual IDs and repair evidence where safe for developer tooling.

---

# 38. POC Preservation and Archive Rules

The POC remains valuable as regression evidence.

It may still test:

- mining/placement;
- terrain streaming;
- cave accessibility;
- NPC routes;
- settlement construction;
- warehouse delivery;
- automation;
- mana infrastructure;
- combat;
- raids;
- persistence;
- save recovery; and
- UI learning.

However:

> **A regression fixture is not a shipping generator.**

POC world identities must use test/archive namespaces and be excluded from production content pools.

## 38.1 Capability Preservation Examples

| Retired POC Wrapper | Production Capability Preserved |
|---|---|
| Fixed Forest Hamlet | Generated settlements and civilisation access. |
| Fixed watchtower site | Watchtowers and settlement defence structures. |
| Fixed goblin camp | Hostile camps and threat-source structures. |
| Fixed cave | Procedural cave systems and entrances. |
| Fixed mana pocket | Generated magical-resource providers. |
| Fixed rune ruin | Ruins, magical discovery and knowledge routes. |
| Fixed river | Hydrology and water-linked settlement/resource context. |
| Fixed raid approach | Generated route/threat approach context. |
| Fixed portal teaser | Realm-access anchors and portal content. |

---

# 39. Cross-System Interface Contract

Document 11 should expose read-only world-facing snapshots or records rather than allowing every consumer to re-derive geography.

Core interfaces conceptually include:

- `WorldProfileSnapshot()`
- `RegionAt(position)`
- `BiomeAt(position)`
- `TerrainContextAt(position)`
- `ClimateBaselineAt(position)`
- `HydrologyContextAt(position)`
- `GeologyContextAt(position)`
- `MagicEnvironmentContextAt(position)`
- `GeneratedSiteContext(site_id)`
- `SettlementSuitability(site_id or area)`
- `ResourceSuitability(resource_family, area)`
- `HabitatContext(area)`
- `RouteTopology(area)`
- `WorldStartValidation(candidate)`
- `GenerationProvenance(record_id)`
- `DynamicEnvironmentLayers(area)`
- `GeneratedBaseRevision(area)`
- `WorldDeltaSummary(area)`

Exact function names remain technical implementation details for Document 18.

---

# 40. Main-Document Reconciliation Requirements

This replacement creates explicit obligations for later foundation documents.

| Document | Reconciliation Requirement |
|---|---|
| 07 — NPC Village | Remove fixed Forest Hamlet generation assumptions; consume generated settlement contexts and Atlas culture/environment suitability. |
| 08 — Automation | Consume real terrain, route, water/wind and resource-provider contexts without inventing worldgen. |
| 09 — Magic | Consume leyline/magical-environment contexts; provide sourced transformations rather than editing biome truth directly. |
| 10 — Creatures | Replace POC roster generation with Atlas ecology/habitat packages and worldgen contexts. |
| 12 — Structures | Replace fixed POC placement with site suitability, history, terrain, route and Atlas structure context. |
| 13 — Peoples/Cultures/Factions | Consume generated region/civilisation contexts and Atlas identities without ancestry-biome determinism. |
| 14 — Dimensions | Use Atlas 24D realm topology and compatible generation contracts. |
| 15 — Quests/Events | Bind objectives/events to actual generated records and persistent state. |
| 16 — Combat | Consume terrain, visibility/environment and route evidence; do not own worldgen. |
| 17 — UI/UX | Present map/discovery/world settings from authoritative data without revealing hidden truth. |
| 18 — Technical | Implement all deterministic generation, persistence, LOD, migration and test contracts in Godot/Summer Engine. |
| 19/20 — Settlement/Buildings | Consume terrain/site/route contexts; construction creates persistent deltas and navigation revisions. |

---

# 41. Production Acceptance Criteria

Document 11 v1.0 is accepted as a design foundation when:

- [x] the POC valley is no longer production worldgen authority;
- [x] reusable POC capabilities remain preserved;
- [x] normal worlds are deterministic from seed + versioned profile + packs;
- [x] Atlas Set 24 remains authored content authority;
- [x] natural surface biome content is consumed from 24B rather than duplicated;
- [x] special/ocean/sky/underground content is consumed from 24C;
- [x] detailed marine executable generation remains under 26C;
- [x] dynamic marine environment remains under 26D;
- [x] resource, settlement, ecology, structure and route ownership boundaries are explicit;
- [x] world-start guarantees are capability-based rather than named-site based;
- [x] generated-base + persistent-delta persistence is explicit;
- [x] explored/stateful world records are protected from silent regeneration;
- [x] deterministic repair is defined;
- [x] validation includes POC leakage scanning;
- [x] movement accessibility is handed to Set 30;
- [x] economic route value is handed to Set 27;
- [x] social knowledge is separate from world truth;
- [x] biological consequences are handed to Set 29;
- [x] block/item/resource duplication is prohibited;
- [x] Godot/Summer direction replaces Unreal-specific assumptions; and
- [x] the replacement is ready to serve as the environmental foundation for Documents 07–10 and 12–18 reconciliation.

---

# Appendix A — Canonical Generated Record Families

## A.1 World Record

Required field groups:

- identity;
- root seed;
- world profile;
- generator version;
- enabled packs;
- realm/world-layer references;
- creation timestamp;
- authoritative time source;
- discovered/generated-region index;
- dynamic world-state references;
- save/migration version;
- validation evidence;
- checksum/provenance.

## A.2 Terrestrial Region Record

Required field groups:

- generated region ID;
- Atlas region-archetype reference;
- parent landmass;
- bounds;
- derived seed key;
- climate baseline;
- terrain provinces;
- watershed links;
- biome mosaic;
- history references;
- civilisation suitability;
- ecology slots;
- route topology;
- resource/site sockets;
- dynamic overlays;
- discovery state;
- frozen/generated-base status;
- delta references;
- validation.

## A.3 Biome Instance Record

Required field groups:

- instance ID;
- biome definition ID;
- parent region;
- spatial coverage;
- climate context;
- terrain/substrate context;
- hydrology;
- vegetation/palette references;
- ecology/habitat slots;
- resource suitability;
- site compatibility;
- settlement suitability;
- route/traversal evidence;
- active overlays;
- history references;
- discovered state;
- generated revision;
- validation.

## A.4 Site Candidate / Site Instance

Required field groups:

- site ID;
- site family/category;
- owner definition source;
- world position/bounds;
- terrain context;
- biome;
- route context;
- water;
- safety/danger;
- history;
- territory;
- resource context;
- magical context;
- suitability score/reasons;
- selected definition;
- protected-anchor status;
- persistent state;
- discovery;
- validation.

---

# Appendix B — World Profile Field Template

| Field Group | Example Fields |
|---|---|
| Identity | profile_id, display_name_key, version, pack_id |
| Scale | world_size_class, landmass_scale, region_scale, distance compression |
| Topology | land_water_ratio, fragmentation, terrain_drama |
| Climate | temperature_spread, moisture_spread, seasonality, disaster profile |
| Civilisation | settlement_density, route_density, history_depth |
| Ecology | wildlife_pressure, predator pressure, regeneration |
| Adventure | ruin/dungeon/landmark density, boss-pressure envelope |
| Resources | abundance profile, regional scarcity, prospecting difficulty |
| Magic | ambient_magic, anomaly density, corruption/realm-leak profile |
| Maritime | ocean prominence, island density, coast complexity |
| Vertical | cave prominence, deep-world profile, skyland profile |
| Start | start-safety strictness, valid climate bands, civilisation proximity tolerance |
| Simulation | distant-sim complexity, update budgets, catch-up profile |
| Difficulty Hooks | environment/event intensity interfaces, without duplicating specialist rules |
| Accessibility | start leniency, warning requirements, optional navigation assists |
| Production | content tiers allowed, required packs, validator suite |

---

# Appendix C — Biome Definition Intake Contract

Document 11 expects Atlas biome definitions to provide or reference:

- stable biome ID;
- parent family;
- content status;
- compatible world profiles;
- climate ranges;
- terrain tags;
- substrate/geology;
- hydrology;
- adjacency;
- transition rules;
- vegetation;
- block/material palette roles;
- habitat/ecology slots;
- resource opportunities;
- settlement suitability;
- structure/dungeon/boss slots;
- route/traversal evidence;
- magical/environmental modifiers;
- dynamic-state compatibility;
- presentation requirements;
- Forge asset dependencies;
- migration status; and
- validation owner.

Missing specialist data should be reported, not silently invented by Document 11.

---

# Appendix D — Deterministic Generation Stage Registry

Recommended stage IDs:

- `wgen.profile.validate`
- `wgen.seed.resolve`
- `wgen.topology.world`
- `wgen.topology.landmass`
- `wgen.topology.marine_handoff`
- `wgen.terrain.province`
- `wgen.climate.baseline`
- `wgen.hydrology`
- `wgen.geology`
- `wgen.magic.baseline`
- `wgen.region.assemble`
- `wgen.biome.surface`
- `wgen.special.handoff`
- `wgen.history`
- `wgen.civilisation.context`
- `wgen.routes.context`
- `wgen.content.sockets`
- `wgen.content.resolve`
- `wgen.validation.progression`
- `wgen.validation.ecology`
- `wgen.validation.distribution`
- `wgen.validation.poc`
- `wgen.repair`
- `wgen.start.select`
- `wgen.local.materialise`
- `wgen.record.freeze`
- `wgen.delta.attach`

The technical plan may refine these names while preserving stage isolation and deterministic provenance.

---

# Appendix E — Start-Safety Contract

A normal start candidate should satisfy:

1. the player can occupy the spawn position safely;
2. the player has at least one escape direction;
3. basic gatherable capability exists within a reasonable profile-defined reach;
4. shelter/building is possible directly or through a nearby alternative;
5. food or an approved substitute survival route exists;
6. the player is not trapped by cliffs, deep water, sealed caves or unloaded topology;
7. unavoidable hostile pressure does not exceed the profile;
8. required environmental warnings are available;
9. early progression has at least one valid capability route; and
10. the candidate contains no retired POC dependency.

A start may still be challenging.

“Survivable” does not mean “flat, safe and next to every resource”.

---

# Appendix F — POC Leakage Scan

Production CI should scan world-generation source, registries, content packs and test manifests for:

- retired POC region IDs;
- Forest Hamlet names;
- Hearthplain or equivalent POC-only names;
- fixed POC villager IDs;
- fixed watchtower-project identifiers;
- fixed goblin-raid day/route hooks;
- POC cave/ruin/camp coordinates;
- exact legacy valley layout identifiers;
- test-only namespace references in shipping packs;
- special-case world seeds used to force the POC layout; and
- hardcoded fallback placement that reconstructs the demonstration.

A match is not always deletion-worthy: migration tables, archival tests and historical documentation may retain references.

The validator must distinguish approved archival/test use from shipping-generation leakage.

---

# Appendix G — Cross-System Ownership Quick Reference

| Question | Owner |
|---|---|
| What biome/region family exists? | Atlas 24B/24C/24D |
| Where was this terrestrial region/biome generated? | Document 11 runtime generation |
| Where was this ocean/coast/island generated? | Document 26C |
| How does liquid move/flood? | Document 26B |
| What is today's marine wind/wave/tide/current/storm state? | Document 26D |
| What resource is this and what capability does it provide? | Document 06 |
| What Block physically exists here? | Document 03 |
| What Item did it drop? | Document 04 |
| What transformation occurred? | Document 05 |
| Which creature lives here? | Document 10 / Atlas 24F |
| Which settlement exists here? | Document 07/19/20 / Atlas 24E |
| Which structure definition occupies the site? | Document 12/20 / Atlas 24I |
| Can this specific mover cross this terrain? | Set 30 |
| What is the route's economic value? | Set 27 |
| Does the actor know/believe the route exists? | Set 28 |
| What biological effect does this climate/hazard cause? | Set 29 |
| What does the UI show? | Document 17 |
| How is this implemented in Godot/Summer? | Replacement Document 18 |

---

# Appendix H — Production Preservation Register for Legacy Document 11

| Legacy Concept | Treatment |
|---|---|
| Biomes are gameplay systems, not skins | Preserve |
| Layered climate/terrain/biome model | Preserve and expand |
| Caves as major progression/exploration spaces | Preserve through Atlas 24C |
| Resource distribution by biome/depth/geology | Preserve, consume Document 06/24J |
| Villages depend on water/resources/routes/danger | Preserve as suitability inputs |
| Leylines affect world context | Preserve as magic-environment input |
| Dynamic corruption/restoration | Preserve under sourced dynamic-state rules |
| Memorable landmarks | Preserve through Atlas placement |
| Buildability and automation terrain practicality | Preserve as environmental facts |
| Simulation LOD | Preserve and modernise |
| Fixed Forest Hamlet valley | Archive |
| Fixed starter meadow | Archive |
| Fixed POC river/cave/ruin/camp arrangement | Archive |
| Fixed POC resource pockets | Archive |
| Guaranteed watchtower site | Archive |
| POC-specific threat approach | Archive |
| POC-specific portal destination | Archive |
| Unreal-specific implementation assumptions | Supersede with Godot/Summer plan |
| Broad old ocean assumptions | Supersede with Atlas 24C + Set 26 |
| Worldgen-calculated movement cost | Supersede with Set 30 consumer boundary |

---

# Appendix I — Definition of Done for the Implemented Worldgen Foundation

The implemented system is not “done” because terrain appears.

A production milestone requires evidence that:

- the same seed reproduces the same generated base;
- different seeds produce meaningful structural variety;
- world profiles alter permitted density/scale without breaking ownership;
- natural regions form coherent climate/hydrology;
- the Atlas definitions resolve through stable IDs;
- start validation works across many seeds;
- progression validation catches dead ends;
- deterministic repair produces explainable outcomes;
- settlements/resources/ecology/sites bind to generated context;
- marine handoff to 26C works;
- Set 30 can consume terrain/route context;
- explored terrain survives generator updates;
- save/load preserves generated record IDs;
- world deltas survive;
- LOD promotion/demotion does not duplicate state;
- content-pack changes are migration-safe;
- POC identities are absent from shipping generation;
- low-spec settings reduce cost rather than authoritative content truth; and
- debug tools can explain **why** a region, biome, resource, settlement, structure or route was generated.

---

# Completion Statement

**Document 11 v1.0 replaces the POC-centred Biomes and World Generation document with Leyforge's production procedural-world assembly contract.**

The world is now defined as a deterministic, relationship-driven, versioned and persistent system assembled from the World Content Atlas rather than a controlled demonstration valley. Natural surface geography consumes Atlas 24B; special, aerial, subterranean and marine identities consume Atlas 24C; detailed marine generation remains with Document 26C; dynamic marine fields remain with 26D; realm generation remains with Atlas 24D/Document 14; and specialist gameplay systems retain ownership of their own state.

The fixed POC geography is archived, but its useful capabilities—survival starts, caves, resources, settlements, roads, ruins, magical discovery, hostile camps, defences, persistent aftermath and simulation LOD—remain fully supported as reusable production systems.

**Next reconciliation dependency:** Documents 07–10 may now be revised against a stable production world-generation foundation.
