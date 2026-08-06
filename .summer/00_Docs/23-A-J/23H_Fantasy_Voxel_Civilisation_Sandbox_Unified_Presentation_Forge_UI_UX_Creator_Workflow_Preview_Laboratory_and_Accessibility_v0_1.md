# Fantasy Voxel Civilisation Sandbox
## 23H - Presentation Forge
### Unified UI/UX, Creator Workflow, Preview Laboratory and Accessibility
**Version 0.1 - Detailed Design Bible Draft**

*A detailed creator-experience specification for Leyforge's Presentation Forge, covering the shared workspace shell, spatial authoring, profile and contract editing, VFX and audio workspaces, preview environments, runtime capture and replay, validation, collaboration, accessibility authoring, diagnostics, AI-assisted workflows and Godot-facing verification.*

*Working design document - creator-facing interaction architecture, Test Laboratory, accessibility equivalence, review and approval workflow, performance diagnostics and cross-workspace integration rules*

# Unified Presentation Forge UI/UX System Statement

| Field | Locked Direction |
|---|---|
| Document Scope | Defines the creator-facing user experience for Presentation Forge and the shared UI used by its VFX, Audio, Spatial, Event, Profile, Acoustic and Test Laboratory tools. It covers navigation, workspaces, inspectors, libraries, editors, previews, runtime capture, scenario testing, validation, accessibility authoring, collaboration, version review, recovery, customisation and MVP acceptance. |
| Core Philosophy | The interface must make complex presentation systems understandable without hiding their true structure. Creators should be able to answer what they are editing, where it is attached, which event owns it, what context controls it, which variants inherit it, what it costs, what fails validation and how it behaves in the game. |
| Shared Shell Direction | Presentation Forge uses one consistent shell, terminology, command model, selection model, layout system and history across specialist workspaces. VFX, audio, spatial and profile tools may use specialised panels but must not become disconnected applications with incompatible behaviour. |
| Workflow Direction | The standard flow is discover or create context -> author or select spatial references -> bind legal events and state -> assemble presentation components -> preview -> test accessibility and budgets -> validate -> review -> bake -> verify in runtime. The UI should preserve this causal chain. |
| Spatial Direction | Exact voxel, face, edge, corner, Surface Mask, region, path, socket, zone and runtime-contact authoring from 23B must be directly visible in the viewport and inspectable through stable semantic IDs. |
| Contract Direction | Event Contracts, state fields, parameters and Context Packets from 23C are browsed and bound through schema-aware tools. The UI must prevent or clearly flag unavailable payloads rather than accepting silent string references. |
| VFX Direction | VFX workspaces expose genuine three-dimensional voxel forms, graphs, emitters, trails, volumes, surface presentation, lights, LOD and budgets while preserving the fixed voxel style defined by 23D and 23E. |
| Audio Direction | Audio workspaces expose sources, layers, loops, Sound Events, material response, spatial profiles, acoustic zones, buses, snapshots and runtime mixing from 23F and 23G without turning the interface into a generic digital audio workstation. |
| Preview Direction | The Test Laboratory is a first-class shared workspace. It supports deterministic context simulation, representative environments, runtime trace capture and replay, side-by-side comparison, stress scenes, accessibility modes and device/listener configurations. |
| Accessibility Direction | Accessibility is authored, previewed and validated as part of every critical Presentation Profile. The Forge must support keyboard-only, controller, scalable text, reduced motion/flash, colour filters, audio alternatives, captions and non-audio sensory equivalents. |
| Trust Direction | Errors explain what failed, where the dependency comes from and how to repair it. Destructive or migration-sensitive actions show exact scope. Undo, autosave, recovery, audit history and comparison are standard rather than optional safeguards. |
| Collaboration Direction | Review, comments, ownership, approval, diffs and release state are integrated with the asset lifecycle. Human approval remains required for AI-generated or AI-modified content. |
| Runtime Direction | The UI authors canonical source and invokes declared bake, hot-reload and verification operations. It does not expose generated Godot products as the primary editable source or allow editor convenience logic to become runtime truth. |
| MVP Direction | Prove a coherent creator flow for mining impacts, footsteps, furnace states, mana conduit flow, ward warnings, village ambience, acoustic shelter transitions and a goblin raid using shared tools rather than one-off editors. |
| Deferred Scope | Full dialogue and music production suites, remote cloud collaboration, marketplace publishing, cinematic sequencing, general-purpose 3D modelling and platform-specific certification dashboards remain outside 23H. Their future attachment points are preserved. |

# Document Purpose

Documents 23A through 23G define what Presentation Forge must author: shared profiles and contracts, spatial references, event and context resolution, voxel VFX, graph simulation, Sound Events, material audio, spatial sound, ambience, acoustics and runtime mixing. This document defines how a human creator actually works with those systems.

A complete system can still fail if its interface hides dependencies, makes variant inheritance difficult to understand, scatters related settings across unrelated screens or requires repeated game launches to test every change. Presentation Forge must support precise work at the scale of a texture texel, a model socket, a machine state, a room-sized acoustic zone and an entire village stress scene without losing the relationship between those scales.

The creator experience must therefore be built around context. A developer should see the owning asset, selected semantic reference, event contract, active state, resolved material, selected Presentation Profile, inherited values, budget class and accessibility alternatives together. Specialist editors remain deep, but movement between them must preserve selection, focus, history and intent.

This document provides that shared interaction contract. It does not replace the game-facing UI/UX document, the detailed runtime implementation in 23I or the production and migration plan in 23J. It defines the authoring experience those later systems must implement and test.

# Engine and Forge Status Note

Leyforge is developed in Godot, with Summer Engine used as the AI-native development environment. Presentation Forge is a project toolchain that authors canonical source data, editable media and validated definitions, then generates reviewable Godot-facing runtime products.

The creator interface may run as Godot editor extensions, dedicated project tools, companion applications or a coordinated combination. This document does not force one windowing technology. It does require consistent stable IDs, commands, selection context, history, validation, preview contracts and project manifests across every surface.

Summer Engine may assist with layout generation, suggested bindings, test creation, diagnostics, repetitive data entry and first-pass alternatives. AI assistance remains visible, reviewable, attributable and reversible. The project must remain editable and shippable without a remote AI service.

# Design Sources

| Source Document | Relevant Direction | How 23H Uses It |
|---|---|---|
| 17 - UI/UX System | UI is the readability, interaction and trust layer. It must answer what the user is looking at, what can be done, what it costs, why it is unavailable, what changed and where to learn more. | Applies the same trust, consistency, accessibility, recovery and data-driven rules to creators rather than players. |
| 18 - Technical Implementation Plan | Stable IDs, registries, event-driven architecture, modular ownership, diagnostics, performance budgets and authoritative state are foundational. | Requires editor tools to expose those contracts and generate bounded, validated runtime products. |
| 23A - Presentation Forge Foundation | Defines Presentation Forge identity, profiles, budgets, accessibility, shared workflow, capture/replay, lifecycle and workspace map. | Supplies the umbrella architecture and locked creator workflow. |
| 23B - Spatial Attachment System | Defines anchors, sockets, regions, paths, Surface Masks, zones, portals, remapping and runtime contacts. | Supplies spatial editor modes, overlays, selection and mapping workflows. |
| 23C - Events and Bindings | Defines Event Contracts, Context Packets, parameters, bindings, state composition, replay and debugging. | Supplies contract browsers, binding editors, context inspection and runtime trace tools. |
| 23D - VFX Forge Core | Defines effect assets, voxel forms, families, inheritance, surface presentation, workflow and accessibility. | Supplies the VFX authoring workspace, library and effect inspector requirements. |
| 23E - Voxel Particle Graph | Defines graph nodes, emitters, simulation, trails, volumes, lights, surfaces, compiler validation and live inspection. | Supplies graph editor, timeline, debug view and performance-profiler requirements. |
| 23F - Sound Forge Core | Defines sources, layers, Sound Events, families, loops, variants, provenance, review and approval. | Supplies waveform, layer, loop, event, source and listening-review tools. |
| 23G - Runtime Audio | Defines material response, spatial profiles, acoustic zones, sound portals, ambience, buses, snapshots, mixing and voice management. | Supplies world-audio editors, mix inspection, listener preview and dense-scene testing. |

# Static Table of Contents

1. Locked Unified Presentation Forge UI/UX Identity
2. Approved Direction Summary
3. Creator Experience Architecture and Trust Model
4. Shared Workspace Shell, Navigation and Layout
5. Project Dashboard, Recent Work and Task Queues
6. Asset Library, Search, Tags, Dependencies and Knowledge Gates
7. Document Tabs, Selection, Focus and Context Preservation
8. Property Inspector, Multi-Edit, Defaults, Inheritance and Overrides
9. Spatial Authoring Workspace
10. Presentation Profile Editor
11. Event Contract Browser, Binding Editor and Context Inspector
12. VFX Forge Workspace Integration
13. Voxel Particle Graph, Timeline and Live Simulation Editor
14. Audio Forge Workspace Integration
15. Waveform, Layer, Loop and Sound Event Editors
16. Material Response, Acoustic Zone and Runtime Mix Editors
17. State Simulation, Parameter Controls and Context Builder
18. Preview Viewport and Environment Catalogue
19. Test Laboratory Architecture
20. Runtime Capture, Trace, Replay and Comparison
21. Scenario Builder, Stress Testing and Worst-Case Simulation
22. Accessibility Authoring and Equivalence Workflow
23. Reduced Motion, Flash, Colour, Audio and Sensory Modes
24. Input, Focus, Keyboard, Controller and Assistive Technology
25. Notifications, Validation, Errors and Repair UX
26. Undo, Redo, Autosave, Recovery, History and Audit
27. Collaboration, Review, Comments, Approval and Diff
28. Versioning, Inheritance, Overrides, Conflict and Migration UX
29. Performance Budgets, LOD, Aggregation and Diagnostics
30. Summer Engine and AI-Assisted Authoring UX
31. Localisation, Terminology, Help, Tutorials and Onboarding
32. Customisation, Presets, Workspace Profiles and Quiet Modes
33. Large Projects, Data Density, Scaling and Navigation
34. Permissions, Security, Safe Operations and Creator Trust
35. Bake, Hot Reload, Godot Handoff and Runtime Verification UX
36. Minimum Viable 23H System
37. Forest Hamlet End-to-End Creator Scenario
38. Validation, Quality Assurance and Acceptance
39. Balancing and Authoring Rules
40. Explicit Deferrals and Open Questions
Appendix A. Core UI Data and State Templates
Appendix B. Workspace, Panel and Command Catalogue
Appendix C. Default Input and Focus Map
Appendix D. Validation and Diagnostic Code Register
Appendix E. Accessibility Authoring and Test Matrix
Appendix F. MVP Acceptance Matrix
Appendix G. Cross-System Integration Matrix

