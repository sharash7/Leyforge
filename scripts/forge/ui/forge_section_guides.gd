class_name ForgeSectionGuides
extends RefCounted
## Single source of truth for the in-Forge step-by-step help. Add or update a
## page here whenever its workflow changes.

const BASIC := "basic"
const IN_DEPTH := "in_depth"

const GUIDES := {
	"Forge Home": [
		"Start here when you are unsure what to open. Forge changes how an asset looks; it does not change recipes, inventory rules, machine logic or saved-world identity.",
		"Open Asset Browser to edit an existing presentation, or New Asset Wizard to create the first Forge source for a gameplay ID.",
		"Look at the four totals: indexed presentations are all known assets, approved sources are live Forge replacements, drafts are work in progress, and legacy fallbacks still use older visuals.",
		"After opening an asset, use Block Surface for a cube made from six textures, Voxel Model for a sculpted 3D shape, or Compound & Sockets for machines with separate moving parts.",
		"Watch Live Preview while editing. Drag to orbit, Shift-drag or right/middle-drag to pan, scroll to zoom, and press Reset if the model leaves the frame.",
		"Press Save Draft regularly or Ctrl+S. Draft saves are recoverable and do not replace the approved in-game presentation.",
		"Press Validate or Ctrl+Enter before baking. Fix red errors first; read warnings to decide whether the result is intentional.",
		"Use Bake Preview for a temporary test. Use Approve & Bake only when the source is saved, validation has no blockers, and the model looks correct in preview and world tests.",
	],
	"Library & Create": [
		"Use this studio to find an existing stable gameplay identity before creating any visual source.",
		"Search Asset Browser when you know the name or ID; use New Asset Wizard when you need help selecting the authoring mode.",
		"Read Author and Inspect badges as capability labels. An Inspect route never claims it can rewrite its catalogue.",
		"Use Migration Register to understand legacy coverage without starting a bulk replacement or deleting fallbacks.",
		"Open the chosen record and confirm its stable ID in the context ribbon before moving to a specialist studio.",
	],
	"Items & Blocks": [
		"Open or create an asset first; asset-required workflows explain why they are disabled when nothing is open.",
		"Choose Surface for full cubes, Voxel Model for sculpted forms, and Compound for multiple named moving parts.",
		"Keep reusable palette roles and Material DNA canonical here. Other studios may reference them but do not duplicate them.",
		"Finish collision, icon, animation and variants before using World Test Preview.",
		"Switching studios preserves the open source, unsaved state, undo history and preview camera.",
	],
	"Structures & Buildings": [
		"Begin with Blueprint Catalogue to inspect definitions, modules, states and runtime products in the shared foundation index.",
		"Use Blueprint Handoff to follow canonical settlement blueprint IDs and their stable material or block references.",
		"Treat Inspect routes as read-only evidence views; they do not create a second blueprint registry.",
		"Use Blueprint Composition Editor to create blueprints, rooms, connection points, structure sets, procedural rules and lifecycle states.",
		"Author referenced block presentations in Items & Blocks, then verify the assembled result through Test & Delivery.",
	],
	"Characters & Creatures": [
		"Use Entity Catalogue to inspect stable entity definitions, assembly profiles and gameplay proxy records.",
		"Use Body Plans & Rigs for anatomy, semantic rigs, retarget maps and animation-library coverage.",
		"Use Equipment & Variants for fitting and appearance records without treating the catalogue as a visual fitting editor.",
		"Animation remains owned by its entity or asset domain; shared event contracts belong in Test & Delivery.",
		"Use Entity Model Editor to create voxel anatomy, semantic rigs, animation libraries, variants and equipment-fit sources.",
	],
	"VFX": [
		"The hub reports real VFX definitions, forms and graph records from the shared source index.",
		"Open Effects, Graphs & Forms to inspect bounds, families, voxel forms, LOD and budget contracts.",
		"Use Live VFX Graph Editor to sculpt forms, author bounded node graphs and assemble validated effects.",
		"Use deterministic capture and dense-scene tests in Test & Delivery before requesting visual approval.",
		"Reduced-motion users receive static hub decoration and bounded preview equivalents.",
	],
	"Audio": [
		"The hub reports real Sound Events, sources and ambience plans and never autoplays audio.",
		"Open Sound Events & Sources to inspect provenance, seeded variation, concurrency, captions and spatial profiles.",
		"Use Waveform & Event Editor for file-free synthesis, optional imports, waveform transforms, layered events and spatial profiles.",
		"Run listening, accessibility, rights and multi-listener checks in Test & Delivery before publication.",
		"Keep stable ownership and stop paths visible for persistent or looping sounds.",
	],
	"Test & Delivery": [
		"Use this studio after specialist work to inspect shared presentation contracts, profiles and spatial roles.",
		"Run Accessibility Preview, deterministic Capture & Replay and the Test Laboratory before publication.",
		"Open Validation Centre for the current asset; blockers prevent approval while warnings require deliberate review.",
		"Stage and publish through Hot Reload only after complete dependency and compatibility validation.",
		"Approve & Bake stays in the fixed toolbar and keeps the source-hash rule: edited approved sources appear as draft until a matching approved product exists.",
	],
	"Asset Browser": [
		"Click the search box and type part of the visible name, stable gameplay ID, category or status. Clearing the box shows the complete catalogue again.",
		"A stable gameplay ID is the permanent identity used by recipes, saves and placement. Forge keeps that ID and supplies only a new visual presentation.",
		"Read the status at the end of each row: legacy_wrapper means no Forge source exists, draft means editable work exists, and approved means a baked Forge presentation is active.",
		"Click a row once to open it. If a Forge source already exists, Forge opens the relevant editor immediately.",
		"For a legacy presentation, review the displayed gameplay and presentation IDs, then click Create Project Source to make one linked draft without duplicating the gameplay item.",
		"If you need to choose Surface or Voxel before creation, use New Asset Wizard instead of the quick Create Project Source button.",
		"After opening, confirm the asset name in the left summary and the model in Live Preview before you begin painting.",
	],
	"New Asset Wizard": [
		"Open the Canonical gameplay presentation list and choose the existing block or item that should receive new visuals. This prevents duplicate gameplay IDs.",
		"Choose Recommended from the registry when you want Forge to select Surface, Voxel or Compound from the known shape and create starter geometry.",
		"Choose Block Surface when the finished asset is a full cube whose shape stays cubic and only its six painted faces need to change.",
		"Choose Voxel Model when you need a non-cube silhouette, holes, handles, blades, gears, cranks, furniture or any other sculpted 3D form. This option begins with a blank 32 x 32 x 32 volume.",
		"Click Create or Open Project Source. If the source already exists, Forge opens it and switches to the selected Surface or Voxel mode without deleting the inactive source.",
		"In the chosen editor, add at least one visible colour or voxel. A completely empty Voxel Model cannot validate or bake.",
		"Open Palette & Materials to name colours by purpose, choose exact colours, and bind each role to Material DNA.",
		"Open Collision & Placement and confirm how many world blocks the object occupies. Doors normally use Tall 1 x 2; ordinary blocks use Single 1 x 1.",
		"Save Draft, Validate, and then Bake Preview. Do not Approve & Bake until the preview, collision and placement footprint are all correct.",
	],
	"Block Surface Editor": [
		"Use Block Surface only for a cube. If you need to sculpt the silhouette, choose Voxel Model in Authoring mode and click Switch authoring mode; your surface work is kept for later.",
		"Choose Top, Bottom, North, South, East or West from Face. The canvas always edits only the selected face.",
		"Choose a Palette role. The colour square beside each name shows exactly what the selected role paints. Edit or add roles under Palette & Materials.",
		"Choose Pencil for single cells, Square/Circle/Diamond for larger stamps, or Fill bucket to replace one connected area. Shape radius controls how large the shape tools are.",
		"Hold the left mouse button and drag to keep painting. Hold the right mouse button and drag to restore the base role. Each continuous batch can be undone with Ctrl+Z.",
		"Enable Colour randomizer and tick the palette roles to mix while painting. Select at least two roles for visible variation such as stone speckle, wood grain or worn edges.",
		"To reuse a finished material layout, enter a Pattern name and click Save current face pattern. The pattern stores its colour roles and Material DNA, not only raw palette numbers.",
		"Select a saved pattern and click Apply pattern to current face. The pattern tiles across the face, so it can be reused on blocks of the same or different texture resolution.",
		"To duplicate a face, click Copy current face, tick every destination side, choose Copy, Mirror or Rotate, then click Paste to selected faces.",
		"Use Mirror current or Rotate current when only the selected face is upside down or facing the wrong direction. These actions do not replace the copied clipboard face.",
		"Enable 2 x 2 tile preview to inspect repeating seams. The tiled view is read-only; turn it off before painting again.",
		"Inspect all six sides in Live Preview, Save Draft, and Validate before baking. Pay special attention to top/bottom orientation and edge continuity.",
	],
	"Voxel Model Editor": [
		"Use Voxel Model for a true 3D shape. If the asset currently uses Block Surface, choose Voxel Model in Authoring mode and click Switch authoring mode; the previous surface source remains available.",
		"Think of the model as a stack of flat layers. Choose X to look from the side, Y to edit horizontal height layers, or Z to work from the front/back.",
		"Move the slice slider to the layer you want. The label shows the active axis and exact layer number; only that layer is painted.",
		"Choose a Palette role. Its colour swatch previews the paint colour. Add or change roles and Material DNA under Palette & Materials.",
		"Choose Pencil, Square, Circle, Diamond or Fill bucket, then choose Shape radius. Start with Pencil and radius 1 while learning.",
		"Hold left-click and drag to add or recolour microvoxels. Hold right-click and drag to remove them. Empty dark cells contain no geometry.",
		"Enable Mirror X for symmetrical objects. The gold centre line shows the mirror plane and every stroke is applied to both sides in one undoable command.",
		"Enable Colour randomizer and tick two or more palette roles to paint controlled colour variation across the model.",
		"Click Copy current layer, move the slider or change axis to a layer with matching dimensions, then click Paste onto current layer. Paste replaces occupied and empty cells and can be undone once.",
		"To reuse only a material layout, save the current layer as a named colour pattern. Applying that pattern recolours occupied voxels but keeps the destination object's shape and holes.",
		"Orbit Live Preview frequently and inspect the model from X, Y and Z. A good-looking front layer can still hide missing depth or accidental internal voxels.",
		"Save Draft and Validate. Resolve the empty-volume error, then use Bake Preview before approving the asset.",
	],
	"Palette Roles & Material DNA": [
		"A palette role is a named paint slot such as oak_base, oak_shadow, iron_edge or glow. Models store the role number so you can change the colour later without repainting every cell.",
		"Use the colour square and colour picker in each row to set the visible albedo colour. The small swatch updates immediately and Live Preview refreshes after the change.",
		"Rename generic roles to describe their purpose. Press Enter after typing the new role name so the change is applied.",
		"Open the Material DNA list on each row and choose the physical/rendering family that belongs to that colour. Existing material.generic.stone labels are shown as missing/custom until you choose a real library definition.",
		"Material DNA stores shared rendering intent such as wood, metal, glass, stone or emissive magic. It does not replace the visible palette colour.",
		"Click Add palette role when the asset needs another paint colour. New roles use an available library material instead of the old hard-coded generic stone reference.",
		"To make a new Material DNA, enter a lowercase Material ID beginning with material., a readable display name and a family such as wood or metal.",
		"Choose the rendering class, then set roughness, metallic and emission. Opaque is normal; transparent and emissive should be used only when the asset needs them.",
		"Click Create Material DNA. The new shared definition appears in the library and becomes available in every asset's material list.",
		"Return to Block Surface or Voxel Model, confirm the swatches and preview, then Save Draft and Validate material references.",
	],
	"Compound Parts & Sockets": [
		"Use Compound authoring for machines made from independently positioned or animated pieces, such as a furnace body, door, gear and flame.",
		"Review Named parts first. Each part key is a permanent animation target, so use simple stable names such as body, door, gear or flame.",
		"Enter a new part key and click Add voxel part. Open its voxel source through the available model workflow before relying on it in animation.",
		"Set the local transform to place the part relative to the asset origin. Keep the body near the origin so collision and placement remain predictable.",
		"Place a pivot at the real hinge or axle before animating. A door pivots at its edge; a gear pivots at its centre.",
		"Mark only genuinely moving pieces as animated. Static pieces can remain combined for a cheaper runtime mesh.",
		"Add typed sockets for flames, smoke, audio, held items, logistics or interactions, and parent them to the part they should follow.",
		"Validate against the presentation contract. Missing required parts or sockets are blockers because runtime effects and animations could not find their targets.",
	],
	"Collision & Placement Footprint": [
		"Collision controls where players and other bodies can physically move. Placement footprint reserves world-grid cells so two objects cannot occupy the same space.",
		"Start with the smallest simple collision boxes that cover the solid usable shape. Avoid filling intentional holes, doorways or handle gaps.",
		"Choose Single 1 x 1 for ordinary blocks, Tall 1 x 2 for full-height doors or other two-block objects, or author every occupied cell for an unusual shape.",
		"Confirm that the anchor cell is included in Occupied cells. The anchor is the origin used for placement and rotation.",
		"Set allowed rotations to match how the object may face in the world. Test all enabled rotations because a multi-cell footprint rotates with the asset.",
		"Choose allowed placement faces such as floor, wall or ceiling and set support requirements so objects cannot float accidentally.",
		"Use clearance cells for space that must stay empty while the object operates, such as the swing area in front of a door or machine access panel.",
		"Validate, then inspect one and several instances in World Test Preview to catch overlaps that a single model view cannot show.",
	],
	"Item, Held, Drop & Icon Preview": [
		"Use this page for inventory items, tools and weapons after their Surface or Voxel source has visible geometry.",
		"Inspect Neutral first to confirm the model itself is centred and scaled sensibly.",
		"Inspect Held to check grip position, hand clearance, orientation and whether the object blocks too much of the player's view.",
		"Inspect Dropped to confirm the item rests above the ground, is not upside down and remains recognizable from several angles.",
		"Inspect Icon at actual HUD size. Strong silhouettes and clear colour separation matter more than tiny model details here.",
		"Adjust representation transforms instead of reshaping the canonical model merely to fix one viewing context.",
		"Bake a fresh preview icon, Save Draft and Validate before testing the item in inventory and first-person gameplay.",
	],
	"Animation, Effects & Runtime States": [
		"Create and name compound parts before animation. Animation tracks target stable part keys; renaming a part later can break the clip.",
		"Use transform clips for doors, handles, gears and other rigid pieces. Put the pivot at the hinge or axle before adding rotation keys.",
		"For a continuously turning gear, animate a full rotation and use a looping clip. If it swings and snaps back, check the pivot, rotation axis, final key and loop interpolation.",
		"Use material clips for glow, heat or colour pulses that do not change the model's shape.",
		"Use voxel-frame clips only for small bounded shape changes such as magical flame frames. Every frame must use the same dimensions.",
		"Add effect sockets first, then attach flames, smoke or sparks to the correct socket so they remain centred and follow moving parts.",
		"Runtime state bindings are one-way presentation rules. Choose a gameplay field such as processing, blocked or damaged, then assign visual/audio actions without changing machine logic.",
		"Use State simulator to preview inactive, active, blocked and damaged combinations, including reduced-motion mode.",
		"Save, Validate and Bake Preview. Test the real machine in game because the simulator cannot prove inventory, fuel or processing transitions.",
	],
	"Overrides, Variants & Provenance": [
		"Use an override when a project, biome, culture or accessibility layer needs a deliberate change to an existing base presentation.",
		"Choose the stable base presentation first. Do not copy the complete asset when only one palette, material, part or state needs to differ.",
		"Add only the changed fields so future improvements to the base can still flow through.",
		"Choose the correct source layer and priority. Higher-priority layers win only when they intentionally target the same field.",
		"For variants, write deterministic conditions based on stable context rather than random frame-time values.",
		"Compare the resolved preview with the base, then inspect provenance to see exactly which layer supplied every changed field.",
		"Save and Validate conflict diagnostics before approving an override or variant set.",
	],
	"World & Machine Test Preview": [
		"This page uses the baked runtime package, not unsaved canvas data. Save and Bake Preview before expecting recent changes to appear.",
		"Resolve the stable gameplay ID and confirm the package status so you know whether the preview uses Forge or a legacy fallback.",
		"Preview one instance to inspect ground contact, facing direction, collision scale and interaction readability.",
		"Preview three or more instances to expose overlapping footprints, particle clutter and obvious repeated texture patterns.",
		"For machines, simulate the important runtime states and verify effects originate from the intended sockets.",
		"If the result is wrong, return to the editable source; do not edit generated package files because the next bake replaces them.",
		"After the test looks correct, run Validation again before Approve & Bake.",
	],
	"Validation Centre": [
		"Press Validate or Ctrl+Enter after changing authoring mode, geometry, parts, sockets, collision, footprint, animation or state bindings.",
		"Critical means the change can break compatibility or existing placement. Error means the presentation cannot safely bake. Both block approval.",
		"Click or read each diagnostic's field and suggested action, then return to the named Forge page to fix it.",
		"Warnings do not always block baking, but review them for oversized voxel volumes, unusual surface resolution, collision, materials, accessibility and migration risk.",
		"An empty Voxel Model must receive visible voxels. A missing contract part/socket must be created or deliberately remapped.",
		"Run validation again after every fix; do not assume the previous list updates itself while another page is open.",
		"When no blockers remain, inspect Live Preview and use Bake Preview before final approval.",
	],
	"Blueprint Designer Handoff": [
		"Use this page when an asset will be placed by a settlement or structure blueprint rather than only by the player.",
		"Confirm the stable presentation ID; blueprint data should reference the canonical ID rather than a generated scene path.",
		"Review the palette-role handoff so blueprint materials map to existing Forge presentations without duplicating them.",
		"Confirm the placement footprint, anchor and every allowed rotation in a representative blueprint plan.",
		"Check required interaction markers, sockets and clearance cells before construction begins.",
		"Return to Forge to make presentation changes, then rebake and retest the same blueprint placement.",
	],
	"Migration Register": [
		"Migration tracks replacement of a legacy visual with an approved Forge package while preserving the same gameplay identity.",
		"Compare the old and new presentations in equivalent lighting and placement so missing faces, scale changes or orientation errors are visible.",
		"Confirm the gameplay ID and presentation contract have not changed accidentally.",
		"Compare collision, footprint, occupied cells, rotations, sockets and state bindings. These can affect existing worlds even when the mesh looks correct.",
		"Record every intentional compatibility change and the migration or fallback behavior it requires.",
		"Keep the legacy fallback available until the new package has passed preview, in-game state testing and save/load testing.",
		"Mark migration complete only after the approved package resolves through the runtime registry for the original stable ID.",
	],
	"Recovery & History": [
		"Use Ctrl+Z and Ctrl+Y first for mistakes made during the current session. Painting batches, mode switches, face pastes, layer pastes and pattern applications are designed as undoable commands.",
		"Forge autosaves dirty work shortly after edits. A recovery notice means a recoverable copy exists; it does not automatically replace the current source.",
		"Review the candidate's asset ID, revision and time before opening it so you do not restore work from another asset.",
		"Compare the recovered model and palette in Live Preview with the current saved source.",
		"Restore only the intended candidate, then immediately Save Draft under the canonical source ID.",
		"Run Validate after restoration because an autosave may have captured a structurally incomplete step.",
		"Use the previous-source backup when a completed save—not merely an unsaved edit—needs to be rolled back.",
	],
	"Presentation Forge": [
		"Use Presentation Forge after the block, item, entity or blueprint has a stable ID. It coordinates how gameplay events become bounded visual and audio responses without owning gameplay truth.",
		"Choose a presentation profile for a reusable outcome, then connect it through a presentation binding instead of calling particles, audio or lights directly from gameplay code.",
		"Confirm every profile, binding and dependency resolves through the shared Forge Asset Index. Do not create a second presentation registry or use scene paths as identity.",
		"Keep persistent owners and loop keys stable. A keyed play, update and stop lifecycle prevents duplicate effects and orphaned audio loops.",
		"Review the selected budget, accessibility profile and fallback chain before previewing. Critical cues must remain understandable when motion, flashing or audio is reduced.",
		"Use the acceptance machine to test processing, blocked and damaged state combinations before applying the same pattern to production content.",
		"Capture the contract payload and deterministic seed whenever a runtime result needs to be reproduced. Rendered node instances are outputs, not replay data.",
		"Validate and use the Test Laboratory before publishing a new profile family. Human visual and listening approval remain separate from automated validation.",
	],
	"Spatial Roles": [
		"Use semantic roles such as socket.hand.primary, foot anchors, damage regions and audio portals instead of embedding a NodePath from one scene.",
		"Choose the canonical Set 22 role first. Add an import alias only when the alternate spelling maps to exactly one canonical role.",
		"Assign an owner-local spatial map so variants, LODs and reconstructed actors can resolve the same role on different geometry.",
		"Declare exact, mirrored and fallback mappings explicitly. A fallback should report its quality rather than pretending to be an exact result.",
		"Use runtime-contact records for transient positions such as a mining impact or footstep. Give each contact an owner, timestamp and bounded lifetime.",
		"Test left/right mirroring and missing-owner behavior. Ambiguous aliases and paths that escape their owner must fail validation.",
		"Keep gameplay collision and presentation attachment separate. Spatial roles tell presentation where to appear; they do not grant damage or interaction authority.",
		"Reconstruct the owner and repeat the lookup to prove the role survives save/load without scene-path identity.",
	],
	"Events & Profiles": [
		"Start with an event or state contract that lists the permitted payload fields, types, ranges and authority policy.",
		"Build a context packet from stable owner, material, environment, intensity and spatial-role values. Never include rendered nodes or arbitrary objects.",
		"Connect the contract to one or more profiles through a binding. Put selection rules in data so the same event can resolve consistently in replay and multiplayer.",
		"Use event contracts for one-shot facts such as an impact. Use state contracts for continuous truth such as furnace processing or ward health.",
		"Validate malformed and missing payload fields before publication. Do not silently coerce an unknown contract into a plausible effect.",
		"Record timestamp, deterministic seed, sequence ID and ownership key for traces. These values make capture, prediction and reconciliation inspectable.",
		"Confirm presentation handlers read authoritative data but cannot change gameplay inventory, damage, recipes, construction or world state.",
		"Run the same fixture twice and compare trace hashes before declaring the contract deterministic.",
	],
	"VFX Graph Authoring": [
		"Create a VFX definition, choose a reusable family and voxel form, then point it to one bounded graph source.",
		"Begin with a spawn node, add only necessary transforms or curves, and end at a declared output. Cycles are invalid unless a future schema explicitly bounds them.",
		"Set maximum spawn count, lifetime, updates and requested lights. Validation rejects missing or unsafe bounds before compilation.",
		"Use owner and lifecycle keys for loops, trails and volumes so repeated play commands update the existing instance instead of leaking another one.",
		"Provide LOD, aggregation and virtualisation behavior for dense scenes. Critical cues may degrade but must not disappear without an accessible equivalent.",
		"Compile through the shared Forge bake service and inspect the immutable runtime product. Runtime simulation must not parse the editable graph every frame.",
		"Preview several repeated instances and run the dense-scene stress scenario to confirm particles, lights and pooled objects remain bounded.",
		"Capture the command stream and seed, then replay it to verify the same structural result before requesting human visual approval.",
	],
	"Sound Event Authoring": [
		"Create a Sound Event and select licensed or explicitly placeholder Sound Sources. Every production source needs provenance and usable rights evidence.",
		"Use layers and seeded variation for controlled repetition. Do not treat the 700 to 1,100 source planning range as an automatic completion target.",
		"Set concurrency, voice, distance and loop limits. Persistent sounds require stable ownership keys and an explicit stop path.",
		"Choose a spatial-audio profile and bus intent rather than wiring an AudioStreamPlayer scene path into gameplay code.",
		"Add captions and a visual or haptic equivalent for critical cues. Validate the equivalence before a critical Sound Event can publish.",
		"Compile the source event into a managed sound plan and inspect its fallback. Unverified media must retain the active legacy fallback.",
		"Test play, update, stop, virtualisation and listener arbitration, including split-screen and late-join cases.",
		"Complete a human listening and rights review separately; a clean hash proves reproducibility, not quality or legal clearance.",
	],
	"Accessibility Preview": [
		"Select an accessibility profile and quality tier before running a scenario. Test reduced motion, reduced flash, captions and critical-cue redundancy independently.",
		"Verify status remains readable without relying on colour alone. Blocked, damaged and dangerous states need shape, motion, text, sound or another redundant channel.",
		"Reduced motion should choose a stable frame, slower bounded animation or another clear equivalent; it must not hide authoritative state.",
		"Reduced flash must clamp or replace rapid emission changes. Confirm the replacement still communicates urgency.",
		"Captions must identify the event and useful direction or ownership context without exposing internal stable IDs to players.",
		"Use the accessibility matrix in Test Laboratory to run every requested mode against every declared quality tier.",
		"Record automated results and leave manual accessibility review open until a person evaluates the actual rendered and audible experience.",
		"If one mode fails, fix the shared profile or binding so every dependent asset receives the correction.",
	],
	"Capture & Replay": [
		"Capture contracts, payloads, timestamps, seeds, owner IDs and stable spatial references. Do not capture rendered particle, mesh or audio-player instances.",
		"Name the scenario and registry generation so the evidence identifies exactly which source set produced the trace.",
		"Review the trace before replaying to catch missing ownership, unbounded values or a dependency that resolved through fallback.",
		"Replay in a clean runtime state and compare the trace hash, command order and lifecycle keys with the original capture.",
		"Use continuous-state snapshots for late join. Do not replay obsolete one-shot impacts merely because they appeared earlier in the log.",
		"For predicted events, record both predicted and authoritative sequence IDs so reconciliation can confirm, replace or cancel the presentation.",
		"Store captures as replaceable verification evidence, not as gameplay saves or approved media.",
		"A matching replay proves deterministic contracts; visual and listening acceptance still require human review.",
	],
	"Test Laboratory": [
		"Open the visual scenario composer, choose Blank, Duplicate or an existing isolated scenario, then drag the smallest useful structures, entities, items, VFX and audio fixtures onto the canvas.",
		"Select each placed fixture and add construction, state, animation, event, seed and instance-count inputs from the visual inspector. Source pickers store canonical IDs for you.",
		"Use the four development acceptance fixtures for source-to-runtime checks: Mosaic Block, Relay Block, State Machine and Tuning Tool.",
		"Run malformed-contract and missing-dependency variants to prove validation fails safely and leaves the last known-good generation active.",
		"Run each deterministic scenario twice and compare its hash. A changed hash requires an explained source or contract change.",
		"Use dense-scene stress for pooling, voice, particle, light, surface and update limits. The result must report zero unbounded allocations.",
		"Test save/reconstruction, hot reload, rollback, multiplayer authority and split listeners when the changed family participates in those systems.",
		"Export the evidence index and keep manual visual, listening, accessibility, rights and owner-review fields open until completed by people.",
		"Finish with the focused Forge probes, current aggregate regression gate and git diff hygiene check.",
	],
	"Hot Reload & Repair": [
		"Stage changed records into a candidate registry generation. Staging must not alter the currently published generation.",
		"Read the compatibility report for added, modified, removed and contract-changed IDs before publication.",
		"Classify replacements and migrations explicitly. An unclassified contract-version change must block publication.",
		"Publish only after schema, dependency, alias, cycle and domain validation succeeds for the complete candidate generation.",
		"Refresh previews and runtime consumers by stable ID after publication; never patch existing instances by a generated scene path.",
		"Use rollback to restore the previous known-good generation when a consumer or test fails after publication.",
		"Repair plans are non-destructive suggestions. Review and apply them deliberately instead of allowing validation to rewrite source automatically.",
		"After repair, rerun the affected focused probe and the full gate, then update evidence and approval state without deleting the fallback early.",
	],
}


