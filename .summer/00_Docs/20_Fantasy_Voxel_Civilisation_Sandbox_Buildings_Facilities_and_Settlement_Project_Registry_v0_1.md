# Fantasy Voxel Civilisation Sandbox

## 20 - Buildings, Facilities and Settlement Project Registry

*Version 0.1 - Master Framework and Registry Architecture Draft*

A modular, database-ready building registry for settlement needs, construction projects, upgrade families, player blueprints, autonomous village growth, districts, infrastructure, magic, automation, cultures, and civilisation-scale expansion.

| **Field**       | **Locked Direction**                                                                                                                                                                                                  |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Format | Use one master Document 20 plus companion subdocuments. Do not place the complete building catalogue, every detailed entry, every culture variant, and every district project into one monolithic file.               |
| Master Role     | Document 20 owns shared rules, terminology, schemas, needs integration, stage logic, category index, upgrade rules, project-selection rules, and the cross-document master register.                                  |
| Companion Role  | Documents 20A-20H own the detailed building families, project entries, culture packs, district complexes, and production backlog.                                                                                     |
| Core Philosophy | Buildings are functional civilisation systems. Every entry must provide shelter, goods, jobs, services, safety, infrastructure, culture, progression, or meaningful world-state change.                               |
| Main Needs      | Housing, Provisions, Health, Work, Safety, Infrastructure, and Morale are the only seven main settlement needs.                                                                                                       |
| Source of Truth | A stable building registry should eventually exist as structured data for Godot Resources, JSON/CSV or spreadsheet round-tripping. The documents remain the readable design-bible layer.                              |
| POC Direction   | Begin with approximately 30 functional buildings supporting Camp → Hamlet → Village, including visible construction stages, real resources, NPC jobs, player-designed alternatives, and changed defence outcomes. |
| Scale Direction | Plan approximately 80-120 universal building families before culture packs, then expand through upgrades, size variants, style kits, district templates, signature structures, and megaprojects.                      |

# Document Purpose

This document establishes the master framework for every building, facility, public space, utility, fortification, district component, civic complex, and settlement-scale project that can be built, upgraded, repaired, supplied, occupied, automated, magically enhanced, or replaced in Leyforge.

The complete building catalogue will be too large and too interconnected to remain useful as one enormous document. A single file would become difficult to review, update, search, version, convert to structured data, and use as an AI development source. Document 20 therefore acts as the shared rulebook and index, while companion documents divide the detailed content into coherent functional groups.

The registry does not replace the player voxel blueprint system. Document 19 defines how a blueprint is created, stored, validated, constructed, shared, and integrated into settlements. Document 20 defines what a building means to the settlement simulation: what it provides, what it consumes, who works or lives there, which needs it supports, how it upgrades, when NPC planners may choose it, and which functional markers a valid player blueprint must contain.

# Why the Registry Is Split

- Building families cross many settlement stages and may have several upgrade branches, sizes, culture palettes, biome adaptations, damage states, and player-created blueprint alternatives.

- Infrastructure, roads, utilities, walls, public spaces, district plans, and megaprojects are settlement projects but do not behave exactly like ordinary occupied buildings.

- Culture packs should override appearance, layout preferences, room rules, materials, and signature functions without duplicating every universal building definition.

- The human-readable documents and the machine-readable registry need clear ownership boundaries so that data can later be imported into Godot without copying contradictory values between files.

- A split suite lets each companion file remain readable while the master document preserves one coherent civilisation model.

> **Locked File Strategy**
>
> Document 20 will not become a 300-page monolith. It will remain the master framework, index, schema, and cross-system rulebook. Detailed building families will be drafted in companion files 20A-20H and linked through stable IDs.

# Design Source

| **Source Document**                                      | **Relevant Direction**                                                                                                       | **How Document 20 Uses It**                                                                                                                                     |
|----------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible                            | Magic and factories build civilisations, unlock stories, power settlements, and reshape the world.                           | Buildings are the visible physical layer where civilisation growth, production, magic, defence, culture, and story become world change.                         |
| 01 - Core Gameplay Loop                                  | Explore → gather → craft → build → interact → automate → defend → upgrade → expand.                          | Building projects convert resources and player actions into new settlement capability and future goals.                                                         |
| 03 - Blocks Registry                                     | Buildings are composed from placeable voxel blocks, shapes, states, functional blocks, damage states, and material families. | Building entries define functional requirements; blueprint definitions resolve those requirements into actual voxel blocks and markers.                         |
| 05 - Crafting and Recipe Registry                        | Large village builds use staged Project Recipes, exact inputs, reservations, time, labour, stations, and consequences.       | Every buildable entry links to a project definition or generated project recipe with construction stages and real resource use.                                 |
| 06 - Resource Progression                                | Resources remain useful through construction, repair, tools, automation, village needs, trade, magic, and culture.           | Building demand becomes one of the main long-term sinks for common and advanced resources.                                                                      |
| 07 - NPC Village System                                  | Villages have named residents, jobs, warehouses, projects, repairs, raids, growth stages, and simulation LOD.                | Buildings provide homes, job sites, service capacities, storage, defence, and growth gates to the village simulation.                                           |
| 08 - Automation System                                   | Automation supplies warehouses, projects, production, logistics, power, mana, and NPC labour.                                | Building entries expose input, output, storage, transport, power, mana, and permission sockets.                                                                 |
| 09 - Magic System                                        | Magic is practical infrastructure for villages, wards, rituals, healing, automation, farming, travel, and defence.           | Magical buildings are treated as functional settlement infrastructure rather than decorative fantasy towers.                                                    |
| 11 - Biomes and World Generation                         | Terrain, climate, water, resources, roads, danger, and culture affect settlement placement and development.                  | Each building or project records terrain, biome, climate, access, and foundation constraints.                                                                   |
| 12 - Structures                                          | Structures use blueprints, markers, states, ownership, damage, repair, culture, worldgen, and simulation LOD.                | The registry distinguishes settlement buildings from unrelated ruins and landmarks while sharing the same dynamic structure foundation.                         |
| 13 - Races, Peoples, Cultures and Factions               | Cultures and factions have architecture, laws, technologies, magic, goods, and signature structures.                         | Universal function definitions are separated from culture-specific style kits, replacements, preferences, and signature buildings.                              |
| 16 - Combat, Gear and Defence                            | Walls, towers, gates, guards, wards, shelters, and supply affect raid outcomes and persistent damage.                        | Defence buildings expose protection coverage, readiness, target value, damage states, and guard requirements.                                                   |
| 17 - UI/UX System                                        | The UI should be world-first, readable, layered, inspectable, and avoid excessive bars or micromanagement.                   | The registry supports seven visible settlement needs with drill-down causes rather than dozens of separate meters.                                              |
| 19 - Settlement Growth and Player Voxel Blueprint System | Players design blueprints in-world and from the main menu; NPCs use staged construction and autonomous settlement planning.  | Document 20 supplies the functional building definitions, project eligibility, markers, upgrade families, and validation requirements used by those blueprints. |

# Static Table of Contents

- 1\. Locked Building Registry Identity

- 2\. Locked Decision Summary

- 3\. Document Suite and File Architecture

- 4\. Source of Truth, Ownership, and Data Flow

- 5\. Building Taxonomy and Registry Layers

- 6\. Seven Main Settlement Needs

- 7\. Need Demand, Capacity, and Status Calculation

- 8\. Building Runtime States and Shared Calculations

- 9\. Parent Building Data Model and Registry Fields

- 10\. Construction Projects, Stages, Resources, and Labour

- 11\. Upgrade Families, Branches, Conversion, and Replacement

- 12\. Settlement Stage Matrix and Capability Expectations

- 13\. Required, Optional, and Conditional Project Pools

- 14\. Parcels, Terrain, Roads, Access, and Placement Rules

- 15\. Residents, Jobs, Staffing, Tools, and Service Capacity

- 16\. Inputs, Outputs, Storage, Trade, and Production

- 17\. Utilities, Networks, Power, Mana, and Logistics

- 18\. Culture, Faction, Biome, Climate, and Realm Variation

- 19\. Player Blueprints and Existing-Town Integration

- 20\. Autonomous Project Selection and Growth Planning

- 21\. Damage, Repair, Maintenance, Renovation, and Abandonment

- 22\. Master Building Category Index

- 23\. POC Camp-to-Village Building Set

- 24\. Alpha, Beta, and Full-Game Scale Targets

- 25\. Sample Detailed Building Entries

- 26\. Content Production and Validation Workflow

- 27\. Balancing Rules and Scope Controls

