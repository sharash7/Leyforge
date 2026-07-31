# Fantasy Voxel Civilisation Sandbox
## 22I - Blueprint Forge: Building, Structure and World Blueprint Authoring
### Voxel Structure Composition, Semantic Layers, Construction Stages, World Placement and Living-Civilisation Integration
**Version 0.1 - Detailed Design Bible Draft**

A voxel-only blueprint authoring system that merges the existing building and structure Blueprint Designer into the Leyforge Forge, allowing developers to create, test, inherit, vary, construct, damage, restore, package and deploy buildings, roads, bridges, villages, ruins, dungeons, camps, factories, magical sites and world-generation structures without separating their visible block form from their functional simulation data.

## Blueprint Forge Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the Blueprint Forge workspace, blueprint categories, source data, semantic layers, block and asset placement, construction stages, upgrade inheritance, culture and biome substitution, terrain adaptation, NPC and creature markers, automation and mana networks, dynamic states, world-generation rules, validation, preview, icon capture, packaging, runtime baking and POC scope. |
| Core Philosophy | A blueprint is not only a copied volume of blocks. It is a reusable voxel structure definition containing physical composition, functional assets, semantic markers, networks, construction logic, variants, world-placement rules and persistent state transitions. |
| Forge Direction | The previous Blueprint Designer becomes a first-class Forge workspace sharing the same project manifest, asset browser, material library, stable IDs, override system, revision history, Icon Capture Studio, Test Laboratory and packaging pipeline as Asset Forge and Entity Forge. |
| Voxel Direction | All visible structure geometry is built from voxel terrain blocks, shaped voxel blocks, Forge-authored voxel props, voxel machines and voxel decorative assets. Runtime merged meshes or distant representations are baked products only; the editable source remains voxel-based. |
| Structure Direction | Support player buildings, NPC homes, village projects, workshops, farms, roads, bridges, walls, gates, towers, factories, automation layouts, magical sites, ruins, dungeons, enemy camps, creature nests, portals, landmarks and megastructures. |
| Semantic Direction | Use distinct editable layers for physical blocks, functional assets, NPC markers, creature markers, navigation, storage, households, jobs, automation, power, mana, construction, world generation, damage, ownership and decoration. |
| Construction Direction | Blueprints may define visible staged construction, reserved resources, scaffold phases, builder access, delivery points, stage prerequisites, interruption rules and completion effects. |
| Upgrade Direction | Building upgrades use inheritance and delta data wherever practical. An upgraded blueprint stores additions, removals, substitutions and changed markers rather than duplicating the entire lower-tier building. |
| Variant Direction | Material roles, culture palettes, biome adaptations, damage states, abandoned states, corruption states and deterministic decorative variants can modify a shared logical blueprint while preserving its functional contract. |
| Worldgen Direction | World-generation blueprints define terrain requirements, anchors, rotation, mirroring, biome and region tags, road and water relationships, fallback rules, clearance, rarity, ownership and progression guarantees. |
| Entity Integration | Blueprint markers use the same semantic contracts defined by Entity Forge so NPCs, creatures, mounts and bosses can find entrances, beds, jobs, guard posts, nests, perches, patrol points, arena anchors and interaction positions. |
| Network Direction | Automation, mechanical power, item logistics, fluids, mana, wards and future network types are authored as validated graph layers referencing stable endpoints rather than relying only on visual proximity. |
| Developer Direction | Developers may create new blueprints, duplicate templates, override existing structures, replace materials or assets, edit stages, compare revisions, validate dependencies and revert individual fields without changing unrelated gameplay definitions. |
| Icon Direction | Blueprint thumbnails, map previews, project-board icons and codex images may be captured directly from the live Forge view using saved cameras, states, construction stages and environment presets. |
| Performance Direction | Nearby structures use full voxel blocks, interactive assets and detailed markers. Distant or unloaded structures may use baked meshes, summaries and abstract simulation while retaining stable ownership, damage, supply, project and history records. |
| Audio/VFX Boundary | Blueprint assets may expose named event and attachment references, but complete audio and particle/VFX production remains deferred to later Forge modules. |
| Implementation Context | Godot with Summer Engine is the current target. This document defines the design and data contracts; Document 22K will define final Resources, services, editor classes, baking jobs and implementation sequencing. |
| POC Direction | Prove a forest cottage, village warehouse, staged watchtower, bridge, workshop with automation connections, goblin camp and rune ruin, all authored in Blueprint Forge and validated for blocks, markers, construction, navigation, variants and runtime placement. |

## Document Purpose

Documents 21A through 21G established the Voxel Asset Forge for blocks, items, props, machines, materials, animations, runtime visual states, overrides and visual migration. Documents 22A through 22H expanded the Forge into voxel humanoids, animals, monsters, bosses, body-plan graphs, rigging, animation, equipment, hitboxes, AI markers and simulation LOD. This document completes the third major Forge workspace by formally merging the previously planned Blueprint Designer into the same authoring environment.

A structure in Leyforge is rarely only scenery. A cottage may provide housing, sleep positions, storage, ownership and warmth. A workshop may contain a job site, machine clearances, input and output points, power connections and construction requirements. A watchtower may contain guard positions, sight markers, alarm logic, staged construction and raid consequences. A ruin may contain history, hazards, loot sockets, puzzles, magical anchors and restoration possibilities. A village is a collection of such structures connected by roads, storage, jobs, households, defence and world-state history.

The Blueprint Forge must therefore preserve two truths at the same time:

1. The structure is visibly and editably built from the same voxel blocks and Forge-created assets used everywhere else in Leyforge.
2. The structure contains enough semantic information for NPCs, creatures, automation, magic, construction, world generation, quests, ownership and persistence systems to understand and use it.

The Blueprint Forge is not intended to replace freeform player building. Players may still place blocks one by one and create unrestricted structures. The Forge is the developer-facing system for creating reusable authored buildings, settlement projects, world-generation structures, templates and validated functional layouts. A future player-facing blueprint feature may use a restricted subset of this data, but the complete developer workspace remains more powerful and controlled.

This document defines what a blueprint contains, how it is edited, how it inherits from other blueprints, how it adapts to terrain and cultures, how it is validated, how it becomes a village construction project, how it changes when damaged or restored, and how it is converted into efficient runtime products. It does not define final Godot implementation classes, full village economy formulas, complete procedural dungeon generation algorithms or player-facing construction UI. Those remain owned by their dedicated documents and Document 22K.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Blueprint Forge source data remains voxel-based and editor-readable. Runtime chunk integration, merged structure meshes, navigation caches, collision proxies and distant representations are derived products and may be regenerated whenever the source blueprint or its dependencies change.

## Design Sources

| Source Document | Relevant Direction | How 22I Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Building uses block-by-block placement, modular pieces, blueprint construction and NPC-assisted construction. Buildings unlock functions and settlement growth. | Makes Blueprint Forge the common authoring layer for functional, scalable and civilisation-connected structures. |
| 01 - Core Gameplay Loop | The player builds, interacts, automates, defends, upgrades and expands. | Requires structures to support physical building, use, supply, defence, progression and later expansion. |
| 03 - Blocks Registry | Blocks include full cubes, shaped pieces, functional blocks, storage, machines, village objects, magic infrastructure and dynamic states. | Defines the physical vocabulary and stable block references used inside blueprints. |
| 05 - Crafting and Recipe Registry | Village projects use staged recipes, exact resources, build time, reservations and consequences. | Provides the construction-project contract used by blueprint stages and NPC builders. |
| 07 - NPC Village System | Villages use homes, jobs, storage, warehouses, projects, repairs, raids, households, permissions and simulation LOD. | Supplies the semantic markers and project behaviour required for NPC-useable buildings. |
| 08 - Automation System | Machines, transport, storage, power and village supply are physical networks with permissions and performance LOD. | Requires explicit network endpoints, clearances, routes and validation inside functional structures. |
| 09 - Magic System | Mana, runes, wards, conduits, rituals, portals and magical buildings are physical infrastructure. | Adds mana networks, ward coverage, ritual anchors, magical states and corruption/restoration rules. |
| 10 - Creatures and Monsters | Creatures use camps, nests, caves, structures, raid sources, boss arenas and terrain-specific behaviours. | Requires creature spawn, nest, perch, patrol, arena and traversal markers. |
| 11 - Biomes and World Generation | Structures are placed using biome, terrain, water, roads, culture, danger, leylines and progression relationships. | Defines world-placement constraints, terrain adaptation, anchors and deterministic generation metadata. |
| 12 - Structures | Structures are physical evidence of civilisation, history, danger and world state; they can be damaged, occupied, restored, claimed and transformed. | Provides the full structure category, dynamic-state and world-memory foundation for Blueprint Forge. |
| 15 - Quest and Event System | Quests and events bind to stable world entities, stages, conditions and persistent evidence. | Requires quest anchors, event sockets, discoverability and state-safe references. |
| 16 - Combat, Gear and Defence | Structures, cover, defences, raids, damage and persistent aftermath affect combat. | Requires defence positions, destructible regions, attack paths, cover markers and repair states. |
| 17 - UI/UX System | Complex systems must remain readable, inspectable, controller-ready and world-first. | Guides Blueprint Forge overlays, layer filtering, warnings, preview and validation feedback. |
| 21A-21G - Voxel Asset Forge | Defines voxel modelling, materials, animations, overrides, UI, technical baking and visual migration. | Supplies shared assets, palettes, override rules, preview systems and runtime baking foundations. |
| 22A - Forge Expansion Core | Locks Blueprint Forge as a first-class Forge workspace with semantic blueprints, icon capture, manifests and testing. | Acts as this document's master scope and governance source. |
| 22H - Entity Gameplay Integration | Defines semantic markers, navigation profiles, interaction anchors and simulation LOD for entities. | Ensures structures and entities use compatible names, roles and validation contracts. |

