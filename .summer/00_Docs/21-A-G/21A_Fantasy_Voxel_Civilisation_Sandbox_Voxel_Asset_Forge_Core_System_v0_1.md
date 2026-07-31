# Fantasy Voxel Civilisation Sandbox
## 21A - Voxel Asset Forge - Vision, Scope and Core Rules
**Version 0.1 - Detailed Design Bible Draft**

A unified developer asset-authoring system for creating, editing, replacing, validating and baking voxel blocks, unique block models, items, props, machines, materials, animations and visual states without rewriting their coded gameplay behaviour.

## Voxel Asset Forge System Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the Forge vision, system identity, terminology, supported assets, developer access, authoring modes, gameplay/presentation boundaries, override philosophy, registry relationships, visual rules, MVP scope and success criteria. |
| Core Philosophy | Create assets from readable pixel-voxel building blocks, then bake them into efficient runtime textures, meshes, collisions, icons and state-driven presentation data. |
| Primary User | The full Forge is a developer-section tool. It gives authorised developers direct control over built-in and project assets while preserving stable gameplay definitions. |
| Asset Direction | Support standard textured blocks, generated construction shapes, unique voxel-shaped blocks, items, props, stations, machines, automation parts, magical infrastructure and animated visual components. |
| Override Direction | Any visual layer may be overridden independently: model, texture, material, palette, animation, state presentation, particles, sockets, icon, collision or placement presentation. |
| Animation Direction | Use a hybrid system: named-part transform animation, material animation, optional voxel-frame animation, particles, sound sockets and coded state bindings. |
| Runtime Direction | Editor voxels are an authoring representation, not thousands of permanent runtime nodes. Assets are baked, merged, cached and validated before use. |
| Implementation Context | Current implementation target is Godot with Summer Engine. Earlier Unreal-specific engineering notes remain conceptual references only where their data and architecture principles still apply. |
| MVP Direction | First prove block-face painting, unique voxel modelling, simple compound parts, rotating gear and furnace-state examples, developer overrides, baking, registry linkage and in-game preview. |
| Deferred Boundary | NPC, humanoid, creature and monster body creation is deliberately deferred to a later character/creature Forge series that reuses this foundation. |

## Document Purpose

This document establishes the master vision and governing rules for the Voxel Asset Forge. It explains what the Forge is allowed to create, how it fits into Leyforge, which responsibilities remain in gameplay code, how visual overrides work, and which capabilities belong in later specialist documents.

The Forge exists to solve the visual production problem without abandoning the project's data-driven foundation. It must make it practical to build and revise hundreds of blocks, items, machines and effects while keeping stable IDs, recipes, automation links, village use, save compatibility and coded behaviour intact.

This document does not define every modelling tool, every animation timeline control or every technical class. Those details belong in Documents 21B through 21F. It does, however, lock the rules those documents must follow.

## Engine Status Note

> **Current Project Direction**  
> Leyforge has moved from Unreal Engine 5 to Godot, using Summer Engine as the AI-native development environment. Document 18 remains useful for concepts such as stable IDs, validated registries, baked voxel meshes, state separation and versioned data, but its Unreal-specific implementation direction is superseded for this system.

## Design Sources

| Source Document | Relevant Direction | How 21A Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Stylised high-fidelity voxel fantasy; terrain must stay readable while tools, machines, characters and creatures may use more detailed models. | Locks the Forge art boundary: richer than a basic block game, but not realism at the expense of readability or production scale. |
| 03 - Blocks Registry | One-metre default blocks, broad shape families, parent definitions, material families, block variants and runtime states. | Defines the world-facing assets and inheritance model the Forge must author and override. |
| 04 - Items Registry | Blocks and items remain separate but linked; items may have held, dropped, equipped, icon and placed forms. | Requires the Forge to support multiple visual presentations without merging gameplay records incorrectly. |
| 08 - Automation System | Machines are physical blocks with visible ports, power, movement, ownership, throughput, damage and active states. | Requires compound models, sockets, readable animations and state-driven visual feedback. |
| 09 - Magic System | Magic is physical infrastructure using runes, conduits, wards, mana devices and world-state effects. | Requires emissive materials, flowing visual states, magical sockets, corruption variants and animated effects. |
| 12 - Structures | Blueprints, material variants, dynamic states, damage, restoration and culture-specific construction are first-class systems. | Requires immediate Forge integration with structure and blueprint workflows. |
| 17 - UI/UX System | Complex systems must remain inspectable, consistent, controller-aware and understandable. | Guides the Forge toward a clear, safe, recoverable developer workflow rather than a collection of hidden debug panels. |
| 18 - Technical Implementation Plan | Stable IDs, versioned definitions, registry validation, palette-driven voxel rendering, baked meshes and save-safe content changes. | Retains these architecture principles while replacing Unreal-specific implementation with Godot/Summer Engine implementation later in 21F. |

## Static Table of Contents

- 1. Locked Voxel Asset Forge Identity
- 2. Player Decision and Direction Summary
- 3. System Terminology and Conceptual Model
- 4. Scope and Supported Asset Families
- 5. Forge Authoring Modes
- 6. Developer Section, Access and Permissions
- 7. Gameplay and Presentation Separation
- 8. Asset Identity, Inheritance, Variants and Overrides
- 9. Core Creation and Editing Workflows
- 10. Visual Style, Scale and Modelling Rules
- 11. Animation, Effects and State Presentation Principles
- 12. Runtime State Presentation Contract
- 13. Registry and Content Pipeline Integration
- 14. Blueprint Designer and Structure Integration
- 15. Validation, Safety, Versioning and Recovery
- 16. Visual Overhaul and Production Use
- 17. Future Player, Modding and Content-Pack Editions
- 18. Minimum Viable Forge Scope
- 19. Success Criteria and Acceptance Rules
- 20. Relationships With Documents 21B-21G
- Appendix A. Asset Category Matrix
- Appendix B. Core Rule Register
- Appendix C. Glossary
- Appendix D. MVP Checklist

## 1. Locked Voxel Asset Forge Identity