# 1. Locked Unified Presentation Forge UI/UX Identity

Presentation Forge UI/UX is the creator-readability, interaction and trust layer for Leyforge's complete presentation pipeline. It connects exact spatial authoring, legal gameplay contracts, VFX graphs, sound events, material responses, acoustic spaces, mix policy, accessibility alternatives and runtime verification inside one coherent workflow.

## 1.1 Locked Rule

> A creator must be able to identify what is selected, who owns it, where it exists, what drives it, what it inherits, what it overrides, what it costs, what fails validation and what will be generated before committing a change. The interface may simplify presentation, but it may not conceal authoritative dependencies or invent runtime truth.

## 1.2 Creator Experience Promise

The interface should let a creator answer:

- What project, asset, variant and lifecycle state am I editing?
- Which semantic anchor, region, path, Surface Mask, zone or portal is selected?
- Which event or state contract drives this presentation?
- Which context fields are available, missing or using fallback?
- Which profile, graph, Sound Event or material family produced the current result?
- Which values are local, inherited, generated, overridden or locked?
- What will happen during entry, loop, interruption, exit, LOD transition and reload?
- How does the result change under accessibility settings and performance pressure?
- What dependencies, licences, approvals and migrations are affected?
- How can the change be previewed, compared, validated, reverted or verified in Godot?

## 1.3 Identity Layers

| Identity Layer | Design Meaning | Creator-Facing Result |
|---|---|---|
| Context First | Selection, owner, spatial mapping, contract and state remain visible. | Creators do not edit disconnected numbers without knowing what they affect. |
| Shared Language | Workspaces share naming, commands, panels, filters and lifecycle states. | Moving between VFX, audio and spatial tools does not require relearning basic interaction. |
| Direct Manipulation | Spatial references, curves, timelines, graphs, zones and masks can be edited visually. | Precise authoring remains understandable and fast. |
| Inspectable Data | Stable IDs, inheritance, dependencies, context and generated output are accessible on demand. | The UI supports both artists and technical reviewers without exposing raw files as the primary workflow. |
| Representative Preview | Assets are tested in context, not only in isolated thumbnails. | Results are judged at gameplay distance, under weather, state, density and accessibility conditions. |
| Protected Workflow | Undo, autosave, validation, review, diff and recovery are standard. | Complex edits and migrations are safer and easier to trust. |
| Scalable Tooling | Search, batch operations, presets, summaries and virtualised views handle large libraries. | The same UI remains useful from MVP to full production. |
| Inclusive Authoring | The Forge itself and the content it creates support accessibility. | Creators can operate the tool and verify player-facing equivalents. |

## 1.4 What the Interface Is Not

- It is not a collection of unrelated modal tools opened from file paths.
- It is not a generic 3D package, digital audio workstation or node editor with Leyforge labels added afterward.
- It is not dependent on hidden keyboard shortcuts, colour alone, tiny text or pixel-perfect mouse control.
- It is not a system that accepts invalid string IDs and postpones failure until runtime.
- It is not a place where generated Godot nodes become the canonical editable source.
- It is not a dashboard that displays every possible metric at all times.
- It is not an AI autopilot that publishes unreviewed assets or changes contracts.
- It is not a POC requirement to implement every advanced collaboration or publishing feature.

# 2. Approved Direction Summary

| Area | Approved Direction |
|---|---|
| Shell | One shared application shell and command model across Presentation Forge. |
| Navigation | Project -> library -> asset -> specialised editor -> Test Laboratory -> review/bake, with preserved back history and selection context. |
| Layout | Dockable, resizable, saveable workspaces with sensible role-based defaults and a reliable reset command. |
| Selection | Stable semantic selection object shared across viewport, hierarchy, inspector, graph, timeline and dependency views. |
| Inspector | Shows local value, resolved value, source of inheritance, override status, validation and runtime effect. |
| Multi-edit | Supports safe editing of compatible fields, explicit mixed values and preview of affected assets. |
| Spatial editing | Direct voxel/face/mask/anchor/path/zone manipulation with snapping, orientation, mirroring and remapping tools. |
| Profiles | Component-based Presentation Profile editor with channel composition, variants, accessibility and budgets. |
| Contracts | Schema-aware event/state browser, payload autocomplete, version visibility and missing-field diagnostics. |
| VFX | Integrated effect library, voxel form editor, graph, timeline, surface/volume tools and live counters. |
| Audio | Integrated source, waveform, layer, loop, event, spatial, material, acoustic and mix tools. |
| Preview | Shared viewport with deterministic context controls, representative environments and device/listener modes. |
| Test Laboratory | Scenario authoring, runtime capture/replay, A/B comparison, stress testing and acceptance recording. |
| Accessibility | Built-in authoring, simulation, linting and equivalence checks for critical cues. |
| Validation | Layered diagnostics with clear severity, source, consequence, repair path and suppressibility rules. |
| Recovery | Command history, undo/redo, autosave, crash recovery, snapshots and explicit migration checkpoints. |
| Collaboration | Comments, review requests, diffs, ownership, lifecycle approvals and audit trail. |
| AI assistance | Suggestions are visually distinct, source-attributed, diffable, reversible and never self-approved. |
| Performance | Budget overlays, worst-case estimates, virtualisation previews and runtime capture metrics. |
| Runtime handoff | Bake and hot reload show exact products, warnings, changed dependencies and verification status. |
| MVP | One coherent end-to-end workflow covering VFX, audio, spatial, event, accessibility and runtime test. |

# 3. Creator Experience Architecture and Trust Model

## 3.1 Interaction Layers

```text
Project and Task Layer
        |
Library and Dependency Layer
        |
Asset and Semantic Selection Layer
        |
Specialist Authoring Layer
        |
Preview and Test Laboratory Layer
        |
Validation, Review and Bake Layer
```

The creator may enter at any layer, but the interface should make the current layer and route back to context obvious.

## 3.2 Shared Application Services

| Service | UI Responsibility |
|---|---|
| Project Context | Current project, content pack, branch, target platform, quality tier and active user role. |
| Selection Context | Selected asset, variant, spatial reference, graph node, timeline event, profile component or runtime source. |
| Command Service | Named commands with shortcuts, permissions, undo behaviour and audit metadata. |
| History Service | Back/forward navigation, recently visited assets, command history, snapshots and recovery. |
| Search Service | Global search across IDs, display names, tags, descriptions, dependencies, errors and comments. |
| Validation Service | Incremental diagnostics, blocking status, repair actions and release-gate summaries. |
| Preview Service | Deterministic scene state, camera/listener controls, device settings and capture/replay. |
| Collaboration Service | Ownership, comments, review state, approvals and change summaries. |
| Bake Service | Declared source-to-product operations, changed product list and runtime verification result. |

## 3.3 Trust Rules

- System data owns facts; the UI formats and exposes them but does not recalculate hidden gameplay truth independently.
- Every async operation shows progress, cancellation policy and whether results are partial or stale.
- Permission-denied states explain the required role or ownership boundary without exposing private information.
- A blocked action explains the exact missing contract, dependency, field, approval or licence.
- Destructive operations show affected assets, dependants, generated products and migration consequences.
- Background automation never silently changes approved source.
- Validation results are reproducible and linked to the version of the validator that produced them.

## 3.4 Information Priority

| Priority | Examples | UI Behaviour |
|---|---|---|
| Critical | Save failure, corrupted source, missing required anchor, licence block, invalid event contract, destructive migration. | Interruptive banner or modal with recovery path; cannot be hidden by quiet mode. |
| High | Release-blocking validation, inaccessible critical cue, budget failure, unresolved dependency. | Persistent issue panel, editor markers and task queue entry. |
| Medium | Recommended fallback missing, dense graph, unapproved AI suggestion, stale preview. | Non-blocking warning with repair or acknowledge action. |
| Low | Naming suggestion, optional optimisation, unused asset, style hint. | Grouped into summaries and hidden by quiet mode if requested. |

# 4. Shared Workspace Shell, Navigation and Layout

## 4.1 Default Shell

```text
+--------------------------------------------------------------------------------+
| Project / Pack / Branch | Back Forward | Search | Validate | Preview | Bake    |
+----------------------+--------------------------------------+------------------+
| Library / Hierarchy  | Main Editor / Viewport / Graph       | Inspector        |
|                      |                                      | Dependencies     |
|                      |                                      | Diagnostics      |
+----------------------+--------------------------------------+------------------+
| Timeline / Parameters / Capture Trace / Console / Task Queue                   |
+--------------------------------------------------------------------------------+
| Selection Path | Lifecycle | Validation | Budget | Hot-Reload | User / Role     |
+--------------------------------------------------------------------------------+
```

## 4.2 Docking and Layout

- Panels may dock, tab, float, collapse or move to a second monitor.
- Every panel has a stable name and command to reopen it.
- Layouts are stored separately from asset data.
- Default layouts exist for VFX Artist, Audio Designer, Technical Designer, Accessibility Review, QA and Generalist.
- Reset restores the relevant role layout without losing open documents or unsaved work.
- Minimum panel sizes prevent controls from becoming clipped or unusable.
- Small screens use tabbed or overlay panels instead of shrinking all content into unreadable columns.

## 4.3 Navigation Model

Navigation uses a route stack rather than arbitrary window spawning. Opening an anchor from a binding or a Sound Event from a material response should preserve the source location and provide a visible return action.

```text
Project Dashboard
  -> Furnace Entity
    -> socket.vfx.chimney
      -> binding.machine.furnace.active
        -> profile.machine.furnace.active
          -> vfx.furnace.smoke.basic
```

## 4.4 Breadcrumbs

Breadcrumbs show semantic ownership, not file-system folders alone:

```text
Leyforge > Base Content > Machine Family > Furnace > Active Profile > Chimney Smoke
```

Each segment supports open, copy stable ID, reveal dependencies and return to owner.

## 4.5 Full-Screen and Focus Modes

