# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26C - Oceans, Coasts, Islands and Underwater World Generation

*Version 0.1 - Marine World Generation and Topology Contract Draft*

A governing world-generation, registry and validation foundation for ocean basins, seas, shelves, depth bands, coasts, islands, rivers, lakes, estuaries, wetlands, groundwater, underwater terrain, marine routes and persistent water-world transformation across Leyforge.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

Prepared 6 August 2026

---

> **Marine World Generation Statement**
>
> Leyforge oceans must be generated as living, navigable and strategically meaningful regions rather than as empty water between landmasses. Every sea must inherit a coherent basin, climate, depth, current, coast, island, ecology, civilisation, resource, route, structure, danger and history context. Every coastline must be the generated interface between a particular land region and a particular Water Body. Every island must have an origin, age, relief, freshwater budget, biome mosaic and route purpose. Underwater spaces must connect terrain, light, pressure, geology, caves, resources, structures and progression without becoming featureless flooded volume. The world must remain fully seed-derived, deterministic, save-safe, moddable and performance-bounded, while player engineering and world events create persistent deltas rather than hidden regeneration.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 26C in Document Set 26: Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion. |
| Document Scope | Defines executable marine and connected-water world generation: ocean basins, seas, marine regions, bathymetry, shelves, slopes, trenches, coasts, islands, inland waters, estuaries, deltas, wetlands, aquifers, underwater caves, seafloor topology, habitat and content sockets, route capability, harbour suitability, stable Water Body identity, seed guarantees, persistence, validation, LOD and handoff fields. |
| Core Philosophy | Generate relationships before decoration. Ocean, coast, island and underwater content must arise from shared topology, climate, geology, hydrology, magic and procedural history rather than unrelated noise layers. |
| Atlas Authority | Atlas 24C remains the world-content authority for marine biome families, environmental identities and content contracts. 26C turns those contracts into generation order, records, interfaces, constraints and tests without replacing the Atlas. |
| Fluid Authority | Document 26B owns liquid volume, containment, flooding, Water Body queries, local fluid islands, displacement and liquid persistence. 26C owns generated water topology and the stable records to which 26B binds. |
| Weather Boundary | 26C creates regional sockets and baseline fields for wind exposure, current corridors, tide regime, wave fetch and storm susceptibility. Document 26D owns their time-varying simulation, forecasting and severe-weather behaviour. |
| Marine Scale | Large worlds may contain multiple ocean basins, inland seas and archipelagos. Smaller presets compress distance and count while preserving the same functional depth, coast, route and progression categories. |
| Coast Direction | A coast is a persistent generated interface record between one land region and one marine region. It inherits both identities and adds morphology, substrate, exposure, sediment, tide, freshwater input, harbour and change-state fields. |
| Island Direction | Islands are generated from explicit origin families such as continental fragment, volcanic chain, reef growth, barrier chain, delta deposition, glacial carving, uplift, magical emergence or ancient construction. |
| Underwater Direction | Seafloor and flooded spaces use depth bands, geology, light, pressure, water chemistry, access, habitat, route, structure and hazard slots. Deep content is discoverable before it is safely accessible. |
| Procedural Guarantee | Required capabilities are guaranteed by categories, bounded search and fallback placement. No seed depends on one named harbour, island, wreck, dungeon, species or tutorial ocean. |
| Persistence Direction | Generated topology is reconstructed from root seed plus generation version. Saves own shoreline deltas, dredging, canals, reclaimed land, changed routes, discovered names, ownership, depleted resources, damaged habitats and other persistent consequences. |
| Engine Direction | Godot with Summer Engine remains the production direction. Data-oriented generation jobs create compact records and chunk instructions; scene nodes are presentation and interaction products, not the source of world topology. |
| Production Direction | This document defines production-capable contracts, but content admission and first-release scope remain governed by Set 25 classification and final technical evidence in 26O. |
| Final Authority | Ash retains final authority over world scale, ocean density, realism, procedural guarantees, difficulty defaults, content priorities and release decisions. |
| Next Deliverable | 26D - Marine Climate, Wind, Waves, Tides, Currents and Storm Systems. |

# Document Purpose

Document 26C converts the marine world direction established by Atlas 24C and the Water Body contracts established by 26B into an executable world-generation specification. It defines the order in which the world is assembled, which persistent records are created, how those records relate, what validation must prove and which later systems may consume each result.

The document exists because a convincing maritime expansion cannot be built by adding boats to ordinary terrain generation. Vessel travel depends upon navigable depth, sheltered water, connected seas, island stops, current corridors, harbour approaches, weather exposure and discoverable routes. Marine civilisation depends upon fresh water, fisheries, suitable ground, resource access, defensibility and transport purpose. Underwater exploration depends upon light, pressure, terrain relief, cave connectivity, breathable refuges, structures, hazards and progression alternatives.

The proof of concept is retired. No production rule assumes a fixed valley, fixed river, named tutorial coast, guaranteed nearby port, fixed sea monster or hand-authored world region. Every generated relationship derives from the seed, approved content definitions and deterministic constraints. Authored content supplies meaningful families and rules; generation chooses, assembles, validates and names instances.

This document does not define final marine creature rosters, ship movement, weather equations, port economies, naval encounters or underwater player controls. It creates the world-facing records and suitability fields those systems require. Exact Godot class names, thread budgets, platform limits and final runtime architecture remain subject to 26O, but the source-of-truth boundaries and generation guarantees in this document may not be silently replaced.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 26C |
| --- | --- | --- |
| Ash - locked project direction | Dedicated maritime expansion; large ocean biomes; waves, storms and water overhaul; fully functional player-built and NPC-built vessels; no retained hardcoded POC world content. | Applied as locked scope. Marine world generation must support meaningful traversal, civilisation and vessel gameplay from seed-derived worlds. |
| 26A - Maritime and Naval Expansion Foundation | Oceans are living regions; Set 26 owns maritime mechanics; 24C owns environmental content; hybrid simulation, stable identities, Forge integration, LOD and authority are mandatory. | Primary expansion authority and ownership boundary. |
| 26B - Water, Liquid and Fluid Simulation Overhaul | Generated Water Bodies bind to stable IDs; oceans are not active cell grids; local interfaces activate bounded fluid simulation; surface/depth queries, save deltas and authority are defined. | 26C generates the topology and records consumed by 26B and does not invent a second fluid model. |
| 24A - Atlas Foundations | Deterministic authored randomness, nested topology, seed ancestry, relationship graphs, uniqueness controls, procedural history, dynamic states and validation. | Governs generation philosophy, record relationships, seed derivation and no-hidden-hardcoding rules. |
| 24B - Overworld Regions, Climate and Surface Biomes | Continental assembly, plates, climate, watersheds, rivers, landforms, terrestrial regions and biome mosaics. | Supplies land, climate, geology and watershed inputs. 26C extends them offshore and defines water-network integration. |
| 24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes | Oceans as navigable regions; basin and sea assembly; marine fields; coast morphology; island origins; depth bands; marine biome families; routes; structures; ecology; dynamic states and validation. | Primary marine content authority. Biome identities and environmental contracts are consumed, not rewritten. |
| 24F-24K | Final ecology, dungeons, bosses, structures, resources, history, events and dynamic-world content. | 26C creates placement sockets, suitability fields and relationship hooks; those Atlas documents own final authored rosters and narrative content. |
| 00-17 main design documents | Sandbox freedom, living civilisations, data-driven registries, progression, structures, resources, automation, magic, creatures, quests, combat and UI. | Marine generation must support every pillar while leaving system-specific truth with its owning document. |
| Legacy 18 - Technical Implementation Plan | Stable IDs, deterministic generation, seed-plus-delta saves, chunk streaming, LOD, validation and authoritative world state; Unreal direction is obsolete. | Engine-neutral reliability rules are retained. Godot/Summer Engine replaces Unreal-specific implementation. |
| Set 25 governance and registry kernel | Qualified IDs, field ownership, immutable definitions, runtime records, schema versions, migration, validation, production classification and no duplicate truth. | All final generation schemas must consume approved Set 25 contracts when amended 25A-25B are available. This draft records required fields without claiming the final schema namespace. |
| Forge and Presentation Forge Sets 21-23 | Data-driven authoring, blueprints, semantic assets, sockets, presentation events, audio, VFX, preview laboratories and validation. | Marine content definitions, coast kits, biome palettes and generation previews extend existing Forge systems rather than forming a competing toolchain. |

> **Supersession Rule**
>
> Document 26C supersedes broad or POC-limited marine-generation assumptions in Document 11 and the legacy technical plan. It does not supersede Atlas 24C's authored marine content, Document 26B's fluid mechanics, or future Set 26 ownership of weather, swimming, vessels, ports, ecology, combat and technical implementation.

# Static Table of Contents

- 1. Locked Marine World Generation Identity
- 2. Source-Derived Direction and Recommendation Boundary
- 3. Scope, Non-Goals and Ownership Boundaries
- 4. Canonical Terminology and Generated Record Families
- 5. World Generation Source-of-Truth Model
- 6. Marine Generation Pipeline Overview
- 7. Root Seed, Derived Seeds and Generation Versions
- 8. Water Body Graph and Stable Identity
- 9. Global Ocean Basin and Inland-Sea Assembly
- 10. Sea and Marine Region Partitioning
- 11. Bathymetry, Shelves, Slopes, Canyons, Ridges and Trenches
- 12. Coast Segmentation and Littoral Morphology
- 13. Island, Archipelago and Isolated-Landmass Generation
- 14. Rivers, Lakes, Watersheds and Connected Inland Water
- 15. Estuaries, Deltas, Lagoons, Wetlands and Brackish Interfaces
- 16. Groundwater, Springs, Aquifers and Freshwater Lenses
- 17. Water Body Connectivity, Boundaries and Transition Rules
- 18. Marine Depth Bands, Access Classes and Progression Readability
- 19. Marine and Coastal Biome Slotting from Atlas 24C
- 20. Magical, Corrupted, Ancient and Transformed Marine Regions
- 21. Underwater Caves, Caverns, Sinkholes and Flooded Systems
- 22. Seafloor Geology, Sediment, Resources and Extraction Sockets
- 23. Underwater Structures, Wrecks, Dungeons, Wonders and Boss Territories
- 24. Ecology, Spawn Habitat and Migration Interfaces
- 25. Settlement, Port and Harbour Suitability Generation
- 26. Navigability, Draft, Shelter and Vessel Capability Fields
- 27. Marine Route Graphs, Island Hops, Canals and Crossing Classes
- 28. Discovery, Naming, Maps, Charts, Rumours and Survey Data
- 29. Procedural Guarantees, Fallbacks and Progression Safety
- 30. Player-Created Water Bodies, Canals, Reservoirs and Promotion Rules
- 31. Dynamic Shorelines, Sea-Level Events and Persistent World Deltas
- 32. Climate, Wind, Tide, Current, Wave and Storm Handoff to 26D
- 33. Simulation LOD, Streaming and Unloaded-World Processing
- 34. Persistence, Save Reconstruction, Migration and Recovery
- 35. Multiplayer Authority and Replication Boundaries
- 36. Registry, Schema and Data Ownership Foundations
- 37. Godot/Summer Engine Technical Boundaries
- 38. Performance Budgets and Scalability Targets
- 39. Prototype Laboratories, Seed Suites and Acceptance Tests
- 40. Risks, Failure Modes and Redesign Triggers
- 41. Production Classification and Relationship with Set 25
- 42. Main-Document, Atlas and Forge Integration Matrix
- 43. Decision Register
- 44. Handoff to Document 26D
- Appendix A. Canonical Glossary
- Appendix B. Marine Region, Coast, Island and Water Body Record Templates
- Appendix C. Deterministic Generation Dependency Graph
- Appendix D. Harbour, Navigability and Route Suitability Matrices
- Appendix E. Worldgen Validation and Failure-Code Catalogue
- Appendix F. Seed Test Matrix
- Appendix G. Completion Checklist

# 1. Locked Marine World Generation Identity

The Marine World Generation System is the topology, relationship and placement layer that makes Leyforge's water world coherent before terrain chunks, creatures, structures, routes or vessels are instantiated. It creates persistent ocean basins, Water Bodies, sea regions, coast segments, islands, bathymetric provinces, inland-water networks and underwater content sockets from the world seed and approved definitions.

