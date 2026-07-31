# Fantasy Voxel Civilisation Sandbox
## 21C - Voxel Asset Forge - Animation, Effects and Runtime Visual States
**Version 0.1 - Detailed Design Bible Draft**

A detailed authoring specification for bringing Forge-built blocks, items, stations, machines, logistics components and magical infrastructure to life through transform animation, voxel-frame animation, material motion, particles, lights, audio cues and state-driven presentation.

## Animation, Effects and Runtime Visual States Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines animation clips, timelines, keyframes, named-part motion, voxel-frame animation, material animation, visibility changes, particles, lights, audio cues, state bindings, transitions, layering, preview, baking, runtime playback, LOD and validation. |
| Core Philosophy | Authoritative gameplay systems decide what an object is doing; the Forge decides how that truth is communicated visually and audibly. |
| Primary Animation Method | Use named-part transform animation for rigid moving pieces such as gears, wheels, doors, pistons, fans, rollers and crusher heads. |
| Frame Animation Direction | Support voxel-frame animation where the actual silhouette or voxel arrangement changes, but do not use complete model frames for simple rigid motion that can be represented by transforms. |
| Material Animation Direction | Use material parameters, emissive masks, palette cycling, scrolling, distortion and visibility for flames, heat, runes, mana flow, warning lights and similar effects where geometry changes are unnecessary. |
| Effects Direction | Particles, lights and audio are attached through stable sockets and controlled by clips or state bindings rather than embedded as uncontrolled scene logic. |
| State Direction | Visual states bind to read-only authoritative values such as powered, active, processing, blocked, damaged, burning, wet, corrupted or overloaded. Presentation data may not create or change those gameplay states. |
| Layering Direction | Permit compatible states to combine, such as processing plus damaged or powered plus corrupted, using explicit priority, masks, additive channels and conflict rules. |
| Override Direction | Authorised developers may replace clips, frame sets, state mappings, particles, light profiles, audio cues and transition rules while preserving gameplay identity and state contracts. |
| Runtime Direction | Source timelines and frames are baked into compact runtime animation resources, cached meshes, material tracks and effect references. Runtime playback must avoid rebuilding voxel geometry every frame. |
| Implementation Context | Current implementation target is Godot with Summer Engine. Exact AnimationPlayer, AnimationTree, shader, resource and node structures are deferred to 21F, but 21C must remain compatible with a data-driven Godot pipeline. |
| MVP Direction | Prove a rotating gear, crusher piston, furnace ignition and burn cycle, animated mana conduit, warning state, damage overlay, effect sockets, audio cues and developer override workflow. |

## Document Purpose

This document defines how Forge-authored assets move, glow, emit effects, sound and respond to real game state. Document 21A established the Voxel Asset Forge as a code-preserving visual-authoring layer. Document 21B defined the static source assets: voxel volumes, painted faces, named parts, pivots, material masks, sockets, collision and baked geometry. Document 21C turns those prepared assets into readable runtime presentation.

The animation system must make common machinery easy. A gear should rotate without requiring thirty separately modelled copies. A furnace should ignite, glow, emit smoke and play a working sound only while its coded furnace state says it is active. A mana conduit should pulse in the actual direction of flow. A crusher should stop when its output is blocked. A damaged machine should continue its work cycle while also showing cracked panels, sparks or unstable movement where appropriate.

The system must also support the user's original frame-animation idea. Frame-based voxel animation is valuable when the shape genuinely changes, such as a magical flame, unstable portal surface, growing crystal, transforming rune or stylised liquid splash. It should not be the default solution for rigid parts because transform animation is cleaner, smaller, easier to edit and more performant.

This document focuses on animation and runtime presentation rules. Full override precedence and registry migration are expanded in 21D. Editor screens, timeline interaction and creator workflow are expanded in 21E. Godot classes, file formats, baking services, shader strategy and performance implementation are expanded in 21F.

## Engine Status Note

> **Current Project Direction**  
> Leyforge is currently being built in Godot with Summer Engine. The first Forge animation implementation should favour standard Godot animation and resource systems, GDScript-first tooling and data-driven state bindings. Earlier Unreal-specific planning remains useful for stable IDs, separation of authoritative state from presentation, validation and runtime budgets, but it is not the active engine direction.

## Design Sources

| Source Document | Relevant Direction | How 21C Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Machines, magic, villages, tools and creatures should look richer than basic terrain while remaining stylised and readable. Lighting, effects and animation communicate world mood and activity. | Locks readability, atmosphere and the requirement that motion supports the living-world fantasy. |
| 03 - Blocks Registry | Blocks have states such as facing, lit, powered, active, damaged, wet and corrupted. Functional blocks, machines and magic infrastructure require visible state feedback. | Provides the state vocabulary that visual bindings must present without owning. |
| 08 - Automation System | Moving parts, power, item flow, blockage, risk and machine operation must be physically readable. Nearby systems show detailed movement while distant systems simplify. | Requires transform animation, flow cues, blocked states, warnings and animation LOD. |
| 09 - Magic System | Mana, runes, wards, conduits, rituals and corruption are visible physical infrastructure. | Requires emissive animation, flow direction, magical particles, lights and layered corruption states. |
| 10 - Creatures and Monsters | Creatures must be recognisable through silhouette, sound and movement, but full creature animation is deferred to a later creator series. | Establishes future compatibility while keeping 21C focused on blocks, items, props and machines. |
| 11 - Biomes and World Generation | Weather, wetness, snow, corruption, blessing and world state can alter asset presentation. | Requires environmental state layers and deterministic playback. |
| 12 - Structures | Buildings and structures can be active, damaged, burned, repaired, restored, occupied or powered. | Requires scalable ambient animation and state presentation for structures and props. |
| 17 - UI/UX System | Complex systems should remain understandable through clear feedback and accessible presentation. | Requires readable indicators, warning alternatives and controls for motion, flashes, particles and audio. |
| 21A - Voxel Asset Forge Core System | Locks the hybrid animation model, developer overrides and authoritative state boundary. | Acts as the direct governance source for 21C. |
| 21B - Voxel Modelling, Texturing and Material Authoring | Defines named parts, pivots, sockets, material masks, state layers, frame-ready source geometry and baked assets. | Supplies all static source components required by animation. |

## Static Table of Contents

- 1. Locked Animation, Effects and Runtime State Identity
- 2. Player Decision and Direction Summary
- 3. Presentation Architecture and Authority Boundary
- 4. Animation Categories and Selection Rules
- 5. Named-Part Transform Animation
- 6. Keyframes, Timeline Tracks and Interpolation
- 7. Loops, Cycles, Playback Speed and Phase
- 8. Voxel-Frame Animation
- 9. Material, Palette and Shader Animation
- 10. Visibility, Variant and Geometry-State Animation
- 11. Particle Effects and Effect Sockets
- 12. Light, Emission and Illumination Responses
- 13. Audio Cues, Loops and Sound Sockets
- 14. Runtime Visual State Contract
- 15. State Bindings and Presentation Graphs
- 16. Layered States, Priorities and Conflict Resolution
- 17. Transitions, Blending and Interruptions
- 18. Machine and Station Animation Rules
- 19. Furnace Presentation Pattern
- 20. Chutes, Conveyors and Logistics Presentation
- 21. Magic Infrastructure Presentation
- 22. Damage, Heat, Weather, Burning and Corruption States
- 23. Items, Tools, Doors, Props and Small Interactive Assets
- 24. Gameplay Events, Triggers and One-Shot Presentation
- 25. Determinism, Saving, Multiplayer and Reconnection
- 26. Animation LOD, Visibility and Performance Budgets
- 27. Baking, Caching and Runtime Playback Products
- 28. Developer Overrides and Existing Asset Editing
- 29. Preview, Scrubbing, Debugging and Test Environments
- 30. Validation, Warnings and Failure Handling
- 31. Accessibility and Player Presentation Settings
- 32. Minimum Viable 21C Scope
- 33. Success Criteria and Acceptance Rules
- 34. Relationships With Documents 21D-21G
- Appendix A. Animation Clip Field Template
- Appendix B. Visual State Binding Field Template
- Appendix C. Standard Presentation Patterns
- Appendix D. POC Animation Test Matrix
- Appendix E. Deferred Questions and Production Decisions

