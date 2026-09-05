# Leyforge Final Content Canon Collection

## FCC-01G — Overworld Structures, Landmarks, World Sites, Portal Archaeology & Infrastructure
### Part 1 — Structures, Landmarks, Routes, Infrastructure, Megaprojects & Wonders

**Version:** 0.1  
**Status:** Content Canon — Interview-Locked Writing Draft  
**World:** Overworld  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Physical Volume:** FCC-01G Part 1 of 2  
**Canonical Document Identity:** Parts 1 and 2 together constitute **FCC-01G**. The split is editorial only and does not create separate ownership.  
**Interview Basis:** FCC-01 S26, Questions 957–1008, with S34 physical portal-support interfaces carried into Part 2.  
**Primary Source Feed:** FCC-01 Step 2D; Atlas 24I; Document 12 v1.0; Documents 19 and 20A–H; Blueprint Forge contracts; completed FCC-01A–F; realm FCC portal constraints.  
**Package Status:** FCC-01 theoretical design is complete; A–J writing is in progress. Formal `FCC-01 CONTENT CANON LOCKED` status remains pending completion of all A–J documents and the final document-to-interview fidelity audit.  
**Dungeon Boundary:** FCC-01H owns S27–S28 dungeon, ruin, lair, megadungeon, boss, authority and encounter identity. A dungeon may physically use structures defined here, but site/adventure identity remains FCC-01H-owned.

---

# 1. Purpose

FCC-01G Part 1 defines the authoritative Overworld content canon for the **built and infrastructural physical world** outside the dungeon/adventure-site identity owned by FCC-01H.

It covers:

- ordinary and civic structure foundations;
- agriculture and resource infrastructure;
- industrial and commercial structures;
- navigation and route-support structures;
- defence structures;
- magical infrastructure;
- cultural/public structures;
- roads, crossings, bridges, tunnels, rails and inland-water routes;
- ports, canals, waterworks, drainage, pumps and utilities;
- power, mana and logistics infrastructure;
- landmarks;
- campuses, complexes and regional nexuses;
- megaprojects and wonders;
- persistent structure state;
- damage, occupation, ownership, restoration and repurposing;
- generated, NPC-built and player-built structure compatibility;
- Blueprint Forge/content-authoring requirements;
- the boundary between physical structure identity and dungeon/site identity.

It does **not** finalise exact voxel layouts, recipe quantities, construction costs, processing times, throughput, structural-engineering equations, movement/pathfinding values, market values, damage numbers, final material palettes, textures, VFX, sound or engine implementation.

---

# 2. Structures Are the Physical Memory of the World

A meaningful structure should reveal, shelter, supply, connect, protect, threaten, teach, remember, enable or transform something.

A structure exists as a persistent physical place with:

- canonical content identity;
- actual canonical Blocks/materials;
- a location and terrain relationship;
- ownership and claims;
- current occupation;
- physical condition;
- historical provenance;
- functional interfaces;
- player/NPC changes where permitted.

A structure is not merely a decorative scene prefab.

> **A placed structure exists once as an authoritative persistent world instance. Damage, occupation, corruption, restoration, ownership and player edits normally modify that instance instead of creating duplicate “damaged”, “occupied” or “restored” structure definitions.**

---

# 3. Source-Layer Separation

The same built-place concept may exist across several records with different owners.

| Layer | Meaning |
|---|---|
| Structure Foundation | Why the structure exists, what it does and where it belongs. |
| Universal Building / Service Definition | What civilisation capability it can provide when functioning. |
| Official Blueprint Forge Source | Editable voxel layout and semantic authoring source. |
| Worldgen Candidate | Seed-derived eligible placement/context. |
| Construction Project | Resources, labour, stages and commissioning. |
| Persistent Structure Instance | What physically exists in this save and its current state. |
| Service Record | Current settlement capability and blockers. |
| Route / Movement View | Whether a particular mover can physically traverse connected infrastructure. |
| Economy View | Economic value, toll, shipment and market significance. |
| Actor Knowledge | Who knows or believes the place exists, is safe, ruined, claimed, etc. |

No layer may silently replace another.

A complete Blueprint Forge source is not automatically a constructed building.  
A construction plan is not a persistent world structure.  
A persistent structure record does not duplicate the complete editable Forge source.

---

# 4. Structure Versus Site

A **Structure** is a physical built-place foundation or persistent built instance.

A **Site** is a coherent explorable place with reason, topology, history, ecology/ownership and meaningful interaction.

A site may contain:

- one structure;
- many structures;
- terrain;
- caves;
- ruins;
- roads;
- settlement remnants;
- ecology.

One physical structure may exist as:

- functioning settlement infrastructure;
- a landmark;
- an abandoned ruin;
- a dungeon component;
- a restored civic building;
- a player outpost.

Therefore:

> **Physical shell/state does not automatically determine site taxonomy.**

A Watchtower may be active infrastructure, abandoned, occupied, a border landmark, part of a dungeon or restored by the player while remaining traceably the same structure family/instance where continuity survives.

---

# 5. Landmark Identity

A landmark is defined by **navigation, history, cultural recognition or world significance**, not simply by size.

Landmark examples include:

- a bridge;
- tower;
- temple;
- monument;
- beacon;
- minehead;
- road marker;
- city gate;
- surviving ruin;
- major engineered terrain feature.

Landmark status may emerge through history.

An otherwise ordinary bridge can become important because of:

- a battle;
- treaty;
- disaster;
- famous construction;
- restoration;
- pilgrimage;
- engineering achievement.

Landmark significance is a persistent historical/social layer over physical identity.

---

# 6. Forty-Five Principal Overworld Structure Foundations

The recovered production structure portfolio contains **45 exact named Overworld foundations**. S26 retains these as principal structure foundations inside the wider full-release built-world ecosystem.

| # | Domain | Structure Foundation | Canonical Content Role |
| --- | --- | --- | --- |
| 1 | Civic | Assembly House | Public decision, meetings, records and civic coordination without creating government authority by itself. |
| 2 | Civic | Public Granary | Protected shared reserve and distribution support; capacity comes from real stored provisions. |
| 3 | Civic | Communal Kitchen | Batch food preparation and public feeding using real inputs, staff, water/fuel and recipes. |
| 4 | Civic | Civic Infirmary | Town-scale treatment/recovery service consuming staff, medicine, clean water and sanitation. |
| 5 | Civic | Schoolhouse | Basic education, literacy, apprenticeship support and knowledge continuity. |
| 6 | Civic | Refuge Hall | Emergency shelter, evacuation, disaster/raid refuge and temporary displaced-person support. |
| 7 | Agriculture | Fieldstead | Coordinated field production, storage and agricultural work tied to real soil/water/crop systems. |
| 8 | Agriculture | Orchard House | Perennial crop/orchard support, tools, storage and processing interfaces. |
| 9 | Agriculture | Irrigation Station | Water distribution/control support for agriculture; requires real source, channels and maintenance. |
| 10 | Agriculture | Pasture Station | Herd/livestock handling, shelter, feed/water access and grazing logistics. |
| 11 | Agriculture | Seed Vault | Protected planting-stock and cultivar continuity; does not generate seeds. |
| 12 | Agriculture | Forest Steward Lodge | Managed forestry, replanting, fire/watch and ecological stewardship support. |
| 13 | Industry | Logging Camp | Timber extraction staging, tools, worker shelter and haul access tied to real forest resource state. |
| 14 | Industry | Quarry Complex | Stone extraction, sorting, loading, spoil and safety tied to valid geology. |
| 15 | Industry | Minehead Complex | Mine access, hoisting/haulage, supports, ventilation/safety and ore staging. |
| 16 | Industry | Smeltery | Ore/metal thermal processing support using real fuel/power, inputs, slag/by-products and safety. |
| 17 | Industry | Sawmill | Log-to-timber processing with real power/manual capability, tools, guarded work zones and output buffers. |
| 18 | Industry | Clayworks | Clay/ceramic processing and kiln/storage support tied to valid clay/sand/water/fuel inputs. |
| 19 | Industry | Mana Refinery | Conditions/refines mana-bearing resources through declared magical processing; not an infinite mana source. |
| 20 | Commerce | Market Square | Public exchange/service space exposing actual vendor/settlement stock rather than infinite shops. |
| 21 | Commerce | Caravanserai | Route-side lodging, animal/vehicle support, storage, repair and trade coordination. |
| 22 | Commerce | Regional Warehouse | Large physical inventory/logistics buffer with ownership, reservations and dispatch. |
| 23 | Commerce | Customs Post | Inspection, records, permissions, quarantine/contraband handling where law supports it. |
| 24 | Commerce | Counting House | Ledger, finance, records and professional commerce support; money/credit truth remains economy-owned. |
| 25 | Navigation | Wayhouse | Traveller shelter, local knowledge, supplies and route support. |
| 26 | Navigation | Milestone Chain | Distributed navigation/route markers whose usefulness depends on actual connected geography. |
| 27 | Navigation | Toll Gate | Controlled route crossing where lawful authority and actual physical route control exist. |
| 28 | Navigation | Roadside Shrine | Travel, memorial, faith or safety-support structure; does not create universal religious truth. |
| 29 | Navigation | Switchback Station | Mountain/vertical route support, rest, loading and maintenance on steep transport corridors. |
| 30 | Navigation | Bridgehouse | Crossing support, maintenance, control and shelter associated with a real bridge/route. |
| 31 | Defence | Watchtower | Observation, warning and patrol support using real sightlines, staff and communications. |
| 32 | Defence | Gatehouse | Controlled settlement/fortification entrance with actual access, guard and structural state. |
| 33 | Defence | Palisade Fort | Early/medium fortification compound using real perimeter, stores, staffing and refuge. |
| 34 | Defence | Beacon Station | Regional warning/signalling structure; signal capability depends on actual line/network/support. |
| 35 | Defence | Patrol Lodge | Guard/patrol staging, supplies and route coverage. |
| 36 | Defence | Refuge Bastion | Fortified emergency refuge and reserve capable of remaining useful during siege/disaster. |
| 37 | Magic | Wardstone Circle | Real ward anchor with coverage geometry, tuning, mana/power, condition and maintenance. |
| 38 | Magic | Mana Well | Accesses/conditions local mana where world state permits; does not create mana from nothing. |
| 39 | Magic | Rune Workshop | Rune inscription, calibration, research and repair support using actual tools/materials/knowledge. |
| 40 | Magic | Leyline Observatory | Measures/studies leyline conditions and magical geography; observation does not create or redirect leylines by default. |
| 41 | Magic | Cleansing House | Supports compatible contamination/blight/curse/identity-stabilisation treatment; not resurrection. |
| 42 | Magic | Portal Sanctuary | Safe portal-side support/research/maintenance infrastructure; never a generic seventh realm portal. |
| 43 | Culture | Public Library | Persistent public knowledge/archive institution whose information remains evidence rather than omniscience. |
| 44 | Culture | Festival Ground | Purpose-built public event/ceremony space; benefits require actual events, access and participation. |
| 45 | Culture | Language House | Translation, teaching, records and multilingual civic support without ancestry-language locking. |


