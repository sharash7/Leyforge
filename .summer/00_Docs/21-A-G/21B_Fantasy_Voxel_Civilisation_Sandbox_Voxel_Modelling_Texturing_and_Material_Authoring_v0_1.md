# Fantasy Voxel Civilisation Sandbox
## 21B - Voxel Asset Forge - Voxel Modelling, Texturing and Material Authoring
**Version 0.1 - Detailed Design Bible Draft**

A detailed authoring specification for building Leyforge blocks, unique block shapes, items, props, stations, machines and magical infrastructure from 32 x 32 block surfaces, pixel-voxel volumes, named parts, reusable palettes and data-driven materials.

## Voxel Modelling, Texturing and Material Authoring Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the Forge's modelling, surface-painting, voxel-volume, compound-part, palette, texture-channel, material, connection, collision, pivot, socket, preview, baking and validation rules. |
| Core Philosophy | Use one readable pixel-voxel visual language across terrain, construction, items and machines, while selecting the least expensive authoring method that still communicates the asset clearly. |
| Base Resolution | Standard block faces use 32 x 32 pixels. The canonical standard modelling density is 32 authoring voxels per one-metre world block. |
| Plain Block Direction | Ordinary full cubes should normally use painted faces and generated geometry rather than a fully occupied 32 x 32 x 32 microvoxel volume. |
| Unique Shape Direction | Chutes, pipes, gutters, furniture, machine housings, stations and other non-cubic blocks may use bounded voxel volumes and named parts. |
| Compound Asset Direction | Static detail is merged wherever practical. Separate parts are reserved for animation, state visibility, attachment, reuse or materially different rendering requirements. |
| Material Direction | Voxels and pixels reference palette roles and Material DNA records rather than storing unrestricted one-off shader settings in every asset. |
| Variation Direction | Biome, culture, seed, age, weathering, damage, wetness, magic, power, rarity and corruption are layered variants of a stable base asset wherever practical. |
| Override Direction | Authorised developers may open any compatible built-in visual, create a project override and replace its model, surfaces, palette, material channels, collision or presentation anchors without changing coded gameplay behaviour. |
| Runtime Direction | Editable source voxels are baked into merged meshes, texture resources, simplified collisions and cached previews. Individual authoring cells are not spawned as independent runtime nodes. |
| Implementation Context | Current implementation target is Godot with Summer Engine. Technical class names and storage formats are deferred to 21F, but all authoring rules must remain compatible with a data-driven Godot Resource pipeline. |
| MVP Direction | Prove a standard block, a connected construction material, a chute, a held tool, a furnace and a small compound machine using the same authoring foundation. |

## Document Purpose

This document defines how visual assets are actually constructed inside the Voxel Asset Forge. Document 21A established the Forge's vision, scope and governance. Document 21B turns that vision into precise modelling, texturing and material-authoring rules that can guide both interface design and implementation.

The system must make simple assets fast and complex assets possible. Repainting a dirt block should take minutes. Building a directional chute should not require an external 3D package. Creating a furnace should allow a developer to define its body, opening, internal glow, pivots and effect anchors without rewriting its recipes or machine logic. At the same time, the Forge must prevent visual production from creating excessive geometry, inconsistent scale, uncontrolled materials or assets that cannot be placed, culled or saved safely.

This document focuses on static source construction and visual data. Detailed animation timelines, particles, audio playback and runtime state graphs are specified in Document 21C. Override resolution and registry precedence are expanded in 21D. Forge screens and controls are expanded in 21E. Godot implementation, file formats and baking services are expanded in 21F.

## Engine Status Note

> **Current Project Direction**  
> Leyforge is currently being built in Godot with Summer Engine. The Forge should favour GDScript-first implementation and Godot Resource-based authoring unless profiling later proves that a native GDExtension is necessary. Earlier Unreal-specific documents remain references for stable IDs, data separation, registry validation, palette-driven voxel assets and baked runtime output, but they are not the active implementation target.

## Design Sources

| Source Document | Relevant Direction | How 21B Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Stylised, readable, atmospheric fantasy voxel visuals; terrain remains block-readable while important objects can be more detailed. | Locks the overall art boundary and rejects realism that damages readability or production scale. |
| 03 - Blocks Registry | One-metre default blocks, full cubes and broad shape families, material families, variants, runtime states and parent definitions. | Defines world scale, shape coverage, inheritance and the need for generated and custom block models. |
| 04 - Items Registry | Blocks and items remain separate but linked; items can have inventory, held, dropped, equipped and placed presentations. | Requires multiple presentation views from one visual source without merging gameplay records. |
| 08 - Automation System | Machines and logistics are physical, directional, stateful and readable, with visible ports and moving components. | Requires directional models, connection profiles, named parts, sockets, placement footprints and machine-ready materials. |
| 09 - Magic System | Mana, runes, wards, conduits and corruption must be visible in the world. | Requires emissive masks, flow directions, magical material roles, transparency and layered corruption variants. |
| 11 - Biomes and World Generation | Blocks vary by biome, seed, weather, culture, corruption and world state while remaining recognisable. | Requires deterministic variation, material families and controlled overlays rather than hundreds of unrelated textures. |
| 12 - Structures | Construction uses material families, blueprints, dynamic damage and restoration states. | Requires compatible construction sets, consistent pivots, placement bounds and immediate blueprint previews. |
| 21A - Voxel Asset Forge Core System | The Forge is a developer authoring and override layer that preserves gameplay identity and bakes efficient runtime outputs. | Acts as the direct source of truth for scope, authorisation, visual override safety and authoring/runtime separation. |

## Static Table of Contents

- 1. Locked Modelling, Texturing and Material Identity
- 2. Player Decision and Direction Summary
- 3. Authoring Architecture and Source-to-Runtime Model
- 4. Asset Classification and Workspace Selection
- 5. World Scale, Pixel Density and Resolution Profiles
- 6. Standard Block Surface Authoring
- 7. Generated Construction Shape Authoring
- 8. Voxel Volume Authoring
- 9. Unique-Shaped Blocks and Directional Components
- 10. Compound Models, Named Parts and Reusable Sub-assets
- 11. Core Modelling Toolset
- 12. Layers, Selections, Symmetry and Transform Rules
- 13. Palette Architecture and Colour Roles
- 14. Material DNA System
- 15. Texture Channels and Pixel-Painting Rules
- 16. Connected Textures, Tiling and Adjacency
- 17. Procedural Variation and Deterministic Seeds
- 18. Visual State Layers and Variant Authoring
- 19. Transparency, Cut-outs, Emission and Special Surfaces
- 20. Normals, Height, Roughness, Metallic and Ambient Occlusion
- 21. Mesh Baking, Face Merging and Runtime Geometry
- 22. Collision, Placement Footprints and Occlusion Rules
- 23. Origins, Pivots, Sockets and Interaction Anchors
- 24. Item, Held, Dropped and Inventory Presentations
- 25. Developer Overrides and Existing Asset Editing
- 26. Preview, Context Testing and Visual Review
- 27. Validation, Budgets and Authoring Warnings
- 28. Import, Export and External Tool Boundaries
- 29. Minimum Viable 21B Scope
- 30. Success Criteria and Acceptance Rules
- 31. Relationships With Documents 21C-21G
- Appendix A. Resolution and Scale Presets
- Appendix B. Material DNA Field Template
- Appendix C. Asset Authoring Checklist
- Appendix D. POC Asset Test Matrix
- Appendix E. Deferred Questions and Production Decisions

# 1. Locked Modelling, Texturing and Material Identity

The modelling and material layer is the visual construction foundation of the Forge. It must support the immediate visual overhaul while remaining scalable enough for hundreds of future blocks, items and machines. The goal is not to make every asset equally complex. The goal is to give each asset the smallest, clearest and most reusable source representation that produces the required result.

> **Locked Rule**  
> Use painted block surfaces for ordinary cubes, generated geometry for standard construction shapes, voxel volumes for unique silhouettes, and compound named parts only where movement, state changes, attachment or reuse justify separation.

## 1.1 Visual Construction Promise

