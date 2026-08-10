# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26A - Maritime and Naval Expansion Vision, Scope, Authority and Integration Foundation

*Version 0.1 - Expansion Vision and Integration Foundation Draft*

A governing foundation for transforming Leyforge oceans into living regions and player-built voxel vessels into persistent moving parts of civilisation, while preserving deterministic world generation, source-of-truth ownership, production control, Godot/Summer Engine boundaries and the freedom to build with ordinary blocks.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

---

> **Maritime and Naval Expansion Statement**
>
> Leyforge seas must be worlds, not borders, and ships must be constructions, not vehicle skins. A player should be able to gather ordinary materials, build a vessel voxel by voxel, use Shipwright tools to define and validate its purpose, commission it into a persistent moving structure, crew and supply it, sail through seed-generated weather and ecology, trade or fight with living maritime civilisations, suffer visible damage and flooding, repair or lose the vessel, and leave wrecks, routes, stories and political consequences behind.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 26A in Document Set 26: Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion. |
| Document Scope | Locks the expansion vision, player fantasies, authority boundaries, terminology, document map, system contracts, hybrid vessel direction, water-overhaul boundary, production sequencing, risks, validation philosophy and handoff to specialist Documents 26B-26O. |
| Core Philosophy | Oceans are living world regions and vessels are buildable mobile voxel structures. Maritime play must connect survival, construction, magic, automation, NPC civilisation, ecology, trade, exploration, combat, story and persistent world change. |
| Water Direction | Upgrade the current fluid foundation into a hybrid system: bounded voxel interaction at edited/local scales, regional fields for oceans and weather, and presentation layers for large waves and distant water. Full computational fluid dynamics is not required. |
| Vessel Direction | Use a hybrid freeform construction model. Ordinary blocks provide material properties; vessel-instance roles identify keel, frame, hull, deck, bulkhead, armour, ballast and other structural uses; specialised components provide control, propulsion, navigation, utility, weapons and magic. |
| Shipwright Direction | A Shipwright Tool and Vessel Registry Anchor scan a connected build, establish bow, stern, centreline, keel and waterline, classify most blocks automatically, expose warnings, permit deliberate overrides and commission the approved build as a Vessel Instance. |
| Forge Direction | Extend the existing unified Forge with a Vessel Forge workspace rather than creating an incompatible application. Vessel source remains semantic voxel and blueprint data; runtime products are generated and replaceable. |
| Civilisation Direction | NPC settlements may construct, crew, own, repair, trade with and fight from vessels. Ports, shipyards, fishing, merchants, pirates, coast guards and navies are civilisation systems rather than decorative encounters. |
| World Direction | Marine content remains seed-derived and relationship-driven. No fixed ocean, harbour, route, wreck, pirate fleet, boss, tutorial island or mandatory vessel arrangement may become universal production content. |
| Authority Direction | Atlas documents own environmental and world-context truth; gameplay registries own executable mechanics; Forge owns editable asset and blueprint source; runtime services own mutable vessel, fleet, route and water state; Set 25 governs identity, ownership, packs, validation and production admission. |
| Engine Direction | Godot with Summer Engine remains the production direction. Summer Engine assists implementation and orchestration; the shipped game must remain an ordinary reviewable Godot project without an external AI runtime dependency. |
| Production Direction | Document Set 26 can be designed alongside Set 25, but registry-heavy and implementation-heavy decisions must consume the approved Set 25 contracts. This document does not automatically place the entire expansion in Core Production. |
| Final Authority | Ash retains final authority over scope, canon, major mechanics, production tier, platform, risk acceptance and release decisions. |
| Next Deliverable | 26B - Water, Liquid and Fluid Simulation Overhaul. |

# Document Purpose

Document 26A establishes the vision, authority boundaries and production architecture for the complete maritime and naval expansion. It exists because the proposed vessel system is too large and too interconnected to be contained in one main-document amendment. The system affects the physical world, fluids, world generation, weather, player traversal, block and item properties, NPC construction, settlements, automation, magic, combat, ecology, progression, Forge tooling, multiplayer authority, persistence and performance.

This document does not pretend that every detailed mechanic is already solved. It separates source-derived requirements from new operational resolutions, records unresolved design and engineering decisions, and assigns them to specialist documents. Its main outcome is a shared contract: later Set 26 documents may deepen their domains, but they may not silently change the expansion identity, duplicate another source of truth or commit the entire expansion to a release tier without evidence and approval.

The proof of concept is retired. No maritime feature may be designed around a fixed POC coastline, tutorial river, named settlement, scripted raid or guaranteed resource arrangement. Production marine regions, routes, ports, vessels, fleets and events must be selected and bound by world seed plus authored constraints, then preserved through stable identities and save-owned state.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 26A |
| --- | --- | --- |
| Ash - locked project direction and this design conversation | A dedicated Set 26; major naval expansion; large ocean biomes; waves and storms; water/liquid overhaul; arbitrary-block shipbuilding; Shipwright tools; Vessel Forge; NPC shipbuilding; crewed ships; pirates and navies. | Applied as locked expansion intent. Exact implementation and release tier remain evidence-based. |
| 00 - Master Game Design Bible | Four connected pillars, player freedom, living civilisations, practical magic, automation serving societies, multiple player roles and civilisation-scale escalation. | Maritime play must support the full game identity rather than become an isolated boating minigame. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand in seed-generated worlds. | Every maritime layer must support the loop through routes, resources, construction, NPC interaction, danger and expansion. |
| 02-10 - Progression, registries, NPCs, automation, magic and creatures | Data-driven physical systems, real resource use, staged projects, use-based progression, practical magic, simulation LOD and living ecology. | Provides the existing systems that Set 26 extends instead of duplicating. |
| 11-12 - Biomes/Worldgen and Structures | Water systems, coasts, weather, procedural structures, blueprints, dynamic states and world-memory. | Older broad water and structure direction is retained where compatible; detailed maritime rules are expanded or superseded by Set 26. |
| 18 - Technical Implementation Plan v0.1 | Useful engine-neutral principles for chunked voxels, hybrid fluids, immutable definitions, authority, save safety and LOD; Unreal-specific architecture is obsolete. | Retain principles only. All implementation detail is rewritten for Godot/Summer Engine. |
| 21-23 - Forge, Entity/Blueprint Forge and Presentation Forge | Unified voxel authoring, semantic blueprints, stable manifests, editable source versus baked outputs, sockets/events, audio/VFX presentation and Godot-native tooling. | Vessel Forge extends the existing Forge and Presentation Forge; it does not create a competing asset pipeline. |
| 24A - Atlas Foundations | Deterministic authored randomness, capability guarantees, relationship graphs, no hidden hardcoding, bounded simulation and respect for player construction. | Controls how maritime regions, routes, fleets and events are generated and persisted. |
| 24C - Oceans, Coasts, Islands and Special Overworld Biomes | Oceans are navigable regions with basins, currents, depth bands, storm regimes, settlements, routes, structures, ecology, resources, dungeons and bosses. | Remains the primary environmental authority. Set 26 creates executable maritime mechanics and technical contracts. |
| 24E-24K - Civilisations, ecology, sites, bosses, infrastructure, resources and history | World-facing identities, cultures, creature roles, dungeons, bosses, ports, routes, trade goods and generated history. | Set 26 binds these Atlas foundations to maritime gameplay without rewriting their canon fields. |
| 24L - Registry, budgets and production roadmap | Coherence before quantity; completeness contracts; production tiers; validation; migration; Godot/Summer Engine implementation sequence. | Controls package completeness and prevents the expansion roster from becoming an unsupported wish list. |
| 25A - Production Governance | POC retirement, source-of-truth boundaries, production tiers, decision control, validation evidence and registry-first work. | Set 26 is registered as a parallel expansion governed by the same approval and production rules. |
| 25B - Canonical Registry Kernel | Qualified IDs, namespaces, immutable definitions, facets, generated bindings, persistent instances, aliases and no competing editable truth. | All Set 26 records use the 25B identity and ownership contract. |

> **Source Boundary Rule**
>
> Where a source already owns environmental identity, culture, ecology, structure history, registry identity, asset source or runtime state, Document 26A references that owner. It creates maritime-facing contracts and recommendations only where the existing documents do not already provide an executable rule.

# Static Table of Contents

- 1. Locked Maritime and Naval Expansion Identity
- 2. Source-Derived Direction and Recommendation Boundary
- 3. Document Set 26 Map and Document 26A Role
- 4. Authority Hierarchy and Source-of-Truth Ownership
- 5. Expansion Vision and Player Fantasies
- 6. Core Expansion Pillars
- 7. Scope Included by Document Set 26
- 8. Non-Goals and Deferred Boundaries
- 9. Maritime World Contract
- 10. Water and Liquid Overhaul Foundation
- 11. Ocean, Weather, Wave, Tide and Current Direction
- 12. Hybrid Voxel Vessel Construction Direction
- 13. Shipwright Tools, Commissioning and Vessel Lifecycle
- 14. Vessel Forge and Blueprint Integration
- 15. NPC Ports, Shipyards, Crews and Maritime Civilisation
- 16. Maritime Trade, Fleets, Piracy and Navies
- 17. Naval Combat, Damage, Flooding and Persistent Aftermath
- 18. Marine Ecology, Underwater Adventure and Resource Use
- 19. Progression and Vessel Capability Bands
- 20. Magic, Automation, Dimensions and Future Vessel Extensions
- 21. Difficulty, Accessibility and World Settings
- 22. Multiplayer, Persistence, Simulation LOD and Player Trust
- 23. Godot/Summer Engine Technical Boundaries
- 24. Registry, Stable-ID and Data Ownership Foundations
- 25. Production Phases and Relationship with Document Set 25
- 26. Prototype Questions, Risks and Redesign Triggers
- 27. Validation Philosophy and Definition of Done
- 28. Main Document and Forge Integration Matrix
- 29. Decision Register
- 30. Handoff to Document 26B
- Appendix A. Canonical Terminology and Working Glossary
- Appendix B. Document Set 26 Dependency Matrix
- Appendix C. Proposed Document 25A Amendment Entries
- Appendix D. Document 26A Acceptance Criteria