const BASIC_OVERRIDES := {
	"Structures & Buildings": [
		"Open Blueprint Composition Editor and choose the source type you need: Blueprint, Room / Module, Structure Set, Procedural Rules or Runtime State.",
		"Create rooms first, add their elements and connection points, then collect them in a Structure Set.",
		"Use Procedural Rules to set a deterministic seed and safe generation bounds; Preview before saving.",
		"Use Blueprint for a hand-authored building and Runtime State for construction, damage and repair appearances.",
		"Save Draft, Validate, Preview, then Approve & Save. Approved products hot-reload only while their source receipt still matches.",
	],
	"Blueprint Composition Editor": [
		"Choose Blueprint, Room / Module, Structure Set, Procedural Rules or Runtime State, then start Blank, from a guided template or by duplicating an existing source. A readable name suggests the stable slug.",
		"Build directly in the 3D voxel workspace with searchable canonical blocks. Add cumulative stages and explicit doors, rooms, access, markers, sockets and networks from their visual tools.",
		"Save each dependency, then choose it from the searchable module and reference cards; never transcribe a stable ID for the basic workflow.",
		"Use Approve & Save only after the source and generated preview agree.",
	],
	"Characters & Creatures": [
		"Open Entity Model Editor and begin with an Entity or reusable Body Plan.",
		"Sculpt body-part voxels, then bind semantic roles and joints in a Rig.",
		"Add animation clips, variants and equipment fit records after the anatomy IDs are stable.",
		"Preview, Save Draft, Validate and approve dependencies before the top-level Entity.",
	],
	"Entity Model Editor": [
		"Create an Entity, Body Plan, Body Part, Rig, Animation Library, Variant or Equipment Fit source from Blank, a guided template or an existing source.",
		"Work from anatomy to motion to appearance so later records can reference stable earlier IDs.",
		"Sculpt in 3D or slice mode, choose parts from the hierarchy, bind and mirror rig roles, pose keys on the dope sheet and choose sockets through the visual picker.",
		"Preview, Save Draft, Validate, then Approve & Save each finished source.",
	],
	"VFX": [
		"Open Live VFX Graph Editor and create a voxel Form, bounded Graph and top-level Effect.",
		"Connect graph nodes in execution order and keep spawn, lifetime, update and light budgets explicit.",
		"Reference the saved Form and Graph IDs from the Effect, including accessibility and LOD settings.",
		"Preview, Save Draft, Validate and approve the dependencies before approving the Effect.",
	],
	"Live VFX Graph Editor": [
		"Create a Form for visible volume, a Graph for bounded behaviour and an Effect to assemble them.",
		"Sculpt the Form in 3D or slice mode, drag typed graph nodes and wires, then choose forms, graph, budget and accessibility sources from visual pickers.",
		"Preview the graph counts, Save Draft, Validate and Approve & Save in dependency order.",
	],
	"Audio": [
		"Open Waveform & Event Editor and choose Synth Instrument / Sound to work without uploading a file.",
		"Tune oscillators, envelope, filter and modulation, then play the two-octave keyboard.",
		"Create an editable Sound Source or a linked Sound Event directly from the instrument.",
		"Set event layers, variation, concurrency, spatial profile, bus and captions before approval.",
	],
	"Waveform & Event Editor": [
		"Choose Synth Instrument / Sound for file-free creation, or Sound Source for an optional recorded file.",
		"Play the keyboard, drag the envelope and waveform handles, then hand the result to an editable source and visual event lane.",
		"Choose event sources and a Spatial Audio Profile with searchable pickers, test listener/source distance and occlusion, then add captions and bounded playback settings.",
		"Save Draft, Validate, listen, then Approve & Save the finished chain.",
	],
}