- Viewport focus hides non-essential panels while keeping selection and validation status.
- Graph focus expands the node canvas and keeps a compact context ribbon.
- Listening mode dims visual distractions and exposes transport, listener and mix controls.
- Accessibility review mode pins simulation toggles and equivalence status.
- Presentation mode hides authoring chrome for stakeholder review while retaining labelled playback controls.

# 5. Project Dashboard, Recent Work and Task Queues

## 5.1 Dashboard Purpose

The dashboard is a production entrance rather than a marketing home screen. It should answer what requires attention, what changed, what is blocked and what can be continued.

## 5.2 Dashboard Cards

| Card | Contents |
|---|---|
| Continue Work | Recently edited assets, preserved workspace, unsaved recovery and current review item. |
| Validation Health | Release blockers, warnings by system, newly introduced issues and trend since last verified build. |
| Review Queue | Assets awaiting review, comments, approval requests and assigned tasks. |
| Runtime Captures | Recent traces, failed scenario tests, capture incompatibilities and replay favourites. |
| Bake Status | Dirty sources, generated products, failed bakes, hot-reload state and target platform. |
| Library Coverage | Missing accessibility alternatives, incomplete LODs, absent material responses and orphaned assets. |
| Provenance | Imported or generated sources missing licence, creator, tool or approval metadata. |
| Performance | Worst budget failures and recent runtime spikes. |

## 5.3 Task Queue

Tasks may be created by creators, validation, review, migration or AI suggestion. Each task records:

- Stable target ID.
- Reason and source.
- Severity and release target.
- Assignee and reviewer.
- Suggested repair actions.
- Dependencies and blockers.
- Completion evidence.
- Whether closing the task suppresses, resolves or merely acknowledges an issue.

## 5.4 Quiet Dashboard

A quiet mode removes trend charts, low-priority hints and activity noise. It retains blockers, assigned work, recovery warnings and bake state.

# 6. Asset Library, Search, Tags, Dependencies and Knowledge Gates

## 6.1 Library Model

The Library is a unified index across Presentation Profiles, bindings, contracts, spatial references, VFX, audio, materials, budgets, accessibility profiles, acoustic zones, snapshots, captures and scenarios.

## 6.2 Search Fields

Search may use:

- Stable ID or alias.
- Display name and localisation key.
- Asset family, category, tag or owner.
- Event, state or context field.
- Spatial anchor, region, path, zone or mask.
- Material family and response action.
- Lifecycle state, reviewer or assignee.
- Validation code or severity.
- Dependency or dependent asset.
- Source provenance and licence.
- Runtime product or platform target.

## 6.3 Saved Queries and Smart Collections

Examples:

```text
is:release_blocked type:presentation_profile
missing:reduced_flash critical:true
uses:event.machine.output_blocked
owner:forest_hamlet pack:base_game
budget:vfx.combat_impact exceeds:medium
source:ai_generated approval:pending
```

## 6.4 Dependency View

The dependency view provides both directions:

```text
Uses
Profile -> Binding -> Event Contract -> Anchor -> VFX -> Sound Event -> Budget

Used By
Sound Event <- Profiles <- Machines <- Blueprints <- Scenarios <- Release Targets
```

Cycles, unresolved aliases and deprecated targets are highlighted.

## 6.5 Knowledge and Spoiler Gates

The Forge itself may expose all development content to authorised creators. Review builds, external contractors or content-pack tools may use role-based knowledge gates to avoid revealing unreleased story, race, dimension or boss content. Stable IDs remain resolvable even when display data is restricted.

## 6.6 Thumbnail and Preview Cards

Cards may show a representative frame, waveform, icon, spatial badge, lifecycle state and validation summary. They must not auto-play sound or dense animation without user preference.

# 7. Document Tabs, Selection, Focus and Context Preservation

## 7.1 Open Document Model

Each open tab represents a stable source asset or a persistent editor context. A tab indicates:

- Dirty state.
- Validation severity.
- Read-only or locked state.
- Branch or override layer.
- Reviewer comments.
- Runtime product freshness.
- Whether the tab is pinned, preview-only or part of a comparison.

## 7.2 Preview Tabs

Single-clicking a library item may open a replaceable preview tab. Editing, pinning or double-clicking converts it to a persistent tab. This reduces tab overload without making navigation unpredictable.

## 7.3 Shared Selection Object

```text
SelectionContext
{
    owner_asset_id
    selected_semantic_ids[]
    active_editor_domain
    variant_id
    override_layer
    time_or_frame
    runtime_instance_id?
    listener_or_camera_id?
}
```

The hierarchy, viewport, inspector, graph, timeline and dependency panel consume the same selection context.

## 7.4 Focus Preservation

Opening an error, dependency or related asset preserves:

- Current selection.
- Scroll and zoom.
- Graph view position.
- Timeline time.
- Filters and search.
- Preview environment and state.
- Unsaved parameter values.

Returning restores the previous context unless the underlying asset changed incompatibly.

## 7.5 Selection Sets

Creators may save named sets such as all furnace warning sockets, all mana paths in a blueprint or all critical raid cues. Sets use stable IDs and report missing members after migration.

# 8. Property Inspector, Multi-Edit, Defaults, Inheritance and Overrides

## 8.1 Inspector Principles

The inspector shows the resolved value and its source. A field is never displayed as a single unexplained number when inheritance, generation or runtime mapping affects it.

## 8.2 Field States

| State | Visual and Behavioural Rule |
|---|---|
| Local | Value authored directly on the selected object. |
| Inherited | Shows source asset and can jump to definition. |
| Generated | Shows generator, parameters and whether regeneration will replace it. |
| Overridden | Shows base value, override layer and reset action. |
| Mixed | Multiple selected objects have different values; applying a value previews affected count. |
| Locked | Read-only due to contract, role, lifecycle or generated-product status. |
| Invalid | Shows diagnostic, expected type/range and repair path. |
| Deprecated | Shows replacement ID and migration option. |

## 8.3 Progressive Disclosure

Default view shows commonly edited fields. Advanced, performance, migration and raw diagnostic sections remain collapsible but searchable. Hidden fields must still appear when they contain errors or local overrides.

## 8.4 Multi-Edit

Safe multi-edit requires compatible schemas. The UI must:

1. Show number and categories of affected assets.
2. Identify mixed values.
3. Disable incompatible fields with explanation.
4. Preview dependency and bake impact.
5. Create one undoable transaction.
6. Report partial failure without pretending all edits succeeded.

## 8.5 Curve and Parameter Fields

Curves support direct editing, numeric entry, presets, copy/paste, normalisation and comparison. Unit labels are mandatory. Parameter mappings show source range, transformed range, clamp, smoothing, hysteresis and missing-data fallback.

## 8.6 Raw Data View

A structured raw-data view is available for technical review, copying and diagnostics. It is not the default editor and does not allow bypassing validation or lifecycle rules.

# 9. Spatial Authoring Workspace

## 9.1 Workspace Purpose

The spatial workspace provides one authoring environment for anchors, sockets, regions, paths, Surface Masks, zones, sound portals and remapping rules from 23B.

## 9.2 Viewport Modes

| Mode | Main Operations |
|---|---|
| Voxel | Select exact voxel cells, groups and material-filtered cells. |
| Face | Select face, normal and local surface coordinates. |
| Edge/Corner | Create precise tips, seams, hinges and trail endpoints. |
| Surface Mask | Paint, erase, weight, flood, mirror and validate named texel masks. |
| Anchor/Socket | Place origin, orientation, axis, allowed attachment types and fallback. |
| Region | Paint or generate voxel/body regions and exposed-face rules. |
| Path | Draw ordered points, edit tangents/steps, direction and branching. |
| Zone/Portal | Draw volumes, detect enclosure, place openings and inspect connectivity. |
| Remap | Compare variants or LODs and map semantic IDs to new geometry. |
| Runtime Contact | Inspect captured hit/contact anchors from a replay trace. |

## 9.3 Snapping and Orientation

- Grid, voxel centre, face centre, edge, corner, bone, pivot and named-reference snapping.
- Axis gizmos use shape and labels as well as colour.
- Local, parent, world and path coordinate modes.
- Numeric position and rotation entry.
- Copy orientation from face normal, path direction, bone or another anchor.
- Mirror with explicit left/right semantic remapping.

## 9.4 Surface Mask Editor

The Surface Mask editor displays the 32x32 surface texture and named mask overlays. It supports weighted pixels, direction fields, exclusions and spawn distribution previews. Texture replacement triggers a mask-diff view rather than silently shifting bindings.

## 9.5 Variant and LOD Comparison

A split or onion-skin view shows base, variant, damage state and LOD mappings. Required anchors display quality classifications:

- Exact.
- Repositioned but semantically equivalent.
- Approximated.
- Fallback.
- Missing and blocking.

## 9.6 Spatial Validation Overlay

Errors and warnings appear at their location with filters for orientation, overlap, missing mapping, out-of-bounds mask, unreachable portal, broken path and LOD fallback.

# 10. Presentation Profile Editor

## 10.1 Profile Composition View

```text
Presentation Profile
├── Trigger and Context
├── Spatial Reference
├── VFX Components
├── Audio Components
├── Light / Surface / Camera / Haptic References
├── State Composition Channels
├── Variants and Material Resolution
├── Accessibility Equivalents
├── Budget and LOD
└── Lifecycle / Review / Runtime Products
```

## 10.2 Component Cards

Each component card shows asset ID, spatial reference, active condition, parameter mappings, priority, budget class, variant source and validation. Cards may be reordered only where ordering has defined meaning.

## 10.3 Channel Composition

The editor displays Base, Operation, Damage, Environment, Magic, Warning, Temporary Event and Accessibility channels. It shows which channel owns a parameter, additive or replacing behaviour and maximum simultaneous layers.

## 10.4 Variant Matrix

Rows represent context dimensions such as culture, material, dimension, damage state, intensity or quality tier. Columns represent component substitutions or parameter overrides. Sparse inheritance is preferred over copying full profiles.

## 10.5 Critical-Cue Panel

Critical profiles require:

- Criticality reason.
- Minimum preserved information.
- Protected budget class.
- Caption or visual alternative.
- Reduced-motion and reduced-flash behaviour.
- Colour-independent distinction.
- Test evidence.

## 10.6 Resolved Profile Inspector

Given a context packet, the resolver view explains:

```text
Selected base profile
-> inherited family defaults
-> material response
-> culture override
-> damage overlay
-> accessibility substitution
-> LOD reduction
-> final dispatched components
```

# 11. Event Contract Browser, Binding Editor and Context Inspector

## 11.1 Contract Browser

The browser groups events and state by owning system. Each contract shows version, owner, payload schema, frequency, authority, replay policy, criticality and known consumers.

## 11.2 Binding Creation

Bindings are created by selecting a legal contract, not typing an arbitrary string. The editor autocompletes payload paths and displays availability by version.

## 11.3 Payload Mapping

A mapping row shows:

| Source | Transformation | Destination | Fallback |
|---|---|---|---|
| `context.intensity` | curve `impact_heavy` | `vfx.spawn_count` | 0.5 |
| `state.heat_ratio` | smooth 0.2 s | `audio.loop_pitch` | 0.0 |
| `contact.surface_normal` | orientation | `anchor.outward_axis` | owner up |

## 11.4 Context Inspector

The inspector can use:

- Authored sample context.
- Scenario context.
- Runtime capture frame.
- Live Godot instance.
- Batch context set for matrix testing.

Missing fields, stale schema and fallback use are clearly marked.

## 11.5 Event Frequency and Lifecycle

The UI warns when a high-frequency event starts one-shot assets without cooldown, when loop start/stop ownership is incomplete or when predicted and confirmed paths may duplicate.

## 11.6 Contract Change Review

Updating a contract shows affected bindings, payload changes, default migrations, replay compatibility and required owner approval. Contract changes cannot be accepted as an incidental side effect of editing presentation content.

# 12. VFX Forge Workspace Integration

## 12.1 Default Layout

```text
Effect Library | 3D Preview | Effect Inspector
               |            | Palette / Material DNA
Graph / Timeline / Parameters / Counters / Diagnostics
```

## 12.2 Voxel Form Editor

- Create cube, cuboid, shard, plate and cluster forms.
- Paint semantic palette roles rather than fixed colour only.
- Edit pivot, density, bounds and frame sequence.
- Preview at world scale and target camera distance.
- Validate non-voxel geometry, filtering, transparency and silhouette.

## 12.3 Effect Family Browser

Families show base grammar, inherited parameters, variants, consumers and coverage. Creating a variant begins from inheritance rather than duplicate-and-rename.

## 12.4 Surface and Volume Tools

Persistent surface layers, fog volumes, smoke beds, weather fields and corruption regions use dedicated visual editors while retaining graph links and budget readouts.

## 12.5 Style Guardrails

The workspace flags:

- Billboard or smooth-mesh geometry.
- Blurred voxel filtering.
- Continuous ribbons without segmented voxel representation.
- Particle cells too small at target distance.
- Bloom hiding geometry.
- Excessive transparent overlap.
- Material/palette roles inconsistent with the owner family.

# 13. Voxel Particle Graph, Timeline and Live Simulation Editor

## 13.1 Graph Canvas

The typed graph editor distinguishes event, spawn, particle, path, volume, surface and light execution domains. Connection ports display data type, domain and multiplicity.

## 13.2 Node Creation

Node search ranks by compatible output/input, recent use and approved templates. Deprecated nodes appear only when opening existing graphs or explicitly enabled.

## 13.3 Graph Readability

- Frames and comments document intent.
- Named reroutes reduce line clutter.
- Domain colours also use icons and labels.
- Collapsed subgraphs show input/output summary and budget cost.
- Validation markers attach to nodes and links.
- Minimap, bookmarks and outline support large graphs.

## 13.4 Timeline

The timeline controls duration, entry, loop, exit, bursts, frame sequences, child emitters, sound/light sync references and cancellation windows. It can display event trace markers from 23C.

## 13.5 Live Simulation

Controls include play, pause, step, reset, seed, speed, fixed timestep, camera/listener motion and context state. Editing safe parameters updates live; structural edits trigger a clear recompile state.

## 13.6 Debug Views

- Spawn points and emitter bounds.
- Velocity and force vectors.
- Collision contacts.
- Path samples.
- Surface writes.
- Active child emitters.
- Light requests.
- Per-node active counts and cost.
- LOD and virtualisation decisions.
- Random seed lineage.

## 13.7 Compile Feedback

Compile output separates syntax/type failure, validation failure, budget warning and optimisation hint. Clicking an entry selects the exact node or resource.

# 14. Audio Forge Workspace Integration

## 14.1 Audio Workspace Identity

The audio workspace is optimised for game Sound Events and spatial presentation. It provides precise editing and listening tools without attempting to replace a full music-production DAW.

## 14.2 Default Layout

```text
Source / Family Library | Waveform and Layers | Event Inspector
                         |                     | Variation / Routing
Transport / Loop / Timeline / Meters / Context / Diagnostics
```

## 14.3 Listening Safety

- Global audition level and limiter.
- Optional loud-sound warning.
- One-click stop all audio.
- Scrubbing and rapid repetition limits for piercing cues.
- Persistent user preference for reduced high-frequency audition.
- Visual meters with peak, loudness and clipping status.

## 14.4 Source Provenance

Imported sources show origin, creator, licence, consent/rights fields, processing history, AI-generation status and approval. Missing mandatory provenance blocks release and remains visible in the editor.

## 14.5 Family and Variant Workflow

Audio Families expose required layers, variation policy, intensity bands, material substitutions, default spatial profile, concurrency and accessibility variants. The UI identifies missing family coverage.

# 15. Waveform, Layer, Loop and Sound Event Editors

## 15.1 Waveform Editor

Supports trim, fades, markers, regions, zero-crossing snap, loop candidates, click detection, channel inspection, normalisation preview and non-destructive processing.

## 15.2 Layer Editor

Layers are grouped as Transient, Body, Texture, Tail, Sweetener, Environment and State Overlay. Each layer shows probability, gain, pitch, timing, routing, conditions and source provenance.

## 15.3 Loop Editor

- Loop in/out markers.
- Crossfade preview.
- Phase and cycle length.
- Intro/loop/outro lifecycle.
- Speed or parameter-linked playback.
- Virtualisation resume behaviour.
- Seam detection and spectral/waveform comparison.

## 15.4 Sound Event Logic

The event editor assembles selector, sequence, round-robin, layer, loop and state-transition logic. It displays maximum possible voices and worst-case layer overlap.

## 15.5 Variation Audition

Creators can audition N generated selections, lock a seed, inspect selection history and detect near-duplicates. Repeat-avoidance state is visible.

## 15.6 Caption and Critical Cue Fields

Meaningful sounds require localisable caption IDs, source category, optional direction/distance wording and criticality. Captions can be previewed alongside audio.

# 16. Material Response, Acoustic Zone and Runtime Mix Editors

## 16.1 Material Response Matrix Editor

Rows and columns may represent material families, actions, intensity or source types. The editor emphasises sparse fallback rules rather than requiring every cell to be filled.

Features:

- Heat map for explicit, inherited, fallback and missing responses.
- Batch assignment of Audio Families or VFX grammars.
- Sample context audition.
- Dependency and consumer view.
- Coverage report by MVP/release target.
- Conflict detection when multiple rules have equal specificity.

## 16.2 Acoustic Zone Editor

The zone editor can generate candidate zones from voxel geometry, then allows review of:

- Volume and boundaries.
- Enclosure and dominant materials.
- Reverb and damping profile.
- Sound portals and opening state.
- Leakage, obstruction and transition parameters.
- Ambience ownership.
- Runtime simplification tier.

Generated results remain editable and show the geometry version they were derived from.

## 16.3 Sound Portal Editor

Portals are displayed in the viewport with orientation, opening area, owning door/window/vent state and connected zones. Invalid or one-sided connections are highlighted.

## 16.4 Bus and Snapshot Editor

The mix editor shows stable buses, sends, user sliders, snapshots, ducking relationships and protected cue classes. It prevents arbitrary asset-created buses outside approved registries.

## 16.5 Voice and Cluster Inspector

A simulated or live scene displays active voices, virtual voices, clusters, stolen voices, priority, distance and bus routing. Creators can solo, mute or trace a voice to its Sound Event and source binding.

# 17. State Simulation, Parameter Controls and Context Builder

## 17.1 Context Builder

The Context Builder creates deterministic test packets without requiring gameplay code. Fields are grouped by source, target, contact, environment, player settings and runtime policy.

## 17.2 Presets

Examples:

- Heavy steel pickaxe on wet stone in cave.
- Barefoot run through shallow mud.
- Furnace active at 80% heat with blocked output.
- Mana conduit at 60% flow under reduced-flash mode.
- Goblin horn in heavy rain outside a timber house.
- Ward breach behind a closed door during split-screen.

## 17.3 State Machine Controls

Creators can enter states, fire events, sweep parameters and schedule transitions. Invalid state transitions are blocked or marked as intentionally forced test conditions.

## 17.4 Parameter Sweeps

A sweep tests a range over time or a grid of values. Results may generate thumbnails, audio renders, budget charts or pass/fail matrices.

## 17.5 Hysteresis and Smoothing View

The editor visualises raw input, smoothed value, thresholds and output state to prevent flickering or rapid audio/VFX switching.

# 18. Preview Viewport and Environment Catalogue

## 18.1 Shared Preview Viewport

The same viewport service supports spatial, VFX, audio, profile and Test Laboratory tools. Editor-specific overlays may change, but camera, environment, time, quality, accessibility and capture controls remain consistent.

## 18.2 Required Environments

| Environment | Purpose |
|---|---|
| Neutral Studio | Shape, scale, pivot, direction and clean listening. |
| Forest Day/Night | Foliage, wildlife, shadow, wind and ordinary outdoor contrast. |
| Rain Shelter | Roof contact, door/window leakage, wet surfaces and indoor/outdoor transition. |
| Small Timber House | Damping, near-field sources and occlusion. |
| Stone Hall | Reverb, reflection and distant source readability. |
| Cave/Mine | Dark contrast, echo, mining contact, dust and creature threat. |
| Machine Workshop | Dense loops, smoke, sparks, heat and voice aggregation. |
| Mana Workshop | Conduits, runes, emission, hums and accessibility variants. |
| Village Street | NPC activity, construction, bells, weather and distance. |
| Raid Scene | Threat priority, critical cues, combat impacts and stress budgets. |
| Portal Chamber | Large magic effects, low-frequency audio, light and transition. |
| Underwater/Fluid | Filtering, bubbles, movement and sensory alternatives. |

