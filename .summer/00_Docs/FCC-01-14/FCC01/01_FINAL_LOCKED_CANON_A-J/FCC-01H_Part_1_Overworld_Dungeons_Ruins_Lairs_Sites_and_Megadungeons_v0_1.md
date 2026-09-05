# Leyforge Final Content Canon Collection

## FCC-01H — Overworld Dungeons, Lairs, Megadungeons, Bosses, Titans, Authorities & Major Encounters
### Part 1 — Dungeons, Ruins, Lairs, Exploration Sites & Megadungeons

**Version:** 0.1  
**Status:** Content Canon — Interview-Locked Writing Draft  
**World:** Overworld  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Physical Volume:** FCC-01H Part 1 of 2  
**Canonical Document Identity:** Parts 1 and 2 together constitute **FCC-01H**. The split is editorial only and does not create separate canon owners.  
**Interview Basis:** FCC-01 S27, Questions 1009–1052, plus the Phase V S26–S28 reconciliation audit.  
**Primary Source Feed:** World Content Atlas 24G; Document 12 persistent structures; 24F ecology; 24H bosses; 24I structures/routes; 24J rewards/provenance; 24K history/events; Sets 25/28/30; accepted S27 interview locks.  
**Consumes:** FCC-01A–G.  
**Part 2 Handoff:** FCC-01H Part 2 owns boss, dungeon-authority, siege-threat, Titan and major-encounter identity.  
**Package Status:** FCC-01 theoretical design is complete; A–J writing is in progress. Formal `FCC-01 CONTENT CANON LOCKED` remains pending completion of all A–J documents and the document-to-interview fidelity audit.

---

# 1. Purpose

FCC-01H Part 1 defines the authoritative Overworld content canon for:

- exploration sites;
- points of interest;
- micro-dungeons;
- lairs and nests;
- ruins;
- dungeons;
- complexes;
- mobile dungeons;
- megadungeons;
- site history and provenance;
- procedural topology;
- room/hazard/puzzle grammar boundaries;
- entrances, alternate routes and return safety;
- ecology, factions, settlements and personhood inside sites;
- rewards and salvage provenance;
- ownership, occupation and restoration;
- reoccupation without generic reset;
- Forge/site-authoring requirements;
- exactly **72 current Overworld principal site-family foundations**;
- exactly **12 megadungeon foundations**.

It does **not** own final boss mechanics, combat numbers, final loot recipes, exact room dimensions, final procedural algorithms, movement implementation, art palettes, VFX, audio or technical performance budgets.

---

# 2. Site Canon Statement

A site is a **coherent explorable persistent place** with:

- a reason to exist;
- topology;
- origin;
- history;
- current state;
- ecology and/or occupants;
- ownership/claim context where applicable;
- meaningful interactions;
- persistent consequences.

The central rule is:

> **A dungeon, ruin, lair or megadungeon must reveal history, support ecology or faction activity, provide meaningful traversal and decisions, and leave persistent consequences. It cannot exist only as a corridor of enemies and chests.**

Every meaningful site should answer at least one world question:

- what built it?
- what inhabited it?
- what damaged it?
- what feeds it?
- what protects it?
- what uses it now?
- what remembers it?
- who claims it?
- what does it reveal?
- what can it unlock?
- how can it be restored?
- what changes if the player intervenes?

---

# 3. Site Ownership Boundary

FCC-01H Part 1 owns:

- site-family identity;
- origin/purpose;
- topological grammar;
- site state;
- compatible occupancy/ecology;
- adventure/exploration role;
- restoration possibilities;
- persistent site aftermath.

Other owners remain authoritative:

| Question | Primary Owner |
|---|---|
| What physical structure modules form the site? | FCC-01G / Structure runtime |
| What creatures/populations inhabit it? | FCC-01E / ecology runtime |
| Who built/claims/occupies it socially? | FCC-01F / faction-civilisation systems |
| What named boss/authority appears? | FCC-01H Part 2 |
| What exact rewards/items exist? | FCC-01C + FCC-12/13, reward/economy systems |
| What historical incident/event shaped it? | FCC-01I |
| Can a mover traverse a passage? | Set 30 |
| Exact combat resolution? | Combat |
| Exact layout-generation algorithm? | Later technical rebuild |
| Final voxel/art source? | Forge + later art governance |

A site does not duplicate the structures, creatures, factions or items that participate in it.

---

# 4. Site Taxonomy

The canonical taxonomy is:

| Taxon | Meaning |
|---|---|
| **Point of Interest** | Small discoverable place with one principal clue, interaction, resource or world relationship. |
| **Micro-dungeon** | Compact authored/procedural challenge with bounded traversal, hazard, puzzle, ecology or encounter content. |
| **Lair / Nest** | Site primarily shaped by a creature/population's habitat, lifecycle or territory. |
| **Ruin** | Former built place whose historical transformation and current state are central to identity. |
| **Dungeon** | Coherent multi-zone adventure site with traversal, state and meaningful resolution. |
| **Complex** | Large interconnected site with several structures/zones/functions and persistent internal relationships. |
| **Megadungeon** | Multi-session region-scale site with districts, factions/ecologies, logistics, multiple routes and regional aftermath. |
| **Mobile Dungeon** | Site whose physical host moves; movement remains owned by the underlying creature/vessel/construct/system. |
| **Realm Dungeon** | Dungeon physically located in another realm and owned by that realm FCC rather than FCC-01. |

“Dungeon” is therefore an adventure/site identity, not a synonym for underground stone corridor.

