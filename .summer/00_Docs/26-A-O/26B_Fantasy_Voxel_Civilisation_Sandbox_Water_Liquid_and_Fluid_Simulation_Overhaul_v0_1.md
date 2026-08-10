# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26B - Water, Liquid and Fluid Simulation Overhaul

*Version 0.1 - Fluid Foundation and Simulation Contract Draft*

A governing gameplay and technical foundation for local voxel-scale liquids, large water bodies, flooding, pumps, containment, displacement, contamination, phase change, buoyancy queries, persistence and scalable simulation across Leyforge.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

Prepared 5 August 2026

---

> **Water and Fluid Foundation Statement**
>
> Leyforge water must be physically understandable, editable and useful without requiring a full computational fluid-dynamics simulation. Oceans, rivers and lakes should remain stable seed-generated world features; player edits, structures, pumps, breaches, vessels and hazards should activate bounded local liquid simulation; regional fields should provide tides, currents, waves and storm influence; and presentation systems should turn those authoritative states into convincing surfaces, foam, spray, wakes and underwater atmosphere. The player should be able to dig a canal, fill a reservoir, drain a chamber, flood a mine, pump a dry dock, contain lava, contaminate water, repair a breach and launch a vessel while the game remains deterministic, save-safe, multiplayer-authoritative and performance-bounded.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 26B in Document Set 26: Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion. |
| Document Scope | Defines the shared liquid foundation: terminology, categories, local fluid cells, large water bodies, sources and sinks, containment, displacement, pumps, drains, gates, flooding, mixing boundaries, temperature and phase rules, magical state overlays, buoyancy query interfaces, save behaviour, multiplayer authority, simulation LOD, performance targets, test laboratories and handoff contracts. |
| Core Philosophy | Use a hybrid simulation. Local edited or hazardous spaces receive bounded voxel-scale volume simulation; oceans and other large water bodies use generated topology plus regional fields; visual waves and effects are presentation products rather than gameplay truth. |
| Realism Direction | Provide believable cause and effect, conservation where it matters, readable warnings and useful engineering choices. Do not attempt unrestricted real-world fluid dynamics, arbitrary chemistry or a universal gas simulation. |
| Water Direction | Water is the primary implementation and validation target. The foundation may support lava, oils, poison, sludge, alchemical and magical liquids through profiles and authored reactions. |
| Ocean Direction | Large oceans are not stored as billions of active liquid cells. They are stable Water Body records queried through surface, depth, current, tide, wave and environmental interfaces. |
| Local Fluid Direction | Interactive cells store bounded volume and state, activate only where required, update through deterministic work queues and collapse back into summaries when stable. |
| Flooding Direction | Flooding is volume-based and compartment-aware. Breaches, openings, pumps, drains, gates and seals change inflow and outflow; vessels and buildings may consume the same generic flooding contracts. |
| Automation Direction | Pumps, valves, tanks, filters and liquid logistics use the shared Automation and power contracts. Fluid simulation owns liquid state; Automation owns machine networks, permissions, recipes and resource transactions. |
| Buoyancy Direction | 26B provides authoritative water-surface, density, local velocity, depth and submerged-volume query inputs. Vessel buoyancy, stability and propulsion algorithms remain owned by 26F-26G. |
| Persistence Direction | Generated base water topology is regenerated from seed and generation version. Saves store only persistent deviations, active local volumes, machine states, contamination, special fluid instances and unresolved flooding. |
| Multiplayer Direction | The host/server owns liquid state and accepted world edits. Clients may interpolate surfaces and predict presentation but may not author persistent fluid results. |
| Engine Direction | Godot with Summer Engine remains the production direction. This document defines contracts and bounded algorithms, not final node names or an external AI runtime dependency. |
| Production Direction | The document establishes a production-capable foundation but does not automatically admit every liquid family, reaction or engineering feature into the first release. Set 25 classification and 26O evidence remain required. |
| Final Authority | Ash retains final authority over scope, realism, difficulty defaults, production tier, risk acceptance and release decisions. |
| Next Deliverable | 26C - Oceans, Coasts, Islands and Underwater World Generation. |

# Document Purpose

Document 26B converts the hybrid fluid direction locked in 26A into a precise gameplay, data and technical contract. It exists because maritime vessels, ocean traversal, ports, flooding, underwater construction and naval damage all depend upon trustworthy water behaviour, while the existing block-based fluid direction is too broad to carry the full production expansion without clarification.

The document establishes what is simulated, what is summarised, what is generated, what is only visual, and which system owns each part. It deliberately separates large-water representation from local liquid interaction. A stable ocean does not need to update every voxel, while a damaged hull, opened sluice gate, pumped reservoir or breached underwater chamber does require local volume exchange and persistent consequence.

The proof of concept is retired. No rule in this document assumes a fixed valley, named river, tutorial lake, guaranteed harbour or hardcoded ocean. Water bodies, catchments, coastlines, depths, rivers, lakes and special fluid sites are seed-derived through approved generation contracts. Player edits and simulation outcomes become save-owned deltas attached to stable identities.

This document is not a final Godot class map, final balancing spreadsheet or complete liquid-content registry. It defines the shared rules that the Blocks Registry, Automation System, World Generation, Vessel System, Naval Combat, UI, multiplayer and rewritten Technical Plan must implement. Exact engine architecture, final performance caps and platform budgets are verified and locked in 26O.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 26B |
| --- | --- | --- |
| Ash - locked project direction | Water and liquid mechanics require a major overhaul as part of the maritime expansion, supporting large ocean biomes, waves, storms and functional vessels. | Applied as locked scope. This document resolves the shared liquid foundation without expanding into unrestricted chemistry. |
| 26A - Maritime and Naval Expansion Foundation | Hybrid local-fluid, regional-field and presentation architecture; water-first implementation; bounded simulation; sources, sinks, flooding, pumps, buoyancy interfaces, persistence and authority. | Primary governing source for this document. |
| 00 - Master Game Design Bible | Systems must connect survival, construction, automation, magic, NPC civilisation, danger, progression and world consequence while preserving sandbox freedom. | Fluids must create meaningful gameplay and civilisation utility rather than decorative water only. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand in configurable seed-generated worlds. | Water supports traversal, gathering, construction, automation, danger, recovery and expansion with scalable difficulty. |
| 03 - Blocks Registry v0.1 | Water begins as a block-based flowing fluid; later fluids share parent behaviour; water supports irrigation, travel, machines, farming, cooling and environmental logic; hazard fluids include lava, sludge and magical liquids. | Broad direction is retained, but the simple block-flow concept is replaced by the hybrid architecture in this document. |
| 08 - Automation System v0.1 | Physical machines, visible power, pumps/pipes, storage, permissions, maintenance, throughput and near/far simulation. | Provides machine-network and power contracts; 26B owns the liquid state being moved. |
| 09 - Magic System v0.1 | Water, frost, heat, rituals, corruption, alchemy, mana infrastructure and authored magical consequences. | Magical liquid states and reactions are profile-driven hooks, not a separate simulation engine. |
| 11 - Biomes and World Generation v0.1 | Rivers, coasts, water systems, climate, weather, disasters, dynamic world state and simulation LOD. | Broad worldgen direction is retained; water topology and marine generation are expanded by 26B-26D and Atlas 24C. |
| Legacy 18 - Technical Implementation Plan v0.1 | Chunked voxel storage, deterministic generation, authoritative state, seed-plus-delta saves, simulation LOD and engine-neutral hybrid-fluid principles; Unreal-specific content is obsolete. | Engine-neutral reliability principles are retained. Unreal-specific architecture is superseded by Godot/Summer Engine planning. |
| Atlas 24A and 24C | Deterministic authored randomness; oceans as navigable regions with basins, depth bands, currents, storms, ecology, settlements, structures and routes. | World identity remains Atlas-owned. 26B supplies executable water and liquid mechanics only. |
| Set 25 governance and registry kernel | Qualified IDs, field ownership, immutable definitions, runtime instances, migration, validation, production classification and no duplicate truth. | All liquid definitions, states, reactions and Water Body records must consume these contracts when final schemas are approved. |
| Forge Sets 21-23 | Semantic source assets, generated presentation products, sockets/events, effects and Godot-native authoring. | Presentation water, liquid materials, effects and test contexts extend the existing Forge rather than creating a competing source. |

> **Source Boundary Rule**
>
> Atlas and World Generation own where a water body exists and what environmental identity it has. The Blocks Registry owns block and material properties. Automation owns machine networks and transactions. Magic owns schools, rituals and magical costs. 26B owns liquid runtime behaviour and shared queries. Presentation Forge owns editable visual and audio source. Saves own persistent deviations. No system may copy another system's editable truth merely for convenience.

# Static Table of Contents

- 1. Locked Water and Fluid System Identity
- 2. Source-Derived Direction and Recommendation Boundary
- 3. Scope, Non-Goals and Expansion Boundaries
- 4. Canonical Terminology and Liquid Categories
- 5. Hybrid Fluid Architecture
- 6. Source-of-Truth and System Ownership
- 7. Liquid Definition and Material Property Model
- 8. Local Fluid Cell State
- 9. Local Simulation Islands and Activation
- 10. Deterministic Update Scheduling
- 11. Gravity Flow, Equalisation and Settling
- 12. Sources, Sinks, Rainfall and Natural Replenishment
- 13. Containment, Sealing, Permeability and Waterlogging
- 14. Displacement, Block Editing and Volume Conservation
- 15. Large Water Bodies and Surface Queries
- 16. Rivers, Lakes, Reservoirs, Canals and Controlled Waterworks
- 17. Pumps, Drains, Valves, Gates, Tanks and Liquid Logistics
- 18. Pressure, Head, Depth and Flow Restrictions
- 19. Flooding, Compartments, Breaches and Recovery
- 20. Mixing, Contamination and Authored Reactions
- 21. Heat, Cooling, Freezing, Boiling and Phase Boundaries
- 22. Magical, Corrupted and Special Liquid States
- 23. Buoyancy, Drag and Vessel Query Interfaces
- 24. Player, Creature, Ecology and World-System Hooks
- 25. Presentation Surface, Audio, VFX and Readability
- 26. Simulation LOD, Streaming and Unloaded Processing
- 27. Persistence, Save Deltas, Migration and Recovery
- 28. Multiplayer Authority, Replication and Reconciliation
- 29. Difficulty, Accessibility and World Settings
- 30. Registry, Schema and Data Ownership Foundations
- 31. Godot/Summer Engine Technical Boundaries
- 32. Performance Budgets and Scalability Targets
- 33. Prototype Laboratories and Acceptance Tests
- 34. Risks, Failure Modes and Redesign Triggers
- 35. Production Classification and Relationship with Set 25
- 36. Main-Document and Forge Integration Matrix
- 37. Decision Register
- 38. Handoff to Document 26C
- Appendix A. Canonical Glossary
- Appendix B. Liquid Definition Field Template
- Appendix C. Local Fluid Runtime Record Template
- Appendix D. Water Body and Fluid Island Records
- Appendix E. Reaction and Contamination Matrix Rules
- Appendix F. Prototype Test Matrix
- Appendix G. Completion Checklist