## 18.3 Camera and Listener Controls

- First person, third person, top-down, free camera and fixed review cameras.
- Listener at camera, player entity or separate path.
- Distance markers and gameplay-scale ruler.
- Orbit, fly, walk and recorded movement path.
- Split-screen listener configuration.
- Hearing perspective presets and user mix settings.

## 18.4 Environment State

Time, weather, wind, wetness, temperature, biome, mana density, corruption, structure damage and population activity can be set or driven by scenario.

## 18.5 Comparison Modes

- Side-by-side.
- Wipe.
- Flicker with safe frequency limit.
- Onion skin for spatial changes.
- A/B audio with loudness-matched option.
- Variant grid.
- Quality/LOD ladder.
- Accessibility profile matrix.

# 19. Test Laboratory Architecture

## 19.1 Test Laboratory Identity

The Test Laboratory is the shared evidence workspace where authored presentation is tested against representative events, environments, density, devices and accessibility settings.

## 19.2 Laboratory Layers

```text
Scenario Definition
├── World / Structure / Entities
├── Event and State Schedule
├── Camera and Listener Paths
├── Context and Material Conditions
├── Quality / Budget / Accessibility Profile
├── Expected Cues and Acceptance Rules
└── Capture / Metrics / Review Evidence
```

## 19.3 Test Types

| Test Type | Purpose |
|---|---|
| Isolated Asset | Validate one effect, event, sound or profile. |
| Interaction | Validate event timing, material response and runtime contact. |
| Lifecycle | Validate entry, loop, interruption, exit, reload and virtualisation. |
| Environment | Validate indoor/outdoor, weather, biome and acoustic behaviour. |
| Layering | Validate damage, magic, warning and accessibility composition. |
| Density | Validate repeated assets, villages, factories and raids. |
| Regression | Compare current result to approved baseline. |
| Migration | Verify remapped IDs, variants, LOD and runtime products. |
| Accessibility | Verify equivalent meaning under reduced sensory channels. |
| Multiplayer | Verify authority, prediction, listener and split-screen behaviour. |

## 19.4 Expected-Cue Assertions

Scenarios can assert:

- Required event dispatched.
- Required caption or indicator present.
- No duplicate one-shot after reconciliation.
- Critical cue survives budget pressure.
- Anchor quality is exact or allowed approximation.
- Voice/particle/light limits remain within profile.
- Loop resumes current phase after virtualisation.
- Reduced-flash profile stays below configured pulse limit.
- No unresolved dependencies or runtime errors.

# 20. Runtime Capture, Trace, Replay and Comparison

## 20.1 Capture Sources

- Running Godot editor game.
- Packaged development build.
- Multiplayer host or client.
- Automated scenario runner.
- Imported compatible trace.

## 20.2 Capture Contents

```text
PresentationTrace
{
    trace_id
    build_id
    registry_versions
    world_seed_and_time
    events[]
    state_samples[]
    context_packets[]
    resolved_bindings[]
    spatial_transforms[]
    listener_and_camera_samples[]
    budget_decisions[]
    accessibility_settings
    runtime_diagnostics[]
}
```

Raw audio and video may be attached for review, but the structured trace is the reproducible source for re-simulation.

## 20.3 Trace Timeline

The timeline aligns events, state changes, graph activity, active audio voices, captions, budget decisions, listener movement and validation markers.

## 20.4 Replay Modes

- Deterministic presentation replay using captured context.
- Re-resolve with current definitions to test changes.
- Compare old and new resolver versions.
- Replace one component while holding all other data constant.
- Replay at slow motion or step-by-event.
- Replay under different accessibility, quality or mix settings.

## 20.5 A/B Comparison

Comparisons record the assets, registry versions, settings and reviewer decision. Loudness-matched audio comparison is available to avoid mistaking louder for better.

## 20.6 Trace Compatibility

If contracts or registries changed, the UI reports which fields can migrate, which use fallback and which make the trace non-replayable. It must not silently drop incompatible data.

# 21. Scenario Builder, Stress Testing and Worst-Case Simulation

## 21.1 Scenario Builder

Creators place entities, machines, structures, emitters, paths, zones and triggers using existing blueprints or lightweight test proxies. Scenario assets reference production IDs rather than duplicate content.

## 21.2 Event Sequencer

The sequencer schedules events, state changes, parameter ramps, weather, door movement, damage and listener paths. It is not a cinematic editor; it exists to reproduce presentation conditions.

## 21.3 Stress Templates

- 100 furnaces starting, processing, blocking and stopping.
- Busy village market with workers, carts, animals and bells.
- Heavy rain across roofs, leaves, water and armour.
- Goblin raid with alarms, combat, fire and ward damage.
- Multiple spellcasters and mana conduits.
- Dragon breath, ground fire and debris.
- Split-screen players in two effect-heavy zones.
- Portal activation inside a reflective chamber.

## 21.4 Worst-Case Controls

The simulator may increase entity count, event frequency, source overlap, particle density, dynamic lights, voice count, occlusion complexity and network latency. It must distinguish synthetic stress from expected production conditions.

## 21.5 Metrics

| Domain | Metrics |
|---|---|
| VFX | Active cells, emitters, transparent overlap, collisions, trail segments, surface writes, light requests. |
| Audio | Active/virtual voices, clusters, steals, streaming, bus peaks, loudness and occlusion updates. |
| CPU | Resolver, graph, spatial, zone, voice-manager and editor overhead. |
| GPU | Voxel particle draw, overdraw, lights, surfaces and preview viewport cost. |
| Memory | Source, baked resource, pool, stream and trace memory. |
| Network | Confirmed/predicted events, duplicate suppression and presentation payload size. |
| Accessibility | Critical-cue preservation and alternative-channel presence. |

# 22. Accessibility Authoring and Equivalence Workflow

## 22.1 Accessibility Is a Source Requirement

Critical presentation is incomplete until its equivalent-feedback requirements are authored and tested. Accessibility metadata belongs to the Presentation Profile and its components, not a separate spreadsheet added at release.

## 22.2 Accessibility Panel

The panel displays:

- Criticality and intended meaning.
- Visual, audio, haptic, UI and caption channels.
- Reduced-motion and reduced-flash alternatives.
- Colour-independent markers.
- Frequency-comfort alternatives.
- Particle-density reduction.
- Directional assistance.
- Test status and evidence.

## 22.3 Meaning Contract

Each critical cue records the minimum meaning to preserve:

```text
Cue: Ward Breach
Source: nearby village ward
Meaning: protection has failed and danger may enter
Urgency: critical
Required information: source direction, breach state, immediate response
```

Alternative channels are judged against meaning, not visual similarity.

## 22.4 Equivalence Checker

The checker reports whether at least one enabled channel communicates source, meaning and urgency under selected settings. It cannot guarantee human usability, so manual review remains required.

## 22.5 Accessibility Review Role

Reviewers can annotate problems without needing edit access to the underlying VFX or audio graph. Comments link to exact time, component, viewport location and setting combination.

# 23. Reduced Motion, Flash, Colour, Audio and Sensory Modes

## 23.1 Simulation Matrix

The Test Laboratory can combine:

- Reduced motion levels.
- Reduced flash levels.
- Particle density levels.
- Colour-vision filters and monochrome.
- High-contrast mode.
- Audio muted or category-reduced.
- Frequency comfort filters.
- Captions and directional indicators.
- Haptic enabled/disabled.
- UI scale and text size.

## 23.2 Reduced Motion Authoring

Preview shows travel distance, angular speed, camera motion, orbiting count and continuous screen-space motion. Alternatives may use static shape, stepped change, shorter path, lower rate or bounded expansion.

## 23.3 Reduced Flash Authoring

The Forge estimates luminance change, frequency, screen coverage and duration. It flags rapid repeated pulses, especially when multiple effects may overlap in stress scenes.

## 23.4 Colour Independence

Colour-filter simulation is paired with silhouette, pattern, rhythm, direction and label inspection. A pass requires more than contrast under one filter.

## 23.5 Audio Reduction

Category mute and reduced dynamic-range modes verify that critical information remains available through captions, visual indicators or haptic references.

## 23.6 Sensory Comfort Presets

Creator presets represent common test combinations, but release acceptance should include individual controls rather than assuming one preset fits every player.

# 24. Input, Focus, Keyboard, Controller and Assistive Technology

## 24.1 Input Foundation

All core operations must be reachable by mouse and keyboard. Important review and navigation workflows should also support controller where practical, especially when testing gamepad-driven or couch workflows.

## 24.2 Focus Model

- Visible focus indicator.
- Logical tab order.
- Focus restoration after dialogs and panel changes.
- Escape/back returns one level without discarding work.
- Modal dialogs do not trap focus behind hidden controls.
- Canvas editors provide keyboard alternatives for selection, movement and numeric entry.

## 24.3 Command Palette

Every major command has a searchable name, shortcut, enabled reason and undo policy. The command palette can run actions without navigating menus.

## 24.4 Shortcut Rules

- Shortcuts are remappable.
- Destructive commands do not rely on a single unmodified key.
- Conflicts are detected.
- Platform-specific labels are supported.
- Chords and sequences have timeout and accessibility settings.
- Tooltips show current shortcut.

## 24.5 Controller Support

Controller navigation supports dashboard, library, review, preview transport, scenario playback, comments and basic parameter adjustment. Precision graph or waveform editing may use alternate numeric dialogs rather than imitating a mouse cursor.

## 24.6 Text and Screen Reader Support

- Semantic labels for controls, panels, fields and validation icons.
- Logical reading order.
- Text alternatives for graphs, waveforms and colour-only displays.
- Numeric values and units exposed to assistive technology.
- Live regions for validation and bake completion without excessive announcements.
- Scalable text without clipping at supported sizes.

# 25. Notifications, Validation, Errors and Repair UX

## 25.1 Validation Presentation

Diagnostics appear in four coordinated locations:

1. Status summary.
2. Issues panel.
3. Inline field or node marker.
4. Relevant viewport/timeline location.

## 25.2 Diagnostic Format

```text
[VFX-GRAPH-021] Trail may exceed profile segment budget.
Asset: vfx.weapon.trail.steel_heavy
Cause: maximum active segments 96; budget permits 64.
Consequence: distant or dense scenes will force early reduction.
Repair: lower lifetime, sample rate or select a larger approved budget.
```

