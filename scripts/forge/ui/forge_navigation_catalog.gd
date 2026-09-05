class_name ForgeNavigationCatalog
extends RefCounted
## Data-only information architecture for the unified Leyforge Forge shell.
## Handler names intentionally point at the existing ForgeWorkspace methods so
## direct probe calls and the editor/runtime hosts keep the same behaviour.

const AUTHOR := "Author"
const INSPECT := "Inspect"
const PLANNED := "Planned"

## Set by Main Menu Dev Tools before loading forge_runtime_host.tscn so the
## runtime shell opens directly on the manual test-room browser on startup.
static var pending_route_id := ""

const SECTIONS := [
	{
		"id": "home",
		"label": "Home",
		"short_label": "Home",
		"accent": "#D9A441",
		"motif": "forge_hall",
		"icon": "res://assets/ui/forge/icons/home.svg",
		"landing_handler": "_show_home",
		"description": "Continue work, inspect project health and recover drafts.",
	},
	{
		"id": "library_create",
		"label": "Library & Create",
		"short_label": "Library",
		"accent": "#4FA8A6",
		"motif": "archive",
		"icon": "res://assets/ui/forge/icons/library.svg",
		"landing_handler": "_show_library_hub",
		"description": "Find canonical content, create sources and review migration.",
	},
	{
		"id": "items_blocks",
		"label": "Items & Blocks",
		"short_label": "Items",
		"accent": "#C8733A",
		"motif": "workbench",
		"icon": "res://assets/ui/forge/icons/items.svg",
		"landing_handler": "_show_items_hub",
		"description": "Author blocks, items, props, machines and shared materials.",
	},
	{
		"id": "structures",
		"label": "Structures & Buildings",
		"short_label": "Build",
		"accent": "#7E9CB8",
		"motif": "drafting_table",
		"icon": "res://assets/ui/forge/icons/structures.svg",
		"landing_handler": "_show_structures_hub",
		"description": "Inspect semantic blueprints, construction and handoffs.",
	},
	{
		"id": "characters",
		"label": "Characters & Creatures",
		"short_label": "Beings",
		"accent": "#8FAF63",
		"motif": "bestiary",
		"icon": "res://assets/ui/forge/icons/characters.svg",
		"landing_handler": "_show_characters_hub",
		"description": "Inspect entities, body plans, rigs and appearance systems.",
	},
	{
		"id": "vfx",
		"label": "VFX",
		"short_label": "VFX",
		"accent": "#9B6CDA",
		"motif": "arcane_lab",
		"icon": "res://assets/ui/forge/icons/vfx.svg",
		"landing_handler": "_show_vfx_hub",
		"description": "Inspect bounded voxel effects, forms, graphs and budgets.",
	},
	{
		"id": "audio",
		"label": "Audio",
		"short_label": "Audio",
		"accent": "#6F86D9",
		"motif": "resonance",
		"icon": "res://assets/ui/forge/icons/audio.svg",
		"landing_handler": "_show_audio_hub",
		"description": "Inspect Sound Events, families, ambience and acoustics.",
	},
	{
		"id": "test_delivery",
		"label": "Test & Delivery",
		"short_label": "Test",
		"accent": "#61A978",
		"motif": "proving_ground",
		"icon": "res://assets/ui/forge/icons/delivery.svg",
		"landing_handler": "_show_delivery_hub",
		"description": "Validate, capture, compare, publish and recover safely.",
	},
]

