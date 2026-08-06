# Fantasy Voxel Civilisation Sandbox
## 23B - Presentation Forge
### Spatial Anchors, Sockets, Regions, Paths and Attachment System
**Version 0.1 - Detailed Design Bible Draft**

A stable spatial-reference system for assigning audio, voxel VFX, lights, trails, surface presentation and related feedback to exact voxels, faces, masks, bones, body regions, blueprint cells, world volumes, network paths and temporary runtime contact points.

*Working design document - semantic placement, remapping, attachment behaviour, spatial validation and runtime reference foundation*

## Spatial Attachment System Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the complete Presentation Forge spatial-reference system: anchors, sockets, regions, paths, surface masks, zones, sound portals, runtime anchors, coordinate spaces, attachment behaviour, remapping, mirroring, inheritance, validation, baking and cross-system use. |
| Core Philosophy | Presentation attaches through stable semantic references rather than fragile scene paths, raw coordinates or visual guesswork. The semantic identity remains stable while the physical mapping may change by model, variant, damage state, LOD or content-pack override. |
| Precision Direction | Support whole-asset placement, exact voxel centres, voxel-local offsets, faces, face texels, edges, vertices, free local points, bones, body roles, blueprint cells, volumes, network routes and runtime contact locations. |
| Spatial Types | Use Anchor, Socket, Region, Path, Surface Mask, Zone, Sound Portal and Runtime Anchor as distinct but interoperable spatial concepts. |
| Coordinate Direction | Every reference declares its owner and coordinate space. Canonical local transforms use position, orientation and optional scale policy; integer voxel coordinates and face-local coordinates remain available for exact voxel editing. |
| Surface Direction | Prefer named Surface Masks over raw texture-pixel coordinates. Masks may still represent a single exact texel, weighted pixel set, line, irregular shape, flow direction or exclusion area. |
| Asset Direction | Blocks, items, props, machines, equipment and materials may inherit family anchors and surface masks while overriding only unique mappings. |
| Entity Direction | Entities use bones, body roles, named sockets, body regions, mirrored pairs and animation-follow behaviour without turning presentation regions into gameplay hitboxes. |
| Blueprint Direction | Structures and blueprints may define cells, marker transforms, rooms, ambient regions, acoustic zones, sound portals, paths, boundaries and network-linked presentation routes. |
| Runtime Direction | Authoritative gameplay may provide temporary runtime anchors for impacts, contacts, struck voxels, normals, materials and targets. Presentation may consume this data but cannot invent the gameplay result. |
| Mapping Direction | Spatial references support primary mappings, variant mappings, LOD mappings, fallbacks, aliases, approximation rules, required/optional status and migration history. |
| Attachment Direction | Follow behaviour is explicit: rigid follow, position-only, rotation-only, normal alignment, target facing, path following, event snapshot, world transfer, linger, fade or rebind. |
| Inheritance Direction | Body plans, block families, machine families, equipment archetypes and blueprint modules may supply reusable spatial templates. Mirroring and semantic aliases reduce duplicate authoring. |
| Validation Direction | Approval blocks on missing required references, duplicate IDs, orphaned mappings, invalid paths, empty masks, broken portals, cyclic fallbacks, incompatible sockets or absent LOD policies. |
| Runtime Product Direction | Editable references bake into compact lookup records, bitsets, sampled paths, zone graphs and remap tables. Runtime systems instantiate only active attachments rather than one scene node per authored reference. |
| Multiplayer and Save Direction | Persistent records store owner IDs and semantic spatial IDs rather than raw world transforms. Temporary runtime anchors are event data; persistent residues convert into explicit saved surface or region records when required. |
| MVP Direction | Prove exact placement and remapping across a furnace, sword, rune block, humanoid, creature, acoustic room, door portal, mana path and runtime mining/combat impact. |
| Document Boundary | Document 23B defines where presentation attaches and how references remain valid. Document 23C defines event, context, parameter and profile-binding logic; Documents 23D-23G define effect and audio authoring. |

## Document Purpose

Document 23A establishes the Presentation Forge as Leyforge's shared sensory communication layer. This document defines the spatial language that lets every later Presentation Forge system attach reliably to the world. It answers where sound begins, where voxel particles spawn, which surface receives residue, which points form a weapon trail, which volume controls ambience, which opening carries sound between rooms, and how those references survive asset revision.

The system must support both fast ordinary work and precise specialist work. A basic stone block should inherit useful centre, face and surface references without manual setup. A sword should expose grip, blade root, blade tip and trail path. A furnace should expose chimney, firebox, gearbox, output, warning and hot-surface regions. A dragon should expose mouth, throat, feet, wing tips, tail path and damage regions. A village blueprint should expose rooms, roads, chimneys, ward boundaries, ambient regions and acoustic portals.

Spatial authoring must not become a second gameplay-logic system. A presentation region may describe where sparks are allowed to appear, but it does not decide machine damage. A body region may describe where corruption glows, but it does not replace combat hurtboxes. A runtime impact anchor may show the exact struck voxel, but combat or block systems remain authoritative about whether that strike occurred.

This document expands the spatial foundation locked in 23A. It does not define the complete Event Contract Registry, Presentation Context Packet, effect graph, sound processor, acoustic mixer or Godot class implementation. Those belong to Documents 23C through 23I.

## Engine and Forge Status Note

Leyforge currently targets Godot with Summer Engine as the AI-native development environment. The spatial system is therefore designed to bake into normal reviewable Godot resources and compact runtime services. Summer Engine may suggest anchors, identify likely semantic features, remap references after edits and produce repair candidates, but authored references remain project data, validation remains deterministic and approval remains human-controlled.

## Design Sources

| Source | Relevant Direction | How 23B Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | The game uses readable voxel terrain, detailed models, animated NPCs, machines, magic and atmosphere. | Spatial references preserve voxel readability while allowing effects and audio to originate from meaningful physical locations. |
| 03 - Blocks Registry | Blocks use a one-metre grid, material families, shapes, states, damage, functional behaviour and magic infrastructure. | Block references include voxel, face, shape-surface, state-region, fluid, automation and magic attachment points. |
| 08 - Automation System | Machines have ports, power, visible flow, state changes, damage, warning and village-supply roles. | Machine templates include inputs, outputs, moving parts, exhausts, warnings, flow paths and state-specific remapping. |
| 09 - Magic System | Mana, runes, wards, conduits, rituals, portals and corruption are physical infrastructure. | Paths, masks, regions and zones support rune glow, mana flow, ward boundaries, ritual layouts, portal planes and corruption spread. |
| 10 - Creatures and Monsters | Creatures should be readable by silhouette, sound, movement, habitat and behaviour. | Entity references support mouth, feet, wings, tails, vocal origins, breath origins, contact points and presentation body regions. |
| 12 - Structures | Structures use block volumes, markers, sockets, rules, variants, states, ownership and dynamic restoration. | Blueprint references support cells, rooms, zones, portals, roads, paths, damage regions and world-space attachment markers. |
| 16 - Combat, Gear and Defence | Combat uses weapons, armour, impacts, parries, projectiles, statuses and persistent aftermath. | Equipment references support grips, edges, trails, projectile origins and runtime contact anchors while combat remains authoritative. |
| 17 - UI/UX System | Complex systems must remain inspectable, controller-ready, accessible and world-first. | Spatial references receive dedicated overlays, filters, naming, diagnostics, selection tools and accessibility-aware previews. |
| 18 - Technical Implementation Plan | Stable IDs, data registries, source/runtime separation, authoritative state, LOD, persistence and validation are foundation rules. | Spatial references use stable semantic IDs, compact baked records, deterministic remapping, runtime lookup and explicit save/multiplayer boundaries. |
| 23A - Presentation Forge Foundation | Presentation uses anchors, sockets, regions, paths, masks, zones, portals and runtime anchors through one shared architecture. | 23B turns those concepts into complete authoring, mapping, inheritance, validation and runtime rules. |

## Static Table of Contents

- 1. Locked Spatial Attachment Identity
- 2. Approved Direction Summary
- 3. Spatial Reference Architecture
- 4. Coordinate Spaces, Transforms and Orientation
- 5. Anchor System
- 6. Socket System
- 7. Exact Voxel, Face, Edge, Vertex and Free-Point Placement
- 8. Surface Masks and Texel-Level Precision
- 9. Regions and Distributed Attachment
- 10. Paths, Boundaries, Routes and Networks
- 11. Zones, Acoustic Volumes and Sound Portals
- 12. Runtime Anchors and Contact Data
- 13. Block, Item, Prop and Machine Integration
- 14. Entity, Rig, Equipment and Animation Integration
- 15. Blueprint, Structure and World Integration
- 16. Templates, Families, Inheritance and Mirroring
- 17. Variants, Damage States, Modular Assets and LOD Remapping
- 18. Attachment Behaviour, Follow Modes and Detachment
- 19. Stable IDs, Ownership, Namespaces and Dependencies
- 20. Spatial Editor Workflow and Visualisation
- 21. Validation, Diagnostics, Repair and Migration
- 22. Baking, Runtime Resolution, Multiplayer and Saving
- 23. Performance, Scalability and Simulation LOD
- 24. Minimum Viable Spatial System and Forest Hamlet Tests
- 25. Balancing Rules and Explicit Non-Goals
- 26. Open Questions for Later Documents
- Appendix A. Spatial Data Templates
- Appendix B. Naming and Semantic Role Catalogue
- Appendix C. Default Reference Families
- Appendix D. Cross-System Spatial Matrix
- Appendix E. Validation and Acceptance Checklist
- Appendix F. Worked Examples

## 1. Locked Spatial Attachment Identity

The Spatial Attachment System is the location, orientation and follow-contract layer of the Presentation Forge. It gives every sound, voxel effect, trail, light, surface layer, ambient zone and related presentation asset a stable answer to the question: where does this belong, what does it follow, and what happens when the source asset changes?

