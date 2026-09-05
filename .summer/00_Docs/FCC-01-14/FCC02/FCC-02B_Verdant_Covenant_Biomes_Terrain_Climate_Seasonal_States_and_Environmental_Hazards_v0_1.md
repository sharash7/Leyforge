# Leyforge Final Content Canon Collection

## FCC-02B - Verdant Covenant Biomes, Terrain, Climate, Seasonal States & Environmental Hazards

**Version:** 0.1  
**Status:** Content Canon - Realm Local Lock  
**Realm:** Verdant Covenant  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-02A - Realm Identity, Laws, Progression & Canon Boundaries  
**Primary Source Reconciliation:** World Content Atlas Set 24, especially 24D - Dimensions, Realm Structure and Realm Biome Atlas, plus later Verdant Final Content Canon interview locks.  
**Final Global Status:** Pending cross-realm reconciliation after all realm FCC sets and the Overworld FCC are complete.

---

# 1. Purpose

FCC-02B defines the authoritative environmental and world-generation content of the **Verdant Covenant**.

It owns:

- the eight canonical Verdant biome families;
- biome identity and environmental structure;
- terrain topology and transition logic;
- climate and seasonal-state behaviour;
- hydrological and root-orientation rules at the biome level;
- environmental hazard families;
- dynamic biome-state overlays;
- deterministic generation constraints;
- environmental suitability interfaces consumed by settlements, structures, dungeons, creatures, flora, resources, and events;
- simulation-scaling rules for environmental systems.

It does **not** own the full flora, creature, material, civilisation, structure, dungeon, item, recipe, or portal-runtime registries. Those systems consume the biome and environmental interfaces defined here and are finalised in later FCC-02 documents.

---

# 2. Canonical Biome Roster

The Verdant Covenant contains exactly eight major canonical biome families at the realm-content-foundation level:

1. **Sunlit Canopy**
2. **Moonroot Groves**
3. **Pollenwild Meadows**
4. **Living Riverlands**
5. **Thorn-Court Marches**
6. **Rotwilds**
7. **Seasonal Nexus**
8. **Dreaming Root Depths**

These are **biome families**, not single visual presets.

Each family may contain:

- procedural local variants;
- sub-biomes;
- altitude or depth bands;
- seasonal presentations;
- settlement-influenced states;
- restored or damaged states;
- Court-controlled variants;
- event overlays;
- rare authored sites;
- corruption overlays;
- transition ecotones.

A sub-biome or state does not become a new major biome family merely because its palette, vegetation density, hazard pressure, or local resources differ.

---

# 3. Realm Environmental Topology

## 3.1 Regional Mosaic

The Verdant Covenant generates as an interconnected regional mosaic rather than eight isolated patches.

Large-scale topology combines:

- colossal forest basins;
- vertical canopy regions;
- root-arch woodland provinces;
- meadow belts;
- river and wetland networks;
- territorial thorn borders;
- degraded or restoration landscapes;
- seasonal convergence territories;
- subterranean root-depth networks.

Biome placement must be seed-derived and suitability-driven.

No production world requires a fixed first Verdant biome, fixed Court territory, fixed dungeon position, or POC-specific route.

## 3.2 Transition Ecotones

Major biome changes require understandable environmental transition unless an authored magical boundary deliberately overrides that expectation.

Typical transitions include:

- Sunlit Canopy -> Moonroot Groves through increasing root exposure, shade, silver vegetation, and lower canopy density;
- Sunlit Canopy -> Pollenwild through canopy thinning, flowering clearings, and widening sun exposure;
- Pollenwild -> Living Riverlands through wetter meadow soils, reed growth, flood channels, and braided waterways;
- Living Riverlands -> Thorn-Court Marches through fortified hedges, managed banks, boundary groves, and territorial route control;
- healthy biome -> Rotwild through increasing deadfall, fungal dominance, disrupted seasonal signals, and damaged ecological structure;
- ordinary seasonal region -> Seasonal Nexus through increasingly unstable or juxtaposed seasonal boundaries;
- surface biome -> Dreaming Root Depths through sink roots, hollow trunks, root caverns, living descents, or authored underground access sites.

Transition regions may inherit environmental features from both neighbouring families.

## 3.3 Hidden and Restricted Layers

The generator may create:

- Court-restricted territories;
- ancient living interiors;
- buried root routes;
- isolated restoration pockets;
- hidden river basins;
- deep Root Depth chambers;
- sovereign territories;
- dungeon-linked environmental pockets;
- rare cross-realm resonance sites.

Access to restricted local regions may depend on route knowledge, diplomacy, tools, infrastructure, world state, local permissions, or deliberate risk.

These are **intra-realm traversal conditions**, not alternate methods of entering the Verdant Covenant from another dimension.

---

# 4. Seasonal and Climate Model

## 4.1 Seasonal Layers

Verdant season is represented at multiple scopes:

1. **Court Alignment** - long-lived political/metaphysical affiliation with Spring, Summer, Autumn, or Winter.
2. **Regional Seasonal State** - the current broad ecological/climatic state of a region.
3. **Local Seasonal Modifier** - temporary local changes caused by ecology, magic, ritual, settlements, authorities, events, or damage.
4. **Convergence State** - bounded combinations of multiple seasonal influences, principally associated with the Seasonal Nexus.

