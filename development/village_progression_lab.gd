extends Node3D
## Editor/F6 village progression laboratory.
##
## This scene deliberately has no production-menu entry. It uses the real
## settlement registry, compatibility facade, multi-settlement collection,
## blueprint placement, plan graph, simulation kernel, and atomic JSON
## snapshots while keeping all files outside normal world directories.

const SNAPSHOT_ROOT := "user://development/village_progression_lab"
const SNAPSHOT_FINAL := SNAPSHOT_ROOT + "/lab.json"
const SNAPSHOT_TEMP := SNAPSHOT_ROOT + "/lab.tmp"
const SNAPSHOT_BACKUP := SNAPSHOT_ROOT + "/lab.backup.json"
const LAB_SEED := 20200720
const QUEST_POLL_INTERVAL := 0.25
const SCENARIO_GRID_COLUMNS := 7
const SCENARIO_GRID_SPACING := 18
const SCENARIO_PLOT_RADIUS := 72
const STAGES: Array[String] = [
	"camp", "hamlet", "village", "fortified_village",
	"town", "city", "capital", "magical_metropolis",
]
const PRESETS: Array[String] = [
	"camp", "hamlet", "village", "fortified_village",
	"town", "city", "capital", "magical_metropolis",
	"watchtower_compatibility", "cottage_growth",
	"megaproject_partial_damage_repair",
]
const PARCELS: Array[String] = [
	"flat", "wooded", "steep", "water_edge", "player_obstructed",
]
const QuestGuideScript = preload(
	"res://development/village_progression_quest_guide.gd")

@onready var world: VoxelWorld = $VoxelWorld
@onready var player: Player = $Player
@onready var hud: Hud = $HUD
@onready var hamlet_runtime: HamletRuntime = $HamletRuntime
@onready var raid_runtime: RaidRuntime = $RaidRuntime

var settlement_ids: Array[String] = []
var project_ids: Array[String] = []
var plan_ids: Array[String] = []
var resource_refs: Array[Dictionary] = []
var plot_anchors: Dictionary = {}
var simulation_modes: Dictionary = {}
var last_simulation: Dictionary = {}
var last_message := "Ready."
var scenario_original_blocks: Dictionary = {}
var scenario_visual_counts: Dictionary = {}
var parcel_anchors: Dictionary = {}
var prepared_parcels: Dictionary = {}
var lab_pending_survey: Dictionary = {}
var quest_guide: RefCounted = QuestGuideScript.new()
var _quest_poll_accumulator := 0.0

var settlement_select: OptionButton
var preset_select: OptionButton
var project_select: OptionButton
var plan_select: OptionButton
var resource_select: OptionButton
var parcel_select: OptionButton
var rotation_select: OptionButton
var inspector: RichTextLabel
var status_label: Label
var interface_panel: PanelContainer
var interface_hint: Label
var quest_diagnostics: Label
var quest_overlay: PanelContainer
var quest_overlay_text: Label


func _ready() -> void:
	player.world = world
	world.player = player
	world.start(LAB_SEED, {
		"worldgen_version": VoxelWorld.WORLDGEN_VERSION,
		"plan_version": WorldStructurePlanner.VERSION,
	})
	_build_lab_state()
	_prepare_plot_columns()
	_prepare_stage_b_parcels()
	_build_interface()
	preset_select.select(PRESETS.find("camp"))
	_record_scenario_loaded("camp")
	last_message = (
		"Stage B camp is ready. Choose a parcel and survey a project; "
		+ "presets are applied only when requested.")
	_move_player_to(
		plot_anchors.get(_selected_settlement_id(), Vector2i.ZERO)
		+ Vector2i(0, -14))
	_prepare_focused_resident_columns()
	_set_interface_open(false)
	hamlet_runtime.configure(world, player)
	hamlet_runtime.refresh_focused_settlement()
	raid_runtime.configure(world, player)
	hud.player = player
	hud.raid_runtime = raid_runtime
	if not player.interaction_requested.is_connected(
			_on_player_interaction_requested):
		player.interaction_requested.connect(_on_player_interaction_requested)
	if not CombatState.raid_phase_changed.is_connected(
			_on_raid_phase_changed):
		CombatState.raid_phase_changed.connect(_on_raid_phase_changed)
	_refresh_inspector()
	call_deferred("_refresh_lab_residents")


func _process(delta: float) -> void:
	_quest_poll_accumulator += delta
	if _quest_poll_accumulator < QUEST_POLL_INTERVAL:
		return
	_quest_poll_accumulator = 0.0
	if hamlet_runtime != null \
			and hamlet_runtime.active_actor_count() >= HamletState.get_npc_ids().size():
		_quest_event("residents_spawned")
	if _player_has_resources():
		_quest_event("player_resource")
	_on_raid_phase_changed(CombatState.phase)


func _unhandled_input(event: InputEvent) -> void:
	var toggle_requested := (
		interface_panel != null
		and interface_panel.visible
		and event.is_action_pressed("ui_cancel"))
	if event is InputEventKey:
		toggle_requested = toggle_requested or (
			event.pressed and not event.echo and event.keycode == KEY_F1)
	if not toggle_requested:
		return
	_set_interface_open(not interface_panel.visible)
	get_viewport().set_input_as_handled()


func _build_lab_state() -> void:
	var planner := WorldStructurePlanner.new()
	planner.generate(LAB_SEED, WorldStructurePlanner.VERSION)
	var spawn := Vector2i(
		floori(world.find_spawn().x), floori(world.find_spawn().z))
	var sites: Array[Dictionary] = []
	for index in 2:
		var position := spawn + Vector2i(-48 if index == 0 else 48, 26)
		sites.append({
			"site_id": "site.hamlet.lab.%s" % ("alpha" if index == 0 else "beta"),
			"type_id": "hamlet",
			"origin_chunk": Vector2i(
				world.chunk_coord(position.x), world.chunk_coord(position.y)),
			"position": position,
			"rotation": index * 90,
			"variant_id": "crossroads" if index == 0 else "ring",
			"footprint": Vector2i(72, 72),
			"parent_site_id": "",
			"validation_result": "valid",
			"is_starter": false,
		})
	if not SettlementManager.initialize_sites(LAB_SEED, planner, sites):
		push_error("VillageProgressionLab: failed to initialize lab settlements")
		return
	SettlementManager.bind_world(world)
	settlement_ids.assign(SettlementManager.settlements.keys())
	settlement_ids.sort()
	plot_anchors.clear()
	for settlement_id in settlement_ids:
		var record: Dictionary = SettlementManager.get_settlement(settlement_id)
		var anchor: Array = record.get("anchor", [0, 0])
		plot_anchors[settlement_id] = Vector2i(
			int(anchor[0]), int(anchor[1]))
		simulation_modes[settlement_id] = "near"
		scenario_original_blocks[settlement_id] = {}
		scenario_visual_counts[settlement_id] = 0
	if not settlement_ids.is_empty():
		CombatState.initialize(
			LAB_SEED, world.get_valley_anchors(), settlement_ids[0])
	_populate_content_ids()


func _populate_content_ids() -> void:
	project_ids.clear()
	for project_id in SettlementContentRegistry.construction_projects.keys():
		project_ids.append(str(project_id))
	project_ids.sort()
	plan_ids.clear()
	for plan_id in SettlementContentRegistry.plan_specs.keys():
		plan_ids.append(str(plan_id))
	plan_ids.sort()
	var resources := {}
	for project_id in project_ids:
		var project := SettlementContentRegistry.get_project(project_id)
		for stage in project.get("stages", []):
			for requirement in (stage as Dictionary).get("requirements", []):
				var ref: Dictionary = requirement
				resources["%s:%s" % [
					ref.get("kind", "item"), ref.get("stable_id", "")]] = {
						"kind": str(ref.get("kind", "item")),
						"stable_id": str(ref.get("stable_id", "")),
						"count": 64,
					}
	for plan_id in plan_ids:
		var plan := SettlementContentRegistry.get_plan(plan_id)
		for component in plan.get("components", []):
			for requirement in (component as Dictionary).get("requirements", []):
				var ref: Dictionary = requirement
				resources["%s:%s" % [
					ref.get("kind", "item"), ref.get("stable_id", "")]] = {
						"kind": str(ref.get("kind", "item")),
						"stable_id": str(ref.get("stable_id", "")),
						"count": 64,
					}
	resource_refs.clear()
	for key in resources.keys():
		resource_refs.append(resources[key])
	resource_refs.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a["stable_id"]) < str(b["stable_id"]))