# 1. Locked Animation, Effects and Runtime State Identity

The animation and effects layer is the communication layer of the Forge. It turns hidden simulation values into visible, audible and understandable world behaviour. A player should be able to look at a furnace, crusher, chute, ward lantern or mana conduit and make a useful judgement about whether it is powered, active, blocked, damaged, dangerous or disconnected.

> **Locked Rule**  
> Gameplay systems own truth. Forge presentation reads that truth and expresses it through motion, materials, effects, lights and sound. A visual clip may communicate processing, but it may not start processing, consume fuel, create output or decide whether the machine is powered.

## 1.1 Presentation Promise

A developer should be able to use the Forge to:

- Rotate a gear around a correctly placed axle pivot.
- Move a crusher head through a looping work cycle.
- Make conveyor rollers move at a speed linked to actual throughput.
- Turn furnace flames, glow, smoke and sound on when the furnace becomes active.
- Show a brief ignition transition instead of instantly switching from cold to fully burning.
- Pulse mana through a conduit in its real flow direction.
- Flash an output-blocked warning without changing the machine's blocked state.
- Layer damage sparks over a machine that is still processing.
- Replace an existing animation or effect as a visual override without changing the machine definition.
- Preview all supported states and combinations before the asset is accepted.

## 1.2 Identity Layers

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Mechanical Motion | Rigid parts move through transforms around declared pivots. | Gears, wheels, pistons, doors and rollers clearly show operation. |
| Shape Animation | Frame sets change the actual voxel silhouette when needed. | Flames, portals, crystals and transforming magical objects can visibly deform. |
| Material Motion | Material parameters animate without rebuilding geometry. | Heat, mana, rune flow, blinking lights and surface movement remain efficient. |
| Effect Response | Particles, lights and sounds activate from named sockets and state rules. | Smoke, sparks, steam, glow and machine audio appear in correct locations. |
| State Communication | Read-only gameplay states drive presentation graphs. | The player understands power, work, blockage, danger, damage and corruption. |
| Layered Consequence | Compatible states combine instead of replacing one another. | A damaged active furnace can burn, spark and glow at the same time. |
| Performance Scaling | Detail reduces with distance and visibility while state remains understandable. | Large settlements and factories remain feasible. |
| Safe Overrides | Presentation can be replaced independently from gameplay. | Visual iteration does not threaten recipes, saves or resource logic. |

## 1.3 What This System Is Not

- It is not a gameplay scripting system disguised as an animation editor.
- It is not a full skeletal character animation suite.
- It is not permission to rebuild voxel meshes every rendered frame.
- It is not a requirement that every machine have complex motion.
- It is not a reason to hide critical state behind subtle effects only.
- It is not a cinematic sequencer for cutscenes or dialogue performance.
- It is not the final NPC, animal or monster animation system, although later creators may reuse its clip, state and effect foundations.

# 2. Player Decision and Direction Summary

| Area | Locked Decision |
| --- | --- |
| Overall Model | Use a hybrid animation system: transform clips, voxel frames, material animation, visibility changes, particles, lights, audio and state bindings. |
| Preferred Rigid Motion | Rotate, translate or scale named parts rather than creating complete model frames. |
| Frame Animation | Include voxel-frame animation for genuine shape change, stylised effects and transforming objects. |
| Furnace Fire | Use a combination of animated material or small frame set, emissive response and optional particles rather than a large sequence of rebuilt furnace meshes. |
| Machine Motion | Gears, wheels, pistons, rollers and doors use named-part transforms with declared pivots. |
| State Ownership | Powered, processing, blocked, damaged, burning and other state truth remains in gameplay code. |
| State Binding | The Forge maps gameplay state values and events to presentation clips and layers. |
| Layering | Permit compatible overlays such as active + damaged + wet, with explicit priorities and channel conflicts. |
| Effects | Particles, lights and audio use stable sockets and reusable effect profiles. |
| Animation Overrides | Authorised developers may override individual clips, tracks, frames, effects, audio and state mappings. |
| Playback | Support loop, one-shot, ping-pong, hold, randomised phase and parameter-driven speed. |
| Determinism | Networked state and saved phase use authoritative or deterministic values where gameplay readability depends on synchronisation. |
| LOD | Nearby assets show full motion and effects; distant assets simplify, slow, aggregate or stop nonessential presentation. |
| Accessibility | Critical states require non-motion alternatives such as icon, material, shape, light or UI feedback. |
| MVP | Build and test a gear, crusher, furnace, chute/logistics component, mana conduit and damaged/warning state set. |

# 3. Presentation Architecture and Authority Boundary

## 3.1 Source-to-Runtime Flow

```text
Authoritative gameplay definition and runtime state
    -> read-only state contract
    -> Forge state binding resolver
    -> animation/effect presentation graph
    -> baked clips, material tracks, particles, lights and audio cues
    -> runtime visual instance
```

The state binding resolver may read values such as `is_powered`, `process_progress`, `output_blocked`, `damage_ratio`, `heat_ratio`, `mana_flow_direction` or `corruption_ratio`. It may not write those values unless a separate gameplay interaction explicitly owns that command.

## 3.2 Data Ownership Matrix

| Data | Owning System | Forge Access |
| --- | --- | --- |
| Fuel amount and consumption | Crafting/Machine gameplay | Read-only preview and state binding. |
| Recipe progress | Crafting/Machine gameplay | Read-only progress parameter. |
| Power availability | Automation/Power gameplay | Read-only state and normalised value. |
| Item transfer | Logistics gameplay | Read-only event, direction and throughput. |
| Damage amount | Block/Combat gameplay | Read-only state, ratio and events. |
| Animation clip | Forge | Full visual editing. |
| Part transform keyframes | Forge | Full visual editing. |
| Material parameter curves | Forge | Full visual editing within approved material channels. |
| Particle profile reference | Forge | Full presentation editing. |
| Sound cue reference | Forge | Full presentation editing using approved audio assets. |
| State-to-presentation binding | Forge | Full editing against declared read-only state contract. |
| Gameplay consequence of clip end | Gameplay system | Forge may emit a presentation marker only; gameplay decides whether it is relevant. |

## 3.3 No Hidden Behaviour Rule

A machine must not depend on an animation reaching a keyframe in order to produce its output unless the gameplay system explicitly schedules the same deterministic event and treats the animation marker as presentation confirmation. Visual playback can be paused, culled or simplified; gameplay simulation must remain correct.

## 3.4 Presentation Markers

Clips may contain named markers such as:

- `marker.contact`
- `marker.impact`
- `marker.door_open`
- `marker.spark_peak`
- `marker.audio_clank`
- `marker.output_visual`

Markers coordinate visual effects and audio. Gameplay may listen to approved markers only where the gameplay timing is already authoritative and the marker cannot create duplicate transactions.

# 4. Animation Categories and Selection Rules

## 4.1 Category Matrix