---

# 5. Scale Bands

S27 uses the following scale bands:

| Band | Meaning |
|---|---|
| **S0 — Site Feature** | Small point, chamber, clue or local interaction. |
| **S1 — Micro** | Short compact adventure site. |
| **S2 — Small** | Several rooms/zones with a coherent short expedition. |
| **S3 — Standard** | Full dungeon/site with multiple routes/encounter layers. |
| **S4 — Large** | Major multi-zone site with stronger logistics and persistent internal state. |
| **S5 — Complex** | District-like or institution-scale site with several interdependent systems/occupants. |
| **S6 — Megadungeon** | Region-scale multi-session expedition space with the dedicated megadungeon completeness contract. |

Scale does not determine hostility.

A large site may contain a functioning settlement or neutral community.

---

# 6. History Layer Contract

Every major generated site should contain at minimum:

1. **Origin layer** — who/what formed or built it and why.
2. **Historical transition** — at least one meaningful change after origin.
3. **Current-state explanation** — why the site is in its present physical/social/ecological condition.

Possible transitions include:

- expansion;
- war;
- abandonment;
- disaster;
- occupation;
- religious change;
- collapse;
- flooding;
- magical accident;
- resource exhaustion;
- migration;
- restoration;
- realm contact with valid provenance.

History must leave evidence through real world content such as:

- architecture;
- repairs;
- collapsed routes;
- documents;
- remains;
- material provenance;
- ownership records;
- ecology;
- faction memory.

---

# 7. Procedural Layout Rule

Site instances are assembled from **authored families and bounded modular grammars**.

Randomisation may vary:

- room order;
- branches;
- elevation;
- entrances;
- damage;
- occupancy;
- hazards;
- puzzle placement;
- reward location;
- historical state.

It must preserve:

- site identity;
- logical relationships;
- accessibility;
- solvability;
- readable environmental storytelling;
- return safety.

Unconstrained random-room soup is rejected.

---

# 8. Grammar Before Geometry

A valid site is generated from semantic relationships before raw geometry.

The generator should know concepts such as:

- entrance;
- public zone;
- secured zone;
- production area;
- shrine;
- archive;
- nest;
- water route;
- escape route;
- boss/authority socket;
- infrastructure link;
- restoration target

before choosing final voxel module geometry.

This allows the Forge to author reusable semantic pieces without turning every dungeon into one handmade immutable scene.

---

# 9. Source Modular Libraries

The source 24G Atlas establishes reusable libraries of:

- **24 room modules**;
- **20 hazard/trap modules**;
- **16 puzzle grammars**.

S27 preserves that modular-grammar architecture.

FCC-01H does not re-author or guess every exact source-module name where the accepted interview did not separately lock them.

The important canon requirement is that modules remain:

- authored;
- readable;
- mechanically justified;
- compatible with site identity;
- validation-aware;
- reusable without erasing environmental/cultural distinctions.

---

# 10. Solvability and Critical Path

Generated sites validate:

- at least one valid entrance;
- critical-path reachability;
- alternate-route policy;
- lock/key or permission order;
- puzzle dependencies;
- authority/boss access where applicable;
- exit/return route;
- multiplayer join/re-entry safety where supported.

No mandatory key may spawn behind the door it opens.

No generated collapse may permanently seal required progression without a valid alternate or repair solution.

---

# 11. Multiple Entrances and Routes

Sites can use:

- primary entrances;
- secondary entrances;
- vertical shafts;
- waterways;
- ruined breaches;
- connected caves;
- faction-controlled gates;
- restored shortcuts;
- player-created breaches.

Multiple entries can expose different:

- risks;
- factions;
- puzzles;
- permissions;
- traversal capabilities.

The game should not assume every site has one front door followed by one linear route.

---

# 12. Voxel Sandbox and Physical Breaching

The default is that site terrain/structures remain subject to normal world rules.

Players can generally:

- mine;
- place;
- bridge;
- dig;
- repair;
- reinforce;
- create new routes

where capability, ownership and material rules permit.

Arbitrary unbreakable dungeon walls used only to enforce encounter order are rejected.

Exceptions require an actual authored physical/magical reason.

If a player physically breaches a legal/heritage/security boundary, consequences may include:

- trespass;
- alarm;
- structural damage;
- collapse risk;
- faction hostility;
- loss of archaeological value.

Sandbox freedom does not erase consequence.

---

# 13. Locks, Puzzles and Sequence Breaking

A site may use:

- physical locks;
- keys;
- machinery;
- pressure/water routing;
- runes;
- ritual conditions;
- law/permission;
- historical knowledge;
- ecology.

But the physical world remains authoritative.

A sufficiently capable player may sometimes:

- mine around;
- repair a bypass;
- use alternate power;
- use another compatible tool;
- negotiate permission;
- enter another route.

Such sequence breaking is valid when the world state actually supports it.

---

# 14. Ecology and Occupancy

Sites can contain:

- wildlife;
- predators;
- nests;
- fungi;
- spirits;
- undead;
- constructs;
- workers;
- factions;
- refugees;
- scholars;
- settlements;
- neutral residents;
- non-hostile guardians.

Unexplained infinite point spawning is not the default ecology model.

Occupancy should trace to:

- habitat;
- migration;
- faction activity;
- history;
- reoccupation;
- summoning/creation with real source;
- world event.

---

# 15. Personhood

A dungeon label does not convert residents into monsters.

A site may contain:

- sapient communities;
- intelligent undead;
- Awakened Constructs;
- prisoners;
- cults;
- researchers;
- faction civilians;
- refugees.

Personhood remains authoritative regardless of:

- hostility;
- species/ancestry;
- dungeon location;
- legal status.

“Clear the dungeon” cannot silently mean “kill every person living there.”

---

# 16. Ownership and Claims

A site can track:

- original builder;
- historical owners;
- current claimant;
- current occupier;
- legal jurisdiction;
- sacred/heritage status;
- disputed claims;
- player/faction ownership.

Occupation and legal ownership remain distinct.

Opening a tomb or warehouse may therefore carry:

- theft;
- archaeology;
- inheritance;
- cultural;
- faction

consequences depending on actual law/history.

---

# 17. Rewards and Provenance

Rewards must have real origin.

Valid site rewards can include:

- existing materials;
- salvage;
- stored goods;
- equipment;
- documents;
- maps;
- recipes/knowledge where appropriate;
- relics;
- faction access;
- route rights;
- ownership rights;
- restoration value;
- research;
- infrastructure.

A dungeon does not create generic `Dungeon Essence` simply because the player completed it.

Rare objects require actual:

- maker;
- owner;
- storage history;
- geological source;
- creature source;
- realm-transfer provenance.

---

# 18. No Generic Loot Reset

Ordinary site loot/infrastructure/doors/puzzles are persistent.

A looted chest remains looted unless:

- an owner restocks it;
- a faction reoccupies;
- a valid replenishment rule applies;
- a world setting deliberately enables reset.

A solved puzzle stays solved unless a specific machine/cycle/occupant resets it through authored behaviour.

A dead unique authority does not respawn because an invisible dungeon timer expired.

---

# 19. Reoccupation Without Reset

A cleared site may later be reoccupied.

Reoccupation must respect:

- current owner;
- structural condition;
- available routes;
- ecology;
- nearby population/factions;
- player construction;
- prior liberation;
- historical outcome.

This produces a **new causal world state**, not a reset to the original encounter.

A restored fortress may later be occupied by traders or guards rather than magically respawning its old enemies.

---

# 20. Site Resolution and Conversion

Where physical structure permits, resolved sites may become:

- settlement;
- outpost;
- mine;
- quarry;
- industrial site;
- archive;
- research station;
- fortress;
- route station;
- prison;
- farm;
- shrine;
- port;
- refuge;
- protected heritage site;
- sealed site.

Conversion keeps relevant history.

A dungeon can therefore become civilisation infrastructure.

---

# 21. The Final 72 Overworld Site-Family Portfolio

S27 locks exactly **72 principal Overworld site families**, organised into twelve six-entry portfolio groups.

