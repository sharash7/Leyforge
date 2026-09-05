# Leyforge Final Content Canon Collection

## FCC-04B - Somnolent Expanse Biomes, Terrain, Coherence States & Environmental Hazards

**Version:** 0.1  
**Status:** Content Canon - Realm-Local Lock  
**Realm:** Somnolent Expanse  
**Stable Realm ID:** `realm.network.somnolent_expanse`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-04A - Realm Identity, Laws, Progression & Canon Boundaries  
**Primary Source Reconciliation:** World Content Atlas Set 24, especially 24D - Dimensions, Realm Structure and Realm Biome Atlas, plus accepted Somnolent Final Content Canon decisions Q246-Q390.  
**Final Global Status:** Pending final cross-realm reconciliation after all realm FCC sets and the Overworld FCC are complete.

---

# 1. Purpose

FCC-04B defines the authoritative environmental and world-generation content of the **Somnolent Expanse**.

It owns:

- the eight canonical Somnolent biome families;
- Dream Network environmental topology at the biome level;
- terrain-family context and environmental distribution;
- Dreamwater-sea and coherence-island environmental behaviour;
- the six canonical coherence states as environmental conditions;
- biome transition logic;
- regional environmental-state families;
- the twelve canonical environmental hazard families;
- biome suitability interfaces consumed by flora, creatures, settlements, structures, dungeons, authorities, resources, and events;
- deterministic and save-safe environmental mutation rules;
- environmental simulation-scaling and accessibility requirements.

FCC-04B does **not** own:

- final material registry definitions and processing chains, which belong to FCC-04C;
- flora, crops, food, fungi, and Reverie Wood definitions, which belong to FCC-04D;
- creature definitions, which belong to FCC-04E;
- civilisation and settlement definitions, which belong to FCC-04F;
- portal construction, Blocks, Items, recipes, and detailed structure implementation, which belong to FCC-04G;
- dungeon, guardian, authority, and event execution, which belong to FCC-04H;
- detailed nightmare dynamics, Void-corruption handling, stabilisation technology, and cross-realm state interaction, which belong to FCC-04I.

This document supplies the environmental contracts those later documents consume.

---

# 2. Canonical Biome Roster

The Somnolent Expanse contains exactly eight major canonical biome families at the realm-content-foundation level:

1. **Lucid Shores**
2. **Reverie Gardens**
3. **Memory Cities**
4. **Prophecy Dunes**
5. **Nightmare Thickets**
6. **Sleepwalker Roads**
7. **Shattered Waking Isles**
8. **Deep Dream Abyss**

These are **biome families**, not one fixed visual preset each.

A biome family may contain:

- procedural local variants;
- coherence-state variants;
- settlement-influenced states;
- restored, damaged, abandoned, fortified, contested, or exploited states;
- event overlays;
- dungeon-adjacent states;
- authority territories;
- natural nightmare variants;
- Void-corruption overlays;
- transition zones;
- hidden or restricted sub-regions;
- authored symbolic micro-sites.

A local variant does not become a ninth major biome merely because its palette, local dream law, architecture, creature density, resource pressure, or route condition differs.

---

# 3. Dream Network Environmental Topology

## 3.1 Network Rather Than Continental Geography

The Somnolent Expanse does not require one ordinary Euclidean continent.

Its large-scale environmental topology may combine:

- coherence islands;
- Dreamwater seas;
- archipelagos of stable dream matter;
- Memory City districts;
- cultivated Reverie Garden territories;
- Prophecy Dune fields;
- Nightmare fronts and forests;
- Sleepwalker Road corridors;
- Shattered Waking Isle clusters;
- Deep Dream descents and abyssal strata;
- stable route stations;
- isolated sovereign regions;
- dungeon-linked domains;
- Dreamgate destination regions.

The topology is still deterministic and save-persistent.

The realm may be spatially strange without becoming random at runtime.

## 3.2 Regional Coherence Islands

A **coherence island** is any region whose local dream matter maintains sufficiently consistent physical and symbolic rules to support persistent terrain, structures, ecology, routes, or civilisation.

A coherence island may be:

- a literal island in Dreamwater;
- a city district;
- a garden estate;
- a large road-linked plateau;
- a nightmare domain;
- a Waking Isle fragment;
- a Deep Dream shelf;
- a dungeon or authority territory.

The word *island* describes topological stability, not necessarily shoreline geography.

## 3.3 Transition Regions

Major biome transitions should normally be legible.

Typical transitions include:

- Lucid Shores -> Reverie Gardens through increasingly cultivated Dream Soil, stable pathways, Emotion Blooms, Reverie Trees, and designed symbolic landscaping;
- Lucid Shores -> Sleepwalker Roads through route markers, caravan infrastructure, Lucid Beacons, and increasingly directional terrain;
- Reverie Gardens -> Memory Cities through cultivated symbolic landscapes becoming layered civic architecture, mnemonic signs, plazas, and remembered building grammar;
- Memory Cities -> Prophecy Dunes through urban fragments becoming future-ruins, exposed symbolic scenes, dry Dream Sand, and probability-responsive terrain;
- ordinary coherent region -> Nightmare Thickets through increasing route loops, Nightmare Thorn, fear-responsive ecology, and pressure cues;
- Sleepwalker Roads -> Shattered Waking Isles through stronger Waking Stone presence, more conventional gravity/physics, mixed-reality debris, and rupture scars;
- lower-coherence regions -> Deep Dream Abyss through increasingly fragmented routes, fewer stable horizons, concept-reactive matter, and low-coherence Lucid Glass states.

An authored magical boundary may create an abrupt transition where the fiction requires it, but abrupt state changes must still be readable and persistent.

## 3.4 Hidden, Restricted, and Sovereign Regions

The generator may create:

- Oracle-controlled territories;
- Nightmare Dominion borders;
- protected therapeutic gardens;
- Memory City archive quarters;
- Dream Walker rescue routes;
- sealed Waking Fractures;
- Deep Dream research stations;
- authority territories;
- inaccessible future-ruin states;
- stabilised expedition corridors;
- portal-side protected zones.

Access may depend on:

- route knowledge;
- Lucidity;
- coherence infrastructure;
- diplomacy;
- local law;
- faction permission;
- dungeon outcomes;
- authority outcomes;
- world events;
- tools or materials;
- deliberate risk.

These remain **intra-realm conditions**. They do not create alternate interdimensional access methods.

---

# 4. Canonical Coherence-State Model

Coherence is an environmental property describing how persistent, physically reliable, and symbolically stable a Somnolent region is.

The canonical high-level states are:

1. **Anchored**
2. **Stable**
3. **Mutable**
4. **Unstable**
5. **Fragmenting**
6. **Dissolving**

These states are stored at region, site, structure, route, dungeon, or other bounded simulation scopes as appropriate.

They are **not** intended as a continuous metaphysical calculation for every voxel.

## 4.1 Anchored

Anchored regions are the most physically reliable Somnolent environments.

They commonly occur around:

- established Dreamgate Sanctuaries;
- major cities;
- long-lived settlements;
- Waking Stone foundations;
- mature Coherence Core networks;
- powerful cultural anchors;
- ancient stable sites.

Typical effects:

- highly reliable terrain collision;
- conventional building behaviour;
- stable routes;
- predictable Dreamwater;
- strong settlement suitability;
- reduced expectation distortion;
- easier use of imported machinery.

Anchored does not mean hazard-free.

## 4.2 Stable

Stable regions behave reliably under normal conditions but may respond to large events, local dream laws, authority influence, or significant player intervention.

This is a common long-term state for inhabited Somnolent regions.

## 4.3 Mutable

Mutable regions remain persistent but may change between bounded authored states more readily.

Possible effects:

- route alternatives;
- symbolic environmental changes;
- architecture switching between supported interpretations;
- prophecy exposure;
- controlled expectation-responsive objects;
- temporary terrain-state changes.

Mutable does not authorise unrestricted freeform reality editing.

## 4.4 Unstable

Unstable regions have weakened persistence or conflicting local rules.

Possible effects:

- route uncertainty;
- intermittent terrain-state switching;
- Lucidity pressure;
- machinery unreliability;
- increased Dreamwater anomalies;
- false-route presentation;
- local Waking Anchor strain;
- increased dungeon/event eligibility.

Unstable regions must remain navigable or intentionally challenge-marked according to content design.

## 4.5 Fragmenting

Fragmenting regions are actively losing coherent continuity.

Possible effects:

- separated terrain shelves;
- temporarily inaccessible routes;
- exposed lower-coherence layers;
- symbolic gaps;
- concept suppression;
- dangerous Dreamwater currents;
- collapse of unsupported local infrastructure.

Persistent player-owned structures must use explicit supported failure rules. Fragmenting state does not silently erase protected construction.

## 4.6 Dissolving

Dissolving is the lowest ordinary Somnolent coherence state.

It represents regions close to losing stable physical or symbolic identity.

Dissolving regions may be used for:

- Deep Dream traversal;
- emergency stabilisation events;
- dangerous dungeon states;
- authority-scale crises;
- abandoned dream geography;
- realm-edge environmental storytelling.

Dissolving does not mean Void corruption.

A region may dissolve naturally without any Void involvement.

---

# 5. Coherence Transition Rules

## 5.1 Causes of Increased Coherence

Coherence may improve through combinations of:

- repeated cultural reinforcement;
- settlement occupation;
- stable route maintenance;
- Dreamstone construction;
- Waking Stone foundations;
- Coherence Cores;
- Dreamgate infrastructure;
- Lucid Beacons;
- successful restoration;
- long-term shared-dream reinforcement;
- authority outcomes;
- dungeon resolution;
- compatible ecological recovery.

## 5.2 Causes of Reduced Coherence

Coherence may fall because of:

- abandonment;
- conflicting dream-law pressures;
- repeated Waking Fractures;
- severe nightmare pressure;
- broken stabilisation infrastructure;
- uncontrolled expectation-responsive systems;
- authority conflict;
- Deep Dream surge;
- structural damage;
- major regional events;
- Void corruption.

Void corruption is only one cause of reduced coherence and remains a distinct state family.

## 5.3 Persistence

Coherence changes must be:

- saved;
- deterministic from authoritative inputs;
- reproducible on reload;
- bounded by site/region rules;
- readable enough for diagnosis;
- compatible with multiplayer authority.

Off-screen simulation may update coherence through coarse regional summaries rather than continuous local simulation.

---

# 6. Canonical Regional Environmental-State Families

The Somnolent Expanse uses eight principal large-scale environmental-state families.

These are overlays or regional states, **not additional biome families**.

1. **Lucid Calm**
2. **Reverie Bloom**
3. **Memory Convergence**
4. **Prophecy Convergence**
5. **Nightmare Front**
6. **Waking Fracture**
7. **Deep-Dream Surge**
8. **Void-Corrupted State**

## 6.1 Lucid Calm

A period or region of increased clarity, route reliability, Dreamwater stability, and reduced symbolic interference.

May increase:

- safe-route visibility;
- Lucid Manta migration activity;
- Dreamgate-side stability;
- settlement confidence;
- safe exploration range.

## 6.2 Reverie Bloom

A strong cultivated or naturally emergent creative-growth state.

May influence:

- Emotion Blooms;
- Muse Moths;
- Inspiration Resin availability;
- dream art;
- garden expansion;
- social and cultural events.

A Reverie Bloom is not automatically positive if symbolism begins overwhelming infrastructure or contested ownership.

## 6.3 Memory Convergence