# 1. Locked Water and Fluid System Identity

The Water and Fluid System is the volume, containment and environmental-interaction layer of Leyforge. It determines how liquids occupy editable space, move under gravity, enter and leave structures, interact with materials, respond to pumps and gates, preserve world changes, provide water-surface information to vessels, and expose clear feedback to players and NPC systems.

> **Locked Rule**
>
> A liquid mechanic should answer at least one meaningful gameplay question: what does it fill, drain, cool, burn, poison, power, irrigate, contaminate, float, flood, preserve, reveal, block, transport, transform or allow the player and civilisations to build? If it only exists to animate a texture or create unexplained punishment, it is incomplete.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Editable World Volume | Liquids occupy and exchange bounded volume in edited or mechanically important spaces. | Digging, placing blocks, opening gates and pumping water creates understandable results. |
| Stable Natural Water | Oceans, rivers and lakes exist as generated Water Bodies rather than universal active cell grids. | Large water remains reliable and performant across vast worlds. |
| Civilisation Infrastructure | Wells, canals, reservoirs, irrigation, sewers, pumps, docks, dry docks and flood defences use shared liquid rules. | Settlements can engineer water instead of treating it as scenery. |
| Maritime Foundation | Water surfaces, depth, density, velocity and flooding support vessels and naval damage. | Player-built ships can float, leak, be pumped and sink through consistent contracts. |
| Hazard and Resource Layer | Lava, oils, sludge, poison, alchemical and magical liquids use authored profiles and reactions. | Special liquids create progression, industry, danger and magic without a separate engine for each one. |
| Persistent World State | Player-made channels, drained rooms, contaminated wells and damaged barriers remain part of the save. | The world remembers engineering successes, disasters and recovery. |
| Scalable Simulation | Detailed local cells are bounded by regional summaries, stable Water Bodies and presentation LOD. | Large oceans and busy settlements do not require impossible continuous simulation. |

## 1.1 System Promise

A player should be able to inspect a liquid situation and understand the major causes: where the liquid comes from, where it can go, what contains it, what machine is moving it, whether it is contaminated or dangerous, why a compartment is flooding, what will happen when a gate opens, and which repair or countermeasure is available.

The result may be simplified compared with real physics, but it must not feel arbitrary. When simplification occurs, the game should preserve the most useful expectations: liquids flow downward, seek available space, pass through openings, are blocked by sealed materials, accumulate when inflow exceeds outflow, and stop changing when equilibrium is reached.

## 1.2 What the System Is Not

- It is not a full Navier-Stokes or computational fluid-dynamics solver.
- It is not a universal chemistry sandbox with arbitrary player-created reactions.
- It is not a requirement to simulate every ocean voxel, raindrop, bubble, wave or pipe interior.
- It is not a hidden random flood generator that ignores openings, seals or machine capacity.
- It is not a second Automation network, Magic registry, World Generation system or Presentation source of truth.
- It is not an excuse to make all construction obey realistic structural engineering.
- It is not permission to make basic water interaction inaccessible without advanced tools or magic.

# 2. Source-Derived Direction and Recommendation Boundary

This document separates immutable project direction from operational recommendations and pending technical evidence.

| Decision Class | Meaning | Examples in 26B |
| --- | --- | --- |
| Locked by Ash | Explicit project direction that may not change without Ash approval. | Dedicated maritime expansion, water/liquid overhaul, large ocean biomes, functional vessels, waves and storms. |
| Locked by 26A | Approved expansion contract inherited by this document. | Hybrid local-fluid/regional-field/presentation architecture; no full CFD; water-first implementation; authoritative persistence. |
| Source-Derived Requirement | Existing project rule that must be preserved unless formally superseded. | Seed-generated worlds, data-driven registries, practical automation and magic, simulation LOD, player freedom and consequences. |
| 26B Operational Resolution | Recommended rule required to make the system coherent. | Fluid islands, bounded volume cells, active-frontier scheduling, generated-base plus save-delta persistence. |
| Prototype Target | First-pass limit or benchmark requiring measured evidence. | Cell budgets, update cadence, replication frequency, maximum flood-island size. |
| Pending Specialist Decision | Question owned by another Set 26 document. | Exact wave equations, vessel stability, underwater breath defaults, naval weapon flooding. |
| Deferred | Valuable feature intentionally excluded from current commitment. | Full gas-grid simulation, unrestricted fluid mixing, dynamic erosion of entire coastlines. |

> **Recommendation Boundary**
>
> Numerical values in this document are prototype defaults and acceptance targets, not final balance. 26O may adjust them after packaged-build profiling, but it may not replace the hybrid architecture or source-of-truth boundaries without a recorded redesign decision.

# 3. Scope, Non-Goals and Expansion Boundaries

## 3.1 Included Scope

- Water, lava, oil/fuel, poison/sludge, alchemical and magical liquid profiles.
- Local voxel-volume simulation in edited, enclosed, flooded or mechanically active spaces.
- Generated Water Body records for oceans, seas, rivers, lakes and reservoirs.
- Sources, sinks, rainfall contribution, natural replenishment and controlled outlets.
- Block sealing, permeability, absorption, waterlogging, corrosion and heat hooks.
- Displacement when blocks, entities or vessel volumes occupy liquid space.
- Pumps, drains, valves, sluices, locks, floodgates, tanks, filters and liquid logistics interfaces.
- Flooding in buildings, mines, caves, dungeons, ports, vessels and underwater structures.
- Bounded contamination, authored mixing and reaction products.
- Temperature bands and selected freezing, melting, boiling, cooling and solidification rules.
- Buoyancy and drag query inputs for later vessel systems.
- Save deltas, migration, authority, replication, LOD, debugging and acceptance tests.

## 3.2 Explicit Non-Goals

- Global dynamic erosion, sediment transport and terrain collapse across every river and coastline.
- Continuous fluid pressure simulation through every cell and pipe at engineering accuracy.
- Arbitrary player-defined liquid compounds or universal chemical equations.
- Fully volumetric steam, smoke and gas filling every open world space.
- Realistic molecular mixing, density stratification or turbulent vortices at all scales.
- Weather-wave-current ownership; 26D owns those field models and severe-weather behaviour.
- Player swimming, breath and pressure progression; 26E owns those rules.
- Vessel buoyancy, stability, propulsion and capsize algorithms; 26F-26G own them.
- Naval weapon damage and sinking balance; 26L owns combat use of these contracts.

## 3.3 Shared Foundation Without Scope Explosion

The same low-level contracts may support non-water liquids, but water remains the validation priority. A new fluid family is admitted only when it has a clear source, use, hazard, containment rule, presentation profile, save behaviour and interaction matrix. Adding dozens of decorative coloured liquids without gameplay purpose is prohibited.

# 4. Canonical Terminology and Liquid Categories

## 4.1 Core Terms

| Term | Working Meaning |
| --- | --- |
| Liquid Definition | Immutable registry entry describing density, viscosity class, temperature behaviour, hazards, reactions, presentation references and system tags. |
| Local Fluid Cell | Runtime voxel-scale record containing liquid occupancy and only the state required for active simulation. |
| Fluid Island | Bounded connected set of active or recently active local fluid cells sharing an update queue and summary. |
| Water Body | Persistent generated or player-created region representing an ocean, sea, river, lake, reservoir or connected large water volume. |
| Surface Query | Authoritative request for surface height, normal, liquid identity, depth, velocity and field influences at a world position. |
| Source | Rule or object that adds liquid volume, such as a spring, rain input, pipe outlet, ocean boundary or ritual. |
| Sink | Rule or object that removes liquid volume, such as a drain, pump intake, evaporation rule, void outlet or world-boundary discharge. |
| Seal | Material/block property that prevents or limits liquid exchange through a face or occupied volume. |
| Permeability | Rate class controlling seepage through a material, block state or interface. |
| Waterlogging | Liquid occupancy retained inside or alongside a compatible block without replacing the block. |
| Contamination | Secondary quality/state tags carried by a liquid without requiring a unique fluid definition for every combination. |
| Reaction | Authored transformation triggered when specified liquids, states, temperatures, blocks or magic conditions meet. |
| Flood Volume | Aggregated liquid amount inside a recognised compartment, structure zone or Vessel Instance. |
| Presentation Surface | Generated mesh/material/effect representation that visualises authoritative state but does not own gameplay truth. |

## 4.2 Liquid Families

| Family | Default Behaviour | Example Uses | Production Boundary |
| --- | --- | --- | --- |
| Natural Water | Medium density, low hazard, supports salinity/temperature/turbidity and ecological quality. | Oceans, rivers, lakes, rain, irrigation, drinking, cooling, vessels. | Core foundation and first validation target. |
| Lava and Magma | Very hot, damaging, luminous, slow, reactive with water and heat-sensitive blocks. | Volcanic regions, hazards, forging, power, dimensional sites. | Shared system; exact content tier classified later. |
| Oil and Fuel Liquids | Flammable, lower or medium density, contamination risk, industrial value. | Lamps, engines, alchemy, trade, spills, fire hazards. | Profile and authored reactions; no universal petroleum simulation required. |
| Poison and Sludge | Hazardous, often viscous, contaminates water and materials, may support creatures/resources. | Swamps, corruption, waste, traps, monster lairs. | Limited reaction matrix and world-setting controls. |
| Alchemical Liquids | Crafted or found mixtures with explicit recipes, duration and reactions. | Potions, solvents, acids, binders, coolants, transmutation baths. | Each entry requires a gameplay package and safe containment rule. |
| Mana and Arcane Liquids | Carries magical charge or purity and interacts with runes, rituals and corruption. | Ritual pools, arcane machinery, magical biomes, rare fuels. | Magic owns costs and unlocks; 26B owns physical liquid behaviour. |
| Blood, Shadow and Forbidden Liquids | High social and magical consequence, contamination/corruption hooks, ritual use. | Dark rituals, cursed engines, villain paths, haunted sites. | Deferred or restricted unless an approved content package exists. |
| Steam and Gas-Like Effects | Usually event, volume-zone or particle/effect representations rather than full liquid cells. | Vents, boilers, traps, underwater bubbles, fog, toxic clouds. | No universal gas grid in this document. |