## Static Table of Contents

- 1. Locked Blueprint Forge Identity
- 2. Locked Direction Summary
- 3. Blueprint Forge Architecture
- 4. Blueprint Categories, Families and Scope
- 5. Blueprint Source Data Model and Stable Identity
- 6. Editable Source, Runtime Products and Baking Boundaries
- 7. Coordinate Systems, Bounds, Anchors and Work Volumes
- 8. Semantic Layer Model
- 9. Block, Shape, Prop and Functional Asset Placement
- 10. Nested Assemblies, Modules and Reusable Sub-Blueprints
- 11. Materials, Roles, Culture Palettes and Biome Adaptation
- 12. Entrances, Doors, Navigation and Accessibility
- 13. NPC, Household, Job, Guard and Social Markers
- 14. Storage, Inventory, Trade and Village Warehouse Integration
- 15. Automation, Power, Fluid, Mana and Ward Networks
- 16. Creature Nests, Enemy Camps, Dungeons and Boss Arenas
- 17. World-Generation Placement Rules and Relational Anchors
- 18. Terrain Adaptation, Foundations, Supports and Water Interaction
- 19. Construction Stages, Project Recipes and NPC Building
- 20. Blueprint Inheritance, Upgrades and Delta Authoring
- 21. Dynamic States, Damage, Repair, Occupation and Restoration
- 22. Variants, Procedural Detail and Deterministic Seeds
- 23. Icon Capture, Maps, Miniatures and Presentation Products
- 24. Validation, Simulation Preview and Forge Test Laboratory
- 25. Dependencies, Overrides, Revision History and Approval
- 26. Packaging, Portability, Migration and Collaboration
- 27. Performance, LOD, Persistence and Multiplayer
- 28. Proof-of-Concept Scope and Staged Delivery
- 29. Success Criteria and Acceptance Matrix
- 30. Relationships With Documents 22J-22L
- Appendix A. Blueprint Registry Field Template
- Appendix B. Semantic Layer and Marker Taxonomy
- Appendix C. Blueprint Validation Checklist
- Appendix D. POC Blueprint Template Set
- Appendix E. Example Forest Hamlet Watchtower Blueprint
- Appendix F. Glossary

# 1. Locked Blueprint Forge Identity

Blueprint Forge is Leyforge's developer-facing voxel structure authoring workspace. It turns the former standalone Blueprint Designer concept into an integrated Forge system that can use every approved block, material, prop, item presentation, machine and entity contract already registered in the project.

> **Locked Rule**  
> A Blueprint Forge structure must remain an editable voxel composition and must store its functional meaning separately from its visible composition. Changing a roof material must not erase a bed marker. Replacing a furnace model must not disconnect its automation endpoint. Damaging a wall must not silently change the building's stable identity.

## 1.1 Blueprint Promise

A developer should be able to create a structure through one connected workflow:

```text
Choose or create a blueprint family
        -> define bounds and anchors
        -> place voxel blocks and Forge assets
        -> assign material roles and variants
        -> add semantic markers and networks
        -> define construction, upgrade and damage states
        -> configure world-placement rules
        -> validate NPC, creature and system use
        -> capture preview images and icons
        -> bake runtime products
        -> register, package and deploy
```

The same workflow should scale from a single bed shelter to a multi-stage village building, dungeon, factory, bridge, boss arena or world landmark.

## 1.2 Core Design Pillars

| Pillar | Design Meaning | Player- and Developer-Facing Result |
| --- | --- | --- |
| Voxel Source Truth | Visible geometry is composed from blocks and voxel Forge assets. | Structures remain visually coherent and fully editable. |
| Semantic Function | Jobs, beds, doors, storage, networks, paths and world rules are authored explicitly. | NPCs and systems can understand the structure rather than guessing from appearance. |
| Reusable Inheritance | Templates, modules, upgrades and variants reuse approved source data. | Large building families can grow without copy-paste drift. |
| Living World State | Construction, damage, occupation, repair and restoration are first-class states. | Structures visibly remember events and civilisation change. |
| Deterministic Placement | Worldgen rules and procedural decoration use stable seeds and declared constraints. | Saves remain reproducible and generated structures can be validated. |
| Integrated Validation | Blueprint Forge can simulate access, networks, construction and state changes. | Broken buildings are caught before they enter a village or generated world. |
| Stable Registry Identity | Blueprints and internal semantic roles use database-friendly IDs. | Overrides, quests, saves and content packs remain compatible. |

## 1.3 What Blueprint Forge Is Not

- It is not only a copy-and-paste volume tool.
- It is not a replacement for freeform player block building.
- It is not a conventional smooth-mesh level editor detached from the voxel world.
- It is not a hidden background spreadsheet with no visual authoring.
- It is not allowed to infer every gameplay function from decoration alone.
- It is not a complete procedural city generator in its first implementation.
- It is not permission to embed authoritative quest, economy or combat logic directly into a structure asset.
- It is not a full audio or particle/VFX production environment.
- It is not required to load every marker, NPC or network at full detail when the structure is distant.

## 1.4 Relationship to Player Building

Blueprint Forge creates authored definitions. Player construction may use those definitions in several ways:

| Use | Description |
| --- | --- |
| Preview Blueprint | A translucent or outlined plan shows the intended structure before construction. |
| Resource Project | Required blocks and items are calculated and reserved. |
| Assisted Placement | The player places required pieces with snapping and guidance. |
| NPC Construction | Builders deliver resources and complete defined stages. |
| Instant Creative Placement | Creative or developer modes place the completed structure immediately. |
| Template Reference | Players may inspect or adapt an authored design without being forced to follow it. |

The full player-facing blueprint interface can be smaller than the developer Forge. The developer version retains access to worldgen, semantic, ownership, migration and validation data that normal players should not edit.

# 2. Locked Direction Summary

| Area | Locked Decision |
| --- | --- |
| Tool Merge | The existing Blueprint Designer becomes Blueprint Forge inside the unified Leyforge Forge. |
| Voxel Requirement | Every visible blueprint component is a voxel block, voxel-shaped block or Forge-authored voxel asset. |
| Blueprint Meaning | A blueprint contains physical geometry plus semantic layers, networks, stages, rules and states. |
| Scope | Support player structures, NPC buildings, village projects, roads, bridges, farms, factories, magical sites, ruins, dungeons, camps, nests, arenas, portals, landmarks and megastructures. |
| Asset Sources | Blueprints reference stable block, prop, machine, material and entity-role IDs from shared registries. |
| Editing | Developers may create, duplicate, inherit, override, compare, revert and package blueprints. |
| Material Roles | Logical roles such as `wall_primary` and `roof_primary` allow culture and biome palettes to substitute materials. |
| Semantic Layers | Physical blocks, navigation, NPC use, storage, automation, mana, construction, worldgen, damage and decoration are independently editable and filterable. |
| Construction | Projects may define stages, resources, scaffolds, delivery points, workers, prerequisites and interruption handling. |
| Upgrade Paths | Higher-tier buildings should inherit and store deltas from lower-tier buildings where practical. |
| Dynamic States | Blueprints may define intact, damaged, burned, abandoned, occupied, corrupted, cleansed, repaired, restored and upgraded states. |
| World Placement | Structures declare terrain, biome, water, road, region, culture, danger, leyline, rotation, clearance and fallback rules. |
| Validation | Forge tests access, marker reachability, stage buildability, network connectivity, clearances, dependencies and budgets. |
| Icon Capture | The live view can render blueprint thumbnails, project icons, map previews and codex images. |
| Runtime | Nearby structures use full detail; distant structures may use baked representations and abstract state. |
| Audio/VFX | Only future-facing hooks are stored; full production tools remain deferred. |

# 3. Blueprint Forge Architecture

## 3.1 Workspace Position in the Forge

```text
Leyforge Forge
├── Asset Forge
│   ├── Blocks and surfaces
│   ├── Items and props
│   ├── Machines and animated objects
│   └── Materials and visual states
├── Entity Forge
│   ├── Humanoids
│   ├── Creatures and bosses
│   ├── Rigs and animation
│   └── Gameplay markers
└── Blueprint Forge
    ├── Building composition
    ├── Semantic markers
    ├── Networks and systems
    ├── Construction and upgrades
    ├── Dynamic states
    ├── World placement
    └── Validation and runtime baking
```

All workspaces share:

- One asset browser and search language.
- One Forge Project Manifest.
- Stable namespaces and IDs.
- Material and palette libraries.
- Dependency graph and revision history.
- Override and fallback resolution.
- Icon Capture Studio.
- Forge Test Laboratory.
- Validation reports.
- Content-pack export.

## 3.2 Blueprint Architecture Layers

| Layer | Purpose | Example |
| --- | --- | --- |
| Blueprint Definition | Stable logical identity and shared metadata. | `structure.village.forest_watchtower_t1` |
| Source Composition | Editable voxel blocks and Forge assets. | Stone foundation, oak frame, ladder, roof, lantern. |
| Semantic Data | Functional markers and roles. | Guard post, entrance, alarm point, storage hook. |
| Network Graphs | Connected system endpoints and routes. | Item chute, mechanical shaft, mana conduit. |
| Stage Graph | Construction, upgrade and repair sequence. | Foundation -> frame -> platform -> roof -> completion. |
| Variant Rules | Material, culture, biome and decorative resolution. | Forest-human, mountain-human and ruined variants. |
| Placement Rules | World-generation and terrain constraints. | Near village road, moderate slope, clear sightline. |
| Runtime State | Instance-specific mutable data. | Built stage, damage, owner, occupants, project progress. |
| Baked Products | Optimised render, collision, navigation and preview outputs. | Chunk block stamp, mesh cache, thumbnail, nav cache. |

## 3.3 Separation of Definition and Instance

A blueprint definition describes what a structure can be. A structure instance records what happened to one placed copy.