func _prepare_plot_columns() -> void:
	for settlement_id in settlement_ids:
		var anchor: Vector2i = plot_anchors[settlement_id]
		for offset: Vector2i in [Vector2i.ZERO]:
			var point := anchor + offset
			world.prepare_player_column(Vector3(
				float(point.x), float(world.surface_height_at(
					point.x, point.y) + 2), float(point.y)))
		_mark_plot(anchor)


func _prepare_stage_b_parcels() -> void:
	parcel_anchors.clear()
	prepared_parcels.clear()
	for settlement_id in settlement_ids:
		var center: Vector2i = plot_anchors[settlement_id]
		parcel_anchors[settlement_id] = {
			"flat": center + Vector2i(-26, -24),
			"wooded": center + Vector2i(0, -26),
			"steep": center + Vector2i(26, -24),
			"water_edge": center + Vector2i(-26, 24),
			"player_obstructed": center + Vector2i(26, 24),
		}


func _prepare_selected_parcel_fixture() -> void:
	var settlement_id := _selected_settlement_id()
	var parcel_id := (
		_selected_metadata(parcel_select)
		if parcel_select != null else "flat")
	var key := "%s:%s" % [settlement_id, parcel_id]
	if bool(prepared_parcels.get(key, false)):
		return
	var anchors: Dictionary = parcel_anchors.get(settlement_id, {})
	if not anchors.has(parcel_id):
		return
	var point: Vector2i = anchors[parcel_id]
	world.prepare_player_column(Vector3(
		point.x, world.surface_height_at(point.x, point.y) + 2.0, point.y))
	var dirt_id := BlockRegistry.get_id_by_stable_id("terrain.dirt.basic")
	var grass_id := BlockRegistry.get_id_by_stable_id("terrain.grass.basic")
	var log_id := BlockRegistry.get_id_by_stable_id("natural.log.oak")
	var leaves_id := BlockRegistry.get_id_by_stable_id("natural.leaves.oak")
	var cobble_id := BlockRegistry.get_id_by_stable_id(
		"construction.cobble.stone")
	match parcel_id:
		"flat":
			var flat: Vector2i = point
			_level_lab_parcel(
				settlement_id, flat,
				world.surface_height_at(flat.x, flat.y), 4,
				dirt_id, grass_id, "lab.parcel.flat", "lab")
		"wooded":
			var wooded: Vector2i = point
			for tree_offset in [
				Vector2i(-2, -2), Vector2i(2, -1), Vector2i(0, 2),
			]:
				var tree: Vector2i = wooded + tree_offset
				var ground := world.surface_height_at(tree.x, tree.y)
				for dy in range(1, 4):
					world.set_block_with_provenance(
						Vector3i(tree.x, ground + dy, tree.y), log_id,
						"lab.parcel.wooded", "lab", settlement_id,
						"lab.parcel.wooded")
				for dx in range(-1, 2):
					for dz in range(-1, 2):
						world.set_block_with_provenance(
							Vector3i(tree.x + dx, ground + 4, tree.y + dz),
							leaves_id, "lab.parcel.wooded", "lab",
							settlement_id, "lab.parcel.wooded")
		"steep":
			var steep: Vector2i = point
			var steep_base := world.surface_height_at(steep.x - 4, steep.y)
			for dx in range(-4, 5):
				var target := steep_base + floori(float(dx + 4) / 2.0)
				for dz in range(-4, 5):
					_level_lab_column(
						settlement_id, steep + Vector2i(dx, dz), target,
						dirt_id, grass_id, "lab.parcel.steep", "lab")
		"water_edge":
			var water_edge: Vector2i = point
			var water_base := world.surface_height_at(
				water_edge.x - 2, water_edge.y)
			_level_lab_parcel(
				settlement_id, water_edge, water_base, 4,
				dirt_id, grass_id, "lab.parcel.water", "lab")
			for dx in range(0, 5):
				for dz in range(-4, 5):
					var cell := water_edge + Vector2i(dx, dz)
					world.set_block_with_provenance(
						Vector3i(cell.x, water_base, cell.y), world.id_water,
						"lab.parcel.water", "lab", settlement_id,
						"lab.parcel.water")
					world.set_block_with_provenance(
						Vector3i(cell.x, water_base + 1, cell.y),
						BlockRegistry.AIR, "lab.parcel.water", "lab",
						settlement_id, "lab.parcel.water")
		"player_obstructed":
			var obstructed: Vector2i = point
			var obstructed_y := world.surface_height_at(
				obstructed.x, obstructed.y)
			_level_lab_parcel(
				settlement_id, obstructed, obstructed_y, 4,
				dirt_id, grass_id, "lab.parcel.obstructed", "lab")
			for dx in range(-2, 3):
				for dy in range(1, 4):
					world.set_block_with_provenance(
						Vector3i(
							obstructed.x + dx, obstructed_y + dy,
							obstructed.y),
						cobble_id, "lab.player_obstruction", "player",
						settlement_id, "lab.player_obstruction")
	prepared_parcels[key] = true


func _level_lab_parcel(
		settlement_id: String,
		center: Vector2i,
		target: int,
		radius: int,
		dirt_id: int,
		grass_id: int,
		source_id: String,
		source_type: String) -> void:
	for dx in range(-radius, radius + 1):
		for dz in range(-radius, radius + 1):
			_level_lab_column(
				settlement_id, center + Vector2i(dx, dz), target,
				dirt_id, grass_id, source_id, source_type)


func _level_lab_column(
		settlement_id: String,
		point: Vector2i,
		target: int,
		dirt_id: int,
		grass_id: int,
		source_id: String,
		source_type: String) -> void:
	var surface := world.surface_height_at(point.x, point.y)
	if surface < target:
		for y in range(surface + 1, target):
			world.set_block_with_provenance(
				Vector3i(point.x, y, point.y), dirt_id,
				source_id, source_type, settlement_id, source_id)
	elif surface > target:
		for y in range(target + 1, surface + 1):
			world.set_block_with_provenance(
				Vector3i(point.x, y, point.y), BlockRegistry.AIR,
				source_id, source_type, settlement_id, source_id)
	world.set_block_with_provenance(
		Vector3i(point.x, target, point.y), grass_id,
		source_id, source_type, settlement_id, source_id)
	for y in range(target + 1, target + 7):
		world.set_block_with_provenance(
			Vector3i(point.x, y, point.y), BlockRegistry.AIR,
			source_id, source_type, settlement_id, source_id)


func _mark_plot(anchor: Vector2i) -> void:
	var ground := world.surface_height_at(anchor.x, anchor.y)
	var marker_id := BlockRegistry.get_id_by_stable_id(
		"block.utility.blueprint_marker")
	if marker_id <= 0:
		return
	for offset: Vector2i in [
		Vector2i(-34, -34), Vector2i(34, -34),
		Vector2i(-34, 34), Vector2i(34, 34),
	]:
		var point := anchor + offset
		world.set_block_global(Vector3i(
			point.x, ground + 1, point.y), marker_id)


