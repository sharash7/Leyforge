# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26M - Marine Ecology, Fishing, Sea Creatures, Dungeons and Bosses

*Version 0.1 - Detailed Design Bible and Technical Foundation Draft*

A living-marine-world framework for habitat suitability, food webs, population cohorts, migration, spawning, fishing, aquaculture, creature behaviour, vessel interaction, ecological pressure, submerged sites, marine dungeon grammar, sea-monster encounters, boss territories, alternative resolutions, persistent aftermath and scalable simulation.

Working design document - marine ecology, fisheries, aquatic creatures, submerged exploration and marine boss foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Document 26M is the gameplay and data-contract authority for marine ecology, fisheries, aquaculture, marine creature behaviour, submerged site ecology and the execution framework for marine dungeons and bosses. |
| Core Philosophy | The ocean is a living system, not an empty travel surface or unlimited monster spawner. Creatures, harvests, routes, settlements, ports, storms, reefs, wrecks and bosses must arise from compatible habitats and leave persistent consequences. |
| Ecology Direction | Use deterministic regional ecology summaries, bounded population cohorts and detailed nearby entities. Food webs, carrying capacity, migration, reproduction, mortality, extraction and restoration remain inspectable and save-safe. |
| Fishing Direction | Fishing is an observation, preparation, timing, equipment, knowledge and stewardship activity. Rods, lines, nets, traps, spears, diving, vessel methods and aquaculture share conserved catches and ecological consequences. |
| Creature Direction | Marine creatures inherit the shared creature foundation while adding depth, pressure, salinity, current, temperature, oxygen, schooling, breaching, beaching, vessel and underwater interaction facets. |
| Dungeon Direction | Marine sites are generated from real topology, water state, history, ecology and access. Flooded ruins, wreck fields, sea caves, reef citadels, abyssal facilities and drowned cities remain persistent places rather than resettable loot rooms. |
| Boss Direction | Marine bosses are territorial, migratory or world-scale ecological actors. Encounters support study, avoidance, protection, cleansing, bargaining, redirection, rescue, sealing, capture or combat when fiction and personhood allow. |
| Content Boundary | World Content Atlas Set 24 owns named creature families, dungeons, bosses, histories and content identity. 26M defines executable system contracts, completeness rules and runtime behaviour without replacing Atlas authorship. |
| Combat Boundary | Document 16 owns personal combat and 26L owns vessel combat, damage and boarding. 26M owns creature-specific actions, ecological motives, territory and boss encounter logic, then calls those combat foundations. |
| Progression Boundary | 26N owns final maritime progression, registry population, recipes, magic, automation, economy, quests and events. 26M declares required capabilities, records, rewards, pressures and handoff contracts. |
| Technical Direction | Implement in Godot with data-driven Resources, sparse regional summaries, deterministic cohort simulation, representative physical entities, event-driven services and no Node-per-fish or Node-per-ecology-cell architecture. |
| Production Direction | All stable IDs, extension facets, relationships, capabilities, migrations, validation, evidence and package dependencies follow Document Set 25 governance. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION

# Document Purpose

Document 26M makes Leyforge's water spaces ecologically alive and mechanically worth inhabiting. Documents 26B through 26E establish water, ocean topology, weather and aquatic player interaction. Documents 26F through 26L establish vessels, ports, trade and conflict. This document supplies the living populations, harvest systems, submerged places and major marine entities that give those systems purpose beyond transportation.

The marine world must remain coherent at several scales. A tide pool can contain visible shell life and small prey. A kelp forest can support nurseries, grazers, ambush predators and managed harvest. A continental shelf can support seasonal schools, fishing fleets and reef settlements. An ocean gyre can carry plankton blooms and migratory titans. An abyssal trench can support sparse specialised life, vents, ancient facilities and pressure-bound guardians. Each layer consumes the same generated environment and changes through settlement, climate, extraction, pollution, magic, invasive species, bosses and player action.

Fishing is not a slot-machine interaction detached from ecology. The player reads signs, selects gear, method, location, depth, time, bait and weather, then resolves a physical or bounded catch interaction. Catches are real item instances or lots with species, size or class, condition, provenance and ownership. Excessive extraction, destructive methods, bycatch and habitat damage can reduce later availability, alter settlement economies and trigger law or story consequences. Conservation, hatcheries, aquaculture, habitat restoration and negotiated access are equally valid progression paths.

Submerged dungeons and marine bosses must also remain part of the living world. A wreck field may become a nursery, salvage site, smuggling route, memorial or predator territory. A reef guardian may protect biodiversity while threatening vessels. A migratory titan may change currents, fisheries and storms without being malicious. The game therefore records territory function, ecological role, warnings, alternative resolutions and aftermath before defining combat rewards.

# Design Sources, Authority and Supersession

| Source | Authority Consumed by 26M | 26M Boundary |
| --- | --- | --- |
| 00-02 - Master, Loop and Progression | Sandbox freedom, living civilisations, multi-track progression, consequence and scalable difficulty. | Marine play supports fishers, divers, naturalists, builders, captains, traders, rescuers, hunters and peaceful world-shapers. |
| 03-06 - Blocks, Items, Recipes and Resources | Stable block/item identities, harvest tools, containers, food, materials, processing, spoilage and conserved transactions. | 26M defines marine-facing facets and catch/harvest requirements without duplicating core registries. |
| 07-10 - NPCs, Automation, Magic and Creatures | Persistent entities, jobs, needs, networks, spells, creature AI, taming, ecology and simulation LOD. | Marine NPC work and creatures inherit shared foundations; 26M adds aquatic and ecological specialisation. |
| 11-17 - World through UI/UX | Biomes, structures, factions, dimensions, quests, combat and adaptive presentation. | 26M consumes those authorities and supplies marine-specific contracts, state and feedback. |
| 19-20 - Settlement and Buildings | Projects, facilities, services, seven needs, activation contracts and persistent structures. | Aquaculture, fish markets, hatcheries, research stations and habitat works use existing settlement truth. |
| 24C - Marine Biomes | Ocean basins, depth bands, habitats, water properties, structures and boss territories. | 26M consumes generated habitat and does not create a parallel ocean map. |
| 24F - Creature and Ecology Atlas | Creature families, ecology graphs, populations, lifecycle, migration, marine examples and boss ecology hooks. | 26M operationalises marine behaviour and population systems while preserving Atlas content ownership. |
| 24G - Dungeon Atlas | Marine site families, procedural grammar, ecology, hazards, restoration, megadungeons and boss sockets. | 26M defines marine execution extensions and does not replace general dungeon architecture. |
| 24H - Boss Atlas | Boss taxonomy, territories, encounters, alternatives, aftermath, succession and named marine foundations. | 26M adds marine-specific territory, water, vessel and ecological integration. |
| 24J - Material Ecology Atlas | Marine resources, creature materials, provenance, renewability, loot, trade, law and stewardship. | 26M creates harvesting and ecological source contracts; 24J/26N own final material entries and economy. |
| 25A-25L - Production Governance | Qualified IDs, schemas, packs, relationships, validation, migration and release evidence. | Every 26M definition enters through governed registries and content-pack gates. |
| 26B-26E - Water, World, Climate and Player | Fluid state, topology, environmental fields, swimming, diving, breath, pressure and rescue. | 26M consumes authoritative queries and never invents incompatible water or player systems. |
| 26F-26I - Vessels and Shipwright Systems | Vessel structure, motion, construction and authoring. | Creature-vessel contacts use declared components, collision and movement interfaces. |
| 26J-26K - Ports, Crews, Trade and Fleets | Fishing communities, crews, cargo, markets, routes, law and regional power. | 26M supplies catch availability and ecology evidence; strategic economy remains outside 26M. |
| 26L - Naval Combat | Vessel damage, weapons, boarding, rescue and tactical encounter resolution. | 26M supplies marine creature attacks, objectives, boss phases and ecological motives. |
| 26N-26O - Integration and Technical Consolidation | Final progression, registries, magic, automation, economy, quests, UI, multiplayer and performance decisions. | 26M declares dependencies and prototype values pending consolidation. |

# Static Table of Contents

1. Locked Marine Ecology Identity  

2. Design Principles and Experience Targets  

3. Explicit Non-Goals  

4. Source-of-Truth and Ownership Boundaries  

5. Canonical Terminology  

6. Marine Ecology State Architecture  

7. Habitat Suitability and Environmental Niches  

8. Water Properties, Seasonal Fields and Ecological Response  

9. Food Webs, Trophic Roles and Ecosystem Services  

10. Population Cohorts, Carrying Capacity and Density  

11. Lifecycle, Reproduction, Recruitment and Mortality  

12. Migration, Spawning Routes and Seasonal Aggregations  

13. Ambient Life, Schools, Shoals, Pods and Colonies  

14. Marine Creature Taxonomy and Capability Facets  

15. Aquatic Senses, Detection, Communication and Knowledge  

16. Movement, Buoyancy, Depth, Pressure and Respiration  

17. Behaviour, Morale, Sociality and Group Tactics  

18. Intertidal, Shoreline, Beaching and Amphibious Interaction  

19. Vessels, Ports, Settlements and Maritime Infrastructure  

20. Pollution, Extraction, Habitat Damage and Restoration  

21. Locked Fishing and Fisheries Identity  

22. Fishing Activity Lifecycle and Authoritative Transactions  

23. Fishing Methods and Capability Families  

24. Gear, Bait, Lures, Traps and Equipment Condition  

25. Fishing Opportunity, Knowledge, Signs and Forecasting  

26. Hooking, Netting, Landing, Escape and Catch Handling  

27. Catch Identity, Quality, Freshness, Processing and Storage  

28. Bycatch, Welfare, Conservation, Law and Ethical Choice  

29. Commercial Fishing, Fleet Operations and Regional Fisheries  

30. Aquaculture, Hatcheries, Kelp Farms and Managed Habitats  

31. Marine Resources, Specimens, Research and Material Harvest  

32. Creature Conflict, Hunting, Defence and Vessel Encounters  

33. Taming, Companions, Mounts and Working Marine Creatures  

34. Marine Events, Blooms, Migrations, Outbreaks and Strandings  

35. Marine Dungeon and Submerged Site Identity  

36. Marine Site Taxonomy and Atlas Foundation Families  

37. Placement, Access, Entrances, Water State and Procedural Assembly  

38. Traversal, Air, Pressure, Currents, Light and Expedition Safety  

39. Rooms, Hazards, Puzzles, Ecology and Environmental Storytelling  

40. Occupation, Factions, Survivors, Restoration and Persistent Site State  

41. Loot, Relics, Salvage, Knowledge and Anti-Farming Rules  

42. Marine Boss and Titan Identity  

43. Territory, Foreshadowing, Threat Clocks and Encounter Commitment  

44. Encounter Models for Surface, Underwater, Vessel and Mixed Spaces  

45. Atlas Marine Boss Foundations and System Hooks  

46. Alternative Resolutions, Aftermath, Succession and Ecological Rebalance  

47. Progression, Skills, Knowledge, Quests and 26N Handoff  

48. UI/UX, Accessibility, Comfort and Player Feedback  

49. Multiplayer Authority, Contribution and Conflict  

50. Simulation LOD, Persistence, Streaming and Reconciliation  

51. Registry, Schema, Relationship and Reason-Code Foundations  

52. Godot/Summer Engine Technical Boundaries  

53. Performance Budgets and Scalability Targets  

54. Prototype Laboratories, Acceptance Tests and Seed Suites  

55. Risks, Failure Modes and Redesign Triggers  

56. Production Classification and Relationship with Set 25  

57. Main-Document, Atlas and Forge Integration Matrix  

58. Decision Register  

59. Handoff to Document 26N  

Appendix A. Marine Ecology Definition Template  

Appendix B. Fishing Method and Catch Templates  

Appendix C. Marine Creature Facet Template  

Appendix D. Marine Site and Dungeon Template  

Appendix E. Marine Boss Territory and Encounter Template  

Appendix F. Validation Reason Codes  

Appendix G. Prototype and Acceptance Matrix  

Appendix H. Completion Checklist

# 1. Locked Marine Ecology Identity

Marine ecology is a persistent world system connecting water properties, habitats, organisms, settlements, vessels, fishing, trade, magic, dungeons, bosses and world history. It must remain understandable enough for ordinary players while preserving enough depth that actions have visible causes and consequences.

