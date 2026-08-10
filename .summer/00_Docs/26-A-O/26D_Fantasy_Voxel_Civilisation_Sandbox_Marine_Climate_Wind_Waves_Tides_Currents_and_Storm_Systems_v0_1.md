# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26D - Marine Climate, Wind, Waves, Tides, Currents and Storm Systems

*Version 0.1 - Dynamic Marine Environment, Forecasting and Hazard Contract Draft*

A governing climate, simulation, navigation, warning and validation foundation for prevailing wind, local gusts, waves, swell, tides, currents, storms, surge, fog, visibility, sea ice, extraordinary marine weather and their consequences across Leyforge.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

Prepared 6 August 2026

---

> **Dynamic Marine Environment Statement**
>
> Leyforge's oceans must move, change and threaten without becoming arbitrary, unreadable or computationally impossible. Wind, waves, tides, currents, storms, fog, ice and magical weather must arise from the same generated climate, Water Body, Marine Region, Coast Segment and route topology that creates the world. They must affect vessels, ports, coastlines, ecology, trade, combat, exploration and civilisation through clear regional fields and bounded local interaction rather than full global fluid or atmospheric simulation. Dangerous conditions must be forecastable, signposted and configurable. Ordinary weather may inconvenience or redirect the player; severe weather may damage, flood, isolate or transform the world, but only through coherent causes, visible warnings, available responses and persistent aftermath.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 26D in Document Set 26: Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion. |
| Document Scope | Defines dynamic marine climate and environmental-field behaviour: climate hierarchy, prevailing and changing wind, gusts, wave sea state, swell, fetch, shoaling and breaking, tides, currents, storms, surge, coastal flooding inputs, fog, precipitation, visibility, lightning, sea ice, rare hazards, magical weather, forecasting, warnings, route effects, LOD, persistence, multiplayer authority, presentation boundaries, validation and handoffs. |
| Core Philosophy | Simulate consequences, not every molecule. Regional fields provide coherent authoritative state; local queries and bounded interfaces provide gameplay; Presentation Forge renders the result without becoming gameplay truth. |
| World Authority | Atlas 24B-24C own authored climate, marine biome and transformed-environment identities. Document 26C owns generated topology and baseline field profiles. 26D owns time-varying marine environment state. |
| Fluid Authority | Document 26B owns liquid volume, flooding, containment and local fluid islands. 26D produces surface offsets, flow inputs, surge and activation requests but does not independently move voxel liquid volume. |
| Weather Fairness | Severe weather must form, move, intensify and dissipate coherently. It must have discoverable warning, uncertainty and response windows rather than spawning immediately around the player. |
| Wind Direction | Prevailing wind is generated from climate and season; dynamic wind is modified by fronts, storms, terrain, coasts, structures, altitude and local turbulence. |
| Wave Direction | Authoritative wave state is an aggregate field derived from wind, duration, fetch, swell, current and depth. Individual rendered waves are not individually simulated physics bodies. |
| Tide Direction | Tides use deterministic regime profiles, phase and local amplification rather than exact astronomical simulation. Tidal access and intertidal state must remain predictable enough for planning. |
| Current Direction | Currents inherit 26C corridors and exchanges, then vary by season, wind, tide, river input, storms, ice and extraordinary fields. |
| Storm Direction | Storms are persistent moving field instances with origin, track, structure, severity, uncertainty, warning and aftermath. |
| Forecasting Direction | The world has authoritative future evolution; players and NPCs receive imperfect knowledge based on observation, instruments, skill, infrastructure and magic. Forecast uncertainty must be honest rather than random deception. |
| Accessibility Direction | Camera motion, screen distortion, particles and audio intensity are separable from authoritative environmental effects. Critical warnings use text, shape, sound, world signs and optional numerical overlays. |
| Engine Direction | Godot with Summer Engine remains the production direction. Data-oriented services own field state; scene nodes, shaders, particles and audio consume snapshots. |
| Production Direction | The system is production-capable in architecture, but exact features and severity bands remain subject to Set 25 classification and technical evidence in 26O. |
| Final Authority | Ash retains final authority over realism, storm severity, world-setting defaults, magical-weather scope, accessibility options, first-release tier and release decisions. |
| Next Deliverable | 26E - Swimming, Diving and Underwater Player Interaction. |

# Document Purpose

Document 26D converts the static exposure, fetch, tide-regime, current-corridor, storm-susceptibility, surge-sensitivity and ice-regime outputs of 26C into a changing marine environment. It establishes which states are authoritative, how those states evolve, what is predictable, which local systems consume them and what may be simplified at distance.

The document exists because vessels, ports and oceans would otherwise be mechanically disconnected. A sailing vessel needs wind direction and strength. A harbour needs tide windows and surge risk. A trade route needs seasonal current and storm information. A shoreline needs wave exposure and flood inputs. Marine ecology needs temperature, mixing, ice and seasonal movement. Naval combat needs visibility, sea state and lightning rules. These effects must agree with each other and with the generated world.

The proof of concept is retired. No rule assumes a fixed starter coast, guaranteed calm bay, scripted first storm, universal tide table or hand-authored route. Conditions are generated and simulated from world records, settings and deterministic state. Capability and recovery are guaranteed through categories, warning systems, route alternatives and difficulty settings rather than one fixed event.

This document does not define final vessel buoyancy, sail force, swimming controls, port economies, creature rosters, naval weapon balance or Presentation Forge assets. It supplies the environmental state and query contracts those systems consume. Exact numerical constants remain prototype defaults until measured in Godot packaged builds and approved through 26O.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 26D |
| --- | --- | --- |
| Ash - locked project direction | Dedicated maritime expansion including large oceans, waves, storms and upgraded water mechanics. | Applied as locked scope. Marine weather must be a major connected system rather than decoration. |
| 26A - Maritime and Naval Expansion Foundation | Regional fields, local effects, forecasting, navigation hazards, shoreline effects, magical weather, difficulty scaling and separation from presentation. | Primary expansion authority and ownership boundary. |
| 26B - Water, Liquid and Fluid Simulation Overhaul | Stable Water Bodies, local fluid islands, surface/depth queries, flooding, phase boundaries, current/wave query slots, LOD and authority. | Supplies liquid mechanics and local flood execution. 26D never creates a competing liquid solver. |
| 26C - Marine World Generation | Marine Regions, Coast Segments, Water Body graph, prevailing exposure, fetch, tide regimes, current corridors, storm susceptibility, surge sensitivity, ice regimes, routes and harbour fields. | Supplies generated topology and baseline environment inputs. 26D may change state but must not regenerate topology independently. |
| 24A - Atlas Foundations | Deterministic authored randomness, nested records, relationship graphs, procedural history, dynamic states and validation. | Governs field identity, seed derivation, events, persistence and no-hidden-hardcoding rules. |
| 24B - Overworld Regions, Climate and Surface Biomes | Climate fields, seasons, temperature, moisture, exposure, rain shadows, hydrology, disasters and surface-biome adaptation. | Primary broad atmospheric and terrestrial-climate source. 26D extends compatible fields offshore. |
| 24C - Oceans and Special Overworld Biomes | Marine climate, currents, tides, gyres, storm seas, sea ice, route seasonality, coast change, transformed seas and presentation requirements. | Primary authored marine environmental-content authority. 26D implements time-varying mechanics and queries. |
| 24K - History, Events and Dynamic World States | Storm seasons, floods, port closure, mana storms, warnings, escalation, aftermath and world memory. | Supplies event and state-change expectations; 26D supplies environmental execution fields. |
| 00-17 main documents | Sandbox freedom, configurable survival, living NPCs, automation, practical magic, ecology, structures, quests, combat and accessible UI. | Weather must connect these systems without replacing their source-of-truth ownership. |
| Sets 21-23 - Forge and Presentation Forge | Semantic source, replaceable generated products, sockets/events, scalable audio and VFX, preview and validation. | Presentation consumes environment snapshots. Visual waves, particles and sound do not determine gameplay. |
| 25A-25B - Governance and Registry Kernel | POC retirement, source ownership, qualified IDs, definitions, facets, instances, aliases, validation and production classification. | All 26D records follow the amended Set 25 contracts. |
| Legacy 18 | Determinism, authority, save safety, LOD, testing and performance principles; Unreal direction is obsolete. | Retain engine-neutral reliability requirements only. Godot/Summer implementation is rewritten here and finalised in 26O. |

# Static Table of Contents