func _build_interface() -> void:
	var canvas := CanvasLayer.new()
	add_child(canvas)
	interface_panel = PanelContainer.new()
	interface_panel.position = Vector2(16, 16)
	interface_panel.size = Vector2(520, 860)
	canvas.add_child(interface_panel)
	var scroll := ScrollContainer.new()
	interface_panel.add_child(scroll)
	var body := VBoxContainer.new()
	body.custom_minimum_size = Vector2(480, 0)
	body.add_theme_constant_override("separation", 7)
	scroll.add_child(body)

	var title := Label.new()
	title.text = "VILLAGE PROGRESSION LAB"
	title.add_theme_font_size_override("font_size", 24)
	body.add_child(title)
	var note := Label.new()
	note.text = (
		"Editor-only - two isolated settlements - real registry, voxel, "
		+ "project, plan, simulation, and save paths. F1 or Escape returns "
		+ "to first-person exploration.")
	note.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	body.add_child(note)

	var quest_heading := Label.new()
	quest_heading.text = "CAMP-TO-CITY TEST QUEST"
	quest_heading.add_theme_font_size_override("font_size", 18)
	body.add_child(quest_heading)
	quest_diagnostics = Label.new()
	quest_diagnostics.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	quest_diagnostics.custom_minimum_size = Vector2(470, 112)
	body.add_child(quest_diagnostics)
	_add_button_row(body, [
		["Previous", _previous_quest],
		["Verify Objective", _verify_current_quest],
		["Next", _next_quest],
	])
	_add_button_row(body, [
		["Mark Visual Check", _mark_current_manual_quest],
		["Reset Quest Guide", _reset_quest_guide],
	])

	settlement_select = _option(body, "Settlement", settlement_ids)
	settlement_select.item_selected.connect(_on_settlement_selected)
	_add_button_row(body, [
		["Travel To Selected", _travel_to_selected_settlement],
		["Return To Lab Center", _position_player_at_lab_center],
	])
	preset_select = _option(body, "Capability / scenario preset", PRESETS)
	preset_select.item_selected.connect(_on_preset_selected)
	_add_button(body, "Reload Selected Scenario", _apply_selected_preset)
	parcel_select = _option(body, "Construction parcel", PARCELS)
	rotation_select = _option(body, "Blueprint rotation", [0, 90, 180, 270])

	project_select = _option(body, "Construction project", project_ids)
	_add_button_row(body, [
		["Survey + Create", _create_selected_project],
		["Confirm Player Overlap", _confirm_player_overlap],
		["Let Village Choose", _create_village_selected_project],
	])
	_add_button_row(body, [
		["Grant Exact Supplies", _grant_exact_supplies],
		["Advance Work Task", _advance_one_block],
		["Deposit Worker Outputs", _deposit_worker_outputs],
	])
	resource_select = _resource_option(body)
	_add_button(body, "Grant Selected Resource x64", _grant_selected_resource)
	_add_button_row(body, [
		["Reserve Stage", _reserve_active_stage],
		["Advance One Block", _advance_one_block],
	])
	_add_button_row(body, [
		["Complete Stage", _complete_active_stage],
		["Complete Project", _complete_active_project],
	])
	_add_button_row(body, [
		["Cancel Project", _cancel_active_project],
		["Damage Building", _damage_first_building],
		["Repair Building", _repair_first_building],
	])
	_add_button(
		body, "Activate / Deactivate First Building", _toggle_first_building)

	plan_select = _option(body, "District / complex / megaproject", plan_ids)
	_add_button_row(body, [
		["Create Plan", _create_selected_plan],
		["Grant + Reserve Component", _reserve_available_component],
		["Advance Component", _advance_available_component],
	])
	_add_button_row(body, [
		["Damage Plan Component", _damage_first_plan_component],
		["Repair Plan Component", _repair_first_plan_component],
	])

	_add_button_row(body, [
		["Toggle Near / Far", _toggle_simulation_mode],
		["Simulate 60 Minutes", _simulate_hour],
	])
	_add_button_row(body, [
		["Force Migrant", _force_migration],
		["Form Household", _force_household],
		["Force Birth", _force_birth],
	])
	_add_button_row(body, [
		["Advance Child Age", _force_age],
		["Promote Stage", _promote_stage],
		["Evict First Resident", _evict_first_resident],
		["Re-house Displaced", _rehouse_first_displaced],
	])
	_add_button_row(body, [
		["Save Lab Snapshot", _save_snapshot],
		["Reload Snapshot", _load_snapshot],
		["Reset Lab", _reset_lab],
	])

	status_label = Label.new()
	status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	body.add_child(status_label)
	inspector = RichTextLabel.new()
	inspector.custom_minimum_size = Vector2(470, 330)
	inspector.fit_content = false
	inspector.scroll_active = true
	body.add_child(inspector)

	interface_hint = Label.new()
	interface_hint.position = Vector2(16, 16)
	interface_hint.text = (
		"WASD move | Mouse look | Space jump | Shift sprint | "
		+ "F1/Escape lab controls")
	interface_hint.mouse_filter = Control.MOUSE_FILTER_IGNORE
	interface_hint.add_theme_font_size_override("font_size", 18)
	canvas.add_child(interface_hint)

	quest_overlay = PanelContainer.new()
	quest_overlay.anchor_left = 1.0
	quest_overlay.anchor_right = 1.0
	quest_overlay.offset_left = -474.0
	quest_overlay.offset_top = 16.0
	quest_overlay.offset_right = -16.0
	quest_overlay.offset_bottom = 230.0
	quest_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	canvas.add_child(quest_overlay)
	var quest_margin := MarginContainer.new()
	quest_margin.add_theme_constant_override("margin_left", 14)
	quest_margin.add_theme_constant_override("margin_top", 10)
	quest_margin.add_theme_constant_override("margin_right", 14)
	quest_margin.add_theme_constant_override("margin_bottom", 10)
	quest_margin.mouse_filter = Control.MOUSE_FILTER_IGNORE
	quest_overlay.add_child(quest_margin)
	quest_overlay_text = Label.new()
	quest_overlay_text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	quest_overlay_text.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	quest_overlay_text.mouse_filter = Control.MOUSE_FILTER_IGNORE
	quest_margin.add_child(quest_overlay_text)
	quest_guide.changed.connect(_refresh_quest_guide)
	_refresh_quest_guide()


func _option(
		parent: VBoxContainer,
		label_text: String,
		values: Array) -> OptionButton:
	var label := Label.new()
	label.text = label_text
	parent.add_child(label)
	var option := OptionButton.new()
	option.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	for value in values:
		option.add_item(str(value))
		option.set_item_metadata(option.item_count - 1, value)
	parent.add_child(option)
	return option


func _add_button(
		parent: VBoxContainer,
		text: String,
		callback: Callable) -> void:
	var button := Button.new()
	button.text = text
	button.pressed.connect(callback)
	parent.add_child(button)


func _resource_option(parent: VBoxContainer) -> OptionButton:
	var label := Label.new()
	label.text = "Resource grant"
	parent.add_child(label)
	var option := OptionButton.new()
	option.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	for ref in resource_refs:
		option.add_item("%s - %s" % [ref["kind"], ref["stable_id"]])
		option.set_item_metadata(option.item_count - 1, ref.duplicate(true))
	parent.add_child(option)
	return option


func _add_button_row(parent: VBoxContainer, definitions: Array) -> void:
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 6)
	parent.add_child(row)
	for definition in definitions:
		var button := Button.new()
		button.text = str(definition[0])
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		button.pressed.connect(definition[1])
		row.add_child(button)


func _position_player_at_lab_center() -> void:
	if settlement_ids.is_empty():
		return
	var a: Vector2i = plot_anchors[settlement_ids[0]]
	var b: Vector2i = plot_anchors[settlement_ids[-1]]
	var center := Vector2i(
		roundi((a.x + b.x) * 0.5),
		roundi((a.y + b.y) * 0.5)) + Vector2i(0, -18)
	_move_player_to(center)
	last_message = "Moved player to the lab overview path."
	_refresh_inspector()


func _travel_to_selected_settlement() -> void:
	if not _focus_selected():
		return
	var anchor: Vector2i = plot_anchors.get(
		_selected_settlement_id(), Vector2i.ZERO)
	_move_player_to(anchor + Vector2i(0, -14))
	_prepare_focused_resident_columns()
	if settlement_ids.find(_selected_settlement_id()) > 0:
		_quest_event("second_settlement_visited")
	hamlet_runtime.refresh_focused_settlement()
	last_message = "Travelled to %s." % _selected_settlement_id()
	_set_interface_open(false)
	_refresh_inspector()


func _move_player_to(horizontal_position: Vector2i) -> void:
	var height := world.surface_height_at(
		horizontal_position.x, horizontal_position.y)
	var target := Vector3(
		float(horizontal_position.x), float(height) + 2.05,
		float(horizontal_position.y))
	world.prepare_player_column(target)
	player.global_position = target
	player.velocity = Vector3.ZERO


func _prepare_focused_resident_columns() -> void:
	## The lab may jump across multiple chunk regions in one frame. Prepare each
	## resident column explicitly so actor promotion still honours the
	## production rule that terrain and collision must exist before an NPC.
	for npc_id in HamletState.get_npc_ids():
		var record := HamletState.get_npc_record(npc_id)
		var saved: Array = record.get("position", [])
		if saved.size() != 3:
			continue
		var x := floori(float(saved[0]))
		var z := floori(float(saved[2]))
		var position := Vector3(
			float(saved[0]),
			float(world.surface_height_at(x, z)) + 1.05,
			float(saved[2]))
		world.prepare_player_column(position)
		HamletState.update_npc_position(npc_id, position)
	# Restore the streamed centre after the resident safety columns have been
	# committed; the production world continues following the real player.
	world.prepare_player_column(player.global_position)