| Animation Type | Best Use | Avoid When |
| --- | --- | --- |
| Transform animation | Rigid parts with stable geometry. | The object must actually change voxel shape. |
| Voxel-frame animation | Shape-changing flame, portal, crystal, plant, magical form or stylised fluid. | The same result is a simple rotation, translation or material change. |
| Material animation | Glow, heat, flow, blinking, scrolling, palette cycling, distortion. | Collision or silhouette must change. |
| Visibility animation | Turning parts, overlays, indicators or variants on/off. | Smooth motion is required. |
| Particle effect | Smoke, sparks, steam, dust, ash, motes, debris. | A stable readable shape or gameplay object is required. |
| Light animation | Ignition, pulse, flicker, overload, warning beacon. | The effect would create excessive dynamic-light cost or photosensitive risk. |
| Audio animation | Loops, impacts, ignition, shutdown and warning cues. | Sound would duplicate constantly across large networks without aggregation. |

## 4.2 Selection Rule

Use the least expensive category that accurately communicates the action:

```text
Does the rigid part move? -> transform animation
Does the silhouette truly change? -> voxel-frame animation
Does only the surface appearance change? -> material animation
Does an optional layer appear/disappear? -> visibility track
Is it emitted transient matter or energy? -> particle effect
Is illumination itself meaningful? -> light response
Is sound needed to communicate timing or state? -> audio cue
```

## 4.3 Hybrid Clips

A clip may combine categories. A furnace ignition can include:

- Door vent opening through transform animation.
- Flame plane appearing through visibility animation.
- Flame material accelerating through material animation.
- Internal emission rising through a parameter curve.
- Smoke particle emission increasing.
- Ignition audio one-shot.
- Warm light fading in.

The clip remains one authored presentation sequence even though several runtime systems render it.

# 5. Named-Part Transform Animation

Transform animation is the default for machinery and interactive props.

## 5.1 Supported Transform Channels

- Local position.
- Local rotation.
- Local scale for approved stylised motion.
- Pivot/origin offset where explicitly authored.
- Visibility.
- Optional material override or state layer weight.

## 5.2 Pivot Requirements

A moving part must have a meaningful pivot before animation:

- Gear: axle centre.
- Wheel: hub centre.
- Door: hinge edge.
- Trapdoor: hinge line.
- Crusher head: guide-axis origin.
- Piston: cylinder axis.
- Lever: mounting pin.
- Fan or blade: shaft centre.
- Conveyor roller: centreline.

The Forge should show a pivot warning when a rotational clip exists but the pivot is still at an obviously inappropriate default origin.

## 5.3 Local and Parent Space

Part transforms should normally animate in local space so compound assets can rotate or place in the world without changing the clip. Parent-child relationships may be used for mechanisms such as:

```text
machine_body
└── drive_shaft
    ├── gear_left
    └── gear_right
```

Circular or reciprocating motion should not require hand-authoring world-space paths for every machine rotation.

## 5.4 Rotation Direction and Mechanical Readability

Connected gears should visually rotate in plausible opposing directions. Belts, rollers and shafts should communicate the direction of transport or power. Perfect physical simulation is not required, but obviously contradictory motion should be flagged during review.

## 5.5 Reusable Motion Profiles

Common transform patterns should be reusable:

- Continuous clockwise rotation.
- Continuous counter-clockwise rotation.
- Reciprocating piston.
- Door open/close.
- Lever toggle.
- Valve turn.
- Bob and float.
- Pendulum sway.
- Conveyor roller.
- Crusher strike.
- Bellows pump.

A reusable pattern may be instanced and parameterised by speed, angle, distance and phase rather than copied into every asset.

# 6. Keyframes, Timeline Tracks and Interpolation

## 6.1 Timeline Model

Each animation clip contains:

- Clip ID and display name.
- Duration.
- Playback mode.
- Named part tracks.
- Material parameter tracks.
- Visibility tracks.
- Particle, light and audio tracks.
- Markers.
- Default speed and optional bound speed parameter.
- Transition metadata.
- LOD policy.

## 6.2 Keyframe Types

| Keyframe Type | Purpose |
| --- | --- |
| Value key | Sets a position, rotation, scale, visibility or numeric material value. |
| Event key | Starts, stops or pulses a particle, light or audio cue. |
| Marker key | Provides a named timing point for presentation coordination. |
| Frame key | Selects a voxel-frame or geometry variant. |
| Hold key | Keeps a state unchanged until the next key. |

## 6.3 Interpolation Modes

- Step: instant change, useful for visibility, frame selection and pixel-art-like state changes.
- Linear: constant-rate mechanical movement.
- Ease in/out: doors, levers, ignition and shutdown.
- Smooth: soft floating, mana pulsing and ambient movement.
- Custom curve: approved advanced timing where needed.

Mechanical loops should avoid over-soft motion that makes gears or belts feel rubbery. Stylised magic may use smoother or non-linear curves.

## 6.4 Snapping

Timeline editing should support:

- Time snapping.
- Frame snapping for voxel-frame clips.
- Cycle fraction snapping, such as quarter turns.
- Marker snapping.
- Part alignment snapping.

## 6.5 Curve Limits

Extremely dense curves should trigger warnings. The Forge should simplify redundant keys during baking while preserving intended motion within a declared tolerance.

# 7. Loops, Cycles, Playback Speed and Phase

## 7.1 Playback Modes

- Loop.
- One-shot.
- Ping-pong.
- Hold final pose.
- Return to base pose.
- Play forward or reverse.
- Random start phase.
- Deterministic start phase.
- Parameter-controlled progress.

## 7.2 Cycle Speed Sources

Playback speed may be:

- Fixed by the visual clip.
- Multiplied by a gameplay parameter such as machine speed.
- Linked to normalised throughput.
- Linked to wind, water, mana or power strength.
- Reduced by damage where the gameplay system exposes that value.
- Set to zero when blocked or unpowered.

A bound speed value is visual only. It must not change recipe duration or throughput.

## 7.3 Phase Rules

Large groups of identical machines should not always begin in perfect visual synchronisation unless they are mechanically linked. The system may use deterministic phase offsets based on stable instance ID to reduce artificial uniformity.

Mechanically connected components should share phase or derive it from a common network presentation clock where the connection is visible and important.

## 7.4 Resume Behaviour

When an asset becomes visible again after LOD culling, the animation may:

- Resume from authoritative progress.
- Reconstruct a deterministic loop phase.
- Fade into its current state.
- Restart an ambient nonessential loop.

It should not visibly jump from active to idle merely because it was off-screen.

# 8. Voxel-Frame Animation

Voxel-frame animation supports the user's idea of animating by frames while protecting runtime performance.

## 8.1 Appropriate Uses

- Stylised furnace flame silhouette.
- Portal or magical field deformation.
- Crystal growth or fracture sequence.
- Rune assembling from floating pieces.
- Plant opening, closing or sprouting.
- Magical liquid or slime-like prop.
- Transforming artefact.
- Small debris burst prepared as geometry frames.

## 8.2 Frame Storage

The editable source may store:

- Full frames for very small assets.
- Delta frames containing only changed voxels.
- Shared base volume plus per-frame add/remove/replace layers.
- Linked sub-assets for repeated frame components.

The runtime bake should normally create pre-baked frame meshes or texture/material frames. It should not run a general voxel mesher every rendered frame.

## 8.3 Frame Rates

Voxel-frame animation should embrace stylised stepped motion rather than pursuing film-like rates by default.

| Profile | Suggested Rate | Intended Use |
| --- | ---: | --- |
| Slow ambient | 2-4 frames/second | Rune shimmer, magical plant, portal drift. |
| Standard effect | 6-10 frames/second | Flame, energy pulse, changing crystal. |
| Fast action | 10-16 frames/second | Brief burst, impact or transformation. |
| Exceptional | Above 16 frames/second | Requires clear visual benefit and performance approval. |

