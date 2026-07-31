# Fantasy Voxel Civilisation Sandbox
## 22J - Unified Forge UI/UX and Creator Workflow
### One Voxel-First Workspace for Assets, Entities, Animation, Blueprints, Validation, Review and Delivery
**Version 0.1 - Detailed Design Bible Draft**

A unified developer-facing interface for the Leyforge Forge, bringing Asset Forge, Entity Forge and Blueprint Forge into one coherent voxel-only creation environment with shared navigation, project manifests, asset libraries, live previews, icon capture, dependency tracking, test scenarios, approval gates, overrides, packaging and safe production workflows.

## Unified Forge UI/UX Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the complete Forge information architecture, project dashboard, workspace shell, asset browser, creation wizards, specialist editors, viewport interaction, body-plan and rig workflows, animation and state editing, equipment preview, Blueprint Forge composition, Icon Capture Studio, Forge Test Laboratory, dependency review, overrides, lifecycle, collaboration, accessibility, performance, packaging and POC scope. |
| Core Philosophy | The Forge should feel like one connected creation environment rather than several unrelated editors. Shared concepts must appear in consistent locations, while specialist tools are revealed only when relevant to the current asset type. |
| Voxel Direction | Every visible model and structure authored in the Forge remains voxel-based at source. The UI may expose efficient baked meshes and runtime previews, but it must always identify whether the user is editing source voxels, generated data or derived runtime products. |
| Workspace Direction | Use three primary workspaces - Asset Forge, Entity Forge and Blueprint Forge - supported by shared Project, Library, Test, Review and Package areas. Users may move between linked assets without losing selection, camera, comparison or task context. |
| Developer Direction | The full interface is a developer tool. It permits new asset creation, field-level overrides, replacement of models, textures, rigs, animation, icons and blueprint elements, registry integration, migration and controlled reversion. |
| Progressive Disclosure | Simple work should remain simple. A standard block, pig, NPC outfit or cottage should not expose every advanced panel by default. Advanced body graphs, procedural solvers, network layers and migration tools appear when requested or required. |
| Live View Direction | The viewport is the centre of authoring. Editing, test states, collision, markers, skeletons, networks, construction stages, LODs and icon cameras are visualised directly against the same voxel source. |
| Icon Direction | Any block, item, entity, creature, machine or blueprint requiring an icon or portrait may capture it from the live view. Saved capture profiles support transparent backgrounds, camera presets, state selection, variants, animation frames and batch regeneration. |
| Test Direction | The Forge Test Laboratory is a shared workspace, not a separate external utility. It can test materials, placement, animation, gait, collision, navigation, equipment, machine states, blueprint construction, NPC access, world placement and performance. |
| Governance Direction | Every source asset exposes stable ID, namespace, lifecycle state, owner, dependencies, override provenance, validation status, last approved revision and bake state. The UI must make risky or stale content visible before export. |
| Review Direction | Reviewers can compare source revisions, overrides, variants, icon captures and runtime products, leave anchored notes, approve specific areas and reject changes without destroying work. |
| Safety Direction | Undo, autosave, recovery, revision history, field-level revert and dependency-aware deletion are mandatory. Hard errors prevent corrupt output; performance or style concerns normally produce overrideable warnings. |
| Accessibility Direction | The Forge supports scalable text, keyboard navigation, remapping, non-colour status cues, reduced motion, readable overlays, high-contrast modes and alternatives to sound-dependent feedback. |
| Audio/VFX Boundary | The UI may assign named sockets, event references and placeholder previews, but full audio production and particle/VFX design software remains deferred to later Forge modules. |
| Implementation Context | Godot with Summer Engine is the current target. This document defines user-facing behaviour and workflow contracts; Document 22K will define editor classes, Resources, services, baking jobs and implementation phases. |
| POC Direction | Prove a coherent end-to-end workflow for a standard block, animated furnace, humanoid NPC, pig, spider, dragon test rig and staged watchtower blueprint, including live icon capture, validation, approval and package output. |

## Document Purpose

Documents 21A through 21G established the original Voxel Asset Forge for block surfaces, items, uniquely shaped blocks, props, machines, materials, animations, runtime visual states, overrides and visual migration. Documents 22A through 22I expanded that foundation into humanoid and creature authoring, body-plan graphs, skeletons, rigging, procedural movement, equipment, gameplay markers, simulation LOD and the merged Blueprint Forge.

Those systems now require a single interface model. Without a unified UX, the Forge could become a collection of technically capable but disconnected tools: one browser for blocks, another for entities, another for blueprints, separate test scenes, inconsistent save actions and multiple competing methods for overrides or approval. That would slow production, increase mistakes and make AI-assisted development much harder to review.

This document defines how the entire Forge is experienced by a developer. It establishes the top-level navigation, the common workspace shell, the rules for context-sensitive panels, specialist editor layouts, linked-asset navigation, validation, testing, revision comparison and delivery. It also defines complete creation workflows so a developer can understand not only what screens exist, but how work moves safely from idea to approved runtime content.

The interface should support two extremes without forcing either one onto every task:

1. A developer quickly creates a simple voxel item, captures its icon and makes it available in the registry.
2. A developer builds a multi-phase dragon boss with repeated body parts, a custom rig, breakable regions, flight tests, equipment sockets, portraits and a linked arena blueprint.

Both workflows must use the same Forge concepts, stable identities and production gates.

This document does not define final Godot control nodes, low-level file formats, complete keyboard shortcuts, full audio/VFX authoring, player-facing character creation UI or shipped player blueprint menus. Those are owned by Document 22K, future specialist modules and the game UI documents.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. The Forge may be hosted as a Godot editor plugin, an embedded developer application or a hybrid of both. Regardless of host, the visible workflow and data contracts defined here should remain consistent. Editable voxel source, metadata and revision data are authoritative; baked meshes, icons, collision, navigation caches and runtime packages are replaceable derived products.

## Design Sources

| Source Document | Relevant Direction | How 22J Uses It |
| --- | --- | --- |
| 17 - UI/UX System | UI should remain world-first, modern, inspectable, accessible, controller-aware and consistent with authoritative game state. | Applies the same readability, trust and accessibility rules to developer tooling. |
| 21A - Voxel Asset Forge Core System | Defines the original Forge identity, voxel source rule and developer overrides. | Supplies the shared Asset Forge foundation and source-versus-runtime separation. |
| 21B - Modelling, Texturing and Materials | Defines surface painting, voxel modelling, parts, materials, collision, pivots and sockets. | Provides the specialist panels and workflows used in Asset Forge. |
| 21C - Animation, Effects and Runtime States | Defines transform, voxel-frame and material animation plus state bindings. | Supplies timeline, state graph, event and preview requirements. |
| 21D - Overrides, Variants and Registries | Defines stable identities, layered overrides, reversion and registry links. | Provides provenance, comparison, dependency and override UX. |
| 21E - Forge UI/UX and Creator Workflow | Defines the first-generation Forge interface for blocks, items and machines. | Acts as the baseline that 22J expands and supersedes for the unified Forge. |
| 21F - Forge Technical Plan | Defines Godot-facing architecture, Resources, baking, validation and hot reload. | Provides technical boundaries that the UX must expose without leaking implementation complexity. |
| 21G - Visual Overhaul Plan | Defines production status, audits, batches and review gates. | Provides dashboard queues, lifecycle and migration views. |
| 22A - Entity and Blueprint Expansion | Defines the expanded Forge architecture, manifest, dependency graph, test laboratory, packaging and voxel-only rule. | Supplies the top-level workspaces and shared services. |
| 22B - Entity Taxonomy and Body Architecture | Defines body-plan templates, graphs, repeated segments and scale bands. | Supplies body-plan creation, anatomy, density and template workflows. |
| 22C - Humanoid Creator | Defines modular humanoids, races, faces, clothing, equipment and persistent NPC appearance. | Supplies the humanoid specialist workspace and population preview. |
| 22D - Creature and Boss Creator | Defines quadrupeds, spiders, centipedes, birds, dragons, monsters and bosses. | Supplies creature templates, procedural body generation and boss authoring workflows. |
| 22E - Skeletons, Rigging, IK and Attachments | Defines rigs, joints, IK, retargeting and sockets. | Supplies rig mode, solver overlays, socket tools and compatibility diagnostics. |
| 22F - Entity Animation and Visual States | Defines locomotion, combat, procedural gait, events and state layering. | Supplies animation graphs, gait designer, event markers and runtime preview. |
| 22G - Customisation, Equipment and Inheritance | Defines visual inheritance, equipment fitting, deterministic variation and persistent identities. | Supplies equipment matrix, inheritance comparison and variant generation UX. |
| 22H - Gameplay Integration and Simulation LOD | Defines hitboxes, AI markers, navigation, mounts, sensors and LOD. | Supplies gameplay marker mode, LOD preview and integration validation. |
| 22I - Blueprint Forge | Defines semantic structure layers, construction, networks, world placement and dynamic states. | Supplies Blueprint Forge composition, stage scrubbers, network editors and worldgen previews. |