| # | Portfolio Family | Canonical Site Foundation |
| --- | --- | --- |
| 1 | Natural Caverns, Living Geography & Colossal Remains | Echo Limestone Caverns |
| 2 | Natural Caverns, Living Geography & Colossal Remains | Greatroot Galleries |
| 3 | Natural Caverns, Living Geography & Colossal Remains | Basalt Lava Tubes |
| 4 | Natural Caverns, Living Geography & Colossal Remains | Glacier Vein Caves |
| 5 | Natural Caverns, Living Geography & Colossal Remains | Coral Hollow Labyrinth |
| 6 | Natural Caverns, Living Geography & Colossal Remains | Colossal Remains Interior |
| 7 | Roadside, Rural, Frontier & Settlement Ruins | Abandoned Waystation |
| 8 | Roadside, Rural, Frontier & Settlement Ruins | Collapsed Hill Hamlet |
| 9 | Roadside, Rural, Frontier & Settlement Ruins | Burned Border Manor |
| 10 | Roadside, Rural, Frontier & Settlement Ruins | Flooded River Village |
| 11 | Roadside, Rural, Frontier & Settlement Ruins | Overgrown Orchard Estate |
| 12 | Roadside, Rural, Frontier & Settlement Ruins | Deserted Caravanserai |
| 13 | Mines, Quarries, Excavations & Industrial Ruins | Layered Copper Mine |
| 14 | Mines, Quarries, Excavations & Industrial Ruins | Deep Ironworks |
| 15 | Mines, Quarries, Excavations & Industrial Ruins | Crystal Purity Excavation |
| 16 | Mines, Quarries, Excavations & Industrial Ruins | Marble Quarry Labyrinth |
| 17 | Mines, Quarries, Excavations & Industrial Ruins | Salt Cathedral Works |
| 18 | Mines, Quarries, Excavations & Industrial Ruins | Abandoned Mechanist Foundry |
| 19 | Crypts, Tombs, Necropolises & Memorial Sites | Clan Barrow Complex |
| 20 | Crypts, Tombs, Necropolises & Memorial Sites | Royal Processional Tomb |
| 21 | Crypts, Tombs, Necropolises & Memorial Sites | Catacomb Aqueduct |
| 22 | Crypts, Tombs, Necropolises & Memorial Sites | Battlefield Ossuary |
| 23 | Crypts, Tombs, Necropolises & Memorial Sites | Plague-Sealed Necropolis |
| 24 | Crypts, Tombs, Necropolises & Memorial Sites | Ancestral Mountain Vault |
| 25 | Shrines, Temples, Monasteries & Ritual Sites | Leyline Pilgrimage Shrine |
| 26 | Shrines, Temples, Monasteries & Ritual Sites | Storm-Cliff Monastery |
| 27 | Shrines, Temples, Monasteries & Ritual Sites | Sunken River Temple |
| 28 | Shrines, Temples, Monasteries & Ritual Sites | Moon Garden Sanctuary |
| 29 | Shrines, Temples, Monasteries & Ritual Sites | Broken Covenant Circle |
| 30 | Shrines, Temples, Monasteries & Ritual Sites | Ash Pilgrim Basilica |
| 31 | Towers, Archives, Observatories & Laboratories | Ruined Surveyor Tower |
| 32 | Towers, Archives, Observatories & Laboratories | Sealed Mage Observatory |
| 33 | Towers, Archives, Observatories & Laboratories | Fungal Apothecary Spire |
| 34 | Towers, Archives, Observatories & Laboratories | Archive of Broken Roads |
| 35 | Towers, Archives, Observatories & Laboratories | Timeworn Weather Station |
| 36 | Towers, Archives, Observatories & Laboratories | Forbidden Transmutation House |
| 37 | Fortresses, Prisons, Siegeworks & Military Complexes | Frontier Hillfort |
| 38 | Fortresses, Prisons, Siegeworks & Military Complexes | Pass-Gate Fortress |
| 39 | Fortresses, Prisons, Siegeworks & Military Complexes | Island Prison Keep |
| 40 | Fortresses, Prisons, Siegeworks & Military Complexes | Collapsed Siegeworks |
| 41 | Fortresses, Prisons, Siegeworks & Military Complexes | Border Watch Network |
| 42 | Fortresses, Prisons, Siegeworks & Military Complexes | Occupied River Castle |
| 43 | Urban, Civic & Buried-City Sites | Buried Market Quarter |
| 44 | Urban, Civic & Buried-City Sites | Drowned Canal District |
| 45 | Urban, Civic & Buried-City Sites | Ash-Covered Civic Forum |
| 46 | Urban, Civic & Buried-City Sites | Undercity Utility Maze |
| 47 | Urban, Civic & Buried-City Sites | Abandoned Academy Campus |
| 48 | Urban, Civic & Buried-City Sites | Lost Port Warehouse City |
| 49 | Marine, Coastal, Island & Submerged Sites | Stormreef Wreck Field |
| 50 | Marine, Coastal, Island & Submerged Sites | Tidal Sea Cave Temple |
| 51 | Marine, Coastal, Island & Submerged Sites | Sunken Observatory |
| 52 | Marine, Coastal, Island & Submerged Sites | Abyssal Mining Platform |
| 53 | Marine, Coastal, Island & Submerged Sites | Mangrove Smuggler Maze |
| 54 | Marine, Coastal, Island & Submerged Sites | Living Reef Citadel |
| 55 | Aerial, Skyland, Mountain & High-Altitude Sites | Fallen Skyship Graveyard |
| 56 | Aerial, Skyland, Mountain & High-Altitude Sites | Cloud Monastery Chain |
| 57 | Aerial, Skyland, Mountain & High-Altitude Sites | Thunderhead Citadel |
| 58 | Aerial, Skyland, Mountain & High-Altitude Sites | Cliffside Liftworks |
| 59 | Aerial, Skyland, Mountain & High-Altitude Sites | Gravity-Scar Observatory |
| 60 | Aerial, Skyland, Mountain & High-Altitude Sites | Roc-Nest Mesa |
| 61 | Underground, Deepstone, Magma & Subterranean Sites | Deepstone Trade Road |
| 62 | Underground, Deepstone, Magma & Subterranean Sites | Fungal Basin Settlement Ruin |
| 63 | Underground, Deepstone, Magma & Subterranean Sites | Magma Forge Complex |
| 64 | Underground, Deepstone, Magma & Subterranean Sites | Buried Machine Stratum |
| 65 | Underground, Deepstone, Magma & Subterranean Sites | Subterranean Sea Citadel |
| 66 | Underground, Deepstone, Magma & Subterranean Sites | Abyssal Fracture Camp |
| 67 | Magical, Ancient, Corrupted & Special Sites | Leyline Convergence Vault |
| 68 | Magical, Ancient, Corrupted & Special Sites | Dream-Leak Manor |
| 69 | Magical, Ancient, Corrupted & Special Sites | Void-Scar Anchor Maze |
| 70 | Magical, Ancient, Corrupted & Special Sites | Blightheart Sanctuary |
| 71 | Magical, Ancient, Corrupted & Special Sites | Starfall Glass Labyrinth |
| 72 | Magical, Ancient, Corrupted & Special Sites | Ancient World-Node |

These 72 are the final current principal Overworld site portfolio for FCC-01.

Older source IDs/names remain migration evidence where later display/canon wording changed.

---

# 22. Final Name Migrations

## 22.1 Greatroot Galleries

Older source wording used **Worldroot Galleries**.

Final FCC-01 display/content identity is:

> **Greatroot Galleries**

It represents native Overworld Greatroot/colossal-root ecology.

Greatroot networks do not provide physical realm travel.

Historical source IDs containing `worldroot_galleries` remain migration evidence until FCC-13/technical registry cleanup.

## 22.2 Subterranean Sea Citadel

Older source wording used **Blackwater Citadel** for the Overworld site.

Final FCC-01 Overworld display identity is:

> **Subterranean Sea Citadel**

This avoids collision with the realm-specific Impossible Deep Blackwater terminology.

It remains a finite Overworld subterranean-sea site.

---

# 23. Portfolio Realm-Provenance Safeguards

Several site names deliberately look strange. Their names do not automatically override provenance rules.