These are authoring guidelines, not permanent engine limits.

## 8.4 Frame Interpolation

Voxel frames normally use stepped playback. Crossfading between geometry frames can blur the pixel-voxel style and should only be used for approved transparent or magical effects.

## 8.5 Collision and Frame Animation

Collision should remain stable for normal visual frame animation. Frame-dependent collision is permitted only for tightly controlled interactive assets and requires explicit gameplay support. A decorative flame shape does not change furnace collision.

## 8.6 Frame Editing Tools Required by 21E

21C requires later UI support for:

- Duplicate frame.
- Onion-skin previous/next frame.
- Delta highlight.
- Per-frame duration.
- Reorder and reverse.
- Loop preview.
- Shared palette and material roles.
- Frame-range copy/paste.
- Bake-size estimate.

# 9. Material, Palette and Shader Animation

Material animation is the preferred method for surface activity that does not require geometry change.

## 9.1 Supported Material Channels

- Emissive intensity and colour role.
- UV or local-coordinate scroll.
- Palette index cycle.
- Dissolve or reveal threshold.
- Heat ratio.
- Wetness or frost weight.
- Rune pulse.
- Mana flow offset and direction.
- Warning flash.
- Corruption spread weight.
- Transparency or refraction parameter for approved magical effects.

## 9.2 Material Animation Examples

| Asset | Material Response |
| --- | --- |
| Furnace | Ember glow rises with heat; flame sheet scrolls; metal near opening warms. |
| Mana conduit | Emissive pattern scrolls from input to output at flow-linked speed. |
| Warning lamp | Emissive flashes using accessible timing and optional non-flashing alternative. |
| Heated forge | Metal shifts from dark to red/orange emissive roles based on heat ratio. |
| Rune table | Rune symbols pulse when charged and settle when idle. |
| Corrupted machine | Corruption mask slowly pulses independently from work-cycle motion. |

## 9.3 Pixel Readability

Scrolling, dissolve and distortion must preserve the 32 x 32 and pixel-voxel visual language. Filtering or smooth distortion that turns surfaces into blurry realism should be avoided.

## 9.4 Shared Material Parameters

Material tracks should target named parameters defined by Material DNA, such as:

```text
material_param.emission_strength
material_param.heat_ratio
material_param.flow_offset
material_param.warning_weight
material_param.corruption_weight
```

Renaming or removing a shared parameter must trigger dependency validation.

# 10. Visibility, Variant and Geometry-State Animation

Some presentation is best expressed by turning prepared parts or layers on and off.

## 10.1 Typical Visibility-Controlled Parts

- Flame plane.
- Warning lamp.
- Output indicator.
- Soot or scorch overlay.
- Damage crack insert.
- Steam vent.
- Mana core.
- Repair scaffold detail.
- Empty/full container fill layer.

## 10.2 Variant Selection

A state binding may select among compatible baked variants:

- Door open versus closed.
- Tool head attached versus missing.
- Machine panel intact versus broken.
- Crystal empty, charged or overloaded.
- Chute gate open or closed.

Variants should not duplicate the whole asset unless the silhouette genuinely differs. Prefer shared base geometry plus changed parts.

## 10.3 Pop Control

Visibility changes can be instantaneous when mechanically correct, but emissive, particle and light changes may use brief fades to avoid harsh popping. Pixel-style step changes remain appropriate for switches, indicator tiles and frame-based effects.

# 11. Particle Effects and Effect Sockets

## 11.1 Socket-Based Effects

Particles must attach to stable named sockets prepared in 21B:

```text
socket.effect.flame_main
socket.effect.smoke_chimney
socket.effect.sparks_drive
socket.effect.steam_release
socket.effect.dust_output
socket.effect.mana_flow
socket.effect.corruption_leak
```

The socket defines location and orientation. The effect profile defines visual behaviour.

## 11.2 Reusable Effect Profiles

Recommended reusable families include:

- Small/medium/large smoke.
- Ember and spark burst.
- Steam puff and continuous steam.
- Wood dust, stone dust and metal debris.
- Mana motes and conduit flow.
- Rune activation burst.
- Corruption drip, haze and pulse.
- Water splash and drip.
- Frost and snow shedding.

## 11.3 Effect Activation Modes

- Continuous while state is true.
- One-shot on state enter.
- One-shot on state exit.
- Burst on animation marker.
- Rate controlled by normalised parameter.
- Random intermittent ambient emission.
- Disabled or simplified by LOD or player settings.

## 11.4 Particle Ownership Boundary

A smoke effect may indicate that a furnace is burning. It may not apply smoke damage, consume fuel or create pollution unless the relevant gameplay system separately owns those consequences.

## 11.5 Network and Settlement Density

Large factories and villages can contain many effect emitters. The runtime must aggregate, cull or reduce particle rates by distance, screen size and importance. Critical warning effects have priority over ambient decoration.

# 12. Light, Emission and Illumination Responses

## 12.1 Light Categories

- Emissive-only surface.
- Local dynamic point/spot light.
- Baked or static environmental light contribution where supported.
- Pulsing magical light.
- Warning light.
- Brief impact or spark flash.

## 12.2 Default Principle

Use emissive materials first. Add dynamic lights only when they materially improve readability, atmosphere or gameplay. Hundreds of active machines should not each require an expensive dynamic shadow-casting light.

## 12.3 Furnace Example

- Cold: no flame light, low or no emission.
- Igniting: rapid internal emission rise and brief light fade-in.
- Active: stable warm emission, optional low-cost local light, restrained flicker.
- Cooling: emission and light decay over time when supported by heat state.
- Overheated: stronger warning colour role, smoke and sparks, not merely brighter flicker.

## 12.4 Photosensitivity and Flicker

Critical states should not rely on high-frequency flashing. The Forge should warn when light or emissive curves exceed approved flash rates or contrast thresholds. Player settings must allow reduced flashing and simplified flicker.

# 13. Audio Cues, Loops and Sound Sockets

## 13.1 Audio Roles

- Start/ignition one-shot.
- Continuous work loop.
- Mechanical impact marker.
- Shutdown one-shot.
- Blocked or fault warning.
- Damage spark or grind.
- Magical hum or pulse.
- Door, lever or valve interaction.

## 13.2 Sound Sockets

```text
socket.audio.machine_body
socket.audio.gearbox
socket.audio.output
socket.audio.chimney
socket.audio.warning
socket.audio.mana_core
```

A sound may use the asset origin when no special socket is needed.

## 13.3 Loop Behaviour

Audio loops should:

- Fade in and out with state transitions.
- Avoid restarting every simulation tick.
- Preserve phase where practical.
- Scale volume and filtering with distance and occlusion.
- Aggregate across dense identical machines where required.
- Expose separate volume categories for machinery, magic and ambient effects.

## 13.4 Marker Synchronisation

Crusher impacts, piston strikes and gear clanks may use clip markers for audio timing. The sound remains presentation-only and does not determine recipe progress.

## 13.5 Audio Accessibility

Important audio-only warnings require visual equivalents. Important visual-only states may benefit from optional audio cues. Captions or textual indicators should be available for meaningful warnings where appropriate.

# 14. Runtime Visual State Contract

Each gameplay definition that uses Forge state presentation should expose a declared state contract.

## 14.1 Contract Value Types

- Boolean: powered, active, blocked, damaged, burning.
- Enum: idle, starting, processing, stopping, faulted.
- Normalised float: progress, power ratio, heat ratio, damage ratio, fill ratio.
- Direction/vector: flow direction, facing, wind direction.
- Integer/count: item count band, connection count, upgrade tier.
- Event: item entered, impact, recipe completed, state failed, damage received.
- Tag set: wet, frozen, corrupted, blessed, culture variant.