The Voxel Asset Forge is Leyforge's unified visual-authoring layer. It allows authorised developers to create and revise the appearance of world blocks, unique block shapes, items, props, stations, machines, automation components and magical infrastructure from inside the project's developer tools.

The Forge is not merely a texture painter and it is not merely a voxel modeller. It is the controlled bridge between editable source assets and the data-driven game. A Forge asset may include voxel volumes, face textures, named parts, pivots, sockets, materials, palettes, collision, icons, animation clips, state bindings, particles and sound attachment points. The Forge then validates and bakes those elements into efficient runtime outputs.

> **Locked Rule**  
> The Forge may replace how an asset looks, moves, glows, emits effects, collides and presents itself, but it must not silently rewrite the asset's gameplay identity or coded behaviour.

### 1.1 Core Vision

A developer should be able to open the Forge, select a block or item, change its model, texture or animation, preview the result in context, validate it, save it as an override and see the change appear in the game without manually rebuilding unrelated code or data.

The same tool should support simple work such as repainting a stone block and advanced work such as building an animated crusher with rotating gears, moving pistons, sparks, smoke, input and output sockets, collision and active-state visuals.

### 1.2 Core Promise

```text
Create or select asset
        -> author model and materials
        -> add parts, sockets and visual states
        -> preview and validate
        -> bake efficient outputs
        -> register or override
        -> use immediately in the game
```

### 1.3 What the Forge Is Not

- It is not a replacement for the block, item, automation, magic, crafting or structure registries.
- It is not permission for presentation data to invent machine state, item state or gameplay results.
- It is not a runtime world composed of thousands of independent micro-cube nodes for every asset.
- It is not initially a public player editor or unrestricted modding interface.
- It is not the first implementation of NPC, humanoid, creature or monster modelling.
- It is not a reason to abandon stable IDs, parent templates, content validation or save compatibility.
- It is not intended to chase full realism or highly detailed sculpting that conflicts with the voxel art direction.

### 1.4 Design Pillars

| Pillar | Meaning | Player/Developer Result |
| --- | --- | --- |
| Unified Authoring | Blocks, items, unique shapes, machines and visual states use one coherent creation environment. | Less tool switching, fewer inconsistent assets and faster iteration. |
| Code-Preserving Overrides | Visual layers can change independently from gameplay definitions. | A furnace can be redesigned without breaking recipes, fuel logic or saves. |
| Pixel-Voxel Readability | Assets are created from clear voxel cells, face pixels, parts and palettes. | The art remains coherent with the block world and can be edited precisely. |
| Efficient Baking | Editable voxels are converted into merged meshes, textures, collisions and cached assets. | Rich visuals do not require one runtime node per editor voxel. |
| State-Driven Presentation | Coded states drive animations, effects, sounds and variants. | Machines and magic clearly communicate what they are doing. |
| Safe Iteration | Overrides, comparison, validation, revision and revert are built into the workflow. | Developers can experiment without permanently damaging source assets. |
| Registry Integration | Every asset resolves through stable IDs and known gameplay records. | Visual production remains connected to buildings, recipes, villages, automation and magic. |

## 2. Player Decision and Direction Summary

The following decisions are locked from the design discussion that established the Forge concept.

| Area | Locked Decision |
| --- | --- |
| Primary Purpose | Use the Forge to complete Leyforge's visual and model overhaul, then continue using it as the standard authoring environment for future block and item content. |
| Modelling Approach | Allow assets to be constructed from small three-dimensional voxel cells, with ordinary block faces still supporting direct 32 x 32 painting where full voxel volume is unnecessary. |
| Unique Blocks | Voxel Model Mode must support blocks with unique shapes, including chutes, pipes, machines, stations, furniture and magical devices. |
| Compound Machines | Complex assets may contain named parts with pivots, sockets, collision and independent animation. |
| Animation | Support simple animation by frames, but prefer transform animation for rigid moving parts and material animation for flames, glow, runes and flow where more efficient. |
| Developer Overrides | The developer section may override existing block or item models, textures, materials, animations and other presentation fields directly through the Forge. |
| Behaviour Preservation | A visual override retains the original stable ID and gameplay definition unless the developer explicitly creates a new asset or edits gameplay data in the appropriate registry tool. |
| Visual Variants | Assets may inherit or override biome, culture, rarity, damage, age, weather, magic, charge and corruption presentation. |
| Runtime Optimisation | The authored voxel source is baked into efficient runtime output rather than spawned as individual microvoxels. |
| Creature Creator | NPCs, mobs, monsters and creatures will later receive a separate creator built on the same palette, voxel, animation and override foundation. |
| Current Engine | Godot with Summer Engine is the active development stack for Forge implementation. |

## 3. System Terminology and Conceptual Model

### 3.1 Key Terms

| Term | Definition |
| --- | --- |
| Forge | The full developer-facing visual asset authoring system. |
| Forge Asset | An editable source definition containing one or more visual components and the metadata required to bake and register them. |
| Visual Asset | The model, texture, material, icon, animation and effect presentation resolved for a gameplay definition. |
| Gameplay Definition | The coded and registry-backed identity that controls behaviour, recipes, stats, interactions, inventories, automation or other rules. |
| Editor Voxel | A small cell used to author a model. It is not assumed to remain an individual runtime object. |
| Block Face | A 32 x 32 pixel surface used by a standard cube or generated block shape. |
| Named Part | A separately addressable model component with its own pivot, transform, visibility or animation. |
| Socket | A named attachment or interaction point for particles, sounds, items, power, mana, NPC interaction, held placement or machine ports. |
| Visual State | A presentation state such as inactive, active, damaged, powered, blocked, wet, burning or corrupted. |
| State Binding | A rule connecting authoritative gameplay state to a Forge animation, material, part, sound or effect response. |
| Bake | The process that converts editable source data into optimised runtime meshes, textures, materials, collisions, icons and cached files. |
| Override | A replacement for one or more inherited fields while preserving the original asset or gameplay definition as fallback. |
| Variant | A related presentation selected by material, biome, culture, age, state, seed, rarity, magic or another controlled condition. |
| Asset Family | A parent group sharing scale, materials, behaviours, palette rules, shape logic or visual identity. |