| Locked Rule | Presentation resources must reference semantic spatial identities. Raw scene-node paths, unlabelled coordinates and hand-entered world positions may be used during editing, but they are not approved long-term attachment contracts unless converted into a named spatial reference owned by a stable asset, entity, blueprint or world record. |
| --- | --- |

### 1.1 Spatial Promise

A developer should be able to open any Forge asset and inspect its presentation map. They should see every anchor, socket, region, path, mask, zone and portal; understand which systems use each reference; preview its orientation and fallbacks; and immediately identify broken or approximate mappings.

The same semantic role should remain understandable across families. `socket.vfx.chimney` should mean an exhaust origin whether the owner is a primitive furnace, dwarven forge or mana smelter. `socket.audio.mouth` should remain the vocal origin across humanoids and creatures. `path.vfx.blade_edge` should remain a trail route even when blade length, shape or material changes.

### 1.2 Identity Layers

| Identity Layer | Design Meaning | Creator Result |
| --- | --- | --- |
| Semantic identity | A stable human-readable role such as chimney, mouth, blade tip or ward boundary. | Bindings survive normal asset revision and can be searched, inherited and validated. |
| Physical mapping | The current voxel, face, bone, point, volume or path that fulfils the semantic role. | Each asset variant can map the role to its own geometry. |
| Attachment contract | Follow, orientation, scale, occupancy, detachment and update behaviour. | Audio and VFX behave consistently rather than guessing how to follow the source. |
| Fallback policy | Alternative reference or approximation when the preferred mapping is unavailable. | LODs and damaged variants degrade intentionally instead of failing silently. |
| Ownership and provenance | The asset, template, content pack and revision that define the reference. | Overrides, migrations and dependency reports remain traceable. |
| Runtime representation | Compact baked lookup used by active presentation systems. | Large asset libraries do not require thousands of permanent scene nodes. |

### 1.3 What the Spatial System Is Not

- It is not a replacement for combat hitboxes, navigation areas, collision shapes or automation ports, although it may reference or mirror those authoritative systems.
- It is not permission for presentation graphs to mutate gameplay state.
- It is not a requirement to hand-author every face and voxel on ordinary blocks.
- It is not a guarantee that every reference remains exact at all LODs; controlled approximation is allowed when declared.
- It is not a reason to store raw scene hierarchy paths in content records.
- It is not a global coordinate database for every temporary particle.
- It is not a procedural modelling system, though it may consume procedural model features and generated mappings.

## 2. Approved Direction Summary

| Area | Locked Decision |
| --- | --- |
| Spatial concepts | Use Anchor, Socket, Region, Path, Surface Mask, Zone, Sound Portal and Runtime Anchor as separate data types with shared ownership and transform rules. |
| Semantic IDs | IDs describe role, not current coordinates or model names. Physical mappings may change without changing the semantic ID. |
| Coordinate spaces | Support owner local, voxel grid, voxel local, face local, surface texel, bone local, blueprint grid, zone local and world/event spaces. |
| Orientation | Store explicit local axes or derive them from face normal, path tangent, bone transform, region frame or manual authoring. |
| Scale | Scale inheritance is a policy, not an assumption. Audio positions usually ignore owner scale; VFX may inherit uniform or full scale depending on profile. |
| Exact voxel placement | Support voxel centre, voxel-local offset, face centre, face-local point, edge point, vertex and free local transform. |
| Surface masks | Use stable named weighted masks with optional direction and semantic channels. Raw texel coordinates remain an editing detail. |
| Regions | Support voxel sets, face sets, surface-mask sets, bone/body roles, blueprint cell sets and primitive or authored volumes. |
| Paths | Support ordered point paths, closed boundaries, branching route graphs and references to authoritative networks. |
| Zones | Use bounded volumes with priority, blending, tags and optional entry/exit references for ambience, acoustics, fog, weather and danger presentation. |
| Sound portals | Connect acoustic zones through doors, windows, cave mouths, vents, archways and magical openings. Portal state may be read from authoritative door or structure state. |
| Runtime anchors | Authoritative events may supply position, normal, struck voxel/face, target material, source/target IDs and region hints. |
| Templates | Block families, body plans, machine families, equipment archetypes and blueprint modules may provide default spatial layouts. |
| Mirroring | Paired references use declared mirror planes and handedness rather than duplicated manual coordinates. |
| Variants | Base, culture, equipment, damage and LOD variants map the same semantic roles through explicit remap tables. |
| Fallbacks | References declare exact, approximate, fallback, suppressed and approval-blocking behaviour. |
| Validation | Required mappings, path continuity, non-empty masks, zone/portal connectivity, socket compatibility and LOD coverage are validated before approval. |
| Runtime | Bake compact data; resolve references on demand; update only active attachments; preserve phase and state across LOD transitions. |
| Saves | Save stable owner/reference IDs for persistent effects. Do not save ordinary temporary runtime anchors. |
| MVP | Prove representative exact, regional, path, zone, portal, variant and runtime-contact use cases in the Forest Hamlet slice. |

## 3. Spatial Reference Architecture

### 3.1 Common Spatial Record

Every spatial type shares a common identity and ownership layer.

```text
SpatialReference
{
    spatial_id
    owner_asset_id
    type
    semantic_role
    display_name
    tags[]
    source_template_id?
    local_transform
    coordinate_space
    mapping_mode
    required_status
    approximation_policy
    fallback_reference_id?
    aliases[]
    variant_mappings[]
    lod_mappings[]
    dependency_links[]
    authoring_metadata
    validation_state
}
```

Specialised records add fields appropriate to anchors, sockets, regions, paths, masks, zones, portals or runtime anchors. Common fields must not be copied into unrelated subsystem formats.

### 3.2 Spatial Type Responsibilities

| Type | Primary Question | Typical Uses |
| --- | --- | --- |
| Anchor | Where is a stable point or transform? | Light origin, sound origin, target point, orbit centre, inspection marker. |
| Socket | What may attach here and how does it follow? | Weapon grip, breath origin, chimney VFX, equipment mount, machine warning source. |
| Region | Which distributed area or member set is affected? | Damage glow, sparks across gears, burning roof section, footstep contact area. |
| Path | Along which ordered route does presentation travel? | Blade trails, beams, mana pulses, steam pipes, ward perimeter, tail trails. |
| Surface Mask | Which texels or surface cells on a face are eligible or weighted? | Rune glow, vent opening, crack, blade edge, drip line, emission pattern. |
| Zone | Which bounded volume applies environmental presentation? | Room ambience, fog, rain shelter, underwater, corruption field, boss arena. |
| Sound Portal | How do connected acoustic zones exchange sound? | Doorway, window, cave mouth, chimney, vent, arch or magical portal. |
| Runtime Anchor | Where did an authoritative transient event occur? | Impact point, struck voxel, projectile hit, lightning contact, foot contact. |

### 3.3 Reference Relationships

A spatial reference may be independent or composed from another reference.

```text
owner asset
    -> part or bone
        -> anchor/socket
            -> local offset
                -> effect or sound binding

owner blueprint
    -> zone
        -> sound portal
            -> linked zone

owner weapon
    -> path
        -> root anchor
        -> intermediate points
        -> tip anchor
```

A child reference stores the semantic parent relationship, not an unstable scene-node path. Baking resolves the final hierarchy into compact transforms and lookup indices.

### 3.4 Mapping Modes

| Mapping Mode | Meaning | Best Use |
| --- | --- | --- |
| Coordinate-bound | Fixed to explicit owner-local or voxel coordinates. | Simple blocks, static props, exact design points. |
| Feature-bound | Attached to a named part, surface feature or generated semantic feature. | Chimneys, vents, rune centres, crystal tips. |
| Bone-bound | Follows a rig bone or body role. | Mouth, hands, feet, wings, tail segments. |
| Region-bound | Resolves from a region centre, boundary, random member or weighted distribution. | Damage sparks, fire spread, ambient motes. |
| Path-bound | Resolves from a point, tangent, percentage or branch on a path. | Trails, beams, network flows. |
| Network-bound | References an authoritative automation, fluid, power or mana network route. | Conduit flow, pipe steam, item movement presentation. |
| Blueprint-bound | Attached to a blueprint cell, module, marker, room or construction stage. | Doors, chimneys, room ambience, scaffolds. |
| Runtime-event-bound | Supplied temporarily by an authoritative event. | Combat impact, mining strike, falling debris contact. |

## 4. Coordinate Spaces, Transforms and Orientation

Spatial references must declare the coordinate space in which their mapping is authored. Silent conversion between spaces is not permitted.

### 4.1 Supported Coordinate Spaces

| Coordinate Space | Unit and Origin | Example |
| --- | --- | --- |
| Owner local | Owner-defined local units from its pivot. | Free point inside a machine housing. |
| Voxel grid | Integer voxel indices within an asset volume. | Voxel `[14, 9, 22]`. |
| Voxel local | Normalised or sub-voxel offset inside one voxel. | Centre, corner, or `[0.5, 0.75, 1.0]`. |
| Face local | Two-dimensional coordinates on a selected voxel face. | Drip origin on the underside of a block. |
| Surface texel | Integer coordinates inside the canonical surface texture or mask. | Rune pixel `[19, 7]` on a 32 x 32 face. |
| Bone local | Transform relative to a named bone or semantic body role. | Mouth origin relative to head/jaw. |
| Blueprint grid | Cell or module coordinates inside a structure blueprint. | Forge chimney cell or ward corner. |
| Zone local | Position relative to a zone volume. | Ambient emitter inside a workshop zone. |
| World/event | World transform supplied by runtime authority. | Exact projectile impact point. |

### 4.2 Canonical Axes

The Forge uses one canonical local orientation for authoring previews and baked metadata:

- `+X` = right.
- `+Y` = up.
- `-Z` = forward.
- Face normals and path tangents provide forward direction when available.
- Owner importers must convert source formats into the canonical orientation before approval.