## Static Table of Contents

1. Locked Unified Forge UX Identity  
2. Locked Direction Summary  
3. Users, Roles, Permissions and Workspace Modes  
4. Unified Forge Information Architecture  
5. Main Application Shell and Layout System  
6. Forge Home, Project Dashboard and Manifest Health  
7. Unified Library, Search, Collections and Dependency Navigation  
8. New Content Wizard and Template Selection  
9. Asset Header, Context Bar, Lifecycle and Provenance  
10. Universal Viewport, Camera, Overlays and Selection  
11. Universal Outliner, Layers, Properties and History  
12. Asset Forge Workspace  
13. Entity Forge Body and Anatomy Workspace  
14. Humanoid Character and NPC Workspace  
15. Creature, Monster and Boss Workspace  
16. Rigging, Joints, IK and Attachment Workspace  
17. Animation, Gait, Events and Runtime State Workspace  
18. Equipment, Variants and Inheritance Workspace  
19. Gameplay Markers, Hitboxes, Navigation and LOD Workspace  
20. Blueprint Forge Composition Workspace  
21. Blueprint Construction, Upgrades, States and World Placement  
22. Icon Capture Studio and Presentation Products  
23. Forge Test Laboratory and Validation Scenarios  
24. Dependencies, Overrides, Comparison and Safe Reversion  
25. Save, Autosave, Recovery and Revision History  
26. Review, Approval, Collaboration and AI-Assisted Change Control  
27. Bake, Package, Export, Hot Reload and Deployment  
28. Accessibility, Input, Comfort and Localisation  
29. Performance, Responsiveness and Large-Project Behaviour  
30. Guided End-to-End Workflows  
31. Minimum Viable 22J Scope and Staged Delivery  
32. Success Criteria and Acceptance Rules  
33. Relationships With Documents 22K and 22L  
Appendix A. Unified Screen and Panel Map  
Appendix B. Context-Sensitive Tool Matrix  
Appendix C. Command and Shortcut Families  
Appendix D. Lifecycle, Review and Validation Matrix  
Appendix E. POC Workflow Acceptance Tests  
Appendix F. Glossary

# 1. Locked Unified Forge UX Identity

The Unified Forge is the developer-facing content operating environment for Leyforge. It is where voxel blocks, items, machines, humanoids, creatures, rigs, animations, equipment, gameplay markers and structures are created and connected to the registries that make them usable in the game.

The interface must make deep systems approachable without pretending they are simple. It should hide irrelevant complexity, reveal relationships when they matter and keep the developer aware of what will change when an asset is saved, baked or overridden.

## 1.1 Core Promise

A developer should be able to enter the Forge with a goal expressed in plain language - create a pig, replace the furnace model, add a four-armed NPC, build a bridge blueprint or capture an icon - and follow a clear workflow to a validated result without manually searching through unrelated project folders.

The Forge should answer these questions at all times:

- What am I editing?
- Is this original source, an override, a variant or a runtime product?
- Which workspace and mode am I in?
- What depends on this content?
- Is the content saved, valid, approved and baked?
- What will happen if I publish or revert it?
- How does it look and behave in the game?

## 1.2 Unified Design Pillars

| Pillar | UX Requirement |
| --- | --- |
| Voxel-First | Source voxels, grids, density, parts and generated voxel primitives remain visible and inspectable. |
| Contextual | Panels and commands adapt to the current content type, mode and selection. |
| Connected | Linked materials, rigs, animations, entities and blueprints can be opened without leaving the current task context. |
| Safe | Undo, revisions, autosave, validation and dependency-aware actions protect work. |
| Visual | Important data is shown in the viewport through overlays, gizmos and live previews. |
| Inspectable | Friendly labels are paired with stable IDs, source paths, ownership and provenance when requested. |
| Scalable | The same interface supports one asset and a library containing thousands of related definitions. |
| Reviewable | Human reviewers can understand AI-assisted or developer-made changes before approval. |

## 1.3 Complexity Ladder

The Forge uses four disclosure levels:

1. **Quick Create** - templates, guided defaults and minimal required fields.
2. **Standard Authoring** - the normal production workspace with common tools and validation.
3. **Advanced Authoring** - body graphs, custom rigs, procedural solvers, network graphs and inheritance controls.
4. **Technical Inspection** - raw IDs, dependency records, generated products, migration logs and diagnostic detail.

A user can move upward deliberately. The Forge should not open technical inspection panels simply because a file contains advanced data.

## 1.4 What the Unified Forge Is Not

- It is not a replacement for gameplay code.
- It is not a smooth-mesh modelling package disguised as a voxel editor.
- It is not a full audio workstation or particle/VFX authoring suite.
- It is not a file explorer that expects users to understand project internals.
- It is not an AI black box that silently replaces approved content.
- It is not a player-facing creative mode in its complete form.
- It is not allowed to hide broken dependencies behind successful-looking previews.

# 2. Locked Direction Summary

| Area | Locked Decision |
| --- | --- |
| Application Model | One Forge with specialist workspaces rather than separate applications. |
| Primary Workspaces | Asset Forge, Entity Forge and Blueprint Forge. |
| Shared Areas | Project, Library, Test Laboratory, Review and Package. |
| Default Layout | Asset tree or library left, viewport centre, context properties right, timeline/status bottom. |
| Navigation | Persistent top-level workspace switcher plus breadcrumbs and linked-asset navigation. |
| Source Identity | Source voxels and editable definitions are clearly separated from baked runtime products. |
| Context | Selection drives tools; mode changes must be explicit and visible. |
| Search | Search by friendly name, stable ID, tag, category, lifecycle, dependency, owner and validation state. |
| Creation | Guided wizard with template-first and empty/custom options. |
| Icon Capture | Built into the live view for blocks, items, machines, entities and blueprints. |
| Testing | Shared Test Laboratory with asset-specific scenarios. |
| Review | Comparison, comments, approval and field-level rejection/reversion are first-class. |
| Overrides | Override banners and provenance are always visible when editing inherited content. |
| Safety | Autosave, recovery, undo, revision history and dependency checks are mandatory. |
| Input | Keyboard and mouse are primary; controller navigation is supported for preview and basic editing where practical. |
| Accessibility | Non-colour cues, scalable interface, reduced motion, remapping and readable overlays are required. |
| POC | End-to-end workflows for seven representative content types. |