> **Locked Rule**
>
> A generated marine feature must answer several connected questions: where did it come from, what does it connect, how deep and dangerous is it, what travels through it, what can live or be built there, what resources and structures fit it, how it changes under weather and history, how the player reads it, and which stable record owns its state? A water-filled area that answers none of those questions is not a completed marine region.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Whole-World Topology | Oceans, continents, rivers, coasts, islands, caves and magical fields share seed ancestry and spatial constraints. | The sea feels like part of the same world rather than a separate map or decorative border. |
| Navigable Geography | Depth, shelter, passages, currents, island stops and hazards are generated as route-relevant fields. | Boat choice, charts, weather and route planning matter. |
| Civilisation Foundation | Fresh water, food, buildable ground, harbour access, resources, defence and route purpose shape settlement candidates. | Ports and island communities exist for believable reasons. |
| Underwater World | Bathymetry, light, pressure, geology, caves, structures, habitats and access classes create meaningful vertical exploration. | Diving and submersible travel reveal landscapes rather than empty blue volume. |
| Procedural History | Drowned coasts, wreck fields, old ports, naval borders, sacred seas, ruins and changed channels derive from history records. | The ocean contains evidence of what happened before the player arrived. |
| Persistent Consequence | Dredging, canals, sea walls, erosion events, habitat damage, route changes and ownership become save deltas. | Maritime engineering and disaster visibly change the world. |
| Data-Driven Scalability | Definitions, generated instances, relationships, sockets, validation and LOD remain separate. | Content packs can expand the world without hardcoding one map or rewriting saves. |

## 1.1 Generation Promise

A player should be able to inspect a chart, shoreline or seafloor and make useful predictions. Broad shelves imply shallow travel and fishing. Fjords imply deep protected approaches. Barrier islands imply lagoons and storm breaches. Volcanic chains imply age progression, deep nearby water and geothermal resources. Delta ports imply fertile land but flood and silt risk. Clear signs should distinguish safe coastal water, exposed crossings, deep channels, reefs, shoals, dangerous trenches and magically altered seas.

The player does not need to see every generation value, but the world must communicate its logic through shape, colour, vegetation, settlement adaptation, route markers, currents, waves, wildlife, maps, dialogue and survey tools.

## 1.2 What the System Is Not

- It is not random noise filled to sea level and labelled an ocean.
- It is not a guarantee that every seed contains the same named islands, ports or marine dungeons.
- It is not global active liquid simulation; 26B owns liquid behaviour.
- It is not final weather, tide, wave or storm simulation; 26D owns changing marine fields.
- It is not a second ecology, structure, resource or faction catalogue.
- It is not permission to generate impassable oceans without route alternatives or progression signals.
- It is not a requirement to make geological realism override playability, readability or performance.

# 2. Source-Derived Direction and Recommendation Boundary

| Decision Class | Meaning | Examples in 26C |
| --- | --- | --- |
| Locked by Ash | Explicit direction requiring Ash approval to change. | Dedicated Set 26; fully procedural post-POC worlds; major ocean, vessel and water expansion. |
| Locked by 26A-26B | Approved Set 26 foundations. | Stable Water Bodies; no ocean cell grid; source ownership; deterministic saves; bounded local interfaces. |
| Atlas-Owned | Authored environmental identity that 26C implements but does not rewrite. | 24C coast families, marine biome families, island origins, depth bands and placement contracts. |
| 26C Operational Resolution | Generation rule required to make source direction executable. | Water Body graph, basin-region hierarchy, coast segmentation, harbour suitability, route fields and fallback validation. |
| Prototype Default | First-pass numerical target requiring measured evidence. | Region sizes, validation radius, slope thresholds, minimum channel width and generation work budgets. |
| Pending Later Document | Field generated here but behaviour owned later. | Tide regime, current strength profile, storm exposure, vessel capability and underwater survival. |
| Deferred | Valuable option not committed to first production scope. | Fully deformable tectonic plates, continuous sediment physics, dynamically moving islands and global sea-level erosion. |

> **Recommendation Boundary**
>
> Numerical thresholds and count targets in 26C are starting values for test suites. They may be tuned by world preset and 26O profiling. The hierarchy, stable identity, relationship-first generation, Atlas ownership and seed-plus-delta model may change only through an explicit redesign decision.

# 3. Scope, Non-Goals and Ownership Boundaries

## 3.1 Included Scope

- Global ocean-basin, inland-sea and marine-region topology.
- Stable Water Body and coast relationship records.
- Bathymetry, shelves, slopes, canyons, ridges, seamounts, trenches and seafloor provinces.
- Coast morphology, littoral transitions, islands, archipelagos and freshwater budgets.
- River, lake, estuary, delta, lagoon, wetland, spring, aquifer and groundwater connectivity where it affects marine generation.
- Marine depth, access, navigation, shelter, harbour and route capability fields.
- Underwater caves, flooded structures, resource sockets, habitat slots and progression interfaces.
- Procedural history evidence, naming, discovery, maps and survey uncertainty.
- Player-created Water Body promotion and persistent shoreline/route deltas.
- World presets, seed guarantees, fallbacks, validation, LOD, persistence and multiplayer boundaries.

## 3.2 Explicit Non-Goals

- Detailed fluid flow, flooding, displacement, pumps or containment, which remain owned by 26B.
- Dynamic wind, tide, current, wave and storm equations, which remain owned by 26D.
- Player swimming, breath, pressure and underwater controls, which remain owned by 26E.
- Vessel commissioning, buoyancy, propulsion and navigation controls, which remain owned by 26F-26G.
- Full port construction, shipyard simulation, maritime NPC jobs or fleet economies, which remain owned by 26J-26K.
- Final marine creature, dungeon, boss, structure, resource or lore rosters, which remain owned by Atlas and later Set 26 documents.
- Continuous global shoreline erosion or sediment simulation.
- Guaranteed realistic planetary curvature, ocean circulation or tectonic modelling beyond gameplay needs.

## 3.3 Ownership Rule

A record may contain fields consumed by another system without taking ownership of that system's behaviour. For example, a Marine Region may store `storm_exposure_profile_id`, but 26D defines how storms form and change. A Coast Segment may store `harbour_suitability`, but 26J defines how a port is founded and operated. A Water Body may store navigable-depth fields, but 26G defines how a vessel interprets draft and grounding.

# 4. Canonical Terminology and Generated Record Families

| Term | Working Meaning |
| --- | --- |
| Ocean Basin | World-scale marine depression or connected water domain derived from plate, elevation, water-level and realm-preset fields. |
| Inland Sea | Large enclosed or semi-enclosed Water Body with basin identity, restricted exchanges and distinct climate/salinity potential. |
| Marine Region | Persistent named subdivision of a basin or sea with coherent temperature, salinity, depth, productivity, current, storm, route, ecology and history fields. |
| Water Body | 26B-compatible persistent record representing a connected ocean, sea, river, lake, reservoir or other large water volume. |
| Coast Segment | Persistent interface between one land region and one Marine Region or inland Water Body, divided where morphology or system fields change materially. |
| Littoral Zone | Intertidal and immediate shore interface affected by tides, waves, substrate, vegetation and access. |
| Bathymetry | Generated seafloor elevation and relief below the reference water surface. |
| Shelf | Broad shallow marine platform adjacent to land or island masses. |
| Slope | Transition between shelf and deep basin, often containing canyons and strong depth change. |
| Abyssal Province | Deep basin area such as plain, ridge, seamount field, vent province or trench approach. |
| Island Region | Persistent generated landmass or linked group with origin, age, relief, freshwater, biome, route and history records. |
| Archipelago | Relationship group containing multiple islands connected by origin, route, ecology, culture or history. |
| Harbour Candidate | Generated coastal or river-mouth site with scored shelter, depth, approach, ground, freshwater, route and hazard fields. |
| Navigable Corridor | Water-space path classified by minimum depth, width, obstruction, exposure, current, seasonality and vessel capability. |
| Content Socket | Deterministic placement opportunity with environmental, scale, access, uniqueness and ownership constraints; not a guaranteed final object. |
| Generated Base | Reconstructible terrain, topology and relationships derived from seed plus generation version. |
| World Delta | Save-owned persistent change relative to the generated base. |

# 5. World Generation Source-of-Truth Model

Marine generation uses four separated layers of truth.

| Layer | Owns | Does Not Own |
| --- | --- | --- |
| Authored Definitions | Basin, coast, island, biome, geology, route, socket and validation profiles. | A particular world's generated instances. |
| Generated Base Records | Seed-derived basins, Water Bodies, Marine Regions, Coast Segments, islands, routes and placement sockets. | Player edits, later ownership changes or dynamic event outcomes. |
| Runtime Simulation | Loaded weather influence, local fluids, ecology activity, vessels, NPC traffic and interactions. | Rewriting generated identity. |
| Persistent Deltas | Dredging, new canals, damaged reefs, changed coast blocks, discovered names, port ownership, route closures and history outcomes. | Immutable authored definitions. |

The generated base is never silently mutated by runtime systems. A storm that breaches a barrier island writes a delta linked to the island and coast records. A player canal writes excavation and Water Body connectivity deltas. A port built at a harbour candidate creates structure, ownership and route records without replacing the coast's origin fields.

# 6. Marine Generation Pipeline Overview

Marine generation must proceed from broad topology toward local detail. Later stages may query earlier records but may not regenerate them from ad hoc local noise.

| Stage | Output | Validation Before Next Stage |
| --- | --- | --- |
| 1. World Frame | Root seed, world preset, dimensions, water reference, plate/elevation and magic fields. | Valid world bounds or infinite-generation contract; deterministic version stamp. |
| 2. Continental and Basin Skeleton | Continental masses, ocean basins, inland depressions, ridges and major barriers. | Required land-water ratio and no invalid isolated topology. |
| 3. Hydrology Graph | Watersheds, major rivers, lakes, outlets, groundwater candidates and basin exchanges. | Rivers reach valid sink or terminal basin; freshwater guarantees pass. |
| 4. Water Body Graph | Stable Water Body nodes, parent/child relations, exchanges and boundary interfaces. | Every generated water volume has identity and valid connection rules. |
| 5. Marine Region Partition | Seas, gyres, shelves, deep provinces, polar regions, special marine overlays. | Region coherence, size, adjacency and route continuity. |
| 6. Coast and Island Assembly | Coast Segments, morphology, archipelagos, island records, lagoons and estuaries. | Land-sea transitions and freshwater viability pass. |
| 7. Bathymetric Detail | Shelves, banks, slopes, canyons, ridges, seamounts, trenches and seafloor substrate. | Navigable channels and progression paths exist; invalid spikes are removed. |
| 8. Biome and Habitat Slotting | Atlas 24C biome families, transformed states, habitat envelopes and resource sockets. | Climate, depth, chemistry, geology and adjacency contracts pass. |
| 9. Civilisation and Adventure Sockets | Harbour candidates, settlement sites, routes, structures, wrecks, dungeons and boss territories. | Suitability, uniqueness, access and no-overlap rules pass. |
| 10. History and Naming | Drowned sites, old routes, borders, wreck fields, names, rumours and chart layers. | Evidence matches generated history and does not contradict topology. |
| 11. Chunk Materialisation | Terrain/block instructions, biome palettes, markers and runtime streaming manifests. | Chunk seams, Water Body bindings and save reconstruction pass. |

## 6.1 Generation Is a Constraint Graph

The pipeline may execute jobs in parallel after dependencies are available, but conceptual ownership remains a directed acyclic graph. Coast morphology cannot be finalised before land relief, marine exposure and sediment input exist. Harbour scoring cannot be finalised before bathymetry, freshwater and storm exposure exist. Reef biome placement cannot be finalised before temperature, light, salinity, substrate and current fields exist.

# 7. Root Seed, Derived Seeds and Generation Versions

Every generated record must be reproducible through explicit seed derivation rather than call-order-dependent random-number use.

| Seed Scope | Derivation Purpose | Example Use |
| --- | --- | --- |
| Root World Seed | Player-facing world identity. | World frame and global field ancestry. |
| Generation-Version Salt | Separates algorithm revisions. | Prevents accidental drift across builds. |
| Basin Seed | Stable per-basin assembly. | Ridge, shelf and deep-province selection. |
| Marine Region Seed | Local regional variation. | Biome mosaics, route sockets and names. |
| Coast Segment Seed | Shore detail and local candidates. | Substrate transitions, coves, caves and harbour scoring. |
| Island Seed | Island-specific relief, freshwater and content. | Volcano shape, river count, biome mosaic and settlement sockets. |
| Socket Seed | Deterministic candidate selection. | Wreck, dungeon, ruin or boss-territory candidate. |

