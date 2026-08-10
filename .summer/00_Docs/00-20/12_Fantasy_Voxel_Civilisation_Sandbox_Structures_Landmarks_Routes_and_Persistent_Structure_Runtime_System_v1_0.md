# LEYFORGE

## 12 — Structures, Landmarks, Routes and Persistent Structure Runtime System

### Physical World Memory, Structure Instances, Site Assembly, Roads and Crossings, Damage, Occupation, Claiming, Restoration, Historical Layers and Persistent Built-World State

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `12_Fantasy_Voxel_Civilisation_Sandbox_Structures_v0_1` for active production direction  
**Primary Vision Authority:** Document 00 v1.0  
**World Generation Authority:** Document 11 v1.0  
**Authored Structure/Route/Wonder Atlas Authority:** Document 24I  
**Dungeon/Ruin/Lair/Megadungeon Atlas Authority:** Document 24G  
**World History and Dynamic-State Context:** Document 24K  
**Physical Block Authority:** Document 03 v1.0  
**Items/Recipes/Resources:** Documents 04–06 v1.0  
**NPC/Settlement Operations:** Document 07 v1.0  
**Automation:** Document 08 v1.0  
**Magic:** Document 09 v1.0  
**Creature/Ecology Runtime:** Document 10 v1.0  
**Settlement Growth / Player Blueprint Workflows:** Document 19  
**Settlement Building Functions / Projects:** Document Set 20  
**Official Editable Blueprint Source:** Blueprint Forge, Document 22I  
**Production Governance:** Set 25  
**Maritime Structure Integration:** Set 26  
**Economy Boundary:** Set 27  
**Social/Knowledge Boundary:** Set 28  
**Biology Boundary:** Set 29  
**Movement/Route Execution Boundary:** Set 30  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale structure runtime for Leyforge in which roads, bridges, buildings, ruins, camps, shrines, towers, mines, fortifications, portals, landmarks, infrastructure, dungeons and wonders exist as persistent places with stable identity, physical voxel state, ownership, history, interaction surfaces, damage, occupation, restoration and world consequences.

> **Structure System Statement**
>
> **Structures are the physical memory of the world. A meaningful structure should reveal, shelter, supply, connect, threaten, protect, teach, remember, enable or transform something. Its geometry, function, ownership, history and current state must remain traceable rather than collapsing into a decorative scene.**

> **Source-Layer Separation Rule**
>
> **Atlas identity, editable Blueprint Forge source, universal settlement function, generated placement, construction project and persistent structure instance are different records with different owners. No one layer may silently replace the others.**

> **Structure Instance Rule**
>
> **A placed structure exists once as an authoritative persistent world instance composed from canonical Blocks and semantic structure data. Damage, occupation, corruption, restoration, ownership and player edits change that instance; they do not create duplicate “damaged structure,” “occupied structure” or “restored structure” definitions.**

> **Routes Are Physical Before They Are Fast Rule**
>
> **Document 12 may own the physical existence and condition of a road, bridge, tunnel, gate or crossing instance. Set 30 decides whether a particular mover can traverse it, how long travel takes and which route is physically usable. Set 27 decides its economic value.**

---

# Document Purpose

Document 12 defines the shared executable and persistent runtime layer for built and site-scale places.

The original Document 12 correctly identified structures as:

- exploration anchors;
- civilisation bodies;
- history evidence;
- threat sources;
- magical infrastructure;
- progression gateways;
- player-restoration opportunities;
- roads and route infrastructure;
- persistent dynamic world state.

Those principles remain.

What has changed is the scale and source-of-truth architecture.

Since the original Document 12 was written, later production work created:

- the World Content Atlas;
- a dedicated Dungeon/Ruin/Lair/Megadungeon Atlas in 24G;
- a dedicated Structures/Landmarks/Routes/Wonders/Infrastructure Atlas in 24I;
- the settlement Blueprint and Growth system in Document 19;
- the complete Buildings/Facilities/Construction suite in Document 20;
- Blueprint Forge in Document 22I;
- production registry governance in Set 25;
- maritime structures and ports in Set 26;
- final economy/social/biology/movement ownership in Sets 27–30.

Document 12 therefore no longer needs to be an enormous content catalogue.

Instead, it becomes the **shared runtime authority that makes authored structure and site content physically exist and remain changed inside a save**.

It answers questions such as:

- what exactly is a persistent structure instance;
- how Atlas structure/site identities resolve into Blueprint Forge source and canonical Blocks;
- how generated structures are placed without POC hardcoding;
- how structures preserve history and ownership;
- how roads, bridges, gates and tunnels expose physical facts to movement;
- how ruins are looted, damaged, claimed and restored;
- how dungeon/site state persists without reset;
- how settlement buildings share runtime structure state with non-settlement structures;
- how player edits coexist with official blueprint ancestry;
- how damage changes semantic capability;
- how occupation differs from ownership;
- how structures migrate across content versions;
- how distant structures remain persistent without retaining every voxel actor in memory.

This is a **major production reconciliation** of Document 12 rather than a deletion of its design identity.

---

# 1. Locked System Identity

Document 12 is Leyforge's shared **persistent built-place runtime**.

## 1.1 Document 12 Owns

Document 12 owns:

- persistent structure-instance identity;
- persistent landmark-instance identity where physically structure-like;
- runtime site-to-structure bindings;
- blueprint-resolution reference on placed structures;
- runtime structure composition manifest;
- runtime structure bounds;
- runtime semantic element resolution;
- persistent structure-local state;
- structure condition and damage aggregation;
- structure accessibility facts at the structure level;
- structure ownership references and claim state;
- occupation state;
- abandoned/ruined/restored state execution;
- persistent repair/restoration state;
- conversion/repurposing state at the structure-instance layer;
- structure-local interaction points;
- doors/gates/hatches/entrances as structure-level interfaces while physical Block behaviour remains Document 03;
- route-infrastructure instance state;
- bridge/tunnel/gate physical availability facts;
- structure-to-route topology links;
- structure-to-site topology links;
- structure-to-settlement links;
- structure-to-dungeon links;
- structure-to-history/evidence links;
- structure discovery state references;
- structure-local player edits/deltas;
- protected authored anchors;
- structure instance versioning;
- structure persistence;
- structure LOD;
- distant structure summary;
- runtime structure validation;
- structure migration;
- structure reason codes;
- structure-facing cross-system snapshots.

## 1.2 Document 12 Does Not Own

Document 12 does not own:

- Atlas structure-family identity, function, placement context, history relationships or route/wonder catalogue — 24I;
- dungeon/ruin/lair/megadungeon authored family identity or procedural grammar — 24G;
- final world-generation site coordinates — Document 11;
- editable voxel Blueprint Forge source — Document 22I;
- player-facing blueprint creator — Document 19;
- settlement universal building-function definitions — Document 20;
- settlement project selection — Document 19;
- construction resource transformations — Document 05 / Document 20 project contracts;
- individual Block identity — Document 03;
- final item/loot identity — Documents 04/24J;
- NPC identity/occupancy/job truth — Document 07;
- creature populations — Document 10;
- automation runtime — Document 08;
- magic/ward/portal behaviour — Document 09/14;
- combat damage packets — Document 16;
- prices/tolls/trade-route economics — Set 27;
- ownership reputation/social claim beliefs — Set 28/13;
- biological hazard consequences — Set 29;
- route accessibility/travel time/pathfinding — Set 30;
- vessel physics — Set 26;
- final UI — Document 17.

---

# 2. Production Source-of-Truth Architecture

A structure-related concept may exist across several layers.

| Layer | Owner | Meaning |
|---|---|---|
| Atlas Structure Foundation | 24I | Why a structure/route/wonder exists, where it fits, what it connects to, historical/cultural/world role. |
| Atlas Site/Dungeon Foundation | 24G | Why a dungeon/ruin/lair site exists, its grammar, topology, inhabitants, states and restoration possibilities. |
| Universal Settlement Function | Document 20 | What a civilisation building/service contributes when operational. |
| Official Editable Blueprint | 22I Blueprint Forge | Voxel layout, semantic markers, rooms, zones, stages, source inheritance and placement source. |
| Player Blueprint / Settlement Plan | Document 19 | Restricted player-authored compatible source and settlement-planning workflow. |
| Worldgen Site Candidate | Document 11 | Seed-derived valid physical context and placement opportunity. |
| Construction Project | Documents 19/20/05 | What is being built/repaired/converted, resources, labour, stages and commissioning. |
| Persistent Structure Instance | **Document 12** | What physically exists in this save, where, in what condition, owned/occupied by whom and with which persistent deltas. |
| Service Record | Document 20 | What current settlement capability the structure provides. |
| Route Movement Snapshot | Set 30 | Whether and how a mover traverses route infrastructure. |
| Economic Route State | Set 27 | Toll, value, shipment economics and market significance. |
| Actor Knowledge | Set 28 | Who knows or believes the structure exists, is safe, abandoned, cursed, etc. |