## 14.2 Contract Example

```text
state_contract.machine.basic_furnace
    state.mode: enum [idle, igniting, active, cooling, blocked, faulted]
    state.is_powered: bool
    param.process_progress: float 0..1
    param.heat_ratio: float 0..1
    param.damage_ratio: float 0..1
    state.is_wet: bool
    state.is_corrupted: bool
    event.recipe_completed
    event.damage_received
```

## 14.3 Missing State Handling

If an override references a state value that no longer exists, the Forge must not silently guess. It should:

1. Mark the binding unresolved.
2. Fall back to safe base presentation.
3. Report the dependency error.
4. Offer remapping where a compatible renamed field exists.

# 15. State Bindings and Presentation Graphs

## 15.1 Binding Structure

A state binding declares:

- Source state or parameter.
- Condition or value range.
- Target clip, material track, part visibility, effect, light or audio cue.
- Entry and exit transition.
- Priority and layer.
- LOD policy.
- Accessibility alternative.
- Fallback behaviour.

## 15.2 Simple Binding Example

```text
when state.mode == active
    play clip.machine_work_loop
    set material_param.heat_ratio from param.heat_ratio
    enable effect.smoke_continuous
    enable audio.machine_loop
```

## 15.3 Parameter Bindings

A normalised gameplay parameter may drive presentation continuously:

- Gear speed from machine activity ratio.
- Emission from heat ratio.
- Conduit flow speed from mana throughput.
- Container fill surface from fill ratio.
- Damage sparks probability from damage ratio.

Parameter curves should be clamped and validated. Visual values should not become negative, unstable or excessively fast because gameplay values exceeded a normal range.

## 15.4 Graph Complexity

The first Forge should use readable state layers and conditions rather than an unrestricted visual scripting language. Common patterns should be templates. Advanced expression support can be added later if needed, with strict validation and no gameplay mutation.

## 15.5 Default Fallback

Every state graph requires a default presentation, usually idle or unpowered. Unknown states should resolve to a safe visible form instead of an invisible or broken asset.

# 16. Layered States, Priorities and Conflict Resolution

## 16.1 Recommended Layer Stack

```text
base identity and culture/biome variant
    -> orientation and connection variant
    -> primary operating mode
    -> power/mana intensity
    -> environment: wet, snow, frost, soot
    -> damage and repair state
    -> corruption, blessing or critical hazard
    -> temporary event flashes and impact effects
```

## 16.2 Compatible Combinations

Examples that should normally combine:

- Active + damaged.
- Powered + wet.
- Processing + corrupted.
- Blocked + overheated.
- Burning + damaged.
- Snow-covered + unpowered.

## 16.3 Channel Conflicts

Two layers may attempt to control the same channel. Conflict rules include:

- Highest priority wins.
- Additive values combine within clamps.
- Multiplicative modifier.
- Masked by region.
- Blend by weight.
- Explicitly incompatible; lower-priority state uses alternative cue.

Example: active heat glow and corruption pulse can affect different material masks. Overheated warning may temporarily override the normal active colour role on warning panels while retaining the base heat emission elsewhere.

## 16.4 Critical State Priority

Danger states such as overload, fire, imminent failure or blocked pressure should remain readable above ambient culture, rarity or weather effects. Critical presentation may never be hidden solely because a cosmetic variant used the same material region.

# 17. Transitions, Blending and Interruptions

## 17.1 Transition Types

- Instant switch.
- Crossfade.
- Play entry clip then loop.
- Play exit clip then return to idle.
- Reverse current clip.
- Complete safe segment before switching.
- Interrupt immediately for critical fault.

## 17.2 Machine State Pattern

```text
idle
  -> starting/igniting
  -> active loop
  -> stopping/cooling
  -> idle
```

Blocked, damaged or faulted states can interrupt according to priority.

## 17.3 Interruption Rules

- Critical danger can interrupt immediately.
- Door or valve clips may reverse smoothly.
- Crusher impact cycles may finish a non-gameplay visual half-cycle before stopping, provided it does not misrepresent continued processing.
- Audio loops should fade rather than cut where practical.
- Particle emission may stop immediately while existing particles finish naturally.

## 17.4 Rapid State Changes

Debouncing or minimum visible duration may be applied to noncritical indicator flicker when simulation values change rapidly. It must not delay a critical warning beyond acceptable readability.

# 18. Machine and Station Animation Rules

## 18.1 Readability Requirements

A working machine should communicate at least:

- Whether it has power.
- Whether it is idle or processing.
- Direction of relevant input/output or motion.
- Whether it is blocked or full.
- Whether it is damaged or unsafe.

Not every machine requires all cues if the state is not relevant.

## 18.2 Mechanical Plausibility

Animation should broadly respect the model:

- Shafts rotate around shafts.
- Gears mesh in plausible directions.
- Pistons move along guides.
- Chutes do not imply uphill gravity flow unless powered.
- Output effects originate at output sockets.
- Doors do not pass through housing where avoidable.

## 18.3 Idle Motion

Idle motion should be limited. A machine may have a small ambient bob, glow or pressure gauge, but a large gear should not spin while the machine is unpowered unless it represents wind, water or stored momentum.

## 18.4 Upgrade Presentation

Machine upgrades may alter:

- Animation speed multiplier.
- Additional parts or glow.
- Cleaner effects.
- Larger storage fill indicator.
- Safety light.
- Material/palette variant.

Gameplay upgrade values remain outside the Forge.

# 19. Furnace Presentation Pattern

The furnace is the primary 21C reference asset.

## 19.1 Required States

| State | Visual Presentation |
| --- | --- |
| Unpowered/empty | Dark opening, no flame, no smoke, quiet. |
| Fuel present but idle | Optional faint ember or fuel-visible layer; no active work loop. |
| Igniting | Short flame reveal, emission rise, ignition audio, initial smoke puff. |
| Active | Flame material/frame loop, stable heat emission, smoke, low furnace audio, optional gentle light. |
| Recipe nearing completion | Optional subtle intensity increase only when useful and not misleading. |
| Output blocked | Active motion/effects reduce or pause according to gameplay state; warning indicator appears. |
| Cooling | Flame stops, emission decays, smoke reduces, cooling sound optional. |
| Damaged | Crack/soot layer, occasional sparks or unstable audio based on damage ratio. |
| Overheated/faulted | Clear warning material, heavier smoke/sparks, restricted flicker, fault audio. |
| Corrupted | Corruption overlay and altered flame/mana colour role layered over valid operating state. |

## 19.2 Furnace Clip Set

```text
clip.furnace.ignite
clip.furnace.active_loop
clip.furnace.cool_down
clip.furnace.output_blocked
clip.furnace.fault_enter
clip.furnace.damage_react
```

Not every visual must be a separate clip. Material states and effects may remain continuous bindings.

## 19.3 Flame Implementation

Preferred order:

1. Animated material or small stylised frame set on prepared flame geometry.
2. Emissive intensity linked to heat.
3. Optional local light within budget.
4. Smoke and ember particles from sockets.
5. Audio loop and ignition/shutdown one-shots.

A complete furnace model should not be rebuilt for each flame frame.

# 20. Chutes, Conveyors and Logistics Presentation

## 20.1 Chutes

A passive gravity chute may communicate flow through visible moving items rather than animating the chute itself. Optional small gates, shutters or direction indicators can animate when routing changes.

## 20.2 Conveyors and Rollers

- Rollers rotate in transport direction.
- Belt or surface material scrolls consistently with item motion.
- Speed may reflect actual throughput or configured speed.
- Blocked lines slow or stop and show a readable indicator.
- Empty active belts may continue moving if powered.