# 1. Locked Maritime and Naval Expansion Identity

The maritime expansion is the water-world, constructed-vessel and ocean-civilisation layer of Leyforge. It gives the same systemic depth already promised for land settlements, automation and practical magic to oceans, coasts, islands, underwater spaces, ships, ports and fleets.

> **Locked Rule**
>
> A maritime feature should answer at least one meaningful gameplay question: what does it let the player build, cross, discover, gather, supply, protect, command, repair, trade, hunt, escape, conquer, restore or change in the living world? If it exists only as visual water, a vehicle skin, a combat arena or an isolated resource room, it is incomplete.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Maritime World | Oceans, coasts, islands, rivers, lakes and underwater spaces are traversable, inhabitable and transformable regions. | Water becomes part of the world rather than a map boundary or flat surface. |
| Constructed Freedom | Players can build vessels from ordinary materials and specialised functions rather than choosing only prefabricated vehicle skins. | Ship design reflects creativity, resources, engineering knowledge, culture and risk tolerance. |
| Living Civilisation | Ports, shipyards, crews, merchants, fishers, pirates, navies, migrants and explorers use real vessels and supplies. | Maritime activity changes economies, settlement growth, politics and stories. |
| Physical Consequence | Mass, buoyancy, stability, damage, fire, flooding, cargo and weather matter through readable simplified rules. | Vessels feel built and vulnerable without requiring professional naval engineering. |
| Fantasy Infrastructure | Magic, automation, wards, engines, golems, portals and cultural techniques extend maritime capability. | Leyforge vessels remain part of the same practical-magic civilisation fantasy. |
| Exploration and Adventure | Sea routes, reefs, trenches, wrecks, storms, islands, underwater ruins, creatures and bosses create discovery. | Travel itself produces stories and preparation choices. |
| Persistent World Change | Ships can be commissioned, repaired, captured, sunk, salvaged, inherited, rebuilt and remembered. | Maritime history remains visible in ports, fleets, wreck fields and regional power. |
| Scalable Simulation | Detailed local vessels and water are supported by abstract distant routes, fleets and regional fields. | The world can feel active without simulating every wave, sailor and cargo item continuously. |

## 1.1 Expansion Design Promise

A player should be able to stand beside a vessel and understand that it was built from actual materials, has a reason to float, contains functional stations, carries real supplies, belongs to someone, can be damaged and repaired, and exists within a wider network of weather, routes, ports, laws, trade and ecology. The system may use simplified calculations and simulation LOD, but the visible cause and effect must remain trustworthy.

## 1.2 Four-Pillar Requirement

The expansion must continue to support all four primary Leyforge identities:

- Survival sandbox: swimming, drowning risk, weather preparation, gathering, fishing, shelter, food, repair and travel.
- Civilisation sandbox: ports, jobs, fleets, shipyards, trade, piracy, navies, law, migration and settlement growth.
- Automation/factory: pumps, loading, cargo routing, vessel machinery, fuel, mana, shipyard supply and fleet logistics.
- Fantasy RPG: magic, exploration, creatures, ruins, bosses, cultures, factions, quests, dimensions and moral choice.

# 2. Source-Derived Direction and Recommendation Boundary

| Classification | Meaning in this Document | Examples |
| --- | --- | --- |
| Locked by Ash | Explicit project direction that later documents may not change without Ash approval. | Dedicated Set 26; water overhaul; ocean biomes and storms; arbitrary-block ships; Shipwright tools; Vessel Forge; NPC-built and crewed ships; pirates and navies. |
| Source-Derived Requirement | A rule already established by active project documents. | Seed generation, Atlas authority, stable IDs, simulation LOD, real resource use, Forge separation, Godot/Summer Engine. |
| 26A Operational Resolution | A recommended contract needed to make the locked direction coherent. It becomes active after Ash approves this document. | Vessel local grids, hybrid fluid architecture, commissioning states, document map, authority matrix. |
| Pending Specialist Decision | A question assigned to a later document because evidence or detailed domain work is required. | Vessel size caps, physics fidelity, exact crew model, underwater pressure defaults, naval weapons. |
| Deferred Extension | A compatible idea deliberately kept outside the initial maritime foundation. | Skyships, full submarines, spacecraft, dimensional arks and unrestricted moving cities. |

No value, class cap, launch count, physics constant or production tier in this document should be treated as final unless it is explicitly marked Locked or Approved Baseline. Later documents must preserve this distinction.

# 3. Document Set 26 Map and Document 26A Role

| Document | Title | Primary Responsibility | Major Dependencies |
| --- | --- | --- | --- |
| 26A | Maritime and Naval Expansion Vision, Scope, Authority and Integration Foundation | Locks the expansion identity, boundaries, document map, decisions, dependencies, risks and handoff. | 25A-25B; 24A, 24C, 24L; 00-18; Forge Sets 21-23 |
| 26B | Water, Liquid and Fluid Simulation Overhaul | Defines local fluid cells, large-water fields, displacement, containment, pressure, pumps, drainage, flooding, mixing boundaries, save behaviour and simulation LOD. | 26A; 03, 08, 11, 18 replacement |
| 26C | Oceans, Coasts, Islands and Underwater World Generation | Converts Atlas marine contracts into executable basin, coast, island, seafloor, route, harbour, resource and underwater generation requirements. | 26A-26B; 24A-24C; 25B-25E |
| 26D | Marine Climate, Wind, Waves, Tides, Currents and Storm Systems | Defines regional fields, local effects, forecasting, navigation hazards, shoreline effects, severe weather, magical weather and difficulty scaling. | 26B-26C; 11; 23 presentation |
| 26E | Swimming, Diving and Underwater Player Interaction | Defines surface swimming, diving, breath, pressure, visibility, underwater building/mining, combat, rescue, equipment, magic and accessibility. | 26B-26D; 02, 09, 16, 17 |
| 26F | Voxel Vessel Architecture, Structural Roles and Commissioning | Defines Vessel Instances, local grids, material aggregation, structural roles, anchors, scans, validation, commissioning, ownership and vessel classes. | 26A-26B; 25B-25C; 03, 12, 18 replacement |
| 26G | Vessel Movement, Buoyancy, Propulsion, Steering and Navigation | Defines displacement, stability, draft, listing, capsizing, sails, oars, rudders, engines, mana drives, anchors, towing, docking and route navigation. | 26D, 26F; 08-09; technical spikes |
| 26H | Shipwright Tools, Construction, Repair, Refitting and Salvage | Defines player and NPC build workflows, dry docks, slipways, launching, editing locks, repairs, refits, wreck recovery and salvage. | 26F-26G; 03-08; 12; 20 |
| 26I | Vessel Forge, Blueprint Authoring and Procedural Ship Variants | Defines the Forge workspace, semantic vessel blueprints, testing, construction stages, cultural variants, icons, sockets, manifests and validation. | 21-23; 25B-25E; 26F-26H |
| 26J | Ports, Harbours, Shipyards, Crews and Maritime Civilisation | Defines maritime settlements, structures, jobs, services, crew organisation, NPC shipbuilding, route support, supply and settlement growth. | 07, 12, 20, 24E, 24I; 26H-26I |
| 26K | Maritime Trade, Fleets, Piracy, Navies and Regional Power | Defines cargo routes, fishing fleets, convoys, customs, smuggling, piracy, patrols, blockades, naval factions, diplomacy and regional consequences. | 07-08, 13, 15; 24E, 24I, 24K; 26J |
| 26L | Naval Combat, Boarding, Damage, Flooding, Fire and Siege | Defines weapons, ramming, boarding, capture, crew combat, block/section damage, breaches, fire, pumps, surrender, sinking, wrecks and aftermath. | 16; 23; 26B, 26F-26K |
| 26M | Marine Ecology, Fishing, Sea Creatures, Dungeons and Bosses | Defines marine ecology packages, fishing, creature roles, migrations, underwater threats, wreck ecosystems, marine dungeons and leviathan-scale encounters. | 10; 24C, 24F-24H; 26C-26E |
| 26N | Maritime Progression, Registries, Magic, Automation, Economy, Quests and Events | Maps the expansion into blocks, items, recipes, resources, skills, research, magic, automation, trade, quests, events, dimensions and content packages. | 02-09, 13-15; 24J-24L; 25F-25K |
| 26O | Maritime UI/UX, Multiplayer, Godot/Summer Engine Technical Plan, Performance, QA and Main-Document Integration | Defines player interfaces, authority, moving interiors, persistence, LOD, networking, performance budgets, technical spikes, QA, migration and complete amendment matrix. | 17; rewritten 18; 25D-25L; all prior Set 26 |

## 3.1 26A Ownership Boundary

