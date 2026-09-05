# Leyforge Map System Authority

## MAP-00 — In-World Cartography, Surveying & Magical Relief Map System

**Document ID:** MAP-00  
**Title:** Leyforge In-World Cartography, Surveying & Magical Relief Map System  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **PROPOSED SINGLE-DOCUMENT MAP-SYSTEM OVERRIDE BASELINE — OWNER LOCK PENDING**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Authority type:** Single-document cross-system gameplay authority  
**Art presentation authority:** ART-08 — UI, Icons, Cartography, Codex & 2D Presentation Standard  
**Art certification authority:** ART-10 — Golden References, Visual/Audio QA & Production Certification  
**Knowledge authority consumed:** 28C — Knowledge, Rumours, Truth, Lies, Languages & Information Spread  
**Route authority consumed:** 30H — Roads, Routes, Terrain Accessibility, Navigation & Long-Distance Travel  
**World/structure truth consumed:** Documents 11 and 12  
**Magic authority consumed:** Document 09 and applicable realm/FCC authorities  
**Maritime authority consumed:** Set 26  
**Identity/registry authority consumed:** FCC-13 / canonical registry authorities  

---

# 00. Executive System Statement

Leyforge maps are **physical, in-world cartographic objects and devices**, not an omnipresent menu screen.

The default player experience should feel closer to a Minecraft-style map than to a modern open-world pause-menu atlas:

- the player must possess a map or cartographic device;
- maps cover bounded regions/scales rather than the entire world automatically;
- ordinary maps are viewed as held physical objects;
- mapped knowledge is earned through exploration, surveying, copied information and other legitimate sources;
- maps can be copied, traded, lost, stolen, outdated, damaged, annotated, displayed and upgraded;
- better cartography improves precision and presentation rather than granting unrestricted runtime truth;
- the highest magical tier may render the map's legitimate knowledge as an interactive miniature relief/volumetric projection;
- the player is **not given a permanent Map/Atlas entry in the main game menu**.

The core design promise is:

> **The map belongs to the world. You use a map because your character has one. Better maps become better tools, not better cheat screens.**

---

# 01. Purpose of MAP-00

MAP-00 exists to replace fragmented or legacy player-facing map assumptions with one explicit system authority.

It owns:

- physical map behaviour;
- map acquisition/use semantics;
- field-map exploration recording;
- bounded map regions and scales;
- map copying/sharing;
- player annotations and mapped markers;
- surveying and cartographic refinement;
- map upgrade progression;
- ordinary 2D map interaction;
- surveyed/civilisational cartography interaction;
- magical relief/volumetric 3D map interaction;
- map item/device persistence;
- map loss, staleness and provenance;
- route-display integration;
- in-world cartography workstations/displays;
- multiplayer map-object behaviour at the gameplay-contract level;
- accessibility requirements for physical/3D map use;
- the player-facing boundary between map knowledge and authoritative world truth.

It does **not** redefine the underlying world, route, knowledge, magic, item-registry, maritime, networking or rendering engines that supply its inputs.

---

# 02. Supersession and Conflict Rule

When MAP-00 is locked, it supersedes conflicting player-facing map rules in earlier documents.

In particular, it supersedes any earlier assumption that the player always has access to:

- a universal **Map / Atlas** menu screen;
- a universal **Realm Atlas** menu screen;
- a permanent pause/menu map independent of owned items/devices;
- an always-available full-world navigation map;
- map interaction that exists only because a UI route is available.

This includes the player-facing intent of Document 17 sections concerning Map Architecture, Unknown Map Data, Map Confidence, Navigation Markers and Map Performance **where those sections imply or are implemented as a universal map screen**.

The useful rules inside those sections remain valid where compatible with MAP-00, especially:

- maps remain filtered by knowledge;
- unknown data may remain blank, approximate, rumoured or outdated;
- routes/claims/hazards may expose confidence and age;
- moving targets are not shown exactly unless legitimately known;
- map rendering must be scalable and bounded.

MAP-00 changes the **interaction model and ownership boundary**, not those knowledge-safety principles.

---

# 03. No Universal Menu Map

Ley Realms does not provide a normal global Map/Atlas button as a permanent core menu destination.

The player may still have:

- Inventory;
- Journal;
- Codex;
- settlement/project interfaces;
- other legitimate menus defined elsewhere.

But **world cartography is accessed through physical maps or cartographic devices**.

A dedicated map key/button may exist only as a shortcut to **raise/equip the player's last usable map**.

If no usable map is owned, that input should not conjure a map UI from nowhere.

Recommended behaviour:

> `Map input` → raise last-used map item if available → otherwise provide a small contextual message such as "You do not have a map available."

---