# 3. Users, Roles, Permissions and Workspace Modes

## 3.1 User Roles

| Role | Typical Capability |
| --- | --- |
| Viewer | Opens assets, previews states, views dependencies and validation results. |
| Contributor | Creates drafts, edits permitted namespaces and runs local validation. |
| Reviewer | Compares revisions, comments, requests changes and approves assigned areas. |
| Maintainer | Manages templates, migrations, namespaces, package versions and deprecations. |
| Project Administrator | Changes project manifest, permissions, global settings and release gates. |

A single developer may hold every role, but the separation keeps the workflow compatible with future collaboration and AI agents.

## 3.2 Workspace Modes

The application distinguishes **workspace** from **editing mode**.

- Workspace identifies the broad task: Asset, Entity, Blueprint, Test, Review or Package.
- Editing mode identifies the current operation: voxel sculpt, material paint, rig, animate, marker placement, network editing or icon capture.

Changing workspace may preserve the current asset. Changing editing mode should preserve camera, selection and undo history where safe.

## 3.3 Developer and Future Player Boundaries

The developer Forge may expose:

- Stable IDs and namespaces.
- Registry mappings.
- Source and generated files.
- Field-level overrides.
- Collision and hit regions.
- NPC, AI and worldgen markers.
- Migration and package controls.

A future player-facing creator would use a restricted subset and cannot be assumed to have these permissions.

# 4. Unified Forge Information Architecture

## 4.1 Top-Level Areas

```text
Forge
├── Home
├── Library
├── Asset Forge
├── Entity Forge
├── Blueprint Forge
├── Test Laboratory
├── Review
├── Package
└── Project Settings
```

The active area appears in the primary navigation bar. Switching areas does not automatically close the current asset; the user may return to it through a persistent work tab.

## 4.2 Work Tabs

Multiple assets can be open as tabs. Each tab shows:

- Content icon and type.
- Short display name.
- Dirty-state marker.
- Override or variant marker.
- Validation severity.
- Lock or read-only state.

Tabs can be pinned, grouped and restored after restart.

## 4.3 Breadcrumbs

A breadcrumb presents conceptual ownership rather than raw disk paths:

```text
Creatures > Arthropods > Cave Spider > Rig > front_left_leg_02
```

Each breadcrumb level is clickable. A technical path can be shown in the inspector when required.

## 4.4 Linked Navigation

Selecting a reference exposes `Open`, `Open Beside`, `Reveal in Library` and `Show Dependency Path` actions. For example, a watchtower blueprint can open its door asset, guard marker contract or material palette without manually searching.

# 5. Main Application Shell and Layout System

## 5.1 Default Layout

```text
┌──────────────────────────────────────────────────────────────┐
│ Project / Workspace / Breadcrumb / Search / Build Status     │
├───────────────┬───────────────────────────────┬──────────────┤
│ Library or    │                               │ Properties,  │
│ Outliner      │       Live Voxel View         │ Context and  │
│               │                               │ Diagnostics  │
├───────────────┴───────────────────────────────┴──────────────┤
│ Timeline / State Graph / Stage Scrubber / Console / Tasks    │
└──────────────────────────────────────────────────────────────┘
```

The centre viewport receives the largest area. Panels may dock, float or collapse, but their default positions should remain consistent across workspaces.

## 5.2 Workspace Presets

Recommended presets:

- Modelling.
- Texturing and Materials.
- Rigging.
- Animation.
- Gameplay Integration.
- Blueprint Composition.
- Blueprint Systems.
- Icon Capture.
- Test and Diagnostics.
- Review and Comparison.

Presets change layout, not data. Users may save personal layouts without changing project files.

## 5.3 Focus Mode

Focus Mode hides most panels and maximises the viewport or timeline. A clear indicator shows what is hidden, and `Escape Focus` restores the prior layout.

## 5.4 Multi-Monitor Support

The Forge should allow the viewport, timeline, dependency graph or review comparison to move to another monitor. Persistent window placement must fail gracefully when monitors change.

## 5.5 Density and Scaling

Interface density options:

- Comfortable.
- Standard.
- Compact.

Text scaling is independent from panel density. Icons must remain distinguishable at every supported scale.

# 6. Forge Home, Project Dashboard and Manifest Health

## 6.1 Dashboard Purpose

The dashboard shows what requires attention before presenting creation shortcuts. It should prevent a large project from hiding missing icons, stale runtime products or broken dependencies.

## 6.2 Dashboard Cards

| Card | Information |
| --- | --- |
| Continue Working | Recently opened or dirty assets and blueprints. |
| Assigned Tasks | Review requests, migration tasks and production batches. |
| Project Health | Manifest validity, missing dependencies, registry conflicts and failed bakes. |
| Visual Overhaul | Asset counts by lifecycle and approval state. |
| Missing Products | Missing icons, LODs, collision, animations or runtime packages. |
| Recent Changes | Human and AI-assisted revisions with authorship and approval status. |
| POC Readiness | Completion of required Set 22 test content and workflows. |

## 6.3 Manifest Health Panel

The manifest panel shows:

- Forge format version.
- Target game version.
- Registry schema versions.
- Enabled content packs.
- Namespace owners.
- Override order.
- Last validated revision.
- Last successful package.

Errors link directly to the affected content.

## 6.4 Work Queues

Saved queues may include:

- Needs model.
- Needs rig.
- Needs animation.
- Needs icon.
- Needs blueprint integration.
- Needs review.
- Needs migration.
- Failed validation.
- Approved but stale bake.

# 7. Unified Library, Search, Collections and Dependency Navigation

## 7.1 Library Views

The Library supports:

- Card grid.
- Compact list.
- Hierarchy tree.
- Family view.
- Dependency graph.
- Production board.

The underlying content remains the same; views answer different questions.

## 7.2 Searchable Fields

Search can match:

- Display name.
- Stable ID.
- Namespace.
- Content type.
- Body plan.
- Material family.
- Culture or biome.
- Lifecycle state.
- Owner.
- Tag.
- Dependency.
- Validation result.
- Override source.
- Last modified range.

## 7.3 Filters and Smart Collections

Smart collections update automatically from rules. Example:

```text
content_type = creature
AND body_plan = quadruped
AND lifecycle != approved
AND missing_icon = true
```

Manual collections remain useful for production batches or thematic sets.

## 7.4 Asset Cards

A result card may show:

- Live or cached thumbnail.
- Content type.
- Lifecycle badge.
- Validation badge.
- Override or variant badge.
- Dirty or stale-bake indicator.
- Owner and last modification.

Hovering reveals quick actions without replacing normal context menus.

## 7.5 Dependency Graph

The graph supports upstream and downstream views:

```text
Oak Material
├── Oak Planks
├── Oak Door
├── Village Bed
└── Forest Cottage Blueprint
```

Nodes can be filtered by dependency type. Cycles, missing references and deprecated links receive distinct non-colour indicators.

## 7.6 Safe Delete and Deprecate

Delete is unavailable while live dependencies exist unless the operation includes a replacement or migration plan. Deprecation is preferred for shipped content and displays suggested replacements.

# 8. New Content Wizard and Template Selection