## Greatroot Galleries

Native Overworld Greatroot/colossal-root content.

Not a Covenant Portal or cross-realm Rootway.

## Moon Garden Sanctuary

May support native lunar, dreamlike, memory or magical themes.

Dream resonance does not automatically make it a Dreamgate or Somnolent site.

## Broken Covenant Circle

“Covenant” can describe historical ritual/political/religious context.

It is not automatically a Covenant Portal.

Specific Verdant provenance must be established independently.

## Ash Pilgrim Basilica

Ash can arise through:

- fire;
- cremation;
- volcanic history;
- war;
- ritual.

The site is not automatically Ashen.

## Gravity-Scar Observatory

May study native Overworld gravity anomalies.

It does not automatically prove Ascendant, Impossible Deep or Void provenance.

## Dream-Leak Manor

A true Somnolent leak requires explicit Somnolent provenance.

Otherwise dreamlike phenomena remain native/uncertain magic and the site must not claim realm transfer.

## Void-Scar Anchor Maze

The final identity requires **actual Void provenance** when instantiated as a true Void-scar site.

Darkness or strange geometry is insufficient.

## Blightheart Sanctuary

Native non-Void blight is valid.

The site does not become Void content merely because blight is present.

## Starfall Glass Labyrinth

Starfall/cosmic meteor provenance can be native Overworld history.

Cosmic does not automatically equal Ascendant or Void.

## Ancient World-Node

This is bounded ancient Overworld infrastructure/history.

It cannot silently reactivate:

- World-Engine realm access;
- a generic portal network;
- deferred realm progression.

Any actual function must be established by generated history/provenance.

---

# 24. Deep and Marine Site Boundaries

**Abyssal Mining Platform** and **Abyssal Fracture Camp** can exist at extreme finite Overworld depth.

“Abyssal” does not mean Impossible Deep.

**Subterranean Sea Citadel** is a finite Overworld subterranean-sea site.

**Living Reef Citadel**, Stormreef Wreck Field and other marine sites consume FCC-01B/E and universal maritime rules rather than becoming separate realm spaces.

---

# 25. Aerial Site Boundary

Fallen Skyship Graveyard, Cloud Monastery Chain, Thunderhead Citadel, Cliffside Liftworks, Gravity-Scar Observatory and Roc-Nest Mesa are all **Overworld** sites.

They may use:

- altitude;
- storms;
- floating islands;
- aerial fauna;
- air vessels;
- vertical routes.

They cannot reach Ascendant Reach without Ascension Gate.

---

# 26. Megadungeon Definition

A megadungeon is not simply a very long dungeon.

It is a persistent multi-session world region containing:

- districts;
- internal history;
- factions/settlements;
- ecology;
- routes/shortcuts;
- logistics;
- changing ownership/state;
- campaign-scale consequences.

Players may enter, leave, establish outposts, return later and encounter changed conditions.

---

# 27. Megadungeon Minimum Completeness Contract

Every S6 megadungeon must provide at least:

- **5 districts**;
- **3 entrances**;
- **2 factions or settlements**;
- **2 ecology layers**;
- **1 macro-puzzle/systemic expedition problem**;
- meaningful expedition logistics;
- regional aftermath.

It also requires:

- persistent district state;
- multiple route orders;
- shortcuts;
- return safety;
- enough internal variation to support multi-session play.

A site that is merely “one huge cave with a boss” does not meet the contract.

---

# 28. The Twelve Megadungeons

| # | Megadungeon | Source / Migration ID | Source-Supported Identity | Final FCC Safeguard |
| --- | --- | --- | --- | --- |
| 1 | The Crownless Imperial Undercity | megadungeon.overworld.crownless_undercity | Buried capital beneath later cities; districts, heirs, civic systems, refugees, factions, infrastructure and legitimacy evolve across campaigns. | Overworld historical/civic identity; not a one-time ruin clear. |
| 2 | Worldspine Deep Road | megadungeon.overworld.worldspine_deep_road | Continental underground route with waystations, mines, cities, bridges, collapses, trade, creatures, wars and many surface entrances. | Finite Overworld underground; no Impossible Deep bypass. |
| 3 | The Drowned Meridian | megadungeon.overworld.drowned_meridian | Submerged coastal metropolis and canal network whose tides, islands, ports, survivors, reef ecology and restored gates affect ocean travel. | Uses Overworld maritime ecology and route systems. |
| 4 | Skychain Citadel Network | megadungeon.overworld.skychain_citadels | Chain of moving sky forts, docks, wrecks, monasteries, storm engines and aerial factions linked through Overworld aerial routes. | Overworld sky content; no Ascendant bypass. |
| 5 | The Glass Epoch Vaults | megadungeon.overworld.glass_epoch | Starfall and ancient-magic complex with mirrored districts, gravity scars, archives, resource temptation and reality anomalies. | Starfall/native anomaly does not automatically imply Ascendant or Void provenance. |
| 6 | The Wandering Iron Basilica | megadungeon.mobile.iron_basilica | Walking machine-city with districts, construct society, foundries, archives, pilgrims, hostile directives and a changing regional route. | Mobile dungeon/city; construct personhood remains authoritative. |
| 7 | Root-Below Kingdoms | megadungeon.overworld.root_below_kingdoms | Greatroot/colossal-root network containing living cities, fungal basins, buried ruins, old pacts and blight fronts. | Final FCC wording uses Greatroot/colossal-root. Root routes do not cross realms physically. |
| 8 | The Endless Siegeworks | megadungeon.overworld.endless_siegeworks | Regional battlefield-fortress system of trenches, prisons, supply lines, engines, refugees and unresolved war. | War/history/faction system, not an endless reset-combat arena. |
| 9 | Black Archive of Lost Realms | megadungeon.crossrealm.black_archive | Archive preserving records of worlds, routes, peoples, laws and dangerous cross-realm knowledge. | Knowledge may document lost/deferred realms; knowledge is not access. |
| 10 | Gatebreaker Nexus | megadungeon.crossrealm.gatebreaker_nexus | Collapsed portal megastructure containing failed, unstable, disabled or historically significant portal infrastructure and lost expeditions. | Not a universal realm portal. Any current functional realm travel resolves through the six canonical gate families. |
| 11 | The Twelvefold Pilgrimage | megadungeon.crossrealm.twelvefold_pilgrimage | Twelve-district pilgrimage/trial/history complex with rival traditions, shelters, trials and contested final meaning. | Twelvefold does not mean twelve currently accessible realms; current realm scope remains unchanged. |
| 12 | The Hollow Colossus | megadungeon.mobile.hollow_colossus | Interior of a colossal migrating being containing ecology, settlements, ruins, organs, parasites, machinery and lifecycle states. | One persistent Titan actor whose body/interior is also this megadungeon; never duplicate the actor and site. |