Seeds must be derived from stable parent IDs and named salts. Inserting a new optional content family must not reshuffle unrelated islands or coasts. Definitions use weighted selection streams isolated by category so content-pack changes remain local and migration can identify affected records.

## 7.1 Generation Version Policy

- A world stores the root seed, generation version and enabled content-pack manifest.
- Minor presentation changes do not increment topology version.
- Algorithm changes that alter persistent record identity require migration or a new world-generation version.
- Existing generated records remain authoritative for explored or stateful regions even when a newer generator exists.
- Unexplored regions may use approved forward-generation policy only when compatibility rules state that mixed versions are safe and visible to diagnostics.

# 8. Water Body Graph and Stable Identity

The Water Body graph is the shared identity layer between world generation and fluid simulation. Each node represents a generated or promoted large water volume. Edges represent controlled exchange, confluence, outlet, tidal boundary, underground connection or artificial connection.

| Node Class | Examples | Required Fields |
| --- | --- | --- |
| Ocean | World ocean or major connected basin water. | basin_id, reference_surface_profile, chemistry, climate links, boundary policy. |
| Sea | Marginal sea, inland sea, gulf or named sub-basin. | parent_ocean_id, exchange edges, salinity tendency, region list. |
| River | Main river or persistent navigable tributary. | source catchment, direction, discharge class, seasonal profile, outlet. |
| Lake | Natural freshwater, saline or volcanic lake. | basin, inflow/outflow, surface profile, depth class, chemistry. |
| Estuary/Lagoon | Mixed or sheltered transition body. | parent river/sea links, exchange windows, tide influence, sediment. |
| Aquifer | Abstract groundwater domain with springs, wells and cave interfaces. | recharge region, chemistry, pressure class, outlet candidates. |
| Reservoir/Canal | Generated civilisation feature or promoted player project. | creator/owner, source edges, control structures, maintenance and delta ownership. |

## 8.1 Stable ID Pattern

Final namespaces are approved by Set 25, but generated IDs must support the following semantic shape:

`world.<world_id>.water.<class>.<stable_instance_key>`

Examples:

- `world.seed_42.water.ocean.western_basin`
- `world.seed_42.water.sea.sapphire_gyre`
- `world.seed_42.water.river.ember_delta_main`
- `world.seed_42.water.lake.highglass_caldera`

Display names are localised, discoverable and changeable by culture or player naming. They are never used as identity keys.

## 8.2 Graph Rules

- Every river has a valid terminal sink, endorheic basin or extraordinary authored explanation.
- Every sea has at least one parent basin or enclosed-basin classification.
- A Water Body edge records directionality, exchange capacity, seasonality, control structures and whether 26B may activate local cells at the boundary.
- Underground connections may be unknown to the player while remaining explicit in generated data.
- Player-created connections are deltas and must never rewrite original parentage.

# 9. Global Ocean Basin and Inland-Sea Assembly

Ocean basins are assembled at world scale from elevation, plate, water-level, climate, volcanism, magic and world-preset fields. The goal is not geological simulation for its own sake; the goal is coherent coastlines, depth progression, island origins, route structure and content diversity.

| Basin Component | Generation Rule | Gameplay Function |
| --- | --- | --- |
| Basin Depression | Large connected below-water region after world-frame elevation. | Establishes ocean extent and deep-water potential. |
| Continental Margin | Boundary zone between landmass and basin. | Creates shelves, slopes, coasts, ports and early marine access. |
| Mid-Basin Ridge | Long uplift or magical equivalent. | Seamount chains, vents, island arcs, resource and route landmarks. |
| Trench/Rift | Narrow deep linear province with tectonic or magical cause. | Late-game depth, hazards, rare content and boss territory. |
| Sill/Strait | Restricted passage between basins or seas. | Strategic route, current concentration, blockade and settlement value. |
| Enclosed Depression | Landlocked or semi-enclosed basin. | Inland sea, salt lake, evaporative ecology or catastrophe history. |

## 9.1 Basin Count and Scale

World presets determine target land-water ratio, minimum basin size, island density and distance compression. The system must preserve function rather than literal size. A small world may contain one compressed ocean and one inland sea, but still requires coastal variety, shallow-to-deep progression, navigable routes and at least one meaningful island category if marine content is enabled.

## 9.2 Basin Validation

A basin fails generation when it produces any of the following without an authored special-state explanation:

- Large isolated water with no coast diversity, depth structure or route purpose.
- Deep trenches touching ordinary flat beaches without shelf/slope transition.
- Every coast exposed to identical weather and wave conditions.
- No discoverable shallow-water access on an oceanic world.
- Mandatory interregional travel that crosses lethal open ocean before vessels or alternatives are available.

# 10. Sea and Marine Region Partitioning

Basins are partitioned into persistent Marine Regions. Region boundaries follow meaningful changes in geometry, current tendency, temperature, salinity, productivity, storm regime, sea ice, history, ownership or magical state.

| Marine Region Type | Typical Boundary Driver | Required Connections |
| --- | --- | --- |
| Marginal Sea | Continental enclosure, island arc or shallow sill. | Coasts, straits, ports, fisheries and parent basin. |
| Gulf/Bight | Coast geometry and sheltered circulation. | Harbour candidates, river outlets, storm exposure and sediment. |
| Shelf Sea | Broad shallow platform. | Fisheries, reefs, banks, shipping and early underwater access. |
| Gyre Province | Basin-scale circulation tendency. | Open-ocean routes, drift fields, climate and migration. |
| Polar Sea | Ice regime and cold-current boundary. | Seasonal routes, glacial coasts, pack ice and polar ecology. |
| Deep Province | Abyssal plain, ridge, seamount or trench system. | Pressure progression, deep structures, rare resources and route hazards. |
| Transformed Sea | Mana, dream, void, corruption, ancient machine or catastrophe source. | Explicit source, boundary, counterplay, transformed ecology and event state. |

Regions should be large enough to form identity but small enough that a basin contains meaningful variation. Adjacent regions require transition bands or explicit fronts. The generator may create strong boundaries such as sea-ice edge, magical curtain or trench wall, but must expose readable clues and traversal consequences.

# 11. Bathymetry, Shelves, Slopes, Canyons, Ridges and Trenches

Bathymetry is generated from the basin skeleton, margins, island origins, volcanism, rivers and special fields. Local noise adds texture only after structural relief exists.

## 11.1 Bathymetric Hierarchy

1. Reference sea surface and basin floor range.
2. Continental shelves and island shelves.
3. Shelf breaks and slopes.
4. Abyssal plains and sediment basins.
5. Ridges, seamounts, banks and plateaus.
6. Canyons, rifts, trenches and vent provinces.
7. Local substrate, outcrops, dunes, reefs and structure sockets.

| Feature | Placement Logic | System Hooks |
| --- | --- | --- |
| Shelf | Margin width from geology, relief, sediment and glacial history. | Shallow routes, fisheries, reefs, early diving and ports. |
| Bank/Shoal | Local uplift, sediment, reef or drowned landform. | Grounding risk, fishing, lighthouses, navigation landmarks. |
| Submarine Canyon | River legacy, slope failure or tectonic cut. | Deep access, currents, wrecks, predators and dungeon entrances. |
| Ridge/Seamount | Volcanic, tectonic, magical or colossal-remain origin. | Vents, islands, migration, resources, structures and bosses. |
| Trench | Plate boundary, rift or extraordinary source. | Endgame pressure, quakes, void influence, rare ecology and titans. |
| Abyssal Plain | Deep low-relief sediment province. | Long expeditions, sparse landmarks, ancient sites and nodules. |

## 11.2 Readability and Navigation

Bathymetry must support chart abstraction. The map does not need metre-perfect contours at first discovery, but it should classify shallows, shelf water, deep channels, hazardous shoals and major drop-offs. Survey tools improve precision. Surface cues such as colour, wave breaking, kelp, bird activity, buoy markers, reef foam and current lines help players infer depth.

# 12. Coast Segmentation and Littoral Morphology

A coastline is first detected as the interface between land cells/regions and a Water Body. It is then divided into Coast Segments wherever morphology, exposure, substrate, river input, climate, land region, marine region, ownership or history changes beyond a threshold.

| Coast Driver | Likely Morphology | Generation Inputs |
| --- | --- | --- |
| Hard Rock and High Relief | Cliffs, stacks, arches, wave platforms, narrow coves. | Bedrock, relief, faulting, wave exposure and glaciation. |
| Loose Sediment and Low Relief | Beaches, dunes, spits, barrier islands and lagoons. | Sediment supply, wind, waves, shelf slope and vegetation. |
| Major River Input | Estuary, delta, mudflat, marsh islands and distributaries. | Discharge, sediment, tide range, shelf gradient and sea level. |
| Glaciation | Fjords, skerries, U-shaped bays and ice shelves. | Glacial paths, relief, latitude and deglaciation history. |
| Volcanism | Black beaches, lava cliffs, caldera bays and new islands. | Hotspot/arc, eruption age, lava flow and collapse. |
| Reef Growth | Fringing reef, barrier reef, atoll and coral cay. | Temperature, light, salinity, substrate, wave energy and biology. |
| Magical/Catastrophic | Glass shore, drowned forest, floating fragments or void-cut bay. | Explicit source field, history event and transformed-state profile. |

## 12.1 Coast Segment Fields

Each segment records land-region ID, Marine Region ID, length class, orientation, slope, substrate, tide regime reference, exposure class, sediment budget, freshwater input, erosion sensitivity, wetland compatibility, cave likelihood, harbour suitability, settlement suitability, structure sockets, dynamic-state profile and presentation palette.

## 12.2 Shoreline Geometry Rules

- Ordinary beaches require transition space between land elevation and shelf depth.
- Cliffs may meet deep water quickly, but require rock and fault/glacial justification.
- River mouths reserve enough channel width for the discharge class and sediment form.
- Coastlines use multi-scale detail so bays and headlands remain navigationally meaningful rather than noisy at every voxel.
- Chunk materialisation must preserve the authoritative segment boundary and avoid visible seams.

# 13. Island, Archipelago and Isolated-Landmass Generation

Islands are generated from origin before biome. Origin establishes shape grammar, age progression, relief, geology, freshwater potential, shelf relationship and disaster profile. Climate and history then create the biome mosaic and content roles.

| Island Origin | Core Generation Contract | Characteristic Consequences |
| --- | --- | --- |
| Continental Fragment | Old varied geology, broad shelf, multiple catchments, high settlement capacity. | Diverse biomes, ruins, mines and regional civilisation. |
| Volcanic Hotspot Chain | Ordered age sequence along a hotspot path. | Young steep volcanic islands transition to eroded fertile islands and atolls. |
| Subduction Arc | Curved mountainous chain beside trench and active tectonics. | Deep approaches, fortified ports, quakes, volcanoes and rare metals. |
| Coral Atoll | Low ring around subsided volcanic foundation. | Lagoon routes, fragile freshwater, storm risk and reef economy. |
| Barrier Chain | Low mobile sand islands parallel to coast. | Lagoons, marshes, breaches, ferries and storm defence. |
| Delta/River Island | Sediment-built land within distributary network. | Fertility, floods, trade and shifting channels. |
| Glacial Skerry | Ice-carved rocky island field. | Hidden coves, wrecks, cold routes and navigation complexity. |
| Uplifted Plateau | High cliff rim with isolated interior. | Difficult access, endemic ecology, defence and sky links. |
| Magical Emergence | Raised, transported, crystallised, dreamed or realm-leaked land. | Explicit instability, rare resources and transformed content. |
| Artificial/Constructed | Ancient platform, breakwater, city-island or colossal remains. | Salvage, machinery, strategic infrastructure and procedural history. |

## 13.1 Archipelago Graph

An archipelago record groups islands by origin and route. It stores island order, nearest-neighbour passages, safe anchorages, freshwater stops, storm shelters, ownership candidates, ecological exchange and unique-content budgets. The generator must avoid cloning the same silhouette, biome package and settlement role across neighbouring islands.

## 13.2 Freshwater Viability