- 1. Locked Dynamic Marine Environment Identity
- 2. Source-Derived Direction and Recommendation Boundary
- 3. Scope, Non-Goals and Ownership Boundaries
- 4. Canonical Terminology and Field Families
- 5. Authoritative Environment State Architecture
- 6. Climate Hierarchy and Simulation Time Scales
- 7. Generated Baseline Inputs from 24B, 24C and 26C
- 8. World Time, Calendar, Seasons and Celestial Drivers
- 9. Atmospheric Regions, Weather Cells and Marine Field Stacks
- 10. Prevailing Wind Profiles
- 11. Dynamic Wind, Gusts, Shear and Local Modification
- 12. Wind Exposure, Shelter, Corridors and Port Conditions
- 13. Surface Current Architecture
- 14. Deep Currents, Exchange and Vertical Movement
- 15. Seasonal Currents, Eddies and Local Current Modifiers
- 16. Tide Regimes, Phase and Range
- 17. Tidal Access, Intertidal State and Harbour Windows
- 18. Extraordinary Tides, Mana Tides and Realm Influence
- 19. Authoritative Wave-State Architecture
- 20. Wind Sea, Swell, Fetch, Period and Direction
- 21. Shoaling, Refraction, Breaking and Coastal Response
- 22. Wave Force, Motion and Damage Interfaces
- 23. Weather Fronts and Storm Lifecycle
- 24. Severe Marine Storm Families
- 25. Storm Tracks, Intensity, Dissipation and Uncertainty
- 26. Storm Surge, Coastal Flooding and 26B Activation
- 27. Cloud, Rain, Snow, Hail, Spray, Fog and Visibility
- 28. Sea Ice, Freeze-Thaw, Pack Movement and Seasonal Routes
- 29. Lightning, Waterspouts, Rogue Waves and Rare Hazards
- 30. Magical, Corrupted, Blessed and Dimensional Weather
- 31. Forecasting, Observation, Instruments and Player Knowledge
- 32. Warning Networks, Beacons, NPC Response and Emergency Planning
- 33. Navigation, Routes, Ports, Trade and Civilisation Interfaces
- 34. Vessel, Propulsion, Anchoring and Seaworthiness Interfaces
- 35. Swimming, Diving and Underwater Handoff to 26E
- 36. Ecology, Fishing, Creatures, Dungeons and Boss Interfaces
- 37. Combat, Naval Warfare and Structure-Hazard Interfaces
- 38. Events, Persistence, Shoreline Change and World Memory
- 39. Difficulty, Accessibility and World Settings
- 40. Simulation LOD, Streaming and Unloaded-World Processing
- 41. Multiplayer Authority, Determinism and Replication
- 42. Registry, Schema and Data Ownership Foundations
- 43. Godot/Summer Engine Technical Boundaries
- 44. Presentation Forge, Audio, VFX and Readability Boundaries
- 45. Performance Budgets and Scalability Targets
- 46. Prototype Laboratories, Seed Suites and Acceptance Tests
- 47. Risks, Failure Modes and Redesign Triggers
- 48. Production Classification and Relationship with Set 25
- 49. Main-Document, Atlas and Forge Integration Matrix
- 50. Decision Register
- 51. Handoff to Document 26E
- Appendix A. Canonical Glossary
- Appendix B. Environment Record Templates
- Appendix C. Sea-State, Storm and Warning Matrices
- Appendix D. Forecast Confidence and Route-Risk Matrix
- Appendix E. Validation and Failure-Code Catalogue
- Appendix F. Prototype and Seed Test Matrix
- Appendix G. Completion Checklist

# 1. Locked Dynamic Marine Environment Identity

The Dynamic Marine Environment System is the changing climate, movement, hazard and information layer of Leyforge's water world. It transforms generated oceans and coasts into places with seasons, travel windows, shelter, danger, opportunity, prediction and memory.

> **Locked Rule**
>
> Every major marine environment feature must answer at least one gameplay question: what does it move, expose, conceal, close, open, power, damage, warn, reveal, reroute, nourish, freeze, flood or transform? A field that changes only a shader is presentation. A gameplay field must produce readable consequences and stable queries.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Coherent Climate | Weather inherits region, season, coast, water and magic context. | Conditions feel like part of the world rather than random debuffs. |
| Navigable Motion | Wind, currents, tides and waves alter route choice and timing. | Sailors can exploit conditions, shelter or wait instead of only fighting controls. |
| Forecastable Risk | Storms have formation, tracks, warnings and uncertainty. | Preparation and judgement matter; disaster is not an invisible dice roll. |
| Civilisation Pressure | Ports, fleets, fisheries and coastal settlements adapt to recurring conditions. | Infrastructure, jobs, trade and politics reflect local weather. |
| Physical Consequence | Surge, flooding, ice, lightning and heavy seas affect structures and vessels. | Weather can change outcomes and leave persistent evidence. |
| Fantasy Expression | Mana, corruption, blessing and realm influence can reshape ordinary patterns. | Magical weather remains system-connected and source-readable. |
| Performance-Aware Simulation | Regional fields replace global particle-level physics. | Large worlds can have active weather without impossible cost. |

## 1.1 Environment Design Promise

A player should be able to read the sea before committing to a crossing. Cloud shape, wind direction, wave alignment, swell, tide marks, animal behaviour, harbour flags, NPC warnings, charts and instruments should agree. Better skill and infrastructure provide better confidence, not exclusive permission to understand the world.

## 1.2 What the System Is Not

- It is not full planetary computational fluid dynamics or real-world numerical weather prediction.
- It is not an independent weather map that ignores generated Marine Regions, coasts and routes.
- It is not a visual-only ocean shader with hidden unrelated movement values.
- It is not permission for lethal storms to appear without warning or recovery options.
- It is not exact Earth astronomy, meteorology or oceanography where realism harms readability or performance.
- It is not a second damage, magic, ecology, event, route or vessel system.
- It is not a fixed scripted storm sequence retained from the retired POC.

# 2. Source-Derived Direction and Recommendation Boundary

| Decision Class | Meaning | Examples in 26D |
| --- | --- | --- |
| Locked by Ash | Explicit direction requiring Ash approval to change. | Dedicated maritime expansion; meaningful waves and storms; water overhaul; major ocean play. |
| Locked by 26A-26C | Approved Set 26 foundations. | Hybrid regional/local/presentation architecture; stable Water Bodies; generated topology; 26D dynamic-field ownership. |
| Atlas-Owned | Authored climate or transformed-environment identity consumed here. | Storm-sea biome, polar sea, mana tide, corrupted weather, seasonal patterns. |
| 26D Operational Resolution | Contract required to make approved direction executable. | Field stack, storm instances, forecast knowledge, sea-state classes, local query snapshots. |
| Prototype Default | First-pass numerical or cadence target requiring evidence. | Field-cell sizes, storm update cadence, forecast horizon, wave-force thresholds. |
| Pending Later Document | Consumer behaviour owned elsewhere. | Sail performance in 26G, swimming response in 26E, naval damage in 26L. |
| Deferred | Compatible complexity not committed to first production scope. | Fully coupled global atmosphere-ocean model, destructive continuous coastal erosion, unrestricted tornado simulation. |

No numerical threshold, world frequency or severity rate is final unless marked Locked or Approved Baseline. Prototype defaults must be measurable, configurable and replaceable.

# 3. Scope, Non-Goals and Ownership Boundaries

## 3.1 Included Scope

26D owns:

- Dynamic wind, wave, tide, current, storm, surge, fog, visibility and sea-ice state.
- Environment-state queries and field snapshots.
- Storm formation, movement, forecasting, warnings and dissipation.
- Weather-driven route, port, coast and Water Body modifiers.
- Weather knowledge, forecast confidence and warning infrastructure contracts.
- Environmental event persistence and unloaded progression.
- Difficulty, accessibility, performance and authority rules for these fields.

## 3.2 Explicit Non-Goals

26D does not own:

- Liquid-cell transfer, pumps, flooding volume or phase conversion execution: 26B.
- Basin, coast, island, route or harbour generation: 26C.
- Player swimming, breath, pressure or underwater controls: 26E.
- Vessel construction and mass: 26F.
- Vessel movement, propulsion and stability: 26G.
- Final ports, fleets, economy, combat, ecology or event content: 26J-26M and Atlas owners.
- Final particles, shaders, sounds or camera effects: Sets 22-23 and 26O.

## 3.3 No Duplicate Truth Rule

A consumer receives one environment snapshot for a time and location. It may not separately calculate its own tide, wave or wind state from unrelated noise. Presentation may add cosmetic detail, but cosmetic variation cannot alter route access, vessel force, flood level or hazard outcome.

# 4. Canonical Terminology and Field Families

| Term | Working Definition |
| --- | --- |
| Climate Baseline | Generated long-term environmental tendency inherited from world, region, season and marine topology. |
| Marine Field Stack | The authoritative set of wind, current, tide, wave, storm, visibility, ice and extraordinary fields affecting a query location. |
| Field Snapshot | Immutable read result for one location, time, scale and knowledge/authority context. |
| Weather Cell | Bounded atmospheric state region used to evolve fronts, precipitation and local weather. |
| Storm Instance | Persistent moving severe-weather record with origin, structure, track, intensity and lifecycle. |
| Tide Regime | Definition controlling phase pattern, base range, local amplification and extraordinary modifiers for a Water Body/coast. |
| Current Corridor | Generated directional tendency that dynamic current state modifies. |
| Wave Train | Aggregate waves sharing direction, period and energy; wind sea and swell are separate trains. |
| Sea State | Readable aggregate class describing surface motion and expected gameplay effects. |
| Surge | Temporary regional water-level offset caused by wind, pressure, wave setup, tide interaction or extraordinary fields. |
| Forecast Product | Prediction record with issue time, horizon, confidence, source and affected regions/routes. |
| Warning State | Communicated hazard level tied to thresholds and response recommendations. |
| Extraordinary Field | Magical, corrupted, blessed, dimensional or boss-generated environment modifier with a valid source. |

# 5. Authoritative Environment State Architecture

The architecture uses layered definitions and runtime records.

| Layer | Ownership | Examples |
| --- | --- | --- |
| Immutable Definitions | Registry/content packs. | Climate profile, tide regime, storm family, warning profile, magical-weather definition. |
| Generated Baseline | 24B/24C/26C generation. | Prevailing wind, fetch, current corridor, surge sensitivity, ice regime. |
| Dynamic Regional State | 26D services. | Current wind vector, weather cell, tide phase, wave trains, active storm, fog and ice extent. |
| Local Derived Snapshot | 26D query service. | Wind at mast, wave force at hull, water level at dock, visibility at lookout. |
| Bounded Physical Execution | Owning local systems. | 26B flood water, 26G vessel response, 26L damage, 26E player motion. |
| Presentation | Forge-authored runtime products. | Water mesh, cloud scene, spray, particles, audio and camera response. |