These twelve are current FCC-01 megadungeon foundations.

---

# 29. Crownless Imperial Undercity

The Crownless Imperial Undercity is a buried capital beneath later civilisation.

Its source identity includes:

- districts;
- heirs;
- civic systems;
- refugees;
- factions;
- infrastructure;
- legitimacy disputes.

Resolution can therefore change:

- political claims;
- settlement access;
- restored utilities;
- archive control;
- surface-city relationships.

It is not simply a tomb with imperial decorations.

---

# 30. Worldspine Deep Road

Worldspine Deep Road is a **continental underground route-system megadungeon**.

It includes:

- waystations;
- mines;
- settlements/cities;
- bridges;
- collapses;
- trade;
- creatures;
- historical wars;
- multiple surface entrances.

It is still finite Overworld underground.

It cannot physically connect into Impossible Deep without Deepgate.

---

# 31. The Drowned Meridian

The Drowned Meridian is a submerged coastal metropolis/canal network.

Its identity includes:

- tides;
- islands;
- ports;
- surviving/returning populations;
- reef ecology;
- restored route gates.

Changes inside it may alter regional ocean travel.

Universal maritime and marine ecology systems remain authoritative for actual water/vessel/population simulation.

---

# 32. Skychain Citadel Network

The Skychain Citadel Network contains moving or distributed:

- sky forts;
- docks;
- wrecks;
- monasteries;
- storm infrastructure;
- aerial factions.

Its connections remain **Overworld aerial routes**.

Older source wording that used “windways” must not be interpreted as an alternate Ascendant-Reach portal.

---

# 33. The Glass Epoch Vaults

The Glass Epoch Vaults combine:

- Starfall history;
- ancient magic;
- mirrored districts;
- gravity scars;
- archives;
- valuable resources;
- reality/anomaly risks.

Native Starfall/gravity anomalies do not automatically establish:

- Ascendant provenance;
- Void provenance;
- realm travel.

If a generated instance includes genuine realm contact, that contact requires explicit history/provenance.

---

# 34. The Wandering Iron Basilica

The Wandering Iron Basilica is a walking machine-city.

It can contain:

- districts;
- construct society;
- foundries;
- archives;
- pilgrims;
- hostile directives;
- a changing world route.

It is both a site and a mobile built/civilisation system.

Construct residents retain personhood where applicable.

The mobile host's movement uses the appropriate movement/construct systems rather than a dungeon-specific teleport system.

---

# 35. Root-Below Kingdoms

Root-Below Kingdoms uses final FCC language:

- **Greatroot**;
- **colossal-root**;
- native Overworld root ecology.

It may include:

- living cities;
- fungal basins;
- buried ruins;
- historical pacts;
- blight fronts;
- local root routes.

It does **not** use Greatroot as a physical realm-transit network.

Any actual realm contact inside the megadungeon still requires a canonical portal/provenance path.

---

# 36. The Endless Siegeworks

The Endless Siegeworks is a regional battlefield-fortress system with:

- trenches;
- prisons;
- supply lines;
- engines;
- old armies;
- refugees;
- unresolved war.

“Endless” describes the inherited conflict/infrastructure scale.

It does not mean:

- infinite enemies;
- infinitely regenerating loot;
- unavoidable permanent war.

Political/history resolution can transform the site.

---

# 37. Black Archive of Lost Realms

The Black Archive may preserve records concerning:

- current realms;
- lost realms;
- misunderstood realms;
- deferred future realm concepts;
- extinct routes;
- failed portal theories.

Knowledge is not access.

The Archive cannot activate:

- World-Engine;
- Elemental Confluences;
- playable Void Between;
- Pocket Realm Construction

merely because records exist.

Current normal physical access remains governed by the six canonical realm portals.

---

# 38. Gatebreaker Nexus

Gatebreaker Nexus is a collapsed portal megastructure containing possible:

- portal archaeology;
- failed experiments;
- disabled infrastructure;
- sealed stations;
- unstable remnants;
- lost expeditions;
- route politics.

Final FCC rule:

> **Gatebreaker Nexus is NOT a universal gate.**