## 4.3 Water Subtypes Are Environmental State, Not Duplicate Fluids

Fresh water, salt water, brackish water, mineral water, polluted water, holy water and corrupted water should normally share a base water definition plus environmental and contamination facets. A separate immutable liquid ID is created only when behaviour differs enough to justify distinct storage, reactions, recipes or presentation.

# 5. Hybrid Fluid Architecture

The system uses four cooperating layers rather than one universal simulation.

| Layer | Owns | Typical Scale | Key Rule |
| --- | --- | --- | --- |
| Generated Water Topology | Water Body extent, baseline level, river path, lake basin, ocean connection, catchment and generation identity. | Region to world scale. | Reproducible from seed and generation version; not stored cell-by-cell. |
| Regional and Marine Fields | Tide offset, current vector, wave state, storm surge, wind influence, temperature, salinity and environmental modifiers. | Marine region to encounter scale. | Produced by 26C-26D and consumed through stable interfaces. |
| Local Fluid Simulation | Bounded liquid volume, openings, displacement, flooding, pumps, gates, reactions and active edits. | Room, cave, canal segment, dry dock, vessel compartment or local shoreline. | Activates only where interaction requires detailed state. |
| Presentation Layer | Surface mesh, shoreline blending, foam, spray, wakes, reflections, underwater fog, particles, audio and visual LOD. | Camera and visibility scale. | Consumes authoritative state; never becomes save or gameplay truth. |

## 5.1 Architectural Consequences

- An untouched ocean remains a Water Body plus regional fields, not an active grid.
- Digging into the shoreline creates or expands a bounded local simulation zone connected to the Water Body boundary.
- A ship samples surface and field queries while internal flooding uses local or compartment volume records.
- Opening a dam or floodgate activates affected local islands and can transfer volume between Water Bodies or reservoirs.
- Once a local island reaches stable equilibrium and no important observer or machine requires cell detail, it may collapse into a compact summary.
- Presentation can show waves larger than local cell resolution, but gameplay queries remain derived from authorised field and surface data.

## 5.2 Determinism Requirement

Given the same world seed, generation version, ordered player commands and authoritative simulation inputs, liquid outcomes must be reproducible within the supported deterministic model. Visual foam, droplets and splash particles may be non-deterministic because they do not own gameplay state.

# 6. Source-of-Truth and System Ownership

| System | Owns | May Read | Must Not Own |
| --- | --- | --- | --- |
| Atlas / World Generation | Water Body placement, topology, environmental identity, river network, basin, salinity and world context. | Liquid capability requirements and validation rules. | Mutable flood cells, pump state, vessel damage or presentation products. |
| Blocks Registry | Material density, permeability, seal class, absorption, corrosion, heat resistance, waterlogging compatibility and block states. | Liquid definitions and system tags. | Runtime liquid volume or generated Water Body topology. |
| 26B Fluid Runtime | Local liquid occupancy, fluid islands, transfers, reactions, flood summaries and authoritative queries. | Block/material properties, Water Bodies, machines, fields and magic states. | Machine progression, worldgen canon, vessel stability or visual asset source. |
| Automation | Pumps, pipes, tanks, valves, filters, power, throughput, ownership, permissions, recipes and network routing. | Liquid availability, pressure/head class and transfer results. | Authoritative world-cell liquid state. |
| Magic | Spell/ritual cost, school, unlock, corruption and magical effects. | Liquid states and reaction hooks. | Base liquid movement algorithm or Water Body truth. |
| Vessel Systems | Vessel geometry, displacement, compartments, stability, propulsion, damage and sinking decisions. | Surface/depth/velocity/density and flood-transfer interfaces. | World liquid cells or ocean generation. |
| Presentation Forge / Runtime | Materials, surfaces, effects, audio events, wakes, spray and visual LOD. | Authoritative liquid state and fields. | Saved volume, reactions or gameplay hazards. |
| Save System | Persistent deltas, unresolved islands, machine state, contamination, special liquids and history. | Stable IDs and generated baseline. | Immutable definitions or hidden duplicate registries. |

# 7. Liquid Definition and Material Property Model

## 7.1 Immutable Liquid Definition

Every gameplay liquid references a qualified immutable definition. The definition describes shared behaviour; local runtime records store only changed or necessary state.

| Field Group | Required Information |
| --- | --- |
| Identity | Qualified ID, display/localisation key, family, tags, version, package and authority owner. |
| Physical Profile | Density class/value, viscosity class, compressibility policy, default temperature band, surface tension class if needed, flow priority and buoyancy support. |
| Hazard Profile | Contact damage, damage type, status effects, breath/visibility effects, corrosion, ignition, contamination and difficulty scaling. |
| Environment Profile | Salinity support, freezing/boiling thresholds, evaporation policy, ecological quality, light absorption, turbidity and sound profile. |
| Interaction Profile | Permeability modifiers, waterlogging compatibility, block reactions, entity drag, extinguishing, cooling, heating and residue. |
| Automation Profile | Pumpability, pipe compatibility, filter requirements, tank rules, contamination tolerance and transaction item/resource links. |
| Magic Profile | Charge, purity, corruption, ritual tags, ward interaction, school links and stabilisation requirements. |
| Presentation References | Surface material, underwater material, foam, particles, decals, audio, icon, map/readability colour and accessibility alternatives. |
| Planning Metadata | Production tier, prototype status, validation state, owner, migration notes and dependencies. |

## 7.2 Block and Material Fields Required

The future Blocks Registry must expose at least:

- Mass or density contribution.
- Face seal class and optional per-face overrides.
- Permeability/seepage class.
- Waterlogging and internal-capacity support.
- Absorption capacity and saturation state where relevant.
- Swell, rot, corrosion, dissolution or softening hooks.
- Heat resistance, ignition and phase-change interaction.
- Fluid displacement volume for non-full shapes.
- Drainage/opening geometry for doors, grates, fences, stairs and partial blocks.
- Repair state and whether damage changes sealing.
- Vessel-role suitability fields used later by 26F.

# 8. Local Fluid Cell State

Local simulation uses a compact cell record. It must be expressive enough for flooding and engineering but small enough for large bounded islands.

| Runtime Field | Purpose | Storage Guidance |
| --- | --- | --- |
| Liquid ID | Identifies the primary liquid definition. | Compact runtime index resolved from qualified ID. |
| Fill Amount | Occupied volume within the voxel cell. | Fixed-point or bounded integer, not floating-point save truth. |
| Flow Flags | Indicates falling, spreading, pressurised transfer, source-fed or recently changed state. | Bit field. |
| Temperature Band | Cold, frozen-edge, ambient, warm, hot, boiling-edge or authored band. | Small enum unless a feature requires finer precision. |
| Contamination Set | Bounded secondary tags and concentration bands. | Small capped list or bitset; no arbitrary compound graph. |
| Source/Sink Link | Optional reference to a source, drain, Water Body boundary or machine port. | Stable local reference or qualified runtime ID. |
| Last Update / Queue State | Supports deterministic scheduling and settling. | Tick/index data, not wall-clock time. |
| Special State | Charged, corrupted, blessed, viscous shift, foaming or reaction-pending state. | Facet/flags with owner-defined payload where necessary. |

## 8.1 Fill Resolution

A cell should support partial occupancy so shallow water, gradual flooding and displacement can be represented. The exact integer range is a prototype choice. Recommended baseline: 0-255 volume units per full voxel, with thresholds for rendering and pathing. A coarser 0-15 mode may be used for low-end or distant simulation if conversion remains conservative and deterministic.

## 8.2 Single Primary Liquid Rule

A local cell stores one primary liquid. Secondary contamination is represented by bounded tags/concentration. When incompatible primary liquids meet, an authored reaction resolves the interface into one or more outputs, separate cells, residue blocks, temperature changes or events. The system does not maintain arbitrary multi-liquid fractions in every cell.

# 9. Local Simulation Islands and Activation

A Fluid Island is a bounded connected active area rather than an entire chunk or Water Body.

## 9.1 Activation Triggers

- Player or NPC places/removes a block adjacent to liquid.
- A door, hatch, valve, floodgate, sluice or seal changes state.
- A pump, drain, pipe outlet, ritual or machine begins transfer.
- A structure or vessel receives a breach.
- A liquid reaction, temperature transition or hazard propagation is triggered.
- A Water Body boundary changes through tide, storm surge or controlled engineering.
- A loaded area contains unresolved unstable liquid state from a save.

## 9.2 Island Boundary Rules

Fluid islands stop expanding when they reach:

- Stable sealed boundaries.
- Water Body boundary interfaces handled by summary exchange.
- Configured simulation radius or cell budget.
- Unloaded regions that can be represented through deferred transfer records.
- Explicit engineering boundaries such as tanks, compartments or pipe networks.

If a change would exceed the safe budget, the system must not silently delete liquid. It should aggregate the far portion, split the island, defer work, or trigger a visible performance/scope warning in developer tools.

## 9.3 Deactivation and Collapse

An island may settle when no queued transfer, source, sink, reaction or important observer requires cell detail. Settled islands can be stored as:

- Compact run-length cell data for player-edited spaces.
- A compartment fill summary plus breach/opening links.
- A reservoir volume/level record.
- A Water Body delta or connection change.

Reactivation reconstructs cell detail from the summary and unchanged world geometry.

# 10. Deterministic Update Scheduling

## 10.1 Fixed Simulation Cadence

Liquid gameplay updates run on a fixed authoritative cadence independent from rendered frame rate. Visual surfaces interpolate between accepted states. The baseline target is 10 simulation steps per second for actively changing local islands, with slower cadences permitted for distant or low-priority islands.

## 10.2 Work-Queue Model

Each island maintains deterministic queues of changed cells and boundary interfaces. Processing order is stable, based on island ID, simulation tick, priority class and cell coordinate. The system avoids scanning every cell every step.

Recommended update phases:

1. Apply accepted world edits and machine commands.
2. Resolve source and sink transfers.
3. Resolve vertical gravity transfer.
4. Resolve horizontal equalisation and overflow.
5. Resolve displacement and boundary pressure/head effects.
6. Resolve authored reactions and temperature transitions.
7. Update contamination, damage and material hooks.
8. Recalculate island summaries and settle candidates.
9. Emit gameplay events and replication deltas.
10. Update presentation inputs.

## 10.3 Bounded Work

Every island receives a transition budget per tick. Excess work remains queued and is processed in later ticks. Critical safety events, such as a small vessel breach or player drowning space, receive higher priority than decorative shoreline settling. The game must expose backlog and delayed-simulation indicators to developer tools.

# 11. Gravity Flow, Equalisation and Settling

## 11.1 Core Flow Rules

- Liquid first attempts to move downward into available capacity.
- Remaining volume spreads horizontally toward lower neighbouring fill levels.
- Falling columns retain momentum only as a simplified state for presentation and transfer priority; full momentum equations are not required.
- Upward movement occurs only through displacement, pressure/head transfer, bubbles/effects, magic or explicit machinery.
- Viscosity classes control how much volume may transfer per step and how quickly an island settles.
- Diagonal flow is represented through repeated orthogonal transfer or authored neighbourhood rules, not arbitrary vector advection.

## 11.2 Equilibrium

A stable open pool settles toward a level surface within local simulation limits. Small integer discrepancies may be resolved through deterministic remainder distribution. The simulation should prioritise readable water levels over perfect physical precision.

## 11.3 Flow Classes

| Flow Class | Behaviour | Examples |
| --- | --- | --- |
| Fast | Rapid gravity and horizontal transfer; settles quickly. | Water, thin alchemical solvents. |
| Standard | Moderate flow with visible delay. | Salt water, mana water, light oils. |
| Viscous | Slow spread and strong retention on slopes/steps. | Sludge, thick oil, molten material. |
| Restricted | Moves mainly through machines, reactions or scripted rules. | Ritual liquids, unstable void fluids. |

# 12. Sources, Sinks, Rainfall and Natural Replenishment

## 12.1 Source Types

| Source Type | Behaviour | Persistence |
| --- | --- | --- |
| Water Body Boundary | Exchanges local volume with a generated ocean, lake or river at the current authoritative level and field state. | Generated identity plus save-owned connection edits. |
| Spring / Seep | Adds bounded volume over time according to worldgen and local blockage. | Generated source record; blocked/unblocked state saved. |
| Rain / Storm Input | Adds surface/catchment contribution through regional weather rather than spawning every droplet. | Weather-owned input; resulting persistent floods saved if unresolved. |
| Pipe / Pump Outlet | Adds transferred liquid from an Automation network. | Machine/network state and authoritative transaction. |
| Ritual / Magic Source | Adds or transforms liquid under an approved magic action. | Ritual state and generated liquid delta. |
| Creative / Admin Source | Optional world-setting tool for builders and testing. | Explicit permission and save record. |

## 12.2 Infinite Source Policy

Natural oceans and large lakes behave as effectively infinite relative to local edits because their level is owned by the Water Body record. Small player-made pools do not create infinite water merely from a shape unless the world setting enables simplified renewable sources.

Recommended world setting options:

- **Conservative Volume:** Player-created water is conserved; natural Water Bodies and springs replenish according to authored rules.
- **Builder Renewable:** Stable source patterns can generate renewable water for accessibility and creative play.
- **Creative Unlimited:** Authorised tools may create or remove liquid without resource conservation.

## 12.3 Sinks

Sinks include drains, pump intakes, evaporation, absorption, world-edge discharge, void portals and authorised disposal machines. Every sink must declare destination or deletion policy so resource transactions and pollution consequences remain auditable.

# 13. Containment, Sealing, Permeability and Waterlogging

## 13.1 Face-Based Containment

Containment is evaluated at the interface between neighbouring cells and blocks. A full solid block may seal all faces; doors and hatches change seal state; grates allow liquid but block entities; stairs and slabs expose partial capacity; damaged blocks may leak.

| Seal Class | Default Result |
| --- | --- |
| Watertight | No ordinary liquid transfer through the sealed face. |
| Resistant | No bulk transfer, but optional slow seep under pressure/head or damage. |
| Porous | Slow transfer and possible absorption/contamination. |
| Open | Normal liquid transfer. |
| One-Way / Controlled | Transfer only under gate, valve, drain or authored direction rules. |

## 13.2 Waterlogging

Waterloggable blocks retain their block identity while permitting liquid occupancy. Examples may include fences, grates, reeds, open frames, pipes, decorative objects and selected machinery. Waterlogging must specify collision, rendering, corrosion, power and interaction effects.

## 13.3 Absorption and Saturation

Wood, soil, cloth, sponge-like materials and magical absorbents may hold bounded liquid. Absorption should be selective and gameplay-relevant. Saturated materials can become heavier, weaker, slippery, rotten, contaminated or useful for transport and filtering.

## 13.4 Damage and Seal Failure

Block damage may change seal class before total destruction. This allows cracked hulls, damaged dams, corroded tanks and leaking pipes. The relationship between damage state and leakage must come from block/material definitions rather than hardcoded liquid exceptions.

# 14. Displacement, Block Editing and Volume Conservation

## 14.1 Block Placement

Placing a block into liquid displaces the volume occupied by the block shape. The displaced liquid attempts to move into neighbouring capacity. If no valid capacity exists, the placement may be blocked, create pressure/overflow, store temporary compression only for an approved fluid, or require a pump/drain action.

## 14.2 Block Removal

Removing a block creates new capacity. Adjacent liquid enters according to the simulation queue. Breaking a wall below water level should produce an immediate high-priority breach, while removing a decorative block in shallow water may settle slowly.

## 14.3 Entity and Vessel Displacement

Large moving entities and Vessel Instances do not rewrite cells beneath every frame. They provide displacement volumes and sampling geometry to buoyancy and water-surface systems. Local liquid displacement is used where an entity enters a confined pool, tank, lock or flooded compartment and where the interaction budget permits.

## 14.4 Conservation Rules

- Ordinary local transfers conserve volume except at explicit sources, sinks, phase changes or reactions.
- Numerical remainder is tracked and redistributed deterministically.
- Presentation splashes do not remove gameplay volume unless tied to an authored transfer event.
- Save/load must not create or delete liquid through rounding drift.
- Debug tools must show created, destroyed, transferred and unresolved volume totals by island.

# 15. Large Water Bodies and Surface Queries

## 15.1 Water Body Record

A Water Body represents a connected generated or player-established water region. It does not require active cells across its full extent.

| Water Body Field | Purpose |
| --- | --- |
| Stable ID | Binds generated identity, routes, ecology, events and save deltas. |
| Body Type | Ocean basin, sea, river, lake, reservoir, canal network, wetland or special realm water. |
| Baseline Surface | Base level or river profile before tide, weather and edits. |
| Topology Reference | Generated basin, shoreline, channel and connectivity data. |
| Environmental Profile | Temperature, salinity, turbidity, ecology, mana/corruption and hazard facets. |
| Field Links | Current, tide, wave, wind, storm surge and seasonal records from 26C-26D. |
| Local Interfaces | Boundary portals connecting to fluid islands, locks, ports, caves, vessels and structures. |
| Persistent Deltas | Dams, canals, drained sections, contamination, blocked channels, artificial reservoirs and ownership. |

## 15.2 Surface Query Contract

A query at world position and time returns as available:

- Liquid identity and Water Body ID.
- Surface height.
- Surface normal.
- Depth to terrain or local obstacle.
- Density and viscosity profile.
- Current/local velocity vector.
- Tide and storm-surge offset.
- Wave displacement and gameplay wave class supplied by 26D.
- Temperature, salinity, turbidity and special-state facets.
- Whether local detailed simulation overrides the regional result.

## 15.3 Query Priority

1. Active local fluid island.
2. Persistent player-created reservoir or local Water Body delta.
3. Generated Water Body plus regional fields.
4. No liquid.

# 16. Rivers, Lakes, Reservoirs, Canals and Controlled Waterworks

## 16.1 Rivers

Rivers use generated channel profiles and directional flow summaries. Detailed local simulation activates around dams, diversions, block edits, mills, locks, floods and shoreline structures. The entire river does not update as local cells from source to sea.

## 16.2 Lakes and Reservoirs

Lakes use surface-level and stored-volume summaries linked to basin geometry. Player-built reservoirs may begin as fluid islands and promote into persistent Water Body records when size, stability and importance thresholds are met.

## 16.3 Canals and Ditches

Player-dug channels connect Water Bodies or reservoirs through explicit local interfaces. The game should support irrigation canals, drainage ditches, moats, mill races, sewer channels and navigable canals. Connectivity changes are validated to prevent hidden water teleportation.

## 16.4 Dams, Levees and Sea Walls

These structures block or redirect Water Body interfaces. Failure can activate high-priority flood islands and persistent damage events. Full regional terrain erosion is not required; authored damage states, overflow points and flood routing provide readable consequences.

## 16.5 Locks and Dry Docks

A lock chamber or dry dock is a recognised bounded volume with gates, pumps and target levels. The system may simulate its fill through aggregated volume rather than every cell when geometry is simple, then reconstruct local surfaces for player interaction.

# 17. Pumps, Drains, Valves, Gates, Tanks and Liquid Logistics

## 17.1 Ownership Boundary

Automation owns the machine definition, power, network, permissions, recipes, throughput upgrades and maintenance. 26B validates available liquid, removes/adds authoritative volume and reports success, blockage, contamination and head/pressure limits.

## 17.2 Machine Families

| Machine / Structure | Fluid Function |
| --- | --- |
| Hand Pump | Early manual transfer from shallow sources, wells, boats or flooded rooms. |
| Powered Pump | Continuous intake/outlet transfer using mechanical, fuel, water, wind, steam, mana or later power. |
| Drain | Removes liquid to a valid destination, sewer, lower body, tank or authorised disposal rule. |
| Valve | Opens, closes, throttles or directs a pipe/network path. |
| Sluice / Floodgate | Controls bulk open-channel transfer between levels or Water Bodies. |
| Tank / Cistern | Stores a defined liquid volume with seal, contamination and pressure class. |
| Filter / Purifier | Removes approved contamination tags through recipes, resources and waste outputs. |
| Separator | Resolves selected authored liquid mixtures or floating contamination into outputs. |
| Bilge Pump | High-priority flooding control for vessels and confined structures. |
| Magical Pump / Rune Gate | Uses mana or ritual rules for lift, purification, stabilisation or forbidden transfer. |