These are **functional/content foundations**, not a command that every biome or culture build the same architecture.

A Fieldstead may be terraced, stilted, subterranean, irrigated, enclosed or culturally adapted while still satisfying the same structure identity.

---

# 7. Civic Structures

The civic foundation group covers:

- assembly;
- public reserve;
- communal food preparation;
- health;
- education;
- emergency refuge.

These structures consume political and social systems instead of creating authority by architecture.

An Assembly House can host a council, court or civic meeting, but it does not turn the government into a council merely by existing.

A Public Granary stores and protects **real stock**.

A Civic Infirmary needs real staff, medicine, water, sanitation and accessible treatment space.

---

# 8. Agricultural Infrastructure

Agricultural structures must bind to real FCC-01D agriculture and FCC-01E husbandry/ecology.

Rules:

- Fieldstead requires real fields/crops or another valid agricultural production profile.
- Orchard House requires real perennial/orchard production.
- Irrigation Station requires actual water source, channels/pipes and maintenance.
- Pasture Station requires real animals, grazing/feed and water.
- Seed Vault stores real planting stock/cultivars and does not generate seeds.
- Forest Steward Lodge supports managed forestry, monitoring, replanting and restoration.

No agricultural structure conjures crops, soil fertility or animals from nothing.

---

# 9. Extraction and Industrial Structures

Logging Camp, Quarry Complex, Minehead Complex, Smeltery, Sawmill, Clayworks and Mana Refinery bind to actual world resources and processes.

A Quarry Complex requires usable geology.

A Minehead must bind to real excavations/resource context.

A Smeltery needs valid:

- feedstock;
- fuel/power;
- heat/process capability;
- labour or automation;
- output handling;
- by-product/waste handling.

A Mana Refinery conditions/refines suitable magical resources; it does not create an infinite second economy or arbitrary mana source.

FCC-01C owns resource/material truth. Processing and automation systems own execution.

---

# 10. Commerce and Logistics Structures

Market Square, Caravanserai, Regional Warehouse, Customs Post and Counting House connect the physical economy to place.

They preserve:

- real inventories;
- ownership;
- reservations;
- staff;
- routes;
- lawful authority where relevant.