func _set_interface_open(open: bool) -> void:
	if interface_panel == null:
		return
	if open and hud != null and hud.craft_open:
		hud.call("_set_craft_open", false)
	interface_panel.visible = open
	if interface_hint != null:
		interface_hint.visible = not open
	player.controls_locked = open
	Input.mouse_mode = (
		Input.MOUSE_MODE_VISIBLE if open else Input.MOUSE_MODE_CAPTURED)


func lab_player_has_streaming_focus() -> bool:
	return (
		player != null
		and world.player == player
		and player.camera != null
		and player.camera.current)


func _on_settlement_selected(index: int) -> void:
	if index < 0 or index >= settlement_ids.size():
		return
	if not _focus_settlement(settlement_ids[index]):
		last_message = "Could not focus %s." % settlement_ids[index]
		_refresh_inspector()
		return
	_prepare_focused_resident_columns()
	if index > 0:
		_quest_event("second_settlement_visited")
	last_message = "Focused %s." % settlement_ids[index]
	_refresh_inspector()


func _selected_settlement_id() -> String:
	if settlement_ids.is_empty():
		return ""
	return settlement_ids[clampi(
		settlement_select.selected if settlement_select != null else 0,
		0, settlement_ids.size() - 1)]


func _selected_metadata(option: OptionButton) -> String:
	if option == null or option.item_count == 0:
		return ""
	return str(option.get_item_metadata(option.selected))


func _focus_selected() -> bool:
	var settlement_id := _selected_settlement_id()
	return _focus_settlement(settlement_id)


func _focus_settlement(settlement_id: String) -> bool:
	if settlement_id.is_empty():
		return false
	if hamlet_runtime != null and hamlet_runtime.configured:
		return hamlet_runtime.focus_settlement(settlement_id)
	return SettlementManager.focus_settlement(settlement_id)


func _refresh_lab_residents() -> void:
	if hamlet_runtime == null or not hamlet_runtime.configured:
		return
	hamlet_runtime.refresh_focused_settlement()
	if hamlet_runtime.active_actor_count() >= HamletState.get_npc_ids().size():
		_quest_event("residents_spawned")


func _on_player_interaction_requested(
		kind: String,
		_position: Vector3i,
		_subject_id: String) -> void:
	if kind == "npc":
		_quest_event("npc_interacted")


func _on_raid_phase_changed(phase: String) -> void:
	if phase in ["warning", "assault"]:
		_quest_event("raid_started")
	elif phase == "resolved":
		_quest_event("raid_resolved")


func _player_has_resources() -> bool:
	for slots in [Inventory.hotbar, Inventory.backpack]:
		for value in slots:
			if value is Dictionary \
					and not value.is_empty() \
					and int(value.get("count", 0)) > 0:
				return true
	return false


func _quest_event(event_id: String) -> void:
	quest_guide.mark_event(event_id)


func _previous_quest() -> void:
	quest_guide.move(-1)


func _next_quest() -> void:
	quest_guide.move(1)


func _verify_current_quest() -> void:
	var result: Dictionary = quest_guide.complete_current_if_ready()
	last_message = str(result.get("message", "Quest guide did not respond."))
	_refresh_inspector()


func _mark_current_manual_quest() -> void:
	if quest_guide.mark_current_manual_check():
		last_message = "Recorded the current visual/manual inspection."
	else:
		last_message = "This objective has no separate manual inspection."
	_refresh_inspector()


func _reset_quest_guide() -> void:
	quest_guide.reset()
	last_message = "Reset the camp-to-city test quest."
	_refresh_inspector()


func _refresh_quest_guide() -> void:
	if quest_diagnostics == null or quest_overlay_text == null:
		return
	var step: Dictionary = quest_guide.current_step()
	var missing: Array[String] = quest_guide.current_missing_events()
	var missing_text := (
		"Ready to verify."
		if missing.is_empty()
		else "Still required: %s" % ", ".join(missing))
	var text := "%s\n%s\n%s\n%s" % [
		str(step.get("title", "Village progression quest")),
		str(step.get("instruction", "")),
		missing_text,
		quest_guide.progress_text(),
	]
	quest_diagnostics.text = text
	quest_overlay_text.text = "TEST QUEST\n%s" % text


func _on_preset_selected(_index: int) -> void:
	_apply_selected_preset()


func _apply_selected_preset() -> void:
	if not _focus_selected():
		return
	var preset_id := _selected_metadata(preset_select)
	match preset_id:
		"watchtower_compatibility":
			_clear_scenario_visuals(_selected_settlement_id())
			HamletState.runtime_buildings.clear()
			HamletState.runtime_plans.clear()
			_create_project_by_id("project.build.wooden_watchtower")
			last_message = (
				"Loaded the unfinished watchtower compatibility scenario. "
				+ "Use the project controls or creative catalogue to build it.")
			_sync_and_refresh()
			return
		"cottage_growth":
			_load_capability_stage("hamlet")
			_record_scenario_loaded("hamlet")
			_create_project_by_id("project.build.small_cottage")
			last_message = (
				"Loaded a visible hamlet plus an unfinished cottage project.")
			_sync_and_refresh()
			return
		"megaproject_partial_damage_repair":
			_load_capability_stage("magical_metropolis")
			_record_scenario_loaded("magical_metropolis")
			HamletState.runtime_plans.clear()
			_create_plan_by_id("project.megaproject.city_ward_portal_nexus")
			_reserve_available_component()
			_advance_available_component()
			_advance_available_component()
			_damage_first_plan_component()
			last_message = (
				"Loaded a partially active and damaged megaproject preset.")
			_sync_and_refresh()
			return
	_load_capability_stage(preset_id)
	_record_scenario_loaded(preset_id)
	last_message = (
		"Loaded visible %s scenario: %d active buildings, %d plan graphs, "
		+ "%d constructed blueprint landmarks.") % [
			preset_id,
			HamletState.runtime_buildings.size(),
			HamletState.runtime_plans.size(),
			int(scenario_visual_counts.get(_selected_settlement_id(), 0)),
		]
	_sync_and_refresh()


func _record_scenario_loaded(stage_id: String) -> void:
	if stage_id in STAGES:
		_quest_event("scenario.%s" % stage_id)
	if settlement_ids.find(_selected_settlement_id()) > 0:
		_quest_event("second_settlement_scenario")


func _load_capability_stage(target_stage: String) -> void:
	var target_index := STAGES.find(target_stage)
	if target_index < 0:
		return
	var definitions := {}
	for index in range(0, target_index + 1):
		for definition_id in SettlementContentRegistry.get_capability_gate(
				STAGES[index]):
			definitions[definition_id] = true
	var definition_ids: Array[String] = []
	for value in definitions.keys():
		definition_ids.append(str(value))
	definition_ids.sort()
	var settlement_id := _selected_settlement_id()
	var anchor: Vector2i = plot_anchors[settlement_id]
	_clear_scenario_visuals(settlement_id)
	_prepare_scenario_plot(anchor)
	HamletState.runtime_buildings.clear()
	HamletState.runtime_plans.clear()
	var visual_count := 0
	for offset_index in definition_ids.size():
		var definition_id := definition_ids[offset_index]
		var position := _scenario_position(
			anchor, offset_index, definition_ids.size())
		var plan := SettlementContentRegistry.get_plan(str(definition_id))
		if not plan.is_empty():
			var plan_instance_id := "%s.scenario_plan.%08x" % [
				settlement_id,
				WorldStructurePlanner.derive_seed(
					LAB_SEED, "%s:%s" % [settlement_id, definition_id]),
			]
			HamletState.create_plan_instance(
				str(definition_id), plan_instance_id, [], settlement_id)
		if _stamp_scenario_definition(
				settlement_id, str(definition_id), position):
			visual_count += 1
	scenario_visual_counts[settlement_id] = visual_count


func _building_runtime(
		instance_id: String,
		definition_id: String,
		position: Vector2i) -> Dictionary:
	return {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"owner_id": _selected_settlement_id(),
		"condition": 1.0,
		"staffing": 1.0,
		"inputs_available": 1.0,
		"access": 1.0,
		"utilities": 1.0,
		"suitability": 1.0,
		"active": true,
		"position": [
			position.x,
			position.y,
		],
		"buffers": {},
		"history": [],
		"lod_state": simulation_modes.get(
			_selected_settlement_id(), "near"),
	}