## 5.1 Snapshot Requirements

A snapshot can include:

- Authoritative timestamp and field-version key.
- Wind vector, gust class and turbulence class.
- Surface and deep current vectors where relevant.
- Tide offset, trend and next extrema.
- Wave trains, sea state, breaking state and local water normal inputs.
- Storm membership, severity, surge and lightning risk.
- Visibility, precipitation, cloud, spray and fog classes.
- Ice concentration, thickness class and movement tendency.
- Extraordinary modifiers and source IDs.
- Knowledge-limited version for UI if the player lacks direct measurement.

Snapshots are read-only. Consumers return actions or requests to their owning systems rather than mutating field truth.

# 6. Climate Hierarchy and Simulation Time Scales

Marine climate is layered so long-term identity, seasonal change and immediate weather remain coherent.

| Time Scale | Typical State | Persistence/Update Direction |
| --- | --- | --- |
| Geological/World Baseline | Basin position, latitude tendency, mountains, ocean exchange, magical scars. | Generated and versioned; changes only through major world events. |
| Climate Era | Warm/cold phase, persistent drought, realm leakage, long corruption cycle. | Event/history state; saved when active. |
| Seasonal | Prevailing wind, storm season, ice tendency, river discharge, current strength. | Deterministic calendar profile plus saved exceptional modifiers. |
| Synoptic | Fronts, storm tracks, pressure tendency, fog banks and broad precipitation. | Regional updates over in-game hours/days. |
| Local Weather | Gusts, squalls, rain bands, spray, wave breaking and visibility. | Faster bounded updates near relevant players and systems. |
| Presentation Microdetail | Ripples, foam particles, cloud wisps, splash timing. | Client presentation only; may be non-deterministic where harmless. |

## 6.1 Time Compression

Sleeping, fast travel and unloaded simulation advance environment state through deterministic coarse steps. A storm cannot be frozen forever because nobody is nearby, nor may it teleport to a different state on load. Important threshold crossings create event records for ports, vessels, settlements and routes.

# 7. Generated Baseline Inputs from 24B, 24C and 26C

| Input | Source | 26D Use |
| --- | --- | --- |
| Temperature/Moisture/Seasonality | 24B climate. | Air-sea contrast, storm family eligibility, fog, ice and precipitation. |
| Terrain and Rain Shadow | 24B/26C. | Wind modification, coastal convergence, sheltered water and lee effects. |
| Marine Region and Water Body | 26C. | Field partition, tide ownership, storm interaction and query identity. |
| Prevailing Wind Exposure | 26C. | Seasonal baseline vector and coast/port exposure. |
| Directional Fetch | 26C. | Wind-sea growth and wave approach. |
| Tide Regime ID | 26C. | Phase, range and local tidal-state calculation. |
| Current Corridor | 26C. | Dynamic current baseline and route advantage. |
| Storm Susceptibility | 26C/24C. | Formation weight, season and intensity ceiling. |
| Surge Sensitivity | 26C. | Water-level amplification and flood activation. |
| Ice Regime | 26C/24C. | Freeze, breakup, drift and seasonal route state. |
| Extraordinary Field Socket | 24C/26C. | Mana, corruption, blessing, realm and boss-weather source. |

If required baseline fields are absent, 26D validation must report the missing owner rather than inventing silent defaults that change world identity.

# 8. World Time, Calendar, Seasons and Celestial Drivers

26D consumes the world calendar rather than defining a competing one. Environment definitions express cycles in calendar-relative terms.

## 8.1 Required Calendar Interfaces

- Absolute world time and monotonic simulation tick.
- Day length, year/season profile and optional moon/celestial phase sources.
- Time-scale changes, sleeping and administrative time skip.
- Dimension/realm time relationship where compatible.
- Event calendars and extraordinary cycles.

## 8.2 Simplified Celestial Rule

Ordinary tides may use one or more deterministic cycle components with stable phase offsets. The game need not model actual orbital mechanics. Visible moons or celestial bodies should agree with broad tide and magical-event presentation where the world lore links them.

# 9. Atmospheric Regions, Weather Cells and Marine Field Stacks

The world is divided into coarse atmospheric regions aligned to climate and streaming topology. Dynamic weather cells may overlap Marine Regions and land regions, but references remain stable.

| Record | Purpose |
| --- | --- |
| Atmospheric Region | Long-lived climate partition and update container. |
| Weather Cell | Current temperature, moisture, pressure tendency, wind, cloud and precipitation state. |
| Front Edge | Transition boundary producing wind change, cloud, rain, fog or storm development. |
| Marine Field Stack | Water-facing current, tide, wave, surge, ice and extraordinary state. |
| Local Modifier | Terrain, coast, structure, river, harbour or magic adjustment. |

## 9.1 Alignment Rule

Field grids may use implementation-friendly cells, but authoritative queries resolve relationships to stable regions and Water Bodies. Changing field resolution must not rename a sea, coast, route or storm.

# 10. Prevailing Wind Profiles

Prevailing wind is the broad seasonal tendency used for climate identity, sailing expectations, port design and baseline wave exposure.

A profile contains:

- Direction distribution by season.
- Typical strength band and variability.
- Calm frequency and reversal probability.
- Storm-family contribution.
- Altitude and coast transition modifiers.
- Magical or realm-source modifiers.

Prevailing wind is not the current wind. It is the expected background from which dynamic state evolves. Charts, NPC knowledge and settlement architecture may communicate it even when current conditions differ.

# 11. Dynamic Wind, Gusts, Shear and Local Modification

Dynamic wind is derived from nearby weather cells, fronts and storms, then adjusted locally.

| Modifier | Typical Effect |
| --- | --- |
| Coast Transition | Sea breeze, land breeze, convergence or changing turbulence. |
| Mountain/Cliff | Blocking, downslope wind, acceleration around headlands or lee calm. |
| Strait/Valley | Funnelled direction and increased speed. |
| Forest/Urban/Port | Surface drag and turbulence. |
| Storm Band | Rotating or directional wind, gust fronts and rapid shifts. |
| Temperature Contrast | Local circulation and fog/precipitation tendency. |
| Magic/Structure | Ward shelter, wind engine wake, ritual field or corruption pulse. |

## 11.1 Gust Model

Gusts are deterministic bounded variation around a mean vector. Gameplay receives gust class, duration and direction change rather than raw high-frequency noise. Presentation may interpolate more detailed motion without changing force outcomes.

## 11.2 Wind Shear

Different altitude samples may return different wind. 26G can use mast/sail height samples; 26E can use near-surface samples; skyland systems may reuse the field contract later without making skyships part of current Set 26 scope.

# 12. Wind Exposure, Shelter, Corridors and Port Conditions

26C supplies geometric exposure and shelter candidates. 26D evaluates current conditions.

| Condition | Result Examples |
| --- | --- |
| Wind aligned with open fetch | Growing wind sea, higher mooring load and exposed approach. |
| Wind offshore from coast | Reduced nearshore breaking but increased departure risk for small craft. |
| Wind onshore | Surf, spray, surge contribution and difficult harbour entrance. |
| Lee of island/headland | Reduced wind sea, turbulence at boundary and possible anchorage. |
| Funnelled strait | Fast wind, strong wave-current interaction and route hazard. |
| Warded harbour | Reduced local wind according to infrastructure capacity and mana supply. |

Shelter is never binary. A harbour has directional shelter classes and failure limits. Severe storms may exceed ordinary breakwaters or wards.

# 13. Surface Current Architecture

Surface current combines generated corridor tendency with dynamic modifiers.

**Conceptual input stack:**

`baseline corridor + seasonal profile + wind drift + tide flow + river exchange + storm effect + ice effect + extraordinary modifier + local geometry`

The output is a vector field and readable current class. Exact hydrodynamic solving is not required.

## 13.1 Current Query Outputs

- Direction and speed class.
- Stability/variability class.
- Surface, near-surface and optional deep vector.
- Tidal reversal state.
- Turbulence/eddy class.
- Route benefit or penalty estimate.
- Hazard flags such as rip, whirl, outflow, ice drift or magical pull.

# 14. Deep Currents, Exchange and Vertical Movement

Deep current state changes more slowly than surface weather. It is primarily derived from basin exchange, temperature/salinity profile, vents, trenches, realm influence and major events.

Deep currents support:

- Underwater navigation and drift.
- Nutrient and ecology movement.
- Vent, trench and dungeon environment.
- Submerged structure access.
- Boss or creature migration.
- Future specialised vessels without committing full submarines to first scope.

Vertical movement is represented by upwelling, downwelling and mixing classes rather than full continuous flow simulation.

# 15. Seasonal Currents, Eddies and Local Current Modifiers

Season, river discharge, monsoon-like profiles, ice melt and prevailing wind may alter route currents. Local eddies occur near headlands, islands, reefs, harbour mouths, river mouths, wreck fields and structures.

## 15.1 Eddies

Eddies are bounded local modifiers with centre, radius/shape, rotation, strength, duration and source. They may be stable geographic features or temporary storm effects. A decorative whirlpool cannot apply hidden force unless an authoritative eddy or hazard record exists.

## 15.2 Player Engineering

Canals, locks, dams, dredging, breakwaters and current turbines can alter local current interfaces through saved deltas. Regional current corridors change only through approved large events or infrastructure projects with explicit recalculation and migration rules.

# 16. Tide Regimes, Phase and Range

A Tide Regime definition supplies one or more deterministic cycle components, base range, variability, local amplification and exceptional modifiers.