> **No Mirror Rule**
>
> The Structure Instance references these records by stable ID. It does not copy their entire editable source truth into the save.

---

# 3. Atlas Ownership Boundary

## 3.1 24I Owns Authored Structure/Route/Wonder Content

Document 24I is the authored-world structure authority.

It owns content foundations for:

- settlement structures;
- civic structures;
- agriculture;
- industry;
- commerce;
- navigation;
- defence;
- magical infrastructure;
- cultural structures;
- roads;
- bridges;
- crossings;
- ports;
- realm infrastructure;
- wonders;
- megastructures;
- structure modules;
- structure state profiles.

Atlas 24L records **228 structure, route, realm-structure and wonder foundations**, plus **32 reusable structure modules and 18 state profiles**.

Document 12 does not duplicate those counts into another editable structure catalogue.

## 3.2 24G Owns Dungeon/Site Families

24G owns:

- dungeon identity;
- ruin families;
- lairs/nests as site families;
- mines as dungeon/site grammar where appropriate;
- crypts;
- temples;
- towers used as dungeon sites;
- fortress sites;
- buried cities;
- living/mobile dungeons;
- megadungeons;
- room modules;
- hazards;
- puzzles;
- procedural site topology;
- site restoration possibilities;
- site-state grammar.

24G defines **72 Overworld site families, 60 realm dungeon families and 12 megadungeon foundations** as its broad Atlas foundation.

Document 12 executes and persists resulting physical structure/site instances.

## 3.3 No Double Catalogue

A `structure.overworld.defence.watchtower` entry in 24I is not recreated as a second `document12.watchtower`.

A `site.overworld.ruin.*` entry in 24G is not recreated as a second independent structure-family definition.

---

# 4. Production Scope

Set 25 classifies Atlas content by production tier.

For Core Production, 25F selects:

- **45 structure foundations**;
- **12 route foundations**;
- **no required Core wonder**.

The later 24I portfolio remains available for later milestones.

## 4.1 Core Structure Portfolio

Core selections include families such as:

- Assembly House;
- Public Granary;
- Communal Kitchen;
- Civic Infirmary;
- Schoolhouse;
- Refuge Hall;
- Fieldstead;
- Orchard House;
- Irrigation Station;
- Pasture Station;
- Seed Vault;
- Forest Steward Lodge;
- Logging Camp;
- Quarry Complex;
- Minehead Complex;
- Smeltery;
- Sawmill;
- Clayworks;
- Mana Refinery;
- Market Square;
- Caravanserai;
- Regional Warehouse;
- Customs Post;
- Counting House;
- Wayhouse;
- Milestone Chain;
- Toll Gate;
- Roadside Shrine;
- Switchback Station;
- Bridgehouse;
- Watchtower;
- Gatehouse;
- Palisade Fort;
- Beacon Station;
- Patrol Lodge;
- Refuge Bastion;
- Wardstone Circle;
- Mana Well;
- Rune Workshop;
- Leyline Observatory;
- Cleansing House;
- Portal Sanctuary;
- Public Library;
- Festival Ground;
- Language House.

Document 12 supports their structure-instance runtime without becoming their authored catalogue.

## 4.2 Core Route Foundations

Core route foundations include:

- Local Trail;
- Farm Lane;
- Village Street;
- Regional Road;
- Pilgrim Way;
- Seasonal Ford;
- Stone Arch Bridge;
- Rope Suspension Bridge;
- Switchback Pass;
- Road Tunnel;
- Minecart Line;
- River Barge Lane.

The River Barge Lane is a bounded inland-water route and does not by itself imply full ocean shipping.

---

# 5. Original Document 12 Preservation

The following design identity from v0.1 remains valuable:

- structures are exploration anchors;
- structures make civilisation physical;
- structures show history;
- roads and bridges matter;
- structures can generate threats;
- ruins can be repaired/claimed;
- damage persists;
- occupation changes a place;
- magic infrastructure is physical;
- portals are structures, not menus;
- ownership matters;
- structure discovery drives progression;
- material/culture variation matters;
- POC structures demonstrated connected gameplay.

## 5.1 Archived POC Structure Wrapper

Archived as production requirements:

- Forest Hamlet;
- fixed village centre;
- fixed warehouse;
- fixed homes;
- fixed guard post;
- fixed watchtower;
- fixed mage hut/shrine;
- fixed road gate/wall;
- fixed POC bridge;
- fixed rune ruin;
- fixed cave;
- fixed mine;
- fixed goblin camp;
- fixed raid approach;
- fixed mana pocket;
- fixed portal teaser;
- fixed structure distances/orientation.

Their reusable structure capabilities remain.

---

# 6. Structure Taxonomy

Runtime structure instances may represent many Atlas categories.

## 6.1 Civilisation Structures

Examples:

- homes;
- halls;
- markets;
- workshops;
- warehouses;
- farms;
- schools;
- hospitals;
- cultural buildings;
- government buildings;
- defensive works.

Document 20 owns settlement function.

## 6.2 Infrastructure

Examples:

- road segment;
- bridge;
- ford;
- tunnel;
- gate;
- wall;
- drainage;
- aqueduct;
- canal works;
- dock;
- harbour structure;
- beacon;
- utility corridor.

## 6.3 Adventure Structures

Examples:

- ruin;
- tower;
- mine;
- crypt;
- shrine;
- dungeon;
- fortress;
- lair structure;
- archive;
- machine works;
- buried complex.

24G owns site grammar.

## 6.4 Magical Structures

Examples:

- ward anchor;
- rune workshop;
- mana well;
- ritual site;
- portal sanctuary;
- magical observatory;
- cleansing site.

Document 09 owns magical effect.

## 6.5 Landmarks

Examples:

- milestone;
- monument;
- statue;
- ancient arch;
- colossal remains;
- battlefield memorial;
- natural-built hybrid landmark.

## 6.6 Wonders and Megastructures

Wonders may be:

- civilisation-scale;
- magical;
- infrastructural;
- historical;
- realm-scale;
- mobile;
- living.

No world wonder is required for Core Production.

---

# 7. Structure Identity

A persistent structure instance requires stable identity.

Recommended identity:

`structure_instance:<ULID>`

A structure instance references:

- Atlas structure/site family;
- resolved blueprint source;
- world;
- site;
- transform;
- bounds;
- owner/claim;
- current occupier;
- construction origin;
- current condition;
- current state overlays;
- block-volume manifest;
- semantic manifest;
- service references;
- route links;
- history;
- player edits;
- revision.

## 7.1 Display Name Is Not Identity

A structure may be renamed.

Its stable instance ID remains.

## 7.2 Historical Naming

A structure may have:

- original name;
- cultural name;
- conqueror name;
- current public name;
- player name;
- unknown/rumoured name.

Knowledge/display belongs to UI/Set 28.

---

# 8. Persistent Structure Instance Template

```yaml
structure_instance:
  structure_instance_id: structure_instance:<ulid>
  schema_version: 1

  definition:
    atlas_structure_ref: <24I_id>?
    atlas_site_ref: <24G_id>?
    universal_function_refs: []
    resolved_blueprint_ref: blueprint:<id>
    source_pack_refs: []

  world:
    world_ref: world:<id>
    generated_site_ref: site:<id>
    transform_ref: <transform>
    bounds_ref: <bounds>
    realm_ref: <id>
    region_ref: <id>

  physical:
    block_manifest_ref: <id>
    semantic_manifest_ref: <id>
    protected_anchor_refs: []
    local_delta_ref: <id>
    route_connection_refs: []

  authority:
    owner_ref: <id>?
    occupier_ref: <id>?
    claimant_refs: []
    permission_profile_ref: <id>

  lifecycle:
    build_state: completed
    condition_state: intact
    occupation_state: occupied
    corruption_state_ref: null
    restoration_state: none

  cross_system:
    service_record_refs: []
    automation_refs: []
    magic_refs: []
    npc_refs: []
    ecology_refs: []
    quest_event_refs: []
    movement_snapshot_refs: []

  history:
    origin_event_ref: <id>
    history_event_refs: []
    discovery_refs: []

  runtime:
    lod_state: S0
    frozen_definition_revision: <rev>
    structure_revision: 1
```

---

# 9. Blueprint Resolution

A Structure Instance does not contain an editable copy of the complete Blueprint Forge source.

It stores:

- resolved blueprint ID;
- source revision;
- resolved pack/style choices;
- construction substitutions;
- local deltas;
- runtime semantic mapping;
- migration information.

## 9.1 Official Blueprint Authority

Blueprint Forge owns:

- voxel composition;
- semantic layers;
- markers;
- rooms;
- zones;
- sockets;
- construction stages;
- damage overlays;
- inheritance;
- source preview.