- 28\. Open Questions and Deferred Decisions

- 29\. Recommended Drafting Sequence

- Appendix A. Building Registry Field Template

- Appendix B. Need Contribution and Service-Capacity Template

- Appendix C. Settlement Stage Matrix Template

- Appendix D. Stable ID and Naming Conventions

- Appendix E. POC Acceptance Criteria

# 1. Locked Building Registry Identity

The Buildings, Facilities and Settlement Project Registry is the functional content layer of Leyforge settlements. It defines what settlements can construct, what each project does, how it changes the seven main needs, which people and resources it requires, how it connects to roads and utilities, and how it advances from temporary camps into cities, capitals, magical metropolises, and civilisation-scale wonders.

> **Locked Rule**
>
> A building or settlement project must not exist only because a list needs more content. Every meaningful entry must provide housing, provisions, health, work, safety, infrastructure, morale, economy, governance, culture, story, progression, defence, automation, magic, or visible world-state change.

| **Identity Layer**               | **Design Meaning**                                                                                                                       | **Player-Facing Result**                                                                                    |
|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Functional Civilisation Content  | Buildings contain homes, job sites, services, storage, roads, utilities, defences, magic, governance, and culture.                       | Settlement growth creates visible capability rather than only increasing a population number.               |
| Resource Sink and Transformation | Projects reserve and consume real materials through staged construction, furnishing, activation, maintenance, and repair.                | Mining, farming, crafting, trade, and automation visibly become homes, workshops, walls, wards, and cities. |
| Living Workplace                 | Named NPCs live, work, eat, heal, socialise, defend, learn, trade, and perform services through buildings.                               | A structure matters because people use it and depend on it.                                                 |
| Player Creativity                | Player blueprints may satisfy universal functional definitions and enter village project pools when permissions and validation allow it. | Players can shape the architecture and layout of custom or existing settlements.                            |
| Autonomous Growth                | NPC planners select projects according to stage gates, needs, culture, terrain, resources, danger, and story.                            | Villages can grow without constant orders while still responding strongly to player support.                |
| Cultural Identity                | Universal functions can be expressed through different layouts, materials, traditions, laws, and signature structures.                   | Settlements feel culturally distinct without duplicating every system rule.                                 |
| Scalable Data                    | Stable IDs, parent templates, tags, capacities, links, and companion registries support Godot data import and AI-assisted production.    | The catalogue can grow without becoming a collection of contradictory one-off assets.                       |

## 1.1 Design Promise

A player should be able to inspect any settlement building and understand what it is, who uses it, what it needs, what it produces or provides, whether it is functioning, why it is blocked, how it can be upgraded, and what would happen if it were damaged or removed.

## 1.2 What This Registry Is Not

- It is not one enormous list where every material palette or roof colour becomes a separate building family.

- It is not a decorative asset catalogue disconnected from NPC jobs, resources, needs, roads, utilities, or progression.

- It is not a requirement for the player to micromanage every resident, room, meal, tool, or daily repair.

- It is not a single fixed linear upgrade path for every settlement or culture.

- It is not a replacement for voxel blueprint files, block definitions, recipes, NPC data, district plans, or culture data.

- It is not necessary to implement every planned building before the Camp-to-Village loop is proven.

# 2. Locked Decision Summary

| **Area**                 | **Locked Decision**                                                                                                                                        |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| File Structure           | Use a master document and companion subdocuments rather than a single extremely large file.                                                                |
| Main Needs               | Housing, Provisions, Health, Work, Safety, Infrastructure, and Morale.                                                                                     |
| Need Presentation        | Show readable states and trends on the normal settlement view; detailed causes appear only when inspected.                                                 |
| Registry Unit            | Catalogue functional building definitions and upgrade families, not every visual blueprint variation.                                                      |
| Blueprint Relationship   | Many voxel blueprints may satisfy one building definition; one blueprint may also contain several compatible mixed-use functions.                          |
| Resource Use             | Construction, furnishing, activation, repairs, maintenance, and production use real stored resources.                                                      |
| NPC Use                  | Buildings expose homes, job sites, service points, schedules, storage, interaction markers, and emergency behaviour.                                       |
| Project Selection        | NPC planners choose required, optional, or conditional projects based on stage, needs, terrain, resources, culture, danger, story, and player permissions. |
| Culture Direction        | Separate universal function from architecture and material identity. Cultures may prefer, replace, forbid, or add building families.                       |
| Infrastructure Direction | Roads, bridges, walls, utilities, public spaces, and district systems are first-class settlement projects even when they are not occupied buildings.       |
| POC Scope                | Approximately 30 functional buildings and projects proving Camp → Hamlet → Village.                                                                    |
| Full Scale               | Approximately 80-120 universal families before culture packs; later expansion through branches, sizes, variants, clusters, districts, and wonders.         |
| Data Direction           | Use stable IDs and database-ready fields suitable for Godot Resource generation, JSON/CSV, validation, save migration, and mod packages.                   |
| Balance Direction        | Prefer a small number of meaningful capacities and blockers. Avoid turning every building into a bespoke simulation with unique meters.                    |

# 3. Document Suite and File Architecture

Document 20 owns the rules that every companion file must obey. The companion files contain detailed registries organised by function so that entries remain searchable and maintainable. Building families should never be duplicated across companions; cross-category relationships are handled with links and tags.

| **File**                                                             | **Primary Scope**                                                                                                                               | **Examples**                                                                                       |
|----------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| 20 - Master Framework                                                | Shared identity, needs, schema, taxonomy, stage rules, project logic, master category index, POC roster, naming, and cross-document governance. | This document.                                                                                     |
| 20A - Housing, Provisions, Health and Community                      | Homes, food systems, water access, healthcare, welfare, hospitality, culture, recreation, faith, and community services.                        | Cottages, farms, granaries, kitchens, clinics, inns, shrines, theatres, gardens.                   |
| 20B - Work, Extraction, Crafting, Trade and Education                | Resource jobs, workshops, production, commerce, schools, guilds, research, and professional services.                                           | Mines, sawmills, smithies, markets, libraries, academies, guild halls.                             |
| 20C - Governance, Safety, Defence, Justice and Emergency             | Administration, law, guard systems, walls, towers, barracks, prisons, shelters, fire and disaster response.                                     | Village hall, gatehouse, watchtower, armoury, courthouse, refuge bunker.                           |
| 20D - Infrastructure, Storage, Roads, Transport and Utilities        | Warehouses, roads, bridges, ports, logistics, water, sanitation, lighting, heating, waste, and public networks.                                 | Village warehouse, stone road, aqueduct, rail depot, pump house, sewer project.                    |
| 20E - Magic, Automation, Power, Industry and Dimensional Systems     | Mana infrastructure, wards, ritual sites, machines, power generation, factories, golems, portals, and realm-facing facilities.                  | Mana furnace, ward tower, foundry, generator hall, golem yard, portal station.                     |
| 20F - Districts, Clusters, Civic Complexes, Megaprojects and Wonders | Multi-building plans, service complexes, walls, districts, capitals, floating structures, and civilisation-scale projects.                      | Farmstead cluster, market district, citadel, grand university, leyline crown.                      |
| 20G - Culture, Faction, Biome and Realm Signature Packs              | Architectural preferences, substitutions, unique markers, forbidden functions, signature families, and realm adaptations.                       | Dwarven forge halls, fae living homes, desert cistern courts, void containment sites.              |
| 20H - Detailed Catalogue, Stage Matrix and Production Backlog        | The living numbered master catalogue, stage mapping, implementation state, asset counts, blueprint coverage, and production priorities.         | All approved building IDs, statuses, required blueprints, variants, and implementation milestones. |

## 3.1 Recommended File Size

- Document 20 should remain approximately 25-50 pages after refinement because it contains shared rules rather than every detailed entry.

- Companion registries should generally remain below approximately 60-80 pages; split again only if a section becomes difficult to navigate.

- Large repeated tables should eventually live in a spreadsheet or structured registry and be summarised in the readable documents.

- Each companion file should include its own static contents, category index, detailed entries, cross-links, and implementation status.

# 4. Source of Truth, Ownership, and Data Flow