| Regime Element | Meaning |
| --- | --- |
| Phase Anchor | Stable cycle origin for a Water Body or connected tide group. |
| Base Range | Ordinary difference between low and high state. |
| Shape | Smooth, asymmetric, double-peaked, weak or mixed cycle. |
| Local Amplification | Coast, bay, estuary, strait or shelf multiplier. |
| Seasonal Modifier | Long-term water level or range tendency. |
| Meteorological Modifier | Wind/pressure surge contribution. |
| Extraordinary Modifier | Mana, realm, ritual, boss or world-event tide. |

## 16.1 Predictability Rule

Ordinary tide timing is deterministic and chartable. Uncertainty may affect exceptional surge or magical events, but a normal tide table must not become randomly wrong without a recorded cause.

# 17. Tidal Access, Intertidal State and Harbour Windows

Tide changes local accessibility without ordinary terrain regeneration.

| Affected Feature | Possible Tide Consequence |
| --- | --- |
| Harbour Entrance | Draft window, current reversal, exposed shoal or stronger crossflow. |
| Beach/Flat | Wading access, shellfish gathering, stranded craft or hidden hazard. |
| Sea Cave | Entrance opens/closes or changes current. |
| Estuary/Delta | Salinity, current and flood interaction. |
| Bridge/Gate/Lock | Clearance, pressure difference and operating window. |
| Reef/Wreck | Exposed, submerged or changed collision risk. |
| Dungeon/Structure | Timed route, puzzle state or evacuation constraint. |

Intertidal presentation, wetness and simple access may be derived. Persistent block erosion or deposition requires 26C/24K world-delta events.

# 18. Extraordinary Tides, Mana Tides and Realm Influence

Extraordinary tides require a source record and authored definition.

Examples include:

- Spring-like celestial alignment events.
- Mana tides that increase magical charge or instability.
- Portal tides that alter realm routes.
- Corruption tides that spread hazardous water state.
- Boss-generated drawdown or flood pulse.
- Ritual-controlled harbour tide.

26D owns timing, footprint and environment modifiers. Magic owns spell/ritual cost and permission. Events own narrative triggers and world-state outcomes. 26B owns liquid execution when bounded areas flood or drain.

# 19. Authoritative Wave-State Architecture

Waves are represented by aggregate wave trains and a local sea-state snapshot.

| Wave Component | Source |
| --- | --- |
| Wind Sea | Local wind, duration, directional fetch and current interaction. |
| Swell | Remote storm/wind source propagated between compatible Marine Regions. |
| Tidal/Current Chop | Current opposing wind/wave direction or channel compression. |
| Vessel/Impact Wake | Local bounded source from moving vessel or large impact. |
| Extraordinary Wave | Storm, boss, magic, collapse or event record. |

The system does not create one rigid body per crest. Gameplay samples height tendency, period, direction, steepness, breaking state and force class. Presentation generates convincing water motion from the same inputs.

# 20. Wind Sea, Swell, Fetch, Period and Direction

## 20.1 Wind-Sea Growth

Wind-sea growth is based on strength, duration and directional fetch. Barrier geometry from 26C limits fetch. A newly changed wind may produce strong gusts before a fully developed sea.

## 20.2 Swell Propagation

Swell can outlive and outrun its source storm. It propagates as a lower-frequency regional wave-train record, attenuates across distance and changes around islands, shelves and straits through simplified rules.

## 20.3 Multiple Trains

Cross-seas may contain wind waves and one or more swell directions. The local snapshot exposes a primary train plus secondary complexity class so vessel and swimming systems can respond without processing unlimited waves.

# 21. Shoaling, Refraction, Breaking and Coastal Response

As waves enter shallow water, 26D applies simplified coastal transformations using depth, slope, substrate, coast orientation and barriers.

| Process | Gameplay Purpose |
| --- | --- |
| Shoaling | Increases steepness and nearshore motion. |
| Refraction | Turns wave energy toward/around coast geometry. |
| Breaking | Creates surf, impact, spray, swimming hazard and vessel limits. |
| Diffraction/Shelter | Allows reduced wave energy behind barriers/headlands. |
| Reflection | Adds roughness near cliffs, walls and enclosed basins. |
| Wave Setup/Run-up | Contributes to local water level and storm flood activation. |

Exact erosion is not continuously simulated. Repeated high exposure may contribute to an event threshold; 26C/24K then own persistent shoreline change records.

# 22. Wave Force, Motion and Damage Interfaces

26D provides environmental force, not final object response.

| Consumer | Environment Inputs | Consumer Ownership |
| --- | --- | --- |
| 26G Vessel Movement | Wave trains, local surface normal, force class, period, direction, current and wind. | Heave/roll/pitch response, stability, propulsion and control. |
| 26E Player Interaction | Surface motion, breaking, undertow/current, impact and visibility. | Swimming, stamina, control, rescue and damage. |
| 26L Combat/Damage | Impact class, spray, deck-wash threshold and severe-event source. | Block/section damage, crew effects and combat balance. |
| Structures/Ports | Wave load, overtopping, surge and debris class. | Structural resistance, damage and repair. |
| Presentation | Phase seeds, spectra/sea state, foam, spray and impact events. | Mesh, shader, particles, audio and camera. |

## 22.1 Comfort Boundary

Camera bob and visual horizon movement can be reduced or stabilised without changing authoritative forces. A player may receive alternative motion cues through HUD, sound and controller feedback.

# 23. Weather Fronts and Storm Lifecycle

Storms emerge from weather-cell relationships and authored family rules.

**Lifecycle:**

1. Candidate conditions become eligible.
2. A disturbance record forms with low confidence and limited effect.
3. The system validates space, season, source and event budgets.
4. The storm organises, gains a track and begins warning signals.
5. It intensifies, weakens or transforms according to environment.
6. Bands affect wind, waves, precipitation, visibility, surge and lightning.
7. The storm dissipates, exits, merges or becomes an aftermath event.
8. Significant consequences are written to history and world state.

A storm may fail to form. Forecasts should communicate probability and confidence, not guarantee every disturbance.

# 24. Severe Marine Storm Families

| Family | Typical Identity | Primary Hazards |
| --- | --- | --- |
| Squall Line | Fast-moving narrow front. | Sudden wind shift, gusts, rain, lightning and short steep waves. |
| Frontal Gale | Broad regional storm. | Sustained wind, swell, cold/warm change, poor visibility and route closure. |
| Warm-Sea Cyclone | Organised rotating severe storm where climate permits. | Extreme wind, long swell, surge, flooding and prolonged disruption. |
| Polar Storm/Blizzard | Cold marine low and snow. | Freezing spray, ice, whiteout, exposure and route loss. |
| Convective Thunderstorm | Local intense cells. | Lightning, hail, gust fronts, waterspouts and visibility. |
| Fog Bank/Sea Mist Event | Stable moisture/temperature contrast. | Navigation uncertainty, collision risk and concealment. |
| Ash/Volcanic Storm | Eruption-linked weather. | Ash, lightning, contamination, darkness and engine/filter stress. |
| Mana Storm | High-mana field instability. | Spell variance, machine overload, charged waves, creature activity and portal effects. |
| Corruption Storm | Source-driven transformed weather. | Hazardous liquid/air states, altered ecology, fear and spreading world pressure. |

Content definitions may add families, but each requires formation conditions, readable signs, effects, counters, LOD and validation.

# 25. Storm Tracks, Intensity, Dissipation and Uncertainty

A Storm Instance stores current centre/footprint, movement vector, internal bands, intensity, trend and forecast envelope.

## 25.1 Track Rules

- Tracks respond to broad atmospheric steering fields and terrain/coast interaction.
- Storms may curve, stall, split, merge or transition only through authored rules.
- The player cannot be targeted as a hidden steering input.
- World settings may reduce chance, intensity or persistence.
- Important route/settlement impacts create event hooks and warning escalation.

## 25.2 Intensity

Intensity is a multi-axis profile, not one damage number:

- Wind severity.
- Wave/swell severity.
- Precipitation and visibility.
- Surge potential.
- Lightning/hail/ice.
- Magical or contamination effect.
- Duration and spatial extent.

## 25.3 Dissipation

Storms weaken through unfavourable temperature, land interaction, lost moisture/energy, opposing magic, event resolution or family-specific limits. Dissipation may leave swell, fog, flooding, debris, changed currents or ecological effects.

# 26. Storm Surge, Coastal Flooding and 26B Activation

26D calculates a local water-level stack:

`baseline surface + tide offset + seasonal level + surge + wave setup/run-up + extraordinary modifier`

26D then issues flood-interface inputs to 26B for eligible Coast Segments, structures, ports, caves and compartments.

## 26.1 Flood Activation Contract

| Step | Owner |
| --- | --- |
| Identify threatened coast/structure and target surface offset. | 26D. |
| Determine floodable boundaries, openings and local fluid islands. | 26B/structures. |
| Transfer actual liquid volume and update cells/compartments. | 26B. |
| Apply structure, NPC, vessel and player consequences. | Owning systems. |
| Record warnings, evacuation, damage and aftermath. | Events/settlements/structures. |
| Persist terrain or topology change when threshold/event approves. | 26C/24K world deltas. |

## 26.2 Fairness Requirements

- Ordinary settlements in surge zones require at least one adaptation, warning, evacuation or mitigation path.
- Severe floods must expose causes and thresholds through diagnostics.
- Relaxed settings can convert destructive flooding into temporary water/presentation.
- Player-built low areas are warned through inspection tools where knowledge permits.

# 27. Cloud, Rain, Snow, Hail, Spray, Fog and Visibility

Visibility is an authoritative class derived from light, precipitation, fog, spray, smoke/ash, magical fields and local shelter.