const IN_DEPTH_GUIDES := {
	"Items & Blocks": [
		"Capstone: create an animated workshop lantern from a new draft. Click New Asset Wizard, select a small placeable gameplay identity, choose Compound, enter Workshop Lantern and workshop_lantern, then click Create or Open Project Source.\nWhy now: starting from a new linked draft protects the source already open and fixes the stable identity before any parts refer to it.",
		"Open Voxel Model Editor for the body part. Select Y axis, slice 0, Pencil, radius 1 and palette role metal_dark; paint a 6 x 6 base, then add a narrower frame on higher slices.\nWhy now: the silhouette establishes occupied geometry before materials, collision or animation depend on its dimensions.",
		"Open Palette & Materials. Add metal_dark, glass_warm and flame_glow; bind them to metal, transparent glass and emissive Material DNA, then return to the voxel canvas and paint the window and flame.\nWhy now: semantic material roles let later variants and damage states change appearance without repainting geometry.",
		"Open Compound Parts & Sockets. Name the parts body, door and flame, place the door pivot on its hinge, and add light, VFX and audio sockets parented to flame.\nWhy now: animation and effects must target stable part and socket names rather than scene paths.",
		"Open Collision & Placement Footprint. Choose Single 1 x 1, add a compact body collision box, include the anchor cell and allow four floor rotations.\nWhy now: placement and collision use the finished silhouette and must be valid before a world preview can be trusted.",
		"Open Animation, Effects & Runtime States. Add a door_open transform clip, a flame_pulse material clip and inactive, active and damaged bindings; include an explicit stop action for the light loop.\nWhy now: pivots and sockets are stable, so animation tracks and loop ownership can now resolve safely.",
		"Open Item, Held, Drop & Icon Preview. Inspect Neutral, Held and Dropped, centre the icon at HUD size and click Bake a fresh preview icon.\nWhy now: representation transforms should adapt the finished model without distorting its canonical world geometry.",
		"Click Save Draft, then Validate. Correct empty voxels, missing Material DNA, collision or socket blockers; click Bake Preview and open World & Machine Test Preview with one and three instances.\nWhy now: validation and crowded world preview prove that modelling, materials, states, collision, animation and icon settings work together.",
		"Reopen workshop_lantern, click Validate again and compare the source hash with its receipt. Request human approval only after keyboard, scaled-text and reduced-motion checks pass.\nWhy now: the final verification proves a reproducible capstone while keeping publication approval an explicit human action.",
	],
	"Blueprint Composition Editor": [
		"Building capstone: choose Blueprint, select Guided Template, name it Two-room Guard Building and accept or edit the suggested slug. Keep the new draft separate from production sources.\nWhy now: the source identity must exist before states and evidence can refer to it, while the visual workflow avoids manual ID transcription.",
		"In the 3D builder choose stone from the searchable block cards. Paint an 8 x 6 Foundation, change to the Frame and Enclosure stages, then use line, rectangle, box and symmetry tools for walls and roof.\nWhy now: cumulative geometry makes each construction phase visible and undoable before semantics are layered on top.",
		"Switch to the Interior and Functional stages. Use the semantic overlay tools to place the entrance, internal door, guard post, bed marker, room bounds and navigation clearance; choose referenced roles from pickers.\nWhy now: visible blocks never imply functional capacity, so access and work records remain explicit.",
		"Create a reusable Guard Room in the same voxel editor, place its connector gizmo on the doorway, then drag the saved room card into the Blueprint and mirror it for the bunk room.\nWhy now: module assembly proves connector direction, clearance and navigation without copying IDs or geometry by hand.",
		"Create under-construction, light-damage (`light_damage`) and repaired state cards from the visual state board. Select the owning building from the source picker, mark a damaged wall in the viewport and add repair resources visually.\nWhy now: state dependencies must remain explicit and selectable before the runtime product can include them.",
		"Play the construction timeline, switch intact, damaged and repaired states, then use flat and slope test-pad presets. Confirm both rooms are reachable, markers stay inside and the footprint comparison is clear.\nWhy now: this closes the hand-authored building capstone in an isolated pad before procedural sources add another failure surface.",
		"Procedural capstone: choose Room / Module and create eight small training modules named entrance, straight, turn, junction, encounter, utility_puzzle, reward_secret and terminal_exit.\nWhy now: a complete semantic room vocabulary lets progression rules request purpose, not a numbered placeholder.",
		"For each module build its room visually and place connector gizmos on doorways, corridors or continuation edges. Set opening size, clearance, compatibility, navigation, terrain and rotation from the selection inspector.\nWhy now: the physical opening and navigation contract must match before modules can be selected safely.",
		"Create a Structure Set. Add all eight saved module cards from the picker, mark entrance as Allowed start, terminal_exit as Preferred end, adjust their weights and select Continuing.\nWhy now: generation rules need one saved pool with explicit start, end and selection weights, without transcribed IDs.",
		"Create Procedural Rules for the set. Enter Seed 104729, Maximum modules 16, Maximum depth 12, Open connection budget 8, Maximum repeats per module 3, Modules before encounter 3, Modules before terminal 7, Dead-end policy terminate_with_cap and checkpoint interval 4.\nWhy now: required ordering, branch, repetition and termination limits make the generator finite and reproducible before preview.",
		"Click Generate deterministic layout preview twice with seed 104729, then try 104730. Confirm the first two hashes match, the third layout differs, mandatory rooms remain reachable and no interior bounds overlap.\nWhy now: same-seed equality proves determinism while a neighbouring seed proves the rules still allow controlled variation.",
		"Use the emitted continuation checkpoint to extend to 24 modules, save the procedural product, reopen it and continue again. Click Validate and inspect connector, reachability, repetition and termination diagnostics.\nWhy now: reconstruction proves continuing structures extend saved state rather than rebuilding or corrupting earlier rooms.",
		"Click Save Draft and Validate for modules, set, rules, states and blueprint. Bake dependencies before top-level products and place both capstones in Test & Delivery; leave human approval open until the review batch is accepted.\nWhy now: dependency-first receipts and explicit review complete both structure workflows without activating unapproved replacements.",
	],
	"Entity Model Editor": [
		"Capstone: make a simple training pig with idle and walk animation and one wearable pack. Choose Entity, select the quadruped guided template and enter Training Pig; accept or edit the suggested slug.\nWhy now: the source identity is established without manual reference transcription before anatomy and motion depend on it.",
		"Create the Entity. Set body family, world dimensions, material roles and gameplay proxy IDs; keep the seeded root Body Plan and Body Part.\nWhy now: real-world size and ownership define the coordinate frame for sculpting and motion.",
		"Sculpt the torso in 3D with X symmetry, use slice mode for exact hooves, then add reusable head and leg templates from the visual hierarchy. Set pivots and anatomy/material roles with pickers.\nWhy now: rig bindings must target explicit semantic anatomy rather than visual guesses.",
		"Create a Rig. Click body parts to bind root, head and limb roles, mirror left/right bindings, connect joint gizmos and adjust visible joint-limit handles.\nWhy now: legal joint motion must be established before animation keys are authored.",
		"Create an Animation Library. Pose the pig to create idle and walk role keys on the dope sheet, drag key timing, enable looping and place a footstep event marker.\nWhy now: tracks now reference a validated rig and the visible marker tests presentation timing without adding gameplay authority.",
		"Create a Variant card for one material change and an Equipment Fit for the training pack. Choose its socket from the rig picker and use the transform test view to clear clipping.\nWhy now: variants and equipment should adapt the canonical body rather than duplicate it.",
		"Add a box gameplay proxy, interaction anchor, collision dimensions, thumbnail capture profile and LOD 0, 1 and 2 role sets; preview each LOD and the runtime reconstruction.\nWhy now: motion and appearance are stable, so cheaper proxies can now be proven against the same canonical anatomy.",
		"Save and Validate Body Parts, Body Plan, Rig, Animation, Variant and Equipment before the Entity. Fix blockers using the visible diagnostics.\nWhy now: dependency-first validation isolates errors and keeps the top-level Entity report useful.",
		"Approve the dependency chain and finally the Entity, then reopen and Preview it.\nWhy now: the final product now demonstrates every character tool from voxel anatomy through motion and fitted appearance.",
	],
	"Live VFX Graph Editor": [
		"Capstone: create a Mining Spark Burst with a visible voxel shard and bounded outward motion. Choose Voxel VFX Form, enter Mining Spark Form and mining_spark_form.\nWhy now: a single readable impact effect exercises every VFX tool without hiding mistakes in spectacle.",
		"Create a Voxel VFX Form. Sculpt a few ember cells directly in 3D, use slices for precision, choose palette swatches and confirm the pivot and bounds.\nWhy now: the form establishes what each spawned instance looks like before behaviour is added.",
		"Save the Form. Create a VFX Graph, search for emitter, colour, velocity and lifetime nodes, drag them onto the canvas and connect their typed ports.\nWhy now: behaviour is easier to validate when each node has one purpose and visual connections replace manual edge transcription.",
		"Set maximum spawn count, lifetime, update rate and requested-light bounds, then Preview the node and edge totals.\nWhy now: explicit bounds are the safety contract the compiler and dense-scene runtime rely on.",
		"Create a VFX Effect and choose the saved Form and Graph cards from their visual pickers. Select the mining event binding, material response, spatial role, seed, cancellation, LOD and budget sources without typing IDs.\nWhy now: the Effect is the assembly layer and should only be created after its parts are selectable saved sources.",
		"Save Draft and Validate Form, Graph and Effect. Fix cycles, missing references and unsafe bounds before approval.\nWhy now: immutable runtime products cannot safely compensate for an ambiguous editable graph.",
		"Run isolated and dense-scene previews with bounds, instance counts and budget overlays. Enable reduced motion and flash safety; verify cancellation removes every owned instance.\nWhy now: accessibility and dense-budget failures are easiest to correct before a review receipt is requested.",
		"Bake Form and Graph, then Bake the Effect and replay it twice with the same seed. Leave approval open until the mining review batch accepts the normal, reduced-motion and flash-safe captures.\nWhy now: the final compiled effect covers sculpting, graphing, event binding, budgets, cancellation, LOD and accessible fallback as one basic product.",
	],
	"Waveform & Event Editor": [
		"Capstone: make a two-note Workshop Chime entirely inside Forge. Select Synth Instrument / Sound, enter Workshop Chime and workshop_chime, then click Create new source; do not choose a file.\nWhy now: the synth is the canonical origin, so the workflow remains reproducible and file-free.",
		"Set A4 tuning (Hz) to 440.0 and Preview cent offset to 0.0. Choose sine and triangle oscillators, set Level 0.65 and 0.25, Octave 0 and 1, Detune 0 and 7 cents, then click C4 and G4 on the two-octave keyboard.\nWhy now: musical note, octave, exact frequency reference and cent tuning should be heard before the envelope or effects mask them.",
		"Drag attack, decay, sustain and release on the envelope graph; mix the oscillator lanes, then adjust filter, modulation, gain, duration, sample rate, polyphony and noise seed.\nWhy now: these visual controls turn raw pitch into an instrument while explicit bounds keep rendering deterministic.",
		"Create an editable Sound Source. Read the Waveform overview and loudness labels; drag trim, fade and loop handles, add a region, normalise and click Play. Keep recipe, seed, generator, hash and owned provenance visible in Advanced Source.\nWhy now: this exercises non-destructive waveform work on internal PCM without importing media.",
		"Create a Spatial Audio Profile and move the listener, source and occlusion barrier while adjusting distance, directionality and reverb. Save the profile when the written status agrees with what you hear.\nWhy now: event playback needs a reusable tested spatial contract before final assembly.",
		"From the generated Sound Source choose Create layered Sound Event. Add a second lane using the searchable source picker, then drag each lane's gain, pitch and delay and use Mute, Solo and Audition.\nWhy now: lanes create the two-note result while retaining one managed event identity.",
		"Set seeded round-robin variation, one-shot loop policy, workshop concurrency, four voices and the SFX bus. Choose the saved spatial profile, add the Workshop Chime caption and enable Critical cue.\nWhy now: variation, playback limits and accessible equivalents must be explicit before publication, while pickers preserve canonical IDs.",
		"Click Validate and correct silence, clipping, loudness, invalid filter, broken loop, repetition, concurrency, caption or stop-path diagnostics. Listen in isolated, dense, occluded and multi-listener scenarios.\nWhy now: automated analysis and scenario listening must agree before a sound can enter human review.",
		"Save Draft and Bake the Synth, Source, Spatial Profile and Event in that order; reopen the Event and play it twice with the same seed. Leave approval open until the Audio review batch accepts the audition.\nWhy now: the final receipt-matched chain proves every Audio Forge tool can produce and reproduce a usable sound without an uploaded file.",
	],
}