## 9.2 Runtime Bake

Runtime may use derived:

- compact block volumes;
- merged meshes;
- collision;
- navigation data;
- semantic lookup tables;
- occlusion;
- audio zones;
- LOD meshes;
- thumbnails;
- state masks.

These are disposable/rebuildable products where possible.

---

# 10. Canonical Block Composition

Structure geometry resolves to canonical Document-03 Blocks.

A structure cannot include an unregistered permanent gameplay Block merely because it exists inside a blueprint.

## 10.1 Block Roles

Blueprint source may refer to semantic material roles such as:

- foundation stone;
- structural timber;
- roof;
- wall;
- trim;
- window;
- floor;
- door;
- metal fitting;
- magic conductor.

Pack resolution maps those roles to canonical Blocks.

## 10.2 Block / Item Rule

A structure Block recovered as itself uses its Block Inventory Projection.

Document 12 does not invent duplicate “structure Items.”

---

# 11. Semantic Structure Manifest

A structure's gameplay meaning is carried through semantic markers and zones.

Examples:

- entrance;
- exit;
- doorway;
- bed;
- workstation;
- storage;
- loading point;
- patrol point;
- guard firing position;
- public access;
- restricted access;
- maintenance zone;
- ladder;
- stair;
- lift;
- road connector;
- bridge deck;
- dock;
- mooring point;
- water intake;
- automation port;
- mana port;
- ritual anchor;
- ward anchor;
- portal anchor;
- creature nest;
- habitat zone;
- loot anchor;
- evidence anchor;
- puzzle anchor;
- boss arena;
- safe retreat;
- sound portal.

## 11.1 Marker Is Not Function by Itself

A bed marker does not create Housing.

A furnace marker does not create production.

A ward marker does not create a ward.

The owning system must validate activation.

---

# 12. World Generation Placement

Document 11 owns generated site placement.

Document 12 consumes:

- world position;
- terrain;
- bounds;
- biome;
- geology;
- hydrology;
- route context;
- history;
- civilisation context;
- danger;
- resource context;
- magic;
- protected anchors.

## 12.1 Placement Contract

Structure placement checks:

- footprint;
- terrain fit;
- support/foundation;
- water conflict;
- cave conflict;
- route conflict;
- protected content;
- entrances;
- exits;
- clearance;
- neighbour spacing;
- cultural/environmental fit;
- generated-history requirements;
- realm law;
- accessibility baseline.

## 12.2 Terrain Adaptation

Allowed adaptation may include:

- foundation fill;
- stilts;
- terraces;
- retaining wall;
- basement;
- cut/fill;
- bridge supports;
- tunnel portal;
- cliff attachment;
- floating foundation;
- root/living support;
- realm-specific support.

Adaptation remains bounded.

---

# 13. Procedural Structure Assembly

Some structures use bounded modular assembly.

Document 24I/24G owns authored grammar.

Document 12 executes the resolved structure graph.

## 13.1 Procedural Assembly Requirements

Procedural structures must preserve:

- required rooms/modules;
- logical adjacency;
- entrance/exit;
- structural support;
- route;
- semantic markers;
- safety;
- functional anchors;
- historical layer;
- puzzle dependencies;
- restoration boundaries.

## 13.2 No Random Room Soup

Modules cannot be shuffled without respecting:

- purpose;
- builder;
- culture;
- geology;
- age;
- circulation;
- services;
- ecology;
- encounter flow.

---

# 14. Dungeon/Site Assembly Boundary

24G owns:

- site-family topology;
- procedural grammar;
- rooms;
- hazards;
- puzzles;
- locks;
- shortcuts;
- return policy;
- ecology sockets;
- ownership possibilities;
- restoration possibilities.

Document 12 owns:

- placed site/structure instance;
- physical block materialisation;
- doors/blocks/puzzle-state persistence interfaces;
- structure-local damage;
- local edits;
- occupancy/claim state;
- physical restoration state.

## 14.1 No Dungeon Reset by Reload

Major:

- opened doors;
- solved puzzles;
- destroyed blocks;
- boss state;
- ownership;
- loot state;
- restoration;
- shortcuts

remain persistent according to 24G policy.

---

# 15. Site Scale Bands

Document 12 supports 24G site scale:

- S0 Site Feature;
- S1 Micro;
- S2 Small;
- S3 Standard;
- S4 Large;
- S5 Complex;
- S6 Megadungeon.

Larger sites may be streamed by zones/districts while preserving one site identity.

---

# 16. Structures as Historical Evidence

A structure should show why it exists.

Possible evidence:

- original material;
- later repairs;
- converted rooms;
- blocked doors;
- heraldry;
- inscriptions;
- battle damage;
- graves;
- abandoned tools;
- ritual residue;
- machine retrofits;
- flood line;
- fire scars;
- collapsed bridge;
- changed road;
- occupier barricades;
- new banners.

## 16.1 History Layer References

A structure may reference:

- origin;
- builder;
- purpose;
- owner transitions;
- war;
- disaster;
- abandonment;
- occupation;
- restoration;
- player intervention.

24K owns authored history/event relationships.

Document 12 persists the resulting physical state.

---

# 17. Structure State Model

State is layered.

## 17.1 Construction State

Examples:

- planned;
- foundations;
- frame;
- enclosed;
- fitted;
- commissioned;
- incomplete;
- abandoned construction.

## 17.2 Condition

Examples:

- intact;
- worn;
- damaged;
- heavily damaged;
- partially collapsed;
- collapsed;
- destroyed.

## 17.3 Occupation

Examples:

- unoccupied;
- resident;
- faction occupied;
- creature occupied;
- disputed;
- besieged;
- evacuated;
- abandoned.

## 17.4 Magical State

Examples:

- normal;
- warded;
- blessed;
- corrupted;
- cursed;
- sealed;
- unstable;
- realm-touched.

## 17.5 Restoration

Examples:

- unrestored;
- surveyed;
- secured;
- cleared;
- stabilised;
- under repair;
- partially restored;
- restored;
- converted.

These state axes can coexist.

---

# 18. State Precedence

Example:

A structure can be:

- construction state: `completed`;
- condition: `heavily_damaged`;
- occupation: `faction_occupied`;
- magic: `corrupted`;
- restoration: `secured`.

Do not create a giant enum such as:

`heavily_damaged_faction_occupied_corrupted_secured_watchtower`.

---

# 19. Damage Boundary

Document 16 owns combat Damage Packets.

Document 03 owns Block-level physical behaviour.

Document 12 owns the resulting structure-level condition interpretation.

## 19.1 Damage Flow

`Damage Source`  
→ Document 16/environment action  
→ affected Blocks/semantic groups  
→ Document 03 applies valid Block state/destruction  
→ Document 12 recalculates Structure Condition  
→ Document 20 recalculates settlement services  
→ Set 30 updates access/path truth  
→ history/event evidence emitted.

## 19.2 Structure Damage Groups

A blueprint may define damage groups such as:

- foundation;
- roof;
- wall;
- entrance;
- bridge span;
- tower top;
- gate mechanism;
- stair;
- support;
- utility room;
- ward anchor;
- dock;
- storage;
- machinery zone.

---

# 20. Partial Functionality

Damage should not always switch a structure from 100% to 0%.

Examples:

- house loses one room;
- bridge loses one lane;
- tower loses upper lookout;
- warehouse loses storage capacity;
- wall gains breach;
- clinic loses treatment room;
- mine loses lower access;
- road becomes slower/unsafe;
- portal site loses stabiliser.

Document 20 calculates settlement service effects.

Set 30 calculates movement effects.

---

# 21. Collapse

Collapse may occur through:

- destroyed support;
- terrain failure;
- siege;
- fire;
- flood;
- earthquake/event;
- magical failure;
- scripted historic state.

Leyforge is not a full finite-element structural simulator.

Collapse uses authored support/critical-group rules and bounded physics.

## 21.1 Collapse Persistence

Collapsed Blocks/rubble remain world state until:

- cleared;
- repaired;
- rebuilt;
- despawned by explicit low-value cleanup policy.

---

# 22. Repair

Repair requires:

- ownership/permission;
- valid target;
- materials;
- recipe/project;
- tools;
- labour;
- access;
- safety;
- specialist capability where necessary.

Repair does not happen because a “repair percentage” increases without resource transactions.

---

# 23. Restoration

Restoration is broader than repair.

It may include:

- clearing;
- excavation;
- stabilisation;
- cleansing;
- structural repair;
- replacement;
- historical reconstruction;
- utility reconnection;
- ward repair;
- route reopening;
- settlement conversion;
- legal claim;
- ecological cleanup.

## 23.1 Restoration Outcomes

A ruin might become:

- player base;
- settlement building;
- faction outpost;
- museum/archive;
- shrine;
- mine;
- workshop;
- road station;
- portal facility;
- protected heritage site;
- sealed danger.