A Market Square exposes actual stock and traders.

A Regional Warehouse is a real buffer, not a UI number.

A Customs Post can inspect, quarantine or control cargo only under applicable law/authority.

A Counting House supports records, finance and professional commerce, but money/credit truth remains owned by the economy system.

---

# 11. Navigation and Route-Support Structures

Wayhouse, Milestone Chain, Toll Gate, Roadside Shrine, Switchback Station and Bridgehouse make route geography physically legible.

They may provide:

- traveller shelter;
- local knowledge;
- maintenance;
- route control;
- cultural meaning;
- steep-route support;
- crossing support.

A Milestone Chain only helps because real markers exist along a real route.

A Toll Gate can only control a route it physically and legally controls.

---

# 12. Defence Structures

Watchtower, Gatehouse, Palisade Fort, Beacon Station, Patrol Lodge and Refuge Bastion support layered settlement defence.

Defence does not collapse into a single invisible score.

Useful physical facts include:

- sightlines;
- perimeter state;
- gate state;
- staffing;
- signal connections;
- supplies;
- patrol routes;
- refuge capacity;
- damage;
- access.

Combat, raids and emergency systems consume those facts.

---

# 13. Magical Structures

## 13.1 Wardstone Circle

Wardstone Circle is a **real ward anchor**.

Useful ward capability depends on:

- coverage geometry;
- tuning;
- mana/power;
- condition;
- maintenance;
- compatibility with the desired ward.

The structure does not guarantee protection when those conditions fail.

## 13.2 Mana Well

A Mana Well accesses, conditions or stabilises locally available mana where the world permits it.

It does not:

- create mana from nothing;
- create a leyline;
- turn every site into a magical hotspot.

## 13.3 Rune Workshop

Rune Workshop supports:

- inscription;
- calibration;
- testing;
- repair;
- rune research.

It consumes actual:

- knowledge;
- tools;
- substrates;
- materials;
- mana where required.

## 13.4 Leyline Observatory

A Leyline Observatory studies and monitors magical geography.

It can support:

- mapping;
- warning;
- research;
- infrastructure planning.

Observation does not automatically reroute or create leylines.

## 13.5 Cleansing House

Cleansing House supports compatible treatment/restoration involving:

- contamination;
- blight;
- curse;
- magical influence;
- identity/stability problems.

It does not own resurrection, universal death or guaranteed Void cleansing.

## 13.6 Portal Sanctuary

Portal Sanctuary is **supporting infrastructure**, not a portal family.

It may provide:

- safe portal operations;
- research;
- maintenance;
- cargo/visitor staging;
- rescue;
- containment;
- records;
- security.

It cannot replace:

- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

---

# 14. Cultural and Public Structures

Public Library, Festival Ground and Language House physically instantiate cultural/knowledge life.

A Public Library holds real records and can contain:

- errors;
- propaganda;
- incomplete evidence;
- competing accounts.

A Festival Ground provides a place and infrastructure for events; it does not generate Morale without actual use.

A Language House supports:

- translation;
- teaching;
- records;
- multilingual public service;
- language preservation.

Language remains independent from ancestry.

---

# 15. Twelve Principal Route Foundations

| # | Domain | Route Foundation | Canonical Content Role |
| --- | --- | --- | --- |
| 1 | Surface | Local Trail | Low-capacity local foot/pack route shaped by use and terrain. |
| 2 | Surface | Farm Lane | Agricultural access route linking fields, barns, stores and settlement roads. |
| 3 | Surface | Village Street | Built local settlement route supporting residents, carts and services where geometry permits. |
| 4 | Surface | Regional Road | Durable inter-settlement route with freight, patrol and maintenance significance. |
| 5 | Surface | Pilgrim Way | Long-distance culturally/religiously significant route whose physical function remains an ordinary real route. |
| 6 | Crossing | Seasonal Ford | Shallow-water crossing whose availability depends on water state, season and mover capability. |
| 7 | Crossing | Stone Arch Bridge | Durable constructed span with persistent condition, load/access and repair state. |
| 8 | Crossing | Rope Suspension Bridge | Light/flexible span with actual structural, weather and mover constraints. |
| 9 | Crossing | Switchback Pass | Engineered mountain route using grades, retaining, turns and maintenance. |
| 10 | Crossing | Road Tunnel | Constructed/excavated route through terrain with support, drainage, ventilation and damage state. |
| 11 | Industrial | Minecart Line | Rail/cart industrial route for real cargo and workers; movement/automation own execution. |
| 12 | Water | River Barge Lane | Bounded inland-water freight/passenger route consuming real navigable water and vessel capability. |


