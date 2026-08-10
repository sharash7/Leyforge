# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25F - Core Production Atlas Classification and Scope Lock

Version 0.1 - Core Production Classification and Scope-Lock Draft

A governed classification of the World Content Atlas into a deliberately bounded, dependency-complete Core Production slice, with explicit Early Access, Full Release, Later Expansion, Tooling Research and Archived Validation treatment for content not selected for the first production milestone.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking


---


# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Initial draft | Creates the first proposed Core Production classification and scope lock after 25A-25E; selects the recommended first playable realm, world package, civilisation package, ecology/adventure roster, maritime boundary and downstream handoffs. |

# Document Purpose

Document 25F converts the Atlas inventory and the governance, registry, packaging and validation foundations of Documents 25A-25E into a production decision. It defines the smallest complete content slice that can prove Leyforge's final identity without recreating the retired proof of concept, opening an unmanageable content backlog, or prematurely depending on unproven expansion technology.

The document classifies selected Atlas foundations, establishes recommended numerical envelopes, chooses a complete realm package, records what is deliberately absent, and defines the conditions under which the scope may change. It does not write the package dependency matrix, physical block/item/recipe registries, detailed asset manifests, executable Godot architecture or maritime gameplay contracts. Those remain owned by 25G-25L, rewritten Documents 03-06/11/18 and Document Set 26.

The selections in this draft are **recommended working locks**. They become approved production scope only when Ash accepts this document or records amendments. No recommendation in this document silently changes canon or overrides an owning source document.

# Design Sources and Supersession Rules

| Source | Authority Used by 25F |
| --- | --- |
| Document 24A | Seed-generated topology, package completeness, no fixed POC content and Atlas ownership boundaries. |
| Documents 24B-24K | Candidate world, realm, civilisation, ecology, site, boss, structure, resource and history foundations. |
| Document 24L | Core Production identity, six production tiers, content-budget philosophy, roadmap order and recommended target ranges. |
| Document 25A v0.2 | Governance, POC retirement, authority, scope-change rules, Set 26 boundary and final closure conditions. |
| Document 25B v0.2 | Stable identities, namespaces, extension compatibility, definition/instance separation and ownership. |
| Document 25C v0.1 | Schemas, typed relationships, capabilities, suitability, fallbacks and completeness contracts. |
| Document 25D v0.1 | Pack admission, authoring, dependency modes, world manifests, migration and safe optional-content behaviour. |
| Document 25E v0.1 | Validation suites, seed QA, progression proofs, performance classes and release evidence. |
| Documents 00-18 | System identity and retained engine-agnostic requirements, subject to POC cleanup and later replacement/revision. |
| Approved Set 26 direction | Separate maritime/naval expansion; Set 26 is not absorbed into Set 25 and is classified package-by-package. |

Where an older document requires a fixed Forest Hamlet, watchtower, goblin raid, portal destination or POC arrangement, that content remains Archived Validation only. Where an older document contains a reusable mechanic, 25F may select the mechanic through a new generic package without preserving the retired identity.

# Static Table of Contents

- Revision History
- 1. Locked Core Production Classification Identity
- 2. Source-Derived Direction and Decision Boundary
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Classification Terminology
- 5. Classification Method and Evidence
- 6. Production-Tier Assignment Rules
- 7. Scope-Lock and Change-Control Contract
- 8. Core Production Slice Identity
- 9. Core Production Budget Summary
- 10. Supported World Profiles
- 11. Core World Topology and Macro-Regions
- 12. Core Surface Biome Scope
- 13. Core Vertical, Coastal, Underground and Special Environments
- 14. Document Set 26 and Maritime Classification Boundary
- 15. Realm Classification and First Playable Dimension
- 16. Core Ancestry and Personhood Foundations
- 17. Core Cultures
- 18. Core Faction Archetypes
- 19. Core Settlement Archetypes and Stage Taxonomy
- 20. Core Ecology and Creature Scope
- 21. Core Dungeon, Ruin, Lair and Megadungeon Scope
- 22. Core Boss and Major-Threat Scope
- 23. Core Structures, Routes and Infrastructure
- 24. Core Resource, Loot and Material-Ecology Envelope
- 25. Core History, Story, Event and Dynamic-State Envelope
- 26. Four-Pillar Gameplay Proof
- 27. Progression, Capability and Fallback Obligations
- 28. Physical Registry Obligations
- 29. Forge, Asset and Presentation Scope
- 30. UI, Saves, LOD, Performance and Multiplayer Scope
- 31. Classification of Unselected Atlas Content
- 32. Early Access Portfolio
- 33. Full Release Portfolio
- 34. Later Expansion, Tooling Research and Archived Validation
- 35. Set 26 Package Classification Recommendations
- 36. Dependency, Cost and Readiness Risks
- 37. Scope Change, Substitution and Deferral Rules
- 38. Core Production Acceptance Gate
- 39. Decisions Locked or Proposed by 25F
- 40. Handoff to Document 25G
- Appendix A. Core Production Roster
- Appendix B. Atlas Volume Classification Summary
- Appendix C. Set 26 Classification Register
- Appendix D. Core Scope Change Request Template
- Appendix E. Document 25F Acceptance Criteria
- Appendix F. Decision Register Updates

# 1. Locked Core Production Classification Identity

Core Production is the smallest content set that proves the identity of the final Leyforge game as a seed-generated fantasy voxel survival, civilisation, automation and RPG sandbox. It is not a tutorial valley, a temporary vertical slice, a list of attractive Atlas entries or a promise to implement every foundation currently documented.

> **Locked Rule**  
> A foundation enters Core Production only when its complete package is required to prove the final game identity and can be given valid dependencies, physical inputs and outputs, capability fallbacks, presentation requirements, simulation behaviour, save treatment and acceptance evidence. Content that is impressive but incomplete belongs in a later tier.

| Identity Layer | Core Production Meaning | Player-Facing Result |
| --- | --- | --- |
| Seed World | Generated from reusable region, biome, route, ecology, settlement, site and history rules. | Worlds differ meaningfully without fixed tutorial content or guaranteed named locations. |
| Living Civilisation | Several cultures and settlement forms consume, produce, trade, remember and change. | Resources and automation affect people, not only the player inventory. |
| Physical Sandbox | Selected content resolves to real blocks, items, recipes, structures, drops and states. | Gathering, building and production remain tactile and understandable. |
| Practical Fantasy | Magic, automation, ecology, dungeons and realms connect to daily play and world state. | The fantasy is visible in infrastructure, not only combat effects. |
| Adventure and Aftermath | Sites and major threats have discovery, alternatives, rewards and persistent outcomes. | Exploration changes routes, settlements, ecology and history. |
| Production Trust | Saves, migration, LOD, validation, accessibility and performance are scope requirements. | The first production milestone is a reliable game slice rather than a fragile demo. |

# 2. Source-Derived Direction and Decision Boundary

| Classification Statement | Status in This Draft |
| --- | --- |
| The POC is retired and must not generate in production worlds. | Locked source-derived rule. |
| Core must prove random world generation, multiple biomes/cultures/settlements, ecology, adventure, four pillars and at least one dimension. | Locked source-derived rule. |
| The six production tiers and twelve-state lifecycle are canonical. | Approved Set 25 baseline. |
| The recommended Core budget ranges from 24L are planning controls, not quotas. | Locked source-derived rule. |
| Verdant Covenant is the recommended first fully playable realm. | 25F recommendation requiring Ash approval. |
| Ancestral Veil is the recommended safe teaser route. | 25F recommendation requiring Ash approval. |
| Full maritime gameplay is not required for the first Core milestone. | 25F recommendation; Set 26 remains approved and independently developed. |
| Playable public multiplayer is deferred while multiplayer-ready authority remains mandatory. | 25F recommendation requiring Ash approval. |
| The exact block/item/resource/recipe roster is deferred to 25H-25J. | Required handoff, not a gap to fill in 25F. |

# 3. Scope, Non-Goals and Handoff Boundaries

## 3.1 In scope

- classification of Atlas domains and selected foundations into production tiers;
- a recommended Core Production content roster and budget envelope;
- first playable realm and teaser-route recommendation;
- civilisation, ecology, site, boss, structure and world-state scope;
- maritime/Set 26 classification boundary;
- survival defaults, settlement-stage support and multiplayer milestone recommendation where required to close scope;
- validation, asset, save, migration, performance and acceptance obligations;
- deferral and change-control rules for unselected content.

## 3.2 Explicit non-goals

- no detailed block, item, recipe or numerical balance entries;
- no detailed maritime mechanics, vessel architecture, naval combat or fluid simulation;
- no executable Godot or Summer Engine implementation plan;
- no final asset count or production-hour estimate;
- no final public release date or commercial packaging decision;
- no claim that every selected package is already Specified, Data Ready or implementable.

## 3.3 Handoff boundaries

| Owner | Receives from 25F | Still Owns |
| --- | --- | --- |
| 25G | Selected packages, counts, tier, risk and acceptance obligations. | Exact dependency graph, provider/fallback matrix, physical I/O and package readiness. |
| 25H-25J | Selected world/civilisation/adventure requirements and numerical envelopes. | Exact block, item, resource, loot, recipe and progression entries. |
| 25K | Selected content families and presentation obligations. | Exact Forge/asset manifests, budgets and production assignments. |
| 25L | Approved scope, deferred portfolio, risks and final closure conditions. | Bounded implementation backlog and source-of-truth integrity audit. |
| Document 18 replacement | Supported milestone, runtime risk and authority expectations. | Godot/Summer Engine architecture, numeric budgets and test commands. |
| Set 26 | Base-game compatibility boundary and programme tier recommendation. | All detailed maritime and naval system contracts. |
| Ash | Transparent proposed scope and trade-offs. | Final scope, canon, milestone and release approval. |

# 4. Canonical Classification Terminology