These layers must not be conflated.

A Summer-aligned Court territory may experience a Winter regional season. A local ritual may create a Spring growth pocket inside that region. The simulation stores these as explicit state layers rather than inventing arbitrary behaviour.

## 4.2 Canonical Seasonal States

The standard seasonal states are:

- **Spring Dominance**
- **Summer Dominance**
- **Autumn Dominance**
- **Winter Dominance**
- **Mixed Seasonal Convergence**

The following named environmental overlays may modify a seasonal state:

- Great Bloom;
- Heavy Pollen;
- Living-River Flood;
- Thornstorm;
- Rot Bloom;
- Ecological Blight;
- Void-Corrupted State.

## 4.3 Seasonal Effects

Seasonal state may influence, within bounded data-driven ranges:

- temperature;
- rainfall or moisture;
- daylight quality;
- vegetation density;
- flowering and fruiting availability;
- crop growth modifiers;
- creature behaviour and migration;
- material states such as Season Sap charge;
- route accessibility;
- Court activity;
- dungeon configuration;
- event eligibility;
- hazard intensity;
- ambient colour and audio state;
- river volume;
- snow/frost where appropriate;
- growth or dormancy of living infrastructure.

Seasonal systems must consume supported interfaces from flora, creature, settlement, dungeon, resource, and event systems rather than directly rewriting unrelated data.

## 4.4 Climate Is Not One Realm-Wide Weather Setting

The Verdant Covenant does not run one global weather preset.

Climate emerges from:

- biome family;
- latitude-like or regional generation parameters where used;
- elevation/depth;
- local water availability;
- seasonal state;
- Court influence;
- event overlays;
- corruption/blight state;
- authored site rules.

Weather generation must remain deterministic from seed and saved state.

---

# 5. Environmental Hazard Registry

The following twelve hazard families are canonical for the Verdant Covenant.

| # | Hazard Family | Canonical Environmental Meaning | Ownership Boundary |
|---|---|---|---|
| 1 | Aggressive Overgrowth | Rapid growth, constricting vines, route closure, structural encroachment, root upheaval | FCC-02B owns environment state; damage/status uses universal systems |
| 2 | Glamour / Perception Distortion | Bounded visual, navigational, sensory, or recognition disruption caused by Verdant magic | Must not arbitrarily falsify persistent game data |
| 3 | Territorial Flora | Plants or living boundaries that react to permissions, intrusion, harvesting, or territory state | Flora details owned by FCC-02D |
| 4 | Seasonal Exposure | Heat, cold, wet, dormancy, bloom pressure, sudden local seasonal shift | Damage/status uses universal systems |
| 5 | Pollen Bloom | Dense pollen reducing visibility, triggering growth, causing confusion/irritation, or changing local ecology | Exact status tuning external |
| 6 | Living River Shift / Flood | Route change, bank growth, floodplain activation, current change, temporary access disruption | Hydrology is bounded and state-driven |
| 7 | Thorn Territory | Defensive thorn growth, barriers, hunting lanes, territorial weather, Court border pressure | Territory law consumed from FCC-02A |
| 8 | Natural Rot / Decay | Decomposition, deadfall, fungal expansion, unstable organic ground | Not Corruption by default |
| 9 | Ecological Blight | Disease, imbalance, invasive magical growth, damaged living systems | Separate from natural rot and Void corruption |
| 10 | Void Corruption | Genuine reality/matter contamination ultimately originating from the Void Between | FCC-02I owns detailed corruption behaviour |
| 11 | Covenant / Oath Consequences | Environmental effects caused by explicit recognised Covenant states | Law ownership remains FCC-02A |
| 12 | Root-Orientation / Navigation Hazard | Non-standard local orientation, looping roots, living passages, deep-network route complexity | Primarily Dreaming Root Depths |

Hazard intensity must be suitability- and state-driven, not randomly punitive.

---

# 6. Sunlit Canopy

## 6.1 Canonical Identity

The **Sunlit Canopy** is the Verdant Covenant's great living vertical-abundance forest.

It is defined by:

- colossal trees;
- multiple ecological height layers;
- enormous roots and buttresses;
- living bridges and branch routes;
- rich sunlight in upper layers;
- deep shade in lower layers;
- intense flowering, fruiting, pollination, and biological productivity;
- living architecture grown into trunks, roots, and branches;
- strong contrasts between forest floor and radiant canopy.

The Sunlit Canopy must feel like a three-dimensional biome rather than ordinary woodland with oversized trees.

## 6.2 Vertical Bands

The family may generate the following environmental bands:

### Forest Floor / Root Floor

- giant root walls and buttresses;
- dark fertile soil;
- pools and runoff channels;
- fallen branches and decaying organic material;
- filtered light;
- dense small flora;
- occasional exposed Rootstone;
- large structural tree bases.

### Lower Canopy

- broad limbs;
- hanging vegetation;
- filtered pollen shafts;
- natural bridges;
- trunk hollows;
- intermediate settlements and routes.

### Upper Canopy

- strong sunlight;
- flowering crowns;
- Dawnwood-dominant zones where suitable;
- increased fruit and nectar availability;
- gliding and aerial creature habitat;
- stronger wind exposure.

