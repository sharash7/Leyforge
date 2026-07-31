# Fantasy Voxel Civilisation Sandbox
## 21E - Voxel Asset Forge - UI/UX and Creator Workflow
**Version 0.1 - Detailed Design Bible Draft**

A detailed user-experience specification for operating the Leyforge Voxel Asset Forge, including the developer workspace, asset browser, creation wizards, modelling and painting editors, animation timeline, runtime-state binding, previews, validation, override comparison, recovery, Blueprint Designer integration and end-to-end creator workflows.

## Forge UI/UX and Creator Workflow Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the complete developer-facing information architecture, screens, panels, navigation, viewport behaviour, editing tools, workflow states, previews, diagnostics, recovery, approval and integration required to operate the Voxel Asset Forge. |
| Core Philosophy | The Forge should make complex voxel asset creation feel direct, visual and safe. A creator should understand what they are editing, what will change, what remains inherited and whether the result is valid before it reaches the game. |
| Primary Entry Point | The complete Forge is accessed through the developer section. It opens as a dedicated workspace rather than a small pop-up inside normal gameplay. |
| Workspace Direction | Use a stable editor shell: icon-and-label navigation on the left, a large central viewport or canvas, a collapsible inspector on the right and context-sensitive lower panels for timelines, logs, dependencies and validation. |
| Workflow Direction | Use guided but non-restrictive workflows: select or create asset -> choose type -> author visuals -> configure parts and materials -> animate -> bind states -> preview -> validate -> approve and bake -> use in the game. |
| Mode Direction | Support Block Surface, Voxel Model and Compound Asset workspaces without forcing creators to learn unrelated tools for simple assets. The UI reveals complexity progressively. |
| Override Direction | Existing assets open with clear base-versus-override provenance. Editing an approved built-in asset defaults to a non-destructive project override, with explicit duplicate, variant, migrate and revert actions. |
| Preview Direction | Every important edit should be previewable in the correct context: isolated studio, adjacent block tiling, held item, inventory icon, world placement, machine operation, runtime states and Blueprint Designer use. |
| Animation Direction | Provide a timeline for transform, material, voxel-frame, effect, light and audio tracks, plus a state-binding view that maps authoritative gameplay states to clips and presentation layers. |
| Safety Direction | Undo/redo, autosave, recovery snapshots, validation, dependency checks, compare views and reversible approval are foundation features rather than late polish. |
| Input Direction | Keyboard and mouse are the primary authoring controls. Controller navigation and accessible alternatives should remain possible for preview and basic editing, but complex production tooling must not be weakened to force controller parity. |
| Feedback Direction | Use plain-language statuses and actionable diagnostics. Warnings must identify the affected asset, field, source layer, consequence and recommended correction. |
| Integration Direction | Approved Forge assets become available to the Blueprint Designer, registries, item previews, structures and controlled game test scenes without manual file-path wiring. |
| Implementation Context | The active target is Godot with Summer Engine. This document defines required behaviour and screen contracts; Godot scene, Resource, editor-plugin and service implementation is defined in 21F. |
| MVP Direction | Prove a coherent developer workspace that can create a 32 x 32 block surface, model a unique chute, assemble and animate a furnace, override an existing asset, validate it, bake it and place it immediately in a controlled game and Blueprint Designer preview. |

## Document Purpose

This document defines how a developer actually uses the Voxel Asset Forge. Documents 21A through 21D establish what the Forge is allowed to create and replace: 21A locks its vision and boundaries, 21B defines modelling, texturing and material authoring, 21C defines animation, effects and runtime visual states, and 21D defines overrides, variants, stable IDs and registry integration. Document 21E converts those systems into a coherent editor experience.

The Forge cannot succeed merely by exposing every technical field. Leyforge may eventually contain hundreds or thousands of blocks, items, props, machines, automation components and magical devices. The editor must help the creator find assets, understand their relationships, make changes quickly, preview consequences and recover safely when an experiment fails. Simple assets such as dirt or stone should remain fast to author, while complex assets such as a powered furnace or multi-part crusher can reveal deeper tools only when required.

The developer must also be free to redesign existing assets. Opening an approved furnace should show its stable gameplay identity, current presentation, source layer, inherited fields, overridden fields, required sockets, runtime states and dependent structures. The default editing action should create or update a project visual override rather than destructively modify built-in content. The creator should then be able to compare old and new presentation, test every state, approve the replacement and see it in existing buildings without manually reconnecting recipes or code.

This document does not specify final Godot node classes, file formats or baking algorithms; those belong to 21F. It also does not prescribe the production order for replacing the current game visuals; that belongs to 21G. Its responsibility is the complete human workflow and the screen contracts that the technical implementation must support.

## Engine Status Note

> **Current Project Direction**  
> Leyforge is currently being built in Godot with Summer Engine. The Forge should be designed as a Godot-native developer workspace or tightly integrated in-game developer tool, using data-driven resources and generated runtime products. Earlier Unreal-specific editor language is obsolete; the underlying requirements for stable IDs, validation, non-destructive overrides and safe baking remain valid.

## Design Sources

| Source Document | Relevant Direction | How 21E Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | The visual style is stylised, readable, atmospheric fantasy voxel art with polished presentation rather than full realism. | Requires previews and tools that protect silhouette, tile readability, material identity and world atmosphere. |
| 03 - Blocks Registry | Blocks include many shapes, rotations, states, material families, automation links and village uses. | Requires block-specific creation paths, placement previews, connection overlays and registry-aware validation. |
| 04 - Items Registry | Items require inventory, held, dropped, equipped and placeable representations while remaining linked to stable definitions. | Requires representation previews and clear navigation between linked forms. |
| 08 - Automation System | Machines, chutes, ports, direction, power, visible movement and blocked states must be readable. | Requires compound modelling, socket editing, state simulation and connected-machine test scenes. |
| 09 - Magic System | Mana, runes, conduits, wards, glow, corruption and magical infrastructure have visible state. | Requires emission, effect, state and accessibility previews. |
| 12 - Structures | Blueprints use block families, culture variants, damage and construction states. | Requires Blueprint Designer integration and structure-context previews. |
| 17 - UI/UX System | Interfaces should be polished, inspectable, controller-aware, accessible and not overwhelm the player. | Supplies the readability, progressive disclosure and feedback philosophy used by the developer Forge. |
| 18 - Technical Implementation Plan | Stable IDs, validated registries, safe tools, migrations and diagnostics remain foundation requirements despite its outdated engine direction. | Requires clear provenance, explicit approval, deterministic outputs and recovery workflows. |
| 21A - Voxel Asset Forge Core System | Defines the Forge as a developer-first visual-authoring system with future modding possibilities. | Locks the workspace purpose, access boundary and complete creator flow. |
| 21B - Voxel Modelling, Texturing and Material Authoring | Defines block surfaces, voxel volumes, compound parts, palettes, materials, collision, pivots and sockets. | Supplies the authoring workspaces and tool panels described here. |
| 21C - Animation, Effects and Runtime Visual States | Defines transform, material, voxel-frame, effect, light and audio animation linked to authoritative states. | Supplies the timeline, state-binding, preview and debugging screens. |
| 21D - Asset Overrides, Variants and Registry Integration | Defines non-destructive overrides, variants, provenance, conflicts, fallback and registry contracts. | Supplies override comparison, variant management, dependency, approval and recovery workflows. |

## Static Table of Contents

- 1. Locked Forge UI/UX Identity
- 2. Player Decision and Direction Summary
- 3. UX Principles and Interaction Rules
- 4. Users, Access and Workspace Modes
- 5. Forge Information Architecture
- 6. Main Workspace Shell
- 7. Forge Home and Project Dashboard
- 8. Asset Browser and Search
- 9. New Asset Wizard
- 10. Asset Header, Status and Context Bar
- 11. Central Viewport and Camera Controls
- 12. Selection, Gizmos, Snapping and Measurement
- 13. Block Surface Editor
- 14. Voxel Model Editor
- 15. Compound Asset and Part Assembly Editor
- 16. Outliner, Layers, Parts and Visibility
- 17. Palette, Material and Surface Editor
- 18. Animation Timeline and Clip Editor
- 19. Runtime State Binding Editor
- 20. Effects, Lights and Audio Authoring
- 21. Collision, Footprint, Pivot and Socket Editor
- 22. Item, Held, Dropped and Icon Preview
- 23. World Placement, Tiling and Environment Preview
- 24. Connected Machine and Automation Preview
- 25. Variants, Overrides, Provenance and Comparison
- 26. Validation, Diagnostics and Dependency Review
- 27. Save, Bake, Approval and Export Workflow
- 28. Blueprint Designer Integration
- 29. Workflow: Create a Standard Block
- 30. Workflow: Create a Unique-Shaped Block or Chute
- 31. Workflow: Create an Animated Machine
- 32. Workflow: Override an Existing Asset
- 33. Workflow: Create a Variant Family
- 34. Workflow: Repair or Migrate a Legacy Asset
- 35. Undo, Autosave, Recovery and Version History
- 36. Keyboard, Mouse, Controller and Touch Boundaries
- 37. Accessibility and Comfort
- 38. Performance, Responsiveness and Large Libraries
- 39. Review, Collaboration and Production Status
- 40. Minimum Viable 21E Scope
- 41. Success Criteria and Acceptance Rules
- 42. Relationships With Documents 21F and 21G
- Appendix A. Screen and Panel Map
- Appendix B. Suggested Command and Shortcut Map
- Appendix C. Diagnostic Message Template and Severity Matrix
- Appendix D. Workflow Acceptance Test Matrix
- Appendix E. Glossary and Deferred Decisions