Every settlement-capable island receives an explicit freshwater budget from rainfall, catchment, streams, lakes, springs, aquifer lens, imported supply, magical source or infrastructure. An island may intentionally lack water, but that fact becomes a meaningful constraint and cannot accidentally trap a default starting player.

# 14. Rivers, Lakes, Watersheds and Connected Inland Water

Document 24B remains authority for continental climate and watershed generation. Document 26C defines how those outputs bind into the Water Body graph and maritime systems.

| Inland Feature | Required Record Relationships | Maritime Use |
| --- | --- | --- |
| Major River | Catchment, tributaries, discharge, navigable reaches, floodplain, outlet Water Body. | Inland-sea connection, ports, barges, deltas and trade. |
| Lake | Inflows, outflow or terminal-basin state, depth, chemistry and shoreline regions. | Fishing, settlements, ferries, reservoirs and local vessels. |
| River-Lake Chain | Ordered connection and elevation steps. | Regional routes, locks, portage and power. |
| Endorheic Basin | No marine outlet; evaporation and chemistry profile. | Salt industry, unusual ecology, isolated civilisation. |
| Underground River | Aquifer/cave links, entries, exits and pressure class. | Hidden routes, cave settlements, flooded dungeons and resources. |

## 14.1 Navigable-Reach Classification

Rivers are divided into reaches with minimum width, depth, gradient, obstruction, seasonal flow, bank access and control-structure fields. A river can be globally important without every reach being navigable. Portage sites, rapids, waterfalls, locks and canals create explicit route transitions rather than invisible path failure.

## 14.2 Lakes as Water Bodies

Lakes use the same stable Water Body model as seas. Large lakes may contain marine-like regions, islands, storms, currents and ports at reduced scale. Their chemistry may be fresh, saline, mineral, volcanic or magical. A lake that materially supports routes or settlement cannot remain an anonymous collection of water blocks.

# 15. Estuaries, Deltas, Lagoons, Wetlands and Brackish Interfaces

Transition waters are generated where river discharge, sediment, tide, shelf slope, wave exposure and sea-level history interact.

| Interface | Formation Conditions | Gameplay Connections |
| --- | --- | --- |
| Drowned Estuary | River valley flooded by sea-level rise or subsidence. | Deep approach, ports, marshes, submerged ruins and tide reach. |
| Constructed Delta | High sediment supply on gentle shelf. | Fertile settlement, shifting channels, flood risk and trade. |
| Tidal Marsh | Low-energy intertidal sediment with suitable vegetation. | Raised paths, fisheries, salt plants, flood defence and habitat. |
| Mangrove Labyrinth | Warm tidal coast, low relief and protected water. | Boat routes, medicines, ambush ecology and root structures. |
| Barrier Lagoon | Sand/reef barrier shelters shallow water. | Aquaculture, harbours, nurseries and breach events. |
| Mudflat | Fine sediment exposed across significant tide range. | Gathering windows, hidden channels, grounding and migration. |
| Hypersaline Flat | Restricted exchange plus high evaporation. | Salt, corrosion, specialised ecology and harsh travel. |

## 15.1 Brackish Transition Rule

Freshwater and saline Water Bodies remain distinct identities connected by exchange edges. Salinity state across an estuary is a regional gradient and local-interface input, not a need to create a new fluid definition per voxel. 26B handles local contamination or mixing where a player opens, closes or pumps a bounded interface.

# 16. Groundwater, Springs, Aquifers and Freshwater Lenses

Groundwater is represented through persistent abstract aquifer records plus explicit local outlets and cave interfaces. The generator does not simulate every pore or saturated block.

| Aquifer Type | Source | Surface/Gameplay Expression |
| --- | --- | --- |
| Unconfined Aquifer | Rainfall and permeable ground above water table. | Wells, springs, wetlands, cave seepage and drought response. |
| Confined Aquifer | Permeable layer trapped under lower-permeability strata. | Artesian springs, deep wells, pressure hazards and rare resources. |
| Karst Aquifer | Soluble rock and cave channels. | Sinkholes, disappearing rivers, springs and flooded caverns. |
| Volcanic Aquifer | Fractured lava and geothermal fields. | Hot springs, mineral water, steam and contamination risk. |
| Island Freshwater Lens | Rain-fed fresh water floating within porous island substrate. | Settlement viability, shallow wells, salt intrusion and fragile supply. |
| Magical Aquifer | Mana, blessing, dream or realm influence. | Ritual springs, altered ecology, power and stabilisation requirements. |

Aquifer records store recharge, chemistry, approximate volume class, outlet candidates, connected Water Bodies, contamination susceptibility and discovered state. Pumping and depletion rules are handled through later simulation/economy systems using these summaries.

# 17. Water Body Connectivity, Boundaries and Transition Rules

Connectivity is explicit and inspectable. A boundary record defines what crosses, in which direction, at what capacity and under what conditions.

| Boundary Type | Example | Required Fields |
| --- | --- | --- |
| Open Exchange | Ocean-to-sea or sea-to-gulf connection. | width, depth, baseline flow tendency, tide/current handoff, route class. |
| Strait/Sill | Restricted passage between basins. | controlling depth, obstruction, strategic value, current amplification. |
| River Mouth | River-to-estuary/sea. | discharge class, sediment, tide reach, navigation and flood field. |
| Waterfall/Rapid | Reach transition with elevation drop. | height/gradient, bypass/portage, power, hazard and migration barrier. |
| Groundwater Outlet | Spring, seep or cave discharge. | aquifer ID, rate class, chemistry and local fluid activation. |
| Control Structure | Dam, lock, gate, culvert or pump station. | owner, state, capacity, maintenance and 26B interface. |
| Artificial Channel | Canal or dredged cut. | delta owner, construction record, depth/width, connected bodies and route rules. |

## 17.1 Invalid Connectivity

The validator rejects rivers that climb without special rules, seas without basin support, canals that connect incompatible surfaces without locks or magical explanation, isolated mandatory regions, and coast segments whose land and marine records disagree about elevation or water identity.

# 18. Marine Depth Bands, Access Classes and Progression Readability

Depth bands follow Atlas 24C and are represented as inspectable world fields rather than hidden difficulty multipliers.

| Depth Band | Environmental Role | Default Access Class |
| --- | --- | --- |
| Intertidal | Alternating exposure, pools, mud, caves, reefs and harvest windows. | Early access with timing, footwear and weather awareness. |
| Shallows | Sunlit shelf, sand, seagrass, kelp edge, reefs and bars. | Swimming, rafts/boats, basic breath management and shore support. |
| Shelf Depths | Reduced light, stronger currents, wrecks, banks and canyons. | Diving gear, water magic, mounts, submersibles or air refuges. |
| Slope/Twilight | Steep relief, low light, pressure and migration corridors. | Advanced pressure protection, navigation, lighting and supply. |
| Abyssal | Dark, cold, high pressure and sparse specialised ecology. | Late-game expedition infrastructure, vehicles, portals or adapted allies. |
| Trench/Hadal | Extreme pressure, tectonics, vents and realm-thin zones. | High-risk endgame; never required for ordinary baseline progression. |
| Submerged Cavern | Flooded cave network with variable depth and refuge. | Ranges from early tidal caves to endgame labyrinths. |

## 18.1 Discovery Before Access

Players should commonly see or hear about deeper content before they can safely reach it. Charts, sonar-like magic, legends, visible trench walls, migrating creatures, wrecks and NPC knowledge create aspiration. Access requirements must be explicit and provide several categories of solution rather than one mandatory ancestry, spell or vehicle.

# 19. Marine and Coastal Biome Slotting from Atlas 24C

26C does not redefine Atlas biome identities. It selects compatible definitions and generates instances through environmental constraints.

| Biome Family | Primary Selection Inputs | Required Generated Relationships |
| --- | --- | --- |
| Rocky Coast | Bedrock, relief, exposure, glaciation, volcanism. | Land region, Marine Region, cave/ruin sockets and access. |
| Sandy Coast | Sediment, shelf slope, wind, waves, vegetation. | Dune/barrier/lagoon transitions and storm state. |
| Wet Coast | River input, tide, low relief, temperature and shelter. | Estuary/delta/wetland Water Bodies, settlement and habitat. |
| Shallow Marine | Light, temperature, salinity, substrate, nutrients and current. | Shelf geometry, coast, fisheries, reefs/kelp and diving access. |
| Reef | Warm/cold profile, light or deep-current conditions, substrate and growth history. | Living barrier, lagoon, route hazard, habitat and restoration state. |
| Open Ocean | Distance from land, depth, current tendency, productivity and storm regime. | Routes, migrations, weather handoff and mobile content. |
| Deep Marine | Depth, pressure, geology, oxygen, vents, sediment and rift influence. | Progression, deep structures, rare resources and bosses. |
| Polar Marine | Temperature, ice formation, glacial coast and seasonal light. | Ice routes, polynyas, shelves and cold settlements. |

## 19.1 Slotting Process

1. Determine eligible biome families from hard environmental constraints.
2. Apply region identity, uniqueness budget and adjacency preferences.
3. Select a biome definition through its isolated seed stream.
4. Generate local mosaic and transition profile.
5. Create habitat, resource, structure and event sockets rather than directly spawning all content.
6. Validate minimum completeness and cross-system hooks.

# 20. Magical, Corrupted, Ancient and Transformed Marine Regions

Transformed marine content uses either an overlay on a base marine region or a dedicated region definition when topology, physical laws, ecology and civilisation logic change substantially.

| Transform Class | Required Source | Generation Effects |
| --- | --- | --- |
| Mana Current/Tide | Leyline intersection, mana source or ritual history. | Charge corridors, altered colour/particles, magic sockets and 26D field hook. |
| Spirit-Bound Sea | Sacred history, mass death, guardian or realm affinity. | Behavioural ecology slots, taboo routes, shrine/wreck evidence and event states. |
| Dream-Reflective Water | Dream realm leak, artefact or collective memory. | Unreliable maps, shifting presentation, dream islands and access rules. |
| Void-Thin Trench | Rift, failed portal, titan wound or dimensional fracture. | Distorted depth/route fields, void resources, containment and high-risk sockets. |
| Corrupted Coast | Source structure, runoff, curse, war or extraction damage. | Habitat loss, contaminated interfaces, spread profile and cleansing projects. |
| Ancient Machine Sea | Submerged world engine, coolant network or artificial basin. | Geometric bathymetry, machine islands, power routes and salvage. |
| Blessed/Restored Water | Guardian, ritual, ecosystem recovery or player project. | Improved habitat, safe route, cultural value and persistent restoration state. |

Every transformed region requires source ID, footprint, intensity, boundary, spread or persistence rule, readable clues, affected systems, counterplay, outcomes and save ownership. Random colour-swapped ocean patches are prohibited.

# 21. Underwater Caves, Caverns, Sinkholes and Flooded Systems

Underwater cave generation consumes geology, coast morphology, aquifers, faulting, sea level, volcanic tubes, ruins and deep-strata routes. It creates a connection graph before carving local geometry.

| Cave Type | Origin | Connections |
| --- | --- | --- |
| Sea Cave | Wave action, cliff weakness or lava tube. | Coast, intertidal access, chambers, smugglers, micro-dungeons. |
| Blue Hole/Sinkhole | Karst collapse or drowned cavern roof. | Shallow sea to deep cavern, aquifer and survey landmark. |
| Flooded Karst Network | Soluble rock and water-table history. | Inland sinkholes, springs, coastal outlets and cave settlements. |
| Lava Tube | Volcanic flow later flooded or submerged. | Volcanic island, geothermal fields, vents and ruins. |
| Submarine Canyon Cave | Fault or sediment-wall openings. | Shelf/slope route, deep access, creatures and wrecks. |
| Artificial Flooded Complex | Drowned mine, city, temple, fortress or machine. | Procedural history, structure sockets, breathable pockets and hazards. |
| Realm-Leak Cavern | Magical fracture linking water and special field. | Transformed liquid state, portals, rare resources and containment. |

## 21.1 Connectivity and Refuge

Cave graphs record entrances, depth, chamber air state, Water Body binding, flow interfaces, collapses, locks, pressure zones, structure sockets and emergency refuges. Early sea caves must not secretly transition into unavoidable abyssal hazards. Deep labyrinths require clues, staging locations and recovery routes.