## 20.3 Item Flow

Visible item movement is owned by logistics presentation and should not create item entities as independent authoritative inventory objects. Nearby flow may show representative items; distant flow may be abstracted.

## 20.4 Filters and Routers

Filters may use:

- Lever or gate movement.
- Rune or indicator change.
- Brief sorting pulse.
- Direction arrows or colour roles.

The visual must not imply an output route that the actual routing system is not using.

# 21. Magic Infrastructure Presentation

## 21.1 Mana Conduits

A conduit should show:

- Connected shape.
- Powered/unpowered state.
- Flow direction where meaningful.
- Flow strength band.
- Blocked or unstable state.
- Corruption or impurity state where applicable.

## 21.2 Rune Devices

Rune animation may use:

- Emissive pulse.
- Sequential glyph reveal.
- Palette cycling.
- Rotating named parts.
- Floating voxel-frame elements.
- Activation particle burst.

## 21.3 Ward Lanterns and Ward Stones

Ward presentation should communicate active coverage without filling the screen with constant effects. Nearby assets may pulse or emit motes. Area coverage is better shown through an optional overlay, UI inspection or activation wave rather than a permanent dense particle dome.

## 21.4 Portals and Rituals

Full portal and ritual authoring is beyond the MVP, but the framework should support:

- Frame/surface animation.
- Material distortion.
- Layered runes.
- Entry and shutdown clips.
- Stable effect sockets.
- Phase linked to authoritative activation progress.

# 22. Damage, Heat, Weather, Burning and Corruption States

## 22.1 Damage Presentation

Damage may affect:

- Crack or missing-part overlays.
- Bent or offset part pose.
- Reduced or irregular motion.
- Sparks, smoke or leak particles.
- Grinding or unstable audio.
- Warning emission.

Damage presentation should use damage bands rather than a unique asset for every hit point.

## 22.2 Heat and Overheat

Heat ratio can drive:

- Emissive colour/intensity.
- Heat haze where approved.
- Steam or smoke rate.
- Cooling duration.
- Warning light.

Overheat is a gameplay state. The Forge expresses it but does not cause failure.

## 22.3 Wetness, Snow and Frost

Environmental layers may:

- Reduce emission reflection or add wet sheen through Material DNA.
- Add snow/frost overlays.
- Trigger drip or steam effects when hot.
- Alter audio surface response through approved references.

A wet state should not automatically short a machine unless gameplay defines that consequence.

## 22.4 Burning

Burning presentation may combine flame sockets, smoke, char progression and light. Fire gameplay, spread and damage remain outside the Forge.

## 22.5 Corruption

Corruption should layer over the asset's operating state where practical:

- Pulsing corrupted mask.
- Altered emission role.
- Leak particles.
- Distorted audio.
- Optional irregular motion.

Critical operational warnings must remain distinguishable from corruption styling.

# 23. Items, Tools, Doors, Props and Small Interactive Assets

## 23.1 Doors and Gates

Doors use transform clips around hinge pivots. They require:

- Open and close clips or reversible clip.
- Collision/gameplay synchronisation owned by the door system.
- State-safe interruption.
- Optional latch audio marker.
- Multi-block clearance preview.

## 23.2 Tools and Weapons

21C may define simple non-character presentation:

- Idle rotation for dropped display.
- Crafting station preview motion.
- Charge glow.
- Durability/damage visual layer.
- Folding or extending mechanical tool part.

Player combat swings and skeletal hand animation belong to the combat/character animation system, though Forge pivots and grip sockets support them.

## 23.3 Props

Ambient props may use low-cost loops:

- Lantern flicker.
- Hanging sign sway.
- Wind-driven vane.
- Clockwork ornament.
- Floating magical book.

Ambient motion should be culled aggressively and disabled by reduced-motion settings where appropriate.

## 23.4 Containers

Containers may animate lids, fill indicators or magical locks. Inventory truth remains in storage gameplay.

# 24. Gameplay Events, Triggers and One-Shot Presentation

## 24.1 Event Examples

- Item enters machine.
- Recipe begins.
- Recipe completes.
- Machine takes damage.
- Output becomes blocked.
- Power connects or disconnects.
- Rune activates.
- Repair completes.
- Block is placed or broken.

## 24.2 Event Presentation

An event may trigger:

- One-shot clip.
- Particle burst.
- Audio cue.
- Brief material flash.
- Camera-independent marker.
- Temporary layer.

## 24.3 Repetition Control

Rapid repeated events require cooldown, pooling or aggregation to prevent audio spam and particle overload. A conveyor receiving twenty items per second should not necessarily play twenty full-volume clanks.

## 24.4 Missed Events

When an object is off-screen or unloaded, nonessential one-shot events may be skipped. On promotion back to detailed simulation, persistent state presentation should reconstruct correctly without replaying every historical effect.

# 25. Determinism, Saving, Multiplayer and Reconnection

## 25.1 Authoritative State

All players must resolve the same gameplay state. Exact cosmetic particle positions do not need network replication unless they carry special meaning.

## 25.2 What May Need Synchronisation

- Primary state and state-change time.
- Processing progress when visible.
- Loop phase for connected or timing-critical machinery.
- Portal or ritual activation phase.
- Door open fraction where interaction depends on it.
- Critical warning state.

## 25.3 What May Be Local/Deterministic

- Ambient spark timing.
- Smoke particle randomness.
- Minor flicker within accessibility limits.
- Idle phase offsets.
- Noncritical debris variation.

Use stable seeds when local variation must remain visually consistent between loads.

## 25.4 Save Data

Visual clip state should not be saved independently when it can be reconstructed from authoritative state and timestamps. Save only presentation-specific persistent values that cannot be derived, such as a deliberately chosen visual variant or paused display pose.

## 25.5 Reconnection

A reconnecting player should see the machine's current state, not replay its original ignition from the beginning unless the ignition is still genuinely in progress.

# 26. Animation LOD, Visibility and Performance Budgets

## 26.1 LOD Tiers

| Tier | Presentation |
| --- | --- |
| Near/important | Full transform animation, material motion, particles, lights and audio within settings. |
| Medium | Reduced update rate, simplified particles, limited lights, essential part motion. |
| Far | Static or low-rate material indicator; aggregate audio/effects; no tiny moving parts. |
| Abstract/unloaded | No rendered animation; state remains in simulation summaries. |

## 26.2 Update Throttling

Distant noncritical animations may update at lower frequencies. Rotation should remain visually smooth enough for the distance or switch to a simplified material cue rather than stuttering obviously.

## 26.3 Visibility Rules

- Off-screen assets may pause presentation.
- Hidden parts do not update unless needed by state reconstruction.
- Occluded audio and particles may reduce.
- Critical local warnings remain prioritised.
- Blueprint/editor previews may ignore normal LOD for inspection.

## 26.4 First-Pass Budgets

These are planning targets to be profiled in 21F.

| Asset Type | Preferred Animated Parts | Preferred Continuous Emitters | Preferred Dynamic Lights |
| --- | ---: | ---: | ---: |
| Small prop | 0-2 | 0-1 | 0-1, usually emissive only |
| Furnace/station | 1-5 | 0-3 | 0-1 |
| Medium machine | 2-10 | 0-4 | 0-1 |
| Logistics segment | 0-3 | 0-1 | 0 |
| Magic device | 1-6 | 0-4 | 0-1 |

A large network budget matters more than the budget of one isolated machine.

## 26.5 Dense Network Aggregation

The renderer may:

- Share animation clocks.
- Instance identical moving parts.
- Aggregate smoke.
- Reduce audio voices.
- Replace many small lights with emissive-only presentation.
- Display representative item flow.
- Freeze hidden internal parts.

# 27. Baking, Caching and Runtime Playback Products

## 27.1 Editable Source

The Forge source stores high-level clips, tracks, frames, state bindings, effect references and markers.

## 27.2 Baked Products

- Optimised animation clip resource.
- Pre-baked voxel-frame meshes or texture frames.
- Material parameter curves.
- Resolved part paths and stable IDs.
- Particle/light/audio profile references.
- State binding lookup data.
- LOD-specific presentation rules.
- Dependency and validation report.

## 27.3 No Runtime Remeshing Rule

> **Locked Runtime Rule**  
> Voxel-frame animation must use pre-baked meshes, texture/material frames or another cached representation. Normal runtime playback must not repeatedly invoke the general voxel mesh baker.

## 27.4 Cache Invalidation

Changing any of the following invalidates affected baked products:

- Part geometry or pivot.
- Part name used by a track.
- Frame voxel data.
- Material parameter schema.
- Effect or audio socket name.
- State contract or binding.
- LOD policy.

Unrelated clips should not be rebuilt when only one isolated track changes if the technical pipeline can safely avoid it.

# 28. Developer Overrides and Existing Asset Editing

## 28.1 Overrideable Presentation Fields

- Entire animation set.
- Individual clip.
- Individual track.
- Playback speed and interpolation.
- Voxel-frame set.
- Material animation.
- Visibility rules.
- Particle profile and socket mapping.
- Light profile.
- Audio cue and socket mapping.
- State binding and transition.
- Accessibility alternative.
- LOD policy within project limits.

## 28.2 Partial Override Example

A developer may keep the built-in furnace model, flame material, particles and sounds but replace only `clip.furnace.ignite`. Another override may replace the whole presentation set while inheriting the stable furnace state contract.

## 28.3 Safe Editing Commands

- Edit as Project Override.
- Duplicate as New Visual Asset.
- Open Original Read-Only.
- Compare Clip With Base.
- Revert Selected Track.
- Revert Clip.
- Revert Entire Animation Override.
- Remap Missing Part or Socket.
- Validate Against Current State Contract.

## 28.4 Contract Protection

An override may remove a visual response, but the Forge should warn when it removes the only presentation of a critical state such as overload, fire or output blockage. Release approval may block an asset that no longer communicates required gameplay information.

# 29. Preview, Scrubbing, Debugging and Test Environments

## 29.1 Timeline Preview

The Forge must allow:

- Play, pause, stop and loop.
- Scrub to exact time.
- Change playback speed.
- Solo/mute tracks.
- Inspect transforms and parameter values.
- Display markers and state transitions.
- Preview forward and reverse.
- Compare base and override side by side.

## 29.2 State Simulator

The preview should expose mock read-only values:

- Power on/off.
- Activity ratio.
- Process progress.
- Heat ratio.
- Blocked state.
- Damage ratio.
- Wet, frozen and corrupted tags.
- Flow direction and strength.

Mock values never alter the real gameplay definition.

## 29.3 Test Environments

- Neutral studio lighting.
- Daylight village.
- Night/cave.
- Factory test stand.
- Mana-lit room.
- Weather test.
- Dense machine-line performance preview.
- Blueprint/building context.

## 29.4 Debug Overlays

- Part names and pivots.
- Socket names and directions.
- Current state layers.
- Active clip and time.
- Material parameter values.
- Particle counts.
- Audio voice state.
- LOD tier.
- Binding source values.
- Conflict and fallback indicators.

# 30. Validation, Warnings and Failure Handling

## 30.1 Validation Categories

| Category | Checks |
| --- | --- |
| Parts | Referenced parts exist; pivots are valid; parent hierarchy has no cycles. |
| Tracks | Keyframes are valid; curves are bounded; no unsupported target channel. |
| Frames | Frame dimensions, palette roles and bake outputs are valid. |
| Materials | Animated parameters exist in Material DNA and use valid ranges. |
| Sockets | Effect/audio sockets exist and face appropriate directions. |
| States | State fields exist; enums/ranges match; default fallback is present. |
| Layers | Priorities and channel conflicts resolve; critical states remain visible. |
| Effects | Particle/light/audio references exist and fit budgets. |
| Performance | Animated parts, emitters, lights, frame meshes and update cost fit targets. |
| Accessibility | Required reduced-motion, reduced-flash or alternative cues exist. |
| Overrides | Inherited and overridden data resolve without orphaned references. |

## 30.2 Common Warnings

- Rotating part has default corner pivot.
- Animation references renamed part.
- Voxel-frame clip duplicates identical full frames instead of deltas.
- Material track targets unknown parameter.
- State graph has no default fallback.
- Critical fault state has no readable cue.
- Particle emitter has no LOD policy.
- Audio loop can restart every tick.
- Flashing exceeds approved accessibility limits.
- Distant LOD removes the only indication that a machine is active.
- Override depends on a base socket removed by an updated model.

## 30.3 Failure Behaviour

A failed visual binding should fall back safely:

- Keep base mesh visible.
- Use idle/default material.
- Disable missing optional effect.
- Log and surface the dependency issue.
- Never crash the simulation or erase gameplay state.

# 31. Accessibility and Player Presentation Settings

## 31.1 Required Controls

- Reduced motion.
- Reduced flashing/flicker.
- Particle density.
- Machine animation detail.
- Dynamic light/flicker detail.
- Machinery and magic audio volume categories.
- High-contrast or alternative warning indicators where supported.

## 31.2 Critical State Redundancy

Critical information should use at least two compatible channels where practical:

- Motion stop plus warning colour/icon.
- Warning light plus audio cue.
- Smoke/sparks plus inspection text.
- Flow animation plus directional overlay.

## 31.3 Reduced Motion Behaviour

Reduced motion may:

- Slow or freeze ambient bobs and sways.
- Replace rapid gear motion with slower readable rotation or static indicator.
- Reduce camera-independent particle movement.
- Retain essential state transitions through colour, visibility or UI cues.

It must not make machines appear idle when they are active.

# 32. Minimum Viable 21C Scope

## 32.1 Required MVP Features

1. Named-part transform clip editor.
2. Timeline with keyframes, interpolation, loop and one-shot playback.
3. Basic voxel-frame clip with onion-skin and pre-baked frame output.
4. Material parameter animation for emission and flow.
5. Visibility tracks.
6. Particle, light and audio socket tracks.
7. Read-only state contract and binding editor.
8. Layer priority and simple conflict resolution.
9. State simulator and in-context preview.
10. Project override workflow for clips and bindings.
11. Basic LOD and accessibility settings.
12. Validation report.

## 32.2 Required MVP Test Assets

| Asset | What It Proves |
| --- | --- |
| Rotating gear | Pivot, continuous transform loop, speed parameter and LOD. |
| Basic crusher | Multiple parts, reciprocating motion, impact marker, audio and blocked stop. |
| Basic furnace | Ignition, active loop, material heat, flame, smoke, light, audio, cooling and fault state. |
| Conveyor or powered chute | Directional movement, flow speed, item-flow relationship and blocked indicator. |
| Mana conduit | Material flow direction, emission, powered/unpowered state and corruption layer. |
| Damaged machine | Active + damaged layering, sparks, unstable audio and priority handling. |
| Frame-animated magical flame or portal fragment | Voxel-frame workflow, per-frame duration, pre-baked runtime frames and reduced-motion fallback. |

## 32.3 Explicit MVP Deferrals