Document 23I may define exact Godot resource and transform classes, but content records must already use one consistent axis convention.

### 4.3 Transform Components

Each point-like reference may store:

- Position.
- Rotation or basis.
- Optional scale metadata.
- Forward axis.
- Up axis.
- Normal when surface-bound.
- Parent reference.
- Local offset.
- Preview size and gizmo type.

### 4.4 Orientation Sources

| Source | Orientation Rule |
| --- | --- |
| Voxel face | Forward aligns to outward face normal; up uses owner up unless manually rotated. |
| Edge | Forward may align with edge tangent; secondary axis derives from adjacent face or manual choice. |
| Vertex | No natural single normal; author chooses averaged normal, one adjacent face or manual basis. |
| Bone | Inherits bone basis with configurable axis remap. |
| Path | Forward aligns to tangent; up uses path frame, owner up or supplied roll. |
| Region | Uses authored region frame, owner basis or best-fit orientation when generated. |
| Runtime contact | Forward aligns to supplied normal; event may also provide incoming direction. |

### 4.5 Scale Policies

| Policy | Behaviour | Typical Use |
| --- | --- | --- |
| Ignore owner scale | Position follows owner, but authored size remains world-consistent. | Most audio emitters and UI markers. |
| Uniform scale only | Uses one uniform factor and rejects non-uniform distortion. | Voxel particle clusters and lights. |
| Full scale | Inherits all owner scale axes. | Some attached meshes or zone volumes. |
| Position scale only | Offset scales, child presentation size does not. | Mouth or chimney origin on size variants. |
| Profile-controlled | Presentation profile decides based on channel. | Shared anchor used by sound, VFX and light. |

Non-uniform scale must be validated because it can distort voxel cells, attenuation radii, zones and path sampling.

### 4.6 Precision and Quantisation

Editable source preserves the precision required by the owner asset. Baked products may quantise positions, rotations and mask weights within tested error bounds. Exact voxel and texel identities must remain recoverable for editor round-tripping, migration and persistent surface records.

## 5. Anchor System

An Anchor is a persistent named point or transform. It may act as an origin, target, pivot, centre, orientation reference, orbit point, inspection location or fallback.

### 5.1 Anchor Fields

```text
AnchorDefinition
{
    spatial_id
    semantic_role
    transform_mapping
    orientation_source
    scale_policy
    follow_policy
    required_status
    fallback_anchor_id?
    approximation_policy
    supported_binding_types[]
    mirror_partner_id?
    preview_gizmo
}
```

### 5.2 Anchor Roles

| Role Family | Examples |
| --- | --- |
| Audio | `anchor.audio.origin`, `anchor.audio.chest`, `anchor.audio.machine_body`. |
| VFX | `anchor.vfx.ember_origin`, `anchor.vfx.mana_core`, `anchor.vfx.damage_focus`. |
| Light | `anchor.light.lantern`, `anchor.light.firebox`, `anchor.light.rune_core`. |
| Targeting presentation | `anchor.presentation.look_target`, `anchor.presentation.orbit_centre`. |
| Surface | `anchor.surface.rune_centre`, `anchor.surface.drip_origin`. |
| Blueprint | `anchor.blueprint.room_centre`, `anchor.blueprint.project_focus`. |
| Fallback | `anchor.fallback.asset_centre`, `anchor.fallback.part_centre`. |

### 5.3 Required Status

| Status | Rule |
| --- | --- |
| Required exact | Approval fails if an exact mapping is absent. |
| Required approximate | Mapping may degrade to declared approximation but cannot disappear. |
| Optional | Binding may be skipped when unavailable. |
| Editor-only | Used for authoring, preview or diagnostics and removed from runtime bake. |
| Runtime-generated | Declared as a semantic role but created from event or procedural data. |

### 5.4 Anchor Families

Common assets should inherit anchor families:

- Basic block centre and face anchors.
- Placeable light source anchors.
- Container open/close and interaction anchors.
- Machine body, input, output, gearbox, chimney, warning and core anchors.
- Humanoid head, chest, hands, feet and equipment anchors.
- Quadruped head, mouth, feet, back and tail-root anchors.
- Flying creature wing-tip and flight-centre anchors.
- Weapon grip, secondary grip, blade root, tip and projectile origin anchors.

### 5.5 Anchor Fallback Chains

A fallback chain may move from exact to approximate:

```text
socket.vfx.breath_origin
-> anchor.body.mouth_centre
-> anchor.body.head_centre
-> anchor.fallback.entity_centre
-> suppress non-critical effect
```

Fallbacks must be acyclic, visible in the editor and tested at every required variant and LOD.

## 6. Socket System

A Socket is an Anchor with an attachment contract. It defines what may attach, how the child aligns, whether the slot may be occupied, and how the relationship behaves during animation, equipment changes, damage and LOD transitions.

### 6.1 Socket Fields

```text
SocketDefinition
{
    spatial_id
    anchor_mapping
    socket_role
    allowed_child_tags[]
    denied_child_tags[]
    occupancy_mode
    snap_basis
    scale_policy
    follow_mode
    detach_policy
    mirror_partner_id?
    compatibility_version
}
```

### 6.2 Occupancy Modes

| Mode | Meaning | Example |
| --- | --- | --- |
| Single exclusive | Only one child may occupy the socket. | Primary weapon grip. |
| Multi layered | Multiple presentation children may coexist. | Chimney smoke, embers and heat light. |
| Ordered slots | Children occupy deterministic sub-slots. | Several belt pouches or machine indicators. |
| Runtime ephemeral | Temporary attachment exists only for an event. | Cast flash or impact spark. |
| Reference only | Used as an origin/target but does not parent a persistent child. | Projectile release point. |

### 6.3 Socket Compatibility

Compatibility uses semantic tags and versioned contracts rather than model names.

```text
socket.weapon.primary_hand
allowed: equipment.weapon.one_hand, equipment.tool.one_hand
requires: child.socket.grip.primary
forbids: equipment.weapon.two_hand_without_secondary
```

Presentation sockets may reuse gameplay equipment sockets when the contract is stable, but the Presentation Forge should not silently redefine equipment rules.

### 6.4 Child Alignment

A child may define its own matching socket. The attachment resolver aligns parent and child socket transforms, applies offsets, and validates handedness. This supports weapons, shields, backpacks, mounted lanterns, machine upgrades and magical foci.

### 6.5 Presentation-Only Sockets

Some sockets exist purely for presentation:

- `socket.vfx.spark_origin`.
- `socket.audio.gearbox`.
- `socket.light.warning`.
- `socket.vfx.breath_origin`.
- `socket.vfx.projectile_trail`.
- `socket.audio.portal_core`.

These do not imply an inventory slot, equipment permission or gameplay interaction.

## 7. Exact Voxel, Face, Edge, Vertex and Free-Point Placement

### 7.1 Voxel-Centre Mapping

A voxel-centre mapping stores the owner voxel coordinate and resolves to its centre. It is stable while that voxel exists and remains in the same semantic part.

```text
mapping_mode: voxel_centre
voxel: [14, 9, 22]
```

Use cases include crystal cores, internal machine sound origins and single-cell lights.

### 7.2 Voxel-Local Mapping

A voxel-local mapping adds a normalised offset inside the selected voxel.

```text
mapping_mode: voxel_local
voxel: [14, 9, 22]
local: [0.50, 0.75, 1.00]
```

This allows a flame to begin at the top of a torch voxel or a drip to start near one corner.

### 7.3 Face Mapping

A face mapping stores:

- Voxel coordinate.
- Face direction.
- Face-local two-dimensional position.
- Outward normal.
- Optional tangent rotation.
- Shape-surface identifier for non-cube blocks.

Face mappings are preferred for decals, residue, drips, vent emissions, rune projections and contact presentation.

### 7.4 Edge Mapping

An edge mapping stores the owning voxel, one of its canonical edges and an interpolation value along the edge. It supports blade edges, seams, roof ridges, pipe joints and crack lines.

### 7.5 Vertex Mapping

A vertex mapping stores a canonical voxel corner. Because a corner may belong to several voxels, the owner and adjacency policy must be explicit. Use cases include horn tips, crystal tips, antenna points and exact spark corners.

### 7.6 Free Local Transform

A free local transform may exist anywhere inside or around the owner's local bounds. It is required for hollow-space centres, portal centres, acoustic emitters, camera targets and orbit centres that do not lie on a voxel.

Free points should still bind to a semantic part or parent reference when possible. Completely unparented coordinates are more fragile and require stronger validation after model edits.

### 7.7 Shape-Aware Placement

Slabs, stairs, slopes, arches, beams and other non-full-cube forms require shape-surface metadata. The editor should show actual collision/render surface options rather than assuming six complete cube faces. A placement may bind to:

- Named shape surface.
- Generated surface triangle group.
- Voxel face plus shape clipping rule.
- Material surface region.

The runtime reference remains semantic and voxel-readable even if the baked renderer uses merged geometry.

### 7.8 Deletion and Topology Changes

When the referenced voxel or feature is removed, the reference enters an orphaned state. It must not silently jump to an unrelated nearby voxel. Repair options are:

1. Rebind to the nearest compatible semantic feature.
2. Rebind to the same named part.
3. Use declared fallback.
4. Mark approximate.
5. Suppress optional binding.
6. Block approval for required exact references.

## 8. Surface Masks and Texel-Level Precision

Surface Masks provide stable named selections over a voxel face, material surface or canonical texture. They are the preferred link between texture authoring and presentation placement.

### 8.1 Mask Capabilities

A mask may represent:

- One exact texel.
- A weighted point cluster.
- A line or edge.
- An irregular painted area.
- Multiple disconnected islands.
- A gradient or probability field.
- A directional flow field.
- An inclusion/exclusion set.
- Separate channels for audio, VFX, light or persistent surface use.