# 04. No Default Minimap

The default Ley Realms HUD does not require an always-on minimap.

Navigation support may instead use:

- compass/directional aids;
- landmark recognition;
- quest direction where legitimately known;
- accessibility navigation assistance;
- held maps;
- physical signs/roads;
- player memory and observation.

A future accessibility feature may provide stronger directional assistance without turning the HUD into an omniscient terrain radar.

---

# 05. Physical Map Principle

A map is an actual persistent object or device.

A map can therefore have:

- stable instance identity;
- map type;
- geographic/realm coverage;
- scale;
- orientation/projection;
- captured knowledge;
- precision;
- confidence;
- source provenance;
- age/last update;
- annotations;
- upgrades;
- condition/damage state where applicable;
- ownership/location;
- copy lineage.

This allows maps to participate naturally in:

- inventory;
- trade;
- loot;
- libraries/archives;
- exploration;
- settlement services;
- multiplayer sharing;
- theft;
- archaeology;
- quests;
- magical research;
- cartography professions.

---

# 06. Map Data Is Not Omniscient World Data

The map never reads unrestricted runtime truth merely because the engine knows it.

MAP-00 consumes authorised knowledge/evidence supplied by owning systems.

Therefore a map may legitimately contain:

- exact known terrain;
- approximate terrain;
- surveyed roads;
- rumoured locations;
- stale political information;
- old harbour depths;
- a copied landmark;
- a player's handwritten note;
- magically detected evidence;
- incorrect or forged information.

A map may also omit something that physically exists.

---

# 07. Map Knowledge Layers

A cartographic record can contain multiple information layers.

Possible layers include:

- terrain;
- elevation/relief;
- coastline/hydrology;
- settlements;
- roads/trails;
- structures/landmarks;
- entrances;
- known cave/underground geometry;
- ecology;
- political claims;
- trade/infrastructure;
- quest-relevant information;
- maritime channels/depths;
- realm connections;
- personal annotations;
- survey observations;
- magical/ley observations.

Not every map type supports every layer.

---

# 08. Cartographic Information Record

Conceptually, each map stores bounded cartographic evidence rather than a screenshot of the world.

A record should be able to reference fields such as:

```text
map_instance_id
map_definition_id
coverage_id / region anchor
projection_type
scale_band
orientation
knowledge_entries[]
geometry_records[]
annotation_records[]
source_provenance[]
confidence
precision
last_verified_time
copy_parent_id?
upgrade_state
condition_state
```

Exact implementation schema belongs to engineering/save authorities.

---

# 09. Bounded Coverage

Ordinary physical maps cover bounded world areas.

A map does not infinitely expand merely because the player keeps walking.

When the player leaves its coverage:

- the existing map remains valid for its region;
- the player may create/acquire another map;
- a higher-scale map may cover a larger area at lower detail;
- multiple maps may later be organised into physical collections or cartographic devices.

This keeps maps spatially meaningful and supports exploration collections, wall displays and trade.

---

# 10. Map Scale Bands

MAP-00 permits multiple bounded scale bands, for example:

- local;
- regional;
- continental/provincial;
- maritime chart;
- realm-network chart.

Exact numeric coverage is a balancing/implementation parameter and is not locked here.

Higher area coverage normally means lower fine-detail precision unless better surveying/cartographic techniques compensate.

---

# 11. Map Creation Anchoring

When an ordinary map becomes geographically initialised, it receives a stable region/coverage anchor.

Maps should not continuously recenter around the player after creation.

Stable anchoring allows:

- neighbouring map collections;
- reproducible copies;
- wall mosaics;
- shared settlement map rooms;
- server consistency;
- deterministic caching.

---

# 12. Field Map — Tier I

The **Field Map** is the baseline exploration map.

It is:

- physical;
- bounded;
- primarily 2D;
- deliberately imperfect;
- readable while travelling;
- based on what has actually been mapped/learned.

It is not a satellite view.

Its presentation is governed by ART-08.

---

# 13. Minecraft-Style Exploration Recording

The baseline inspiration is Minecraft-style physical mapping:

- the player carries/uses a map for a specific region;
- explored portions become represented on that map;
- unexplored portions remain unknown;
- the map is a possession rather than a permanent menu entitlement.

Leyforge extends this model with richer knowledge, surveying, confidence, history, magic, civilisation and realm systems.

---

# 14. When a Field Map Updates

Recommended baseline:

A Field Map records direct exploration while it is **actively carried for mapping**, such as:

- held in a hand;
- raised/inspected;
- equipped in an authorised map-access slot if such a slot is later implemented.

A map sitting forgotten in storage does not remotely reveal the player's travels.