# 1. Locked Forge UI/UX Identity

The Forge UI is the working surface through which Leyforge's visual language is created, replaced and maintained. It must support both rapid low-complexity work and deep multi-part assets without presenting every option at once.

> **Locked Rule**  
> The Forge must always make five things clear: which asset is open, which representation or layer is being edited, where the current value came from, whether the result satisfies its gameplay presentation contract, and what will happen when the creator saves or approves the change.

## 1.1 Core Promise

An authorised developer should be able to:

- Find an existing block, item, material, animation or visual family quickly.
- Create a new asset through an appropriate guided starting template.
- Paint a standard 32 x 32 block without entering the full compound-machine workflow.
- Build a unique voxel shape such as a chute, gear housing or machine component.
- Assemble named parts, pivots and sockets into a functional presentation.
- Animate gears, flames, lights, effects and material states.
- Simulate authoritative states such as active, powered, blocked, damaged or corrupted.
- Preview the result in inventory, hand, world, tiled wall, automation line and blueprint contexts.
- Open an existing approved asset as a safe project override.
- Compare the original, currently approved and draft versions.
- Understand validation failures and repair them without searching raw files.
- Save progress automatically and recover from crashes or abandoned experiments.
- Approve and bake a valid asset so it becomes available immediately to connected developer tools.

## 1.2 Complexity Ladder

| Complexity Level | Typical Asset | Default Workspace | Revealed Tools |
| --- | --- | --- | --- |
| Simple | Dirt, stone, plank, glass | Block Surface | Face painting, palette, tiling, material properties, icon and world preview. |
| Shaped | Chute, railing, sword, chair | Voxel Model | 3D voxel tools, symmetry, slices, collision, pivots, held/placed previews. |
| Compound | Furnace, crusher, chest, mana device | Compound Asset | Part assembly, outliner, sockets, multiple materials, animations and state bindings. |
| Family | Oak/pine chute, culture roofs, weathered stone | Variant Manager | Parent selection, substitutions, overlays, deterministic rules and comparison. |
| Replacement | Redesign of an existing approved asset | Override Workspace | Provenance, base/current/draft comparison, field-level override and revert. |
| Migration | Existing external or legacy asset | Migration Workspace | Wrapper, mapping, missing-contract repair, reconstruction and approval. |

## 1.3 What the UI Is Not

- It is not a raw database editor with a 3D window attached.
- It is not a single enormous screen showing every field for every asset type.
- It is not a destructive editor that overwrites approved built-in sources by default.
- It is not a replacement for the block, item, recipe or machine gameplay registries.
- It is not a full general-purpose 3D modelling package.
- It is not dependent on memorising file paths or internal Godot scene locations.
- It is not allowed to hide errors behind a successful-looking preview.
- It is not required to expose public player modding in the first version.

# 2. Player Decision and Direction Summary

| Area | Locked Decision |
| --- | --- |
| Primary User | Authorised developer or content creator working inside the developer section. |
| Editor Shell | Left navigation with icons and labels, central viewport/canvas, collapsible right inspector and collapsible lower context panel. |
| Default Complexity | Start with the minimum workspace needed for the selected asset type; reveal advanced panels through tabs and explicit mode changes. |
| Entry Methods | Forge Home, Asset Browser, registry links, Blueprint Designer links, validation results and direct Open in Forge actions. |
| New Asset Flow | Use a wizard to choose asset category, gameplay linkage, presentation contract, dimensions, template and initial material family. |
| Existing Asset Flow | Built-in and approved assets open read-only until the creator chooses Edit as Override, Duplicate, Create Variant or Migrate. |
| Viewport | Orthographic and perspective views, standard camera presets, grid, block bounds, voxel coordinates, lighting presets and state simulation. |
| Selection | Consistent selection model across voxels, faces, parts, sockets, pivots, tracks and properties; selection source is visible in the inspector. |
| Undo/Redo | All authoring actions are undoable where technically safe; destructive and generated actions create recovery checkpoints. |
| Autosave | Draft source data autosaves separately from approved data. Crash recovery never silently publishes a draft. |
| Validation | Validation runs continuously for cheap checks and on demand for full contract, dependency, bake and runtime checks. |
| Preview | Studio, tile, held, icon, world, blueprint, machine-line and runtime-state previews are part of authoring, not separate manual test projects. |
| Animation | Timeline supports transform, material, voxel-frame, effect, light and audio tracks. State Binding maps gameplay inputs to visual responses. |
| Overrides | Provenance is visible per field. Compare and revert operate at complete-asset, representation, part, clip and field levels. |
| Approval | Save Draft and Approve/Bake are separate actions. Approval requires valid identity, contract, dependencies and release checks. |
| Integration | Approved assets appear by stable ID in registries, Blueprint Designer and controlled test scenes without manual path entry. |
| Accessibility | High-contrast selection, scalable UI, reduced-motion preview, keyboard navigation, readable icons and non-colour-only status indicators. |
| MVP | Complete one standard block, one chute, one animated furnace and one override through the full workflow. |

# 3. UX Principles and Interaction Rules

## 3.1 World-First Visual Editing

The creator should spend most of the session looking at the asset, not searching property tables. Common visual actions happen directly in the viewport or canvas. The inspector provides precision, metadata and advanced configuration without replacing direct manipulation.

## 3.2 Progressive Disclosure

Simple assets should remain simple. When creating a dirt block, the Forge should not foreground animation tracks, machine ports or held-item grips. When converting the asset into a compound machine, the deeper tools become available through an explicit workspace change.

## 3.3 Visible Context

The same texture can look acceptable in isolation and poor when tiled across a wall. A chute can look correct until it connects to a neighbour. A gear can animate correctly but rotate around the wrong pivot in the complete furnace. Context previews must therefore be one click away and preserve the current draft.

## 3.4 Safe Experimentation

The creator should feel comfortable trying a new silhouette, palette or animation because the base asset remains recoverable. Draft, approved and base states must not be confused. Experimental previews can sit above normal resolution temporarily but must never ship without approval.

## 3.5 Plain-Language Diagnostics

A message should not merely say `socket_missing`. It should say:

```text
Furnace output socket is missing.
The machine contract requires socket.output_item so automation cannot show or route the output correctly.
Add the socket, map an existing socket, or revert the model field to its inherited value.
```

## 3.6 Stable Actions in Stable Locations

Save, undo, redo, preview state, validate and bake should not move between workspaces. The creator can learn the shell once and then focus on the asset-specific tools.

## 3.7 No Silent Cross-System Changes

Changing a model or texture should not edit recipes, processing speed or machine inventory. When a visual edit touches a contract-sensitive field such as footprint, collision or port location, the Forge must visibly elevate the change and require explicit review.

## 3.8 Show Both Friendly and Technical Identity

The asset header should show `Basic Furnace` for readability and `block.machine.basic_furnace` for precise identity. Technical IDs can be copied easily but should not dominate normal creation.

# 4. Users, Access and Workspace Modes

## 4.1 User Roles

| Role | Typical Permissions |
| --- | --- |
| Developer Owner | Create, edit, override, approve, bake, migrate, manage conflicts and change project visual settings. |
| Content Creator | Create and edit assigned assets, submit for review, preview and run validation; approval may be restricted. |
| Reviewer | Compare, comment, run validation, approve or reject according to project permissions. |
| Test User | Open approved assets and test scenes, report issues and capture state/performance data without changing source. |
| Future Mod Creator | Restricted pack-scoped creation and override rights; deferred beyond the initial implementation. |

The first implementation may use only Developer Owner permissions, but screen contracts should not assume every user can approve production content forever.

## 4.2 Workspace Modes