### Emergent Crown Layer

- highest major crowns above the ordinary canopy;
- intense sunlight and weather exposure;
- long-distance views;
- rare structures or authority territories;
- high-value ecological pockets;
- dangerous falls and exposed traversal.

## 6.3 Terrain and Route Behaviour

Natural routes may include:

- root ramps;
- branch paths;
- living bridges;
- trunk hollows;
- vine climbs;
- settlement-built walkways;
- gliding crossings;
- water-carved root gullies.

Recognised territorial or hospitality states may affect selected living paths, but path response must use explicit route states rather than continuous pathfinding mutation.

## 6.4 Climate

Typical baseline:

- warm to temperate;
- humid lower layers;
- brighter and windier upper layers;
- frequent local rain capture;
- strong seasonal flowering/fruiting response.

Court alignment and regional season may produce colder, drier, wetter, or dormant variants.

## 6.5 Principal Environmental Hazards

- aggressive overgrowth;
- pollen bloom;
- territorial flora;
- canopy fall exposure;
- glamour in selected old-growth territories;
- Court or living-territory route denial;
- storm exposure in emergent crowns.

## 6.6 Content Interfaces

Sunlit Canopy provides suitable regions for:

- Greatheart Tree;
- Dawnwood Tree;
- Bloomwood Tree where local conditions permit;
- Oathstag;
- Pollen Drake;
- Crown Glider;
- canopy settlements;
- Greatheart enclaves;
- embassy platforms;
- Living Palace Roots;
- selected Seasonal Regent territory;
- living architecture and high-volume botanical production.

Exact flora, creature spawning, structures, and resource definitions are owned by later FCC-02 documents.

---

# 7. Moonroot Groves

## 7.1 Canonical Identity

The **Moonroot Groves** are silver-lit forests of enormous exposed roots, persistent memory traces, recognised names, and limited spirit resonance.

They combine:

- old root arches;
- cool shade;
- moon-responsive ecology;
- luminous or pale vegetation;
- remembered markers;
- bounded identity-sensitive routes;
- limited natural resonance with the Ancestral Veil.

The biome is not a second Ancestral Veil and does not own death, afterlife, soul migration, or Veil travel systems.

## 7.2 Terrain

Common terrain forms include:

- arching root corridors;
- root-walled basins;
- silver-lit clearings;
- shallow mist pockets;
- dark soil and moss beds;
- exposed Rootstone;
- memory-marker groves;
- buried or half-revealed paths.

Roots may reveal, conceal, or redirect selected routes according to explicit recognised states.

## 7.3 Lunar Ecology

Moonlight or equivalent realm-night illumination can alter:

- plant luminescence;
- flowering behaviour;
- Spirit Moss response;
- local creature activity;
- Season Sap resonance;
- visibility of memory traces;
- selected ritual or site states.

This behaviour uses discrete environment states, not per-ray biological simulation.

## 7.4 Ancestral Veil Resonance

Limited spirit overlap may appear as:

- echoes;
- memory impressions;
- visibility of Veil-resonant entities;
- specialist flora response;
- authored structures or quests;
- localised boundary thinning.

Normal travel to the Ancestral Veil still requires that realm's canonical portal.

## 7.5 Principal Environmental Hazards

- glamour/perception distortion;
- root-navigation changes;
- identity-sensitive route denial;
- low-visibility mist;
- territorial root guardians;
- local memory confusion from authored effects;
- rare cross-realm resonance anomalies.

## 7.6 Content Interfaces

Moonroot Groves provide suitable regions for:

- Spirit Moss;
- Moonbell;
- Moonleaf cultivation;
- Moonroot Warden;
- Seasonal Fox;
- shrine villages;
- Oath Courts;
- Memory Grove settlements;
- Memory Orchard sites;
- Seasonal Gates as intra-realm infrastructure;
- rare Dreaming Bridge sites;
- selected Broken Covenant Garden or Living Palace Root variants.

---

# 8. Pollenwild Meadows

## 8.1 Canonical Identity

The **Pollenwild Meadows** are vast mobile-looking seasonal grasslands and flowering plains dominated by colour, wind, pollination, migrating ecology, temporary markets, festivals, and emotionally resonant weather states.

Their core identity combines:

- large flowering expanses;
- seasonal grasslands;
- giant pollinators;
- large flowering plants;
- mobile herds;
- migrating peoples;
- pollen-driven hazards and abundance;
- rapid ecological change within bounded seasonal rules.

## 8.2 Terrain

Common forms include:

- rolling meadow basins;
- flower seas;
- low ridges;
- isolated tree islands;
- seasonal streams;
- temporary wet meadows;
- tall-flower corridors;
- festival and migration grounds.

The biome should preserve long sightlines compared with the Sunlit Canopy while still supporting patches of high vegetation.

## 8.3 Climate and Emotional Resonance

Pollenwild weather can respond to major authored community or seasonal states, including:

- festivals;
- migration events;
- settlement distress;
- Court celebration;
- large conflicts;
- major rituals.

Effects may alter wind, flowering density, pollen intensity, ambient colour, minor precipitation, or creature migration.