func _scenario_position(
		anchor: Vector2i,
		index: int,
		total: int) -> Vector2i:
	var row := floori(float(index) / float(SCENARIO_GRID_COLUMNS))
	var column := index % SCENARIO_GRID_COLUMNS
	var row_start := row * SCENARIO_GRID_COLUMNS
	var row_items := mini(SCENARIO_GRID_COLUMNS, total - row_start)
	var row_count := ceili(float(total) / float(SCENARIO_GRID_COLUMNS))
	var offset_x := roundi(
		(float(column) - float(row_items - 1) * 0.5)
		* SCENARIO_GRID_SPACING)
	var offset_z := roundi(
		(float(row) - float(row_count - 1) * 0.5)
		* SCENARIO_GRID_SPACING)
	return anchor + Vector2i(offset_x, offset_z)


func _prepare_scenario_plot(anchor: Vector2i) -> void:
	var min_chunk := Vector2i(
		world.chunk_coord(anchor.x - SCENARIO_PLOT_RADIUS),
		world.chunk_coord(anchor.y - SCENARIO_PLOT_RADIUS))
	var max_chunk := Vector2i(
		world.chunk_coord(anchor.x + SCENARIO_PLOT_RADIUS),
		world.chunk_coord(anchor.y + SCENARIO_PLOT_RADIUS))
	for chunk_x in range(min_chunk.x, max_chunk.x + 1):
		for chunk_z in range(min_chunk.y, max_chunk.y + 1):
			for chunk_y in VoxelWorld.WORLD_HEIGHT_CHUNKS:
				var chunk_position := Vector3i(chunk_x, chunk_y, chunk_z)
				if not world.chunks.has(chunk_position):
					world.call("_generate_chunk", chunk_position)


func _stamp_scenario_definition(
		settlement_id: String,
		definition_id: String,
		position: Vector2i) -> bool:
	var project := (
		SettlementContentRegistry.get_construction_project_for_definition(
			definition_id))
	if project.is_empty():
		return false
	var result := _create_project_by_id(
		str(project.get("id", "")), false, position, 0)
	if not bool(result.get("ok", false)):
		return false
	var safety := 0
	while not bool(HamletState.project.get("complete", false)) \
			and safety < 20000:
		_grant_exact_supplies()
		if not _advance_one_block():
			break
		safety += 1
	return bool(HamletState.project.get("complete", false))


func _set_scenario_block(
		settlement_id: String,
		position: Vector3i,
		block_id: int) -> void:
	var originals: Dictionary = scenario_original_blocks.get(
		settlement_id, {})
	var key := _scenario_position_key(position)
	if not originals.has(key):
		originals[key] = world.get_block_global(position)
		scenario_original_blocks[settlement_id] = originals
	if world.get_block_global(position) != block_id:
		world.set_block_global(position, block_id)


func _clear_scenario_visuals(settlement_id: String) -> void:
	var originals: Dictionary = scenario_original_blocks.get(
		settlement_id, {})
	var record := SettlementManager.get_settlement(settlement_id)
	for parcel_value in (
			record.get("parcels", {}) as Dictionary).values():
		if parcel_value is Dictionary:
			world.revert_provenance_claim(str(parcel_value.get(
				"claim_id", "")))
	record["parcels"] = {}
	record["surveys"] = {}
	record["work_packages"] = {}
	record["pending_survey"] = {}
	var retained_routes: Array = []
	for route_value in record.get("routes", []):
		if route_value is Dictionary \
				and ".access" in str(route_value.get("route_id", "")):
			continue
		retained_routes.append(route_value)
	record["routes"] = retained_routes
	SettlementManager.settlements[settlement_id] = record
	if originals.is_empty():
		scenario_visual_counts[settlement_id] = 0
		return
	var anchor: Vector2i = plot_anchors.get(settlement_id, Vector2i.ZERO)
	_prepare_scenario_plot(anchor)
	for key in originals:
		var position := _scenario_key_position(str(key))
		world.set_block_global(position, int(originals[key]))
	scenario_original_blocks[settlement_id] = {}
	scenario_visual_counts[settlement_id] = 0


func _clear_all_scenario_visuals() -> void:
	for settlement_id in settlement_ids:
		_clear_scenario_visuals(settlement_id)


func _scenario_position_key(position: Vector3i) -> String:
	return "%d,%d,%d" % [position.x, position.y, position.z]


func _scenario_key_position(key: String) -> Vector3i:
	var values := key.split(",")
	if values.size() != 3:
		return Vector3i.ZERO
	return Vector3i(int(values[0]), int(values[1]), int(values[2]))


func _create_selected_project() -> void:
	if not _focus_selected():
		return
	var result := _create_project_by_id(_selected_metadata(project_select))
	last_message = "Create project: %s" % result
	_sync_and_refresh()


func _create_village_selected_project() -> void:
	if not _focus_selected():
		return
	var project_id := _selected_metadata(project_select)
	var result := SettlementManager.begin_project(
		_selected_settlement_id(), project_id, "village")
	lab_pending_survey = result.get("survey", {}).duplicate(true)
	if bool(result.get("ok", false)):
		_prepare_survey_columns(lab_pending_survey)
		result = SettlementManager.confirm_project_site(
			_selected_settlement_id(), lab_pending_survey)
	if bool(result.get("ok", false)):
		_quest_event("project_created")
		_quest_event("site_survey_valid")
	last_message = "Village-selected project: %s" % result
	_sync_and_refresh()


func _confirm_player_overlap() -> void:
	if not _focus_selected():
		return
	var result := _create_project_by_id(
		_selected_metadata(project_select), true)
	last_message = "Confirmed player-owned overlap: %s" % result
	if bool(result.get("ok", false)):
		_quest_event("player_overlap_confirmed")
	_sync_and_refresh()


func _selected_parcel_position() -> Vector2i:
	var settlement_id := _selected_settlement_id()
	var parcel_id := (
		_selected_metadata(parcel_select)
		if parcel_select != null else "flat")
	return (parcel_anchors.get(settlement_id, {}) as Dictionary).get(
		parcel_id, plot_anchors.get(settlement_id, Vector2i.ZERO))


func _selected_rotation() -> int:
	return int(_selected_metadata(rotation_select)) \
		if rotation_select != null else 0


func _create_project_by_id(
		project_id: String,
		confirmed_player_overlap: bool = false,
		position_override: Variant = null,
		rotation_override: int = -1) -> Dictionary:
	if not (position_override is Vector2i):
		_prepare_selected_parcel_fixture()
	var horizontal := (
		Vector2i(position_override)
		if position_override is Vector2i else _selected_parcel_position())
	var position := Vector3i(
		horizontal.x,
		world.surface_height_at(horizontal.x, horizontal.y),
		horizontal.y)
	var rotation := (
		_selected_rotation() if rotation_override < 0 else rotation_override)
	var result := SettlementManager.begin_project(
		_selected_settlement_id(), project_id, {
			"mode": "player",
			"position": [position.x, position.y, position.z],
			"rotation": rotation,
			"confirmed_player_overlap": confirmed_player_overlap,
		})
	lab_pending_survey = result.get("survey", {}).duplicate(true)
	if not bool(result.get("ok", false)):
		return result
	_quest_event("site_survey_valid")
	_prepare_survey_columns(lab_pending_survey)
	result = SettlementManager.confirm_project_site(
		_selected_settlement_id(), lab_pending_survey)
	if bool(result.get("ok", false)):
		_quest_event("project_created")
	return result


func _prepare_survey_columns(survey: Dictionary) -> void:
	var prepared := {}
	var cells: Array = []
	cells.append_array((survey.get("route_plan", {}) as Dictionary).get(
		"cells", []))
	cells.append_array(survey.get("cut_cells", []))
	cells.append_array(survey.get("fill_cells", []))
	cells.append_array(survey.get("clearance_cells", []))
	for cell_value in cells:
		if not (cell_value is Array) or cell_value.size() < 3:
			continue
		var gx := int(cell_value[0])
		var gz := int(cell_value[2])
		var chunk := Vector2i(world.chunk_coord(gx), world.chunk_coord(gz))
		var key := "%d:%d" % [chunk.x, chunk.y]
		if prepared.has(key):
			continue
		prepared[key] = true
		world.prepare_player_column(Vector3(
			gx, world.surface_height_at(gx, gz) + 2.0, gz))
	# Return streaming focus to the production player after synchronous safety
	# preparation of the selected construction corridor.
	world.prepare_player_column(player.global_position)