# 22. Seafloor Geology, Sediment, Resources and Extraction Sockets

Seafloor substrate derives from basin geology, sediment transport summaries, biological growth, volcanism, ice, rivers and transformed states. It creates source conditions for resources without placing final registry entries directly.

| Province | Typical Substrate | Resource/Industry Hooks |
| --- | --- | --- |
| Sand Shelf | Sand, shell, gravel and buried channels. | Shells, salvage, aggregate, shallow deposits and aquaculture. |
| Rocky Shelf/Reef | Bedrock, boulders, biological crust and crevices. | Fisheries, building stone, rare organisms and lairs. |
| Delta Fan | Silt, clay, organic layers and buried debris. | Clay, fertility, methane/alchemy hooks, wreck burial and pollution. |
| Abyssal Plain | Fine sediment, nodules and isolated hardground. | Rare nodules, ancient remains, slow recovery and long expeditions. |
| Ridge/Seamount | Basalt, mineral crust, vents and talus. | Geothermal power, metal compounds, habitats and structures. |
| Trench | Unstable sediment, exposed fault rock and extraordinary deposits. | Endgame resources, quakes, void/realm materials and titans. |
| Living Reef/Ridge | Biological or magical construction. | Renewable resources with habitat health and extraction consequence. |

Extraction sockets include resource family tags, depth/access, tool or machine class, renewability, habitat sensitivity, contamination risk, ownership potential and recovery state. 24J and registry documents assign final materials and loot.

# 23. Underwater Structures, Wrecks, Dungeons, Wonders and Boss Territories

26C generates environmental sockets and origin constraints. Atlas 24G-24I and later Set 26 documents own final content definitions and encounter design.

| Content Family | Placement Contract | Required Generated Evidence |
| --- | --- | --- |
| Wreck | Valid historical route, battle, storm, reef, grounding, creature or catastrophe cause. | Debris direction, cargo/owner record, damage state, route clue and salvage depth. |
| Drowned Settlement | Prior coast/river/island habitation plus sea-level, subsidence, flood, war or magic history. | Roads, foundations, archives, ownership and transition from former land. |
| Lighthouse/Beacon Ruin | Hazardous approach, route junction or former political border. | Sightline, shoal/reef/strait relationship and chart marker. |
| Tidal Cave Dungeon | Coast morphology, tide window, chambers and discoverable entrance. | Tide handoff, flood interfaces, refuge and alternate failure state. |
| Reef Hive/Living Dungeon | Compatible reef health, ecology, scale and access. | Living structure source, habitat effect and transformation state. |
| Abyssal Vault | Deep geology, ancient history, pressure progression and route staging. | Clues in shallower regions, survey record and late-game access alternatives. |
| Vent Foundry | Vent/geothermal province, resources, cooling and industrial history. | Heat fields, power links, pollution or construct ecology. |
| Boss Territory | Habitat, route impact, prey/ecology change, signs and persistent aftermath. | Territory ID, warning envelope, encounter socket and alternate resolution hooks. |
| Wonder | Rare topology, origin, history and uniqueness budget. | World-readable silhouette or chart signature and protected placement. |

## 23.1 Socket Before Object

A socket contains eligibility and context, not an unavoidable spawn. Content selection occurs later using enabled packs, uniqueness budgets, progression requirements and history. When no suitable authored object exists, the socket may remain an environmental landmark or use an approved fallback family rather than forcing an incoherent structure.

## 23.2 Protected Anchors

Progression-critical or unique generated sites receive protection profiles. Ordinary erosion presentation, minor terrain repair or local fluid settling cannot delete them. Major events may damage, bury, flood, expose, relocate entrances or transition them to another state only through explicit rules.

# 24. Ecology, Spawn Habitat and Migration Interfaces

Marine generation creates habitat capacity and movement envelopes without assigning final species.

| Habitat Field | Purpose | Consumers |
| --- | --- | --- |
| Light Band | Surface, photic, twilight, dark or bioluminescent environment. | Plants, creatures, visibility and presentation. |
| Temperature/Salinity | Environmental compatibility and seasonal stress. | Ecology, resources, settlements and magic. |
| Substrate | Sand, mud, rock, reef, ice, vent, vegetation or artificial surface. | Spawns, burrows, attachment and harvesting. |
| Productivity | Abstract nutrient and producer capacity. | Fisheries, migration, predator density and settlement viability. |
| Shelter/Complexity | Crevices, kelp, reef, wrecks, caves or open water. | Nursery, ambush, settlement and encounter roles. |
| Disturbance | Storm, traffic, extraction, pollution, corruption and boss pressure. | Dynamic population and recovery systems. |
| Migration Corridor | Seasonal or persistent movement edge between habitats. | 24F ecology, fishing fleets, bosses, quests and route hazards. |
| Carrying Capacity | Bounded abundance range by habitat state. | Distant simulation and overharvest consequences. |

## 24.1 Ecology Completeness Gate

Every major marine biome instance must expose producer, consumer, threat, decomposer or justified sparse-ecology slots; renewable resource capacity; disturbance and recovery profiles; and at least one connection to neighbouring habitats. Deep or transformed regions may intentionally be sparse, but the reason must be encoded rather than left as missing content.

# 25. Settlement, Port and Harbour Suitability Generation

Settlement and harbour candidates are scored opportunities, not automatic settlements. 26J and civilisation documents decide which candidates become ports, shipyards, villages, forts or ruins.

## 25.1 Coastal Settlement Suitability

| Factor | Positive Conditions | Negative Conditions |
| --- | --- | --- |
| Fresh Water | River, spring, lake, aquifer lens, reliable rain catchment or import route. | No accessible source, salt intrusion, contamination or extreme drought. |
| Buildable Ground | Stable terrace, delta levee, sheltered cove floor, plateau or engineered site. | Active collapse, mobile dune, swamp without adaptation or narrow wave platform. |
| Food and Resources | Fisheries, farms, forests, deposits, trade or specialised industry. | Ecological dead zone or total import dependence without route value. |
| Route Purpose | Strait, river mouth, island stop, sheltered crossing, resource export or political border. | No useful connection or duplicated nearby candidate. |
| Defence | Headland, island, cliff, walls, controlled channel or safe retreat. | Unavoidable siege exposure, no evacuation or boss territory. |
| Hazard Strategy | Storm shelter, sea wall potential, raised ground, ice plan, warning network or magic. | Frequent lethal surge with no mitigation path. |
| Cultural Adaptation | Compatible structure, transport, food, clothing and law hooks. | No authored adaptation category available. |

## 25.2 Harbour Suitability

Harbour scoring is multi-dimensional. A natural harbour may be excellent for fishing boats but unsuitable for deep-draft warships. Scores are stored by vessel capability band.

| Harbour Field | Meaning |
| --- | --- |
| Shelter Class | Protection from prevailing wind, wave fetch, swell and storm direction. |
| Approach Depth | Minimum depth along a discoverable approach corridor. |
| Basin Depth/Area | Water volume available for anchorage, turning and docking. |
| Entrance Width | Navigable opening and defensive/choke implications. |
| Bottom/Substrate | Anchor holding, dredging difficulty, contamination and construction support. |
| Tidal Range Reference | Access windows, dry-fall potential and dock design requirements. |
| Current/Surge Exposure | Manoeuvring risk and mooring load input for 26D/26G. |
| Shore Access | Stable location for docks, roads, storage and settlement expansion. |
| Freshwater/Resource Access | Crew supply, repair materials and trade purpose. |
| Expansion Potential | Dredging, breakwater, canal, lock or reclamation opportunities. |
| Ecological Sensitivity | Habitat value and consequences of port construction. |
| Strategic Value | Strait, route junction, naval control, resource export or rescue stop. |

## 25.3 Candidate Diversity

The generator should create a range of candidate quality. Not every good harbour becomes occupied; some remain wilderness, ruins, pirate coves, monster territory or player opportunities. The world must avoid placing every civilisation at perfect sites, because historical constraint, conflict, culture and catastrophe are part of the living-world promise.

# 26. Navigability, Draft, Shelter and Vessel Capability Fields

World generation supplies route-relevant environmental truth. Vessel systems decide whether a specific craft can use it.

| Field | Definition | Later Consumer |
| --- | --- | --- |
| Minimum Navigable Depth | Lowest baseline depth along a corridor before tide and local deltas. | 26G draft/grounding. |
| Minimum Width | Narrowest passable horizontal corridor at the evaluated scale. | Vessel beam, steering and convoy rules. |
| Overhead Clearance | Bridge, cave, ice, root, ruin or gate clearance. | Mast/height and submersible navigation. |
| Obstruction Density | Reef, shoal, wreck, vegetation, ice or debris complexity. | Navigation difficulty, charts and AI routing. |
| Shelter Class | Protection from wind/wave exposure. | Anchoring, storm avoidance and port use. |
| Exposure Class | Open fetch and severe-weather susceptibility. | 26D waves/storms and 26G sea-worthiness. |
| Current Tendency | Baseline corridor direction and magnitude profile ID. | 26D dynamic currents and 26G travel cost. |
| Tidal Constraint | Depth/access sensitivity to tide band. | 26D tide state and route scheduling. |
| Seasonal Constraint | Ice, drought, flood, storm belt or migration closure. | Events, charts, trade and AI planning. |
| Survey Confidence | Unknown, rumoured, charted, measured or recently verified. | UI, route risk and player knowledge. |

## 26.1 Capability Bands

Routes are tagged for broad capability rather than hardcoded vessel names:

- Wading/intertidal access.
- Canoe/raft and very shallow craft.
- Riverboat and shallow-draft cargo craft.
- Coastal vessel.
- Ocean-going vessel.
- Heavy/deep-draft vessel.
- Submersible or pressure-capable vehicle.
- Magical/extraordinary traversal.

A route may support several bands under different tide, weather or infrastructure states.

# 27. Marine Route Graphs, Island Hops, Canals and Crossing Classes

Marine route generation creates a graph of opportunities and constraints before NPC fleets or player charts exist.

| Route Class | Typical Form | Required Nodes |
| --- | --- | --- |
| Littoral Route | Coast-following passage with frequent shelter. | Beaches, coves, river mouths, small ports and landmarks. |
| River-Sea Route | Navigable river reach connected to estuary and coast. | Inland settlement candidates, portage/locks and sea outlet. |
| Island-Hop Route | Short crossings between islands and anchorages. | Freshwater/shelter stops, passage depth and hazard alternatives. |
| Shelf Route | Offshore but shallow regional lane. | Banks, reefs, ports, weather exposure and fishing grounds. |
| Deep Crossing | Long open-ocean path between regions. | Departure/arrival staging, forecast access, rescue and alternate timing. |
| Strait/Chokepoint | Restricted inter-basin passage. | Strategic ownership, currents, defences and bypass possibilities. |
| Polar/Seasonal Route | Ice- or weather-dependent corridor. | Seasonal profile, refuges and closure state. |
| Mana/Extraordinary Route | Magical current, gate chain or protected path. | Power/source, instability, knowledge and counterplay. |
| Canal/Lock Route | Generated or player-built artificial connection. | Water-level transitions, control structures, owner and maintenance. |

## 27.1 Route Graph Rules

- Routes connect meaningful nodes and may cross several Marine Regions.
- Every progression-required crossing has at least one viable category of route, alternate method or deferred-access classification.
- Hazards add preparation and route choice; they do not create invisible unavoidable death corridors.
- NPC pathing may use abstract route edges at distance and detailed corridors near players.
- Player-created shortcuts become graph deltas after validation.

# 28. Discovery, Naming, Maps, Charts, Rumours and Survey Data

The world stores generated identity separately from player knowledge. A Marine Region can exist authoritatively while remaining unnamed or incorrectly charted by a player or culture.

| Knowledge Layer | Information | Reliability |
| --- | --- | --- |
| Direct Observation | Shore shape, island silhouette, visible shoals, storms, current cues and structures. | High locally; limited by range and visibility. |
| Environmental Inference | Birds, foam, water colour, kelp, wrecks, sound, temperature and debris. | Useful but incomplete. |
| Local Knowledge | Fishing grounds, taboo water, seasonal passes, hidden coves and creature territory. | Culture-dependent and potentially biased. |
| Chart | Coast, depth bands, routes, hazards, ports and ownership as known when authored. | Accuracy depends on age, author and survey level. |
| Survey Tool | Depth, current, salinity, pressure, magic, obstruction and route confidence. | Equipment-limited measured data. |
| Codex/Research | Confirmed biome, geology, ecology, history and system facts. | Highest player-facing confidence. |