Any functioning travel to a current realm must resolve through the appropriate canonical:

- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

---

# 39. The Twelvefold Pilgrimage

The Twelvefold Pilgrimage retains:

- its name;
- twelve districts/trials/traditions;
- rival faiths;
- shelters;
- historical route identity;
- contested final meaning.

It does **not** imply twelve currently playable realms.

“Twelvefold” may refer to:

- historic stages;
- ritual law;
- extinct traditions;
- symbolic cosmology;
- disputed past routes;
- deferred/unknown concepts.

Current realm scope remains unchanged.

---

# 40. The Hollow Colossus

The Hollow Colossus is simultaneously:

- one persistent **Titan actor**;
- a mobile world-scale body;
- an interior **S6 megadungeon**.

Its interior may contain:

- ecology;
- settlements;
- ruins;
- organs;
- parasites;
- machinery;
- factions.

There must never be:

- a separate “Hollow Colossus creature” duplicated from the Titan;
- an unrelated “Hollow Colossus dungeon instance” detached from the actor.

Actor and interior site state are two views of one persistent entity/body.

Part 2 defines the Titan encounter/authority side.

---

# 41. Expedition Logistics

Large sites can require actual expedition planning:

- food;
- water;
- medicine;
- tools;
- lighting;
- climbing/diving gear;
- pressure/temperature protection;
- transport;
- repair material;
- ammunition/mana;
- temporary camps;
- caches;
- route maps.

Logistics should produce opportunity rather than arbitrary inventory tax.

Players can reduce burden through:

- shortcuts;
- infrastructure;
- outposts;
- allies;
- mounts;
- automation;
- restored site services.

---

# 42. Settlements Inside Sites

Large sites and megadungeons may contain:

- camps;
- enclaves;
- monasteries;
- towns;
- markets;
- refuges;
- research stations.

Living settlement operation remains FCC-01F/universal-settlement-owned.

FCC-01H preserves the fact that the settlement exists **inside and interacts with the site's identity and history**.

A megadungeon is not automatically hostile territory everywhere.

---

# 43. Boss and Authority Sockets

Part 1 defines where a site can support a major encounter:

- territory;
- room/zone relationship;
- route effects;
- arena constraints where needed;
- evidence;
- alternate-resolution hooks;
- aftermath sockets.

Part 2 owns the actual named boss/authority foundations.

A dungeon family does not require a boss in every generated instance unless the family specifically says so.

---

# 44. Retreat, Recovery and Re-Entry

Major sites should normally provide readable retreat.

Potential recovery support includes:

- refuge chamber;
- unlocked shortcut;
- restored lift;
- dock;
- settlement;
- safe camp;
- alternate exit.

One-way commitment can exist only when deliberately authored and clearly telegraphed.

Generated layouts must not trap players permanently because of:

- collapse;
- portal failure;
- multiplayer separation;
- state change

without recovery/failsafe logic.

---

# 45. Multiplayer and Shared Site State

Future multiplayer shares authoritative:

- site identity;
- blocks/damage;
- doors;
- solved puzzles;
- ownership;
- populations;
- boss/authority outcomes;
- loot state;
- restoration.

Players may possess different:

- map knowledge;
- Codex knowledge;
- faction permissions;
- personal objectives.

The site itself does not reset separately for each player unless an explicitly designed instanced-content system later exists.

---

# 46. Simulation LOD

Nearby site zones may run:

- detailed actors;
- machines;
- hazards;
- doors;
- physics;
- local ecology.

Distant zones can update through bounded summary simulation.

LOD preserves:

- site identity;
- district state;
- ownership;
- populations;
- cleared/solved state;
- damage;
- restoration;
- important inventories/resources;
- active campaigns/events.

Distance cannot regenerate destroyed walls, bosses or loot.

---

# 47. Forge Authoring Contract

The Forge/environment editor should support site authoring through:

- semantic room/zone modules;
- connections;
- multiple entrances;
- optional branches;
- hazard sockets;
- puzzle sockets;
- creature/ecology sockets;
- boss/authority sockets;
- loot/provenance sockets;
- restoration states;
- damage variants;
- terrain adaptation;
- traversal metadata;
- validation.

The authoring system should let designers create:

- caves;
- mines;
- crypts;
- temples;
- fortresses;
- cities;
- mobile interiors;
- megadungeon districts

without requiring a separate hardcoded generator for every family.

---

# 48. Validation Requirements

A generated major site should be rejectable/repairable when it contains:

- unreachable required objective;
- impossible lock dependency;
- no valid return path;
- unsupported portal bypass;
- protected personhood routed as generic monster;
- impossible ecology;
- invalid resource provenance;
- contradictory current owner/state;
- blocked required traversal without substitute;
- history that references nonexistent/deferred active content incorrectly.

Validation must favour a coherent repaired instance over silently shipping broken procedural output.

---

# 49. POC Retirement

Retire as guaranteed production assumptions:

- fixed Forest Hamlet cave;
- fixed rune clearing;
- fixed goblin camp;
- fixed watchtower defence site;
- tutorial-only dungeon sequence;
- guaranteed first boss/site.

The systems demonstrated by the POC can survive.

The old fixed valley arrangement does not.

---

# 50. Downstream Boundaries

Part 1 intentionally does not settle:

- exact room dimensions;
- exact site density;
- final stable IDs for every migrated display name;
- precise puzzle timing;
- trap damage;
- boss stats;
- exact loot quantities;
- final art;
- technical streaming budgets;
- procedural-generation implementation.