Multiple remembered or reconstructed states become simultaneously influential.

May affect:

- Memory City districts;
- signs and street layouts;
- historical investigation;
- Memory Theatre access;
- faction claims;
- archive routes.

Contradiction remains valid and does not automatically resolve into objective truth.

## 6.4 Prophecy Convergence

Several possible futures become unusually visible or influential.

May affect:

- Prophecy Dunes;
- Oracle activity;
- Omen Strider migration;
- Time-Seeds;
- future-ruin exposure;
- event forecasting.

Prophecy Convergence does not guarantee one future.

## 6.5 Nightmare Front

A regional expansion or intensification of natural nightmare ecology.

May increase:

- Fearling density;
- Nightmare Thorn activity;
- route loops;
- Nightmare Stalker pressure;
- fear-responsive site states;
- Nightmare Warden activity.

Nightmare Front is not automatically Void corruption.

## 6.6 Waking Fracture

Dream law and waking-like physical law become locally incompatible.

May produce:

- mixed terrain states;
- Waking Stone exposure;
- machinery faults;
- structural stress;
- hybrid ecology changes;
- boundary predators such as Waking Devourer activity.

## 6.7 Deep-Dream Surge

Low-coherence Deep Dream phenomena temporarily rise into ordinarily safer layers.

May introduce:

- Concept Leech activity;
- Origin Mote states;
- Deepbell response;
- unusual symbolic suppression;
- altered route availability;
- rare Deep Dream sites.

## 6.8 Void-Corrupted State

A region is affected by genuine Void-origin contamination.

This state is visually, mechanically, and canonically distinct from:

- nightmare pressure;
- low coherence;
- Waking Fracture;
- memory contradiction;
- ordinary Deep Dream instability.

Detailed corruption propagation, cleansing, irreversible transformation, and cross-realm contamination are owned by FCC-04I.

---

# 7. Canonical Environmental Hazard Registry

The following twelve hazard families are canonical for the Somnolent Expanse.

| # | Hazard Family | Canonical Environmental Meaning | Ownership Boundary |
|---|---|---|---|
| 1 | **Lucidity Drift** | Reduced clarity, reliable interpretation, route confidence, or resistance to supported dream-state effects | FCC-04A owns Lucidity law; FCC-04B owns environmental pressure |
| 2 | **Anchor Strain** | Weakening of the traveller's Waking/Reality Anchor connection inside the realm | Must not create a second sleeping body or duplicate character |
| 3 | **Coherence Collapse** | A region/site moves toward lower-coherence states, affecting terrain, routes, structures, or environmental reliability | State model owned here; detailed stabilisation in FCC-04I |
| 4 | **Expectation Distortion** | Supported environmental states respond adversely to repeated expectation or assumption flags | Must remain bounded and deterministic |
| 5 | **Nightmare Pressure** | Sustained fear or nightmare ecology intensifies supported local systems | Nightmare ecology details in FCC-04E/I; not Void by default |
| 6 | **Memory Overlay** | Conflicting reconstructed imagery or remembered environments obscure current spatial interpretation | Must not delete authoritative Codex/save data |
| 7 | **Prophecy Dissonance** | Contradictory possible futures interfere with route, clue, or decision readability | Prophecy remains conditional, not absolute |
| 8 | **Sleepwalker Loop** | Routes repeat, redirect, or refuse progress until supported navigation/coherence conditions are met | Intra-realm only; cannot bypass Dreamgate travel |
| 9 | **Waking Fracture** | Competing dream and waking-like physical laws destabilise terrain, machinery, routes, or structures | Shattered Waking Isles are primary habitat |
| 10 | **Dreamwater Undertow** | Dreamwater current/state interferes with swimming, navigation, Lucidity, or route stability | Fluid material detail in FCC-04C; creature interaction in FCC-04E |
| 11 | **Concept Suppression** | Deep-Dream phenomena temporarily suppress specific authored functions/properties | Cannot delete arbitrary definitions or save data |
| 12 | **Void Corruption** | Genuine external corruption ultimately tied to the Void Between | Detailed behaviour in FCC-04I |

Hazard intensity must be driven by biome suitability, coherence, site state, event state, authority influence, and saved world conditions rather than arbitrary random punishment.

---

# 8. Lucid Shores

## 8.1 Canonical Identity

**Lucid Shores** are the most consistently coherent shoreline and island environments of the Somnolent Expanse.

They are defined by:

- stable Dreamwater coastlines;
- Dream Sand beaches;
- Dreamstone headlands and island foundations;
- clear or readable horizons;
- relatively high coherence;
- safe-route indicators;
- arrival infrastructure;
- Lucid Manta migrations;
- Dreamgate-associated settlements and sanctuaries.

They are often among the safest Somnolent regions for new arrivals, but they are not a mandatory tutorial biome and not every Dreamgate must open onto an identical shore.

## 8.2 Horizon Navigation

The Lucid Shores' horizon may display **symbolic navigation forecasts**.

Possible imagery may indicate:

- reachable biome families;
- stable route categories;
- major settlements;
- active regional states;
- distant authority pressure;
- route closures;
- prophecy-relevant destinations.

The horizon does not require literal rendering of every distant region in physical line of sight.

A visible impossible city silhouette may communicate a valid Memory City route without meaning that city occupies conventional geographic coordinates beyond the beach.

## 8.3 Terrain

Common terrain forms include:

- Dream Sand beaches;
- stable Dreamstone cliffs;
- shallow Dreamwater shelves;
- island chains;
- coves;
- tidal Dreamwater pools;
- low Dream Soil dunes;
- beacon promontories;
- Dreamgate Sanctuary platforms;
- route piers or symbolic causeways.

## 8.4 Principal Hazards