func _grant_exact_supplies() -> void:
	if not _focus_selected():
		return
	var stage := HamletState.get_project_stage_definition()
	if stage.is_empty():
		last_message = "No active project stage."
		_refresh_inspector()
		return
	_grant_stage_b_tools()
	var settlement_record := SettlementManager.get_settlement(
		_selected_settlement_id())
	var active_project: Dictionary = HamletState.runtime_projects.get(
		HamletState.active_project_instance_id, {})
	for package_id in active_project.get("work_package_ids", []):
		var package: Dictionary = (
			settlement_record.get("work_packages", {}) as Dictionary).get(
				str(package_id), {})
		if str(package.get("status", "")) == "complete" \
				or not (package.get("reserved", {}) as Dictionary).is_empty():
			continue
		for stable_value in (
			package.get("requirements", {}) as Dictionary):
			var stable_id := str(stable_value)
			_grant_requirement({
				"kind": (
					"item" if ItemRegistry.get_id_by_stable_id(stable_id) >= 0
					else "block"),
				"stable_id": stable_id,
				"count": int(package["requirements"][stable_value]),
			})
	for content_ref in stage.get("requirements", []):
		if not _grant_requirement(content_ref):
			last_message = "Warehouse capacity prevented an exact grant."
			_refresh_inspector()
			return
	var request_id := str(stage.get("request_id", ""))
	if HamletState.requests.has(request_id):
		var request: Dictionary = HamletState.requests[request_id]
		for content_ref in stage.get("requirements", []):
			request["delivered"][str(content_ref["stable_id"])] = int(
				content_ref["count"])
		request["complete"] = true
		HamletState.requests[request_id] = request
	last_message = "Granted the exact requirements for stage %d." % int(
		HamletState.project.get("stage_index", 1))
	_quest_event("warehouse_resource")
	_sync_and_refresh()


func _grant_stage_b_tools() -> void:
	for stable_id in [
		"item.tool.iron_axe",
		"item.tool.iron_pickaxe",
		"item.tool.shovel_iron",
	]:
		var ref := {
			"kind": "item", "stable_id": stable_id, "count": 1,
		}
		if HamletState.warehouse_count_ref(ref) <= 0:
			_grant_requirement(ref)


func _grant_selected_resource() -> void:
	if not _focus_selected() \
			or resource_select == null \
			or resource_select.item_count == 0:
		return
	var ref: Dictionary = resource_select.get_item_metadata(
		resource_select.selected).duplicate(true)
	var granted := _grant_requirement(ref)
	last_message = (
		"Granted %d %s." % [ref["count"], ref["stable_id"]]
		if granted
		else "Warehouse filled; some selected resources were not added.")
	if granted:
		_quest_event("warehouse_resource")
	_sync_and_refresh()


func _grant_requirement(content_ref: Dictionary) -> bool:
	var remaining := maxi(0, int(content_ref.get("count", 0)))
	while remaining > 0:
		var request := content_ref.duplicate(true)
		request["count"] = remaining
		var stack := Inventory._normalise_stack(
			Inventory.make_stack_from_ref(request))
		if stack.is_empty():
			return false
		var added := int(stack.get("count", 0))
		if added <= 0:
			return false
		var leftover := HamletState.warehouse_add_stack(stack)
		if not leftover.is_empty():
			return false
		remaining -= added
	return true


func _reserve_active_stage() -> void:
	if not _focus_selected():
		return
	var ok: bool = HamletState.call("_try_reserve_current_stage")
	last_message = "Stage reservation %s." % ("succeeded" if ok else "was not ready")
	if ok:
		_quest_event("project_reserved")
	_sync_and_refresh()


func _advance_one_block() -> bool:
	if not _focus_selected() \
			or HamletState.active_project_instance_id.is_empty():
		last_message = "Create and confirm a surveyed project first."
		_refresh_inspector()
		return false
	var builder_id := HamletState.get_npc_id_for_job("job.builder.basic")
	if builder_id.is_empty():
		builder_id = HamletState.get_npc_ids()[0]
	var result := {}
	for transition in 4:
		result = SettlementManager.advance_project_work(
			_selected_settlement_id(),
			HamletState.active_project_instance_id,
			builder_id, true)
		if not bool(result.get("ok", false)) \
				or bool(result.get("progress_consumed", false)) \
				or bool(result.get("complete", false)):
			break
	if not bool(result.get("ok", false)):
		last_message = "Work paused without progress: %s" % result
		_refresh_inspector()
		return false
	if bool(result.get("progress_consumed", false)):
		_quest_event("project_block")
	_quest_event("work_task_advanced")
	last_message = "Advanced one conserved construction task: %s" % result
	_sync_and_refresh()
	return true


func _complete_active_stage() -> void:
	var original_stage := int(HamletState.project.get("stage_index", 0))
	var originally_complete := bool(HamletState.project.get("complete", false))
	var safety := 0
	while not bool(HamletState.project.get("complete", false)) \
			and int(HamletState.project.get("stage_index", 0)) == original_stage \
			and safety < 10000:
		if not _advance_one_block():
			break
		safety += 1
	last_message = "Completed stage transaction after %d voxel writes." % safety
	if safety > 0 and (
			bool(HamletState.project.get("complete", false)) != originally_complete
			or int(HamletState.project.get("stage_index", 0)) > original_stage):
		_quest_event("project_stage_completed")
	_sync_and_refresh()


func _complete_active_project() -> void:
	if not _focus_selected():
		return
	var safety := 0
	while not bool(HamletState.project.get("complete", false)) \
			and safety < 32:
		_grant_exact_supplies()
		HamletState.call("_try_reserve_current_stage")
		_complete_active_stage()
		safety += 1
	last_message = "Project completion pass finished after %d stages." % safety
	if bool(HamletState.project.get("complete", false)):
		_quest_event("project_completed")
	_sync_and_refresh()


func _cancel_active_project() -> void:
	if not _focus_selected():
		return
	var result := SettlementManager.cancel_project(
		_selected_settlement_id(),
		HamletState.active_project_instance_id)
	last_message = "Cancel project: %s" % result
	if bool(result.get("ok", false)):
		_quest_event("project_cancelled")
	_sync_and_refresh()


func _damage_first_building() -> void:
	if not _focus_selected() or HamletState.runtime_buildings.is_empty():
		last_message = "No active building to damage."
		_refresh_inspector()
		return
	var ids := HamletState.runtime_buildings.keys()
	ids.sort()
	var result := HamletState.apply_building_damage(
		str(ids[0]), 0.25, "village_progression_lab")
	last_message = "Damage: %s" % result
	if bool(result.get("ok", false)):
		_quest_event("building_damaged")
	_sync_and_refresh()


func _repair_first_building() -> void:
	if not _focus_selected() or HamletState.runtime_buildings.is_empty():
		last_message = "No active building to repair."
		_refresh_inspector()
		return
	var ids := HamletState.runtime_buildings.keys()
	ids.sort()
	var result := HamletState.repair_building(str(ids[0]), 0.25)
	last_message = "Repair: %s" % result
	if bool(result.get("ok", false)):
		_quest_event("building_repaired")
	_sync_and_refresh()


func _toggle_first_building() -> void:
	if not _focus_selected() or HamletState.runtime_buildings.is_empty():
		last_message = "No building is available to activate or deactivate."
		_refresh_inspector()
		return
	var ids := HamletState.runtime_buildings.keys()
	ids.sort()
	var instance_id := str(ids[0])
	var building: Dictionary = HamletState.runtime_buildings[instance_id]
	building["active"] = not bool(building.get("active", true))
	var history: Array = building.get("history", [])
	history.append({
		"event": (
			"lab_activated" if bool(building["active"])
			else "lab_deactivated"),
		"minute": HamletState.clock_minutes,
	})
	building["history"] = history
	HamletState.runtime_buildings[instance_id] = building
	last_message = "%s is now %s." % [
		instance_id, "active" if building["active"] else "inactive"]
	_quest_event("building_toggled")
	_sync_and_refresh()


func _create_selected_plan() -> void:
	if not _focus_selected():
		return
	var result := _create_plan_by_id(_selected_metadata(plan_select))
	last_message = "Create plan: %s" % result
	_sync_and_refresh()