Those belong to:

- FCC-13 registry/Items/recipes where relevant;
- combat;
- movement;
- Forge;
- worldgen;
- technical rebuild;
- later art governance.

This is not missing content canon.

---

# 51. FCC-01H Part 1 Acceptance Gate

- [x] Site is defined as coherent, persistent and historically/ecologically meaningful.
- [x] Point of Interest, Micro-dungeon, Lair/Nest, Ruin, Dungeon, Complex, Megadungeon, Mobile Dungeon and Realm Dungeon remain distinct terms.
- [x] S0–S6 scale bands are retained.
- [x] Major sites have origin, historical transition and current-state explanation.
- [x] Authored bounded grammar replaces random-room soup.
- [x] Generated layouts validate entrance, critical path, alternate routes, locks/puzzles, boss access and return safety.
- [x] Mining/building/breaching remain generally valid under normal world capability rules.
- [x] No arbitrary unbreakable progression geology is introduced.
- [x] Sites can contain neutral/friendly communities and persons.
- [x] Rewards require actual provenance.
- [x] Ordinary loot/puzzles/site state do not generically reset.
- [x] Reoccupation is causal rather than blind respawning.
- [x] Resolved sites can become civilisation infrastructure where physically valid.
- [x] Exactly **72 Overworld principal site families** are represented.
- [x] Worldroot Galleries is migrated to **Greatroot Galleries** in final display/content identity.
- [x] Blackwater Citadel is migrated to **Subterranean Sea Citadel** for the Overworld.
- [x] Realm-looking sites require explicit provenance and do not create portal bypasses.
- [x] Exactly **12 megadungeon foundations** are represented.
- [x] Megadungeons satisfy the minimum district/entrance/faction/ecology/macro-puzzle/logistics/aftermath contract.
- [x] Root-Below uses Greatroot/colossal-root rather than realm-spanning Worldroot access.
- [x] Gatebreaker Nexus is not a universal gate.
- [x] Twelvefold Pilgrimage does not reactivate twelve current realms.
- [x] Hollow Colossus is one Titan actor whose body/interior is the megadungeon.
- [x] Forge owns authoring grammar; runtime owners remain authoritative for movement, combat, ecology, structures and persistence.
- [x] Exact numbers, algorithms, loot recipes and final art remain downstream.

---

# Appendix A — 72-Site Quick Roster

Echo Limestone Caverns, Greatroot Galleries, Basalt Lava Tubes, Glacier Vein Caves, Coral Hollow Labyrinth, Colossal Remains Interior, Abandoned Waystation, Collapsed Hill Hamlet, Burned Border Manor, Flooded River Village, Overgrown Orchard Estate, Deserted Caravanserai, Layered Copper Mine, Deep Ironworks, Crystal Purity Excavation, Marble Quarry Labyrinth, Salt Cathedral Works, Abandoned Mechanist Foundry, Clan Barrow Complex, Royal Processional Tomb, Catacomb Aqueduct, Battlefield Ossuary, Plague-Sealed Necropolis, Ancestral Mountain Vault, Leyline Pilgrimage Shrine, Storm-Cliff Monastery, Sunken River Temple, Moon Garden Sanctuary, Broken Covenant Circle, Ash Pilgrim Basilica, Ruined Surveyor Tower, Sealed Mage Observatory, Fungal Apothecary Spire, Archive of Broken Roads, Timeworn Weather Station, Forbidden Transmutation House, Frontier Hillfort, Pass-Gate Fortress, Island Prison Keep, Collapsed Siegeworks, Border Watch Network, Occupied River Castle, Buried Market Quarter, Drowned Canal District, Ash-Covered Civic Forum, Undercity Utility Maze, Abandoned Academy Campus, Lost Port Warehouse City, Stormreef Wreck Field, Tidal Sea Cave Temple, Sunken Observatory, Abyssal Mining Platform, Mangrove Smuggler Maze, Living Reef Citadel, Fallen Skyship Graveyard, Cloud Monastery Chain, Thunderhead Citadel, Cliffside Liftworks, Gravity-Scar Observatory, Roc-Nest Mesa, Deepstone Trade Road, Fungal Basin Settlement Ruin, Magma Forge Complex, Buried Machine Stratum, Subterranean Sea Citadel, Abyssal Fracture Camp, Leyline Convergence Vault, Dream-Leak Manor, Void-Scar Anchor Maze, Blightheart Sanctuary, Starfall Glass Labyrinth, Ancient World-Node.

# Appendix B — 12-Megadungeon Quick Roster

The Crownless Imperial Undercity, Worldspine Deep Road, The Drowned Meridian, Skychain Citadel Network, The Glass Epoch Vaults, The Wandering Iron Basilica, Root-Below Kingdoms, The Endless Siegeworks, Black Archive of Lost Realms, Gatebreaker Nexus, The Twelvefold Pilgrimage, The Hollow Colossus.

# Appendix C — Key Final Migrations

| Older Source Wording | Final FCC-01 Wording | Rule |
|---|---|---|
| Worldroot Galleries | **Greatroot Galleries** | Native Overworld Greatroot/colossal-root; no realm bypass. |
| Blackwater Citadel | **Subterranean Sea Citadel** | Overworld finite subterranean-sea site; avoids Impossible Deep terminology collision. |
| Worldroot references in Root-Below | **Greatroot / colossal-root** | Root network remains Overworld. |

---

**End of FCC-01H Part 1 v0.1 — Interview-Locked Writing Draft**
