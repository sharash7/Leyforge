# Leyforge Art Production Corpus

## ART-03 — World, Realm, Biome, Architecture & Culture Art Direction

**Document ID:** ART-03  
**Title:** Leyforge World, Realm, Biome, Architecture & Culture Art Direction  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED WORLD/REALM/CULTURE ART-DIRECTION BASELINE**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Direct parent:** ART-01 — Master Leyforge Visual Language & Style Bible  
**Material parent:** ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard  
**Constitutional parent:** ART-00 — Art Production Constitution & Authority Map  
**Primary upstream authorities:** current locked FCC-01 Overworld canon; FCC-02 Verdant Covenant; FCC-03 Ancestral Veil; FCC-04 Somnolent Expanse; FCC-05 Ascendant Reach; FCC-06 Impossible Deep; FCC-08 Ashen Lower Realms; FCC-12/13/14 semantic and physical-identity canon; current settlement/culture/world-content canon  
**Inherited production baselines:** Document Set 21 — Voxel Asset Forge; Document Set 22 — Forge Entity & Blueprint Expansion; applicable world/biome/structure/vessel authoring documents  
**Primary downstream consumers:** ART-04 through ART-10, Codex/coding agents, The Forge, FORGE-ENG, world generation, settlement generation, structure generation, environment QA, Project Brain  

---

# 00. Executive World-Art Statement

Leyforge worlds must feel **generated, inhabited and historically accumulated rather than procedurally decorated**.

The global environmental promise is:

> **A Leyforge region should reveal what kind of place it is through landform, material, ecology, infrastructure, occupation, weather, route logic and history before the player opens a map or reads a biome name.**

The global realm promise is:

> **Every current realm must be instantly distinguishable from the others without abandoning the common voxel, material, silhouette, readability and production grammar established by ART-01 and ART-02.**

The global civilisation promise is:

> **Culture changes how people build, organise, decorate, maintain, move through and remember space; ancestry does not determine architecture, and technological or magical advancement does not force every settlement toward one universal endgame city skin.**

ART-03 translates current realm, biome, settlement and culture canon into final production-facing art direction. It does not redefine gameplay laws, biome registries, settlement mechanics, political systems, realm access or material identity.

---

# 01. Authority and Scope

## 01.1 ART-03 owns

ART-03 owns project-wide art direction for:

- environmental composition;
- current realm visual identity;
- biome-family presentation grammar;
- terrain/geology/flora composition relationships;
- atmospheric and lighting direction at the environment-art level;
- settlement morphology and visual growth;
- architecture composition;
- culture-facing visual overlays;
- faction/government/occupation overlays where those alter visible space;
- world-history and environmental-storytelling presentation;
- dungeon/site/ruin environmental grammar;
- landmark and navigation readability;
- cross-realm architectural adaptation;
- portal-environment context;
- realm-state and regional-state environment presentation;
- procedural visual variation rules for regions and settlements;
- art-facing world/realm/biome validation;
- the threshold for creating later realm-specific ART sub-books.

## 01.2 ART-03 does not own

ART-03 does not decide:

- whether a realm, biome, culture, settlement type, structure or faction exists;
- biome spawn weights or world-generation algorithms;
- exact terrain simulation;
- exact settlement simulation;
- recipe/progression/access rules;
- exact model construction standards reserved for ART-04;
- exact character anatomy reserved for ART-05;
- final particle/VFX choreography or detailed lighting implementation reserved for ART-06;
- final audio reserved for ART-07;
- final UI/map skin reserved for ART-08;
- engine implementation details reserved for FORGE-ENG/runtime engineering.

## 01.3 Upstream semantic canon wins

If art direction would imply a false gameplay fact, the art direction is wrong.

Examples:

- the Overworld sky may be spectacular but must not look like the player has entered Ascendant Reach;
- Deep Overworld caves must not visually imply physical continuity into Impossible Deep;
- volcanic Overworld terrain must not become an Ashen Lower Realms biome merely because it uses basalt and lava;
- nightmare ecology in Somnolent must not automatically look Void-corrupted;
- Predator Dark in the Ancestral Veil must not be rendered as generic Void corruption;
- Ashen darkness must not automatically imply Void influence;
- a culture using another culture's materials does not become that other culture.

---

# 02. Current Realm Scope — Production Roster

Current locked/rebuild physical-progression scope contains exactly seven persistent worlds:

1. **Overworld**
2. **Verdant Covenant**
3. **Ancestral Veil**
4. **Somnolent Expanse**
5. **Ascendant Reach**
6. **Impossible Deep**
7. **Ashen Lower Realms**

The six non-Overworld portal families are:

- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

## 02.1 Deferred/future concepts

The following are **not current full world-art production targets**:

- World-Engine;
- Elemental Confluences;
- playable Void Between progression;
- Pocket Realm Construction.

They may appear only where current canon permits them as:

- archaeology;
- provenance;
- sealed hooks;
- historical references;
- corruption source/interface;
- future expansion scaffolding.

ART-03 must not use older Atlas scope to silently reactivate them as current production realms.

## 02.2 Future realm-book rule

ART-03 is the current global realm-art authority.

A dedicated realm art sub-book should be created only when at least one of the following becomes true:

- one realm's asset roster is too large to remain maintainable here;
- production requires a realm-specific palette/material catalogue too detailed for ART-03;
- the realm gains multiple civilisation art libraries requiring separate control;
- a realm-specific procedural art system needs its own decision register;
- repeated production ambiguity proves the consolidated profile insufficient.

Any future realm-specific K/L-style documents remain subordinate to:

1. the realm's FCC canon;
2. ART-00;
3. ART-01;
4. ART-02;
5. ART-03.

---

# 03. Shared Environmental Composition Language

Leyforge environment art uses a **seven-layer composition stack**.

1. **Macro landform** — continent, basin, ridge, cliff, plateau, cavern horizon, floating mass, sea, stratum or equivalent realm-scale form.
2. **Biome structure** — vegetation density, terrain rhythm, water relationship, exposure, elevation and primary ecological pattern.
3. **Material truth** — geology, soil, wood, metal, fluid and other ART-02 material families.
4. **Ecological occupation** — flora, fungi, fauna traces, nests, grazing, cultivation, decomposition and local biological processes.
5. **Civilisation/infrastructure** — routes, walls, drainage, farms, docks, lifts, wards, machines, shrines, settlements and maintenance.
6. **State/history** — season, weather, damage, abandonment, occupation, restoration, war, corruption, flood, fire, blight or other supported persistent state.
7. **Focal wonder** — landmark, portal, dungeon, megaproject, authority territory, rare ecology, realm phenomenon or civilisation-scale visual anchor.

A scene should not attempt to make all seven layers equally loud.

## 03.1 Three environmental detail bands

Each view should use:

- **quiet fields** for terrain and visual rest;
- **informative bands** for ecology, routes, structures and material change;
- **focal anchors** for navigation, danger, interaction or wonder.

This inherits ART-01's visual-rest law.

## 03.2 Systemic evidence before decoration

Prefer environmental details that imply a real system:

- wheel ruts on an active route;
- soot around actual heat industry;
- dock wear where vessels berth;
- drainage around wet settlements;
- tether points in aerial communities;
- pressure seals in Deep structures;
- cooling channels in Ashen settlements;
- seasonal growth patterns in Verdant construction;
- route markers where navigation matters.

Decorative clutter that communicates no ecology, function, history, culture or route logic should remain subordinate.

---

# 04. Realm Signature Framework

Every current realm receives one **Realm Signature Profile** with eight art channels.

| Channel | Production question |
|---|---|
| Macro form | What large-scale geometry makes the realm recognisable? |
| Spatial law | What physical/spatial behaviour must be visually legible? |
| Material family | Which material relationships dominate without becoming palette swaps? |
| Ecology | What living or non-living occupation shapes the environment? |
| Atmosphere | What environmental mood/visibility/depth cues define traversal? |
| Civilisation | How do settlements solve the realm's practical constraints? |
| Wonder | What does the realm do that the Overworld normally cannot? |
| Anti-collapse rule | What lazy visual cliché would destroy the realm's identity? |

A realm identity is considered weak if it can be reduced to only one of:

- one hue;
- one fog colour;
- one particle effect;
- one architecture set;
- one material;
- one enemy type.

---

# 05. Overworld — Realm Visual Identity

## 05.1 Core visual proposition

The Overworld is the **materially grounded civilisation heart** of Leyforge.

Its visual role is not to be bland. It is to establish enough physical plausibility, ecological diversity and ordinary life that the other realms feel genuinely extraordinary by comparison.

Primary identity:

- continent-scale natural geography;
- continuous elevation;
- rivers, watersheds, coastlines and inland seas that visibly belong to terrain structure;
- broad climate and seasonal variation;
- materially believable geology;
- ordinary and magical ecology coexisting without turning every region into fantasy spectacle;
- dense civilisation possibility from temporary camps to magical metropolises;
- layered history, ruins, roads, trade and realm-contact sites;
- occasional skylands and extreme underground content that remain clearly Overworld.

## 05.2 Palette direction

The Overworld uses the broadest **natural-material spectrum** in the project.

Rules:

- ordinary regions should permit restrained greens, earths, stones, waters, woods, vegetation, snow, sand and regional mineral colour without one universal colour grade;
- biome palettes emerge from climate + material + ecology rather than a post-process tint;
- magical regions may introduce stronger accent families but should remain anchored to their substrate;
- seasonal shifts change vegetation, ground state, sky/atmosphere and civilisation behaviour without recolouring every block;
- the Overworld is the primary calibration realm for material truth under ordinary daylight.

## 05.3 Shape language

Overworld environmental geometry prefers:

- believable erosion and deposition at voxel scale;
- readable slopes, terraces, cliffs, river cuts and layered geology;
- strong tree and vegetation silhouettes;
- settlements that adapt to terrain rather than floating above a generic flat pad;
- route networks that reveal why settlements exist where they do;
- occasional monumental or magical form against quieter natural surroundings.

## 05.4 Anti-collapse rule

The Overworld must not become:

- generic medieval green countryside;
- uniformly bright fantasy wallpaper;
- twelve disconnected biome theme parks;
- a flat resource field decorated with trees;
- a visually inferior tutorial world whose purpose is only to lead to other realms.

---

# 06. Overworld — Biome-Family Art Grammar

Current Overworld surface canon uses a broad ordinary/natural biome architecture including these major surface families:

- Temperate Plains, Meadows, Heaths & Steppes;
- Temperate Forests & Woodlands;
- Boreal Forests, Taiga & Cold Woodlands;
- Tundra, Polar & Glacial Surface;
- Tropical & Subtropical Forests;
- Savannas, Seasonal Grasslands & Warm Scrub;
- Deserts, Drylands, Badlands & Salt Basins;
- Wetlands, Marshes, Bogs, Fens & Floodplains;
- Highlands, Mountains, Alpine & Plateau;
- Volcanic, Geothermal & Young-Land;
- plus inland-water, marine/coastal, aerial, underground and special-overlay environments owned by current canon.

## 06.1 Biome family ≠ colour theme

A biome family is expressed through combinations of:

- terrain profile;
- ground material;
- water behaviour;
- vegetation structure;
- canopy/open-space ratio;
- verticality;
- exposure;
- weather tendency;
- seasonal response;
- ecological traces;
- buildability;
- route style;
- settlement adaptation.

## 06.2 Base biome individuality

Within one family, base biomes should remain distinguishable through structure and ecology before palette.

Examples:

- a Sand Dune Sea and Stone Desert differ first in terrain form and substrate;
- Reed Marsh, Mire Bog, Peat Moor, Sedge Fen, Flooded Forest and Floodplain Wetland differ through hydrology, vegetation form and ground/water ratio;
- Mixed Broadleaf Forest, Ancient Oakwood, Mistwood and Evergreen Pinewood differ through canopy mass, trunk rhythm, floor visibility and environmental atmosphere;
- Basaltic Plateau, Ash Caldera, Lavafield Margin, Geothermal Springs, Obsidian Ridge, Pumice Barrens and Sulfur Flats differ through geology and active processes, not one red-orange volcanic tint.

## 06.3 Ecotones

Transitions should normally be visible across distance.

Preferred techniques:

- species mixing;
- ground-cover change;
- moisture gradients;
- soil/substrate change;
- slope/exposure change;
- tree-density shift;
- river/flood influence;
- weather visibility;
- settlement adaptation;
- transition-specific route materials.

Hard boundaries are reserved for real physical, magical, political or event causes.

---

# 07. Overworld — Marine, Sky and Underground Art Boundaries

## 07.1 Oceans and coasts

Oceans are full regions, not empty map edges.

Marine art direction should provide visible distinction among:

- coastal interface;
- shallow marine;
- pelagic/open water;
- deep marine;
- island/archipelago systems;
- transformed or realm-touched marine states where canon permits them.

Coasts should communicate wave/current exposure, sediment, vegetation, harbour suitability, storm history and human/non-human adaptation.

## 07.2 Overworld skylands

Overworld aerial regions may use:

- floating islands;
- cliffs;
- aerial fauna;
- wind infrastructure;
- rare sky settlements;
- weather events.

But they remain visually grounded in Overworld materials/ecology and must not use Ascendant Reach's full realm language.

## 07.3 Underground

The Overworld underground should feel like a connected world layer rather than a repeated cave room.

Art direction should reveal:

- local cave features;
- cave systems;
- larger cave provinces;
- deep routes;
- subterranean regions;
- settlement engineering;
- geological history;
- groundwater;
- ore/material provenance.

## 07.4 Deep Overworld boundary

Deep Overworld may become monumental and strange, but it must remain recognisable as finite Overworld geology.

It must not adopt Impossible Deep's pressure/gravity/world-cavern signature so strongly that the portal boundary becomes meaningless.

---

# 08. Overworld — Settlement Scale Art Ladder

The canonical capability ladder is:

**Camp → Hamlet → Village → Town → City → Capital → Magical Metropolis**

Art must communicate growth through **organisation, service capability, infrastructure and inhabited complexity**, not a universal material-upgrade ladder.

## 08.1 Camp

Visual traits:

- temporary or semi-temporary shelter;
- minimal permanent earthworks;
- central heat/water/storage logic;
- visible personal equipment;
- short route loops;
- improvised or portable boundaries.

## 08.2 Hamlet

Visual traits:

- first stable permanent anchors;
- clear household spaces;
- one or two shared work/service nodes;
- local food/storage identity;
- stronger paths;
- settlement edge still strongly mixed with landscape.

## 08.3 Village

Visual traits:

- multiple households and jobs;
- obvious public/gathering space;
- more reliable roads/drainage/storage;
- visible safety systems;
- repeated construction language with household variation;
- cultivated hinterland relationship.

## 08.4 Town

Visual traits:

- regional specialisation;
- stronger route/market/service hierarchy;
- workshops and storage becoming visible urban systems;
- denser mixed-use blocks or equivalent culturally appropriate organisation;
- more pronounced civic markers.

## 08.5 City

Visual traits:

- multiple functional districts without mandatory rigid zoning;
- skyline hierarchy;
- intermodal logistics;
- layered public works;
- district-to-district material/age differences;
- old and new construction visibly coexisting.

## 08.6 Capital

A Capital is visually distinguished by **administrative/civic centrality**, not simply bigger walls or more gold.

Possible visible signals:

- court/government/public record infrastructure;
- embassy/diplomatic spaces;
- major archives;
- ceremonial routes;
- regional transport convergence;
- culturally specific civic monuments.

## 08.7 Magical Metropolis

A Magical Metropolis should show city-scale magical capability through systems such as:

- mana distribution;
- transit;
- wards;
- magical industry;
- realm-contact infrastructure;
- disaster-control systems;
- large research/civic institutions;
- layered districts built across historical eras.

It must **not** default to “everything glows, all stone becomes white, all roofs become gold.”

---

# 09. Settlement Morphology Is Independent of Scale

The same capability scale may take radically different forms.

A Town may be:

- linear along a road;
- clustered around a bridge;
- terraced into a cliff;
- distributed through trees;
- stilted above water;
- built around a harbour;
- underground;
- mobile/convoy-like;
- radial around a market or shrine;
- modular around industrial infrastructure.

ART-03 therefore prohibits one universal Camp model, one universal Village layout and one universal City skyline.

The Forge should generate settlements from:

> **culture + environment + settlement archetype + capability + history/state + local material availability + route/infrastructure logic**

rather than from scale alone.

---

# 10. Overworld — Culture Art Layering Law

Current Overworld canon locks **twenty principal culture foundations**.

Culture may influence:

- construction technique;
- planning rhythm;
- roof/edge/entry treatment;
- public space;
- route markers;
- signage/script use;
- colour accents and dyes;
- ornament placement;
- workshop/stall design;
- clothing/equipment treatment;
- lighting;
- gardens/farming;
- storage/logistics;
- ritual/civic architecture;
- repair/maintenance style.

Culture does **not** replace:

- ancestry;
- body type;
- biome;
- material provenance;
- settlement archetype;
- faction;
- government;
- personal variation.

---

# 11. Overworld — Twenty Culture Visual Foundations

The following art profiles are production overlays derived from current culture canon. They are **direction families**, not fixed kits.