### 3.2 Conceptual Layers

```text
Gameplay Definition
    stable ID, behaviour, recipes, inventory, ports, stats, permissions

Visual Resolution
    base visual -> project override -> content-pack override -> permitted world override

Forge Source
    voxel volumes, face pixels, parts, pivots, sockets, materials, clips, state bindings

Baked Runtime Output
    mesh, texture, material, collision, icon, animation resource, effect references
```

These layers must remain distinct even when the Forge presents them in one editor. A developer may inspect all layers together, but saving a visual override should not unexpectedly alter the gameplay record.

## 4. Scope and Supported Asset Families

### 4.1 Included Asset Families

| Asset Family | Typical Examples | Primary Forge Use |
| --- | --- | --- |
| Standard Surface Blocks | Grass, dirt, stone, planks, bricks, glass, ore, soil, leaves. | Paint and vary 32 x 32 faces; assign materials and states. |
| Generated Construction Shapes | Slabs, stairs, slopes, beams, posts, pillars, fences, walls, railings, arches and roof pieces. | Reuse a material family and generated shape with optional model override. |
| Unique Voxel-Shaped Blocks | Chutes, pipes, drains, gutters, grates, shelves, decorative masonry, specialised roofs. | Build a non-cubic model with correct placement footprint and connection rules. |
| Functional Stations | Workbench, furnace, anvil, cooking station, rune table, alchemy table. | Create interactive visual states, sockets, collision, icons and effects. |
| Machines | Crusher, mill, pump, saw, press, extractor, mana furnace, sorting device. | Create compound parts, transform animation, material animation and machine-state presentation. |
| Automation Components | Chutes, belts, rollers, shafts, gears, wheels, filters, routers, storage interfaces. | Create directional shapes, connection visuals, moving parts and item-flow sockets. |
| Magic Infrastructure | Mana conduit, ward lantern, ward stone, rune controller, ritual anchor, portal component. | Create emissive materials, flowing states, rune animation, particles and corruption variants. |
| Items and Equipment | Tools, weapons, ingots, components, consumables, runes, books and accessories. | Create held, dropped, inventory and display presentations. |
| Props and Furniture | Crates, barrels, beds, chairs, tables, signs, lamps, shelves and market props. | Create placeable models, collision, variants and NPC interaction points. |
| Decorative and Environmental Assets | Rubble, roots, crystals, moss clusters, chains, banners, clutter and light fixtures. | Create low-cost detail assets and controlled variants. |

### 4.2 Deferred Asset Families

The following categories are not part of the initial Forge system, although they may reuse its data and tools later:

- Humanoid body creation and body-proportion systems.
- NPC face, hair, clothing and equipment fitting systems.
- Creature, monster and animal skeleton or body construction.
- Advanced skeletal animation, inverse kinematics and locomotion authoring.
- Procedural character generation and species-specific anatomy.
- Full cinematic animation, facial performance and dialogue lip synchronisation.

These areas should become a later character and creature Forge series so the first system remains focused enough to deliver the immediate visual overhaul.

### 4.3 Asset Scope Rules

> **Scope Rule**  
> An asset belongs in the Forge when its main purpose is visual or spatial presentation. Behavioural logic belongs in the appropriate gameplay system, even when the Forge exposes a read-only preview of that behaviour for state binding and testing.

- A chute model belongs in the Forge; its item transfer algorithm belongs in Automation.
- A furnace flame animation belongs in the Forge; fuel use and recipe processing belong in Crafting and Machines.
- A ward glow belongs in the Forge; protection calculations and mana consumption belong in Magic.
- A sword model and hand pose belong in the Forge; damage, durability and combat actions belong in Combat and Items.
- A warehouse crate model belongs in the Forge; village ownership, storage and permissions belong in the Village System.

## 5. Forge Authoring Modes

The Forge should feel like one system with specialised workspaces rather than unrelated editors. An asset may move between workspaces without being exported and re-imported manually.

### 5.1 Block Surface Mode

Block Surface Mode is the fastest path for ordinary full cubes and generated construction shapes. Each face uses a 32 x 32 pixel canvas with linked-face, wrap, tile and neighbouring-block previews.

- Independent top, bottom and side faces.
- Linked side faces and controlled wrapping.
- Palette, transparency, emissive and material channels.
- Tile, rotation, connected-texture and seed-variation previews.
- Damage, wet, snow, moss, corruption and powered-state preview layers.
- Optional height or normal assistance without requiring hand-authored external maps.

### 5.2 Voxel Model Mode

Voxel Model Mode creates three-dimensional shapes from small editable cells. It supports both inventory items and unique world blocks such as chutes, pipes, furniture, machine housings and magical devices.

- Custom bounded volumes with project-approved resolution presets.
- Add, remove, paint, fill, mirror, copy, rotate and slice operations.
- Named layers and optional conversion of selections into named parts.
- Real-time silhouette, scale, hand, dropped-item and block-placement preview.
- Material palette assignment by voxel or selection.
- Automatic hidden-face removal and preview of baked geometry.

### 5.3 Compound Model Mode

Compound Model Mode assembles a complete asset from named voxel parts, generated primitives and reusable sub-assets. It is the primary mode for machines and interactive blocks.