> **Locked Rule**  
> A marine population, catch, dungeon ecology or boss territory may only exist where compatible environment, history and relationship data support it. Nearby presentation may be rich and physical, but authoritative abundance, ownership, mortality, harvest and aftermath remain data-driven and persistent.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Living Habitat | Depth, substrate, light, temperature, salinity, oxygen, current, shelter and magic determine suitability. | Different waters visibly support different life rather than sharing one spawn table. |
| Ecological Network | Producers, grazers, predators, scavengers, decomposers and ecosystem engineers affect one another. | Removing or restoring one population can change later encounters and resources. |
| Civilisation Relationship | Fishing, aquaculture, ports, pollution, protection, law and trade interact with ecology. | Maritime communities feel dependent on local waters and accountable for their use. |
| Exploration Layer | Creatures, signs, sites and bosses guide travel, research and discovery. | The ocean contains readable goals beyond crossing it. |
| Persistent Consequence | Extraction, storms, corruption, boss outcomes and restoration alter populations and habitat states. | The world remembers exploitation and care. |
| Scalable Simulation | Detailed entities exist near players; cohorts and summaries exist at distance. | Very large oceans remain active without simulating every fish. |

# 2. Design Principles and Experience Targets

- **Habitat before spawn:** the environment selects compatible ecology packages before local encounter assembly.
- **Populations before loot:** catches and creature appearances draw from bounded ecological state rather than infinite random rolls.
- **Knowledge before certainty:** signs, instruments, local teaching and research improve predictions without revealing omniscient truth.
- **Stewardship has value:** conservation, aquaculture, rescue and restoration are progression paths, not moral decoration.
- **Creatures have motives:** hunger, migration, breeding, territory, injury, fear, curiosity, magic and faction handling shape behaviour.
- **Marine danger is readable:** depth, currents, predators, poison, pressure, storms and bosses expose clues and counterplay.
- **No ancestry determinism:** adaptation may provide advantages, but equipment, magic, vehicles, training and services provide alternatives.
- **No universal hostility:** wildlife may flee, investigate, tolerate, defend, hunt, bargain or cooperate according to valid profiles.
- **Sites belong to the world:** dungeons retain water state, ecology, ownership, damage, loot depletion and restoration outcomes.
- **Bosses change systems:** a major outcome must affect ecology, routes, settlements, weather, resources, law or knowledge.

## 2.1 Experience Bands

| Band | Expected Experience |
| --- | --- |
| Shore Foraging | Collect shellfish, seaweed and tide-pool resources while reading tides and habitat limits. |
| Recreational Fishing | Use simple line, bait and local signs for food, discovery and early trade. |
| Coastal Ecology | Track schools, kelp health, predators, spawning grounds and settlement pressures. |
| Commercial Fisheries | Operate vessels, gear, crews, storage and contracts under regional abundance and law. |
| Aquaculture | Build managed habitats, feed and maintain stock, control disease and protect water quality. |
| Marine Expedition | Dive through shelf waters, wrecks, caves and ruins with specialised gear and research goals. |
| Abyssal Exploration | Use pressure-rated infrastructure, lights, vehicles, magic and supply planning. |
| Boss Territory | Prepare for ecological, navigational, diplomatic or combat resolution around a major entity. |
| Restoration Programme | Repair reefs, clear pollution, reintroduce species and monitor long-term recovery. |

# 3. Explicit Non-Goals

- Simulating every fish, egg, plankton organism, water molecule or nutrient particle as an independent object.
- Treating fishing as a single random button press with no habitat, gear, knowledge or catch handling.
- Requiring real-world fisheries science, taxonomy or animal-handling complexity for ordinary play.
- Using unlimited respawns to erase overfishing, habitat damage or boss aftermath.
- Making every marine creature aggressive or every large animal a boss.
- Equating intelligence, morality, culture or hostility with biological ancestry.
- Letting aquaculture create items without feed, water, stock, labour, time, health and capacity.
- Allowing destructive extraction methods to remain consequence-free because the player is distant.
- Turning every submerged ruin into a permanently flooded combat corridor.
- Replacing Document 16 or 26L combat with a separate incompatible damage system.
- Making killing the only source of creature materials, boss rewards or progression.
- Hard-locking ordinary progression behind one rare fish, one unique creature or one lethal boss outcome.
- Running full pathfinding and AI for distant marine cohorts.
- Permitting procedural generators to invent named canonical species, relics or bosses outside approved packs.

# 4. Source-of-Truth and Ownership Boundaries

| Question | Owning Authority | 26M Responsibility |
| --- | --- | --- |
| What water, depth, substrate and marine biome exist here? | 26B-26D and 24C | Consume authoritative environmental and topology queries. |
| Which creature family or ecology package is authored? | 24F and approved registries | Resolve compatibility, populations and runtime behaviour. |
| How does the player swim, dive or drown? | 26E | Create creature and site hazards that call aquatic player capabilities. |
| How does a vessel move or take damage? | 26G and 26L | Supply contact forces, attacks, entanglement and encounter objectives. |
| Which catch item, food, material or recipe exists? | 03-06, 24J and 26N | Create source, quality, provenance and availability records. |
| What law, market or contract applies? | 26J-26K and faction/economy systems | Expose abundance, evidence, catch and ecological state. |
| How is a dungeon generally generated and persisted? | 24G and structure systems | Add marine access, water, ecology and expedition extensions. |
| Which boss is canonical and what world role does it have? | 24H | Execute marine territory and encounter contracts. |
| How are quests and events authored? | 15 and 26N | Emit conditions, objectives, evidence and aftermath hooks. |
| What final UI, networking and budgets ship? | 26O | Declare requirements and prototype targets. |

# 5. Canonical Terminology

| Term | Definition |
| --- | --- |
| Marine Region | Generated sea, coast, shelf, basin, trench or connected water region with shared environmental and historical context. |
| Habitat Patch | Bounded area with substrate, structure, exposure and resource properties used for local ecological suitability. |
| Ecology Package | Versioned set of compatible producer, consumer, predator, scavenger, hazard and resource relationships. |
| Population Cohort | Aggregated organisms sharing family, life stage, location, condition and behavioural state. |
| Representative Entity | Physical nearby creature instance representing part of a cohort without being the cohort record itself. |
| Carrying Capacity | Current supported abundance derived from habitat area, productivity, shelter, food, water and pressure. |
| Recruitment | New individuals entering a tracked life stage through reproduction, migration, stocking or transformation. |
| Migration Corridor | Persistent route graph used by seasonal, lifecycle, feeding, spawning or boss movement. |
| Spawning Ground | Protected or ordinary habitat supporting reproduction and juvenile recruitment. |
| School / Shoal | Coordinated or associated group of fish-like organisms represented visually and behaviourally near players. |
| Pod / Herd | Social group of larger marine creatures with persistent composition or cohort linkage. |
| Fishing Opportunity | Knowledge-aware local chance structure derived from actual abundance, behaviour, method and environment. |
| Fishing Method | Definition for rod, line, net, trap, spear, hand harvest, diving or vessel-scale capture. |
| Catch Record | Authoritative transaction linking source cohort, method, actor, location, time, condition, ownership and outputs. |
| Bycatch | Unintended organism, debris, protected life or non-target material captured by a method. |
| Aquaculture Site | Persistent managed habitat with stock, capacity, feed, water, health, labour, infrastructure and outputs. |
| Marine Site | Submerged, tidal, coastal or floating dungeon/structure instance with water and ecological extensions. |
| Boss Territory | Persistent spatial and relational state controlled or influenced by a boss, titan or guardian. |
| Ecological Aftermath | Saved population, habitat, route, settlement, law and resource changes following a major event. |
| Conservation Rule | Faction, settlement, world-setting or ecological restriction governing methods, seasons, sizes or zones. |

# 6. Marine Ecology State Architecture

The authoritative model uses layered state. Static definitions describe possible ecology. Generated habitat records describe local suitability. Population cohorts carry changing abundance and condition. Representative entities provide physical play. Evidence and knowledge records control what players and NPCs believe.

| Layer | Primary Data | Update Pattern |
| --- | --- | --- |
| Definition | Creature family facets, ecology package, habitat requirements, trophic links, migration rules. | Validated at content load; immutable for a released revision. |
| Generated Baseline | Marine region, habitat patches, productivity, historical pressure, native ecology selection. | Deterministic at world generation and regenerated only through migration-safe worldgen rules. |
| Regional Summary | Population cohorts, biomass class, recruitment, mortality, extraction, disease, invasive pressure. | Coarse scheduled simulation. |
| Local Active State | Representative entities, schools, nests, traps, catches, immediate predation and hazards. | Event-driven and frame/tick bounded near players. |
| Persistent Delta | Depletion, restoration, pollution, site occupation, boss territory, introduced populations and laws. | Saved and replayed over generated baseline. |
| Knowledge | Survey certainty, rumours, charts, species knowledge, stock assessment and ownership. | Per player, crew, settlement or faction as appropriate. |

## 6.1 Authoritative State Rule

Visual schools, particle plankton, distant silhouettes and ambient sounds may be presentation-only. They must never independently create catch inventory, population loss, rare spawns, boss evidence or codex knowledge. Any gameplay result resolves through an authoritative cohort or explicit scripted/event source.

# 7. Habitat Suitability and Environmental Niches

| Input Family | Examples | Ecological Use |
| --- | --- | --- |
| Geometry | Depth, slope, cave volume, reef complexity, open water, shoreline access. | Determines movement space, shelter, nesting and predator access. |
| Substrate | Sand, mud, rock, coral, kelp holdfast, wreck, vent, ice. | Selects benthic life, burrowers, spawning and harvest. |
| Water | Temperature, salinity, oxygen, clarity, chemistry, mana or corruption. | Filters physiological compatibility and condition. |
| Motion | Current, turbulence, tide, surge, wave exposure and vertical movement. | Controls feeding, migration, larval transport and energy cost. |
| Productivity | Light, nutrients, plankton, seagrass, kelp, detritus and vent chemistry. | Supports carrying capacity and food-web structure. |
| Shelter | Vegetation, reef cavities, wrecks, ice, rocks and protected lagoons. | Supports juveniles, ambush predators and storm survival. |
| Civilisation | Noise, light, sewage, harvesting, shipping, structures, wards and aquaculture. | Creates attraction, avoidance, adaptation, pollution or protection. |
| History | Extinction, introduction, boss presence, ruin, war, restoration or realm leak. | Changes native package selection and present pressure. |

Suitability is scored by capability tags and exclusions rather than one universal percentage. A family may be fully suitable, seasonally suitable, transit-only, nursery-only, stressed, invasive-capable or impossible. The resolver records causes so designers and players can understand why a population succeeds or fails.

A habitat patch may support several roles at once. A wreck can be shelter, spawning substrate, salvage site, predator ambush point and pollution source. These relationships are explicit and can change when the wreck is stripped, restored, collapsed or claimed.

# 8. Water Properties, Seasonal Fields and Ecological Response

| Field Change | Likely Response | Persistence Rule |
| --- | --- | --- |
| Temperature shift | Migration, metabolism, spawning timing, disease and oxygen stress. | Seasonal fields are predicted; exceptional trends can create persistent population deltas. |
| Salinity shift | Species replacement, estuary movement, die-off or adaptation pressure. | River diversion and engineering may persist. |
| Low oxygen | Surface aggregation, evacuation, mortality and scavenger bloom. | Cause and recovery are recorded. |
| Turbidity | Reduced sight, altered feeding, gill stress and ambush advantage. | Storm turbidity fades; mining or dredging may persist. |
| Plankton bloom | Increased food, visibility change, toxin risk and later oxygen crash. | Event lifecycle controls bloom and aftermath. |
| Mana surge | Attraction, mutation, spawning, spirit activity or avoidance. | Ordinary tides are cyclic; corruption or realm effects may persist. |
| Oil, waste or poison | Contamination, mortality, unsafe catch and legal response. | Requires source removal and recovery rather than instant reset. |
| Sea ice change | Route, breeding, shelter and predator access changes. | Seasonal baseline plus climate/event deltas. |

# 9. Food Webs, Trophic Roles and Ecosystem Services

Ecology packages use relationship graphs rather than fixed linear chains. A creature can graze kelp, host smaller organisms, transport seeds, aerate sediment and serve as prey. Bosses and large habitat carriers may influence several layers simultaneously.

| Role | Required Data | Example System Effect |
| --- | --- | --- |
| Primary Producer | Habitat, growth driver, harvest, disturbance response. | Kelp or seagrass supports shelter and productivity. |
| Filter Feeder | Particle source, flow preference, contamination sensitivity. | Improves clarity or accumulates toxins. |
| Grazer | Food preference, movement, pressure and predator relationships. | Prevents reef or kelp overgrowth. |
| Predator | Prey set, hunting mode, territory and satiation. | Controls schools and creates risk zones. |
| Scavenger | Carcass and waste use, disease risk, attraction. | Recycles remains and signals recent death. |
| Decomposer | Substrate, oxygen and nutrient return. | Supports recovery and bloom cycles. |
| Ecosystem Engineer | Terrain/structure effect, shelter creation, route change. | Kelpback habitat carriage or reef-building. |
| Parasite / Disease Vector | Host links, lifecycle and treatment. | Creates fishery, aquaculture or creature-health events. |
| Guardian / Steward | Protected resource or habitat relationship. | May defend reefs or spawning grounds without ordinary predation motive. |