static func steps_for_page(page_title: String, mode := BASIC) -> Array:
	if mode == IN_DEPTH:
		var in_depth := _lookup(IN_DEPTH_GUIDES, page_title)
		if not in_depth.is_empty():
			return in_depth
	var basic := _lookup(BASIC_OVERRIDES, page_title)
	if basic.is_empty():
		basic = _lookup(GUIDES, page_title)
	if mode != IN_DEPTH or basic.is_empty():
		return basic
	var expanded: Array[String] = []
	for index in basic.size():
		var reason := (
			"This establishes the source and goal before dependent work begins."
			if index == 0 else (
				"This final check proves the earlier steps form a safe, usable result."
				if index == basic.size() - 1 else
				"This uses the output of the previous step and prepares the next one."))
		expanded.append("%s\nWhy now: %s" % [str(basic[index]), reason])
	return expanded


static func page_titles() -> Array:
	var titles: Array = GUIDES.keys()
	for source in [BASIC_OVERRIDES, IN_DEPTH_GUIDES]:
		for title in source:
			if title not in titles:
				titles.append(title)
	return titles


static func _lookup(source: Dictionary, page_title: String) -> Array:
	if source.has(page_title):
		return source[page_title]
	for title in source:
		if page_title.begins_with(str(title)):
			return source[title]
	return []