```text
basic_furnace
|-- body
|-- front_door
|-- internal_flame
|-- chimney_cap
|-- input_socket
|-- output_socket
|-- fuel_socket
`-- smoke_socket
```

Each named part may have its own pivot, transform, visibility, material override, collision behaviour and animation channels. Reusable parts such as gears, handles, pipes and mana crystals may be linked from a shared component library.

### 5.4 State and Effect Mode

State and Effect Mode connects authoritative game states to visual responses. It manages animations, material parameters, part visibility, particles, lights and sounds without owning the underlying gameplay state.

- State binding and transition preview.
- Named transform animation clips.
- Material and emissive animation.
- Optional voxel-frame animation.
- Particle, light and audio sockets.
- Layered state combinations such as active plus damaged or powered plus corrupted.

### 5.5 Preview and Validation Mode

Preview and Validation Mode shows the asset under realistic game conditions before it is accepted. The preview must include scale references, neighbouring blocks, lighting presets, held and dropped views, active states, collision, placement, ports and basic performance estimates.

## 6. Developer Section, Access and Permissions

### 6.1 Full Forge Access

The full Forge belongs in the developer section of Leyforge. It is intended for authorised development work and should expose capabilities that are too powerful or unsafe for ordinary players.

- Open built-in and project assets.
- Create a new asset or family.
- Edit as project visual override.
- Duplicate as a new stable-ID asset.
- Replace models, textures, materials, animation, collision and presentation metadata.
- Inspect gameplay definitions and state contracts.
- Run validation and bake operations.
- Rebuild icons and preview thumbnails.
- Apply or revert project overrides.
- Compare current, inherited and original values.
- View dependency and usage references before making breaking changes.

### 6.2 Access Tiers

| Tier | Capabilities | Default Availability |
| --- | --- | --- |
| Viewer | Inspect assets, previews, dependencies and inherited values without saving. | Safe for internal review and future read-only tools. |
| Visual Editor | Edit model, texture, palette, materials, animation, particles, icon and safe presentation fields. | Primary everyday developer role. |
| Technical Asset Editor | Edit collision, sockets, placement footprint, port presentation and validation exceptions. | Restricted developer role. |
| Registry Author | Create stable IDs, connect new assets to gameplay definitions and approve registry changes. | Restricted content/system role. |
| Build Administrator | Rebuild caches, migrate assets, change project-wide defaults and publish content packs. | Restricted production role. |

### 6.3 Developer Convenience Versus Safety

The Forge should reduce unnecessary friction, but it should not remove all safety. Quick editing is valuable only if accidental changes can be detected, compared and reversed.

> **Safety Rule**  
> Opening and previewing an asset must never alter it. Saving a visual edit must clearly state whether the result is an override, a duplicate or a direct project-source change.

## 7. Gameplay and Presentation Separation

### 7.1 Ownership Matrix

| Data or Behaviour | Primary Owner | Forge Access |
| --- | --- | --- |
| Stable ID and gameplay category | Registry | Read-only unless using an authorised registry workflow. |
| Mining hardness, tool tier and drops | Blocks/Resources | Read-only preview. |
| Recipe, fuel and processing logic | Crafting/Machines | Read-only state and preview hooks. |
| Inventory slots and automation transfer | Items/Automation | Read-only preview; sockets may be visually placed. |
| Damage, durability and combat values | Combat/Items | Read-only preview. |
| Model and named parts | Forge | Full visual editing. |
| Face textures, palettes and materials | Forge | Full visual editing. |
| Animation clips and visual transitions | Forge | Full visual editing. |
| Particles, lights and sound attachment points | Forge | Full visual editing, with references to approved assets. |
| Collision and placement presentation | Forge plus block/item rules | Editable with validation and permissions. |
| State truth such as powered or processing | Authoritative gameplay systems | Read-only input to state bindings. |
| State response such as gear rotation or glow | Forge | Full visual editing. |

### 7.2 Example: Furnace Override

| Retained From Gameplay Definition | Replaceable Through Forge |
| --- | --- |
| Stable block ID | Voxel model and named parts |
| Inventory slots | Face textures and material palette |
| Fuel consumption | Door, gear and flame animation |
| Recipe processing | Smoke, sparks, light and sound sockets |
| Heat and timing rules | Active, idle, blocked and damaged presentation |
| Automation ports and permissions | Visible port models and placement indicators |
| NPC interaction and save data | Inventory icon, dropped form and preview thumbnail |

### 7.3 Explicit Gameplay Edits

The Forge may provide links to the relevant registry editor when a developer intends to change behaviour, but it must not disguise that action as a visual edit. Behaviour changes require their own validation, migration and save-compatibility checks.

## 8. Asset Identity, Inheritance, Variants and Overrides

### 8.1 Stable Identity

Every registered Forge asset must resolve through a stable namespace ID. Visual filenames, display names and thumbnails may change without changing identity. Existing worlds and references should resolve the stable ID first, then determine the current approved visual asset.

```text
block.machine.basic_furnace
item.tool.iron_pickaxe
block.logistics.wooden_chute
block.magic.ward_lantern
```

### 8.2 Resolution Order

```text
Built-in visual definition
        -> project visual override
        -> enabled content-pack override
        -> permitted world-specific override
        -> fallback to last valid inherited asset