## 25.3 Severity

| Severity | Meaning |
|---|---|
| Blocker | Cannot save safely, bake, approve or release. |
| Error | Definition is invalid or runtime behaviour is undefined. |
| Warning | Valid but risky, incomplete or likely to fail acceptance. |
| Info | Relevant state, fallback or migration notice. |
| Hint | Optional improvement or workflow suggestion. |

## 25.4 Repair Actions

Repair actions preview changes and affected assets. Automatic repair is one undoable transaction and records the validator/tool version.

## 25.5 Suppression

Only designated warning/hint codes may be suppressed. Suppression requires reason, scope and optional expiry. Blockers and core accessibility failures cannot be hidden through local suppression.

## 25.6 Error Writing Pattern

Errors state what happened, why, affected scope, whether work is safe, what can be tried and where details are available. They do not use generic messages such as "invalid asset" without context.

# 26. Undo, Redo, Autosave, Recovery, History and Audit

## 26.1 Undo Transactions

Related edits form named transactions such as "Mirror left/right foot sockets" or "Assign reduced-flash variants to 12 profiles." The history view can expand the transaction to show individual changes.

## 26.2 Cross-Asset Undo

Cross-asset operations remain atomic where possible. If external changes prevent full undo, the UI reports which assets reverted and offers a repair snapshot.

## 26.3 Autosave

Autosave stores recovery copies without silently marking source as approved or committed. It shows last successful save and warns when autosave is blocked.

## 26.4 Crash Recovery

Recovery compares autosave, last explicit save and project version. The creator may restore, compare, discard or extract changes into a new branch/snapshot.

## 26.5 Snapshots

Manual snapshots are lightweight checkpoints before migrations, batch edits, graph rewrites or AI suggestions. Snapshots include dependent canonical source needed for reliable comparison.

## 26.6 Audit History

Audit entries include user/tool, timestamp, command, affected IDs, lifecycle change, review decision and migration. Raw technical diffs are available, but human-readable summaries are primary.

# 27. Collaboration, Review, Comments, Approval and Diff

## 27.1 Collaboration Model

23H assumes repository-based collaboration and may integrate with project hosting, but it does not require real-time cloud co-editing.

## 27.2 Ownership and Locks

Assets may use advisory ownership, checkout or read-only locks depending on project policy. The UI explains whether the lock protects source, lifecycle state or generated output.

## 27.3 Comments

Comments may attach to:

- Whole asset.
- Field or override.
- Graph node/link.
- Timeline time range.
- Waveform region.
- Spatial location or mask pixel.
- Scenario frame.
- Validation issue.

Comments preserve semantic anchors so they survive layout changes where possible.

## 27.4 Review Workspace

Review mode emphasises:

- Change summary.
- Before/after preview.
- Validation delta.
- Accessibility delta.
- Budget delta.
- New dependencies and provenance.
- Contract or spatial changes.
- Runtime verification evidence.

## 27.5 Approval Roles

Suggested roles:

- Author.
- VFX reviewer.
- Audio reviewer.
- Technical presentation reviewer.
- Accessibility reviewer.
- Content/licence reviewer.
- Release approver.

Small teams may combine roles, but approval actions remain explicit.

## 27.6 Diff Types

- Structured field diff.
- Graph topology and parameter diff.
- Spatial mapping diff.
- Surface Mask image diff.
- Waveform/source and processing diff.
- Resolved profile diff under sample context.
- Runtime capture A/B diff.
- Generated-product manifest diff.

# 28. Versioning, Inheritance, Overrides, Conflict and Migration UX

## 28.1 Version Visibility

The editor shows source version, schema version, override layer, base family version, runtime product version and last verified build.

## 28.2 Inheritance Tree

A visual tree shows base family, culture/dimension variants, local overrides and runtime fallback. Selecting a field highlights where it was first authored and every descendant override.

## 28.3 Override Creation

Creating an override requires choosing scope:

- Current asset only.
- Variant family.
- Content pack.
- Platform/quality profile.
- Accessibility profile.

The UI previews which future base changes will still flow through.

## 28.4 Conflict Resolution

Conflicts are resolved semantically where possible. The UI shows base, local, incoming and resolved value, plus graph/spatial context. Binary media conflicts may require choose-one or manual replacement.

## 28.5 Migration Wizard

Migration steps:

1. Analyse source and dependants.
2. Show schema/ID/contract changes.
3. Create checkpoint.
4. Preview automatic mapping.
5. Resolve ambiguous items.
6. Run validation and representative scenarios.
7. Review generated products.
8. Commit or roll back.

## 28.6 Deprecation UX

Deprecated assets remain searchable with clear replacement and deadline. New bindings default to replacement IDs, while existing consumers can be batch-migrated.

# 29. Performance Budgets, LOD, Aggregation and Diagnostics

## 29.1 Budget Ribbon

Every relevant editor shows current budget profile, estimated isolated cost, scenario cost and release status. Estimates are labelled as editor, simulated or captured runtime data.

## 29.2 LOD Ladder View

```text
Full -> Reduced -> Minimal -> Critical Cue Only -> Hidden/Virtual
```

Creators can compare each level and inspect the trigger distance, screen size, density or budget condition.

## 29.3 Aggregation Preview

Repeated machines, ambience sources, effects or voices can be grouped into clusters. The preview shows cluster centres, contributing sources, retained variation and critical exceptions.

## 29.4 Virtualisation Inspection

Virtualised items remain visible in diagnostics with logical phase, state and reason. The creator can verify correct resume behaviour.

## 29.5 Budget Failure UX

Budget failures show the largest contributors, protected critical cues, discarded decorative components and recommended repairs. The UI avoids presenting only a total count with no path to action.

## 29.6 Runtime Profiler Link

Captured runtime spikes link back to resolved profiles, graph nodes, Sound Events, zones or sources. A profiler entry can open the relevant asset while preserving trace time.

# 30. Summer Engine and AI-Assisted Authoring UX

## 30.1 Assistance Entry Points

AI suggestions appear through explicit actions such as:

- Suggest anchors or masks.
- Generate first-pass effect grammar.
- Propose LOD reduction.
- Suggest sound layers or loop points.
- Fill material-response gaps.
- Build an accessibility alternative draft.
- Generate scenario and assertions.
- Explain diagnostics.
- Summarise review changes.

## 30.2 Suggestion Presentation

Suggestions are visually distinct from authored source and include:

- Prompt or requested goal.
- Input assets and versions.
- Tool/model version where available.
- Generated changes.
- Confidence or uncertainty note.
- Provenance/licence requirements.
- Diff preview.
- Accept all, accept selected, edit, regenerate or discard.

## 30.3 AI Boundaries

AI may not:

- Approve lifecycle states.
- Change authoritative gameplay contracts without owner workflow.
- Hide validation.
- Publish or bake release content automatically.
- Claim licence certainty without evidence.
- Replace creator edits silently.
- Require online inference at runtime.

## 30.4 Prompt History and Privacy

Prompt history follows project policy. Sensitive source or unreleased content is not sent to external services unless explicitly permitted. Local and remote assistance modes are clearly labelled.

## 30.5 Automation Scripts

Repeatable automation is stored as reviewable scripts or recipes where appropriate, rather than opaque conversational history only.

# 31. Localisation, Terminology, Help, Tutorials and Onboarding

## 31.1 Terminology Registry

The Forge uses approved terms consistently: Presentation Profile, Event Contract, Context Packet, anchor, socket, region, path, Surface Mask, Sound Event, Audio Family, VFX grammar, Acoustic Zone, Sound Portal, budget profile and runtime product.

## 31.2 Tooltips and Help

Tooltips explain purpose and consequence, not only restate labels. Complex fields link to examples, owning document and related validators.

## 31.3 Guided Tasks

Initial onboarding uses real MVP flows:

1. Attach a mining impact to a runtime contact.
2. Create a furnace active profile.
3. Build a simple voxel smoke graph.
4. Author a looping machine Sound Event.
5. Add a reduced-flash warning alternative.
6. Capture and replay a scenario.

## 31.4 Contextual Documentation

Pressing help from a selected node, field or validation opens the relevant local documentation section and preserves editor context.

## 31.5 Localisation

All UI text, captions, error messages and help labels use localisation keys. Stable IDs are never translated. Layouts are tested for text expansion and right-to-left support where applicable.

# 32. Customisation, Presets, Workspace Profiles and Quiet Modes

## 32.1 Workspace Profiles

Role profiles alter layout and default panels, not project data. Users may create personal profiles and export team presets.

## 32.2 Visual Customisation

- UI scale and text size.
- Theme and contrast.
- Graph grid and line density.
- Colour plus pattern/icon schemes.
- Animation and transition reduction.
- Waveform and meter display preferences.
- Viewport overlay opacity and thickness.

## 32.3 Quiet Modes

Quiet mode can reduce:

- Low-priority notifications.
- Auto-playing previews.
- Animated thumbnails.
- AI suggestions.
- Background activity feeds.
- Non-critical meter motion.

It never hides blockers, save failures or required approvals.

## 32.4 Preset Safety

Applying a preset shows affected fields and whether it creates local overrides. Presets never silently replace stable IDs or lifecycle metadata.

# 33. Large Projects, Data Density, Scaling and Navigation

## 33.1 Virtualised Lists and Trees

Libraries, hierarchies and issue panels virtualise rows and load details on demand. Selection and scroll position remain stable during incremental updates.

## 33.2 Summaries Before Detail

Large graphs, dependency networks and matrices show summary, filters and hotspots before rendering every element. Creators can drill into a bounded subset.

## 33.3 Batch Workflows

Batch operations exist for naming, tags, budgets, accessibility metadata, material responses, validation, bake and migration. Every batch has preview, scope and undo/checkpoint policy.

## 33.4 Search-First Navigation

The command palette and global search remain performant with large registries. Search results show owner, type, pack, lifecycle and validation to disambiguate similar names.

## 33.5 Stale Data

Panels indicate when data is loading, stale, partial or based on a previous build. Stale information is not presented with the same confidence as live validation.

## 33.6 Editor Performance

The Forge degrades editor-only decoration before core interaction. A complex preview may reduce grid animation or thumbnail updates, but selection, save, validation and critical metrics remain responsive.

# 34. Permissions, Security, Safe Operations and Creator Trust