| Term | Definition |
| --- | --- |
| Core Production | Smallest complete content set required to prove the final game identity. |
| Core Package | A dependency-complete group of foundations selected together because isolated entries would be incomplete. |
| Scope Lock | Approved boundary after which new Core intake requires a recorded change request and displaced work. |
| Portfolio | Content assigned to a later tier but retained as approved future direction. |
| Teaser Route | Safe, bounded infrastructure that foreshadows a realm without promising a complete playable realm. |
| Derived Variant | Generated or authored variant of a selected foundation that reuses identity, skeleton, logic or asset family without becoming a separate foundation. |
| Base Compatibility Contract | Minimal extension point that allows a future expansion to integrate without shipping its full feature set. |
| Conditional Selection | Package selected only if a named technical or dependency gate passes; otherwise it automatically defers. |
| Displaced Work | Existing Core work removed or reduced when a new package enters after scope lock. |

# 5. Classification Method and Evidence

1. Confirm the foundation belongs to the Atlas domain and has a stable identity under 25B.
2. Group foundations into complete player-facing packages rather than selecting isolated names.
3. Identify the final-game identity proof served by the package.
4. List mandatory relationships, capabilities, physical I/O and fallback providers under 25C.
5. Identify pack, migration and optional-content behaviour under 25D.
6. Assign required validation suites, seed coverage, performance class and evidence under 25E.
7. Estimate unique asset, simulation, networking and tooling burden.
8. Compare the package with a smaller complete alternative.
9. Assign production tier and record unresolved approval or technical gates.
10. Freeze the selection only after Ash approves the complete trade-off.

| Selection Signal | Supports Core | Pushes Later |
| --- | --- | --- |
| Identity proof | Required to show one of the four pillars or their interconnection. | Duplicates a role already proven. |
| Dependency closure | All mandatory providers and fallbacks can be included. | Depends on large unselected systems. |
| Asset reuse | Uses reusable material, body, structure or animation kits. | Requires many unique bespoke assets. |
| Simulation feasibility | Has a bounded LOD model and representative test. | Needs unproven large-scale simulation or physics. |
| Seed value | Creates meaningful variety across many worlds. | Only works as a single fixed spectacle. |
| Aftermath | Changes persistent world state in testable ways. | Ends as isolated loot delivery. |
| Migration safety | Can be added, updated and preserved safely. | Cannot yet survive version or pack changes. |

# 6. Production-Tier Assignment Rules

| Tier | 25F Assignment Rule |
| --- | --- |
| Core Production | Selected package is required for the first complete production identity and all dependencies are planned. |
| Early Access | Broadens replayability or system depth after Core stability; must still meet full completeness before admission. |
| Full Release | Needed for intended first commercial breadth but not for the first complete production milestone. |
| Later Expansion | Large new themed systems, realms, cultures, threats or content packs built on stable extension points. |
| Tooling Research | Complete package depends on unproven physics, rendering, AI, networking, authoring or simulation scale. |
| Archived Validation | Retired POC content, old experiments and non-shipping regression fixtures. |

A package may carry both a programme owner and production tier. Set 26 is an approved expansion programme, but its packages are not automatically assigned to Later Expansion solely because of the programme name.

# 7. Scope-Lock and Change-Control Contract

Approval of 25F creates the **Core Production Intake Freeze**. Later documents may clarify fields, split tasks or replace one selected provider with a capability-equivalent provider, but they may not increase the intended breadth without a scope-change record.

| Change Type | Allowed After Lock? | Required Treatment |
| --- | --- | --- |
| Field completion | Yes | Complete the selected package under its owner. |
| Capability-equivalent substitution | Yes with review | Show equal or lower dependency, asset and validation cost. |
| New derived variant | Limited | Must reuse an approved family and remain within asset/performance budget. |
| New foundation | Normally no | Requires displaced work and Ash approval. |
| New major system | No | Move to later tier or approved expansion programme. |
| Technical deferral | Yes | Record fallback provider and milestone consequence. |
| Removal of blocker package | Yes with approval | Re-run progression, completeness and identity proof. |

# 8. Core Production Slice Identity

The internal planning label for the recommended slice is **Living Frontier Network**. This is not a shipping world name, fixed region or canonical location. It describes a generated network of regions, settlements, routes, ecologies, sites and realm links that can assemble differently for every seed.

The slice proves the player can begin in wilderness, establish survival capability, discover multiple societies, use real production and practical magic, alter settlement outcomes, respond to ecological and faction pressure, explore layered sites, resolve a regional threat, enter a complete realm and leave persistent history without following one fixed sequence.

| Proof Question | Required Core Answer |
| --- | --- |
| Can a new seed begin safely without a village? | Yes; local capability providers and clues must support survival. |
| Can the player ignore the nearest settlement? | Yes; alternate routes, trade, ruins and research remain possible. |
| Do cultures produce different world behaviour? | Yes; architecture, goods, law, services and relationships vary. |
| Does automation serve civilisation? | Yes; settlement warehouses, projects, trade and defence consume real flows. |
| Is magic practical? | Yes; mana, wards, runes, cleansing, farming, routes and machines are physical systems. |
| Does adventure change the world? | Yes; sites and bosses create aftermath, restoration, migration, route and faction changes. |
| Is one realm complete? | Yes; Verdant Covenant receives a full package rather than a palette-swapped level. |

# 9. Core Production Budget Summary

| Content Family | Recommended Core Scope | Lock Note |
| --- | --- | --- |
| World profiles | 3 | Balanced, relaxed/building-focused and harsher frontier presets. |
| Macro-region archetypes | 7 | Seven connected regional roles; no fixed named starter region. |
| Surface biome foundations | 20 | Twenty selected from 24B with transition and resource coverage. |
| Vertical/special foundations | 18 | Eighteen coast-edge, underground and special environments. |
| Playable realm | 1 | Verdant Covenant with seven active biome families and a complete society/ecology/adventure path. |
| Teaser realm route | 1 | Ancestral Veil threshold infrastructure only; no general exploration promise. |
| Core cultures | 6 | Six culture packages across temperate, road, industrial, underground, wetland and realm roles. |
| Core ancestry/personhood foundations | 5 | Human, Goblin, Dwarf, Elven Kindreds and Awakened Construct. |
| Faction archetypes | 10 | Ten reusable political/economic/social roles. |
| Settlement archetypes | 10 | Ten forms from temporary camp through specialised town-scale settlements. |
| Overworld creature foundations | 44 | Forty-four foundations spanning ecology, domestic use, threats, magic and constructs. |
| Verdant creature foundations | 5 | Five native foundations plus derived variants of reusable ecological roles. |
| Overworld dungeon/site foundations | 21 | Twenty standard families plus one megadungeon seed family. |
| Verdant dungeon families | 5 | Five realm-specific grammars. |
| Overworld bosses/major threats | 8 | Eight roles with alternative outcomes and persistent aftermath. |
| Verdant realm authorities | 3 | Three realm climax/guardian paths. |
| Structure foundations | 45 | Forty-five selected settlement and infrastructure foundations. |
| Route foundations | 12 | Twelve selected route/crossing/industrial/waterway foundations. |
| Resource/material foundations | 52 | Target envelope; exact IDs and chains are owned by 25J and Documents 03-06. |
| Loot/relic/trade-good foundations | 36 | Target envelope; contextual provenance and ownership required. |
| History incidents / arcs / events / states | 24 / 14 / 36 / 18 | Target envelopes from 24K package families; exact roster finalised in 25G. |

These are scope envelopes, not filler targets. 25G may reduce an envelope when a smaller complete package proves the same identity. It may not increase an envelope without a change request.

# 10. Supported World Profiles

| Profile | Default Direction | Core Requirement |
| --- | --- | --- |
| Balanced | Normal survival, threat, consequence and guidance. | Primary validation profile and first balancing target. |
| Hearth and Craft | Reduced survival pressure and threat; full building, civilisation, automation, magic and story access. | Must not remove progression-critical resources or world systems. |
| Frontier | Higher survival, scarcity, weather, threat and consequence. | Must remain fair, readable and progression-reachable. |

World profiles adjust parameters and supported rules. They do not select fixed regions, named settlements, guaranteed bosses or predetermined portal destinations.

# 11. Core World Topology and Macro-Regions

| Stable ID | Working Name | Tier | Core Role |
| --- | --- | --- | --- |
| region.temperate.river_basin | Temperate River Basin | Core Production | Primary river, farmland, trade, settlement and flood-pressure region. |
| region.temperate.broadleaf_heartland | Broadleaf Heartland | Core Production | Primary forest, timber, ecology, ruin, village and guardian region. |
| region.temperate.moorland_marches | Moorland Marches | Core Production | Wet upland, peat, border, barrow, storm and route-pressure region. |
| region.boreal.lake_shield | Northern Lake Shield | Core Production | Cold forest, lake, fishing, winter-road and migration region. |
| region.wetland.flood_basin | Flood Basin | Core Production | Wetland, channels, stilt settlement, medicine, flood and disease region. |
| region.highland.alpine_watershed | Alpine Watershed | Core Production | Mountain passes, headwaters, mines, forts, pilgrimage and avalanche region. |
| region.geothermal.riftlands | Geothermal Riftlands | Core Production | Steam, power, alchemy, vents, unstable ruins and elemental pressure region. |

Generation must assemble several of these region roles per representative world. No single seed is required to contain every selected macro-region near the start. The world-level capability graph must provide travel, trade, substitution or fallback when a region-specific capability is distant or absent from an accessible early radius.

## 11.1 Required regional relationships

- at least one connected temperate river/heartland network;
- at least one wet or cold regional branch in normal-sized worlds;
- at least one highland or geothermal progression route;
- meaningful transition biomes rather than abrupt palette boundaries;
- roads and settlements generated from suitability and history, not guaranteed coordinates;
- quiet wilderness and buildable space between content concentrations;
- distant regional summaries that preserve ownership, ecology, danger, trade and history.

# 12. Core Surface Biome Scope