| 26A Owns | 26A Does Not Own |
| --- | --- |
| Expansion identity, terminology and player-facing promise. | Exact fluid equations, cell update rules or pump throughput. |
| Set 26 document map and dependencies. | Final ocean biome roster or Atlas canon. |
| Authority and source-of-truth boundaries. | Exact vessel component registry, stats or recipe counts. |
| Hybrid freeform vessel direction and commissioning concept. | Final buoyancy/stability algorithms and vessel caps. |
| Production sequencing and relationship with Set 25. | Final release tier or first shipping roster. |
| Cross-system integration obligations. | Godot class names, file formats, network protocol or code architecture in detail. |
| Risk register, prototype questions and validation philosophy. | Completed technical evidence or measured budgets. |

# 4. Authority Hierarchy and Source-of-Truth Ownership

| Priority | Authority | Maritime Decision Rights |
| --- | --- | --- |
| 1 | Ash - Project Lead and Final Authority | Final scope, canon, major mechanics, production tier, platform, risk acceptance, milestone and release approval. |
| 2 | Locked Project Direction | Dedicated Set 26, seed-generated production, retired POC, Godot/Summer Engine and the agreed maritime fantasy. |
| 3 | Document 25A and Set 25 Governance | Decision statuses, production admission, lifecycle, package completeness, evidence, migration and release gates. |
| 4 | Document 25B Registry Kernel and later 25C-25E contracts | Qualified IDs, namespaces, field ownership, relationships, packs, authoring, migration and validation. |
| 5 | World Content Atlas 24A-24L | World topology, marine environment, culture, ecology, sites, bosses, infrastructure, resources, history and generated world context. |
| 6 | Revised gameplay documents and Set 26 specialists | Executable fluid, vessel, crew, combat, progression, UI and simulation rules. |
| 7 | Forge Sets 21-23 and Vessel Forge extension | Editable voxel assets, semantic blueprints, animation, audio/VFX source, manifests and baked products. |
| 8 | Runtime services and saves | Mutable generated marine state, Vessel Instances, crews, cargo, fleets, routes, weather, damage, ownership and history. |
| 9 | Summer Engine and implementation tools | Execute bounded approved tasks; may not invent canon, silently change scope or become runtime truth. |

> **Duplicate Truth Rule**
>
> A vessel blueprint may reference block definitions, material fields, crew stations, animation events and world roles, but it must not copy those systems into a second editable registry. Generated previews and compiled snapshots are read-only products, not new sources of truth.

# 5. Expansion Vision and Player Fantasies

Document Set 26 should support several legitimate maritime identities without forcing every player to become a naval commander. A builder may spend most of their time designing ships; a peaceful player may run ferries and fishing routes; an adventurer may use a simple vessel only to reach islands; a conqueror may blockade ports; a mage-engineer may build an enchanted research ship.

| Player Fantasy | Experience Supported |
| --- | --- |
| Raft Survivor | Improvises a raft or small boat to cross water, fish, escape danger or reach nearby islands. |
| Shipwright | Designs hulls, assigns structural roles, tests stability, commissions vessels and improves designs through experience. |
| Captain and Navigator | Charts routes, reads weather and currents, manages crew, provisions and risk, and chooses when to sail. |
| Merchant and Logistician | Moves cargo between settlements, builds warehouses and ports, establishes contracts and protects supply chains. |
| Explorer and Cartographer | Discovers islands, trenches, wrecks, underwater sites, marine biomes, safe passages and magical seas. |
| Fisher and Marine Harvester | Uses boats, nets, traps, diving, aquaculture and ecological knowledge without reducing oceans to infinite loot. |
| Pirate, Smuggler or Raider | Steals cargo, hides in difficult waters, boards ships, builds reputation and faces legal and faction consequences. |
| Naval Defender or Admiral | Protects coasts, escorts convoys, commands patrols, responds to blockades and supports settlement defence. |
| Mage-Engineer | Builds mana drives, weather wards, enchanted hulls, diving systems, pumps and rune-controlled vessel machinery. |
| Mobile-Base Builder | Creates a working home, workshop, expedition vessel or eventual fleet flagship that remains a physical construction. |
| Marine Naturalist or Hunter | Studies migrations, protects habitats, tracks dangerous creatures or hunts major sea threats. |
| World-Shaper | Builds harbours, canals, breakwaters, lighthouses, sea walls, bridges, floating facilities and civilisation-scale routes. |

## 5.1 Freedom and Consequence

The expansion preserves Leyforge moral and strategic freedom. Players may rescue shipwrecks, protect trade, overfish, smuggle, pirate, blockade, conquer ports, sell unsafe vessels, exploit crews or use forbidden marine magic. Cultures and factions respond through trust, fear, law, prices, retaliation, rebellion, reputation and story rather than invisible alignment labels.

# 6. Core Expansion Pillars

| Pillar | Required Capability | Primary Owner |
| --- | --- | --- |
| Water and Fluid Foundation | Local fluid interaction, large-water representation, flooding, pumps, containment and fluid LOD. | 26B |
| Marine World and Weather | Basins, coasts, islands, currents, tides, waves, winds, storms and underwater regions. | 26C-26D |
| Player Water Interaction | Swimming, diving, underwater work, survival, visibility, pressure and accessibility. | 26E |
| Voxel Vessel Construction | Freeform blocks, structural roles, specialised components, commissioning and persistent Vessel Instances. | 26F-26H |
| Vessel Forge and Blueprints | Authoring, testing, variants, icons, stages, manifests and procedural/cultural vessel families. | 26I |
| Maritime Civilisation | Ports, jobs, crews, shipyards, trade, piracy, navies, routes, laws and regional power. | 26J-26K |
| Naval Conflict and Consequence | Combat, boarding, damage, fire, flooding, capture, sinking, wrecks and salvage. | 26L |
| Marine Ecology and Adventure | Fishing, creatures, dungeons, bosses, resources, ecology and underwater content. | 26M |
| Cross-System Progression | Registries, skills, resources, magic, automation, quests, economy, events and dimensions. | 26N |
| Technical and Player Trust | UI, multiplayer, persistence, LOD, performance, QA, migration and main-document integration. | 26O |

No pillar is complete in isolation. A vessel without a world to travel is an editor toy; an ocean without vessels or underwater interaction is scenery; a fleet without real settlements, supplies and consequences is a random encounter system.

# 7. Scope Included by Document Set 26

- Oceans, seas, coasts, islands, archipelagos, navigable rivers and lakes where they connect to vessel play.
- Water/liquid simulation changes required for buoyancy, displacement, flooding, pumps, drainage, containment, underwater work and shoreline editing.
- Regional wind, current, tide, wave and storm systems with local gameplay effects and readable prediction/counterplay.
- Player swimming, diving, underwater construction, underwater gathering and related survival/accessibility rules.
- Freeform voxel vessels built from ordinary blocks plus specialised functional components.
- Shipwright selection, scanning, role assignment, validation, commissioning, repair, refit, salvage and blueprint workflows.
- Vessel Forge extensions using the existing Forge architecture, manifests, semantic markers and test laboratories.
- NPC shipyards, ports, maritime jobs, crews, trade fleets, fishing fleets, pirates, patrols, navies and maritime factions.
- Naval combat, boarding, capture, structural damage, flooding, fire, sinking, wrecks and persistent aftermath.
- Marine ecology, fishing, sea creatures, underwater structures, dungeons, bosses and resource economies.
- Magic, automation, cultural techniques, quests, events, progression, multiplayer, saves, UI and Godot/Summer Engine implementation boundaries.

## 7.1 General Liquid Foundation Versus Maritime Priority

Document 26B may improve the general liquid foundation for water, lava, poison, oil, alchemical fluids and magical liquids where the same low-level contracts are shared. However, Set 26 remains a maritime expansion. It should not delay vessel and ocean work in order to build an unrestricted chemistry or fluid-sandbox game.

# 8. Non-Goals and Deferred Boundaries

- A full real-world computational fluid dynamics solver or engineering-grade naval architecture simulation.
- Forcing every player to learn complex naval terminology before launching a basic craft.
- Restricting all vessel geometry to a small catalogue of special hull blocks or prefabricated complete ships.
- Treating vessels as single hit-point actors whose visible blocks have no gameplay meaning.
- Simulating every ocean cell, wave particle, fish, crew member and cargo object at full detail across the entire world.
- Making every world contain the same sea, pirate faction, tutorial island, port route or boss encounter.
- Replacing the general Forge, Blueprint Forge, Presentation Forge, NPC, structure, combat or worldgen systems with maritime-only copies.
- Locking exact launch counts, vessel caps, balance values or platform budgets before Set 25 classification and technical evidence exist.
- Automatically including skyships, spacecraft, full submarines or dimensional arks in the first maritime implementation. The architecture may preserve later extension points.

## 8.1 Skyship and Extraordinary Vehicle Boundary

Atlas 24C already supports skylands, aerial routes and possible airships. The vessel architecture should avoid assumptions that make future non-water craft impossible, but Set 26 does not silently become a complete aerial vehicle expansion. Water vessels, marine fields, ports and naval civilisation remain the primary design and testing target.

# 9. Maritime World Contract