# 10. Population Cohorts, Carrying Capacity and Density

The authoritative unit for ordinary distant populations is the cohort, not each animal. Cohorts store abundance as an integer, band or biomass class depending on importance and content needs. Exact individual identity is reserved for named, tamed, tagged, quest-critical, rare or nearby creatures.

| Cohort Field | Purpose |
| --- | --- |
| Family and Variant IDs | Resolve immutable content and authorised variants. |
| Region / Patch / Route | Locate residence, transit or spawning relationship. |
| Life Stage | Egg/seed, juvenile, subadult, adult, elder or content-specific stage. |
| Abundance / Biomass | Bounded quantity used for recruitment, mortality, harvest and promotion. |
| Health and Stress | Disease, starvation, contamination, injury and magical instability. |
| Behaviour State | Resident, feeding, migrating, spawning, fleeing, stranded, dormant or invasive. |
| Genetic / Variant Summary | Only where breeding, adaptation or research makes it gameplay relevant. |
| Ownership / Stewardship | Wild, protected, managed, faction-owned, escaped or disputed. |
| Last Simulation Time | Supports deterministic catch-up and audit. |
| Evidence Trail | Records major harvest, introduction, die-off, restoration and migration events. |

Carrying capacity is recalculated from habitat productivity, area, shelter, food links, water condition, competition, predation, boss influence and civilisation pressure. It is intentionally approximate and clamped. The game needs believable direction and consequences, not a scientific stock-assessment simulator.

Local density affects presentation and encounter selection but is not identical to total abundance. Migrating schools may create high local density from a healthy regional stock; a trapped lagoon may create high density and low health.

# 11. Lifecycle, Reproduction, Recruitment and Mortality

| Lifecycle Element | Required Behaviour |
| --- | --- |
| Reproductive Mode | Tags for eggs, live birth, spores, budding, metamorphosis or magical manifestation. |
| Season / Trigger | Temperature, tide, moon, current, rainfall, mana, food, age or event. |
| Spawning Habitat | Required patch, route, structure, depth, substrate or social condition. |
| Recruitment Delay | Time and survival stage before new abundance enters fishable or visible cohorts. |
| Juvenile Shelter | Nursery requirements and vulnerability to habitat loss. |
| Natural Mortality | Age, predation, disease, starvation, stranding and environment. |
| Harvest Mortality | Catch method, release survival, bycatch and illegal/destructive action. |
| Recovery Potential | Fast, moderate, slow, episodic, migratory, unique or boss-dependent. |
| Intervention | Stocking, hatchery, habitat restoration, protection, treatment or relocation. |

Rare and long-lived species must not recover at the same rate as common schooling fish. The content definition declares recovery class and minimum viable conditions. World settings may soften depletion for cosy play, but they should preserve cause-and-effect messaging rather than silently refilling populations overnight.

# 12. Migration, Spawning Routes and Seasonal Aggregations

| Route Type | Drivers | Gameplay Links |
| --- | --- | --- |
| Feeding Migration | Productivity, plankton, prey, temperature and currents. | Fishing seasons, predator movement, trade and observation. |
| Spawning Migration | Age, season, tide, river access, reef or nursery. | Protected seasons, events, quests and congestion. |
| Juvenile Drift | Currents, shelter and larval transport. | Habitat connectivity and pollution consequence. |
| Refuge Movement | Storms, ice, heat, oxygen, noise or predators. | Forecasting, rescue and unusual encounters. |
| Boss / Titan Route | Lifecycle, territory, world law or event. | Navigation warnings, fisheries, ports, storms and regional power. |
| Introduced Spread | Shipping, ballast, aquaculture escape or portal breach. | Invasive events and containment. |
| Vertical Migration | Light, pressure, feeding and day/night cycle. | Depth-specific fishing and underwater encounters. |

Migration uses route graphs and time windows. Distant cohorts advance along graph edges; nearby presentation uses representative entities and paths. Blocked routes, dams, harbour works, noise, wards, boss territory and changed currents can redirect or fragment movement, producing explicit ecological and settlement consequences.

# 13. Ambient Life, Schools, Shoals, Pods and Colonies

| Presentation Form | Authoritative Relationship |
| --- | --- |
| Plankton / Tiny Life VFX | Reads productivity and bloom state; no independent inventory or collision. |
| Small School Visual | Represents a cohort fraction using pooled or instanced visuals. |
| Interactive School | Spawns bounded representative entities for fishing, predation or disturbance. |
| Pod / Herd Group | Maintains social leader, calves/juveniles, cohesion and route relationship. |
| Benthic Colony | Links to substrate cells or site markers and can be harvested or damaged in batches. |
| Nest / Nursery | Persistent protected site with lifecycle, guards and recruitment output. |
| Carcass / Fall | Persistent resource and succession site with scavengers, contamination and decay. |
| Habitat Carrier | Large creature such as a Kelpback that carries attached ecology and requires composite presentation. |

The renderer may use MultiMesh, particles, impostors and animation shaders for large groups. Collision and AI are limited to representatives or interaction volumes. Promotion must reserve abundance so killing or catching representatives cannot exceed the source cohort.

# 14. Marine Creature Taxonomy and Capability Facets

| Facet Family | Representative Fields |
| --- | --- |
| Environment | Fresh/marine/brackish, depth band, pressure, temperature, oxygen, substrate, realm law. |
| Body and Movement | Swim modes, acceleration, turn, breach, crawl, burrow, cling, float, sink, fly or amphibious transition. |
| Respiration | Gills, lungs, skin, magical, air storage, surfacing interval and suffocation response. |
| Buoyancy | Neutral, positive, negative, adjustable, ballast organ, depth limits and incapacitated state. |
| Senses | Vision, low-light, vibration, sound, scent, electroreception, mana, pressure or memory. |
| Sociality | Solitary, pair, school, pod, colony, hive, host-attached or faction-managed. |
| Diet / Trophic Role | Food tags, feeding mode, satiation and ecosystem service. |
| Threat | Predation, defence, venom, charge, grab, entangle, ram, shock, spell or vessel interaction. |
| Personhood | Ordinary wildlife, trained, uplifted, spirit, intelligent, factional or unresolved. |
| Harvest / Welfare | Renewable shed, non-lethal sample, carcass resources, protected parts and release handling. |
| Persistence | Ambient, cohort, individual, named, boss, titan or unique world process. |
| Presentation | Rig, school visual, audio, VFX, silhouette, readable signs and accessibility metadata. |

Atlas examples such as `creature.marine.kelpback` and `creature.marine.reefjaw` consume these facets. Kelpback is a large coastal grazer and habitat carrier; Reefjaw is a reef ambush predator. Their final models, drops and authored behaviours remain Atlas/registry content, while 26M defines the required runtime contracts.

# 15. Aquatic Senses, Detection, Communication and Knowledge

| Sense | Environmental Modifiers | Counterplay / Use |
| --- | --- | --- |
| Vision | Clarity, light, contrast, bioluminescence and motion. | Camouflage, lights, cover, glare and distance. |
| Vibration | Movement, tools, engines, impacts and substrate. | Move slowly, damp machinery, create decoys or observe from still positions. |
| Sound | Water propagation, frequency, storms, machinery and terrain. | Signals, lures, quiet running, hearing protection and instruments. |
| Scent / Chemical | Current, salinity, contamination, blood, bait and distance. | Bait trails, masking, current awareness and cleanup. |
| Electrical | Living bodies, machines, storms and metal. | Insulation, power shutdown, specialised detection. |
| Pressure / Flow | Waves, currents, displacement and vessel wakes. | Approach planning, wake reduction and prediction. |
| Mana / Spirit | Charge, spell use, wards, corruption and realm influence. | Wards, cleansing, concealment and magical research. |
| Memory / Social Signal | Known vessels, calls, migration traditions, injury or feeding history. | Reputation with trained or intelligent marine life and predictable learned behaviour. |

Creature knowledge is confidence-based. The Codex may know habitat but not exact weakness, or recognise tracks without identifying the family. Research, observation, specimens, local teaching, instruments and repeated encounters improve knowledge. UI must distinguish fact, inference, rumour and outdated survey.

# 16. Movement, Buoyancy, Depth, Pressure and Respiration

Marine creatures query 26B-26D for water volume, surface, flow, temperature, clarity and pressure band. They do not run a separate fluid or wave simulation. Movement is authored as capability-based steering with environment modifiers, not full biomechanical simulation.

| Movement Case | Required Rule |
| --- | --- |
| Ordinary Swimming | Use bounded acceleration, turn, preferred speed, depth and obstacle avoidance. |
| Schooling | Presentation flocking may be local; authoritative group goals and cohort position remain bounded. |
| Breaching | Requires surface clearance, energy, behaviour motive and safe landing volume. |
| Bottom Movement | Uses substrate slope, attachment or walking/crawling capability. |
| Burrowing | Only in compatible substrate and bounded tunnel/occupancy rules. |
| Current Riding | Can reduce energy or drive migration; strong flows may displace weak swimmers. |
| Pressure Violation | Causes stress, retreat, injury or impossibility according to facet; no universal instant damage. |
| Respiration Failure | Invokes authored distress, surfacing, air seeking or incapacitation; player rescue may apply. |
| Beaching / Stranding | Creates physical and event state with rescue, predation, mortality and social response. |
| Out-of-Water Behaviour | Only amphibious or temporary-survival families can navigate land; others use distress rules. |

# 17. Behaviour, Morale, Sociality and Group Tactics

| Behaviour Driver | Possible Actions |
| --- | --- |
| Feeding | Graze, filter, ambush, pursue, scavenge, cooperate, avoid competition. |
| Territory | Display, warn, herd intruders, defend nest, attack, retreat or relocate. |
| Reproduction | Court, migrate, school, guard eggs, protect young or become vulnerable. |
| Fear / Injury | Flee, hide, school tighter, beach, call group, retaliate or become easier to capture. |
| Curiosity | Approach lights, vessels, sound, magic, bait or unfamiliar structures. |
| Social Bond | Follow leader, protect juvenile, assist injured member or remember handlers. |
| Training | Respond to commands, stations, routes, rewards and welfare state. |
| Intelligence / Personhood | Signal, negotiate, demand, deceive, remember law or participate in factions. |
| Boss Influence | Aggregate, flee, become aggressive, change migration or defend territory. |
| Environmental Crisis | Seek refuge, surface, migrate, strand, invade ports or enter unusual habitats. |

Group tactics are defined by family and context. A Reefjaw may use cover and short ambushes; a pod may surround a threat; a swarm may overwhelm visibility. No shared marine-AI script should make unrelated creatures behave identically.

# 18. Intertidal, Shoreline, Beaching and Amphibious Interaction

The intertidal zone changes access with 26D tide state. Organisms may be submerged-only, tide-pool tolerant, burrowed, attached, amphibious or migratory across the shoreline. Harvest opportunities, predators and rescue tasks therefore change with time and weather.

| State | Gameplay Effect |
| --- | --- |
| Exposed Tide Pool | Early observation and careful hand harvest; temperature and desiccation risk. |
| Incoming Tide | Opens channels, changes fish access and can trap inattentive players. |
| Surf Zone | High turbulence, stranded prey, predators and difficult landing. |
| Mudflat / Estuary | Burrowed resources, brackish ecology, sinking terrain and bird/marine links. |
| Sea Cave Entrance | Tide-gated dungeon access, air pockets and surge hazard. |
| Stranding Event | Rescue, research, salvage, cultural response or mortality depending on cause. |
| Nesting Beach | Seasonal protection, predators, settlement conflict and controlled access. |
| Amphibious Route | Creature path may cross roads, docks, farms or settlements and create event pressure. |

# 19. Vessels, Ports, Settlements and Maritime Infrastructure

| Relationship | Ecological Interaction |
| --- | --- |
| Vessel Wake / Noise | Disturbs or attracts creatures, changes fishing and may separate schools locally. |
| Hull Fouling | Creates attached ecology, drag, invasive transfer and maintenance demand. |
| Ballast / Cargo Water | Can transfer organisms; quarantine and treatment rules apply. |
| Fishing Port | Concentrates landings, waste, markets, predators, scavengers and stock knowledge. |
| Harbour Lights | Attract or disorient organisms and may trigger events such as Floodcaller Juvenile pressure. |
| Dredging / Breakwaters | Change substrate, flow, nursery habitat and port access. |
| Waste / Runoff | Creates contamination, blooms, disease, unsafe catch and legal consequences. |
| Sanctuary / Reef Works | Protect habitat, reduce extraction and support tourism, research or cultural law. |
| Shipwreck | Becomes hazard, habitat, salvage source and possible dungeon site. |
| Mana Infrastructure | May attract, repel, mutate or stabilise magical marine life. |