```

The system should record which layer supplied every final field. A developer must be able to see that a model came from a project override while its sounds or icon still came from the built-in definition.

### 8.3 Override Granularity

- Entire asset replacement.
- Model-only replacement.
- Texture or palette-only replacement.
- Material-only replacement.
- Animation clip replacement.
- State-binding replacement.
- Particle, light or sound-socket replacement.
- Collision or placement override.
- Inventory icon or held/dropped presentation override.
- Single variant or state override.

### 8.4 Variant Dimensions

| Variant Dimension | Examples | Rule |
| --- | --- | --- |
| Material | Oak, pine, iron, steel, mythril, mana crystal. | Prefer shared geometry where only material identity changes. |
| Biome | Temperate moss, desert dust, swamp dampness, frozen accumulation. | Use controlled overlays or palette/material variants before duplicating whole models. |
| Culture | Human, elven, dwarven, goblin, race-specific trims and motifs. | Culture variants may change silhouette when architecture requires it. |
| Condition | New, weathered, damaged, burnt, repaired, ruined. | State must remain readable and must not hide important collision or interaction. |
| Magic | Uncharged, charged, overcharged, corrupted, cleansed, warded. | Use emission, material, particles and optional geometry layers. |
| Rarity/Quality | Crude, standard, refined, masterwork, legendary. | Avoid excessive visual noise; preserve silhouette and identification. |
| Seed Variation | Minor colour, edge, crack, knot, grain or clutter changes. | Variation must be deterministic where required and must not imply different gameplay. |

### 8.5 Fallback Rules

- An invalid override must not prevent the base asset from loading.
- Missing optional animation should fall back to a safe static presentation.
- Missing variant data should fall back to the parent or default variant.
- A save should store stable identity and necessary runtime state, not fragile temporary file paths.
- Removing an override should restore the inherited asset rather than create a missing reference.

## 9. Core Creation and Editing Workflows

### 9.1 Create a New Asset

1. Choose the gameplay category and Forge asset type.
2. Select a parent family or start from an approved template.
3. Reserve or create the stable ID through the registry workflow.
4. Choose scale, volume preset, placement footprint and default orientation.
5. Author the model, texture, palette and materials.
6. Add named parts, pivots, sockets, collision and presentation forms as required.
7. Create animation clips and bind them to known gameplay states.
8. Generate an icon and preview thumbnail.
9. Validate geometry, references, scale, collision, states and budgets.
10. Bake the runtime output and register the asset.
11. Preview it in a controlled test world before production approval.

### 9.2 Edit an Existing Asset as an Override

1. Open the asset from the browser or from an in-world developer inspection action.
2. Review the resolved visual layers and gameplay definition.
3. Select Edit as Project Override.
4. Choose which inherited fields to override.
5. Make and preview the visual changes.
6. Compare the override with the original or previous approved version.
7. Validate and save the override.
8. Bake and hot-reload the preview environment.
9. Approve or revert the change.

### 9.3 Duplicate as a New Asset

Duplicate as New Asset is used when the developer wants a related asset with its own identity rather than a replacement. The Forge should copy selected source fields, then require a new stable ID and explicit registry links.

### 9.4 Migrate a Legacy Asset

1. Identify the existing model, texture, material, icon and state references.
2. Create a Forge source wrapper without changing the stable gameplay ID.
3. Import or reconstruct the visual asset in the appropriate authoring mode.
4. Map old active, damaged and special states to Forge state bindings.
5. Validate scale, collision, placement, icon and saved-world compatibility.
6. Bake the Forge output and compare it against the legacy asset.
7. Switch the project visual reference only after approval.

## 10. Visual Style, Scale and Modelling Rules

### 10.1 Art Direction

> **Visual Style Rule**  
> The Forge must support a detailed, atmospheric fantasy-voxel style that is richer than a simple block game while remaining readable, buildable, modular and affordable to produce.

- Prioritise silhouette, material readability and state clarity over micro-detail.
- Use lighting, emission and effects to enrich assets without hiding their voxel structure.
- Keep terrain and common building materials immediately recognisable.
- Allow tools, machines, magic devices and hero props to use more detailed voxel models than basic terrain.
- Avoid full realism, noisy high-frequency detail and shapes that are difficult to align with the building grid.

### 10.2 Scale Rules

- The default world block remains one cubic metre.
- A 32 x 32 block-face canvas remains the standard surface texture resolution unless a documented exception is approved.
- Voxel Model Mode may use different bounded authoring volumes, but the asset must declare its world scale and pivot explicitly.
- Items must be previewed against the player hand, inventory icon and dropped-world scale.
- Machines and multi-block assets must declare placement footprint, occupied cells and clearance needs.
- Sockets and moving parts must remain correctly positioned after scale or orientation changes.

### 10.3 Authoring Versus Runtime Geometry

An asset may contain many editor voxels, but those voxels are source data. The bake process should remove hidden faces, merge compatible surfaces, reuse palettes, simplify collision and generate appropriate runtime resources.

> **Performance Rule**  
> No normal Forge asset should spawn one Godot node or draw call for every editor voxel. Exceptions require an explicit technical reason and validation approval.

### 10.4 Readability Rules

- A block or item should be identifiable by silhouette and dominant material before small details are considered.
- Functional ports, openings, fronts and directional outputs must remain visually readable.
- Active and dangerous states should communicate through more than subtle colour shifts where consequences are important.
- Damage variants must not falsely imply a different collision or function unless gameplay actually changed.
- Animation should reinforce function rather than create constant motion on every asset.
- Variant systems should preserve family identity so related construction blocks still look like one material set.

## 11. Animation, Effects and State Presentation Principles

### 11.1 Hybrid Animation Model

| Animation Type | Best Use | Examples |
| --- | --- | --- |
| Part Transform | Rigid components that rotate, slide, open, close or scale. | Gears, wheels, pistons, doors, crusher heads, conveyor rollers. |
| Material Animation | Surface flow, heat, glow, pulsing, scrolling or colour/emission change. | Furnace heat, mana conduits, warning lights, runes, water, corruption. |
| Voxel-Frame Animation | Shape-changing low-frame effects or deliberately stepped voxel motion. | Flames, portal surface, magical core, opening flower, unstable artefact. |
| Particle/Light Effects | Loose, volumetric or intermittent detail that should not be model geometry. | Smoke, sparks, steam, dust, embers, motes, glow spill. |
| Audio Binding | State or event-driven sound attached to a part or socket. | Grinding loop, furnace roar, gear click, warning chime, mana hum. |

### 11.2 Animation Selection Rule

> **Animation Rule**  
> Use the simplest animation method that accurately communicates the asset. Rigid gears should rotate as parts; furnace glow should animate as a material; flame shape may use voxel frames or particles. Rebuilding the complete model every frame is a last resort, not the default.

### 11.3 Simple Frame Animation

The Forge should support a beginner-friendly frame workflow because it is intuitive and useful for low-frame voxel effects. The editor should allow frame duplication, onion-skin preview, per-frame duration, looping, ping-pong and changed-voxel storage where possible.

Frame animation is not required for every moving machine. A rotating gear is better represented by one model part with a pivot and a rotation track, producing smoother motion and smaller data.

### 11.4 Effects as Presentation Layers

Particles, lights and sounds should be attached through named sockets and controlled by state bindings. A furnace asset may therefore keep one base model while enabling flame, smoke, glow and sound only when processing.

## 12. Runtime State Presentation Contract

### 12.1 Authoritative State Rule

The Forge never decides whether a machine is powered, a furnace is processing or a ward is active. It receives those states from authoritative gameplay systems and presents them according to configured bindings.

### 12.2 Common Visual State Vocabulary

| State | Typical Presentation | Notes |
| --- | --- | --- |
| inactive | Static model, no active effects. | Default safe fallback. |
| powered_idle | Low emission, subtle ambient motion or hum. | Power exists but no recipe is processing. |
| active/processing | Primary movement, material animation, effects and operating sound. | Must be clearly readable. |
| output_blocked | Motion pauses or changes; warning indicator appears. | Presentation must not imply successful output. |
| unpowered | Power-dependent effects and motion disabled. | May retain passive lights only if defined. |
| damaged | Damage layer, broken part or altered material. | May combine with other states. |
| overheated/overloaded | Strong heat glow, warning, smoke, sparks or instability. | Only used when gameplay reports the risk. |
| burning | Fire, smoke and char state. | World damage state, not ordinary furnace operation. |
| corrupted | Corruption material, particles, distortion or altered parts. | May coexist with active or damaged. |
| under_construction | Scaffold, ghost, staged parts or incomplete model. | Driven by project construction state. |
| ruined | Collapsed or permanently disabled presentation. | Use only when gameplay state is ruined. |

### 12.3 Layered States

Visual states should support controlled layering. A machine may be active and damaged, or powered and corrupted. The Forge must define precedence, compatible layers and fallback behaviour so combinations do not produce missing materials or impossible animation.

### 12.4 Transition Principles

- State changes should be responsive enough to match gameplay truth.
- Short transition clips may bridge states without delaying gameplay state changes.
- Critical warnings should not be hidden behind long decorative animation.
- Looping sounds and effects must stop reliably when their state ends or the asset unloads.
- Distant or low-detail simulation may simplify animation while preserving important state readability when rendered.

## 13. Registry and Content Pipeline Integration

### 13.1 Registry Relationships

| Registry/System | Forge Relationship |
| --- | --- |
| Blocks | Resolves placed model, face textures, material family, collision, placement, orientation, states and item-form preview. |
| Items | Resolves inventory icon, held model, dropped model, display pose, equipment attachment and item-specific variants. |
| Recipes | Provides station and output preview references but does not own recipe logic. |
| Resources | Uses material identity, grade, purity and resource family to select approved variants. |
| Automation | Provides machine body, ports, transfer visuals, moving parts, indicators and active-state presentation. |
| Magic | Provides runes, emission, conduits, ward visuals, mana flow, particles and corruption/cleansing states. |
| NPC/Village | Provides job-site interaction points, culture variants, construction states, warehouse props and readable needs-related presentation. |
| Structures/Blueprints | Provides block and prop palette, previews, material substitution families, staged construction visuals and validation of placeable assets. |
| UI/UX | Provides thumbnails, icons, previews, names and developer inspection data. |
| Save System | Stores stable identity and runtime state; Forge asset resolution occurs when loading and rendering. |

### 13.2 Content Status

Forge assets should carry planning metadata separate from shipped gameplay properties. Recommended production statuses are Placeholder, Blockout, First Pass, Review, Approved, Deprecated and Replaced.

### 13.3 Dependency Tracking

Before an asset or variant is deleted, renamed or replaced, the Forge should report where it is used: blocks, items, recipes, machines, blueprints, structures, icons, animation clips, content packs and test scenes.

### 13.4 Hot Reload

The developer workflow should support safe hot reload in a controlled preview or development world. A failed bake or validation should keep the last valid runtime asset active instead of replacing it with broken output.

## 14. Blueprint Designer and Structure Integration

### 14.1 Immediate Asset Availability

An approved Forge asset should become available to the Blueprint Designer without manual duplication. The asset browser, category, material family, placement footprint and preview should be shared between the tools.

### 14.2 Blueprint Workflow

```text
Create or override block in Forge
        -> validate and bake
        -> publish to project registry
        -> select in Blueprint Designer
        -> place in structure
        -> preview material/culture variants
        -> save blueprint
        -> NPC or player construction uses stable IDs