### 8.2 Mask Data

```text
SurfaceMaskDefinition
{
    spatial_id
    owner_surface_id
    resolution
    weight_channel
    direction_channel?
    exclusion_channel?
    semantic_role
    sampling_mode
    orientation_rule
    remap_policy
    empty_mask_policy
}
```

### 8.3 Sampling Modes

| Mode | Behaviour |
| --- | --- |
| Centre of weight | Returns one stable weighted centre. |
| Random weighted | Chooses eligible texels by weight and deterministic seed. |
| Even distribution | Spreads samples across mask coverage. |
| Boundary | Samples the mask outline. |
| Directional | Uses stored direction vectors for flow or emission. |
| Highest/lowest | Selects extreme eligible points in local space. |
| All active | Applies a persistent layer to every eligible texel or surface cell. |

### 8.4 Mask Examples

| Mask ID | Owner | Use |
| --- | --- | --- |
| `mask.surface.rune_glow` | Rune block face | Mana light, pulses and corruption replacement. |
| `mask.surface.vent_opening` | Machine panel | Smoke, steam and sound-origin distribution. |
| `mask.surface.blade_edge` | Sword texture/model surface | Trail intensity and enchantment glow. |
| `mask.surface.crack_area` | Damage texture state | Sparks, leaks, soot and repair highlight. |
| `mask.surface.drip_line` | Roof or pipe underside | Water-drip spawn locations. |
| `mask.surface.eye_emission` | Creature or statue face | Eye glow and gaze effect origin. |

### 8.5 Texture Revision and Remapping

When a 32 x 32 texture is repainted, the named mask remains a separate semantic resource. The editor may overlay it during painting. If texture dimensions, UV orientation or face rotation change, the remapper must preserve, resample or explicitly invalidate the mask according to policy.

Raw pixel coordinate references are allowed only as a view into the mask data. Bindings should reference `mask.surface.rune_glow`, not pixel `[19, 7]` directly.

### 8.6 Mask Validation

Validation checks:

- Non-empty required masks.
- Resolution and face-orientation compatibility.
- Weight range and normalisation.
- Direction vectors where required.
- No samples outside valid shape surfaces.
- LOD fallback to a point, region or simplified mask.
- Content-pack overrides provide compatible semantic roles.

## 9. Regions and Distributed Attachment

A Region is a named set or volume used when presentation belongs across an area rather than at one point.

### 9.1 Region Forms

| Region Form | Representation | Example |
| --- | --- | --- |
| Voxel set | Explicit or compressed set of voxel coordinates. | Furnace firebox, crystal cluster, damaged roof section. |
| Face set | Selected voxel faces or shape surfaces. | Wet wall exterior, scorchable floor, moss area. |
| Mask set | One or more Surface Masks. | Rune network, painted damage zones. |
| Bone/body role set | Bones, body parts or authored body volume. | Left wing, throat, corrupted spine. |
| Primitive volume | Box, sphere, capsule, cylinder or oriented bounds. | Ambient glow volume, smoke space. |
| Blueprint cell set | Cells, modules, floors or room members. | Workshop interior, warded perimeter. |
| Procedural selector | Rule such as material tag, exposed face or highest voxels. | Snow coverage, hot metal surfaces, exposed crystals. |

### 9.2 Region Sampling

A binding may request:

- Region centre.
- Random member.
- Weighted member.
- Boundary member.
- Exposed faces only.
- Highest or lowest point.
- Points matching a material tag.
- Newly damaged or newly repaired members.
- Deterministic sequence across members.

### 9.3 Dynamic Regions

Some regions change with runtime state:

- Burning voxels.
- Damaged machine sections.
- Corrupted body parts.
- Wet roof faces.
- Active runes.
- Construction stage cells.
- Powered conduit segments.

The authoritative system owns membership changes. Presentation receives a region snapshot, delta or semantic query result.

### 9.4 Region Priority and Overlap

Regions may overlap. Each binding declares whether overlap is additive, exclusive, priority-based or mask-multiplied. For example, a voxel may be inside both `region.machine.hot` and `region.machine.damaged`; sparks and heat haze may coexist, while two mutually exclusive surface replacements may require priority.

### 9.5 Region Persistence

Authored regions belong to asset definitions. Runtime regions may be reconstructed from saved world state. Persistent surface effects should store compact affected-face or region references, not duplicate whole voxel models.

## 10. Paths, Boundaries, Routes and Networks

A Path is an ordered semantic route used by trails, beams, flows, boundaries and moving presentation.

### 10.1 Path Types

| Path Type | Meaning | Example |
| --- | --- | --- |
| Open ordered path | Start-to-end point sequence. | Blade edge, tail trail, projectile trail. |
| Closed boundary | Loop enclosing an area. | Ward perimeter, ritual circle, portal frame. |
| Branching route graph | Nodes and directed branches. | Mana conduit network, pipes, roads. |
| Bone chain | Ordered bones or body roles. | Spine corruption, tail electricity. |
| Surface path | Route painted or selected across faces/masks. | Rune line, crack propagation. |
| Authoritative network reference | Semantic link to gameplay-owned route. | Active item flow, power, fluid or mana network. |

### 10.2 Path Data

```text
PathDefinition
{
    spatial_id
    path_type
    nodes[]
    segments[]
    closed
    direction_policy
    width_profile
    up_policy
    branch_rules?
    source_network_id?
    sampling_profile
    lod_profile
    fallback_path_id?
}
```

### 10.3 Path Nodes

Path nodes should have stable local IDs so a developer can bind a special effect to a junction, corner or endpoint. Nodes may reference anchors, sockets, voxels, bones or free transforms.

### 10.4 Interpolation and Voxel Style

The semantic path may interpolate linearly or smoothly for placement and timing, but approved VFX geometry remains voxel-based. A smooth mathematical path can be sampled into stepped cuboid segments, voxel clusters or discrete pulses without using a conventional smooth ribbon as the source effect.

### 10.5 Direction and Flow

Paths declare direction or allow bidirectional flow. Runtime context may specify active direction, speed, pressure, mana ratio or occupancy. Presentation can then move pulses or sound emphasis along the path without owning the underlying network transaction.

### 10.6 Branching Networks

Branching route graphs support:

- Junction IDs.
- Directional edges.
- Enabled/disabled segments.
- Per-segment material and state.
- Source/sink roles.
- Priority and filter tags.
- Runtime active-route subsets.

A mana network may use the same route graph for visual pulses and spatial hum distribution while the Magic or Automation System remains authoritative.

### 10.7 Path Fallbacks

LOD may reduce a detailed path to:

1. Full sampled route.
2. Key junctions and endpoints.
3. One line between source and sink.
4. Source-only pulse or grouped network indicator.
5. Hidden decorative presentation while critical warning remains.

## 11. Zones, Acoustic Volumes and Sound Portals

A Zone is a bounded spatial volume that applies presentation context to listeners, emitters, surfaces or effects. Zones are particularly important for ambience, acoustics, weather shelter, fog, underwater presentation, corruption and boss arenas.

### 11.1 Zone Fields

```text
ZoneDefinition
{
    spatial_id
    shape
    local_transform
    priority
    blend_distance
    tags[]
    environment_profile_id?
    acoustic_profile_id?
    ambience_profile_id?
    vfx_volume_profile_id?
    state_source_id?
    entry_anchor_id?
    exit_anchor_id?
    lod_policy
}
```

### 11.2 Zone Shapes

- Axis-aligned box.
- Oriented box.
- Sphere.
- Capsule.
- Cylinder.
- Voxel-cell volume.
- Blueprint room volume.
- Authored convex volume.
- Region-derived bounds.

Complex volumes should be decomposed into bounded primitives or voxel-cell sets rather than relying on unconstrained runtime geometry.

### 11.3 Zone Blending

When zones overlap, resolution uses priority, tags and blend distance. Examples:

- A small forge interior overrides the broader village ambience.
- An underwater zone strongly replaces open-air acoustics.
- A corruption field layers over forest ambience rather than replacing every sound.
- A boss arena activates a critical mix and VFX volume while combat is active.

### 11.4 Acoustic Zones

Acoustic zones describe bounded environmental response:

- Approximate room size.
- Enclosure.
- Dominant surface materials.
- Reverberation profile.
- Damping.
- Obstruction class.
- Sound leakage.
- Exterior exposure.

Blueprint Forge may generate first-pass values from voxel rooms, but a developer can review and override them.

### 11.5 Sound Portals

A Sound Portal connects two acoustic zones or one zone to the exterior.

```text
SoundPortalDefinition
{
    spatial_id
    zone_a_id
    zone_b_id
    opening_shape
    local_transform
    area
    transmission_profile
    obstruction_state_source?
    open_fraction_parameter?
    one_way_policy
    fallback_policy
}
```

Examples include doors, windows, archways, cave mouths, vents, chimneys and magical portals.

### 11.6 Portal State

A portal may read authoritative state:

- Door open/closed fraction.
- Window broken/intact.
- Gate raised/lowered.
- Cave collapse status.
- Vent powered/off.
- Magical portal active/inactive.

Presentation uses the state to alter transmission; it does not change the door or portal state.

### 11.7 Zone and Portal Validation

Validation detects:

- Portal references to missing zones.
- Portals outside both connected volumes.
- Duplicate or contradictory links.
- Zones with no entry path when required.
- Unbounded high-cost overlaps.
- Missing exterior fallback.
- Incorrect scale or orientation.
- LOD policies that remove critical warning zones.

## 12. Runtime Anchors and Contact Data

Runtime Anchors represent temporary authoritative locations created by gameplay events. They are essential for impacts, contacts, projectiles, lightning, footsteps, collapsing blocks and dynamic interactions.

### 12.1 Runtime Anchor Packet