## 34.1 Roles and Permissions

Permissions may control source edit, contract edit, lifecycle approval, licence review, bake, release packaging, migration and admin/debug actions.

## 34.2 Safe Destructive Actions

Deletion, ID replacement, contract breaking, source reimport, generated-product purge and major migration require scope review. Where possible, deprecate before delete.

## 34.3 External Files

Imported media is scanned and treated as untrusted input. The UI records source path/URI, hash, licence and import settings without executing embedded content.

## 34.4 Scripts and Extensions

Custom scripts or plugins declare permissions and project scope. Unsafe or unsigned extensions are visually distinct and can be disabled without corrupting project source.

## 34.5 Audit and Privacy

Audit records avoid storing unnecessary personal data. Review comments and authorship follow project retention policy. External AI or collaboration services require explicit project configuration.

# 35. Bake, Hot Reload, Godot Handoff and Runtime Verification UX

## 35.1 Bake Panel

Before bake, the panel shows:

- Dirty source assets.
- Changed dependencies.
- Validation blockers.
- Missing approvals or provenance.
- Target platforms/quality tiers.
- Products to create, replace or remove.
- Expected migration or cache impact.

## 35.2 Incremental Bake

Creators can bake selected assets, dependants or a release scope. The UI explains why additional assets are included.

## 35.3 Generated Product Inspection

Generated resources are viewable for diagnostics and manifest verification. Editing them directly is disabled or clearly marked as temporary because regeneration will overwrite them.

## 35.4 Hot Reload

Hot reload shows connection state, target build, applied products, rejected changes and whether runtime state was reconstructed. Structural changes that require restart are identified before attempt.

## 35.5 Runtime Verification

A source is not "verified in context" merely because bake succeeded. Verification requires selected scenarios or live runtime tests to pass and records build ID, settings and evidence.

## 35.6 Failure Recovery

Failed bake or reload does not discard source. The UI keeps previous verified runtime products available where safe and offers logs, retry, clean rebuild or rollback.

# 36. Minimum Viable 23H System

## 36.1 MVP Workspaces

- Shared shell and project dashboard.
- Unified library and global search.
- Spatial authoring workspace.
- Presentation Profile editor.
- Event Contract and Binding editor.
- VFX graph and voxel-form editing.
- Sound Event, waveform, layer and loop editing.
- Basic material-response matrix.
- Preview viewport and Context Builder.
- Test Laboratory with capture/replay.
- Validation/issues panel.
- Accessibility review panel.
- Bake and hot-reload status.

## 36.2 MVP Commands

- Create/open/duplicate/override/deprecate asset.
- Copy stable ID and reveal owner/dependencies.
- Create spatial reference.
- Bind event/state.
- Add VFX/audio/accessibility component.
- Preview/reset/step/capture/replay.
- Validate current/selection/scope.
- Compare versions.
- Create review request/comment.
- Bake selection and verify scenario.
- Undo/redo/snapshot/recover.

## 36.3 MVP Accessibility

- Keyboard navigation for shell, library, inspector, issues and transport.
- Scalable text and high-contrast interface.
- Reduced editor animation.
- Colour-plus-icon diagnostic states.
- Captions during sound preview.
- Reduced-motion/flash and audio-mute simulation.
- Critical-cue equivalence checklist.

## 36.4 MVP Non-Goals

- Real-time multi-user co-editing.
- Full plugin marketplace.
- Dialogue recording suite.
- Adaptive music timeline.
- General modelling or texture-paint package.
- Physically exact acoustic simulation.
- Console-certified editor release.

# 37. Forest Hamlet End-to-End Creator Scenario

## 37.1 Scenario Goal

Prove that a creator can author, test, review and verify the complete Presentation Forge loop for the Forest Hamlet without using disconnected one-off tools.

## 37.2 Mining Impact

1. Open the iron pickaxe item and select its impact Presentation Profile.
2. Confirm the combat/mining event contract and runtime-contact payload.
3. Inspect the Material Response Matrix for stone, ore and mana crystal.
4. Preview debris VFX and impact Sound Event at exact captured contact.
5. Test cave acoustics, wet stone and heavy/light intensity.
6. Validate budget, caption policy and duplicate suppression.

## 37.3 Footsteps

1. Open humanoid foot-contact binding.
2. Verify left/right socket mirroring and animation markers.
3. Sweep movement speed and surface family.
4. Preview dirt, wood, stone, mud and shallow water.
5. Test audio muted with visual contact alternatives where required.

## 37.4 Furnace Lifecycle

1. Open furnace profile and inspect idle, ignition, active, blocked, damaged and shutdown channels.
2. Place chimney smoke, motor/gearbox audio and warning indicator.
3. Map heat ratio, output fill and damage parameters.
4. Replay captured blockage trace.
5. Compare one furnace with a row of 100 using aggregation and virtualisation.
6. Verify reduced particle and quiet-audio modes.

## 37.5 Mana Conduit and Ward

1. Open mana path and ward perimeter spatial references.
2. Preview flow pulses and spatial hum along path.
3. Trigger unstable and breach states.
4. Confirm reduced-flash alternative, caption and directional warning.
5. Verify critical cue survives raid stress budget.

## 37.6 Village Ambience and Shelter

1. Generate or review village acoustic zones and house Sound Portals.
2. Set rain, work activity, market and distant machines.
3. Walk listener from open street through door into timber house.
4. Verify rain contact changes, leakage, reverb and ambience priority.

## 37.7 Goblin Raid

1. Load raid scenario and event sequence.
2. Validate horn, bells, guard calls, combat effects, fire, damage and ward warning.
3. Run normal, reduced-motion, reduced-flash, colour-filtered and audio-muted tests.
4. Run split-screen with players in street and house.
5. Capture metrics and compare against acceptance thresholds.
6. Submit review with trace, screenshots, audio A/B and validation report.

## 37.8 Scenario Completion Evidence

- No release blockers.
- All critical cues have equivalence evidence.
- No duplicate predicted/confirmed cues.
- Required anchors resolve across base and damaged variants.
- Dense scene remains inside approved budget or uses correct fallback.
- Bake succeeds and runtime replay matches editor expectation.
- Review and approval history is complete.

# 38. Validation, Quality Assurance and Acceptance

## 38.1 UI Validation Categories

- Layout and clipping.
- Focus and input.
- Selection and context.
- Data binding and stale state.
- Undo/recovery.
- Accessibility.
- Large-data performance.
- Validation accuracy.
- Collaboration and lifecycle.
- Bake/hot-reload trust.

## 38.2 Automated Tests

- Open every registered asset type in its default editor.
- Round-trip edit and undo.
- Restore autosave after simulated crash.
- Navigate dependency links and return context.
- Run keyboard focus traversal.
- Scale UI text and inspect clipping.
- Validate graph, contract, profile and spatial errors.
- Capture and replay fixed scenario.
- Compare generated manifests.
- Load large synthetic library and graph.

## 38.3 Manual Review

Manual review must include artists, audio designers, technical designers, QA and accessibility reviewers where available. Tool acceptance is based on realistic production tasks, not only widget-level function.

## 38.4 Acceptance Questions

- Can a new creator complete the guided furnace task without undocumented knowledge?
- Can a reviewer trace a cue from runtime event to final components?
- Can an invalid contract or missing anchor be repaired from the diagnostic?
- Can a creator compare variant, LOD and accessibility results without reopening context?
- Can the system recover from a crash or failed bake without source loss?
- Can dense scenes be diagnosed to specific profiles or graph nodes?
- Can keyboard-only users reach core review and authoring workflows?

# 39. Balancing and Authoring Rules

1. Prefer visible context over additional hidden automation.
2. Use shared panels and commands before creating specialist duplicates.
3. Keep the most common workflow direct; preserve advanced detail through progressive disclosure.
4. Never hide an error because its panel is collapsed.
5. Show resolved value and source of inheritance together.
6. Prefer semantic navigation over file-system navigation.
7. Preview representative gameplay scale, not only close-up beauty shots.
8. Test entry, loop, interruption, exit, reload and LOD, not only steady state.
9. Critical cue accessibility is a release requirement, not a polish task.
10. Avoid auto-playing sound or animation in large libraries by default.
11. Batch operations require scope preview and recovery.
12. AI output remains suggestion until accepted and approved.
13. Generated runtime products remain inspectable but not canonical source.
14. Validation messages must name cause, consequence and repair.
15. A successful bake does not replace in-context verification.
16. Quiet mode may reduce noise but never hide blockers or save failure.
17. Large-data performance must be designed from the first production version.
18. Tool UI must use localisation keys and accessibility labels from the beginning.
19. Every new editor declares its selection, command, history, validation and preview contracts.
20. The Forge should feel like one system even when specialist tools become deep.

# 40. Explicit Deferrals and Open Questions

## 40.1 Explicit Deferrals

- Full dialogue recording, editing, lip-sync and localisation production.
- Adaptive music composition and cinematic score tools.
- General-purpose cinematic sequencer.
- General 3D modelling, sculpting and texture-authoring replacement.
- Real-time cloud co-editing and web review portal.
- Public mod marketplace publishing.
- Platform certification dashboards and console editor ports.
- Physically exact acoustic ray simulation.
- Automatic artistic approval.

## 40.2 Open Questions for 23I

- Which workspaces run inside the Godot editor and which may use companion windows?
- How is shared selection and command history implemented across tools?
- What graph UI/runtime library is approved?
- How are live Godot traces transported and versioned?
- Which preview rendering and audio services are reused from the game runtime?
- How are large registries indexed and incrementally validated?
- What is the precise autosave, snapshot and recovery storage model?
- How are editor plugins sandboxed and permissioned?

## 40.3 Open Questions for 23J

- Which role layouts and guided tasks ship first?
- What assets form the golden UI test library?
- Which validation codes block each production stage?
- What review roles are mandatory for each asset category?
- Which accessibility evidence is required for release-ready state?
- How are screenshots, captures and A/B evidence retained?
- What migration training and production rollout sequence is used?

# Appendix A. Core UI Data and State Templates

## A.1 Workspace Layout

```text
WorkspaceLayout
{
    layout_id
    display_name_key
    target_role
    panels[]
    docking_tree
    default_focus
    required_commands[]
    minimum_resolution
    accessibility_defaults
    user_override_allowed
}
```

## A.2 Editor Selection Context