Routes are persistent physical infrastructure.

They may be:

- built;
- worn;
- blocked;
- flooded;
- collapsed;
- occupied;
- repaired;
- rerouted.

> **Routes are physical before they are fast.**

Movement systems decide whether and how a particular mover traverses a route. Economy systems decide economic value. FCC-01G defines the route as physical world content.

---

# 16. Route Networks

A route network may combine:

- trails;
- roads;
- bridges;
- tunnels;
- barges/ferries;
- minecart lines;
- vertical systems;
- later maritime, air and portal links.

Connectivity must be real.

A line on a map does not make a route traversable.

If a bridge collapses, the route remains broken until a valid:

- repair;
- ford;
- ferry;
- detour;
- replacement crossing

exists.

---

# 17. Roads, Bridges and Tunnels as Historical World State

A road/crossing instance may preserve:

- original builder;
- current maintainer;
- owner/claim;
- material/surface;
- condition;
- seasonality;
- damage;
- toll/access policy;
- landmark significance;
- linked settlements/sites.

Generated infrastructure can later be:

- upgraded;
- neglected;
- abandoned;
- conquered;
- rerouted;
- restored.

Player-created roads and bridges can become persistent regional infrastructure and history.

---

# 18. Water, Drainage and Civil Engineering Infrastructure

The Overworld built-world canon includes major non-building infrastructure such as:

- drainage;
- aqueducts;
- canals;
- waterworks;
- pumps;
- reservoirs/cistern systems;
- flood-control works;
- sanitation;
- utility corridors.

These are not abstract city-upgrade values.

Their capability depends on real:

- source;
- gradient/pressure/power where relevant;
- path/network;
- condition;
- capacity;
- maintenance;
- outlets/consumers.

A canal changes trade because it creates an actual navigable connection.

---

# 19. Ports and Maritime Infrastructure

Ports may contain:

- quays/docks;
- warehouses;
- customs;
- ship/vessel repair;
- loading areas;
- passenger handling;
- storm shelter;
- food/water supply;
- harbour defence;
- quarantine.

Set 26 remains authoritative for vessel/maritime execution.

FCC-01G owns the Overworld built-world, settlement and infrastructure context.

A port is not a generic teleport terminal.

---

# 20. Power, Mana and Utility Networks

Overworld civilisation may build distributed:

- water;
- sanitation;
- mechanical power;
- electrical/industrial power;
- mana;
- control;
- item/logistics;
- signal/communication

infrastructure.

Network nodes and edges remain real installed content and can be damaged where appropriate.

A city grid is not one invisible buff.

Meaningful systems expose:

- sources;
- storage;
- conduits;
- relays;
- consumers;
- controls;
- maintenance;
- failure state.

---

# 21. Automation Infrastructure Interface

Built infrastructure may incorporate:

- chutes;
- hoppers;
- belts;
- pipes;
- loaders/unloaders;
- minecart/rail transfer;
- pumps;
- mechanical power;
- electrical power;
- mana;
- rune/control logic;
- warehouses/buffers.

FCC-01G owns the **physical structures and installed infrastructure context** in which these systems appear.

Automation owns:

- network flow;
- throughput;
- reservation;
- transaction;
- blockage;
- routing.

A Conveyor or Cart Logistics Hub must move conserved stock rather than animate decorative cargo.

---

# 22. Terrain Adaptation

Official/generated/player structures may adapt using:

- irregular foundations;
- terraces;
- retaining walls;
- stilts/piers;
- bridges/spans;
- excavation;
- cliff integration;
- vertical stacking;
- validated floating/anchor systems.

Placement considers:

- terrain;
- water;
- caves;
- routes;
- ecology;
- existing heritage;
- ownership;
- utilities;
- hazards;
- maintenance;
- future expansion.

World generation must not flatten every structure site into the same generic pad.

---

# 23. Structure-State Architecture

Persistent structure state can include independent axes such as:

| State Axis | Example Expressions |
|---|---|
| Construction | Planned, Foundation, Frame, Enclosed, Fitted, Commissioned |
| Condition | Intact, Worn, Damaged, Heavy Damage, Partial Collapse, Collapsed, Destroyed |
| Occupation | Empty, Resident, Faction, Creature, Disputed, Besieged, Evacuated, Abandoned |
| Ownership | Unclaimed, Private, Household, Settlement, Faction, Government, Cultural, Disputed |
| Magical | Normal, Warded, Blessed, Corrupted, Cursed, Sealed, Unstable |
| Restoration | None, Surveyed, Secured, Stabilised, Repairing, Partial, Restored, Converted |