| Contract | Required Direction |
| --- | --- |
| Seed and Topology | Marine regions, coast segments, islands, routes, ports and hazards derive from seed plus authored constraints and retain persistent generated identities. |
| Scale Hierarchy | Basin -> sea region -> shelf/depth band -> coast/island/route -> local water body or encounter space. |
| Capability Guarantees | World presets guarantee required maritime capabilities or valid alternatives, not one named island, shipwreck, NPC or harbour. |
| Route Legibility | Players can infer sheltered water, exposed coast, current direction, storm risk, shallow passages and port access through world clues and tools. |
| Civilisation Suitability | Ports and maritime settlements require water access, shelter, depth, routes, resources, workforce, defence and cultural adaptation rather than arbitrary shoreline placement. |
| Ecological Integrity | Fishing, creatures and harvesting connect to habitat, season, pressure, pollution, overuse and recovery rules. |
| Dynamic Change | Storms, blockades, wrecks, construction, erosion states, magical events, pollution and sea-level events may alter routes and coasts through bounded persistent deltas. |
| Player Construction Respect | Tides, storms and world events do not casually erase major player builds without warnings, settings, counterplay and recovery. |

## 9.1 World Presets

World generation may support dry, balanced, oceanic, archipelago, inland-sea, harsh-storm, high-magic or other presets. A dry preset does not need the same maritime scale as an oceanic world, but it must preserve relevant capability fallbacks and avoid breaking content that depends on water access. An oceanic preset must support full survival, settlement, resource, route, dungeon and progression viability rather than spawning decorative islands in empty water.

# 10. Water and Liquid Overhaul Foundation

The required fluid model is hybrid because Leyforge combines editable voxel shorelines, large planet-scale oceans, moving vessels, pumps, flooding and performance-sensitive multiplayer. No single representation is suitable for every scale.

| Layer | Purpose | Authoritative Content |
| --- | --- | --- |
| Authored/Generated Water Body | Persistent lake, river, sea, basin, coast or underwater-region record from world generation. | Topology, level band, salinity, temperature, routes, ecology, current/tide/storm profiles, history. |
| Regional Marine Field | Low-frequency simulation over a basin or route. | Wind, current, tide, wave exposure, storm intensity, turbidity, hazards, seasonal passage state. |
| Local Voxel Fluid Cells | Bounded interactive cells near edits, shores, structures, vessels and active gameplay. | Level, flow direction, source/sink, liquid type, containment, mixing flags, damage/hazard state. |
| Vessel Displacement Volume | Derived volume used for buoyancy and flooding calculations. | Occupied cells, watertight surfaces, submerged volume, interior compartments, breach links. |
| Presentation Surface | Generated visual surface and effects. | Wave mesh/material, foam, wakes, spray, rain contacts, underwater fog, reflections, LOD. |
| Persistent Fluid Delta | Save-owned changes from player/NPC/world action. | Drained/flooded areas, pumps, gates, canal edits, destroyed barriers, pollution/corruption, changed route state. |

## 10.1 Fluid Design Rules

- Large oceans are not represented as billions of individually updating fluid cells.
- Edited shorelines, canals, gates, pumps, flooded rooms, vessel compartments and local hazards may use bounded cell updates.
- Regional sea level, tide and storm fields drive local presentation and gameplay queries without rewriting every water cell.
- Buoyancy queries use cached vessel geometry and water-surface/field data rather than full two-way physical simulation.
- Fluid changes are scheduled from events and dirty regions, not updated globally every frame.
- Persistent player changes store deltas and ownership; generated base water topology remains reproducible from seed and generation version.
- Mixing, contamination and magical transformation are explicit supported interactions, not assumed universal chemistry.
- Every expensive feature receives distance, relevance and update-frequency rules.

# 11. Ocean, Weather, Wave, Tide and Current Direction

Marine simulation should combine deterministic regional patterns with bounded variation. Currents create lanes and hazards; tides change access and harvesting windows; waves communicate exposure and storms; wind affects sails and sea state; magical fields may modify these rules where the Atlas provides a source.

| Field | Gameplay Use | Simulation Direction |
| --- | --- | --- |
| Wind | Sailing, weather, smoke, visibility, waves, flight and navigation. | Regional vector field with local terrain/structure modifiers and bounded gusts. |
| Current | Travel speed, drift, migration, debris, pollution and route planning. | Persistent route/region field with local eddies and event changes. |
| Tide | Port depth, shoreline access, caves, harvesting, grounding and flooding risk. | Readable regional cycle/range; local geometry queries where relevant. |
| Wave State | Vessel motion, control difficulty, structural stress, spray, shore danger and readability. | Derived from wind, fetch, exposure, depth, current and storm; represented at gameplay bands plus presentation. |
| Storm Front | Route closure, lightning, visibility, waves, damage, rescue events and magical hazards. | Scheduled region-scale event with forecast, movement, severity, aftermath and LOD. |
| Fog and Turbidity | Navigation, ambush, underwater visibility and ecology clues. | Regional/biome state with local presentation and sensor effects. |
| Sea Ice and Special Water | Traversal, hull risk, ecology, resources and magical laws. | Biome/state-specific rules; not a universal water variant system. |

## 11.1 Fairness and Forecasting

Severe weather must provide signs and counterplay: sky, wind, wave direction, NPC warnings, charts, instruments, magic, route reports, port signals and forecast windows. Surprise can exist, but unavoidable destruction without readable cause conflicts with Leyforge player-trust rules.

# 12. Hybrid Voxel Vessel Construction Direction

| Principle | Locked or Recommended Direction |
| --- | --- |
| Freeform First | Players may attempt vessels from any placeable material that exposes required physical fields. The system responds through capability and consequence rather than arbitrary recipe bans. |
| Roles, Not Duplicate Blocks | A block instance can serve as keel, frame, hull, deck, bulkhead, armour, ballast, mast support or interior without requiring a new block ID for every naval use. |
| Specialised Function Components | Helms, rudders, sails, oarlocks, anchors, pumps, engines, mana drives, weapons, cargo hatches and navigation stations exist because they perform distinct functions. |
| Automatic Scan with Deliberate Override | The Shipwright workflow infers connected structure, exterior surfaces, enclosed spaces, supports and likely roles, then allows player confirmation or override with warnings. |
| Commissioned Local Grid | A completed vessel becomes a persistent Vessel Instance with its own local voxel coordinate space, definition references, component graph, cargo, crew, damage and ownership. |
| Static Construction, Managed Movement | Normal world blocks are used during construction or dry-dock editing. Commissioning converts the build into one managed moving structure rather than moving thousands of independent world cells. |
| Readable Simulation | The game reports launchability, stability, draft, expected crew, cargo effects, weak points and environmental limits in understandable terms. |
| Physical Consequences with Recovery | Listing, flooding, fire, broken control surfaces and lost propulsion create emergencies, but warnings, pumps, repairs, towing, beaching and salvage provide counterplay. |
| Culture and Progression Matter | The same vessel form can behave and look different through material families, cultural modules, skills, magic, technology and crew practice. |
| No One True Ship | Rafts, canoes, barges, fishing boats, merchant ships, warships, living vessels and magical craft should be valid within different environments and goals. |

## 12.1 Material Property Extension

The existing block/material architecture should gain maritime-facing fields rather than create hundreds of naval-only duplicates. Candidate fields include mass or density, sealing, absorption, corrosion/decay, flexibility, tensile/compressive strength classes, impact resistance, fire behaviour, magical conductivity, structural-role suitability and submerged presentation. Exact schemas belong to 25C and the replacement Blocks/Resources documents.

## 12.2 Vessel Role Examples

Keel, primary frame, secondary frame, outer hull, inner hull, deck, bulkhead, mast support, spar, ballast, armour, interior, cargo support, machinery foundation, control surface support and decorative/non-structural roles are instance-level assignments or derived classifications. They do not replace the underlying block definition.

# 13. Shipwright Tools, Commissioning and Vessel Lifecycle

The Shipwright workflow is the bridge between unrestricted voxel building and a managed moving vessel. It must make unusual creations possible while protecting saves, performance and multiplayer authority.

| Lifecycle State | Meaning | Allowed Actions |
| --- | --- | --- |
| Concept/Blueprint | Semantic design exists in Forge or player blueprint data. | Plan, test, estimate resources, assign roles/markers, create variants. |
| World Construction | Blocks and components are attached to terrain, scaffolds, slipway or dry dock. | Build, remove, supply, inspect, stage NPC work. |
| Surveyed | Shipwright Anchor identifies a bounded connected candidate. | Set bow/stern, centreline, waterline, include/exclude regions, run scan. |
| Validated | The candidate passes required identity, geometry, component and safety checks for its intended class. | Review warnings, override allowed fields, select registration/ownership. |
| Commissioned | The structure becomes a persistent Vessel Instance with local grid and runtime services. | Launch, crew, load, move, damage, repair within permitted states. |
| Docked/Refit | Movement is locked and the vessel is connected to approved editing/support context. | Add/remove blocks, replace components, change roles, rescan and recommission. |
| Grounded/Beached | Vessel is stationary in an unsafe or improvised support condition. | Emergency repair, unloading, towing, limited editing, recovery project. |
| Disabled | Propulsion/control or structural integrity is insufficient for safe operation. | Repair, pump, tow, surrender, abandon or salvage. |
| Sinking/Wrecked | Recovery threshold failed or vessel has become a persistent wreck structure. | Evacuate, salvage, raise, restore, claim or leave as ecology/adventure site. |
| Archived Blueprint/Legacy | Design remains referenceable but is superseded, migrated or unavailable. | Read-only inspect, migrate, substitute or preserve as historical design. |

## 13.1 Validation Must Explain, Not Merely Reject

A commissioning report should state whether the vessel is launchable, what environment it is suitable for, expected crew and cargo limits, likely list/capsize problems, openings below waterline, unsupported spans, missing control/propulsion, inaccessible stations and unresolved ownership or blueprint errors. Invalid designs remain inspectable and repairable.

# 14. Vessel Forge and Blueprint Integration