Ports and settlements consume ecology summaries through service interfaces. They do not directly spawn fish because a market requires stock. Shortages create contracts, price changes, aquaculture pressure, imports, conservation decisions and possible illegal fishing rather than hidden item generation.

# 20. Pollution, Extraction, Habitat Damage and Restoration

| Pressure | State Changes | Recovery Options |
| --- | --- | --- |
| Overfishing | Adult abundance decline, age truncation, lower recruitment and predator displacement. | Season closure, gear limits, stocking, habitat recovery and reduced effort. |
| Bottom Damage | Reduced shelter, benthic mortality, turbidity and nursery loss. | Method ban, reef modules, regrowth and restoration projects. |
| Oil / Chemical Spill | Contamination, mortality, tainted catch and port closure. | Containment, cleanup, treatment and long recovery. |
| Sewage / Nutrient Runoff | Bloom, disease, oxygen crash and scavenger surge. | Infrastructure repair, wetland restoration and monitoring. |
| Noise / Sonar-like Magic | Migration disruption, stranding and avoidance. | Quiet zones, timing restrictions and alternative navigation. |
| Corruption / Realm Leak | Mutation, invasive ecology, dangerous resources and altered bosses. | Cleansing, sealing, adaptation, containment or negotiated coexistence. |
| Reef Mining | Habitat loss, coastal exposure and cultural conflict. | Substitutes, bans, cultivated material and reef rebuilding. |
| Wreck Leakage | Fuel, mana, ammunition or cargo contamination. | Salvage, neutralisation and memorial/restoration choice. |

Restoration is staged and measurable. Projects change specific habitat variables, not a universal green score. Success may require clean water, substrate, source population, protection time, monitoring and community support. Recovery can fail or produce a different stable ecology if historical conditions cannot be restored.

# 21. Locked Fishing and Fisheries Identity

Fishing is the player-facing extraction and observation layer of marine ecology. It ranges from tide-pool gathering and hand lines to commercial vessel operations and managed aquaculture. All methods resolve against compatible habitat, actual or event-authorised abundance, gear capability, actor knowledge and world law.

> **Locked Fishing Rule**  
> A successful catch must identify a valid source, method, actor, transaction, output and population consequence. Presentation may simplify the interaction, but no method creates fish, shellfish, plants or creature materials from an unbounded random table.

# 22. Fishing Activity Lifecycle and Authoritative Transactions

| Phase | Player / NPC Action | Authoritative Output |
| --- | --- | --- |
| Preparation | Choose method, gear, bait, storage, permissions, destination and risk. | Validated loadout and legal/knowledge warnings. |
| Locate | Read signs, charts, instruments, birds, water, local reports or survey. | Fishing opportunity with confidence and expiry. |
| Deploy | Cast, set net, place trap, dive, spear, tow gear or begin harvest. | Reserved gear state, location and effort record. |
| Attract / Wait / Search | Use bait, lure, time, movement, depth and patience. | Interaction candidates drawn from cohort and method compatibility. |
| Engage | Hook, enclose, strike, lift, gather or release. | Skill/gear/environment resolution and escape/bycatch state. |
| Land | Bring catch aboard, shoreward or into container. | Catch record, condition, quantity and ownership. |
| Handle | Dispatch, release, keep alive, sort, measure, treat or sample. | Welfare, quality, survival and law result. |
| Store / Process | Ice, salt, cook, dry, smoke, preserve, transfer or sell. | Inventory/lot transaction and freshness state. |
| Report / Assess | Update log, quota, research, contract or stock survey. | Knowledge and regional pressure evidence. |
| Recover Gear | Retrieve traps/nets and clear lost equipment. | Durability, ghost-gear risk and cleanup result. |

The catch transaction reserves source abundance before output creation. If inventory insertion fails, the catch remains physically or transactionally present rather than duplicating or vanishing. Multiplayer actions use authority locks around shared nets, traps, holding tanks and cargo.

# 23. Fishing Methods and Capability Families

| Method Family | Strengths | Constraints / Consequences |
| --- | --- | --- |
| Hand Gathering | Simple, selective, early and suitable for intertidal plants or shell life. | Tide, exposure, carrying capacity and protected zones. |
| Rod and Line | Selective, readable and compatible with shore or vessel play. | Bait/lure, hook, line strength, depth and landing skill. |
| Handline / Longline | Scalable passive line system. | Bycatch, bait cost, retrieval, limits and lost gear. |
| Cast / Seine Net | Captures schools in bounded areas. | Requires space, crew or skill; juvenile/bycatch risk. |
| Gill / Set Net | Passive route interception. | High entanglement and ghost-gear risk; strict law profiles. |
| Trap / Pot | Species-selective benthic capture. | Bait, placement, soak time, capacity and retrieval. |
| Spear / Harpoon | Direct sight-based hunting. | Visibility, injury, danger, personhood and protected-species rules. |
| Diving Harvest | Highly selective plants, shellfish, specimens and salvage. | Breath, pressure, temperature, tools and carrying limits. |
| Trawl-like Industrial Method | High volume where world settings and law permit. | Severe substrate/bycatch pressure; not an early default. |
| Magical Fishing | Runic lure, current shaping, spirit call, stasis or detection. | Mana, knowledge, counter-effects and ecological risk. |
| Creature-Assisted Fishing | Trained animal locates, herds or retrieves. | Welfare, bond, species capability and local law. |
| Research Capture | Non-lethal tagging, sample trap, observation chamber. | Knowledge output, release survival and specialist tools. |

World presets may disable or soften destructive methods. The default design should make selective methods effective and commercially viable so ecological responsibility is not always the weakest option.

# 24. Gear, Bait, Lures, Traps and Equipment Condition

| Gear Element | Relevant Fields |
| --- | --- |
| Rod / Pole | Material, action, length, strength, flexibility, durability and mount compatibility. |
| Reel / Winder | Line capacity, retrieval rate, drag control, mechanical or magical assistance. |
| Line / Rope | Strength, stretch, visibility, water resistance, depth and break behaviour. |
| Hook / Spear Head | Size, shape, barb, damage, retention, release difficulty and material. |
| Net | Mesh size, dimensions, strength, sink/float, target selectivity and damage. |
| Trap / Pot | Entrance, capacity, bait, escape vents, durability, ownership and marker. |
| Float / Weight | Depth control, visibility, current response and retrieval. |
| Bait | Source, freshness, scent tags, target compatibility and consumption. |
| Lure | Motion, sound, light, colour, mana signature and depth band. |
| Holding Container | Water/air, capacity, temperature, oxygen, welfare and contamination. |
| Preservation | Ice, salt, smoke, cold rune, stasis or live well capability. |
| Survey Instrument | Depth, temperature, current, school detection, species confidence and range. |

Gear condition changes reliability and catch quality. Failure remains readable: frayed line, damaged net, fouled hook, exhausted bait, blocked trap or overloaded reel. Repairs consume real materials through shared recipes.

# 25. Fishing Opportunity, Knowledge, Signs and Forecasting

| Information Source | What It Reveals | Reliability |
| --- | --- | --- |
| Surface Sign | Ripples, jumping fish, birds, bubbles, colour or feeding disturbance. | Immediate but local and species-ambiguous. |
| Habitat Knowledge | Depth, substrate, vegetation, season and temperature preference. | Stable but not proof of current abundance. |
| Local NPC Report | Recent catch, route, protected site or warning. | Depends on honesty, age and expertise. |
| Catch Log | Player or crew history by method, time and place. | Accurate for recorded effort; may become outdated. |
| Instrument | Depth, temperature, current, school echo or magical signature. | Capability-limited and may misclassify. |
| Ecological Clue | Predators, prey, eggs, juveniles, carcasses or water quality. | Requires knowledge to interpret. |
| Port Stock Assessment | Regional effort, landings and survey summary. | Broad, delayed and politically influenced. |
| Boss / Event Warning | Migration disruption, silence, mass movement or unusual weather. | Strong sign of change, not exact catch guarantee. |

A Fishing Opportunity is not an item spawn. It is a temporary knowledge object containing method-compatible source cohorts, confidence, expected size/abundance bands, environmental modifiers and legal warnings. Players may fish without one, but with less information.

# 26. Hooking, Netting, Landing, Escape and Catch Handling

Active fishing interactions should be tactile without becoming exhausting. Rod play uses bite recognition, tension, line angle, creature stamina, obstacles and landing. Nets use placement, opening, closure, drag, capacity and escape. Traps use deployment quality and retrieval. Difficulty settings can simplify timing and automate repetitive handling.

| Resolution Factor | Effect |
| --- | --- |
| Target Size / Strength | Increases load, escape and gear requirement. |
| Behaviour | Dives, runs, twists, hides, jumps, schools or attacks. |
| Gear Match | Controls retention, damage, selectivity and failure. |
| Actor Skill | Improves reading, tension, placement, recovery and handling. |
| Crew Support | Enables larger nets, gaffing, lifting, sorting and safety. |
| Environment | Current, waves, obstacles, visibility and vessel motion. |
| Welfare Choice | Quick release, live handling, humane dispatch or rough treatment changes survival/quality. |
| Storage Readiness | Poor containers reduce quality or prevent legal retention. |
| Capacity | Overloaded net, deck or tank creates loss and danger. |
| Threat | Predators, storms, combat or entanglement may interrupt the transaction. |

# 27. Catch Identity, Quality, Freshness, Processing and Storage

| Catch Field | Purpose |
| --- | --- |
| Source Family / Variant | Links catch to ecology and item definition. |
| Quantity / Size Class | Supports inventory, contract, trophy or research without requiring unique mesh per size. |
| Condition | Alive, healthy, stressed, injured, dead, spoiled, contaminated or magical. |
| Freshness / Temperature | Feeds spoilage, quality, price and food safety. |
| Method Provenance | Line, net, trap, dive, aquaculture, salvage or event. |
| Location / Time | Supports law, contracts, research and world history. |
| Ownership / Permit | Determines legal possession and faction response. |
| Handling Quality | Affects survival on release, meat/resource quality and research value. |
| Tags / Measurements | Sex where relevant, life stage, rarity, specimen data or quest markers. |
| Processing State | Whole, cleaned, fillet, shell, oil, bait, specimen, preserved or cooked. |

Catch processing reuses recipe and item systems. It may produce food, bait, oil, ink, shell, chitin, medicine, alchemical reagents or research samples when approved content exists. Waste and by-products are explicit and may be composted, rendered, discarded or create pollution.

# 28. Bycatch, Welfare, Conservation, Law and Ethical Choice

| Control | System Behaviour |
| --- | --- |
| Mesh / Hook Size | Changes target selectivity and juvenile escape. |
| Season Closure | Protects spawning or migration windows. |
| Area Closure | Protects nursery, sanctuary, sacred, polluted or boss territory. |
| Quota / Bag Limit | Bounds legal retention by actor, vessel, contract or settlement. |
| Protected Family | Requires release, rescue, permit, research authority or complete prohibition. |
| Release Survival | Depends on method, depth change, handling, injury and time. |
| Ghost Gear | Lost nets and lines continue bounded harm until recovered or decayed. |
| Observer / Report | Commercial operations may require logs, inspection or contribution evidence. |
| Cultural Stewardship | Local rules may treat reefs, species or seasons as sacred or communal. |
| World Setting | Can simplify depletion, bycatch and law while preserving readable consequences. |

Conservation is not a universal moral meter. Different factions can disagree about methods, ownership, subsistence, commercial rights and sacred ecology. The system records material and ecological consequences, legal context and relationships rather than assigning simplistic good/evil labels.

# 29. Commercial Fishing, Fleet Operations and Regional Fisheries

Commercial fisheries connect 26M abundance to 26K fleets and markets. A fishing voyage declares target family or method class, grounds, season, gear, crew, storage, permit, quota and landing port. Distant resolution consumes effort, environment, knowledge and actual cohort availability.

| Fleet Input | Ecology Interaction |
| --- | --- |
| Vessel Capability | Draft, range, storage, weather tolerance, gear deployment and crew safety. |
| Crew Skill | Search efficiency, gear handling, processing, bycatch reduction and reporting. |
| Fishing Grounds | Habitat patches, migration windows, boss territory and law. |
| Effort | Time, gear count, tow length, trap count or search intensity. |
| Catchability | Family behaviour, season, method match and knowledge. |
| Storage | Live well, ice, salt, cold room, stasis, contamination and capacity. |
| Market / Contract | Target, quality, timing and legal destination. |
| Monitoring | Catch log, quota, scientific sample and enforcement risk. |
| Pressure | Cumulative extraction, habitat damage, bycatch and fleet competition. |
| Aftermath | Stock trend, prices, conflict, closure, migration and settlement need. |