These are state layers.

They are not automatic duplicate structure families.

---

# 24. Damage and Partial Function

Damage may affect:

- individual Blocks;
- entrances;
- rooms;
- zones;
- network connectors;
- power/mana;
- route connectivity;
- service capacity.

A structure can remain partially functional.

A damaged hospital wing need not make the entire hospital cease to exist.

A breached citadel can retain functional stores, walls or refuge areas.

---

# 25. Occupation Is Not Ownership

Occupation describes who physically controls or uses a place.

Ownership/legal claim may differ.

Examples:

- occupying a warehouse does not transfer title to every privately owned Item;
- a military force may control city gates while household property remains separately owned;
- a disputed fort may be occupied by one faction and legally claimed by another.

FCC-01F remains authoritative for law, sovereignty and political legitimacy.

---

# 26. Restoration and Conversion

Restoration may produce:

- historical reconstruction;
- adaptive reconstruction;
- repurposing;
- museum/memorial use;
- housing;
- workshop use;
- civic use;
- renewed fortification.

Restoration does **not** reset history.

If a ruined watchtower becomes a research station, preserve relevant:

- origin;
- previous owners;
- damage;
- repairs;
- conversion;
- later use.

A true demolition/rebuild may create a new structure identity where continuity is genuinely broken.

---

# 27. Player Editing

Voxel structures remain physically editable where the world permits.

Player edits must preserve:

- canonical Block identity;
- ownership/permissions;
- protected/semantic anchors where needed;
- service validity;
- route safety;
- historical change record.

Players can improve, modify, damage or repurpose structures rather than being forced to preserve the original blueprint forever.

---

# 28. Blueprint Forge Structure Authoring

Blueprint Forge should support authoring:

- voxel layout;
- semantic rooms/zones;
- entrances;
- route links;
- job/interaction markers;
- logistics ports;
- power/mana/control connections;
- construction phases;
- damage/restoration deltas;
- terrain-adaptation intent;
- optional modules;
- culture/biome material roles;
- validation tests.

The Forge source remains an editable authoring source.

The world contains a resolved persistent structure instance with recorded deltas.

---

# 29. Player Blueprint Compatibility

Player-authored structures may satisfy existing structure/building roles when they pass relevant:

- geometry/access;
- resources;
- safety;
- staffing;
- utility;
- ownership;
- marker;
- capacity

contracts.

A player design need not visually copy an official source merely to function unless an actual cultural/legal rule requires something specific.

Function and style remain distinct.

---

# 30. Built-Content Hierarchy

A useful high-level hierarchy is:

> **Module → Structure → Complex / Campus → Infrastructure Network → Megaproject → Wonder**

Higher levels coordinate real lower-level content.

They do not replace it.

A Hospital Campus has no medical capacity without functioning treatment spaces, staff and supplies.

A city Ward Core has no protection without functioning sources, relays, anchors and maintenance.

---

# 31. Advanced Plans, Complexes, Megaprojects and Wonders

| # | Foundation | Scale | Canonical Function |
| --- | --- | --- | --- |
| 1 | Farmstead Cluster | Cluster | Coordinates farm buildings, fields, storage and access; it does not replace the individual working structures. |
| 2 | Market Square and Civic Centre | Cluster | Coordinates public hall, market, roads and public space around functioning lower-level content. |
| 3 | Artisan or Industrial District Template | District | Coordinates production parcels, logistics and buffers; zoning grants no throughput. |
| 4 | Residential District Template | District | Coordinates housing, services, paths and public space; the district boundary grants no beds. |
| 5 | Citadel and Fortified Perimeter Complex | Complex | Coordinates real walls, gates, towers, command, refuge and stores. |
| 6 | Hospital or University Campus | Campus | Coordinates several specialist buildings and shared utilities without double-counting service. |
| 7 | Regional Logistics and Transit Nexus | Nexus | Coordinates road, rail, harbour, portal or freight transfers with separate inventories and real route capacity. |
| 8 | City-Wide Ward Core or Portal Nexus | Megaproject | Coordinates a city ward network or multiple legitimate portal stations; cannot bypass canonical realm portal families. |
| 9 | Floating District Anchor or Skyport | Megaproject | Supports Overworld elevated districts and air travel through real anchors, utilities, freight and evacuation; not Ascendant access. |
| 10 | Culture Wonder or Leyline Crown | Wonder / Megaproject | Culture-defining maintained project with bounded regional/world-state effects; never unlimited need satisfaction. |