func _create_plan_by_id(plan_id: String) -> Dictionary:
	var instance_id := "%s.plan.%08x" % [
		_selected_settlement_id(),
		WorldStructurePlanner.derive_seed(
			LAB_SEED, "%s:%d" % [plan_id, Time.get_ticks_msec()]),
	]
	var result := HamletState.create_plan_instance(
		plan_id, instance_id, [], _selected_settlement_id())
	if bool(result.get("ok", false)):
		_quest_event("plan_created")
	return result


func _first_available_plan_component() -> Dictionary:
	if HamletState.runtime_plans.is_empty():
		return {}
	var plan_ids_value := HamletState.runtime_plans.keys()
	plan_ids_value.sort()
	var instance_id := str(plan_ids_value[0])
	var runtime: Dictionary = HamletState.runtime_plans[instance_id]
	var available := SettlementPlanEngine.available_components(runtime)
	if available.is_empty():
		return {}
	return {
		"instance_id": instance_id,
		"component_id": available[0],
	}


func _reserve_available_component() -> void:
	if not _focus_selected():
		return
	var target := _first_available_plan_component()
	if target.is_empty():
		last_message = "No available plan component."
		_refresh_inspector()
		return
	var runtime: Dictionary = HamletState.runtime_plans[target["instance_id"]]
	var plan := SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", "")))
	for component in plan.get("components", []):
		if str(component.get("id", "")) != str(target["component_id"]):
			continue
		for requirement in component.get("requirements", []):
			if not _grant_requirement(requirement):
				last_message = "Warehouse capacity prevented a component grant."
				_refresh_inspector()
				return
		break
	var result := HamletState.reserve_plan_component(
		str(target["instance_id"]), str(target["component_id"]))
	last_message = "Reserve component: %s" % result
	if bool(result.get("ok", false)):
		_quest_event("plan_reserved")
	_sync_and_refresh()


func _advance_available_component() -> void:
	if not _focus_selected():
		return
	var target := _first_building_plan_component()
	if target.is_empty():
		last_message = "No building plan component."
		_refresh_inspector()
		return
	var advanced := HamletState.advance_plan_component(
		str(target["instance_id"]), str(target["component_id"]), 0.25)
	last_message = "Advanced plan component by 25%."
	if advanced:
		_quest_event("plan_advanced")
	_sync_and_refresh()


func _first_building_plan_component() -> Dictionary:
	for instance_id in HamletState.runtime_plans:
		var runtime: Dictionary = HamletState.runtime_plans[instance_id]
		for component_id in runtime.get("component_records", {}):
			if str(runtime["component_records"][component_id].get(
					"status", "")) == "building":
				return {
					"instance_id": str(instance_id),
					"component_id": str(component_id),
				}
	return {}


func _first_plan_component() -> Dictionary:
	var building := _first_building_plan_component()
	if not building.is_empty():
		return building
	for instance_id in HamletState.runtime_plans:
		var runtime: Dictionary = HamletState.runtime_plans[instance_id]
		var component_ids: Array = (
			runtime.get("component_records", {}) as Dictionary).keys()
		component_ids.sort()
		if not component_ids.is_empty():
			return {
				"instance_id": str(instance_id),
				"component_id": str(component_ids[0]),
			}
	return {}


func _damage_first_plan_component() -> void:
	if not _focus_selected():
		return
	var target := _first_plan_component()
	if target.is_empty():
		last_message = "No plan component is available to damage."
	else:
		var damaged := HamletState.damage_plan_component(
			target["instance_id"], target["component_id"], 0.25)
		last_message = "Damaged %s by 25%%." % target["component_id"]
		if damaged:
			_quest_event("plan_damaged")
	_sync_and_refresh()


func _repair_first_plan_component() -> void:
	if not _focus_selected():
		return
	var target := _first_plan_component()
	if target.is_empty():
		last_message = "No plan component is available to repair."
	else:
		var repaired := HamletState.restore_plan_component(
			target["instance_id"], target["component_id"], 0.25)
		last_message = "Repaired %s by 25%%." % target["component_id"]
		if repaired:
			_quest_event("plan_repaired")
	_sync_and_refresh()


func _toggle_simulation_mode() -> void:
	var settlement_id := _selected_settlement_id()
	var current := str(simulation_modes.get(settlement_id, "near"))
	simulation_modes[settlement_id] = "far" if current == "near" else "near"
	last_message = "Simulation mode is now %s." % simulation_modes[settlement_id]
	_refresh_inspector()


func _deposit_worker_outputs() -> void:
	if not _focus_selected():
		return
	var builder_id := HamletState.get_npc_id_for_job("job.builder.basic")
	if builder_id.is_empty() and not HamletState.get_npc_ids().is_empty():
		builder_id = HamletState.get_npc_ids()[0]
	var result := SettlementManager.deposit_resident_outputs(
		_selected_settlement_id(), builder_id, true)
	last_message = "Worker output deposit: %s" % result
	if bool(result.get("deposited", false)):
		_quest_event("excavation_drop_deposited")
	_sync_and_refresh()


func _force_migration() -> void:
	_force_population_action("migration", "migration_forced")


func _force_household() -> void:
	_force_population_action("form_household", "household_formed")


func _force_birth() -> void:
	_force_population_action("birth", "birth_completed")


func _force_age() -> void:
	_force_population_action("age", "child_aged")


func _force_population_action(action: String, event_id: String) -> void:
	if not _focus_selected():
		return
	var result := SettlementManager.evaluate_population_day(
		_selected_settlement_id(), action)
	last_message = "Population %s: %s" % [action, result]
	if bool(result.get("ok", false)):
		_quest_event(event_id)
		_prepare_focused_resident_columns()
		hamlet_runtime.refresh_focused_settlement()
	_sync_and_refresh()


func _promote_stage() -> void:
	if not _focus_selected():
		return
	var result := SettlementManager.promote_stage_if_eligible(
		_selected_settlement_id())
	last_message = "Stage promotion: %s" % result
	if bool(result.get("ok", false)):
		_quest_event("stage_promoted")
	_sync_and_refresh()


func _evict_first_resident() -> void:
	if not _focus_selected() or HamletState.get_npc_ids().is_empty():
		return
	var resident_id := HamletState.get_npc_ids()[0]
	HamletState.update_resident_runtime(resident_id, {
		"displaced": true,
	})
	last_message = "Marked %s displaced; housing growth must now pause." % (
		resident_id)
	_quest_event("resident_evicted")
	_sync_and_refresh()


func _rehouse_first_displaced() -> void:
	if not _focus_selected():
		return
	var target_id := ""
	for resident_id in HamletState.get_npc_ids():
		if bool(HamletState.get_npc_record(resident_id).get(
				"displaced", false)):
			target_id = resident_id
			break
	if target_id.is_empty():
		last_message = "No displaced resident needs housing."
		_refresh_inspector()
		return
	var record := SettlementManager.get_settlement(
		_selected_settlement_id())
	var used := {}
	for resident_id in HamletState.get_npc_ids():
		if resident_id == target_id:
			continue
		used[str(HamletState.get_npc_record(resident_id).get(
			"bed_id", ""))] = true
	var bed_ids: Array = (
		record.get("bed_slots", {}) as Dictionary).keys()
	bed_ids.sort()
	for bed_value in bed_ids:
		var bed_id := str(bed_value)
		var bed: Dictionary = record["bed_slots"][bed_value]
		if used.has(bed_id) or not bool(bed.get("safe", false)) \
				or not bool(bed.get("reachable", false)):
			continue
		HamletState.update_resident_runtime(target_id, {
			"displaced": false,
			"bed_id": bed_id,
			"residence_id": str(bed.get("residence_id", "")),
		})
		last_message = "Re-housed %s in %s." % [target_id, bed_id]
		_quest_event("resident_rehoused")
		_sync_and_refresh()
		return
	last_message = "No reachable safe bed is available."
	_refresh_inspector()


func _simulate_hour() -> void:
	if not _focus_selected():
		return
	var buildings: Array = []
	for value in HamletState.runtime_buildings.values():
		if value is Dictionary:
			buildings.append(value)
	var mode := str(simulation_modes.get(
		_selected_settlement_id(), "near"))
	last_simulation = SettlementSimulationEngine.simulate(
		buildings, {}, 60.0, mode)
	var rebuilt := {}
	for building in last_simulation.get("buildings", []):
		rebuilt[str(building.get("instance_id", ""))] = building
	HamletState.runtime_buildings = rebuilt
	last_message = "Simulated 60 minutes in %s mode (%d transactions)." % [
		mode, (last_simulation.get("transactions", []) as Array).size()]
	_quest_event("simulation.%s" % mode)
	_sync_and_refresh()