A developer should be able to move between the following tasks without leaving the Forge:

- Paint a 32 x 32 stone face and preview it tiled across a wall.
- Apply the same stone family to a slab, stair, beam, arch and roof piece.
- Build a non-cubic chute from pixel voxels and define its input and output ends.
- Build a sword at correct world scale and preview it in hand, dropped and as an inventory icon.
- Assemble a furnace from a static body, a door part, an internal flame plane and effect sockets.
- Recolour a machine family through palette roles rather than repainting every asset.
- Add moss, damage, wetness, mana charge or corruption as controlled layers.
- Bake the source into efficient geometry, collision and textures suitable for runtime use.

## 1.2 Modelling Pillars

| Pillar | Meaning | Result |
| --- | --- | --- |
| Readable Scale | Assets follow one-metre blocks and a consistent pixel-voxel density. | Buildings, items and machines feel like they belong in the same world. |
| Correct Tool for the Asset | Surface painting, generated shapes, voxel volumes and compound parts each have clear use cases. | Simple assets stay fast and complex assets do not become hacks. |
| Reusable Materials | Palettes and Material DNA are shared across families. | Wood, stone, iron, mana and culture sets remain visually consistent. |
| Controlled Variation | State and environmental changes are layers or parameter changes where possible. | The world can look alive without multiplying source files uncontrollably. |
| Efficient Baking | Source detail is merged, culled and cached. | Editor freedom does not become runtime node or draw-call overload. |
| Safe Overrides | Existing visuals can be edited independently from gameplay definitions. | The visual overhaul can proceed without breaking coded systems. |

## 1.3 What This System Is Not

- It is not a freeform sculpting package intended to compete with Blender.
- It is not a requirement that every asset occupy a 32 x 32 x 32 voxel cube.
- It is not permission to mix arbitrary pixel densities without a declared scale profile.
- It is not a per-asset custom shader laboratory with no shared material rules.
- It is not a reason to create separate source models for every rotation, colour or minor state.
- It is not a full animation editor; 21B prepares parts and channels, while 21C defines animation behaviour.
- It is not a creature or humanoid modeller in this document series.

# 2. Player Decision and Direction Summary

| Area | Locked Decision |
| --- | --- |
| Default Block Texture | Use 32 x 32 pixels per block face. |
| Canonical Voxel Density | Use 32 authoring voxels per metre for standard Forge models. One standard authoring voxel therefore represents 1/32 of a world block edge. |
| Plain Cubes | Do not model ordinary full blocks as 32,768 filled microvoxels. Paint faces and let the world block renderer provide the cube. |
| Unique Blocks | Use voxel volumes for chutes, machine housings, pipes, furniture, stations, magic devices and other unique silhouettes. |
| Large Assets | Permit multi-block voxel canvases while preserving the same world density and explicit placement footprint. |
| Fine Detail | Prefer texture pixels, material channels and small named parts over arbitrary increases in geometric density. |
| Construction Families | Reuse one material family across generated slabs, stairs, walls, beams, roofs, arches and similar shapes. |
| Compound Assets | Separate parts only when independently animated, toggled, attached, reused, collided or rendered differently. Merge the rest. |
| Animation Preparation | 21B defines part names, pivots, sockets, emissive masks and frame-ready source layers; 21C defines clips, timelines and state playback. |
| Palettes | Use named palette roles linked to Material DNA rather than storing unrelated colours and properties in every model. |
| Variation | Use deterministic seed variations and layered state/culture/biome overrides wherever practical. |
| Developer Editing | Allow an authorised developer to open an existing asset, create an override and replace its visual source while preserving its stable gameplay ID. |
| Runtime Geometry | Bake voxel sources into merged meshes with hidden faces removed and static parts combined. |
| Collision | Generate simple collision by default, then allow manual box, convex or special collision overrides. Avoid per-voxel collision in normal runtime assets. |
| Current Engine | Design for a Godot and Summer Engine pipeline, primarily GDScript first. |

# 3. Authoring Architecture and Source-to-Runtime Model

## 3.1 Four Authoring Layers

```text
Gameplay record
    block/item/machine ID, behaviour, recipes, states, ports, inventory and permissions

Forge source
    painted faces, voxel volumes, named parts, palette roles, material channels,
    collision guides, pivots, sockets and presentation views

Bake products
    merged mesh, texture or texture-array data, material resources, collision shapes,
    icon render, preview thumbnail and validation report

Runtime visual instance
    resolved base or override asset driven by authoritative gameplay state
```

The Forge may display all four layers together, but it must store and modify them independently. A developer can inspect that a chute transfers items eastward, yet changing its model must not alter its transfer rate or inventory transaction logic.

## 3.2 Editable Source vs Baked Output

| Source Data | Baked Output | Runtime Principle |
| --- | --- | --- |
| 32 x 32 face pixels | Atlas/array-compatible texture data | Use nearest-readable pixel presentation with appropriate distant filtering. |
| Voxel cell volume | Merged surface mesh | Hidden interior faces never become runtime triangles. |
| Palette role indices | Material resource and palette lookup | Similar assets share material definitions and batching opportunities. |
| Named static parts | Combined static mesh where safe | Static separation is removed unless needed by rendering or interaction. |
| Named moving parts | Separate mesh surfaces or child parts | Only moving or toggled parts remain independently addressable. |
| Collision guide cells/boxes | Simplified collision shapes | Collision complexity is deliberately lower than visual complexity. |
| Icon camera settings | Rendered inventory icon | Icons update automatically when the source changes. |
| Preview metadata | Thumbnail and test-scene setup | Asset browser feedback remains current. |

## 3.3 Non-destructive Source Policy

The editable Forge source is the canonical visual source. Baked outputs are disposable products that can be regenerated. Manual edits to baked meshes or generated textures should be treated as temporary and overwritten on the next bake unless imported back into a recognised source field.

> **Source of Truth Rule**  
> Never make the only copy of a visual change inside a generated runtime file. Every approved change must be represented in the Forge source, an approved external source reference or a documented override.

# 4. Asset Classification and Workspace Selection

The New Asset Wizard and existing-asset inspector should classify the asset before opening a workspace.

| Classification | Primary Workspace | Typical Output |
| --- | --- | --- |
| Standard full block | Block Surface Mode | Six-face texture set plus standard cube definition. |
| Generated construction shape | Surface + Shape Preview | Material family applied to generated geometry. |
| Unique one-block model | Voxel Model Mode | Baked mesh within one-block placement bounds. |
| Multi-block static model | Voxel Model or Compound Mode | Baked mesh plus explicit multi-cell footprint. |
| Animated machine/station | Compound Mode | Static body, moving parts, sockets and state-ready channels. |
| Item/tool/weapon | Voxel Model Mode | World model, held pose, dropped pose and icon presentation. |
| Transparent/cut-out prop | Voxel Model + Material Editor | Mesh separated into opaque and alpha surfaces. |
| Magic infrastructure | Voxel/Compound + Material Editor | Emissive masks, flow direction, sockets and variant layers. |
| Override of existing asset | Matching original workspace | Partial or full project visual override. |

## 4.1 Automatic Recommendation

The Forge should recommend a workspace after the developer selects the target gameplay record and intended shape. It should explain the recommendation rather than silently locking the choice.

Examples:

- **Grass Block:** Block Surface Mode because geometry is a normal cube.
- **Stone Stair:** Generated Construction Shape because its geometry already belongs to the stair family.
- **Wooden Chute:** Voxel Model Mode because silhouette and open channel matter.
- **Basic Crusher:** Compound Model Mode because the body is static but gears and crusher head move.
- **Mana Conduit:** Unique Voxel Model with connection variants and emissive flow channels.

## 4.2 Workspace Conversion

A developer may convert an asset when its needs grow:

```text
Standard surface block -> generated shape family -> custom model override
Voxel model -> compound model with named parts
Static part -> animated part prepared for 21C
Palette colour -> shared Material DNA role
```

Conversion must preserve the stable visual asset ID, scale, origin and known presentation links unless the developer deliberately creates a new asset.