**Definition data includes:**

- Stable blueprint ID.
- Source blocks and assets.
- Valid materials and variants.
- Semantic marker definitions.
- Construction stages.
- Placement rules.
- Upgrade relationships.
- Supported dynamic states.

**Instance data includes:**

- World position and orientation.
- Resolved variant seed.
- Current construction stage.
- Damage and missing pieces.
- Ownership and permissions.
- Occupants and assigned jobs.
- Stored resources and network state references.
- Quest and event bindings.
- Repair, occupation and restoration history.

This separation allows thousands of instances to reference one definition without duplicating the entire blueprint.

# 4. Blueprint Categories, Families and Scope

## 4.1 Primary Categories

| Category | Typical Examples | Required Semantic Depth |
| --- | --- | --- |
| Player Building Template | Cottage, workshop, warehouse, tower, farm. | Optional functions, construction and player permissions. |
| NPC Home | Hut, cottage, apartment, longhouse. | Household capacity, beds, entrances, storage and comfort markers. |
| Village Job Building | Smithy, bakery, lumberyard, mage tower. | Job sites, input/output storage, schedules, clearances and specialists. |
| Village Project | Watchtower, wall, market, school, portal gate. | Staged resources, builders, project effects and settlement requirements. |
| Infrastructure | Road, bridge, culvert, tunnel, dock, aqueduct. | Connectors, traversal, support, traffic and terrain adaptation. |
| Farm and Production Site | Field, pasture, mill, mine entrance, quarry. | Work zones, resource nodes, storage, animals and automation. |
| Factory and Automation | Processing hall, conveyor route, power house. | Machine layout, network graphs, maintenance access and safety zones. |
| Magic Structure | Rune ruin, ward tower, ritual circle, mana well. | Mana endpoints, ritual anchors, ward areas and corruption states. |
| Defence Structure | Wall, gatehouse, tower, trap line, bunker. | Guard points, cover, sight, attack paths and damage regions. |
| Ruin and Historic Site | Collapsed house, abandoned mine, ancient tower. | Discovery, loot, lore, damage, occupation and restoration. |
| Dungeon | Chamber set, underground complex, vault. | Entrances, encounter zones, locks, paths, loot and boss progression. |
| Enemy Camp | Goblin camp, bandit outpost, cult site. | Spawn zones, patrols, alarms, storage, raid source and occupation. |
| Creature Nest | Spider den, bird rookery, dragon lair. | Creature roles, eggs, feeding, perches, traversal and threat zones. |
| Portal and Realm Site | Gatehouse, portal ruin, ritual gateway. | Realm anchors, stabilisation, access rules and persistent links. |
| Landmark | Monument, giant tree, fallen titan, world machine. | Discovery, navigation silhouette, lore and regional effects. |
| Megastructure | Castle, capital district, floating city component. | Modular composition, district links, LOD and long-term projects. |

## 4.2 Blueprint Families

A blueprint family groups definitions that share purpose, compatibility or progression.

```text
family.village.blacksmith
├── structure.village.blacksmith_t1
├── structure.village.blacksmith_t2
├── structure.village.blacksmith_t3
├── structure.village.blacksmith_ruined
└── structure.village.blacksmith_arcane
```

Family records may define:

- Shared material roles.
- Shared semantic marker requirements.
- Compatible upgrade paths.
- Culture-specific branches.
- Common icons and map symbols.
- Allowed footprint changes.
- Shared validation profile.

## 4.3 Size and Complexity Tiers

| Tier | Typical Footprint | Intended Use | Authoring Rule |
| --- | --- | --- | --- |
| Micro | 1-8 world blocks | Shrine, sign, campfire, small machine enclosure. | May be nested into larger blueprints. |
| Small | Up to roughly 16 x 16 x 16 blocks | Cottage, shed, guard post. | Fully editable in one work volume. |
| Medium | Up to roughly 32 x 32 x 32 blocks | Workshop, warehouse, watchtower, bridge span. | May use reusable modules. |
| Large | Up to roughly 64 x 64 x 64 blocks | Fort, dungeon wing, factory hall. | Strongly encouraged to use nested sub-blueprints. |
| Regional | Multiple large modules | Village district, castle, road network. | Stored as a composition graph rather than one dense volume. |
| Megastructure | Region-scale or civilisation-scale | Floating city, capital, world machine. | Requires streaming cells, modular phases and separate runtime budgets. |

These are planning and validation tiers, not absolute creative restrictions. Oversized monolithic blueprints should trigger warnings and modularisation suggestions.

# 5. Blueprint Source Data Model and Stable Identity

## 5.1 Core Blueprint Record

Every blueprint requires:

| Field | Purpose |
| --- | --- |
| `blueprint_id` | Stable namespaced identity. |
| `display_name_key` | Localised display name. |
| `description_key` | Localised description. |
| `category` | Primary blueprint category. |
| `family_id` | Optional family membership. |
| `parent_blueprint_id` | Optional inheritance source. |
| `source_version` | Editable source schema version. |
| `bake_version` | Runtime product version. |
| `bounds` | Declared editable and placement bounds. |
| `origin_anchor` | Primary placement reference. |
| `allowed_rotations` | Valid orientation set. |
| `mirror_rules` | Whether mirroring is valid and how semantic roles remap. |
| `block_palette` | Block and role references used by the source. |
| `asset_dependencies` | Props, machines, doors and other Forge assets. |
| `semantic_layers` | Marker, zone and network collections. |
| `construction_profile` | Stage graph and project linkage. |
| `state_profile` | Supported dynamic states. |
| `placement_profile` | World-generation and terrain rules. |
| `variant_profile` | Culture, biome and seeded variation rules. |
| `validation_profile` | Required tests and budget class. |
| `icon_profile` | Saved preview camera and rendering state. |
| `lifecycle_state` | Draft, review, approved, deprecated or fallback. |
| `planning_status` | POC, Alpha, Beta, Final or Deferred. |

## 5.2 Stable Internal Element IDs

Important internal elements need stable local IDs so upgrades and states can refer to them safely.

```text
block_group.foundation_main
asset.front_door
marker.entrance.primary
marker.job.blacksmith_01
network.power.input_main
stage.frame_complete
zone.guard_platform
```

Coordinates alone are not sufficient identity because a later edit may move an object. Stable element IDs allow inheritance and migration to understand that the front door moved rather than being deleted and recreated.

## 5.3 Tags

Blueprint tags support search, generation and system queries:

- `culture.forest_human`
- `biome.temperate_forest`
- `function.housing`
- `function.defence`
- `worldgen.roadside`
- `state.restorable`
- `network.mechanical`
- `network.mana`
- `project.village_growth`
- `threat.goblin`
- `size.medium`

Tags supplement typed fields; they do not replace fields that require strict validation.

# 6. Editable Source, Runtime Products and Baking Boundaries

## 6.1 Editable Source Package

The source package stores:

- Sparse voxel block composition.
- Shaped-block references and orientation.
- Forge asset placements.
- Material-role assignments.
- Nested sub-blueprint references.
- Markers, zones and path guides.
- Network nodes and edges.
- Construction and state graphs.
- Placement and variant rules.
- Saved preview cameras.
- Revision and approval metadata.

## 6.2 Runtime Products

The baker may produce:

- Chunk-ready block stamps.
- Pre-resolved material palettes.
- Combined static prop meshes where safe.
- Collision caches.
- Door and interactive-object instance lists.
- Navigation-region or pathing caches.
- Semantic marker tables.
- Network graph caches.
- Construction-stage deltas.
- State-transition deltas.
- Distant LOD meshes or impostors.
- Icons, map thumbnails and miniature previews.
- Validation and dependency manifests.

## 6.3 Non-Destructive Rule

Baking may simplify or combine content but may not overwrite the editable source. If a new mesher, material system or LOD generator is introduced, approved blueprints must be re-bakeable from their original voxel and semantic data.

## 6.4 Runtime Ownership

Blueprint runtime products provide structure data, but they do not own:

- NPC decisions.
- Village economy calculations.
- Quest state.
- Machine recipe processing.
- Damage formulas.
- Network resource transactions.
- World-generation seed selection.

They expose validated endpoints to the systems that own those behaviours.

# 7. Coordinate Systems, Bounds, Anchors and Work Volumes

## 7.1 Coordinate Standards

Blueprint Forge uses the game's one-metre world block grid as the primary structure coordinate system. Forge props and machines may contain sub-block voxel detail, but their placement origin and occupied footprint remain declared relative to the world grid.

Each blueprint stores:

- Integer block-space coordinates.
- Optional sub-block transform for Forge assets.
- Local orientation.
- Stable local element ID.
- Parent module or nested blueprint.

## 7.2 Origins and Anchors

| Anchor | Purpose |
| --- | --- |
| Primary Origin | Default placement and rotation pivot. |
| Terrain Contact Anchor | Defines the expected ground level. |
| Road Connector | Connects to roads, paths or districts. |
| Water Connector | Aligns bridges, docks, mills and canals. |
| Upgrade Anchor | Keeps inherited upgrades aligned. |
| Module Connector | Joins reusable rooms, walls or spans. |
| Portal Anchor | Connects realm or teleport systems. |
| Construction Delivery Anchor | Defines initial project supply access. |

## 7.3 Bounds

Blueprints may define multiple bounds:

- **Visible bounds:** occupied visible geometry.
- **Collision bounds:** maximum physical footprint.
- **Construction bounds:** space required for scaffolds and builders.
- **Operational bounds:** clearance needed for doors, machines, wings or vehicles.
- **Worldgen exclusion bounds:** area that must remain clear of conflicting structures.
- **Influence bounds:** optional area affected by wards, morale, ownership or landmark discovery.

## 7.4 Rotation and Mirroring

Rotation and mirroring must remap:

- Directional blocks.
- Doors and hinges.
- Network ports.
- Entrance roles.
- Guard facing.
- Road connectors.
- One-way navigation links.
- Left/right semantic names where relevant.

A blueprint that cannot be safely mirrored should declare mirroring disabled rather than producing a broken version.

# 8. Semantic Layer Model

## 8.1 Required Layer Structure

| Layer | Contents | Can Be Hidden Independently? |
| --- | --- | --- |
| Physical Blocks | Terrain and construction blocks. | Yes |
| Shaped Pieces | Stairs, roofs, beams, arches, windows. | Yes |
| Props and Machines | Forge-created placed assets. | Yes |
| Functional Interactions | Doors, levers, crafting stations, beds. | Yes |
| NPC and Household | Beds, social points, assigned rooms, ownership. | Yes |
| Jobs and Work Zones | Workstations, work volumes, resource access. | Yes |
| Creature and Encounter | Nests, perches, spawns, patrols, boss anchors. | Yes |
| Navigation | Entrances, path guides, jump links, no-go zones. | Yes |
| Storage and Inventory | Chests, warehouse endpoints, loot sockets. | Yes |
| Automation and Logistics | Belts, chutes, item ports and routing. | Yes |
| Power and Fluid | Shafts, wires, pipes, water channels and fuels. | Yes |
| Mana and Magic | Conduits, ward anchors, ritual positions and leyline links. | Yes |
| Construction | Stages, scaffolds, delivery points and builder access. | Yes |
| Damage and Repair | Break groups, rubble, repair anchors and state deltas. | Yes |
| World Generation | Terrain tests, anchors, exclusions and relational rules. | Yes |
| Ownership and Permissions | Claim, access, faction and theft boundaries. | Yes |
| Decoration | Non-functional clutter and seeded variation sockets. | Yes |

## 8.2 Layer Rules

- Functional markers may exist without visible decoration.
- Decoration may not silently create gameplay function.
- A visible door should reference a valid entrance or explicitly be decorative.
- A workbench model should reference a functional station or be tagged as a non-interactive prop.
- Network endpoints must be visible in their overlay even when hidden behind walls.
- Construction-stage editing must show which layers are active at each stage.

## 8.3 Overlay Readability

Each semantic type receives a consistent icon, label and overlay style. Overlays must support:

- Category filters.
- Search by stable ID or role.
- Show only invalid elements.
- Show dependencies.
- Show current construction stage.
- Show selected dynamic state.
- Show access paths.
- Show connected network.
- Show marker-to-entity compatibility.

# 9. Block, Shape, Prop and Functional Asset Placement

## 9.1 Placement Sources

The Asset Browser can place:

- Full voxel blocks.
- Slabs, stairs, slopes, beams, posts, arches and roof pieces.
- Unique-shaped voxel blocks such as chutes.
- Doors, windows, gates and shutters.
- Furniture and decoration.
- Crafting stations and storage.
- Machines and automation components.
- Mana and ward infrastructure.
- Lighting and signage.
- Blueprint modules and nested assemblies.

## 9.2 Placement Tools

- Single placement.
- Line, wall, floor and volume fill.
- Replace by block, tag, material role or selection.
- Copy, paste, rotate and mirror.
- Extrude selection.
- Repeat along path.
- Roof and stair guides.
- Randomised palette brush using deterministic seed.
- Structural-family conversion, such as planks to matching stairs.
- Selection by connected material or semantic group.

## 9.3 Functional Asset Requirements

Every functional asset placement records:

- Stable asset ID.
- Transform and footprint.
- Expected gameplay definition ID.
- Interaction side or orientation.
- Clearance volume.
- Required marker or network roles.
- Construction-stage appearance.
- Damage and state compatibility.

## 9.4 Missing Dependency Behaviour

When a referenced asset is missing:

1. The source remains openable.
2. A visible placeholder preserves bounds and stable element ID.
3. Validation reports the missing dependency.
4. Baking fails for release unless an approved fallback exists.
5. The developer may remap the reference without recreating semantic data.

# 10. Nested Assemblies, Modules and Reusable Sub-Blueprints

## 10.1 Purpose

Large structures should be built from reusable modules rather than one unmanageable block volume.

Examples:

- Wall segment.
- Gatehouse module.
- House room.
- Stair core.
- Bridge span.
- Factory machine bay.
- Dungeon chamber.
- Roof section.
- Tower floor.
- Castle corner.

## 10.2 Module Connectors

Module connectors define:

- Position and orientation.
- Connector type.
- Allowed partner types.
- Required clearance.
- Seam material rules.
- Navigation continuity.
- Network pass-through.
- Stage and upgrade compatibility.

```text
connector.wall.standard
connector.road.small
connector.room.doorway_2m
connector.network.mana
connector.bridge.span
```

## 10.3 Nested Override Rules

A parent blueprint may:

- Use the child exactly as approved.
- Override permitted material roles.
- Enable a child variant.
- Add local decoration sockets.
- Disable optional markers.
- Reference a compatible upgrade.

It should not silently edit the child source. An explicit **Detach Copy** action creates a new independent source if deeper changes are required.

## 10.4 Circular Dependency Prevention

Blueprint A may not contain Blueprint B if B directly or indirectly contains A. The dependency graph must reject circular nesting before save or bake.

# 11. Materials, Roles, Culture Palettes and Biome Adaptation

## 11.1 Material Roles

Logical material roles separate function from a specific block ID.

| Role | Meaning | Example Resolutions |
| --- | --- | --- |
| `foundation_primary` | Main load-bearing base. | Cobblestone, granite, living root. |
| `wall_primary` | Main wall infill. | Timber frame, stone brick, packed clay. |
| `frame_primary` | Structural posts and beams. | Oak, darkwood, iron frame. |
| `roof_primary` | Main roof surface. | Shingles, slate, leaf tile. |
| `trim_primary` | Decorative edge material. | Iron, bronze, carved wood. |
| `window_primary` | Window family. | Glass, lattice, crystal panel. |
| `floor_primary` | Interior floor. | Planks, tile, stone. |
| `magic_accent` | Mana or rune detail. | Mana crystal, fae glow, void glass. |

## 11.2 Role Resolution

Resolution order may use:

```text
Explicit blueprint override
    -> culture palette
    -> biome adaptation
    -> faction palette
    -> family default
    -> approved global fallback
```

Every resolved block must satisfy the role's compatibility tags, such as roof support, transparency, fire resistance or magic conduction.

## 11.3 Culture Palettes

A culture palette can modify:

- Material roles.
- Roof shape family.
- Window and door assets.
- Decorative modules.
- Signage and banners.
- Furniture family.
- Lighting style.
- Magic infrastructure appearance.

The same logical blacksmith may therefore remain functionally compatible while appearing distinct across cultures.

## 11.4 Biome Adaptation

Biome profiles may apply:

- Raised foundations in wet areas.
- Steeper roofs in snow regions.
- Ventilation in hot climates.
- Local wood or stone substitutions.
- Moss, snow, dust or weathering layers.
- Wind orientation preferences.
- Water or terrain connector changes.

Biome adaptation should not make required doors, markers or networks unreachable.

## 11.5 Preview Matrix

Blueprint Forge should preview a structure across selected combinations:

```text
Culture x Biome x State x Upgrade Tier
```

Batch validation identifies combinations with missing materials, blocked doors or invalid clearances.

# 12. Entrances, Doors, Navigation and Accessibility

## 12.1 Entrance Contracts

An entrance marker defines:

- Exterior approach point.
- Interior arrival point.
- Door or opening element.
- Allowed entity sizes and locomotion classes.
- Direction and one-way rules.
- Ownership and permission hooks.
- Lock and security profile reference.
- Construction-stage availability.
- Damaged-state behaviour.

## 12.2 Door Validation

A functional door must have:

- Correct hinge and opening clearance.
- Reachable interaction position.
- Valid path on both sides.
- Compatible opening height and width.
- No permanent obstruction from decoration.
- State behaviour for closed, open, locked, damaged and missing.

## 12.3 Navigation Layers

Blueprints may contain:

- Preferred walking paths.
- Stair and ladder links.
- Jump or drop links.
- Flying approach volumes.
- Perch points.
- Swimming entrances.
- Mount-compatible paths.
- Cart or vehicle routes.
- Restricted and hazardous zones.
- Emergency evacuation routes.

These are guidance and validation inputs. Runtime navigation remains owned by the navigation system.

## 12.4 Entity Compatibility

Blueprint Forge can test selected entity profiles:

| Profile | Typical Checks |
| --- | --- |
| Humanoid Adult | Doorways, stairs, beds, workstations. |
| Small Humanoid | Reach and furniture scale. |
| Large Humanoid | Head clearance and corridor width. |
| Quadruped Livestock | Pen gates, feeding, turning space. |
| Mount | Stable entrance, rider clearance, path width. |
| Spider | Climb surfaces and nest access. |
| Bird | Perch and flight approach. |
| Dragon | Arena bounds, landing zone and attack clearance. |

## 12.5 Accessibility Foundation

Developer blueprints should support optional accessibility checks such as:

- Alternative route around ladders where required.
- Sufficient interaction clearance.
- Readable entrances.
- Avoiding unnecessary visual obstruction.
- Controller-friendly interaction grouping.

These checks inform game design without imposing modern-building realism on every fantasy structure.

# 13. NPC, Household, Job, Guard and Social Markers

## 13.1 Household Markers

A home may define:

- Household anchor.
- Bed slots.
- Personal storage.
- Shared storage.
- Meal or hearth point.
- Social positions.
- Child-safe or family zones.
- Ownership boundary.
- Visitor positions.

## 13.2 Job Markers

Every job marker declares:

- Job role compatibility.
- Workstation or work-zone reference.
- Interaction transform.
- Tool socket expectations.
- Input resource access.
- Output resource access.
- Required clearance.
- Schedule availability.
- Environmental requirements.