```text
RuntimeAnchor
{
    runtime_anchor_id
    event_instance_id
    world_transform
    surface_normal?
    incoming_direction?
    source_entity_id?
    target_entity_id?
    source_spatial_id?
    target_spatial_id?
    struck_voxel?
    struck_face?
    target_material_id?
    target_region_id?
    local_target_transform?
    lifetime
    persistence_conversion_policy
}
```

### 12.2 Typical Runtime Sources

| Authoritative Source | Runtime Anchor Use |
| --- | --- |
| Combat | Melee impact, parry contact, projectile hit, armour strike. |
| Block interaction | Mining contact, placement face, break point, repair point. |
| Movement | Foot contact, landing, slide, wheel contact, hoof strike. |
| Weather | Rain contact, hail strike, lightning contact, snow accumulation sample. |
| Fluids | Splash entry, outlet point, leak contact, waterfall collision. |
| Magic | Spell impact, beam contact, ward breach, portal arrival. |
| Destruction | Falling debris impact, collapse origin, fracture contact. |

### 12.3 Event Snapshot Rule

Runtime anchors are snapshots. They do not automatically follow a target after the event unless the event explicitly supplies a follow reference. A sword impact spark may remain at the world contact point, while a curse mark may convert to a target-local surface reference and follow the entity.

### 12.4 Conversion to Persistent Presentation

Temporary events may create persistent residues only through a declared conversion:

```text
runtime impact
-> resolve target owner and local face
-> create surface-state record
-> store owner ID + semantic face/mask/region + intensity + expiry
```

The system must not save arbitrary world transforms when a stable local reference is available.

### 12.5 Network and Replay Rules

Authoritative events replicate the minimum context required to reconstruct presentation. Decorative variation may use deterministic seeds or local variation according to Document 23C. Runtime anchors include event instance IDs so replay, late packet rejection and duplicate suppression remain possible.

## 13. Block, Item, Prop and Machine Integration

### 13.1 Standard Block Reference Family

Ordinary full-cube blocks inherit:

- Asset centre anchor.
- Six face-centre anchors.
- Six face regions.
- Top, bottom and side semantic aliases.
- Placement reference.
- Break/debris region.
- Footstep/contact surface role.
- Optional material-driven Surface Masks.

These references may be generated rather than hand-authored.

### 13.2 Shaped Blocks

Slabs, stairs, slopes, beams, posts, arches and furniture use shape-aware surface groups. Generated references should include:

- Exposed shape surfaces.
- Walkable contact surface.
- Support/attachment surfaces.
- Interaction face.
- Visual centre and bounds centre.
- Shape-specific drip, snow and residue regions.

### 13.3 Items and Equipment

Recommended item references:

| Item Type | Default References |
| --- | --- |
| One-handed tool | Primary grip, tool head, impact point, trail root/tip where relevant. |
| Two-handed tool | Primary and secondary grips, head, impact point, handle path. |
| Sword | Primary grip, guard, blade root, blade tip, blade-edge path, enchantment region. |
| Bow | Grip, string hand, string path, arrow rest, projectile origin. |
| Staff/wand | Grip, focus tip, casting origin, rune region, trail path. |
| Shield | Grip, block centre, rim region, impact region. |
| Projectile | Origin alignment, trail origin, body region, impact orientation. |
| Consumable | Grip, mouth/use target, pour or release origin. |

### 13.4 Props and Containers

Props may define interaction anchors, lid/door sockets, hinge paths, content regions, break regions and ambient sound origins. A chest opening sound should follow the chest body, while a coin sparkle may sample the content region.

### 13.5 Machines

Recommended machine family:

```text
anchor.audio.machine_body
socket.audio.gearbox
socket.audio.output
socket.audio.warning
socket.vfx.chimney
socket.vfx.steam_valve
socket.vfx.spark_origin
socket.vfx.mana_core
anchor.light.firebox
region.machine.hot_surface
region.machine.moving_parts
region.machine.damageable_presentation
path.vfx.item_flow
path.vfx.power_flow
path.vfx.mana_flow
```

### 13.6 Automation Ports

Presentation may reference authoritative input/output/power/fluid/mana ports by stable port ID. It may derive a display anchor from the port transform, but it cannot redefine direction, filter rules, throughput or ownership.

### 13.7 Damage and Repair

Damage states may:

- Disable an exact socket.
- Move an exhaust origin.
- Expose a new leak region.
- Replace a clean Surface Mask with a crack mask.
- Add rubble or spark regions.
- Redirect sound to a damaged component.

Repair states restore or remap references through declared state transitions.

## 14. Entity, Rig, Equipment and Animation Integration

### 14.1 Body-Plan Templates

Body plans provide semantic roles independent of exact skeleton names.

| Body Plan | Example Roles |
| --- | --- |
| Humanoid | Head, mouth, chest, pelvis, hands, feet, back, shoulders, equipment slots. |
| Quadruped | Head, mouth, chest, four feet, back, tail root/tip. |
| Winged biped | Humanoid roles plus wing roots/tips and flight centre. |
| Serpentine | Head, mouth, body segments, tail tip, underside contact path. |
| Arachnid | Head, abdomen, leg contacts, venom origin, web origin. |
| Floating/spirit | Core, orbit centre, upper/lower points, aura region, trail path. |
| Construct/golem | Core, joints, tool mounts, feet, exhaust, rune regions. |

### 14.2 Bone and Body-Role Mapping

A semantic role maps to one or more bones, voxels or regions. The rig may use `Jaw_03`, but presentation references `socket.audio.mouth`. Replacement rigs map the semantic role to their own bone names.

### 14.3 Contact References

Feet, hooves, claws, wheels and body contacts should expose:

- Contact socket.
- Contact region.
- Ground-facing normal policy.
- Movement role.
- Mirror partner.
- Runtime material query origin.

Animation events identify timing; runtime movement or collision systems confirm the authoritative contact when required.

### 14.4 Weapon and Equipment Composition

Equipment attachments combine parent and child sockets. A sword's grip socket aligns to a hand equipment socket. The sword retains its own blade path, impact point and enchantment regions after attachment.

Modular armour may add presentation regions or override body mappings. A helmet can redirect muffled voice origin, add eye-glow masks or hide hair-related references without changing the base humanoid template.

### 14.5 Creature Abilities

Recommended creature ability references:

- Breath charge region.
- Breath release socket.
- Mouth audio socket.
- Eye emission masks.
- Wing-tip paths.
- Tail path.
- Claw and bite contact points.
- Ground-pound contact region.
- Boss core region.
- Phase-specific weak-point presentation region.

The ability system owns activation, damage and targeting. Presentation consumes event timing and spatial roles.

### 14.6 Animation Follow

Anchors and sockets bound to bones follow animated transforms. Path definitions may use sampled bone chains or live endpoints. The system must avoid baking permanent world positions for animated references.

### 14.7 Voxel-Frame and Model-Swap Animation

When animation swaps voxel frames or model variants, semantic mappings may change per frame. The author may define:

- Shared mapping valid across all frames.
- Per-frame remap.
- Feature-follow remap.
- Fallback during missing frames.
- Suppression for brief hidden states.

Validation checks required references across every approved frame sequence.

## 15. Blueprint, Structure and World Integration

### 15.1 Blueprint Spatial Layers

Blueprint Forge should expose dedicated presentation layers:

- Point anchors and sockets.
- VFX emitter markers.
- Audio emitter markers.
- Ambient regions.
- Acoustic zones.
- Sound portals.
- Surface regions.
- Presentation paths.
- Ward and ritual boundaries.
- Construction and damage regions.
- World-event focus points.

### 15.2 Cell and Module References

A blueprint reference may bind to:

- Exact cell.
- Block face within a cell.
- Named module.
- Room.
- Floor.
- Roof section.
- Door/window opening.
- Road or route segment.
- Structure centre or entrance.

Material substitution and culture variants should not invalidate semantic module roles.

### 15.3 Construction Stages

A staged project can expose stage-specific mappings:

| Stage | Example Presentation References |
| --- | --- |
| Foundation | Dig region, placement points, dust region, hammer contacts. |
| Frame | Beam path, scaffold sockets, worker zones. |
| Walls | Active wall region, mortar dust, placement faces. |
| Roof | Roof surface region, tile placement points, rain-shelter zone. |
| Functional completion | Chimney, door portals, machine sockets, ward boundary. |
| Damaged | Collapse region, smoke points, blocked portals, repair zones. |

### 15.4 Roads and World Paths

Roads, rails, rivers and conduits may expose semantic paths generated from world data. Presentation may use them for wheel sound clustering, dust, mana pulses, ambient travel cues and route warnings.

### 15.5 Ambient and Ecology Regions

Biomes and structures may define regions for:

- Forest insects and leaves.
- Cave drips and echoes.
- Village market ambience.
- Farm dust and pollen.
- Goblin camp smoke and noise.
- Mana-rich motes.
- Corruption haze.

Worldgen may instantiate templates with deterministic placement and stable region IDs.

### 15.6 Structure Variants

Culture, damage, restoration, occupation and corruption variants keep semantic room, door, chimney and route IDs where possible. A ruined structure may close or remove portals, disable rooms and remap ambience without requiring every binding to be recreated.

## 16. Templates, Families, Inheritance and Mirroring

### 16.1 Spatial Templates

Templates reduce repetitive setup. A template may define semantic references, default mapping rules, required status, aliases and validation requirements.

Examples:

- `template.spatial.block.full_cube`.
- `template.spatial.machine.furnace`.
- `template.spatial.entity.humanoid`.
- `template.spatial.entity.quadruped`.
- `template.spatial.weapon.sword`.
- `template.spatial.blueprint.roomed_building`.
- `template.spatial.magic.ward_network`.

### 16.2 Inheritance Rules

A child asset may:

- Inherit mapping unchanged.
- Override physical mapping while retaining semantic ID.
- Add new references.
- Suppress optional references.
- Change required status only with review.
- Replace fallback chain.
- Extend regions and paths.
- Override LOD mappings.