| Stable ID | Biome | Selection Rationale |
| --- | --- | --- |
| biome.surface.temperate.lowland_meadow | Lowland Meadow | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.temperate.rolling_pasture | Rolling Pasture | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.temperate.river_prairie | River Prairie | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.temperate.heather_moor | Heather Moor | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.forest.mixed_broadleaf | Mixed Broadleaf Forest | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.forest.ancient_oakwood | Ancient Oakwood | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.forest.evergreen_pine | Evergreen Pinewood | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.forest.mistwood | Mistwood | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.boreal.sprucewood | Boreal Sprucewood | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.boreal.cold_meadow | Cold Meadow | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.wetland.reed_marsh | Reed Marsh | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.wetland.peat_bog | Peat Bog | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.wetland.floodplain | Floodplain Wetland | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.wetland.quaking_mire | Quaking Mire | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.mountain.foothill_woodland | Foothill Woodland | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.mountain.rolling_highland | Rolling Highland | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.mountain.rocky_upland | Rocky Upland | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.mountain.alpine_meadow | Alpine Meadow | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.volcanic.geothermal_springs | Geothermal Springs | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |
| biome.surface.karst.limestone | Limestone Karst | Selected to complete climate, resource, ecology, settlement, transition or progression coverage. |

The selected surface set deliberately omits tropical, savanna, desert and extensive polar breadth from Core. Those families remain high-value Early Access or Full Release portfolios rather than being represented by shallow token biomes.

# 13. Core Vertical, Coastal, Underground and Special Environments

| Stable ID | Environment | Core Boundary |
| --- | --- | --- |
| coast.rocky.sheltered_cove | Sheltered Stone Cove | Core baseline coast; no full vessel dependency. |
| coast.rocky.shingle_shore | Shingle Shore | Core baseline coast; salvage, storms and landing readability. |
| coast.wet.salt_marsh | Salt Marsh | Core baseline tidal-edge ecology using bounded water states. |
| coast.wet.estuary | Broad Estuary | Core river-sea transition; advanced tides and shipping remain Set 26. |
| underground.shallow.limestone | Limestone Cave | Core shallow cave and karst route. |
| underground.shallow.root_cave | Rootbound Cavern | Core forest-underground and nature-magic link. |
| underground.shallow.minework | Abandoned Minework | Core salvage, history and resource route. |
| underground.cavern.fungal | Fungal Forest Cavern | Core underground ecology, food and medicine. |
| underground.cavern.rootworld | Worldroot Galleries | Core living-depth and Verdant route foreshadowing. |
| underground.cavern.crystal | Crystal Cathedral | Core mana, resonance and extraction-risk environment. |
| underground.water.river | Great Underground River | Core regional route with bounded water transport hooks. |
| underground.water.lake | Subterranean Lake | Core fishing, settlement and dungeon anchor. |
| underground.deep.deepstone | Deepstone Expanse | Core high-risk deep progression boundary. |
| underground.deep.machine_strata | Machine Strata | Core ancient automation and construct ecology layer. |
| special.leyline.meadow | Leyline Meadow | Core practical-magic landscape. |
| special.spirit.grove | Spirit Grove | Core memory, dialogue and non-combat resolution landscape. |
| special.ancient.roadland | Ancient Roadland | Core route restoration, archaeology and trade landscape. |
| special.realm.verdant_leak | Verdant Realm Leak | Core realm-discovery and hybrid-ecology landscape. |

The four selected coastal-edge foundations prove coastline generation, storm exposure, estuary settlement and shore ecology. They do **not** require full waves, tides, currents, naval travel, shipyards, fleets or underwater civilisation. Those detailed contracts remain owned by Set 26.

Skylands, open oceans, deep seas, polar seas, free-flight routes, gravity scars and underworld seas remain outside the first Core scope unless a later approved substitution demonstrates lower total risk than an existing selected package.

# 14. Document Set 26 and Maritime Classification Boundary

Set 26 remains a separate approved programme and the first major real-world test of Set 25 extension rules. 25F recommends that the first Core milestone include only **base compatibility**, not the complete maritime gameplay layer.

| Maritime Layer | Recommended Tier at 25F | Reason |
| --- | --- | --- |
| Coastline and estuary generation compatible with future Set 26 data | Core Production | Required for coherent worlds and future-safe integration. |
| Basic water volume, surface contact, swimming safety and save identity | Core Production base contract | Needed by the existing game even when Set 26 is absent. |
| Full fluid overhaul, waves, tides, currents and major storms | Tooling Research until 26B-26D prototypes pass | High determinism, physics and performance risk. |
| Open-ocean and underwater production world breadth | Later Expansion / Set 26 | Large content and simulation package. |
| Block-built mobile voxel vessels and moving interiors | Tooling Research until 26F-26G representative spike passes | High physics, authority, save and networking risk. |
| Shipwright, Vessel Forge, ports, fleets, naval combat and marine civilisation | Later Expansion / Set 26 | Must enter as complete connected packages, not shallow Core features. |

This recommendation does not reduce or cancel Set 26. It prevents the first land/civilisation production milestone from being blocked by the highest-risk maritime technologies while requiring all Core data, worlds, saves and registries to remain compatible with later maritime admission.

# 15. Realm Classification and First Playable Dimension

## 15.1 Recommended fully playable realm: Verdant Covenant

Verdant Covenant is recommended because it proves a realm can change ecology, politics, resources, architecture, automation, magic and world state while reusing several terrestrial traversal and body-plan foundations. It carries lower technical risk than zero-gravity, pressure-dominant, dream-logic, Void or machine-world realms, yet still demonstrates that a dimension is a complete world rather than a decorative reward room.

| Verdant Biome Family | Tier | Role |
| --- | --- | --- |
| Sunlit Canopy | Core | Contributes ecology, society, resources, routes, dungeons and realm-state variation. |
| Moonroot Groves | Core | Contributes ecology, society, resources, routes, dungeons and realm-state variation. |
| Pollenwild Meadows | Core | Contributes ecology, society, resources, routes, dungeons and realm-state variation. |
| Living Riverlands | Core | Contributes ecology, society, resources, routes, dungeons and realm-state variation. |
| Thorn-Court Marches | Core | Contributes ecology, society, resources, routes, dungeons and realm-state variation. |
| Rotwilds | Core | Contributes ecology, society, resources, routes, dungeons and realm-state variation. |
| Seasonal Nexus | Core climax | Contributes ecology, society, resources, routes, dungeons and realm-state variation. |
| Dreaming Root Depths | Early Access / Tooling Research due orientation and route complexity | Contributes ecology, society, resources, routes, dungeons and realm-state variation. |

The realm package requires Verdant Pact Enclaves, court/faction relationships, five native creature foundations plus derived ecological variants, five dungeon grammars, three realm authorities, living materials, route/return safety, realm-compatible settlement kits, realm resources with Overworld utility and persistent seasonal/blight aftermath.

## 15.2 Recommended teaser: Ancestral Veil

The teaser is limited to discoverable shrine or portal infrastructure, Codex/history foreshadowing, one safe threshold presentation and a verified return path. It does not promise general exploration, full spirit simulation, combat progression, procedural regions or an independent economy. Any broader Veil content moves to Early Access or Full Release.

## 15.3 Other realm tiers

| Realm Family | Recommended Portfolio |
| --- | --- |
| Ancestral Veil | Core teaser; full realm Early Access or Full Release. |
| Somnolent Expanse | Full Release / Tooling Research for dream logic and identity safety. |
| Aetheric Reach | Early Access / Tooling Research for aerial traversal and moving routes. |
| Impossible Deep | Full Release / Tooling Research for pressure, deep water and vertical logistics. |
| World-Engine | Full Release after construct rights, automation and sector architecture mature. |
| Ashen Lower Realms | Full Release or Later Expansion due contract-law and heat-industry breadth. |
| Void Between | Later Expansion / Tooling Research due spatial persistence risk. |
| Divine Concords | Full Release or Later Expansion after faith/law representation review. |
| Necropolis Domains | Full Release or Later Expansion after personhood, death and ethical-labour systems mature. |
| Elemental Confluences | Full Release after fluid/phase and climate systems mature. |
| Created Pockets | Early Access/Full Release as bounded authoring and testing spaces once pocket stability is proven. |

# 16. Core Ancestry and Personhood Foundations

| Stable ID | Foundation | Tier |
| --- | --- | --- |
| ancestry.human | Human | Core Production |
| ancestry.goblin | Goblin | Core Production |
| ancestry.dwarf | Dwarf | Core Production |
| ancestry.elf.kindred | Elven Kindreds | Core Production |
| ancestry.construct.awakened | Awakened Construct | Core Production |
| ancestry.orc | Orc | Early Access |

Core culture generation must not equate ancestry with culture, politics, hostility, profession, morality or biome. Mixed households and settlements are supported. Awakened Constructs are selected specifically to prove personhood, repair, ownership and automation boundaries without treating created beings as equipment by default.

Tidekin, Aerai, Mycelian, Emberkin, Rootborn and Veilborn remain approved expansion foundations. Tidekin and major marine lineages should be coordinated with Set 26 rather than duplicated in Core.

# 17. Core Cultures

| Stable ID | Culture | Core Proof |
| --- | --- | --- |
| culture.hearthland.commons | Hearthland Commons | Temperate civilisation, farming, practical wards and mutual defence. |
| culture.marchroad.leagues | Marchroad Leagues | Road law, caravans, bridges, maps, signals and negotiated identity. |
| culture.brassroot.communes | Brassroot Communes | Repair, salvage, public workshops and mechanical automation. |
| culture.deepstone.compacts | Deepstone Compacts | Underground safety, mining, surveying, halls and seismic wards. |
| culture.mirelight.covenants | Mirelight Covenants | Wetland stewardship, medicine, raised routes and luminous craft. |
| culture.verdant.pact_enclaves | Verdant Pact Enclaves | Realm-linked living construction, seedcraft and ecological treaties. |

These cultures are environment tendencies and social packages, not ancestry locks. Generated settlements may host diaspora, mixed citizenship and faction disagreement. Culture variants may adapt to selected regions without becoming new foundations unless their systems or assets differ materially.

# 18. Core Faction Archetypes

| Stable ID | Archetype | Core Function |
| --- | --- | --- |
| faction.local_council | Local Council | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.merchant_league | Merchant League | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.craft_guild | Craft Guild | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.mage_order | Mage Order | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.military_order | Military Order | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.frontier_company | Frontier Company | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.caravan_federation | Caravan Federation | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.personhood_league | Personhood League | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.raider_clan | Raider Clan | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |
| faction.realm_embassy | Realm Embassy | Reusable civic, economic, research, military, advocacy, hostile or realm-contact role. |