| **Data Layer**          | **Owns**                                                                                                                                 | **Does Not Own**                                                     |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Building Definition     | Function, category, capacities, jobs, needs, inputs, outputs, prerequisites, sockets, upgrade links, planner tags, and validation rules. | Exact voxel coordinates or runtime damage.                           |
| Voxel Blueprint         | Block volume, material tokens, construction-stage masks, rooms, markers, access points, sockets, terrain rules, and visual layout.       | Settlement demand or permanent building identity.                    |
| Project Definition      | Construction stages, reserved inputs, labour, tools, time, scaffolding, activation, contribution tracking, and failure rules.            | The final runtime residents or production history.                   |
| Runtime Building Record | Placed blueprint version, owner, condition, staffing, active inputs, output buffers, maintenance, damage, upgrades, and service status.  | Immutable catalogue rules.                                           |
| Settlement Record       | Population, needs, districts, laws, project pools, active projects, culture, stage, permissions, and growth state.                       | Individual voxel blocks.                                             |
| Warehouse and Inventory | Actual items, reservations, deliveries, project stock, production inputs, output stock, and ownership.                                   | Abstract free resources invented by buildings.                       |
| Godot Registry Layer    | Validated imported Resources or equivalent runtime definitions resolved by stable IDs.                                                   | Authoritative balancing values that exist only in hard-coded scenes. |

> **Single-Source Rule**
>
> A value should have one owner. For example, bed capacity belongs to the building definition and its validated blueprint markers; actual occupied beds belong to runtime records. Construction resources belong to the project definition; the warehouse owns whether those resources exist.

# 5. Building Taxonomy and Registry Layers

| **Term**               | **Definition**                                                                                | **Example**                                      |
|------------------------|-----------------------------------------------------------------------------------------------|--------------------------------------------------|
| Building Family        | A broad functional lineage that shares identity and upgrade relationships.                    | Blacksmith family.                               |
| Building Definition    | One functional tier or branch with stable rules and capacities.                               | Village Blacksmith.                              |
| Blueprint              | One valid voxel layout satisfying the definition.                                             | Forest-culture medium smithy layout 02.          |
| Style Variant          | A material, ornament, roof, climate, culture, or biome expression of a blueprint.             | Snow-roof timber smithy.                         |
| Upgrade Branch         | A valid transition that changes capability, scale, specialisation, or technology.             | Village Blacksmith → Town Forge or Rune Forge. |
| Mixed-Use Definition   | A building containing multiple compatible functions and validated marker sets.                | Shop below with family housing above.            |
| Infrastructure Project | A non-building physical project that provides access, network, coverage, or protection.       | Stone road, aqueduct, wall segment.              |
| Cluster Template       | A small group of buildings, parcels, yards, and paths that function together.                 | Farmstead cluster.                               |
| District Template      | A road and parcel plan with service expectations and preferred building pools.                | Artisan district.                                |
| Civic Complex          | Several linked buildings acting as one service or government institution.                     | Hospital campus or council complex.              |
| Megaproject            | A multi-stage, multi-site or civilisation-scale project with major world effects.             | Portal nexus or floating district anchor.        |
| Wonder                 | A unique or rare culture-defining project with prestige, story, and world-state consequences. | Leyline Crown.                                   |

# 6. Seven Main Settlement Needs

Only seven categories appear as the main settlement needs. Other systems are calculations, services, stocks, progression conditions, or drill-down causes. This prevents the settlement UI from becoming a wall of bars while preserving meaningful simulation underneath.

| **Need**       | **Represents**                                                                                           | **Common Building Contributions**                                  |
|----------------|----------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| Housing        | Suitable shelter, beds, household compatibility, weather protection, privacy, and spare capacity.        | Huts, cottages, apartments, dormitories, assisted housing.         |
| Provisions     | Food, water access, fuel, clothing basics, preservation, seasonal reserve, and emergency supply.         | Farms, wells, kitchens, granaries, bakeries, cold stores.          |
| Health         | Treatment, prevention, medicine, sanitation support, recovery, quarantine, and corruption cleansing.     | Healer hut, clinic, hospital, bathhouse, sanitation works.         |
| Work           | Useful jobs, job sites, tools, materials, specialist access, training, and productive labour.            | Mines, workshops, markets, schools, guild halls, factories.        |
| Safety         | Protection from raids, monsters, crime, fire, disaster, corruption, and unsafe routes.                   | Guard posts, walls, towers, lighting, wards, shelters.             |
| Infrastructure | Storage, access, roads, logistics, water systems, sanitation, repair, power, mana, and service networks. | Warehouses, bridges, roads, pumps, depots, utility relays.         |
| Morale         | Social stability, culture, leadership confidence, celebrations, belonging, beauty, memory, and hope.     | Community halls, shrines, gardens, theatres, memorials, festivals. |

## 6.1 Systems That Are Not Main Needs

- Population and migration are settlement statistics and progression pressures.

- Economy and trade are production, consumption, price, route, treasury, and contract systems.

- Governance and reputation are law, leadership, trust, fear, faction, ownership, and permission systems.

- Projects and growth are stage eligibility, resource reservation, labour, site, and construction systems.

- Story and culture progression are milestones, events, traditions, archives, rituals, factions, and dimension gates.

- Power and mana are utility networks that contribute to Infrastructure and unlock specific building functions; they are not separate universal need bars.

# 7. Need Demand, Capacity, and Status Calculation

The settlement should calculate need status from demand versus effective service capacity. Exact values remain balance draft, but all building entries must use the same framework rather than inventing unrelated scoring systems.

> **Core Calculation**
>
> Effective Contribution = Base Capacity x Condition x Staffing x Inputs x Access x Required Utilities x Culture/Climate Suitability. Need Demand = Population Demand + Settlement-Stage Expectation + Seasonal Pressure + Event Pressure + Local Risk. Need Ratio = Total Effective Contribution / Total Demand.

| **Displayed State** | **Draft Ratio** | **Meaning**                                                                                                       |
|---------------------|-----------------|-------------------------------------------------------------------------------------------------------------------|
| Thriving            | 1.25 or higher  | The settlement has strong capacity, resilience, and useful spare provision.                                       |
| Stable              | 1.00-1.24       | Current demand is met without major spare capacity.                                                               |
| Strained            | 0.75-0.99       | A shortage or service gap exists but normal life continues.                                                       |
| Critical            | 0.40-0.74       | The settlement is vulnerable and negative events or emergency behaviour are likely.                               |
| Collapsed           | Below 0.40      | The need cannot support normal settlement function; migration, death, shutdown, unrest, or abandonment may occur. |

The normal settlement overview shows the state, trend, and one or two primary causes. Detailed values appear only in drill-down screens. Exact ratios, thresholds, and update intervals are balance-draft values and may change after POC testing.

## 7.1 Demand Is Stage-Aware

A Hamlet should not be penalised for lacking city sewers, universities, rail depots, or a portal nexus. Each settlement stage defines expected capabilities. Advanced buildings satisfy new expectations and increase resilience, but absent late-game services do not create early-game shortages.

## 7.2 Coverage and Capacity

- Capacity measures how many residents, jobs, patients, animals, items, or production cycles a building can support.

- Coverage measures which parcels, roads, districts, or residents can actually reach or receive a service.

- A large hospital with no safe road, staff, medicine, or access does not provide full Health capacity.

- A watchtower may provide local detection coverage but not full settlement Safety if approaches remain unprotected.

- A warehouse may have free storage but contribute little Infrastructure if routes are blocked or permissions prevent use.

# 8. Building Runtime States and Shared Calculations

| **Shared State**    | **Calculated From**                                                                                        | **Player-Facing Meaning**                                              |
|---------------------|------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Activation          | Construction completion, inspection, markers, permissions, staffing, and required utilities.               | Planned, building, functional, paused, disabled, abandoned, or ruined. |
| Condition           | Damage, decay, fire, siege, corruption, weather, maintenance, and repairs.                                 | How much of the building remains safe and usable.                      |
| Staffing            | Required jobs, assigned workers, schedules, skills, injury, and access.                                    | Whether the service or production can operate.                         |
| Inputs              | Available materials, fuel, food, medicine, mana, tools, components, and permissions.                       | Why production or service is running, reduced, or blocked.             |
| Outputs             | Produced items, service capacity, storage, protection, knowledge, housing, or network throughput.          | What the settlement gains from the building.                           |
| Tools and Equipment | Workplace tools, durability, upgrades, guard gear, medical tools, and specialist equipment.                | Whether workers can perform the job effectively.                       |
| Access              | Doors, paths, roads, navigation, hauling routes, district permissions, and emergency access.               | Whether residents and goods can reach the building.                    |
| Utilities           | Water, drainage, fuel, mechanical power, electricity-like power, mana, wards, heat, and lighting.          | Whether required infrastructure is connected and stable.               |
| Capacity            | Beds, job slots, patient slots, storage, animals, service radius, throughput, or defence strength.         | The amount of demand the building can satisfy.                         |
| Maintenance         | Routine materials, labour, cleaning, repairs, replacement parts, and inspection.                           | The long-term cost of keeping the building functional.                 |
| Risk                | Fire, collapse, industrial injury, magical instability, pollution, corruption, attack value, and sabotage. | What can go wrong and how the settlement can mitigate it.              |