- **Browse:** Find, inspect, compare and open assets.
- **Create:** Build a new asset from a template or blank source.
- **Edit Draft:** Modify editable source belonging to the project.
- **Override:** Patch selected presentation fields of an existing target.
- **Variant:** Create or edit controlled family differences.
- **Review:** Compare, validate, comment and approve without accidental edits.
- **Migration:** Wrap, map or reconstruct legacy content.
- **Preview Only:** Run states and environments without exposing authoring controls.

## 4.3 Access Boundary

The complete Forge is located in the developer section. Normal players do not see raw stable IDs, validation logs, content-pack conflicts or approval actions. A future simplified creator may reuse selected panels, but that is not allowed to weaken the developer tool.

# 5. Forge Information Architecture

## 5.1 Top-Level Navigation

```text
Developer Section
└── Voxel Asset Forge
    ├── Home
    ├── Asset Browser
    ├── Materials and Palettes
    ├── Animation Library
    ├── Variant Families
    ├── Overrides
    ├── Validation Centre
    ├── Bake and Build Queue
    ├── Migration
    ├── Test Scenes
    └── Forge Settings
```

The left navigation uses icons plus text labels and can collapse to icons when extra viewport width is needed. The currently active destination remains obvious through selection, title and breadcrumb.

## 5.2 Asset Workspace Tabs

Multiple assets may be open as tabs. Each tab shows:

- Dirty or saved state.
- Draft, review or approved status.
- Asset type icon.
- Conflict or validation badge.
- Close action with unsaved-change protection.

Pinned tabs remain between sessions. Heavy assets may unload their full preview while preserving the tab and draft state.

## 5.3 Breadcrumb and Linked Navigation

Example:

```text
Asset Browser > Machines > Processing > Basic Furnace > Draft Override
```

Linked records such as block definition, item form, material family, animation set and Blueprint Designer usage appear in a relationship menu rather than forcing the creator back to the browser.

# 6. Main Workspace Shell

## 6.1 Layout

| Region | Default Content | Behaviour |
| --- | --- | --- |
| Top Application Bar | Project, workspace, global save, undo/redo, validation, preview, bake and help. | Always visible; compact and stable. |
| Left Navigation | Forge destinations and optional asset tool shelf. | Icon-and-label layout; collapsible. |
| Asset Header | Display name, stable ID, asset type, status, source layer, breadcrumb and key actions. | Always visible inside an asset tab. |
| Central Workspace | 2D texture canvas, 3D viewport, comparison view or workflow screen. | Receives maximum space. |
| Right Inspector | Properties for current selection, contract, materials, transforms and metadata. | Collapsible, resizable and context-sensitive. |
| Lower Panel | Timeline, state bindings, validation, console, dependencies, bake queue or history. | Collapsible; remembers layout by workspace. |
| Status Bar | Grid size, selection count, coordinates, zoom, camera mode, autosave and background tasks. | Always visible but unobtrusive. |

## 6.2 Workspace Presets

- Surface Painting.
- Voxel Modelling.
- Compound Assembly.
- Animation.
- State and Effects.
- Collision and Sockets.
- Override Comparison.
- Review and Approval.

A workspace preset changes panel arrangement, not the underlying asset. Creators may save personal layouts, while the project retains a recoverable default.

## 6.3 Focus Mode

Focus Mode hides navigation and secondary panels, leaving the canvas or viewport with a compact tool bar. A visible exit control and shortcut prevent users becoming trapped. Diagnostics that require attention appear as non-obstructive badges until Focus Mode closes.

# 7. Forge Home and Project Dashboard

Forge Home answers: what needs work, what changed and what should be reviewed next?

## 7.1 Dashboard Cards

- Continue Recent Asset.
- Create New Asset.
- Assets Awaiting Review.
- Validation Failures.
- Conflicting Overrides.
- Out-of-Date Bakes.
- Legacy Assets Awaiting Migration.
- Visual Overhaul Milestone Progress.
- Recent Approved Changes.

## 7.2 Work Queues

| Queue | Contents | Primary Action |
| --- | --- | --- |
| My Drafts | Editable unfinished assets. | Continue editing. |
| Review Required | Submitted assets needing approval. | Open comparison and validation. |
| Blocked | Missing dependencies, conflicts or release blockers. | Open diagnostic resolution. |
| Rebuild Required | Source changed after last bake. | Add to bake queue. |
| Migration | Legacy assets with incomplete Forge mapping. | Continue migration. |
| Recently Approved | Approved content and change summary. | Preview or revert approval. |

## 7.3 Project Health Summary

The dashboard may display counts, but it should emphasise actionable categories rather than turning asset work into a noisy analytics screen. Clicking a count opens the exact filtered list.

# 8. Asset Browser and Search

## 8.1 Browser Layout

The Asset Browser has:

- Filter and collection tree on the left.
- Grid or list results in the centre.
- Collapsible preview and metadata inspector on the right.
- Search and saved views at the top.
- Batch actions and selection summary at the bottom or contextual toolbar.

## 8.2 Searchable Fields

- Display name.
- Stable ID.
- Category and subcategory.
- Asset type and authoring mode.
- Material family.
- Gameplay definition.
- Presentation contract.
- Tags.
- Status.
- Source layer and content pack.
- Validation severity.
- Blueprint or structure usage.
- Animation or state capability.
- Modified date and author.

## 8.3 Saved Filters and Collections

Examples:

```text
POC Required
Forest Hamlet Building Set
Needs New 32 x 32 Texture
Animated Machines
Missing Damaged State
Current Visual Overhaul Sprint
Project Overrides Only
Legacy Wrapper Assets
```

Collections should reference assets by stable ID rather than copy them.

## 8.4 Result Cards

Each result card shows:

- Thumbnail or animated preview when affordable.
- Display name and asset type.
- Stable ID on hover or expanded view.
- Status and validation badge.
- Source or override indicator.
- Variant count.
- Last modified time.

Animation thumbnails remain paused by default to reduce distraction and performance cost. Hover or a play control activates them.

## 8.5 Batch Actions

- Validate selected.
- Add to collection.
- Add to bake queue.
- Change production status.
- Assign reviewer.
- Export dependency report.
- Create variant family.
- Compare selected assets.

Destructive batch actions require a summary and recovery checkpoint.

# 9. New Asset Wizard

The wizard reduces setup errors without becoming a mandatory linear tutorial for experienced creators.

## 9.1 Wizard Steps

1. **Choose intent:** New gameplay-linked presentation, visual-only prop, duplicate, variant or override.
2. **Choose asset category:** Standard block, shaped block, item, prop, station, machine, automation part, magic device or other supported category.
3. **Choose authoring mode:** Block Surface, Voxel Model or Compound Asset.
4. **Link identity:** Select an existing gameplay definition or create an unlinked presentation draft awaiting registry work.
5. **Choose presentation contract:** Suggested automatically from the linked definition, with warnings for incompatible choices.
6. **Choose dimensions and scale:** Face resolution, voxel volume, world footprint and representation forms.
7. **Choose template:** Blank, existing family, common machine, item, construction piece or project template.
8. **Choose initial materials:** Palette and Material DNA family.
9. **Review:** Show IDs, inherited records, required parts/states and initial files to be created.
10. **Create Draft:** Open the correct workspace with a recovery snapshot.

## 9.2 Quick Create

Experienced creators can use Quick Create from the Asset Browser:

```text
New > Standard Block > 32 x 32 Six-Face Template
New > Voxel Item > 32 x 32 x 32
New > Unique Block > One-Block Footprint
New > Compound Machine > Basic Powered Machine Contract
```

Quick Create still generates valid defaults and immediately shows unresolved required fields.

## 9.3 Naming and ID Assistance

The wizard suggests a stable ID based on category and name, checks for collisions and explains that display names can change while released IDs should remain stable.

# 10. Asset Header, Status and Context Bar

## 10.1 Required Header Information

```text
Basic Furnace
block.machine.basic_furnace
Compound Asset | Project Override | Draft | 2 Warnings
```

The header includes:

- Display name.
- Stable gameplay or presentation ID.
- Authoring mode.
- Current source layer.
- Draft/review/approved/deprecated status.
- Validation summary.
- Save state.
- Current representation and variant context.

## 10.2 Primary Actions

- Save Draft.
- Validate.
- Preview.
- Compare.
- Submit for Review.
- Approve and Bake.
- More: Duplicate, Create Variant, Edit as Override, Revert, Export Report, Open Linked Record.

Approve and Bake should never be visually confused with Save Draft.

## 10.3 Context Chips

Context chips show active preview conditions such as:

```text
Representation: World
Variant: Forest Human / Oak
State: Processing
Environment: Warm Workshop
LOD: Near
```

Clicking a chip opens the relevant selector.

# 11. Central Viewport and Camera Controls

## 11.1 Camera Modes