## 8.1 Entry Points

The wizard can be opened from:

- Global `New` command.
- Library category.
- Duplicate or derive action.
- Blueprint or entity context.
- Missing-reference repair flow.

## 8.2 Wizard Steps

1. Choose content family.
2. Choose template or custom start.
3. Set stable identity and namespace.
4. Choose scale, density and major options.
5. Choose inheritance or override relationship.
6. Select required outputs.
7. Review dependencies and create.

## 8.3 Content Families

| Family | Example Templates |
| --- | --- |
| Standard Block | Full cube, transparent block, connected surface. |
| Unique Block or Item | Chute, sword, tool, furniture, machine part. |
| Compound Machine | Furnace, crusher, powered station. |
| Humanoid | Standard, short, tall, four-armed, winged. |
| Quadruped | Pig, canine, heavy beast. |
| Arthropod | Spider, hexapod, scorpion. |
| Segmented Creature | Centipede, serpent, long dragon. |
| Flying Creature | Bird, bat, wyvern, dragon. |
| Blueprint | Cottage, workshop, bridge, camp, ruin, arena. |

## 8.4 Template Transparency

The wizard explains what a template includes: body graph, default rig, animation compatibility, marker set, material roles or blueprint layers. It must not silently generate hidden dependencies.

## 8.5 Quick Create

Quick Create uses project defaults and opens the first required editor. Advanced settings remain available later.

# 9. Asset Header, Context Bar, Lifecycle and Provenance

## 9.1 Header Contents

Every open content tab shows:

- Display name.
- Stable ID.
- Type and subtype.
- Lifecycle state.
- Namespace and owner.
- Source or override status.
- Save state.
- Validation state.
- Bake state.
- Active variant or preview state.

## 9.2 Primary Actions

`Save Draft`, `Validate`, `Test`, `Capture`, `Submit`, `Approve`, `Bake` and `Package` appear according to permissions and lifecycle.

Actions that are unavailable explain why rather than simply appearing disabled.

## 9.3 Provenance Banner

Inherited or overridden content displays a persistent banner:

```text
Editing project override of block.machine.basic_furnace
Base revision: 14 | Override revision: 3 | 6 fields changed
```

The banner links to comparison and field-level revert.

## 9.4 Context Chips

Chips show active preview conditions such as:

- Forest biome.
- Damaged state.
- Processing animation.
- Medium LOD.
- Dwarf culture palette.
- Construction stage 3.

Chips prevent screenshots or tests from being misread as the default state.

# 10. Universal Viewport, Camera, Overlays and Selection

## 10.1 Camera Modes

- Perspective orbit.
- Orthographic orbit.
- Front, side, top and bottom.
- Isometric.
- First-person equipment view.
- Blueprint plan and elevation views.
- Flight follow camera.
- Icon camera.

## 10.2 Navigation

Standard controls include orbit, pan, zoom, frame selection, frame all and focus part. Camera speed scales with asset bounds.

## 10.3 Selection Modes

Selection can target:

- Voxels.
- Faces.
- Parts.
- Bones or joints.
- Sockets.
- Hit regions.
- Markers.
- Blueprint blocks.
- Blueprint zones.
- Network nodes and edges.

The current selection mode is explicit and colour is never the only indicator.

## 10.4 Universal Overlays

| Overlay | Purpose |
| --- | --- |
| Grid and Bounds | Shows voxel scale, pivot and occupied volume. |
| Skeleton | Shows joints, constraints and hierarchy. |
| Collision and Hit Regions | Shows movement collision, hurtboxes and weak points. |
| Sockets and Markers | Shows equipment, AI, NPC, effect and interaction anchors. |
| Navigation | Shows paths, clearance, climb surfaces and flight volumes. |
| Networks | Shows item, power, fluid, mana and ward graphs. |
| LOD | Shows current representation and transition distances. |
| Dependency | Highlights referenced or missing external content. |
| Readability | Shows silhouette, icon-size and contrast tests. |

## 10.5 Viewport Split

Split views can compare:

- Source and baked mesh.
- Original and override.
- Two variants.
- Two LODs.
- Rest pose and animation.
- Intact and damaged blueprint.
- Construction stages.

## 10.6 Measurement and Snapping

Measurement tools show voxel count, world dimensions, angles, reach, clearance and network distance. Snapping options depend on mode and display the active increment near the cursor.

# 11. Universal Outliner, Layers, Properties and History

## 11.1 Outliner

The outliner presents the current content hierarchy. Examples:

```text
Dragon
├── Body Graph
├── Voxel Parts
├── Rig
├── Animations
├── Equipment Sockets
├── Gameplay Regions
├── Variants
└── Presentation Products
```

```text
Watchtower Blueprint
├── Physical Blocks
├── Functional Assets
├── NPC Markers
├── Navigation
├── Construction Stages
├── Dynamic States
└── World Placement
```

## 11.2 Layer Controls

Layers support visibility, lock, solo, selection restriction and validation focus. Hiding a layer does not exclude it from baking unless explicitly configured.

## 11.3 Property Inspector

The inspector groups properties by purpose and shows:

- Friendly label.
- Current value.
- Inheritance source.
- Override status.
- Validation rule.
- Documentation tooltip.
- Reset or revert action.

## 11.4 History Panel

The history panel can show commands, autosaves and committed revisions. Undo history remains local to the current editing session; revisions remain persistent.

# 12. Asset Forge Workspace

The Asset Forge retains the established workflows from Set 21 while using the new unified shell.

## 12.1 Standard Block Mode

Panels:

- Six-face surface canvas.
- 3D tile preview.
- Palette and material channels.
- Connected-texture rules.
- Variation and state preview.
- Collision and placement definition.
- Icon capture.

## 12.2 Voxel Model Mode

Used for items, props, uniquely shaped blocks and machine parts. It provides:

- Volume and slice editing.
- Symmetry and arrays.
- Non-destructive modifiers.
- Named parts.
- Pivot and socket tools.
- Density and silhouette diagnostics.

## 12.3 Compound Machine Mode

The assembly view displays body parts, moving parts, functional ports and animation contracts. Machine behaviour remains read-only except for visual bindings and declared markers.

## 12.4 Material Workspace

Material DNA, palette inheritance, damage states, emission and icon response can be previewed across multiple standard objects and linked assets.

## 12.5 Asset Completion Checklist

A standard asset is not complete until required source, collision, icon, registry link, validation and bake products exist.

# 13. Entity Forge Body and Anatomy Workspace

## 13.1 Workspace Modes

- Template selection.
- Body-plan graph.
- Voxel body modelling.
- Repeated segments.
- Anatomy metadata.
- Proportion testing.

## 13.2 Body-Plan Graph Editor

The graph shows body modules and parent-child attachment:

```text
Torso
├── Neck Chain
│   └── Head
├── Front Limb Pair
├── Rear Limb Pair
├── Wing Pair
└── Tail Chain
```

Nodes show symmetry, segment count, joint role and damage region. Invalid cycles or unsupported relationships are highlighted immediately.

## 13.3 Template and Custom Modes

Template mode provides safe presets. Custom mode unlocks direct graph editing. A conversion operation can detach a template while preserving generated source.

## 13.4 Repeated-Segment Editor

Controls include:

- Segment count.
- Scale curve.
- spacing and overlap.
- limb pair frequency.
- material variation.
- collision grouping.
- LOD collapse rules.

The viewport updates without permanently baking the generator until requested.

## 13.5 Scale and Density Diagnostics