- Full skeletal animation and IK.
- Character locomotion and combat animation.
- Facial animation and lip synchronisation.
- Full cinematic sequencing.
- Complex physics-driven ropes, cloth or soft bodies.
- Advanced procedural mechanical rig solving.
- Full portal, ritual and creature animation toolsets.
- Public player animation scripting.
- Unrestricted custom shader authoring.

# 33. Success Criteria and Acceptance Rules

The 21C system is successful when all of the following are true:

- A gear can rotate smoothly around a Forge-authored pivot without model-frame duplication.
- A crusher can animate multiple named parts and stop or warn when its coded state becomes blocked.
- A furnace can transition through idle, ignition, active, cooling, blocked, damaged and fault presentation without owning fuel or recipe logic.
- A small voxel-frame effect can be authored and played from pre-baked frames without runtime remeshing.
- Material animation can show heat and mana flow while preserving pixel-voxel readability.
- Particle, light and audio effects originate from correct sockets and obey state and LOD rules.
- State bindings read declared gameplay values and cannot mutate them.
- Active, damaged, wet and corrupted layers can combine according to explicit priority and mask rules.
- Overrides can replace one clip or the full presentation set while retaining the gameplay ID and state contract.
- Multiplayer/reconnection reconstructs the correct visible state without replaying obsolete events.
- Distant factories reduce presentation cost without falsely appearing inactive.
- Reduced-motion and reduced-flash settings retain essential state readability.
- All MVP test assets pass dependency, performance, state and accessibility validation.

> **Acceptance Rule**  
> 21C is not complete because a timeline can move a gear. It is complete when motion, effects, sound and state presentation consistently tell the truth about Leyforge's coded world while remaining editable, overrideable, performant and accessible.

# 34. Relationships With Documents 21D-21G

| Document | Dependency on 21C |
| --- | --- |
| 21D - Asset Overrides, Variants and Registry Integration | Expands inheritance, precedence, migration, compatibility and content-pack rules for clips, effects and state bindings. |
| 21E - Forge UI/UX and Creator Workflow | Defines the timeline, state graph, frame editor, preview controls, track inspection, compare and validation screens. |
| 21F - Forge Technical Implementation Plan | Defines Godot resources, AnimationPlayer/AnimationTree strategy, shader parameters, effect pooling, audio aggregation, baking, caching, hot reload and performance implementation. |
| 21G - Visual Overhaul and Asset Migration Plan | Uses the 21C patterns to schedule and approve animation/effect work for furnaces, machines, logistics, magic blocks and village props. |

# Appendix A. Animation Clip Field Template

```text
animation_clip_id:
display_name:
asset_visual_id:
parent_clip_id:
clip_category:
duration_seconds:
playback_mode:
default_speed:
speed_parameter_binding:
start_phase_rule:
loop_seam_rule:
transition_in:
transition_out:
part_tracks:
material_tracks:
visibility_tracks:
voxel_frame_track:
particle_tracks:
light_tracks:
audio_tracks:
markers:
interrupt_rules:
layer_name:
priority:
lod_policy:
reduced_motion_policy:
reduced_flash_policy:
dependencies:
planning_status:
notes:
```

# Appendix B. Visual State Binding Field Template

```text
state_binding_id:
asset_visual_id:
state_contract_id:
source_field_or_event:
source_type:
condition_or_range:
parameter_curve:
target_layer:
target_clip_id:
target_part_visibility:
target_material_parameters:
target_particle_profiles:
target_light_profiles:
target_audio_cues:
entry_transition:
exit_transition:
priority:
conflict_rule:
mask_or_region:
fallback_presentation:
lod_policy:
accessibility_alternative:
network_sync_requirement:
validation_notes:
planning_status:
```

# Appendix C. Standard Presentation Patterns

| Pattern ID | Entry | Loop | Exit | Typical Assets |
| --- | --- | --- | --- | --- |
| `pattern.powered_machine` | Power-up/engage | Work loop | Slow/stop | Crusher, mill, pump, press. |
| `pattern.furnace_heat` | Ignite | Flame/heat/smoke loop | Cool down | Furnace, forge, kiln. |
| `pattern.rotating_drive` | Optional acceleration | Continuous rotation | Deceleration | Gear, shaft, wheel, fan. |
| `pattern.reciprocating_tool` | Move to cycle | Repeated strike/pump | Return to rest | Crusher head, piston, bellows. |
| `pattern.flow_conduit` | Charge pulse | Directional material flow | Fade/discharge | Mana conduit, pipe indicator. |
| `pattern.warning_fault` | Warning enter | Pulse/loop | Clear | Blocked output, overload, damage. |
| `pattern.door_hinge` | Open | Hold open | Close | Door, gate, machine panel. |
| `pattern.frame_effect` | Form | Stepped frame loop | Dissipate | Flame, portal fragment, magical plant. |

# Appendix D. POC Animation Test Matrix

| Test | Gear | Crusher | Furnace | Conveyor/Chute | Mana Conduit | Damaged Machine | Frame Effect |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Named-part transform | Required | Required | Optional door/vent | Rollers/gate | Optional part | Required where bent | Optional |
| Correct pivot | Required | Required | Required for door | Required | Required if part moves | Required | No |
| Loop playback | Required | Required | Active loop | Required | Required | Combined | Required |
| One-shot entry/exit | Optional | Start/stop | Required | Optional | Charge/discharge | Damage react | Form/dissipate |
| Material animation | Optional | Warning | Heat/flame | Belt/indicator | Required | Warning/corruption | Optional |
| Voxel-frame animation | No | No | Optional flame | No | Optional magic | No | Required |
| Particles | No | Dust/sparks | Smoke/embers | Optional | Mana motes | Sparks/smoke | Optional |
| Light/emission | No | Warning only | Required | Indicator only | Required | Warning | Optional |
| Audio | Optional | Required | Required | Aggregated | Optional hum | Fault audio | Optional |
| State binding | Power/speed | Active/blocked | Full set | Flow/blocked | Power/flow/corruption | Active+damage | Trigger/state |
| Layer conflict test | Low | Required | Required | Required | Required | Required | Low |
| LOD test | Required | Required | Required | Required | Required | Required | Required |
| Accessibility test | Required | Required | Required | Required | Required | Required | Required |
| Override test | Required | Required | Required | Required | Required | Required | Required |

# Appendix E. Deferred Questions and Production Decisions

The following questions should be resolved during 21E and 21F planning or after the first animation prototype is profiled:

1. The exact Godot runtime split between AnimationPlayer, AnimationTree, custom lightweight players and shader-driven loops.
2. Whether dense identical machines share animation clocks or use instanced shader phase offsets.
3. The final baked representation for voxel-frame clips: mesh arrays, mesh swapping, texture layers or a hybrid.
4. The maximum approved voxel-frame count and memory budget by asset class.
5. The exact state-contract schema and how gameplay systems publish changes to Forge presentation.
6. The effect pooling and particle-budget strategy for large settlements and factories.
7. The audio voice aggregation strategy for long conveyor lines and machine halls.
8. The final dynamic-light budget and shadow policy for active machines and magical infrastructure.
9. How state graph expressions remain powerful enough without becoming unrestricted gameplay scripting.
10. Whether connected mechanical networks share visible phase and how that phase is reconstructed after loading.
11. The default reduced-motion and reduced-flash substitutions for each standard presentation pattern.
12. How animation overrides migrate when a base part, socket, material parameter or state field is renamed.
13. Whether animation clips can be exported as reusable Forge library components across asset families.
14. Which presentation markers, if any, gameplay systems are allowed to observe safely.
15. The first target update-rate and draw-call budgets for low-, medium- and high-quality settings.

---

**End of Document 21C - Voxel Asset Forge - Animation, Effects and Runtime Visual States - Version 0.1**