These remain coordination/content foundations rather than automatic city bonuses.

---

# 32. Megaproject Construction

Megaprojects are graphs of independently persistent subprojects.

They may require:

- surveys;
- enabling roads/utilities;
- supply yards;
- specialist labour;
- contracts;
- phased construction;
- partial activation;
- commissioning;
- maintenance;
- political support.

Incomplete megaprojects remain in the world and may be usable where completed subprojects allow it.

A civilisation-scale project can remain unfinished for generations.

---

# 33. City-Wide Ward Core / Portal Nexus Boundary

The Ward branch can coordinate city-scale defensive magical infrastructure.

The Portal branch can coordinate multiple **legitimate portal stations** and their:

- security;
- customs;
- destination records;
- freight/passenger buffers;
- containment;
- maintenance.

It cannot:

- create a seventh generic realm portal;
- bypass the six named canonical realm gates;
- ignore destination binding;
- grant sovereignty over a destination realm.

The megaproject coordinates real portal infrastructure; it does not redefine Realm Access.

---

# 34. Floating District Anchor / Skyport Boundary

Floating District Anchor/Skyport supports **Overworld** elevated/floating settlement and aerial transport.

It requires real:

- anchoring/lift/support;
- utilities;
- freight/passenger access;
- maintenance;
- emergency descent/evacuation.

It cannot reach Ascendant Reach merely by flying higher.

---

# 35. Culture Wonder / Leyline Crown Boundary

A Culture Wonder may embody a civilisation's history and identity.

A Leyline Crown may coordinate advanced leyline/mana infrastructure where compatible.

Wonder effects are:

- bounded;
- maintained;
- damageable;
- politically situated;
- dependent on working subprojects.

A wonder does not provide unlimited needs, infinite mana or universal world control.

---

# 36. Constructed Landmark Persistence

Major built landmarks may become:

- damaged;
- captured;
- abandoned;
- corrupted;
- restored;
- repurposed.

Historical significance persists.

A wonder that becomes a ruin can also become an FCC-01H exploration site while retaining its FCC-01G physical/history identity.

---

# 37. Generated, NPC-Built and Player-Built Structures

Structures may be:

- historically world-generated;
- built by NPC civilisation after world start;
- player-built;
- repaired from ruin;
- converted/repurposed.

They consume compatible physical and persistent-state rules.

World-generated structures are not immutable dioramas.

Player-built structures do not use a parallel fake structure system.

---

# 38. World-Generation Placement

Generated placement validates:

- terrain;
- climate/biome;
- water;
- access;
- settlement/culture context;
- resources;
- hazards;
- history;
- protected sites;
- critical routes.

Generated structures gain persistent instance identity when materialised/committed.

Explored structures must not silently regenerate from their source and erase player/world changes.

---

# 39. Simulation LOD

Nearby structures can expose detailed:

- voxel Blocks;
- doors/gates;
- inventories;
- workers;
- machines;
- repairs;
- local interactions.

Distant structures may use bounded summaries.

LOD must preserve authoritative:

- identity;
- condition;
- ownership;
- occupation;
- major service state;
- connected routes;
- projects;
- history.

Distance cannot repair a bridge, refill a warehouse or reset an abandoned building.

---

# 40. Legacy POC Reconciliation

The retired fixed Forest Hamlet arrangement remains archive/test evidence only.

Reusable capabilities survive, including:

- watchtower;
- warehouse;
- homes;
- farms/barns;
- guard post;
- blacksmith/workshop;
- magical/shrine services;
- market;
- wall/gate;
- old rune ruin;
- abandoned mine;
- portal support infrastructure.

POC-specific proper names and guaranteed arrangements do not become production canon.

---

# 41. Boundary with FCC-01H

FCC-01H owns:

- dungeon/site identity;
- site grammar;
- lairs;
- exploration ruins;
- megadungeons;
- bosses;
- authorities;
- major encounter context.

FCC-01G owns the physical structure/infrastructure foundations that such sites may contain.

No second duplicate catalogue is created.

---

# 42. Boundary with FCC-01I

FCC-01I owns:

- magic ecology;
- history;
- events;
- cross-realm state;
- corruption boundaries.

FCC-01G structures expose persistent targets and evidence for those systems, including:

- ward damage;
- road closure;
- ruined infrastructure;
- restoration;
- ownership change;
- portal archaeology.

---