Fleet abstraction may resolve a voyage without physical fish entities, but it must preserve catch lots, fuel, gear damage, casualties, weather, legal violations and population removal. Promotion near players reconciles remaining gear, current catch and active threats.

# 30. Aquaculture, Hatcheries, Kelp Farms and Managed Habitats

| Aquaculture Type | Core Requirements | Risks |
| --- | --- | --- |
| Pond / Lagoon | Water exchange, stock, feed or productivity, barriers, labour. | Disease, oxygen, escape, contamination and flooding. |
| Cage / Pen | Mooring, net integrity, current, depth, stock and feeding. | Escape, predators, storm damage and waste. |
| Shellfish Bed | Substrate, water quality, seed stock, access and harvest schedule. | Toxins, silt, theft and habitat conflict. |
| Kelp / Seaweed Farm | Lines or frames, nutrients, current, depth and harvest. | Storm loss, entanglement, shading and invasive spread. |
| Hatchery | Broodstock, water treatment, specialists, feed and release plan. | Low diversity, disease, dependency and poor release success. |
| Reef Cultivation | Substrate modules, fragments/seed, water quality and long protection. | Slow growth, heat, pollution and competing claims. |
| Magical Habitat | Mana source, containment, species compatibility and warding. | Mutation, realm leakage, overcharge and social controversy. |
| Research Sanctuary | Observation, tagging, treatment, release and restricted access. | Funding, welfare, security and political pressure. |

Aquaculture converts inputs and time into managed biomass; it never produces free stock. Population records distinguish captive, managed-open and wild cohorts. Escapes can join wild ecology only through compatibility and invasive-risk rules. Disease and water-quality state can spread both directions.

# 31. Marine Resources, Specimens, Research and Material Harvest

| Source Type | Examples from Existing Direction | Acquisition Rule |
| --- | --- | --- |
| Plant / Algal | Kelp, seagrass, medicinal algae, oil plants. | Harvest capacity, season, regrowth and habitat damage. |
| Shell / Mineralised | Shell plate, pearl-like resources, coral or calcified structures. | Prefer shed, cultivated or authorised harvest where possible. |
| Creature Material | Ink gland, chitin, oil, venom, bone, hide or essence. | Content declares lethal, non-lethal, shed, carcass or substitution source. |
| Environmental | Salt, brine, vent mineral, frost pearl, storm glass. | World node or process with depletion and hazard. |
| Specimen | Water, tissue, egg casing, scale, tag reading or behaviour record. | Research tool, handling and chain of custody. |
| Carcass Fall | Large remains supporting succession and salvage. | Persistent site with law, ecology, contamination and anti-farming. |
| Boss Gift / Shed | Renewable or negotiated material source. | Alternative to killing where authored. |
| Dungeon Salvage | Cargo, machinery, relic, archive or habitat material. | Site ownership, depletion and restoration state. |

Research rewards include habitat knowledge, migration charts, safe handling, recipes, creature counterplay, restoration techniques and boss history. Material rewards must not make extermination universally superior to observation, rescue or stewardship.

# 32. Creature Conflict, Hunting, Defence and Vessel Encounters

Marine creature conflict begins from behaviour and territory, not a generic hostile flag. A predator may attack prey but ignore a vessel. A guardian may warn divers away from a nursery. An injured titan may collide accidentally. A magically corrupted creature may pursue mana output. These motives shape objectives and de-escalation.

| Encounter Type | Primary Authority / Interface |
| --- | --- |
| Underwater Personal Combat | Document 16 plus 26E movement and 26M creature actions. |
| Creature Grabs / Entanglement | 26M action profile with 26E rescue and status interfaces. |
| Creature Strikes Vessel | 26M motive/action creates 26L damage packet and 26G force input. |
| Vessel Weapon vs Creature | 26L weapon resolution against Document 16/creature defences and 26M boss state. |
| Hunting Contract | 26K/15 owns mission and law; 26M owns population source and creature behaviour. |
| Repellent / Deterrence | Item, magic or environmental capability changes behaviour without required damage. |
| Capture / Relocation | Requires containment, welfare, transport, destination and population transfer. |
| Rescue / Treatment | Creates injury, towing, stabilisation, release and knowledge outcomes. |
| Territory Avoidance | Navigation and knowledge can resolve encounter without contact. |
| Protected Escort | Player or fleet protects migration, pod, eggs or injured creature from other threats. |

# 33. Taming, Companions, Mounts and Working Marine Creatures

| Relationship | Requirements | Boundaries |
| --- | --- | --- |
| Habituation | Repeated safe contact, feeding or coexistence. | Does not imply ownership or command. |
| Taming | Species capability, welfare, trust, training and permission. | Not available to every creature or boss. |
| Companion | Persistent individual identity, needs, bond, injury and release. | Cannot be stored as an item. |
| Mount | Riding interface, equipment, depth, stamina and safe dismount. | 26E/26O own final controls and camera. |
| Work Creature | Search, tow, retrieve, herd, rescue, message or patrol task. | Task limits, rest, feed, ownership and welfare. |
| Aquaculture Broodstock | Managed reproduction and lineage record. | Population and disease safeguards apply. |
| Intelligent Alliance | Negotiated relationship with personhood and faction rights. | Must not be reduced to taming mechanics. |
| Release / Rewilding | Destination suitability, health and population impact. | May fail or require monitoring. |

Culture, profession and individual history may influence handling knowledge, but biological ancestry must not define automatic dominion over creatures. Equipment, training, NPC teachers and progression provide access to all players.

# 34. Marine Events, Blooms, Migrations, Outbreaks and Strandings

| Event Family | Drivers | Possible Consequences |
| --- | --- | --- |
| Plankton Bloom | Nutrients, temperature, current, magic or pollution. | Food surge, visibility, toxin, oxygen crash and fishing change. |
| Mass Migration | Season, spawning, predator, boss or climate. | Fleet opportunity, closure, congestion and cultural event. |
| Predator Incursion | Prey shift, habitat loss, injury or boss displacement. | Unsafe waters, protection contracts and ecological imbalance. |
| Stranding | Storm, noise, disease, current, injury or magic. | Rescue, mortality, research, scavengers and public response. |
| Disease Outbreak | Density, aquaculture, contamination or invasive carrier. | Quarantine, treatment, market closure and stock loss. |
| Invasive Spread | Ballast, escape, portal or changed climate. | Competition, new resource, containment and political conflict. |
| Spawning Season | Lifecycle and environment. | Protected zones, predators, festivals, poaching and research. |
| Carcass Fall | Boss/titan death, natural mortality or battle. | New dungeon-like ecology, salvage, disease and faction claims. |
| Reef Bleaching / Blight | Heat, pollution, magic or disease. | Habitat loss, coastal exposure and restoration programme. |
| Boss Territory Shift | Migration, awakening, injury or world event. | Routes, fisheries, storms, ports and creature movement change. |

Events use warning, onset, peak, resolution and aftermath phases. They may create quests but continue under simulation. Quiet or peaceful settings can reduce emergency pressure while retaining seasonal and observational content.

# 35. Marine Dungeon and Submerged Site Identity

Marine sites are persistent structures or natural complexes whose access and operation depend on water, ecology and maritime history. They may be fully submerged, tidal, partially dry, floating, embedded in reefs, carried by a titan or connected to ports and caves.

> **Locked Site Rule**  
> A marine dungeon must retain a valid entrance, traversal plan, retreat route, water/air state, ecology, ownership, loot state and aftermath. The generator may vary layout and occupants but cannot ignore the conditions that make the site believable and playable.

# 36. Marine Site Taxonomy and Atlas Foundation Families

| Atlas Foundation | Stable ID | 26M System Hooks |
| --- | --- | --- |
| Stormreef Wreck Field | dungeon.overworld.marine.stormreef_wrecks | Linked wrecks, reef succession, currents, air pockets, cargo, survivors, predators, storms and salvage law. |
| Tidal Sea Cave Temple | dungeon.overworld.marine.tidal_temple | Tide-gated entrances, ritual chambers, dry routes, marine life, faith and coastal ownership. |
| Sunken Observatory | dungeon.overworld.marine.sunken_observatory | Pressure seals, lenses, archives, star maps, strange fauna and restored surface connection. |
| Abyssal Mining Platform | dungeon.overworld.marine.abyssal_platform | Pressure station, lifts, drills, power, crew records, breach hazards and deep ecology. |
| Mangrove Smuggler Maze | dungeon.overworld.marine.mangrove_smuggler | Root channels, tide paths, caches, boats, law, community and environmental damage. |
| Living Reef Citadel | dungeon.overworld.marine.living_reef_citadel | Cultivated architecture, residents, defence fauna, currents, nurseries, diplomacy and reef health. |
| The Drowned Meridian | megadungeon.overworld.drowned_meridian | Submerged metropolis, canal network, tides, islands, ports, survivors, reef ecology and restored gates. |
| Titan Carcass Biome | Atlas ecology module | Scavenger succession, parasites, rare tissues, camps, necromantic risk and terrain change. |
| Flooded Ruin Food Web | Atlas dungeon ecology module | Fish, scavengers, amphibious hunters, drowned undead, water quality and air-pocket refuges. |

Additional generated sites may use approved marine grammar families, but new named canonical sites require Atlas/content-pack authority. Ordinary wrecks, caves and ruins can be procedural instances derived from world history and vessel loss records.

# 37. Placement, Access, Entrances, Water State and Procedural Assembly

| Placement Input | Requirement |
| --- | --- |
| Topology | Depth, coast, cave, reef, trench, island, route and nearby settlement relationships. |
| Origin / History | Builder, purpose, age, sinking/flooding event, occupation layers and claims. |
| Water State | Connected volume, tide influence, pressure, air pockets, pumps, seals and contamination. |
| Ecology | Native package, invasive occupants, nests, carcasses, boss influence and resource renewal. |
| Access | Swimming, diving, vessel, cave, tide, portal, lift, pressure lock or restored route. |
| Commitment | Readable point after which retreat becomes harder; never hidden behind arbitrary lock. |
| Safety | At least one valid retreat or rescue policy, with difficulty-based assistance. |
| Loot / Function | Site purpose and occupants justify resources, knowledge and infrastructure. |
| Persistence | Flooding, doors, power, loot, damage, ecology, survivors, ownership and restoration save. |
| Seed Validation | Entrance reachable, critical rooms connected, hazards counterable and boss/quest sockets valid. |

Procedural assembly uses authored modules with compatibility tags. A dry archive module cannot connect through an unsealed opening to an abyssal exterior unless the site state explains its flooding. A tide puzzle must query actual tide phase or use a local authored hydraulic system rather than a cosmetic timer.

# 38. Traversal, Air, Pressure, Currents, Light and Expedition Safety

| Constraint | Design Requirement |
| --- | --- |
| Breath / Air | Provide equipment, pockets, vehicles, magic, routes or rescue according to progression. |
| Pressure | Use capability bands and clear warnings; failure should be avoidable and recoverable where practical. |
| Current | Affects routes, debris, creatures, projectiles and stamina; safe eddies or anchors provide counterplay. |
| Visibility | Lights, markers, maps, sound and non-visual cues prevent unreadable darkness. |
| Temperature | Requires protection, heat sources, timing or shorter routes. |
| Navigation | Use landmarks, lines, bubbles, architecture, instruments and mapped nodes. |
| Verticality | Provide ascent/descent routes, rest points and orientation support. |
| Entanglement | Kelp, nets, cables and ruins expose cutting, backing out, assistance and accessibility options. |
| Collapse / Breach | Uses bounded structural and fluid state; escape routes and warnings remain explicit. |
| Expedition Supply | Air, food, medicine, repair, light, storage and return capacity are inspectable before commitment. |

# 39. Rooms, Hazards, Puzzles, Ecology and Environmental Storytelling

| Module Family | Marine Extension |
| --- | --- |
| Airlock / Pressure Chamber | Seal state, pump, equalisation, emergency bypass and trapped occupants. |
| Flooded Hall | Current, debris, cover, air route, creatures and recoverable contents. |
| Tidal Gate | Actual phase, local control, alternate path and reset policy. |
| Reef Passage | Living geometry, fragile habitat, predators, diplomacy or restoration. |
| Wreck Interior | Orientation, collapse, cargo, bodies/records, trapped air and salvage ownership. |
| Vent Chamber | Heat, chemistry, rare life, mineral growth and power opportunity. |
| Kelp Labyrinth | Visibility, entanglement, nursery, predators and harvest choices. |
| Observation Dome | View, cracked glass, research data, fauna behaviour and repair. |
| Canal / Lock Network | Water levels, gates, boats, routes and restored infrastructure. |
| Living Chamber | Host organism, welfare, immune response and ethical interaction. |
| Boss Arena Socket | Territory function, retreat, phase boundaries, ecology and alternative resolution. |
| Memorial / Sacred Space | Cultural law, offerings, remains, stewardship and non-loot rewards. |