The precise convenience rule for whether a map must be visibly raised versus merely equipped can be tuned during implementation, but remote passive omniscient updating is not allowed.

---

# 15. Player Position on a Map

A map may show the holder's current location/direction when that information is legitimately available to the character/device.

The baseline Field Map may provide a simple player indicator within its coverage.

Precision can degrade when:

- navigation is impaired;
- the map is approximate;
- the realm disrupts orientation;
- magical/physical conditions interfere;
- the character lacks adequate positioning capability.

MAP-00 does not require modern GPS precision everywhere.

---

# 16. Unknown Space

Unknown map regions remain visibly unknown.

Valid presentations include:

- blank parchment;
- rough sketch;
- uncertain boundary;
- rumour haze;
- incomplete route;
- confidence annotation;
- outdated notation.

ART-08 owns the visual grammar.

---

# 17. Landmarks and Discovery

A landmark may appear on a map when the player/map legitimately learns it through sources such as:

- direct observation;
- physical exploration;
- surveying;
- copied map information;
- dialogue/report;
- signage;
- quest evidence;
- settlement records;
- magical evidence;
- maritime charts;
- cultural/archival knowledge.

The engine merely knowing a landmark exists is insufficient.

---

# 18. Player Annotations

The player may add bounded annotations to owned maps.

Examples:

- custom symbol;
- short label;
- note;
- route mark;
- danger warning;
- resource observation;
- "return here" marker.

Annotations belong to the map object unless explicitly copied/shared.

There is no need for a universal menu pin system.

---

# 19. In-World Annotation Interaction

Annotations should be created through the map itself or an in-world cartography device.

Possible interactions:

- point/select a location on the held map;
- write/choose a symbol while inspecting the map;
- use a cartography table for more precise editing;
- mark a landmark while physically present and holding the map;
- copy a marked map.

The interaction may temporarily focus the camera/UI on the physical map, but it is not a global pause-menu atlas.

---

# 20. Map Copying

Maps may be copied.

A copy is normally a snapshot of the source map's authorised knowledge at copy time.

The copy should preserve relevant:

- coverage;
- scale;
- mapped geometry;
- annotations if included by the copy operation;
- confidence/provenance where appropriate;
- source/copy lineage.

Copies do not automatically remain live-synchronised unless a separate magical/technical system explicitly supports it.

---

# 21. Map Trading and Sharing

Because maps are objects, they can naturally support:

- gifts;
- trade;
- NPC cartographers;
- settlement archives;
- military maps;
- explorer maps;
- treasure maps;
- maritime charts;
- scholarly maps;
- faction maps;
- stolen maps;
- forged maps.

Possessing a map can teach the character mapped propositions according to 28C, but the physical map remains a distinct source object.

---

# 22. Map Loss

If the player loses a physical map, they lose access to that physical record until it is recovered or replaced.

This does not require the character to become amnesiac.

Personal knowledge may remain, but a newly created replacement map should only reconstruct information to the precision the character can legitimately reproduce or re-source.

Detailed survey geometry, copied notes or exact old measurements may be lost with the object if they were not otherwise retained.

---

# 23. Map Damage and Condition

Where item-condition systems permit it, maps may support states such as:

- pristine;
- worn;
- stained;
- torn;
- water-damaged;
- partially illegible;
- magically corrupted.

Condition should affect readability/content only where that gameplay is deliberately implemented and accessible.

The feature is optional; MAP-00 does not require tedious paper durability.

---

# 24. Old and Outdated Maps

Maps can become stale.

A map may truthfully represent what was known at an earlier time while no longer matching current conditions.

Examples:

- collapsed bridge;
- destroyed settlement;
- altered road;
- changed coastline/river condition;
- faction border change;
- new structure;
- ruined port;
- sealed cave entrance.

The map should preserve update age/provenance where relevant rather than silently rewriting history.

---

# 25. False and Forged Maps

A map may contain false information.

MAP-00 permits:

- incorrect copied maps;
- propaganda maps;
- forged treasure maps;
- misleading border claims;
- bad old surveys;
- false rumours drawn as uncertain information.

28C and deception/social authorities determine belief/provenance semantics.

---

# 26. Surveying — Tier II Foundation

Surveying is the bridge between rough exploration mapping and reliable civilisational cartography.

Surveying can improve:

- coordinate/relative-position precision;
- route geometry;
- elevation/relief;
- distance estimation;
- coastline/river shape;
- structure footprints;
- infrastructure condition;
- maritime data;
- selected underground geometry;
- confidence/verification age.

Exact skills, tools, jobs and progression gates are consumed from owning systems.

---

# 27. Surveyed / Civilisational Map — Tier II

A **Surveyed Map** is not merely a prettier Field Map.

It represents deliberately improved cartographic evidence.