Vessel Forge is a specialised workspace inside the unified Leyforge Forge. It reuses stable IDs, manifests, materials, voxel editing, semantic markers, variants, revision history, icon capture, test laboratories, validation, packaging and baked runtime products from Sets 21-23.

| Vessel Forge Capability | Purpose |
| --- | --- |
| Vessel Workspace and Scale Contexts | Author in dry dock, waterline, river, coastal, ocean, storm and loading test contexts. |
| Semantic Markers and Roles | Mark keel path, centreline, intended waterline, decks, compartments, stations, connectors, collision/boarding zones and construction stages. |
| Material and Component Substitution | Test culture/material variants without duplicating the semantic design. |
| Buoyancy and Stability Preview | Visualise displacement, centre of mass/buoyancy, draft, list and cargo effects using the approved runtime approximation. |
| Damage and Flooding Test | Apply breaches, fire, broken mast/rudder/engine, pump failure and compartment flooding. |
| Crew and Access Test | Verify paths, station reachability, doors/hatches, emergency routes, body-plan fit and accessibility. |
| Construction Stage Authoring | Define keel, frame, hull, deck, systems, fitting-out, provisioning and launch stages for NPC projects. |
| Variant and Procedural Family Authoring | Generate culture, material, role, damage, age, faction and state variants within constraints. |
| Icon and Presentation Capture | Create vessel, component, map, Codex and blueprint previews with saved states. |
| Manifest and Bake | Resolve dependencies, validate, package editable source and create replaceable runtime outputs. |

# 15. NPC Ports, Shipyards, Crews and Maritime Civilisation

| Layer | Required Direction |
| --- | --- |
| Maritime Settlement Infrastructure | Jetties, docks, quays, piers, slips, dry docks, shipyards, warehouses, fish markets, lighthouses, beacons, breakwaters, sea walls, customs posts and rescue stations. |
| Jobs and Skills | Shipwright, naval architect, carpenter, sailmaker, rigger, dockworker, harbourmaster, captain, navigator, helmsman, sailor, engineer, quartermaster, gunner, marine, fisher, diver and salvager. |
| Real Resource Flow | Timber, fibre, cloth, rope, pitch/sealant, metals, tools, provisions, fuel, mana, ammunition, repair stock and cargo use normal item and recipe transactions. |
| Staged Construction | NPC shipbuilding uses blueprint stages, reserved resources, specialist labour, scaffolds/slipways, inspection and commissioning. |
| Crews and Stations | Vessels expose helm, navigation, propulsion, sails/rigging, engineering, weapons, cargo, lookout, repair, medical and command stations as required by class. |
| Route Economy | Fishing grounds, local ferries, coastal trade, deep-water trade, convoys, migration and exploration create demand, risk and regional specialisation. |
| Law and Power | Port access, tariffs, customs, salvage rights, piracy, privateering, blockades, naval borders and wartime controls create political consequences. |
| Distant Simulation | Off-screen fleets use route, cargo, crew, condition, danger and event summaries; important vessels retain identity and can promote to full simulation. |

## 15.1 NPC Construction Rule

NPC vessel construction uses the same resource-conserving project logic as other settlement projects: exact materials are reserved, stages are visible, workers require tools and access, specialist shortages slow or block work, damage and interruption persist, and commissioning produces a functional vessel rather than a static decorative ship.

# 16. Maritime Trade, Fleets, Piracy and Navies

Maritime routes turn production, settlement geography and faction relations into regional systems. A harbour with ships should have meaningful inputs, outputs, danger, ownership and maintenance. Fleets are collections of persistent or summarised vessels with mission, route, cargo, crew, supply, condition, faction and history.

| Activity | World Inputs | Possible Consequences |
| --- | --- | --- |
| Fishing and Harvesting | Habitat, season, vessels, tools, labour, weather, storage and preservation. | Food stability, trade, depletion, creature conflict, pollution or regulation. |
| Local Ferry/Transport | Population routes, river/coast crossings, safe moorings and schedules. | Settlement access, migration, rescue, route dependence and disruption. |
| Coastal and Ocean Trade | Surplus, demand, cargo space, ports, charts, weather, escorts and contracts. | Price changes, growth, shortages, piracy, diplomacy and route competition. |
| Exploration Expedition | Charts, provisions, crew, research, vessel class and unknown routes. | Discovery, maps, claims, ruins, creatures, resources, loss or rescue quests. |
| Piracy and Smuggling | Weak patrols, valuable routes, hidden coasts, corruption, laws and markets. | Fear, bounty, faction conflict, black markets, retaliation and alternative progression. |
| Patrol and Escort | Threat intelligence, naval supply, trained crew, ports and command. | Safer trade, reputation, expenses, escalation and military influence. |
| Blockade and Siege | Fleet strength, port geography, supply, diplomacy and war state. | Shortage, surrender, smuggling, relief missions, civilian harm and regional power shifts. |
| Colonisation/Migration | Habitable destination, cargo, settlers, protection, law and long-term supply. | New settlements, conflict, cultural exchange, failure, abandonment or historical change. |

# 17. Naval Combat, Damage, Flooding and Persistent Aftermath

Naval combat should remain physical, readable and connected to crew and world state. It does not require every projectile to simulate real-world ballistics, but attacks should affect meaningful vessel sections and create recoverable emergencies before total loss where appropriate.

| Damage/Conflict Layer | Required Effect |
| --- | --- |
| Hull and Structure | Block/section damage, breaches, weakened supports, lost armour and structural limits. |
| Flooding | Water enters through breaches/openings, spreads through allowed connections and is slowed by compartments, doors, sealing and pumps. |
| Fire and Heat | Material-sensitive ignition/spread, smoke, crew danger, ammunition/fuel risk and water/magic counterplay. |
| Propulsion and Control | Sails, rigging, oars, rudders, engines, mana systems and anchors can be impaired separately. |
| Crew and Stations | Injuries, morale, station abandonment, repair tasks, boarding defence and command disruption matter according to simulation depth. |
| Cargo and Supplies | Cargo can shift, burn, flood, spoil, be stolen, jettisoned or salvaged. |
| Boarding and Capture | Vessels expose valid approach, grapple/bridge/portal connectors, ownership transfer, surrender, prisoners and loot permissions. |
| Sinking and Wrecks | Loss creates persistent wreck records, debris/salvage, ecology, hazards, claims, quests and historical evidence. |
| Aftermath | Ports, factions, families, trade, insurance/relief, reputation, bounties and regional danger respond. |

# 18. Marine Ecology, Underwater Adventure and Resource Use

Marine creatures and resources remain living-world systems. Fish are not generic particles and leviathans are not only large health bars. Habitats, migrations, pollution, weather, fishing pressure, settlements, magic and predators influence availability and danger.

Required adventure families include reefs, kelp forests, shallows, open water, storm seas, ice seas, trenches, vents, drowned ruins, wreck fields, caves, submerged civilisations, lairs and boss territories where supported by Atlas packages. Exact rosters remain owned by 24F-24H and 26M.

# 19. Progression and Vessel Capability Bands

| Capability Band | Typical Fantasy | New Requirements |
| --- | --- | --- |
| Improvised Water Access | Rafts, floats, ferries, basic swimming support and near-shore survival. | Simple buoyancy, manual propulsion, low cargo, calm-water limitation. |
| River and Lake Craft | Canoes, rowboats, fishing boats, barges and shallow-draft transport. | Oars, small sails, moorings, basic cargo, local routes. |
| Coastal Shipbuilding | Sloops, cutters, fishing vessels, patrol craft and coastal merchants. | Shipwright station, rigging, navigation, pumps, weather preparation. |
| Ocean-Going Vessels | Exploration, merchant, troop and war vessels capable of deep crossings. | Compartmentation, larger crews, stronger materials, charts, forecasting and repair systems. |
| Industrial and Magitech Vessels | Mechanical engines, steam/pressure systems, mana drives, advanced pumps, automation and specialised modules. | Steel/advanced frames, power networks, engineers, fuel/mana logistics. |
| Civilisation-Scale Fleets | Convoys, naval bases, trade leagues, regional patrols and mobile expeditions. | Settlement industry, command, diplomacy, route infrastructure and abstract fleet simulation. |
| Late-Game Extraordinary Vessels | Living ships, dimensional research craft, floating fortresses or other world-shaping vessels. | Rare materials, magic, realm knowledge and explicit production-tier approval. |

Progression is capability-based rather than a single linear material ladder. A simple wooden boat can remain valuable for shallow fishing while an iron or stone vessel may serve a different purpose. Materials, skills, culture, design, maintenance, crew and magic all influence capability.

# 20. Magic, Automation, Dimensions and Future Vessel Extensions

Magic and automation expand maritime options but do not invalidate ordinary sailing, oars or mechanical craft. Mana drives, wind control, weather wards, water breathing, pumps, cargo routing, golem labour, navigation runes and portal logistics may appear through progression and culture. Dangerous schools can create cursed seas, blood-powered engines, undead crews or corruption, with appropriate consequences.

Dimension-native waters may have different pressure, gravity, temperature, salinity, mana or material laws. Set 26 defines shared vessel and water contracts; Document 14/24D remain authorities for each realm law. Cross-realm vessel travel requires explicit portal size, transfer, persistence and fallback rules rather than an assumption that every ship can enter every dimension.

# 21. Difficulty, Accessibility and World Settings