Individual NPC moods do not directly control the weather.

## 8.4 Principal Environmental Hazards

- heavy pollen;
- visibility reduction;
- uncontrolled local growth;
- seasonal exposure;
- stampede/migration pressure;
- explosive bloom risk around inappropriate fire or machinery where designed;
- glamour insects or plant effects;
- temporary route obstruction by dense flowering.

## 8.5 Content Interfaces

Pollenwild Meadows provide suitable regions for:

- Bloomwood-dominant pockets;
- Thornsilver Vine where host ecology permits;
- Sunpetal;
- Nectar Bloom;
- Seasonfern;
- Goldgrain and other crops;
- Thornsilver Weaver;
- Pollen Drake;
- Oathstag migration;
- Seasonal Fox;
- seasonal nomad camps;
- mobile markets;
- festival grounds;
- migrating event bosses or elite creatures generated from existing authority/creature systems rather than mandatory new fixed realm bosses.

---

# 9. Living Riverlands

## 9.1 Canonical Identity

The **Living Riverlands** are a network of rivers, wetlands, floodplains, reed settlements, and biological water infrastructure in which waterways can respond slowly and meaningfully to ecology, settlement, damage, treaties, and recognised local relationships.

Most rivers are semi-living environmental systems rather than fully sentient NPCs.

Exceptional authored rivers may become genuine spirits or sovereign entities.

## 9.2 Hydrology Model

Living River behaviour must be bounded.

Permitted state-driven changes include:

- local bank growth or retreat;
- floodplain activation;
- opening or closing secondary channels;
- settlement-compatible docking growth;
- root-damage avoidance;
- route preference changes;
- seasonal flow volume changes;
- restoration of damaged channels;
- temporary event diversions.

The game must not recalculate unconstrained whole-realm river topology continuously.

Major route changes should occur through discrete simulation events, scheduled updates, or authored transitions that are save-safe and reproducible.

## 9.3 Terrain

Common forms include:

- braided rivers;
- reed wetlands;
- low islands;
- living banks;
- root bridges;
- flood basins;
- silt flats;
- biological locks or channels;
- shallow marsh forest.

## 9.4 Climate

Typical baseline:

- humid;
- locally cooler near major channels;
- frequent mist;
- strong seasonal water-volume shifts;
- flood events during suitable regional states.

## 9.5 Principal Environmental Hazards

- living-river floods;
- strong currents;
- shifting banks;
- wetland visibility;
- territorial aquatic flora;
- local water contamination during blight/corruption events;
- submerged route hazards.

## 9.6 Content Interfaces

Living Riverlands provide suitable regions for:

- Living Reed;
- Riverleaf;
- River Bulb;
- River Pearl sources;
- covenant fish and other native aquatic food families;
- Riverback;
- Pollen Drake in wet meadow interfaces;
- reed villages;
- River Court settlements;
- living lock/waterway stations;
- Riverway structures;
- drowned covenant ruins;
- water-adapted dungeon variants;
- exceptional river-sovereign encounters where generated.

---

# 10. Thorn-Court Marches

## 10.1 Canonical Identity

The **Thorn-Court Marches** are intelligent defensive borderlands where ecology, military geography, living fortification, territorial law, and Court politics overlap.

They are not universally hostile.

A March may be:

- an active border;
- a disputed frontier;
- a ceremonial boundary;
- a protected hunting territory;
- a refugee defence line;
- an abandoned fortification ecology;
- a neutral buffer;
- a Court-controlled military landscape.

## 10.2 Terrain

Common forms include:

- massive hedgerows;
- thorn walls;
- hunting roads;
- living gates;
- fortified groves;
- narrow passes;
- managed clearings;
- raised roots;
- defensive trenches grown rather than excavated;
- watch-height vegetation.

## 10.3 Territorial Weather

Marches may generate local bounded weather effects associated with defence and visibility, such as:

- thorn-laden wind;
- dense leaf movement;
- sudden low mist;
- controlled pollen release;
- branch movement;
- localised rain or dryness.

These are environmental states, not omnipotent Court magic.

## 10.4 Principal Environmental Hazards

- thorn territory;
- territorial flora;
- hunting-lane ambushes;
- route closure;
- seasonal exposure;
- Court-law consequences;
- defensive weather;
- predatory plant pockets.

## 10.5 Content Interfaces

Thorn-Court Marches provide suitable regions for:

- Thornsilver Vine;
- Wardthorn;
- Thornshell;
- Thornbound Hunter;
- Court estates;
- border keeps/groves;
- treaty outposts;
- Thorn Gates;
- Thorn-Hunt Labyrinths;
- Court champion encounters;
- Oathbreaker Thorn influence or territory where generated.

---

# 11. Rotwilds

## 11.1 Canonical Identity

The **Rotwilds** are regions where normal seasonal/ecological balance has collapsed, been abandoned, become diseased, or reorganised around decomposition.

Rotwild identity must preserve the canonical distinction:

> **Rot is not automatically evil, blight is not automatically Void corruption, and genuine Void corruption is a separate phenomenon.**

A Rotwild may be naturally decompositional, ecologically damaged, magically imbalanced, politically abandoned, actively undergoing restoration, or invaded by true corruption.

## 11.2 Terrain