func _save_snapshot() -> bool:
	_sync_selected()
	var quest_state: Dictionary = quest_guide.serialize_state()
	var snapshot_events: Dictionary = quest_state.get("events", {})
	snapshot_events["snapshot_saved"] = true
	quest_state["events"] = snapshot_events
	var data := {
		"version": 3,
		"written_unix": int(Time.get_unix_time_from_system()),
		"settlements": SettlementManager.serialize_state(),
		"simulation_modes": simulation_modes.duplicate(true),
		"world_edits": world.serialize_edits(),
		"edit_provenance": world.serialize_edit_provenance(),
		"block_entities": world.serialize_block_entities(),
		"scenario_original_blocks": scenario_original_blocks.duplicate(true),
		"scenario_visual_counts": scenario_visual_counts.duplicate(true),
		"quest_guide": quest_state,
	}
	var directory := ProjectSettings.globalize_path(SNAPSHOT_ROOT)
	DirAccess.make_dir_recursive_absolute(directory)
	var file := FileAccess.open(SNAPSHOT_TEMP, FileAccess.WRITE)
	if file == null:
		last_message = "Could not open the lab snapshot temporary file."
		_refresh_inspector()
		return false
	file.store_string(JSON.stringify(data))
	file.flush()
	file.close()
	var temp := ProjectSettings.globalize_path(SNAPSHOT_TEMP)
	var final := ProjectSettings.globalize_path(SNAPSHOT_FINAL)
	var backup := ProjectSettings.globalize_path(SNAPSHOT_BACKUP)
	if FileAccess.file_exists(SNAPSHOT_BACKUP):
		DirAccess.remove_absolute(backup)
	if FileAccess.file_exists(SNAPSHOT_FINAL):
		if DirAccess.rename_absolute(final, backup) != OK:
			last_message = "Could not rotate the previous lab snapshot."
			_refresh_inspector()
			return false
	if DirAccess.rename_absolute(temp, final) != OK:
		if FileAccess.file_exists(SNAPSHOT_BACKUP):
			DirAccess.rename_absolute(backup, final)
		last_message = "Could not commit the lab snapshot."
		_refresh_inspector()
		return false
	else:
		last_message = "Saved isolated lab snapshot."
		_quest_event("snapshot_saved")
	_refresh_inspector()
	return true


func _load_snapshot() -> void:
	var source := SNAPSHOT_FINAL if FileAccess.file_exists(
		SNAPSHOT_FINAL) else SNAPSHOT_BACKUP
	if not FileAccess.file_exists(source):
		last_message = "No lab snapshot exists."
		_refresh_inspector()
		return
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(source))
	if not (parsed is Dictionary):
		last_message = "Lab snapshot JSON is invalid."
		_refresh_inspector()
		return
	var data: Dictionary = parsed
	if not SettlementManager.restore_state(
			data.get("settlements", {}), LAB_SEED):
		last_message = "Lab settlement snapshot is incompatible."
		_refresh_inspector()
		return
	simulation_modes = data.get("simulation_modes", {}).duplicate(true)
	world.apply_edits(data.get("world_edits", {}))
	world.apply_edit_provenance(data.get("edit_provenance", {}))
	world.apply_block_entities(data.get("block_entities", {}))
	scenario_original_blocks = data.get(
		"scenario_original_blocks", {}).duplicate(true)
	scenario_visual_counts = data.get(
		"scenario_visual_counts", {}).duplicate(true)
	quest_guide.restore_state(data.get("quest_guide", {}))
	_quest_event("snapshot_reloaded")
	if hamlet_runtime != null and hamlet_runtime.configured:
		_prepare_focused_resident_columns()
		hamlet_runtime.refresh_focused_settlement()
	last_message = "Reloaded isolated lab snapshot."
	_refresh_inspector()


func _reset_lab() -> void:
	_clear_all_scenario_visuals()
	_build_lab_state()
	_prepare_plot_columns()
	_prepare_stage_b_parcels()
	if settlement_select != null:
		settlement_select.select(0)
	if preset_select != null:
		preset_select.select(PRESETS.find("camp"))
	last_simulation.clear()
	quest_guide.reset()
	_record_scenario_loaded("camp")
	_travel_to_selected_settlement()
	last_message = "Reset both lab settlements to fresh Stage B camps."
	_refresh_inspector()


func _sync_selected() -> void:
	SettlementManager.get_settlement(_selected_settlement_id())


func _sync_and_refresh() -> void:
	_sync_selected()
	_refresh_inspector()


func _refresh_inspector() -> void:
	if inspector == null or status_label == null:
		return
	var settlement_id := _selected_settlement_id()
	var record := SettlementManager.get_settlement(settlement_id)
	var capability: Dictionary = SettlementSimulationEngine.capability_stage(
		HamletState.runtime_buildings.values()) \
		if HamletState.active_village_id == settlement_id else record.get(
			"capability", {})
	var services: Dictionary = SettlementSimulationEngine.service_snapshot(
		HamletState.runtime_buildings.values()) \
		if HamletState.active_village_id == settlement_id else {}
	var population := SettlementManager.get_population_report(settlement_id)
	var proposals := SettlementManager.get_project_proposals(settlement_id)
	status_label.text = last_message
	var lines: Array[String] = [
		"[b]Settlement[/b] %s" % settlement_id,
		"Site: %s" % record.get("site_id", ""),
		"Mode: %s" % simulation_modes.get(settlement_id, "near"),
		"Capability: %s" % capability.get("stage", "camp"),
		"Active nearby resident actors: %d" % (
			hamlet_runtime.active_actor_count()),
		"NPCs: %d · Warehouse slots: %d" % [
			HamletState.npc_records.size(), HamletState.warehouse_slots.size()],
		"Buildings: %d · Projects: %d · Plans: %d" % [
			HamletState.runtime_buildings.size(),
			HamletState.runtime_projects.size(),
			HamletState.runtime_plans.size()],
		"Visible scenario blueprints: %d" % int(
			scenario_visual_counts.get(settlement_id, 0)),
		"Capability gate definitions: %s" % JSON.stringify(
			SettlementContentRegistry.get_capability_gate(
				str(capability.get("stage", "camp")))),
		"",
		"[b]Active project[/b]",
		JSON.stringify(HamletState.project, "  "),
		"",
		"[b]Needs and service coverage[/b]",
		JSON.stringify(services, "  "),
		"",
		"[b]Population / housing / jobs / promotion blockers[/b]",
		JSON.stringify(population, "  "),
		"",
		"[b]Survey / parcels / routes / cut-fill / work packages[/b]",
		JSON.stringify({
			"pending_survey": lab_pending_survey,
			"parcels": record.get("parcels", {}),
			"surveys": record.get("surveys", {}),
			"routes": record.get("routes", []),
			"work_packages": record.get("work_packages", {}),
		}, "  "),
		"",
		"[b]Top project and plan proposals / exact blockers[/b]",
		JSON.stringify(
			proposals.slice(0, mini(20, proposals.size())), "  "),
		"",
		"[b]Residents / jobs / individual needs[/b]",
		JSON.stringify(HamletState.npc_records, "  "),
		"",
		"[b]Warehouse / reservations[/b]",
		JSON.stringify(HamletState.warehouse_slots, "  "),
		"",
		"[b]Buildings / activation / damage / history[/b]",
		JSON.stringify(HamletState.runtime_buildings, "  "),
		"",
		"[b]Plan graphs / prerequisites / reservations / history[/b]",
		JSON.stringify(HamletState.runtime_plans, "  "),
	]
	if not last_simulation.is_empty():
		lines.append("")
		lines.append("[b]Last simulation[/b]")
		lines.append(JSON.stringify(last_simulation, "  "))
	inspector.text = "\n".join(lines)


func lab_snapshot_path() -> String:
	return SNAPSHOT_FINAL


func lab_settlement_count() -> int:
	return settlement_ids.size()


func lab_active_resident_count() -> int:
	return hamlet_runtime.active_actor_count() if hamlet_runtime != null else 0


func lab_quest_count() -> int:
	return quest_guide.STEPS.size()


func lab_quest_current_id() -> String:
	return str(quest_guide.current_step().get("id", ""))


func lab_quest_event(event_id: String) -> void:
	_quest_event(event_id)


func lab_quest_state() -> Dictionary:
	return quest_guide.serialize_state()