> **Scope Control**
>
> Every building uses these shared states. Special families may add a small extension, but should not invent an entirely new parallel needs system or a unique collection of routine meters.

# 9. Parent Building Data Model and Registry Fields

The parent model is split into identity, function, placement, project, runtime, UI, and planning fields. Detailed companion documents may add category-specific extensions, but universal fields must remain consistent.

| **Field Group**      | **Required Fields**                                                                                                               |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Identity             | building_id, family_id, display_name_key, description_key, category, subcategory, tags, scope, version, aliases.                  |
| Classification       | structure_kind, size_class, occupancy_type, ownership_type, public_private, settlement_stage_min, settlement_stage_max.           |
| Need Contribution    | primary_needs, secondary_needs, base_capacity_by_need, coverage_type, resilience, demand_created.                                 |
| Population and Jobs  | resident_capacity, household_rules, job_slots, job_types, specialist_requirements, visitor_capacity, schedule profile.            |
| Inputs and Outputs   | consumed tags/items, produced tags/items, service outputs, storage categories, buffers, batch/time rules.                         |
| Utilities and Access | road sockets, path sockets, water, drainage, fuel, power, mana, ward, logistics, emergency-access requirements.                   |
| Placement            | footprint range, height range, terrain rules, slope, foundation mode, biome/climate tags, district preferences, separation rules. |
| Construction         | project_definition_id, stage count, material tokens, tools, labour, build time, scaffolding, activation stage, furnishing.        |
| Progression          | prerequisites, unlock sources, upgrade_from, upgrade_to, branches, conversion rules, research, reputation, story, culture gates.  |
| Risk and Condition   | damage profile, fire risk, siege target value, corruption risk, failure states, maintenance schedule, repair project.             |
| Blueprint Validation | required rooms, markers, beds, workstations, doors, clearance, sockets, navigation, safety, maximum/minimum bounds.               |
| Autonomous Planning  | required/optional/conditional class, planner tags, need weights, redundancy, maximum count, spacing, priority modifiers.          |
| UI and Knowledge     | icon, map symbol, visibility, known/hidden state, summary fields, warnings, tutorial notes, codex links.                          |
| Planning Metadata    | POC/Alpha/Beta/Final/Deferred, design status, blueprint coverage, art coverage, implementation status, balance notes.             |

# 10. Construction Projects, Stages, Resources, and Labour

Every buildable entry must link to a construction project. The project may be explicit for important structures or generated from blueprint stage masks and functional components for ordinary buildings.

| **Standard Stage**                 | **Typical Content**                                                                                  | **Possible Activation**                          |
|------------------------------------|------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| 0\. Planning and Reservation       | Site claim, ghost outline, parcel lock, project sign, resource reservation, path and utility checks. | No building function.                            |
| 1\. Site Preparation               | Clear vegetation, level ground, excavate, create access, install supply crates and scaffolds.        | Temporary builder access.                        |
| 2\. Foundations                    | Footings, stilts, retaining walls, drainage base, structural anchors.                                | Limited storage or project staging.              |
| 3\. Frame and Primary Structure    | Beams, columns, floors, stairs, load-bearing walls, main shell.                                      | Emergency shelter in some projects.              |
| 4\. Enclosure and Weatherproofing  | Walls, roof, windows, doors, drainage, exterior finish.                                              | Basic housing or protected storage may activate. |
| 5\. Functional Installation        | Workstations, beds, storage, utilities, machinery, mana, wards, service markers.                     | Core function can activate.                      |
| 6\. Furnishing and Public Fit-Out  | Furniture, signs, counters, tools, decorations, culture elements, public areas.                      | Full service and morale contribution.            |
| 7\. Inspection and Handover        | Validation, ownership, worker assignment, maintenance schedule, project completion.                  | Building enters normal runtime.                  |
| 8\. Prestige or Specialist Upgrade | Optional ornament, advanced utilities, automation, magic, expansion, or cultural additions.          | Improved capacity, resilience, or new branch.    |

## 10.1 Resource Calculation

Voxel material-token counts are generated from the blueprint. Functional components, furniture, machinery, tools, scaffolding, waste, culture modifiers, difficulty settings, and quality requirements are then added by the building and project definitions. This avoids manually recounting every block for every style variant.

## 10.2 Labour Calculation

- Labour is divided by task type: clearing, excavation, hauling, masonry, carpentry, roofing, furnishing, machine installation, rune work, inspection, and specialist commissioning.

- Builders claim reachable work sections and use real reserved materials when the settlement is simulated nearby.

- Distant settlements process stage progress through abstract labour and resource transactions while preserving the same project record.

- Player contribution, hired labour, NPC specialists, golems, machines, magic, tools, weather, danger, and access can modify build speed without creating resources.

# 11. Upgrade Families, Branches, Conversion, and Replacement

A family may contain linear upgrades, specialisation branches, culture replacements, expansions, attached modules, or full replacement projects. The system should preserve useful old buildings and avoid forcing every upgrade to erase settlement history.

| **Upgrade Type**      | **Meaning**                                                                                           | **Example**                                                                          |
|-----------------------|-------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Tier Upgrade          | Improves the same main function through better scale, materials, or capacity.                         | Storehouse → Village Warehouse.                                                    |
| Specialisation Branch | Changes the building toward a particular service or production role.                                  | Warehouse → Food Warehouse, Trade Warehouse, Construction Depot, or Magical Vault. |
| Technology Branch     | Adds mechanical, industrial, magical, or magitech systems.                                            | Blacksmith → Town Forge → Automated Foundry or Rune Forge.                       |
| Expansion Module      | Adds a wing, yard, floor, tower, stable, classroom, ward, or machine hall without replacing the core. | Clinic + quarantine wing.                                                            |
| Culture Replacement   | A culture uses a functionally equivalent but architecturally and mechanically distinct family.        | Granary replaced by subterranean cold cellars.                                       |
| Adaptive Conversion   | An existing building changes use after population, economy, law, or disaster changes.                 | Old inn converted into refugee housing.                                              |
| Restoration           | A damaged, abandoned, occupied, or ruined structure becomes functional again.                         | Ruined watchtower restored as guard tower.                                           |
| Prestige Upgrade      | Adds morale, culture, story, diplomacy, or landmark value after core function is established.         | Village hall gains memorial courtyard and archive.                                   |

# 12. Settlement Stage Matrix and Capability Expectations

| **Stage**          | **Planning Character**                                                                                                     | **Expected Capability**                                                                                             |
|--------------------|----------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| Camp               | Temporary, flexible, low permanence, immediate survival.                                                                   | Shelter, fire, supply cache, water access, basic food, temporary safety, builder staging.                           |
| Hamlet             | First permanent homes and essential shared services.                                                                       | Housing, food production, well, storage, simple jobs, communal point, basic guard or warning.                       |
| Village            | Several professions, shared economy, governance, trade, education, healing, and organised defence.                         | Warehouse, workshops, market, hall, healer, school, watchtower, palisade or equivalent, magic contact.              |
| Fortified Village  | A settlement adapted to repeated threats and strategic value.                                                              | Walls, gates, patrol routes, armoury, shelters, stronger storage, wards, repair readiness.                          |
| Town               | Multiple districts, specialised services, trade routes, civic institutions, advanced production, and transport.            | District planning, inns, guilds, courts, academies, utilities, larger markets, industry, layered defence.           |
| City               | Dense population, complex logistics, government, hospitals, universities, major culture, industry, and regional influence. | Multiple warehouses, district services, sanitation, power/mana networks, civic complexes, major walls and transit.  |
| Capital            | Culture-defining governance, diplomacy, military, archives, prestige, and realm-scale influence.                           | Palace or council complex, national institutions, great market, grand defences, major ritual and transport systems. |
| Magical Metropolis | Civilisation-scale magitech, portals, golems, leylines, vertical or floating expansion, and world-shaping projects.        | Portal nexus, city ward core, leyline systems, dimensional institutions, floating anchors, wonders.                 |

> **Stage Rule**
>
> A stage is a capability expectation, not a fixed visual template. Settlements may satisfy the same capability through different buildings, cultures, layouts, technologies, player blueprints, or peaceful versus militarised development paths.