# 5. World Scale, Pixel Density and Resolution Profiles

## 5.1 Canonical World Scale

- One terrain/world block edge represents one metre by default.
- One standard block face contains 32 x 32 authoring pixels.
- One standard model density contains 32 voxel cells per metre.
- One standard authoring voxel edge therefore represents approximately 3.125 centimetres in world scale.

The purpose of this density is visual consistency, not physical realism. A sword, chute, crate and furnace should look as though they were made from the same visual language as the blocks around them.

## 5.2 Resolution Profiles

| Profile | Density | Intended Use | Restrictions |
| --- | ---: | --- | --- |
| Coarse | 16 voxels/metre | Large background props, simple distant machinery, deliberately chunky culture styles. | Must still align to the 32-grid at half-step boundaries when attached to standard assets. |
| Standard | 32 voxels/metre | Default for blocks, items, props, machines and magic infrastructure. | Preferred profile for almost all production assets. |
| Fine | 64 voxels/metre | Small hero details, delicate runes, rare showcase props or approved interface-scale assets. | Requires explicit performance and style approval; should not become the default. |
| Surface-only | 32 pixels/block face | Full cubes and generated construction shapes. | No internal volume unless converted to a custom model. |

## 5.3 Canvas Dimensions

Canvas size should be expressed in authoring voxels and world metres. Common presets include:

- 8 x 8 x 8: tiny component, knob, gem or compact pickup.
- 16 x 16 x 16: small prop, item component or coarse half-block object.
- 32 x 32 x 32: one standard block volume.
- 32 x 32 x 64: long tool, weapon, pipe segment or tall one-block prop.
- 64 x 32 x 32: two-block horizontal component.
- 64 x 64 x 64: two-by-two-by-two machine or large prop.
- Custom bounded volume: allowed when declared footprint and performance budget are valid.

A canvas is an editable boundary, not a requirement to fill every cell.

## 5.4 Density Mixing Rules

- A single static part should normally use one declared density.
- Different named parts may use different approved profiles only when their connection and bake scale remain explicit.
- Fine-density parts should be small, visually important and merged where possible.
- Detail that does not change silhouette should usually be painted or material-driven instead of geometric.
- Density changes must never alter gameplay footprint or machine port locations without an explicit registry change.

# 6. Standard Block Surface Authoring

Block Surface Mode is the production workhorse for terrain and construction materials.

## 6.1 Face Set

Each standard block may define:

- Top face.
- Bottom face.
- North face.
- South face.
- East face.
- West face.

The editor should also support common linking modes:

| Linking Mode | Use |
| --- | --- |
| All faces linked | Stone, metal and uniform magical blocks. |
| Top/bottom/sides | Grass, logs, soil layers and roof materials. |
| Four sides wrapped | Planks, masonry bands, bark and machine casings. |
| Opposing pairs | Directional panels, pipes, vents and decorative blocks. |
| Fully independent | Rare blocks with deliberate face-specific design. |

## 6.2 Painting Tools

Required first-party tools:

- Pencil and eraser.
- Line, rectangle, ellipse and filled-shape tools.
- Flood fill and replace-colour.
- Palette-role picker.
- Dither and controlled noise brushes.
- Stamp and reusable pattern brushes.
- Copy, paste, rotate, mirror and offset.
- Face-to-face copy and wrapped painting.
- Grid, tile boundary and safe-edge overlays.
- Selection transform without smoothing.

## 6.3 Surface Preview Modes

Every painted block should be previewable as:

- Single isolated cube.
- Three-by-three tiled wall.
- Floor plane.
- Corner and inside-corner arrangement.
- Stack with random rotations/variants.
- Adjacent to common contrasting materials.
- Under daylight, village lantern light, cave darkness and mana light.
- At near, normal building and distant viewing ranges.

The tile preview is mandatory because a good isolated texture can produce obvious repeating lines across a large building.

## 6.4 Edge Continuity

The editor should provide warnings and overlays for:

- Unintended seams between linked faces.
- Mismatched wrapped side edges.
- Strong lines that repeat every block.
- Transparent edge pixels that expose gaps.
- Top-to-side transitions that look detached.
- Connected-texture borders that do not match neighbouring variants.

## 6.5 Terrain-Specific Rules

Terrain materials should remain readable from normal gameplay distance. Dirt, stone, grass, sand, clay, gravel, ore and leaves must be identifiable by value, pattern and silhouette context rather than colour alone.

Terrain families may include:

- Base face.
- Two to six low-cost seed variants.
- Surface overlay such as grass, snow, moss or ash.
- Wet/dry material response.
- Damage/mining crack overlay supplied by the shared block damage system.
- Corruption or blessing layer where applicable.

# 7. Generated Construction Shape Authoring

Generated construction shapes allow one approved material family to cover many building pieces without creating a unique source model for each one.

## 7.1 Supported Generated Shapes

- Full cube.
- Slab and vertical slab.
- Stair and corner stair.
- Slope and compound slope.
- Beam and post.
- Pillar.
- Fence and wall.
- Railing.
- Arch and arch segment.
- Window frame.
- Roof tile, roof ridge and roof corner.
- Trim, cornice and skirting piece.

## 7.2 Shape Material Mapping

Each generated shape must define how the material maps across it:

- World-aligned mapping for stone and terrain-like materials.
- Face-oriented mapping for planks and panels.
- Directional grain mapping for logs and beams.
- Wrapped mapping for pillars, pipes and columns.
- Dedicated trim strip mapping for roofs and decorated edges.

The developer should preview rotations before approving the family. Wood grain must not unexpectedly run sideways when a beam rotates.

## 7.3 Custom Shape Overrides

A generated shape may be replaced by a custom voxel model when culture, damage, magic or silhouette requires it. The override should still inherit:

- Material family.
- Placement grid.
- Rotation rules.
- Block item link.
- Construction recipe family where applicable.
- Damage and sound family.

Example: a standard stone arch may use generated geometry, while an elven living-stone arch may use a custom asymmetric voxel model but remain part of the same functional arch category.

## 7.4 Construction Family Completeness

A material family does not need every shape immediately. The registry should track which shapes exist, are generated, are custom, are deferred or are not visually appropriate.

# 8. Voxel Volume Authoring

Voxel Volume Mode creates unique silhouettes from editable cells.

## 8.1 Cell Data

Each occupied cell should contain at minimum:

- Occupied/empty state.
- Palette role or material slot.
- Optional face-level override for special surfaces.
- Optional state-layer membership.
- Optional part membership.
- Optional authoring tags such as collision guide, socket guide or no-bake helper.

Cells should not store unrelated gameplay behaviour.

## 8.2 Volume Views

The editor should offer:

- Perspective viewport.
- Orthographic front, back, left, right, top and bottom views.
- Slice view on X, Y or Z.
- Exploded layer view.
- Wireframe/bounds view.
- Occupancy heatmap.
- Hidden-voxel and internal-face inspection.
- Baked-mesh preview alongside editable cells.

## 8.3 Silhouette-First Rule

The silhouette should be established before surface noise and fine detail. The recommended modelling order is:

```text
placement footprint and scale
    -> primary silhouette
    -> openings and negative space
    -> functional direction and ports
    -> large material regions
    -> secondary detail
    -> palette accents and state layers
    -> collision and anchors
```

## 8.4 Negative Space

Openings are important for chutes, handles, arches, grates, shelves and machine frames. The editor must make empty space easy to inspect and protect. A fill or mirror operation should not silently close an approved channel or socket opening.

## 8.5 Internal Voxels

Interior cells that cannot become visible should be removable during baking. The source may retain hidden helper data when needed for editing, but the runtime mesh should include only visible surfaces and deliberately exposed interiors.

# 9. Unique-Shaped Blocks and Directional Components

## 9.1 Unique Block Categories