| Visibility Source | Gameplay Effects |
| --- | --- |
| Fog/Mist | Reduced sight, chart uncertainty, horn/beacon importance and collision risk. |
| Heavy Rain | Reduced sight, deck handling, fire suppression and sound masking. |
| Snow/Blizzard | Whiteout, freezing, exposure and landmark loss. |
| Spray | Near-surface visibility and freezing-spray risk. |
| Ash/Smoke | Filter, health, machinery and navigation consequences. |
| Magical Veil | Source-specific concealment, false landmarks or altered detection. |

Presentation may be reduced for comfort/performance, but gameplay visibility must then be communicated through explicit UI or simplified rule settings.

# 28. Sea Ice, Freeze-Thaw, Pack Movement and Seasonal Routes

26C supplies ice regime; 26D owns seasonal state and movement tendency; 26B owns local phase conversion where physical ice/water cells matter.

| Ice State | Meaning |
| --- | --- |
| Open Water | No route restriction beyond cold/exposure. |
| New/Thin Ice | Dangerous to walk, may impede tiny craft and form around sheltered coasts. |
| Broken/Drift Ice | Moving obstacles and collision hazard. |
| Pack Ice | Regional route restriction with leads and pressure zones. |
| Fast Ice | Attached to coast/structure; may create temporary access. |
| Heavy/Exceptional Ice | Requires specialised capability, route support, magic or seasonal wait. |

## 28.1 Ice Movement

Pack movement is a regional field driven by wind, current, coast geometry and temperature. Local collision pieces may be represented at active range; distant ice remains concentration and route-state records.

## 28.2 Freezing Spray

Cold wind and waves may create vessel/structure icing inputs. 26G/26L decide mass, control and damage effects; 26D supplies exposure rate class.

# 29. Lightning, Waterspouts, Rogue Waves and Rare Hazards

Rare hazards must be authored, bounded and telegraphed.

| Hazard | Formation/Source | Required Counterplay |
| --- | --- | --- |
| Lightning | Thunderstorm, storm band or magical charge. | Shelter, grounding, ward, route avoidance or timing. |
| Waterspout | Convective/rotating storm cell. | Visible funnel, forecast probability, avoidance and dissipation. |
| Rogue Wave | Constructive wave-train/storm or extraordinary event. | Regional warning class, visual/sound cue, sea-worthy response or route choice. |
| Sudden Squall | Front/gust source. | Clouds, pressure/wind clues, short warning and sail/anchor response. |
| Ice Pressure | Wind/current compressing pack. | Route lead, retreat, reinforced capability or wait. |
| Magical Vortex | Explicit source record. | Research, ward, ritual, special route or event resolution. |

Unavoidable instant-kill hazards are prohibited in ordinary settings. Harsh worlds may increase uncertainty and consequence but must retain evidence and at least one viable preparation path.

# 30. Magical, Corrupted, Blessed and Dimensional Weather

Extraordinary weather overlays ordinary fields through sourced modifiers.

## 30.1 Source Requirements

Every extraordinary field requires:

- Definition and source type.
- Spatial footprint and falloff.
- Start/end or maintenance condition.
- Visual/audio/readability package.
- Environmental modifications.
- Gameplay owners and affected tags.
- Counters, research or adaptation.
- Persistence and world-memory rule.

## 30.2 Example Families

| Family | Possible Effects |
| --- | --- |
| Mana Tide | Increased mana density, charged currents, altered spells and machine opportunity/risk. |
| Storm Crown | Repeating lightning/wind province tied to skyland or ancient engine. |
| Blessed Calm | Safer water, healing or navigation benefit maintained by covenant/structure. |
| Drowned Memory Fog | Spirits, echoes, false routes and salvage/story access. |
| Corruption Front | Hazardous water/air state, creature changes and ward pressure. |
| Realm Leak Weather | Dimension-specific temperature, gravity, light, material or portal effects. |

Magic owns costs and school rules. 26D owns environment propagation and queries. Atlas and events own content identity and history.

# 31. Forecasting, Observation, Instruments and Player Knowledge

The simulation contains authoritative present and future evolution within deterministic limits. Forecasts are knowledge products, not the hidden truth itself.

## 31.1 Forecast Sources

- Direct environmental observation.
- Local NPC experience and maritime culture knowledge.
- Wind vane, tide marks, barometer-like instrument, thermometer and rain gauge.
- Buoys, lighthouses, weather stations and port signal systems.
- Charts, tide tables and route logs.
- Creature behaviour and ecological clues.
- Scrying, runes, divination and magical observatories.
- Faction reports, trade news and warning networks.

## 31.2 Confidence

Forecast confidence depends on source quality, observation coverage, horizon, storm uncertainty, infrastructure condition, skill, magic interference and outdated charts. Low confidence widens the possible track or timing; it does not deliberately output unrelated false information.

## 31.3 Player Skill

Navigation, survival, magic, engineering or maritime skills may improve interpretation, warning time and route suggestions. Low skill limits precision rather than hiding obvious danger.

# 32. Warning Networks, Beacons, NPC Response and Emergency Planning

Warnings escalate through world and UI channels.

| Warning Layer | Examples |
| --- | --- |
| Environmental | Darkening horizon, swell before wind, pressure change, birds returning, unusual tide. |
| Local Infrastructure | Flags, bells, horns, lantern codes, boards, beacons and harbour closures. |
| Information | NPC dialogue, chart overlay, journal alert, forecast panel and route warning. |
| Magical | Ward pulse, divination message, mana colour change or ritual alarm. |
| Emergency | Evacuation order, ship recall, flood gates, warehouse move, shelter assignment. |

NPC settlements use knowledge, governance, jobs and infrastructure to respond. A small fishing hamlet may beach boats and move supplies; a city may close harbour gates, activate wards, dispatch rescue craft and reroute trade.

# 33. Navigation, Routes, Ports, Trade and Civilisation Interfaces

26D modifies the capability and risk of routes generated by 26C.

| Environment State | Route/Port Consequence |
| --- | --- |
| Favourable Wind/Current | Faster travel, lower fuel and high trade attractiveness. |
| Headwind/Opposing Current | Increased travel time, supply use or alternate route. |
| Low Tide | Draft restriction, exposed crossing or gathering access. |
| High Tide/Surge | Access gain for some routes, flood risk or dangerous current. |
| Fog | Reduced speed, beacon dependency, collision risk and piracy opportunity. |
| Storm Warning | Closure, convoy delay, shelter demand and price disruption. |
| Sea Ice | Seasonal closure, ice-route opening or specialist trade. |
| Magical Weather | Opportunity or restriction based on knowledge and capability. |

Distant trade and fleet simulation consumes route-state summaries, not local wave meshes. Promotion to local simulation preserves the same storm, tide and route conditions.

# 34. Vessel, Propulsion, Anchoring and Seaworthiness Interfaces

26D supplies environmental inputs to 26G and 26F-derived vessel properties.

| Input | Use in Later Vessel Systems |
| --- | --- |
| Wind at height/position | Sail force, drift, turning and rigging load. |
| Gust class | Control challenge and transient load. |
| Surface current | Ground speed, drift, docking and anchor load. |
| Wave trains/sea state | Motion, deck wash, stability demand and structural load. |
| Tide/water level | Draft, grounding, dock access and bridge clearance. |
| Surge | Mooring, flood and emergency movement. |
| Visibility | Navigation, lookout, collision and combat detection. |
| Ice | Route, collision and specialised capability. |
| Lightning/magic | Damage risk, ward/grounding and system instability. |

26D does not decide whether a vessel survives. 26G evaluates movement and stability; 26L evaluates damage; crew and AI owners choose response.

# 35. Swimming, Diving and Underwater Handoff to 26E

26E receives:

- Surface motion and breaking state.
- Current vectors by depth.
- Undertow/rip and turbulence classes.
- Visibility, precipitation and surface-entry conditions.
- Temperature, ice and freezing-spray exposure.
- Storm/lightning and extraordinary hazard flags.
- Wave impact and rescue difficulty classes.
- Forecast and warning knowledge interfaces.

26E owns player control, stamina, breath, drowning, pressure, equipment, rescue, accessibility and underwater action. It must not duplicate 26D wind/current/wave truth.

# 36. Ecology, Fishing, Creatures, Dungeons and Boss Interfaces

Environment snapshots support later ecology and content owners.

| Consumer | 26D Inputs |
| --- | --- |
| Marine Ecology/Fishing | Temperature trend, mixing/upwelling, current, storm season, ice, visibility and extraordinary fields. |
| Creature AI | Wind/current tolerance, migration window, shelter, visibility, storm response and hazard immunity. |
| Dungeons/Wrecks | Tide access, flood state, storm exposure, fog, ice and current. |
| Bosses/Titans | Territory weather, warning escalation, extraordinary fields and aftermath. |
| Resources | Storm deposition, exposed salvage, ice harvest, current power and seasonal access. |

Weather may move populations or open content, but final species, loot and boss behaviour remain owned by 26M and Atlas documents.

# 37. Combat, Naval Warfare and Structure-Hazard Interfaces

Marine conditions affect combat without replacing combat rules.

Possible interfaces include:

- Wind and rain affecting projectiles, sails, fire and smoke.
- Waves and currents affecting positioning and boarding windows.
- Fog affecting detection, targeting and retreat.
- Lightning interacting with metal, mana and wards.
- Ice creating obstacles, cover or route traps.
- Storm surge affecting coastal siege and defences.
- Structures receiving overtopping, wave load, debris and flood requests.

Combat systems must expose these effects clearly. Weather should create tactical choices, not invisible accuracy penalties.

# 38. Events, Persistence, Shoreline Change and World Memory

Routine weather is dynamic state. Major consequences become events and deltas.