It may support:

- cleaner geometry;
- measured distance;
- elevation contours/relief conventions;
- named routes;
- infrastructure;
- districts;
- political/trade/ecological overlays when known;
- structured annotation;
- route planning;
- confidence/verification records.

Presentation remains physical/in-world.

---

# 28. Cartography Workstation Role

Leyforge should support an in-world cartography workstation role for advanced map work.

Its exact canonical item/block identity belongs to registry/content authority.

Its system functions may include:

- map creation/initialisation;
- copying;
- scale conversion where allowed;
- annotation editing;
- survey integration;
- combining authorised map sources;
- comparing old/new surveys;
- route planning overlays;
- magical-map upgrade work where appropriate;
- larger shared map projection/display.

The workstation is an **in-world object**, not a disguised permanent menu button.

---

# 29. Map Walls and Displays

Maps may be displayable in the world.

Examples:

- framed map;
- wall mosaic;
- settlement planning board;
- ship chart table;
- guild exploration wall;
- military planning room;
- magical projection table.

Displayed maps show the state of the physical map/data source they reference.

---

# 30. Settlement Cartography

Settlements may maintain cartographic knowledge as infrastructure/service capability.

This can support:

- local road maps;
- land surveys;
- district plans;
- trade maps;
- public route maps;
- regional atlases as physical records/collections;
- archive maps;
- civic planning projections.

Settlement capability affects access to map services; it does not automatically reveal unknown world truth.

---

# 31. Route Planning Integration

30H remains authoritative for route generation, route accessibility, ETA, confidence and blockers.

MAP-00 owns how player-facing route plans appear on physical cartographic tools.

A map may show:

- selected destination;
- suggested route;
- alternative route;
- route confidence;
- uncertain leg;
- danger/blocker;
- transfer point;
- planned stop;
- travel mode.

The map does not invent routes that 30H has not authorised.

---

# 32. No Separate Universal Route-Map Screen Requirement

Player navigation route planning should preferably occur through:

- held maps;
- cartography workstations;
- ship chart tables;
- other legitimate in-world navigation devices.

This removes the need for a universal route-planner map screen for ordinary player travel.

Special settlement/automation/logistics management UIs may still show route abstractions where their owning system requires them.

---

# 33. Physical Route Marking

A player may mark a planned route onto a map.

This can be:

- manual;
- suggested by route logic;
- copied from another source;
- generated by a navigator/cartographer;
- provided by a quest/faction.

A marked route is information, not forced autopilot.

---

# 34. Autotravel Boundary

MAP-00 does not create instant fast travel.

If 30H or another authority permits autotravel, a physical map may act as a planning/input device for that system.

The map itself does not teleport the player.

Magical teleportation remains owned by applicable magic/realm systems.

---

# 35. Underground Cartography

Underground space is not automatically rendered merely because terrain voxels exist.

Caves/tunnels may be mapped through:

- direct exploration;
- surveying;
- known mine plans;
- structure records;
- magical sensing/evidence;
- copied maps.

Ordinary Field Maps may represent cave entrances without possessing a complete 3D cave model.

Higher cartography tiers can represent known underground networks more accurately.

---

# 36. Verticality

Ordinary maps may simplify vertical information.

Surveyed maps may represent elevation through:

- contours;
- shading;
- symbols;
- section diagrams;
- layer notation.

Magical relief cartography may present legitimate vertical geometry volumetrically.

---

# 37. Maritime Cartography

Set 26 remains authoritative for maritime world/system truth.

MAP-00 may represent legitimately known:

- coastline;
- ports;
- channels;
- reefs;
- hazards;
- depth bands;
- currents;
- navigation routes;
- weather/sea-state information;
- anchorages;
- surveyed bathymetry.

A ship's chart should remain a physical navigation object/device.

---

# 38. Realm Cartography

Not every realm can be represented as ordinary planar geography.

Realm maps may use appropriate physical/diegetic forms such as:

- local geographic sheets;
- symbolic route charts;
- portal-network maps;
- relation diagrams;
- layered magical atlases;
- relief projections.

ART-08 governs their presentation.

Realm/FCC authorities govern the actual realm relationships and traversable truth.

---

# 39. Magical Cartography — Tier III Foundation

The highest map tier is **Magical Relief / Volumetric Cartography**.

This is an upgrade of cartographic representation and, where specifically authorised, evidence acquisition.

It is not a developer/debug map.

---

# 40. Magical Relief Map — Core Experience

A magical relief map may project a miniature stylised reconstruction of the map's known space above or from the physical map/device.

The player can potentially:

- tilt/rotate the relief;
- inspect elevation;
- inspect known structures;
- examine known routes;
- inspect known underground layers;
- compare overlays;
- view portal/ley relationships when legitimately known;
- plan travel;
- place annotations.

The projection remains tied to a physical object, table, focus, artefact or equivalent diegetic source.

---

# 41. No Magical X-Ray Omniscience

Upgrading a map to magical relief **does not automatically reveal additional hidden world data**.

By default:

> 2D known data → improved 3D/relief presentation of the same authorised knowledge.

Additional information requires a legitimate source such as:

- divination;
- surveying;
- remote observation;
- ley sensing;
- spirit testimony;
- magical beacon/network;
- research;
- copied magical cartography.

Those systems produce evidence that enters the knowledge model.

---

# 42. Magical Sensing and Evidence

Document 09 and related magic authorities determine what magical sensing can actually detect.

MAP-00 only consumes authorised results.

A magical map therefore may show:

- a detected leyline;
- an approximate magical disturbance;
- a confirmed portal connection;
- a divined ruin region;
- uncertain subterranean anomaly;

without knowing more than the underlying evidence supports.

---

# 43. Magical Map Presentation Modes

A magical cartographic device may support multiple views of the same information:

- flat parchment/2D;
- shaded relief;
- volumetric miniature;
- vertical slice;
- underground layer;
- route/network mode;
- realm-link mode;
- maritime relief/depth mode;
- knowledge-confidence overlay.

Not all map definitions need all modes.

---

# 44. Held Magical Map

A portable magical map should remain usable as an in-world object.

A practical model is:

- raise/hold map;
- activate magical projection;
- relief appears above/in front of the held map;
- player manipulates view through bounded controls;
- closing/lowering returns immediately to normal play.

The world does not need to disappear behind a full-screen menu.

---

# 45. Cartography Table Projection

A cartography workstation or magical map table may provide a larger projection for detailed planning.

The interaction may focus the camera and controls on the table/projected map, but should remain diegetically anchored to the world object.

This is the preferred high-detail planning context for:

- route comparison;
- settlement planning;
- map copying;
- map combining;
- survey analysis;
- collaborative multiplayer planning.

---

# 46. Wall / Room-Scale Magical Cartography

High-tier civilisation may support map rooms or projection installations.

These are extensions of the physical-map principle, not replacements with global menu access.

Potential uses include:

- capital planning;
- military command;
- maritime navigation;
- research;
- realm-route analysis;
- magical network management.

Owning gameplay systems determine what actions are actually permitted.

---

# 47. Map Progression Principle

Cartography progression should feel like growing capability:

```text
No map
→ rough/blank map materials
→ Field Map
→ copied/traded maps and annotations
→ surveying capability
→ Surveyed/Civilisational Map
→ advanced cartography tools/services
→ magical enhancement
→ Magical Relief / Volumetric Map
→ specialised high-tier overlays/evidence sources
```

Exact recipes, unlock costs and skill gates belong to progression/crafting/content authorities.

---

# 48. Map Skill and Profession Integration

Player/NPC capability may influence:

- map creation;
- survey precision;
- copying accuracy;
- old-map interpretation;
- route estimation;
- annotation quality;
- forgery detection;
- magical-cartography operation.

MAP-00 defines the interaction requirement; progression/skill systems define exact unlocks and numbers.

---

# 49. Map Item Families

MAP-00 requires system roles for cartographic content but does not assign stable registry IDs itself.

Potential roles include:

- blank mapping medium;
- Field Map;
- Surveyed Map;
- maritime chart;
- realm chart;
- magical relief map/device;
- map copy;
- map display/frame;
- cartography workstation/tool.

FCC-13 / canonical registry processes assign final identities.

---

# 50. Player Input Contract

The exact control mapping is configurable, but the default behaviour should support:

- quick-raise last map;
- lower map;
- inspect/zoom physical map;
- select annotation;
- interact with cartography table;
- rotate/tilt magical relief;
- switch authorised map layers/modes;
- controller-equivalent operation.

No essential map function may require a mouse-only interaction.

---

# 51. Movement While Using a Field Map

A basic Field Map should support lightweight travel use.

Recommended behaviour:

- player may walk while glancing at the map;
- map partially occupies the view like a physical held object;
- player can lower it instantly;
- detailed annotation/editing requires a more focused interaction.

This preserves the feeling of navigating with an actual map.

---

# 52. Combat Safety

Using a map does not make the player invulnerable.

Map inspection should be interruptible where appropriate.

The game may automatically lower or deprioritise the map during urgent combat actions depending on input scheme and accessibility settings.

---

# 53. Knowledge Confidence

Maps can represent confidence and age without forcing numerical percentages.

Player-facing cues may include:

- exact/surveyed;
- high confidence;
- approximate;
- rumoured;
- outdated;
- disputed;
- unknown.

ART-08 owns presentation.

28C owns semantic knowledge/provenance.

---

# 54. Map Provenance

A map should be able to tell where important information came from when gameplay needs it.

Examples:

- "surveyed by settlement cartographer";
- "copied from old imperial chart";
- "rumour from caravan";
- "player observation";
- "divination result";
- "maritime sounding".

Provenance enables trust, outdated information and forgery gameplay.

---

# 55. Multiplayer Principle

In multiplayer, physical maps naturally define information possession.

A player can:

- show a map;
- hand it over;
- copy it;
- place it on a table;
- annotate a shared map where permitted.

A server should not expose map information to a client merely because the server knows the world.

Detailed authority, replication and anti-cheat contracts belong to multiplayer/engineering authorities.

---

# 56. Multiplayer Map Sharing

The baseline sharing model is **object/source based**, not automatic universal party omniscience.

Optional systems may allow:

- explicit party sharing;
- settlement map networks;
- magical linked maps;
- cartography-table collaboration.

Any live synchronisation must be explicitly authorised and implemented.

---

# 57. Save and Persistence

Map objects and meaningful cartographic state persist with their owning world.

Persistence should cover relevant:

- map identities;
- coverage;
- map knowledge;
- annotations;
- copied lineage/provenance;
- upgrades;
- age/verification;
- display placement;
- magical mode state where needed.

Exact save schemas belong to engineering/save governance.

---

# 58. Performance Principle

Maps must not require a second full-resolution copy of the entire live world.

Recommended architecture uses bounded/cached representations derived from authorised knowledge, such as:

- map tiles;
- simplified heightfields;
- low-detail geometry;
- cached landmark vectors;
- knowledge-layer records;
- route vectors;
- volumetric LOD;
- local projection budgets.

Document 18/FORGE-ENG/ENG-GOV own implementation and benchmarks.

---

# 59. Volumetric Map Performance

The magical 3D map must remain bounded.

Possible limits include:

- capped geographic coverage per projection;
- simplified geometry;
- aggressive distant LOD;
- selective layers;
- cached relief meshes;
- reduced particle/emissive effects;
- update throttling;
- static snapshots for old maps.

Low-end mode may simplify presentation without changing map knowledge.

---

# 60. Accessibility — Flat Alternative

Every essential function of magical relief/3D cartography must have an accessible flat representation.

A player must not need to understand or manipulate a 3D miniature to access critical information.

Equivalent options may include:

- 2D map view on the same physical device;
- layer list;
- route list;
- textual landmark list;
- simplified elevation symbols;
- focus cycling.

---

# 61. Accessibility — Motion and Flash

Magical map projection must honour:

- reduced motion;
- reduced flashes;
- reduced particles;
- high contrast;
- readable labels;
- UI/text scaling;
- controller navigation.

The map's usefulness cannot depend on bloom, colour alone or constant animation.

---

# 62. Accessibility — Motor/Input

Map interactions must provide non-drag alternatives for:

- rotating relief;
- zooming;
- changing layers;
- selecting markers;
- placing annotations;
- choosing routes.

---

# 63. Art Authority Boundary

ART-08 owns:

- parchment/map visual language;
- symbols;
- confidence styling;
- relief/volumetric appearance;
- projection aesthetics;
- map iconography;
- 2D fallback presentation.

MAP-00 owns **what the player-facing map system does and how it is accessed**.

ART-10 certifies presentation quality.

---

# 64. World Truth Boundary

Document 11 owns world-generation/physical geography truth.

MAP-00 never changes terrain because a map says something different.

A stale/false map may disagree with the world.

---

# 65. Structure/Landmark Boundary

Document 12 owns authoritative structure/landmark geometry and persistent structure state.

MAP-00 consumes only map-authorised representations such as:

- point;
- area;
- route;
- entrance;
- floor;
- zone;

when legitimately known.

---

# 66. Knowledge Boundary

28C remains authoritative for:

- what the character learned;
- precision;
- confidence;
- source/provenance;
- rumours;
- lies;
- stale information;
- language/comprehension effects;
- shared knowledge.

MAP-00 stores/renders authorised cartographic records derived from that state.

---

# 67. Route Boundary

30H remains authoritative for:

- route graph/traversability;
- route planning;
- route alternatives;
- ETA;
- route confidence;
- blockers;
- known/unknown route eligibility.

MAP-00 provides the physical cartographic interaction/presentation surface.

---

# 68. Magic Boundary

Document 09 and realm/FCC authorities remain authoritative for:

- magical sensing;
- divination;
- ley behaviour;
- portal behaviour;
- supernatural evidence acquisition;
- ritual costs;
- magical capability.