Puzzles must communicate state through more than colour. Water level, pressure, current direction, sound, vibration, symbols and physical mechanisms should remain readable with accessibility settings. Failure should rarely destroy unique rewards without warning or recovery.

# 40. Occupation, Factions, Survivors, Restoration and Persistent Site State

| Site State | Possible Gameplay |
| --- | --- |
| Dormant / Sealed | Research entrance, restore power, negotiate access or leave protected. |
| Flooded / Collapsed | Rescue, pump, brace, map alternate route or accept partial loss. |
| Ecologically Occupied | Observe, relocate, protect, hunt, clear selectively or adapt use. |
| Faction Occupied | Trade, infiltrate, negotiate, assault, expose claim or join project. |
| Survivor Enclave | Supply, evacuate, reconnect, recognise sovereignty or exploit. |
| Contaminated / Corrupted | Contain, cleanse, research, harvest carefully or abandon. |
| Claimed / Salvaged | Ownership, permits, contribution and depletion apply. |
| Restored Infrastructure | Becomes port link, observatory, farm, sanctuary, mine, archive or settlement facility. |
| Memorialised | Loot restrictions, pilgrimage, history and ongoing maintenance. |
| Reoccupied | New ecology or faction enters according to compatibility and world state. |

Restoration must not erase history. Original, repaired, replaced and reconstructed elements retain provenance. A restored site can continue to host compatible ecology and may require negotiated zones rather than total sterilisation.

# 41. Loot, Relics, Salvage, Knowledge and Anti-Farming Rules

| Reward Layer | Marine Rule |
| --- | --- |
| Supplies | Reflect expedition, crew, inhabitants and degradation. |
| Catch / Biological Resource | Draw from explicit populations or stored stock, with condition and law. |
| Salvage | Uses 26H/26K custody, ownership, dismantling and cargo rules. |
| Knowledge | Charts, species data, migration, history, recipes, pressure engineering and boss insight. |
| Relic | Provenance, cultural claim, restoration, curse and display matter. |
| Infrastructure | Restored gate, pump, lighthouse, sanctuary, route or port service can be the primary reward. |
| Faction / Social | Allies, survivors, teachers, legal rights, treaties and stewardship. |
| Boss / Unique | Final rewards come from 24H/24J/26N and support non-lethal outcomes. |
| Renewable Site Resource | Has carrying capacity, regrowth, labour and ownership. |
| Anti-Farming | Loot depletion, ecology, salvage state, ownership and reoccupation prevent unexplained resets. |

# 42. Marine Boss and Titan Identity

A marine boss is a major entity or system authority whose presence shapes territory, ecology, routes, settlements, weather, dungeons or world law. Size alone is insufficient. A giant animal without persistent world function may remain an elite creature; a smaller guardian controlling a critical spawning reef may qualify as a regional boss.

> **Locked Boss Rule**  
> Every marine boss package defines territory function, ecology, signs, commitment, retreat, alternative resolutions, rewards, aftermath and recurrence. Combat movesets alone are not a complete boss definition.

# 43. Territory, Foreshadowing, Threat Clocks and Encounter Commitment

| Territory Evidence | Marine Examples |
| --- | --- |
| Population Change | Missing schools, displaced predators, unusual aggregation or silent reef. |
| Physical Trace | Broken reef, scars, eggs, shed plate, wrecks, pressure glass or current channels. |
| Weather / Water Halo | Fog, storm, swell, temperature, pressure, song, mana or current change. |
| Civilisation Response | Closed grounds, offerings, patrols, evacuation, insurance, legend or sanctuary. |
| Route Pattern | Missing ships, altered migration, predictable passage or forbidden waters. |
| Dungeon Relationship | Lair, nursery, bound chamber, ruined station, citadel or carried interior. |
| Communication | Calls, dreams, signals, intermediaries, intelligent speech or faction message. |
| Resource Scar | Consumed reef, exposed ore, glass route, carcass field or protected abundance. |
| Threat Clock | Dormant, warning, active feeding, migration, spawning, wounded, enraged or crisis. |
| Commitment Point | Crossing territory boundary, attacking, entering lair, taking egg/relic, breaking pact or starting ritual. |

Bosses do not secretly teleport to the player. Territory and route state advance under bounded simulation. Encounters occur when valid paths, events, provocations or authored conditions intersect. Players can often wait, reroute, prepare, observe or negotiate.

# 44. Encounter Models for Surface, Underwater, Vessel and Mixed Spaces

| Model | Primary Play |
| --- | --- |
| Surface Pursuit | Vessel manoeuvre, observation, deterrence, rescue and 26L damage interactions. |
| Underwater Territory | Diving, cover, currents, pressure, creature movement and personal combat. |
| Reef / Structure Arena | Fragile habitat, rooms, civilians, nests, objectives and alternate paths. |
| Migration Intercept | Several encounter sites, timing, escort, redirect, study or hunt. |
| Port / Settlement Crisis | Evacuation, lights, barriers, rescue, infrastructure and non-combat objectives. |
| Interior / Living Dungeon | Board or enter a titan, interact with organs/ecology/inhabitants and exit safely. |
| Ritual / Communication | Maintain position, protect intermediaries, interpret signals or repair relationship. |
| Multi-Stage Expedition | Research signs, gather countermeasures, access site, resolve boss and manage aftermath. |
| Fleet / World Event | Multiple vessels, regional routes, rescue, civilian safety and abstract participants. |
| Containment / Sealing | Build, power, defend and validate a persistent project instead of defeating by damage. |

Boss encounters may transition between models. A Tidebreaker sighting can begin as route forecasting, become a vessel pursuit, continue as underwater disentanglement and end with escorting the creature away from a spawning fleet. State and damage persist across transitions.

# 45. Atlas Marine Boss Foundations and System Hooks

| Atlas Foundation | Authority / Example Hook | 26M Requirements |
| --- | --- | --- |
| Crown Reef Leviathan | 24F boss ecology hook protecting coral reef and submerged ruins. | Reef-health dependency, vessel/harvest conflict, nursery state, alternative protection or redirection and biodiversity aftermath. |
| Tidebreaker | 24F migratory sea titan changing storms, fisheries and navigation. | Persistent route, warnings, migration objectives, fleet interaction and regional ecological aftermath. |
| Deepglass Whale | titan.ocean.deepglass_whale in 24H. | Song/current/pressure-glass systems, calves, harpoon history, protection or communication and climate/route consequence. |
| Drowned Continent Crab | titan.coast.drowned_continent_crab in 24H. | Mobile islands, settlements, wrecks and reefs; boarding, inhabitants, shell ecology and archipelago aftermath. |
| Floodcaller Juvenile | siege.threat.leviathan.floodcaller_juvenile in 24H. | Settlement-light attraction, tide/flood interaction, parent route, rescue/taming/redirect options and harbour/fishery consequence. |
| Grave-Sea Procession | titan.ancestral.grave_sea_procession in 24H. | Spirit vessels, names, route protection, memorial law and Veil-linked aftermath. |
| Pressure Titan | 24F Impossible Deep ecology hook. | Deep pressure-field stability, settlements, tunnels, forges and nonstandard encounter space. |
| Marine Species Boss | 24H recurrence model. | Rare mature individual linked to population health, succession and replacement rather than universal uniqueness. |

These are system hooks, not a replacement for their complete Atlas packages. Final statistics, phases, visuals, dialogue, rewards and content packs remain governed by 24H, 24L, Set 25 and 26N production.

# 46. Alternative Resolutions, Aftermath, Succession and Ecological Rebalance

| Resolution | Possible Requirements | Aftermath |
| --- | --- | --- |
| Avoid / Wait | Knowledge, route, season or weather. | No direct damage; territory continues and may affect economy. |
| Deter / Redirect | Sound, light, bait, barriers, current, magic or escort. | Route shifts and another region may gain pressure. |
| Heal / Rescue | Remove gear, treat injury, clear pollution, free trapped creature. | Trust, migration recovery, material gift or alliance. |
| Protect | Defend eggs, calves, reef, migration or guardian from third party. | Population and faction relationships improve. |
| Bargain / Communicate | Personhood, intermediary, offering, law or repaired duty. | Treaty, access, obligation or shared stewardship. |
| Bind / Seal | Ritual, structure, energy and maintenance. | Threat contained but ongoing responsibility remains. |
| Relocate | Destination suitability, route, safety and consent/containment. | Old and new regions rebalance. |
| Capture / Study | Specialised containment, welfare, law and long-term facility. | Research and political risk; escape remains possible. |
| Kill | Combat success, recovery and custody. | Carcass ecology, materials, succession, grief, predator/prey and route changes. |
| Succeed / Transform | Boss becomes guardian, infrastructure, settlement, sanctuary or new world state. | Creates a durable replacement normal rather than empty territory. |

Defeat does not automatically restore balance. Removing a reef guardian may create grazer explosion or poaching. Killing a migratory current-shaper may disrupt fisheries. The aftermath resolver applies authored modules and may create successor pressure, restoration projects or a different boss role.

# 47. Progression, Skills, Knowledge, Quests and 26N Handoff

| Area | 26M Requirement | 26N Ownership |
| --- | --- | --- |
| Fishing Skill | Use-based improvements to reading, handling, selectivity and efficiency. | Final skill tree, perks, XP and unlock pacing. |
| Diving / Naturalism | Observation, sampling, tracking and safe approach. | Progression, research and teaching systems. |
| Gear | Capability tags for methods, depths, preservation and welfare. | Final items, recipes, tiers and economy. |
| Aquaculture | Facility and specialist requirements. | Building entries, recipes, automation, settlement needs and progression. |
| Creature Handling | Taming, rescue, treatment, mounts and work roles. | Skills, items, professions, quests and registry population. |
| Ecology Knowledge | Confidence, surveys, migration and stock state. | Codex, research, UI and reward integration. |
| Boss Preparation | Evidence, countermeasures, diplomacy, projects and territory access. | Quest chains, rewards, magic, economy and progression gates. |
| Restoration | Habitat variables, monitoring and recovery. | Projects, contracts, settlement systems and event content. |
| Law / Conservation | Seasons, methods, permits, protected zones and violations. | Faction law, economy, quests and reputation. |
| Maritime Events | Conditions and state transitions. | Final event templates, schedules, rewards and content packs. |

# 48. UI/UX, Accessibility, Comfort and Player Feedback

Marine ecology UI follows Document 17's world-first and progressive-disclosure direction. Ordinary play uses signs, animation, sound, water appearance, NPC behaviour and concise prompts. Detailed screens are opened intentionally for logs, stock assessments, aquaculture, research, dungeons and boss territories.

| Interface | Required Information |
| --- | --- |
| Fishing HUD | Method state, bite/engagement, tension or net load, gear condition, capacity and accessible cues. |
| Catch Panel | Identity confidence, size/quantity, condition, freshness, law, contract and keep/release actions. |
| Ecology Survey | Habitat, observed families, confidence, trend, pressure and evidence age. |
| Aquaculture Panel | Stock, health, water, feed, capacity, labour, disease, escape and harvest forecast. |
| Creature Inspect | Known senses, behaviour, injury, threat, personhood uncertainty and interaction options. |
| Dungeon Expedition | Air, pressure, temperature, route, mapped rooms, retreat and team supply. |
| Boss Territory | Signs, confidence, threat phase, route, objectives, alternatives and consequences. |
| Conservation / Law | Protected zone, season, quota, method restriction and reason. |
| Event Alert | Cause, affected area, confidence, timeframe, choices and quiet-mode settings. |
| History / Codex | Source attribution, rumours vs confirmed facts, catches, encounters and ecological outcomes. |

Accessibility requirements include non-colour bite and tension cues, remappable inputs, hold/toggle choices, simplified fishing, wider timing windows, automatic line management, reduced camera motion, reduced underwater distortion, high-contrast outlines, captions for creature sounds, vibration alternatives, route assistance and peaceful/no-predator presets. Boss fights must not require hearing, colour discrimination or rapid repeated inputs as the sole information channel.

# 49. Multiplayer Authority, Contribution and Conflict

| Concern | Authority Rule |
| --- | --- |
| Shared Fishing Gear | Server/host owns deployment, catch reservation, load and retrieval. |
| Catch Ownership | Method owner, vessel policy, contract, crew shares and local law determine custody. |
| Aquaculture | Permissions govern stocking, feeding, treatment, harvest and release. |
| Creature Interaction | Damage, capture, taming and release are authoritative commands with anti-duplication. |
| Boss Encounter | Encounter record owns objectives, phases, contribution, retreat and aftermath. |
| Dungeon State | Doors, water, loot, ecology, survivors and restoration are shared persistent truth. |
| Contribution | Track damage, healing, rescue, research, supplies, command, protection and peaceful objectives. |
| PvP Conflict | Fishing theft, sabotage, poaching and creature harm obey world PvP and law settings. |
| Disconnect | Locks expire safely; actors, gear, catches and companions remain in recoverable state. |
| Split-Screen | Each local player receives readable information without duplicating authority or clutter. |