```

### 14.3 Material Families and Substitution

Blueprints should normally reference a stable block or an approved material/shape family. The Forge defines which visuals belong to that family and which substitutions preserve shape, footprint, connection and construction intent.

### 14.4 Construction States

The Forge should provide optional under-construction, scaffold, damaged, repaired and ruined presentation for structures and functional blocks. The Structure and Village systems determine state; the Forge supplies the visual representation.

## 15. Validation, Safety, Versioning and Recovery

### 15.1 Validation Categories

| Category | Example Checks |
| --- | --- |
| Identity | Stable ID resolves; parent and override layers are valid; no accidental duplicate registration. |
| Geometry | No invalid volume, broken normals, missing surfaces, excessive part count or unsupported scale. |
| Materials | Palette references exist; transparency and emission obey category rules; textures are valid. |
| Animation | Clips reference existing parts; loops end cleanly; frame data is valid; states have safe fallback. |
| Sockets | Required machine ports, held points, particles, sounds and interaction positions exist and face valid directions. |
| Collision | Collision is present where required, does not exceed bounds unexpectedly and matches placement intent. |
| Registry | Block/item/structure references are valid; gameplay definition is unchanged unless explicitly authorised. |
| Performance | Voxel count, mesh surfaces, materials, parts, bones if later supported, animation cost and effects fit approved budgets. |
| Compatibility | Existing saves resolve the stable ID and fallback asset; removed overrides do not create missing content. |

### 15.2 Recovery Tools

- Undo and redo within the current editing session.
- Autosave of editable source work without auto-publishing.
- Compare with original, inherited and last approved version.
- Revert selected field or entire override.
- Restore last valid bake after failure.
- Duplicate experimental branch before risky changes.
- Deprecate rather than immediately delete registered assets.
- Validation report with direct links to broken fields.

### 15.3 Versioning Rules

- Editable Forge source and baked runtime output must be versioned separately.
- A visual revision that preserves compatibility should not require a new gameplay stable ID.
- A shape, footprint or collision change that affects placement may require blueprint revalidation and migration warnings.
- Content-pack overrides must declare compatible project and schema versions.
- The project should keep deterministic or reproducible bake settings wherever practical.

## 16. Visual Overhaul and Production Use

### 16.1 Immediate Production Goal

The first practical purpose of the Forge is to overhaul the current visuals so building work can progress with a coherent final style. The tool should be developed alongside a small approved asset set rather than in isolation.

### 16.2 Recommended First Asset Set

| Group | First Assets | What They Prove |
| --- | --- | --- |
| Terrain | Grass, dirt, stone, sand, gravel, clay, water, logs and leaves. | Face painting, tiling, transparency, material families and biome variation. |
| Construction | Planks, beams, posts, stone bricks, slabs, stairs, roofs, windows and doors. | Generated shapes, family consistency, placement and blueprint use. |
| Items | Pickaxe, axe, sword, hammer, torch, ingot, mana crystal and rune. | Voxel items, icons, held/dropped poses and material variants. |
| Functional | Workbench, chest, furnace and lantern. | Interaction points, active states, collision, light and basic effects. |
| Automation | Wooden chute, gear, shaft, wheel and simple crusher. | Unique block shapes, connections, named parts and transform animation. |
| Magic | Mana crystal block, rune table, mana conduit and ward lantern. | Emission, flow, particles, state binding and corruption/charge variants. |

### 16.3 Approval Loop

```text
Blockout
  -> material and silhouette review
  -> animation/state review
  -> in-world building test
  -> performance and validation
  -> approved asset
  -> visual overhaul migration