| Change Class | Persistence Rule |
| --- | --- |
| Ordinary Wind/Waves/Tide | Recomputed from dynamic state; no terrain save. |
| Active Storm | Save Storm Instance, current lifecycle and affected critical records. |
| Temporary Flood/Fog/Ice | Save when necessary for continuity; may expire through simulation. |
| Damaged Port/Vessel/Structure | Owning system saves damage and repair state. |
| Breached Dune/Sea Wall/Changed Channel | 26C/structure world delta with event source. |
| Long Climate or Magical Shift | Versioned world-state event and baseline modifier. |
| Historical Disaster | Chronicle, ruins, migration, ownership, ecology and route aftermath. |

## 38.1 Save Continuity

Loading a save must not replace an approaching storm with clear weather because routine procedural state was not stored. Saves record a weather epoch, deterministic state keys and significant active instances sufficient to reconstruct continuity.

# 39. Difficulty, Accessibility and World Settings

| Setting Group | Example Controls |
| --- | --- |
| Storm Frequency | None/rare/reduced/normal/frequent or custom profile. |
| Storm Severity | Presentation only, forgiving, normal, harsh and extreme caps. |
| Warning Time | Extended, normal, reduced or knowledge-dependent. |
| Forecast Accuracy | Assisted, infrastructure-based, simulation-default or harsh uncertainty. |
| Tide Impact | Cosmetic, access only, normal, strong and extraordinary events. |
| Current/Wave Force | Reduced, normal or high gameplay influence. |
| Flood Damage | Disabled, temporary, normal or severe persistent consequences. |
| Ice | Cosmetic, seasonal route, normal hazard or severe polar profile. |
| Magical Weather | Disabled, story-only, normal worldgen or high-magic. |
| Motion Comfort | Horizon lock, camera bob, distortion, spray and shake controls. |
| Visual Clarity | High-contrast sea state, vector overlays, warning icons and simplified fog. |
| Audio | Subtitles, visual sound indicators, storm mix compression and separate warning volume. |
| Performance | Field resolution, presentation density, local wave detail and active storm budgets. |

Changing presentation comfort must not silently change gameplay unless the setting explicitly selects simplified gameplay. Multiplayer servers expose authoritative gameplay settings; each client retains independent comfort presentation.

# 40. Simulation LOD, Streaming and Unloaded-World Processing

| LOD | State | Typical Behaviour |
| --- | --- | --- |
| L0 - Immediate | Players/vessels/ports present. | Full local snapshots, bounded modifiers, flood activation and high-frequency presentation events. |
| L1 - Local Region | Nearby relevant Marine Regions. | Dynamic field cells, storm bands, route state and simplified local effects. |
| L2 - Regional | Distant active storms/routes/settlements. | Coarse field evolution, storm lifecycle, tide/current summaries and event thresholds. |
| L3 - World | Unloaded ordinary regions. | Deterministic calendar/season evolution and scheduled significant events. |
| L4 - Dormant | No active dependency. | Reconstruct baseline and advance through coarse deterministic intervals on demand. |

## 40.1 Promotion/Demotion

Promotion reconstructs local state from the same regional field stack, not a random local weather seed. Demotion aggregates local modifiers and retains significant storm, flood, route and event state.

# 41. Multiplayer Authority, Determinism and Replication

The authoritative server owns environment evolution and gameplay snapshots.

- Clients receive field summaries, storm records, tide phase and local snapshot updates.
- Clients may predict visual motion between updates but cannot decide force, surge or hazard state.
- Split-screen local players share authoritative fields but may use independent UI/accessibility presentation.
- Joining/reconnecting clients receive current environment epoch and active significant instances.
- Administrative time/weather commands are permissioned, logged and deterministic.
- Mod/content definitions are validated for compatibility before simulation.

Replication sends compact regional state and event changes rather than every rendered crest, raindrop or cloud particle.

# 42. Registry, Schema and Data Ownership Foundations

## 42.1 Definition Families

- climate_profile
- seasonal_environment_profile
- wind_profile
- tide_regime
- current_profile
- wave_profile
- storm_family
- precipitation_profile
- visibility_profile
- ice_regime
- extraordinary_weather_definition
- forecast_source_profile
- warning_profile
- environment_response_profile

## 42.2 Runtime Record Families

- atmospheric_region_state
- weather_cell_state
- front_instance
- marine_field_state
- storm_instance
- wave_train_state
- tide_state
- current_state
- surge_state
- ice_state
- forecast_product
- warning_instance
- local_environment_modifier

## 42.3 Common Required Fields

| Field Group | Required Direction |
| --- | --- |
| Identity | Qualified ID, definition ID, version, owner pack and aliases. |
| Provenance | World seed key, region/Water Body links, generation and event source. |
| Time | Created/updated time, phase, lifecycle, forecast horizon and expiry. |
| Space | Region IDs, bounds/footprint, altitude/depth range and falloff. |
| State | Current class/vector/range/intensity/trend and extraordinary modifiers. |
| Relationships | Coast, route, port, structure, storm, event and warning references. |
| Persistence | Reconstructible baseline, save-needed flag, migration and history links. |
| Validation | Required owner fields, limits, compatibility and failure codes. |

# 43. Godot/Summer Engine Technical Boundaries

## 43.1 Required Runtime Responsibilities

A practical module/service split may include:

- EnvironmentClockService.
- ClimateBaselineRegistry.
- WeatherFieldService.
- MarineFieldService.
- StormLifecycleService.
- EnvironmentQueryService.
- ForecastAndWarningService.
- EnvironmentPersistenceService.
- EnvironmentReplicationBridge.
- EnvironmentPresentationBridge.

Exact class names remain subject to 26O.

## 43.2 Godot Principles

- Use compact Resources/data records for definitions and stable runtime records.
- Use arrays, grids, graphs and spatial indices rather than Node-per-weather-cell or Node-per-wave.
- Run bounded field updates through worker jobs where safe; commit authoritative results in a controlled order.
- Scene nodes represent visible clouds, water, beacons, storms and instruments, not source-of-truth state.
- Physics consumers query snapshots at bounded points/rates rather than scanning the whole sea.
- Headless server tests must produce environment outcomes without rendering.
- Summer Engine supports development and orchestration but is not a shipped runtime dependency.

## 43.3 Determinism Boundary

Gameplay-relevant state uses stable seeds, ordered updates, quantised classes/values where necessary and authoritative timestamps. Cosmetic particle timing, foam noise and cloud wisps may be client-local when they cannot alter gameplay.

# 44. Presentation Forge, Audio, VFX and Readability Boundaries

| Presentation Product | Authoritative Inputs |
| --- | --- |
| Ocean Surface | Wave trains, sea state, wind/current, tide/surge level and local depth. |
| Clouds/Storm Sky | Weather cell, front, storm structure, precipitation and light. |
| Foam/Spray | Breaking state, coast contact, vessel wake and impact events. |
| Fog/Visibility | Visibility class, moisture, temperature contrast and extraordinary source. |
| Ice | Concentration, thickness class, movement and local collision state. |
| Audio | Wind class, wave/shore state, rain, thunder, enclosure, warning and structure response. |
| Camera/Haptics | Optional comfort-scaled cues from wave, gust, impact and thunder events. |

## 44.1 Presentation Trust Rule

A visually calm sea cannot secretly apply severe-wave forces. Reduced-effects mode may simplify visuals, but must provide explicit sea-state, direction and warning cues. Conversely, dramatic cosmetic foam may not create damage unless authoritative thresholds are crossed.

# 45. Performance Budgets and Scalability Targets

All values are prototype targets, not final commitments.

| Area | Budget Direction |
| --- | --- |
| Global Climate | Coarse deterministic fields; no per-frame world scan. |
| Active Storms | Bounded count by world preset and relevance; merge/demote distant complexity. |
| Field Updates | Adaptive cadence based on lifecycle, proximity and threshold risk. |
| Local Queries | Batched/cached per vessel, player, port and structure where possible. |
| Waves | Aggregate trains and shader/mesh synthesis; no individual wave rigid bodies. |
| Flooding | Activate 26B local islands only near eligible boundaries/events. |
| Replication | Region snapshots and deltas; no particle/crest replication. |
| Saves | Significant active instances and epoch state; avoid full field-grid dumps where reconstructible. |

## 45.1 Scalability Levers

- Atmospheric and marine field resolution.
- Update cadence and interpolation.
- Active storm/detail radius.
- Number of secondary wave trains.
- Local wind/eddy modifier count.
- Forecast/warning simulation detail for distant settlements.
- Visual cloud, spray, rain, foam and ice density.
- Flood-interface activation count.

# 46. Prototype Laboratories, Seed Suites and Acceptance Tests

## 46.1 Required Laboratories

1. **Wind and Fetch Lab** - open sea, island shelter, headland, strait and harbour.
2. **Wave/Swell Lab** - developing wind sea, remote swell, cross sea, shallow breaking and reduced-effects presentation.
3. **Tide/Harbour Lab** - access windows, current reversal, intertidal cave and deterministic table.
4. **Current Lab** - route corridor, opposing wind, river outflow, eddy and player canal modifier.
5. **Storm Lifecycle Lab** - formation, track, warning, intensification, land interaction and dissipation.
6. **Surge/Flood Lab** - tide plus storm surge activating bounded 26B flood volumes.
7. **Fog/Visibility Lab** - beacons, NPC routes, combat detection and accessibility overlays.
8. **Ice Lab** - seasonal formation, pack movement, route closure and local collision promotion.
9. **Magical Weather Lab** - sourced mana/corruption field with clear ownership and counters.
10. **Multiplayer/Save Lab** - reconnect during storm, time skip, host migration where supported and deterministic reload.