MAP-00 does not invent magical truth to make a prettier map.

---

# 69. Registry Boundary

MAP-00 may require content roles but does not create ad-hoc stable gameplay IDs.

Canonical item/block/device identities must be added through FCC-13 / registry governance when production content is registered.

---

# 70. Engineering Boundary

Engineering authorities own:

- map-data schema implementation;
- cache formats;
- terrain-to-map sampling;
- renderer;
- volumetric mesh generation;
- networking;
- persistence;
- performance budgets;
- CI/tests;
- migration from legacy POC map saves.

MAP-00 defines required behaviour and invariants.

---

# 71. Legacy POC Migration

The POC currently contains a menu-accessed local Map and persisted map discoveries/pins.

Fresh rebuild behaviour should instead map those concepts into the physical cartography system.

Migration strategy may convert old state into:

- one or more physical Field Map records;
- map annotations;
- personal learned knowledge;
- legacy discovery provenance.

The fresh rebuild does not need to retain the old Map menu route.

---

# 72. Existing UI Document Compatibility

Document 17 remains authoritative for general UI/UX/accessibility except where MAP-00 explicitly supersedes player-facing map access.

Future document audits should treat references to:

- Map / Atlas core screen;
- Realm Atlas core screen;
- universal map UI;

as **superseded by MAP-00** unless the reference is clearly to an in-world map/device interaction or developer tool.

No mass rewrite is required immediately.

---

# 73. XAUTH-ART-0001 Disposition

The earlier XAUTH-ART-0001 amendment map identified that advanced cartography crossed multiple authorities.

MAP-00 replaces the need for a broad design amendment campaign by becoming the **single player-facing map-system authority**.

Upon MAP-00 lock:

- XAUTH-ART-0001 may be marked **SUPERSEDED BY MAP-00 FOR GAMEPLAY DESIGN**;
- ART-08 remains the art/presentation authority;
- ART-10's "mechanics integration pending" condition can be considered design-resolved once MAP-00 is accepted;
- engineering implementation remains future work;
- old documents can receive reference/deprecation notes during the normal global V1 audit rather than being individually rewritten now.

---

# 74. Codex / Agent Rule

When implementing map/cartography features, Codex must consult MAP-00 before legacy Map/Atlas rules.

Codex must not independently reintroduce:

- a universal menu map;
- omniscient world rendering;
- automatic full-world discovery;
- unearned resource/enemy x-ray;
- live shared multiplayer map knowledge without an owning mechanic;
- magical-map sensing abilities not authorised by magic canon.

---

# 75. Core Player Experience Examples

## 75.1 Early Exploration

The player crafts/acquires a Field Map and raises it while exploring. The map gradually records the area within its bounded region. A village appears after being discovered or learned. Unexplored areas remain blank.

## 75.2 Buying a Better Map

A traveller purchases a regional map from a cartographer. It contains roads and two settlements but is six months old. A bridge marked on it has since collapsed.

## 75.3 Surveying

The player/settlement surveys a valley. The existing map gains more accurate route geometry and elevation information.

## 75.4 Treasure Map

An old map marks an approximate ruin location. The map's precision is intentionally low and its provenance uncertain.

## 75.5 Magical Upgrade

The same surveyed regional map is magically enhanced. When raised, it projects a miniature terrain relief showing the **already known** valley, settlement, roads and discovered cave network in 3D.

## 75.6 Magical Evidence

A legitimate divination detects an unstable ley disturbance somewhere beneath a mountain. The relief map gains an uncertain magical anomaly region—not an exact hidden-room x-ray.

## 75.7 Multiplayer Planning

Several players place a regional map on a cartography table. They inspect it together, add route notes and make physical copies. Other players who never received a copy do not automatically gain the same detailed map.

---

# 76. Required Test Families

Implementation must eventually test at minimum:

1. map creation and stable coverage;
2. held-map exploration update;
3. leaving map coverage;
4. unknown-space preservation;
5. discovered landmark reveal;
6. manual annotation;
7. map copy snapshot behaviour;
8. stale-map behaviour;
9. false/forged map compatibility;
10. map loss/replacement behaviour;
11. surveyed-map precision improvement;
12. route-plan rendering from 30H;
13. no unknown-route leakage;
14. underground mapping boundaries;
15. maritime chart behaviour;
16. realm-chart behaviour;
17. magical relief rendering of known data;
18. no 3D-map omniscience;
19. magical-evidence ingestion;
20. cartography-table interaction;
21. 2D accessibility equivalence;
22. reduced-motion projection;
23. low-end map LOD;
24. multiplayer copy/share authority;
25. save/reload of map instances;
26. legacy-map migration;
27. absence of a universal Map/Atlas menu route.