# 43. Downstream Registry and Art Handoff

FCC-01G does not freeze:

- final stable IDs for every structure/module;
- final Block palette;
- exact construction recipes;
- exact material quantities;
- exact dimensions;
- final structural statistics;
- final visual style.

Downstream ownership includes:

- FCC-12 — universal material/process reconciliation;
- FCC-13 — definitive Blocks, Items and Recipes;
- FCC-14 — final canon certification/handoff;
- Blueprint Forge — official editable structure source;
- later global style/material governance and realm/culture art documents.

---

# 44. FCC-01G Part 1 Acceptance Gate

- [x] Structure foundation, Blueprint source, construction project, persistent instance, settlement service, route movement and economic route state remain separate.
- [x] Damage, occupation, corruption and restoration are persistent state rather than duplicate structure definitions.
- [x] All **45 exact recovered principal Overworld structure foundations** are represented.
- [x] All **12 exact recovered route foundations** are represented.
- [x] Wardstone Circle, Mana Well, Rune Workshop, Leyline Observatory, Cleansing House and Portal Sanctuary remain functionally distinct.
- [x] Portal Sanctuary does not create a portal family.
- [x] Roads, bridges, tunnels and minecart/water routes remain physical world infrastructure.
- [x] Ports, drainage, aqueducts, canals, waterworks, pumps, sanitation and utilities are supported.
- [x] Power, mana and logistics infrastructure remain real networks rather than abstract city buffs.
- [x] Chutes, belts, pipes, loaders and related automation infrastructure integrate without moving resource authority into FCC-01G.
- [x] Higher-order plans/megaprojects coordinate functioning lower-level content.
- [x] City-Wide Portal Nexus cannot bypass canonical Realm Access.
- [x] Floating District Anchor/Skyport remains Overworld.
- [x] Culture Wonder/Leyline Crown effects remain bounded and maintained.
- [x] Player edits/restoration preserve history.
- [x] Generated, NPC-built and player-built structures use compatible persistent physical rules.
- [x] Exact voxel layouts, costs, algorithms, numerical balance and art remain downstream.

---

# Appendix A — Quick 45-Structure Roster

Assembly House, Public Granary, Communal Kitchen, Civic Infirmary, Schoolhouse, Refuge Hall, Fieldstead, Orchard House, Irrigation Station, Pasture Station, Seed Vault, Forest Steward Lodge, Logging Camp, Quarry Complex, Minehead Complex, Smeltery, Sawmill, Clayworks, Mana Refinery, Market Square, Caravanserai, Regional Warehouse, Customs Post, Counting House, Wayhouse, Milestone Chain, Toll Gate, Roadside Shrine, Switchback Station, Bridgehouse, Watchtower, Gatehouse, Palisade Fort, Beacon Station, Patrol Lodge, Refuge Bastion, Wardstone Circle, Mana Well, Rune Workshop, Leyline Observatory, Cleansing House, Portal Sanctuary, Public Library, Festival Ground, Language House.

# Appendix B — Quick 12-Route Roster

Local Trail, Farm Lane, Village Street, Regional Road, Pilgrim Way, Seasonal Ford, Stone Arch Bridge, Rope Suspension Bridge, Switchback Pass, Road Tunnel, Minecart Line, River Barge Lane.

# Appendix C — Advanced Built-Content Roster

Farmstead Cluster, Market Square and Civic Centre, Artisan or Industrial District Template, Residential District Template, Citadel and Fortified Perimeter Complex, Hospital or University Campus, Regional Logistics and Transit Nexus, City-Wide Ward Core or Portal Nexus, Floating District Anchor or Skyport, Culture Wonder or Leyline Crown.

# Appendix D — Ownership Quick Reference

| Question | Owner |
|---|---|
| Why does this structure family exist? | FCC-01G / structure content |
| What voxel/semantic source defines the official form? | Blueprint Forge |
| Where may worldgen place it? | Worldgen |
| What exact Blocks/materials compose it? | FCC-13 / resolved structure source |
| What project builds or repairs it? | Settlement/construction systems |
| What exists persistently in the save? | Structure runtime |
| What settlement service is active? | Building/settlement service |
| Can a mover traverse a linked route? | Movement |
| What is the route worth economically? | Economy |
| What event/history affected it? | FCC-01I / event-history runtime |
| Is it a dungeon/site? | FCC-01H |
| What is its final palette/art language? | Later art/material governance |

---

**End of FCC-01G Part 1 v0.1 — Interview-Locked Writing Draft**