Examples:

- Smithing position at an anvil.
- Baker position at an oven.
- Farmer zone around crop rows.
- Guard position on a tower platform.
- Mage position at a rune table.
- Builder position at a construction anchor.

## 13.3 Guard and Defence Markers

- Guard post.
- Patrol waypoint.
- Watch direction.
- Alarm interaction.
- Cover position.
- Ranged firing position.
- Melee choke point.
- Rally point.
- Civilian shelter point.
- Raid entry expectation.

Guard markers must be reachable in the relevant structure state. A tower under construction may unlock its top guard post only after the platform stage completes.

## 13.4 Social and Service Markers

- Merchant counter.
- Queue point.
- Dialogue position.
- Teaching position.
- Meeting circle.
- Festival location.
- Worship or ritual position.
- Notice-board interaction.

## 13.5 Marker Capacity and Priority

Buildings may expose capacities:

```text
beds: 4
job.blacksmith: 1
job.apprentice: 1
guard.ranged: 2
visitor.social: 3
```

Capacity does not create NPCs by itself. Village simulation assigns compatible NPCs according to jobs, households and current needs.

# 14. Storage, Inventory, Trade and Village Warehouse Integration

## 14.1 Storage Roles

| Role | Purpose |
| --- | --- |
| Personal Storage | Belongs to a player or NPC household. |
| Job Input | Resources reserved for a workstation. |
| Job Output | Produced goods awaiting transfer. |
| Village General | Shared settlement stock. |
| Project Reserve | Resources reserved for construction. |
| Guard Supply | Weapons, armour and defence consumables. |
| Food Storage | Food with spoilage and access rules. |
| Fuel Storage | Fuel for heating or machines. |
| Magic Stock | Mana crystals, runes and catalysts. |
| Loot Storage | Worldgen or encounter reward inventory. |

## 14.2 Warehouse Blueprint Contract

A village warehouse blueprint should define:

- Public and restricted entrances.
- Delivery point.
- Manual storage interactions.
- Automation input endpoints.
- Category zones or container references.
- Project-reserve area.
- Ledger interaction point.
- Worker loading positions.
- Raid target or defence relevance.
- Upgrade capacity hooks.

## 14.3 Inventory Ownership

The blueprint declares ownership boundaries and default access roles, but runtime ownership and theft consequences remain owned by village, faction and crime systems.

## 14.4 Loot Population

World-generated loot sockets reference loot-table IDs and constraints rather than storing fixed items in the source blueprint. An instance seed resolves actual contents.

# 15. Automation, Power, Fluid, Mana and Ward Networks

## 15.1 Network Authoring Principle

Visible pipes, shafts and conduits must be backed by a semantic network graph where gameplay requires connectivity.

The graph stores:

- Node ID.
- Network type.
- Direction.
- Capacity or compatibility class.
- Connected asset port.
- Optional route guide.
- Stage availability.
- Damage-state behaviour.
- External connector role.

## 15.2 Supported Network Layers

- Item logistics.
- Mechanical rotation.
- Electrical or future technical power where applicable.
- Fuel flow.
- Water and fluid flow.
- Steam or pressure.
- Mana flow.
- Ward links.
- Logic or signal channels.
- Portal or dimensional links at late tiers.

## 15.3 External Connectors

A structure may expose named external ports:

```text
connector.item.input_north
connector.power.shaft_west
connector.fluid.water_south
connector.mana.primary
connector.road.delivery
```

These allow the building to connect to player-built or village infrastructure after placement.

## 15.4 Machine Clearance

Blueprint validation checks:

- Input and output access.
- Moving-part clearance.
- Maintenance position.
- Heat or hazard exclusion zone.
- NPC operating position.
- Network route clearance.
- Upgrade-space reservation.

## 15.5 Ward and Magic Layers

Magical structures may define:

- Mana source and sink endpoints.
- Conduit routes.
- Ward emitters.
- Protected area volumes.
- Ritual participant positions.
- Catalyst sockets.
- Leyline connection anchor.
- Corruption leak zone.
- Cleansing and stabilisation anchors.

The Magic System decides mana consumption and ritual outcomes. Blueprint Forge ensures the spatial arrangement is valid and readable.

# 16. Creature Nests, Enemy Camps, Dungeons and Boss Arenas

## 16.1 Creature Nest Markers

- Spawn point or volume.
- Sleeping or resting position.
- Feeding area.
- Egg or young location.
- Perch.
- Escape path.
- Territory boundary.
- Harvestable nest resource.
- Threat trigger.

## 16.2 Enemy Camp Semantics

A goblin camp may include:

- Raider spawn roles.
- Patrol paths.
- Alarm object.
- Stolen storage.
- Prisoner position.
- Cooking and sleep points.
- Raid-supply stock.
- Leader position.
- Retreat route.
- Occupation and cleared states.

## 16.3 Dungeon Composition

Dungeon blueprints may be:

- Fully authored structures.
- Modular room graphs.
- Authored key rooms with procedural connectors.
- Terrain-carving volumes plus block stamps.

Dungeon semantic layers may include:

- Entry and exit.
- Encounter zones.
- Lock and key progression.
- Puzzle anchors.
- Loot sockets.
- Checkpoints.
- Boss gate.
- Secret area.
- Collapse or trap zones.

## 16.4 Boss Arenas

Boss arena blueprints should support:

- Boss spawn and phase anchors.
- Player entry and safe arrival.
- Camera and presentation reference points.
- Attack clearance volumes.
- Flying and landing areas.
- Destructible arena groups.
- Environmental interaction points.
- Add-spawn points.
- Phase-specific state deltas.
- Exit, reward and aftermath anchors.

A dragon arena must be tested with the selected dragon's wingspan, turning radius, landing footprint and breath-attack origin.

# 17. World-Generation Placement Rules and Relational Anchors

## 17.1 Placement Profile

A worldgen-capable blueprint declares:

- Allowed biome and sub-biome tags.
- Region and climate rules.
- Culture and faction compatibility.
- Minimum and maximum slope.
- Elevation range.
- Soil, rock or water requirements.
- Road relationship.
- River, coast or lake relationship.
- Leyline or mana-density relationship.
- Nearby resource relationship.
- Danger and threat range.
- Settlement-distance range.
- Rotation and mirroring rules.
- Clearance and exclusion bounds.
- Rarity and density.
- Progression guarantees or fallback status.

## 17.2 Relational Anchors

World generation should place important structures relationally, not only through isolated random chance.

Examples:

```text
Village warehouse must be inside village bounds and road-connected.
Goblin camp should be within raid range but outside village safe radius.
Bridge must connect two compatible banks and route anchors.
Rune ruin should be near a mana clue or leyline influence.
Mine entrance should connect to valid underground resource or cave rules.
```

## 17.3 Guaranteed POC Relationships

The Forest Hamlet POC requires deterministic placement of:

- Forest hamlet.
- Village warehouse.
- Watchtower project site.
- Nearby bridge or crossing.
- Rune ruin.
- Goblin camp.
- Mine or cave entrance.
- Starter automation route opportunity.

The seed may vary local shape, but validation must ensure these relationships are achievable.

## 17.4 Placement Failure and Fallbacks

A progression-critical blueprint may define:

- Alternate footprint.
- Reduced terrain adaptation.
- Nearby relocation search.
- Replacement blueprint.
- Pre-generated safe region anchor.
- Explicit generation failure report.

World generation must never silently omit a required progression structure.

# 18. Terrain Adaptation, Foundations, Supports and Water Interaction

## 18.1 Adaptation Modes

| Mode | Behaviour | Suitable Structures |
| --- | --- | --- |
| Exact Stamp | Requires matching terrain and places unchanged. | Ruins, puzzle sites, arenas. |
| Foundation Fill | Fills beneath declared support footprint. | Houses, workshops, towers. |
| Terrain Cut | Removes terrain within approved excavation volume. | Basements, tunnels, dungeons. |
| Stilt or Pier | Extends supports downward to valid ground or waterbed. | Docks, swamp houses, bridges. |
| Conform Surface | Adjusts path, fence or field pieces to terrain. | Roads, trails, farms. |
| Modular Adaptation | Selects compatible entrance, stair or foundation modules. | Village buildings on varied terrain. |

## 18.2 Foundation Rules

Foundation markers define:

- Required support percentage.
- Allowed fill materials.
- Maximum unsupported span.
- Maximum fill depth.
- Bedrock or stable-ground requirement.
- Water compatibility.
- Excavation permission.
- Protected terrain exclusions.

This is a blueprint placement rule, not a global structural-integrity simulation.

## 18.3 Roads and Bridges

Road and bridge blueprints may use spline- or path-guided repetition while producing voxel segments. They need:

- Start and end connectors.
- Width and clearance.
- Surface material role.
- Support spacing.
- Bank or cliff anchors.
- Nav and cart compatibility.
- Water-flow clearance.
- Damage and repair segments.

## 18.4 Water Interaction

Water-aware structures define:

- Waterline.
- Flow direction where relevant.
- Intake and output points.
- Flood-sensitive zones.
- Dock approach.
- Underwater foundation.
- Mill wheel or turbine clearance.

# 19. Construction Stages, Project Recipes and NPC Building

## 19.1 Stage Graph

A blueprint may use a linear or branching construction graph.

```text
Site Preparation
    -> Foundation
    -> Frame
    -> Walls
    -> Roof
    -> Functional Installation
    -> Decoration and Completion
```

Each stage defines:

- Required prior stages.
- Block and asset additions.
- Removals such as temporary scaffolds.
- Required resources and project-recipe link.
- Builder work anchors.
- Delivery points.
- Estimated work units.
- Valid interruption state.
- Functional markers enabled at completion.
- Visual completion threshold.

## 19.2 Resource Calculation