- Dreamwater Undertow;
- Lucidity Drift during unstable tides;
- false horizon cues during regional disturbance;
- Anchor Strain near failing portal infrastructure;
- Coherence Collapse on unstable outer islands;
- rare Waking Fracture;
- rare Void corruption.

## 8.5 Content Interfaces

Lucid Shores provide suitable regions for:

- Lucid Manta;
- Mirrorfish;
- Dream Reed;
- Sleepbloom where wet conditions permit;
- Dream Ports;
- Lucid Communes;
- Dreamgate Settlements;
- Dreamgate Sanctuaries;
- Lucid Beacons;
- Lucid Observatory dungeons;
- Dreamwalker rescue infrastructure;
- Dreamwater trade and fisheries.

---

# 9. Reverie Gardens

## 9.1 Canonical Identity

**Reverie Gardens** are highly coherent cultivated dreamlands intentionally shaped and maintained by communities, artists, healers, rulers, scholars, and long-lived dream cultures.

They are defined by:

- deliberate symbolic landscaping;
- Reverie Trees;
- Emotion Blooms;
- Muse Moths;
- Dreamfruit cultivation;
- Inspiration Resin production;
- designed Dreamwater features;
- stable communal spaces;
- dream art and public ritual;
- maintained coherence.

The biome exists to ensure Somnolent contains beauty, culture, agriculture, recovery, and ordinary social life rather than functioning only as surreal danger.

## 9.2 Constructed Environmental Identity

Reverie Gardens may be deliberately created or expanded through:

- compatible Dream Soil;
- coherent foundations;
- repeated cultivation;
- cultural reinforcement;
- symbolic design;
- stabilisation infrastructure;
- long-term settlement occupation.

This does **not** grant unrestricted imagination-based world editing.

Garden construction uses bounded environmental and settlement systems.

## 9.3 Neglect and Symbolic Overgrowth

Neglect may cause symbolism to overtake function.

Possible consequences include:

- pathways becoming ceremonial rather than practical;
- Emotion Bloom states overwhelming crop areas;
- decorative structures consuming space needed for services;
- route meaning changing;
- expectation-responsive mazes;
- increased local mutability.

These changes use saved authored states.

## 9.4 Terrain

Common forms include:

- terraced Dream Soil gardens;
- Reverie Tree groves;
- canal gardens;
- reflective pools;
- designed Dreamstone terraces;
- flowering corridors;
- symbolic hedges;
- pavilions;
- sculpted hills;
- public dream-art plazas.

## 9.5 Principal Hazards

- Expectation Distortion;
- excessive symbolic overgrowth;
- Lucidity Drift caused by overwhelming sensory/symbolic environments;
- contested ownership of collective dream spaces;
- emotional-state feedback;
- local Coherence Collapse after abandonment;
- nightmare encroachment during social crisis;
- rare Void corruption.

## 9.6 Content Interfaces

Reverie Gardens provide suitable regions for:

- Reverie Tree / Reverie Wood;
- Emotion Bloom;
- Muse Moth;
- Dreamfruit Vine;
- Calmleaf;
- Reverie Bean;
- Reverie Conservatories;
- Garden Communes;
- Artist Colonies;
- Coherence Estates;
- therapy/cultural sites;
- shared-dream civic spaces.

---

# 10. Memory Cities

## 10.1 Canonical Identity

**Memory Cities** are persistent urban dream-regions formed from overlapping remembered architecture, cultural imagery, reconstructed districts, civic history, and independently developed dream civilisation.

They may contain:

- streets from incompatible eras;
- reconstructed homes;
- impossible adjacency;
- overlapping languages and signs;
- multiple remembered versions of one square;
- newly built dream-native districts;
- old structures whose original source is uncertain;
- functioning civic infrastructure.

A Memory City is not an automatic database copy of every waking settlement.

## 10.2 Contradictory Urban States

Contradiction is a defining mechanic.

A district may support bounded alternate states such as:

- old/new plaza;
- intact/ruined facade;
- one culture's remembered street versus another's;
- two legitimate versions of a public monument;
- interiors reflecting different remembered uses.

The simulation stores explicit versions and transition conditions.

Contradiction does not mean one version must be false.

## 10.3 Historical Truth Boundary

Memory City presentation may support investigation and evidence gathering.

It may not claim objective truth solely because a dream reconstruction exists.

Truth claims require supported records, testimony, world history, or other provenance.

## 10.4 Terrain and Urban Ground

Common forms include:

- Dreamstone streets;
- layered plazas;
- Dream Soil courtyards;
- Lucid Glass facades;
- symbolic bridges;
- memory-sign corridors;
- overlapping foundations;
- submerged districts in Dreamwater;
- restored civic spaces;
- abandoned reconstructed quarters.

## 10.5 Principal Hazards

- Memory Overlay;
- Lucidity Drift;
- contradictory route states;
- Expectation Distortion;
- identity/presentation confusion;
- Coherence Collapse in abandoned districts;
- political conflict over historical claims;
- Concept Suppression in deep or damaged sites;
- Void corruption.

## 10.6 Content Interfaces

Memory Cities provide suitable regions for:

- Archive Districts;
- Memory Markets;
- Reconstructed City Quarters;
- Memory Traders;
- shared-dream cultures;
- Memory Looms;
- Memory Theatre dungeons;
- Stagekeeper guardians;
- historical investigation;
- Memory Thread trade and processing.

---

# 11. Prophecy Dunes

## 11.1 Canonical Identity

**Prophecy Dunes** are shifting dream deserts shaped by unrealised futures, conditional outcomes, probability imagery, omen ecology, and competing interpretations of what may occur.

They are not a deterministic preview of one guaranteed timeline.

## 11.2 Terrain-State Model

Terrain movement uses bounded deterministic states rather than uncontrolled regeneration.

Possible forms include:

- Dream Sand dune fields;
- exposed future-ruin sites;
- symbolic wind corridors;
- Omen Grass flats;
- Lucid Glass / Fate Glass exposures;
- caravan basins;
- Oracle route markers;
- temporary prophecy windows;
- time-seed gardens.

A site may become exposed or buried according to saved prophecy/event conditions.

## 11.3 Conditional Future Law

Environmental prophecy can expose:

- possible battlefields;
- future ruins;
- likely storms;
- migration outcomes;
- political consequences;
- conditional resource opportunities;
- future settlement states.

Player or faction action may invalidate or alter the conditions that produced the vision.

## 11.4 Principal Hazards

- Prophecy Dissonance;
- false-confidence from treating one future as certain;
- Lucidity Drift;
- dune-route shifts;
- Omen Grass / Time-Seed misinterpretation;
- Expectation Distortion;
- regional Coherence Collapse;
- hostile actors manipulating prophecy;
- Void corruption.

## 11.5 Content Interfaces

Prophecy Dunes provide suitable regions for:

- Omen Strider;
- Omen Grass;
- Time-Seeds;
- Omen Dust;
- Fate Glass states;
- Oracle Enclaves;
- Prophecy Markets;
- Caravan Oases;
- Oracle Halls;
- Prophecy Engine dungeons;
- Fate Custodian guardians;
- Sleeping Oracle influence.

---

# 12. Nightmare Thickets

## 12.1 Canonical Identity

**Nightmare Thickets** are dense fear-shaped forests and tangled dream ecologies produced by personal or collective anxiety, trauma, warning, defence, predation, and natural nightmare processes.

They may be:

- hostile;
- territorial;
- intelligent;
- protective;
- ecologically necessary;
- socially organised;
- damaged;
- misunderstood.

Nightmare Thickets are not inherently evil and are not automatically Void-corrupted.

## 12.2 Terrain

Common forms include:

- twisted Dreamstone outcrops;
- dark Dream Soil;
- Nightmare Thorn walls;
- looping paths;
- dense canopy;
- resin pools;
- fear-reactive clearings;
- hidden Warden routes;
- natural nests;
- defended nightmare settlements.

## 12.3 Route Looping

Routes may repeat or redirect while a supported nightmare condition remains unresolved.

Resolution may involve:

- understanding the source;
- resisting a supported fear response;
- negotiation;
- ecological intervention;
- route stabilisation;
- Warden support;
- combat;
- authority outcomes.

Simply possessing “courage” does not erase real predators, structures, inhabitants, or political conflict.

## 12.4 Healthy Nightmare Ecology

Restoration does not require converting Nightmare Thickets into pleasant Reverie Gardens.

A successful outcome may produce:

- stable nightmare habitat;
- managed predator populations;
- safe territorial boundaries;
- negotiated nightmare society;
- reduced harmful feedback;
- protected warning ecology;
- contained dangerous sites.

## 12.5 Principal Hazards

- Nightmare Pressure;
- Sleepwalker Loop in connected routes;
- Expectation Distortion;
- Fearling aggregation pressure;
- territorial predators;
- Nightmare Thorn barriers;
- Lucidity Drift;
- local Coherence Collapse;
- authority-scale fear architecture;
- Void corruption as a separate overlay.

## 12.6 Content Interfaces

Nightmare Thickets provide suitable regions for:

- Fearling;
- Nightmare Stalker;
- Nightmare Thorn;
- Nightmare Sap / Nightmare Resin sourcing;
- Fear Chitin sources;
- Warden Bastions;
- Nightmare Dominions;
- Protected Nightmare Settlements;
- Nightmare Wards;
- Nightmare Nest dungeons;
- Nest Warden guardians;
- Nightmare Architect territory;
- Collective Fear Sovereign emergence.

---

# 13. Sleepwalker Roads

## 13.1 Canonical Identity

**Sleepwalker Roads** are stable or semi-stable long-distance route environments linking coherence islands, settlements, Dreamgates, ports, cities, gardens, prophecy territories, nightmare regions, Waking Isles, and deeper Somnolent layers.

They are not merely roads placed inside another biome; they are a major environmental family because route logic, infrastructure, ecology, and settlement life are defining features.

## 13.2 Route Behaviour

Sleepwalker Roads may change between saved bounded route states according to:

- coherence;
- maintenance;
- Dream Walker knowledge;
- route ownership;
- current regional events;
- authority outcomes;
- beacon coverage;
- caravan activity;
- route damage;
- nightmare pressure.

They do not continuously invent arbitrary destinations.

## 13.3 Interdimensional Boundary

Sleepwalker Roads may:

- reveal other realms symbolically;
- carry dreams or messages;
- connect Somnolent regions;
- lead to Dreamgate infrastructure;
- resonate with external events.

They may **not** provide normal physical interdimensional travel outside the canonical Dreamgate system.

Older source language about accidentally entering another sleeper, era, or realm is narrowed to:

- intra-Somnolent personal/collective dream zones;
- memory or prophecy presentation;
- symbolic vision;
- route clues;
- Dreamgate-related discovery.

## 13.4 Terrain and Infrastructure

Common forms include:

- Dreamstone roadbeds;
- Road Chalk markings;
- beacon stones;
- symbolic milestones;
- Dreamwater crossings;
- caravan platforms;
- Roadback paths;
- route-side Dream Soil;
- bridge states;
- Lucid Beacon networks;
- Sleepwalker Caravanserais.

## 13.5 Principal Hazards

- Sleepwalker Loop;
- route misidentification;
- Coherence Collapse;
- Lucidity Drift;
- Nightmare Pressure;
- Dreamwater crossing hazards;
- caravan conflict or toll disputes;
- route damage;
- rare Waking Fracture;
- rare Void corruption.

## 13.6 Content Interfaces

Sleepwalker Roads provide suitable regions for:

- Roadback;
- Dream Grazer migration;
- Dream Walkers;
- couriers;
- Memory Thread / Courier Mote applications;
- Road Chalk;
- Route Stations;
- Caravanserais;
- Courier Settlements;
- Sleepwalker Caravanserai signature structures;
- route-rescue events;
- Dreamgate approach infrastructure.

---

# 14. Shattered Waking Isles

## 14.1 Canonical Identity

**Shattered Waking Isles** are regions where highly coherent dream matter and waking-like physical law have partially fused.

They are the most naturally compatible Somnolent regions for conventional construction, imported machinery, long-term visitor settlement, ordinary farming infrastructure, and physical engineering.

That compatibility comes with rupture risk.

## 14.2 Mixed-Reality Law

Local areas may switch or compete between bounded states such as:

- dream-dominant;
- waking-like physical;
- mixed;
- fractured.

These states may affect:

- gravity presentation where specifically supported;
- structural expectations;
- machinery operation;
- Dreamwater behaviour;
- route stability;
- creature habitat;
- Waking Stone formation.

The biome does not become a second Overworld.

## 14.3 Terrain

Common forms include:

- Waking Stone shelves;
- Dreamstone/Waking Stone fault lines;
- conventional-looking soil pockets;
- Dream Soil farms;
- fracture cliffs;
- mixed-material ruins;
- rupture basins;
- stable construction terraces;
- Dreamwater/waking-like shoreline conflicts;
- experimental settlement zones.

## 14.4 Principal Hazards

- Waking Fracture;
- structural rule mismatch;
- machinery faults;
- Dreamwater instability;
- Anchor Strain;
- Coherence Collapse at rupture edges;
- Waking Devourer activity;
- unstable relics;
- Void corruption.

## 14.5 Content Interfaces

Shattered Waking Isles provide suitable regions for:

- Waking Stone;
- Waking Ivy;
- Waking Shellback;
- Waking Devourer;
- mixed-reality farms;
- Waking Outposts;
- Mixed-Reality Towns;
- Research Colonies;
- Coherence Core infrastructure;
- Waking Labyrinth dungeons;
- Waking Sentinel guardians;
- advanced Dreamgate stabilisation research.

---

# 15. Deep Dream Abyss

## 15.1 Canonical Identity

The **Deep Dream Abyss** is the deepest natural region family of the Somnolent Expanse.

It contains extremely low-coherence environments where forgotten concepts, primal symbolic ecology, ancient dream formations, dormant powers, concept predators, and long-isolated dream systems accumulate.

It is dangerous because ordinary coherent reality becomes difficult to maintain.

It is **not** secretly the Void Between.

## 15.2 Topology

The Deep Dream Abyss may use:

- descending dream shelves;
- broken horizon layers;
- suspended Dreamstone masses;
- dissolving Dreamwater;
- concept-reactive caverns;
- isolated anchor stations;
- non-Euclidean-looking but bounded route geometry;
- enormous void-like visual spaces that remain Somnolent in ownership;
- ancient stable pockets surrounded by low coherence.

## 15.3 Material / Environmental Context

Appropriate environmental content includes:

- low-coherence Lucid Glass states described as Abyssal Dream Glass;
- Origin Mote states of Dream Motes;
- Deepbell;
- ancient Dreamstone;
- rare stabilisation sites;
- dormant structures;
- extreme Dreamwater currents or suspended pools.

Material definitions remain FCC-04C ownership.

## 15.4 Principal Hazards

- Concept Suppression;
- Coherence Collapse;
- Fragmenting/Dissolving environmental states;
- severe Lucidity Drift;
- Anchor Strain;
- Deep-Dream Surge;
- Dreamwater Undertow;
- route loss;
- dormant authority-scale phenomena;
- Void corruption as a separate external condition.

## 15.5 Content Interfaces

Deep Dream Abyss provides suitable regions for:

- Concept Leech;
- Deepbell;
- Origin Mote states;
- Deep-Dream Expedition Camps;
- Anchor Stations;
- ancient isolated Dream Settlements;
- high-risk research;
- realm-climax paths;
- rare megadungeon-scale content built from the existing dungeon families;
- ancient authority or sovereign consequences where later documents justify them.

---

# 16. Dreamwater Environmental Model

## 16.1 Canonical Role

**Dreamwater** is the native water-compatible fluid family of the Somnolent Expanse.

At the environmental level, it supports:

- seas;
- rivers/canals;
- garden pools;
- fisheries;
- swimming;
- ports;
- aquatic ecology;
- route currents;
- environmental hazards.

It should reuse universal fluid/swimming infrastructure where feasible rather than requiring a wholly separate fluid-physics engine.

## 16.2 Coherence Interaction

Dreamwater behaviour may vary by coherence state through bounded profiles.

Examples:

- Anchored/Stable: predictable currents and conventional buoyancy;
- Mutable: route-linked flow or symbolic current changes;
- Unstable: intermittent undertow or reduced navigation reliability;
- Fragmenting: broken pools, suspended sheets, discontinuous current paths;
- Dissolving: highly unreliable form restricted to dangerous authored environments.

Exact material/block/item and containment definitions belong to FCC-04C/G.

---

# 17. Dreamgate Destination Environmental Contract

FCC-04B does not define the Dreamgate recipe or universal portal runtime.

It owns destination environmental suitability.

A valid Dreamgate destination region should, by default, provide or generate access to:

- stable collision;
- non-lethal immediate terrain;
- sufficient local coherence for arrival;
- a viable return interaction according to universal Realm Access rules;
- readable orientation;
- no forced spawn inside active environmental hazard volumes;
- nearby pathing sufficient to leave the portal footprint.

A deliberately dangerous destination may exist only where the route is clearly established as challenge content and still obeys universal safe-return requirements.

Dreamgate Sanctuaries are preferred civilised destination infrastructure but are not mandatory at every portal.