Generated worlds instantiate a smaller subset per region. A representative world should normally contain 8-12 faction instances across civic, trade, production, research, defence, rival, hostile and realm-contact interests. Factions are not guaranteed to be identical between seeds.

# 19. Core Settlement Archetypes and Stage Taxonomy

| Stable ID | Archetype | Core Use |
| --- | --- | --- |
| settlement.camp.temporary | Temporary Camp | Selected settlement form; culture and environment supply variants. |
| settlement.hamlet.rural | Rural Hamlet | Selected settlement form; culture and environment supply variants. |
| settlement.village.general | General Village | Selected settlement form; culture and environment supply variants. |
| settlement.village.fortified | Fortified Village | Selected settlement form; culture and environment supply variants. |
| settlement.town.market | Market Town | Selected settlement form; culture and environment supply variants. |
| settlement.town.river | River Town | Selected settlement form; culture and environment supply variants. |
| settlement.town.mining | Mining Town | Selected settlement form; culture and environment supply variants. |
| settlement.enclave.mage | Mage Enclave | Selected settlement form; culture and environment supply variants. |
| settlement.stilt | Stilt Settlement | Selected settlement form; culture and environment supply variants. |
| settlement.hall.underground | Underground Hall | Selected settlement form; culture and environment supply variants. |

## 19.1 Canonical settlement stage taxonomy

The recommended canonical stage taxonomy is: **Camp -> Hamlet -> Village -> Town -> City -> Capital -> Magical Metropolis**, with **Fortified** as a defensive branch/state that may apply from Village upward rather than a mandatory universal rung.

Core Production supports Camp through Town, including fortified variants and specialist enclave forms. City, Capital and Magical Metropolis remain Full Release or later milestones. This avoids forcing every settlement through one architecture or political sequence while preserving readable growth.

# 20. Core Ecology and Creature Scope

The selected roster is organised as an ecological package rather than a combat list. It covers ambient clues, pollination, decomposition, herds, predation, pests, domestic production, magical ecology, corruption, underground life and construct interaction.

| Stable ID | Creature | Core Role |
| --- | --- | --- |
| creature.overworld.lantern_gnat | Lantern Gnat | Ambient / pollination |
| creature.overworld.threadwing_moth | Threadwing Moth | Ambient / fibre |
| creature.overworld.riverglass_skater | Riverglass Skater | Freshwater indicator |
| creature.overworld.pebbleback | Pebbleback | Mineral grazer |
| creature.overworld.hush_cricket | Hush Cricket | Acoustic warning |
| creature.overworld.ember_ant | Ember Ant | Geothermal colony |
| creature.overworld.skyseed_drifter | Skyseed Drifter | Seed dispersal |
| creature.overworld.grave_beetle | Grave Beetle | Carrion decomposition |
| creature.overworld.meadowhorn | Meadowhorn | Herd grazer |
| creature.overworld.briarback_deer | Briarback Deer | Forest browser |
| creature.overworld.stonewool_ram | Stonewool Ram | Highland herd |
| creature.overworld.mire_grazer | Mire Grazer | Wetland engineer |
| creature.overworld.frostmane_elk | Frostmane Elk | Cold migration |
| creature.overworld.cliffback_ibex | Cliffback Ibex | Cliff browser |
| creature.overworld.gloamcat | Gloamcat | Dusk ambusher |
| creature.overworld.silverfang_packhound | Silverfang Packhound | Pack predator |
| creature.overworld.mirecoil | Mirecoil | Aquatic ambusher |
| creature.overworld.rootmaw_bear | Rootmaw Bear | Forest apex |
| creature.overworld.stormclaw | Stormclaw | Storm predator |
| creature.overworld.reed_serpent | Reed Serpent | Wetland apex |
| creature.overworld.scrap_jackal | Scrap Jackal | Industry scavenger |
| creature.overworld.bonepicker_crow | Bonepicker Crow | Intelligent scavenger |
| creature.overworld.crop_gnawer | Crop Gnawer | Agricultural pest |
| creature.overworld.mana_tick | Mana Tick | Magic parasite |
| creature.overworld.rotfly_swarm | Rotfly Swarm | Disease pressure |
| creature.overworld.tunnel_snatcher | Tunnel Snatcher | Burrowing thief |
| creature.domestic.hearthhen | Hearthhen | Domestic food/pest control |
| creature.domestic.woolhorn | Woolhorn | Fibre/milk herd |
| creature.domestic.burdenback | Burdenback | Hauling/plough |
| creature.domestic.tunnel_mole | Tunnel Mole | Mining work creature |
| creature.magic.ley_mote | Ley Mote | Mana indicator |
| creature.spirit.hearth_spirit | Hearth Spirit | Settlement spirit |
| creature.magic.raincaller_frog | Raincaller Frog | Weather-linked ecology |
| creature.magic.rune_antler | Rune Antler | Mana-adapted grazer |
| creature.undead.hollow_walker | Hollow Walker | Historical undead pressure |
| creature.undead.grave_root | Grave Root | Necromantic colony |
| creature.corruption.blight_hound | Blight Hound | Corruption predator |
| creature.corruption.canker_swarm | Canker Swarm | Living-structure blight |
| creature.subterranean.cavern_weaver | Cavern Weaver | Cave predator |
| creature.subterranean.crystal_burrower | Crystal Burrower | Deposit-exposing tunneller |
| creature.subterranean.deepfin | Deepfin | Underground-water predator |
| creature.construct.ward_hound | Ward Hound | Anomaly-detection construct |
| creature.construct.quarry_crawler | Quarry Crawler | Excavation construct |
| creature.construct.runic_custodian | Runic Custodian | Magic-site construct |

## 20.1 Verdant realm ecology

| Stable ID | Creature | Role |
| --- | --- | --- |
| creature.realm.verdant.oathstag | Oathstag | Native Verdant ecological foundation. |
| creature.realm.verdant.pollen_drake | Pollen Drake | Native Verdant ecological foundation. |
| creature.realm.verdant.seasonal_fox | Seasonal Fox | Native Verdant ecological foundation. |
| creature.realm.verdant.thornbound_hunter | Thornbound Hunter | Native Verdant ecological foundation. |
| creature.realm.verdant.rotcap_colony | Rotcap Colony | Native Verdant ecological foundation. |

The five native foundations are supplemented by 5-7 derived realm variants of selected pollinator, grazer, scavenger, spirit and pest roles. Derived variants must share approved body, animation and AI families and cannot be used to invent arbitrary powers.

## 20.2 Deferred ecology

Large flight ecosystems, marine food webs, free-burrowing megafauna, region-wide live swarms and unrestricted population genetics are Tooling Research or later-tier systems until representative simulation and asset budgets pass.

# 21. Core Dungeon, Ruin, Lair and Megadungeon Scope

| Stable ID | Site Family | Core Purpose |
| --- | --- | --- |
| dungeon.overworld.natural.echo_limestone | Echo Limestone Caverns | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.natural.worldroot_galleries | Worldroot Galleries | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.natural.basalt_lava_tubes | Basalt Lava Tubes | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.natural.colossal_remains | Colossal Remains Interior | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.ruin.waystation | Abandoned Waystation | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.ruin.hill_hamlet | Collapsed Hill Hamlet | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.ruin.river_village | Flooded River Village | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.ruin.orchard_estate | Overgrown Orchard Estate | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.mine.copper_layers | Layered Copper Mine | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.mine.deep_ironworks | Deep Ironworks | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.mine.crystal_purity | Crystal Purity Excavation | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.industry.mechanist_foundry | Abandoned Mechanist Foundry | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.tomb.clan_barrows | Clan Barrow Complex | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.tomb.battlefield_ossuary | Battlefield Ossuary | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.sacred.leyline_pilgrimage | Leyline Pilgrimage Shrine | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.sacred.broken_covenant | Broken Covenant Circle | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.tower.surveyor | Ruined Surveyor Tower | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.tower.mage_observatory | Sealed Mage Observatory | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.military.frontier_hillfort | Frontier Hillfort | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| dungeon.overworld.urban.buried_market | Buried Market Quarter | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |
| megadungeon.overworld.root_below_kingdoms | Root-Below Kingdoms | Selected to prove natural, civic, industrial, sacred, military, magical, restoration and history-driven site grammar. |

Root-Below Kingdoms is selected as the single Core megadungeon **seed family**, not a requirement to complete every possible district at initial implementation. The first production version must support a bounded, expandable route network, several entrances, settlement/ecology connections and persistent district states without pretending the entire Atlas-scale complex is finished.

## 21.1 Verdant realm sites

| Stable ID | Realm Site | Core Mechanic |
| --- | --- | --- |
| dungeon.realm.verdant.living_palace_roots | Living Palace Roots | Living routes, seasonal law, blight, oath or court permission changes the site. |
| dungeon.realm.verdant.broken_covenant_gardens | Broken Covenant Gardens | Living routes, seasonal law, blight, oath or court permission changes the site. |
| dungeon.realm.verdant.thorn_hunt | Thorn-Hunt Labyrinth | Living routes, seasonal law, blight, oath or court permission changes the site. |
| dungeon.realm.verdant.rot_heart | Rot-Heart Grove | Living routes, seasonal law, blight, oath or court permission changes the site. |
| dungeon.realm.verdant.seasonal_vaults | Seasonal Vaults | Living routes, seasonal law, blight, oath or court permission changes the site. |

# 22. Core Boss and Major-Threat Scope