# 13. Required, Optional, and Conditional Project Pools

| **Project Class** | **Planner Meaning**                                                                                                                 | **Examples**                                                                   |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Required          | A capability gate or severe shortage that must be addressed before stage advancement or normal survival.                            | Suitable housing, water access, food production, storage, essential safety.    |
| Optional          | A valid improvement selected from several alternatives according to local needs and identity.                                       | Carpenter, shrine, hunter lodge, tavern, school, market, gardens.              |
| Conditional       | Available only when terrain, resources, threat, culture, story, law, technology, or events create the requirement.                  | Fishing dock, mana refinery, refugee centre, quarantine house, portal station. |
| Reactive          | Triggered by damage, disaster, shortage, war, migration, corruption, or opportunity.                                                | Repairs, emergency shelter, fire station, wall reinforcement, relief kitchen.  |
| Prestige          | Chosen when survival and services are secure enough to invest in culture, identity, diplomacy, tourism, or wonders.                 | Monument, theatre, grand garden, cultural hall, landmark tower.                |
| Player-Proposed   | Submitted through settlement permissions or leadership tools and evaluated against function, site, resources, laws, and priorities. | Custom smithy, alternative housing block, player-designed market square.       |

# 14. Parcels, Terrain, Roads, Access, and Placement Rules

- Each definition declares acceptable footprint, height, clearance, entrance, yard, noise, hazard, privacy, and spacing ranges.

- Blueprints declare terrain adaptation modes such as flat, minor levelling, stepped foundation, stilts, retaining walls, excavation, bridge span, underground, floating, or reject location.

- The planner validates roads, paths, doors, emergency access, hauling routes, utility sockets, district rules, existing structures, protected sites, water, slope, and reserved expansion space.

- A valid building may still be a poor project choice if it creates excessive travel, blocks future roads, overloads utilities, increases danger, or duplicates unused capacity.

- Player-created blueprints must satisfy the same access and marker rules as official blueprints unless a world or creative setting explicitly relaxes them.

# 15. Residents, Jobs, Staffing, Tools, and Service Capacity

| **Component**       | **Registry Requirement**                                                                                                                                 |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Residents           | Capacity, household rules, privacy, age/access rules, temporary versus permanent occupancy, visitor slots, and emergency shelter use.                    |
| Jobs                | Job type, minimum and maximum workers, skill preference, specialist requirement, shift profile, emergency reassignment, and remote/abstract support.     |
| Workstations        | Required markers, count, clearance, interactions, input/output points, tool racks, safety zones, and shared versus personal use.                         |
| Tools and Equipment | Required item tags, durability, replacement, quality effects, storage, guard gear, medical kits, teaching tools, and machine components.                 |
| Service Capacity    | Residents served, patients treated, students taught, meals prepared, goods moved, threats detected, or area covered per cycle.                           |
| Staffing Effect     | Unstaffed buildings provide passive capacity only where logical; active services and production scale with workers, tools, inputs, skill, and schedules. |
| Travel and Access   | Worker and resident reachability affects effective staffing and service contribution without requiring constant manual assignment by the player.         |

# 16. Inputs, Outputs, Storage, Trade, and Production

- Buildings never generate physical goods without valid inputs, labour, time, tools, and storage unless their definition explicitly represents passive natural collection.

- Service buildings may consume items to provide capacity, such as medicine for treatment, food for meals, fuel for heating, or mana for ward coverage.

- Buffers and storage categories must be explicit so automation, haulers, warehouses, merchants, and emergency rules can understand the building.

- Production and service output should use shared recipe, service, inventory, and transaction systems rather than bespoke scene scripts.

- Trade value, public access, ownership, taxation, donation, contract, project reservation, and export permissions are separate from production capability.

# 17. Utilities, Networks, Power, Mana, and Logistics

| **Connection Type**         | **Possible Requirement**                                                                           | **Failure Effect**                                               |
|-----------------------------|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------|
| Road/Path                   | Resident, worker, customer, guard, cart, caravan, emergency, or freight access.                    | Reduced staffing, service, delivery, evacuation, or trade.       |
| Water                       | Drinking access, production, sanitation, farming, cooling, firefighting, ritual, or livestock use. | Reduced provisions, health, production, or safety.               |
| Drainage/Sanitation         | Waste removal, flood control, bathing, clinic hygiene, dense housing, and industry.                | Health pressure, pollution, flooding, or morale loss.            |
| Fuel/Heat                   | Cooking, smelting, heating, preservation, steam, lighting, and emergency warmth.                   | Paused production, poor provisions, climate risk.                |
| Mechanical/Industrial Power | Shafts, water, wind, steam, wires, pressure, or advanced energy.                                   | Reduced or paused automation and industry.                       |
| Mana                        | Mana furnaces, wards, healing, runes, ritual systems, magical crops, golems, and portals.          | Reduced service, ward failure, instability, or shutdown.         |
| Logistics                   | Haulers, carts, chutes, belts, pipes, rails, warehouses, portals, and permissions.                 | Input starvation, blocked output, slow construction, or waste.   |
| Signal/Control              | Bells, beacons, runes, logic, command, warning, communication, and dispatch.                       | Reduced safety, coordination, automation, or emergency response. |

# 18. Culture, Faction, Biome, Climate, and Realm Variation

A universal function does not imply identical architecture. Culture packs may provide preferred layouts, material palettes, ornament, room expectations, laws, job traditions, service substitutions, signature buildings, upgrade branches, and forbidden projects.

| **Variation Layer**      | **May Change**                                                                                                        | **Must Preserve**                                                                          |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Culture Style Kit        | Materials, roof forms, decoration, room layout, privacy, courtyards, towers, signs, furniture, and prestige features. | Validated function, required markers, access, capacity ranges, and core need contribution. |
| Cultural Replacement     | The method used to satisfy a universal need or service.                                                               | Equivalent settlement capability unless intentionally designed as a trade-off.             |
| Faction Control          | Ownership, law, taxation, guard use, access, banners, restricted rooms, and strategic purpose.                        | Stable building identity and save compatibility.                                           |
| Biome/Climate Adaptation | Foundations, insulation, drainage, stilts, underground rooms, roof slope, fireproofing, ventilation, water storage.   | Functional markers and safe navigation.                                                    |
| Realm Adaptation         | Gravity, atmosphere, magic, corruption, resource, portal, material, and environmental protection rules.               | Explicit prerequisites, risk, service role, and world-state consequence.                   |

# 19. Player Blueprints and Existing-Town Integration

- Players may create blueprints in-world or from the main menu using the shared blueprint format defined by Document 19.

- A player blueprint becomes a valid settlement option only after it is mapped to one or more building definitions and passes bounds, marker, access, stage, safety, and dependency validation.

- Trusted players may propose buildings for existing towns when reputation, law, ownership, project permissions, land rights, and settlement priorities allow it.

- Player-founded settlements may use custom style kits and preferred blueprint libraries while still requiring functional capacity and real construction resources.

- NPC planners may select approved player blueprints from the relevant pool, but should avoid repeated clones through variety, spacing, capacity, and style rules.

- Creative-mode or relaxed settings may allow blueprint placement with reduced simulation restrictions without weakening the default survival-civilisation rules.

# 20. Autonomous Project Selection and Growth Planning

> **Planner Score Draft**
>
> Project Score = Stage Requirement + Need Pressure + Population Pressure + Job Demand + Safety Risk + Culture Preference + Story Weight + Trade Opportunity + Player Priority - Cost - Terrain Difficulty - Redundancy - Maintenance Burden - Danger.

| **Planner Step**           | **Action**                                                                                                                                              |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1\. Detect Pressure        | Recalculate need shortages, capacity gaps, damage, migration, threats, production bottlenecks, stage requirements, and event demands.                   |
| 2\. Build Eligible Pool    | Filter building and project definitions by stage, culture, law, terrain, technology, specialists, story, permissions, maximum counts, and dependencies. |
| 3\. Score Options          | Compare benefit, urgency, cost, labour, access, resource availability, maintenance, redundancy, risk, and settlement identity.                          |
| 4\. Test Sites             | Search parcels and adaptation modes; validate roads, utilities, districts, expansion, protected areas, and player claims.                               |
| 5\. Reserve and Announce   | Reserve site and resources, create project record, notify the player where appropriate, and allow contributions or objections.                          |
| 6\. Construct              | Assign builders, haulers, specialists, tools, machines, golems, or player tasks; process visible or abstract stages.                                    |
| 7\. Activate and Rebalance | Register capacity, jobs, upkeep, routes, new demand, upgrade options, and changed project priorities.                                                   |