## 17.3 Transfer Transaction

A transfer request contains source interface, destination interface, liquid constraints, requested volume, power/cost result, ownership and priority. The fluid runtime returns accepted volume, remaining capacity, contamination state, failure reason and resulting events.

## 17.4 Failure States

- No liquid available.
- Destination full or sealed.
- Incompatible liquid or contamination.
- Excessive lift/head for machine tier.
- Intake blocked, exposed to air or damaged.
- Pipe/tank leak or burst.
- Missing power, filter, permission or maintenance.
- Frozen, solidified or too viscous.
- Magical instability or corruption.

# 18. Pressure, Head, Depth and Flow Restrictions

The system uses simplified pressure classes sufficient for gameplay.

## 18.1 Hydrostatic Head

Pressure at an opening depends primarily on liquid density and vertical difference between local surface and opening. This controls breach inflow, pump lift requirements, sluice flow and deep-water hazards without simulating continuous pressure in every cell.

## 18.2 Pressure Classes

| Class | Typical Use |
| --- | --- |
| Open / Atmospheric | Pools, rivers, open tanks and ordinary flooding. |
| Low Head | Small elevation difference, irrigation, shallow breaches. |
| Medium Head | Dams, deep tanks, mines, ship breaches below waterline. |
| High Head | Deep ocean structures, industrial pressure systems, magical or dimensional environments. |
| Special | Realm-specific, ritual, void or scripted conditions requiring explicit rules. |

## 18.3 Compressibility

Ordinary liquids are treated as incompressible. Temporary unresolved displacement may be represented as pressure debt or blocked placement, not permanently compressed liquid volume. Gases and steam are outside the full grid model.

# 19. Flooding, Compartments, Breaches and Recovery

## 19.1 Generic Flooding Contract

Any recognised enclosed volume may expose:

- Interior capacity.
- Current flood volume and liquid identity.
- Openings to outside liquid or neighbouring compartments.
- Opening area, elevation, seal and damage state.
- Pumps, drains and passive outlets.
- Air/occupancy and pathing thresholds.
- Material absorption, hazards and contamination.

## 19.2 Compartment Simulation Modes

| Mode | Use | Behaviour |
| --- | --- | --- |
| Cell Detailed | Small, player-visible or irregular spaces. | Full local cells and surfaces. |
| Volume Summary | Large/simple sealed compartments or distant vessels. | Track total volume, effective level and opening transfer. |
| Hybrid | Important spaces with detailed surface near players and summary elsewhere. | Summary owns volume; local cells are a reconstructable view. |

## 19.3 Breach Flow

Breach transfer uses outside surface/head, breach area, liquid density, seal damage and interior level. Multiple breaches and pumps contribute to net flood rate. The simulation should communicate time-to-critical thresholds rather than hide them.

## 19.4 Flood Consequences

- Reduced movement and pathing.
- Extinguished fire or disabled dry machinery.
- Electrical/mana shorting where authored.
- Cargo contamination and floating items.
- Increased vessel mass and reduced stability through 26F-26G.
- Structural weakening, rot, corrosion or pressure damage.
- NPC evacuation, repair and pumping tasks.
- Drowning/breath hazards defined by 26E.
- Persistent mould, residue, ecology or quest aftermath where content supports it.

## 19.5 Recovery

Recovery may involve sealing breaches, closing gates, pumping, draining, bailing, absorbing, freezing, evaporating, purifying, replacing damaged blocks or changing the Water Body connection. A recovered space may require drying/repair before full function returns.

# 20. Mixing, Contamination and Authored Reactions

## 20.1 Bounded Contamination Model

A liquid may carry a small set of contamination tags such as salt, mud, sewage, poison, oil, blood, ash, corruption, mana residue or disease risk. Each tag uses concentration bands rather than precise chemistry.

Recommended bands:

- Trace.
- Low.
- Significant.
- Severe.
- Saturated / dominant.

## 20.2 Reaction Rule

A reaction is an immutable authored definition with:

- Required primary liquids/states.
- Optional block, temperature, magic or pressure conditions.
- Minimum volumes/concentrations.
- Products: liquid, block, item, gas/effect, heat, damage, contamination or world event.
- Conservation and resource accounting policy.
- Priority when multiple reactions are possible.
- Safety warnings, knowledge requirements and presentation references.

## 20.3 Example Reaction Families

| Interaction | Simplified Result |
| --- | --- |
| Water + Lava | Steam/effect, cooling, stone/obsidian-like residue according to temperature and volume. |
| Water + Oil Spill | Oil contamination/floating slick presentation; filter/separator counterplay. |
| Water + Poison Sludge | Contaminated water with hazard concentration and purification requirements. |
| Water + Frost Magic | Ice block/state formation when thresholds and energy cost are met. |
| Water + Heat / Fire | Temperature increase, evaporation event or steam zone at authored thresholds. |
| Mana Liquid + Corruption | Unstable/corrupted arcane liquid, hazard and ritual consequences. |
| Acid + Vulnerable Material | Material damage, residue and liquid consumption according to definition. |

## 20.4 No Unbounded Reaction Cascade

Reactions are budgeted, ordered and capped per island tick. A chain that cannot safely complete remains queued or collapses into an authored summary event. The game must avoid a single bucket causing an unbounded world-scale update.

# 21. Heat, Cooling, Freezing, Boiling and Phase Boundaries

## 21.1 Temperature Bands

Liquid temperature uses gameplay bands rather than continuous thermal simulation unless a specialist system requires finer data.

| Band | Typical Effects |
| --- | --- |
| Frozen / Solid | Liquid converted to block/state or suspended flow. |
| Near-Freezing | Slower flow, ice-edge formation, cold hazards. |
| Ambient | Default behaviour. |
| Warm | Ecology, comfort, reaction and spoilage modifiers. |
| Hot | Damage, accelerated reactions, evaporation and machine use. |
| Boiling / Molten | Severe hazard, steam/effect generation, pressure or containment requirements. |

## 21.2 Phase Change Ownership

- Freezing may create ice blocks or a frozen Water Body surface state.
- Melting returns stored volume to the associated liquid.
- Boiling generally creates a steam zone/effect and removes bounded liquid volume according to energy and authored rates.
- Lava solidification creates approved block products.
- Snow and ice worldgen remain owned by 26C-26D and biome systems; 26B provides conversion contracts.

## 21.3 Energy Inputs

Heat/cooling may come from weather, biome, fire, machines, magic, blocks, depth or dimensions. The source system owns the energy cost and permission; 26B applies the liquid transition.

# 22. Magical, Corrupted and Special Liquid States

Magic should modify shared liquid behaviour through explicit facets and effects rather than requiring a separate physics engine.

| State | Possible Effects |
| --- | --- |
| Mana-Charged | Powers runes/machines, glows, changes purity, attracts creatures or reacts with conduits. |
| Blessed / Cleansed | Reduces contamination, harms selected creatures, supports rituals or settlement morale. |
| Corrupted | Spreads bounded contamination, damages materials/NPCs, mutates ecology or destabilises machines. |
| Cursed | Carries ownership, witness, quest or ritual consequences beyond physical hazard. |
| Void-Touched | May drain, displace, teleport or destabilise liquid under explicit authored rules. |
| Living / Fae | May move, grow, respond to time/rituals or support unusual ecology. |
| Blood-Bound | Supports forbidden rituals, faction reaction and high-risk engines. |

## 22.1 Magic Ownership Rule

Magic definitions specify cost, school, unlock, ethics, ritual, duration and world consequence. 26B applies the approved liquid state, transfer, reaction or phase effect and reports the result. A spell may not bypass conservation, ownership or server authority unless its definition explicitly authorises that exception.

# 23. Buoyancy, Drag and Vessel Query Interfaces

26B provides environmental inputs; it does not decide whether a vessel design is stable or seaworthy.

## 23.1 Required Query Inputs

- Surface height and normal at sample points.
- Liquid density and viscosity/drag class.
- Depth and seabed/obstacle distance where available.
- Local water/current velocity.
- Wave displacement and gameplay wave force from 26D.
- Whether a sample is inside active local fluid or a Water Body.
- Special liquid hazards and corrosion/temperature state.
- Displaced-volume acceptance and confined-space interaction.

## 23.2 Flooding Interface for Vessels

Vessel systems provide compartment capacity, openings, breach state, pump connections and motion context. The fluid runtime returns transferred volume, liquid state and local effects. Vessel systems then update mass, centre of mass, stability, performance and sinking state.

## 23.3 Drag Boundary

26B exposes drag coefficients/classes and local relative velocity. 26G owns propulsion, steering and final force integration. Presentation wakes and spray are generated from accepted vessel motion and water state.

# 24. Player, Creature, Ecology and World-System Hooks

## 24.1 Player Interaction Hooks

- Fill and empty containers.
- Place/remove blocks in liquid.
- Swim, dive, breathe and suffer pressure through 26E.
- Inspect liquid identity, quality, temperature, depth and danger.
- Use buckets, hoses, pumps, drains, filters, absorbents and magic.
- Build canals, reservoirs, locks, docks, flood defences and underwater rooms.
- Recover floating items and salvage.

## 24.2 Creature Hooks

Creatures may require movement tags, preferred depth, salinity, temperature, water quality, current tolerance, breathing type and liquid hazard immunity. 26M owns ecology and creature content; 26B provides environmental queries and state changes.

## 24.3 NPC and Settlement Hooks

Settlements can consume water-access quality, irrigation capacity, drainage, flood risk, harbour depth, fishery access, sewage/pollution state and pumping infrastructure. Detailed needs and production effects remain owned by settlement documents.

## 24.4 Farming and Automation Hooks

Water supports soil moisture, irrigation, cooling, washing, milling, power, alchemy, steam and processing. The relevant system owns recipes and productivity; 26B reports liquid availability and transfer.

# 25. Presentation Surface, Audio, VFX and Readability

## 25.1 Presentation Is Derived

The visible surface may be smoother and more detailed than the simulation grid. It is generated from Water Body fields, local fill levels, boundaries, camera distance, weather and vessel motion.

| Presentation Feature | Authoritative Inputs |
| --- | --- |
| Surface Mesh / Material | Water Body or local surface height, normal, liquid profile and LOD. |
| Shoreline Foam | Boundary shape, wave/current class, depth and obstacle contact. |
| Waterfalls / Falling Sheets | Local falling cells, height and flow volume. |
| Wakes | Vessel motion, displacement class, water velocity and wave state. |
| Spray / Splashes | Accepted impacts, waves, breaches and transfer events. |
| Underwater Fog / Colour | Liquid profile, depth, turbidity, light, contamination and biome. |
| Audio | Flow class, volume, impact, enclosure, weather, machinery and hazard. |
| Map / Overlay | Water Body identity, depth class, current, contamination, flood risk and player knowledge. |