The entity is displayed beside a one-metre block, standard humanoid and doorway. Warnings identify inconsistent voxel density or impractical collision size.

# 14. Humanoid Character and NPC Workspace

## 14.1 Humanoid Tabs

- Body.
- Head and Face.
- Hair and Attachments.
- Clothing and Armour.
- Equipment.
- Expressions.
- Identity and Variants.
- Player/NPC Preview.

## 14.2 Proportion Controls

Controls use constrained ranges where compatibility matters. The viewport shows equipment and animation compatibility while proportions change.

## 14.3 Face and Expression Editor

The editor supports voxel eye, brow, mouth and jaw components plus expression states. Talking previews can use placeholder timing without requiring final voice assets.

## 14.4 NPC Population Preview

A grid or scene preview generates deterministic sample NPCs from species, culture, profession and appearance rules. It checks diversity without losing cultural coherence.

## 14.5 Equipment Fit Preview

The developer can cycle body frames, poses and equipment layers, inspect clipping and create local fit overrides.

## 14.6 Player View Checks

First-person arms, third-person camera, doorway clearance, swimming, sitting and common workstation poses are included in the humanoid test preset.

# 15. Creature, Monster and Boss Workspace

## 15.1 Creature Template Shelf

The shelf includes quadruped, spider, hexapod, segmented crawler, serpent, bird, bat, wyvern, dragon, aquatic, floating and amorphous templates.

## 15.2 Creature-Specific Assistants

| Creature Type | Assistant |
| --- | --- |
| Quadruped | Leg proportion, spine slope and foot-contact guide. |
| Spider | Leg pair layout, alternating gait and climb preview. |
| Centipede | Segment generator, gait wave and collision grouping. |
| Bird | Wing folding, perch and take-off clearance. |
| Dragon | Neck/tail chains, wing clearance, breath socket and targetable regions. |
| Boss | Phase layers, breakable parts, arena anchors and scale preview. |

## 15.3 Family and Variant Generator

A family view compares base creature, biome variants, corrupted variants, elite forms and bosses. Overrides are shown as changed fields rather than duplicated content.

## 15.4 Boss Authoring View

The boss view can display:

- Phase-specific geometry.
- Breakable regions.
- Targeting anchors.
- Attack origins.
- Camera and arena references.
- LOD and performance budgets.

Gameplay phase logic remains external and is referenced by stable event names.

# 16. Rigging, Joints, IK and Attachment Workspace

## 16.1 Rig Modes

- Generate from body plan.
- Bind to existing skeleton family.
- Custom rig.
- Retarget mapping.
- Solver configuration.
- Attachment sockets.

## 16.2 Joint Editing

Joint gizmos show pivot, axes, limits, rest orientation and parent relationship. Mirrored editing is available but can be broken intentionally.

## 16.3 Binding View

Voxel parts show their assigned bones or rigid transforms. Unbound voxels, overlapping ownership or unsupported deformation receive clear diagnostics.

## 16.4 IK and Solver Preview

The user can drag targets in the viewport and test:

- Hand placement.
- Foot placement.
- Spider leg reach.
- Perching.
- Head tracking.
- Tail follow.
- Rider seating.

## 16.5 Socket Editor

Sockets expose semantic type, transform, allowed attachment families and preview asset. Socket names follow project conventions and duplicate names are prevented within scope.

## 16.6 Retarget Compatibility View

A compatibility panel maps body roles to animation families and labels support as exact, compatible with adjustment, partial or incompatible.

# 17. Animation, Gait, Events and Runtime State Workspace

## 17.1 Timeline Layout

The timeline supports:

- Transform tracks.
- Voxel-frame tracks.
- Material tracks.
- solver parameter tracks.
- event markers.
- state transitions.
- visibility or phase tracks.

## 17.2 Clip Library

Clips are grouped by locomotion, work, social, combat, damage, death, flight, mount and boss phase. Compatible shared clips can be previewed before being referenced or overridden.

## 17.3 Procedural Gait Designer

The gait panel includes:

- Leg groups.
- step order.
- phase offsets.
- stride length.
- lift height.
- ground ray settings.
- body sway.
- turn behaviour.
- injured modifiers.

Preset gaits can be copied into local editable definitions.

## 17.4 Animation Event Markers

Events are visible flags with name, payload schema and preview action. Example:

```text
0.42s  footstep.left
0.71s  attack.damage_window.open
0.93s  attack.damage_window.close
1.10s  breath.release
```

The Forge previews events but does not authoritatively execute gameplay damage.

## 17.5 Runtime State Preview

A state selector can simulate idle, moving, attacking, damaged, burning, frozen, corrupted, mounted or dead presentation. The selector always identifies simulated state.

## 17.6 Transition Debugging

Transition view displays active state, blend, priority and blocked conditions. Conflicting visual layers are reported with their ownership path.

# 18. Equipment, Variants and Inheritance Workspace

## 18.1 Inheritance Tree

```text
Base Species
└── Body Frame
    └── Culture
        └── Profession
            └── Individual
                └── Equipment and Runtime States
```

The tree can compare values at every layer.

## 18.2 Equipment Matrix

Rows represent equipment assets; columns represent body frames or species. Cells show compatible, adjusted, hidden, fallback or unsupported.

## 18.3 Fit Adjustment Mode

Adjustments can be saved at:

- Equipment family level.
- Body-frame level.
- Species level.
- Individual exception.

The UI warns when a very specific override may be difficult to maintain.

## 18.4 Variant Preview Matrix

The matrix can compare culture, biome, age, corruption, damage, profession and quality. Seed controls allow exact regeneration.

## 18.5 Deterministic Identity Preview

NPC seeds are split into channels such as body, face, hair, clothing and accessory. Locking one channel while rerolling another is permitted in development.

# 19. Gameplay Markers, Hitboxes, Navigation and LOD Workspace

## 19.1 Marker Categories

- Collision.
- Hurt regions.
- Attack volumes.
- weak points.
- interaction anchors.
- sensor origins.
- equipment and mount sockets.
- navigation helpers.
- nameplate and camera anchors.

## 19.2 Marker Suggestion Workflow

The Forge may propose markers from voxel geometry and rig roles. Suggestions are shown as unapproved drafts and never silently become final.

## 19.3 Hit Region Editor

The editor shows region ownership, armour link, damage multiplier contract and breakable-part relationship. It validates overlap and gaps according to entity type.

## 19.4 Navigation Preview

Presets test ground, climb, swim, burrow and flight movement. Navigation overlays show clearance, reachable space and failed transitions.

## 19.5 LOD Workspace

Independent controls preview:

- Render LOD.
- Animation LOD.
- Physics LOD.
- AI LOD.
- simulation LOD.

The interface must not imply that these levels always change together.

# 20. Blueprint Forge Composition Workspace

## 20.1 Composition Layout

The Blueprint Forge uses a structure outliner, central voxel world view, layer palette, block/asset library and context inspector.

## 20.2 Placement Sources

Developers can place:

- Standard blocks.
- shaped blocks.
- Forge props.
- machines.
- doors.
- nested blueprint modules.
- semantic markers.
- network endpoints.

## 20.3 Layer Palette

Layers can be toggled individually:

```text
Physical | Functional | NPC | Creature | Navigation | Storage
Automation | Power | Mana | Construction | Damage | Worldgen | Decoration
```

Each layer has a distinct pattern or icon in addition to colour.

## 20.4 Plan, Section and 3D Views

Plan and section views aid large structures. A clipping plane can reveal interiors without deleting blocks.

## 20.5 Material Role Preview