Common forms include:

- decomposing forest;
- fungal flats;
- deadfall fields;
- saturated soil;
- hollow root chambers;
- standing deadwood;
- regrowth pockets;
- collapsed living infrastructure;
- quarantine boundaries;
- restoration plots.

Rotwood is normally a condition/state of compatible wood rather than a separate tree species.

## 11.3 Rot, Blight, and Corruption Presentation

Environmental readability must distinguish at least three families:

### Natural Rot

- decomposition;
- fungal colonisation;
- carrion ecology;
- nutrient recycling;
- deadfall;
- healthy decomposer populations.

### Ecological Blight

- diseased vegetation;
- invasive growth;
- failed seasonal cycles;
- damaged root systems;
- harmful magical imbalance;
- collapsing local ecology.

### Void Corruption

- reality/matter contamination;
- impossible colour or geometry states where art governance permits;
- corrupted creature/material states;
- persistent foreign influence;
- spatial or systemic instability owned in detail by FCC-02I.

## 11.4 Principal Environmental Hazards

- natural rot/unstable organic ground;
- fungal clouds;
- ecological blight;
- contaminated water;
- collapsing living structures;
- aggressive scavenger or decomposer activity;
- Void corruption where present;
- quarantine or faction-controlled access.

## 11.5 Content Interfaces

Rotwilds provide suitable regions for:

- Rootcap Fungus;
- Rotcap fungal systems;
- Rotcap Colony;
- Rotgrazer;
- Seasonal Fox variants;
- blight camps;
- quarantine settlements;
- restoration enclaves;
- Rot-Heart Grove dungeons;
- Rot-Crowned Hart territory;
- cleansing and restoration events;
- Void-incursion overlays without redefining the Void itself.

---

# 12. Seasonal Nexus

## 12.1 Canonical Identity

The **Seasonal Nexus** is the principal Verdant convergence biome where Spring, Summer, Autumn, and Winter occupy moving, overlapping, or adjacent territories around powerful realm-scale seasonal infrastructure and political activity.

It is a realm-climax-capable biome family but is not required to contain the same fixed climax configuration in every seed.

## 12.2 Seasonal Territory Model

The Nexus may contain:

- four dominant seasonal sectors;
- mixed boundaries;
- moving convergence fronts;
- neutral summit zones;
- Court ritual grounds;
- season-stabilising infrastructure;
- rare mixed-state ecological pockets.

Seasonal boundary movement must occur through bounded state changes rather than arbitrary terrain regeneration.

## 12.3 Mixed Seasonal Convergence

Compatible combinations may create local effects such as:

- simultaneous flowering and frost;
- autumn leaf-fall during summer heat;
- spring melt through winter ground;
- mixed-resource charge states;
- unusual migration or crop windows;
- altered dungeon chamber states.

Mixed convergence is not a license to create unbounded new elements, resources, or physical laws.

## 12.4 Terrain

Common forms include:

- radial or interlocking seasonal landscapes;
- ritual terraces;
- convergence groves;
- weather boundaries;
- seasonal waterways;
- Court roads;
- large public works;
- shifting but persistent route junctions.

## 12.5 Principal Environmental Hazards

- rapid seasonal exposure changes;
- conflicting weather fronts;
- mixed pollen/frost conditions;
- route changes at seasonal boundaries;
- authority-scale environmental effects;
- Court conflict;
- rare unstable convergence.

## 12.6 Content Interfaces

Seasonal Nexus provides suitable regions for:

- Season Sap mixed/convergence states;
- season-charged Bloomstone growths rather than an automatic separate Seasonal Crystal family;
- rare crops and climate-catalyst products where later registries justify them;
- Court summit sites;
- Seasonal Ritual Complexes;
- realm route hubs;
- Seasonal Confluence structures;
- Seasonal Vault dungeons;
- Seasonal Sentinel guardians;
- Seasonal Regent activity or sovereign conflict.

---

# 13. Dreaming Root Depths

## 13.1 Canonical Identity

The **Dreaming Root Depths** are immense subterranean networks of living roots, caverns, root interiors, buried relic spaces, and deep ecological systems beneath the Verdant Covenant.

They are defined by:

- colossal living root architecture;
- non-standard local orientation;
- deep biological infrastructure;
- hidden settlements and routes;
- dream resonance;
- rare Somnolent Expanse interaction;
- ancient and difficult navigation.

The biome remains a Verdant environmental system. It does **not** own the Somnolent Expanse's dream simulation.

## 13.2 Orientation Model

The older Atlas described gravity as following root orientation rather than global down. The Final Content Canon retains the fantasy but constrains implementation.

Canonical implementation direction:

- selected authored/root-network zones may define a **local orientation frame**;
- transitions between orientation frames must be explicit, readable, deterministic, and technically feasible;
- ordinary regions may preserve standard gravity where full orientation changes would harm usability or performance;
- level geometry can create the impression of impossible root orientation even when player gravity remains conventional;
- accessibility settings may reduce disorienting camera or gravity effects without removing the biome.

The fantasy is mandatory; a brittle universal dynamic-gravity simulation is not.

## 13.3 Terrain

Common forms include:

- enormous root tunnels;
- hollow root interiors;
- root bridges over deep caverns;
- living walls;
- buried Rootstone shelves;
- fungal chambers;
- sap channels;
- root junctions;
- sleeping-growth chambers;
- relic pockets;
- deep water basins.

## 13.4 Dream Resonance

Dream-active regions may influence:

- ambient visuals and audio;
- sleeping creature behaviour;
- Dreamburrower behaviour;
- Dreamroot plant state;
- Season Sap resonance;
- rare authored Dreaming Bridge sites;
- local dungeon or event conditions.

Normal interdimensional travel to the Somnolent Expanse **always** requires that realm's canonical portal.

A rare Root Depths/Somnolent resonance site may:

- reveal portal knowledge;
- supply a portal component;
- provide clues;
- create visions;
- enable a special narrative event;
- interact with an already-established portal route;
- function as a local dream phenomenon.

It may not become an unrestricted alternate portal bypass.

## 13.5 Principal Environmental Hazards

- root-orientation/navigation hazard;
- darkness;
- vertical falls;
- living passage closure;
- fungal or sap hazards;
- dream-resonance perception effects;
- isolated territorial organisms;
- deep-route loss;
- rare corruption/breach events.

## 13.6 Content Interfaces

Dreaming Root Depths provide suitable regions for:

- Dreamroot;
- Rootcap Fungus;
- Dreamburrower;
- Moonroot Warden in suitable transitional areas;
- hidden root cities;
- Rootway Stations;
- Dream-Root Sanctuaries;
- Dreaming Bridge sites;
- organic megadungeon variants;
- ancient sleeping entities or authored world-history sites;
- rare Somnolent-resonance content.

---

# 14. Terrain Foundation Families

FCC-02B recognises the following broad Verdant terrain foundations for environmental generation:

- **Verdant Living Soil** - primary living/fertile soil family;
- **Rootstone** - ordinary native stone foundation;
- **Bloomstone-bearing root geology** - specialist biological/geological growth context;
- **Worldroot / colossal root mass** - living structural terrain owned in material detail by FCC-02C/D;
- **riverbed and silt profiles** - Living Riverlands terrain family;
- **natural water** - uses the universal fluid system;
- **organic litter / rot layers** - state-based terrain treatment where appropriate;
- **seasonal surface states** - snow/frost, flowering, leaf litter, wetness, dormancy, etc. represented through supported block/material state systems.

These are environmental foundations, not permission to create duplicate Item records or every possible terrain block permutation.

Exact canonical blocks and material IDs are owned by FCC-02C/G/J.

---

# 15. Biome Dynamic-State Model

Biome families may support the following broad persistent or temporary states where meaningful:

- **Baseline**
- **Disturbed**
- **Occupied**
- **Exploited**
- **Fortified**
- **Blighted**
- **Void-Corrupted**
- **Stabilised**
- **Abandoned**
- **Restoring**
- **Restored**
- **Realm-Event Active**

Not every biome requires every state.

States must be attached only where they produce meaningful changes in:

- ecology;
- terrain presentation;
- route access;
- settlements;
- resource availability;
- hazards;
- creature composition;
- structure occupancy;
- event eligibility;
- political control.

A visual-only variation does not need to become a major simulation state if a material/biome variant parameter can represent it more cheaply.

---

# 16. Realm Event Environmental Families

FCC-02B reserves environmental interfaces for the following locked Verdant event families:

1. **Seasonal Migration**
2. **Court Succession / Challenge**
3. **Covenant Dispute**
4. **Hospitality Crisis**
5. **Living River Diversion**
6. **Great Bloom**
7. **Blight Outbreak**
8. **Restoration Campaign**
9. **Thorn Hunt**
10. **Pollinator Migration**
11. **Rootway Awakening**
12. **Realm Breach / Void Incursion**

FCC-02H owns event gameplay and outcomes. FCC-02B owns only the environmental state changes those events are allowed to request.

---

# 17. Environmental Suitability Interfaces

Every generated Verdant region exposes suitability data that other FCC documents may consume.

Recommended conceptual fields include:

- biome family;
- sub-biome/variant;
- seasonal state;
- Court alignment/influence where present;
- elevation band;
- depth band;
- moisture;
- water proximity;
- canopy exposure;
- root density;
- soil family;
- Rootstone exposure;
- Bloomstone suitability;
- settlement suitability;
- agriculture suitability;
- large-tree suitability;
- aquatic suitability;
- dungeon suitability;
- portal-site suitability;
- authority-territory suitability;
- hazard pressure;
- blight state;
- corruption state;
- restoration state;
- spirit resonance;
- dream resonance;
- territorial-law state.

These fields are implementation-facing interfaces rather than promises that every value must be stored as an expensive continuously updated simulation variable.

They may be derived, cached, regionalised, or simplified according to technical architecture.

---

# 18. Generation and Determinism Rules

## 18.1 Seed Authority

Verdant environmental generation is seed-based and deterministic under the production world-generation contract.

Seed and world settings determine the baseline arrangement of:

- biome regions;
- rivers;
- large terrain forms;
- major root networks;
- seasonal starting state;
- Court influence regions;
- settlement suitability;
- structure/dungeon suitability;
- resource suitability;
- hazard baseline;
- portal destination suitability.