## 28.1 Naming Layers

Generated records may have:

- Internal stable ID.
- Procedural geographic name.
- Culture-specific exonym/endonym.
- Faction or chartmaker label.
- Player-assigned name.
- Historical or sacred name.
- Unknown/rumoured placeholder.

Renaming never changes stable identity. Map UI must distinguish observed fact, chart claim, rumour and player annotation.

# 29. Procedural Guarantees, Fallbacks and Progression Safety

Guarantees operate on categories and bounded search, not fixed locations.

| Guarantee | Production Rule |
| --- | --- |
| Valid Start | Every start has shelter resources, food or trade path, basic tools, freshwater or a clear acquisition path, and avoidable immediate lethal hazards. |
| Marine Introduction | Worlds with significant seas expose shore, craft knowledge, settlement, salvage or route clues before marine travel becomes required. |
| Vessel Progression | At least one path to basic water travel exists through crafting, NPC teaching, salvage, trade or alternative technology within bounded progression. |
| Freshwater | Coastal/island starts provide local source, reliable collection, settlement access or discoverable escape. |
| First Harbour/Anchorage | A suitable basic landing/anchorage category exists within bounded coastal exploration on oceanic starts. It need not be a settlement. |
| Deep Discovery | Deep content has shallower clues and more than one later access category. |
| Route Continuity | No mandatory region is isolated by impossible depth, width, weather or missing infrastructure. |
| Recovery | Ordinary procedural topology cannot permanently trap the player; rescue, recall, repair, alternate route or world-setting safeguards exist. |
| Content Diversity | Required progression does not depend upon one named biome, species, dungeon, port or faction. |

## 29.1 Fallback Order

1. Search valid candidates in preferred region and range.
2. Broaden compatible definitions without violating hard constraints.
3. Create a new candidate socket using approved fallback grammar.
4. Offer alternate acquisition, trade, salvage or knowledge path.
5. Mark content deferred-access rather than spawning an incoherent exception.
6. Fail the seed validation when the guarantee still cannot be satisfied.

Hidden teleporting resources or invisible correction after the player arrives are prohibited except as explicit recovery tools exposed to the player.

# 30. Player-Created Water Bodies, Canals, Reservoirs and Promotion Rules

Small excavations remain local 26B fluid islands. A player-created or civilisation-created feature is promoted to a persistent Water Body when it exceeds configured size, longevity, connectivity or strategic-use thresholds.

| Promotion Trigger | Example |
| --- | --- |
| Persistent Connected Volume | A large reservoir or quarry lake remains stable across save cycles. |
| Route Function | Canal creates a valid connection between existing Water Bodies. |
| Civilisation Function | Irrigation lake, harbour basin, water supply or industrial cooling system becomes settlement infrastructure. |
| Named/Claimed Feature | Player or faction formally registers and maintains the feature. |
| Simulation Need | Abstract record is cheaper and safer than retaining a permanently active fluid island. |

## 30.1 Promotion Workflow

1. Validate containment, source/sink and connectivity through 26B.
2. Generate persistent Water Body ID and provenance record.
3. Store base footprint as world delta, not root-seed terrain.
4. Add graph edges to connected Water Bodies.
5. Recalculate route, harbour, ecology and settlement sockets within bounded influence.
6. Preserve ownership, permissions and construction history.
7. Notify maps and NPC simulation through events rather than direct cross-system mutation.

## 30.2 Canal and Lock Rules

A canal must encode width, depth, water-level relation, locks or lifts, banks, control structures, owner, maintenance, route classes and failure states. Merely connecting two water cells does not automatically create a navigable interregional route.

# 31. Dynamic Shorelines, Sea-Level Events and Persistent World Deltas

Daily tides and ordinary waves alter presentation and local accessibility but do not rewrite world topology. Persistent change requires a world-delta event.

| Change Class | Examples | Persistence Rule |
| --- | --- | --- |
| Presentation Only | Foam, wet sand, ordinary tide line and small wave run-up. | Derived from current fields; not saved as terrain. |
| Local Temporary | Storm water, debris, short-lived sandbar or ice movement. | Runtime/event state with expiry or collapse rules. |
| Persistent Local Delta | Breached dune, dredged channel, collapsed cave mouth, repaired sea wall. | Saved block/topology delta linked to Coast Segment or structure. |
| Regional State Change | Major eruption, glacial retreat, magical sea-level event, river avulsion. | Versioned event record and bounded regeneration/delta operation. |
| Permanent Historical Transition | Drowned city, new volcanic island, sealed void trench or restored reef province. | New state linked to procedural history; old state retained in history. |

## 31.1 Shoreline Change Safeguards

- Unique sites use explicit damage, relocation, burial or state-transition rules.
- Settlement populations receive warning, evacuation, defence or disaster-resolution hooks where appropriate.
- Major changes update charts, routes, ecology and ownership through events.
- Deltas cannot silently invalidate saves or regenerate settled terrain.
- Dynamic change frequency and severity remain configurable.

# 32. Climate, Wind, Tide, Current, Wave and Storm Handoff to 26D

26C establishes static and baseline generation fields. 26D owns time-varying environmental simulation.

| 26C Output | Meaning | 26D Responsibility |
| --- | --- | --- |
| Prevailing Wind Exposure | Coast/basin orientation and broad climate tendency. | Dynamic wind vectors, gusts, fronts and forecast. |
| Wave Fetch Profile | Open-water distance and barrier geometry by direction. | Wave height, period, direction, swell and severe states. |
| Tide Regime ID | Basin geometry, astronomical/magical profile and coast sensitivity class. | Tide phase, timing, range variation and local access effects. |
| Current Corridor | Baseline route tendency from basin geometry, climate and exchange. | Dynamic velocity, seasonal shifts, eddies and event changes. |
| Storm Susceptibility | Climate band, basin exposure, warm-water/ice/magic inputs. | Storm formation, tracks, intensification, warnings and damage. |
| Surge Sensitivity | Coast shape, shelf slope, tide and storm orientation. | Water-level surge, flooding inputs and evacuation state. |
| Ice Regime | Temperature, salinity, currents and coast type. | Freeze/break cycles, pack movement and seasonal routes. |
| Mana/Extraordinary Field Socket | Source and marine footprint. | Mana tides, magical storms and changing field effects. |

> **No Duplicate Truth Rule**
>
> 26C may provide deterministic baseline values used when weather simulation is inactive or distant. It must not implement a separate hidden wave, tide or current system that disagrees with 26D.

# 33. Simulation LOD, Streaming and Unloaded-World Processing

Marine world topology persists at all ranges, while detail changes by simulation level.

| Range | Detailed State | Abstract State |
| --- | --- | --- |
| Immediate | Terrain, coast blocks, local fluids, structures, creatures, vessels, collision, weather presentation and interactions. | None for authoritative local interaction. |
| Local Region | Simplified water surface, route traffic, habitat activity, weather fields, structure state and local deltas. | Aggregated updates for off-screen details. |
| Distant Region | No individual waves, actors or moving cargo required. | Water Body state, route availability, population/habitat summaries, ownership, danger and events. |
| Unloaded | No geometry or scene nodes. | Stable generated records, deltas, scheduled events and discovery state. |

## 33.1 Streaming Manifest

Each region/chunk receives compact references to:

- Parent Water Body and Marine Region.
- Coast Segment or island membership.
- Bathymetry/substrate profile.
- Biome mosaic and presentation palette.
- Local-interface activation markers for 26B.
- Route and harbour candidate segments.
- Content sockets and protected anchors.
- Persistent deltas and unresolved events.

Promotion from abstract to detailed simulation must reconstruct the same state regardless of load order.

# 34. Persistence, Save Reconstruction, Migration and Recovery

## 34.1 Save Principle

The save stores generated identity and persistent difference, not a duplicate copy of untouched ocean terrain.

| Saved Record | Examples |
| --- | --- |
| World Generation Header | Root seed, generation version, pack manifest and world preset. |
| Generated Identity Overrides | Explored-region frozen records, migrated IDs and mixed-version policy. |
| Marine Deltas | Dredging, reclamation, breached barriers, new islands, changed channels and damaged reefs. |
| Water Body Deltas | Artificial connections, control structures, contamination, promoted reservoirs and changed ownership. |
| Route State | Discovered, charted, blocked, maintained, patrolled or abandoned. |
| Discovery/Names | Player maps, culture knowledge, renamed places and survey confidence. |
| Protected Content State | Structure, dungeon, boss territory, wonder and historical transition records. |

## 34.2 Reconstruction Order

1. Load generation header and approved migrations.
2. Recreate base topology and stable definitions.
3. Restore frozen generated-instance records where required.
4. Apply terrain and Water Body deltas transactionally.
5. Restore structures, routes, ownership, ecology and event summaries.
6. Validate graph integrity and recover orphaned references.
7. Materialise loaded chunks and activate local 26B interfaces.

## 34.3 Migration Rules

- IDs are never reused for unrelated generated entities.
- Removed definitions require aliases, fallback profiles or preserved embedded records.
- Topology-changing migrations run offline or through explicit world-upgrade tools, never during ordinary frame updates.
- Migration failure retains the last valid save and emits a readable diagnostic.
- Unresolved orphaned deltas are quarantined and reported rather than silently discarded.

# 35. Multiplayer Authority and Replication Boundaries

The server/host owns generated instance records, accepted deltas, discovery permissions and world-changing operations.

| Operation | Authority Rule |
| --- | --- |
| World Generation | Server generates or loads authoritative records; clients receive manifests and proofs/checksums as needed. |
| Terrain/Coast Edit | Client requests validated edit; server applies block and topology delta. |
| Canal/Water Body Promotion | Server validates 26B state, graph safety, permissions and cost before creating record. |
| Naming/Chart Sharing | Server stores authoritative shared map data; private annotations may remain local. |
| Route Recalculation | Server updates persistent route graph; clients interpolate UI and navigation hints. |
| Modded Definitions | Server pack manifest is authoritative; clients must satisfy compatibility policy. |

Clients may generate visual terrain deterministically from the same seed when safe, but the server remains authoritative for explored-instance freezes, deltas, ownership and any record affected by procedural-history or pack differences.

# 36. Registry, Schema and Data Ownership Foundations

Final schema names are approved through Set 25. 26C requires the following definition and runtime families.

## 36.1 Definition Families

- Ocean Basin Profile.
- Marine Region Profile.
- Coast Morphology Profile.
- Island Origin and Archipelago Profile.
- Bathymetry Feature Profile.
- Inland Water and Aquifer Profile.
- Marine Biome Placement Profile referencing Atlas entries.
- Harbour and Navigability Scoring Profile.
- Route Class Profile.
- Content Socket Profile.
- Dynamic Shoreline/Regional Transition Profile.
- Worldgen Validation Rule and failure-code definition.

## 36.2 Generated Instance Families

- BasinInstance.
- WaterBodyInstance compatible with 26B.
- MarineRegionInstance.
- CoastSegmentInstance.
- IslandRegionInstance and ArchipelagoRelation.
- RiverReach/Lake/Aquifer instance.
- BathymetryProvinceInstance.
- NavigableCorridor and HarbourCandidate.
- MarineRouteEdge and RouteNode.
- ContentSocketInstance.
- MarineStateDelta and DiscoveryRecord.

## 36.3 Common Required Fields

| Field Group | Fields |
| --- | --- |
| Identity | id, parent_id, definition_id, display_name_key, version, generation_version, pack_id. |
| Provenance | root_seed_hash, derived_seed_key, generation_stage, source relations and history IDs. |
| Topology | polygon/volume bounds, adjacency, parent Water Body, depth/elevation range and connection edges. |
| Environment | climate references, temperature, salinity, clarity, pressure, substrate, light and magic fields. |
| Navigation | minimum depth/width/clearance, exposure, obstruction, capability tags and seasonal constraints. |
| Civilisation | freshwater, settlement, harbour, defence, resources, route purpose and ownership candidates. |
| Content | biome IDs, habitat slots, resource sockets, structure sockets, dungeon/boss/wonder compatibility. |
| State | discovered, named, damaged, transformed, controlled, protected, migration and delta references. |
| Technical | streaming class, LOD, chunk bindings, validation flags, checksum and diagnostics. |