static var ROUTES: Array = [
	_route("home_dashboard", "home", "Start", "Dashboard", "Forge Home",
		"_show_home", AUTHOR, false, false),
	_route("forge_guide", "home", "Start", "Forge Guide", "Forge Guide",
		"_show_guide", INSPECT, false, false),
	_route("recovery_history", "home", "Safety", "Recovery & History",
		"Recovery & Basic History", "_show_recovery", AUTHOR, false, false),

	_route("asset_browser", "library_create", "Browse", "Asset Browser",
		"Asset Browser", "_show_asset_browser", AUTHOR, false, false),
	_route("new_asset", "library_create", "Create", "New Asset Wizard",
		"New Asset Wizard", "_show_new_asset", AUTHOR, false, false),
	_route("migration_register", "library_create", "Govern", "Migration Register",
		"21G Migration Register", "_show_migration_register", INSPECT, false, false),

	_route("block_surface", "items_blocks", "Model", "Block Surface",
		"Block Surface Editor", "_show_surface_editor", AUTHOR, true, true),
	_route("voxel_model", "items_blocks", "Model", "Voxel Model",
		"Voxel Model Editor", "_show_voxel_editor", AUTHOR, true, true),
	_route("compound", "items_blocks", "Model", "Compound & Sockets",
		"Compound, Parts, Pivots & Sockets", "_show_compound_editor", AUTHOR, true, true),
	_route("materials", "items_blocks", "Finish", "Palette & Materials",
		"Palette Roles & Material DNA", "_show_palette_material_editor", AUTHOR, true, true),
	_route("collision", "items_blocks", "Finish", "Collision & Placement",
		"Collision & Placement Footprint", "_show_collision_placement_editor", AUTHOR, true, true),
	_route("item_preview", "items_blocks", "Finish", "Item & Icon Preview",
		"Item, Held, Drop & Icon Preview", "_show_item_preview", AUTHOR, true, true),
	_route("animation", "items_blocks", "Present", "Animation & States",
		"Animation, Effects & Runtime States", "_show_animation_editor", AUTHOR, true, true),
	_route("overrides", "items_blocks", "Manage", "Overrides & Variants",
		"Overrides, Variants & Provenance", "_show_override_editor", AUTHOR, true, true),
	_route("world_preview", "items_blocks", "Test", "World Test Preview",
		"World & Machine Test Preview", "_show_world_test_preview", AUTHOR, true, true),

	_route("blueprint_catalogue", "structures", "Inspect", "Blueprint Catalogue",
		"Blueprint Catalogue", "_show_blueprint_catalogue", INSPECT, false, false),
	_route("blueprint_handoff", "structures", "Inspect", "Blueprint Handoff",
		"Blueprint Designer Handoff", "_show_blueprint_handoff", INSPECT, false, false),
	_route("blueprint_editor", "structures", "Author", "Blueprint Composition Editor",
		"Blueprint Composition Editor", "_show_creator_studio", AUTHOR, false, true),

	_route("entity_catalogue", "characters", "Inspect", "Entity Catalogue",
		"Entity Catalogue", "_show_entity_catalogue", INSPECT, false, false),
	_route("body_rig_catalogue", "characters", "Inspect", "Body Plans & Rigs",
		"Body Plans & Rigs", "_show_body_rig_catalogue", INSPECT, false, false),
	_route("equipment_catalogue", "characters", "Inspect", "Equipment & Variants",
		"Equipment & Variants", "_show_entity_equipment_catalogue", INSPECT, false, false),
	_route("entity_editor", "characters", "Author", "Entity Model Editor",
		"Entity Model Editor", "_show_creator_studio", AUTHOR, false, true),

	_route("vfx_library", "vfx", "Inspect", "Effects, Graphs & Forms",
		"VFX Graph Authoring", "_show_presentation_vfx", INSPECT, false, false),
	_route("vfx_editor", "vfx", "Author", "Live VFX Graph Editor",
		"Live VFX Graph Editor", "_show_creator_studio", AUTHOR, false, true),

	_route("sound_library", "audio", "Inspect", "Sound Events & Sources",
		"Sound Event Authoring", "_show_presentation_audio", INSPECT, false, false),
	_route("audio_editor", "audio", "Author", "Waveform & Event Editor",
		"Waveform & Event Editor", "_show_creator_studio", AUTHOR, false, false),

	_route("presentation_overview", "test_delivery", "Presentation Setup",
		"Presentation Overview", "Presentation Forge", "_show_presentation_forge",
		INSPECT, false, false),
	_route("spatial_roles", "test_delivery", "Presentation Setup", "Spatial Roles",
		"Spatial Roles", "_show_presentation_spatial", INSPECT, false, false),
	_route("events_profiles", "test_delivery", "Presentation Setup",
		"Events & Profiles", "Events & Profiles", "_show_presentation_events",
		INSPECT, false, false),
	_route("accessibility", "test_delivery", "Verify", "Accessibility Preview",
		"Accessibility Preview", "_show_presentation_accessibility", INSPECT, false, false),
	_route("capture_replay", "test_delivery", "Verify", "Capture & Replay",
		"Capture & Replay", "_show_presentation_capture", AUTHOR, false, false),
	_route("test_laboratory", "test_delivery", "Verify", "Test Laboratory",
		"Test Laboratory", "_show_presentation_test_laboratory", INSPECT, false, false),
	_route("test_room_browser", "test_delivery", "Manual Testing", "Test Room Browser",
		"Test Room Browser", "_show_test_room_browser", INSPECT, false, false),
	_route("validation", "test_delivery", "Deliver", "Validation Centre",
		"Validation Centre", "_show_validation", AUTHOR, true, false),
	_route("hot_reload", "test_delivery", "Deliver", "Hot Reload & Repair",
		"Hot Reload & Repair", "_show_presentation_hot_reload", AUTHOR, false, false),
]