| Setting | Adjustable Effect |
| --- | --- |
| Water Hazard Severity | Reduces or increases drowning, cold exposure, pressure, current force and recovery windows. |
| Wave and Storm Intensity | Scales wave effects, storm frequency, structural stress, visibility loss and route closures. |
| Vessel Physics Assistance | Adjusts auto-ballast help, warning detail, capsize tolerance, control smoothing and launch validation strictness. |
| Flooding Complexity | Ranges from section-level flooding to simplified whole-vessel water accumulation. |
| Crew Management Depth | Ranges from role assignment and supplies to deeper shift, morale, fatigue and emergency task management. |
| Naval Combat Consequence | Controls permanent crew death, cargo loss, vessel capture, sinking recovery and insurance/relief options. |
| Ecology Pressure | Controls fish depletion, migration sensitivity, pollution, hunting consequences and recovery rate. |
| Piracy and Naval Conflict | Controls frequency, faction aggression, blockades and regional war escalation. |
| Tide and Current Complexity | Controls how strongly route planning, harbour access and shoreline windows affect play. |
| Accessibility Presentation | Provides high-contrast waterline/warnings, motion reduction, camera stabilisation, subtitle/audio cue coverage and simplified navigation overlays. |

Peaceful or cosy play must still support shipbuilding, fishing, ports, trade, exploration, diving, ecology and story. Higher difficulty should intensify resource pressure, storms, combat, flooding, loss and route risk rather than hide the expansion from relaxed players.

# 22. Multiplayer, Persistence, Simulation LOD and Player Trust

Moving voxel structures are save-critical and multiplayer-critical. A vessel is not merely a physics body; it may contain blocks, machines, inventories, NPCs, players, ownership, construction history, damage, flooding and quest bindings. Every persistent change must have an authoritative owner and a migration path.

| Simulation Range | Detailed Representation | Abstract Representation |
| --- | --- | --- |
| Immediate/On-Board | Local voxel grid, players, NPCs, stations, components, damage, flooding, wakes, collisions and direct controls. | None for authoritative interactions. |
| Nearby Visible | Full vessel transform and major presentation; simplified crew tasks and fluid detail as budgets require. | Aggregated low-importance internal tasks. |
| Local Region | Vessel class, route following, visible traffic, major weather and encounter state. | Crew/cargo/condition ticks and scheduled events. |
| Distant Region | No individual actors required. | Persistent vessel/fleet identity, route, cargo, crew totals, condition, risk, ownership and event queue. |
| Unloaded World/Realm | No geometry or physics. | Save records, journey progress, deadlines, weather/route outcomes and promotion requirements. |

## 22.1 Authority Rules

- The server/host validates Shipwright selection, commissioning, block edits, component configuration, cargo transactions, ownership, crew assignments, navigation commands and combat outcomes.
- Clients render predicted or interpolated presentation but do not own persistent vessel transforms or fluid state.
- Promotion from abstract to detailed simulation preserves identity, cargo totals, damage, crew, ownership, mission and history.
- A failed migration or unresolved definition does not silently delete a vessel. The system preserves the original save and offers blocking diagnostics or safe recovery.
- Player-built vessels are not casually despawned, regenerated from blueprint or replaced by content updates.

# 23. Godot/Summer Engine Technical Boundaries

| Technical Owner | Boundary | Defined Later By |
| --- | --- | --- |
| Definitions and Compiled Registries | Immutable records resolved by qualified IDs. | 25B-25E and revised registries |
| Generated Marine World Records | Persistent basin, coast, island, route, port and hazard instances derived from seed. | World generation/runtime save services |
| Water Simulation Service | Owns local fluid updates and queries; consumes regional fields but does not own worldgen truth. | 26B/26O |
| Marine Field Service | Owns regional wind/current/tide/storm state and scheduled changes. | 26D/26O |
| Vessel Definition/Blueprint | Immutable semantic design, roles, markers, component requirements and construction stages. | 26F/26I |
| Vessel Instance Record | Persistent local-grid content, transform, ownership, cargo, crew, damage, flooding and history. | Runtime save authority |
| Vessel Presentation | Meshes, materials, animation, audio/VFX, wake and UI adapters. | Forge/Presentation Forge; derived only |
| Fleet/Route Simulation | Abstract distant travel, cargo, condition, danger and events. | 26K/26O |
| Multiplayer Authority | Server/host validates edits, commissioning, vessel movement, transactions, damage and persistent outcomes. | 26O/revised 18 |

## 23.1 Engine Principles

- Use a milestone-locked stable Godot 4.x release.
- Use GDScript by default and introduce GDExtension/C++ only after profiling identifies a bounded bottleneck that cannot be solved acceptably through data layout, shaders, job partitioning or GDScript optimisation.
- Keep Summer Engine as an AI-native development and orchestration environment, not a shipped service dependency.
- Separate editable source data, compiled registries, generated world records, persistent instances and presentation nodes.
- Do not use scene-tree paths, node names, display names or file paths as persistent vessel or world identity.
- Prototype the highest-risk moving-grid, water-query, navigation and networking problems before large content production.

# 24. Registry, Stable-ID and Data Ownership Foundations

All Set 26 definitions use the qualified-ID contract from Document 25B: `<namespace>.<domain>.<identity_path>`. The examples below illustrate domain direction only and do not pre-approve final domain registration or exact names.

| Concept | Illustrative Qualified ID | Canonical Owner | Mutable Instance Owner |
| --- | --- | --- | --- |
| Vessel class/profile | leyforge.core.vessel.class.coastal_sailing | 26F/26N definition facet | Vessel Instance service |
| Vessel blueprint | leyforge.core.blueprint.vessel.merchant_sloop | 26I / Blueprint Forge | Construction/Vessel instance |
| Ship component | leyforge.core.block.functional.vessel.helm_basic | Blocks registry / 26N facet | Vessel component state |
| Shipwright tool | leyforge.core.item.tool.shipwright_surveyor | Items registry / 26N facet | Inventory item state |
| Maritime job | leyforge.core.job.maritime.shipwright | NPC/job registry / 26J | NPC runtime state |
| Port structure family | leyforge.core.structure.maritime.shipyard | 24I context + Structure registry behaviour | Structure/settlement instance |
| Marine field profile | leyforge.core.marine_field.storm.temperate_cyclone | 26D / worldgen facet | Regional field state |
| Generated vessel instance | save-scoped ULID or equivalent | Not a definition | Save/runtime authority |
| Generated marine region | world.<world>.marine.<region> | Generated binding from Atlas definitions | World save service |

# 25. Production Phases and Relationship with Document Set 25

| Phase | Documents/Work | Gate Outcome | Relationship with Set 25 |
| --- | --- | --- | --- |
| Phase 0 - Governance and Research | 26A; Set 25 alignment; prototype questions; risk budgets. | Approved scope, dependency map, decision register and spike backlog. | Now |
| Phase 1 - Water and Marine World Foundation | 26B-26E | Bounded fluids, marine generation contracts, fields, swimming/diving and representative coast/ocean test environments. | May proceed while Set 25 schemas mature, with no premature registry freeze. |
| Phase 2 - Constructed Vessel Foundation | 26F-26I | Vessel local grid, commissioning, buoyancy/stability prototype, Shipwright workflow, repair/refit and Vessel Forge. | Requires stable 25B-25E contracts and technical spikes. |
| Phase 3 - Maritime Civilisation and Conflict | 26J-26M | Ports, crews, fleets, trade, piracy/navies, combat, ecology and adventure content. | Consumes vessel and world foundations. |
| Phase 4 - Cross-System and Production Integration | 26N-26O | Registries, progression, UI, multiplayer, saves, performance, QA and main-document amendments. | Finishes after major Set 26 decisions stabilise. |
| Phase 5 - Production Classification | 25F-25L plus Set 26 evidence | Classify which maritime packages enter Core, Early Access, Full Release, Later Expansion or Tooling Research. | No automatic full-expansion commitment. |

Set 26 and Set 25 may proceed in controlled parallel. Set 25 remains the registry and production spine. Set 26 may establish its source-aligned system design while waiting for later Set 25 contracts, but it must not freeze duplicate schemas or produce final physical registries ahead of 25C-25E and Core classification.

# 26. Prototype Questions, Risks and Redesign Triggers

| Risk | Why It Matters | Initial Severity | Required Response |
| --- | --- | --- | --- |
| Moving voxel interiors | Players/NPCs moving inside a vessel while the vessel moves, rotates and collides. | High | Prototype local-coordinate movement, nav, camera and replication before content scale. |
| Buoyancy and arbitrary geometry | Freeform shapes may be expensive or unstable to analyse. | High | Use voxel-derived displacement approximations, cached volumes, bounded recalculation and clear vessel size classes. |
| Water-vessel coupling | Full fluid/rigid-body coupling is unaffordable. | High | Use regional water surface/field queries plus local flooding cells, not universal CFD. |
| Networking authority | Large moving grids, edits, cargo, crew and damage create replication load. | High | Server-authoritative state, interest management, state compression and limited in-motion editing. |
| Navigation and AI boarding | NPC pathfinding across moving spaces and between vessels is complex. | High | Semantic station graphs, local nav volumes, boarding connectors and abstract fallback behaviour. |
| Chunk and streaming boundaries | Large vessels cross world cells and may contain many blocks/entities. | High | Separate vessel-local storage from terrain chunks; stream vessel presentation by relevance and class. |
| Scope explosion | Oceans, vessels, navies, underwater content and weather could become another full game. | High | Package completeness, tier classification, representative slices and strict deferrals. |
| Player-created exploit geometry | Unexpected shapes can bypass damage, cargo or stability rules. | Medium-High | Validation, capability budgets, stress tests, transparent warnings and server checks. |
| Motion discomfort | Waves, roll, camera and underwater visibility may cause nausea or accessibility issues. | Medium-High | Camera stabilisation, reduced motion, horizon lock, wave visual scaling and alternative views. |
| Save migration | Changing vessel schemas can orphan large player creations. | High | Stable IDs, versioned blueprints/instances, migrations, safe-mode docking and original-save preservation. |
| Asset burden | Many ship families, components, crews, effects and ports can exceed production capacity. | High | Material/culture kits, modular components, shared rigs, procedural variants and 25K budgets. |
| World generation reachability | Seeds may produce unusable oceans, isolated islands or blocked progression. | Medium-High | Capability fallbacks, route validation, seed batches and alternate non-maritime access where required. |