# 37. Godot/Summer Engine Technical Boundaries

This document defines responsibilities, not a final codebase. 26O owns the final technical plan.

## 37.1 Required Runtime Responsibilities

- Data-oriented deterministic generation jobs.
- Stable ID and relationship graph service.
- Spatial partition for basin, region, coast, island and socket queries.
- Chunk instruction generation from compact records.
- Water Body surface/depth binding to 26B.
- Route and harbour query service.
- Seed validation and reproducibility tooling.
- Save-delta application and migration.
- Debug overlays for IDs, depth bands, coasts, routes, sockets and failures.

## 37.2 Godot Principles

- Do not create one Node per ocean cell, coast sample or bathymetric voxel.
- Use Resources or validated external data for immutable definitions.
- Use compact arrays, grids, graphs and region records for generated state.
- Generate terrain/mesh/collision asynchronously with bounded main-thread commits.
- Separate authoritative topology from shader surfaces, wave meshes, audio and particles.
- Use MultiMesh, chunk meshes and LOD for repeated marine vegetation/props where appropriate.
- Navigation for vessels should consume corridor graphs and local avoidance, not global high-resolution water meshes.
- Editor and Summer Engine tools may orchestrate generation tests but may not become a hidden runtime dependency.

## 37.3 Determinism Boundary

Floating-point rendering variation is acceptable. Record identity, candidate selection, topology, guarantees and persistent outcomes must be deterministic within the supported platform policy. Algorithm inputs and random streams must be logged sufficiently to reproduce failed seeds.

# 38. Performance Budgets and Scalability Targets

All numbers below are prototype targets, not final platform promises.

| Budget Area | First-Pass Target |
| --- | --- |
| Initial World Frame | Generate global/coarse topology without materialising full voxel terrain. |
| Regional Generation | Bounded asynchronous jobs with no long uninterruptible main-thread operation. |
| Record Density | Prefer one persistent record per meaningful region/segment/feature, not per voxel. |
| Coast Segmentation | Segment only on meaningful field changes; merge tiny noise-driven segments. |
| Route Graph | Sparse graph with local corridor refinement near active vessels. |
| Bathymetry | Multi-resolution fields; high resolution only near loaded terrain and content anchors. |
| Validation | Parallel seed checks and compact failure reports; no need to load art assets. |
| Save Size | Generated base omitted; deltas compressed and spatially indexed. |
| Multiplayer Join | Stream nearby manifests and state first; distant charts/records on demand. |

## 38.1 Scalability Levers

- World size and ocean proportion.
- Basin and Marine Region count.
- Island density and minimum separation.
- Coast detail scale.
- Bathymetry resolution.
- Content-socket density.
- Route-graph refinement distance.
- Dynamic shoreline severity.
- Discovery/map detail.
- Ecology and traffic simulation range.

The lowest setting must preserve topology and gameplay truth. It may reduce visual detail, minor islands, local props and distant simulation, but cannot replace navigable channels or move persistent records.

# 39. Prototype Laboratories, Seed Suites and Acceptance Tests

## 39.1 Required Laboratories

| Laboratory | Purpose | Pass Evidence |
| --- | --- | --- |
| Basin Lab | Generate basin skeletons across presets and seeds. | Coherent land-water ratio, shelves, deep provinces and connections. |
| Coast Lab | Visualise segmentation, morphology, exposure, sediment and harbour scores. | Transitions are readable and not fragmented by noise. |
| Island Lab | Generate each origin family and archipelago graph. | Origin, age, freshwater, silhouette and route identity remain distinct. |
| Hydrology Lab | Trace rivers, lakes, estuaries, aquifers and outlets. | No invalid uphill flow, missing sink or broken Water Body edge. |
| Bathymetry Lab | Render depth bands, channels, shoals, canyons and trenches. | Navigable routes and progression bands are visible and valid. |
| Harbour/Route Lab | Score vessel capability corridors and candidate ports. | Scores explainable; no route relies on hidden impossible passage. |
| Underwater Lab | Generate seafloor, caves, sockets and protected sites. | Depth, access, refuge, structure and progression relationships pass. |
| Delta Lab | Apply canal, dredging, breach, reclamation and new-island deltas. | Save/reload preserves graph and chunk continuity. |
| Migration Lab | Load earlier generation versions and changed content packs. | Stable records retained or migrated with readable diagnostics. |
| Multiplayer Lab | Join, stream, edit and discover marine regions. | Server/client records agree; reconnect restores state. |

## 39.2 Seed Suite

Every build that changes generation must test:

- Small balanced world.
- Large world with several basins.
- Oceanic archipelago world.
- Dry/continental world with reduced seas.
- Inland-sea world.
- Polar-heavy world.
- Volcanic island-chain world.
- High-magic transformed-sea world.
- Low-magic world.
- Harsh-depth world.
- Modded-content-pack world.
- Existing-save migration world.

## 39.3 Acceptance Rules

A seed passes only when topology, hydrology, coast coherence, navigability, freshwater, progression, content slots, uniqueness, save safety and performance gates all pass. Visual appeal cannot excuse a broken guarantee, and a technically valid world cannot pass if every coast and island feels functionally identical.

# 40. Risks, Failure Modes and Redesign Triggers

| Risk | Failure Example | Required Control |
| --- | --- | --- |
| Empty Ocean | Huge water distance with no routes, ecology, islands, structures or decisions. | Region completeness, route spacing and content-socket budgets. |
| Coast Noise | Thousands of tiny segments and unusable jagged shoreline. | Multi-scale geometry, merge thresholds and morphology-first rules. |
| Repetitive Islands | Same volcano silhouette and biome package repeated. | Origin/age variation, uniqueness budgets and neighbouring comparison. |
| Broken Hydrology | Rivers stop, climb, miss seas or create impossible estuaries. | Directed graph validation and fallback rerouting. |
| Inaccessible Progression | Required resource/knowledge placed beyond abyssal access. | Category guarantees and access-class validation. |
| Perfect-Port Spam | Every bay becomes a harbour and settlement. | Scored candidates, occupancy budgets, history and ecology constraints. |
| No Safe Route | Storm belts, reefs or depth make all crossings impossible. | Capability-band route validation and alternate timing/methods. |
| Save Drift | Generator update moves an explored island or coast. | Frozen records, versioning, deltas and migration. |
| Runtime Explosion | High-resolution global bathymetry or nodes per cell. | Multi-resolution fields and data-oriented records. |
| Duplicate Truth | 26C and 26D/26B disagree on surface, current or tide. | Explicit handoff fields and ownership tests. |
| Mod Instability | New pack reshuffles all generated content. | Isolated random streams, namespaced IDs and local recomputation. |

## 40.1 Redesign Triggers

The architecture must be reconsidered before content scale-up when any of the following is observed:

- Record identity changes when unrelated content definitions are added.
- Loaded and reloaded coasts differ without a stored delta.
- Water Body graph repair becomes common rather than exceptional.
- Route validation requires hidden teleports or manual seed patches.
- Small-world presets cannot preserve meaningful marine progression.
- Large-world generation cannot complete within bounded asynchronous jobs.
- Harbour scores cannot explain player-visible suitability.
- Underwater content requires a second incompatible terrain generator.
- 26D cannot consume generated field profiles without duplicating topology.

# 41. Production Classification and Relationship with Set 25

Document 26C defines the complete target contract, not an automatic first-release commitment.

| Classification | Example Scope |
| --- | --- |
| Foundation/Core | Stable Water Bodies, basin/sea/coast/island records, basic bathymetry, river outlets, navigability, save reconstruction and validation. |
| First Maritime Slice Candidate | One or more coast families, shallow sea, basic island archetypes, harbour candidates, coastal routes and limited underwater sockets. |
| Expansion Production | Full biome family coverage, deep regions, complex archipelagos, transformed seas, underwater settlements and broad route simulation. |
| Deferred/Experimental | Global sea-level transformation, moving islands, very large artificial canals and highly dynamic geological change. |

Set 25 determines admission, milestone, evidence, registry readiness, asset budget and risk status. 26C supplies dependencies, validation gates, implementation questions and content-package completeness criteria.

## 41.1 Dependency on Amended 25A-25B

When amended 25A-25B are available, this document must be checked for:

- Qualified ID format and namespace ownership.
- Definition versus runtime-record separation.
- Schema inheritance and facet rules.
- Validation severity and release-gate terminology.
- Pack dependency and migration contracts.
- Production-classification labels.

This check may refine field names but must not remove stable generated identity, relationship-first generation or source ownership.

# 42. Main-Document, Atlas and Forge Integration Matrix

| Owner/Document | Required Update or Consumption |
| --- | --- |
| 00 - Master Bible | Add maritime exploration, ports, vessels and ocean civilisation to long-term fantasy while preserving sandbox freedom. |
| 01 - Core Gameplay Loop | Add coastal/island starts, maritime travel, charting, salvage, route planning and underwater expansion examples. |
| 02 - Player Progression | Add navigation, shipwright, diving, charting and marine research paths without class locks. |
| 03 - Blocks | Add marine substrates, water-state fields, sealing/corrosion and generation tags. |
| 04 - Items | Add charts, survey tools, marine materials, diving equipment and ship components later owned by relevant documents. |
| 05 - Recipes | Add vessel, port, diving, waterworks and marine processing recipe hooks. |
| 06 - Resources | Add marine source conditions, renewability, extraction depth and habitat consequence. |
| 07 - NPC/Village | Add coastal/island settlement suitability, maritime jobs, ports and water-route simulation hooks. |
| 08 - Automation | Consume aquifer, current, tide, harbour and waterworks interfaces for pumps, locks and logistics. |
| 09 - Magic | Consume transformed-sea fields, mana currents, underwater wards and water-magic hooks. |
| 10/24F - Creatures/Ecology | Populate habitat and migration slots; define marine creature rosters and pressure/depth compatibility. |
| 11 - Biomes/Worldgen | Replace broad/POC marine assumptions with 24A-24C plus 26B-26D production contracts. |
| 12/24I - Structures | Populate harbour, coast, island, underwater and route sockets with final structures. |
| 13/24E - Peoples/Cultures | Define environmental adaptation and maritime cultures without ancestry-biome locks. |
| 14/24D - Dimensions | Define dimension-specific oceans separately while reusing compatible contracts. |
| 15/24K - Quests/Events | Consume generated records, discovery state, route changes, storms and persistent deltas. |
| 16 - Combat/Defence | Consume underwater terrain, pressure, visibility, routes and environmental hazards. |
| 17 - UI/UX | Build maps, depth charts, route confidence, harbour inspection, survey and generation diagnostics. |
| 18/26O - Technical | Replace obsolete engine direction with Godot data architecture, performance and test plan. |
| 21-23 Forge Sets | Add coast/island/underwater preview stages, palette authoring, sockets, ambience and validation overlays. |
| 24C | Remains authored marine environmental content authority. 26C consumes its definitions and reports missing executable fields. |
| 26B | Supplies Water Body and local-fluid mechanics. |
| 26D | Consumes baseline marine field profiles and owns dynamic weather/wave/tide/current simulation. |
| 26E-26O | Consume depth, access, route, harbour, terrain, socket and persistence fields according to ownership. |

# 43. Decision Register

| ID | Decision | Status |
| --- | --- | --- |
| 26C-001 | Marine generation is relationship-first and multi-stage, not water-filled terrain noise. | Locked. |
| 26C-002 | Atlas 24C remains marine content authority; 26C owns executable generation contracts. | Locked. |
| 26C-003 | Stable Water Body graph is shared with 26B. | Locked. |
| 26C-004 | Oceans are represented by basin/region records plus chunk terrain, not active cells everywhere. | Locked. |
| 26C-005 | Coast Segments are persistent interfaces between land and water regions. | Locked. |
| 26C-006 | Islands are generated from origin, age and freshwater before biome/content. | Locked. |
| 26C-007 | Bathymetry uses structural hierarchy before local noise. | Locked. |
| 26C-008 | Harbour and navigability are scored by capability band. | Locked. |
| 26C-009 | Required progression uses category guarantees and fallbacks, never named sites. | Locked. |
| 26C-010 | Player-created large waterworks may be promoted to persistent Water Bodies. | Locked direction; thresholds prototype. |
| 26C-011 | Ordinary tide/wave presentation does not rewrite terrain; persistent shoreline change is delta-owned. | Locked. |
| 26C-012 | 26D owns dynamic wind, tide, current, wave and storm behaviour. | Locked. |
| 26C-013 | Generated base plus save deltas remains the persistence model. | Locked. |
| 26C-014 | Godot runtime must avoid Node-per-cell marine representation. | Locked boundary. |
| 26C-015 | Numerical thresholds remain prototype targets pending 26O evidence. | Open for tuning. |