| Category | Examples | Key Authoring Need |
| --- | --- | --- |
| Open transport | Chutes, gutters, troughs, drains. | Visible channel, directional ends, item clearance and connection profile. |
| Enclosed transport | Pipes, ducts, mana conduits. | Connection masks, end caps, corners, junctions and flow material. |
| Functional furniture | Shelves, racks, worktables, storage interfaces. | Interaction anchor, item display points and collision. |
| Machine casing | Furnace, crusher, saw, pump, press. | Ports, openings, named parts, state surfaces and maintenance access. |
| Magic device | Rune controller, ward stone, ritual anchor. | Emissive roles, sockets, flow direction and corruption layers. |
| Architectural special | Gargoyle, ornate arch, drain spout, culture roof end. | Placement face, rotation and material-family inheritance. |

## 9.2 Directional Authoring

A directional model should be authored in one canonical forward direction. The Forge then previews and generates legal rotations.

Required metadata:

- Forward axis.
- Up axis.
- Allowed rotations.
- Mirroring allowed or prohibited.
- Input, output or bidirectional connection ends.
- Visual connection profile at each face.
- Placement anchor and occupied block cells.

## 9.3 Connection Masks

Connected systems should use a standard six-direction mask:

```text
north, south, east, west, up, down
```

The visual source may define variants for:

- Isolated/end cap.
- Straight.
- Corner.
- Vertical turn.
- Tee junction.
- Cross junction.
- Four-, five- or six-way hub.
- Machine endpoint.

Not every system requires every combination. The Forge should warn when a gameplay connection can occur but no valid visual fallback exists.

## 9.4 Chute Rules

A chute model should define:

- Inner channel width and depth.
- Input and output end profiles.
- Direction arrow preview.
- Item-flow clearance volume.
- Support/attachment surface.
- Straight, slope, corner and endpoint visual relationships.
- Collision that prevents the player clipping through the structure without blocking visual item flow unnecessarily.

## 9.5 Multi-block Machines

A machine spanning more than one world block must declare:

- Placement anchor block.
- Full occupied footprint.
- Clearance volume.
- Rotation footprint.
- Interaction side.
- Input/output/power/mana faces.
- Which cells block building and which are decorative overhangs.

# 10. Compound Models, Named Parts and Reusable Sub-assets

Compound Mode assembles one asset from parts.

## 10.1 Part Categories

| Part Type | Purpose | Bake Behaviour |
| --- | --- | --- |
| Static body | Main shell or frame. | Merge with compatible static parts. |
| Animated transform part | Gear, wheel, door, piston, fan, blade. | Retain as independently addressable part. |
| Visibility-state part | Flame plane, warning lamp, damage panel, output indicator. | Retain or bake as state-controlled surface. |
| Reusable sub-asset | Standard gear, handle, pipe flange, rune plate. | Instance in source; optionally merge in baked output. |
| Effect-only guide | Smoke, flame, spark or sound anchor. | Does not render; becomes socket metadata. |
| Collision guide | Simplified box or volume. | Becomes collision output and is excluded from visual mesh. |
| Preview helper | Hand guide, camera guide, item-flow guide. | Editor-only and excluded from runtime. |

## 10.2 Part Naming

Names must be stable, descriptive and unique within the asset.

Recommended pattern:

```text
part.body
part.door_front
part.gear_left
part.gear_right
part.piston_main
part.crystal_core
part.indicator_output_blocked
```

Renaming a part referenced by an animation or state binding must trigger a dependency warning and automatic remap option.

## 10.3 Part Separation Rule

> **Part Budget Rule**  
> Do not create a separate part merely because it was convenient while modelling. Separate parts must justify themselves through animation, visibility, attachment, collision, reuse, material rendering or authoring workflow. Compatible static parts should be merged during baking.

## 10.4 Reusable Libraries

The Forge should support approved libraries for:

- Mechanical gears and shafts.
- Handles, hinges and latches.
- Pipe flanges and connectors.
- Common feet, supports and brackets.
- Crystals, rune plates and mana coils.
- Lantern cages and flame holders.
- Culture-specific trims and emblems.

A reused source part can be linked or made local. Linked parts receive approved library updates; local copies become independent.

# 11. Core Modelling Toolset

## 11.1 Required Tools

- Add and remove voxel.
- Paint material role.
- Box, line, cylinder-like and sphere-like voxel brushes.
- Flood fill by connected region or material.
- Extrude selection.
- Inset/hollow selection.
- Replace material role.
- Move, rotate and mirror selection.
- Duplicate and array selection.
- Slice copy and slice interpolation for simple stepped forms.
- Boolean union, subtract and intersect for bounded voxel volumes.
- Convert selection to named part.
- Merge compatible parts.
- Set origin and pivot.
- Place socket or guide.
- Generate simple collision from selection.

## 11.2 Pixel Integrity

All modelling transforms must preserve the voxel grid unless the developer explicitly changes the part's declared density. Rotations should be limited to grid-preserving increments during voxel editing. Free rotation is appropriate for runtime part animation or placement preview, not for destructively resampling source voxels by default.

## 11.3 Undo, History and Recovery

Every modelling operation must support:

- Multi-step undo and redo.
- Named history checkpoints.
- Autosave recovery.
- Compare against last approved version.
- Revert selected layer, part or material assignment.
- Non-destructive preview before destructive density conversion.

# 12. Layers, Selections, Symmetry and Transform Rules

## 12.1 Layer Types

| Layer | Use |
| --- | --- |
| Base geometry | Approved core silhouette. |
| Detail geometry | Bolts, trim, handles and secondary form. |
| Material assignment | Palette/material role painting. |
| State geometry | Damage, corruption, active insert or repair variation. |
| Helper guides | Collision, sockets, item flow, hand grip and camera guides. |
| Reference image/ghost | Optional non-exporting design reference. |

## 12.2 Layer Safety

Layers may be locked, hidden, isolated, duplicated or converted to parts. Helper layers must never appear in baked visual output. State layers must declare how they combine with the base rather than silently replacing unspecified geometry.

## 12.3 Symmetry

Supported symmetry:

- X, Y and Z mirror.
- Radial quarter-turn symmetry for gears, wheels and pillars.
- Linked edits across selected repeated parts.
- Temporary symmetry that can be committed or broken.

Symmetry should be easy to disable for natural materials and asymmetrical wear.

## 12.4 Transform Rules

- Geometry transforms snap to source voxels.
- Part transforms use explicit local pivots.
- Whole-asset transforms must preserve world scale and declared placement anchor.
- Negative scaling should not be used as a hidden runtime substitute for a proper mirrored variant when normals, text, runes or direction matter.

# 13. Palette Architecture and Colour Roles

## 13.1 Palette-Role Model

A voxel or pixel should normally reference a named role, such as:

```text
wood.base_mid
wood.base_dark
wood.highlight
wood.cut_end
metal.iron_base
metal.iron_edge
metal.rust
magic.mana_core
magic.mana_glow
state.damage_dark
```

The role resolves to colour and material properties through the active palette and Material DNA. This lets an oak machine and a darkwood machine share one model while resolving to different approved visual families.

## 13.2 Palette Levels

| Level | Purpose |
| --- | --- |
| Project master palette | Shared colour language and value ranges for Leyforge. |
| Material-family palette | Stone, oak, iron, copper, mana, void and culture-specific groups. |
| Asset palette | Roles actually used by one asset, inherited from families where possible. |
| Variant palette | Controlled substitutions for biome, culture, state, rarity or magic. |
| Temporary working palette | Unapproved colours used during editing; must be resolved before final validation. |

## 13.3 Palette Budgets

Recommended first-pass budgets:

| Asset Type | Preferred Roles | Soft Maximum | Notes |
| --- | ---: | ---: | --- |
| Standard terrain block | 6-12 | 16 | Variants should mostly reuse the same family. |
| Construction material | 8-16 | 24 | Includes edge, trim and weathering roles. |
| Small item/tool | 8-20 | 32 | Multiple materials may share one asset palette. |
| Prop/station | 12-28 | 40 | Keep role names meaningful and reusable. |
| Machine/magic device | 16-40 | 64 | Larger count requires clear material grouping. |

These are authoring budgets, not arbitrary hard artistic limits. Assets exceeding the soft maximum require validation review because uncontrolled roles create inconsistent colour and material behaviour.

## 13.4 Value and Readability Rules