static func records_for_page(page_title: String, mode := BASIC) -> Array[Dictionary]:
	var steps := steps_for_page(page_title, mode)
	var records: Array[Dictionary] = []
	var targets := _targets_for_page(page_title)
	for index in steps.size():
		var text := str(steps[index])
		var split := text.split("\nWhy now:", true, 1)
		var instruction := str(split[0]).strip_edges()
		var why_now := str(split[1]).strip_edges() if split.size() > 1 else _default_why(index, steps.size())
		var target: Dictionary = _target_for_instruction(
			page_title, instruction, targets[min(index, targets.size() - 1)] \
			if not targets.is_empty() else {})
		records.append({
			"step_id": "%s.%02d" % [ForgeId.safe_filename(page_title), index + 1],
			"title": "Step %d: %s" % [index + 1, _step_title(instruction)],
			"where": str(target.get("where", "%s / creator workspace" % page_title)),
			"action": instruction,
			"target_id": str(target.get("target_id", "")),
			"control_label": str(target.get("control_label", "Follow the named control in this step")),
			"example_input": str(target.get("example_input", _example_for_page(page_title))),
			"input_format": str(target.get("input_format", "Use the visible field format and stable lowercase IDs where requested.")),
			"why_now": why_now,
			"what_it_controls": _concept_for_page(page_title, index),
			"expected_result": _expected_for_page(page_title, index, steps.size()),
			"verification": _verification_for_step(index, steps.size()),
			"common_mistakes": _mistakes_for_page(page_title),
			"recovery": "Press Ctrl+Z for an editable change, Retry after correcting the field, or Reset example to return to a new guide draft. The guide never overwrites the source you had open.",
			"related_information": _related_for_page(page_title),
			"completion": {"kind": str(target.get("completion", "manual_observation"))},
		})
	return records