## 25.2 Readability Rules

- Players can distinguish shallow/deep, safe/hazardous, clean/contaminated and calm/fast water through multiple cues.
- Critical flooding warnings use visual, audio and UI channels.
- Transparent liquid should not hide interaction outlines or make building impossible.
- Reduced-effects settings preserve gameplay information even when foam, particles, reflections or distortion are lowered.
- Colour is never the only indicator of dangerous liquid identity.

# 26. Simulation LOD, Streaming and Unloaded Processing

## 26.1 LOD Levels

| Level | State | Simulation |
| --- | --- | --- |
| L0 - Interactive | Player-visible cells, active breaches, pumps, reactions and engineering. | Full bounded cell updates at active cadence. |
| L1 - Local Summary | Stable rooms, tanks, compartments, reservoirs and low-importance islands. | Volume/level summaries, opening transfers and occasional reconstruction. |
| L2 - Water Body Local | Rivers, lakes, canals and ports near loaded regions. | Surface/topology queries, field inputs and activated boundary islands only. |
| L3 - Regional | Distant oceans, rivers, storms, tides and major floods. | Regional field and Water Body summaries; no cell updates. |
| L4 - Dormant | Unloaded stable liquid with no active machine/event dependency. | Regenerate baseline plus saved deltas on demand. |

## 26.2 Promotion and Demotion

Promotion occurs when players approach, blocks change, machines activate, hazards become relevant or vessels interact. Demotion occurs only after equilibrium, no unresolved reaction, no critical NPC/player hazard and a save-safe summary is produced.

## 26.3 Unloaded Transfers

A distant pump network, reservoir or flood event may process abstract volume transactions at a coarse cadence. The result must respect capacity, ownership, power, routes and failure risk. When loaded, detailed state reconstructs from the summary without duplicating or losing volume.

# 27. Persistence, Save Deltas, Migration and Recovery

## 27.1 Save Principle

Do not save generated natural water cell-by-cell. Save only what cannot be reproduced from world seed, generation version and immutable definitions.

## 27.2 Persistent Records

- Modified Water Body connections and levels where player engineering changed them.
- Player-created reservoirs/canals promoted to persistent records.
- Active or settled fluid islands in edited spaces.
- Flood volume in recognised compartments and vessels.
- Pumps, drains, gates, valves, tanks and machine transfer state.
- Contamination and special magical liquid state.
- Reaction residue, transformed blocks and damaged seals.
- Deferred transfers and unresolved island work queues where required for recovery.
- Historical events used by quests, NPC memory or world summaries.

## 27.3 Save Transaction Safety

Liquid transfer involving inventory, tanks, machines or recipes must use authoritative transactions. A save checkpoint should never record the source as emptied without recording the destination or a recoverable journal entry.

## 27.4 Migration

Migrations must map liquid IDs, contamination tags, Water Body versions, cell resolution and summary formats. If a liquid definition is removed, the migration must use an approved alias, fallback or quarantine state; it may not silently convert valuable or hazardous liquid into water.

## 27.5 Recovery

On corrupted or incomplete local fluid data, the game should:

1. Preserve the last valid snapshot.
2. Replay journalled transfers if safe.
3. Reconstruct unchanged Water Body baseline from seed.
4. Quarantine unresolved local volumes rather than duplicate/delete them.
5. Report recovery actions through diagnostics.

# 28. Multiplayer Authority, Replication and Reconciliation

## 28.1 Authority

The host/server accepts block edits, machine commands, spell effects and vessel breaches, then updates liquid state. Clients submit requests and display predicted/interpolated presentation.

## 28.2 Replication

Replicate compact deltas based on player interest:

- Changed local cells or compressed surface patches.
- Island summaries and critical flood thresholds.
- Water Body field changes relevant to the client.
- Machine transfer state and failures.
- Reaction/hazard events.
- Vessel compartment flood summaries.

## 28.3 Prediction Boundary

Clients may predict splash particles, surface interpolation, wake visuals and short-lived local surface response. They must not predict persistent source depletion, pump output, reaction products, drowning-safe air pockets or vessel flood volume without server confirmation.

## 28.4 Join and Reconnection

A joining client receives immutable definition versions, relevant Water Body summaries, nearby fluid islands, critical machine state and vessel flooding before full interaction is enabled. Reconnection must not replay a transfer twice.

# 29. Difficulty, Accessibility and World Settings

| Setting Group | Examples |
| --- | --- |
| Fluid Realism | Conservative volume, builder-renewable water, creative unlimited sources. |
| Flood Severity | Reduced breach rates, normal, harsh pressure and faster spread. |
| Hazard Damage | Lava/poison/corrosion damage scaling and immunity aids. |
| Contamination | Disabled, simplified, normal or severe persistence. |
| Phase Change | Decorative only, simplified gameplay or full authored transitions. |
| Machine Forgiveness | Pump auto-prime, reduced head restrictions, no burst/leak, normal maintenance. |
| Visual Motion | Reduced waves, reduced distortion, horizon stabilisation, limited camera bob and spray. |
| Readability | High-contrast surface/contamination overlays, depth bands, direction arrows and flood forecasts. |
| Performance | Cell resolution, island budget, update cadence, visual surface detail and reaction limits. |
| Creative Tools | Permission to create/remove liquids, force settle islands, inspect volumes and bypass resource cost. |

## 29.1 Accessibility Rule

Changing visual motion or effect density must not change authoritative wave, current, flood or hazard results unless the world setting explicitly chooses simplified gameplay. Critical information requires non-colour cues, subtitles/audio descriptions where relevant, scalable UI and inspectable numbers or classes.

# 30. Registry, Schema and Data Ownership Foundations

## 30.1 Required Definition Families

- LiquidDefinition.
- ContaminationDefinition.
- FluidReactionDefinition.
- FluidMaterialInteractionDefinition.
- FluidSourceDefinition.
- FluidSinkDefinition.
- WaterBodyDefinition/Profile.
- FluidMachineInterfaceDefinition.
- FluidPresentationProfile.
- FluidDifficultyProfile.

## 30.2 Runtime Record Families

- WaterBodyInstance/GeneratedBinding.
- FluidIslandRecord.
- LocalFluidCellChunk/Run.
- CompartmentFloodRecord.
- FluidTransferTransaction.
- FluidReactionEvent.
- ContaminationState.
- FluidDeferredWorkRecord.

## 30.3 ID and Facet Rules

Qualified IDs and namespaces follow Set 25B once approved. Cross-system data should use facets rather than giant inheritance chains. Example facets include `fluid.physical`, `fluid.hazard`, `fluid.magic`, `fluid.presentation`, `fluid.automation`, `fluid.ecology` and `fluid.planning`.

Planning fields such as Core Production, Expansion, Deferred and Prototype are not shipped gameplay traits unless a runtime feature explicitly requires them.

# 31. Godot/Summer Engine Technical Boundaries

This section remains engine-aware but implementation-neutral enough to avoid premature class lock.

## 31.1 Required Runtime Responsibilities

| Responsibility | Boundary |
| --- | --- |
| Fluid Simulation Service | Owns authoritative islands, queues, transfers, reactions and queries. |
| Water Body Service | Resolves generated topology, stable IDs, surfaces and regional field inputs. |
| Voxel World Integration | Reports cell capacity, shapes, block edits, material fields and chunk streaming. |
| Automation Adapter | Submits validated transfer requests and receives results. |
| Vessel Adapter | Samples water and submits compartment/breach interfaces. |
| Save Adapter | Serialises deltas, journals transactions and runs migrations. |
| Network Adapter | Replicates authoritative deltas by interest and validates client requests. |
| Presentation Adapter | Generates meshes/material parameters/effects from read-only snapshots. |
| Debug and Test Tools | Visualises islands, queues, volumes, boundaries, sources, sinks, contamination and performance. |

## 31.2 Godot Principles

- Use data-oriented compact storage for large cell sets rather than one Node per fluid cell.
- Keep authoritative simulation separate from rendering nodes and shaders.
- Process bounded work through fixed-step services, worker jobs or chunk tasks with deterministic commit order.
- Use Godot Resources or generated registry bindings for immutable definitions, subject to Set 25 schema decisions.
- Avoid physics-body-per-cell or particle-as-gameplay-state designs.
- Treat water surfaces, foam and spray as generated presentation products.
- Ensure headless server operation does not require rendering assets.
- Summer Engine may assist code generation, tests and orchestration but is not shipped as runtime authority.

## 31.3 Threading Boundary

Parallel jobs may calculate candidate transfers, surfaces and summaries from immutable snapshots. Authoritative state commits occur in a deterministic ordered phase. No worker may directly mutate voxel chunks, inventories, saves or network state without the owning service transaction.

# 32. Performance Budgets and Scalability Targets

All numbers below are prototype targets requiring packaged-build profiling.

## 32.1 First-Pass Targets

| Target | Prototype Baseline |
| --- | --- |
| Active Simulation Cadence | 10 Hz for important L0 islands; 2-5 Hz for low-priority local summaries. |
| Cell Fill Precision | 8-bit fixed volume preferred; coarser mode permitted by scalability profile. |
| Typical Interactive Island | Up to roughly 32,000 local cells before aggregation/splitting is expected. |
| Stress-Test Island | At least 100,000 cells under controlled benchmark, not a normal gameplay promise. |
| Work Budget | Bounded transitions per tick with backlog rather than unbounded frame work. Exact count profiled in 26O. |
| Main-Thread Commit | Target under 2 ms average for normal nearby fluid work on the agreed PC target; spikes require investigation. |
| Presentation | Surface generation and effects have separate visual budgets and may degrade without changing gameplay state. |
| Replication | Delta/summary replication by interest; no full-island resend during ordinary updates. |
| Save Growth | Stable natural water adds near-zero per-cell save cost; only persistent deviations are stored. |

## 32.2 Scalability Levers

- Cell fill precision.
- Active island radius/cap.
- Update cadence and transition budget.
- Summary promotion threshold.
- Reaction frequency and contamination detail.
- Surface mesh resolution, reflections, foam and particles.
- Replication frequency and interest radius.
- Distant pump/flood processing cadence.