Material roles can switch culture and biome palettes live. Missing role mappings are shown before bake.

## 20.6 Nested Module Editing

Nested modules can be edited in place or opened as their own tab. In-place edits clearly indicate whether the change affects the source module or creates a local override.

# 21. Blueprint Construction, Upgrades, States and World Placement

## 21.1 Construction Stage Editor

The stage scrubber displays blocks, resources, scaffolds, builder paths and available functionality for each stage.

## 21.2 Upgrade Delta View

A split or overlay view shows additions, removals, substitutions and moved markers between parent and upgrade blueprints.

## 21.3 Dynamic State Scrubber

States may include intact, damaged, burned, occupied, abandoned, corrupted, cleansed, restored and upgraded. The scrubber shows authored deltas and unresolved conflicts.

## 21.4 Network Editor

Network nodes and edges can be authored over the blueprint. Connectivity, capacity and external connectors are validated separately from visible pipes or conduits.

## 21.5 World Placement Preview

The blueprint can be dropped into terrain presets or generated test seeds. Controls include slope, water level, road relation, biome, rotation, mirror and clearance.

## 21.6 NPC and Creature Use Simulation

Simulated agents can test entrances, beds, job sites, guard posts, nests, perches and arena anchors. Failures link to the marker or geometry causing them.

# 22. Icon Capture Studio and Presentation Products

## 22.1 Capture Entry

`Capture` opens a focused workspace while preserving the current asset, variant, state and animation time.

## 22.2 Supported Outputs

- Inventory icon.
- block icon.
- recipe icon.
- dialogue portrait.
- codex image.
- boss card.
- blueprint thumbnail.
- map miniature.
- project-board image.

## 22.3 Camera Presets

| Content | Default Preset |
| --- | --- |
| Block | Orthographic isometric. |
| Tool or Weapon | Diagonal perspective with fitted bounds. |
| Machine | Three-quarter front, idle or active state. |
| Humanoid | Bust portrait and full-body option. |
| Creature | Silhouette-readable three-quarter view. |
| Boss | Wide portrait with scale cue. |
| Blueprint | Elevated miniature or facade view. |

## 22.4 Capture Controls

- Orthographic or perspective.
- camera rotation and elevation.
- automatic framing.
- transparent, solid or gradient background.
- environment and light preset.
- state, variant and animation frame.
- shadow and outline.
- padding and crop.
- output resolution.

## 22.5 Live-Linked and Locked Captures

Live-linked captures regenerate when relevant source changes. Locked captures preserve the current image and warn when stale.

## 22.6 Batch Capture

Batch jobs can regenerate missing or stale icons for a family, collection, content pack or production batch. Failures remain isolated and report the affected capture profile.

## 22.7 Readability Check

The studio previews the icon at actual UI sizes and against common inventory backgrounds. It warns when silhouette or contrast collapses.

# 23. Forge Test Laboratory and Validation Scenarios

## 23.1 Laboratory Purpose

The Test Laboratory answers whether content works in context before it reaches the main game world.

## 23.2 Environment Presets

- Neutral studio.
- bright daylight.
- night forest.
- cave.
- rain.
- snow.
- village exterior.
- interior room.
- factory floor.
- mana-lit ruin.
- combat arena.
- flight space.
- water tank.
- slopes and stairs course.
- blueprint construction site.

## 23.3 Scenario Types

| Scenario | Example Checks |
| --- | --- |
| Visual | Scale, silhouette, materials, animation and icon framing. |
| Physics | Collision, clearance, falling, doors and moving parts. |
| Entity | Gait, IK, turning, attack origins, equipment and hit regions. |
| Navigation | Ground, climb, swim, flight, doorway and path reachability. |
| Machine | State transitions, ports, moving parts and blocked output visuals. |
| Blueprint | Construction stages, NPC use, networks, terrain and dynamic states. |
| Performance | Voxel count, draw calls, animation cost, solver cost and memory. |

## 23.4 Run Validation Scenario

A scenario defines setup, steps, expected results and severity. The result panel links each failure to its source field or object.

## 23.5 Simulation Honesty

The Laboratory labels simulated or mocked systems. A visual machine preview must not claim that full automation transactions were executed if they were not.

## 23.6 Snapshot and Report

Tests can save screenshots, performance samples and validation reports attached to the current revision.

# 24. Dependencies, Overrides, Comparison and Safe Reversion

## 24.1 Dependency Inspector

The inspector lists:

- Incoming dependencies.
- outgoing dependencies.
- optional references.
- runtime-only products.
- stale products.
- deprecated sources.

## 24.2 Comparison Modes

- Side by side.
- ghost overlay.
- difference highlighting.
- property diff.
- hierarchy diff.
- icon comparison.
- animation event diff.
- blueprint stage diff.

## 24.3 Field-Level Revert

A changed field can revert to parent, base, approved revision or chosen revision. Revert previews affected dependants before confirmation.

## 24.4 Override Creation

`Edit as Override` explains which fields are copied or inherited. The user may start with no local changes rather than duplicating the whole asset.

## 24.5 Conflict Resolution

When parent content changes, conflicts are grouped as:

- Automatically inherited.
- Automatically preserved local override.
- Requires human decision.
- Invalid or removed reference.

## 24.6 Dependency-Aware Replacement

A replacement workflow can redirect compatible references and produce a migration record. Incompatible references remain explicit tasks.

# 25. Save, Autosave, Recovery and Revision History

## 25.1 Save States

- Clean.
- unsaved local changes.
- autosaved recovery.
- saved draft.
- submitted.
- approved.
- approved but stale bake.
- package-ready.

## 25.2 Autosave

Autosave should be frequent, incremental and non-blocking. It stores recovery data separately from approved source.

## 25.3 Crash Recovery

On restart, recovery shows affected tabs, autosave time, last explicit save and a comparison preview. Users can restore, discard or open both.

## 25.4 Undo and Redo

Undo is scoped to the current asset session and supports grouped operations such as generated segment changes or batch placement. Expensive operations show a progress indicator and remain cancellable where practical.

## 25.5 Persistent Revision History

A revision includes author, timestamp, reason, changed fields, validation result and optional review link. Revisions can be tagged as milestones or approved baselines.

# 26. Review, Approval, Collaboration and AI-Assisted Change Control

## 26.1 Review Workspace

The review workspace focuses on:

- Submitted change summary.
- source and approved comparison.
- validation reports.
- dependency impact.
- screenshots and test evidence.
- reviewer comments.

## 26.2 Anchored Comments

Comments may attach to a voxel region, part, joint, timeline frame, property, marker, blueprint element or capture profile.

## 26.3 Partial Approval

Reviewers may approve modelling while requesting animation changes, or approve a blueprint composition while rejecting world-placement rules. Partial status must not incorrectly mark the whole asset approved.

## 26.4 AI-Assisted Changes

AI-assisted edits must record:

- Request or task summary.
- changed assets and fields.
- generated assumptions.
- validation performed.
- unresolved warnings.
- human reviewer.

AI changes cannot automatically become the approved baseline unless project policy explicitly permits it.

## 26.5 Locks and Concurrent Editing

The interface should show soft locks, active editors and pending revisions. Conflict prevention is preferred over silent last-write-wins behaviour.

## 26.6 Approval Gates

Typical gates:

1. Source valid.
2. Required tests passed.
3. Required presentation products generated.
4. Dependencies resolved.
5. Human review complete.
6. Runtime bake successful.

# 27. Bake, Package, Export, Hot Reload and Deployment