The Forge calculates draft resource totals from:

- Block item forms.
- Shaped-piece recipes.
- Forge asset recipes.
- Scaffolding and temporary materials.
- Waste or efficiency rules supplied by project systems.

The final authoritative reservation and consumption remain owned by Project Recipe and village systems.

## 19.3 Visible Construction

Nearby construction should show:

- Supply crates or delivery areas.
- Scaffolds.
- Partial walls and frames.
- Builders carrying resources.
- Work animations at valid anchors.
- Stage-completion feedback.
- Damage or interruption if attacked.

Far-away construction may advance abstractly but must produce the same persistent stage result and resource conservation.

## 19.4 Builder Access Validation

Every active stage must provide:

- At least one reachable delivery point.
- Reachable work anchors.
- Safe enough standing space.
- No permanent entrapment by newly placed blocks.
- A valid path to the next stage's required area.

## 19.5 Stage Functionality

A structure may become partially functional before completion. Example:

| Stage | Function Enabled |
| --- | --- |
| Foundation | None; project site only. |
| Frame and platform | Builders can access upper level. |
| Guard platform | One temporary guard position. |
| Roof and railing | Full guard capacity and weather protection. |
| Lantern and alarm | Complete watchtower defence effect. |

# 20. Blueprint Inheritance, Upgrades and Delta Authoring

## 20.1 Parent and Child Blueprints

A child blueprint inherits:

- Shared physical elements.
- Material roles.
- Semantic layers.
- Validation profile.
- Placement compatibility.
- Icons or cameras where permitted.

It stores only deliberate differences where practical.

## 20.2 Delta Types

- Add block or asset.
- Remove inherited element.
- Move inherited element.
- Replace asset or material role.
- Change marker property.
- Add or remove marker.
- Expand bounds.
- Change network edge.
- Add construction stage.
- Change placement rule.
- Add supported state.

## 20.3 Upgrade Blueprint Example

```text
Small Blacksmith T1
    -> Blacksmith T2
        + rear forge room
        + apprentice workstation
        + larger storage
        + chimney upgrade
        + second automation input
    -> Runic Blacksmith T3
        + mana conduit
        + rune table
        + warded material store
```

## 20.4 Upgrade Placement Validation

Before a world instance upgrades, the game checks:

- Expansion footprint is clear or resolvable.
- Current damage does not invalidate upgrade rules.
- Occupants and stored items have safe migration paths.
- Network connectors can be preserved or remapped.
- Doorways and navigation remain valid.
- Required resources and permissions exist.

## 20.5 Rebase and Conflict Handling

If a parent blueprint changes after a child was authored, Blueprint Forge presents:

- Automatically inherited safe changes.
- Conflicts with child overrides.
- Removed elements still referenced by the child.
- Marker or network remapping requirements.
- Side-by-side visual comparison.

No conflicting rebase should silently overwrite approved child work.

# 21. Dynamic States, Damage, Repair, Occupation and Restoration

## 21.1 State Types

- Intact.
- Under construction.
- Damaged.
- Burned.
- Flooded.
- Frozen or snow-covered.
- Abandoned.
- Occupied by another faction.
- Monster-infested.
- Corrupted.
- Cleansed.
- Repaired.
- Restored.
- Upgraded.
- Deactivated or activated.

## 21.2 State Delta Model

A state stores changes from the base or current upgrade tier:

- Replaced or missing blocks.
- Enabled rubble or debris assets.
- Disabled doors or machines.
- Changed markers and paths.
- Changed ownership defaults.
- Spawn or encounter changes.
- Material overlays.
- Repair requirements.
- Quest evidence and discovery flags.

## 21.3 Damage Groups

Elements can belong to named damage groups:

```text
damage_group.roof
damage_group.front_gate
damage_group.watch_platform
damage_group.mana_core
```

Damage groups support:

- Shared health or integrity references.
- State transitions.
- Debris profiles.
- Disabled functions.
- Repair project generation.

Combat and damage systems decide when the group changes state. Blueprint Forge defines the spatial and presentation consequences.

## 21.4 Occupation

Occupation variants may change:

- Banners and signs.
- Guard and patrol markers.
- Storage ownership.
- Spawn profiles.
- Locked areas.
- Traps and defences.
- Decoration and clutter.

The underlying structure ID may remain stable while current controller and occupation state change at runtime.

## 21.5 Restoration

A ruin can reference a restored blueprint or restoration delta. The Forge compares ruined and restored versions to derive:

- Missing materials.
- Debris removal.
- Stage sequence.
- Restored functions.
- Required specialists.
- Story or reputation consequences exposed to other systems.

# 22. Variants, Procedural Detail and Deterministic Seeds

## 22.1 Variant Layers

```text
Base logical blueprint
    + culture palette
    + biome adaptation
    + upgrade tier
    + seeded decoration
    + current dynamic state
    + local visual override
```

## 22.2 Procedural Decoration Sockets

Sockets may choose from approved sets:

- Crates and barrels.
- Furniture arrangement.
- Banners.
- Plants.
- Market goods.
- Books and tools.
- Wall decorations.
- Rubble and damage clutter.

Each socket defines:

- Allowed asset tags.
- Maximum count.
- Orientation rules.
- Collision and path exclusions.
- Culture and biome filters.
- Stable seed channel.

## 22.3 Reproducibility

Every procedural choice must derive from stable inputs such as:

```text
world_seed + blueprint_instance_id + variant_channel
```

The resolved result is reproducible across saves and multiplayer clients. Developers may bake a procedural result into explicit source placements when a fixed authored version is preferred.

## 22.4 Variant Validation

Batch validation tests:

- Every required material role resolves.
- Doors remain reachable.
- Navigation is not blocked by decoration.
- Network endpoints remain connected.
- Construction resources are valid.
- Icons can be generated.
- Runtime budgets remain within profile.

# 23. Icon Capture, Maps, Miniatures and Presentation Products

## 23.1 Blueprint Icon Types

| Product | Typical Use | Default View |
| --- | --- | --- |
| Inventory/Blueprint Icon | Player blueprint item or creative library. | Isometric completed structure. |
| Village Project Icon | Request board and project UI. | Front three-quarter or construction preview. |
| Map Thumbnail | Map and structure discovery. | Elevated simplified view. |
| Codex Image | Lore and structure entry. | Cinematic environment view. |
| Upgrade Comparison | Settlement management UI. | Matched before-and-after camera. |
| Construction Stage Preview | Project planning. | Saved stage-specific view. |
| Worldgen Debug Thumbnail | Developer validation. | Top-down bounds and anchors. |

## 23.2 Live Capture Workflow

1. Choose blueprint variant, stage and state.
2. Resolve material roles and deterministic decoration.
3. Select environment preset.
4. Position or recall saved camera.
5. Auto-frame visible bounds or selected group.
6. Preview background, shadow, outline and lighting.
7. Capture one or more resolutions.
8. Store capture profile and dependency hash.

## 23.3 Linked and Locked Captures

- **Linked capture:** regenerates when source dependencies change.
- **Locked capture:** preserves the approved image and warns when stale.

## 23.4 Miniature Preview

Blueprint Forge may render a live miniature that can be rotated in the project board or creative browser. The miniature uses baked structure geometry and does not need to instantiate full NPC, network or simulation systems.

# 24. Validation, Simulation Preview and Forge Test Laboratory

## 24.1 Validation Categories

| Category | Examples |
| --- | --- |
| Identity | Missing IDs, duplicates, invalid inheritance. |
| Dependency | Missing block, asset, material, recipe or child blueprint. |
| Geometry | Out-of-bounds element, disconnected voxel group, invalid rotation. |
| Navigation | Unreachable entrance, bed, job site or escape route. |
| Clearance | Door collision, blocked machine, insufficient mount or wing space. |
| Semantic | Required marker absent, decorative object incorrectly functional. |
| Network | Unconnected endpoint, wrong direction, unsupported type. |
| Construction | Unreachable stage, missing resources, trapped builders. |
| Worldgen | Impossible slope, invalid water anchor, conflicting exclusion bounds. |
| State | Damage or upgrade references missing element. |
| Variant | Missing material role, decoration blocking path. |
| Performance | Excessive blocks, entities, transparent surfaces or live systems. |
| Presentation | Missing icon, stale capture or unreadable silhouette. |

## 24.2 Test Laboratory Scenarios

Blueprint Forge should provide reusable scenarios:

- Neutral construction pad.
- Forest village lot.
- Sloped terrain.
- Snow biome.
- River crossing.
- Cave or underground volume.
- Active factory connection.
- Mana and ward test.
- NPC household test.
- NPC workday test.
- Raid and defence test.
- Creature nest test.
- Boss arena test.
- Damage, fire and repair scrub.
- Multiplayer authority preview where supported.

## 24.3 Simulated NPC Use

The test system can spawn approved test profiles and ask them to:

- Enter and leave.
- Reach every bed.
- Use each workstation.
- Carry resources from delivery to storage.
- Patrol guard positions.
- Evacuate through emergency route.
- Build each construction stage.
- Repair selected damage groups.

Failures produce path visualisation and marker diagnostics.

## 24.4 Network Simulation

A lightweight test can verify:

- External input reaches intended machine.
- Output reaches storage.
- Power routes are complete.
- Mana source reaches ward or machine.
- Blocked output state has a valid presentation and safe behaviour.

It does not replace the full runtime simulation; it validates authored contracts.

## 24.5 State Scrubber

Developers can scrub between:

```text
Construction stages
Upgrade tiers
Damage levels
Occupation states
Corruption and cleansing
Season and biome overlays
```

The viewport highlights additions, removals, broken references and changed functionality.

# 25. Dependencies, Overrides, Revision History and Approval

## 25.1 Dependency Graph

The graph shows:

- Blocks and materials used by the blueprint.
- Props, machines and doors.
- Child and parent blueprints.
- Construction recipes.
- Marker profiles.
- Culture and biome palettes.
- Icons and baked products.
- Structures or worldgen sets that reference this blueprint.

## 25.2 Edit Modes

- Edit source blueprint.
- Edit as project override.
- Duplicate as new blueprint.
- Create child upgrade.
- Create state variant.
- Create culture variant.
- Open approved version read-only.
- Compare with parent or previous revision.

## 25.3 Field-Level Reversion

Developers may revert:

- One block group.
- One marker.
- One material-role override.
- One stage.
- One network edge.
- One placement rule.
- One icon profile.
- Entire blueprint override.

## 25.4 Lifecycle

```text
Concept -> Draft -> Functional -> Visual Review -> Approved
                                     -> Changes Requested
Approved -> Deprecated -> Legacy Fallback -> Removed after migration
```

Required approval evidence may include:

- Validation report.
- Preview images.
- Dependency status.
- POC or production tag.
- Reviewer notes.
- Performance budget result.
- Migration note when replacing a shipped blueprint.

## 25.5 Revision History

Each revision records:

- Author or automation source.
- Timestamp.
- Changed fields and elements.
- Before-and-after preview.
- Validation changes.
- Approval status.
- Optional reason or task reference.

# 26. Packaging, Portability, Migration and Collaboration

## 26.1 Blueprint Package Contents

```text
Blueprint source
Nested source dependencies where included
Required asset and block references
Material-role and palette references
Semantic marker data
Network graphs
Construction and state graphs
World-placement profile
Baked runtime products
Icons and previews
Validation report
Migration rules
Credits and licence metadata
```

## 26.2 Thin and Self-Contained Packages

- **Thin package:** references shared project dependencies by ID.
- **Self-contained package:** includes permitted source dependencies for transfer or backup.

The exporter reports unresolved external dependencies before packaging.

## 26.3 Migration Rules

A migration may map:

- Old blueprint ID to new ID.
- Removed block IDs to replacements.
- Moved semantic element IDs.
- Old construction stage to new stage.
- Old variant names to new profiles.
- Old network endpoint to replacement.
- Existing instance state to compatible new state.

## 26.4 Existing World Safety

When an approved blueprint changes, existing placed instances should not be blindly reconstructed. Update policies may include:

- New placements only.
- Presentation-only hot update.
- Safe element remap.
- Player-approved upgrade project.
- World migration with backup.
- Preserve existing instance as legacy variant.

## 26.5 Collaboration

Blueprint source should be stored in deterministic, diff-friendly data where practical. Large voxel volumes may use chunked binary source with companion metadata and preview diffs. Locking or merge tools should operate at module, layer or region level when simultaneous editing becomes necessary.

# 27. Performance, LOD, Persistence and Multiplayer

## 27.1 Performance Budgets

Validation tracks:

- Number of blocks and shaped pieces.
- Unique materials.
- Interactive assets.
- Animated parts.
- Transparent surfaces.
- Collision complexity.
- Navigation links.
- Semantic markers.
- Network nodes and edges.
- Nested blueprint depth.
- Dynamic-state delta size.
- Distant LOD cost.

## 27.2 Structure LOD Layers

| Layer | Nearby | Medium | Distant/Unloaded |
| --- | --- | --- | --- |
| Rendering | Full blocks and assets. | Simplified props and reduced animation. | Baked mesh, impostor or hidden. |
| Collision | Full relevant collision. | Simplified major collision. | None unless needed for remote systems. |
| Navigation | Detailed local navigation. | Cached entrances and routes. | Abstract connectivity summary. |
| NPC Use | Individual markers and tasks. | Reduced task detail. | Building capacity and output summary. |
| Networks | Visible items and detailed graph. | Batched graph updates. | Abstract production/storage totals. |
| Damage | Individual block evidence where loaded. | Grouped damage state. | Compact integrity summary. |

## 27.3 Persistent Structure Record

A placed structure may retain:

- Stable instance ID.
- Blueprint definition and version.
- Resolved variant seed.
- Transform and world anchors.
- Construction or upgrade stage.
- Ownership and faction control.
- Occupants and capacity summary.
- Storage and network record references.
- Damage groups and missing critical elements.
- Quest and event bindings.
- Occupation, corruption, repair and restoration history.

## 27.4 Multiplayer Authority

The authoritative world owns:

- Blueprint placement validation.
- Resource reservation and construction progress.
- Structure state transitions.
- Ownership and permissions.
- Storage and network transactions.
- Damage and repair results.
- Worldgen placement and persistent instance creation.

Clients may preview placement, construction ghosts, animations and icons but cannot commit persistent changes without validated commands.

## 27.5 Deterministic Variants

Resolved variant seeds and role mappings replicate as compact data. Clients should not independently choose different decoration or material results.

# 28. Proof-of-Concept Scope and Staged Delivery

## 28.1 Required POC Blueprints

| Blueprint | Core Proof |
| --- | --- |
| Forest Cottage | Housing, beds, door, storage, culture palette and icon capture. |
| Village Warehouse | Storage roles, delivery, automation input, ledger marker and permissions. |
| Forest Watchtower | Staged construction, guard posts, damage, repair and raid impact. |
| Timber Bridge | Terrain/water anchors, modular span, navigation and support adaptation. |
| Iron Workshop | Job site, furnace/machine clearance, storage and automation/power connectors. |
| Goblin Camp | Enemy spawns, patrol, alarm, stolen storage, occupation and cleared state. |
| Old Rune Ruin | Worldgen placement, mana anchors, loot/lore, corruption and restoration hook. |

## 28.2 Staged Delivery

### Stage 1 - Core Composition

- Create blueprint resource and stable IDs.
- Place blocks, shaped pieces and Forge assets.
- Define bounds, origins, rotations and icons.
- Save, load and re-open without loss.

### Stage 2 - Semantic Layers

- Add doors, entrances, beds, jobs, guard posts and storage.
- Add navigation and clearance validation.
- Prove Forest Cottage.

### Stage 3 - Construction and Dynamic States

- Author stage graph and project-resource link.
- Preview scaffolds and stage deltas.
- Add damage and repair groups.
- Prove Watchtower.

### Stage 4 - Networks and Functional Buildings

- Add item, power and mana graph layers.
- Validate machine clearances and external connectors.
- Prove Warehouse, Workshop and Rune Ruin.

### Stage 5 - World Placement and Terrain

- Add biome, road, water, terrain and relational anchors.
- Add bridge adaptation and worldgen validation.
- Prove Bridge, Goblin Camp and deterministic POC relationships.

### Stage 6 - Inheritance, Packaging and Runtime LOD

- Add upgrades, variants and child blueprints.
- Add dependency graph, revision comparison and packaging.
- Bake runtime products and distant representations.

## 28.3 Explicit POC Deferrals

- Full procedural city generation.
- Full modular dungeon grammar.
- Region-scale castle authoring.
- Player-facing public blueprint sharing.
- Cross-world marketplace.
- Full structural-integrity simulation.
- Complete VFX and Audio Forge modules.
- All culture palettes and biomes.
- Final multiplayer optimisation for megastructures.

# 29. Success Criteria and Acceptance Matrix

| Area | Acceptance Rule |
| --- | --- |
| Voxel Source | Every visible component can be traced to a voxel block or Forge-authored voxel asset. |
| Persistence | Saving and reopening preserves blocks, elements, markers, networks, stages and IDs. |
| Semantic Use | Test NPCs can enter, sleep, work, store, guard or interact according to blueprint roles. |
| Construction | Watchtower stages consume valid project inputs and remain builder-accessible. |
| Upgrade | At least one child blueprint stores and previews deltas from its parent. |
| Dynamic State | At least one structure can switch between intact, damaged and repaired forms without losing stable identity. |
| Worldgen | Bridge, camp and ruin pass declared terrain and relational placement tests. |
| Networks | Workshop or warehouse validates at least one external logistics/power connection. |
| Variants | One logical structure resolves at least two material/culture variants reproducibly. |
| Icon Capture | Blueprint icon and project preview generate from saved live-view profiles. |
| Validation | Invalid door, unreachable marker, broken network and missing dependency are detected. |
| Runtime Baking | Source produces chunk/block data, semantic tables and preview products without destroying source data. |
| LOD | At least three structure detail levels preserve stable state and function summaries. |
| Multiplayer Safety | Persistent placement and state changes remain authoritative. |
| Override Safety | A project visual override can be applied and reverted without changing the blueprint's gameplay identity. |

## 29.1 Definition of Done for Document 22I

This design document is complete when it clearly defines:

- What Blueprint Forge is and is not.
- How voxel structure source is stored.
- How semantic layers and entities interact.
- How construction, upgrades and dynamic states work.
- How blueprints adapt to cultures, biomes and terrain.
- How world generation places and validates structures.
- How icons, revisions, dependencies and packages are produced.
- What Document 22J must expose in UI and workflow.
- What Document 22K must implement technically.
- What Document 22L must migrate and produce.

# 30. Relationships With Documents 22J-22L

## 30.1 Document 22J - Unified Forge UI/UX and Creator Workflow

22J must define:

- Blueprint browser and creation wizard.
- Layer list and visibility controls.
- Block and asset palette.
- 3D viewport and orthographic editing.
- Marker, zone and network editors.
- Construction and state timeline.
- Inheritance and revision comparison.
- World-placement preview.
- Validation panels.
- Icon Capture Studio integration.
- Blueprint-to-game test workflow.

## 30.2 Document 22K - Forge Entity and Blueprint Technical Implementation Plan

22K must define:

- Godot Resource schemas.
- Sparse block and element storage.
- Stable local element IDs.
- EditorPlugin architecture.
- Network and marker resources.
- Bake pipeline and caches.
- Construction/state delta application.
- Worldgen integration.
- Runtime structure instances and persistence.
- LOD promotion and demotion.
- Validation services and automated tests.