# 50. Simulation LOD, Persistence, Streaming and Reconciliation

| LOD | Representation | Authoritative Work |
| --- | --- | --- |
| LOD 0 - Regional | Marine region and route summaries. | Cohort recruitment/mortality, migration, broad extraction, events and boss territory. |
| LOD 1 - Local Summary | Habitat patches, fisheries, ports, sites and active cohorts. | Opportunity selection, aquaculture, local predation and pressure. |
| LOD 2 - Representative | Schools, pods, nests and selected creatures near players. | Physical interaction tied to reserved cohort abundance. |
| LOD 3 - Full Individual | Named, tamed, quest, rare, boss or directly engaged creatures. | Detailed AI, injury, inventory/attachments, relationships and encounter state. |
| Presentation Only | Particles, distant silhouettes, tiny ambient life and sound. | Reads authoritative state but cannot change it. |

Promotion reserves cohort members and creates deterministic representatives with stable links. Demotion returns surviving ordinary representatives to cohorts, preserving deaths, captures, tags, injuries and displacement. Named or persistent individuals never merge into anonymous abundance.

Unloaded simulation advances in bounded steps with clamped catch-up. Long absences cannot produce exponential population explosions, total extinction without evidence or thousands of queued events. Major die-offs, invasions, boss shifts and aquaculture failures produce summaries and world history.

# 51. Registry, Schema, Relationship and Reason-Code Foundations

| Record Family | Required Identity |
| --- | --- |
| Marine Ecology Package | Habitat inputs, trophic roles, cohorts, events, exclusions and content dependencies. |
| Marine Creature Facet | Aquatic movement, respiration, depth, senses, behaviour, vessel interaction and harvest. |
| Population Cohort Runtime | Family, life stage, abundance, location, condition, behaviour and evidence. |
| Migration Route | Nodes, edges, timing, drivers, capacity, hazards and blockers. |
| Fishing Method | Gear, target tags, selectivity, effort, interaction, outputs, bycatch and law. |
| Fishing Opportunity | Source cohorts, method compatibility, confidence, environment and expiry. |
| Catch Record | Source, method, actor, quantity, condition, ownership, outputs and population delta. |
| Aquaculture Definition / Instance | Species, facility, water, feed, health, labour, growth, disease and outputs. |
| Marine Site Extension | Water, pressure, access, ecology, air, current, hazard, restoration and boss sockets. |
| Boss Territory / Encounter | Entity, territory, evidence, threat phase, alternatives, outcomes and aftermath. |
| Conservation Rule | Scope, method, season, family, quota, authority, consequence and explanation. |
| Ecology Evidence | Observation, measurement, source, confidence, time and location. |

Recommended qualified IDs use domain-owned namespaces such as `ecology.marine.*`, `fishing.method.*`, `aquaculture.*`, `relationship.creature_habitat.*`, `extension.creature.marine`, `extension.dungeon.marine`, and `encounter.boss.marine.*`. Final namespace allocation belongs to Set 25/26N governance.

Every validation failure uses a stable reason code and human-readable explanation. UI text is localised separately from the code. Reason codes are evidence-bearing, not designer-only notes.

# 52. Godot/Summer Engine Technical Boundaries

| Service / Resource | Responsibility |
| --- | --- |
| MarineEcologyService | Resolve packages, cohorts, carrying capacity, pressure and scheduled ecology updates. |
| HabitatQueryService | Combine 26C topology with 26D environmental fields and structure/substrate data. |
| MigrationService | Advance cohorts and bosses through route graphs and blockers. |
| MarineCreatureService | Promote/demote representatives, group goals, aquatic sensing and interaction commands. |
| FishingService | Validate method, reserve source, resolve interaction and commit catch transactions. |
| AquacultureService | Manage stock, growth, feed, water, health, labour, harvest and escape. |
| MarineSiteService | Apply marine extensions to dungeon/structure instances and reconcile water/ecology state. |
| MarineBossService | Territory, evidence, threat clock, phase and aftermath orchestration. |
| EcologyKnowledgeService | Surveys, logs, confidence, rumours and Codex-facing views. |
| Presentation Systems | MultiMesh schools, pooled actors, VFX, audio and debug overlays reading authoritative state. |

Definitions should use compact Godot Resources or validated serialised records. Runtime cohorts and site/boss state remain plain data records, not scene nodes. Physical creatures use pooled scenes only when promoted. School visuals may use MultiMesh or GPU-assisted animation, but gameplay selection occurs on CPU-authoritative cohort/representative data.

GDScript is the default implementation language. Native extensions are considered only after profiling proves a stable hotspot such as large-cohort scheduling, spatial habitat queries or path sampling. Summer Engine may assist schema generation, tests, migration scripts and authoring workflows under review, but no hidden runtime AI dependency ships.

# 53. Performance Budgets and Scalability Targets

| Area | Prototype Target / Rule |
| --- | --- |
| Regional Cohorts | Thousands of compact records across world; only due cohorts update each schedule slice. |
| Active Habitat Patches | Bounded around players, ports, sites and current events. |
| School Visuals | Instanced and pooled; no per-fish script or collision for presentation members. |
| Interactive Creatures | Budget by importance and distance; named/boss entities receive priority. |
| Fishing Checks | Event-driven on cast/deploy/retrieve, not continuous full-world scans. |
| Aquaculture | Scheduled batches with local detail only when inspected or active. |
| Dungeon Ecology | Room/zone summaries until player proximity promotes occupants. |
| Boss Territory | One persistent state machine plus bounded representatives and environment requests. |
| Save Size | Store definitions by ID, cohorts compactly and only persistent deltas/individuals. |
| Networking | Replicate state changes, summaries and nearby representatives; not every ambient transform. |

Exact numerical budgets remain prototype values pending 26O profiling. The redesign trigger is architectural: if a feature requires one Node, network object or save record per ambient organism, it must be replaced with cohort or instanced representation before content scale-up.

# 54. Prototype Laboratories, Acceptance Tests and Seed Suites

| Laboratory | Proof Goal |
| --- | --- |
| Tide-Pool Foraging Lab | Tides change access; hand harvest consumes local capacity and regrows. |
| Coastal Rod Fishing Lab | Habitat, bait, time, skill, catch handling and storage produce deterministic evidence-backed catches. |
| School Promotion Lab | Regional cohort promotes to school visuals/representatives and reconciles after catches/predation. |
| Kelp Forest Ecology Lab | Producer, grazer, predator and habitat-carrier relationships respond to harvest and restoration. |
| Commercial Voyage Lab | Distant fishing voyage consumes effort and stock, creates catch lots and reconciles on arrival. |
| Aquaculture Lab | Stock, feed, water, disease, labour, escape and harvest persist through save/load. |
| Pollution and Recovery Lab | Contamination changes catch safety and populations; cleanup and time recover specific variables. |
| Stormreef Wreck Lab | Wreck field assembles with currents, air pockets, ecology, salvage and persistent loot/state. |
| Tidal Temple Lab | Entrance and routes follow actual tide and remain solvable with accessibility support. |
| Boss Territory Lab | Crown Reef Leviathan or placeholder boss exposes signs, alternatives, encounter and ecological aftermath. |
| Creature-Vessel Lab | Creature attack/entanglement creates 26L/26G effects without duplicate damage logic. |
| Multiplayer Catch Lab | Two players share gear and cargo without duplication, ownership ambiguity or lost locks. |
| Long-Absence Lab | Years of catch-up remain bounded, explainable and free from total silent collapse. |
| Seed Diversity Suite | Coasts, shelves, reefs, trenches, ports and sites receive coherent but non-repetitive ecology packages. |

Acceptance requires save/load at every lifecycle phase, deterministic reruns from fixed seeds, promotion/demotion reconciliation, resource conservation, no negative cohorts, no duplicated catches, readable failure reasons and accessibility testing with reduced input complexity and non-colour cues.

# 55. Risks, Failure Modes and Redesign Triggers

| Risk | Failure Signal | Required Response |
| --- | --- | --- |
| Ocean Feels Empty | Long travel lacks signs, ecology, routes or opportunities. | Increase layered ambient evidence and authored ecological relationships, not random hostile spawns. |
| Ocean Feels Like Spawn Soup | Unrelated creatures appear everywhere. | Tighten habitat compatibility, density, migration and exclusions. |
| Fishing Is Random Grind | Location/gear/knowledge barely matter. | Strengthen opportunity and method factors; reduce arbitrary rarity rolls. |
| Conservation Is Punishment | Responsible methods are always slower and less rewarding. | Balance quality, law, contracts, research and long-term stock benefits. |
| Population Simulation Explodes | Unbounded cohorts, events or update cost. | Clamp, batch, schedule and aggregate. |
| Visual Fish Become Authority | Catching VFX creates duplicates or impossible stock. | Enforce source reservation and representative links. |
| Dungeons Ignore Water | Dry modules leak, tides are fake or pressure is cosmetic. | Validate marine extension and connected water/air state. |
| Boss Is Just Health Bar | No territory, alternatives or aftermath. | Block release through completeness gate. |
| Killing Is Best Reward | Non-lethal paths lack equivalent knowledge, access or material. | Add authored alternate rewards and renewable sources. |
| Ancestry Locks Content | Only one people can dive, tame or communicate. | Provide equipment, skills, magic, vehicles and services. |
| Distant Sim Deletes Assets | Fleet, companion, catch or site changes without evidence. | Require deterministic audit and recovery policy. |
| Godot Scene Overload | One Node per fish or habitat cell. | Replace with cohorts, grids, instancing and pooled representatives. |

# 56. Production Classification and Relationship with Set 25

| Classification | 26M Content |
| --- | --- |
| Foundation Contract | Terminology, ownership, ecology layers, cohort model, fishing transactions and site/boss extension requirements. |
| Prototype Required | Shore/coastal ecology, simple fishing, catches, one aquaculture example, one marine site and one boss-territory laboratory. |
| Atlas-Dependent | Named creatures, dungeons, bosses, relics, histories and cultural relationships. |
| Registry Expansion | Marine facets, fishing methods, aquaculture, conservation, relationships, reason codes and validation. |
| Balance Draft | Growth, recovery, effort, catchability, depletion, spoilage, damage and reward values. |
| Deferred High Scale | Full commercial fleets, broad invasive ecology, megadungeons, world titans and cross-realm fisheries. |
| Release Evidence | Schema validation, seed suites, transaction tests, save migration, LOD reconciliation, accessibility and performance. |
| Migration Rule | Existing worlds preserve ecology deltas and instances; new definitions cannot silently rewrite catches, companions, sites or boss outcomes. |

Set 25 remains the authority for package manifests, qualified IDs, dependency declarations, extension ownership, release classification, replacement maps, migrations and validation evidence. 26M adds domain contracts that must be registered rather than creating an independent content database.

# 57. Main-Document, Atlas and Forge Integration Matrix

| Document / Tool | Required Update or Consumption |
| --- | --- |
| 03 Blocks | Marine substrate, habitat, aquaculture, trap and preservation block facets. |
| 04 Items | Fishing gear, bait, catch, specimens, tags, preservation and creature materials. |
| 05 Recipes | Gear, processing, preservation, aquaculture, restoration and expedition supplies. |
| 06 Resources | Renewability, ecological source, marine materials and substitution. |
| 07 NPCs | Fisher, diver, aquaculturist, naturalist, handler and rescue work. |
| 08 Automation | Feeders, pumps, sorting, cold storage, monitoring and safe logistics. |
| 09 Magic | Detection, breathing, preservation, healing, communication, current and habitat effects. |
| 10 Creatures | Marine facet inheritance, populations, behaviour, taming and boss hooks. |
| 11 Worldgen | Habitat patches, routes, ecology package selection and seed validation. |
| 12 Structures | Marine sites, reefs, wrecks, farms, sanctuaries and persistent state. |
| 13 Cultures/Factions | Fishing law, stewardship, taboo, trade, handling and boss relationships. |
| 14 Dimensions | Realm marine ecology, invasive risk, routes and guardians. |
| 15 Quests/Events | Fishing contracts, surveys, restoration, migrations, strandings and boss arcs. |
| 16 Combat | Underwater creature actions, injuries, capture and non-lethal tools. |
| 17 UI/UX | Fishing, survey, aquaculture, creature, dungeon and boss interfaces. |
| 19-20 Settlements/Buildings | Fishery facilities, markets, farms, research, rescue and need contributions. |
| 21-23 Forge / Presentation | Creature rigs, school visuals, sockets, audio/VFX, site modules, boss presentation and accessibility metadata. |
| 24C/F/G/H/J/K | Authoritative content identities, ecology, sites, bosses, materials and events. |
| 25A-L | Governance, schemas, relationships, packs, migration, validation and release gates. |
| 26B-L | Water, environment, player, vessels, ports, trade and combat services consumed by 26M. |
| 26N | Final progression, registry, magic, automation, economy, quest and event population. |
| 26O | Final Godot architecture, multiplayer, UI consolidation, budgets and QA plan. |