---

# 18. Biome Transition and Route Validation

World generation must validate that the Somnolent network remains traversable enough to support intended progression.

Validation should account for:

- biome adjacency;
- coherence bands;
- Dreamwater crossings;
- Sleepwalker Road reachability;
- Dreamgate destination safety;
- settlement isolation risk;
- Deep Dream access staging;
- route redundancy where progression requires it;
- hazard pressure;
- authority-controlled chokepoints;
- dungeon access;
- return-route recoverability.

The network may be strange, but it must not become accidentally impossible.

---

# 19. Environmental Simulation and Scaling

## 19.1 Authoritative State

The following are authoritative and persist where applicable:

- biome family;
- local biome variant;
- coherence state;
- regional environmental state;
- active hazard state;
- route state;
- Dreamwater state where gameplay-relevant;
- stabilisation state;
- major environmental event state;
- corruption state;
- player/settlement-authored terrain edits.

## 19.2 Near Simulation

Near the player, the engine may simulate:

- visible route transitions;
- Dreamwater currents;
- expectation-responsive objects;
- local environmental hazards;
- active coherence effects;
- dynamic props;
- creature/environment reactions;
- local VFX/audio.

## 19.3 Far Simulation

Distant regions should use coarse deterministic summaries.

Far simulation may update:

- coherence trend;
- route availability;
- environmental event duration;
- settlement stabilisation pressure;
- nightmare-front movement;
- restoration or collapse state;
- Waking Fracture pressure;
- Void-corruption pressure.

It must not simulate every symbolic object continuously.

## 19.4 Performance Profiles

Lower simulation profiles may reduce:

- active environmental particle density;
- visual route morphing;
- Dreamwater surface complexity;
- frequency of nonessential cosmetic state transitions;
- distant symbolic effects;
- local decorative thoughtform activity.

They must preserve authoritative gameplay outcomes.

---

# 20. Determinism and Save Safety

Somnolent environmental systems must remain save-safe despite their dreamlike presentation.

The following rules are mandatory:

1. A saved biome does not silently regenerate into another biome on reload.
2. Coherence-state changes reproduce from authoritative state.
3. Route-state changes persist.
4. Expectation-responsive sites use explicit flags/state rather than unrecorded randomness.
5. Prophecy-driven environmental changes retain the conditions that caused them.
6. Memory City alternate states retain their selected/generated identity.
7. Nightmare Front movement persists through regional state, not cosmetic-only VFX.
8. Waking Fracture repairs or worsening persist.
9. Deep-Dream progression remains reproducible.
10. Void corruption remains distinguishable from ordinary low coherence or nightmare states.
11. Player-owned construction does not disappear merely because a region enters a lower coherence state unless a specific supported destruction rule resolves authoritatively.
12. Map/Codex/save data must not be permanently deleted by perception hazards.

---

# 21. Accessibility and Environmental Readability

Somnolent environmental effects may intentionally create uncertainty, but the game must remain playable.

Accessibility options may reduce or replace:

- heavy screen distortion;
- strong dream blur;
- repeated camera warping;
- intense flicker;
- rapid symbolic texture changes;
- deep parallax effects;
- aggressive chromatic effects;
- dense nightmare particles;
- visually confusing horizon shifts;
- moving-road presentation;
- strong Dreamwater distortion.

Important gameplay states require redundant cues using combinations of:

- colour;
- silhouette;
- particles;
- sound;
- UI/Codex text;
- route markers;
- material state;
- environmental props;
- map state;
- iconography.

Critical distinctions that must never rely on colour alone include:

- stable versus unsafe route;
- natural nightmare versus Void corruption;
- ordinary low coherence versus Waking Fracture;
- Dreamwater hazard state;
- Dreamgate destination safety;
- prophecy warning versus guaranteed event.

Accessibility settings may reduce presentation intensity without changing authoritative world state unless an explicit gameplay-assist setting says otherwise.

---

# 22. Cross-Document Ownership Matrix

| Content | Owning FCC Document | FCC-04B Responsibility |
|---|---|---|
| Realm laws, Lucidity, Expectation, Waking Anchor, Dream-Time, Dreamgate access principle | FCC-04A | Consumes environmental consequences |
| Geology/material definitions | FCC-04C | Provides terrain context and distribution suitability |
| Flora, Reverie Tree/Wood, crops, fungi, food | FCC-04D | Provides biome and coherence suitability |
| Creatures | FCC-04E | Provides habitat and environmental-state interfaces |
| Civilisations/settlements | FCC-04F | Provides settlement suitability and environmental constraints |
| Structures, Dreamgate implementation, Blocks, Items, recipes | FCC-04G | Provides site suitability and environmental-state hooks |
| Dungeons, guardians, authorities, events | FCC-04H | Provides site/state/hazard interfaces |
| Nightmare dynamics, stabilisation, Void corruption, cross-realm interactions | FCC-04I | Defines baseline environmental distinction and overlay hooks |
| Final registry / art handoff | FCC-04J | Supplies biome/environment registry and state taxonomy |

No FCC-04B rule may seize ownership from another document.

---

# 23. Source Reconciliation and Supersession Notes

The following environment-facing changes supersede or narrow older Somnolent source definitions where necessary:

1. The eight Set 24 Somnolent biome families are retained and canonically locked.
2. Older references to **lucid water** are reconciled under the canonical **Dreamwater** fluid family.
3. Older **sleep motes**, **origin motes**, and **courier motes** do not automatically become separate major materials; Dream Mote is the canonical parent where the accepted FCC decisions define those as states/descriptors.
4. Older **dream thread** language is reconciled under canonical **Memory Thread** rather than a duplicate fibre family.
5. Older **Fate Glass** and **Abyssal Dream Glass** are states/derived forms of canonical **Lucid Glass** unless later material reconciliation proves a distinct physical definition is necessary.
6. Older **Nightmare Sap** remains a raw biological precursor to canonical **Nightmare Resin**, not a competing major resin.
7. **Dream Sand**, **Dream Soil**, **Dreamstone**, **Dreamwater**, and **Waking Stone** are terrain/substrate/environmental foundations; the six principal realm resources remain separately governed by FCC-04C.
8. Lucid Shores no longer imply that all players arrive by sleeping; they are common safe/coherent arrival environments associated with Dreamgate infrastructure.
9. Sleepwalker Roads cannot enter another realm or become interdimensional shortcuts. They are intra-Somnolent routes and information/resonance infrastructure only.
10. Shattered Waking Isles no longer bridge to a separately simulated waking body. Their identity is mixed dream/waking-like physical law inside Somnolent.
11. Deep Dream Abyss is not the Void Between.
12. Natural Nightmare Thickets are not equivalent to Void-corrupted regions.
13. Memory Cities are not automatic copies of every external settlement or private memory.
14. Prophecy Dunes model conditional possible futures, not guaranteed destiny.
15. Environmental mutation is constrained to deterministic saved state rather than unrestricted runtime imagination.

---

# 24. Implementation-Facing Environmental Requirements

Any future Somnolent environment implementation should support, at minimum:

- eight stable biome-family identifiers;
- biome suitability tags;
- region/site coherence state;
- regional environmental-state overlays;
- hazard-family tags;
- route-state identity;
- Dreamwater environmental profile;
- Dreamgate destination-suitability checks;
- deterministic transition-state selection;
- saved environmental event state;
- corruption-state separation;
- settlement/structure suitability queries;
- creature/flora habitat queries;
- dungeon/authority suitability queries;
- simulation-LOD summaries;
- accessibility-facing effect channels.

The implementation may simplify visuals or local simulation while preserving these semantic outputs.

---

# 25. FCC-04B Acceptance Gate

FCC-04B is accepted only if all of the following remain true:

- exactly eight major Somnolent biome families are recognised;
- all biome identities are distinct enough to justify separate world-generation families;
- Dream Network topology remains deterministic and persistent;
- the six canonical coherence states are preserved;
- regional environmental states remain overlays rather than extra biomes;
- all twelve hazard families are represented;
- Lucid Shores preserve safe/coherent arrival identity without reintroducing sleep-only travel;
- Reverie Gardens support intentional cultivation without unrestricted imagination editing;
- Memory Cities support contradictory reconstructed states without claiming automatic historical truth;
- Prophecy Dunes preserve conditional futures;
- Nightmare Thickets preserve natural nightmare ecology as distinct from Void corruption;
- Sleepwalker Roads remain intra-realm;
- Shattered Waking Isles preserve mixed physical/dream law without a duplicate waking body;
- Deep Dream Abyss remains Somnolent, not Void;
- Dreamwater reuses bounded fluid infrastructure rather than demanding an unrelated full physics engine;
- portal destination safety is explicit;
- save/reload reproduces environmental state;
- lower performance profiles may simplify simulation without changing authoritative outcomes;
- accessibility requirements preserve gameplay readability;
- material, flora, creature, settlement, dungeon, corruption, and portal-runtime ownership remain in their correct later FCC documents.

**FCC-04B status:** **LOCKED FOR REALM-LOCAL FCC USE - pending final cross-realm reconciliation.**

---

# 26. Source and Decision Provenance

FCC-04B reconciles the following principal source families:

- FCC-04A - Somnolent Expanse Realm Identity, Laws, Progression & Canon Boundaries;
- Foundation Documents 00-20;
- Document 11 - Biomes & World Generation;
- Document 14 - Dimensions;
- World Content Atlas Set 24, especially 24D - Dimensions, Realm Structure and Realm Biome Atlas;
- World Content Atlas realm resource/environment references;
- post-Atlas governance and registry rules;
- accepted FCC-04 interview decisions Q246-Q390.

Where earlier source wording conflicts with accepted FCC decisions, the accepted FCC decisions and current cross-set ownership rules take precedence for realm-local canon.

---

# 27. Final Realm-Local Lock

At FCC-04B v0.1:

**Biome roster:** locked.  
**Dream Network environmental topology:** locked.  
**Coherence states:** locked.  
**Regional environmental states:** locked.  
**Environmental hazard roster:** locked.  
**Lucid Shores identity:** locked.  
**Reverie Gardens identity:** locked.  
**Memory Cities identity:** locked.  
**Prophecy Dunes identity:** locked.  
**Nightmare Thickets identity:** locked.  
**Sleepwalker Roads identity:** locked.  
**Shattered Waking Isles identity:** locked.  
**Deep Dream Abyss identity:** locked.  
**Dreamwater environmental contract:** locked.  
**Dreamgate destination-environment contract:** locked.  
**Determinism/save-safety rules:** locked.  
**Simulation-scaling rules:** locked.  
**Accessibility/readability rules:** locked.  
**Detailed material/flora/creature/civilisation/dungeon/corruption ownership:** deferred to the correct later FCC-04 documents.

No future Somnolent environmental content should:

- create a ninth top-level biome without reopening realm canon;
- treat ordinary low coherence as Void corruption;
- treat natural nightmare as Void corruption;
- turn Sleepwalker Roads into normal cross-realm travel;
- make Waking Fractures into a duplicate-body system;
- treat prophecy imagery as guaranteed future truth;
- treat Memory City reconstruction as automatically factual;
- mutate world state without authoritative persistence;
- delete player-owned knowledge or construction as a cosmetic dream effect;
- create new major materials merely because a biome uses a descriptive local term;
- bypass universal Dreamgate travel rules.

> **FCC-04 SOMNOLENT EXPANSE - CONTENT CANON LOCKED - pending final cross-realm reconciliation.**