static func _target_for_instruction(
		page_title: String, instruction: String, fallback: Dictionary) -> Dictionary:
	var lowered := instruction.to_lower()
	var controls := [
		["create new source", "CreateCreatorSource", "Create new source"],
		["a4 tuning", "GuideTarget_a4_tuning_(hz)", "A4 tuning (Hz)"],
		["preview cent offset", "GuideTarget_preview_cent_offset", "Preview cent offset"],
		["create editable sound source", "GuideTarget_create_editable_sound_source_from_current_note", "Create editable Sound Source from current note"],
		["waveform overview", "GuideTarget_WaveformOverview", "Waveform overview"],
		["loudness analysis", "GuideTarget_LoudnessAnalysis", "Loudness analysis"],
		["add a full-length region", "GuideTarget_add_full-length_region", "Add full-length region"],
		["safe loop markers", "GuideTarget_set_safe_loop_markers", "Set safe loop markers"],
		["variation policy", "GuideTarget_variation_policy", "Variation policy"],
		["maximum voices", "GuideTarget_maximum_voices", "Maximum voices"],
		["spatial profile id", "GuideTarget_spatial_profile_id", "Spatial profile ID"],
		["caption key", "GuideTarget_caption_/_equivalent_feedback_key", "Caption / equivalent feedback key"],
		["footprint maximum", "GuideTarget_footprint_maximum", "Footprint maximum"],
		["role_to_material", "GuideTarget_role_to_material_dna_bindings", "Role to Material DNA bindings"],
		["add placed module", "GuideTarget_add_placed_module", "Add placed module"],
		["add construction stage", "GuideTarget_add_construction_stage", "Add construction stage"],
		["add module element", "GuideTarget_add_module_element", "Add module element"],
		["add connection point", "GuideTarget_add_connection_point", "Add connection point"],
		["opening size", "GuideTarget_opening_size", "Opening size"],
		["maximum repeats per module", "GuideTarget_maximum_repeats_per_module", "Maximum repeats per module"],
		["seed 104729", "GuideTarget_seed", "Seed"],
		["generate deterministic layout preview", "GuideTarget_generate_deterministic_layout_preview", "Generate deterministic layout preview"],
		["add body part", "GuideTarget_add_body_part", "Add body part"],
		["add role binding", "GuideTarget_add_role_binding", "Add role binding"],
		["add joint", "GuideTarget_add_joint", "Add joint"],
		["add animation clip", "GuideTarget_add_animation_clip", "Add animation clip"],
		["add event marker", "GuideTarget_add_event_marker", "Add event marker"],
		["add graph node", "GuideTarget_add_graph_node", "Add graph node"],
		["connect nodes", "GuideTarget_connect_nodes_in_listed_order", "Connect nodes in listed order"],
		["save draft", "GuideTarget_SaveDraft", "Save Draft"],
		["validate", "GuideTarget_Validate", "Validate"],
		["preview", "CreatorPreviewOutput", "Preview output"],
	]
	for mapping in controls:
		if str(mapping[0]) in lowered:
			var result := fallback.duplicate(true)
			result.target_id = str(mapping[1])
			result.control_label = str(mapping[2])
			result.where = "%s / source editor" % page_title
			result.completion = "manual_observation"
			return result
	return fallback