---

# 24. Claiming

A structure may be:

- unclaimed;
- privately owned;
- household owned;
- settlement owned;
- faction owned;
- state/government owned;
- religious/cultural owned;
- disputed;
- abandoned;
- player claimed.

Document 12 stores the current physical claim/owner reference.

Document 13/law decides legal meaning.

Set 28 tracks beliefs/recognition.

Set 27 handles economic property consequences where defined.

---

# 25. Occupation

Occupation is separate from ownership.

Examples:

- bandits occupying an abandoned tower;
- soldiers holding enemy fort;
- creatures nesting in a ruin;
- refugees sheltering in warehouse;
- player squatting in ancient ruin.

Document 12 records physical occupation.

Person/faction/ecology owners maintain occupants.

---

# 26. Conquest

Conquest can change:

- occupier;
- banners;
- access;
- gate control;
- services;
- damage;
- stock ownership;
- settlement connection;
- route control;
- law.

It does not require spawning a replacement structure.

---

# 27. Abandonment

A structure can become abandoned through:

- migration;
- war;
- disaster;
- economic decline;
- route change;
- magical contamination;
- ecological pressure;
- owner collapse.

Abandonment may alter:

- maintenance;
- decay;
- infestation;
- loot;
- route use;
- occupation chance;
- history.

---

# 28. Reoccupation

An abandoned site may be reoccupied by:

- settlement;
- faction;
- bandits/persons;
- creatures;
- cult;
- scholars;
- player;
- refugees;
- machines/constructs;
- spirits.

Reoccupation is an event/history transition, not a reset.

---

# 29. Roads

Road instances are physical infrastructure.

Document 12 stores:

- route foundation ref;
- physical segments;
- width;
- surface;
- condition;
- crossings;
- ownership;
- blockages;
- maintained state;
- route-node links;
- history.

Set 30 owns movement cost/access.

Set 27 owns economic significance.

---

# 30. Trails and Informal Routes

A trail may emerge from:

- worldgen;
- culture;
- repeated travel;
- migration;
- hunting;
- player construction.

Not every route requires formal engineering.

---

# 31. Bridges

Bridge runtime state includes:

- deck;
- supports;
- approaches;
- clearance;
- width;
- condition;
- load/vehicle suitability tags;
- ownership;
- gate/toll integration;
- waterway impact.

Set 30 decides mover accessibility.

Set 26 owns vessel/navigation implications for navigable waters.

---

# 32. Fords

A ford may change by:

- season;
- water level;
- flood;
- erosion;
- engineering.

Document 12 owns ford physical feature state.

Set 30/26 decides whether a specific mover can cross.

---

# 33. Tunnels

A route tunnel may include:

- entrances;
- clearance;
- supports;
- ventilation;
- lighting;
- collapse state;
- water;
- ownership;
- gate;
- traffic policy.

Movement remains Set 30.

---

# 34. Gates

Gates expose:

- open/closed;
- locked;
- damaged;
- blocked;
- authorised identities;
- control mechanism;
- automation interface;
- guard interface.

Document 12 owns structural gate instance state.

Document 03 owns constituent Blocks.

Set 30 consumes clearance.

---

# 35. Walls and Fortifications

Fortifications may include:

- wall;
- palisade;
- tower;
- gatehouse;
- trench;
- barricade;
- refuge;
- beacon.

Document 20/16 owns defence capability calculations.

Document 12 owns physical state.

---

# 36. Cover and Combat Geometry

Structure semantic data may expose:

- cover;
- firing position;
- chokepoint;
- breach;
- wall height;
- destructible group;
- siege target;
- retreat route.

Document 16 resolves combat.

---

# 37. Mines and Industrial Sites

Mine sites may contain:

- shafts;
- galleries;
- supports;
- minehead;
- storage;
- rails;
- lifts;
- pumps;
- machinery;
- old workings;
- hazards.

24G owns site grammar.

Document 06 owns resource identity.

Document 08 owns machinery.

Set 30 owns minecart/lift movement.

Document 12 owns the place.

---

# 38. Caves and Natural Structures

Natural caves become structure/site runtime when they contain persistent authored/site features such as:

- built supports;
- doors;
- shrines;
- ruins;
- nests;
- settlements;
- mines;
- puzzles;
- portal anchors;
- special ownership.

The natural terrain remains Document 11/world voxel state.

---

# 39. Camps and Outposts

A camp may be:

- temporary;
- semi-permanent;
- faction;
- caravan;
- military;
- research;
- mining;
- refugee;
- hostile;
- peaceful.

If occupants are persons, personhood/faction rules apply.

A hostile camp is not automatically a monster nest.

---

# 40. Creature-Built Structures

Examples:

- hive;
- nest;
- burrow;
- dam;
- mound;
- web complex;
- reef;
- giant remains shelter.

24F/Document 10 owns ecology.

24G may own site grammar.

Document 12 may persist structure-like physical state.

---

# 41. Shrines and Sacred Sites

A shrine may carry:

- cultural owner;
- ritual marker;
- offerings;
- pilgrimage route;
- ward;
- history;
- law;
- social meaning.

Document 09 owns magic.

Document 13 owns culture/faith/law.

Document 12 owns physical place/state.

---

# 42. Ritual Sites

A ritual structure supplies:

- anchors;
- zones;
- orientation;
- layout;
- access;
- safety;
- storage;
- mana links.

Document 09 validates ritual function.

---

# 43. Ward Structures

A Wardstone Circle or similar structure may contain:

- ward anchors;
- conduits;
- power/mana access;
- perimeter geometry;
- maintenance access.

Document 09 owns ward coverage/effect.

Document 12 owns the physical structure.

---

# 44. Portal Structures

Portal sites may include:

- frame;
- anchor;
- control;
- ritual space;
- ward;
- staging;
- return area;
- stabiliser;
- signage.

Document 09 owns activation/stabilisation.

Document 14 owns realm destination/topology.

Document 12 owns physical site.

---

# 45. Portals Do Not Become Menus

A portal should physically exist where the world says it exists.

Activation does not turn it into an abstract fast-travel list unless a specialised system explicitly provides that interface.

---

# 46. Cultural Architecture

24E/24I/20G own cultural architectural context.

Blueprint/material packs may change:

- proportions;
- roof form;
- materials;
- ornament;
- street relationships;
- courtyards;
- room preference;
- symbolic spaces;
- defensive form.

Culture does not change universal physics unless a declared module says so.

---

# 47. Biome Adaptation

Structures may adapt to:

- snow;
- wetland;
- desert;
- jungle;
- mountains;
- caves;
- coasts;
- skylands;
- magical environments.

Adaptations may change:

- foundation;
- roof;
- drainage;
- ventilation;
- materials;
- access;
- supports.

---

# 48. Realm Structures

24D/24I own realm structure identities and realm-law context.

Document 12 supports:

- altered gravity;
- dream topology;
- living architecture;
- unstable matter;
- realm-native materials;
- realm access rules;
- realm state.

Set 30 owns movement through unusual geometry.

---

# 49. Maritime Structures

Set 26 extends structure systems into:

- docks;
- piers;
- wharves;
- harbours;
- breakwaters;
- lighthouses;
- shipyards;
- dry docks;
- slipways;
- coastal fortifications;
- cargo facilities;
- maritime rescue structures;
- underwater structures.

## 49.1 Ownership Boundary

Document 12 owns persistent physical structure state.

Set 26J/H/F owns specialist maritime functionality such as:

- docking;
- shipyard operation;
- vessel construction interfaces;
- launching;
- berthing;
- maritime service roles.

Document 20 may own settlement service contribution.

---

# 50. Vessel Boundary

A vessel is not an ordinary static Structure Instance.

Set 26F owns Vessel Instances and local vessel grids.

Document 12 may share:

- Block/Blueprint semantics;
- damage-state patterns;
- semantic markers;
- construction interfaces.

But a moving vessel does not become a Document-12 static structure.

---

# 51. Wrecks

A wreck may transition from Vessel Instance to persistent wreck/site state according to Set 26.

Document 12/24G/26M may then represent:

- wreck structure;
- salvage;
- ecology;
- history;
- dungeon-like spaces.

The transition must preserve identity/provenance.

---

# 52. Settlement Buildings Boundary

Document 20 owns settlement building **function**.

Document 12 owns the placed structure.

Example:

A structure that visually resembles a cottage does not provide Housing until Document 20 validates:

- roof/shelter;
- beds;
- access;
- condition;
- occupancy;
- safety;
- services.

Document 12 provides the physical/semantic facts.

---

# 53. Mixed-Use Structures

One structure may satisfy several compatible Document-20 functions.

Example:

- shop + residence;
- inn + stable;
- gatehouse + guard lodging;
- library + school.

Document 12 stores one Structure Instance.

