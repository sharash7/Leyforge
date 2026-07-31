class_name ForgeSectionGuides
extends RefCounted
## Single source of truth for the in-Forge step-by-step help. Add or update a
## page here whenever its workflow changes.

const GUIDES := {
	"Forge Home": [
		"Open an existing asset or start from a live registry record.",
		"Use the relevant editor for surfaces, voxels, compounds, or items.",
		"Validate, inspect the live preview, then bake a temporary preview.",
		"Approve and bake only when blocking diagnostics are resolved.",
	],
	"Asset Browser": [
		"Search by asset name, stable gameplay ID, category, or status.",
		"Open the asset record you want to inspect or edit.",
		"Use the status and coverage summary to spot legacy presentations.",
	],
	"New Asset Wizard": [
		"Choose a live registry record so gameplay identity stays stable.",
		"Create the draft in the suggested authoring mode.",
		"Add visible geometry, collision, and the correct placement footprint.",
		"Save and validate before the first preview bake.",
	],
	"Block Surface Editor": [
		"Choose the cube face and palette role.",
		"Choose Pencil, Square, Circle, Diamond, or Fill, then set its size.",
		"Hold and drag left-click to paint; hold and drag right-click to erase.",
		"Copy a face, select destination sides, and choose a paste transform.",
		"Mirror or rotate the current face directly when orientation is wrong.",
		"Use the tile preview to inspect seams without changing the source.",
	],
	"Voxel Model Editor": [
		"Choose an axis and move to the slice you want to edit.",
		"Choose a palette role, painting tool, and size.",
		"Hold and drag left-click to add voxels; right-drag removes them.",
		"Use Mirror X for symmetrical strokes and inspect every relevant slice.",
	],
	"Palette Roles & Material DNA": [
		"Name palette roles by purpose rather than by a one-off colour.",
		"Choose the albedo colour and shared Material DNA binding.",
		"Preview the result under the Forge lighting.",
		"Validate missing or incompatible material references.",
	],
	"Compound Parts & Sockets": [
		"Create one stable part for each independently animated component.",
		"Place parts with local transforms and centre pivots where appropriate.",
		"Add typed sockets for effects, audio, items, and interactions.",
		"Validate required part and socket names against the contract.",
	],
	"Collision & Placement Footprint": [
		"Author simple collision boxes around the usable physical shape.",
		"Choose a footprint preset or list every occupied world-grid cell.",
		"Use Tall 1 x 2 for doors and other two-block-high assets.",
		"Confirm the anchor, clearance, rotations, faces, and support rule.",
	],
	"Item, Held, Drop & Icon Preview": [
		"Inspect held, dropped, icon, and neutral preview representations.",
		"Check the grip, scale, and camera clearance in each context.",
		"Bake a fresh icon and confirm it remains readable at HUD size.",
	],
	"Animation, Effects & Runtime States": [
		"Create transform or material clips against stable part names.",
		"Use voxel-frame clips only for bounded shape-changing effects.",
		"Bind read-only gameplay state fields to presentation actions.",
		"Simulate active, blocked, damaged, and reduced-motion states.",
	],
	"Overrides, Variants & Provenance": [
		"Choose a base presentation and define only intentional differences.",
		"Set deterministic variant conditions and priorities.",
		"Compare the resolved result with the base presentation.",
		"Record provenance so inherited and local changes remain explainable.",
	],
	"World & Machine Test Preview": [
		"Resolve the approved package for the stable gameplay ID.",
		"Preview one instance for placement and interaction readability.",
		"Preview three instances to catch overlap and repetition problems.",
		"Return to the editable source before making further changes.",
	],
	"Validation Centre": [
		"Run validation after every structural or contract-sensitive change.",
		"Resolve critical and error diagnostics before approval.",
		"Review warnings for collision, performance, materials, and migration.",
		"Re-run validation and inspect the live preview before baking.",
	],
	"Blueprint Designer Handoff": [
		"Confirm the stable presentation ID and placement footprint.",
		"Check sockets and interaction markers required by blueprints.",
		"Verify rotations and multi-cell occupancy in a representative plan.",
	],
	"Migration Register": [
		"Compare the legacy presentation with the Forge replacement.",
		"Confirm stable gameplay identity and contract compatibility.",
		"Register any footprint, socket, or save-sensitive migration.",
		"Keep fallback coverage until the approved package is verified.",
	],
	"Recovery & History": [
		"Review autosave and previous-source recovery candidates.",
		"Open the candidate and compare it with the current source.",
		"Restore only the intended revision, then validate and save it.",
		"Use Undo and Redo for changes made in the current session.",
	],
}


static func steps_for_page(page_title: String) -> Array:
	for title in GUIDES:
		if page_title.begins_with(str(title)):
			return GUIDES[title]
	return []


static func page_titles() -> Array:
	return GUIDES.keys()