Deleting an inherited required reference requires an explicit incompatibility decision and migration note.

### 16.3 Mirroring

Mirroring uses a declared plane and handedness. A mirror relationship stores:

- Mirror partner ID.
- Mirror plane.
- Whether orientation flips.
- Axis correction.
- Naming rule.
- Independent-override flag.

Typical pairs include left/right hands, feet, wings, eyes, shoulders and weapon trails.

### 16.4 Symmetry With Exceptions

Mirrored references may diverge. A damaged left wing can override `socket.vfx.wing_left_tip` without changing the right side. The editor should show whether a pair remains linked, has a local offset override or is fully independent.

### 16.5 Aliases

Aliases let systems request a broad role:

```text
anchor.contact.primary
-> socket.foot.left for current event
-> socket.hoof.front_left for quadruped
-> socket.wheel.front_left for cart
```

Aliases are resolved by context and owner template. They must not become ambiguous hidden magic; the resolution path is inspectable.

## 17. Variants, Damage States, Modular Assets and LOD Remapping

### 17.1 Variant Mapping Table

```text
Semantic role: socket.vfx.chimney
base furnace        -> voxel face A
stone furnace       -> chimney module socket
mana furnace        -> arcane exhaust socket
corrupted furnace   -> split exhaust region
medium LOD          -> top-centre anchor
far LOD             -> machine-centre approximation
```

### 17.2 Mapping Quality Levels

| Level | Meaning |
| --- | --- |
| Exact | Preserves intended feature and orientation. |
| Equivalent | Different geometry fulfils the same semantic role with no meaningful loss. |
| Approximate | Uses a nearby part, centre or reduced representation. |
| Fallback | Uses a generic parent or asset-level reference. |
| Suppressed | Optional presentation does not play. |
| Invalid | Required role is missing and approval fails. |

### 17.3 Damage-State Remapping

Damage may move, split or remove references. The asset defines per-state rules:

- Keep original mapping.
- Follow damaged part.
- Move to exposed interior.
- Split into multiple region samples.
- Redirect to fallback.
- Suppress because the component is gone.
- Create new leak, spark or rubble references.

### 17.4 Modular Composition

Modular assets may obtain references from installed modules. The composed owner exposes a merged semantic map with namespaces and priorities.

Example:

```text
machine.base: anchor.audio.machine_body
module.chimney: socket.vfx.chimney
module.mana_core: socket.vfx.mana_core
module.warning_bell: socket.audio.warning
```

Removing a module invalidates or falls back only the roles supplied by that module.

### 17.5 LOD Remapping

Each required spatial role declares mappings for supported LOD bands. Exact voxels may collapse to part centres or asset centres. The LOD transition should preserve event phase and avoid visibly jumping attached effects where possible.

### 17.6 Replacement Assets and Content Packs

An override asset is compatible when it supplies all required semantic references or approved fallbacks. The compatibility report compares:

- Required IDs.
- Type compatibility.
- Orientation.
- scale policy.
- path/region capabilities.
- zone and portal links.
- LOD coverage.
- binding dependencies.

## 18. Attachment Behaviour, Follow Modes and Detachment

### 18.1 Follow Modes

| Mode | Behaviour | Example |
| --- | --- | --- |
| Rigid follow | Position and rotation follow parent every update. | Mouth flame origin. |
| Position only | Position follows; orientation remains world or effect controlled. | Some ambient hum emitters. |
| Rotation only | Orientation follows; position is externally controlled. | Rare targeting indicators. |
| Surface aligned | Follows surface and normal. | Rune glow, wetness, scorch. |
| Bone follow | Uses live bone transform. | Footstep contact socket. |
| Path follow | Moves by path distance or parameter. | Mana pulse. |
| Target facing | Anchor points toward a supplied target. | Beam origin or eye gaze. |
| Event snapshot | Captures transform once and stops following. | Impact spark. |
| World transfer | Begins attached, then becomes world-space. | Falling ember or detached debris. |
| Region resample | Periodically chooses points in a region. | Smoke leaks across damage area. |

### 18.2 Update Modes

- Every rendered frame for high-priority close attachments.
- Physics tick for contact-linked presentation.
- Fixed presentation tick for ordinary machines and ambience.
- Transform-change notification for static owners.
- Event-only snapshot.
- Virtualised phase update with no active transform node.

### 18.3 Detachment Policies

When parent, socket or mapping disappears:

| Policy | Result |
| --- | --- |
| Stop immediately | Critical for invalid impossible attachment. |
| Fade | Audio/VFX fades over authored duration. |
| Linger in world | Smoke, debris or sound tail completes at last transform. |
| Transfer to fallback | Rebinds to declared parent or asset anchor. |
| Transfer to world physics | Detached debris becomes a world presentation object. |
| Rebind after remap | Waits for short model-swap transition and follows new mapping. |
| Preserve phase virtually | Loop continues logically and resumes when mapping returns. |

### 18.4 Parent Death or Unload

Entity death, chunk unload and LOD demotion use explicit policies. Important tails may finish; ordinary loops virtualise or stop; persistent residues convert to saved local/world records; critical warnings must not continue after the authoritative state ends.

### 18.5 Origin and Target Pairs

Beams, tethers and directional sound may use two references:

- Origin anchor/socket.
- Target anchor/runtime anchor.
- Optional intermediate path.
- Break/fallback policy when either endpoint disappears.

## 19. Stable IDs, Ownership, Namespaces and Dependencies

### 19.1 Ownership Rule

A spatial ID is unique within its owner. A complete reference uses:

```text
owner_asset_id + spatial_id
```

This avoids forcing every foot socket in the game into one global record while preserving stable semantic names.

### 19.2 Recommended ID Prefixes

| Type | Prefix | Example |
| --- | --- | --- |
| Anchor | `anchor.` | `anchor.audio.machine_body` |
| Socket | `socket.` | `socket.vfx.chimney` |
| Region | `region.` | `region.machine.hot_surface` |
| Path | `path.` | `path.vfx.mana_flow` |
| Surface Mask | `mask.` | `mask.surface.rune_glow` |
| Zone | `zone.` | `zone.audio.blacksmith_interior` |
| Sound Portal | `portal.audio.` | `portal.audio.front_door` |
| Runtime role | `runtime_anchor.` | `runtime_anchor.combat.impact` |

### 19.3 Naming Rules

- Use semantic role, not coordinates.
- Avoid model-specific names unless the role is genuinely unique.
- Use lower-case dot-separated IDs.
- Use `left` and `right`, not ambiguous abbreviations.
- Include channel only when it improves meaning; shared anchors may use `anchor.presentation.*`.
- Do not include version numbers in stable IDs.
- Do not include temporary scene-node names.
- Preserve aliases when renaming.

### 19.4 Dependency Tracking

The manifest records which profiles, bindings, effects, sounds, lights, materials and blueprints consume each reference. Deleting or changing a reference shows impact before approval.

### 19.5 Compatibility Versions

A socket or path contract may carry a compatibility version when shape or semantics change materially. Minor coordinate adjustments do not require a new stable ID. A breaking role change requires migration rather than silent reuse.

## 20. Spatial Editor Workflow and Visualisation

### 20.1 Unified Spatial Mode

Asset Forge, Entity Forge, Blueprint Forge, Animation Forge, VFX Forge and Audio Forge should all expose the same shared Spatial Mode rather than separate incompatible editors.

### 20.2 Viewport Overlays