Document 20 stores separate service/function records.

---

# 54. Player-Designed Structures

Document 19 owns player-facing Blueprint Workshop/Designer.

Document 12 accepts a validated runtime blueprint.

Player design cannot override:

- registry identity;
- forbidden semantic contracts;
- server authority;
- ownership;
- protected world anchors;
- realm laws;
- route safety;
- resource conservation.

---

# 55. Player Edits to Existing Structures

Players may:

- repair;
- renovate;
- expand;
- excavate;
- decorate;
- reinforce;
- convert;
- partially demolish.

The Structure Instance tracks deltas.

## 55.1 Ancestry Preservation

Where practical, preserve:

- original blueprint ref;
- historical state;
- player modifications.

This enables restoration/history and migration.

---

# 56. Protected Anchors

Certain semantic anchors cannot be casually deleted without invalidating a system.

Examples:

- realm portal anchor;
- required dungeon return route;
- boss arena anchor;
- settlement entrance;
- essential support;
- protected quest evidence.

Deletion may be:

- blocked;
- require confirmation;
- create a valid failure/consequence;
- require conversion.

---

# 57. Construction

Settlement construction is owned by Documents 19/20.

Generic structure construction still follows the shared principles:

- real materials;
- blueprint;
- site;
- stages;
- labour/tool capability;
- access;
- permission;
- transactions.

Document 12 receives the resulting evolving Structure Instance.

---

# 58. Construction Stages

A structure may exist during construction.

Runtime stages may expose:

- stage blocks;
- scaffold;
- open foundations;
- partial access;
- temporary storage;
- unsafe areas;
- incomplete services.

Visual completion does not imply commissioning.

---

# 59. Commissioning

Commissioning validates:

- required structure state;
- required semantic elements;
- access;
- utilities;
- ownership;
- specialist checks.

Document 20 owns settlement service commissioning.

Document 09/08/26 own specialist system commissioning.

---

# 60. Deconstruction

Deconstruction differs from destruction.

It may:

- recover materials;
- preserve components;
- remove carefully;
- relocate;
- release parcel/site.

Document 05 owns salvage transformations.

---

# 61. Salvage

Salvage may yield:

- Blocks;
- genuine Items;
- components;
- resources;
- relics;
- documents;
- machinery.

Output provenance remains linked to the structure/site.

---

# 62. Loot

Loot is not embedded as infinite structure inventory.

Sources may include:

- stored inventories;
- hidden cache;
- abandoned goods;
- relic;
- occupant inventory;
- reward grammar.

24J owns reward context.

Documents 04/06 own physical identity.

---

# 63. Structure Inventory

A structure may own inventories such as:

- warehouse;
- chest;
- armory;
- library storage;
- workshop stock;
- ritual store;
- food store.

Inventory ownership remains explicit.

Destroying a structure does not automatically delete its stock.

---

# 64. Structure Services

Document 12 exposes structure facts.

Specialist systems expose services.

Examples:

- housing — Document 20;
- storage — 20/Inventory;
- power — Document 08;
- mana — Document 09;
- portal — Document 09/14;
- clinic — Document 20/29;
- market — Document 20/27;
- shipyard — Document 20/26.

---

# 65. Automation Integration

Structure semantics may expose:

- machine pad;
- loading zone;
- conveyor port;
- power port;
- maintenance zone;
- storage endpoint.

Document 08 owns automation.

---

# 66. Magic Integration

Structure semantics may expose:

- mana port;
- ward anchor;
- ritual zone;
- rune substrate;
- portal anchor;
- cleansing zone.

Document 09 owns magic.

---

# 67. NPC Integration

Document 07 consumes:

- home;
- workplace;
- entrance;
- bed;
- storage;
- work marker;
- public/private area;
- emergency shelter;
- maintenance access.

Document 12 does not schedule residents.

---

# 68. Creature Integration

Document 10 consumes:

- nest/habitat zone;
- den;
- roost;
- access;
- shelter;
- lair;
- stable/pasture;
- deterrent boundaries.

Document 12 does not spawn creatures.

---

# 69. Movement Integration

Set 30 consumes structure facts such as:

- collision;
- walkable surfaces;
- door/gate state;
- stairs;
- ladder;
- bridge deck;
- tunnel clearance;
- route connector;
- lift interface;
- traversal socket;
- blocked area;
- damage.

## 69.1 Document 12 Does Not Calculate Path Cost

It publishes physical state.

Set 30 interprets movement.

---

# 70. Dynamic Route Revisions

When a route structure changes:

- bridge collapses;
- gate closes;
- tunnel floods;
- road blocked;
- wall breach created;

Document 12 increments relevant topology revision.

Set 30 invalidates affected path/route caches.

Set 27 may update economic routes after Set 30 publishes new access.

---

# 71. Economy Integration

Set 27 consumes:

- market structure exists;
- warehouse capacity;
- customs post;
- toll gate;
- route endpoint;
- structure ownership;
- damage;
- accessibility result.

Set 27 owns:

- toll amount;
- price;
- rent;
- market value;
- economic route significance.

---

# 72. Social Knowledge

A structure may physically be:

- occupied;
- dangerous;
- cursed;
- restored;
- open.

An NPC/player may believe something else.

Set 28 owns knowledge/belief.

Document 12 exposes objective structure truth to authorised queries.

---

# 73. Signs and Evidence

Structure state can produce evidence:

- smoke;
- lights;
- flags;
- tracks;
- damage;
- fresh repairs;
- locked gate;
- noise;
- ward glow;
- scaffolding.

Presentation may reveal objective state without leaking hidden metadata.

---

# 74. Ownership Knowledge

A structure's authoritative owner may be known, disputed or secret.

Document 12 stores owner reference.

Set 28/13 controls who knows/recognises that claim.

---

# 75. Biology and Hazards

Structures may create environmental facts:

- shelter;
- heat;
- cold exposure;
- damp;
- contamination;
- smoke;
- toxin;
- unsafe air;
- disease isolation;
- sanitation;
- drowning risk.

Set 29 calculates biological consequence.

---

# 76. Quarantine

A quarantine structure does not cure disease by existence.

It may provide:

- isolation capacity;
- controlled access;
- sanitation capability;
- treatment space.

Set 29 decides disease transmission/treatment.

---

# 77. Fire

Fire may:

- damage Blocks;
- spread through structure;
- destroy roof;
- create smoke;
- force evacuation;
- interrupt services.

Structure runtime persists resulting damage.

---

# 78. Flooding

Flooding may:

- block rooms;
- damage materials;
- affect foundations;
- disable services;
- alter access.

Fluid owner supplies water state.

Document 12 records persistent structural consequence where applicable.

---

# 79. Weathering and Decay

Weathering may be:

- presentation-only;
- condition-affecting;
- repair-relevant.

Definitions must specify which.

Not every old structure automatically decays into rubble.

---

# 80. Corruption

Document 09 owns magical corruption.

Document 12 stores structure-level corruption reference and physical manifestations.

Corruption may affect:

- access;
- materials;
- service;
- ecology;
- inhabitants;
- restoration.

---

# 81. Cleansing

Cleansing may remove magical state but not automatically repair physical damage.

A cleansed ruin can remain collapsed.

---

# 82. Destruction

Destruction is persistent.

Major structure destruction may create:

- rubble;
- salvage;
- blocked route;
- displaced residents;
- lost service;
- new ecology;
- history;
- rebuilding project.

---

# 83. World Events

Document 15/24K may change structures through:

- war;
- raid;
- fire;
- flood;
- collapse;
- corruption;
- occupation;
- festival;
- construction;
- abandonment;
- restoration.

Document 12 commits physical instance state.

---

# 84. Quests and Objectives

Document 15 may target structure IDs.

Examples:

- survey;
- reach;
- repair;
- cleanse;
- defend;
- restore;
- claim;
- investigate;
- deliver;
- activate;
- disable;
- rescue.

Objective state is not owned by Document 12.

---

# 85. Structure Discovery

Discovery may occur through:

- direct sight;
- map;
- NPC;
- rumour;
- archive;
- magic;
- road sign;
- event.

Set 28/17 owns knowledge/UI.

Document 12 provides physical discoverable evidence.

---

# 86. Mapping

Structures may expose map geometry:

- point;
- area;
- route;
- entrance;
- floor;
- zone.

Player map may show only discovered/known information.

---

# 87. Landmarks

Landmarks improve navigation.

A landmark should have:

- silhouette;
- position;
- identity;
- visual range;
- history or purpose;
- nearby relationship.

Set 30 can use known landmarks for navigation UX but does not need landmark ownership.

---

# 88. Milestones

Milestone chains physically indicate:

- distance;
- road identity;
- settlement direction;
- jurisdiction;
- route history.

Set 28 may model whether the actor can read/understand them.

---

# 89. Tolls and Customs

Toll gates and customs posts are structures.