| Stable ID | Threat | Core Role |
| --- | --- | --- |
| boss.overworld.forest.root_crowned_behemoth | Root-Crowned Behemoth | Selected regional, ecological, historical, magical or infrastructure threat with alternative outcomes. |
| boss.overworld.swamp.mire_sovereign | Mire Sovereign | Selected regional, ecological, historical, magical or infrastructure threat with alternative outcomes. |
| boss.overworld.highland.stormglass_wyvern | Stormglass Wyvern | Selected regional, ecological, historical, magical or infrastructure threat with alternative outcomes. |
| boss.overworld.deepstone.worldburrower | Worldburrower | Selected regional, ecological, historical, magical or infrastructure threat with alternative outcomes. |
| boss.overworld.battlefield.bannerless_host | Bannerless Host | Selected regional, ecological, historical, magical or infrastructure threat with alternative outcomes. |
| boss.overworld.leyline.leyline_weaver | Leyline Weaver | Selected regional, ecological, historical, magical or infrastructure threat with alternative outcomes. |
| boss.overworld.machine_wilderness.ironwood_titan | Ironwood Titan | Selected regional, ecological, historical, magical or infrastructure threat with alternative outcomes. |
| boss.overworld.glacier.pale_glacier_worm | Pale Glacier Worm | Selected regional, ecological, historical, magical or infrastructure threat with alternative outcomes. |

## 22.1 Verdant realm authorities

| Stable ID | Authority | Realm Aftermath |
| --- | --- | --- |
| boss.realm.verdant.seasonal_regent | Seasonal Regent | Changes season, blight, borders, living architecture, migration or realm politics. |
| boss.realm.verdant.rot_crowned_hart | Rot-Crowned Hart | Changes season, blight, borders, living architecture, migration or realm politics. |
| boss.realm.verdant.oathbreaker_thorn | Oathbreaker Thorn | Changes season, blight, borders, living architecture, migration or realm politics. |

Each boss requires evidence, warning, safe observation, accessible counterplay, at least one non-kill or materially different resolution where source-supported, contextual rewards, persistent aftermath and save-safe uniqueness. Bosses may not be guaranteed at fixed coordinates or fixed days.

# 23. Core Structures, Routes and Infrastructure

The selected structure portfolio contains reusable settlement, production, trade, defence, magic and civic foundations. Culture, state and material variants should multiply presentation without multiplying executable definitions unnecessarily.

| Stable ID | Foundation |
| --- | --- |
| structure.overworld.civic.assembly_house | Assembly House |
| structure.overworld.civic.public_granary | Public Granary |
| structure.overworld.civic.communal_kitchen | Communal Kitchen |
| structure.overworld.civic.infirmary | Civic Infirmary |
| structure.overworld.civic.schoolhouse | Schoolhouse |
| structure.overworld.civic.refuge_hall | Refuge Hall |
| structure.overworld.agriculture.fieldstead | Fieldstead |
| structure.overworld.agriculture.orchard_house | Orchard House |
| structure.overworld.agriculture.irrigation_station | Irrigation Station |
| structure.overworld.agriculture.pasture_station | Pasture Station |
| structure.overworld.agriculture.seed_vault | Seed Vault |
| structure.overworld.agriculture.forest_steward_lodge | Forest Steward Lodge |
| structure.overworld.industry.logging_camp | Logging Camp |
| structure.overworld.industry.quarry_complex | Quarry Complex |
| structure.overworld.industry.minehead_complex | Minehead Complex |
| structure.overworld.industry.smeltery | Smeltery |
| structure.overworld.industry.sawmill | Sawmill |
| structure.overworld.industry.clayworks | Clayworks |
| structure.overworld.industry.mana_refinery | Mana Refinery |
| structure.overworld.commerce.market_square | Market Square |
| structure.overworld.commerce.caravanserai | Caravanserai |
| structure.overworld.commerce.regional_warehouse | Regional Warehouse |
| structure.overworld.commerce.customs_post | Customs Post |
| structure.overworld.commerce.counting_house | Counting House |
| structure.overworld.navigation.wayhouse | Wayhouse |
| structure.overworld.navigation.milestone_chain | Milestone Chain |
| structure.overworld.navigation.toll_gate | Toll Gate |
| structure.overworld.navigation.roadside_shrine | Roadside Shrine |
| structure.overworld.navigation.switchback_station | Switchback Station |
| structure.overworld.navigation.bridgehouse | Bridgehouse |
| structure.overworld.defence.watchtower | Watchtower |
| structure.overworld.defence.gatehouse | Gatehouse |
| structure.overworld.defence.palisade_fort | Palisade Fort |
| structure.overworld.defence.beacon_station | Beacon Station |
| structure.overworld.defence.patrol_lodge | Patrol Lodge |
| structure.overworld.defence.refuge_bastion | Refuge Bastion |
| structure.overworld.magic.wardstone_circle | Wardstone Circle |
| structure.overworld.magic.mana_well | Mana Well |
| structure.overworld.magic.rune_workshop | Rune Workshop |
| structure.overworld.magic.leyline_observatory | Leyline Observatory |
| structure.overworld.magic.cleansing_house | Cleansing House |
| structure.overworld.magic.portal_sanctuary | Portal Sanctuary |
| structure.overworld.culture.public_library | Public Library |
| structure.overworld.culture.festival_ground | Festival Ground |
| structure.overworld.culture.language_house | Language House |

## 23.1 Route foundations

| Stable ID | Route |
| --- | --- |
| route.surface.local_trail | Local Trail |
| route.surface.farm_lane | Farm Lane |
| route.surface.village_street | Village Street |
| route.surface.regional_road | Regional Road |
| route.surface.pilgrim_way | Pilgrim Way |
| route.crossing.seasonal_ford | Seasonal Ford |
| route.crossing.stone_arch_bridge | Stone Arch Bridge |
| route.crossing.rope_suspension_bridge | Rope Suspension Bridge |
| route.crossing.switchback_pass | Switchback Pass |
| route.crossing.road_tunnel | Road Tunnel |
| route.industrial.minecart_line | Minecart Line |
| route.water.river_barge_lane | River Barge Lane |

The River Barge Lane is a bounded inland-water route. It does not admit full maritime shipping, ocean navigation or vessel physics into Core. Ferry and barge behaviour may be abstracted or use simple bounded craft until Set 26 provides authoritative vessel contracts.

No world wonder is required for Core Production. Wonders remain Full Release, Later Expansion or signature content after the supporting civilisation and technical systems are mature.

# 24. Core Resource, Loot and Material-Ecology Envelope

25F locks a **52-foundation resource/material envelope** and a **36-foundation loot/relic/trade-good envelope**. Exact IDs, item forms, refinements and recipes remain owned by 25J and the replacement versions of Documents 03-06.

| Resource Package | Target Foundations | Mandatory Coverage |
| --- | --- | --- |
| Survival and building basics | 8 | Wood, stone, soil/clay, sand/glass inputs, fibre, fuel, water handling and common food inputs. |
| Timber, botanical and agricultural | 8 | Selected biome woods, crops, herbs, dyes, medicine and renewable materials. |
| Ore, mineral and stone | 8 | Copper, iron, coal/charcoal support, stone families, salt, crystal and construction minerals. |
| Refined and machine materials | 7 | Ingots, plates, gears, frames, glass, ceramics and maintenance materials. |
| Magic and mana | 6 | Raw mana, shards/dust, rune substrate, ward/cleansing and stable storage inputs. |
| Creature resources | 5 | Food, fibre/hide, bone/chitin, magical/ecological reagent and trophy/provenance classes. |
| Culture and trade goods | 5 | Food surplus, route goods, repair parts, medicinal goods and archival/knowledge goods. |
| Verdant realm resources | 5 | Living wood, seedcraft, pollen/seasonal, cleansing/rot and covenant-linked materials with Overworld utility. |

The resource progression model is capability-based. Bronze is recommended as a regional or specialist branch rather than a compulsory universal rung. Mana Crystal remains a parallel magical infrastructure resource rather than a simple sequential metal tier.

Loot rarity must not automatically mean power. Exact scarcity, quality, condition, provenance and significance semantics remain for 25I-25J and the Items Registry replacement.

# 25. Core History, Story, Event and Dynamic-State Envelope

| Foundation Class | Core Target | Required Roles |
| --- | --- | --- |
| Historical incidents | 24 | Settlement foundation, route change, ecological disruption, conflict, disaster, discovery, migration and realm contact. |
| Story arc families | 14 | Civilisation growth, faction conflict, site restoration, boss pressure, practical magic, automation consequence and realm path. |
| Event families | 36 | Needs, trade, migration, raids/sieges, disasters, ecology shifts, shortages, festivals, discoveries, portal and aftermath events. |
| Dynamic state profiles | 18 | Prosperous, strained, damaged, occupied, abandoned, restored, corrupted, cleansed, contested, flooded, isolated and route/realm states. |

Generated events bind only to existing valid actors, places, capabilities and histories. They may not invent a named villain, village, dungeon, route or resource that is absent from the world manifest.

The Core slice requires at least one persistent history chain that links a settlement, route, site, ecology pressure and player outcome. It does not require a fixed main quest or one canonical world history.

# 26. Four-Pillar Gameplay Proof

| Pillar | Core Production Proof | Cross-System Evidence |
| --- | --- | --- |
| Survival Sandbox | Gathering, shelter, food, tools, terrain editing, building and environment risk work across several seed starts. | Blocks/items/recipes, world profiles, climate, storage and saves. |
| Civilisation Sandbox | Multiple cultures and settlements have needs, jobs, production, trade, projects, danger, memory and growth. | NPC/village records, warehouses, factions, routes, events and aftermath. |
| Automation / Factory | Copper-to-iron mechanical production and basic mana support scale real material flows into settlement use. | Machine blocks, logistics, power, permissions, conservation and LOD. |
| Fantasy RPG | Practical magic, dungeons, bosses, factions, knowledge, gear, quests/events and a complete realm create adventure. | Magic, combat, sites, Verdant Covenant, Codex and progression. |

A pillar cannot be declared proven by a disconnected showcase. The Core acceptance playthrough must demonstrate at least one chain in which gathering, crafting, automation or magic changes a settlement or world-state outcome.

# 27. Progression, Capability and Fallback Obligations