## Single catalog location for manual test rooms launched from the Forge
## Test Room Browser. Add one _test_room(...) entry here to register a room.
static var TEST_ROOMS: Array = [
	_test_room(
		"village_progression_lab",
		"Village Progression Lab",
		"res://development/village_progression_lab.tscn",
		"Village & Settlement",
		"Village progression and settlement construction lab"),
]


static func test_rooms() -> Array:
	return TEST_ROOMS.duplicate(true)


static func _test_room(
		id: String, label: String, scene: String, category: String,
		mechanic: String) -> Dictionary:
	return {
		"id": id,
		"label": label,
		"scene": scene,
		"category": category,
		"mechanic": mechanic,
	}


static func sections() -> Array:
	return SECTIONS.duplicate(true)


static func section(section_id: String) -> Dictionary:
	for definition in SECTIONS:
		if str(definition.id) == section_id:
			return definition.duplicate(true)
	return {}


static func routes_for_section(section_id: String) -> Array:
	var result: Array = []
	for definition in ROUTES:
		if str(definition.section_id) == section_id:
			result.append(definition.duplicate(true))
	return result


static func route(route_id: String) -> Dictionary:
	for definition in ROUTES:
		if str(definition.route_id) == route_id:
			return definition.duplicate(true)
	return {}


static func route_for_page(page_title: String) -> Dictionary:
	for definition in ROUTES:
		if page_title.begins_with(str(definition.page_title)):
			return definition.duplicate(true)
	return {}


static func validate() -> Array[String]:
	var failures: Array[String] = []
	var section_ids := {}
	for definition in SECTIONS:
		var section_id := str(definition.get("id", ""))
		if section_id.is_empty() or section_ids.has(section_id):
			failures.append("Invalid or duplicate section ID: %s" % section_id)
		section_ids[section_id] = true
	if section_ids.size() != 8:
		failures.append("Expected exactly eight Forge studios.")
	var route_ids := {}
	for definition in ROUTES:
		var route_id := str(definition.get("route_id", ""))
		if route_id.is_empty() or route_ids.has(route_id):
			failures.append("Invalid or duplicate route ID: %s" % route_id)
		route_ids[route_id] = true
		if not section_ids.has(str(definition.get("section_id", ""))):
			failures.append("Route has an unknown section: %s" % route_id)
		if str(definition.get("handler", "")).is_empty():
			failures.append("Route has no handler: %s" % route_id)
	return failures


static func _route(
		route_id: String, section_id: String, group: String, label: String,
		page_title: String, handler: String, availability: String,
		requires_asset: bool, show_preview: bool) -> Dictionary:
	var help_key := page_title
	match page_title:
		"Forge Guide", "Recovery & Basic History":
			help_key = "Forge Home"
		"21G Migration Register":
			help_key = "Library & Create"
		"Compound, Parts, Pivots & Sockets":
			help_key = "Items & Blocks"
	match section_id:
		"structures":
			help_key = "Structures & Buildings"
		"characters":
			help_key = "Characters & Creatures"
		"vfx":
			help_key = "VFX"
		"audio":
			help_key = "Audio"
	return {
		"route_id": route_id,
		"section_id": section_id,
		"group": group,
		"label": label,
		"page_title": page_title,
		"handler": handler,
		"help_key": help_key,
		"availability": availability,
		"requires_asset": requires_asset,
		"show_preview": show_preview,
	}