Document 12 owns:

- gate;
- booth;
- checkpoint space;
- owner;
- physical control.

Set 27/13 owns:

- toll;
- customs charge;
- legal inspection;
- economic consequence.

---

# 90. Settlements Inside Large Sites

Large sites may contain:

- enclave;
- camp;
- town;
- monastery;
- market;
- refuge.

Document 07/19/20 handles living settlement operation.

24G preserves site identity.

Document 12 preserves physical structure hierarchy.

---

# 91. Megadungeons

Megadungeons may contain:

- districts;
- factions;
- routes;
- shortcuts;
- utilities;
- settlements;
- industries;
- ecology;
- bosses;
- portals.

Document 12 supports streamed structure/site-instance hierarchy.

It does not flatten a megadungeon into one scene.

---

# 92. Mobile Dungeons

24G may define mobile dungeons.

If the entire site physically moves, ownership of that movement depends on the underlying mover:

- vessel — Set 26;
- vehicle — Set 30;
- creature — Document 10 + Set 30/26;
- magical realm phenomenon — Document 09/14.

Document 12 retains the structure/site state attached to the mover.

---

# 93. Living Structures

A living structure may be:

- giant tree-city;
- coral complex;
- fungal architecture;
- organism shell.

Document 10/29 may provide biology/ecology.

Document 12 owns structure/site semantics.

---

# 94. Wonders

Wonders are not just oversized buildings.

A wonder requires:

- world role;
- construction/history;
- supporting civilisation;
- resources;
- maintenance;
- access;
- consequence.

24I owns wonder foundations.

Document 12 persists the placed result.

---

# 95. No Core Wonder Requirement

Set 25 explicitly locks **no mandatory Core Production wonder**.

Wonders arrive when:

- supporting systems;
- content;
- assets;
- performance;
- persistence

are mature.

---

# 96. Structure Hierarchies

A large structure may contain child instances.

Example:

`Fortress Complex`
- gatehouse;
- wall segments;
- tower;
- barracks;
- keep;
- warehouse.

## 96.1 Child Identity

Child instances may remain separately damageable/saveable.

Parent aggregates:

- ownership;
- site state;
- service relationships;
- history.

---

# 97. District/Complex Boundary

Document 20F owns district/complex/megaproject **planning and function coordination** for settlements.

Document 12 owns physical child structure instances.

A district is not one giant structure object.

---

# 98. Structural Networks

Structures can form networks:

- road;
- wall;
- aqueduct;
- canal;
- power;
- mana;
- railway;
- port;
- beacon.

Document 12 owns physical connection graph where it is structure topology.

Specialists own functional network behavior.

---

# 99. Route Graph

A route-structure graph can expose:

- node;
- segment;
- crossing;
- structure endpoint;
- condition;
- closure;
- ownership;
- topology revision.

Set 30 builds movement route behavior from these facts.

---

# 100. Structural Support Abstraction

Leyforge should support intuitive structural consequence without becoming an engineering package.

Support may use:

- foundation groups;
- support columns;
- span limits;
- critical beams;
- authored collapse groups.

Exact model is implementation/balance work.

---

# 101. Player Freedom and Structural Engineering

Players should be able to create unconventional buildings.

Validation focuses on:

- required semantic functions;
- access;
- safety;
- support;
- ownership;
- resource cost.

Not aesthetic conformity.

---

# 102. Structural Safety

Safety may require:

- exit;
- stable floor;
- support;
- fire route;
- railing;
- ventilation;
- safe machine clearance;
- hazardous zone separation.

World settings may simplify safety requirements.

---

# 103. Accessibility in Structure Design

Official blueprints should consider:

- navigable entrances;
- readable stairs;
- ramps/lifts where appropriate;
- route alternatives;
- clear interaction points;
- contrast;
- non-audio-only signals.

Realm/dungeon content may intentionally challenge access, but must provide authored counterplay.

---

# 104. Dungeon Solvability

24G requires:

- critical path;
- dependency order;
- valid keys/locks;
- puzzle logic;
- return safety;
- multiplayer joins;
- retreat/recovery.

Document 12 persists the physical state needed to preserve solvability.

---

# 105. Player Edits and Dungeon Solvability

If players can alter terrain/structure inside a dungeon:

- protected anchors;
- backup access;
- rebuild tools;
- recovery teleport only if explicitly authored;
- fail-safe return

must prevent accidental permanent save soft-lock.

---

# 106. Loot Reset

Major loot does not regenerate automatically on reload.

Any replenishment requires:

- population;
- faction restock;
- event;
- resource regeneration;
- world setting.

---

# 107. Doors, Locks and Keys

Document 12 owns physical door/lock instance state.

Definition of:

- lock;
- required key;
- puzzle;
- permission

may belong to 24G/13/09.

Inventory owns keys/items.

---

# 108. Puzzle State

24G owns puzzle grammar.

Document 12 may persist:

- lever state;
- door state;
- moved block;
- broken component;
- solved flag reference;
- physical puzzle layout delta.

Puzzle logic remains its owning module.

---

# 109. Traps

24G owns hazard/trap module definition.

Document 12 owns physical trap structure state.

Document 16/29/09 resolve damage/biological/magical consequences.

---

# 110. Archaeology

Structures can preserve:

- construction layers;
- inscriptions;
- relic positions;
- tool marks;
- buried phases;
- repairs;
- graves.

Player may survey or excavate.

24K/24J/Set 28 own historical/relic/knowledge meaning.

---

# 111. Heritage and Restoration Choices

Restoration may preserve:

- original style;
- later historical layer;
- current occupier modifications.

Player/faction choices may create different heritage outcomes.

---

# 112. Conversion

A structure may convert function without deleting history.

Examples:

- tower → home;
- ruin → workshop;
- fort → market;
- temple → archive;
- mine → dungeon settlement.

Document 20 determines any new settlement function.

---

# 113. Structure Ownership and Content Packs

A save references stable IDs.

If a content pack disappears:

- preserve structure instance;
- preserve block state where possible;
- use missing-content placeholder;
- quarantine unsupported semantics;
- never silently delete important player structures.

---

# 114. Versioning

Structure instance records store:

- schema version;
- blueprint source revision;
- Atlas definition revision;
- semantic manifest version;
- state profile version;
- local delta version.

---

# 115. Blueprint Updates

Updating official source must not silently rebuild existing structures.

Possible policy:

- new placements use new source;
- existing unmodified structure can opt into compatible migration;
- modified/historical structures preserve frozen source;
- explicit renovation project may update.

---

# 116. Generated Structure Freeze

Once a generated structure is:

- discovered;
- modified;
- occupied;
- looted;
- quest-bound;
- claimed;
- damaged;
- restored;

its resolved instance is protected against silent regeneration.

---

# 117. Persistence

Persist meaningful structure state:

- ID;
- blueprint;
- source revisions;
- transform;
- owner;
- occupier;
- block delta;
- semantic state;
- damage;
- construction;
- restoration;
- corruption;
- route links;
- inventories refs;
- history refs;
- services refs;
- local edits;
- discovery refs;
- LOD.

---

# 118. Save Atomicity

A structure save transaction should not produce:

- completed project without Blocks;
- Blocks without structure instance;
- ownership lost;
- inventory duplicated;
- repair consumed but damage unchanged;
- destroyed bridge still available in route graph.

Technical owner must commit related records safely.

---

# 119. Simulation LOD

### S0 — Fully Active Structure
- loaded voxels;
- collisions;
- doors;
- interactions;
- local NPC/creatures;
- machines;
- magic.

### S1 — Local Reduced
- structure instance active;
- simplified presentation;
- lower update.

### S2 — Site Summary
- condition;
- ownership;
- occupancy;
- key services;
- inventories;
- ecology;
- route state.

### S3 — Regional Summary
- major route/site state;
- owner;
- damage;
- project/restoration;
- event hooks.

### S4 — Dormant Archive
- stable identity;
- persistent deltas;
- wake triggers.

---

# 120. LOD Invariants

Distance cannot change:

- ownership;
- structure existence;
- major damage;
- loot state;
- restoration;
- route closure;
- portal state;
- service truth;
- boss/site resolution;
- player edits.

---

# 121. Streaming Large Sites

Large structures/sites use:

- zone streaming;
- portal/door boundaries;
- distance;
- relevance;
- navigation chunks;
- audio zones;
- encounter activation.

One persistent site identity can span many loaded zones.

---

# 122. Multiplayer Authority

Host/server owns:

- placement;
- destruction;
- repair;
- claiming;
- ownership;
- door/gate state;
- structure inventory transfers;
- restoration;
- route state;
- blueprint instance mutation.

Clients request changes.

---

# 123. Concurrent Editing

Multiplayer building/repair requires:

- edit locks or transactional conflict resolution;
- authoritative voxel revision;
- project reservation;
- ownership permission;
- rollback on failure.