| Culture | Primary visual grammar | Infrastructure/public-space cue | Anti-collapse rule |
|---|---|---|---|
| Hearthland Commons | Practical timber-and-stone massing, garden edges, visible joinery, domestic warmth | mills, common halls, food storage, local festival spaces | not generic “default medieval village” |
| Marchroad Leagues | Linear route-facing buildings, fortified service nodes, durable signage | depots, bridgeworks, caravan yards, road shrines, signal towers | not every town a fortress |
| Emberhold Concords | Vaulted heavy forms, heat-safe masonry, exposed craft infrastructure | forge courts, vent towers, cooling/lava channels, shared workshops | not “all black rock + lava” |
| Moonroot Courts | Layered living/grafted forms, garden-space architecture, memory/season motifs | moon wells, root bridges, layered courts, ceremonial gardens | not generic elf architecture |
| Brassroot Communes | Dense modular construction, visible maintenance, repairable assemblies | public foundries, pipe/lift networks, salvage yards, shared workshops | not generic steampunk brass spam |
| Stormsteppe Confederacies | Portable/lightweight structural rhythm, wind-aware silhouettes, textile identity | corrals, route markers, wind towers, assembly spaces | not tents-only nomad stereotype |
| Tidesong Clans | Water-facing massing, elevated/floating structures, current-aware edges | docks, river gardens, fishery spaces, shellwork halls | not one blue coastal skin |
| Cloudward Freeholds | Terraced/anchored vertical forms, wind-breaking profiles, visible fall safety | hanging docks, beacons, wind bridges, rescue infrastructure | not Ascendant Reach imitation |
| Deepstone Compacts | Load-bearing arches, terracing, visible structural logic | rail galleries, cisterns, survey marks, ventilation/safety | not one dwarf-stone stereotype |
| Saltglass Caravan Cities | Shade-first massing, courtyard rhythm, fabric/glass accents | cisterns, caravan yards, route towers, markets | not “Arabian fantasy” pastiche |
| Mirelight Covenants | Raised/light-footprint construction, wetland-compatible materials | boardwalks, reed halls, boat homes, medicinal/lantern gardens | not swamp-witch caricature |
| Frosthearth Circles | Compact insulated masses, wind/snow shaping, shared-heat architecture | communal hearths, snow defence, preservation, covered routes | not all-ice architecture |
| Verdant Pact Enclaves | Grown/grafted structures integrated with normal material construction | seasonal rooms, pollen courts, living bridges, ecological interfaces | not a Verdant realm copy pasted into Overworld |
| Veilkeeper Houses | Memorial and archive cues integrated into inhabited buildings | courtyards, archive crypts, spirit lamps, guest spaces | not cemetery/gothic-only |
| Dreamweaver Cantons | Layered symbolic interiors, controlled patterning, sleep/privacy architecture | sleeping halls, mnemonic gardens, shifting galleries | not incoherent surrealism everywhere |
| Engine-Civic Assemblies | Legible modular frames, open maintenance access, civic machine integration | repair halls, public infrastructure, data/signal beacons | not machine culture = cold dystopia |
| Ashbound Contract Cities | Heat-adapted basalt/metal construction plus explicit civic record/contract cues | cooling channels, contract towers, shelters, witness spaces | not Ashen realm clone or demon city |
| Reefgarden Communes | Organic reef-integrated massing, current-flow openings, amphibious access | bubble chambers, current gates, nurseries, surface piers | not decorative coral alone |
| Starfall Scholarates | Observatory/measurement geometry, controlled hazardous-material spaces | specimen vaults, rune arrays, laboratories, observation platforms | not every building a wizard tower |
| Wayfarer Mosaic Settlements | Intentional layered coexistence of multiple construction traditions | shared markets, translation, adaptable civic/worship spaces | not random kitbash; hybridisation must show negotiated logic |

## 11.1 Cultural inheritance

An individual building may combine:

- local environment solution;
- settlement archetype;
- one dominant culture;
- one or more minority/diaspora influences;
- faction/government signage;
- age/history;
- imported materials.

The result should feel accumulated, not algorithmically “50% skin A + 50% skin B.”

---

# 12. Faction, Government and Occupation Overlays

Faction/government identity may visibly affect:

- banners/signage;
- checkpoints;
- public records;
- guard architecture;
- ownership marks;
- court/assembly layout;
- restricted areas;
- road control;
- repairs and maintenance priority;
- temporary military infrastructure;
- propaganda or public messaging;
- customs/quarantine spaces.

These overlays must remain subordinate to the underlying culture, settlement and material identity unless canon describes genuine forced transformation.

Occupation/conquest should often appear as **layering over existing architecture**, not instant replacement of the entire settlement kit.

---

# 13. Verdant Covenant — Realm Visual Identity

## 13.1 Core visual proposition

Verdant Covenant is a **living, politically responsive world** where ecology, season, promise, hospitality, territoriality and cultivation shape physical space.

Its art must communicate:

- enormous living scale;
- vegetation as active world structure rather than decoration;
- seasonal motion without universal recolouring;
- paths and settlements negotiated with living terrain;
- court/territory boundaries expressed through growth and maintenance;
- healthy decomposition distinct from blight;
- dream/root resonance in deep layers;
- Void corruption as foreign contamination.

## 13.2 Palette direction

Verdant uses a broad living spectrum anchored by:

- natural wood/bark/soil/stone truth;
- chlorophyll/leaf diversity;
- seasonal flower/pollen accents;
- moonlit/sap/bioluminescent accents where ecology supports them;
- restrained living-material emission.

It must not become one hyper-saturated green filter.

## 13.3 Shape language

Preferred macro forms:

- layered canopies;
- enormous root arches;
- living bridges;
- river-grown infrastructure;
- hedge/territory walls;
- cultivated clearings;
- root-depth networks;
- seasonal convergence structures.

Architecture should appear **grown with intention**, not randomly tangled.

## 13.4 Anti-collapse rule

Verdant must not become:

- generic enchanted forest;
- giant green jungle everywhere;
- “elf realm” architecture;
- healthy decay rendered as corruption;
- purple rot as shorthand for Void.

---

# 14. Verdant Covenant — Biome Art Profiles

| Biome | Primary visual read |
|---|---|
| Sunlit Canopy | colossal vertical forest abundance, multi-level crowns, living bridges, filtered pollen/light shafts, clear high/low habitat layers |
| Moonroot Groves | huge root arches, lower-light lunar/memory resonance, deliberate route markers, quieter reflective spaces |
| Pollenwild Meadows | large open floral fields, wind/season movement, pollinator scale, mobile cultural use, colour through ecology rather than painted ground |
| Living Riverlands | semi-living hydrology, wetland infrastructure, natural docks/reeds, banks visibly adapting to water and habitation |
| Thorn-Court Marches | territorial hedges, hunting lanes, defensive growth, boundary legibility, court infrastructure integrated with landscape control |
| Rotwilds | decomposition, fungal succession, deadfall and ecological imbalance; healthy decay, blight and Void corruption must remain separable |
| Seasonal Nexus | moving/converging seasonal territories around a strong central organising heart; transitions readable in ecology and weather, not quadrants painted four colours |
| Dreaming Root Depths | immense subterranean root networks, orientation cues tied to root direction, dream resonance, hidden settlements and route depth |

---

# 15. Verdant Covenant — Civilisation and State Art

Verdant civilisation should reveal:

- negotiated coexistence with living terrain;
- seasonal courts and political territory;
- grafting rather than unlimited organic randomness;
- root/water infrastructure;
- cultivation;
- ritual/hospitality spaces;
- public boundaries;
- repair/restoration as regrowth and stewardship.

Mandatory state separation:

1. healthy living Verdant content;
2. healthy natural decay;
3. ecological/magical blight;
4. Void corruption;
5. restoration/recovery.

This separation must survive reduced particles and non-colour cues.

---

# 16. Ancestral Veil — Realm Visual Identity

## 16.1 Core visual proposition

The Ancestral Veil is a **living, inhabited, materially diverse realm of memory, identity, history and spirit-active matter**.

It is not an afterlife wallpaper and must never collapse into “grey cemetery + translucent blue ghosts.”

Art must distinguish:

- native ecology versus undead imagery;
- physical, semi-corporeal and incorporeal existence;
- historical reflection versus dream imagery;
- memorial culture versus horror;
- Necropolis polity/state versus automatic evil;
- native instability versus Void corruption;
- remembrance, dispute, loss, reconstruction and restoration.

## 16.2 Palette direction

The Veil may use:

- mineral pale/dark ranges;
- weathered stone;
- fibre, silk, timber and ceramic colour;
- low-chroma atmospheric zones;
- selective warm hearth/memorial light;
- spirit-active accents;
- aquatic biomineral accents.

But it must retain enough material colour to feel inhabited and materially real.

## 16.3 Shape language

Key forms include:

- processional routes/causeways;
- memorial civic architecture;
- orchards;
- ferries/waterways;
- reflective/reconstructed urban fragments;
- archive spaces;
- sovereign precincts;
- low-anchor dark regions.

## 16.4 Anti-collapse rule

Prohibited shortcuts:

- every building gothic;
- skulls as universal ornament;
- every spirit blue/transparent;
- every Necropolis hostile;
- every archive made of glowing glass;
- Predator Dark represented as generic Void.

---

# 17. Ancestral Veil — Biome Art Profiles

| Biome | Primary visual read |
|---|---|
| Echoing Hearthlands | inhabited reflective landscapes, hearth/memory anchors, ordinary living-space cues, stable material presence |
| Processional Roads | long route systems, causeways, stations, markers, direction and recognition infrastructure |
| Memory Sea | real aquatic scale/ecology plus memory/echo atmosphere; not an ocean of literal souls |
| Ossuary Orchards | pale/bone-like mineral/botanical forms without corpse-tree imagery; cultivated ecology and settlement relationship |
| Mourning Mists | atmospheric memory/grief pressure with navigation and silhouette cues; emotion without monetised “grief energy” visuals |
| Forgotten City Reflections | partial/reconstructed urban layers, contradictory eras, missing/returned elements, inhabited reflective continuity |
| Predator Dark | native low-anchor predatory ecology, strong absence/route contrast, recognisable as native rather than Void |
| Crownlands of the Remembered | stronger identity/sovereignty, elevated civic/ceremonial structure, remembered authority without generic heavenly aesthetics |