| Capability Band | Core Providers | Fallback Rule |
| --- | --- | --- |
| Immediate survival | Local wood/fibre/stone/food/water-access equivalents. | Seed repair or substitute tags ensure a safe starting capability without fixed items. |
| Early tools and shelter | Hand crafting, basic work surface, common construction and fuel. | Multiple material equivalents; no named biome dependency. |
| Copper mechanisms | Mine/trade/salvage copper capability, gears/plates and basic power/logistics. | At least two provider paths among local extraction, trade, salvage and site restoration. |
| Iron settlement support | Iron or capability-equivalent structural and tool materials. | Regional trade or restored industry when local ore is inaccessible. |
| Practical mana | Leyline, crystal, mage, ruin or research access. | At least two discovery families; no guaranteed named mage or ruin. |
| Regional adventure | Valid site and threat paths matched to player capability. | Worldgen selects alternatives if a site family is excluded. |
| Realm access | Verdant route, stabilisation, safe return and required knowledge/materials. | Multiple route families; no fixed portal coordinate. |

Progression proofs must be generated for all three world profiles and for representative pack configurations. A valid proof records the exact providers used rather than assuming the preferred content exists.

# 28. Physical Registry Obligations

Before the selected Atlas scope can enter implementation, 25H-25J and the replacement registries must establish:

- block families for every selected terrain, structure, state, resource, machine, magic and realm surface;
- item forms for placeable blocks, raw/refined resources, tools, gear, food, goods, drops, knowledge and realm materials;
- recipes and project transformations with exact inputs, outputs, substitutions, by-products, time, power, labour and permissions;
- resource provenance, grades, purity, ownership, recycling and world extraction consequences;
- station, machine and warehouse interfaces;
- drops and rewards that preserve ecology, ownership, claims and contextual meaning;
- validator-ready cross-links and migration aliases.

No content package may advance to Integrated using placeholder resources that do not conserve or map to real gameplay definitions.

# 29. Forge, Asset and Presentation Scope

| Asset Layer | Core Obligation |
| --- | --- |
| Terrain/material kits | Reusable 32x32 base textures, states, biome variation and realm overlays for selected families. |
| Culture kits | Six culture kits with shared structural grammar and environment adaptation. |
| Creature body/rig kits | Shared ambient, quadruped, herd, predator, insect/swarm, construct and Verdant families. |
| Dungeon/structure kits | Natural cave, ruin, mine/industry, sacred/tomb, military/urban and living-Verdant room kits. |
| Boss presentation | Distinct silhouette, telegraphs, remains/evidence, state changes, sockets, audio and VFX hooks. |
| UI/icon/map | Icons, map symbols, Codex presentation, warnings, state markers and accessibility alternatives. |
| Audio/VFX integration | Minimal event, socket and attachment contracts; dedicated authoring tools are not prerequisites. |

25K will estimate actual asset counts and production budgets. 25F only prevents scope from silently expanding beyond the selected family envelopes.

# 30. UI, Saves, LOD, Performance and Multiplayer Scope

## 30.1 UI and accessibility

- keyboard/mouse and controller are Core input targets;
- map, journal, Codex, inventory, crafting, settlement, automation, magic and realm-route interfaces must support the selected slice;
- colour, audio and motion cues require non-colour and non-audio alternatives where gameplay-critical;
- touch input remains an architecture consideration but is not required as the first Windows milestone unless separately approved.

## 30.2 Saves and migration

- production save compatibility begins at the post-POC baseline;
- world manifests preserve selected packs, versions, definitions and generation lineage;
- explored chunks do not regenerate simply because Atlas content or packs change;
- unavailable optional content is quarantined rather than deleted or reinterpreted;
- Verdant realm state and return routes persist atomically.

## 30.3 Simulation LOD and performance

Every selected civilisation, ecology, automation, site, boss and realm package must declare full, reduced and abstract simulation. Numeric budgets remain owned by the Document 18 replacement, but no selected package may assume full actor simulation at world scale.

## 30.4 Multiplayer milestone recommendation

Core requires multiplayer-ready authority, deterministic identities, ownership/permission fields and representative host/client tests. The recommended first Core milestone is **solo-first**. Public online co-op, matchmaking, host migration and full split-screen certification move to Early Access or a later milestone unless the Document 18 feasibility plan proves they can be included without displacing world, save or civilisation reliability.

# 31. Classification of Unselected Atlas Content

| Atlas Domain | Unselected Default Treatment |
| --- | --- |
| 24B surface biomes | Early Access or Full Release, prioritised by transition gaps and asset reuse. |
| 24C open ocean, deep sea, reefs and marine civilisation | Set 26 / Later Expansion; Tooling Research where fluid or vessel technology is blocking. |
| 24C skylands and aerial routes | Early Access or Tooling Research depending on flight, physics and streaming burden. |
| 24C additional underground/special regions | Early Access, Full Release or Tooling Research by unique mechanics. |
| 24D remaining realms | Full Release, Later Expansion or Tooling Research according to complete realm contract and technology. |
| 24E remaining cultures/ancestries/settlements | Early Access or Full Release; maritime foundations coordinate with Set 26. |
| 24F remaining creatures | Early Access/Full Release; free-flight, marine, swarm and unusual locomotion may be Tooling Research. |
| 24G remaining sites and megadungeons | Early Access/Full Release; cross-realm/mobile megadungeons are Later Expansion or Tooling Research. |
| 24H remaining bosses/titans | Early Access/Full Release; world-scale titans and marine/naval threats follow relevant expansion readiness. |
| 24I wonders and advanced infrastructure | Full Release or Later Expansion after supporting civilisation and technical systems mature. |
| 24J unused materials/relics/goods | Follow the content package that gives them a valid world role and physical chain. |
| 24K unused histories/arcs/events/states | Follow the systems and content packages they bind; no orphan narrative foundations. |

# 32. Early Access Portfolio

- broader climates including tropical, savanna, arid and stronger polar coverage;
- additional culture and ancestry foundations, including Orcs and Mycelians where asset/representation work is ready;
- city-stage settlement systems and mature regional trade routes;
- additional dungeons, regional bosses and one second complete realm;
- full Ancestral Veil or another approved second realm after complete package review;
- more advanced automation, magic schools, restoration and faction change;
- playable network co-op or split-screen milestone after authority, performance and UI validation;
- bounded skyland content if traversal technology is stable.

# 33. Full Release Portfolio

- broad natural and magical Overworld diversity drawn from a curated portion of 24B/24C;
- several complete major realms rather than many partial portals;
- multiple ancestry/personhood types and culture/government combinations;
- city, capital and advanced player-settlement systems;
- mature diplomacy, law, trade, migration, war, memory and world chronicle;
- regional, dungeon, siege, titan and realm threat portfolios;
- stable Forge-supported content production and safe official/data-pack extension.

# 34. Later Expansion, Tooling Research and Archived Validation

| Class | Representative Content |
| --- | --- |
| Later Expansion | Set 26 maritime/naval gameplay; new realm packs; themed cultures; major megadungeons; world-scale threats; advanced creation systems. |
| Tooling Research | Full fluid simulation, mobile voxel vessels, moving interiors, free-flight ecosystems, gravity/void worlds, region-scale migrations, world titans and capital-scale populations. |
| Archived Validation | Forest Hamlet, fixed valley, named POC villagers, watchtower project, scripted goblin raid, fixed cave/ruin/camp arrangement, fixed portal destination and their protected regression fixtures. |

Tooling Research is not a rejection of the fantasy. It is a promise not to ship or advertise a shallow substitute before the required technology and validation exist.

# 35. Set 26 Package Classification Recommendations

| Document | Working Responsibility | Recommended Production Treatment |
| --- | --- | --- |
| 26A | Vision, authority and integration foundation | Core governance dependency / Specified before final 25L closure |
| 26B | Water, liquid and fluid overhaul | Tooling Research until representative deterministic performance spike passes |
| 26C | Oceans, coasts, islands and underwater worldgen | Later Expansion; selected coast compatibility in Core base |
| 26D | Wind, waves, tides, currents and storms | Tooling Research, then Later Expansion |
| 26E | Swimming, diving and underwater interaction | Basic safety in Core base; full package Later Expansion |
| 26F | Voxel vessel architecture and commissioning | Tooling Research, then Later Expansion |
| 26G | Buoyancy, propulsion, steering and navigation | Tooling Research, then Later Expansion |
| 26H | Shipwright construction, repair, refit and salvage | Later Expansion conditional on 26F-26G |
| 26I | Vessel Forge and blueprint variants | Tooling Research / Later Expansion conditional on Forge readiness |
| 26J | Ports, harbours, shipyards, crews and maritime civilisation | Later Expansion |
| 26K | Trade, fleets, piracy, navies and maritime power | Later Expansion |
| 26L | Naval combat, boarding, flooding, fire and siege | Later Expansion conditional on authority and damage validation |
| 26M | Marine ecology, fishing, sea creatures, sites and bosses | Later Expansion; some shore ecology may be separately admitted |
| 26N | Maritime progression and registry integration | Follows admitted packages; cannot be classified independently |
| 26O | UI/UX, multiplayer, technical, performance, QA and integration | Required closure package for every admitted Set 26 feature |

These are milestone recommendations, not a reduction of the approved Set 26 design programme. 26A may propose a different staged shipping topology with explicit cost, dependency and migration evidence for Ash to approve.

# 36. Dependency, Cost and Readiness Risks

| Risk | Early Warning | Required Response |
| --- | --- | --- |
| Core remains too broad | 25G cannot close physical I/O or asset contracts within selected envelopes. | Remove duplicate packages before adding detail. |
| Verdant realm becomes a second full game | Realm requires unique versions of every system and asset. | Use shared contracts, derived variants and a bounded realm progression band. |
| Culture breadth exceeds presentation budget | Six cultures require fully bespoke every object. | Use shared structural kits plus signature civic/sacred pieces. |
| Creature roster exceeds rig/AI budget | Too many unique body plans or locomotion systems. | Substitute species within existing body/AI families. |
| Megadungeon swallows production | Root-Below requires complete continent-scale content. | Ship bounded districts and expandable grammar, not an exhaustive authored world. |
| Maritime work blocks land Core | Core tasks depend on vessel or full fluid technology. | Restore the base-compatibility boundary and defer dependent package. |
| Progression still assumes named content | Tests rely on one culture, teacher, ruin or ore. | Replace with capabilities and multiple provider groups. |
| Multiplayer displaces save/world reliability | Network certification dominates foundational work. | Keep authority contracts; move playable breadth later. |
| POC identities survive in implementation | Fixed names, coordinates or scripted sequence reappear. | Block build through archive-leak validation. |