---

# 124. Structure Permissions

Possible permissions:

- enter;
- use;
- build;
- break;
- repair;
- claim;
- configure;
- loot;
- store;
- operate machine;
- use portal;
- use bed;
- use service.

Permission source remains law/owner systems.

---

# 125. Theft and Trespass

Document 12 exposes:

- restricted structure;
- locked container;
- owner;
- trespass area.

Set 13/28/27/15 handles:

- law;
- reputation;
- crime;
- economic consequence;
- quests.

---

# 126. Structure Runtime Events

Examples:

- `StructurePlaced`
- `StructureCompleted`
- `StructureCommissioned`
- `StructureDamaged`
- `StructureConditionChanged`
- `StructureCollapsed`
- `StructureClaimed`
- `StructureOwnerChanged`
- `StructureOccupied`
- `StructureAbandoned`
- `StructureRestorationStarted`
- `StructureRestored`
- `StructureConverted`
- `RouteStructureBlocked`
- `RouteStructureReopened`
- `ProtectedAnchorChanged`
- `StructureDestroyed`

---

# 127. Diagnostics

| Code | Meaning |
|---|---|
| `STR-ID-001` | Missing/invalid Structure Instance identity. |
| `STR-DEF-001` | Missing Atlas structure/site definition. |
| `STR-BP-001` | Blueprint source missing/incompatible. |
| `STR-BLK-001` | Canonical Block reference invalid. |
| `STR-SEM-001` | Required semantic manifest invalid. |
| `STR-SITE-001` | Worldgen site/placement incompatible. |
| `STR-BOUNDS-001` | Bounds overlap/protected collision. |
| `STR-ACCESS-001` | Required entrance/access missing. |
| `STR-SUPPORT-001` | Structural support validation failed. |
| `STR-STATE-001` | Invalid lifecycle-state combination. |
| `STR-DMG-001` | Damage cannot reconcile with Block state. |
| `STR-OWN-001` | Ownership/claim conflict. |
| `STR-OCC-001` | Occupation reference invalid. |
| `STR-REST-001` | Restoration prerequisites incomplete. |
| `STR-ROUTE-001` | Route topology inconsistent. |
| `STR-SVC-001` | Specialist service reference invalid. |
| `STR-INV-001` | Structure inventory reference invalid. |
| `STR-HIST-001` | History/provenance reference invalid. |
| `STR-LOD-001` | LOD promotion/demotion mismatch. |
| `STR-MIG-001` | Migration failed. |
| `STR-AUTH-001` | Unauthorised structure mutation. |
| `STR-POC-001` | Retired POC dependency in production pool. |
| `STR-DUP-001` | Duplicate structure/function/blueprint identity detected. |

---

# 128. Validation Architecture

## 128.1 Identity Validation

Validate:

- stable ID;
- Atlas ref;
- Blueprint ref;
- world/site ref;
- schema;
- ownership;
- state.

## 128.2 Physical Validation

Validate:

- Blocks;
- bounds;
- foundation;
- clearance;
- entrance;
- collision;
- protected anchors;
- route connectors.

## 128.3 Semantic Validation

Validate:

- required markers;
- zones;
- sockets;
- room roles;
- service interfaces.

## 128.4 State Validation

Validate:

- damage;
- construction;
- occupation;
- restoration;
- corruption;
- ownership.

## 128.5 Cross-System Validation

A build/runtime validation fails if Document 12:

- calculates market price;
- calculates travel time;
- writes Trust;
- writes Health;
- creates NPC;
- spawns ecology without owner;
- executes spell;
- owns settlement service formula;
- duplicates Blueprint Forge source;
- duplicates Atlas structure family.

---

# 129. POC Leakage Scan

Production validation detects:

- Forest Hamlet structure IDs;
- fixed watchtower chain;
- fixed goblin camp;
- fixed rune ruin;
- fixed POC warehouse;
- fixed POC village-centre dependencies;
- fixed POC bridge/cave/portal coordinates;
- hardcoded raid-approach structure;
- POC-only asset paths.

Archive/test namespaces are exempt.

---

# 130. Structure Test Laboratory

## 130.1 Generated Ruin Test

Generate ruin through Document 11/24G.

Verify:

- deterministic placement;
- Blueprint resolution;
- history;
- damage;
- loot;
- ownership;
- persistence.

## 130.2 Claim and Restore

Clear/claim/repair ruin.

Verify:

- same instance;
- no duplicate restored definition;
- resource conservation;
- new service through Document 20 if appropriate.

## 130.3 Bridge Damage

Destroy span.

Verify:

- Block changes;
- structure condition;
- route revision;
- Set 30 invalidation;
- Set 27 does not continue impossible route.

## 130.4 Gate Permission

Close locked gate.

Verify physical state and access query.

## 130.5 Dungeon Persistence

Open doors, solve puzzle, remove boss, edit blocks, leave/reload.

Verify persistence.

## 130.6 Settlement Building

Construct official cottage and player-designed cottage.

Verify one Document-20 function can be satisfied by different Blueprint sources.

## 130.7 Occupation

Faction occupies old fort.

Verify:

- owner and occupier can differ;
- residents/faction exist outside structure record.

## 130.8 Corruption/Cleansing

Corrupt structure, then cleanse.

Verify magic state changes but physical damage remains unless repaired.

## 130.9 Maritime Structure

Damage harbour pier.

Verify Set 26/30 receive physical access changes.

## 130.10 Migration

Update Blueprint source.

Verify explored modified Structure Instance does not silently rebuild.

---

# 131. Performance

Structure runtime must avoid:

- one node per voxel;
- one node per distant room;
- permanent physics on dormant ruins;
- always-active puzzle scripts;
- always-active structure audio;
- rebuilding whole Blueprint source after small damage.

Use:

- chunk voxel data;
- semantic lookup;
- derived meshes;
- event-driven state;
- LOD;
- pooled effects;
- streamed zones;
- compact deltas.

---

# 132. Low-End Profiles

Low-end settings may reduce:

- render distance;
- decorative clutter;
- mesh detail;
- shadow;
- VFX;
- audio emitters;
- distant structure update frequency;
- interior presentation.

They do not remove:

- roads;
- bridges;
- structures;
- owners;
- damage;
- services;
- route state;
- player edits;
- dungeons.

---

# 133. Godot / Summer Engine Direction

Document 18 v1.0 will own implementation.

Document 12 requires eventual services such as:

- StructureRegistryAdapter;
- StructureInstanceService;
- BlueprintRuntimeResolver;
- StructureSemanticService;
- StructureStateService;
- StructureDamageAggregator;
- StructureOwnershipAdapter;
- StructureRouteTopologyService;
- StructurePersistenceService;
- StructureLODService;
- SiteRuntimeAdapter;
- StructureMigrationService;
- StructureDebugInspector.

Names are illustrative.

---

# 134. Production Registries

Document 12-owned runtime definitions/profiles may include:

- structure-instance schema;
- structure condition profile;
- structure state precedence;
- occupation state;
- restoration runtime profile;
- claim profile;
- route-structure runtime profile;
- damage-group profile;
- semantic binding profile;
- LOD profile;
- migration alias;
- diagnostic reason code.

Authored content remains 24G/24I/20/Forge-owned.

---

# 135. Cross-System Interface Summary

## 135.1 Document 11 → Document 12

Supplies:

- site candidate;
- world transform;
- terrain;
- region;
- history;
- route context.

Document 12 returns:

- placed persistent structure/site instance.

## 135.2 24I / 24G → Document 12

Supplies:

- authored identity;
- placement/function/history context;
- site grammar;
- state possibilities.

Document 12 returns:

- executable/persistent instance state.

## 135.3 Blueprint Forge → Document 12

Supplies:

- resolved voxel/semantic source.

Document 12 returns:

- runtime structure instance and deltas.

## 135.4 Document 20 ↔ Document 12

Document 12 supplies:

- physical structure facts.

Document 20 supplies:

- service/functional state.

## 135.5 Set 30 ↔ Document 12

Document 12 supplies:

- physical route/entrance/bridge/gate topology.

Set 30 supplies:

- mover-specific access/path/travel result.

## 135.6 Set 27 ↔ Document 12

Document 12 supplies:

- market/warehouse/customs/toll/route physical state.

Set 27 supplies:

- economic interpretation.

---

# 136. Main-Document Reconciliation Requirements

| Document | Required Follow-On Reconciliation |
|---|---|
| 13 — Peoples/Cultures/Factions | Consume structure ownership/cultural references; no structure can determine ancestry morality or law. |
| 14 — Dimensions | Realm structures/portals consume Document-12 physical state and 24D topology. |
| 15 — Quests/Events | Bind objectives to persistent Structure Instance IDs and evidence. |
| 16 — Combat | Structure damage/siege consumes Block/structure state without duplicating it. |
| 17 — UI/UX | Structure inspection/map/restoration/ownership uses knowledge-aware read models. |
| 18 — Technical | Implement persistent structure records, Blueprint baking, LOD, migrations and multiplayer in Godot/Summer. |
| 19 — Settlement | Consume reconciled Structure Instance layer during player/NPC planning. |
| 20 — Buildings | Reconcile POC milestone wording while preserving universal functions and service contracts. |