## 27.1 Bake Panel

The bake panel lists products that will be generated:

- Meshes and LODs.
- materials.
- collision.
- animation data.
- navigation or marker caches.
- icons and portraits.
- blueprint runtime records.
- package manifests.

## 27.2 Incremental Bake

Only affected products and dependants should rebuild. The UI shows why each item is included.

## 27.3 Hot Reload

When supported, approved or development builds can refresh assets in a test world. The Forge displays whether hot reload is visual-only or includes safe runtime data changes.

## 27.4 Package Builder

Package modes:

- Thin package referencing project dependencies.
- self-contained package.
- migration package.
- review package.
- release content pack.

## 27.5 Package Report

The report includes content, dependencies, versions, licences or credits, migrations, validation and warnings.

## 27.6 Failure Behaviour

A failed bake or package must not replace the last known-good output. Logs link to affected assets and provide retry actions.

# 28. Accessibility, Input, Comfort and Localisation

## 28.1 Visual Accessibility

- Scalable fonts and icons.
- high-contrast theme.
- non-colour severity indicators.
- adjustable overlay opacity and thickness.
- readable selection outlines.
- colour-blind-safe palettes for graphs and states.

## 28.2 Motion and Flashing

- Reduced-motion mode.
- pause animated backgrounds.
- disable auto-rotating previews.
- cap flashing previews.
- manual timeline stepping.

## 28.3 Input Accessibility

- Full command remapping.
- keyboard access to major panels.
- sticky modifier options.
- configurable drag sensitivity.
- alternatives to middle-mouse requirements.
- large selection handles.

## 28.4 Controller and Touch Boundaries

Controller supports navigation, preview, simple placement and testing. Fine voxel modelling, graphs and timelines remain keyboard/mouse-first. Touch may support preview and broad manipulation later but is not an MVP authoring target.

## 28.5 Audio Independence

No essential Forge state relies only on sound. Placeholder event previews always have visible timeline and status feedback.

## 28.6 Localisation Foundation

UI strings use localisation keys. Stable IDs, code names and user-authored display names remain distinct.

# 29. Performance, Responsiveness and Large-Project Behaviour

## 29.1 Responsiveness Targets

- Selection and simple property edits should feel immediate.
- Search results should stream rather than block the interface.
- Heavy bakes run as cancellable background jobs.
- large graphs use progressive detail.
- previews degrade quality before freezing interaction.

## 29.2 Preview Quality Levels

- Draft.
- standard.
- final.
- performance diagnostic.

Preview quality changes presentation only and does not modify source.

## 29.3 Large Libraries

The Library uses indexing, virtualised lists, cached thumbnails and lazy metadata. Missing thumbnails should not block browsing.

## 29.4 Heavy Content Warnings

Warnings cover excessive voxels, transparent surfaces, bones, solvers, animated parts, physics bodies, blueprint entities and network nodes. The warning includes budget context and likely impact.

## 29.5 Background Jobs

A job queue shows progress, priority, owner, estimated stage and errors. Jobs survive workspace switching and may survive restart where safe.

## 29.6 Low-Memory Behaviour

The Forge may unload inactive previews or caches, but never discard unsaved source. Users receive clear notice when preview fidelity is reduced.

# 30. Guided End-to-End Workflows

## 30.1 Workflow A - Create a Standard Block and Icon

1. Choose `New > Standard Block`.
2. Select full cube template and material family.
3. Paint or import six voxel-resolution surfaces.
4. Preview tiling, biome light and damage state.
5. confirm collision and block item link.
6. open Icon Capture Studio and use isometric preset.
7. validate registry, texture channels and icon readability.
8. save draft, approve and bake.

## 30.2 Workflow B - Override an Animated Furnace

1. Open the existing furnace from Library.
2. choose `Edit as Project Override`.
3. replace voxel body and moving gear part.
4. preserve gameplay ports and stable ID.
5. update processing animation and flame event reference.
6. compare against original and test idle, active, blocked and damaged states.
7. regenerate the live-linked icon.
8. validate dependants and bake only changed products.

## 30.3 Workflow C - Create a Humanoid NPC Template

1. Choose humanoid template and compatible skeleton family.
2. set voxel proportions within equipment-safe ranges.
3. create head, face, hair and culture clothing layers.
4. assign job and equipment compatibility profiles.
5. preview expressions and common NPC animations.
6. generate deterministic sample population.
7. place interaction, nameplate and equipment markers.
8. capture dialogue portrait and full-body codex view.
9. validate and submit for review.

## 30.4 Workflow D - Create a Pig Family

1. Choose quadruped pig template.
2. sculpt base voxel body and material pattern.
3. generate or bind standard quadruped rig.
4. preview walk, trot, run, eat, sleep, flee and death clips.
5. configure foot placement and collision.
6. derive domestic, wild boar and corrupted variants.
7. test slope, doorway, pen and water scenarios.
8. capture icons and approve the family.

## 30.5 Workflow E - Create a Spider

1. Choose arthropod template with eight legs.
2. adjust thorax, abdomen, fang and leg proportions.
3. generate mirrored leg chains and marker suggestions.
4. configure alternating gait and climb solver.
5. author bite, leap and death animations.
6. test floor, wall, ceiling and narrow-cave navigation.
7. inspect performance LOD and icon silhouette.
8. approve and package.

## 30.6 Workflow F - Create a Dragon Test Entity

1. Choose dragon body plan.
2. configure neck, tail, legs, wings and head parts.
3. generate base rig and adjust wing/neck constraints.
4. place breath, rider, weak-point and targeting markers.
5. preview ground, take-off, flight, glide, landing and attack clips.
6. test flight space, terrain, breakable wing and LOD transitions.
7. capture codex portrait and boss-card framing.
8. link to a test arena blueprint without embedding boss logic in the model.

## 30.7 Workflow G - Create a Staged Watchtower Blueprint

1. Choose village watchtower template.
2. place physical blocks and functional door/ladder assets.
3. define material roles and forest culture palette.
4. place guard, lookout, entrance and navigation markers.
5. author construction stages and resource summary.
6. add intact, damaged and repaired states.
7. test builder access, guard access, terrain placement and raid sight lines.
8. capture project-board icon and miniature.
9. approve, bake and add to the village project registry.

# 31. Minimum Viable 22J Scope and Staged Delivery

## 31.1 Stage 1 - Unified Shell

Required:

- Workspace navigation.
- work tabs.
- viewport shell.
- outliner and inspector.
- library search.
- asset header.
- save and validation status.

## 31.2 Stage 2 - Specialist Workspace Integration

Required:

- Asset Forge entry points.
- body-plan editor.
- humanoid and creature tabs.
- rig and animation modes.
- Blueprint Forge layers.

## 31.3 Stage 3 - Icon Capture and Test Laboratory

Required:

- saved capture profiles.
- core environment presets.
- validation scenarios.
- test reports.

## 31.4 Stage 4 - Governance and Review

Required:

- lifecycle states.
- dependency view.
- override comparison.
- revision history.
- review comments and approval.

## 31.5 Stage 5 - Bake and Package

Required:

- incremental bake queue.
- product status.
- package builder.
- failure safety.

## 31.6 Required POC Content

- One standard block.
- one animated furnace override.
- one humanoid NPC template.
- one pig family.
- one spider.
- one dragon test entity.
- one staged watchtower blueprint.

## 31.7 Explicit POC Deferrals