# 37. Scope Change, Substitution and Deferral Rules

| Request | Required Evidence |
| --- | --- |
| Add a Core foundation | Identity proof not already covered, full dependency impact, displaced work, asset cost, validation cost and Ash approval. |
| Replace a selected foundation | Capability equivalence, seed coverage, representation review and no increased migration risk. |
| Reduce a target count | Proof that the smaller package remains ecologically, physically and progression-complete. |
| Promote Tooling Research | Representative prototype, measured budget, save/authority plan and acceptance suite. |
| Promote Set 26 content into Core | 26A ownership, relevant technical contracts, complete physical/asset dependencies and replacement of equivalent Core work. |
| Defer a selected package | Fallback provider, impact on four-pillar proof, revised acceptance matrix and milestone owner. |

# 38. Core Production Acceptance Gate

| Gate Area | Pass Requirement |
| --- | --- |
| Scope | All selected packages have owners, tier, risk, dependency and acceptance records; no unapproved intake remains. |
| World | Representative seeds produce connected regions, transitions, quiet space, safe starts and no POC content. |
| Civilisation | Multiple cultures and settlement forms function through real resources, production, memory and state. |
| Ecology | Selected populations, nests/pressure, migration or bounded movement, predator/prey and settlement interactions work across LOD. |
| Adventure | Selected sites and threats support discovery, alternatives, rewards, safe return and persistent aftermath. |
| Realm | Verdant Covenant functions as a complete package and the teaser route cannot trap or block progression. |
| Physical | Blocks, items, resources, recipes, structures and rewards are cross-linked and conserve transactions. |
| Runtime | Saves, migration, authority, LOD, streaming and performance pass the approved evidence profiles. |
| Presentation | Assets, icons, UI, audio/VFX hooks, accessibility and provenance are complete for selected packages. |
| Governance | Deferred content, Set 26 integration debt, waivers and open decisions are explicit; Ash approves milestone status. |

# 39. Decisions Locked or Proposed by 25F

| Decision | Draft Status |
| --- | --- |
| Use the Living Frontier Network as an internal non-canonical planning label. | Proposed |
| Select the seven listed macro-regions, twenty surface biomes and eighteen vertical/special foundations. | Proposed scope lock |
| Select Verdant Covenant as the first fully playable realm. | Proposed major decision |
| Select Ancestral Veil as a safe teaser route only. | Proposed major decision |
| Select the listed five ancestry/personhood foundations and six cultures. | Proposed scope lock |
| Use the canonical settlement taxonomy with Fortified as a branch/state. | Proposed resolution |
| Support Camp through Town in Core; City and above later. | Proposed |
| Treat Bronze as a branch and Mana Crystal as parallel progression. | Proposed direction for 25G/25J |
| Keep full Set 26 maritime gameplay outside the first Core milestone while preserving base compatibility. | Proposed major decision |
| Require solo-first Core with multiplayer-ready authority; playable multiplayer later unless feasibility proves affordable. | Proposed major decision |
| Freeze new Core foundation intake after 25F approval. | Required governance result |

Ash may approve the complete draft, approve with amendments, or return specified sections for revision. Proceeding to 25G should be treated as acceptance of the scope unless Ash records a contrary decision.

# 40. Handoff to Document 25G

Document 25G must transform every selected package into an explicit dependency and progression matrix. For each package it must record:

- canonical owner and stable package identity;
- required and optional references;
- capability offers and requirements;
- suitability, exclusions and candidate selection;
- physical block/item/resource/recipe inputs and outputs;
- NPC, settlement, ecology, combat, magic, automation, quest and UI relationships;
- fallback providers and repair behaviour;
- asset, socket, audio, VFX, icon and Codex obligations;
- simulation LOD, save, migration and authority class;
- validation suite, seed coverage, performance class and acceptance evidence;
- production tier, lifecycle status, owner, risk and deferral trigger.

25G must identify any selected package that is not dependency-complete on paper. It may recommend removal or substitution; it may not silently invent missing systems or expand Core scope.

# Appendix A. Core Production Roster

## A.1 World and environment roster

| Class | Selected IDs |
| --- | --- |
| Macro-regions | region.temperate.river_basin; region.temperate.broadleaf_heartland; region.temperate.moorland_marches; region.boreal.lake_shield; region.wetland.flood_basin; region.highland.alpine_watershed; region.geothermal.riftlands |
| Surface biomes | biome.surface.temperate.lowland_meadow; biome.surface.temperate.rolling_pasture; biome.surface.temperate.river_prairie; biome.surface.temperate.heather_moor; biome.surface.forest.mixed_broadleaf; biome.surface.forest.ancient_oakwood; biome.surface.forest.evergreen_pine; biome.surface.forest.mistwood; biome.surface.boreal.sprucewood; biome.surface.boreal.cold_meadow; biome.surface.wetland.reed_marsh; biome.surface.wetland.peat_bog; biome.surface.wetland.floodplain; biome.surface.wetland.quaking_mire; biome.surface.mountain.foothill_woodland; biome.surface.mountain.rolling_highland; biome.surface.mountain.rocky_upland; biome.surface.mountain.alpine_meadow; biome.surface.volcanic.geothermal_springs; biome.surface.karst.limestone |
| Vertical/special | coast.rocky.sheltered_cove; coast.rocky.shingle_shore; coast.wet.salt_marsh; coast.wet.estuary; underground.shallow.limestone; underground.shallow.root_cave; underground.shallow.minework; underground.cavern.fungal; underground.cavern.rootworld; underground.cavern.crystal; underground.water.river; underground.water.lake; underground.deep.deepstone; underground.deep.machine_strata; special.leyline.meadow; special.spirit.grove; special.ancient.roadland; special.realm.verdant_leak |
| Playable realm | realm.major.verdant_covenant |
| Teaser route | realm.major.ancestral_veil threshold only |

## A.2 Civilisation roster

| Class | Selected IDs |
| --- | --- |
| Ancestry/personhood | ancestry.human; ancestry.goblin; ancestry.dwarf; ancestry.elf.kindred; ancestry.construct.awakened |
| Cultures | culture.hearthland.commons; culture.marchroad.leagues; culture.brassroot.communes; culture.deepstone.compacts; culture.mirelight.covenants; culture.verdant.pact_enclaves |
| Factions | faction.local_council; faction.merchant_league; faction.craft_guild; faction.mage_order; faction.military_order; faction.frontier_company; faction.caravan_federation; faction.personhood_league; faction.raider_clan; faction.realm_embassy |
| Settlements | settlement.camp.temporary; settlement.hamlet.rural; settlement.village.general; settlement.village.fortified; settlement.town.market; settlement.town.river; settlement.town.mining; settlement.enclave.mage; settlement.stilt; settlement.hall.underground |

## A.3 Ecology and adventure roster

| Class | Selected IDs |
| --- | --- |
| Overworld creatures | creature.overworld.lantern_gnat; creature.overworld.threadwing_moth; creature.overworld.riverglass_skater; creature.overworld.pebbleback; creature.overworld.hush_cricket; creature.overworld.ember_ant; creature.overworld.skyseed_drifter; creature.overworld.grave_beetle; creature.overworld.meadowhorn; creature.overworld.briarback_deer; creature.overworld.stonewool_ram; creature.overworld.mire_grazer; creature.overworld.frostmane_elk; creature.overworld.cliffback_ibex; creature.overworld.gloamcat; creature.overworld.silverfang_packhound; creature.overworld.mirecoil; creature.overworld.rootmaw_bear; creature.overworld.stormclaw; creature.overworld.reed_serpent; creature.overworld.scrap_jackal; creature.overworld.bonepicker_crow; creature.overworld.crop_gnawer; creature.overworld.mana_tick; creature.overworld.rotfly_swarm; creature.overworld.tunnel_snatcher; creature.domestic.hearthhen; creature.domestic.woolhorn; creature.domestic.burdenback; creature.domestic.tunnel_mole; creature.magic.ley_mote; creature.spirit.hearth_spirit; creature.magic.raincaller_frog; creature.magic.rune_antler; creature.undead.hollow_walker; creature.undead.grave_root; creature.corruption.blight_hound; creature.corruption.canker_swarm; creature.subterranean.cavern_weaver; creature.subterranean.crystal_burrower; creature.subterranean.deepfin; creature.construct.ward_hound; creature.construct.quarry_crawler; creature.construct.runic_custodian |
| Verdant creatures | creature.realm.verdant.oathstag; creature.realm.verdant.pollen_drake; creature.realm.verdant.seasonal_fox; creature.realm.verdant.thornbound_hunter; creature.realm.verdant.rotcap_colony |
| Overworld sites | dungeon.overworld.natural.echo_limestone; dungeon.overworld.natural.worldroot_galleries; dungeon.overworld.natural.basalt_lava_tubes; dungeon.overworld.natural.colossal_remains; dungeon.overworld.ruin.waystation; dungeon.overworld.ruin.hill_hamlet; dungeon.overworld.ruin.river_village; dungeon.overworld.ruin.orchard_estate; dungeon.overworld.mine.copper_layers; dungeon.overworld.mine.deep_ironworks; dungeon.overworld.mine.crystal_purity; dungeon.overworld.industry.mechanist_foundry; dungeon.overworld.tomb.clan_barrows; dungeon.overworld.tomb.battlefield_ossuary; dungeon.overworld.sacred.leyline_pilgrimage; dungeon.overworld.sacred.broken_covenant; dungeon.overworld.tower.surveyor; dungeon.overworld.tower.mage_observatory; dungeon.overworld.military.frontier_hillfort; dungeon.overworld.urban.buried_market; megadungeon.overworld.root_below_kingdoms |
| Verdant sites | dungeon.realm.verdant.living_palace_roots; dungeon.realm.verdant.broken_covenant_gardens; dungeon.realm.verdant.thorn_hunt; dungeon.realm.verdant.rot_heart; dungeon.realm.verdant.seasonal_vaults |
| Overworld bosses | boss.overworld.forest.root_crowned_behemoth; boss.overworld.swamp.mire_sovereign; boss.overworld.highland.stormglass_wyvern; boss.overworld.deepstone.worldburrower; boss.overworld.battlefield.bannerless_host; boss.overworld.leyline.leyline_weaver; boss.overworld.machine_wilderness.ironwood_titan; boss.overworld.glacier.pale_glacier_worm |
| Verdant authorities | boss.realm.verdant.seasonal_regent; boss.realm.verdant.rot_crowned_hart; boss.realm.verdant.oathbreaker_thorn |