---

# 77. Acceptance Gate

MAP-00 implementation is not accepted until all of the following are true:

- a player without a map cannot summon an omniscient map screen;
- ordinary mapping works as a physical bounded object;
- exploration/knowledge filtering works;
- map copies and annotations persist;
- route information obeys 30H knowledge restrictions;
- magical relief is a presentation upgrade unless additional evidence is legitimately supplied;
- 3D cartography has equivalent accessible 2D interaction;
- multiplayer does not leak server/world truth;
- low-end settings retain functional cartography;
- ART-08 presentation and ART-10 certification requirements are met;
- no legacy Map/Atlas menu assumption silently overrides MAP-00.

---

# 78. Lock-Candidate Decisions

**MAP00-D01** — Leyforge maps are physical/in-world cartographic objects or devices, not a universal permanent menu screen.  
**MAP00-D02** — The normal player menu does not contain a permanent Map / Atlas core screen.  
**MAP00-D03** — A map input may quick-raise the last usable owned map but cannot conjure map access without a map.  
**MAP00-D04** — No always-on minimap is required by default.  
**MAP00-D05** — Field Maps use bounded stable coverage and Minecraft-style exploration recording as their baseline interaction model.  
**MAP00-D06** — A stored map does not remotely/omnisciently update from player travel.  
**MAP00-D07** — Unknown world space remains unknown on maps until legitimate knowledge exists.  
**MAP00-D08** — Maps can be copied, traded, lost, stolen, outdated, forged, annotated and displayed as world objects.  
**MAP00-D09** — Map copies are snapshots unless an explicit live-link mechanic exists.  
**MAP00-D10** — Player annotations belong to physical map records rather than a universal menu-pin system.  
**MAP00-D11** — Surveying upgrades cartographic precision and evidence rather than merely changing visuals.  
**MAP00-D12** — Surveyed/Civilisational Cartography is Tier II.  
**MAP00-D13** — Magical Relief/Volumetric Cartography is Tier III.  
**MAP00-D14** — Magical 3D cartography is anchored to a held map, table, device, artefact or other in-world source.  
**MAP00-D15** — Upgrading to 3D relief does not by itself reveal hidden runtime truth.  
**MAP00-D16** — Additional magical map information requires evidence authorised by magic/knowledge systems.  
**MAP00-D17** — 3D cartography supports an equivalent 2D/accessibility mode.  
**MAP00-D18** — 30H continues to own route planning truth; MAP-00 owns its physical map interaction/presentation.  
**MAP00-D19** — 28C continues to own knowledge, confidence, precision and provenance truth.  
**MAP00-D20** — Documents 11/12 continue to own physical world/structure truth.  
**MAP00-D21** — Document 09/FCC authorities continue to own magical sensing and realm truth.  
**MAP00-D22** — Set 26 continues to own maritime truth while MAP-00 presents physical charts.  
**MAP00-D23** — ART-08 owns cartographic art/presentation; MAP-00 owns player-facing map mechanics.  
**MAP00-D24** — Stable map/item/device identities are assigned through canonical registry authority, not ad hoc by MAP-00.  
**MAP00-D25** — Player-facing ordinary route planning should use owned map/device interactions rather than require a universal route-map screen.  
**MAP00-D26** — Map walls, chart tables and civilisation-scale cartography remain in-world representations.  
**MAP00-D27** — Multiplayer map sharing is source/object based by default rather than automatic party omniscience.  
**MAP00-D28** — Map data/rendering must be bounded, cached/LOD-capable and scalable for low-end systems.  
**MAP00-D29** — Legacy POC Map-screen data may be migrated into physical map/knowledge records; the old menu route need not survive the rebuild.  
**MAP00-D30** — MAP-00 supersedes conflicting legacy player-facing map/menu rules once locked.  
**MAP00-D31** — XAUTH-ART-0001 is superseded by MAP-00 for gameplay-design integration once MAP-00 is locked.  
**MAP00-D32** — Old documents can receive reference/deprecation notes during the normal V1 audit rather than requiring a mass amendment campaign now.

---

# 79. Closure Statement

MAP-00 converts Leyforge cartography from an always-available UI feature into a genuine world system.

The resulting progression is intentionally tangible:

> **You begin without perfect knowledge. You make or find maps. You carry them. You fill them through exploration. You trade and annotate them. Civilisation learns to survey the world more precisely. Magic eventually lets those same hard-earned maps rise into living miniature reliefs of what you truly know.**

This preserves the simplicity and charm of Minecraft-style physical maps while allowing Leyforge's civilisation, knowledge, magic, maritime, realm and 3D-cartography systems to grow far beyond them.