- Perspective.
- Orthographic.
- Front, back, left, right, top and bottom.
- Isometric presets.
- Held-item camera.
- Inventory-icon camera.
- Player eye-height camera.
- Blueprint and block-grid camera.

## 11.2 Navigation

Keyboard and mouse defaults should follow familiar 3D editor conventions where practical:

- Orbit around selection.
- Pan.
- Zoom/dolly.
- Frame selected.
- Frame all.
- Fly camera for world preview.
- Speed modifier.

All controls must be remappable and displayed in an in-context shortcut guide.

## 11.3 View Overlays

- World grid and block bounds.
- Voxel grid and slice boundary.
- Axes and orientation.
- Collision.
- Placement footprint.
- Pivots.
- Sockets and connection directions.
- Normals and face orientation.
- Light and emission preview.
- Animation paths.
- LOD or bake wireframe.
- Overdraw or material-slot diagnostic.

Only relevant overlays are shown by default. Overlay state is remembered per workspace.

## 11.4 Lighting and Background Presets

- Neutral studio.
- Bright outdoor daylight.
- Warm village interior.
- Dark cave.
- Moonlit night.
- Mana-lit environment.
- Flat unlit diagnostic.
- High-contrast silhouette.

Custom lighting does not change the asset; it only tests readability.

## 11.5 Viewport Split

The viewport can split into:

- Perspective plus orthographic.
- Base versus draft.
- Idle versus active state.
- Near versus far LOD.
- Standard versus reduced-motion presentation.

The default remains one large viewport to avoid clutter.

# 12. Selection, Gizmos, Snapping and Measurement

## 12.1 Selection Types

- Voxel.
- Face.
- Region or volume.
- Part.
- Material slot.
- Pivot.
- Socket.
- Collision shape.
- Animation track or key.
- Effect/light/audio emitter.

The selection type is shown in the status bar and inspector heading.

## 12.2 Selection Tools

- Click.
- Box selection.
- Lasso for 2D surfaces.
- Paint selection.
- Select connected.
- Select by material.
- Select mirrored region.
- Grow/shrink selection.
- Invert selection.
- Save selection set.

## 12.3 Transform Gizmos

Move, rotate and scale gizmos operate on parts and supported components. Voxel editing uses draw/extrude/erase tools rather than arbitrary sub-voxel scaling. Pivots and sockets can be positioned numerically in the inspector.

## 12.4 Snapping

- Voxel grid.
- Half or quarter voxel where a contract permits sockets or pivots.
- Block grid.
- Surface.
- Part origin.
- Named socket.
- Angle increments.
- Symmetry plane.

The active snapping mode is always visible.

## 12.5 Measurement

A measurement tool reports:

- Voxel dimensions.
- World dimensions.
- Distance between parts or sockets.
- Footprint extents.
- Pivot offset.
- Collision bounds.

# 13. Block Surface Editor

The Block Surface Editor is optimised for standard block families and 32 x 32 base textures.

## 13.1 Canvas Layout

Creators can switch between:

- Single face.
- Cross/unwrapped six-face layout.
- Three-face corner preview.
- Live 3D cube.
- Tiled wall/floor preview.

Editing one view updates the others immediately.

## 13.2 Face Linking

Each face can be:

- Unique.
- Linked to another face.
- Mirrored.
- Rotated from a source face.
- Generated from a material rule.
- Inherited from a parent block.

Examples include shared north/east/south/west sides, unique top and bottom for logs, or one repeated stone texture on all faces.

## 13.3 Painting Tools

- Pencil and eraser.
- Line.
- Rectangle and ellipse.
- Fill contiguous and fill all matching.
- Colour replace.
- Gradient with pixel-safe stepping.
- Noise and controlled scatter.
- Stamp and reusable motif.
- Copy/paste region.
- Mirror and rotational symmetry.
- Lighten, darken, hue shift and palette remap.
- Edge wrap preview.

## 13.4 Channels

The editor can display and edit:

- Base colour/palette index.
- Transparency/cut-out.
- Emission.
- Height or normal-source mask.
- Roughness role.
- Metallic role.
- Overlay masks for damage, moss, snow, corruption or magic.

Channels should use clear tabs and composite preview rather than multiple permanently visible canvases.

## 13.5 Tiling Diagnostics

- Repeating seam highlight.
- Edge mismatch arrows.
- Obvious-pattern heat map.
- Rotation/random-variant preview.
- Connected-texture neighbour patterns.
- Distance readability preview.

## 13.6 Standard Block Completion Panel

The completion panel shows:

- All required faces assigned.
- Material DNA linked.
- Transparency and render mode valid.
- Icon generated.
- World tile preview checked.
- Registry link valid.
- Bake status.

# 14. Voxel Model Editor

## 14.1 Volume and Slice Views

The model can be edited in 3D or by X, Y and Z slices. Slice controls include:

- Current layer.
- Previous/next layer.
- Ghost layers before and after.
- Isolation of selected material or region.
- Slice copy, duplicate, reverse and clear.

## 14.2 Modelling Tools

- Add/remove voxel.
- Brush with configurable size and shape.
- Line and path.
- Box, cylinder-like voxel form and sphere-like voxel form.
- Extrude face or selection.
- Hollow and shell.
- Flood fill enclosed region.
- Replace material.
- Mirror across X, Y or Z.
- Radial or rotational repetition for gears and wheels.
- Duplicate and transform selection.
- Boolean union/subtract/intersect for temporary primitives where supported.

## 14.3 Symmetry

Symmetry planes are visible and individually enabled. Creators can apply symmetry destructively or keep it live until committed. The Forge must warn before edits that would break a locked symmetry relationship.

## 14.4 Model Bounds and Density

The editor shows:

- Editable volume bounds.
- Occupied bounds.
- World scale.
- Voxel count.
- Exposed-face estimate.
- Baked triangle estimate.
- Material-slot count.

Performance estimates update in the background without blocking every brush stroke.

## 14.5 Item and Unique Block Context

The same voxel source can be previewed as:

- World block.
- Held item.
- Dropped item.
- Inventory icon.
- Display prop.

Representation-specific transforms are edited in the Preview workspace rather than by distorting the source model.

# 15. Compound Asset and Part Assembly Editor

## 15.1 Part Model

A compound asset consists of named parts. A part may be:

- Forge voxel model.
- Generated primitive.
- Approved imported mesh wrapper.
- Effect-only anchor.
- Collision-only helper.
- Logical grouping node.

## 15.2 Assembly View

The viewport and Outliner show a hierarchy such as:

```text
basic_furnace
├── body
├── front_door
├── left_gear
├── right_gear
├── internal_flame
├── smoke_socket
├── input_socket
├── output_socket
└── interaction_socket
```

## 15.3 Part Operations

- Add, rename, duplicate and remove.
- Reparent.
- Set local origin.
- Set pivot.
- Lock transform.
- Hide, solo or ghost.
- Assign material slots.
- Mark static or animated.
- Mark required by contract.
- Convert selected voxels into a new part.
- Merge compatible parts.

## 15.4 Contract Overlay

Required parts and sockets appear as placeholders when missing. The creator can map an authored part to a required role rather than being forced to use one display name.

## 15.5 Multi-Block Assets

For assets occupying more than one block, the assembly editor displays:

- Complete placement footprint.
- Origin block.
- Occupied cells.
- Rotation result.
- Clearance volume.
- Interaction cells.
- Structure and save compatibility warnings.

# 16. Outliner, Layers, Parts and Visibility

## 16.1 Outliner Functions

The Outliner supports:

- Hierarchical parts.
- Surface and material layers.
- Collision and socket groups.
- Animation visibility.
- State-generated overlays.
- Search and filter.
- Lock, hide, solo and ghost controls.
- Drag-and-drop reordering where order is meaningful.

## 16.2 Layer Types

- Base geometry.
- Detail geometry.
- Material overlay mask.
- Damage layer.
- Weathering layer.
- Magical charge layer.
- Corruption layer.
- Effect/light/audio group.
- Editor-only guides.

## 16.3 Readability Rules

Icons, labels and colour accents may distinguish types, but status must never rely on colour alone. Locked, inherited, overridden, missing and invalid states also use shapes, badges and text.

# 17. Palette, Material and Surface Editor

## 17.1 Palette Panel

The palette shows named entries rather than anonymous colour swatches only:

```text
Oak Midtone
Oak Shadow
Iron Edge
Iron Dark
Ember Core
Soot
```

Each entry can expose base colour, emission role and Material DNA mapping.

## 17.2 Material DNA Inspector

The inspector shows:

- Material family and parent.
- Palette mapping.
- Surface response.
- Roughness/metallic roles.
- Transparency mode.
- Emission limits.
- Sound and particle surface tags where relevant.
- Compatible overlays.
- Biome/culture substitutions.
- Inheritance and override provenance.