# 58. Decision Register

| Decision | Status | Reason |
| --- | --- | --- |
| Use cohort-based marine populations with representative entities. | Locked | Supports large oceans, persistent catches and bounded performance. |
| Fishing consumes authoritative abundance or explicit stocked/event sources. | Locked | Prevents infinite spawn-table catches. |
| Ecology uses capability tags, relationships and exclusions. | Locked | Avoids hard-coded species checks and supports content packs. |
| Atlas owns named content; 26M owns execution contracts. | Locked | Preserves source-of-truth boundaries. |
| Bosses require territory, alternatives and aftermath. | Locked | Keeps major encounters connected to the living world. |
| Aquaculture consumes stock, feed, water, labour and time. | Locked | Preserves resource conservation. |
| Dungeons use real water/air/environment state. | Locked | Avoids cosmetic marine levels. |
| No Node per ambient fish. | Locked | Required for Godot scalability. |
| No ancestry-exclusive marine progression. | Locked | Maintains player freedom and representation rules. |
| Exact recovery, catchability and population values remain balance draft. | Prototype Pending | Requires playtesting and performance profiling. |
| Final skill trees, items, recipes, economy and quests belong to 26N. | Locked Boundary | Avoids duplication and premature registry population. |
| Final network cadence and visual budgets belong to 26O. | Locked Boundary | Requires integrated technical profiling. |

# 59. Handoff to Document 26N

Document 26N - Maritime Progression, Registries, Magic, Automation, Economy, Quests and Events must consume the following locked outputs:

1. Marine ecology is cohort-based, habitat-driven, persistent and evidence-bearing.
2. Fishing methods require governed gear capabilities, source abundance, catch transactions, handling and law.
3. Aquaculture requires facilities, stock, feed/productivity, water, health, labour, time and outputs.
4. Marine creatures require aquatic extension facets rather than duplicate creature definitions.
5. Marine dungeons require water, air, pressure, ecology, access, persistence and restoration extensions.
6. Marine bosses require territory, signs, alternative resolutions, aftermath, recurrence and successor state.
7. Named Atlas content remains authoritative and must be registered through Set 25 packages.
8. Skills, perks, items, blocks, recipes, resources, magic, automation, economy, quests and events must not bypass ecological conservation or duplicate source records.
9. Rewards must support peaceful, research, rescue, restoration and stewardship outcomes alongside hunting and combat.
10. Final registry entries require validation reason codes, migration policy, evidence and acceptance tests.

26N may tune progression and populate content, but it may not replace habitat-driven ecology with encounter tables, create catch items without source transactions, or make boss death the only route to required maritime progression.

# Appendix A. Marine Ecology Definition Template

| Field Group | Required Fields |
| --- | --- |
| Identity | qualified_id, version, display_key, owner_pack, classification, dependencies |
| Habitat | depth, substrate, temperature, salinity, oxygen, clarity, motion, productivity, shelter, magical fields |
| Roles | producer/consumer/predator/scavenger/engineer/guardian relationships |
| Population | baseline cohorts, carrying capacity, recruitment, mortality, recovery class, density limits |
| Lifecycle | stages, reproduction, season, spawning ground, nursery, migration and longevity |
| Pressure | harvest, pollution, disease, invasive, settlement, boss and climate modifiers |
| Outputs | resources, signs, encounters, research, events and restoration |
| LOD | regional update, local promotion, representative budget and persistence |
| Validation | required links, exclusions, seed tests, reason codes and evidence |

# Appendix B. Fishing Method and Catch Templates

## B.1 Fishing Method Definition

| Field | Purpose |
| --- | --- |
| method_id / version | Stable governed identity. |
| deployment_mode | Hand, cast, placed, towed, dived, mounted or magical. |
| required_capabilities | Gear, vessel, actor, crew, environment and permit. |
| target_tags / exclusions | Compatible families, size classes, habitats and protected exclusions. |
| selectivity | Bycatch, juvenile escape, habitat damage and release survival. |
| effort_model | Time, count, distance, bait, energy, mana or labour. |
| interaction_profile | Bite, tension, closure, strike, lift, wait or batch resolution. |
| failure_states | Break, loss, escape, overload, injury, entanglement and legal violation. |
| outputs | Catch, bycatch, debris, knowledge, gear wear and population delta. |
| presentation | Animation, audio, VFX, controls and accessibility alternatives. |

## B.2 Catch Runtime Record

| Field | Purpose |
| --- | --- |
| catch_id | Stable runtime identity or lot link. |
| source_cohort_id | Population source reservation. |
| family_id / variant_id | Definition source. |
| method_id | Acquisition provenance. |
| actor / vessel / crew | Responsible parties and ownership. |
| location / time / environment | Law, research and quality evidence. |
| quantity / size_class | Inventory and contract amount. |
| condition / freshness / contamination | Welfare, food safety and value. |
| handling / release_result | Survival and quality. |
| transaction_ids | Inventory, quota, contract and population commits. |

# Appendix C. Marine Creature Facet Template

| Facet | Required Fields |
| --- | --- |
| Environment | water types, depth, pressure, temperature, oxygen, substrate and realm law |
| Movement | swim modes, speed bands, turn, vertical, breach, bottom, current and shore |
| Respiration | mode, surfacing, air storage, distress and out-of-water tolerance |
| Senses | vision, vibration, sound, scent, electrical, pressure, mana and memory |
| Ecology | diet, trophic role, predators, prey, services, lifecycle and population |
| Behaviour | sociality, territory, fear, curiosity, aggression, communication and training |
| Interaction | player, vessel, structure, fishing, capture, rescue and handling |
| Combat | actions, weak points, resistances, grabs, entanglement and 26L packets |
| Resources | shed, sample, harvest, carcass, protected and substitute sources |
| Presentation | rig, school, silhouette, animation, audio, VFX, icon and accessibility |

# Appendix D. Marine Site and Dungeon Template

| Field Group | Required Fields |
| --- | --- |
| Identity | site family, origin, purpose, age, culture/faction, state and pack |
| Placement | region, depth, topology, routes, nearby settlements, exclusions and rarity |
| Water / Air | volumes, tide, pressure, pumps, seals, pockets, contamination and breach |
| Access | entrances, commitment, retreat, rescue, vehicles, gear and alternate routes |
| Grammar | zones, rooms, connections, hazards, puzzles, ecology and boss sockets |
| Occupation | native ecology, invasives, factions, survivors, guardians and law |
| Rewards | resources, salvage, knowledge, relics, infrastructure and social outcomes |
| Persistence | loot, water, power, doors, damage, ecology, ownership and restoration |
| Validation | connectivity, counterplay, accessibility, seed, LOD and save tests |

# Appendix E. Marine Boss Territory and Encounter Template

| Field Group | Required Fields |
| --- | --- |
| Identity | boss_id, classification, personhood, recurrence, pack and dependencies |
| World Function | ecology, route, weather, resource, settlement, law, dungeon or realm process |
| Territory | regions, route, lair, spawning/nursery, boundaries and civilian buffers |
| Evidence | tracks, water/weather halo, populations, wrecks, sounds, rumours and faction response |
| Threat Clock | dormant, warning, active, crisis, de-escalation and recurrence triggers |
| Encounter | models, objectives, phases, weak points, hazards, retreat and re-entry |
| Alternatives | avoid, communicate, heal, protect, redirect, bind, relocate, capture or kill |
| Rewards | knowledge, material, access, alliance, infrastructure and progression alternatives |
| Aftermath | ecology, routes, settlements, factions, site state, successor and world history |
| Validation | completeness gate, accessibility, multiplayer, LOD, save and migration evidence |

# Appendix F. Validation Reason Codes

| Code | Meaning |
| --- | --- |
| MARINE_ECOLOGY_NO_COMPATIBLE_HABITAT | Creature or package has no valid local habitat. |
| MARINE_ECOLOGY_TROPHIC_LINK_MISSING | Required food-web relationship cannot resolve. |
| MARINE_COHORT_NEGATIVE_ABUNDANCE | Transaction would reduce cohort below zero. |
| MARINE_COHORT_CAPACITY_INVALID | Carrying-capacity inputs are missing or impossible. |
| MARINE_MIGRATION_ROUTE_BROKEN | Required route has no valid path or timing. |
| FISH_METHOD_CAPABILITY_MISSING | Actor, gear, vessel or environment lacks required capability. |
| FISH_SOURCE_UNAVAILABLE | No valid authoritative source cohort or stock exists. |
| FISH_CATCH_CAPACITY_EXCEEDED | Gear, container, vessel or quota capacity is exceeded. |
| FISH_PROTECTED_RESTRICTION | Method, family, season or area is restricted. |
| FISH_TRANSACTION_CONFLICT | Catch source, inventory or ownership transaction cannot commit atomically. |
| AQUACULTURE_WATER_UNSUITABLE | Water state does not meet stock requirements. |
| AQUACULTURE_STOCK_OVER_CAPACITY | Managed stock exceeds validated site capacity. |
| AQUACULTURE_HEALTH_CRITICAL | Disease, oxygen, contamination or feed state blocks operation. |
| MARINE_SITE_WATER_STATE_INVALID | Site rooms, seals, air and connected water cannot reconcile. |
| MARINE_SITE_ACCESS_UNREACHABLE | No valid entrance, retreat or progression route exists. |
| MARINE_SITE_ECOLOGY_INCOMPATIBLE | Occupant or resource package conflicts with site habitat/state. |
| MARINE_BOSS_TERRITORY_INCOMPLETE | Boss lacks required territory or world-function links. |
| MARINE_BOSS_ALTERNATIVES_MISSING | Major boss package lacks valid non-damage resolution review. |
| MARINE_BOSS_AFTERMATH_MISSING | Outcome does not define ecological and world-state consequences. |
| MARINE_LOD_RECONCILIATION_FAILED | Representative and cohort state cannot merge safely. |
| MARINE_SAVE_MIGRATION_UNRESOLVED | Existing state cannot map to current definitions safely. |

# Appendix G. Prototype and Acceptance Matrix

| System | Minimum Acceptance |
| --- | --- |
| Habitat | Same seed resolves same patches/packages; incompatible families never appear. |
| Cohorts | Recruitment, mortality, harvest and migration remain non-negative, bounded and auditable. |
| Fishing | Source reservation, catch output and inventory commit are atomic. |
| Gear | Condition and capability alter results with readable reasons. |
| Bycatch / Law | Restrictions and release outcomes work with configurable complexity. |
| Aquaculture | Inputs, growth, disease, escape and harvest persist. |
| Creature AI | At least one school, one predator and one large creature show distinct motives. |
| Vessel Interaction | Creature force/damage calls 26G/26L without duplicate authority. |
| Dungeon | Marine site has valid water, air, access, ecology, loot and save state. |
| Boss | Territory, evidence, alternative outcome, combat path and aftermath all execute. |
| LOD | Promotion/demotion preserves abundance, individuals, catches and injuries. |
| Multiplayer | Shared actions remain authoritative and duplication-free. |
| Accessibility | Fishing and boss play function without colour-only, sound-only or rapid-input-only cues. |
| Performance | Representative and cohort budgets remain within profiled 26O targets. |

# Appendix H. Completion Checklist

- [ ] Marine ecology state layers and ownership boundaries approved.

- [ ] Habitat suitability and exclusion schema registered.

- [ ] Population cohort and migration records implemented.

- [ ] Fishing method, opportunity and catch transactions validated.

- [ ] At least one selective early fishing loop playable.

- [ ] Bycatch, release and conservation settings tested.

- [ ] Aquaculture prototype consumes real inputs and persists.

- [ ] Marine creature facets integrated with shared creature system.

- [ ] School/pod presentation tied to authoritative cohorts.

- [ ] Creature-vessel interaction uses 26G/26L interfaces.

- [ ] One Atlas marine dungeon family assembled and saved.

- [ ] Marine site water/air/access validators pass.

- [ ] One marine boss territory supports at least two valid resolutions.

- [ ] Boss aftermath changes ecology and world state.

- [ ] Distant simulation reconciles with local physical state.

- [ ] Multiplayer and split-screen interactions tested.

- [ ] Accessibility and comfort options verified.

- [ ] Set 25 IDs, packages, migrations and release evidence complete.

- [ ] 26N integration backlog created.

- [ ] 26O performance and technical consolidation requirements recorded.