# 21. Damage, Repair, Maintenance, Renovation, and Abandonment

| **Lifecycle Action**   | **Rules**                                                                                                                                                     |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Routine Maintenance    | Consumes modest labour and materials at family-specific intervals; can be automated or handled by village jobs when stock exists.                             |
| Damage                 | Reduces condition, capacity, safety, access, or utilities according to damaged components and structure profile.                                              |
| Emergency Repair       | Prioritises access, fire control, shelter, structural stability, wards, walls, and essential services.                                                        |
| Full Repair            | Uses a staged project to restore blocks, functional components, furnishings, condition, and service capacity.                                                 |
| Renovation             | Changes layout, materials, rooms, capacity, utilities, or appearance while preserving identity and history where possible.                                    |
| Upgrade                | Moves to a linked definition or module branch and recalculates demand, capacity, maintenance, and staffing.                                                   |
| Conversion             | Changes primary function through a validated conversion project, such as inn to housing or warehouse to hospital relief centre.                               |
| Abandonment            | Occurs when access, population, safety, law, maintenance, ownership, or purpose fails; may create ruins, squats, monster sites, or restoration opportunities. |
| Demolition and Salvage | Returns a balance-controlled portion of reusable materials, clears the parcel, records ownership and heritage consequences, and may affect morale or law.     |

# 22. Master Building Category Index

| **Category**                                 | **Primary Companion** | **Representative Families**                                                                             |
|----------------------------------------------|-----------------------|---------------------------------------------------------------------------------------------------------|
| Temporary and Camp                           | 20A / 20D             | Campfire sites, tents, lean-tos, supply yards, expedition camps, temporary palisades.                   |
| Residential                                  | 20A                   | Huts, cottages, farmhouses, longhouses, townhouses, apartments, dormitories, manors, assisted housing.  |
| Farming and Food                             | 20A                   | Fields, barns, granaries, mills, kitchens, bakeries, fisheries, preserving houses, magical greenhouses. |
| Livestock and Beasts                         | 20A                   | Coops, stables, paddocks, hatcheries, beast yards, veterinary facilities, magical sanctuaries.          |
| Health and Welfare                           | 20A                   | Healer huts, clinics, hospitals, quarantine houses, hospices, refugee centres, emergency shelters.      |
| Culture, Faith, Hospitality and Recreation   | 20A                   | Shrines, temples, inns, taverns, community halls, theatres, gardens, festivals, memorials.              |
| Extraction and Processing                    | 20B / 20E             | Lumber camps, quarries, mines, sawmills, ore yards, refineries, automated extraction.                   |
| Crafting and Artisan                         | 20B / 20E             | Carpenters, smithies, masons, tailors, glassworks, foundries, machine workshops, rune forges.           |
| Trade and Services                           | 20B                   | Markets, shops, trading posts, banks, auction houses, caravanserais, service offices.                   |
| Education, Research and Guilds               | 20B                   | Schools, libraries, archives, academies, universities, guild halls, institutes.                         |
| Governance and Administration                | 20C                   | Elder huts, village halls, town halls, courts, offices, palaces, embassies.                             |
| Safety, Defence and Military                 | 20C                   | Guard posts, towers, walls, gates, barracks, armouries, forts, castles, shelters.                       |
| Justice, Crime and Conquest                  | 20C                   | Prisons, watch houses, occupation offices, hidden dens, smuggler sites, rebellion safehouses.           |
| Storage and Logistics                        | 20D                   | Caches, storehouses, warehouses, depots, sorting centres, freight hubs, magical vaults.                 |
| Roads and Transport                          | 20D                   | Paths, roads, bridges, docks, ports, rail, lifts, airship docks, portal freight routes.                 |
| Water, Sanitation and Utilities              | 20D / 20E             | Wells, cisterns, aqueducts, pumps, sewers, waste yards, heating, lighting, utility relays.              |
| Magic and Ritual                             | 20E                   | Mage huts, rune workshops, alchemy labs, ward towers, ritual halls, leyline systems, portal sanctums.   |
| Automation, Power and Industry               | 20E                   | Waterwheel houses, steam plants, generators, factories, control rooms, golem labour centres.            |
| Districts and Complexes                      | 20F                   | Farmstead clusters, market squares, artisan districts, hospital campuses, council complexes, citadels.  |
| Megaprojects and Wonders                     | 20F                   | Grand universities, portal nexuses, city ward cores, floating anchors, culture wonders, Leyline Crown.  |
| Culture, Faction, Biome and Realm Signatures | 20G                   | Unique replacements, architecture kits, signature industries, faction bases, realm-adapted structures.  |

# 23. POC Camp-to-Village Building Set

The first implementation set is deliberately small but covers every major civilisation loop. These entries should be detailed before Town, City, culture packs, or megaprojects receive production effort.

| **\#** | **Building or Project**         | **Main Proof**                                                     |
|--------|---------------------------------|--------------------------------------------------------------------|
| 1      | Campfire Site                   | Temporary gathering, warmth, cooking, morale.                      |
| 2      | Small Tent                      | Temporary housing.                                                 |
| 3      | Builder Supply Yard             | Project stock and construction staging.                            |
| 4      | Primitive Hut                   | First permanent housing.                                           |
| 5      | Small Cottage                   | Household housing and player blueprint test.                       |
| 6      | Farm Plot                       | Food production.                                                   |
| 7      | Farmhouse                       | Housing plus farming job.                                          |
| 8      | Village Well                    | Water access and provisions resilience.                            |
| 9      | Small Storehouse                | Basic storage and project supply.                                  |
| 10     | Communal Kitchen                | Food preparation and communal morale.                              |
| 11     | Lumber Camp                     | Forestry job and wood supply.                                      |
| 12     | Mine Entrance                   | Mining job and resource access.                                    |
| 13     | Carpenter Workshop              | Building components and repairs.                                   |
| 14     | Mason Yard                      | Stone construction and repairs.                                    |
| 15     | Village Warehouse               | Shared categories, reservations, deliveries, and automation input. |
| 16     | Barn                            | Food and livestock storage.                                        |
| 17     | Granary                         | Food reserve and spoilage control.                                 |
| 18     | Blacksmith                      | Tools, repairs, fittings, and guard equipment.                     |
| 19     | Market Stalls                   | Basic trade and service access.                                    |
| 20     | Trading Post                    | Imports, exports, contracts, and caravan access.                   |
| 21     | Healer Hut                      | Health service and medicine use.                                   |
| 22     | Village Hall                    | Governance, requests, permissions, and growth stage.               |
| 23     | Small School                    | Education and apprenticeship.                                      |
| 24     | Guard Post                      | Patrol, readiness, and local safety.                               |
| 25     | Wooden Watchtower               | Visible staged defence project and raid outcome.                   |
| 26     | Palisade Segment                | Perimeter safety and modular infrastructure.                       |
| 27     | Village Gate                    | Controlled access and defence.                                     |
| 28     | Small Shrine or Community Hall  | Culture and morale without enforcing one religion.                 |
| 29     | Mage Hut or Rune Workshop       | First practical magic, teaching, mana, and ward support.           |
| 30     | Dirt Path and Road Junction Set | Access, parcel planning, hauling, and settlement growth.           |

# 24. Alpha, Beta, and Full-Game Scale Targets

| **Milestone**     | **Target Content**                                                                                                                | **Purpose**                                                                                |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| POC               | About 30 buildings and projects; one culture-neutral forest settlement kit; Camp → Village.                                     | Prove the complete cause-and-effect loop and data architecture.                            |
| Early Alpha       | About 80-120 universal building families; Camp → Fortified Village/Town foundations; several upgrade chains.                    | Prove broad settlement simulation without full culture duplication.                        |
| Late Alpha / Beta | Town and City families, district templates, infrastructure networks, magic/automation branches, several culture packs.            | Prove dense settlements, regional economy, differentiated cultures, and advanced planning. |
| Full Game         | Universal families plus culture, faction, biome, realm, megaproject, wonder, damage, restoration, and player blueprint libraries. | Support long-term civilisation diversity and world-scale sandbox play.                     |

Counts are planning targets, not content quotas. A smaller set of deep, reusable families is preferable to hundreds of shallow entries that do not affect gameplay.

# 25. Sample Detailed Building Entries

## 25.1 Small Cottage