## 26.1 Mandatory Early Spikes

- Move a small local voxel grid with one player standing inside while preserving stable controls and camera.
- Calculate approximate displacement, centre of mass, centre of buoyancy and stability for several arbitrary voxel hulls.
- Apply cargo changes and breaches, then update list, draft and compartment flooding without rebuilding every calculation every frame.
- Dock, convert between construction and commissioned states, edit the vessel, recommission it and preserve IDs/state.
- Load/save/migrate a damaged vessel with inventories, components and a player-created blueprint.
- Replicate one moving vessel with two players, block damage and cargo transactions under server authority.
- Promote an abstract travelling vessel into a detailed local scene without changing identity, cargo or outcome.
- Run a representative storm/wave field against several vessel classes with motion-reduction accessibility modes.

## 26.2 Redesign Triggers

- Local-grid movement cannot maintain acceptable player/NPC stability in packaged builds.
- Freeform buoyancy requires per-frame work that exceeds agreed budgets even after caching and class limits.
- Network traffic for representative vessel combat cannot fit the approved multiplayer scope.
- Save migration cannot preserve player-built vessels safely across schema changes.
- The Shipwright workflow cannot explain invalid designs clearly enough for non-expert players.
- The full planned expansion cannot form complete production packages within asset and implementation budgets.

# 27. Validation Philosophy and Definition of Done

| Acceptance Area | Pass Condition |
| --- | --- |
| Vision Integrity | The expansion strengthens survival, civilisation, automation and fantasy RPG pillars rather than replacing them with a separate naval game. |
| Authority Integrity | Every field has one owner; Atlas, gameplay, Forge and runtime responsibilities remain distinct. |
| Construction Freedom | A representative range of ordinary block materials can form valid or deliberately invalid vessel attempts with understandable outcomes. |
| World Coherence | Seed batches create usable marine regions, routes, ports, ecosystems, hazards and progression alternatives without fixed content. |
| Simulation Readability | Players can understand launchability, stability, weather risk, damage, flooding and route state through world cues and UI. |
| Performance | Representative oceans, ports, vessels, crews, storms and combat remain within approved frame, memory, streaming and network budgets. |
| Persistence | Vessels, cargo, crews, damage, routes, wrecks, edits and ownership survive save/load and migration without silent loss. |
| Multiplayer Authority | Clients cannot create cargo, move vessels, change blocks, assign ownership or resolve damage outside validated authority. |
| Accessibility | Motion, water visibility, audio cues, warnings, controls and navigation have scalable alternatives. |
| Content Completeness | Selected packages include world role, dependencies, physical I/O, presentation, fallbacks, tests and aftermath. |
| POC Isolation | No retired POC names, routes, regions, encounters or fixtures enter production generation or fallback pools. |
| Recovery | Capsize, grounding, damage, flooding and migration failures have non-destructive recovery paths where the selected difficulty permits. |

A feature is not complete because a boat can move in a test scene. It is complete at its selected production tier only when identity, world role, construction, resources, UI, presentation, persistence, authority, fallbacks, accessibility, performance and aftermath are all defined and validated.

# 28. Main Document and Forge Integration Matrix

| Source/Document | Required Maritime Integration | Treatment |
| --- | --- | --- |
| 00 - Master Game Design Bible | Add maritime player fantasies, mobile voxel vessels, ocean civilisation and long-term naval/world-shaping escalation. | Revision after Set 26 stabilises. |
| 01 - Core Gameplay Loop | Add sail/travel/chart/build/crew/trade/repair/defend loops and oceanic world-start variants. | Revision pack. |
| 02 - Player Progression | Add swimming, diving, shipwright, sailing/navigation, maritime trade, crew leadership and naval combat paths without classes. | Revision pack; exact trees in 26N. |
| 03 - Blocks Registry | Add fluid/material fields, vessel-role suitability, sealing, absorption, corrosion, mass/density, flexibility and maritime functional blocks. | Complete replacement through Set 25/26 integration. |
| 04 - Items Registry | Add shipwright tools, charts, rigging, pumps, components, diving gear, cargo, fishing and repair items. | Complete replacement through Set 25/26 integration. |
| 05 - Recipe Registry | Add vessel components, staged ship projects, repairs, sails, engines, mana drives, preservation, naval supplies and salvage. | Complete replacement through Set 25/26 integration. |
| 06 - Resource Progression | Add maritime uses for existing materials, sealing/fibre branches, marine resources and vessel progression capability bands. | Complete replacement through Set 25/26 integration. |
| 07 - NPC Village System | Add maritime jobs, ports, shipyards, crews, fleet ownership, route supply and coastal threats. | Major revision. |
| 08 - Automation System | Add loading/unloading, pumps, vessel machinery, cargo routing, dock automation, fuel/mana logistics and remote fleet supply. | Major revision. |
| 09 - Magic System | Add water/air/weather/ward/navigation/diving magic, mana propulsion, magical hull protection and maritime rituals. | Major revision without making magic mandatory for basic boats. |
| 10 - Creatures and Monsters | Add marine ecology, fishing pressure, aquatic movement, ship attacks, migrations, sea bosses and underwater creatures. | Major revision consuming 24F and 26M. |
| 11 - Biomes and World Generation | Replace broad water section with Atlas 24C plus 26B-26D executable contracts, presets, routes, ports and seed validation. | Complete replacement. |
| 12 - Structures | Add ports, harbours, shipyards, sea forts, lighthouses, wrecks, underwater structures and vessel/structure boundary rules. | Major revision consuming 24I and 26J. |
| 13 - Races, Peoples, Cultures and Factions | Add maritime adaptation, ship traditions, port cultures, trade leagues, pirate societies and navies without equating culture with ancestry. | Major revision consuming 24E. |
| 14 - Dimensions | Add realm water laws, marine traversal and bounded vessel transfer rules; extraordinary realm craft remain tiered. | Revision. |
| 15 - Quest and Event System | Add voyages, rescues, contracts, storms, blockades, missing ships, piracy, salvage, expeditions and marine world events. | Major revision. |
| 16 - Combat, Gear and Defence | Add naval weapons, boarding, structural damage, crew combat, fire/flood emergencies, capture and coastal siege. | Major revision. |
| 17 - UI/UX System | Add helm/navigation, vessel inspection, commissioning, weather, crew, cargo, damage, flooding, fleet and accessibility interfaces. | Major revision. |
| 18 - Technical Implementation Plan | Rewrite for Godot/Summer Engine, hybrid fluids, vessel local grids, authority, persistence, streaming, physics, networking and QA. | Complete replacement; exact architecture in 26O. |
| 20 - Settlement Growth/Needs | Add water suitability, ports, fishery upgrades, shipyards, rescue, customs, maritime work and fleet service capacity. | Targeted revisions. |
| 21-23 - Forge Sets | Extend Asset/Blueprint/Presentation Forge with vessel-specific workspace, markers, simulation previews, water contexts, audio/VFX and manifests. | Extension, not replacement. |
| 24 - World Content Atlas | Retain Atlas world authority; Set 26 consumes marine, culture, ecology, site, boss, route, resource and history foundations. | No broad replacement; record cross-links and any targeted clarifications. |
| 25 - Production Governance and Integration | Register Set 26, consume 25B-25E contracts, classify maritime packages in 25F, budget them in 25K and audit them in 25L. | 25A controlled amendment plus downstream integration. |

# 29. Decision Register