- Important functional edges should survive grayscale viewing.
- Interactable parts should not rely on hue alone.
- Dark caves must retain enough value separation to recognise silhouette and openings.
- Emissive materials should not erase the underlying shape.
- Rare materials may be richer but must remain identifiable as their material family.

# 14. Material DNA System

Material DNA is the shared description of how a material should look and react.

## 14.1 Core Material DNA Fields

| Field | Purpose |
| --- | --- |
| Material ID | Stable identifier such as `material.wood.oak` or `material.magic.mana_crystal`. |
| Family | Wood, stone, metal, soil, fabric, glass, crystal, organic, magic or hybrid. |
| Palette roles | Named colours and substitutions available to assets. |
| Base surface response | Default roughness, metallic, emission, opacity and normal strength. |
| Grain/direction rules | Whether mapping must follow log, plank, metal-brush or crystal direction. |
| Sound family reference | Read-only link for consistency; actual sound behaviour remains outside 21B. |
| Damage response | Chips, cracks, dents, scorch, rot, fracture or magical instability. |
| Weather response | Wet darkening, snow retention, moss, dust, rust, fading or frost. |
| Magic response | Mana glow, rune acceptance, corruption tint, ward reaction or purity. |
| Culture overlays | Permitted trim, paint, carving, symbols or construction treatment. |
| Variation rules | Seed, rotation, hue/value range and overlay probabilities. |
| Rendering class | Opaque, cut-out, transparent, emissive, liquid-like or special approved class. |

## 14.2 Material Family Examples

### Oak Wood

- Warm mid-value base.
- Directional grain.
- Non-metallic, moderately rough.
- Darkens slightly when wet.
- Can gain moss, rot, scorch and carved culture overlays.
- Cut-end palette available for logs and beams.

### Iron

- Cool dark-grey base with brighter worn edges.
- Metallic response.
- Roughness depends on forged, polished or rusted state.
- Damage uses dents, scratches and oxidation rather than stone-like cracks.
- May accept rune etching or mana coil attachments.

### Mana Crystal

- Translucent or cut-out crystal body depending on performance class.
- Strong but controlled emissive core.
- Purity changes colour clarity and flicker behaviour.
- Corruption replaces clean glow with unstable veins and darker inclusions.

## 14.3 Inheritance

```text
material.metal
    -> material.metal.iron
        -> material.metal.iron.forged
        -> material.metal.iron.polished
        -> material.metal.iron.rusted
```

Child DNA records override only changed fields. The Forge should display inherited values and make local overrides obvious.

# 15. Texture Channels and Pixel-Painting Rules

## 15.1 Core Channels

| Channel | Role | Default Authoring Method |
| --- | --- | --- |
| Colour/palette index | Main visible colour role. | Pixel painting or voxel material assignment. |
| Alpha/cut-out | Defines holes, leaves, grates and thin silhouettes. | Binary or controlled threshold painting. |
| Emission | Defines glow intensity and colour role. | Mask painting plus Material DNA. |
| Roughness | Defines matte versus smooth response. | Material-role default with optional mask override. |
| Metallic | Defines metal response. | Usually material-role default, rarely hand-painted per pixel. |
| Height/normal guide | Adds limited surface relief without geometry. | Optional pixel height or generated normal assistance. |
| Ambient-occlusion guide | Reinforces cavities and contact. | Prefer generated AO; allow controlled art override. |
| State mask | Marks regions affected by damage, wetness, heat, magic or corruption. | Named mask layers. |

## 15.2 Channel Simplicity Rule

Most assets should be authored through palette roles and Material DNA, not hand-painted into every channel. Hand-painted channel overrides are for deliberate exceptions.

## 15.3 Pixel-Art Sampling

- Source pixels must remain crisp at normal viewing distance.
- The runtime pipeline should avoid unintended blur and colour bleeding.
- Distant filtering and mip behaviour must reduce shimmer without making nearby surfaces muddy.
- Atlas padding or texture-array strategy must prevent neighbouring textures bleeding into edges.
- Scaling operations in the Forge use nearest-neighbour unless the developer deliberately invokes a controlled resample tool.

## 15.4 Pattern and Stamp Libraries

Reusable patterns may include:

- Stone chips and cracks.
- Wood grain and knots.
- Brick bonds.
- Roof tile rows.
- Metal rivets and plates.
- Cloth weave.
- Rune strokes.
- Moss, rust, soot, dust and frost.

Patterns should reference palette roles so they can adapt to material families.

# 16. Connected Textures, Tiling and Adjacency

## 16.1 Connected Texture Uses

- Grass edges joining dirt.
- Glass panes joining without heavy internal borders.
- Bookshelves continuing across blocks.
- Pipes and mana conduits changing at connections.
- Brick or tile patterns reducing visible repetition.
- Moss or corruption spreading across adjacent surfaces.

## 16.2 Connection Inputs

Connected presentation may inspect:

- Same visual family on adjacent face.
- Same gameplay block family.
- Matching material tag.
- Directional port connection.
- Same structure/culture style.
- Shared state such as powered, wet or corrupted.

The visual rule must not change whether blocks are actually connected for gameplay.

## 16.3 Variant Strategy

The Forge should support:

- Rule-based edge/corner overlays.
- Small tile variant sets.
- Bitmask-driven connection variants.
- Rotated/mirrored variants where visually valid.
- A defined fallback when a rare adjacency has no dedicated art.

## 16.4 Tiling Review

A connected material is not approved until tested on:

- Flat wall.
- Large floor.
- Inside and outside corners.
- Mixed shapes such as stairs and slabs.
- Interrupted runs with doors/windows.
- Random seed variation.

# 17. Procedural Variation and Deterministic Seeds

## 17.1 Variation Sources

| Source | Example |
| --- | --- |
| Block position seed | Slight stone pattern or plank knot variation. |
| Structure seed | Consistent trim selection across one building. |
| Biome | Wetter moss, paler grass, darker bark. |
| Culture | Paint, carving, metal trim or roof accent. |
| Age | Fading, chips, soot, rust or worn edges. |
| Weather | Wet darkening, snow, frost, dust or mud. |
| Magic | Mana veins, rune glow, blessing or elemental influence. |
| Corruption | Dark veins, missing material, unstable emission. |
| Rarity/quality | Cleaner finish, refined edge, ornament or controlled glow. |

## 17.2 Deterministic Rule

The same world seed, asset ID, variant rules and relevant state should resolve to the same visual result unless the save explicitly records a changed variant. This prevents multiplayer disagreement and flickering variation between loads.

## 17.3 Variation Limits

- Variation must not obscure the asset's identity.
- Functional openings, ports and warning indicators must remain consistent.
- Random rotation is prohibited when grain, text, runes, slope or direction matters.
- Variation layers require a maximum visual intensity.
- Culture and corruption layers should not both overwrite the same critical readability region without a priority rule.

## 17.4 Material DNA Variation Fields

Recommended controls:

- Allowed palette substitutions.
- Hue/value offset range.
- Overlay selection weights.
- Rotation/mirroring permissions.
- Density and scale of noise.
- Seed scope: block, structure, region or asset instance.
- State priority and blend mode.

# 18. Visual State Layers and Variant Authoring

21B defines the visual source layers. 21C defines how runtime states activate them.

## 18.1 Common State Layers

- New/pristine.
- Normal.
- Worn/aged.
- Damaged.
- Heavily damaged.
- Burnt/scorched.
- Wet/frozen/snow-covered.
- Powered/unpowered.
- Active/idle.
- Heated/cooled.
- Mana-charged/depleted.
- Corrupted/cleansed.
- Constructing/scaffolded.
- Ruined/repaired.

## 18.2 Layer Types

| Layer Type | Example |
| --- | --- |
| Palette substitution | Hot iron becomes brighter and warmer. |
| Texture/mask overlay | Soot appears above furnace opening. |
| Geometry addition | Broken plank, bent pipe or crystal growth appears. |
| Geometry removal | Missing machine panel or chipped corner. |
| Material parameter | Emission rises with charge. |
| Part visibility | Flame plane appears only when active. |
| Variant replacement | Ruined version replaces the clean roof segment. |