## 32.3 Performance Rule

A lower scalability setting may reduce fidelity and update speed but must not silently change resource conservation, ownership, critical flood thresholds or competitive multiplayer outcomes unless the server world profile selects the simplified rule for everyone.

# 33. Prototype Laboratories and Acceptance Tests

## 33.1 Required Laboratories

| Laboratory | Purpose |
| --- | --- |
| Bucket and Basin Lab | Validate partial cells, fill/empty actions, conservation and settling. |
| Waterfall and Channel Lab | Validate gravity, spreading, slopes, grates, stairs and presentation handoff. |
| Dam and Floodgate Lab | Validate high-volume release, bounded queues, flood routing and recovery. |
| Pump and Tank Lab | Validate authoritative transfers, capacity, power failure, head limits and save transactions. |
| Mine Flood Lab | Validate breaches, compartments, drains, NPC/player hazards and persistent recovery. |
| Dry Dock / Lock Lab | Validate controlled fill levels, gates, pumps, vessel interface and summary reconstruction. |
| Shoreline Edit Lab | Validate Water Body boundary activation, canals and stable regeneration. |
| Mixing and Reaction Lab | Validate contamination bands, water/lava reaction and bounded cascades. |
| Freeze/Thaw Lab | Validate phase conversion, volume preservation and world/weather hooks. |
| Vessel Flood Interface Lab | Validate outside surface queries, breach inflow, pumps and compartment summaries without final vessel physics. |
| Multiplayer Fluid Lab | Validate authority, join-in-progress, rollback/reconnect and no transfer duplication. |
| Save/Migration Lab | Validate seed regeneration, deltas, aliases, corrupted data recovery and version changes. |
| Performance Stress Lab | Validate island caps, backlog, surface degradation, profiling and diagnostics. |

## 33.2 Acceptance Rules

A prototype is not accepted because water looks convincing. It must also prove:

- Volume does not duplicate or vanish outside explicit rules.
- A sealed room remains dry until a real opening or source exists.
- Opening and closing gates changes transfer predictably.
- Pumps cannot output more volume than they remove.
- Generated oceans do not create cell-scale save bloat.
- Save/load reproduces active floods and settled reservoirs.
- Multiplayer clients agree with server volume and hazard state.
- Fluid work remains bounded during a major breach.
- Reduced visual settings preserve gameplay readability.
- Debug tools can identify sources, sinks, backlog and conservation errors.

# 34. Risks, Failure Modes and Redesign Triggers

| Risk | Failure Mode | Mitigation | Redesign Trigger |
| --- | --- | --- | --- |
| Scope Explosion | System grows into full chemistry, gas, erosion and CFD. | Water-first packages, authored reactions, strict non-goals. | Core vessel/ocean work is delayed by unrelated fluid features. |
| Ocean Cell Explosion | Large seas are stored or updated cell-by-cell. | Water Body topology and field queries. | Normal ocean traversal requires unbounded active cells or huge saves. |
| Simulation Backlog | Dam break or breach queues never settle. | Island caps, priorities, summaries and bounded work. | Critical gameplay remains minutes behind real time under expected scenarios. |
| Volume Duplication | Pumps, saves or network retries create liquid. | Transaction journals, deterministic commits and audits. | Conservation tests fail across save/load or reconnect. |
| Hidden Arbitrary Results | Seals, openings or machine limits are unclear. | Inspection overlays, consistent material fields and warnings. | Players cannot predict why a room floods or remains dry. |
| Save Bloat | Natural water and stable pools dominate save size. | Seed regeneration, deltas and summaries. | Unedited worlds accumulate significant fluid save data. |
| Multiplayer Divergence | Clients disagree on flood or hazard state. | Server authority, compact deltas and join snapshots. | Player safety, vessel mass or resource transfer differs between peers. |
| Material Data Burden | Every block needs bespoke fluid logic. | Material-family inheritance and facets. | Content authors manually duplicate the same fields across variants. |
| Presentation Coupling | Shader/mesh state becomes gameplay truth. | Read-only snapshots and headless tests. | Disabling graphics changes liquid results. |
| Over-Realism | Basic building and sailing become frustrating engineering tasks. | Readable classes, forgiving defaults and settings. | Ordinary players cannot create working water infrastructure without specialist knowledge. |
| Under-Simulation | Water ignores barriers, pumps, breaches or volume. | Local islands and compartment contracts. | Maritime damage and engineering feel cosmetic. |
| Motion/Visibility Discomfort | Water distortion, waves and underwater effects cause nausea or unreadability. | Accessibility profiles and separate presentation settings. | Players must disable gameplay-affecting water to remain comfortable. |

# 35. Production Classification and Relationship with Set 25

Document 26B is a foundation, not a commitment to ship every feature at once.

| Candidate Package | Likely Classification | Notes |
| --- | --- | --- |
| Core Water Body and Surface Queries | Foundation / Core Candidate | Required for oceans, swimming and vessels. |
| Bounded Local Water Cells | Foundation / Core Candidate | Required for edits, flooding, pumps and shoreline interaction. |
| Basic Sources, Sinks and Pumps | Core Candidate | Needed for readable engineering and vessel recovery. |
| Compartment Flood Summaries | Core Maritime Candidate | Required before meaningful naval damage. |
| Lava Shared Profile | Existing-System Integration | Valuable outside maritime scope; production tier reviewed separately. |
| Contamination and Purification | Expansion Candidate | Can begin simplified and deepen with settlement/ecology content. |
| Oil/Fuel Spill Simulation | Expansion Candidate | Depends on industrial and naval weapon scope. |
| Advanced Alchemical Liquids | Deferred/Expansion | Requires approved recipes, reactions and content packages. |
| Complex Magical/Forbidden Liquids | Deferred/Expansion | Requires Magic, faction and narrative packages. |
| Full Dynamic Erosion/Gas Simulation | Not Planned in Set 26 | Excluded unless a later expansion reopens scope. |

Set 25 owns the final production tier, package completeness, registry admission, validation evidence, migration policy and release gate. Document 26B supplies the capability and dependency evidence those decisions need.

# 36. Main-Document and Forge Integration Matrix

| Source Document / Set | Required Change from 26B | Treatment |
| --- | --- | --- |
| 00 - Master Game Design Bible | Add oceans/water engineering and maritime civilisation as a major connected expression of the four pillars. | Targeted vision amendment after Set 26 integration. |
| 01 - Core Gameplay Loop | Add water traversal, engineering, flooding, recovery and maritime expansion loops. | Major revision. |
| 02 - Player Progression | Add water engineering, pumping, diving and Shipwright-related knowledge hooks without class locks. | Targeted revision; detailed progression in 26N. |
| 03 - Blocks Registry | Replace simple block-fluid rules with material density, sealing, permeability, waterlogging, displacement, heat and fluid interaction facets. | Complete fluid-section replacement. |
| 04 - Items Registry | Add containers, hoses, pumps, filters, absorbents, samples, repair and fluid-quality items. | Major registry expansion through 26N. |
| 05 - Recipes | Add fluid transfer, tanks, pumps, purification, repair, cooling and reaction recipes. | Major registry expansion through 26N. |
| 06 - Resource Progression | Add water access, salts, oils, reagents, filters, marine fluids and industrial/magical liquids. | Revision through 26N. |
| 07 - NPC Village System | Add water access, drainage, flood response, pumping, harbour and engineering jobs. | Revision through 26J/26N. |
| 08 - Automation | Add pump/pipe/tank/valve/filter interfaces and authoritative liquid transfer transactions. | Major revision; Automation retains network ownership. |
| 09 - Magic | Add water, frost, heat, purification, corruption and ritual liquid interactions. | Major revision; Magic retains cost and school ownership. |
| 10 - Creatures | Add liquid environmental queries and aquatic hazard/ecology hooks. | Revision through 26M. |
| 11 - Biomes/Worldgen | Replace broad water section with Water Body topology, local interfaces and 26C-26D fields. | Complete replacement. |
| 12 - Structures | Add dams, canals, locks, sewers, reservoirs, dry docks, floodable volumes and seal/damage markers. | Major revision. |
| 16 - Combat/Defence | Add liquid hazards, extinguishing, flooding and structure breach hooks. | Major revision through 26L. |
| 17 - UI/UX | Add liquid inspection, depth, quality, pump, flood, conservation and accessibility interfaces. | Major revision through 26O. |
| 18 - Technical Plan | Rewrite for Godot/Summer Engine, fluid islands, Water Bodies, persistence, authority, threading and tests. | Complete replacement through 26O. |
| Forge Sets 21-23 | Add liquid materials, water contexts, surface previews, contamination/phase states, audio/VFX events and test laboratories. | Extension, not replacement. |
| Atlas 24C | No canon rewrite; consume environmental identity and expose executable capability validation. | Authority preserved. |
| Set 25 | Register definition families, fields, relationships, package rules, validation and production tier. | Required governance integration. |

# 37. Decision Register

| Decision ID | Decision | Status | Owner / Evidence |
| --- | --- | --- | --- |
| DEC-26B-001 | Water uses a hybrid generated Water Body, regional field, bounded local-cell and presentation architecture. | Locked | 26A / 26B |
| DEC-26B-002 | Full computational fluid dynamics is outside Set 26 scope. | Locked | 26A |
| DEC-26B-003 | Water is the primary implementation and validation target; other liquids use shared profiles where justified. | Locked | 26A / 26B |
| DEC-26B-004 | Local liquid cells use partial bounded volume and deterministic fixed-step work queues. | Approved Baseline | 26B |
| DEC-26B-005 | Large oceans are not represented as active cell grids or saved cell-by-cell. | Locked | 26A / 26B |
| DEC-26B-006 | Ordinary cells store one primary liquid plus bounded contamination, not arbitrary multi-liquid fractions. | Approved Baseline | 26B |
| DEC-26B-007 | Natural Water Bodies may act as effectively infinite local boundaries; player-created pools remain volume-conserving by default. | Approved Baseline | 26B / world settings |
| DEC-26B-008 | Pumps and liquid machines use Automation ownership but transact with authoritative fluid state. | Locked | 08 / 26A / 26B |
| DEC-26B-009 | Flooding supports detailed, summary and hybrid compartment modes. | Approved Baseline | 26B |
| DEC-26B-010 | Pressure uses simplified head/depth classes rather than continuous cell pressure. | Approved Baseline | 26B |
| DEC-26B-011 | Temperature uses gameplay bands and authored phase transitions. | Approved Baseline | 26B |
| DEC-26B-012 | Steam/gas is usually an effect or zone, not a universal voxel gas grid. | Approved Baseline | 26B |
| DEC-26B-013 | Buoyancy queries are owned by 26B; vessel stability and force integration are owned by 26F-26G. | Locked | 26A / 26B |
| DEC-26B-014 | Generated baseline is recreated from seed; saves store persistent deviations and unresolved local state. | Locked | 24A / 25 / 26A / 26B |
| DEC-26B-015 | Host/server owns persistent fluid state; clients own presentation prediction only. | Locked | Project authority direction / 26A |
| DEC-26B-016 | Exact cell precision, island caps and work budgets remain prototype targets until 26O profiling. | Pending Evidence | 26O |
| DEC-26B-017 | Exact contamination families admitted to Core Production. | Pending | 25F / 26N |
| DEC-26B-018 | Exact renewable-water default for Normal difficulty. | Pending Ash Approval | 26N / world settings |
| DEC-26B-019 | Full erosion, sediment and gas simulation are excluded from Set 26. | Locked | 26B non-goals |