| ID | Decision | Status | Authority/Owner |
| --- | --- | --- | --- |
| DEC-26A-001 | Document Set 26 is the dedicated Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion. | Locked | Ash |
| DEC-26A-002 | Set 26 contains Documents 26A-26O in the map defined by this document. | Working Lock | 26A; Ash approval |
| DEC-26A-003 | Oceans are navigable, inhabited and system-connected world regions rather than map boundaries. | Locked | 24C / Ash |
| DEC-26A-004 | The expansion includes a water/liquid mechanics overhaul sufficient for maritime gameplay. | Locked | Ash |
| DEC-26A-005 | Player vessels use a hybrid arbitrary-block construction model with runtime vessel roles and specialised functional components. | Locked | Ash / 26A resolution |
| DEC-26A-006 | A Shipwright Tool and commissioning workflow identify, validate and convert a build into a Vessel Instance. | Locked | Ash / 26A resolution |
| DEC-26A-007 | The existing Forge is extended with a Vessel Forge workspace. | Locked | Ash / Sets 21-23 |
| DEC-26A-008 | NPC shipbuilding, crews, merchants, pirates and navies are part of the expansion. | Locked | Ash |
| DEC-26A-009 | Vessels retain block/section damage, flooding, fire, repair, capture, sinking and salvage consequences. | Approved Baseline | 26A recommendation |
| DEC-26A-010 | Water uses a hybrid local-fluid/regional-field/presentation architecture rather than full CFD. | Approved Baseline | 24C, legacy 18 principles, 26A |
| DEC-26A-011 | Commissioned vessels use a persistent local voxel grid separate from terrain chunks. | Approved Baseline | 26A technical boundary |
| DEC-26A-012 | Normal block-by-block vessel edits are restricted while moving; safe edit/refit states use docking, beaching or dry-dock rules. | Approved Baseline | 26A |
| DEC-26A-013 | Set 26 follows 25B qualified IDs and source-of-truth ownership; no maritime subsystem creates parallel registries. | Locked | 25B |
| DEC-26A-014 | Atlas 24C remains environmental authority; Set 26 owns executable maritime mechanics and integration contracts. | Locked | 24C, 25A-25B |
| DEC-26A-015 | Production maritime content remains seed-derived; no fixed tutorial ocean, island, port, route or fleet is universal. | Locked | 24A, 24C, 25A |
| DEC-26A-016 | Distant vessels and fleets use bounded abstract simulation with persistent identity and promotion/demotion. | Approved Baseline | 24C, 07-08, 26A |
| DEC-26A-017 | Godot/Summer Engine remains the target; Summer Engine is not a shipped runtime dependency. | Locked | Project direction / Forge technical plans |
| DEC-26A-018 | The entire expansion is not automatically Core Production; exact tier selection requires Set 25 classification and evidence. | Locked | 25A, 24L |
| DEC-26A-019 | Exact vessel size classes, block caps and physics budgets. | Pending | 26F, 26O, technical spikes |
| DEC-26A-020 | Exact first playable maritime production slice and release tier. | Pending | 25F, 26O |
| DEC-26A-021 | Exact crew simulation depth and player command model. | Pending | 26J, 26O |
| DEC-26A-022 | Exact naval weapon families, technological tone and balance. | Pending | 26L, 26N |
| DEC-26A-023 | Exact underwater pressure, oxygen and survival defaults. | Pending | 26E |
| DEC-26A-024 | Full moving-vessel multiplayer/boarding scope for the first release. | Pending | 26O / revised 18 |
| DEC-26A-025 | Skyships, full submarines, dimensional arks and other non-maritime derivatives. | Deferred | Later expansion after maritime foundation |

# 30. Handoff to Document 26B

Document 26B must convert the hybrid fluid direction into a precise gameplay and technical design without overcommitting to full physical simulation. It should define:

- Canonical liquid terminology and categories.
- Local voxel fluid-cell state and update scheduling.
- Large-water body and regional-field interfaces.
- Fluid sources, sinks, containment, displacement and block interaction.
- Pumps, drains, gates, pipes, flooding, compartments and recovery.
- Mixing, contamination, heat and magical-state boundaries.
- Buoyancy query interfaces required by 26F-26G without owning vessel algorithms.
- Save deltas, worldgen regeneration, multiplayer authority and simulation LOD.
- Performance budgets, prototype cases, validation tests and redesign triggers.
- Exact ownership boundaries with Blocks, Automation, Worldgen, Presentation Forge and the rewritten Technical Plan.

> **26A Completion Statement**
>
> Document 26A establishes Document Set 26 as Leyforge's dedicated maritime and naval expansion. It locks the ocean-world and constructed-vessel fantasy, the freeform block-plus-role shipbuilding direction, Shipwright commissioning, Vessel Forge integration, maritime civilisation, persistent damage and fleet consequences, the hybrid fluid/field architecture, source-of-truth boundaries, production sequence, risks and acceptance philosophy. The set may now proceed to Document 26B without silently committing the full expansion to Core Production or inventing duplicate registries.

# Appendix A. Canonical Terminology and Working Glossary

| Term | Working Meaning |
| --- | --- |
| Water Body | An authored/generated lake, river, sea, basin or connected water region with persistent topology and environmental fields. |
| Marine Region | A generated ocean/sea macro-region with temperature, salinity, currents, storms, ecology, routes and history. |
| Marine Field | A regional simulation record such as wind, current, tide, wave or storm state. |
| Local Fluid Cell | A bounded interactive voxel-scale liquid state used where edits, structures, vessels or hazards require it. |
| Vessel Definition | An immutable gameplay profile or class contract referenced by approved content. |
| Vessel Blueprint | A semantic voxel design containing placements, roles, markers, stages, substitutions and validation rules. |
| Vessel Instance | A persistent commissioned moving structure with local grid, transform, cargo, crew, damage, ownership and history. |
| Vessel Role | An instance-level structural use assigned or inferred for a placed block without changing its block ID. |
| Functional Component | A block/entity/module providing a distinct vessel function such as steering, propulsion, pumping, navigation or weapons. |
| Shipwright Anchor | A world object that bounds and registers a candidate vessel build for scanning and commissioning. |
| Commissioning | The validated transition from static world construction to persistent Vessel Instance. |
| Refit | Controlled post-commission modification performed in a safe locked movement state. |
| Compartment | A bounded interior volume used for access, flooding, cargo, crew and damage logic. |
| Fleet | A persistent or summarised group of vessels sharing mission, route, ownership or command. |
| Wreck | A disabled/sunk vessel state converted into persistent salvage, ecology, hazard, story or restoration content. |

# Appendix B. Document Set 26 Dependency Matrix

| Document | Must Consume Before Locking | Primary Handoff |
| --- | --- | --- |
| 26A | 25A-25B; 24A, 24C, 24L; 00-18; Forge Sets 21-23 | 26B |
| 26B | 26A; 03, 08, 11, 18 replacement | Next Set 26 specialist and 26O integration |
| 26C | 26A-26B; 24A-24C; 25B-25E | Next Set 26 specialist and 26O integration |
| 26D | 26B-26C; 11; 23 presentation | Next Set 26 specialist and 26O integration |
| 26E | 26B-26D; 02, 09, 16, 17 | Next Set 26 specialist and 26O integration |
| 26F | 26A-26B; 25B-25C; 03, 12, 18 replacement | Next Set 26 specialist and 26O integration |
| 26G | 26D, 26F; 08-09; technical spikes | Next Set 26 specialist and 26O integration |
| 26H | 26F-26G; 03-08; 12; 20 | Next Set 26 specialist and 26O integration |
| 26I | 21-23; 25B-25E; 26F-26H | Next Set 26 specialist and 26O integration |
| 26J | 07, 12, 20, 24E, 24I; 26H-26I | Next Set 26 specialist and 26O integration |
| 26K | 07-08, 13, 15; 24E, 24I, 24K; 26J | Next Set 26 specialist and 26O integration |
| 26L | 16; 23; 26B, 26F-26K | Next Set 26 specialist and 26O integration |
| 26M | 10; 24C, 24F-24H; 26C-26E | Next Set 26 specialist and 26O integration |
| 26N | 02-09, 13-15; 24J-24L; 25F-25K | Next Set 26 specialist and 26O integration |
| 26O | 17; rewritten 18; 25D-25L; all prior Set 26 | Next Set 26 specialist and 26O integration |

# Appendix C. Proposed Document 25A Amendment Entries

The following controlled amendment should be added to Document 25A after approval of 26A. It records Set 26 without rewriting 25A governance:

| Amendment Field | Proposed Entry |
| --- | --- |
| Change ID | CR-25A-26-001 - Register Document Set 26 Maritime and Naval Expansion. |
| Programme Map | Add Set 26A-26O as a parallel expansion programme dependent on Set 25 registry, validation, classification, budgets and backlog governance. |
| Authority Boundary | 24C and related Atlas volumes retain world-context authority; Set 26 owns maritime executable mechanics; Set 25 governs identity, packs, production tier and evidence. |
| Sequencing | Permit early 26A-26E design in parallel; require approved 25B-25E contracts before registry-heavy 26F-26O locks. |
| Core Scope | Do not assume all maritime packages are Core Production. Classify them through 25F and later evidence. |
| Decision Register | Add dedicated maritime expansion, water overhaul, hybrid freeform vessels, Vessel Forge, NPC fleets/piracy/navies and deferred extraordinary vessels. |
| Integration | Require 25L and main-document replacement work to consume approved Set 26 outputs. |

# Appendix D. Document 26A Acceptance Criteria

| Acceptance Area | Pass Condition |
| --- | --- |
| Set Identity | Establishes a dedicated, correctly numbered Set 26 and a complete 26A-26O map. |
| Player Fantasy | Captures arbitrary-block vessel construction, Shipwright tools, Vessel Forge, NPC shipbuilding, fleets, piracy, navies, oceans, weather and water overhaul. |
| Source Alignment | Preserves Atlas, Set 25, Forge, gameplay and runtime authority boundaries. |
| POC Retirement | Contains no dependency on fixed POC locations, sequences or identities. |
| Technical Honesty | Identifies high-risk unknowns and does not claim that moving voxel vessels or full multiplayer are solved. |
| Production Control | Separates expansion completeness from Core Production inclusion and assigns evidence-based gates. |
| Data Integrity | Consumes 25B qualified IDs and definition/instance separation without inventing a competing registry. |
| Cross-System Coverage | Maps impacts across Documents 00-18, settlement sets, Forge sets, Atlas and Set 25. |
| Handoff | Provides enough scope and boundary detail for Document 26B to begin without reopening the expansion vision. |
| Human Approval | Ready for Ash to approve, amend or supersede before specialist documents become active baselines. |

---

*End of Document 26A - Maritime and Naval Expansion Vision, Scope, Authority and Integration Foundation v0.1*