```text
Spatial Overlays
|-- Anchors and sockets
|-- Voxel coordinates and face normals
|-- Surface masks and weights
|-- Regions and sampling points
|-- Paths, tangents and branches
|-- Zones and blend distances
|-- Sound portals and zone graph
|-- Variant/LOD mapping quality
|-- Binding consumers
`-- Validation and orphan warnings
```

### 20.3 Creation Workflow

1. Select an owner asset, part, voxel, face, edge, vertex, bone, cell, room or volume.
2. Choose spatial type.
3. Select semantic role or create a validated custom role.
4. Generate initial transform, mask, region or path.
5. Set orientation, scale, follow and fallback policies.
6. Add mirror partner, aliases or template relation.
7. Preview variant and LOD mappings.
8. Inspect consumers and conflicts.
9. Validate.
10. Approve and bake.

### 20.4 Precision Tools

- Voxel coordinate picker.
- Face and shape-surface picker.
- Edge/vertex snapping.
- Free transform gizmo.
- Bone/body-role picker.
- Surface Mask painter.
- Region box/lasso/material selector.
- Path point and branch editor.
- Zone volume tools.
- Sound Portal connector.
- Mirror and symmetry tools.
- Alignment to normal, tangent, centre or bounds.

### 20.5 Reference Browser

The browser should show:

- Type.
- ID and display name.
- Owner and template source.
- Required/optional status.
- Mapping quality by variant/LOD.
- Consumers.
- Fallback chain.
- Validation state.
- Last modified revision.

### 20.6 Preview Modes

- Base model.
- Animation playback.
- Equipment composition.
- Damage state.
- Construction stage.
- LOD distance sweep.
- Content-pack override.
- Runtime event simulation.
- Zone listener walkthrough.
- Acoustic portal open/closed states.

### 20.7 AI-Assisted Suggestions

Summer Engine may suggest likely mouths, hands, feet, chimneys, vents, weapon edges, room volumes and portals. Suggestions remain unapproved until reviewed. The UI should show confidence, evidence and all changes before application.

## 21. Validation, Diagnostics, Repair and Migration

### 21.1 Validation Classes

| Class | Examples |
| --- | --- |
| Identity | Duplicate IDs, invalid prefix, ambiguous alias. |
| Mapping | Missing voxel, missing bone, orphaned face, invalid free point. |
| Orientation | Zero basis, inverted normal, incompatible handedness. |
| Region | Empty set, invalid member, unsupported dynamic selector. |
| Path | Missing endpoint, zero-length segment, branch cycle where forbidden, broken closed loop. |
| Mask | Empty required mask, invalid resolution, off-surface samples. |
| Zone/portal | Missing zone, portal outside opening, impossible connection. |
| Variant/LOD | Missing required mapping, undeclared approximation, absent fallback. |
| Socket | Incompatible child tag, occupancy conflict, contract mismatch. |
| Dependency | Binding references missing spatial ID, deleted owner or incompatible type. |
| Runtime | Unsupported follow mode, unbounded update cost, invalid save conversion. |

### 21.2 Severity Levels

- Information: optional improvement or generated suggestion.
- Warning: usable but approximate, potentially fragile or expensive.
- Error: binding cannot resolve correctly.
- Approval blocker: required contract, save safety or runtime correctness is broken.

### 21.3 Repair Tools

The editor may offer:

- Rebind to same semantic part.
- Nearest compatible feature.
- Mirror from partner.
- Recreate from template.
- Replace with fallback.
- Convert coordinate-bound to feature-bound.
- Resample Surface Mask.
- Refit region bounds.
- Reconnect path endpoints.
- Rebuild zone/portal graph.

Every automated repair creates a reviewable change record.

### 21.4 Spatial Diff

A revision comparison should visualise:

- Moved anchors.
- Changed orientation.
- Added/removed region members.
- Mask weight changes.
- Path topology changes.
- Zone volume changes.
- Portal connection changes.
- Mapping-quality changes by LOD.
- Newly broken consumers.

### 21.5 Migration Rules

When IDs change, the migration record maps old owner/reference pairs to new pairs. When geometry changes but semantic IDs remain, physical mappings update without touching consumers. Removed required roles require explicit content migration or incompatibility approval.

## 22. Baking, Runtime Resolution, Multiplayer and Saving

### 22.1 Baked Products

Editable source may bake into:

- Compact point-transform arrays.
- Semantic ID to index tables.
- Bone/part remap tables.
- Compressed voxel and face bitsets.
- Surface Mask textures or packed channels.
- Pre-sampled path buffers.
- Branch graph records.
- Zone bounds and spatial index data.
- Acoustic zone/portal graph.
- Variant and LOD mapping tables.
- Fallback lookup tables.

### 22.2 Runtime Resolution

Runtime resolution follows:

1. Resolve owner definition and current variant/LOD.
2. Resolve semantic spatial ID.
3. Select exact, equivalent, approximate or fallback mapping.
4. Combine live owner/bone/blueprint transform.
5. Apply attachment follow and scale policy.
6. Submit transform or sampling provider to active presentation channel.
7. Record diagnostic once if resolution degrades unexpectedly.

### 22.3 No Permanent Node Per Reference

Authored references are data, not mandatory scene nodes. Runtime creates or updates transforms only for active bindings, nearby debug views or systems requiring live follow. Static references can resolve mathematically from owner transforms.

### 22.4 Multiplayer Authority

The server or authoritative host owns gameplay events and persistent state. Clients resolve spatial references from shared definitions. The network sends stable owner IDs, event context, semantic roles and minimal runtime transforms where exact contact cannot be reconstructed.

### 22.5 Late Join and LOD Promotion

State-driven presentation reconstructs from current state and spatial mappings. Transient past events are not replayed unless explicitly retained. Persistent loops resume at the correct virtual phase. Persistent surface records resolve against current local faces, masks or regions.

### 22.6 Save Records

Save data should store:

- Owner stable ID or world instance ID.
- Semantic spatial ID.
- Local member/face reference when required.
- Intensity, age and expiry for persistent surface presentation.
- Variant-independent state.
- Migration version.

Do not save raw world transforms for persistent owner-bound effects unless no stable owner exists.

### 22.7 Unloaded World

Distant or unloaded structures retain semantic presentation state, not active emitters. When loaded, current machine, village, weather, damage and magic state reconstruct the correct spatial presentation.

## 23. Performance, Scalability and Simulation LOD

### 23.1 Cost Principles

- Static authored references are cheap data.
- Only active bindings need live transform updates.
- Regions should use compressed sets and precomputed sampling helpers.
- Paths should use LOD-specific samples.
- Zone checks should use spatial indexing.
- Acoustic portal graphs should be bounded by nearby active listeners.
- Debug overlays are editor/development costs, not shipping defaults.

### 23.2 Spatial LOD

| LOD Band | Spatial Behaviour |
| --- | --- |
| Close | Exact voxel, mask, bone and detailed path mappings. |
| Medium | Part-level anchors, reduced mask samples, simplified paths and zones. |
| Far | Asset/structure centres, key endpoints, grouped region centres. |
| Abstract | No active transform; state and virtual phase only. |

### 23.3 Aggregation

Spatial references support aggregation keys:

- Machine cluster.
- Village district.
- Weather cell.
- Creature group.
- Mana network.
- Ambient region.

Many individual chimney points may become one distant smoke cluster or grouped factory hum origin while preserving critical warning references.

### 23.4 Update Budgets

References may declare update importance:

- Critical gameplay-readable.
- Local interaction.
- Major atmospheric.
- Minor decorative.
- Editor-only.

Budget systems reduce update rate and precision in that order without removing critical cues first.

### 23.5 Path and Region Sampling Budgets

Sampling profiles cap points per event, samples per second, region queries and path segments. Random sampling should be deterministic when replay or multiplayer consistency requires it.

## 24. Minimum Viable Spatial System and Forest Hamlet Tests

### 24.1 MVP Asset Set

| Test Asset | Required Spatial Features |
| --- | --- |
| Furnace | Machine body audio, chimney VFX, firebox light, output socket, warning socket, hot region, damage fallback and medium/far LOD mappings. |
| Iron sword | Primary grip, blade root/tip, blade-edge path, enchantment region and runtime impact anchor use. |
| Rune block | Six face references, named rune Surface Mask, mana origin, corruption override and surface-residue support. |
| Humanoid villager | Mouth, chest, hands, feet, equipment sockets, mirrored contact points and animation follow. |
| Goblin or creature | Mouth/breath or vocal origin, feet, weapon contact, body region and damaged/LOD remap. |
| Blacksmith building | Workshop acoustic zone, exterior zone, door sound portal, chimney, forge ambience region and construction-stage mappings. |
| Mana conduit/ward | Directed path, junctions, powered segments, ward boundary and far-LOD endpoint fallback. |
| Mining impact | Runtime world position, normal, struck voxel/face and material context. |
| Rain shelter | Exterior weather zone, interior shelter zone, roof contact region and portal/opening transitions. |

### 24.2 Forest Hamlet Integrated Scenario

The Forest Hamlet test should demonstrate:

1. Rain sounds and voxel contact effects outside the blacksmith.
2. Rain reduction when the player enters through the door portal.
3. Interior acoustic response based on the workshop zone.
4. Furnace sound and smoke originating from separate correct references.
5. Furnace damaged state remapping sparks to a crack region.
6. Villager hammer impacts using animation timing and a runtime contact anchor.
7. Sword trail following the blade path and impact resolving at the struck location.
8. Rune block glow using a named Surface Mask.
9. Mana pulses moving along a directed conduit path.
10. Medium/far LOD reducing exact references without losing the furnace warning or ward-breach cue.
11. Content-pack replacement of the furnace preserving required spatial roles.
12. Runtime capture/replay showing stable alignment through animation and state changes.

### 24.3 MVP Acceptance

- Exact voxel, face and Surface Mask attachments resolve correctly.
- Bone-follow sockets remain aligned during animation.
- One path and one branching network display correct direction.
- Acoustic zones and a door portal transition correctly.
- Runtime impacts provide correct point, normal and material.
- Variant and LOD mappings show exact-to-approximate fallback intentionally.
- Required missing references block approval.
- Spatial changes produce dependency and migration reports.
- Persistent surface residue survives save/reload through stable local reference.
- No gameplay truth is authored inside the spatial system.

## 25. Balancing Rules and Explicit Non-Goals

### 25.1 Spatial Authoring Rules

- Prefer semantic templates over one-off references.
- Prefer feature, part or mask bindings over raw coordinates when geometry is expected to change.
- Use exact references for important close-range effects and controlled approximations for distance.
- Do not expose more sockets than creators can understand and maintain.
- Keep shared references channel-neutral when sound, VFX and light genuinely use the same origin.
- Separate presentation-only regions from gameplay collision and hit regions.
- Keep fallback chains short and inspectable.
- Preserve left/right naming and mirror relationships.
- Validate every required role against all approved variants and LODs.
- Store persistent presentation against stable owners whenever possible.

### 25.2 Complexity Limits

A simple asset should not require manual setup for generated standard references. Deep authoring is reserved for meaningful assets, machines, creatures, equipment, magic infrastructure and structures. Templates, inheritance and generated references should handle common cases.

### 25.3 Explicit Non-Goals

23B does not define:

- Damage calculation, collision resolution or hitbox ownership.
- Animation-event payloads and profile resolution in full detail.
- Particle graph nodes or sound processing chains.
- Full runtime acoustic mixing.
- Final Godot classes and binary formats.
- Public mod scripting of arbitrary attachment code.
- Per-voxel global acoustic ray tracing.
- Automatic approval of AI-generated mappings.

## 26. Open Questions for Later Documents

The following details should be finalised in later documents or implementation spikes rather than blocking 23B:

- Exact packed binary format for masks, regions and paths.
- Maximum recommended authored references per asset family.
- Final path sampling thresholds by hardware profile.
- Godot resource class names and editor-plugin architecture.
- Exact acoustic-zone generation algorithm from voxel rooms.
- Network payload compression for high-frequency runtime contacts.
- Final persistent surface-record limits per chunk.
- Platform-specific precision and memory budgets.
- Public mod permissions for adding new semantic role catalogues.

## Appendix A. Spatial Data Templates

### A.1 Anchor Template

```text
spatial_id: anchor.light.firebox
owner_asset_id: block.machine.furnace_basic
semantic_role: light.firebox
coordinate_space: voxel_local
mapping_mode: voxel_local
voxel: [1, 1, 0]
local_position: [0.5, 0.6, 0.5]
orientation_source: owner_basis
scale_policy: uniform_scale_only
required_status: required_approximate
fallback_reference_id: anchor.fallback.machine_centre
supported_binding_types: [light, vfx]
```

### A.2 Socket Template

```text
spatial_id: socket.vfx.chimney
owner_asset_id: block.machine.furnace_basic
socket_role: exhaust
mapping_mode: face
voxel: [1, 2, 1]
face: positive_y
face_local: [0.5, 0.5]
allowed_child_tags: [presentation.vfx.smoke, presentation.vfx.ember]
occupancy_mode: multi_layered
follow_mode: rigid_follow
scale_policy: position_scale_only
required_status: required_approximate
fallback_reference_id: anchor.fallback.machine_top
```

### A.3 Region Template

```text
spatial_id: region.machine.hot_surface
owner_asset_id: block.machine.furnace_basic
region_form: face_set
members: [front_firebox_faces, top_plate_faces]
sampling_modes: [random_weighted, all_active]
dynamic_state_source: state.heat_ratio
lod_fallback: anchor.light.firebox
```

### A.4 Path Template

```text
spatial_id: path.vfx.blade_edge
owner_asset_id: item.weapon.iron_sword
path_type: open_ordered
nodes:
  - anchor: anchor.weapon.blade_root
  - anchor: anchor.weapon.blade_mid
  - anchor: anchor.weapon.blade_tip