| **Field**                  | **Draft Entry**                                                                                       |
|----------------------------|-------------------------------------------------------------------------------------------------------|
| ID                         | building.residential.small_cottage                                                                    |
| Family                     | building_family.residential_house                                                                     |
| Category                   | Residential                                                                                           |
| Earliest Stage             | Hamlet                                                                                                |
| Size                       | Small                                                                                                 |
| Primary Need               | Housing                                                                                               |
| Capacity                   | 2-4 suitable residents depending on validated beds and household rules                                |
| Jobs                       | None required; optional home craft marker                                                             |
| Inputs/Outputs             | Consumes fuel and basic provisions through household use; provides shelter and home assignment        |
| Required Blueprint Markers | Entrance, reachable beds, protected interior, light, storage, heating/climate solution where required |
| Utilities                  | Path required; water access may be settlement-wide; optional heat/light network                       |
| Upgrade Paths              | Family cottage, artisan house, shop-house, townhouse, climate-adapted branch                          |
| Planner Tags               | housing_shortage, family_growth, replacement_for_tent                                                 |
| Player Blueprint           | Allowed after validation                                                                              |
| POC Status                 | Required                                                                                              |

## 25.2 Village Warehouse

| **Field**        | **Draft Entry**                                                                                                  |
|------------------|------------------------------------------------------------------------------------------------------------------|
| ID               | building.storage.village_warehouse                                                                               |
| Family           | building_family.storage_warehouse                                                                                |
| Category         | Storage and Logistics                                                                                            |
| Earliest Stage   | Village                                                                                                          |
| Primary Need     | Infrastructure                                                                                                   |
| Secondary Needs  | Provisions, Work, Safety                                                                                         |
| Capacity         | Category-based storage and project reservations; exact value determined by blueprint storage markers and tier    |
| Jobs             | Warehouse keeper, hauler access, optional merchant/logistics specialist                                          |
| Core Functions   | Shared storage, project reserves, donation/sale/contract tracking, emergency stock, automation input permissions |
| Required Markers | Storage zones, ledger, loading point, public/private access, project reserve area, road socket                   |
| Utilities        | Road/path; optional chutes, belts, carts, rail, mana or portal links by tier                                     |
| Upgrade Paths    | Construction depot, food warehouse, trade warehouse, automated distribution centre, magical vault                |
| Threat Value     | High during raids because it contains strategic resources                                                        |
| POC Status       | Required                                                                                                         |

## 25.3 Village Blacksmith

| **Field**        | **Draft Entry**                                                                                                                            |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| ID               | building.work.village_blacksmith                                                                                                           |
| Family           | building_family.blacksmith                                                                                                                 |
| Category         | Crafting and Artisan                                                                                                                       |
| Earliest Stage   | Village                                                                                                                                    |
| Primary Need     | Work                                                                                                                                       |
| Secondary Needs  | Safety, Infrastructure                                                                                                                     |
| Jobs             | 1 blacksmith; optional apprentice                                                                                                          |
| Inputs           | Fuel, ore or ingots, repair materials, tool components                                                                                     |
| Outputs          | Tools, fittings, repairs, weapons, guard equipment, project components                                                                     |
| Required Markers | Forge, anvil/workstation, tool storage, input and output storage, safe heat zone, ventilation/chimney, service counter or collection point |
| Utilities        | Road/path; fuel access; optional mechanical power, automation, mana, or rune sockets                                                       |
| Upgrade Paths    | Town forge, weaponsmith, armourer, foundry, automated forge, rune forge                                                                    |
| Risk             | Fire, heat, injury, noise; reduced by layout, tools, staffing, and maintenance                                                             |
| POC Status       | Required                                                                                                                                   |

## 25.4 Wooden Watchtower

| **Field**           | **Draft Entry**                                                                                      |
|---------------------|------------------------------------------------------------------------------------------------------|
| ID                  | building.safety.wooden_watchtower                                                                    |
| Family              | building_family.watchtower                                                                           |
| Category            | Safety and Defence                                                                                   |
| Earliest Stage      | Village                                                                                              |
| Primary Need        | Safety                                                                                               |
| Jobs                | Guard or lookout assignment                                                                          |
| Core Functions      | Detection coverage, warning time, guard effectiveness, local lighting or signal point                |
| Construction Stages | Site, foundations, timber frame, platform, railing/roof, ladder/stairs, signal and inspection        |
| Inputs              | Logs/beams, planks, fasteners, rope, tools, optional lantern or ward components                      |
| Required Markers    | Guard post, lookout point, safe access, signal marker, coverage origin, optional projectile position |
| Upgrade Paths       | Stone watchtower, signal tower, fortified tower, ward tower                                          |
| Raid Effect         | Changes detection, preparation, guard positioning, damage, casualties, and reputation outcome        |
| POC Status          | Required and central scenario                                                                        |

## 25.5 Mage Hut / Rune Workshop

| **Field**        | **Draft Entry**                                                                                                        |
|------------------|------------------------------------------------------------------------------------------------------------------------|
| ID               | building.magic.mage_hut_rune_workshop                                                                                  |
| Family           | building_family.magic_workshop                                                                                         |
| Category         | Magic and Research                                                                                                     |
| Earliest Stage   | Village or conditional Hamlet                                                                                          |
| Primary Need     | Work                                                                                                                   |
| Secondary Needs  | Safety, Infrastructure, Morale                                                                                         |
| Jobs             | Village mage or rune specialist                                                                                        |
| Inputs           | Mana shards/dust, rune materials, catalysts, research items                                                            |
| Outputs          | Basic runes, teaching, mana services, ward support, magical repairs, research access                                   |
| Required Markers | Rune table, mana storage, safe work zone, teaching point, input/output storage, optional conduit and ward sockets      |
| Utilities        | Path; mana storage or supply; optional conduit                                                                         |
| Upgrade Paths    | Rune workshop, alchemy lab, ward hall, magic academy, mana engineering branch                                          |
| Risk             | Mana instability or corruption only when relevant resources, forbidden methods, damage, or unsafe operation justify it |
| POC Status       | Required in limited form                                                                                               |

# 26. Content Production and Validation Workflow

1.  Approve the building family and its role in the master registry.

2.  Write the functional definition: needs, jobs, capacities, inputs, outputs, stage, prerequisites, planner tags, and upgrade links.

3.  Define required rooms, markers, access, utilities, safety zones, and acceptable footprint ranges.

4.  Create one or more voxel blueprints with construction-stage masks and material tokens.

5.  Generate resource counts and add functional components, furnishings, tools, scaffolding, waste, and quality modifiers.

6.  Validate navigation, marker reachability, capacity, utilities, terrain adaptation, damage states, and player-editor compatibility.

7.  Create official style variants and culture overrides only after the universal function works.

8.  Test nearby construction, distant simulation, save/load, repair, upgrade, demolition, planner selection, and multiplayer authority boundaries.

9.  Mark the registry entry and each blueprint with design, art, implementation, validation, and balance status.

10. Promote the entry into active project pools only after the required tests pass.

# 27. Balancing Rules and Scope Controls

- Seven main needs only. New systems should appear as causes, capacities, stocks, services, modifiers, or progression layers unless a future redesign explicitly replaces the model.

- A building should normally have one primary need and no more than two or three secondary needs.

- Do not create a separate building family when a material palette, roof variation, decoration set, size option, or culture style kit is sufficient.

- Do not create a new runtime subsystem for one building if shared jobs, recipes, inventory, services, utilities, markers, or event systems can express it.

- Every advanced building should explain what earlier buildings remain useful for, what new demand it creates, and what maintenance or staffing it requires.

- Settlement stage advancement should require capability and resilience, not a rigid checklist of identical structures.

- Player-designed alternatives should be accepted through function validation, not visual similarity to official buildings.

- Autonomous growth should avoid duplication, road blockage, excessive travel, unused capacity, unpayable maintenance, and uncontrolled sprawl.

- POC work stops at the smallest set that proves the connected loop; late-game planning must not delay the Forest Hamlet implementation.

# 28. Open Questions and Deferred Decisions

- Exact need-unit scales, status thresholds, trend windows, and seasonal modifiers require POC balancing.

- Whether housing suitability includes explicit household privacy categories for every culture or uses broader compatibility tags.

- How much local versus settlement-wide service coverage should affect Health, Morale, Education, Safety, and Trade in dense cities.

- Whether mixed-use buildings count as one definition with modules or as a validated bundle of multiple definitions.

- The exact rules for heritage protection, demolition opposition, compulsory acquisition, rent, taxation, and private property in NPC settlements.

- How advanced industry, pollution, corruption, noise, class division, and labour law affect needs without adding excessive meters.

- The final count and boundaries of culture packs, faction packs, realm packs, and signature-building requirements.