# 44. Handoff to Document 26D

Document 26D must consume the generated topology and baseline-field contracts in this document. It must not regenerate oceans, coasts or routes from an independent weather map.

26D must define:

- Atmospheric and marine climate hierarchy.
- Prevailing and dynamic wind fields.
- Wave state, swell, fetch, breaking and coastal response.
- Tide profiles, phase, regional range and extraordinary tides.
- Current fields, seasonal change, local eddies and route influence.
- Storm formation, movement, severity, forecast, warnings and dissipation.
- Storm surge, coastal flooding input and 26B local-interface activation.
- Fog, visibility, sea ice, waterspouts and magical weather where approved.
- Vessel, port, NPC, ecology, combat and structure response interfaces.
- Difficulty, accessibility, LOD, persistence, multiplayer and performance.
- Clear separation between authoritative environment state and Presentation Forge effects.

> **26C Completion Statement**
>
> Document 26C establishes Leyforge's executable marine world-generation foundation. It defines deterministic basin, Water Body, Marine Region, Coast Segment, island, inland-water, bathymetry, habitat, harbour, navigability, route, underwater-content, discovery, persistence, validation and Godot/Summer Engine contracts. The set may now proceed to 26D without treating oceans as empty boundaries, duplicating 26B fluid mechanics, replacing Atlas 24C authored content, retaining fixed POC geography or allowing generation updates to silently rewrite explored worlds.

# Appendix A. Canonical Glossary

| Term | Definition |
| --- | --- |
| Basin Skeleton | Coarse world-scale shape of ocean depressions, ridges, margins and enclosed seas. |
| Marine Region | Persistent basin subdivision with coherent environmental and gameplay fields. |
| Coast Segment | Stable land-water interface record divided at meaningful morphology/system changes. |
| Water Body Graph | Nodes and exchange edges connecting oceans, seas, rivers, lakes, aquifers and artificial waterworks. |
| Bathymetric Province | Area of coherent seafloor depth/relief identity. |
| Harbour Candidate | Scored location suitable for one or more vessel/settlement capability bands. |
| Navigable Corridor | Water route segment with depth, width, obstruction, exposure and seasonality fields. |
| Content Socket | Context-rich deterministic opportunity for later authored content selection. |
| Generated Base | Reconstructible seed-derived world identity. |
| Frozen Instance | Generated record preserved for an explored/stateful region across generator updates. |
| World Delta | Persistent change layered over generated base. |
| Promotion | Conversion of a persistent large local-fluid feature into a Water Body record. |
| Survey Confidence | Player/faction knowledge quality for depth, route, hazard or resource data. |
| Protected Anchor | Unique or critical generated site guarded from accidental ordinary terrain change. |

# Appendix B. Marine Region, Coast, Island and Water Body Record Templates

## B.1 Marine Region Record

| Field Group | Required Fields |
| --- | --- |
| Identity | marine_region_id, definition_id, parent_basin_id, display_name layers, version, pack_id. |
| Provenance | root_seed_hash, derived_seed_key, generation stage, history IDs. |
| Geometry | bounds, area class, depth range, shelf/deep provinces, coast and neighbour IDs. |
| Environment | temperature profile, salinity, clarity, productivity, ice, magic and baseline field references. |
| Navigation | route nodes, obstruction, exposure, shelter, capability and seasonal tags. |
| Content | biome instances, habitat slots, resource sockets, structures, dungeons and boss compatibility. |
| State | discovery, ownership, transformed state, ecology condition and delta references. |
| Technical | streaming, LOD, checksum, validation status and migration policy. |

## B.2 Coast Segment Record

| Field Group | Required Fields |
| --- | --- |
| Identity | coast_segment_id, land_region_id, marine_region_id, Water Body ID. |
| Geometry | polyline/bounds, orientation, length, slope, intertidal width and local elevation range. |
| Morphology | profile ID, substrate, river input, glacial/volcanic/reef/history modifiers. |
| Exposure | wave fetch profile, prevailing wind reference, tide regime, surge sensitivity. |
| Suitability | landing, harbour bands, settlement, caves, wetlands, defences and infrastructure. |
| Content | biome mosaic, habitat slots, resource and structure sockets. |
| State | erosion/accretion class, protected anchors, ownership, damage and delta references. |

## B.3 Island Region Record

| Field Group | Required Fields |
| --- | --- |
| Identity | island_id, archipelago_id, origin_profile_id, age band and names. |
| Geometry | footprint, relief, coast segments, shelf relation and highest/lowest points. |
| Environment | climate, catchments, freshwater budget, soils, geology and hazard profile. |
| Content | biome mosaic, endemic habitat slots, resource/structure sockets and history. |
| Civilisation | settlement capacity, harbour candidates, route role, defence and import dependence. |
| State | ownership, disaster, ecology, discovered/charted and delta references. |

## B.4 Water Body Record Extension

| Field Group | Required Fields |
| --- | --- |
| Identity | water_body_id, class, parent/child IDs, definition and generation version. |
| Surface | reference surface profile, local query binding and tide/wave/current handoff IDs. |
| Volume/Geometry | bounds, depth class, connected bodies and boundary interfaces. |
| Chemistry | base liquid, salinity/clarity/temperature tendency and special-state references. |
| Hydrology | inflow, outflow, exchange, recharge and artificial-control edges. |
| Navigation | navigability summary, routes, harbour nodes and capability bands. |
| Persistence | generated/promotion provenance, delta owner, migration and recovery state. |

# Appendix C. Deterministic Generation Dependency Graph

| Output | Hard Dependencies | May Run in Parallel With |
| --- | --- | --- |
| Basin Skeleton | Root seed, world preset, plate/elevation and water level. | Macro climate field after shared world frame. |
| Hydrology | Land relief, climate precipitation, geology. | Basin detail refinement. |
| Water Body Graph | Basin skeleton, hydrology and outlet classification. | Broad marine climate baseline. |
| Marine Regions | Water Bodies, bathymetric skeleton, climate and special fields. | Coast preliminary segmentation. |
| Coast Segments | Land regions, Water Bodies, marine exposure, rivers and substrate. | Island local relief after origin placement. |
| Islands | Basin/shelf geometry, origin profiles, climate and route-spacing constraints. | Deep-province detail away from islands. |
| Bathymetric Detail | Basin, margins, islands, geology and river/sediment inputs. | Region naming/history preparation. |
| Biome Slotting | Depth, climate, chemistry, substrate and Atlas definitions. | Habitat/resource socket creation by region. |
| Harbour/Route Fields | Coast, bathymetry, exposure baseline, freshwater and obstacles. | Structure-socket eligibility. |
| History/Names | Stable generated records and procedural history graph. | Final validation and chart layer. |
| Chunk Materialisation | All authoritative local records and deltas. | Neighbouring chunk jobs with seam contracts. |

# Appendix D. Harbour, Navigability and Route Suitability Matrices

## D.1 Harbour Band Example

| Band | Baseline Requirement | Typical Users |
| --- | --- | --- |
| Landing | Safe shore contact or beaching, minimal depth and basic shelter. | Rafts, canoes, small boats and rescue. |
| Small Harbour | Protected basin, shallow approach, mooring and shore access. | Fishing, ferries, river/coastal craft. |
| Regional Port | Reliable approach, turning area, storage ground, freshwater and route value. | Merchants, patrols, cargo and passenger vessels. |
| Deep-Water Port | Deep approach, heavy infrastructure, strong shelter and maintenance. | Large ocean-going, naval and industrial vessels. |
| Extraordinary Harbour | Special pressure, magical, under-ice, underwater or dimensional access. | Submersibles, magical vessels and specialised fleets. |

## D.2 Route Suitability Score Inputs

| Category | Example Inputs |
| --- | --- |
| Geometry | Depth, width, clearance, turning radius, slope and choke points. |
| Environment | Exposure, baseline current, tide sensitivity, ice and visibility. |
| Hazards | Reef, shoal, wreck, creature territory, corruption and storms. |
| Support | Anchorages, ports, freshwater, repair, rescue and navigation markers. |
| Knowledge | Chart confidence, survey age, local expertise and beacon state. |
| Politics | Ownership, toll, blockade, piracy, hostility and treaty access. |
| Vessel Match | Draft, beam, height, propulsion, sea-worthiness and special capability. |

# Appendix E. Worldgen Validation and Failure-Code Catalogue

| Code | Meaning | Default Severity |
| --- | --- | --- |
| MAR-TOPO-001 | Basin or Marine Region has invalid parent/adjacency. | Fatal seed failure. |
| MAR-HYDRO-001 | River has no valid sink or terminal-basin classification. | Fatal or regenerate branch. |
| MAR-COAST-001 | Coast morphology contradicts relief/substrate without special source. | Regenerate segment. |
| MAR-ISLE-001 | Settlement-capable island lacks freshwater path. | Regenerate or mark non-settlement. |
| MAR-DEPTH-001 | Invalid abrupt depth transition. | Smooth/regenerate local bathymetry. |
| MAR-ROUTE-001 | Required region has no capability-valid route or alternative. | Fatal progression failure. |
| MAR-HARB-001 | Harbour candidate score references missing approach corridor. | Remove candidate and rescore. |
| MAR-BIOME-001 | Selected Atlas biome violates hard environmental fields. | Reselect biome. |
| MAR-SOCKET-001 | Protected content sockets overlap or lack access. | Reposition/reselect. |
| MAR-SAVE-001 | Delta references missing or reused generated ID. | Block load/migration and recover. |
| MAR-PACK-001 | Content pack removes required definition with no fallback. | Compatibility failure. |
| MAR-PERF-001 | Region/segment density exceeds configured budget. | Merge/simplify and report. |

# Appendix F. Seed Test Matrix

| Test Class | Required Coverage |
| --- | --- |
| Small World | Compressed sea, coast, island and route functions without overcrowding. |
| Large World | Several basins, diverse archipelagos, deep provinces and meaningful long crossings. |
| Oceanic World | Island survival, freshwater, route, port, resource and progression viability. |
| Dry World | Reduced oceans but retained coasts, lakes, inland water and optional maritime progression. |
| Inland-Sea World | Restricted exchange, salinity variation, river routes and strategic straits. |
| Polar World | Ice regimes, glacial coasts, seasonal routes and recoverable hazards. |
| Volcanic World | Hotspot age chains, trenches, vents, calderas and distinct island stages. |
| High-Magic World | Transformed seas remain sourced, bounded, legible and varied. |
| Low-Magic World | Ordinary marine content remains rich; sparse magic retains guaranteed discovery categories. |
| Harsh Depth World | Deep progression is dangerous but signposted, optional and recoverable. |
| Multiplayer World | Deterministic manifests, edits, routes, names and reconnect state agree. |
| Modded World | Added definitions do not reshuffle unrelated generated identities. |
| Migration World | Explored coast/island records and deltas survive version changes. |

# Appendix G. Completion Checklist

- [x] Marine source authority and supersession boundaries defined.
- [x] Ocean basin, sea, Water Body and Marine Region hierarchy defined.
- [x] Stable identity and deterministic seed derivation defined.
- [x] Bathymetry, coast, island and inland-water generation defined.
- [x] Estuary, wetland, aquifer and freshwater-lens integration defined.
- [x] Atlas 24C biome slotting and transformed marine rules defined.
- [x] Underwater caves, geology, resource and content sockets defined.
- [x] Harbour, navigability and route fields defined.
- [x] Procedural guarantees and fallback order defined.
- [x] Player-created Water Body promotion and delta ownership defined.
- [x] Dynamic shoreline persistence boundary defined.
- [x] Handoff to 26D defined without duplicate weather truth.
- [x] LOD, saves, migration, multiplayer and Godot boundaries defined.
- [x] Registry families, prototypes, seed suites, validation and risks defined.
- [x] Set 25 and main-document integration requirements recorded.

**Document 26C Status: Complete for controlled review and downstream drafting.**