## 46.2 Acceptance Rules

- The same seed, definitions, time and saved state produce equivalent authoritative fields.
- Wind, waves, current, tide and storm agree spatially and temporally.
- Forecasts express uncertainty honestly and improve with better sources.
- Severe weather provides warning and at least one response path under default settings.
- Local flooding uses 26B and does not create a duplicate water solver.
- Reduced visual motion preserves clear gameplay information.
- Distant storms progress and affect routes without local scene nodes.
- Performance stays inside approved budgets in packaged Godot builds.

# 47. Risks, Failure Modes and Redesign Triggers

| Risk | Failure Symptom | Mitigation |
| --- | --- | --- |
| Duplicate Environment Truth | Vessel, shader and route planner report different wind/waves. | Single snapshot service and ownership validation. |
| Random Punishment | Storm appears around player with no source or warning. | Persistent lifecycle, no player-target steering and warning tests. |
| Over-Simulation | Global cells and waves consume unbounded CPU/memory. | Regional fields, aggregate waves, LOD and budgets. |
| Under-Simulation | Weather looks dramatic but never affects travel or civilisation. | Required cross-system response contracts and acceptance tests. |
| Forecast Frustration | Predictions are deliberately false or useless. | Confidence envelopes, source quality and explainable error. |
| Save Discontinuity | Weather changes completely on reload/time skip. | Environment epoch, active-instance persistence and reconstruction tests. |
| Motion Sickness | Authoritative sea state requires severe camera movement. | Separate comfort presentation and alternative cues. |
| Impassable World | Repeated storms/ice close all routes without alternatives. | Route guarantees, shelter, season windows and difficulty caps. |
| Magical Noise | Extraordinary weather becomes arbitrary recolouring. | Source records, unique mechanics, counters and content completeness. |
| Content Burden | Every biome requires bespoke weather code. | Profiles, facets, inheritance and validated reusable families. |

## 47.1 Redesign Triggers

Redesign is required if:

- A local wave or storm effect cannot be reproduced from an authoritative snapshot.
- Weather updates require scene nodes for unloaded regions.
- A default-severity storm can destroy a settlement before warnings and responses are possible.
- Tide tables disagree with actual access state under ordinary conditions.
- Reduced-motion mode removes information needed to play.
- Save/reload or multiplayer reconnect causes material environment disagreement.
- Core vessel movement would require individual physical waves rather than aggregate field inputs.

# 48. Production Classification and Relationship with Set 25

26D defines a foundation, not an automatic promise to ship every weather family at full depth.

| Package | Likely Classification Direction |
| --- | --- |
| Environment Field Kernel | Core production foundation candidate. |
| Basic Wind/Current/Tide Queries | Core maritime capability candidate. |
| Readable Sea State and Basic Waves | Core maritime capability candidate. |
| One Ordinary Storm Lifecycle and Warnings | Core/early production candidate subject to tests. |
| Surge and Bounded Coastal Flooding | Production candidate after 26B integration proof. |
| Fog/Visibility and Basic Ice | Conditional by first-release biome scope. |
| Full Cyclone, Blizzard and Rare Hazard Families | Expanded production or later content tier. |
| Magical/Corrupted/Realm Weather Catalogue | Atlas/content-pack dependent; not all Core Production. |
| Advanced Forecast Infrastructure and NPC Networks | Expansion tier according to settlement/port scope. |

Amended 25A-25B govern IDs, source ownership and admission. Later Set 25 documents classify exact content, budget implementation and audit integration.

# 49. Main-Document, Atlas and Forge Integration Matrix

| Owner/Document | Required Update or Consumption |
| --- | --- |
| 00 - Master Bible | Add maritime climate as connected survival/civilisation/adventure layer. |
| 01 - Core Loop | Add forecast, prepare, sail, shelter, recover and reroute loops. |
| 02 - Progression | Add navigation/weather knowledge, instruments, maritime skills and preparedness rewards. |
| 03 - Blocks | Add exposure, sealing, lightning, ice, wetness and weather-response facets. |
| 04 - Items | Add charts, instruments, signals, storm gear, repair and weather resources. |
| 05 - Recipes | Add instruments, beacons, wards, storm preparation and repair projects. |
| 06 - Resources | Add weather-driven access, renewable energy, salt/ice/storm salvage and strategic materials. |
| 07/20 - NPC Settlements | Add forecasts, harbour closure, evacuation, rescue, weather jobs and response plans. |
| 08 - Automation | Consume wind/tide/current energy and weather shutdown/protection interfaces. |
| 09 - Magic | Own spell/ritual cost; consume and create sourced extraordinary environment modifiers. |
| 10/24F - Creatures | Consume migration, storm, visibility, current, temperature and ice fields. |
| 11 - Biomes/Worldgen | Replace broad weather implementation with 24B-24C, 26C and 26D contracts. |
| 12/24I - Structures | Add exposure, shelter, sea wall, beacon, lighthouse, flood gate and storm-state markers. |
| 13/24E - Cultures/Factions | Add maritime climate adaptation, knowledge, law and warning traditions. |
| 14/24D - Dimensions | Reuse field architecture with realm-specific definitions and time rules. |
| 15/24K - Quests/Events | Consume storm lifecycle, warnings, closures, disasters and aftermath. |
| 16 - Combat/Defence | Consume wind, visibility, wave, lightning, ice and surge tactical effects. |
| 17 - UI/UX | Add forecasts, tide tables, route risk, sea-state, warning and accessible direction cues. |
| 18/26O - Technical | Finalise Godot modules, performance, networking, testing and deployment architecture. |
| Sets 21-23 | Author environment profiles, previews, cloud/wave/ice assets, sockets, audio, VFX and readability validation. |
| 24B-24C | Remain authored climate/marine content authority. |
| 26B | Executes local liquid/flood/phase behaviour. |
| 26C | Supplies topology and baseline profiles. |
| 26E-26O | Consume environment snapshots according to system ownership. |

# 50. Decision Register

| ID | Decision | Status |
| --- | --- | --- |
| 26D-001 | Dynamic marine environment state is authoritative regional-field data, not presentation state. | Locked. |
| 26D-002 | 26D consumes 26C topology/baselines and does not generate a separate world map. | Locked. |
| 26D-003 | 26B owns liquid volume and local flooding execution. | Locked. |
| 26D-004 | Wind, current, tide, wave, storm, visibility and ice use one queryable field stack. | Approved baseline. |
| 26D-005 | Individual rendered waves are not individual gameplay physics bodies. | Locked technical boundary. |
| 26D-006 | Ordinary tides are deterministic and chartable; exact astronomy is not required. | Approved baseline. |
| 26D-007 | Storms are persistent lifecycle instances and may not secretly target players. | Locked. |
| 26D-008 | Severe weather requires readable warning, uncertainty and response paths. | Locked player-trust rule. |
| 26D-009 | Forecast knowledge is separate from authoritative truth and improves through sources. | Approved baseline. |
| 26D-010 | Storm surge produces inputs for bounded 26B flood activation. | Locked interface. |
| 26D-011 | Magical weather requires a valid source and does not create parallel Magic truth. | Locked. |
| 26D-012 | Presentation comfort settings are separable from gameplay state. | Locked accessibility rule. |
| 26D-013 | Distant environment advances through deterministic LOD without scene nodes. | Locked technical boundary. |
| 26D-014 | Significant active storms and environment epoch state preserve save continuity. | Approved baseline. |
| 26D-015 | Exact field resolution, force thresholds, storm counts and cadence remain prototype values. | Open for 26O evidence. |

# 51. Handoff to Document 26E

Document 26E must consume the environment and fluid contracts established by 26B-26D. It must not calculate separate currents, waves, visibility or ice conditions for the player.

26E must define:

- Surface swimming, treading water, climbing from water and shore transitions.
- Breath, drowning, stamina and recovery.
- Diving, depth, pressure, temperature and visibility response.
- Player response to current, waves, surf, undertow, turbulence and storms.
- Underwater movement, tools, mining, building, interaction and combat.
- Equipment, boatside rescue, companions and NPC rescue behaviour.
- Underwater shelters, air pockets, pumps, doors and flood boundaries.
- Magic, potions, enchantments and race/culture adaptations without ancestry determinism.
- Accessibility, difficulty, UI, multiplayer authority, persistence and performance.
- Clear boundaries with 26B liquid mechanics, 26D environment fields, 16 combat and 17 UI.

> **26D Completion Statement**
>
> Document 26D establishes Leyforge's dynamic marine environment foundation. It defines climate hierarchy, prevailing and dynamic wind, surface and deep currents, deterministic tide regimes, aggregate wave trains and sea state, coastal breaking, storm lifecycle, severe-weather families, surge and flood activation, fog and visibility, sea ice, rare hazards, sourced magical weather, forecasting, warnings, route and civilisation interfaces, persistence, LOD, multiplayer authority, Godot/Summer Engine boundaries, Presentation Forge separation, production classification and validation laboratories. The set may now proceed to 26E without duplicating world generation, liquid simulation or presentation truth, and without making marine danger arbitrary or unforecastable.

# Appendix A. Canonical Glossary