## 18.3 Base Preservation

A state layer should contain only its changes where practical. This makes overrides and future base-model improvements easier. A damage layer should not duplicate the entire furnace if it only adds a cracked panel and soot.

## 18.4 Priority

A state stack needs declared priority. A suggested visual order is:

```text
base material
    -> deterministic base variation
    -> culture/biome treatment
    -> age/weathering
    -> gameplay condition such as wet, heated or damaged
    -> magic/power state
    -> corruption or critical warning state
```

The exact order can vary by asset family but must be explicit.

# 19. Transparency, Cut-outs, Emission and Special Surfaces

## 19.1 Rendering Classes

| Class | Examples | Rule |
| --- | --- | --- |
| Opaque | Stone, wood, metal, soil. | Default and cheapest class. |
| Alpha cut-out | Leaves, grates, thin cloth, chains. | Prefer when a hard pixel edge is acceptable. |
| Transparent | Glass, water-like crystal, magical field. | Use selectively because sorting and overdraw are more expensive. |
| Emissive opaque/cut-out | Runes, heated metal, lamp windows. | Preserve base form beneath glow. |
| Special approved | Portal surface, liquid core, distortion field. | Requires a shared project shader and explicit validation. |

## 19.2 Transparency Rules

- Prefer cut-out over blended transparency when it serves the art.
- Avoid many stacked transparent layers.
- Transparent surfaces should use separate baked surfaces when required by the renderer.
- Collision and selection outlines must not rely on invisible full-cube bounds when the visible shape is open.
- Glass borders must remain visible in bright and dark environments.

## 19.3 Emission Rules

- Emission should identify function, energy and magic rather than act as uncontrolled bloom.
- The underlying pixel pattern must remain visible at normal exposure.
- Critical indicators use shape and rhythm as well as colour.
- Emissive masks should be authored independently from colour when practical.
- Unpowered variants must have a readable non-emissive appearance.

# 20. Normals, Height, Roughness, Metallic and Ambient Occlusion

## 20.1 Stylised Depth

Leyforge may use limited material depth to enrich surfaces, but the effect must not undermine the pixel-voxel style.

Recommended hierarchy:

1. Geometry for silhouette and major openings.
2. Texture pattern for material identity.
3. Subtle normal/height for surface response.
4. Generated ambient occlusion for cavities and contact.
5. Roughness/metallic response through Material DNA.

## 20.2 Normal and Height Authoring

The Forge may generate a restrained normal map from a pixel-height guide. The developer should control strength and preview it under multiple lights. Strong smooth normals that make a 32 x 32 texture look like high-resolution sculpting should be rejected.

## 20.3 Roughness

Roughness should normally come from material family:

- Rough stone and unpolished wood.
- Smoother worn handles and polished trim.
- Variable forged metal.
- Wet surfaces become smoother and darker where appropriate.
- Frost, dust and ash increase roughness.

## 20.4 Metallic

Metallic response should be binary or material-driven in most cases. Painted metal may contain non-metallic paint over metallic exposed edges. Stone should not become metallic merely because it is shiny.

## 20.5 Ambient Occlusion

Generated AO should emphasise:

- Voxel cavities.
- Part intersections.
- Machine recesses.
- Undersides and attachment points.

AO must not permanently blacken surfaces that should receive dynamic light. The Forge should allow preview strength and bake/runtime strategy to be changed later in 21F.

# 21. Mesh Baking, Face Merging and Runtime Geometry

## 21.1 Bake Pipeline Intent

```text
validate source
    -> resolve density and scale
    -> remove hidden interior faces
    -> merge coplanar compatible faces
    -> separate required material/render classes
    -> combine compatible static parts
    -> retain animated/state-controlled parts
    -> generate normals/tangents as required
    -> generate simplified collision
    -> render icon and thumbnail
    -> write dependency and validation report
```

## 21.2 Face Merging

Greedy or equivalent face merging should combine adjacent coplanar faces that share compatible material data. Merging must preserve:

- Pixel boundaries and UV orientation.
- Hard silhouette edges.
- Material transitions.
- State mask regions needed at runtime.
- Part boundaries required for animation or visibility.

## 21.3 Static Part Combination

Compatible static parts should be combined per baked asset. Exceptions include:

- Different transparency classes.
- Different animation/state visibility.
- Required independent collision.
- Required attachment replacement.
- Shared sub-assets intentionally instanced at runtime.

## 21.4 LOD Preparation

21B should allow the developer to provide or preview:

- Full baked model.
- Simplified distant model.
- Billboard/icon-like fallback for tiny distant props where approved.
- State-safe LOD behaviour that does not hide critical machine warnings nearby.

Automatic LOD generation and runtime thresholds are technical subjects for 21F, but authoring must preserve the option.

## 21.5 Bake Reproducibility

The same approved source and bake version should produce reproducible outputs. The validation report should record:

- Source asset ID and version.
- Bake tool version.
- Output mesh/material/collision identifiers.
- Warnings and approved exceptions.
- Dependency versions.

# 22. Collision, Placement Footprints and Occlusion Rules

## 22.1 Collision Profiles

| Profile | Use |
| --- | --- |
| Full cube | Ordinary blocks and solid generated shapes. |
| Simple boxes | Furniture, chutes, machines and props. |
| Convex hull set | Irregular solid objects where boxes are insufficient. |
| Thin interaction plane | Signs, banners or specific editor interactions. |
| No collision | Pure effects, tiny clutter or visual-only attachments. |
| Custom gameplay collision reference | Special cases owned by the gameplay system. |

## 22.2 Collision Simplification

Per-voxel collision is prohibited as the default production approach. The Forge may use occupied voxels to propose collision boxes, but the result must be simplified and reviewable.

## 22.3 Placement Footprint

Every placeable world asset defines:

- Anchor cell.
- Occupied cells.
- Clearance cells.
- Support requirements.
- Allowed placement faces.
- Allowed rotations.
- Overhang allowance.
- Whether neighbouring blocks may occupy empty visual space inside the bounding volume.

## 22.4 Occlusion and Face Culling

Custom block models should define which world-block faces are fully occluding. A solid machine back may occlude the neighbouring block face; an open chute side should not.

Possible face flags:

- Fully occludes neighbour.
- Partially occludes; do not cull neighbour.
- Transparent/cut-out; do not treat as solid occluder.
- Conditional occlusion based on state or variant.

## 22.5 Selection Bounds

Selection and placement outlines should follow a simple readable bound, not necessarily every visible voxel. The player must be able to target thin or open assets reliably.

# 23. Origins, Pivots, Sockets and Interaction Anchors

## 23.1 Asset Origin

Default world-block origin should be consistent across the project, preferably centred horizontally on the anchor cell and aligned to its base vertically unless a system requires another convention.

## 23.2 Pivots

Every independently moving part requires an explicit local pivot. The Forge should show:

- Pivot point.
- Local axes.
- Rotation preview.
- Swept clearance volume.
- Parent part relationship.

Examples:

- Gear pivot at axle centre.
- Door pivot at hinge edge.
- Crusher head pivot or translation axis at guide rails.
- Windmill blade pivot at hub.

## 23.3 Socket Categories

| Socket Category | Examples |
| --- | --- |
| Effects | Flame, smoke, sparks, steam, dust, mana particles. |
| Audio | Motor, impact, crackle, flow, warning alarm. |
| Item flow | Input, output, overflow, visible carried item path. |
| Power | Shaft, wire, pipe, fuel, water, wind or steam connection. |
| Mana | Mana input, output, conduit and ward link. |
| Interaction | Player use point, NPC work point, repair point, inspection point. |
| Equipment | Grip, off-hand support, sheath, attachment or display mount. |
| Structure | Blueprint alignment, snap point, wall mount or modular connection. |

## 23.4 Socket Naming

```text
socket.effect.flame_main
socket.effect.smoke_chimney
socket.audio.machine_loop
socket.item.input
socket.item.output
socket.power.mechanical
socket.mana.input
socket.interact.player_front
socket.interact.npc_operator
socket.equipment.grip_primary
```