- Full Audio Forge.
- full VFX/Particle Forge.
- player-facing creator interface.
- simultaneous real-time collaborative editing.
- complete procedural dungeon suite.
- final console/touch authoring UX.
- every creature and blueprint template.

# 32. Success Criteria and Acceptance Rules

The Unified Forge UI/UX is successful when:

1. A developer can locate any POC content by name, ID, type or status.
2. Asset, Entity and Blueprint workspaces share a consistent shell and interaction language.
3. The current source, override, variant, lifecycle and bake state are always understandable.
4. Source voxels and baked products cannot be confused.
5. Linked assets can be opened without losing task context.
6. A standard block can be created and icon-captured without exposing entity tools.
7. A pig, spider and dragon can be authored from appropriate body templates.
8. Rig, animation, marker and LOD diagnostics are visually inspectable.
9. A watchtower blueprint can be composed, staged, tested and captured inside the Forge.
10. Test failures link to the responsible field, marker, part or dependency.
11. Overrides can be compared and reverted at field level.
12. Autosave and recovery protect unsaved work.
13. Reviewers can understand and approve human or AI-assisted changes.
14. Failed bakes do not replace known-good runtime products.
15. The interface remains usable with large libraries and background jobs.
16. Essential state is not communicated by colour or sound alone.
17. Full audio and particle production remains outside this scope while future hooks are preserved.

## 32.1 Screen Acceptance Questions

Every major screen should answer:

- What content am I viewing?
- What can I do here?
- What mode and selection type are active?
- What is inherited or overridden?
- Is the content valid and saved?
- What depends on it?
- How do I test it?
- How do I return to the previous task?

# 33. Relationships With Documents 22K and 22L

## 33.1 Document 22K - Forge Entity and Blueprint Technical Implementation Plan

Document 22K should translate this UX into:

- Godot editor plugin or application structure.
- panel and workspace ownership.
- selection and command services.
- Resource types.
- source and runtime product stores.
- job queues.
- viewport and overlay systems.
- icon rendering pipeline.
- validation framework.
- revision and package services.
- performance budgets and implementation stages.

22K must preserve the user-facing contracts defined here even if internal classes change.

## 33.2 Document 22L - Entity and Blueprint Visual Production and Migration Plan

Document 22L should use the lifecycle, dashboard, queue, review and package systems defined here to plan production of:

- player humanoids.
- NPC templates.
- animals.
- monsters.
- bosses.
- equipment families.
- structure blueprints.
- legacy migrations.
- required icons and presentation products.

# Appendix A. Unified Screen and Panel Map

| Area | Primary Panels | Bottom/Secondary Panels |
| --- | --- | --- |
| Home | Dashboard, manifest health, queues | Activity and jobs |
| Library | Search, filters, collections, cards/tree | Dependency graph |
| Asset Forge | Outliner, viewport, material/property inspector | Surface canvas, timeline, diagnostics |
| Entity Forge | Body/part outliner, viewport, entity inspector | Graph, rig, animation, variants |
| Blueprint Forge | Structure layers, viewport, placement palette | Stages, networks, validation |
| Test Laboratory | Scenario browser, test viewport, controls | Results, metrics, screenshots |
| Review | Change summary, comparison viewport, comments | Validation and approvals |
| Package | Package contents, dependency list, settings | Build jobs and report |

# Appendix B. Context-Sensitive Tool Matrix

| Selection | Primary Tools | Hidden Unless Requested |
| --- | --- | --- |
| Voxel cells | Add, remove, paint, fill, mirror, transform | Rig and blueprint networks |
| Model part | Transform, pivot, material, duplicate | Surface pixel canvas |
| Bone or joint | Parent, orient, constrain, mirror | Block registry fields |
| Animation key | Move, copy, ease, event | Worldgen placement |
| Gameplay marker | Move, type, contract, validate | Material sculpting |
| Blueprint block | Place, replace, copy, role assign | Entity gait solver |
| Blueprint network node | Connect, capacity, external link | Face painting |
| Icon camera | Frame, light, state, output | Collision authoring |

# Appendix C. Command and Shortcut Families

The final key map belongs to implementation and user settings, but commands should be grouped consistently.

| Family | Commands |
| --- | --- |
| File and Revision | Save Draft, Save Revision, Recover, Compare, Revert |
| Navigation | Search, Frame Selection, Open Linked, Back, Forward |
| Editing | Select, Move, Rotate, Scale, Duplicate, Delete, Mirror |
| View | Toggle Grid, Bounds, Skeleton, Collision, Markers, LOD |
| Workflow | Validate, Test, Capture, Submit, Approve, Bake, Package |
| Timeline | Play, Pause, Step, Add Key, Add Event, Loop |
| Blueprint | Layer Toggle, Stage Step, State Step, Network Validate |

# Appendix D. Lifecycle, Review and Validation Matrix

| Lifecycle | Editable | Required Validation | Review | Runtime Bake |
| --- | --- | --- | --- | --- |
| Concept | Yes | Optional checks | No | No |
| Draft | Yes | Basic source validation | Optional | Development preview only |
| Functional | Yes | Required contracts and dependencies | Optional | Test bake |
| Visual Review | Limited during review | Full required set | Required | Candidate bake |
| Approved | Through new revision | Full pass | Complete | Release-eligible |
| Deprecated | Migration-only | Reference integrity | Maintainer | Fallback only |
| Legacy Fallback | Restricted | Load and migration safety | Maintainer | Existing compatibility |

Severity rules:

| Severity | Behaviour |
| --- | --- |
| Information | Explains status or recommendation. |
| Warning | May proceed with acknowledgement. |
| Error | Cannot approve or release-bake. |
| Critical | Operation blocked to prevent corruption, invalid identity or destructive conflict. |

# Appendix E. POC Workflow Acceptance Tests

| Test | Required Result |
| --- | --- |
| Create block | Surface, collision, item link and icon complete. |
| Override furnace | Base gameplay references preserved; model and animation replaced. |
| Create humanoid | Body, equipment fit, expressions, markers and portrait valid. |
| Create pig | Quadruped rig, locomotion, variants and pen test pass. |
| Create spider | Eight-leg gait, climb test, collision and icon pass. |
| Create dragon | Ground/flight preview, sockets, breakable region and LOD pass. |
| Create watchtower | Layers, stages, NPC access, terrain placement and icon pass. |
| Recovery | Unsaved work can be restored after simulated crash. |
| Override rebase | Parent change produces understandable conflict choices. |
| Failed bake | Known-good runtime output remains untouched. |
| Package | Dependencies, versions, migrations and report are complete. |

# Appendix F. Glossary

| Term | Meaning |
| --- | --- |
| Workspace | A broad Forge area such as Asset, Entity or Blueprint. |
| Editing Mode | The current operation such as sculpt, rig, animate or marker placement. |
| Source Asset | Editable voxel and metadata definition. |
| Runtime Product | Derived mesh, icon, collision, cache or package used by the game. |
| Work Tab | An open content context preserved across workspace changes. |
| Context Chip | Visible indicator of preview variant, state, LOD or environment. |
| Provenance | Where a value originated: base, parent, override, generated or local. |
| Smart Collection | A saved query that updates automatically. |
| Test Scenario | Repeatable setup and expected-result definition in the Test Laboratory. |
| Capture Profile | Saved icon or portrait camera, state, lighting and output settings. |
| Stale Bake | Runtime products are older than their source or dependencies. |
| Partial Approval | Approval of selected content areas while others remain in review. |
| Thin Package | Package that references dependencies already present in the target project. |
| Self-Contained Package | Package that includes all permitted dependencies required for use. |