## 17.3 Material Preview Objects

- Cube.
- Sphere-like voxel form.
- Flat tile.
- Stairs/slab family.
- Current asset.
- Wet, snowy, damaged and magical state comparisons.

## 17.4 Palette Remapping

Creators can remap one model to another material family non-destructively. The Forge previews all changed palette roles and warns when a required role has no destination.

# 18. Animation Timeline and Clip Editor

## 18.1 Timeline Layout

| Region | Purpose |
| --- | --- |
| Clip List | Create, duplicate, rename, organise and select clips. |
| Track List | Parts, materials, voxel frames, effects, lights and audio. |
| Time Ruler | Frames/seconds, playback range and markers. |
| Key Area | Keys, spans, events and interpolation. |
| Playback Controls | Play, pause, loop, step, speed and reduced-motion preview. |
| Property Inspector | Exact values for selected track/key. |

## 18.2 Track Types

- Part transform.
- Visibility.
- Material parameter.
- Palette/emission role.
- Voxel-frame or mesh-frame.
- Particle/effect activation.
- Light intensity/colour role.
- Audio event or loop.
- Marker/event for presentation synchronisation.

## 18.3 Common Clip Templates

- Continuous rotation.
- Ping-pong piston.
- Open/close hinge.
- Ignite and extinguish.
- Processing loop.
- Warning pulse.
- Damage flicker.
- Floating/bobbing crystal.

Templates create editable tracks rather than opaque locked effects.

## 18.4 Playback Context

The timeline can play:

- Isolated clip.
- Clip plus base state layers.
- Transition between states.
- Full state-machine response.
- Connected machine simulation.

## 18.5 Key Editing

- Add/delete key.
- Copy/paste keys.
- Multi-select and move.
- Scale timing.
- Snap to frame, marker or beat.
- Change interpolation where supported.
- Set loop range.
- Preview reverse.

Transform loops should provide a direct cycles-per-second or rotations-per-cycle field so creators need not manually place repetitive keys.

# 19. Runtime State Binding Editor

The State Binding Editor answers: when the game reports a real state, what should the asset show?

## 19.1 Layout

- Authoritative inputs on the left.
- Visual response graph or ordered binding list in the centre.
- Resolved output and conflict inspector on the right.
- State simulation controls above the preview.
- Transition and priority timeline below when needed.

## 19.2 Input Examples

```text
powered: true/false
processing: true/false
output_blocked: true/false
damage_ratio: 0.0-1.0
heat_ratio: 0.0-1.0
mana_charge: 0.0-1.0
corrupted: true/false
facing: north/east/south/west
```

## 19.3 Binding Actions

- Play clip.
- Stop or pause clip.
- Set playback speed.
- Enable part or layer.
- Set material parameter.
- Enable effect, light or audio.
- Select damage stage.
- Apply overlay.
- Blend between values.
- Trigger one-shot transition.

## 19.4 Priority and Layering

The editor must show when responses can coexist. For example, processing animation may continue while a damage overlay is enabled, but an output-blocked rule may pause gears and start a warning light. Conflicts should be visualised before runtime.

## 19.5 State Presets

- Idle.
- Powered idle.
- Processing.
- Output blocked.
- Unpowered.
- Damaged.
- Overheated.
- Corrupted.
- Custom contract state.

Presets fill valid test input combinations but do not replace exact field control.

# 20. Effects, Lights and Audio Authoring

## 20.1 Effect Socket Workflow

1. Add or select an effect socket.
2. Position and orient it in the viewport.
3. Choose effect family or placeholder.
4. Set scale and local bounds.
5. Bind activation to a clip or state.
6. Preview near, medium and reduced-effects modes.
7. Validate missing or excessive effect use.

## 20.2 Light Authoring

Light controls should focus on presentation roles:

- Warm flame.
- Mana glow.
- Warning.
- Corruption.
- Portal.

The final implementation may use shared light profiles. The creator sets role, range, intensity and state binding while performance warnings prevent every small asset from adding expensive lights without review.

## 20.3 Audio Authoring

- One-shot activation.
- Loop while processing.
- Stop/fade event.
- Warning loop.
- Impact or door sound.
- Spatial origin and range.
- Variation set.

Waveform editing is outside scope; the Forge links and previews approved audio assets.

## 20.4 Accessible Alternatives

Critical information conveyed by a sound or flashing light must also have another readable response such as motion, icon, material state or inspect text.

# 21. Collision, Footprint, Pivot and Socket Editor

## 21.1 Editor Tabs

- Placement Footprint.
- Collision.
- Pivots.
- Sockets.
- Interaction Anchors.
- Connection Ports.

## 21.2 Collision Tools

- Auto-generate simplified bounds.
- Box and compound box shapes.
- Convex approximation where approved.
- Manual edit of simple shapes.
- Player, item, projectile and interaction overlays.
- Compare collision to visible silhouette.

Per-voxel collision should not be the default for complex assets.

## 21.3 Footprint Editing

The block grid shows occupied and reserved cells. Changes to an approved footprint display a high-severity contract warning and open the migration impact list.

## 21.4 Pivot Editing

Pivots can be:

- Placed directly.
- Snapped to voxel, part origin or bounds.
- Entered numerically.
- Previewed through test rotation or hinge motion.

## 21.5 Socket Editing

Each socket shows:

- Name and stable role.
- Type.
- Position and orientation.
- Owning part.
- Required/optional status.
- Connected state or effect.
- Contract mapping.

Connection sockets display direction arrows and compatible neighbour types.

# 22. Item, Held, Dropped and Icon Preview

## 22.1 Representation Tabs

- Inventory Icon.
- Held First Person.
- Held Third Person.
- Dropped Item.
- Equipment/Attachment.
- Display Stand.
- Block Item Form.

## 22.2 Held-Item Preview

Use reference hands or character rigs without making them editable character systems. Creators can adjust:

- Grip socket.
- Position.
- Rotation.
- Scale within approved limits.
- Handedness.
- Basic swing/use preview.

## 22.3 Icon Studio

The Icon Studio provides:

- Standard camera presets.
- Background and border test styles.
- Framing guides.
- Lighting presets.
- Rarity-border preview.
- Automatic render and manual adjustment.
- Comparison at actual inventory size.

Icons should be generated from the approved presentation where practical, with override support for special cases.

# 23. World Placement, Tiling and Environment Preview

## 23.1 Test Environments

- Flat block grid.
- Wall and floor tiling room.
- Forest Hamlet building shell.
- Workshop interior.
- Outdoor daylight/night.
- Cave.
- Water edge.
- Snow/rain/wetness state.
- Corruption or mana test zone.

## 23.2 Placement Tests

- Rotate through all allowed orientations.
- Place beside same family.
- Place beside different materials.
- Stack vertically.
- Use stairs, slabs or generated shapes where linked.
- Test transparency and face culling.
- Inspect selection outline.
- Check break/damage overlay.

## 23.3 Distance and Readability

Preview distances represent close interaction, normal building view and distant settlement view. Silhouette and active-state communication should survive normal gameplay distance.

# 24. Connected Machine and Automation Preview

## 24.1 Machine Test Bench

The controlled test bench can connect:

```text
Input Chest -> Chute -> Furnace -> Output Chute -> Storage
```

The creator can simulate:

- No power.
- Powered idle.
- Input arriving.
- Processing.
- Output moving.
- Output blocked.
- Damage or overload presentation.

## 24.2 Connection Overlay

The preview displays:

- Input/output directions.
- Port compatibility.
- Item path.
- Power or mana link.
- Blocked connection.
- Socket mismatch.

## 24.3 Visual-Only Simulation

The Forge test bench may use simulated state inputs for rapid authoring, but the final approval test should also run against the real machine state contract in a controlled game scene.

# 25. Variants, Overrides, Provenance and Comparison

## 25.1 Override Banner

When editing an existing asset, a persistent banner states:

```text
Editing Project Visual Override
Base asset remains read-only.
Gameplay identity and recipes are unchanged.
```

## 25.2 Provenance Inspector

Every relevant field displays one of:

- Built-in.
- Parent/inherited.
- Project override.
- Content-pack override.
- World-specific override.
- Draft preview.

Clicking provenance shows source ID, version and change summary.

## 25.3 Comparison Modes

- Base vs current approved.
- Current approved vs draft.
- Base vs draft.
- Variant A vs Variant B.
- State A vs State B.
- Near vs far presentation.

Comparisons can use side-by-side, split-screen wipe, flicker toggle or field-difference list. Flicker is disabled in reduced-motion mode.

## 25.4 Field-Level Revert

The inspector offers:

- Revert field to inherited.
- Revert part.
- Revert representation.
- Revert clip.
- Revert complete draft override.

A preview summary shows what will change before confirmation.