| Term | Definition |
| --- | --- |
| Atmospheric Region | Stable coarse climate/update partition spanning land and water. |
| Weather Cell | Dynamic local/regional atmospheric state within an Atmospheric Region. |
| Front | Boundary between weather cells that can produce wind change, clouds and precipitation. |
| Marine Field Stack | Combined authoritative wind, current, tide, wave, storm, visibility, ice and extraordinary state. |
| Field Snapshot | Read-only environment sample supplied to gameplay or presentation. |
| Prevailing Wind | Seasonal expected wind tendency, not necessarily current conditions. |
| Wind Sea | Waves generated by current local wind. |
| Swell | Wave train propagated from a remote or earlier source. |
| Sea State | Readable class summarising wave and surface-motion conditions. |
| Tide Regime | Deterministic profile controlling phase, range, local amplification and modifiers. |
| Current Corridor | Generated baseline route tendency modified by dynamic current state. |
| Storm Instance | Persistent severe-weather record with lifecycle, track, intensity and footprint. |
| Surge | Temporary water-level increase/decrease from weather and exceptional fields. |
| Forecast Product | Knowledge-limited prediction with source, horizon, confidence and affected area. |
| Warning Instance | Communicated hazard state and recommended response. |
| Extraordinary Field | Sourced magical, corrupted, blessed, dimensional or boss environment modifier. |

# Appendix B. Environment Record Templates

## B.1 Marine Field State

| Field Group | Required Fields |
| --- | --- |
| Identity | marine_field_state_id, Water Body/Marine Region IDs, version and owner. |
| Time | timestamp, update epoch, seasonal phase and next scheduled threshold. |
| Wind | mean vector, gust class, variability and local-modifier references. |
| Current | surface/deep vectors, tide contribution, turbulence and corridor ID. |
| Tide | regime ID, phase, offset, trend and local amplification references. |
| Waves | primary/secondary wave trains, sea state, breaking and surge contribution. |
| Visibility/Ice | precipitation, fog, visibility, ice concentration/thickness and movement. |
| Extraordinary | source IDs, modifiers, warnings and event references. |
| Persistence | reconstructible flag, save reason, migration and history references. |

## B.2 Storm Instance

| Field Group | Required Fields |
| --- | --- |
| Identity | storm_instance_id, storm_family_id, name/rumour layers and version. |
| Provenance | formation region, time, seed key, event/magic source and parent/merge IDs. |
| Geometry | centre/track, footprint, bands, altitude/depth effects and affected regions. |
| Lifecycle | stage, age, intensity axes, trend, transition and dissipation rule. |
| Effects | wind, waves, precipitation, surge, lightning, visibility, ice and extraordinary state. |
| Knowledge | detected time, forecast products, confidence, warnings and observing factions. |
| Consequence | route closures, threatened ports/structures, events and aftermath references. |
| Persistence | save state, LOD summary, migration and history. |

## B.3 Forecast Product

| Field | Direction |
| --- | --- |
| forecast_id | Qualified persistent/temporary ID. |
| source_id | Observer, instrument, station, faction, spell or system. |
| issued_at / valid_window | Authoritative timestamps. |
| target_regions/routes | Stable IDs, not screen coordinates only. |
| predicted_state | Wind, sea state, tide, storm, visibility, ice and warnings. |
| confidence | Overall and per-variable confidence. |
| uncertainty | Track envelope, timing range and severity range. |
| knowledge_limits | Missing sensors, outdated chart, magical interference or skill limits. |

# Appendix C. Sea-State, Storm and Warning Matrices

## C.1 Readable Sea-State Bands

| Band | Description | Typical Gameplay Direction |
| --- | --- | --- |
| 0 - Glass/Calm | Nearly flat water. | Minimal motion; small-craft friendly. |
| 1 - Rippled | Light surface texture. | Minor drift and visual motion. |
| 2 - Choppy | Short waves and spray. | Noticeable small-craft handling. |
| 3 - Rough | Sustained waves/swell. | Route planning and seaworthiness matter. |
| 4 - Heavy | Large organised motion. | Small craft shelter; cargo/crew risk. |
| 5 - Violent | Severe storm sea. | Major control, damage and rescue risk. |
| 6 - Extraordinary | Catastrophic or magical event state. | Event-specific restrictions and world response. |

These bands are player-facing classes. Final numerical ranges require 26G/26O prototypes.

## C.2 Warning Levels

| Level | Meaning | Default Response |
| --- | --- | --- |
| Advisory | Conditions may inconvenience exposed activity. | Check route, equipment and tide. |
| Watch | Hazard formation is plausible within forecast window. | Prepare, delay vulnerable craft, monitor. |
| Warning | Hazard is expected or observed. | Seek shelter, close/limit route, activate plans. |
| Emergency | Severe impact is imminent/occurring. | Evacuate, rescue, defend infrastructure. |
| Aftermath | Primary hazard has passed but consequences remain. | Search, repair, reroute and reassess. |

# Appendix D. Forecast Confidence and Route-Risk Matrix

| Confidence | Meaning | UI/Decision Behaviour |
| --- | --- | --- |
| Unknown | No reliable observation. | Show uncertainty and avoid false precision. |
| Rumoured | Social or indirect clue. | Broad possibility and source attribution. |
| Observed | Current conditions directly seen/measured. | Reliable present state, limited horizon. |
| Estimated | Model/experience-based forecast. | Ranges and confidence envelope. |
| Measured Network | Multiple maintained instruments/stations. | Better timing, track and severity detail. |
| Exceptional Insight | Powerful magic or specialised system. | High confidence but subject to explicit interference/cost. |

| Route Risk | Inputs |
| --- | --- |
| Low | Favourable capability, shelter, visibility, tide and forecast. |
| Managed | Some adverse state with available mitigation/support. |
| High | Capability margin low, warning active or route support weak. |
| Severe | Closure recommended; emergency/rescue risk substantial. |
| Unknown | Survey/forecast confidence insufficient; not automatically safe or lethal. |

# Appendix E. Validation and Failure-Code Catalogue

| Code | Meaning | Default Severity |
| --- | --- | --- |
| ENV-OWN-001 | Duplicate owner calculates conflicting environment state. | Fatal validation failure. |
| ENV-BASE-001 | Required 26C baseline/profile reference missing. | Block content admission. |
| ENV-TIME-001 | Tide/storm state is non-deterministic for same authoritative inputs. | Fatal test failure. |
| ENV-WIND-001 | Local wind modifier produces discontinuity without source. | Clamp/rebuild modifier. |
| ENV-WAVE-001 | Gameplay wave force has no matching wave-train snapshot. | Fatal runtime diagnostic. |
| ENV-TIDE-001 | Charted ordinary tide disagrees with authoritative access. | Fatal contract failure. |
| ENV-CURR-001 | Current reverses/teleports without tide, storm, event or source. | Regenerate state/report. |
| ENV-STORM-001 | Storm lacks formation, track, lifecycle or dissipation rule. | Block definition. |
| ENV-WARN-001 | Default severe event lacks warning/response path. | Block production admission. |
| ENV-SURGE-001 | Surge attempts direct voxel flooding outside 26B. | Fatal ownership failure. |
| ENV-MAG-001 | Extraordinary weather lacks source/counter/owner. | Block definition. |
| ENV-SAVE-001 | Reload cannot reconstruct active significant weather. | Release blocker. |
| ENV-NET-001 | Client and server disagree on gameplay snapshot. | Release blocker. |
| ENV-A11Y-001 | Reduced-effects mode removes critical hazard information. | Release blocker. |
| ENV-PERF-001 | Field/storm workload exceeds approved budget. | Demote/merge and report. |

# Appendix F. Prototype and Seed Test Matrix

| Test Class | Required Coverage |
| --- | --- |
| Calm Temperate Sea | Ordinary wind, tide, swell, fog and seasonal storm. |
| Exposed Oceanic World | Long fetch, strong swell, island shelter and route alternatives. |
| Inland Sea | Restricted exchange, amplified tide/current and enclosed storm response. |
| Archipelago | Complex shelter, refraction, eddies, short forecasts and port diversity. |
| Delta/Estuary | Tide-current-river interaction and surge flooding. |
| Polar Sea | Ice season, blizzard, freezing spray and route recovery. |
| Tropical/Warm Sea | Organised cyclone-family eligibility and long warning track. |
| Dry/Low-Storm World | Maritime play remains useful without frequent storms. |
| High-Magic World | Extraordinary weather remains sourced, bounded and readable. |
| Low-Magic World | Ordinary climate remains rich without required magical events. |
| Harsh World | Greater uncertainty/consequence without unavoidable instant loss. |
| Relaxed World | Weather remains atmospheric and route-readable with limited damage. |
| Multiplayer | Server authority, split-screen comfort, reconnect and forecast agreement. |
| Save/Migration | Active storm, tide window, route closure and aftermath survive load/version change. |
| Modded Packs | Added definitions do not reshuffle unrelated active climate identity. |

# Appendix G. Completion Checklist

- [x] Dynamic marine-environment authority and boundaries defined.
- [x] Climate hierarchy and time scales defined.
- [x] Baseline inputs from 24B, 24C and 26C defined.
- [x] Prevailing/dynamic wind and local modification defined.
- [x] Surface/deep currents, seasonal shifts and eddies defined.
- [x] Tide regimes, phase, access windows and extraordinary tides defined.
- [x] Aggregate wave trains, sea state, swell and coastal breaking defined.
- [x] Storm lifecycle, families, tracks, intensity and dissipation defined.
- [x] Surge and 26B flood activation boundary defined.
- [x] Fog, visibility, precipitation, sea ice and rare hazards defined.
- [x] Sourced magical and transformed weather defined.
- [x] Forecast, confidence, warnings and NPC response defined.
- [x] Route, port, vessel, ecology, combat and structure interfaces defined.
- [x] Persistence, LOD, multiplayer and Godot boundaries defined.
- [x] Presentation Forge and accessibility separation defined.
- [x] Performance, laboratories, validation and redesign triggers defined.
- [x] Set 25 and downstream integration requirements recorded.
- [x] Handoff to Document 26E defined.

**Document 26D Status: Complete for controlled review and downstream drafting.**