static func format_record(record: Dictionary, compact := false) -> String:
	if compact:
		return "%s\n%s" % [str(record.get("action", "")), str(record.get("verification", ""))]
	return ("Where you are: %s\nWhat to click: %s\nWhat to select or type: %s (%s)\n"
		+ "Action: %s\nWhy now: %s\nWhat this controls: %s\nExpected result: %s\n"
		+ "How to verify: %s\nCommon mistakes: %s\nHow to recover: %s\nRelated information: %s") % [
		str(record.get("where", "")), str(record.get("control_label", "")),
		str(record.get("example_input", "")), str(record.get("input_format", "")),
		str(record.get("action", "")), str(record.get("why_now", "")),
		str(record.get("what_it_controls", "")), str(record.get("expected_result", "")),
		str(record.get("verification", "")), str(record.get("common_mistakes", "")),
		str(record.get("recovery", "")), str(record.get("related_information", ""))]


static func content_issues() -> PackedStringArray:
	var issues := PackedStringArray()
	for page_title in page_titles():
		for mode in [BASIC, IN_DEPTH]:
			var records := records_for_page(str(page_title), mode)
			for index in records.size():
				var record: Dictionary = records[index]
				var location := "%s/%s/step-%d" % [page_title, mode, index + 1]
				var action := str(record.get("action", "")).strip_edges()
				var title_prefix := "Step %d: " % (index + 1)
				var title := str(record.get("title", ""))
				var heading := title.trim_prefix(title_prefix).strip_edges()
				if action.is_empty():
					issues.append("%s has no action text" % location)
					continue
				if not _has_terminal_punctuation(action):
					issues.append("%s action appears to end mid-text: %s" % [location, action])
				if not title.begins_with(title_prefix) or heading.is_empty():
					issues.append("%s has no complete step heading" % location)
				elif not action.begins_with(heading):
					issues.append("%s heading does not match its action: %s" % [location, heading])
				elif heading.length() < action.length() and not _has_terminal_punctuation(heading):
					issues.append("%s heading appears to end mid-text: %s" % [location, heading])
				var full_record := format_record(record)
				if action not in full_record:
					issues.append("%s full guide record omits part of its action" % location)
	return issues