Persistent world simulation may alter those results afterward, but saved state must remain authoritative.

## 18.2 No Mandatory Fixed Layout

The following are prohibited as normal production assumptions:

- fixed first Verdant biome;
- guaranteed identical arrival clearing;
- fixed Seasonal Court geography;
- fixed dungeon coordinates;
- one universal river layout;
- one guaranteed authority location;
- POC-specific terrain arrangement.

## 18.3 Progression Safety

Generation must validate that:

- a Covenant Portal can resolve to a survivable arrival region;
- fundamental realm progression is not blocked by impossible topology;
- required biome families or substitute access paths remain reachable under allowed settings;
- deep content is reachable through valid traversal/progression;
- lower simulation settings do not remove required geography;
- seasonal state cannot permanently eliminate all access to a required content class.

---

# 19. Simulation Scaling and Low-End Hardware

The Verdant Covenant must preserve its identity on low-end hardware and simplified world-simulation settings.

## 19.1 Systems That May Be Simplified

Lower settings may reduce:

- frequency of off-screen seasonal updates;
- number of simulated river branches;
- local vegetation growth checks;
- migration population granularity;
- dynamic route recalculation frequency;
- Court/environment influence update frequency;
- off-screen blight spread detail;
- ambient creature density;
- pollen particle density;
- distant canopy animation;
- number of simultaneously active environmental overlays;
- deep Root Depth orientation effects.

## 19.2 Systems That Must Remain

Lower settings must preserve:

- all eight biome families;
- essential seasonal identity;
- Covenant-law consequences where relevant;
- living-river identity;
- Rotwild distinction between rot/blight/corruption;
- Dreaming Root Depths identity;
- progression routes;
- required resources;
- required settlement/dungeon/authority access;
- portal destination safety;
- deterministic save behaviour.

## 19.3 Approximation Rule

When full environmental simulation is unnecessary, the engine may use:

- regional state summaries;
- scheduled coarse updates;
- deterministic catch-up simulation;
- cached suitability maps;
- authored transition states;
- density fields;
- proxy populations;
- simplified off-screen hydrology.

The visible result should preserve gameplay meaning rather than simulate every biological process literally.

---

# 20. Accessibility and Readability

Verdant environmental complexity must remain readable.

Accessibility options may reduce or replace:

- strong screen-space pollen;
- colour-only seasonal cues;
- disorienting glamour effects;
- camera rotation associated with Root Depth orientation;
- intense flashing growth effects;
- dense atmospheric particles;
- aggressive motion in living foliage.

Important gameplay states must have redundant cues through combinations of:

- colour;
- silhouette;
- particles;
- sound;
- UI/Codex information;
- material state;
- environmental props;
- route markers.

Accessibility changes must not alter the underlying canonical world state unless a gameplay-assist setting explicitly does so.

---

# 21. Cross-Document Ownership Matrix

| Content | Owning FCC Document | FCC-02B Responsibility |
|---|---|---|
| Realm laws and Covenant states | FCC-02A | Consumes environmental consequences |
| Portal construction/runtime | FCC-02A / FCC-02G / universal Realm Access | Provides destination suitability only |
| Geology/material definitions | FCC-02C | Provides terrain context and distribution suitability |
| Trees/plants/crops | FCC-02D | Provides biome and climate suitability |
| Creatures | FCC-02E | Provides habitat and environmental-state interfaces |
| Civilisations/settlements | FCC-02F | Provides settlement suitability and environmental constraints |
| Structures/blocks/items/recipes | FCC-02G | Provides site suitability and environmental states |
| Dungeons/authorities/events | FCC-02H | Provides site/state/hazard interfaces |
| Rot/blight/corruption details | FCC-02I | Defines baseline environmental distinction and overlay hooks |
| Final registry/art handoff | FCC-02J | Supplies biome/environment registry and state taxonomy |

---

# 22. Source Reconciliation and Supersession Notes

The following environment-facing changes supersede or narrow older Verdant source definitions where necessary:

1. The eight Set 24 Verdant biome families are retained and canonically locked.
2. Older minor resource names appearing inside biome descriptions do not automatically become major material families. FCC-02C/D reconciles them under the locked major/minor resource rule.
3. Fae seeds are a generic magical-seed category rather than a required raw-material family.
4. Moon Sap and Dream Sap are contextual/resonant states or sources of **Season Sap**, not independent major materials.
5. Seasonal Resin is a processed/hardened Season Sap product where needed.
6. Seasonal Crystals are not automatically a separate mineral family; season-charged Bloomstone is the default interpretation unless later global material reconciliation proves otherwise.
7. Rotwood is normally a wood condition/state, not a tree species.
8. Dreaming Root Depths may resonate with Somnolent Expanse but cannot bypass the canonical-portal requirement for realm entry.
9. Older freeform implications that Verdant paths constantly rewrite themselves are constrained to deterministic bounded route states.
10. Older implications of globally dynamic rivers are constrained to save-safe regional/state-driven hydrology.
11. The Root Depths retain non-standard orientation as a defining fantasy, but implementation may use bounded local orientation frames and authored geometry instead of universal dynamic gravity.
12. Natural rot, ecological blight, and Void corruption remain mechanically and visually distinguishable categories.