direction_policy: root_to_tip
sampling_profile: trail_standard
lod_fallback: line_root_to_tip
```

### A.5 Surface Mask Template

```text
spatial_id: mask.surface.rune_glow
owner_surface_id: surface.rune_block.north
resolution: [32, 32]
weight_channel: rune_glow_weight
sampling_mode: all_active
orientation_rule: face_uv_canonical
remap_policy: preserve_named_mask
empty_mask_policy: approval_blocker
```

### A.6 Zone and Portal Templates

```text
zone.audio.blacksmith_interior
shape: blueprint_room
priority: 50
blend_distance: 1.5m
acoustic_profile_id: acoustic.workshop.stone_timber
ambience_profile_id: ambience.blacksmith_working

portal.audio.blacksmith_front_door
zone_a_id: zone.audio.blacksmith_interior
zone_b_id: zone.audio.village_exterior
opening_shape: blueprint_opening
obstruction_state_source: door.front.open_fraction
transmission_profile: portal.wooden_door_medium
```

## Appendix B. Naming and Semantic Role Catalogue

### B.1 Shared Anchor Roles

- `anchor.fallback.asset_centre`
- `anchor.fallback.part_centre`
- `anchor.presentation.focus`
- `anchor.audio.origin`
- `anchor.light.origin`
- `anchor.vfx.origin`
- `anchor.surface.centre`

### B.2 Entity Roles

- `socket.audio.mouth`
- `socket.audio.chest`
- `socket.vfx.breath_origin`
- `socket.vfx.foot_left_contact`
- `socket.vfx.foot_right_contact`
- `socket.vfx.hand_left_cast`
- `socket.vfx.hand_right_cast`
- `socket.weapon.primary`
- `socket.weapon.secondary`
- `region.body.head`
- `region.body.chest`
- `region.body.left_wing`
- `region.body.right_wing`
- `path.body.tail`

### B.3 Machine Roles

- `anchor.audio.machine_body`
- `socket.audio.gearbox`
- `socket.audio.output`
- `socket.audio.warning`
- `socket.vfx.chimney`
- `socket.vfx.steam_valve`
- `socket.vfx.mana_core`
- `region.machine.hot_surface`
- `region.machine.moving_parts`
- `path.vfx.item_flow`
- `path.vfx.power_flow`
- `path.vfx.mana_flow`

### B.4 Structure Roles

- `anchor.structure.entrance`
- `anchor.structure.centre`
- `anchor.structure.chimney`
- `zone.audio.interior`
- `zone.audio.exterior`
- `zone.vfx.weather_shelter`
- `portal.audio.primary_door`
- `region.structure.roof`
- `region.structure.damage`
- `path.structure.ward_boundary`

## Appendix C. Default Reference Families

| Family | Generated or Required References |
| --- | --- |
| Full cube block | Centre, six faces, top/bottom/side aliases, break region, contact surface. |
| Light block | Base block family plus light origin and optional glow mask. |
| Container | Centre, interaction, lid/door, hinge path, content region, audio body. |
| Furnace machine | Machine body, firebox, chimney, output, warning, hot region, damage region. |
| Humanoid | Head, mouth, chest, hands, feet, back, equipment sockets, mirrored contacts. |
| Quadruped | Head, mouth, chest, four feet, back, tail root/tip and contact roles. |
| Sword | Grip, guard, blade root/mid/tip, edge path, enchantment region. |
| Bow | Grip, string path, arrow rest, projectile origin and draw references. |
| Roomed building | Structure centre, entrance, rooms, acoustic zones, door/window portals, roof region. |
| Mana network | Sources, sinks, junctions, directed segments, boundary or route path, fallback endpoints. |

## Appendix D. Cross-System Spatial Matrix

| System | Reads Spatial References | Owns Authoritative Truth |
| --- | --- | --- |
| VFX | Spawn origins, regions, paths, masks, zones, runtime contacts. | No; effect playback only. |
| Audio | Emitters, zones, portals, listener-relative points, grouped origins. | No; sound playback and mix only. |
| Animation | Bone-follow references and event-timed sockets. | Animation pose and marker timing. |
| Combat | May provide runtime impact anchor and target region hint. | Hit confirmation, damage, block/parry result. |
| Blocks | Face, voxel, material and persistent-surface ownership. | Block existence, state, damage and placement. |
| Automation | Port transforms, machine state, active route subset. | Resource flow, throughput, power and ownership. |
| Magic | Mana paths, ward boundaries, ritual anchors and portal state. | Mana transfer, spell result, ward logic and corruption state. |
| NPC/Creature | Body roles, equipment sockets and movement contacts. | AI decisions, movement and persistent identity. |
| Blueprint/Structure | Cells, modules, rooms, zones, portals and construction regions. | Structure state, ownership, construction and damage. |
| Weather/World | Zones, contact anchors and environmental region state. | Weather state, biome state and world simulation. |
| Save System | Stable owner/reference IDs for persistent presentation. | Persistence, migration and recovery. |

## Appendix E. Validation and Acceptance Checklist

### E.1 Identity and Ownership

- [ ] Every approved reference has a valid type and stable semantic ID.
- [ ] Owner asset or blueprint exists and is versioned.
- [ ] No duplicate IDs within the owner.
- [ ] Aliases resolve deterministically.
- [ ] Dependencies and consumers are visible.

### E.2 Mapping

- [ ] Required references resolve on the base asset.
- [ ] Orientation and scale policies are explicit.
- [ ] Voxel, face, edge, vertex and free-point mappings remain in valid bounds.
- [ ] Shape-aware surfaces are used for non-full-cube forms.
- [ ] Orphaned mappings are repaired or intentionally invalidated.

### E.3 Masks, Regions and Paths

- [ ] Required Surface Masks are non-empty and correctly oriented.
- [ ] Region members are valid and sampling modes are bounded.
- [ ] Paths have valid endpoints, tangents and branch rules.
- [ ] Closed boundaries are closed.
- [ ] LOD fallbacks exist where required.

### E.4 Zones and Portals

- [ ] Zones have bounded shapes, priority and blend policy.
- [ ] Sound Portals connect valid zones or exterior.
- [ ] Open/closed state sources are valid.
- [ ] Portal geometry overlaps the intended opening.
- [ ] Critical warning zones survive quality reduction.

### E.5 Variants and Runtime

- [ ] Required mappings exist for approved variants and LODs.
- [ ] Approximation levels are declared.
- [ ] Fallback chains are acyclic.
- [ ] Runtime anchors use authoritative event data.
- [ ] Persistent conversion uses stable owner-local references.
- [ ] Active runtime update cost remains within budget.

## Appendix F. Worked Examples

### F.1 Furnace Blocked and Damaged

```text
state.processing = true
-> sound loop at anchor.audio.machine_body
-> smoke at socket.vfx.chimney
-> light at anchor.light.firebox

state.output_blocked = true
-> warning sound at socket.audio.warning
-> warning light at socket.light.warning

state.damage_ratio > 0.5
-> spark samples from region.machine.damageable_presentation
-> chimney mapping remains exact
-> damaged audio layer follows socket.audio.gearbox
```

### F.2 Sword Attack

```text
animation marker: weapon_trail_begin
-> start voxel trail along path.vfx.blade_edge

combat event: melee_impact_confirmed
-> runtime anchor supplies world point, normal and target material
-> impact profile resolves at runtime anchor
-> persistent scorch only converts if the damage type and surface allow it
```

### F.3 Rune Block

```text
state.powered = true
-> glow all texels in mask.surface.rune_glow
-> mana motes sample mask boundary
-> hum uses anchor.audio.origin

state.corrupted = true
-> corruption channel replaces glow palette
-> crack residue uses mask.surface.crack_area
```

### F.4 Blacksmith Acoustic Transition

```text
listener outside
-> village exterior ambience

listener crosses portal.audio.blacksmith_front_door
-> blend into zone.audio.blacksmith_interior
-> machine and hammer tails use workshop acoustic profile

door closes
-> portal transmission reduces according to authoritative open fraction
```

### F.5 Creature Breath Attack

```text
charge state
-> throat region glow
-> mouth audio build-up

animation event: breath_release
-> origin socket.vfx.breath_origin
-> path/target supplied by ability context

head-damaged variant
-> breath origin remaps to jaw fallback
-> mapping quality marked approximate
-> required cue remains available
```