---

# 18. Ancestral Veil — Architecture and State Art

Architecture must support multiple civilisation identities using:

- construction technique;
- record/name motifs;
- memorial courtyards;
- route markers;
- market form;
- orchards;
- water infrastructure;
- lighting;
- embodiment technology;
- civic archives;
- culturally distinct housing.

State art must keep separable:

- memory fading;
- memory dispute;
- reconstruction;
- identity instability;
- route loss;
- Mourning Mist;
- Devouring Silence;
- Predator Dark;
- boundary instability;
- Necropolis malfunction;
- Void corruption;
- cleansing;
- stabilisation;
- restoration.

---

# 19. Somnolent Expanse — Realm Visual Identity

## 19.1 Core visual proposition

Somnolent Expanse is a **physically inhabitable persistent dream realm** whose reality may be mutable, symbolic, beautiful and frightening without making “dark” synonymous with “corrupt.”

Art must communicate:

- network continuity;
- coherence versus mutability;
- persistent civilisations;
- Dreamwater;
- symbolic matter;
- prophecy as possibility rather than certainty;
- natural nightmare ecology;
- waking/dream-law tension;
- Deep Dream depth;
- Void contamination as distinct foreign influence.

## 19.2 Palette direction

Somnolent may use stronger symbolic colour relationships than the Overworld, but colour should behave as **meaningful local dream logic**, not random psychedelic noise.

Rules:

- stable coherent regions retain controlled material families;
- symbolic accents may vary by local concept/emotion;
- nightmare regions may become threatening without universal black/red treatment;
- Deep Dream may become sparse/abstract without becoming Void-coded;
- Waking-like regions should feel structurally more conventional rather than simply desaturated.

## 19.3 Shape language

Somnolent permits the widest controlled variation in:

- horizon logic;
- repeated/overlapping architecture;
- symbolic landforms;
- route continuity;
- incomplete edges;
- dream/waking fracture geometry.

But persistent regions must remain navigable and reproducible.

## 19.4 Anti-collapse rule

Somnolent must not become:

- random non-Euclidean noise;
- one purple dream shader;
- “nightmare = corruption”;
- constantly shifting geometry that destroys player memory;
- surreal imagery with no route/ecology/civilisation function.

---

# 20. Somnolent Expanse — Biome Art Profiles

| Biome | Primary visual read |
|---|---|
| Lucid Shores | stable Dreamwater, clear horizons, arrival/navigation anchors, clean but still dream-native material relationships |
| Reverie Gardens | deliberate cultivation, symbolic abundance, art/Emotion Bloom/Reverie Tree relationships, controlled beauty |
| Memory Cities | overlapping eras, reconstructed civic fabric, disputed memory, inhabited urban continuity |
| Prophecy Dunes | exposed possible-future imagery, shifting but bounded route cues, probability/omen structure rather than fixed prophecy |
| Nightmare Thickets | native fear ecology, looping/threatening route grammar, Nightmare Thorn and pressure cues, distinct from Void |
| Sleepwalker Roads | persistent network travel, route markers, caravan infrastructure, mutable but readable connectivity |
| Shattered Waking Isles | competing dream/waking-like rules, fracture scars, more conventional infrastructure, Waking Stone identity |
| Deep Dream Abyss | low coherence, sparse/ancient symbolic formations, concept suppression, deep layers; explicitly not Void |

---

# 21. Somnolent Expanse — Civilisation and State Art

Architecture must support:

- Dream Walkers;
- Oracle Schools;
- Nightmare Wardens;
- Memory Traders;
- Shared-Dream cultures;
- Nightmare societies;
- migrant/visitor/mixed communities.

Imported structures must visibly adapt to:

- local coherence;
- Dream Soil/stone/materials;
- route stability;
- sleep/privacy needs;
- dream/waking boundary conditions.

Mandatory state separation:

1. healthy natural nightmare;
2. runaway Nightmare Front;
3. low coherence;
4. fragmenting/dissolving;
5. Waking Fracture;
6. Deep-Dream influence;
7. prophecy state;
8. memory overlay;
9. Void corruption;
10. stabilising/cleansing/restoring state.

---

# 22. Ascendant Reach — Realm Visual Identity

## 22.1 Core visual proposition

Ascendant Reach is a **continuous vertically structured sky realm** combining floating terrain, Windways, storm oceans, dangerous High Aether and increasingly divine upper territories.

It must support both practical sky civilisation and sacred/institutional regions without collapsing them into one “heaven” aesthetic.

Art must communicate:

- altitude;
- air exposure;
- wind-route geography;
- floating mass and undersides;
- storm systems;
- gravity variation;
- sacred/domain law;
- settlement anchoring;
- traversal risk;
- vertical progression.

## 22.2 Palette direction

Ascendant uses strong atmospheric depth and high-contrast weather relationships.

Possible families include:

- ordinary sky/stone/wood/metal in lower regions;
- stormglass/lightning accents in storm regions;
- high-aether pale/cold/high-radiance spaces;
- culturally variable sacred accents;
- limited celestial metal/glass/crystal emphasis where canon supports it.

It must not become white marble + gold + blue sky everywhere.

## 22.3 Shape language

Key forms:

- floating plateaus/archipelagos;
- underside cliffs and hanging geology;
- Windways as visible route geography;
- tether/anchor infrastructure;
- vertical ports;
- storm collectors;
- pressure/air shelter;
- pilgrimage routes;
- law/domain precincts.

## 22.4 Anti-collapse rule

Ascendant must not become:

- generic Greco-Roman heaven;
- angel-wing motif spam;
- generic steampunk floating islands;
- all-white/all-gold sacred architecture;
- one cloud biome repeated vertically.

---

# 23. Ascendant Reach — Twelve Biome Art Profiles

| Biome | Primary visual read |
|---|---|
| Cloudgrass Plateaus | habitable open floating land, wind-shaped grass/ecology, practical settlement foundation |
| Stormglass Archipelagos | storm-worked islands, glass/mineral weather products, strong lightning/exposure structure |
| Thunderhead Seas | cloud-fluid/ocean-scale weather mass with navigation depth and storm route logic |
| Aerial Kelp Fields | suspended/aerial ecology shaped by current flow and vertical harvesting/traversal |
| Skyforge Calderas | heat/industry/geology in floating volcanic forms, strong vent/forge infrastructure |
| Fallen Continent Undersides | immense inverted cliffs/undersides, hanging ecosystems, difficult anchoring, old structural history |
| High Silence Expanse | sparse extreme-altitude scale, low shelter, intense exposure, minimal visual clutter and strong navigation anchors |
| Pilgrim Thresholds | route convergence, ascent preparation, sanctuary/ritual infrastructure, culturally diverse pilgrimage layers |
| Law Gardens | bounded sacred-domain landscaping, rule readability through spatial organisation rather than generic glow |
| Radiant Tribunal Cities | dense institutional/civic sacred architecture, archives/courts/public order, not universal marble |
| War-Saint Fields | contested sacred/military landscape, fortifications, memorial and campaign history, saint-linked aftermath |
| Concordant Firmament | upper realm-scale sacred convergence, large spatial order, authority/sky phenomena without dissolving voxel readability |

Windways, Mercy Wells, Archive of Oaths sites and Abandoned Sanctum states remain subordinate systems rather than extra biomes.

---

# 24. Ascendant Reach — Civilisation and State Art

Art must support visual differentiation among:

- Freeholds;
- Airship Leagues;
- vessel cultures;
- Storm Monasteries;
- industrial guild communities;
- agrarian sky communities;
- Underside Communities;
- Pilgrimage Republics;
- Temple Polities;
- Covenant Courts;
- Celestial Bureaucracies;
- exiles;
- neutral custodians;
- mixed settlements.

Useful differentiation channels include:

- anchor design;
- sails;
- route markers;
- roof/aerodynamic treatment;
- clothing/signage;
- guild marks;
- religious/public symbols;
- court regalia;
- garden design;
- High-Aether sealing technology.

Regional-state art must distinguish:

- Clear Current;
- Stormfront;
- Gravity Drift;
- Migration Tide;
- High-Aether Surge;
- Pilgrimage Convergence;
- Concord Tension;
- Void-Corrupted State.

These must not all become differently coloured fog.

---

# 25. Impossible Deep — Realm Visual Identity

## 25.1 Core visual proposition

Impossible Deep is a **separate vast subterranean realm** whose identity comes from world-cavern scale, pressure, gravity, deep fluids, geological history, fossil continents and specialised civilisations.

The realm should feel so large that “underground” stops meaning “small enclosed cave.”

Art must communicate:

- world-scale caverns;
- horizon-like subterranean distance;
- enormous ceilings and voids;
- pressure engineering;
- gravity variation;
- Vault-Seas/Blackwater;
- seismic history;
- fossil-scale structures;
- ecological adaptation;
- deep route infrastructure.

## 25.2 Palette direction

The Deep should not be globally black/blue.

Material colour comes from:

- Pressure Stone facies;
- mineral seams;
- Ventglass;
- Emberbone;
- Seismic Crystal;
- Resonance Wood;
- Blackwater/brine;
- local biology;
- settlement lighting;
- geothermal/seismic regions.

Darkness is a spatial condition, not the realm's only palette.

## 25.3 Shape language

Key forms:

- cavern horizons;
- inverted terrain;
- massive fossil bodies/continents;
- pressure terraces;
- deep locks/seals;
- gravity-conditioned architecture;
- long vertical and lateral infrastructure;
- huge sea chambers;
- seismic forests and chasms.

## 25.4 Anti-collapse rule

Impossible Deep must not become:

- Overworld cave biome with larger crystals;
- universal bioluminescent blue cave;
- generic alien cave;
- one civilisation style;
- unrestricted non-Euclidean geometry with no gravity cues.

---

# 26. Impossible Deep — Eight Biome Art Profiles

| Biome | Primary visual read |
|---|---|
| Pressure Gardens | cultivated/native high-pressure ecology, compressed-growth forms, visible engineering/ecological adaptation |
| Inverted Caverns | gravity-conditioned surfaces and settlements, orientation made readable through debris/fluid/flora/architecture cues |
| Seismic Forests | stone-organic/Resonance Wood ecology, movement/stress history, fracture and root-like structural rhythm |
| Blackwater Vault-Seas | immense enclosed seas, pressure depth, sparse horizon markers, real aquatic ecology and built locks/ports |
| Emberbone Forges | heat/geology/industry with Bone Stone → Emberbone lineage, specialised forge settlement logic |
| Gravity Wells | strong local gravity change expressed through terrain, flow, vegetation, debris and engineering rather than HUD alone |
| Fossil Metropolises | civilisation/fossil megastructure layering, diverse origins, archaeology integrated with current occupation |
| Coreward Chasms | extreme fractures, depth, seismic/thermal intensity, sparse but powerful route and survival infrastructure |

---

# 27. Impossible Deep — Civilisation and State Art

Deep civilisation must communicate diversity rather than one “underground people” kit.

All settlements should visibly solve local problems such as:

- pressure;
- gravity;
- ventilation;
- fluid isolation;
- seismic safety;
- anchoring;
- vertical logistics;
- local food/ecology;
- illumination;
- long-range route marking.

Regional states should be visible through environment behaviour and infrastructure response, not UI alone.

Pressure Stone states must read as related facies/states rather than unrelated fantasy materials.

---

# 28. Ashen Lower Realms — Realm Visual Identity

## 28.1 Core visual proposition

Ashen Lower Realms is a **nine-stratum infernal civilisation realm** shaped by heat, ash, industry, contract, war, hunger ecology, vertical infrastructure, refuge and political history.

It is not “hell = red cave full of demons.”

Art must communicate:

- inhabitable infernal civilisation;
- heat and cooling infrastructure;
- ash as real environmental material;
- industrial scale;
- law/contract/jurisdiction;
- agriculture and food systems;
- refuge and safe zones;
- political variation;
- historical layering;
- depth escalation without palette-swap floors.

## 28.2 Palette direction

Ashen uses:

- basalt and mineral darks;
- ash greys/earths;
- ember/heat accents;
- metals/glass with lineage-specific colour;
- cooling/water/refuge contrast;
- biological Cinderwood/Cinderhide states;
- Sootglass/cultivation accents.

Not every region should be red/orange, and darkness must not imply Void corruption.

## 28.3 Shape language

Key forms:

- volcanic/industrial terraces;
- heat channels;
- cooling infrastructure;
- fortress/contract civic works;
- Cinder-Sea ports;
- chain/lift systems;
- prison/route structures;
- huge Furnace-Crown works;
- reused ruins and refugee adaptation.

## 28.4 Anti-collapse rule

Ashen must not become:

- red Nether-like cavern skin;
- all spikes/chains/skulls;
- one demon architecture;
- one evil culture;
- nine colour-coded dungeon floors;
- generic corruption darkness.

---

# 29. Ashen Lower Realms — Nine-Stratum Art Grammar

Current strata are:

1. **Ashen Frontier** — frontier survival, trade, cooling refuge and accessible industry.
2. **War Marches** — moving borders, siege logistics, military roads and war industry.
3. **Contract Realms** — courts, commerce, ownership records and elite civic infrastructure.
4. **Chain Depths** — vertical terrain, prison/lift infrastructure, coercion and liberation routes.
5. **Hunger Deeps** — appetite ecology, food-security pressure and consumption-linked terrain.
6. **Ruin Hollows** — exhausted industry, cooled ruins, salvage, refuge and reoccupation.
7. **Ambition Realms** — expanding powers, elite competition and aggressive major infrastructure.
8. **Dominion Realms** — established great powers, old sovereign works and territorial scale.
9. **Furnace Crown** — deepest ordinary stratum, extreme industry, ancient powers and realm-climax infrastructure.

Strata must be differentiated through combinations of:

- environmental intensity;
- geology;
- infrastructure;
- settlement form;
- political ownership;
- route type;
- history;
- industry;
- hazard profile.

One stratum = one colour is prohibited.

---

# 30. Ashen Lower Realms — Eight Biome Art Profiles

| Biome | Primary visual read |
|---|---|
| Ember Marches | mobile conflict/frontier pressure, heated land, military/trade routes and adaptable settlement edges |
| Red Ledger Dominion | legal/administrative/ownership landscape, contract infrastructure, dense civic-industrial control |
| Cinder Seas | distinct particulate/thermal medium, ports, navigation, extraction and settlement adaptation |
| Hunger Pits | appetite ecology and food infrastructure, living/industrial consumption systems without generic gore |
| War-Furnace Barrens | industrial war terrain, furnaces, logistics, slag and repair history at large scale |
| Sootglass Gardens | cultivated symbiotic glass/biology, controlled growth, elite/industrial garden infrastructure |
| Chainwind Heights | strong vertical wind/route/prison/lift language, bridges and safety/escape systems |
| Black Ember Hollows | cooler/refuge/reoccupation spaces, dark ember identity, old hollows and survival infrastructure |

Biome recurrence across strata is expected; stratum context changes how the biome is expressed.

---

# 31. Ashen Lower Realms — Civilisation and State Art

Civilisation art must communicate differences among, for example:

- Ledger City civic/contract systems;
- War State fortress systems;
- Freedfolk Refuge adaptation;
- Crown Works industrial scale;
- mixed-ancestry ordinary settlements;
- port/Chainwind/food-production communities.

Architecture differentiates through:

- function;
- culture;
- history;
- infrastructure;
- materials;
- politics.

Critical readable environment states include:

- dangerous heat;
- safe cooling;
- ash toxicity;
- route/jurisdiction status;
- refuge;
- contract interaction zones;
- Void corruption;
- event warnings.

Colour alone is insufficient.

---

# 32. Cross-Realm Separation Law

Current realms must remain visually separable even when they share:

- similar materials;
- forests;
- volcanic terrain;
- cities;
- sky content;
- underground content;
- dream/memory themes;
- sacred content;
- corruption.

## 32.1 Shared concept, different grammar

Examples:

- **forest:** Overworld forest = ordinary ecology; Verdant forest = living-law/ecological agency; Somnolent garden/thicket = dream-symbolic ecology.
- **sky:** Overworld skyland = rare aerial Overworld geography; Ascendant Reach = realm-scale vertical sky topology and Windway civilisation.
- **deep:** Deep Overworld = finite geology; Impossible Deep = separate world-cavern/pressure/gravity realm.
- **volcanic:** Overworld volcanic = geology; Ashen = infernal civilisation/stratum/industry/contract ecology.
- **memory:** Veil = identity/history/spirit-active matter; Somnolent = dream/memory reconstruction within dream law.
- **darkness:** may indicate ordinary night, cave, Predator Dark, nightmare, Deep low-light or Ashen soot; none automatically means Void.

---

# 33. Portal Environment Art Direction

ART-03 owns environmental context and arrival/readability; ART-06 later owns detailed VFX behaviour.

## 33.1 Portal principles

Each portal environment should communicate:

- which realm family it belongs to;
- whether it is inactive, assembling, stable, damaged, blocked or corrupted where canon supports those states;
- how local infrastructure stabilises/uses it;
- what nearby settlement/authority relationship exists;
- safe approach and interaction zone;
- destination influence without replacing the local realm's environment.

## 33.2 Portal-family separation

- Covenant Portal should integrate living/seasonal/binding materials and environmental response.
- Veilgate should communicate recognition/memory/route transition without generic grave imagery.
- Dreamgate should communicate stable dream access, coherence and waking/dream boundary.
- Ascension Gate should be vertically/upward oriented and increasingly aetheric toward threshold while remaining structurally grounded below.
- Deepgate should communicate pressure/depth/separation, not “a cave tunnel.”
- Ashgate should communicate Ashen heat/contract/realm infrastructure rather than generic lava portal language.

No current portal should visually collapse into a generic Ancient Portal Frame, Void rift or one universal glowing rectangle.

---

# 34. Biome Composition Contract

Every authored/generative biome visual profile must define at minimum:

| Field | Requirement |
|---|---|
| Macro terrain | dominant elevation/landform rhythm |
| Ground/substrate | canonical Material DNA families |
| Vertical structure | canopy, cliffs, roots, buildings, cavern ceiling, floating mass etc. |
| Water/fluid relationship | none, seasonal, river, marsh, sea, Dreamwater, Blackwater, Cinder-Sea etc. |
| Flora/fungi | density, silhouette families, layering and growth pattern |
| Fauna traces | nests, tracks, grazing, burrows, migration, pollination etc. |
| Atmosphere | visibility/depth/weather tendency without exact ART-06 implementation |
| Route grammar | how players/NPCs naturally move through the biome |
| Settlement adaptation | foundation, shelter, logistics and hazard response |
| Resource readability | how resource geography is hinted without UI labels |
| Hazard readability | environmental cues and non-colour telegraphing |
| Quiet/detail/focal bands | composition hierarchy |
| State overlays | supported season/event/damage/corruption/restoration states |
| Transition grammar | how it meets adjacent biomes |
| Golden reference | required reference scene when promoted to production |

---

# 35. Ecotone and Transition Law

Transitions are first-class environment art.

## 35.1 Ordinary ecotones

Use gradual mixing of:

- terrain shape;
- substrate;
- moisture;
- vegetation;
- canopy/open space;
- water;
- wind/exposure;
- route treatment;
- settlement adaptation.

## 35.2 Abrupt boundaries

Abrupt transitions require a reason such as:

- cliff/fault;
- coastline;
- hard hydrological boundary;
- political fortification;
- magical law;
- realm threshold;
- corruption front;
- disaster/event state;
- authored structure.

## 35.3 No checkerboard biome generation

At ordinary gameplay scale, biome composition should avoid small noisy patchwork where every few chunks change theme.

Large-scale identity should survive travel, mapping and skyline reading.

---

# 36. Terrain, Geology and Flora Composition

## 36.1 Terrain tells formation history

Terrain should imply processes where canon supports them:

- erosion;
- deposition;
- faulting;
- volcanic formation;
- glaciation;
- floodplain growth;
- living growth;
- dream coherence;
- pressure/gravity deformation;
- Ashen industrial excavation.

## 36.2 Flora follows habitat

Vegetation should respond to:

- substrate;
- moisture;
- temperature;
- light;
- elevation;
- pressure;
- salinity;
- magical law;
- cultivation;
- disturbance.

Random decorative plant scattering should not substitute for ecology.

## 36.3 Edge density

Important traversal edges should remain readable:

- cliff lips;
- shorelines;
- water depth changes;
- paths;
- doors/entrances;
- cave mouths;
- settlement borders;
- route markers;
- dangerous ground.

---

# 37. Architecture Composition Law

Architecture must reveal **how it stands up, how it is entered, how it is maintained and what it is for**.

## 37.1 Mass before façade

A building should read through:

1. footprint;
2. main mass;
3. roof/upper termination;
4. entrance;
5. function silhouette;
6. material construction;
7. culture details;
8. wear/occupation.

Do not attempt to rescue weak massing with façade texture noise.

## 37.2 Functional form

Visible architecture may need to communicate:

- ventilation;
- drainage;
- heat management;
- pressure sealing;
- wind loading;
- anchoring;
- defence;
- storage;
- water access;
- animal/vehicle access;
- cargo flow;
- magical containment;
- ritual/public use.

## 37.3 Built history

Settlements should contain a believable mix of:

- oldest surviving fabric;
- ordinary maintained buildings;
- additions/extensions;
- repairs;
- new construction;
- abandoned/reused structures;
- infrastructure retrofits.

Perfectly uniform new-build cities should be rare unless canon explicitly supports them.

---

# 38. Culture, Environment and Function Combination Matrix

A final building is not selected from a single culture kit.

The preferred resolution order is:

1. canonical building/structure function;
2. realm/environment survival constraints;
3. local material availability/provenance;
4. culture construction grammar;
5. settlement scale/archetype;
6. faction/government/ownership overlay;
7. age/history/state;
8. personal/household variation where relevant.

This order prevents:

- culture from overriding structural necessity;
- biome from determining culture;
- faction skins from replacing architecture;
- one material set from forcing one culture identity.

---

# 39. Settlement District and Skyline Grammar

Large settlements should be understandable from distance.

## 39.1 Skyline hierarchy

Use combinations of:

- terrain anchors;
- civic/ritual landmarks;
- industrial stacks/towers;
- walls/gates;
- docks/masts;
- wind/anchor towers;
- major trees/grown structures;
- archives/courts;
- mana infrastructure;
- transport hubs.

## 39.2 District identity

Districts may differ through:

- function;
- age;
- street/route width;
- density;
- building height/mass;
- material mix;
- signage;
- infrastructure;
- public-space form;
- noise/VFX/audio later handled by ART-06/07.

Do not force a rigid colour-coded district model.

---

# 40. Ruins, Dungeons, Sites and Environmental Storytelling

## 40.1 Ruin ≠ broken random structure

A ruin should preserve enough original logic to infer:

- original function;
- construction period/culture;
- damage/abandonment cause where known;
- later reuse;
- environmental response;
- current occupation.

## 40.2 Dungeon environmental grammar

Dungeon family identity should be built from:

- topology;
- route rhythm;
- function/history;
- material family;
- occupation;
- hazard;
- state;
- landmark hierarchy.

Not every dungeon needs a unique global palette.

## 40.3 Persistent aftermath

When gameplay canon preserves consequences, art should preserve them where practical:

- damaged walls;
- repairs;
- changed ownership;
- burned/cleared vegetation;
- abandoned machinery;
- new barricades;
- memorials;
- restored ecosystems;
- changed route use.

---

# 41. Landmark and Navigation Art Law

Important navigation content should be recognisable by:

- silhouette;
- skyline position;
- approach composition;
- material contrast;
- route convergence;
- surrounding visual rest;
- scale;
- local environmental response.

Landmarks should not rely only on bright colour or giant UI markers.

## 41.1 Landmark tiers

Suggested art tiers:

- local route marker;
- settlement landmark;
- regional landmark;
- realm landmark;
- world-scale/titan/wonder anchor.

Each tier escalates primarily through spatial importance and silhouette, not particle count.

---

# 42. Atmosphere and Lighting Environment Direction

ART-03 defines environment intent; ART-06 will define detailed lighting/VFX production.

## 42.1 Atmosphere supports depth

Atmosphere may communicate:

- humidity;
- dust/ash;
- altitude;
- pressure;
- storm distance;
- dream coherence;
- Veil memory state;
- deep cavern scale;
- seasonal weather;
- pollution/industry.

It must not erase key silhouettes or block edges at normal gameplay distance.

## 42.2 Darkness

Dark regions may be genuinely threatening, but required interaction should remain discoverable through:

- edge/value separation;
- local lights;
- material response;
- route markers;
- silhouette;
- audio later under ART-07;
- accessible settings.

## 42.3 Emission economy

Environment-scale emission should remain rare enough to retain meaning.

A whole realm should not glow merely because it is magical.

---

# 43. Historical Layering and World Memory

Leyforge worlds are persistent histories.

Environment art should support visible accumulation of:

- old roads beneath new roads;
- abandoned foundations;
- repaired raid/war damage;
- settlement expansion;
- changing land use;
- old industrial scars;
- reclaimed ruins;
- former borders;
- realm-contact infrastructure;
- memorials;
- pollution or restoration;
- disaster aftermath.

Restoration does not always mean returning to an untouched initial state.

A repaired or transformed place may become a new stable historical layer.

---

# 44. Imported and Cross-Realm Architecture

Cross-realm contact should produce **adapted hybrid construction**, not asset teleportation without context.

Examples:

- an Overworld embassy in Verdant should use imported construction logic adapted to living terrain and local materials;
- an Ashen-contact enclave in the Overworld may use cooling/contract architecture without making the whole district physically Ashen;
- a Veilkeeper structure in Overworld may use memory/record motifs while remaining Overworld material construction;
- Ascendant visitors in an Overworld port may add anchor/aerial infrastructure without transforming the sky into Ascendant Reach.

## 44.1 Imported material visibility

Imported materials should be visibly scarce or purposeful where economy/provenance supports that interpretation.

Do not silently make rare realm materials the default local construction substrate.

---

# 45. Procedural Region Variation

World generation should create **families of places**, not repeated screenshots.

Variation may use:

- macro terrain seed;
- local material distribution;
- vegetation mix;
- weather exposure;
- route relationship;
- settlement history;
- culture mix;
- structure age;
- state overlays;
- prop distribution;
- silhouette arrangement.

## 45.1 Controlled identity

Variation must preserve:

- realm signature;
- biome family;
- material truth;
- culture grammar;
- functional readability.

## 45.2 No random-style roulette

A procedural seed may change layout and local expression.

It must not randomly choose unrelated visual styles for the same canonical culture/biome/material family.

---

# 46. Accessibility and Scalable World Art

Low-end/accessibility modes may reduce:

- distant vegetation density;
- non-critical particles;
- secondary atmospheric layers;
- decorative props;
- shadow range;
- reflection complexity;
- minor animated environment elements;
- secondary decals.

They must preserve:

- biome/realm identity;
- route readability;
- major silhouettes;
- hazards;
- entrances;
- settlement function;
- state distinctions;
- portal family;
- critical ecology/infrastructure cues.

## 46.1 Colour independence

Critical differences should use combinations of:

- form;
- motion;
- pattern;
- material;
- signage;
- environmental behaviour;
- value;
- sound later under ART-07;
- UI support later under ART-08.

---

# 47. Codex / Agent Environment Decision Envelope

## 47.1 Codex may autonomously decide

Within locked canon and ART rules, Codex may:

- choose among approved composition arrangements;
- select deterministic vegetation/prop distribution;
- vary roof/edge/detail combinations within a culture family;
- adapt a building footprint to terrain while preserving function;
- combine approved culture and environment layers;
- choose quiet/informative/focal scene balance;
- select approved material variants;
- generate bounded settlement/biome variants;
- create non-canonical decorative details that do not imply new gameplay meaning.

## 47.2 Codex must escalate

Codex must not silently invent:

- a new realm;
- a new biome family;
- a new culture identity;
- a new settlement scale;
- a new canonical material;
- a new portal family;
- a new realm law;
- a new culture-to-ancestry rule;
- a new architecture system that changes gameplay footprint/collision beyond existing authority;
- a new persistent environmental state;
- a new realm transition/access method;
- a new visual shorthand that contradicts semantic canon.

## 47.3 Uncertainty classification

When uncertain, Codex should label the issue as one of:

- missing content canon;
- missing ART direction;
- missing technical capability;
- local production choice;
- validation ambiguity.

Then route it under ART-00 rather than inventing hidden canon.

---

# 48. World/Realm Art Profile Data Contract

The Forge/Brain should eventually expose a structured profile for each realm/biome/culture environment family.

Recommended fields:

```text
stable_id
canonical_name
authority_refs
realm_id
biome_family_id (if applicable)
culture_ids (0..n)
settlement_archetype_id (optional)
macro_form_tags
spatial_law_tags
material_profile_refs
palette_context_profile
flora_profile_refs
fauna_trace_profile_refs
atmosphere_profile
route_grammar
architecture_grammar
infrastructure_grammar
quiet_detail_focal_ratios
landmark_rules
state_overlay_refs
hazard_readability_rules
transition_rules
low_end_fallback_rules
accessibility_rules
golden_reference_refs
validation_profile
production_status
```

This is an art-facing conceptual contract. Exact schema implementation belongs downstream.

---

# 49. Golden Environment Reference Programme

Before broad autonomous world-art production, ART-10 should certify at least these scenes:

1. **Overworld ordinary forest-to-settlement edge** — proves ordinary baseline, ecotone, road, agriculture and inhabited materials.
2. **Overworld wetland or coast settlement** — proves hydrology-adapted construction.
3. **Overworld underground hall/deep route** — proves subterranean readability without becoming Impossible Deep.
4. **Verdant Sunlit Canopy / Court edge** — proves living scale + civilisation + material inheritance.
5. **Verdant Rotwild state board** — healthy decay vs blight vs Void corruption vs restoration.
6. **Ancestral Processional Road / Hearthland** — proves inhabited Veil beyond grave cliché.
7. **Ancestral state board** — memory fading/dispute/Predator Dark/Void/restoration separation.
8. **Somnolent Lucid Shore → mutable region transition** — proves dream mutability with persistent navigation.
9. **Somnolent Nightmare state board** — natural nightmare vs runaway pressure vs Void.
10. **Ascendant vertical settlement/Windway scene** — proves altitude, anchoring and sky civilisation.
11. **Impossible Deep world-cavern settlement vista** — proves scale, pressure/gravity and horizon.
12. **Ashen Frontier ordinary settlement** — proves inhabitable infernal civilisation.
13. **Ashen stratum comparison board** — proves nine-stratum difference without colour-swapped floors.
14. **Cross-realm portal environment board** — proves all six portal families remain distinct.
15. **Culture comparison street** — same function/material availability rendered under at least four Overworld cultures to prove culture is more than recolour.
16. **Settlement capability ladder board** — Camp through Magical Metropolis while preserving one culture/environment lineage.

---

# 50. World-Art Validation Matrix

Every production environment should be tested against these questions.

## 50.1 Realm

- Can the realm be recognised without UI text?
- Does recognition survive grayscale-ish viewing?
- Is the identity more than one hue/fog/effect?
- Does it remain within common Leyforge voxel/material grammar?

## 50.2 Biome

- Is the biome readable through terrain/ecology/structure?
- Does it transition plausibly?
- Are quiet and focal areas balanced?
- Are hazards and routes legible?

## 50.3 Settlement

- Can major entrances/routes be found?
- Does the environment explain why the settlement exists there?
- Does scale/capability read without one material-upgrade ladder?
- Does infrastructure match local hazards?

## 50.4 Culture

- Does culture affect form/space/infrastructure rather than only colour?
- Could multiple ancestries plausibly inhabit the design?
- Does a mixed settlement support more than one culture without visual randomness?

## 50.5 State/history

- Can intact/damaged/abandoned/restored/occupied/corrupted states be separated where needed?
- Does repair preserve believable history?
- Does Void corruption remain distinct from native dark/hazard states?

## 50.6 Performance/accessibility

- Does low-end mode preserve identity and navigation?
- Are hazards readable without particles/bloom alone?
- Are required entrances and route markers visible under reduced effects?

---

# 51. Automatic Rejection Conditions

An environment/realm/culture art pass fails ART-03 if any of the following is true without explicit authorised exception:

- realm identity depends primarily on a colour grade;
- a current realm uses the visual identity of a deferred realm concept;
- Overworld aerial/deep/volcanic regions visually imply portal-free realm transition;
- culture is reduced to ancestry;
- culture is reduced to one palette swap;
- every advanced settlement converges toward the same endgame architecture;
- every realm uses one architecture kit;
- every biome is a hard-edged chunk theme;
- terrain ignores hydrology/formation where canon requires it;
- settlement infrastructure ignores environmental hazards;
- a ruin loses all evidence of original function;
- state/corruption overlays erase substrate identity;
- natural nightmare/Predator Dark/Ashen darkness are rendered as Void by default;
- accessibility or low-end fallback removes critical realm/route/hazard identity;
- random procedural variation breaks established culture/realm grammar;
- a portal can be mistaken for another portal family at ordinary approach distance;
- a key landmark requires UI text to be recognisable;
- decorative clutter prevents interaction/silhouette readability.

---

# 52. ART-03 Decision Register — v0.1

The following decisions are proposed for owner lock.