## 30.3 Document 22L - Entity and Blueprint Visual Production and Migration Plan

22L must define:

- Current blueprint and structure audit.
- Priority POC templates.
- Migration from existing hand-built scenes or prototypes.
- Culture and biome palette backlog.
- NPC, creature and structure validation matrix.
- Approval batches and production status.
- Legacy fallback and replacement rules.

# Appendix A. Blueprint Registry Field Template

| Group | Field | Required | Notes |
| --- | --- | --- | --- |
| Identity | `blueprint_id` | Yes | Stable namespaced ID. |
| Identity | `family_id` | No | Shared building or structure family. |
| Identity | `parent_blueprint_id` | No | Inheritance source. |
| Identity | `category` | Yes | Typed category. |
| Identity | `tags` | Yes | Search and compatibility tags. |
| Source | `source_version` | Yes | Editable schema version. |
| Source | `bounds` | Yes | Source and placement bounds. |
| Source | `origin_anchor` | Yes | Default placement origin. |
| Source | `block_volume` | Yes | Sparse voxel block data. |
| Source | `asset_elements` | No | Forge asset placements. |
| Source | `nested_blueprints` | No | Reusable modules. |
| Materials | `material_roles` | No | Logical role definitions. |
| Materials | `variant_profile` | No | Culture, biome and seed rules. |
| Semantics | `markers` | No | Point and transform roles. |
| Semantics | `zones` | No | Volumes and areas. |
| Semantics | `paths` | No | Navigation and route guides. |
| Networks | `network_graphs` | No | Typed nodes and edges. |
| Construction | `stage_graph` | No | Construction or restoration stages. |
| Construction | `project_recipe_id` | No | Project registry link. |
| States | `state_profile` | No | Damage, occupation and restoration states. |
| Worldgen | `placement_profile` | No | Terrain and relational rules. |
| Presentation | `icon_profile` | No | Saved capture settings. |
| Runtime | `bake_version` | Yes after bake | Runtime product compatibility. |
| Runtime | `lod_profile` | Yes for production | Structure LOD rules. |
| Governance | `lifecycle_state` | Yes | Draft through approved/deprecated. |
| Governance | `planning_status` | Yes | POC, Alpha, Beta, Final, Deferred. |
| Governance | `dependencies` | Generated | Dependency graph inputs. |
| Governance | `validation_report` | Generated | Latest validation result. |

# Appendix B. Semantic Layer and Marker Taxonomy

## B.1 Common Point Markers

```text
marker.entrance.primary
marker.entrance.service
marker.delivery.primary
marker.dialogue.owner
marker.nameplate.structure
marker.map.discovery
marker.loot.primary
marker.repair.primary
marker.alarm.primary
```

## B.2 NPC and Household

```text
marker.bed.adult_01
marker.bed.child_01
marker.meal.seat_01
marker.social.stand_01
marker.job.blacksmith_01
marker.job.builder_01
marker.guard.ranged_01
marker.guard.melee_01
marker.shelter.civilian_01
```

## B.3 Creature and Encounter

```text
marker.spawn.goblin_raider_01
marker.spawn.boss_01
marker.nest.primary
marker.perch.large_01
marker.patrol.01
marker.retreat.01
marker.arena.player_entry
marker.arena.reward
```

## B.4 Network Endpoints

```text
network.item.input_primary
network.item.output_primary
network.power.mechanical_input
network.fluid.water_input
network.mana.input_primary
network.ward.emitter_primary
network.signal.alarm
```

## B.5 Zones

```text
zone.household.private
zone.work.blacksmith
zone.storage.project
zone.guard.platform
zone.hazard.heat
zone.ward.protected
zone.worldgen.exclusion
zone.construction.scaffold
```

# Appendix C. Blueprint Validation Checklist

## Identity and Dependencies

- [ ] Blueprint ID is unique and correctly namespaced.
- [ ] Parent and child references are valid.
- [ ] No circular nested blueprint dependencies exist.
- [ ] All block, asset, material and recipe references resolve.
- [ ] Stable local element IDs are unique.

## Geometry and Placement

- [ ] Elements remain within declared bounds.
- [ ] Origin and terrain contact anchor are correct.
- [ ] Allowed rotations preserve directional elements.
- [ ] Mirroring is validated or disabled.
- [ ] Required operational clearance is unobstructed.

## Navigation and Entity Use

- [ ] Every functional entrance is reachable.
- [ ] Doors have valid opening clearance.
- [ ] Beds and job sites are reachable by compatible entities.
- [ ] Guard and patrol markers are reachable in relevant states.
- [ ] Mount, bird or dragon clearances are tested where required.

## Construction and States

- [ ] Every stage has valid prerequisites.
- [ ] Delivery and builder anchors remain reachable.
- [ ] Resource references resolve.
- [ ] Stage deltas do not trap builders.
- [ ] Damage, repair and upgrade deltas reference valid elements.

## Networks

- [ ] Required endpoints are present.
- [ ] Directions and network types are compatible.
- [ ] External connectors are accessible.
- [ ] Machine maintenance and hazard zones are valid.
- [ ] Mana and ward routes are complete where required.

## World Generation

- [ ] Terrain and biome rules are achievable.
- [ ] Road, water and relational anchors are valid.
- [ ] Clearance and exclusion bounds are correct.
- [ ] Required fallback exists for progression-critical placement.
- [ ] Deterministic seed channels are declared.

## Presentation and Performance

- [ ] Required icon and preview profiles exist.
- [ ] Material roles resolve in required variants.
- [ ] Distant LOD or abstraction profile exists for production structures.
- [ ] Budget warnings are reviewed.
- [ ] Latest validation report passes approval threshold.

# Appendix D. POC Blueprint Template Set

| Template ID | Purpose | Mandatory Features |
| --- | --- | --- |
| `template.building.small_house` | Base home authoring. | Door, beds, storage, material roles, icon. |
| `template.village.warehouse` | Shared village storage. | Delivery, categories, ledger, permissions, automation endpoint. |
| `template.defence.watchtower` | Staged defence project. | Stages, guard positions, damage and repair. |
| `template.infrastructure.bridge` | Water-crossing authoring. | Bank anchors, supports, route and terrain adaptation. |
| `template.job.workshop` | Functional job building. | Workstation, storage, machine clearance and network connectors. |
| `template.enemy.camp` | Hostile site. | Spawns, patrol, alarm, loot, cleared/occupied state. |
| `template.magic.ruin` | Magical world site. | Mana anchors, lore, loot, corruption and restoration hook. |

# Appendix E. Example Forest Hamlet Watchtower Blueprint

## E.1 Identity

```text
blueprint_id: structure.village.forest_watchtower_t1
family_id: family.village.watchtower
category: village_project / defence_structure
size_tier: small
culture_default: culture.forest_human
planning_status: POC_REQUIRED
```

## E.2 Physical Composition

- Stone foundation pad.
- Four oak support posts.
- Cross-braced timber frame.
- Ladder or stair access.
- Elevated guard platform.
- Railing.
- Shingled roof.
- Ward-compatible lantern hook.
- Alarm bell attachment point.

## E.3 Material Roles

```text
foundation_primary -> cobblestone
frame_primary -> oak_log
floor_primary -> oak_plank
roof_primary -> oak_shingle
trim_primary -> iron_fitting
```

## E.4 Semantic Markers

```text
marker.entrance.primary
marker.delivery.primary
marker.job.builder_01
marker.guard.ranged_01
marker.guard.ranged_02
marker.alarm.primary
marker.repair.foundation
marker.repair.platform
zone.guard.platform
zone.worldgen.exclusion
```

## E.5 Construction Stages

| Stage | Added Content | Function |
| --- | --- | --- |
| Site | Project anchor and delivery area. | Accept resources. |
| Foundation | Stone base and first scaffolds. | Stable site. |
| Frame | Main timber posts and access scaffold. | Builders reach upper level. |
| Platform | Floor, ladder and temporary railing. | One temporary guard position. |
| Roof and Rail | Full railing and roof. | Two guard positions. |
| Completion | Lantern, alarm and final trim. | Full raid-warning and defence benefit. |

## E.6 Dynamic States

- Damaged foundation.
- Burned frame.
- Broken platform.
- Missing roof.
- Repaired.
- Mana-lantern upgraded.

## E.7 POC Validation

- Builders can reach every active stage.
- Guard can reach the top after platform completion.
- Ladder remains unobstructed.
- Alarm interaction is reachable.
- Damage can disable one guard position.
- Repair restores function.
- Completion changes the goblin raid outcome through the village defence system.

# Appendix F. Glossary

| Term | Meaning |
| --- | --- |
| Blueprint | Reusable voxel structure definition containing composition and semantic data. |
| Blueprint Definition | Immutable or versioned shared source used by placed instances. |
| Structure Instance | One persistent placed copy with current state, owner and history. |
| Semantic Marker | Named point or transform used by gameplay systems. |
| Semantic Zone | Named volume defining work, ownership, hazard or other meaning. |
| Material Role | Logical building-material purpose resolved through palettes. |
| Stage Delta | Additions and removals applied for a construction stage. |
| State Delta | Changes applied for damage, occupation, corruption or restoration. |
| Nested Blueprint | Reusable blueprint placed inside another blueprint. |
| Module Connector | Validated join point between reusable blueprint modules. |
| Relational Anchor | Placement requirement connecting a structure to another world feature. |
| Runtime Product | Baked data used efficiently by the game. |
| Terrain Adaptation | Controlled modification or module selection used to fit a blueprint to terrain. |
| Blueprint Forge | Unified Forge workspace for creating and validating structure blueprints. |

---

**End of Document 22I - Blueprint Forge: Building, Structure and World Blueprint Authoring - Version 0.1**