Sockets referenced by gameplay or animation data must use stable names and dependency validation.

# 24. Item, Held, Dropped and Inventory Presentations

## 24.1 One Source, Multiple Views

An item asset may resolve into:

- World/held model.
- First-person held pose.
- Third-person held pose.
- Dropped-item pose.
- Display-rack pose.
- Inventory icon camera.
- Placeable block form where linked.

The item gameplay definition remains separate from these presentations.

## 24.2 Grip and Hand Guides

Tools and weapons should define:

- Primary grip socket.
- Optional secondary grip socket.
- Forward direction.
- Blade/head functional direction.
- Hand clearance guide.
- First-person offset preview.
- Third-person skeleton preview reference, even though full character fitting is deferred.

## 24.3 Dropped Presentation

Dropped items should be readable without excessive physics complexity. The Forge may define:

- Resting orientation.
- Gentle spin preview.
- Ground offset.
- Simplified collision.
- Stack or quantity visual later if supported.

## 24.4 Icon Generation

Icon settings include:

- Camera angle.
- Orthographic/perspective choice.
- Framing and padding.
- Background style or transparency.
- Lighting preset.
- State/variant to render.
- Optional rarity border handled by UI rather than baked into the source icon.

Icons should regenerate when the approved source changes.

# 25. Developer Overrides and Existing Asset Editing

## 25.1 Override Entry Points

An authorised developer can choose:

- Open Original Read-Only.
- Edit as Project Override.
- Duplicate as New Asset.
- Replace Selected Presentation Field.
- Compare Base and Override.
- Revert Selected Field.
- Revert Entire Visual Override.

## 25.2 Visual Fields Covered by 21B

- Standard block faces.
- Voxel volumes.
- Named static and moving parts.
- Palette roles.
- Material DNA references and approved local overrides.
- Texture channels and masks.
- Collision source.
- Placement bounds.
- Origin, pivots and sockets.
- Item presentation poses and icon camera.

Animation clips and state bindings are covered in 21C, but the source parts and channels they require are authored here.

## 25.3 Partial Overrides

A developer may replace only the furnace face textures while inheriting its model and collision, or replace only its model while inheriting its palette and sockets. The editor must show inherited and overridden fields clearly.

## 25.4 Compatibility Warnings

The Forge should warn when an override:

- Removes a socket required by gameplay.
- Changes the footprint without editing placement data.
- Moves a pivot used by an animation.
- Removes a palette role used by a state layer.
- Changes a directional end profile used by connection variants.
- Introduces transparency or material classes outside the asset budget.
- Changes scale enough to clip held-item or structure previews.

A warning does not always block an authorised developer, but release validation may require a documented exception.

# 26. Preview, Context Testing and Visual Review

## 26.1 Required Preview Contexts

| Context | Purpose |
| --- | --- |
| Neutral turntable | Inspect silhouette, materials and pivots. |
| World-block grid | Confirm scale, origin and footprint. |
| Building wall/floor | Check tiling and construction compatibility. |
| Blueprint structure | Confirm roof, beam, window and prop relationships. |
| Held-item rig | Check grip, scale and screen coverage. |
| Dropped-item scene | Check ground contact and readability. |
| Machine test stand | Check ports, clearance and state-ready parts. |
| Lighting presets | Day, night, cave, lantern, mana and storm conditions. |
| Performance preview | Show triangle count, surfaces, parts, material classes and collision shapes. |

## 26.2 Comparison Modes

- Base vs override side by side.
- Previous approved version vs current edit.
- Source voxel vs baked mesh.
- Normal vs damaged/corrupted/wet/powered layer.
- Single asset vs repeated/tiled placement.
- Culture or biome palette comparison.

## 26.3 Review Status

Recommended workflow states:

```text
draft -> internal review -> needs changes -> technically valid -> art approved -> production approved -> superseded
```

Approval state belongs to project metadata, not runtime gameplay data.

# 27. Validation, Budgets and Authoring Warnings

## 27.1 Validation Categories

| Category | Example Checks |
| --- | --- |
| Identity | Stable visual ID, target gameplay record and override type are valid. |
| Scale | Declared density, world size and footprint agree. |
| Geometry | No invalid faces, accidental disconnected fragments or hidden helper geometry. |
| Materials | Palette roles resolve; rendering classes and channel data are valid. |
| Connections | Required directional variants and sockets exist. |
| Collision | Collision is present where required and not excessively complex. |
| Presentation | Origin, pivots, icon camera and held/drop poses are valid. |
| Performance | Triangles, surfaces, separate parts, transparency and texture usage remain within budget. |
| Dependencies | No missing library parts, materials, masks, sockets or target records. |
| Override Safety | Required inherited fields were not removed unintentionally. |

## 27.2 First-Pass Authoring Budgets

These budgets are targets for early development and should be profiled in 21F rather than treated as permanent engine limits.

| Asset Type | Preferred Separate Runtime Parts | Preferred Material/Render Surfaces | Collision Target |
| --- | ---: | ---: | --- |
| Standard block | 1 | 1-2 | Full cube or shape primitive. |
| Generated construction piece | 1 | 1-2 | Generated primitive. |
| Small item/prop | 1-2 | 1-3 | One to three simple shapes. |
| Unique block/chute | 1-3 | 1-3 | Small box set or convex set. |
| Station/furnace | 2-6 | 1-4 | Simple box/convex set. |
| Medium machine | 3-12 | 2-6 | Simplified boxes/convex shapes. |

## 27.3 Warning Levels

- **Info:** unusual but safe choice.
- **Warning:** likely visual, compatibility or performance problem.
- **Error:** cannot bake or resolve safely.
- **Release Blocker:** technically bakeable but violates required gameplay dependency or approved production rule.

## 27.4 Orphan and Fragment Checks

Tiny disconnected voxel fragments should be detected. The developer may keep them when deliberate, such as floating mana shards, but must mark them as intentional and ensure their connection or animation strategy is valid.

# 28. Import, Export and External Tool Boundaries

## 28.1 Forge-First Principle

The Forge should be able to create the project's standard assets without requiring external software. External tools remain optional for specialised work.

## 28.2 Supported Import Concepts

Detailed file formats belong in 21F, but 21B requires the ability to consider:

- Importing 32 x 32 pixel textures without filtering damage.
- Importing palette files and mapping colours to roles.
- Importing compatible voxel volumes from approved voxel formats.
- Importing a static mesh as a reference or controlled exception.
- Importing a reference image that does not ship in the game.

## 28.3 Import Validation

Imported data must be normalised to:

- Declared world scale.
- Approved density or surface resolution.
- Palette/material roles.
- Project coordinate and pivot conventions.
- Safe rendering class.
- Stable source ownership and licence metadata where relevant.

## 28.4 Export Concepts

The Forge may export:

- Editable project source pack.
- Baked runtime asset pack.
- Texture sheets or preview renders.
- Inventory icons and thumbnails.
- Validation report.
- Content-pack-ready visual override, later expanded in 21D and 21F.

# 29. Minimum Viable 21B Scope

The first implementation should prove the authoring foundation rather than every final tool.

## 29.1 Required MVP Workspaces

1. Block Surface Mode with 32 x 32 painting and cube/tile preview.
2. Voxel Model Mode with add/remove/paint, orthographic views, slicing, symmetry and bake preview.
3. Basic Compound Mode with named parts, pivots and sockets.
4. Palette-role editor and a small Material DNA editor.
5. Collision and placement-footprint editor.
6. Held/drop/icon preview for an item.
7. Existing-asset project override workflow.
8. Validation report and baked output preview.

## 29.2 Required MVP Test Assets

| Asset | What It Proves |
| --- | --- |
| Grass block | Top/side/bottom faces, 32 x 32 painting, tile preview and terrain variation. |
| Stone construction family | One material across cube, slab, stair, wall and beam. |
| Wooden chute | Unique shape, direction, connection ends, item clearance and collision. |
| Iron pickaxe or sword | Item scale, palette roles, grip socket, dropped pose and icon render. |
| Basic furnace | Compound body, opening, material channels, flame/emission-ready masks and effect sockets. |
| Basic crusher or gear machine | Named parts, gear pivots, machine ports, multi-part bake and performance validation. |
| Mana conduit | Connected variants, emissive flow mask, powered/unpowered source layers and corruption-ready variant. |