| ID | Decision | Proposed status |
|---|---|---|
| ART03-D001 | Current full production world-art scope is Overworld plus Verdant Covenant, Ancestral Veil, Somnolent Expanse, Ascendant Reach, Impossible Deep and Ashen Lower Realms. | LOCK CANDIDATE |
| ART03-D002 | World-Engine, Elemental Confluences, playable Void Between and Pocket Realm Construction remain deferred/future art scope unless canon later activates them. | LOCK CANDIDATE |
| ART03-D003 | Realm identity must be carried by multiple channels, not one hue/fog/material/effect. | LOCK CANDIDATE |
| ART03-D004 | Environment composition uses macro landform, biome structure, material truth, ecology, civilisation, state/history and focal-wonder layers. | LOCK CANDIDATE |
| ART03-D005 | Scenes use quiet, informative and focal bands rather than maximum detail everywhere. | LOCK CANDIDATE |
| ART03-D006 | Systemic environmental evidence outranks decorative clutter. | LOCK CANDIDATE |
| ART03-D007 | Overworld is the primary materially grounded calibration realm and must remain visually rich rather than an intentionally bland starter realm. | LOCK CANDIDATE |
| ART03-D008 | Overworld biome identity is driven by terrain/ecology/hydrology/material relationships, not palette swaps. | LOCK CANDIDATE |
| ART03-D009 | Ecotones are first-class art content and ordinary biome transitions are normally gradual/readable. | LOCK CANDIDATE |
| ART03-D010 | Overworld skylands, Deep Overworld and volcanic environments must remain visually distinct from Ascendant Reach, Impossible Deep and Ashen Lower Realms. | LOCK CANDIDATE |
| ART03-D011 | Settlement capability growth is shown through organisation/infrastructure/service density rather than wood→stone→gold→glow progression. | LOCK CANDIDATE |
| ART03-D012 | Settlement morphology is independent of capability scale. | LOCK CANDIDATE |
| ART03-D013 | Final settlement appearance resolves culture + environment + archetype + capability + history/state + materials + routes/infrastructure. | LOCK CANDIDATE |
| ART03-D014 | Culture affects architecture, public space, infrastructure, ornament, signage and maintenance but does not determine ancestry. | LOCK CANDIDATE |
| ART03-D015 | Current twenty Overworld culture foundations receive bounded visual grammars rather than single fixed building kits. | LOCK CANDIDATE |
| ART03-D016 | Mixed/diaspora settlements use accumulated hybrid logic rather than random kitbashing. | LOCK CANDIDATE |
| ART03-D017 | Verdant uses living scale, seasonal ecology and negotiated terrain without collapsing to saturated-green enchanted forest. | LOCK CANDIDATE |
| ART03-D018 | Verdant healthy decay, blight, Void corruption and restoration must remain visually separable. | LOCK CANDIDATE |
| ART03-D019 | Ancestral Veil is an inhabited materially diverse realm and may not collapse to grey cemetery + blue ghosts. | LOCK CANDIDATE |
| ART03-D020 | Veil native Predator Dark/instability must remain visually distinct from Void corruption. | LOCK CANDIDATE |
| ART03-D021 | Somnolent uses persistent controlled dream mutability rather than random incoherent geometry. | LOCK CANDIDATE |
| ART03-D022 | Natural nightmare and Deep Dream presentation must remain distinct from Void corruption. | LOCK CANDIDATE |
| ART03-D023 | Ascendant Reach is vertically structured and must communicate Windways, altitude, anchoring and sacred-domain variation without generic heaven aesthetics. | LOCK CANDIDATE |
| ART03-D024 | Ascendant sacred/institutional art may not default to white marble, gold and angel-wing language. | LOCK CANDIDATE |
| ART03-D025 | Impossible Deep must communicate world-cavern scale, pressure and gravity rather than looking like an enlarged Overworld cave. | LOCK CANDIDATE |
| ART03-D026 | Deep darkness is spatial/environmental, not a universal blue-black palette. | LOCK CANDIDATE |
| ART03-D027 | Ashen Lower Realms uses nine stratum identities and eight recurring biome families without one-colour-per-floor treatment. | LOCK CANDIDATE |
| ART03-D028 | Ashen civilisation is diverse, inhabitable and infrastructure-driven rather than generic demon/hell architecture. | LOCK CANDIDATE |
| ART03-D029 | Shared concepts such as forest, sky, depth, volcanism, memory and darkness use realm-specific grammar and do not erase realm boundaries. | LOCK CANDIDATE |
| ART03-D030 | Current six portal families require distinct environmental/silhouette presentation before detailed ART-06 VFX. | LOCK CANDIDATE |
| ART03-D031 | Every biome production profile must define macro terrain, materials, ecology, routes, settlement adaptation, hazards, transitions and states. | LOCK CANDIDATE |
| ART03-D032 | Architecture must communicate mass, entrance, structure, function and maintenance before façade micro-detail. | LOCK CANDIDATE |
| ART03-D033 | Built history should normally remain visible through age, additions, repairs, reuse and infrastructure retrofits. | LOCK CANDIDATE |
| ART03-D034 | Ruins retain enough original logic to communicate prior function/history. | LOCK CANDIDATE |
| ART03-D035 | Landmarks use silhouette, scale, approach composition and route relationship rather than UI/colour alone. | LOCK CANDIDATE |
| ART03-D036 | Cross-realm imported architecture adapts to local survival/material/context rather than appearing as unmodified asset teleportation. | LOCK CANDIDATE |
| ART03-D037 | Procedural variation changes layout/expression while preserving realm, biome, material, culture and functional identity. | LOCK CANDIDATE |
| ART03-D038 | Low-end/accessibility modes may reduce flourish but not realm/biome/route/hazard identity. | LOCK CANDIDATE |
| ART03-D039 | Codex may autonomously vary approved composition but must escalate new realms, biomes, cultures, laws, portal families and persistent states. | LOCK CANDIDATE |
| ART03-D040 | ART-10 must certify a representative golden environment board before broad autonomous world-art production. | LOCK CANDIDATE |

---

# 53. Deferred Decisions Routed Forward

## ART-04

- exact block/object/structure modelling construction;
- exact architectural modular-kit geometry;
- machine/vehicle/vessel model standards;
- exact building component dimensions where not gameplay-owned;
- collision/pivot/socket production standards.

## ART-05

- exact people/creature body stylisation;
- clothing/equipment fit rules;
- culture-facing character silhouettes;
- animation timing and locomotion.

## ART-06

- exact sky/atmosphere shaders;
- volumetric/fog settings;
- particles;
- weather VFX;
- portal VFX;
- magical realm effects;
- exact lighting curves and exposure implementation.

## ART-07

- biome ambience;
- settlement soundscapes;
- realm sonic identity;
- weather/route/industry audio;
- cultural music direction.

## ART-08

- final map/cartography style;
- realm/biome/culture icons;
- environmental Codex layouts;
- UI palettes and navigation overlays.

## ART-09

- Codex/The Forge end-to-end environment production procedure;
- manifest generation;
- source lookup;
- automated reference selection;
- bake/register/report steps.

## ART-10

- golden scene production;
- screenshot/reference board requirements;
- environment acceptance scoring;
- cross-profile comparison;
- final visual certification.

---

# 54. Source Crosswalk

| ART-03 area | Primary upstream source |
|---|---|
| Current realm roster/boundaries | FCC-01A |
| Overworld climate/biomes/oceans/sky/underground | FCC-01B and related FCC-01 environmental canon |
| Overworld cultures | FCC-01F Part 1 |
| Overworld settlements/economy/infrastructure | FCC-01F Part 2 |
| Overworld structures/sites/ruins | FCC-01G/H/I |
| Verdant environment/civilisation/art handoff | FCC-02B/F/J |
| Ancestral environment/civilisation/art handoff | FCC-03B/F/J |
| Somnolent environment/civilisation/art handoff | FCC-04B/F/J |
| Ascendant environment/civilisation/art handoff | FCC-05B/F/J |
| Impossible Deep environment/civilisation/art handoff | FCC-06B/F/J |
| Ashen environment/civilisation/art handoff | FCC-08B/F/J |
| Material identity | FCC-12/13/14 + ART-02 |
| Voxel/style grammar | ART-01 |
| Forge authoring capabilities | Document Sets 21 and 22 |

Older Set 24 realm-atlas content is historical/supporting source only where current FCC canon does not supersede it. It may not reactivate removed/deferred realm scope.

---

# 55. Principal Source Basis

ART-03 was drafted from the current Leyforge source state, especially:

- ART-00 — Art Production Constitution & Authority Map;
- ART-01 — Master Leyforge Visual Language & Style Bible;
- ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard;
- FCC-01A — Overworld Identity, Cosmology, World Topology, Progression and Canon Boundaries;
- FCC-01B — Overworld Continents, Climate, Biomes, Oceans, Skylands, Underground, Hazards and Regional States;
- FCC-01F Parts 1–2 — Peoples, Cultures, Settlements, Economy and Civilisation Infrastructure;
- FCC-01J — Overworld Final Canon Registry and Art Readiness;
- FCC-02B/F/J — Verdant Covenant environment, civilisation and art handoff;
- FCC-03B/F/J — Ancestral Veil environment, civilisation and art handoff;
- FCC-04B/F/J — Somnolent Expanse environment, civilisation and art handoff;
- FCC-05B/F/J — Ascendant Reach environment, civilisation and art handoff;
- FCC-06B/F/J — Impossible Deep environment, civilisation and art handoff;
- FCC-08B/F/J — Ashen Lower Realms environment, civilisation and art handoff;
- Document Set 21 — Voxel Asset Forge;
- Document Set 22 — Forge Entity & Blueprint Expansion;
- Set 24 World Content Atlas as historical/supporting cross-reference only where not superseded.

---

# 56. ART-03 Acceptance Gate

ART-03 is owner-approved and locked on the following statement:

> **Leyforge world art is built from coherent realm, landform, biome, material, ecology, civilisation and history layers rather than colour themes. The Overworld remains a materially grounded and visually rich civilisation heart; the six current non-Overworld realms each receive a multi-channel signature that preserves common Leyforge voxel/style grammar while remaining instantly distinct. Biomes are ecological/spatial systems with real transitions. Settlements grow through organisation and infrastructure rather than a universal material ladder. Culture changes construction and public life without determining ancestry. Architecture communicates function and environmental adaptation before decoration. Persistent history remains visible. Procedural variation is controlled, and Codex may vary approved production expression but may not invent hidden realm, biome, culture, portal or world-law canon.**

ART03-D001 through ART03-D040 are the locked global world/realm/biome/architecture/culture art-direction baseline unless superseded through ART-00 governance.

---

# 57. Next Document

After ART-03 lock, continue to:

## ART-04 — Blocks, Items, Machines, Structures, Equipment & Vessel Modelling Standard

ART-04 should translate ART-01–03 into physical model-production law for:

- world blocks;
- generated construction shapes;
- unique functional blocks;
- items/resources;
- tools/weapons;
- armour/equipment;
- furniture;
- machines;
- logistics networks;
- settlement structures;
- architecture components;
- dungeon/landmark structures;
- vehicles/vessels;
- held/dropped/placed/icon-preview relationships;
- pivots, sockets, collision and authored-state geometry.

---

# 58. End Statement

ART-03 closes the missing global environment-art layer between content canon and model production.

The intended production result is:

> **Codex should be able to receive a canonical place such as “Moonroot Court village on a wet Verdant river terrace,” “Deepstone Compact mining town in an Overworld cavern province,” “Ashen Frontier Freedfolk refuge beside a Cinder-Sea margin,” or “Somnolent Memory City archive district,” resolve the relevant realm + biome + material + culture + settlement + state authorities, and generate an environment that is recognisably Leyforge without inventing new canon or relying on a one-off mood-board guess.**