## 25.5 Variant Manager

The Variant Manager displays:

- Parent profile.
- Variant dimensions.
- Selection source.
- Material and geometry patches.
- Compatibility tags.
- Fallback.
- Deterministic seed preview.
- Combination coverage and conflicts.

# 26. Validation, Diagnostics and Dependency Review

## 26.1 Validation Levels

| Level | Timing | Examples |
| --- | --- | --- |
| Live | During editing | Missing face, out-of-bounds voxel, duplicate part name, invalid palette role. |
| Workspace | On mode change or explicit run | Missing pivot, socket mapping, broken clip track, unsupported material channel. |
| Contract | Before review/approval | Required representation, state, part, footprint, collision or connection failure. |
| Bake | Before/after bake | Mesh generation, texture packing, icon render, cache and output failure. |
| Runtime | Controlled test scene | State response, connection, save reload, LOD or performance failure. |
| Release | Project build gate | Duplicate ID, unresolved conflict, missing dependency, migration or save compatibility blocker. |

## 26.2 Diagnostics Panel

Each diagnostic includes:

- Severity.
- Clear title.
- Affected asset and field.
- Source layer.
- Consequence.
- Suggested fix.
- Focus control to select the problem.
- Documentation link where available.
- Suppression/exception control only for permitted warnings.

## 26.3 Dependency View

The dependency view shows both directions:

- What this asset requires.
- What uses this asset.

Examples include materials, animation sets, block definitions, item forms, recipes, structures, blueprints and content packs.

## 26.4 Validation Summary

```text
Valid for Preview
2 Warnings
1 Bake Required
Not Ready for Approval: required output socket missing
```

The summary must distinguish a playable fallback from an asset that is actually ready to ship.

# 27. Save, Bake, Approval and Export Workflow

## 27.1 Save States

- Unsaved local edit.
- Autosaved recovery draft.
- Saved project draft.
- Submitted for review.
- Approved source.
- Baked and current.
- Approved but bake out of date.
- Deprecated.

## 27.2 Save Draft

Save Draft stores editable source and metadata. It may contain warnings or incomplete work. It does not replace approved runtime presentation.

## 27.3 Submit for Review

Submission runs required validation and captures:

- Change summary.
- Comparison snapshot.
- Dependency impact.
- Known warnings.
- Required exceptions.
- Reviewer notes.

## 27.4 Approve and Bake

Approval requires permission and passes the configured gates. The action:

1. Freezes an approved source revision.
2. Bakes runtime products.
3. Runs post-bake validation.
4. Updates registry resolution.
5. Refreshes controlled preview and developer test scenes.
6. Records provenance and approval history.

A failed bake leaves the last valid approved runtime product active.

## 27.5 Export

Export may create:

- Project content package.
- Review bundle.
- Diagnostic report.
- Thumbnail sheet.
- Dependency manifest.
- Future content-pack package.

Raw exports do not bypass approval or registry validation.

# 28. Blueprint Designer Integration

## 28.1 Asset Availability

Approved block and placeable assets appear in Blueprint Designer categories using stable registry IDs. Draft assets may be exposed only in developer-preview mode with a clear draft badge.

## 28.2 Open in Forge

From the Blueprint Designer, a creator can:

- Open selected block in Forge.
- Create a visual override.
- Open material family.
- Inspect variant family.
- Report missing shape or visual state.

Returning to the Blueprint Designer preserves camera, selection and unsaved blueprint draft.

## 28.3 Live Refresh

After a valid developer bake, the controlled Blueprint Designer preview refreshes affected assets without replacing stable block IDs. The creator can inspect the same building before and after the visual change.

## 28.4 Family Substitution

Blueprint palettes may request a family such as oak roof or human forest trim. The Forge's Variant Manager shows how those requests resolve and warns when a family lacks required shapes.

## 28.5 Structure Context Preview

A Forge asset can be previewed inside one or more reference buildings, especially:

- Forest Hamlet house.
- Watchtower.
- Workshop.
- Warehouse.
- Mage or rune structure.

Reference structures are test contexts, not separate copies of the asset.

# 29. Workflow: Create a Standard Block

## 29.1 Example: Stone Brick

1. Open Forge Home and select Create New Asset.
2. Choose Standard Block and Block Surface mode.
3. Link or create the intended block presentation record.
4. Confirm 32 x 32 face resolution and one-block footprint.
5. Select stone Material DNA and a stone-brick template.
6. Paint or generate the face texture.
7. Link repeated side faces and define top/bottom where needed.
8. Preview a single cube, tiled wall, floor and mixed-material corner.
9. Test neutral, wet, mossy, damaged and biome-overlay states.
10. Generate or frame the inventory icon.
11. Run live, contract and bake validation.
12. Save Draft.
13. Compare against related stone family assets.
14. Submit, approve and bake.
15. Open the block in Blueprint Designer and test it in a wall and watchtower.

## 29.2 Completion Rule

A standard block is not complete merely because one face looks attractive. It must tile, remain readable at gameplay distance, satisfy required channels and work inside its generated shape or material family.

# 30. Workflow: Create a Unique-Shaped Block or Chute

1. Choose Unique-Shaped Block or Automation Part.
2. Select Voxel Model mode and the chute presentation contract.
3. Confirm one-block footprint, facing and connection directions.
4. Build the trough and supports using voxel tools and symmetry.
5. Assign wood and metal material roles.
6. Add input and output sockets and show direction arrows.
7. Generate simplified collision.
8. Preview all rotations and neighbouring chute connections.
9. Simulate visible item passage or the associated presentation clip.
10. Test oak, pine and culture trim variants without duplicating the entire model.
11. Validate connection contract, footprint and blocked-state readability.
12. Bake and place the chute in the machine test bench.

# 31. Workflow: Create an Animated Machine

## 31.1 Example: Basic Furnace

1. Create a Compound Machine draft from the basic powered-machine template.
2. Assemble body, door, gears and internal flame as named parts.
3. Map required interaction, input, output, smoke and sound sockets.
4. Assign material roles and active emission channels.
5. Create clips: ignite, processing loop, output blocked warning and extinguish.
6. Use transform animation for gears, material animation for heat glow and effect sockets for flame/smoke.
7. Open State Binding and map powered, processing, output blocked, heat and damage inputs.
8. Preview each preset and transitions between them.
9. Run connected-machine simulation with input and output chutes.
10. Check reduced-motion and reduced-effects modes.
11. Generate collision and item/icon representations.
12. Validate all required states and sockets.
13. Save, compare, approve and bake.
14. Test the real furnace logic in a controlled game scene and reload its save state.

# 32. Workflow: Override an Existing Asset

1. Find the asset in Asset Browser or select Open in Forge from the game/Blueprint Designer.
2. Inspect gameplay identity, current presentation, dependencies and provenance.
3. Choose Edit as Project Override.
4. Select the scope: model, textures/materials, animation, complete presentation or advanced field-level override.
5. Create a draft based on the current resolved presentation.
6. Make visual changes while inherited fields remain locked or clearly marked.
7. Compare base, current approved and draft.
8. Run contract and dependency validation.
9. Preview existing variants, states, structures and item representations.
10. Save Draft and write a change summary.
11. Approve and bake when valid.
12. Load representative existing worlds or blueprints to confirm stable gameplay identity and presentation refresh.
13. Retain the previous approved version as a recoverable revision.

# 33. Workflow: Create a Variant Family

1. Open the intended parent asset.
2. Choose Create Variant Family or add to an existing family.
3. Select variant dimension: material, culture, biome, condition, magic, quality, season, seed or upgrade.
4. Choose the selector source and default fallback.
5. Add variants using material substitution, overlays and only necessary geometry differences.
6. Preview every variant beside its parent.
7. Test combinations with damage, wetness, snow, magic and corruption layers.
8. Run deterministic selection previews with known seeds.
9. Validate missing roles, unsupported combinations and generated shape coverage.
10. Approve the family and confirm Blueprint Designer substitution.

# 34. Workflow: Repair or Migrate a Legacy Asset

1. Open Migration and select a legacy scene, mesh or texture mapping already used by the project.
2. Match it to the correct stable gameplay and presentation IDs.
3. Create a Legacy Wrapper so the current appearance continues to work.
4. Map existing materials, collision, sockets and animations where present.
5. View missing presentation-contract requirements.
6. Choose gradual reconstruction or complete Forge rebuild.
7. Compare legacy and reconstructed presentation.
8. Test dependent structures and saves.
9. Approve the Forge source while retaining rollback to the wrapper.
10. Mark the legacy source deprecated only after all references and runtime products are verified.

# 35. Undo, Autosave, Recovery and Version History

## 35.1 Undo/Redo Scope

Undoable actions include:

- Painting and voxel edits.
- Selection transforms.
- Part hierarchy changes.
- Palette/material assignments.
- Keys and tracks.
- Socket and pivot movement.
- State-binding edits.
- Field-level override operations.

Large generated operations may create a checkpoint rather than store every internal step.

## 35.2 Autosave

Autosave stores recovery drafts at a configurable interval and after important operations. It should:

- Never replace approved source automatically.
- Show last autosave time.
- Pause safely during destructive migration or bake operations.
- Resume without interrupting brush strokes.
- Limit retained snapshots by count and age.

## 35.3 Crash Recovery

On reopening the Forge, the user sees:

```text
A recovery draft newer than the last saved draft was found for Basic Furnace.
Open recovery copy | Compare | Discard
```

Discarding a recovery copy should remain reversible until the current recovery session ends.

## 35.4 Version History

History records:

- Saved draft revisions.
- Review submissions.
- Approvals.
- Reverts.
- Bake outputs and hashes.
- Change summary.
- Author/reviewer.
- Validation result.

Creators can compare or restore a revision as a new draft. Restoring should not erase later history.

# 36. Keyboard, Mouse, Controller and Touch Boundaries

## 36.1 Primary Authoring Input

Keyboard and mouse are primary because voxel painting, multi-selection, precision timeline editing and compound assembly require efficient pointing and shortcuts.

## 36.2 Suggested Interaction Families

- Left click: select or apply active tool.
- Right click: erase, alternate action or context menu depending on workspace.
- Middle mouse: pan/orbit according to viewport mode.
- Modifier keys: add/subtract selection, snap override, duplicate or precision movement.
- Number/letter shortcuts: tools and camera presets.
- Space: playback or temporary pan according to context, with conflict-safe remapping.

Exact defaults are listed in Appendix B and should be user-remappable.

## 36.3 Controller Support

Controller should support:

- Forge navigation.
- Asset browsing.
- Preview rotation and state selection.
- Basic voxel placement/removal.
- Palette selection.
- Review and validation.

Advanced timeline, bulk selection and dense property editing may remain keyboard/mouse-first. The UI must not claim full controller parity where it would be inefficient or misleading.

## 36.4 Touch

Touch may support preview and simple painting on compatible devices later. Full touch-first authoring is deferred.

# 37. Accessibility and Comfort

## 37.1 Visual Accessibility

- Scalable interface text and panels.
- High-contrast theme options.
- Selection outlines that remain visible against light, dark and emissive assets.
- Status icons plus text, never colour alone.
- Colour-vision preview filters for critical machine states.
- Pattern or shape alternatives for warnings and connection directions.

## 37.2 Motion and Flashing

- Reduced-motion preview.
- Pause animation globally.
- Limit playback speed.
- Disable flicker comparison.
- Flash-frequency warning for authored effects.
- Reduced-effects preview.

## 37.3 Audio Accessibility

- Visual event markers on the timeline.
- Captions or labels for previewed sound roles.
- Non-audio presentation requirement for critical states.

## 37.4 Input Accessibility

- Full shortcut remapping.
- Sticky modifier option.
- Adjustable double-click timing.
- Alternate navigation for drag-dependent actions.
- Numeric entry for precision tasks.
- Undo for accidental high-impact actions.

## 37.5 Cognitive Load

- Progressive disclosure.
- Clear workspace names.
- Consistent action placement.
- Tooltips with short first line and expandable detail.
- Searchable commands.
- Guided repair actions from diagnostics.
- No unnecessary modal chain for routine edits.

# 38. Performance, Responsiveness and Large Libraries

## 38.1 Responsiveness Rules

- Brush and selection feedback should feel immediate.
- Heavy meshing, icon rendering and full validation run in background jobs where safe.
- The UI shows progress and allows cancellation for non-critical tasks.
- Out-of-date previews are labelled rather than freezing the editor.
- Autosave avoids visible pauses.

## 38.2 Preview Quality Levels

- Draft Fast.
- Standard.
- Final/Bake Equivalent.

Draft Fast can simplify effects, collision and mesh quality while preserving editing accuracy. Final review uses baked-equivalent presentation.

## 38.3 Large Asset Libraries

- Virtualised lists and grids.
- Lazy thumbnail loading.
- Cached metadata index.
- Search that does not scan raw files every time.
- Incremental dependency graph updates.
- Batch validation queue.
- Background thumbnail generation.

## 38.4 Heavy Asset Warnings

The viewport shows non-blocking estimates for:

- Exposed faces/triangles.
- Material slots.
- Animated parts.
- Effect and light cost.
- Texture channels.
- Collision complexity.
- Expected instance count category.

Performance rules are finalised in 21F.

# 39. Review, Collaboration and Production Status

## 39.1 Status Flow

```text
Idea -> Draft -> Ready for Review -> Changes Requested -> Approved -> Baked -> Released
                                      └----------------------> Deprecated
```

A project may simplify this initially, but source records should not assume Draft and Approved are the same.

## 39.2 Review View

Review View emphasises:

- Change summary.
- Base/current/draft comparison.
- Validation results.
- Dependency impact.
- Performance estimate.
- Required state and representation coverage.
- Reviewer notes.
- Approve, request changes or reject.

## 39.3 Comments and Annotations

Reviewers may pin notes to:

- Asset/representation.
- Part.
- Texture location.
- Timeline time/key.
- State binding.
- Diagnostic.

Full multi-user live co-editing is not required for MVP. Comments and revision ownership are sufficient foundations.

## 39.4 Production Tags

- POC Required.
- Visual Overhaul Priority.
- Building Blocker.
- Needs Animation.
- Needs Material Pass.
- Needs Runtime Test.
- Legacy Migration.
- Deferred.

Planning tags remain separate from shipped gameplay data.

# 40. Minimum Viable 21E Scope

## 40.1 Required MVP Screens

- Forge Home.
- Asset Browser.
- New Asset Wizard.
- Standard workspace shell.
- Block Surface Editor.
- Voxel Model Editor.
- Compound Part/Outliner editor.
- Palette and Material panel.
- Basic Animation Timeline.
- State Binding panel.
- Collision/Pivot/Socket editor.
- Item/Icon preview.
- World and machine test preview.
- Override comparison and provenance inspector.
- Validation panel.
- Save Draft and Approve/Bake flow.
- Blueprint Designer handoff.
- Recovery prompt and basic history.

## 40.2 Required MVP Workflows

| Workflow | Required Proof |
| --- | --- |
| Standard Block | Create 32 x 32 six-face block, tile preview, validate, bake and use in Blueprint Designer. |
| Unique Chute | Model shape, set footprint/ports, connect neighbours, create material variant and bake. |
| Animated Furnace | Assemble parts, animate gear/flame/glow, bind runtime states and test connected machine line. |
| Existing Override | Replace model/texture/clip without changing stable gameplay identity; compare and selectively revert. |
| Recovery | Restore a newer autosave after simulated interruption. |
| Validation | Focus missing socket/contract issue and guide the creator to a valid fix. |

## 40.3 Explicit MVP Deferrals

- Public player-facing creator.
- Asset marketplace.
- Real-time multi-user co-editing.
- Full touch-first workflow.
- Full creature/NPC editor.
- General mesh sculpting or UV authoring.
- Full audio waveform or particle-system editor.
- Remote cloud build farm.
- Automated artistic quality judgement.

# 41. Success Criteria and Acceptance Rules

The 21E system is successful when:

- A new creator can make and place a standard block without understanding the compound machine panels.
- An experienced creator can reach advanced tools quickly without repeating the full wizard for every asset.
- The current asset, stable ID, source layer, status and validation state remain visible.
- Built-in content cannot be destructively changed through an ordinary edit action.
- A project override clearly distinguishes inherited and changed fields.
- The creator can model a chute and verify its orientation, ports and neighbour connections visually.
- The creator can assemble a furnace, animate gears and flames and bind them to real state inputs.
- Every required representation can be previewed at its actual gameplay scale.
- Validation messages explain consequences and lead directly to affected content.
- Save Draft never silently publishes or replaces approved runtime content.
- A failed bake leaves the last valid approved presentation available.
- Autosave and crash recovery preserve work without confusing recovery data with approved source.
- Blueprint Designer can open an asset in Forge and refresh the same stable block after approval.
- Reduced-motion, non-colour-only status and scalable interface options are available.
- Large asset libraries remain searchable and responsive.
- The complete MVP workflow can be performed without manually editing raw file paths.

## 41.1 Screen Acceptance Questions

Before a screen is accepted, reviewers should answer:

1. Is the user's current object and selection obvious?
2. Is the primary action clear without hiding advanced actions permanently?
3. Can the user undo or recover from the likely mistakes on this screen?
4. Are inherited, overridden, draft and approved values distinguishable?
5. Are warnings actionable and linked to the affected content?
6. Does the layout remain usable with the inspector or lower panel collapsed?
7. Can keyboard users reach all essential controls?
8. Does status remain readable without colour?
9. Are heavy operations visibly progressing and cancellable where safe?
10. Does the screen preserve stable identity and avoid hidden gameplay edits?

# 42. Relationships With Documents 21F and 21G

| Document | Relationship to 21E |
| --- | --- |
| 21F - Forge Technical Implementation Plan | Implements this screen contract in Godot/Summer Engine, including scenes, resources, commands, undo stack, background jobs, baking, hot reload, validation services, persistence and tests. |
| 21G - Visual Overhaul and Asset Migration Plan | Uses these workflows, queues, statuses, previews and approval rules to replace current terrain, construction, item, machine and magic presentation in production order. |

Future NPC, creature and monster creator documents may reuse the workspace shell, asset browser, outliner, material editor, animation timeline, state binding, overrides, comparison, validation and review systems while adding rig, skeleton, hitbox and behaviour-specific panels.

# Appendix A. Screen and Panel Map

| Screen/Panel | Primary Purpose | Key Inputs | Key Outputs |
| --- | --- | --- | --- |
| Forge Home | Continue work and see project health. | Drafts, statuses, validation and build data. | Opened queue or asset. |
| Asset Browser | Find and organise assets. | Registry metadata and search filters. | Selected/opened assets and collections. |
| New Asset Wizard | Create valid initial source. | Intent, category, mode, contract, dimensions and template. | New draft and IDs. |
| Asset Header | Maintain context and lifecycle actions. | Asset metadata and status. | Save, review, compare and approval actions. |
| Block Surface Editor | Paint standard block faces and channels. | 32 x 32 canvas, palette and material. | Surface source and tile preview. |
| Voxel Model Editor | Build voxel geometry. | Voxel volume, tools and symmetry. | Editable voxel model. |
| Compound Editor | Assemble parts and helpers. | Parts, hierarchy, pivots and sockets. | Compound presentation source. |
| Material Editor | Define palette and surface behaviour. | Palette roles and Material DNA. | Material mappings and variants. |
| Timeline | Author clips and tracks. | Parts, keys, effects and time. | Animation clips. |
| State Binding | Map authoritative inputs to presentation. | State contract and clips/layers. | Runtime visual response rules. |
| Collision/Socket Editor | Satisfy placement and interaction contracts. | Footprint, collision, pivots and sockets. | Contract-compatible spatial data. |
| Preview Studio | Test representations and environments. | Draft/resolved asset and context presets. | Visual review evidence. |
| Override Comparison | Inspect and revert changes. | Base, approved and draft profiles. | Field-level decisions and change summary. |
| Validation Centre | Resolve errors and release blockers. | Asset graph, contracts and bake/runtime tests. | Diagnostics, exceptions and readiness. |
| Bake Queue | Generate runtime products. | Approved or selected sources. | Meshes, textures, icons, clips and reports. |
| Blueprint Handoff | Test building use. | Stable block and family references. | Updated controlled blueprint preview. |
| History/Recovery | Restore work and compare revisions. | Autosaves, drafts and approved revisions. | New recovery draft or comparison. |

# Appendix B. Suggested Command and Shortcut Map

All shortcuts are provisional, remappable and subject to platform conventions.

| Command | Suggested Input | Notes |
| --- | --- | --- |
| Save Draft | Ctrl+S | Never means approve. |
| Undo / Redo | Ctrl+Z / Ctrl+Shift+Z | Alternative Ctrl+Y may be supported. |
| Command Search | Ctrl+K | Finds tools, screens and actions. |
| Frame Selection | F | Viewport. |
| Perspective/Orthographic | Numpad 5 or mapped command | Must have menu alternative. |
| Front/Side/Top | Numpad 1/3/7 | Must have viewport controls. |
| Move/Rotate/Scale | W/E/R | Parts, pivots and sockets. |
| Paint/Add Voxel | B | Context-sensitive authoring tool. |
| Erase Voxel | X | Or right-click alternate. |
| Fill | G | Surface/voxel context. |
| Box Select | Shift+B or toolbar | Avoid conflict with brush. |
| Toggle Grid | # or toolbar | Localised keyboards require remapping. |
| Toggle Collision | C | View overlay. |
| Play/Pause | Space | Timeline and state preview. |
| Step Frame | Comma/Period | Timeline. |
| Add Key | K | Timeline. |
| Validate Current Asset | Ctrl+Enter | Does not bake. |
| Open Comparison | Ctrl+Shift+C | Optional. |
| Focus Mode | Tab | Must preserve access to exit. |
| Show Shortcut Guide | Hold ? / command search | Context-sensitive. |

# Appendix C. Diagnostic Message Template and Severity Matrix

## C.1 Message Template

```text
[Severity] Clear problem title
Asset: display name (stable ID)
Location: representation / part / field / track
Source: layer, pack or inherited record
Problem: plain-language explanation
Consequence: what preview, gameplay presentation, bake or release will fail
Recommended action: direct fix, map, revert or review step
Actions: Focus | Auto-fix where safe | Open dependency | Revert field | Documentation
```

## C.2 Severity Matrix

| Severity | Meaning | UI Behaviour | Approval Effect |
| --- | --- | --- | --- |
| Info | Useful status or optimisation. | Quiet badge/list entry. | None. |
| Warning | Review recommended; fallback may exist. | Visible badge and panel entry. | Allowed only by project rule or explicit review. |
| Error | Current field or output invalid. | Persistent indicator; focus action. | Blocks affected bake/approval. |
| Conflict | Two records compete or produce ambiguous resolution. | Comparison/resolution workflow. | Blocks approval until deterministic choice exists. |
| Release Blocker | Stable identity, save, migration, security or critical contract failure. | High-visibility banner and project queue. | Blocks release and usually approval. |

# Appendix D. Workflow Acceptance Test Matrix

| Test | Setup | Expected Result |
| --- | --- | --- |
| Create Standard Block | New 32 x 32 stone-brick asset. | Creator paints faces, tiles preview, validates, bakes and selects it in Blueprint Designer. |
| Create Chute | New one-block automation part. | Direction, sockets, rotations and neighbour connections remain visible and valid. |
| Animate Furnace | Compound furnace with gears and flame. | Transform/material/effect tracks play and respond to simulated processing state. |
| Bind Output Blocked | Furnace with blocked output input. | Gear loop pauses and warning response activates according to priority. |
| Override Existing Model | Approved furnace used in test save. | Draft model changes while recipes and stable gameplay ID remain untouched. |
| Selective Revert | Model and clip overridden. | Reverting model restores inheritance while clip override remains. |
| Missing Socket Diagnostic | Remove required output socket. | Error explains consequence, focuses asset and blocks approval. |
| Autosave Recovery | Interrupt session after unsaved edits. | Recovery draft can be opened, compared or discarded without publishing. |
| Failed Bake | Introduce invalid runtime output. | Last approved runtime product remains active; failure is reported. |
| Blueprint Round Trip | Open block from Blueprint Designer, edit and bake. | Return preserves blueprint context and refreshes same stable block. |
| Reduced Motion | Enable reduced-motion preview. | Continuous and flicker-heavy previews use approved alternatives. |
| Large Library Search | Library with thousands of indexed records. | Search/filter remains responsive and thumbnails load lazily. |
| Keyboard Navigation | Operate browser, inspector and validation without mouse. | Essential controls are reachable with visible focus. |
| Provenance Inspection | Mixed inherited/project/content-pack fields. | Each field reveals source and can be compared or reverted appropriately. |

# Appendix E. Glossary and Deferred Decisions

## Glossary

| Term | Meaning |
| --- | --- |
| Workspace | Saved panel arrangement and tools for a type of task. |
| Representation | World, icon, held, dropped, equipped, preview or other presentation form. |
| Source Layer | Built-in, parent, project override, content pack, world override or draft preview. |
| Provenance | The source record and version supplying a resolved value. |
| Contract | Required presentation capability for a gameplay definition. |
| Draft | Editable source not yet approved for runtime use. |
| Approved Source | Reviewed source revision allowed to produce runtime products. |
| Bake | Generation of optimised meshes, textures, clips, icons, collision and caches. |
| Recovery Draft | Autosaved source preserved after interruption; never automatically approved. |

## Deferred Decisions

- Exact Godot editor-plugin versus in-game workspace boundary, including detachable panels and final shortcut/controller depth.
- Collaboration, comment storage and review snapshot formats.
- Public mod-creator permissions, distribution rules, cloud synchronisation and remote build queues.
- Full touch/tablet authoring, NPC/creature editor scope and final particle/audio authoring depth.