---

# 137. Production Acceptance Criteria

Document 12 v1.0 is accepted when:

- [x] structures remain the physical memory of the world;
- [x] 24I is the authored structure/route/wonder authority;
- [x] 24G is the authored dungeon/site authority;
- [x] Document 12 does not duplicate the 228 24I foundations;
- [x] Blueprint Forge owns editable voxel source;
- [x] Document 20 owns settlement building function;
- [x] Document 19 owns settlement planning/player blueprint workflow;
- [x] Document 11 owns generated placement;
- [x] one persistent Structure Instance exists per placed structure;
- [x] damage/occupation/restoration are state, not duplicate definitions;
- [x] Blocks remain canonical Document-03 identities;
- [x] routes are physically persistent;
- [x] Set 30 owns mover-specific route execution;
- [x] Set 27 owns route economics;
- [x] Document 09/14 owns portal behaviour/topology;
- [x] Set 26 owns vessel/maritime specialist execution;
- [x] persistent dungeon state does not reset on reload;
- [x] ruins can be claimed/restored without becoming duplicate structures;
- [x] generated explored structures freeze against silent regeneration;
- [x] player edits persist;
- [x] POC structure arrangement is archive-only;
- [x] Core scope reflects 45 structures + 12 routes + no mandatory wonder;
- [x] Godot/Summer direction is current.

---

# Appendix A — Structure-State Matrix

| Axis | Example Values |
|---|---|
| Construction | Planned, Foundation, Frame, Enclosed, Fitted, Commissioned |
| Condition | Intact, Worn, Damaged, Heavy Damage, Partial Collapse, Collapsed, Destroyed |
| Occupation | Empty, Resident, Faction, Creature, Disputed, Besieged, Evacuated, Abandoned |
| Ownership | Unclaimed, Private, Household, Settlement, Faction, Government, Cultural, Disputed |
| Magical | Normal, Warded, Blessed, Corrupted, Cursed, Sealed, Unstable |
| Restoration | None, Surveyed, Secured, Stabilised, Repairing, Partial, Restored, Converted |

---

# Appendix B — Route Structure Record

```yaml
route_structure_instance:
  structure_instance_ref: structure_instance:<id>
  route_foundation_ref: route:<24I_id>
  segment_refs: []
  connector_refs: []
  condition_band: intact
  width_band: <value>
  surface_tags: []
  clearance_profile_ref: <id>
  owner_ref: <id>
  closure_state: open
  blockage_refs: []
  maintenance_state: <state>
  movement_topology_revision: <rev>
  revision: <rev>
```

Set 30 determines mover-specific traversal.

---

# Appendix C — Structure Damage Aggregate

```yaml
structure_damage_summary:
  structure_instance_ref: <id>
  damage_group_states:
    foundation: intact
    walls: damaged
    roof: heavy_damage
    entrances: intact
  destroyed_block_count: <count>
  critical_group_failures: []
  collapse_state: false
  specialist_service_impact_refs: []
  movement_topology_changed: true
  source_block_revision: <rev>
  structure_revision: <rev>
```

---

# Appendix D — Claim / Occupation Record

```yaml
structure_authority_state:
  structure_instance_ref: <id>
  legal_owner_ref: <id>?
  current_occupier_ref: <id>?
  claimant_refs: []
  dispute_state: none
  permission_profile_ref: <id>
  possession_started_world_time: <time>?
  historical_owner_refs: []
  authority_revision: <rev>
```

Legal meaning remains Document 13/law-owned.

---

# Appendix E — Restoration Record

```yaml
structure_restoration:
  restoration_id: restoration:<ulid>
  structure_instance_ref: <id>
  target_state: restored
  project_ref: <id>?
  required_repairs: []
  required_cleansing_refs: []
  required_resource_refs: []
  required_permission_refs: []
  completed_stage_refs: []
  current_state: surveyed
  blockers: []
  history_event_ref: <id>
  revision: <rev>
```

---

# Appendix F — Structure Content Ownership Matrix

| Content Type | Authored Identity | Runtime Physical Instance | Functional Service |
|---|---|---|---|
| Settlement House | 24I / 20 | Document 12 | Document 20 |
| Road | 24I | Document 12 | Set 30 movement, Set 27 economy |
| Bridge | 24I | Document 12 | Set 30 / 26 |
| Ruin | 24G/24I | Document 12 | Context-dependent |
| Dungeon | 24G | Document 12 site runtime | Specialist systems |
| Shrine | 24I/24G | Document 12 | Document 09/13 |
| Portal Sanctuary | 24I | Document 12 | Document 09/14 |
| Mine | 24G/24I | Document 12 | 06/08/20 |
| Port | 24I/26J | Document 12 | Set 26/20 |
| Wonder | 24I | Document 12 | Declared specialist |

---

# Appendix G — Core 24I Route IDs

```text
route.surface.local_trail
route.surface.farm_lane
route.surface.village_street
route.surface.regional_road
route.surface.pilgrim_way
route.crossing.seasonal_ford
route.crossing.stone_arch_bridge
route.crossing.rope_suspension_bridge
route.crossing.switchback_pass
route.crossing.road_tunnel
route.industrial.minecart_line
route.water.river_barge_lane
```

---

# Appendix H — POC Preservation Matrix

| POC Structure | Treatment |
|---|---|
| Village Centre | Preserve generic civic/settlement-centre capability |
| Shared Warehouse | Preserve storage/logistics capability |
| Homes | Preserve housing capability |
| Farm/Barn | Preserve agriculture/livestock capability |
| Guard Post | Preserve defence staffing capability |
| Watchtower | Preserve as generic Atlas structure; fixed project wrapper archived |
| Blacksmith | Preserve production function through Document 20 |
| Mage Hut/Shrine | Preserve magical service families |
| Market | Preserve commerce function |
| Road Gate/Wall | Preserve infrastructure/defence |
| Old Rune Ruin | Preserve ruin/magic-discovery family |
| Collapsed Watchtower | Preserve restoration/claiming concept |
| Abandoned Mine | Preserve dungeon/industrial site family |
| Crystal Pocket | Preserve generated resource/site context |
| Goblin Camp | Preserve faction-camp capability, but goblins remain persons where defined |
| Portal Hall | Preserve realm-structure capability |
| Fixed Forest Hamlet Layout | Archive |

---

# Appendix I — Definition of Done for Implemented Structure Runtime

The implemented Structure System is not complete because a blueprint can be pasted.

Production proof requires:

- Atlas IDs resolve;
- Blueprint source resolves;
- canonical Blocks materialise correctly;
- generated placement is deterministic;
- placed structure has stable instance ID;
- damage persists;
- doors/gates persist;
- ownership persists;
- occupation persists;
- inventories do not duplicate;
- repair consumes resources;
- restoration changes the same instance;
- route damage invalidates Set-30 movement;
- economic route reacts only after movement/physical truth changes;
- settlement function comes from Document 20;
- portals remain physically placed and specialist-owned;
- dungeon puzzle/loot state survives reload;
- player edits survive source updates;
- explored structures do not silently regenerate;
- megadungeons stream without losing site identity;
- maritime structures integrate with Set 26;
- LOD preserves authoritative state;
- multiplayer prevents conflicting claims/edits;
- low-end settings reduce presentation rather than world truth;
- POC structures remain available only as archive/test fixtures.

---

# Completion Statement

**Document 12 v1.0 reconciles Leyforge's original structure vision with the World Content Atlas, Blueprint Forge, settlement-building suite and post-Atlas ownership architecture.**

Structures remain the physical memory of the world.

But they now have a much cleaner identity stack:

**24I / 24G define what the structure or site is and why it belongs in the world.**  
**Blueprint Forge defines the editable voxel and semantic source.**  
**Document 11 chooses a valid generated location.**  
**Documents 19/20 own settlement planning, construction projects and civilisation function.**  
**Document 12 owns the persistent placed structure instance and its physical historical state.**  
**Specialist systems own what happens through that structure.**

A damaged bridge is still the same bridge.

A captured fort is still the same fort.

A restored ruin is still the same ruin.

A player-renovated ancient tower retains its history.

A dungeon does not reset merely because the player walked away.

And a structure that once appeared in the POC is not deleted merely because the POC is retired; only the fixed scenario wrapper is archived.

**Next foundation reconciliation dependency: Document 13 — Peoples, Cultures, Factions, Governments and Civilisation Identity v1.0.**