static func glossary() -> Dictionary:
	return {
		"stable ID": "The permanent identity referenced by saves and other sources; changing the display name does not change it.",
		"source": "The editable Forge document. It is canonical and must never be replaced by editing a generated product.",
		"runtime product": "The replaceable result compiled or baked from a source for the game to load.",
		"bake": "A deterministic conversion from editable source to a runtime product.",
		"receipt": "Evidence binding the exact source and dependency hashes to one baked product.",
		"connector": "A typed position, direction and clearance contract used to join structure modules safely.",
		"rig": "Semantic joints and role bindings that tell body parts how they may move.",
		"graph": "A bounded network of VFX operations whose connections define execution order.",
		"spatial profile": "Reusable distance, attenuation, occlusion and reverb rules for a sound.",
		"approval": "A human decision that a validated candidate is suitable to replace its fallback.",
	}


static func _targets_for_page(page_title: String) -> Array:
	var create := [
		{"target_id": "CreatorType", "control_label": "Source type", "where": "%s / New source bar" % page_title, "example_input": "Choose the source type named in the step", "completion": "control_selected"},
		{"target_id": "CreatorName", "control_label": "Name", "where": "%s / New source bar" % page_title, "example_input": _example_for_page(page_title), "completion": "control_has_text"},
		{"target_id": "CreatorSlug", "control_label": "Stable slug", "where": "%s / New source bar" % page_title, "example_input": ForgeId.safe_filename(_example_for_page(page_title)), "input_format": "Lowercase letters, numbers and underscores; do not include the automatic domain prefix.", "completion": "control_has_text"},
		{"target_id": "CreateCreatorSource", "control_label": "Create new source", "where": "%s / New source bar" % page_title, "example_input": "Press the button after Name and Stable slug are valid", "completion": "document_exists"},
		{"target_id": "CreatorEditor", "control_label": "The property or canvas named in this step", "where": "%s / Source editor" % page_title, "example_input": "Use the concrete value stated in the action", "completion": "manual_observation"},
		{"target_id": "GuideTarget_Validate", "control_label": "Validate", "where": "%s / Document actions" % page_title, "example_input": "Press Validate; no text entry", "completion": "validation_clear"},
		{"target_id": "CreatorPreviewOutput", "control_label": "Preview", "where": "%s / Preview output" % page_title, "example_input": "Compare the preview with the expected result", "completion": "preview_available"},
		{"target_id": "GuideTarget_ApproveAndSave", "control_label": "Approve & Save", "where": "%s / Document actions" % page_title, "example_input": "Use only after validation and human review", "completion": "document_saved"},
	]
	return create


static func _example_for_page(page_title: String) -> String:
	if "Blueprint" in page_title: return "Training Guardhouse"
	if "Entity" in page_title: return "Training Pig"
	if "VFX" in page_title: return "Mining Spark Burst"
	if "Audio" in page_title or "Waveform" in page_title: return "Workshop Chime"
	if "Item" in page_title or "Voxel" in page_title: return "Workshop Lantern"
	return "Training Example"


static func _concept_for_page(page_title: String, index: int) -> String:
	if "Blueprint" in page_title: return "This edits canonical structure geometry, semantic markers, typed connectors or bounded generation rules. These records control placement and presentation, not settlement gameplay truth."
	if "Entity" in page_title: return "This edits reusable anatomy, semantic rig roles, motion or appearance data. Stable body roles let animations and equipment survive visual revisions."
	if "VFX" in page_title: return "This edits the visible form, bounded execution graph or assembly effect. Explicit limits prevent one effect from exhausting scene budgets."
	if "Audio" in page_title or "Waveform" in page_title: return "This edits a reproducible sound recipe, non-destructive source transform or managed Sound Event. Playback ownership and limits prevent stuck loops and excessive voices."
	return "This step changes the editable Forge source while preserving its stable gameplay identity."


static func _expected_for_page(page_title: String, index: int, count: int) -> String:
	if index == 0: return "The requested source type is visible and its relevant editor becomes available."
	if index == count - 1: return "The finished capstone reopens with a receipt-matched preview while human publication approval remains explicit."
	return "The source state and preview update to show the value or component described in this step."


static func _verification_for_step(index: int, count: int) -> String:
	if index == count - 1: return "Reopen the source, run Validate again and confirm the preview and stable ID match the finished capstone."
	return "Read the textual source-state line and diagnostics, then confirm the expected change is visible; colour alone is never the pass indicator."


static func _mistakes_for_page(page_title: String) -> String:
	if "Blueprint" in page_title: return "Using unsaved module IDs, reversed connector directions, blocked clearance or an unbounded rule set."
	if "Entity" in page_title: return "Animating before role IDs are stable, binding the wrong body part, or duplicating anatomy for a cosmetic variant."
	if "VFX" in page_title: return "Creating a graph cycle, omitting lifetime/spawn bounds, or approving before reduced-motion and dense previews."
	if "Audio" in page_title or "Waveform" in page_title: return "Clipping gain, an inaudible envelope, a loop without a stop path, missing caption, or too many simultaneous voices."
	return "Changing a stable ID accidentally, editing a generated product, or approving before validation and preview."


static func _related_for_page(page_title: String) -> String:
	if "Blueprint" in page_title: return "Glossary: source, connector, bake, receipt, approval. Related: Items & Blocks material roles and Test & Delivery."
	if "Entity" in page_title: return "Glossary: source, rig, bake, receipt, approval. Related: VFX/audio event markers and Test & Delivery."
	if "VFX" in page_title: return "Glossary: source, graph, runtime product, bake, approval. Related: reduced-motion and flash-safety profiles."
	if "Audio" in page_title or "Waveform" in page_title: return "Glossary: source, spatial profile, runtime product, receipt, approval. Related: captions and critical-cue equivalents."
	return "Glossary: stable ID, source, runtime product, bake, receipt and approval."


static func _step_title(instruction: String) -> String:
	var first_line := instruction.get_slice("\n", 0).strip_edges()
	for index in first_line.length():
		var character := first_line.substr(index, 1)
		if character not in [".", "!", "?"]:
			continue
		# A decimal point or a dot inside a stable ID is not a sentence ending.
		if index + 1 < first_line.length() \
				and first_line.substr(index + 1, 1) != " ":
			continue
		return first_line.substr(0, index + 1)
	return first_line


static func _has_terminal_punctuation(text: String) -> bool:
	var stripped := text.strip_edges()
	return stripped.ends_with(".") or stripped.ends_with("!") or stripped.ends_with("?")


static func _default_why(index: int, count: int) -> String:
	if index == 0: return "This establishes the source and goal before dependent work begins."
	if index == count - 1: return "This final check proves the earlier steps form a safe, usable result."
	return "This uses the previous result and establishes a stable dependency for the next action."