```

### 16.4 Avoiding Tool-First Stagnation

The Forge should not become an endlessly expanding editor before it produces usable game assets. Every implementation stage must ship at least one real approved asset family into the game.

## 17. Future Player, Modding and Content-Pack Editions

### 17.1 Developer First

The initial Forge is a developer tool with broad project access. A future player or modder version should not simply expose every developer control. It should use restricted templates, quotas, permissions, validation and export boundaries.

### 17.2 Potential Future Uses

- Official content-pack production.
- Community mod creation using namespaced assets.
- Creative Mode custom blocks and props.
- Server-approved visual packs.
- Player inventions assembled from permitted voxel parts.
- Blueprint packages containing approved custom assets.
- Workshop sharing with moderation and compatibility metadata.

### 17.3 Future Restrictions

- No override of protected gameplay definitions without server or project authority.
- Asset size, voxel count, materials, effects and animation budgets.
- Namespaced IDs and sandboxed file access.
- Validation before multiplayer use.
- Fallback assets for clients missing optional content.
- Clear separation between cosmetic and gameplay-changing packs.

## 18. Minimum Viable Forge Scope

### 18.1 MVP Objective

The MVP must prove that the Forge can create and safely replace real game visuals from inside the developer workflow. It is not successful if it only produces isolated editor demos.

### 18.2 Required MVP Capabilities

- Asset browser with create, open, duplicate and edit-as-override actions.
- 32 x 32 block-face painting with six-face preview.
- Three-dimensional voxel model editing for an item and a unique block.
- Named parts with pivot placement.
- At least one transform animation: rotating gear.
- At least one material/effect state: furnace flame and glow while active.
- Optional simple voxel-frame clip for one flame or magical test effect.
- Material palette with opaque, transparent and emissive examples.
- Basic collision and placement-footprint authoring.
- Inventory icon generation and world preview.
- State binding for inactive, active and damaged or blocked states.
- Visual override of an existing registered block without changing its gameplay ID.
- Bake to optimised runtime mesh/material resources.
- Validation, compare and revert.
- Blueprint Designer availability after approval.

### 18.3 MVP Test Assets

| Test Asset | Required Proof |
| --- | --- |
| Grass or stone block | Surface painting, tiling, six-face preview and registry use. |
| Iron sword or pickaxe | Voxel item model, palette, icon, held pose and dropped pose. |
| Wooden chute | Unique non-cubic block, direction, footprint, connection surfaces and collision. |
| Basic furnace | Compound model, active flame/glow, smoke socket, state binding and visual override. |
| Simple crusher or gear assembly | Named parts, rotating gear, moving part and machine-state animation. |
| Mana conduit or ward lantern | Emissive material animation, magical state and particle/light socket. |

### 18.4 Explicit MVP Deferrals

- Full public mod browser and distribution.
- Advanced node-based shader authoring.
- Complex logic scripting inside the Forge.
- Skeletal character animation.
- Creature and NPC body creation.
- Procedural generation of complete asset families from text prompts.
- Cross-platform publishing and marketplace packaging.
- Advanced collaborative multi-user editing.

## 19. Success Criteria and Acceptance Rules

### 19.1 System-Level Success

| Criterion | Acceptance Rule |
| --- | --- |
| Visual Control | A developer can replace an existing block model, texture and animation independently through the Forge. |
| Behaviour Preservation | The same block retains its stable ID, recipes, saves and coded behaviour after a visual-only override. |
| Unique Shapes | A chute or machine can use a non-cubic voxel model with correct placement and collision. |
| Animation | A named gear rotates while active and stops when inactive; a furnace flame/glow follows processing state. |
| Efficiency | The baked runtime asset does not create one node per editor voxel and meets the first approved asset budgets. |
| Safety | Invalid edits fail validation or fall back without corrupting the original asset or save. |
| Recovery | The developer can compare, revert and restore the inherited or last valid version. |
| Integration | Approved assets appear in the game and Blueprint Designer without manual duplicate registration. |
| Style | The test set demonstrates a coherent detailed fantasy-voxel visual direction suitable for completing buildings. |
| Extensibility | The data model can later support player content packs and character/creature Forge tools without rewriting the core visual asset identity model. |

### 19.2 Content Acceptance Questions

- Can the asset be recognised quickly at normal gameplay distance?
- Does its scale and placement fit the voxel world?
- Do active, inactive, damaged and dangerous states read correctly?
- Does the animation explain function rather than merely add movement?
- Does the asset reuse parent materials and parts where appropriate?
- Can the asset be baked and loaded without excessive cost?
- Can it safely fall back if an override or optional effect is missing?
- Does it work in inventory, held, dropped, placed and blueprint views where relevant?
- Does it preserve the gameplay definition and stable references?

---

## 20. Relationships With Documents 21B-21G

| Document | Responsibility | 21A Boundary |
| --- | --- | --- |
| 21B - Voxel Modelling, Texturing and Materials | Detailed modelling tools, face painting, palettes, materials, scale, collision, sockets and asset construction. | Must follow the asset families, visual rules and gameplay separation locked here. |
| 21C - Animation, Effects and Visual States | Timeline, transform clips, material animation, voxel frames, particles, sounds, transitions and state binding. | Must follow the hybrid animation and authoritative-state rules locked here. |
| 21D - Overrides, Variants and Registry Integration | Override resolution, inheritance, content packs, variants, stable IDs, migration and registry behaviour. | Must follow the identity, fallback and safety rules locked here. |
| 21E - Forge UI/UX and Creator Workflow | Screen layouts, tools, controls, shortcuts, previews, accessibility, error handling and developer workflows. | Must expose the workflows and permission tiers locked here. |
| 21F - Forge Technical Implementation Plan | Godot architecture, resource formats, mesh baking, caches, hot reload, tests, performance and implementation stages. | Must implement the conceptual layers and MVP acceptance rules locked here. |
| 21G - Visual Overhaul and Asset Migration Plan | Complete asset audit, art targets, priorities, production backlog, review and migration sequence. | Uses the Forge scope but does not redefine how the Forge works. |
| Future Character/Creature Forge | NPC, humanoid, animal, monster and creature modelling and animation. | Reuses common palettes, voxel source, overrides and effects but remains a separate system series. |

---

## Appendix A. Asset Category Matrix

| Category | Surface Mode | Voxel Model | Compound Parts | Animation | Override |
| --- | --- | --- | --- | --- | --- |
| Terrain cube | Primary | Optional | Rare | Material/state | Yes |
| Construction shape | Primary | Optional override | Rare | Usually none | Yes |
| Unique block | Optional | Primary | Optional | State/part | Yes |
| Item/resource | Optional | Primary | Optional | Optional | Yes |
| Tool/weapon | Optional | Primary | Optional | Held/use presentation | Yes |
| Furniture/prop | Optional | Primary | Optional | Optional | Yes |
| Functional station | Optional | Primary | Primary | State/effects | Yes |
| Machine | Optional | Primary | Primary | Part/material/effects | Yes |
| Automation component | Optional | Primary | Optional | Flow/part | Yes |
| Magic infrastructure | Optional | Primary | Optional | Material/particles/state | Yes |
| NPC/creature | Deferred | Deferred | Deferred | Deferred | Future system |

## Appendix B. Core Rule Register

| Rule ID | Locked Rule |
| --- | --- |
| FORGE-CORE-001 | The Forge is the unified visual-authoring layer for blocks, items, props, machines and visual states. |
| FORGE-CORE-002 | Visual edits must not silently change gameplay definitions. |
| FORGE-CORE-003 | Stable IDs resolve gameplay identity independently from visual filenames and revisions. |
| FORGE-CORE-004 | Unique-shaped blocks such as chutes and machines are first-class Voxel Model Mode assets. |
| FORGE-CORE-005 | Compound assets may contain named parts, pivots, sockets, collision and independent animation. |
| FORGE-CORE-006 | Use transform animation for rigid moving parts, material animation for surface effects and voxel frames only where shape change benefits from them. |
| FORGE-CORE-007 | Gameplay systems own authoritative state; the Forge owns visual response. |
| FORGE-CORE-008 | Editor voxels must be baked into efficient runtime output. |
| FORGE-CORE-009 | The developer section may override models, textures, materials, animations and other presentation fields. |
| FORGE-CORE-010 | Overrides must be granular, comparable, revertible and capable of falling back to the inherited valid asset. |
| FORGE-CORE-011 | The standard block-face texture remains 32 x 32 unless an approved exception is documented. |
| FORGE-CORE-012 | The art direction is detailed stylised fantasy voxel, not full realism. |
| FORGE-CORE-013 | Approved Forge assets must integrate with registries and the Blueprint Designer. |
| FORGE-CORE-014 | The current implementation stack is Godot with Summer Engine. |
| FORGE-CORE-015 | NPC, humanoid, creature and monster creation is deferred to a later Forge series. |
| FORGE-CORE-016 | Every Forge implementation stage must produce at least one usable approved game asset or family. |

## Appendix C. Glossary

| Term | Plain-Language Meaning |
| --- | --- |
| Authoring source | The editable Forge data used to create an asset. |
| Bake | Turning editable source data into efficient game-ready files. |
| Base asset | The built-in or parent presentation inherited before overrides. |
| Compound asset | An asset made from multiple named parts and attachments. |
| Deterministic variation | A variation chosen consistently from stable inputs such as seed and position. |
| Fallback | The valid asset or field used when a preferred override is missing or invalid. |
| Footprint | The world grid cells occupied or reserved by a placed asset. |
| Hot reload | Refreshing a development preview after an asset changes without restarting the whole project. |
| Material palette | A reusable list of colours and material properties assigned to faces or voxels. |
| Presentation | Everything that communicates how an asset looks, moves, sounds and emits effects. |
| Runtime output | The baked mesh, texture, material, collision and animation resources loaded by the game. |
| Stable ID | A permanent machine-readable identity used by registries, saves and references. |
| State binding | A link from real gameplay state to visual or audio response. |
| Visual override | A replacement for one or more presentation fields that leaves gameplay identity intact. |
| Voxel frame | One step in a frame-based animation where the voxel shape or colours may change. |

## Appendix D. MVP Checklist

- Asset browser opens registered assets and shows inherited/override layers.
- Developer can create a new standard block face asset.
- Developer can create a voxel item model.
- Developer can create a unique non-cubic chute block.
- Developer can create a compound furnace or crusher.
- Named part pivot supports a rotating gear.
- Furnace active state enables flame/glow and optional smoke/sound.
- At least one optional voxel-frame animation is supported.
- Collision and footprint can be previewed and validated.
- Inventory icon and world thumbnail can be generated.
- An existing block receives a model/texture/animation override without changing its stable ID.
- Invalid override falls back to the last valid inherited asset.
- Approved asset appears in the game and Blueprint Designer.
- Bake output is merged and does not create one node per editor voxel.
- Comparison, revert and recovery are tested.
- At least six representative MVP assets pass acceptance review.