# 38. Handoff to Document 26C

Document 26C must use the Water Body and local-interface contracts in this document to define executable marine world generation. It should not replace fluid simulation or invent a second ocean-state model.

26C must define:

- Ocean basins, seas, shelves, depth bands, coasts, islands and seafloor topology.
- Rivers, lakes, estuaries, wetlands, groundwater/springs where relevant, and Water Body connectivity.
- Stable Water Body IDs and generated binding rules.
- Baseline surface/depth profiles and local-boundary activation points.
- Harbour suitability, navigable depth, sheltered water and route capability fields.
- Underwater caves, structures, resources and biome interfaces.
- Seed guarantees, fallback generation, validation and no hidden hardcoding.
- Player-created canal/reservoir promotion and world-delta integration.
- Handoff of regional tide/current/wave/storm requirements to 26D.

> **26B Completion Statement**
>
> Document 26B establishes Leyforge's hybrid water and liquid simulation foundation. It defines stable generated Water Bodies, bounded local fluid cells, deterministic work queues, sources and sinks, containment, displacement, pumps, pressure classes, flooding, contamination, authored reactions, phase boundaries, magical states, buoyancy query interfaces, LOD, persistence, multiplayer authority, Godot/Summer Engine boundaries, performance targets and validation laboratories. The set may now proceed to Document 26C without simulating oceans cell-by-cell, duplicating Automation or Magic truth, or committing unrestricted chemistry and fluid dynamics to production.

# Appendix A. Canonical Glossary

| Term | Meaning |
| --- | --- |
| Active Frontier | Changed cells and boundaries queued for simulation rather than scanning an entire island. |
| Baseline Surface | Generated liquid level before tide, wave, storm and persistent player deltas. |
| Boundary Interface | Connection between a local island and Water Body, compartment, pipe, drain or unloaded summary. |
| Compartment Flood Record | Aggregated liquid state for an enclosed structure or vessel space. |
| Contamination | Bounded secondary liquid-quality state such as salt, mud, poison, oil or corruption. |
| Fluid Island | Connected bounded local simulation area with its own queue and summary. |
| Fluid Profile | Immutable definition facet describing physical, hazard, magic, automation and presentation behaviour. |
| Fluid Transfer Transaction | Authoritative movement of liquid volume between cells, Water Bodies, machines, tanks or compartments. |
| Head | Simplified pressure potential caused mainly by vertical liquid-level difference. |
| Local Fluid Cell | Voxel-scale runtime occupancy used only in interactive spaces. |
| Presentation Surface | Read-only visual/audio representation generated from authoritative liquid state. |
| Reaction | Authored transformation triggered by liquid/state contact under explicit conditions. |
| Seal Class | Material/interface rule controlling liquid transfer. |
| Surface Query | Request returning height, normal, depth, liquid identity, velocity and field state. |
| Water Body | Generated or persistent large connected water region represented by topology and summary records. |
| Waterlogging | Liquid occupancy retained in a compatible placed block. |

# Appendix B. Liquid Definition Field Template

| Field Group | Example Fields |
| --- | --- |
| Identity | liquid_id, display_name_key, family_id, package_id, version, tags, authority_owner |
| Physical | density, viscosity_class, fill_precision_policy, flow_class, buoyancy_enabled, compressibility_policy |
| Temperature | default_band, freeze_threshold, melt_product, boil_threshold, steam_effect, heat_capacity_class |
| Hazard | contact_damage, damage_type, status_effects, breath_effect, corrosion_class, ignition, contamination_tags |
| Environment | salinity_mode, turbidity, light_absorption, ecological_quality, evaporation_policy, weather_response |
| Block Interaction | displacement_rule, waterlogging_tags, permeability_modifiers, absorption, extinguish, residue |
| Automation | pumpable, pipe_tags, tank_requirements, filter_requirements, transfer_resource_id, disposal_policy |
| Magic | mana_value, purity, corruption_risk, schools, ritual_tags, ward_response, stabilisation_requirements |
| Presentation | surface_profile, underwater_profile, foam_profile, particle_events, audio_profile, map_style, accessibility_style |
| Planning | production_tier, prototype_status, validation_status, dependencies, migration_aliases, notes |

# Appendix C. Local Fluid Runtime Record Template

| Field | Purpose |
| --- | --- |
| runtime_liquid_index | Compact reference to immutable Liquid Definition. |
| fill_units | Partial voxel volume. |
| temperature_band | Gameplay thermal state. |
| contamination_bits / entries | Bounded quality state. |
| flow_flags | Falling, source-fed, pressurised, reaction-pending, recently changed. |
| source_sink_ref | Optional boundary or machine link. |
| queue_generation | Prevents duplicate/stale queue work. |
| local_coordinate | Cell position within island/chunk. |
| checksum / version | Save and replication validation where required. |

# Appendix D. Water Body and Fluid Island Records

## D.1 Water Body Record

| Field | Purpose |
| --- | --- |
| water_body_id | Stable generated or player-created identity. |
| generation_binding | Seed, region, generator version and topology reference. |
| body_type | Ocean, sea, river, lake, reservoir, canal, wetland or realm-specific water. |
| baseline_surface | Base level/profile. |
| environmental_facets | Salinity, temperature, turbidity, ecology, mana, corruption and hazards. |
| field_links | Current, tide, wave, wind and storm records. |
| local_interfaces | Ports to fluid islands, structures, caves, vessels and engineering works. |
| persistent_deltas | Dams, canals, contamination, level change, blocked routes and ownership. |

## D.2 Fluid Island Record

| Field | Purpose |
| --- | --- |
| island_id | Persistent or transient identity. |
| bounds | Local voxel/world bounds. |
| priority | Safety, vessel, player, machine, reaction, environment or background. |
| cell_storage | Compact changed cell runs/chunks. |
| boundary_interfaces | Water Body, compartment, machine and unloaded-summary links. |
| source_sink_state | Active volume inputs/outputs. |
| work_queue | Deterministic pending transitions. |
| total_volume_by_liquid | Conservation and debug summary. |
| contamination_summary | Bounded quality aggregate. |
| settle_state | Active, settling, stable, summarised or dormant. |
| save_version | Migration and recovery. |

# Appendix E. Reaction and Contamination Matrix Rules

1. Every reaction has a qualified ID and explicit authority owner.
2. Default result for unrecognised liquid contact is no reaction beyond bounded contamination policy.
3. Reactions declare priority and minimum volume to prevent oscillation.
4. Products must identify where volume/mass is stored: liquid, block, item, effect, heat or authorised loss.
5. Reaction loops must be detected and rejected by validation.
6. Contamination lists are capped and use concentration bands.
7. Purification defines removed tags, required inputs, waste outputs and residual risk.
8. Visual colour changes do not create a new liquid definition unless gameplay behaviour differs.
9. Forbidden/magical reactions require Magic and faction consequence references.
10. Reaction tests must include save/load, multiplayer and low-performance profiles.

# Appendix F. Prototype Test Matrix

| Test | Expected Result |
| --- | --- |
| Place full block into full cell | Equal displaced volume moves to valid neighbours or placement is blocked; no deletion. |
| Break wall below lake level | High-priority inflow begins from Water Body interface and stops when sealed/equilibrated. |
| Pump tank to tank | Source loss equals destination gain plus explicit waste; power and capacity respected. |
| Save during active flood | Reload resumes from consistent volume and queue state. |
| Client reconnect during transfer | Transfer is not repeated; client receives authoritative result. |
| Open/close sluice | Flow starts/stops according to gate state and head. |
| Water meets lava | Authored products/effects occur within budget and preserve declared accounting. |
| Freeze then thaw pool | Liquid volume returns within fixed-point tolerance and block states migrate correctly. |
| Unedited ocean save | No per-cell ocean data is written. |
| Large dam break | Work remains bounded, backlog is visible and critical local area remains responsive. |
| Reduced graphics | Fluid gameplay and warnings remain unchanged and readable. |
| Removed liquid definition | Migration uses alias/fallback/quarantine; no silent conversion to water. |

# Appendix G. Completion Checklist

| Completion Area | Required Evidence |
| --- | --- |
| Identity | Hybrid architecture and water-first scope are stated consistently. |
| Ownership | Worldgen, Blocks, Automation, Magic, Vessel, Presentation and Save boundaries are explicit. |
| Local Simulation | Cell state, islands, queues, flow, settling and bounds are defined. |
| Large Water | Water Body record and surface query contract are complete. |
| Engineering | Sources, sinks, pumps, drains, valves, gates, tanks and head limits are covered. |
| Flooding | Detailed/summary/hybrid compartments, breaches, consequences and recovery are covered. |
| Special Fluids | Categories, contamination, reactions, heat and magic boundaries are bounded. |
| Vessel Handoff | Buoyancy and flooding query ownership is explicit without defining final vessel physics. |
| Persistence | Seed regeneration, deltas, transaction safety, migration and recovery are covered. |
| Multiplayer | Authority, replication, prediction and reconnect rules are covered. |
| Accessibility | Motion, colour, warnings, overlays and performance settings preserve player trust. |
| Technical | Godot/Summer boundaries avoid Node-per-cell and rendering-owned gameplay. |
| Validation | Laboratories, acceptance tests, risks and redesign triggers are defined. |
| Production | Set 25 classification and staged package admission remain mandatory. |
| Handoff | 26C receives Water Body, topology and local-interface contracts without duplicate truth. |