```text
SelectionContext
{
    project_id
    content_pack_id
    owner_asset_id
    semantic_selection_ids[]
    editor_domain
    variant_id
    override_layer
    time_or_frame
    runtime_trace_id?
    runtime_instance_id?
    camera_id?
    listener_id?
}
```

## A.3 Diagnostic Record

```text
EditorDiagnostic
{
    diagnostic_id
    code
    severity
    source_asset_id
    semantic_location
    message_key
    cause_fields
    consequence_key
    repair_actions[]
    suppressibility
    validator_version
    created_at
}
```

## A.4 Review Record

```text
ReviewRecord
{
    review_id
    target_asset_ids[]
    source_version
    requested_roles[]
    comments[]
    validation_snapshot
    accessibility_snapshot
    budget_snapshot
    runtime_evidence[]
    approvals[]
    final_status
}
```

## A.5 Scenario Definition

```text
PresentationScenario
{
    scenario_id
    world_or_blueprint_id
    entities_and_sources[]
    event_schedule[]
    state_tracks[]
    context_defaults
    camera_paths[]
    listener_paths[]
    quality_profile
    accessibility_profiles[]
    assertions[]
    stress_parameters
    expected_budget
}
```

# Appendix B. Workspace, Panel and Command Catalogue

## B.1 Core Workspaces

| Workspace ID | Purpose |
|---|---|
| `workspace.project_dashboard` | Project health, tasks, review, bake and recovery. |
| `workspace.library` | Search, collections, dependencies and coverage. |
| `workspace.spatial` | Anchors, sockets, regions, paths, masks, zones and portals. |
| `workspace.profile` | Presentation Profile composition and variants. |
| `workspace.contracts` | Event/state schema and binding authoring. |
| `workspace.vfx` | Voxel forms, effect families and graph access. |
| `workspace.vfx_graph` | Particle graph, timeline, live simulation and diagnostics. |
| `workspace.audio` | Sound sources, layers, loops and Sound Events. |
| `workspace.material_audio` | Material Response Matrix and contact preview. |
| `workspace.acoustics` | Acoustic Zones, Sound Portals and ambience. |
| `workspace.mix` | Buses, snapshots, voices and clustering. |
| `workspace.test_lab` | Scenario, capture, replay, compare and acceptance. |
| `workspace.review` | Diffs, comments, approvals and evidence. |
| `workspace.bake` | Product generation, hot reload and verification. |

## B.2 Required Panels

| Panel | Required Capabilities |
|---|---|
| Library | Search, filter, saved query, preview card and dependency badges. |
| Hierarchy | Semantic tree, selection sets and owner relationships. |
| Inspector | Local/resolved values, overrides, validation and raw view. |
| Dependencies | Uses/used-by, cycles, deprecated and missing. |
| Issues | Severity, source, repair, suppression and task creation. |
| Timeline | Events, state, parameters, loops, capture and markers. |
| Context | Current packet, source, fallback and runtime comparison. |
| Budget | Isolated, simulated and captured costs. |
| Accessibility | Meaning, channels, variants and test evidence. |
| History | Navigation, commands, snapshots and recovery. |
| Review | Comments, diffs, approvals and evidence. |
| Bake | Targets, products, logs, reload and verification. |

## B.3 Core Command Families

- Project and workspace.
- Open, search and navigate.
- Create, duplicate, inherit and override.
- Select, group, mirror and remap.
- Graph and timeline.
- Audio transport and audition.
- Preview and context.
- Capture, replay and compare.
- Validate and repair.
- Accessibility simulation.
- Review and approval.
- Bake, reload and verify.
- Undo, redo, snapshot and recover.

# Appendix C. Default Input and Focus Map

| Action | Keyboard/Mouse Default | Controller Review Default | Notes |
|---|---|---|---|
| Global search | Ctrl+K | Menu shortcut | Remappable. |
| Command palette | Ctrl+Shift+P | Menu shortcut | Shows enabled reason. |
| Save | Ctrl+S | Menu action | Does not approve. |
| Undo/Redo | Ctrl+Z / Ctrl+Y | Shoulder chord | Cross-asset transaction aware. |
| Back/Forward | Alt+Left / Alt+Right | Shoulder buttons | Preserves context. |
| Validate selection | Ctrl+Alt+V | Menu action | Scope shown before run. |
| Play/Pause preview | Space | Primary face button | Disabled while text editing. |
| Step frame/event | Period / Shift+Period | D-pad right/left | Mode-dependent. |
| Stop all audio | Ctrl+Space | Long press secondary | Always available. |
| Focus selected | F | Stick press | Viewport/graph/hierarchy. |
| Toggle inspector | Ctrl+I | Menu action | Layout-only change. |
| Add comment | Ctrl+Alt+C | Menu action | Attaches to context. |
| Snapshot | Ctrl+Shift+S | Menu action | Distinct from save-as. |
| Accessibility matrix | Ctrl+Alt+A | Menu action | Opens review mode. |

# Appendix D. Validation and Diagnostic Code Register

| Code | Severity | Meaning |
|---|---|---|
| `UI-CONTEXT-001` | Error | Editor selection references missing semantic ID. |
| `UI-CONTEXT-002` | Warning | Preview uses stale context or runtime build. |
| `UI-LAYOUT-001` | Error | Required control clipped at supported minimum size. |
| `UI-FOCUS-001` | Error | Focus can enter but cannot leave a control region. |
| `UI-FOCUS-002` | Warning | Focus restoration target no longer exists. |
| `UI-INSPECT-001` | Error | Resolved value source cannot be explained. |
| `UI-UNDO-001` | Blocker | Operation changed source without recoverable transaction/checkpoint. |
| `UI-SAVE-001` | Blocker | Explicit save failed or recovery copy unavailable. |
| `UI-VALIDATE-001` | Error | Diagnostic points to no resolvable editor location. |
| `UI-ACCESS-001` | Blocker | Core workflow is unreachable by keyboard. |
| `UI-ACCESS-002` | Error | Supported text scale causes clipped or overlapping critical controls. |
| `UI-ACCESS-003` | Error | Critical cue has no equivalent under selected disabled channel. |
| `UI-AI-001` | Blocker | AI-generated change lacks provenance or review state. |
| `UI-REVIEW-001` | Error | Approval references a different source version. |
| `UI-BAKE-001` | Blocker | Bake target contains unresolved release blockers. |
| `UI-BAKE-002` | Error | Hot reload result does not match product manifest. |
| `UI-PERF-001` | Warning | Editor view exceeds responsiveness target. |
| `UI-PERF-002` | Error | Large-data view cannot complete bounded navigation operation. |

# Appendix E. Accessibility Authoring and Test Matrix

| Test | Authoring Check | Laboratory Check | Pass Evidence |
|---|---|---|---|
| Keyboard-only | Commands, focus order, numeric alternatives. | Complete MVP task without pointer. | Recorded task completion and no focus trap. |
| Text scaling | Flexible labels and panels. | Supported maximum scale at minimum resolution. | No clipped critical controls. |
| Reduced motion | Alternative profile and bounded camera response. | Raid and portal scenarios. | Meaning and direction preserved. |
| Reduced flash | Pulse limits and alternative shape/timing. | Overlapping ward, spell and lightning stress. | No blocked threshold and cue remains readable. |
| Colour independence | Shape/pattern/icon alternatives. | Colour filters and monochrome. | States remain distinguishable. |
| Audio muted | Captions, indicators and visual direction. | Furnace fault, goblin horn and ward breach. | Source, urgency and action remain identifiable. |
| Visual reduction | Sound/haptic alternative where required. | Fog, low contrast and particle reduction. | Critical threat remains perceivable. |
| Frequency comfort | Alternate cue or filter-safe design. | Repeated warning and magic tone. | No loss of critical meaning. |
| Controller review | Focus and transport mapping. | Preview, comment and approval flow. | Core review task completes. |

# Appendix F. MVP Acceptance Matrix

| Area | Acceptance Criterion |
|---|---|
| Shell | Open, navigate and restore all MVP workspaces with preserved context. |
| Library | Find assets by ID, tag, contract, validation and dependency. |
| Inspector | Explain local, inherited, overridden and generated values. |
| Spatial | Author and remap voxel, face, mask, socket, path and zone references. |
| Profile | Compose VFX/audio/accessibility components and inspect resolved result. |
| Contracts | Bind legal events and detect missing/incompatible payloads. |
| VFX | Edit voxel form and graph, compile, preview and inspect budgets. |
| Audio | Edit layers and loop, audition variation and preview captions. |
| Acoustics | Review one generated zone and door Sound Portal transition. |
| Test Lab | Build or load scenario, capture, replay, compare and record assertion. |
| Accessibility | Run critical-cue matrix and produce review evidence. |
| Recovery | Restore unsaved source after simulated crash. |
| Review | Comment, diff, approve and reject with version-safe records. |
| Performance | Diagnose stress-scene contributors and verify fallback ladder. |
| Bake | Generate MVP products, hot reload and record runtime verification. |

# Appendix G. Cross-System Integration Matrix

| System | 23H UI/UX Requirement |
|---|---|
| Asset Forge | Open owner model/item/block, preserve stable selection and expose spatial references. |
| Entity Forge | Show rig/body/socket ownership, animation contacts and variant remapping. |
| Blueprint Forge | Edit structure zones, portals, paths, machine/ward placement and scenario context. |
| Animation Forge | Align event markers, contacts, release timing and presentation trace. |
| 23A Foundation | Use shared profiles, lifecycle, budgets, accessibility and manifests. |
| 23B Spatial | Direct editing, overlay, remap, fallback and validation. |
| 23C Events | Contract browsing, context inspection, binding and replay. |
| 23D VFX Core | Effect library, family inheritance, style validation and surface presentation. |
| 23E Particle Graph | Typed graph, timeline, live simulation, counters and compiler diagnostics. |
| 23F Sound Forge | Source, layer, loop, event, family, provenance and listening review. |
| 23G Runtime Audio | Material matrix, spatial preview, zones, portals, buses, snapshots and voices. |
| 23I Technical Plan | Implement shared services, persistence, live link, performance and automated tests. |
| 23J Production Plan | Define golden assets, role layouts, release gates, training and migration rollout. |
| Game UI/UX | Reuse accessibility terminology and preview player-facing captions/indicators without duplicating game logic. |
| Multiplayer | Test authority, prediction, reconciliation, listeners and split-screen presentation. |