---

# 23. Validation Requirements

FCC-02B passes realm-local validation only if all of the following are true:

## 23.1 Biome Coverage

- all eight biome families can generate;
- each has distinct environmental identity;
- each has at least one valid transition path to compatible neighbouring families;
- no biome depends on POC-specific geography;
- no biome is accidentally reduced to a single fixed visual preset.

## 23.2 Seasonal Validation

- all four standard seasons can affect valid regions;
- mixed convergence is bounded;
- Court alignment and current season remain separate concepts;
- seasonal changes cannot permanently block mandatory progression;
- season-dependent resources remain obtainable through valid world-state progression.

## 23.3 Hazard Validation

- all twelve hazard families have clear ownership;
- natural rot is not automatically tagged as corruption;
- blight is distinct from corruption;
- glamour cannot permanently falsify or delete player-owned information;
- living-river and route hazards remain deterministic/save-safe;
- low-end settings preserve gameplay-critical hazard meaning.

## 23.4 Cross-Realm Validation

- Moonroot Veil resonance does not own Ancestral Veil travel;
- Dreaming Root Depths resonance does not bypass the Somnolent portal;
- Void corruption consumes Void-system interfaces;
- no hidden biome route becomes an unintended second normal interdimensional access system.

## 23.5 Technical Validation

- environmental state is serialisable;
- generation is seed-reproducible;
- regional updates are multiplayer-authoritative where required;
- off-screen simulation can be approximated;
- the world remains playable under lower simulation settings;
- portal arrival suitability can be validated before destination placement.

---

# 24. Canonical Environment Registry Snapshot

## 24.1 Major Biome Families

| Stable Working ID | Canonical Name | Primary Identity |
|---|---|---|
| biome.verdant.sunlit_canopy | Sunlit Canopy | Colossal vertical abundance forest |
| biome.verdant.moonroot_groves | Moonroot Groves | Moon-responsive memory-root forest with limited spirit resonance |
| biome.verdant.pollenwild_meadows | Pollenwild Meadows | Seasonal flowering plains, pollinators, migration, mobile culture |
| biome.verdant.living_riverlands | Living Riverlands | Semi-living rivers, wetlands, biological water infrastructure |
| biome.verdant.thorn_court_marches | Thorn-Court Marches | Intelligent defensive borderlands and Court territory |
| biome.verdant.rotwilds | Rotwilds | Decomposition, ecological imbalance, blight/restoration landscapes |
| biome.verdant.seasonal_nexus | Seasonal Nexus | Convergence of Spring/Summer/Autumn/Winter territories |
| biome.verdant.dreaming_root_depths | Dreaming Root Depths | Subterranean living-root networks with bounded dream resonance |

Working IDs may be normalised during FCC-02J registry reconciliation; canonical display names are locked.

## 24.2 Environmental Hazard Families

1. Aggressive Overgrowth
2. Glamour / Perception Distortion
3. Territorial Flora
4. Seasonal Exposure
5. Pollen Bloom
6. Living River Shift / Flood
7. Thorn Territory
8. Natural Rot / Decay
9. Ecological Blight
10. Void Corruption
11. Covenant / Oath Consequences
12. Root-Orientation / Navigation Hazard

## 24.3 Seasonal / Environmental State Families

- Spring Dominance
- Summer Dominance
- Autumn Dominance
- Winter Dominance
- Mixed Seasonal Convergence
- Great Bloom
- Heavy Pollen
- Living-River Flood
- Thornstorm
- Rot Bloom
- Blight
- Void-Corrupted State

---

# 25. Art-Handoff Notes Reserved for FCC-02J

FCC-02B establishes the environmental identities that later art governance must preserve, including:

- strong vertical light-value separation in Sunlit Canopy;
- silver/cool lunar readability in Moonroot without making the biome visually identical to the Ancestral Veil;
- high controlled colour diversity in Pollenwild;
- water/vegetation integration in Living Riverlands;
- defensive silhouettes and territorial readability in Thorn-Court Marches;
- visual separation of healthy decomposition, blight, and Void corruption in Rotwilds;
- readable seasonal boundaries in Seasonal Nexus;
- root-scale, depth, and orientation cues in Dreaming Root Depths.

Exact palettes, texture values, material inheritance, particle budgets, and style rules are **not** owned here. They are handed to FCC-02J and the later Material, Colour & Texture Style Governance set.

---

# 26. Acceptance Gate for FCC-02B

FCC-02B is accepted when:

- all eight biome families are fully defined at environmental level;
- biome transitions and hidden layers are bounded;
- seasonal and Court alignment layers are separated;
- the twelve hazard families are locked;
- terrain foundations are identified without duplicating material ownership;
- Living Riverlands hydrology is technically bounded;
- Dreaming Root Depths preserve their fantasy without requiring fragile universal dynamic gravity;
- rare dream/spirit resonance does not create alternate portal access;
- dynamic biome states are serialisable and deterministic;
- low-end simulation fallbacks preserve progression and realm identity;
- later FCC-02 documents have explicit environment interfaces to consume.

**FCC-02B status:** **LOCKED FOR REALM-LOCAL FCC USE - pending final cross-realm reconciliation.**