- How player-authored blueprint packages are moderated, versioned, shared, balanced, and migrated between game updates.

- Whether the detailed production register should be maintained primarily in a spreadsheet, database, repository files, or generated from Godot Resources.

# 29. Recommended Drafting Sequence

11. Review and approve this master framework and the 20A-20H split.

12. Create Document 20H first as the numbered master catalogue and settlement-stage matrix so every family receives a stable ID before detailed writing begins.

13. Draft Document 20A for Housing, Provisions, Health, Community, Culture, Hospitality, and Recreation.

14. Draft Document 20B for Work, Extraction, Crafting, Trade, Education, Research, and Guilds.

15. Draft Document 20C for Governance, Safety, Defence, Justice, Crime, Conquest, and Emergency services.

16. Draft Document 20D for Storage, Logistics, Roads, Transport, Water, Sanitation, and Utilities.

17. Draft Document 20E for Magic, Automation, Power, Industry, Golems, Portals, and Dimensional facilities.

18. Draft Document 20F for clusters, districts, civic complexes, capitals, megaprojects, and wonders.

19. Draft Document 20G after the universal catalogue is stable, using the race/culture/faction documents to create signature packs and functional replacements.

20. Select and fully detail the 30 POC entries, then begin voxel blueprint production and Camp → Village simulation testing.

> **Recommended Immediate Next File**
>
> 20H - Detailed Building Catalogue, Settlement Stage Matrix and Production Backlog should be created next. It will turn the brainstorm into a numbered, deduplicated list of building families before the category companion documents write full entries.

# Appendix A. Building Registry Field Template

| **Field**                 | **Type / Example**                                                    | **Required**   |
|---------------------------|-----------------------------------------------------------------------|----------------|
| building_id               | Stable namespaced string: building.work.village_blacksmith            | Yes            |
| family_id                 | building_family.blacksmith                                            | Yes            |
| display_name_key          | loc.building.village_blacksmith.name                                  | Yes            |
| category / subcategory    | work / crafting_blacksmith                                            | Yes            |
| tags                      | village, metal, tools, repair, defence_supply                         | Yes            |
| settlement_stage_min      | village                                                               | Yes            |
| structure_kind            | occupied_building, infrastructure, public_space, cluster, megaproject | Yes            |
| size_class                | micro, small, medium, large, complex, megaproject                     | Yes            |
| primary_need              | work                                                                  | Yes            |
| secondary_needs           | safety, infrastructure                                                | Optional       |
| base_capacity             | Need-specific capacity object                                         | Yes            |
| resident_capacity         | 0                                                                     | Where relevant |
| job_slots                 | blacksmith:1, apprentice:1 optional                                   | Where relevant |
| input_rules               | Fuel and metal tags                                                   | Where relevant |
| output_rules              | Tools, repairs, fittings, equipment                                   | Where relevant |
| service_rules             | Repair service, project component supply                              | Where relevant |
| storage_rules             | Input, output, tool, public/private buffers                           | Where relevant |
| utility_requirements      | road, fuel; optional power/mana                                       | Where relevant |
| blueprint_validation      | Required markers, rooms, bounds, access, safety                       | Yes            |
| project_definition_id     | project.build.village_blacksmith                                      | Yes            |
| upgrade_from / upgrade_to | hamlet_smithy / town_forge, rune_forge                                | Optional       |
| planner_class             | optional or conditional                                               | Yes            |
| planner_tags              | tool_shortage, repair_backlog, guard_supply                           | Yes            |
| culture_rules             | Allowed, preferred, replaced, forbidden, signature                    | Optional       |
| damage_profile            | fire, siege, collapse, corruption                                     | Yes            |
| maintenance_profile       | Fuel-independent routine upkeep and repair rules                      | Yes            |
| POC status                | required, alpha, beta, final, deferred                                | Yes            |
| implementation status     | planned, data, blueprint, validated, implemented                      | Yes            |

# Appendix B. Need Contribution and Service-Capacity Template

| **Field**          | **Description**                                                                                                                   |
|--------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Primary Need       | The main visible need this building exists to support.                                                                            |
| Secondary Needs    | A small number of additional needs affected when fully functional.                                                                |
| Demand Created     | New residents, jobs, utilities, maintenance, traffic, safety risk, or service expectations created by the building.               |
| Base Capacity      | The unmodified service amount before condition, staffing, inputs, access, utility, and suitability factors.                       |
| Capacity Unit      | Beds, meals/day, patients/day, jobs, storage slots, coverage points, service visits, protection strength, or another shared unit. |
| Coverage Type      | Settlement-wide, district, radius, route, household, attached parcel, network, or targeted.                                       |
| Required Staffing  | Workers and specialists needed to provide active capacity.                                                                        |
| Required Inputs    | Physical items, fuel, food, medicine, mana, tools, or information consumed to provide capacity.                                   |
| Required Utilities | Road, water, sanitation, power, mana, lighting, signal, or logistics links.                                                       |
| Condition Scaling  | How damage and maintenance reduce capacity.                                                                                       |
| Access Scaling     | How reachability, queueing, permissions, and distance reduce effective service.                                                   |
| Resilience         | Spare capacity, emergency use, backup operation, stock reserve, or failure tolerance.                                             |
| UI Summary         | State, trend, top cause, top remedy, and optional detailed values.                                                                |

# Appendix C. Settlement Stage Matrix Template

| **Building Family** | **Camp**       | **Hamlet**        | **Village**        | **Fortified Village**      | **Town**          | **City**             | **Capital**          | **Magical Metropolis**           |
|---------------------|----------------|-------------------|--------------------|----------------------------|-------------------|----------------------|----------------------|----------------------------------|
| Residential Shelter | Required       | Required          | Required           | Required                   | Required          | Required             | Required             | Required                         |
| Food Production     | Basic          | Required          | Required           | Required                   | Expanded          | District-scale       | Regional             | Magically/industrially resilient |
| Shared Storage      | Cache          | Storehouse        | Warehouse          | Protected warehouse        | Distribution      | Networked logistics  | National stores      | Portal/realm logistics           |
| Governance          | Informal       | Elder/meeting     | Village hall       | Defence council            | Town hall         | City government      | Capital institutions | Realm-scale governance           |
| Defence             | Temporary      | Warning/guard     | Tower/palisade     | Walls/gates/armoury        | Fortified network | Layered city defence | Strategic fortress   | City ward and anti-realm threats |
| Magic               | Discovery only | Conditional       | Mage/rune service  | Wards                      | Institutions      | Networked mana       | Grand ritual systems | Leyline/portal civilisation      |
| Automation          | Manual         | Simple mechanisms | Copper/iron supply | Defence and repair support | Industry          | City networks        | Regional systems     | Golems/portals/realm scale       |

# Appendix D. Stable ID and Naming Conventions

- Building definition: building.\<category\>.\<specific_name\>

- Building family: building_family.\<family_name\>

- Project definition: project.build.\<specific_name\>

- Infrastructure project: project.infrastructure.\<specific_name\>

- Cluster: cluster.\<category\>.\<specific_name\>

- District template: district.\<culture_or_universal\>.\<specific_name\>

- Megaproject: megaproject.\<specific_name\>

- Wonder: wonder.\<culture_or_realm\>.\<specific_name\>

- Blueprint: blueprint.\<author_or_pack\>.\<building_id_suffix\>.\<variant\>

- Style kit: style_kit.\<culture_or_theme\>.\<name\>

- IDs remain stable when display names change. Deprecated IDs map through explicit aliases and migration rules.

# Appendix E. POC Acceptance Criteria

- The seven main needs calculate and display readable states, trends, causes, and remedies for the Forest Hamlet.

- At least 30 approved building/project definitions exist with stable IDs and POC status.

- At least one official blueprint exists for each required POC definition, with stage masks, material tokens, markers, access, and terrain rules.

- A player-created cottage blueprint can satisfy the same housing definition as an official cottage after validation.

- NPC planners can choose a valid project, reserve a site and resources, assign labour, construct visible stages, activate the building, and update settlement needs.

- The watchtower project changes raid detection, preparation, damage, casualties, and reputation outcome.

- The village warehouse conserves resources across deliveries, reservations, daily consumption, construction, automation input, and save/load.

- Damaged buildings reduce capacity and can be repaired through staged projects using real resources.

- Distant settlement simulation advances projects and needs without spawning full NPCs or losing identity, resources, history, or construction state.

- The master registry can be imported into or represented by Godot runtime data without hard-coding each building into unrelated scenes.

---

*Converted from the Document 20 Version 0.1 DOCX master framework.*