## 29.3 Explicit MVP Deferrals

- Full procedural texture graph editor.
- Advanced UV editing comparable to external 3D tools.
- Full animation timeline and state graph; handled in 21C.
- Public player creator and unrestricted mod export.
- Automatic perfect LOD generation for every asset.
- Humanoid, NPC, animal and monster modelling.
- Highly complex transparent or distortion shaders.
- Collaborative multi-user live editing.

# 30. Success Criteria and Acceptance Rules

The 21B system is successful when all of the following are true:

- A developer can create and save a 32 x 32 textured block without an external editor.
- The same material family can appear correctly on multiple generated construction shapes.
- A unique chute can be modelled, rotated, connected and placed without becoming a full-cube visual hack.
- A machine can contain a merged static body and independently addressable moving parts.
- Palette roles can recolour or re-material an asset family without repainting every voxel.
- A Material DNA record can drive roughness, metallic, emission, weather and damage behaviour consistently.
- Deterministic visual variation does not flicker or change unexpectedly between loads.
- Collision is simpler than visual geometry and can be inspected before saving.
- Existing assets can be opened as project overrides without changing stable gameplay definitions.
- Source voxel models bake into efficient meshes rather than runtime microvoxel node collections.
- Required sockets, pivots, footprint and direction metadata survive baking.
- The grass block, stone family, chute, item, furnace, machine and mana conduit test set all pass validation.
- The resulting assets can be selected immediately in the Blueprint Designer and world placement preview.

> **Acceptance Rule**  
> 21B is not complete because the editor can draw voxels. It is complete when those voxels can become consistent, reusable, validated and performant Leyforge assets that preserve gameplay identity.

# 31. Relationships With Documents 21C-21G

| Document | Dependency on 21B |
| --- | --- |
| 21C - Animation, Effects and Runtime Visual States | Uses the named parts, pivots, sockets, material masks, state layers and frame-ready geometry defined here. |
| 21D - Asset Overrides, Variants and Registry Integration | Expands how 21B source fields inherit, override, resolve, migrate and interact with content packs. |
| 21E - Forge UI/UX and Creator Workflow | Turns every 21B tool, workspace, warning, preview and review state into editor screens and interactions. |
| 21F - Forge Technical Implementation Plan | Defines Godot Resources, storage, bake services, caches, texture strategy, mesh generation, hot reload and validation implementation. |
| 21G - Visual Overhaul and Asset Migration Plan | Uses the 21B asset categories, complexity rules and test standards to rebuild Leyforge's production visuals in a controlled order. |

# Appendix A. Resolution and Scale Presets

| Preset ID | Density/Resolution | Typical Canvas | Intended Assets |
| --- | --- | --- | --- |
| `surface.block.standard` | 32 x 32 pixels/face | Six faces | Terrain and full construction blocks. |
| `voxel.coarse.small` | 16 voxels/metre | 16 cubed or bounded | Large chunky detail and approved low-cost props. |
| `voxel.standard.block` | 32 voxels/metre | 32 cubed | Unique one-block models. |
| `voxel.standard.item_long` | 32 voxels/metre | 16 x 16 x 48 or bounded | Swords, axes, tools and rods. |
| `voxel.standard.machine_2x1` | 32 voxels/metre | 64 x 32 x 32 | Two-block machines and transport components. |
| `voxel.standard.machine_2x2` | 32 voxels/metre | 64 x 64 x 64 | Medium compound machines. |
| `voxel.fine.approved` | 64 voxels/metre | Bounded special volume | Rare hero detail requiring explicit approval. |

# Appendix B. Material DNA Field Template

```text
material_id:
display_name:
family:
parent_material_id:
rendering_class:
base_palette_roles:
roughness_default:
metallic_default:
emission_default:
opacity_mode:
normal_strength:
graining_or_direction_rule:
wet_response:
snow_or_frost_response:
moss_or_growth_response:
rust_or_rot_response:
damage_response:
heat_response:
mana_response:
corruption_response:
allowed_culture_overlays:
allowed_seed_variation:
connection_mapping_rule:
texture_sampling_profile:
sound_family_reference:
planning_status:
notes:
```

# Appendix C. Asset Authoring Checklist

## Identity and Scope

- [ ] Target gameplay record or new visual asset ID selected.
- [ ] Correct workspace chosen.
- [ ] World scale, density and canvas bounds declared.
- [ ] Base, variant or project override status clear.

## Geometry

- [ ] Silhouette readable at normal gameplay distance.
- [ ] Openings and negative space preserved.
- [ ] Static parts merged where practical.
- [ ] Moving or state-controlled parts named.
- [ ] No accidental disconnected fragments.
- [ ] Baked mesh preview inspected.

## Materials

- [ ] Palette roles resolve to approved material families.
- [ ] Roughness, metallic, alpha and emission classes are appropriate.
- [ ] Tiling and adjacency tested where relevant.
- [ ] Deterministic variation stays within readability limits.
- [ ] State layers contain only required changes where practical.

## Placement and Interaction

- [ ] Origin and anchor cell correct.
- [ ] Footprint and clearance valid in every allowed rotation.
- [ ] Collision simplified and inspected.
- [ ] Required sockets and pivots present.
- [ ] Direction and connection profiles correct.

## Presentation

- [ ] Day, night, cave, lantern and mana-light previews checked.
- [ ] Held, dropped and icon views checked for items.
- [ ] Base versus override comparison checked.
- [ ] Performance and dependency warnings resolved or documented.

# Appendix D. POC Asset Test Matrix

| Test | Grass Block | Stone Family | Wooden Chute | Tool/Weapon | Furnace | Crusher | Mana Conduit |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 32 x 32 surface paint | Required | Required | Optional | No | Optional | Optional | Optional |
| Generated shape family | No | Required | No | No | No | No | No |
| Voxel volume | No | Custom exceptions | Required | Required | Required | Required | Required |
| Named parts | No | No | Optional | Grip guide | Required | Required | Optional |
| Direction/connection | No | Rotation only | Required | Forward axis | Ports | Ports | Required |
| Palette roles | Required | Required | Required | Required | Required | Required | Required |
| Material DNA | Soil/grass | Stone | Wood | Wood/metal | Stone/metal | Wood/metal | Mana/crystal |
| Collision | Cube | Generated | Custom simple | Dropped simple | Custom simple | Custom simple | Custom simple |
| State-ready masks | Wet/snow | Damage/moss | Damage | Quality | Flame/heat | Active/warning | Flow/corruption |
| Override workflow | Required | Required | Required | Required | Required | Required | Required |
| Bake validation | Required | Required | Required | Required | Required | Required | Required |

# Appendix E. Deferred Questions and Production Decisions

The following questions should be resolved during 21E and 21F implementation planning or after the first Forge prototype is profiled:

1. Whether standard block surfaces use texture arrays, atlases or a hybrid runtime strategy in Godot.
2. Exact mesh and material surface budgets for the target hardware.
3. Whether fine-density parts are baked into the same mesh or retained as separate approved sub-assets.
4. The default generated-collision algorithm and when manual collision becomes mandatory.
5. Exact connected-texture bitmask format and fallback generation rules.
6. Whether height guides generate normal maps at bake time or are evaluated through a shared shader.
7. How culture, biome, damage, weather and corruption layers are packed into masks and resolved at runtime.
8. Whether icons are baked on save, on content build or on demand with cache invalidation.
9. Which external voxel formats are safe and useful to import.
10. The final project-wide palette size and governance process.
11. The first target visual budgets for low-, medium- and high-quality settings.
12. How block-model overrides are migrated when a gameplay footprint changes between versions.

---

**End of Document 21B - Voxel Asset Forge - Voxel Modelling, Texturing and Material Authoring - Version 0.1**