## A.4 Structure and route roster

| Class | Selected IDs |
| --- | --- |
| Structures | structure.overworld.civic.assembly_house; structure.overworld.civic.public_granary; structure.overworld.civic.communal_kitchen; structure.overworld.civic.infirmary; structure.overworld.civic.schoolhouse; structure.overworld.civic.refuge_hall; structure.overworld.agriculture.fieldstead; structure.overworld.agriculture.orchard_house; structure.overworld.agriculture.irrigation_station; structure.overworld.agriculture.pasture_station; structure.overworld.agriculture.seed_vault; structure.overworld.agriculture.forest_steward_lodge; structure.overworld.industry.logging_camp; structure.overworld.industry.quarry_complex; structure.overworld.industry.minehead_complex; structure.overworld.industry.smeltery; structure.overworld.industry.sawmill; structure.overworld.industry.clayworks; structure.overworld.industry.mana_refinery; structure.overworld.commerce.market_square; structure.overworld.commerce.caravanserai; structure.overworld.commerce.regional_warehouse; structure.overworld.commerce.customs_post; structure.overworld.commerce.counting_house; structure.overworld.navigation.wayhouse; structure.overworld.navigation.milestone_chain; structure.overworld.navigation.toll_gate; structure.overworld.navigation.roadside_shrine; structure.overworld.navigation.switchback_station; structure.overworld.navigation.bridgehouse; structure.overworld.defence.watchtower; structure.overworld.defence.gatehouse; structure.overworld.defence.palisade_fort; structure.overworld.defence.beacon_station; structure.overworld.defence.patrol_lodge; structure.overworld.defence.refuge_bastion; structure.overworld.magic.wardstone_circle; structure.overworld.magic.mana_well; structure.overworld.magic.rune_workshop; structure.overworld.magic.leyline_observatory; structure.overworld.magic.cleansing_house; structure.overworld.magic.portal_sanctuary; structure.overworld.culture.public_library; structure.overworld.culture.festival_ground; structure.overworld.culture.language_house |
| Routes | route.surface.local_trail; route.surface.farm_lane; route.surface.village_street; route.surface.regional_road; route.surface.pilgrim_way; route.crossing.seasonal_ford; route.crossing.stone_arch_bridge; route.crossing.rope_suspension_bridge; route.crossing.switchback_pass; route.crossing.road_tunnel; route.industrial.minecart_line; route.water.river_barge_lane |

# Appendix B. Atlas Volume Classification Summary

| Volume | Core Selection | Later Portfolio |
| --- | --- | --- |
| 24A | All procedural, relationship, fallback and package-foundation rules required by Core. | Additional advanced topology modules as systems mature. |
| 24B | Seven macro-regions and twenty surface biomes. | Remaining surface families to Early Access/Full Release. |
| 24C | Four coast-edge, ten underground and four special foundations. | Open ocean/deep marine to Set 26; sky/complex special to later tiers. |
| 24D | Verdant Covenant full; Ancestral Veil teaser. | Other realms by Full Release/Later Expansion/Tooling classification. |
| 24E | Five personhood foundations, six cultures, ten factions and ten settlements. | Remaining foundations by representation, asset and system readiness. |
| 24F | Forty-four Overworld and five Verdant creature foundations plus variants. | Remaining ecology according to body, locomotion and system packages. |
| 24G | Twenty standard Overworld sites, one megadungeon seed family and five Verdant sites. | Remaining sites/megadungeons by milestone and technology. |
| 24H | Eight Overworld threats and three Verdant authorities. | Remaining bosses/titans by adventure breadth and technical readiness. |
| 24I | Forty-five structures and twelve routes; no Core wonder. | Advanced infrastructure and wonders later. |
| 24J | Fifty-two resource/material and thirty-six loot/goods envelope. | Remaining materials follow selected content packages. |
| 24K | 24 incidents, 14 arcs, 36 events and 18 state profiles envelope. | Remaining narrative foundations follow systems and later content. |

# Appendix C. Set 26 Classification Register

| Document | Programme Status | 25F Tier Recommendation | Dependency Gate |
| --- | --- | --- | --- |
| 26A | Approved working Set 26 document | Core governance dependency / Specified before final 25L closure | Must consume 25B-25E and its relevant owning main documents. |
| 26B | Approved working Set 26 document | Tooling Research until representative deterministic performance spike passes | Must consume 25B-25E and its relevant owning main documents. |
| 26C | Approved working Set 26 document | Later Expansion; selected coast compatibility in Core base | Must consume 25B-25E and its relevant owning main documents. |
| 26D | Approved working Set 26 document | Tooling Research, then Later Expansion | Must consume 25B-25E and its relevant owning main documents. |
| 26E | Approved working Set 26 document | Basic safety in Core base; full package Later Expansion | Must consume 25B-25E and its relevant owning main documents. |
| 26F | Approved working Set 26 document | Tooling Research, then Later Expansion | Must consume 25B-25E and its relevant owning main documents. |
| 26G | Approved working Set 26 document | Tooling Research, then Later Expansion | Must consume 25B-25E and its relevant owning main documents. |
| 26H | Approved working Set 26 document | Later Expansion conditional on 26F-26G | Must consume 25B-25E and its relevant owning main documents. |
| 26I | Approved working Set 26 document | Tooling Research / Later Expansion conditional on Forge readiness | Must consume 25B-25E and its relevant owning main documents. |
| 26J | Approved working Set 26 document | Later Expansion | Must consume 25B-25E and its relevant owning main documents. |
| 26K | Approved working Set 26 document | Later Expansion | Must consume 25B-25E and its relevant owning main documents. |
| 26L | Approved working Set 26 document | Later Expansion conditional on authority and damage validation | Must consume 25B-25E and its relevant owning main documents. |
| 26M | Approved working Set 26 document | Later Expansion; some shore ecology may be separately admitted | Must consume 25B-25E and its relevant owning main documents. |
| 26N | Approved working Set 26 document | Follows admitted packages; cannot be classified independently | Must consume 25B-25E and its relevant owning main documents. |
| 26O | Approved working Set 26 document | Required closure package for every admitted Set 26 feature | Must consume 25B-25E and its relevant owning main documents. |

# Appendix D. Core Scope Change Request Template

| Field | Required Entry |
| --- | --- |
| Request ID | Stable change-record identity. |
| Requested by | Person or owning document. |
| Change type | Add, remove, substitute, reduce, promote or defer. |
| Affected packages | Stable IDs and owners. |
| Identity proof | Why the change is necessary to prove the final game. |
| Displaced work | What leaves or shrinks. |
| Dependency impact | Schemas, capabilities, packs, worldgen, systems and migration. |
| Asset impact | Models, textures, rigs, animation, audio/VFX, icons and Forge work. |
| Runtime impact | Save, LOD, authority, performance and networking. |
| Validation impact | Suites, seeds, fixtures, evidence and release gates. |
| Recommendation | Approve, reject, defer or request evidence. |
| Ash decision | Final authority and date. |

# Appendix E. Document 25F Acceptance Criteria

| Acceptance Area | Pass Condition |
| --- | --- |
| Authority | Locked source rules, recommendations and open decisions are clearly separated. |
| POC retirement | No retired POC identity is selected for production. |
| Core identity | Selected scope proves seed world, civilisation, ecology, adventure, four pillars and one full realm. |
| Budget discipline | Counts are bounded and justified by complete packages rather than quotas. |
| Atlas grounding | Selected foundations exist in 24B-24K or are explicitly target envelopes owned by later registries. |
| Set 26 boundary | Maritime compatibility is preserved without duplicating maritime design. |
| Deferrals | Unselected content has a clear tier or classification rule. |
| Handoff | 25G receives a clear roster and obligations. |
| Change control | Post-approval intake requires displaced work and Ash approval. |
| Human authority | Ash retains final scope and milestone authority. |

# Appendix F. Decision Register Updates

| Decision ID | Decision | Draft Status | Blocks |
| --- | --- | --- | --- |
| DEC-25F-001 | Approve the Living Frontier Network Core scope and intake freeze. | Pending Ash approval | 25G-25L and main-document revisions |
| DEC-25F-002 | Select Verdant Covenant as first fully playable realm. | Pending Ash approval | Realm worldgen, assets, progression and Document 14 revision |
| DEC-25F-003 | Select Ancestral Veil as teaser route only. | Pending Ash approval | Realm route and UI scope |
| DEC-25F-004 | Approve selected world, civilisation, ecology, site, boss and structure rosters. | Pending Ash approval | 25G-25K |
| DEC-25F-005 | Approve canonical settlement taxonomy and Core support through Town. | Pending Ash approval | Docs 07, 12, 17 |
| DEC-25F-006 | Approve Bronze branch and Mana Crystal parallel progression direction. | Pending Ash approval | 25G, 25J, Docs 03-06 |
| DEC-25F-007 | Keep full Set 26 maritime gameplay outside first Core milestone while preserving compatibility. | Pending Ash approval | Set 26 staging and 25L closure |
| DEC-25F-008 | Use solo-first Core with multiplayer-ready authority. | Pending Ash approval | Document 18 replacement |
| DEC-25F-009 | Use 52 resource/material and 36 loot/goods target envelopes. | Pending Ash approval | 25J |
| DEC-25F-010 | No Core world wonder is required. | Pending Ash approval | 25K asset scope |

> **Document 25F Completion Statement**  
> Leyforge now has a proposed, bounded first production content scope grounded in the World Content Atlas and governed by the registry, packaging and validation foundations of Documents 25A-25E. Approval of this document freezes Core intake and authorises Document 25G to prove whether every selected package is dependency-complete on paper before physical registries or implementation expand.
