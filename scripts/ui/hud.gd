class_name Hud
extends CanvasLayer
## Contextual inventory, Minecraft-style crafting, furnace, and chest UI.

const HOTBAR_SLOTS := 9
const INVALID_TARGET := Vector3i(0, -100000, 0)
const StackIconRendererScript = preload("res://scripts/ui/stack_icon_renderer.gd")
const LocalMapViewScript = preload("res://scripts/ui/local_map_view.gd")
const EXTERNAL_SLOT_GROUPS: Array[String] = [
	"chest", "warehouse", "furnace_input", "furnace_fuel", "furnace_output",
]

var player: Player
var raid_runtime: Node
var session: Node
var craft_open := false
var craft_mode := "hand"
var station_position := INVALID_TARGET
var interaction_subject_id := ""
var _icon_renderer := StackIconRendererScript.new()

var _item_hotbar_bar: HBoxContainer
var _ability_hotbar_bar: HBoxContainer
var _hotbar_buttons: Array[InventorySlotButton] = []
var _backpack_buttons: Array[InventorySlotButton] = []
var _craft_buttons: Array[InventorySlotButton] = []
var _chest_buttons: Array[InventorySlotButton] = []
var _warehouse_buttons: Array[InventorySlotButton] = []
var _craft_panel: PanelContainer
var _craft_title: Label
var _left_content: VBoxContainer
var _backpack_box: VBoxContainer
var _crafting_area: VBoxContainer
var _craft_grid: GridContainer
var _craft_output_button: Button
var _craft_result_label: Label
var _craft_batch_quantity: SpinBox
var _craft_batch_button: Button
var _recipe_knowledge_label: Label
var _chest_area: VBoxContainer
var _chest_grid: GridContainer
var _warehouse_area: VBoxContainer
var _warehouse_grid: GridContainer
var _warehouse_permission_label: Label
var _automation_area: VBoxContainer
var _automation_status_label: Label
var _automation_details_label: Label
var _automation_action_button: Button
var _automation_ledger_label: Label
var _automation_overlay_button: Button
var _flow_overlay_label: Label
var _automation_overlay_enabled := false
var _magic_area: VBoxContainer
var _magic_status_label: Label
var _magic_details_label: Label
var _magic_action_button: Button
var _abilities_area: VBoxContainer
var _ability_hud_buttons: Array[Button] = []
var _ability_slot_buttons: Array[Button] = []
var _known_ability_buttons: Dictionary = {}
var _selected_ability_slot := 0
var _request_area: VBoxContainer
var _request_reputation_label: Label
var _request_project_label: Label
var _request_buttons: Dictionary = {}
var _dialogue_area: VBoxContainer
var _dialogue_title: Label
var _dialogue_text: Label
var _dialogue_action: Button
var _raid_action: Button
var _creative_area: VBoxContainer
var _creative_search: LineEdit
var _creative_list: ItemList
var _creative_amount: SpinBox
var _creative_selection_label: Label
var _creative_trash_button: InventorySlotButton
var _creative_entries: Array[Dictionary] = []
var _creative_selected: Dictionary = {}
var _furnace_row: HBoxContainer
var _furnace_input_buttons: Array[InventorySlotButton] = []
var _furnace_fuel_button: InventorySlotButton
var _furnace_output_button: InventorySlotButton
var _furnace_progress: Label
var _status_label: Label
var _magic_hud_label: Label
var _health_hearts: Label
var _mana_pips: Label
var _context_label: Label
var _status_accum := 0.0
var _context_seconds := 0.0
var _discovery_accum := 0.0
var _objective_panel: PanelContainer
var _objective_title: Label
var _objective_text: Label
var _target_status_label: Label
var _save_status_label: Label
var _hud_hint_label: Label
var _nav_row: HBoxContainer
var _guide_area: VBoxContainer
var _guide_title: Label
var _guide_instruction: Label
var _guide_cause: Label
var _inventory_area: VBoxContainer
var _inventory_search: LineEdit
var _inventory_list: ItemList
var _inventory_details: Label
var _village_area: VBoxContainer
var _village_summary: Label
var _village_project: Label
var _village_history: Label
var _map_area: VBoxContainer
var _map_view: LocalMapView
var _map_summary: Label
var _raid_area: VBoxContainer
var _raid_summary: Label
var _raid_details: Label
var _raid_repair_button: Button
var _pause_area: VBoxContainer
var _pause_status: Label
var _settings_area: VBoxContainer
var _settings_summary: Label
var _controls_scroll: ScrollContainer
var _controls_area: VBoxContainer
var _binding_buttons: Dictionary = {}
var _rebind_action := ""
var _rebind_button: Button
var _help_area: VBoxContainer
var _help_list: ItemList
var _help_text: Label


func _ready() -> void:
	_build_ui()
	Inventory.inventory_changed.connect(_refresh_all)
	Inventory.craft_grid_changed.connect(_refresh_all)
	Inventory.selected_slot_changed.connect(func(_i: int) -> void: _refresh_all())
	ProgressionState.progression_changed.connect(_refresh_all)
	HamletState.warehouse_changed.connect(_refresh_all)
	HamletState.requests_changed.connect(_refresh_all)
	HamletState.reputation_changed.connect(_refresh_all)
	HamletState.project_changed.connect(_refresh_all)
	HamletState.delivery_ledger_changed.connect(_refresh_all)
	HamletState.npc_changed.connect(func(_npc_id: String) -> void: _refresh_all())
	MagicState.magic_changed.connect(_refresh_all)
	CombatState.state_changed.connect(_refresh_all)
	UIState.settings_changed.connect(_apply_ui_settings)
	UIState.learning_changed.connect(_refresh_stage8)
	UIState.map_changed.connect(_refresh_map)
	UIState.bindings_changed.connect(_refresh_bindings)
	_refresh_all()
	_apply_ui_settings()


func _process(delta: float) -> void:
	_status_accum += delta
	_context_seconds = maxf(0.0, _context_seconds - delta)
	_discovery_accum += delta
	if _context_seconds <= 0.0 and _context_label != null:
		_context_label.text = ""
	if player != null:
		if not player.interaction_message.is_connected(_show_context):
			player.interaction_message.connect(_show_context)
		if not player.interaction_requested.is_connected(_on_interaction_requested):
			player.interaction_requested.connect(_on_interaction_requested)
		if _discovery_accum >= 0.5 and player.world != null:
			_discovery_accum = 0.0
			UIState.update_world_discovery(
				player.global_position, player.world.get_valley_anchors())
	if _status_accum < 0.25:
		return
	_status_accum = 0.0
	_update_status()
	_refresh_vitals_and_abilities()
	_refresh_objective()
	_refresh_combat_status()
	if craft_open and craft_mode in ["furnace", "mana_furnace"]:
		_refresh_furnace()
	elif craft_open and craft_mode == "automation":
		_refresh_automation()
	elif craft_open and craft_mode == "magic":
		_refresh_magic()


func _update_status() -> void:
	if _status_label == null or player == null or player.world == null:
		return
	var pos := player.global_position
	var nearest := player.world.nearest_valley_anchor(pos)
	var landmark := "Unplanned wilderness"
	if not nearest.is_empty():
		landmark = "%s %dm" % [
			str(nearest["id"]).replace("_", " ").capitalize(),
			roundi(float(nearest["distance"])),
		]
	_status_label.text = "%s  ·  %s  ·  %s" % [
		player.world.biome_name_at(pos.x, pos.z), landmark,
		HamletState.get_clock_text(),
	]
	_magic_hud_label.text = CombatState.status_text()
	if ProgressionState.has_basic_magic_knowledge():
		_magic_hud_label.text += "  ·  Mana %d/%d" % [
			roundi(MagicState.mana), roundi(MagicState.MAX_MANA)]


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if craft_open:
			_set_craft_open(false)
		else:
			_open_mode("pause", INVALID_TARGET)
		return
	if event.is_action_pressed("toggle_inventory"):
		_toggle_global_mode("inventory")
		return
	if event.is_action_pressed("toggle_guide"):
		_toggle_global_mode("guide")
		return
	if event.is_action_pressed("toggle_map"):
		_toggle_global_mode("map")
		return
	if event.is_action_pressed("toggle_village"):
		_toggle_global_mode("village")
		return
	if event.is_action_pressed("hotbar_previous") and not craft_open:
		if MagicState.action_bar_active:
			MagicState.cycle_ability_slot(-1)
		else:
			Inventory.cycle_slot(-1)
		return
	if event.is_action_pressed("hotbar_next") and not craft_open:
		if MagicState.action_bar_active:
			MagicState.cycle_ability_slot(1)
		else:
			Inventory.cycle_slot(1)
		return
	if event.is_action_pressed("toggle_creative"):
		if craft_open and craft_mode == "creative":
			_set_craft_open(false)
		else:
			_open_mode("creative", INVALID_TARGET)
		return
	if event.is_action_pressed("toggle_action_bar") and not craft_open:
		MagicState.toggle_action_bar()
		_show_context(
			"Skill bar active: 1-9 selects, LMB uses the skill."
			if MagicState.action_bar_active
			else "Item bar active: LMB attacks or mines.")
		return
	if event.is_action_pressed("toggle_abilities"):
		if craft_open and craft_mode == "abilities":
			_set_craft_open(false)
		else:
			_open_mode("abilities", INVALID_TARGET)
		return
	if event.is_action_pressed("toggle_craft"):
		if craft_open:
			_set_craft_open(false)
		else:
			_open_mode("hand", INVALID_TARGET)
		return
	for i in HOTBAR_SLOTS:
		if event.is_action_pressed("hotbar_%d" % (i + 1)):
			if MagicState.action_bar_active:
				MagicState.select_ability_slot(i)
			else:
				Inventory.select_slot(i)
			return
	if event is InputEventMouseButton and event.pressed and not craft_open:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if MagicState.action_bar_active:
				MagicState.cycle_ability_slot(-1)
			else:
				Inventory.cycle_slot(-1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if MagicState.action_bar_active:
				MagicState.cycle_ability_slot(1)
			else:
				Inventory.cycle_slot(1)


func _input(event: InputEvent) -> void:
	if _rebind_action.is_empty() or not craft_open:
		return
	if event is InputEventMouseMotion or event.is_echo():
		return
	var pressed := true
	if event is InputEventKey or event is InputEventMouseButton \
			or event is InputEventJoypadButton:
		pressed = event.is_pressed()
	elif event is InputEventJoypadMotion:
		pressed = absf(event.axis_value) >= 0.75
	else:
		return
	if not pressed:
		return
	if event.is_action_pressed("ui_cancel"):
		_cancel_rebind()
		get_viewport().set_input_as_handled()
		return
	if UIState.rebind_action(_rebind_action, event):
		_show_context("%s rebound to %s." % [
			UIState.action_label(_rebind_action), event.as_text()])
	_cancel_rebind()
	get_viewport().set_input_as_handled()


func _toggle_global_mode(mode: String) -> void:
	if craft_open and craft_mode == mode:
		_set_craft_open(false)
	else:
		_open_mode(mode, INVALID_TARGET)


func _on_interaction_requested(kind: String, position: Vector3i, subject_id: String) -> void:
	interaction_subject_id = subject_id
	if kind in [
		"workbench", "furnace", "mana_furnace", "rune_table", "chest",
		"warehouse", "request_board", "npc", "automation", "magic",
	]:
		_open_mode(kind, position)


func _open_mode(mode: String, position: Vector3i) -> void:
	craft_mode = mode
	station_position = position
	if mode in ["workbench", "rune_table"]:
		Inventory.set_crafting_station(mode)
		ProgressionState.discover_station(
			"functional.workbench.basic"
			if mode == "workbench" else "magic.rune_table.basic")
	elif mode in ["furnace", "mana_furnace"]:
		ProgressionState.discover_station(
			"functional.furnace.stone"
			if mode == "furnace" else "magic.furnace.mana")
	else:
		Inventory.set_crafting_station("hand")
	if mode == "npc":
		var record := HamletState.get_npc_record(interaction_subject_id)
		if str(record.get("job_id", "")) == "job.mage.apprentice" \
				and HamletState.reputation_state != HamletState.REP_STRANGER:
			MagicState.unlock_poc_magic("npc.village_mage.forest")
	_set_craft_open(true)


func _set_craft_open(open: bool) -> void:
	craft_open = open
	_craft_panel.visible = open
	if player != null:
		player.controls_locked = open
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if open else Input.MOUSE_MODE_CAPTURED
	if not open and craft_mode in ["workbench", "rune_table"]:
		Inventory.set_crafting_station("hand")
	if open:
		_refresh_all()
		UIState.mark_hint_complete("screen.%s" % craft_mode)
		call_deferred("_focus_first_control")
	else:
		_cancel_rebind()


# ---------- UI construction ----------

func _build_ui() -> void:
	var crosshair := CenterContainer.new()
	crosshair.set_anchors_preset(Control.PRESET_FULL_RECT)
	var dot := Label.new()
	dot.text = "+"
	dot.add_theme_font_size_override("font_size", 24)
	dot.add_theme_color_override("font_color", Color(1, 1, 1, 0.85))
	crosshair.add_child(dot)
	add_child(crosshair)

	_item_hotbar_bar = HBoxContainer.new()
	_item_hotbar_bar.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	_item_hotbar_bar.position = Vector2(-(HOTBAR_SLOTS * 60) / 2.0, -76)
	_item_hotbar_bar.add_theme_constant_override("separation", 4)
	for i in HOTBAR_SLOTS:
		var button := InventorySlotButton.new()
		button.setup(self, "hotbar", i)
		button.custom_minimum_size = Vector2(56, 56)
		button.focus_mode = Control.FOCUS_NONE
		button.pressed.connect(_on_hotbar_pressed.bind(i))
		_item_hotbar_bar.add_child(button)
		_hotbar_buttons.append(button)
	add_child(_item_hotbar_bar)

	_ability_hotbar_bar = HBoxContainer.new()
	_ability_hotbar_bar.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	_ability_hotbar_bar.position = Vector2(
		-(MagicState.ABILITY_SLOT_COUNT * 60) / 2.0, -76)
	_ability_hotbar_bar.add_theme_constant_override("separation", 4)
	for i in MagicState.ABILITY_SLOT_COUNT:
		var ability_button := Button.new()
		ability_button.custom_minimum_size = Vector2(56, 56)
		ability_button.focus_mode = Control.FOCUS_NONE
		ability_button.toggle_mode = true
		ability_button.add_theme_font_size_override("font_size", 11)
		var skill_normal := StyleBoxFlat.new()
		skill_normal.bg_color = Color(0.035, 0.055, 0.07, 0.82)
		skill_normal.border_color = Color(0.42, 0.50, 0.54, 0.82)
		skill_normal.set_border_width_all(2)
		var skill_selected := StyleBoxFlat.new()
		skill_selected.bg_color = Color(0.07, 0.10, 0.12, 0.94)
		skill_selected.border_color = Color(1.0, 0.78, 0.08)
		skill_selected.set_border_width_all(3)
		ability_button.add_theme_stylebox_override("normal", skill_normal)
		ability_button.add_theme_stylebox_override("hover", skill_normal)
		ability_button.add_theme_stylebox_override("pressed", skill_selected)
		ability_button.pressed.connect(_on_ability_hud_pressed.bind(i))
		_ability_hotbar_bar.add_child(ability_button)
		_ability_hud_buttons.append(ability_button)
	add_child(_ability_hotbar_bar)

	var vitals := HBoxContainer.new()
	vitals.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	vitals.position = Vector2(-244, -112)
	vitals.custom_minimum_size = Vector2(488, 28)
	vitals.add_theme_constant_override("separation", 12)
	_health_hearts = Label.new()
	_health_hearts.custom_minimum_size = Vector2(230, 24)
	_health_hearts.add_theme_font_size_override("font_size", 20)
	_health_hearts.add_theme_color_override(
		"font_color", Color(0.94, 0.16, 0.18))
	vitals.add_child(_health_hearts)
	_mana_pips = Label.new()
	_mana_pips.custom_minimum_size = Vector2(230, 24)
	_mana_pips.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_mana_pips.add_theme_font_size_override("font_size", 20)
	_mana_pips.add_theme_color_override(
		"font_color", Color(0.28, 0.62, 1.0))
	vitals.add_child(_mana_pips)
	add_child(vitals)

	_hud_hint_label = Label.new()
	_hud_hint_label.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	_hud_hint_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_hud_hint_label.position = Vector2(0, -18)
	_hud_hint_label.add_theme_color_override("font_color", Color(1, 1, 1, 0.72))
	_hud_hint_label.add_theme_font_size_override("font_size", 12)
	add_child(_hud_hint_label)

	_status_label = Label.new()
	_status_label.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_status_label.position = Vector2(10, 8)
	_status_label.add_theme_color_override("font_color", Color(1, 1, 1, 0.78))
	_status_label.add_theme_font_size_override("font_size", 13)
	add_child(_status_label)

	_magic_hud_label = Label.new()
	_magic_hud_label.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_magic_hud_label.position = Vector2(10, 28)
	_magic_hud_label.add_theme_color_override(
		"font_color", Color(0.62, 0.82, 1.0, 0.86))
	_magic_hud_label.add_theme_font_size_override("font_size", 13)
	add_child(_magic_hud_label)

	_context_label = Label.new()
	_context_label.set_anchors_preset(Control.PRESET_TOP_WIDE)
	_context_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_context_label.position = Vector2(0, 34)
	_context_label.add_theme_color_override("font_color", Color(1, 0.87, 0.45))
	add_child(_context_label)
	_build_stage8_hud()

	_craft_panel = PanelContainer.new()
	_craft_panel.set_anchors_preset(Control.PRESET_CENTER)
	_craft_panel.position = Vector2(-390, -285)
	_craft_panel.custom_minimum_size = Vector2(780, 545)
	_craft_panel.visible = false
	var root_box := VBoxContainer.new()
	root_box.add_theme_constant_override("separation", 8)
	_craft_title = Label.new()
	_craft_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_craft_title.add_theme_font_size_override("font_size", 20)
	root_box.add_child(_craft_title)
	_build_navigation(root_box)

	_build_furnace_ui(root_box)
	var body := HBoxContainer.new()
	body.add_theme_constant_override("separation", 14)
	_left_content = VBoxContainer.new()
	_left_content.custom_minimum_size = Vector2(420, 390)
	_build_crafting_ui(_left_content)
	_build_chest_ui(_left_content)
	_build_warehouse_ui(_left_content)
	_build_automation_ui(_left_content)
	_build_magic_ui(_left_content)
	_build_abilities_ui(_left_content)
	_build_request_ui(_left_content)
	_build_dialogue_ui(_left_content)
	_build_creative_ui(_left_content)
	_build_guide_ui(_left_content)
	_build_inventory_ui(_left_content)
	_build_village_ui(_left_content)
	_build_map_ui(_left_content)
	_build_raid_ui(_left_content)
	_build_pause_ui(_left_content)
	_build_settings_ui(_left_content)
	_build_controls_ui(_left_content)
	_build_help_ui(_left_content)
	body.add_child(_left_content)
	_build_backpack_ui(body)
	root_box.add_child(body)

	var close_hint := Label.new()
	close_hint.text = "Mouse, keyboard, or controller focus  ·  Esc / Back closes"
	close_hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	close_hint.add_theme_color_override("font_color", Color(1, 1, 1, 0.6))
	root_box.add_child(close_hint)
	_craft_panel.add_child(root_box)
	add_child(_craft_panel)


func _build_stage8_hud() -> void:
	_objective_panel = PanelContainer.new()
	_objective_panel.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_objective_panel.position = Vector2(10, 54)
	_objective_panel.custom_minimum_size = Vector2(350, 82)
	var objective_box := VBoxContainer.new()
	_objective_title = Label.new()
	_objective_title.add_theme_font_size_override("font_size", 15)
	objective_box.add_child(_objective_title)
	_objective_text = Label.new()
	_objective_text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_objective_text.add_theme_font_size_override("font_size", 12)
	objective_box.add_child(_objective_text)
	_objective_panel.add_child(objective_box)
	add_child(_objective_panel)

	_target_status_label = Label.new()
	_target_status_label.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_target_status_label.position = Vector2(-350, 12)
	_target_status_label.custom_minimum_size = Vector2(340, 48)
	_target_status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_target_status_label.add_theme_font_size_override("font_size", 14)
	add_child(_target_status_label)

	_save_status_label = Label.new()
	_save_status_label.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_save_status_label.position = Vector2(-350, 62)
	_save_status_label.custom_minimum_size = Vector2(340, 24)
	_save_status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_save_status_label.add_theme_font_size_override("font_size", 12)
	add_child(_save_status_label)

	_flow_overlay_label = Label.new()
	_flow_overlay_label.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_flow_overlay_label.position = Vector2(-360, 92)
	_flow_overlay_label.custom_minimum_size = Vector2(350, 120)
	_flow_overlay_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_flow_overlay_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_flow_overlay_label.add_theme_font_size_override("font_size", 12)
	_flow_overlay_label.visible = false
	add_child(_flow_overlay_label)


func _build_navigation(parent: VBoxContainer) -> void:
	_nav_row = HBoxContainer.new()
	_nav_row.alignment = BoxContainer.ALIGNMENT_CENTER
	_nav_row.add_theme_constant_override("separation", 4)
	for entry in [
		["Guide", "guide"], ["Inventory", "inventory"], ["Craft", "hand"],
		["Village", "village"], ["Map", "map"], ["Raid", "raid"],
		["Settings", "settings"], ["Controls", "controls"], ["Help", "help"],
	]:
		var button := Button.new()
		button.text = str(entry[0])
		button.custom_minimum_size = Vector2(70, 30)
		button.add_theme_font_size_override("font_size", 11)
		button.pressed.connect(_open_mode.bind(str(entry[1]), INVALID_TARGET))
		_nav_row.add_child(button)
	parent.add_child(_nav_row)


func _build_guide_ui(parent: VBoxContainer) -> void:
	_guide_area = VBoxContainer.new()
	_guide_area.add_theme_constant_override("separation", 14)
	_guide_title = Label.new()
	_guide_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_guide_title.add_theme_font_size_override("font_size", 22)
	_guide_area.add_child(_guide_title)
	_guide_instruction = Label.new()
	_guide_instruction.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_guide_instruction.custom_minimum_size = Vector2(410, 90)
	_guide_area.add_child(_guide_instruction)
	var cause_heading := Label.new()
	cause_heading.text = "Why this matters"
	cause_heading.add_theme_font_size_override("font_size", 16)
	_guide_area.add_child(cause_heading)
	_guide_cause = Label.new()
	_guide_cause.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_guide_cause.custom_minimum_size = Vector2(410, 90)
	_guide_area.add_child(_guide_cause)
	var map_button := Button.new()
	map_button.text = "Open the local map and tracked goal"
	map_button.pressed.connect(_open_mode.bind("map", INVALID_TARGET))
	_guide_area.add_child(map_button)
	parent.add_child(_guide_area)


func _build_inventory_ui(parent: VBoxContainer) -> void:
	_inventory_area = VBoxContainer.new()
	_inventory_area.add_theme_constant_override("separation", 8)
	var heading := Label.new()
	heading.text = "Inventory search and item details"
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	heading.add_theme_font_size_override("font_size", 17)
	_inventory_area.add_child(heading)
	_inventory_search = LineEdit.new()
	_inventory_search.placeholder_text = "Search name, stable identity, or category"
	_inventory_search.text_changed.connect(func(_value: String) -> void:
		_refresh_inventory_summary())
	_inventory_area.add_child(_inventory_search)
	_inventory_list = ItemList.new()
	_inventory_list.custom_minimum_size = Vector2(410, 220)
	_inventory_list.select_mode = ItemList.SELECT_SINGLE
	_inventory_list.item_selected.connect(_on_inventory_summary_selected)
	_inventory_area.add_child(_inventory_list)
	_inventory_details = Label.new()
	_inventory_details.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_inventory_details.custom_minimum_size = Vector2(410, 70)
	_inventory_area.add_child(_inventory_details)
	parent.add_child(_inventory_area)


func _build_village_ui(parent: VBoxContainer) -> void:
	_village_area = VBoxContainer.new()
	_village_area.add_theme_constant_override("separation", 10)
	_village_summary = Label.new()
	_village_summary.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_village_summary.add_theme_font_size_override("font_size", 16)
	_village_area.add_child(_village_summary)
	_village_project = Label.new()
	_village_project.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_village_project.custom_minimum_size = Vector2(410, 145)
	_village_area.add_child(_village_project)
	_village_history = Label.new()
	_village_history.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_village_area.add_child(_village_history)
	var request_button := Button.new()
	request_button.text = "Open request board details"
	request_button.pressed.connect(_open_mode.bind(
		"request_board", INVALID_TARGET))
	_village_area.add_child(request_button)
	parent.add_child(_village_area)


func _build_map_ui(parent: VBoxContainer) -> void:
	_map_area = VBoxContainer.new()
	_map_area.add_theme_constant_override("separation", 6)
	_map_summary = Label.new()
	_map_summary.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_map_summary.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_map_area.add_child(_map_summary)
	_map_view = LocalMapViewScript.new()
	_map_view.pin_requested.connect(UIState.set_custom_pin)
	_map_area.add_child(_map_view)
	var clear_button := Button.new()
	clear_button.text = "Clear custom pin"
	clear_button.pressed.connect(UIState.clear_custom_pin)
	_map_area.add_child(clear_button)
	parent.add_child(_map_area)


func _build_raid_ui(parent: VBoxContainer) -> void:
	_raid_area = VBoxContainer.new()
	_raid_area.add_theme_constant_override("separation", 10)
	_raid_summary = Label.new()
	_raid_summary.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_raid_summary.add_theme_font_size_override("font_size", 20)
	_raid_area.add_child(_raid_summary)
	_raid_details = Label.new()
	_raid_details.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_raid_details.custom_minimum_size = Vector2(410, 260)
	_raid_area.add_child(_raid_details)
	_raid_repair_button = Button.new()
	_raid_repair_button.pressed.connect(_on_raid_overview_action)
	_raid_area.add_child(_raid_repair_button)
	parent.add_child(_raid_area)


func _build_pause_ui(parent: VBoxContainer) -> void:
	_pause_area = VBoxContainer.new()
	_pause_area.add_theme_constant_override("separation", 12)
	var title := Label.new()
	title.text = "Leyforge is paused"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 24)
	_pause_area.add_child(title)
	_pause_status = Label.new()
	_pause_status.text = "The current session remains in memory. Save before exiting."
	_pause_status.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_pause_status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_pause_area.add_child(_pause_status)
	for entry in [
		["Resume", "_resume"], ["Save World", "_save"],
		["Settings and Accessibility", "settings"],
		["Controls and Rebinding", "controls"], ["Help and Tutorials", "help"],
	]:
		var button := Button.new()
		button.text = str(entry[0])
		button.custom_minimum_size = Vector2(410, 44)
		var destination := str(entry[1])
		if destination == "_resume":
			button.pressed.connect(_set_craft_open.bind(false))
		elif destination == "_save":
			button.pressed.connect(_request_manual_save)
		else:
			button.pressed.connect(_open_mode.bind(destination, INVALID_TARGET))
		_pause_area.add_child(button)
	parent.add_child(_pause_area)


func _build_settings_ui(parent: VBoxContainer) -> void:
	_settings_area = VBoxContainer.new()
	_settings_area.add_theme_constant_override("separation", 4)
	_settings_summary = Label.new()
	_settings_summary.text = "Changes preview immediately and persist with the world."
	_settings_summary.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_settings_area.add_child(_settings_summary)
	_add_option_setting(_settings_area, "HUD preset", "hud_preset",
		["immersive", "standard", "accessibility"])
	_add_option_setting(_settings_area, "Tutorial guidance", "tutorial_mode",
		["minimal", "contextual", "guided", "full"])
	_add_option_setting(_settings_area, "Notifications", "notification_preset",
		["quiet", "standard", "detailed"])
	var scale_row := HBoxContainer.new()
	var scale_label := Label.new()
	scale_label.text = "UI and text scale"
	scale_label.custom_minimum_size = Vector2(170, 28)
	scale_row.add_child(scale_label)
	var scale := HSlider.new()
	scale.min_value = 0.8
	scale.max_value = 1.5
	scale.step = 0.1
	scale.value = UIState.setting_float("ui_scale", 1.0)
	scale.custom_minimum_size = Vector2(230, 28)
	scale.value_changed.connect(func(value: float) -> void:
		UIState.set_setting("ui_scale", value))
	scale_row.add_child(scale)
	_settings_area.add_child(scale_row)
	_add_toggle_setting(_settings_area, "Captions and text alerts", "captions")
	_add_toggle_setting(_settings_area, "High contrast and non-colour cues", "high_contrast")
	_add_toggle_setting(_settings_area, "Reduced camera motion", "reduced_motion")
	_add_toggle_setting(_settings_area, "Reduced flashes", "reduce_flashes")
	_add_toggle_setting(_settings_area, "Toggle sprint", "toggle_sprint")
	var aim_row := HBoxContainer.new()
	var aim_label := Label.new()
	aim_label.text = "Controller aim assist"
	aim_label.custom_minimum_size = Vector2(170, 28)
	aim_row.add_child(aim_label)
	var aim_assist := HSlider.new()
	aim_assist.min_value = 0.0
	aim_assist.max_value = 1.0
	aim_assist.step = 0.25
	aim_assist.value = UIState.setting_float("aim_assist", 0.25)
	aim_assist.custom_minimum_size = Vector2(230, 28)
	aim_assist.value_changed.connect(func(value: float) -> void:
		UIState.set_setting("aim_assist", value))
	aim_row.add_child(aim_assist)
	_settings_area.add_child(aim_row)
	parent.add_child(_settings_area)


func _add_option_setting(parent: VBoxContainer, label_text: String,
		key: String, values: Array) -> void:
	var row := HBoxContainer.new()
	var label := Label.new()
	label.text = label_text
	label.custom_minimum_size = Vector2(170, 30)
	row.add_child(label)
	var option := OptionButton.new()
	option.custom_minimum_size = Vector2(230, 30)
	for value in values:
		option.add_item(value.capitalize())
		option.set_item_metadata(option.item_count - 1, value)
		if str(UIState.settings.get(key, "")) == value:
			option.select(option.item_count - 1)
	option.item_selected.connect(func(index: int) -> void:
		UIState.set_setting(key, str(option.get_item_metadata(index))))
	row.add_child(option)
	parent.add_child(row)


func _add_toggle_setting(parent: VBoxContainer, label_text: String,
		key: String) -> void:
	var toggle := CheckButton.new()
	toggle.text = label_text
	toggle.button_pressed = UIState.setting_bool(key)
	toggle.toggled.connect(func(value: bool) -> void:
		UIState.set_setting(key, value))
	parent.add_child(toggle)


func _build_controls_ui(parent: VBoxContainer) -> void:
	_controls_scroll = ScrollContainer.new()
	_controls_scroll.custom_minimum_size = Vector2(420, 365)
	_controls_area = VBoxContainer.new()
	_controls_area.add_theme_constant_override("separation", 4)
	_controls_area.custom_minimum_size = Vector2(400, 0)
	var intro := Label.new()
	intro.text = "Activate a row, then press a keyboard, mouse, or controller input. Conflicts remain visible in both profiles."
	intro.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_controls_area.add_child(intro)
	for action in UIState.REBINDABLE_ACTIONS:
		var button := Button.new()
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.custom_minimum_size = Vector2(410, 27)
		button.add_theme_font_size_override("font_size", 11)
		button.pressed.connect(_start_rebind.bind(action, button))
		_controls_area.add_child(button)
		_binding_buttons[action] = button
	_controls_scroll.add_child(_controls_area)
	parent.add_child(_controls_scroll)


func _build_help_ui(parent: VBoxContainer) -> void:
	_help_area = VBoxContainer.new()
	_help_area.add_theme_constant_override("separation", 8)
	_help_list = ItemList.new()
	_help_list.custom_minimum_size = Vector2(410, 210)
	for entry in UIState.tutorial_entries():
		_help_list.add_item(str(entry["title"]))
		_help_list.set_item_metadata(_help_list.item_count - 1, entry)
	_help_list.item_selected.connect(_on_help_selected)
	_help_area.add_child(_help_list)
	_help_text = Label.new()
	_help_text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_help_text.custom_minimum_size = Vector2(410, 105)
	_help_area.add_child(_help_text)
	var reset_button := Button.new()
	reset_button.text = "Reset contextual tutorials"
	reset_button.pressed.connect(UIState.reset_learning)
	_help_area.add_child(reset_button)
	parent.add_child(_help_area)


func _build_abilities_ui(parent: VBoxContainer) -> void:
	_abilities_area = VBoxContainer.new()
	_abilities_area.add_theme_constant_override("separation", 10)
	var heading := Label.new()
	heading.text = "Select a 1-9 skill slot, then assign a learned ability or action."
	heading.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_abilities_area.add_child(heading)
	var slot_row := HBoxContainer.new()
	slot_row.alignment = BoxContainer.ALIGNMENT_CENTER
	for i in MagicState.ABILITY_SLOT_COUNT:
		var slot_button := Button.new()
		slot_button.custom_minimum_size = Vector2(58, 58)
		slot_button.add_theme_font_size_override("font_size", 11)
		slot_button.pressed.connect(_on_assignment_slot_pressed.bind(i))
		slot_row.add_child(slot_button)
		_ability_slot_buttons.append(slot_button)
	_abilities_area.add_child(slot_row)
	var known_heading := Label.new()
	known_heading.text = "Learned magic and special actions"
	known_heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_abilities_area.add_child(known_heading)
	for spell_id in MagicState.SPELLS:
		var ability_button := Button.new()
		ability_button.custom_minimum_size = Vector2(360, 46)
		ability_button.pressed.connect(
			_on_known_ability_pressed.bind(str(spell_id)))
		_abilities_area.add_child(ability_button)
		_known_ability_buttons[str(spell_id)] = ability_button
	var clear_button := Button.new()
	clear_button.text = "Clear selected slot"
	clear_button.pressed.connect(_on_known_ability_pressed.bind(""))
	_abilities_area.add_child(clear_button)
	parent.add_child(_abilities_area)


func _build_crafting_ui(parent: VBoxContainer) -> void:
	_crafting_area = VBoxContainer.new()
	var heading := Label.new()
	heading.text = "Place ingredients in the grid"
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_crafting_area.add_child(heading)
	var row := HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 18)
	_craft_grid = GridContainer.new()
	_craft_grid.columns = 2
	for i in Inventory.CRAFT_SIZE:
		var button := InventorySlotButton.new()
		button.setup(self, "craft", i)
		button.custom_minimum_size = Vector2(68, 68)
		button.focus_mode = Control.FOCUS_ALL
		button.pressed.connect(_on_craft_slot_pressed.bind(i))
		_craft_grid.add_child(button)
		_craft_buttons.append(button)
	row.add_child(_craft_grid)
	var arrow := Label.new()
	arrow.text = "→"
	arrow.add_theme_font_size_override("font_size", 28)
	row.add_child(arrow)
	_craft_output_button = Button.new()
	_craft_output_button.custom_minimum_size = Vector2(92, 76)
	_craft_output_button.tooltip_text = "Craft output"
	_craft_output_button.pressed.connect(_on_craft_output)
	row.add_child(_craft_output_button)
	_crafting_area.add_child(row)
	_craft_result_label = Label.new()
	_craft_result_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_crafting_area.add_child(_craft_result_label)
	var batch_row := HBoxContainer.new()
	batch_row.alignment = BoxContainer.ALIGNMENT_CENTER
	var batch_label := Label.new()
	batch_label.text = "Batch quantity"
	batch_row.add_child(batch_label)
	_craft_batch_quantity = SpinBox.new()
	_craft_batch_quantity.min_value = 1
	_craft_batch_quantity.max_value = 64
	_craft_batch_quantity.value = 1
	_craft_batch_quantity.custom_minimum_size = Vector2(86, 30)
	batch_row.add_child(_craft_batch_quantity)
	_craft_batch_button = Button.new()
	_craft_batch_button.text = "Craft batch"
	_craft_batch_button.pressed.connect(_on_craft_batch)
	batch_row.add_child(_craft_batch_button)
	_crafting_area.add_child(batch_row)
	_recipe_knowledge_label = Label.new()
	_recipe_knowledge_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_recipe_knowledge_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_recipe_knowledge_label.add_theme_font_size_override("font_size", 11)
	_crafting_area.add_child(_recipe_knowledge_label)
	parent.add_child(_crafting_area)


func _build_chest_ui(parent: VBoxContainer) -> void:
	_chest_area = VBoxContainer.new()
	var heading := Label.new()
	heading.text = "Wooden Chest"
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_chest_area.add_child(heading)
	_chest_grid = GridContainer.new()
	_chest_grid.columns = 9
	for i in 27:
		var button := InventorySlotButton.new()
		button.setup(self, "chest", i)
		button.custom_minimum_size = Vector2(44, 54)
		button.focus_mode = Control.FOCUS_ALL
		button.pressed.connect(_on_chest_slot_pressed.bind(i))
		_chest_grid.add_child(button)
		_chest_buttons.append(button)
	_chest_area.add_child(_chest_grid)
	parent.add_child(_chest_area)


func _build_warehouse_ui(parent: VBoxContainer) -> void:
	_warehouse_area = VBoxContainer.new()
	var heading := Label.new()
	heading.text = "Forest Hamlet Warehouse"
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_warehouse_area.add_child(heading)
	_warehouse_permission_label = Label.new()
	_warehouse_permission_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_warehouse_permission_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_warehouse_area.add_child(_warehouse_permission_label)
	_warehouse_grid = GridContainer.new()
	_warehouse_grid.columns = 9
	for i in HamletState.WAREHOUSE_SIZE:
		var button := InventorySlotButton.new()
		button.setup(self, "warehouse", i)
		button.custom_minimum_size = Vector2(43, 42)
		button.focus_mode = Control.FOCUS_ALL
		button.pressed.connect(_on_warehouse_slot_pressed.bind(i))
		_warehouse_grid.add_child(button)
		_warehouse_buttons.append(button)
	_warehouse_area.add_child(_warehouse_grid)
	parent.add_child(_warehouse_area)


func _build_automation_ui(parent: VBoxContainer) -> void:
	_automation_area = VBoxContainer.new()
	_automation_area.add_theme_constant_override("separation", 10)
	_automation_status_label = Label.new()
	_automation_status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_automation_status_label.add_theme_font_size_override("font_size", 18)
	_automation_area.add_child(_automation_status_label)
	_automation_details_label = Label.new()
	_automation_details_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_automation_details_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_automation_details_label.custom_minimum_size = Vector2(410, 150)
	_automation_area.add_child(_automation_details_label)
	_automation_action_button = Button.new()
	_automation_action_button.custom_minimum_size = Vector2(410, 44)
	_automation_action_button.pressed.connect(_on_automation_action)
	_automation_area.add_child(_automation_action_button)
	_automation_overlay_button = Button.new()
	_automation_overlay_button.text = "Toggle item-flow / port overlay"
	_automation_overlay_button.pressed.connect(_toggle_automation_overlay)
	_automation_area.add_child(_automation_overlay_button)
	_automation_ledger_label = Label.new()
	_automation_ledger_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_automation_ledger_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_automation_area.add_child(_automation_ledger_label)
	parent.add_child(_automation_area)


func _build_magic_ui(parent: VBoxContainer) -> void:
	_magic_area = VBoxContainer.new()
	_magic_area.add_theme_constant_override("separation", 10)
	_magic_status_label = Label.new()
	_magic_status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_magic_status_label.add_theme_font_size_override("font_size", 18)
	_magic_area.add_child(_magic_status_label)
	_magic_details_label = Label.new()
	_magic_details_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_magic_details_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_magic_details_label.custom_minimum_size = Vector2(410, 190)
	_magic_area.add_child(_magic_details_label)
	_magic_action_button = Button.new()
	_magic_action_button.custom_minimum_size = Vector2(410, 44)
	_magic_action_button.pressed.connect(_on_magic_action)
	_magic_area.add_child(_magic_action_button)
	parent.add_child(_magic_area)


func _build_request_ui(parent: VBoxContainer) -> void:
	_request_area = VBoxContainer.new()
	_request_reputation_label = Label.new()
	_request_reputation_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_request_reputation_label.add_theme_font_size_override("font_size", 16)
	_request_area.add_child(_request_reputation_label)
	_request_project_label = Label.new()
	_request_project_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_request_project_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_request_area.add_child(_request_project_label)
	_ensure_request_buttons()
	parent.add_child(_request_area)


func _ensure_request_buttons() -> void:
	if _request_area == null:
		return
	for request in HamletState.get_requests():
		var request_id := str(request["id"])
		if _request_buttons.has(request_id):
			continue
		var button := Button.new()
		button.custom_minimum_size = Vector2(410, 54)
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.add_theme_font_size_override("font_size", 11)
		button.pressed.connect(_on_request_pressed.bind(request_id))
		_request_area.add_child(button)
		_request_buttons[request_id] = button


func _build_dialogue_ui(parent: VBoxContainer) -> void:
	_dialogue_area = VBoxContainer.new()
	_dialogue_title = Label.new()
	_dialogue_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_dialogue_title.add_theme_font_size_override("font_size", 19)
	_dialogue_area.add_child(_dialogue_title)
	_dialogue_text = Label.new()
	_dialogue_text.custom_minimum_size = Vector2(405, 150)
	_dialogue_text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_dialogue_text.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_dialogue_area.add_child(_dialogue_text)
	_dialogue_action = Button.new()
	_dialogue_action.text = "Offer to help the hamlet"
	_dialogue_action.pressed.connect(_on_dialogue_action)
	_dialogue_area.add_child(_dialogue_action)
	_raid_action = Button.new()
	_raid_action.text = "Sound the raid warning"
	_raid_action.pressed.connect(_on_raid_action)
	_dialogue_area.add_child(_raid_action)
	parent.add_child(_dialogue_area)


func _build_creative_ui(parent: VBoxContainer) -> void:
	_creative_area = VBoxContainer.new()
	var description := Label.new()
	description.text = "Testing catalogue: every registered block and item"
	description.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_creative_area.add_child(description)
	_creative_search = LineEdit.new()
	_creative_search.placeholder_text = "Search name or stable ID..."
	_creative_search.text_changed.connect(_rebuild_creative_list)
	_creative_area.add_child(_creative_search)
	_creative_list = ItemList.new()
	_creative_list.custom_minimum_size = Vector2(410, 255)
	_creative_list.fixed_icon_size = Vector2i(40, 40)
	_creative_list.allow_reselect = true
	_creative_list.item_selected.connect(_on_creative_item_selected)
	_creative_area.add_child(_creative_list)
	_creative_selection_label = Label.new()
	_creative_selection_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_creative_selection_label.text = "Select an entry"
	_creative_area.add_child(_creative_selection_label)
	var grant_row := HBoxContainer.new()
	grant_row.alignment = BoxContainer.ALIGNMENT_CENTER
	var amount_label := Label.new()
	amount_label.text = "Amount"
	grant_row.add_child(amount_label)
	_creative_amount = SpinBox.new()
	_creative_amount.min_value = 1
	_creative_amount.max_value = 9999
	_creative_amount.value = 64
	_creative_amount.custom_minimum_size = Vector2(110, 0)
	grant_row.add_child(_creative_amount)
	var give_button := Button.new()
	give_button.text = "Give to player"
	give_button.pressed.connect(_grant_creative_selection)
	grant_row.add_child(give_button)
	_creative_area.add_child(grant_row)
	_creative_trash_button = InventorySlotButton.new()
	_creative_trash_button.setup(self, "trash", 0)
	_creative_trash_button.custom_minimum_size = Vector2(410, 66)
	_creative_trash_button.focus_mode = Control.FOCUS_NONE
	_creative_trash_button.text = "TRASH\nDrag a hotbar or backpack stack here to delete it"
	_creative_trash_button.tooltip_text = "Creative testing only: deletes the entire dropped stack"
	var trash_style := StyleBoxFlat.new()
	trash_style.bg_color = Color(0.28, 0.045, 0.045, 0.94)
	trash_style.border_color = Color(0.95, 0.22, 0.18, 0.9)
	trash_style.set_border_width_all(2)
	_creative_trash_button.add_theme_stylebox_override("normal", trash_style)
	var trash_hover := trash_style.duplicate()
	trash_hover.bg_color = Color(0.48, 0.07, 0.055, 0.98)
	trash_hover.border_color = Color(1.0, 0.46, 0.28)
	trash_hover.set_border_width_all(3)
	_creative_trash_button.add_theme_stylebox_override("hover", trash_hover)
	_creative_trash_button.add_theme_stylebox_override("drop_hover", trash_hover)
	_creative_area.add_child(_creative_trash_button)
	_build_creative_entries()
	_rebuild_creative_list("")
	parent.add_child(_creative_area)


func _build_creative_entries() -> void:
	_creative_entries.clear()
	for id_value in BlockRegistry.get_all_ids():
		var id := int(id_value)
		if id <= BlockRegistry.AIR:
			continue
		var stable_id := BlockRegistry.get_stable_id(id)
		if stable_id.is_empty():
			continue
		_creative_entries.append({
			"kind": "block",
			"id": id,
			"stable_id": stable_id,
			"name": BlockRegistry.get_block_name(id),
		})
	for id_value in ItemRegistry.get_all_ids():
		var id := int(id_value)
		var stable_id := ItemRegistry.get_stable_id(id)
		if stable_id.is_empty():
			continue
		_creative_entries.append({
			"kind": "item",
			"id": id,
			"stable_id": stable_id,
			"name": ItemRegistry.get_item_name(id),
		})
	_creative_entries.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a["name"]).naturalnocasecmp_to(str(b["name"])) < 0)


func _rebuild_creative_list(filter_text: String) -> void:
	if _creative_list == null:
		return
	var query := filter_text.strip_edges().to_lower()
	_creative_list.clear()
	for entry in _creative_entries:
		var searchable := "%s %s %s" % [
			entry["name"], entry["stable_id"], entry["kind"]]
		if not query.is_empty() and query not in searchable.to_lower():
			continue
		var stack := Inventory.make_stack_from_ref({
			"kind": entry["kind"],
			"stable_id": entry["stable_id"],
			"count": 1,
		})
		var index := _creative_list.item_count
		_creative_list.add_item(
			"%s  (%s)" % [entry["name"], str(entry["kind"]).capitalize()],
			_icon_renderer.get_icon(stack))
		_creative_list.set_item_metadata(index, entry)
	if _creative_list.item_count > 0:
		_creative_list.select(0)
		_on_creative_item_selected(0)
	else:
		_creative_selected = {}
		_creative_selection_label.text = "No matching content"


func _on_creative_item_selected(index: int) -> void:
	var value: Variant = _creative_list.get_item_metadata(index)
	_creative_selected = value.duplicate(true) if value is Dictionary else {}
	if _creative_selected.is_empty():
		_creative_selection_label.text = "Select an entry"
	else:
		_creative_selection_label.text = "%s\n%s" % [
			_creative_selected["name"], _creative_selected["stable_id"]]


func _grant_creative_selection() -> void:
	if _creative_selected.is_empty():
		_show_context("Select a block or item first.")
		return
	var requested := maxi(1, roundi(_creative_amount.value))
	var granted := _grant_creative_content(_creative_selected, requested)
	if granted == requested:
		_show_context("Creative: gave %d × %s." % [
			granted, _creative_selected["name"]])
	else:
		_show_context("Creative: gave %d/%d × %s; inventory is full." % [
			granted, requested, _creative_selected["name"]])


func _grant_creative_content(entry: Dictionary, requested: int) -> int:
	var remaining := maxi(0, requested)
	var granted := 0
	while remaining > 0:
		var prototype := Inventory.make_stack_from_ref({
			"kind": entry["kind"],
			"stable_id": entry["stable_id"],
			"count": 1,
		})
		if prototype.is_empty():
			break
		var batch_count := mini(remaining, Inventory.stack_max_count(prototype))
		var stack := Inventory.make_stack_from_ref({
			"kind": entry["kind"],
			"stable_id": entry["stable_id"],
			"count": batch_count,
		})
		var leftover := Inventory.add_stack(stack)
		var accepted := batch_count - int(leftover.get("count", 0))
		if accepted <= 0:
			break
		granted += accepted
		remaining -= accepted
		if accepted < batch_count:
			break
	return granted


func _build_furnace_ui(parent: VBoxContainer) -> void:
	_furnace_row = HBoxContainer.new()
	_furnace_row.alignment = BoxContainer.ALIGNMENT_CENTER
	_furnace_row.add_theme_constant_override("separation", 8)
	for i in 3:
		var input_button := InventorySlotButton.new()
		input_button.setup(self, "furnace_input", i)
		input_button.custom_minimum_size = Vector2(80, 72)
		input_button.focus_mode = Control.FOCUS_ALL
		input_button.tooltip_text = "Click empty: insert selected ingredient. Click filled: take it back."
		input_button.pressed.connect(_on_furnace_input.bind(i))
		_furnace_row.add_child(input_button)
		_furnace_input_buttons.append(input_button)
	var plus := Label.new()
	plus.text = "+ fuel"
	_furnace_row.add_child(plus)
	_furnace_fuel_button = InventorySlotButton.new()
	_furnace_fuel_button.setup(self, "furnace_fuel", 0)
	_furnace_fuel_button.custom_minimum_size = Vector2(80, 72)
	_furnace_fuel_button.focus_mode = Control.FOCUS_ALL
	_furnace_fuel_button.tooltip_text = "Coal, logs, or planks"
	_furnace_fuel_button.pressed.connect(_on_furnace_fuel)
	_furnace_row.add_child(_furnace_fuel_button)
	var arrow := Label.new()
	arrow.text = "→"
	arrow.add_theme_font_size_override("font_size", 26)
	_furnace_row.add_child(arrow)
	_furnace_output_button = InventorySlotButton.new()
	_furnace_output_button.setup(self, "furnace_output", 0)
	_furnace_output_button.custom_minimum_size = Vector2(90, 72)
	_furnace_output_button.focus_mode = Control.FOCUS_ALL
	_furnace_output_button.tooltip_text = "Take refined output"
	_furnace_output_button.pressed.connect(_on_furnace_output)
	_furnace_row.add_child(_furnace_output_button)
	parent.add_child(_furnace_row)
	_furnace_progress = Label.new()
	_furnace_progress.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	parent.add_child(_furnace_progress)


func _build_backpack_ui(parent: HBoxContainer) -> void:
	_backpack_box = VBoxContainer.new()
	var storage_title := Label.new()
	storage_title.text = "Backpack"
	storage_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_backpack_box.add_child(storage_title)
	var storage_grid := GridContainer.new()
	storage_grid.columns = 6
	for i in Inventory.BACKPACK_SIZE:
		var button := InventorySlotButton.new()
		button.setup(self, "backpack", i)
		button.custom_minimum_size = Vector2(50, 50)
		button.focus_mode = Control.FOCUS_ALL
		button.pressed.connect(_on_backpack_pressed.bind(i))
		storage_grid.add_child(button)
		_backpack_buttons.append(button)
	_backpack_box.add_child(storage_grid)
	parent.add_child(_backpack_box)


# ---------- Click and drag transfers ----------

func _on_hotbar_pressed(index: int) -> void:
	Inventory.select_slot(index)


func _on_ability_hud_pressed(index: int) -> void:
	if not craft_open and MagicState.select_ability_slot(index):
		var ability_id := MagicState.get_ability_slot(index)
		var ability_name := str(
			MagicState.spell_definition(ability_id).get("name", "Empty"))
		_show_context(
			"Skill %d selected: %s. Use LMB." % [index + 1, ability_name])


func _on_assignment_slot_pressed(index: int) -> void:
	_selected_ability_slot = clampi(
		index, 0, MagicState.ABILITY_SLOT_COUNT - 1)
	_refresh_vitals_and_abilities()
	_refresh_abilities()


func _on_known_ability_pressed(ability_id: String) -> void:
	if MagicState.assign_ability(_selected_ability_slot, ability_id):
		_show_context(
			"Ability slot %d updated." % (_selected_ability_slot + 1))
		_refresh_vitals_and_abilities()
		_refresh_abilities()


func _on_backpack_pressed(index: int) -> void:
	Inventory.swap_backpack_with_selected(index)


func _on_craft_slot_pressed(index: int) -> void:
	if not Inventory.get_active_craft_indices().has(index):
		return
	var slot := Inventory.get_craft_slot(index)
	var selected := Inventory.get_selected_stack()
	if slot.is_empty() or (
			not selected.is_empty() and Inventory.stack_kind(slot) == Inventory.stack_kind(selected)
			and int(slot.get("id", -1)) == int(selected.get("id", -2))):
		Inventory.transfer_group_slot("hotbar", Inventory.selected_slot, "craft", index, 1)
	else:
		Inventory.return_craft_to_hotbar(index)


func _on_craft_output() -> void:
	var result := Inventory.take_craft_output()
	_show_context("Crafted %s" % Inventory.stack_name(result) \
		if not result.is_empty() else "Recipe incomplete or no inventory room")


func _on_craft_batch() -> void:
	var wanted := maxi(1, roundi(_craft_batch_quantity.value))
	var crafted := 0
	var last_name := ""
	for _index in wanted:
		var result := Inventory.take_craft_output()
		if result.is_empty():
			break
		crafted += int(result.get("count", 1))
		last_name = Inventory.stack_name(result)
	_show_context(
		"Crafted %d × %s. Remaining ingredients stayed in the grid." % [
			crafted, last_name]
		if crafted > 0
		else "Batch stopped: recipe incomplete, inputs missing, or inventory full.")


func _on_chest_slot_pressed(index: int) -> void:
	var chest_stack := player.world.get_chest_slot(station_position, index)
	if chest_stack.is_empty():
		handle_drop_stack("hotbar", Inventory.selected_slot, "chest", index)
	else:
		var leftover := Inventory.add_stack(chest_stack)
		if leftover.is_empty():
			player.world.set_chest_slot(station_position, index, {})
	_refresh_all()


func _on_warehouse_slot_pressed(index: int) -> void:
	var warehouse_stack := HamletState.get_warehouse_slot(index)
	if warehouse_stack.is_empty():
		if not HamletState.permission_enabled("warehouse_deposit"):
			_show_context("Direct deposits unlock at Trusted Supplier.")
			return
		handle_drop_stack("hotbar", Inventory.selected_slot, "warehouse", index)
		return
	if not HamletState.permission_enabled("warehouse_withdraw"):
		_show_context("Only Trusted Allies may withdraw village stock.")
		return
	if not Inventory.can_add_stack(warehouse_stack):
		_show_context("No inventory room.")
		return
	if Inventory.add_stack(warehouse_stack).is_empty():
		HamletState.set_warehouse_slot(index, {})
	_refresh_all()


func _on_request_pressed(request_id: String) -> void:
	var result := HamletState.deliver_request(request_id)
	_show_context(str(result.get("message", "No delivery made.")))
	_refresh_all()


func _on_dialogue_action() -> void:
	if HamletState.accept_introduction():
		_show_context("The request board is now open for deliveries.")
	else:
		_open_mode("request_board", player.world.get_hamlet_station_position("request_board"))
	_refresh_all()


func _on_raid_action() -> void:
	if raid_runtime == null:
		_show_context("The raid runtime is not ready.")
		return
	var result: Dictionary
	if CombatState.phase == "resolved":
		if CombatState.unresolved_damage_count() > 0:
			result = raid_runtime.repair_next_damage()
		else:
			CombatState.reset_raid()
			result = {"message": "Raid test reset. Speak to Elric when ready."}
	elif CombatState.phase == "dormant":
		result = raid_runtime.begin_raid()
	else:
		result = {"message": "The raid is already underway."}
	_show_context(str(result.get("message", "No raid action was taken.")))
	_refresh_all()


func _on_automation_action() -> void:
	if player == null or player.world == null:
		return
	var result := player.world.perform_automation_action(station_position)
	_show_context(str(result.get("message", "Automation action failed.")))
	_refresh_automation()


func _toggle_automation_overlay() -> void:
	_automation_overlay_enabled = not _automation_overlay_enabled
	_flow_overlay_label.visible = _automation_overlay_enabled
	_automation_overlay_button.text = (
		"Hide item-flow / port overlay"
		if _automation_overlay_enabled
		else "Show item-flow / port overlay")
	_refresh_automation()


func _on_magic_action() -> void:
	if player == null or player.world == null:
		return
	var result := player.world.perform_magic_action(station_position)
	_show_context(str(result.get("message", "Magic action failed.")))
	_refresh_magic()


func _on_inventory_summary_selected(index: int) -> void:
	if index < 0 or index >= _inventory_list.item_count:
		return
	var entry: Dictionary = _inventory_list.get_item_metadata(index)
	var stack: Dictionary = entry.get("stack", {})
	if stack.is_empty():
		_inventory_details.text = ""
		return
	var detail := "%s\n%s · %s · count %d" % [
		Inventory.stack_name(stack),
		Inventory.stack_stable_id(stack),
		Inventory.stack_kind(stack).capitalize(),
		int(stack.get("count", 1)),
	]
	if stack.has("instance"):
		var instance: Dictionary = stack["instance"]
		detail += "\nDurability %d/%d. This is a distinct saved item instance." % [
			int(instance.get("durability", 0)),
			int(instance.get("max_durability", 0)),
		]
	else:
		detail += "\nStack transfers conserve this exact quantity."
	_inventory_details.text = detail


func _on_help_selected(index: int) -> void:
	if index < 0 or index >= _help_list.item_count:
		return
	var entry: Dictionary = _help_list.get_item_metadata(index)
	_help_text.text = "%s\n\n%s" % [entry.get("title", ""), entry.get("text", "")]
	UIState.mark_hint_complete(str(entry.get("id", "")))


func _on_raid_overview_action() -> void:
	_on_raid_action()
	_refresh_raid_overview()


func _request_manual_save() -> void:
	if session == null or not session.has_method("request_manual_save"):
		_on_save_status_changed(
			"failed", "Save is unavailable because the session controller is not ready.")
		return
	if session.has_signal("save_status_changed") \
			and not session.is_connected(
				"save_status_changed", Callable(self, "_on_save_status_changed")):
		session.connect(
			"save_status_changed", Callable(self, "_on_save_status_changed"))
	session.call("request_manual_save")


func _on_save_status_changed(status: String, message: String) -> void:
	_save_status_label.text = message
	_pause_status.text = message
	_save_status_label.add_theme_color_override(
		"font_color",
		Color(0.45, 1.0, 0.55) if status == "saved" else (
			Color(1.0, 0.42, 0.3) if status == "failed"
			else Color(1.0, 0.86, 0.42)))
	_show_context(message)


func _start_rebind(action: String, button: Button) -> void:
	_rebind_action = action
	_rebind_button = button
	button.text = "%s  —  press a new input (Esc cancels)" % UIState.action_label(action)


func _cancel_rebind() -> void:
	_rebind_action = ""
	_rebind_button = null
	_refresh_bindings()


func _focus_first_control() -> void:
	if not craft_open or _craft_panel == null:
		return
	var control := _find_focusable(_craft_panel)
	if control != null:
		control.grab_focus()


func _find_focusable(node: Node) -> Control:
	for child in node.get_children():
		if child is Control:
			var control: Control = child
			if control.is_visible_in_tree() and control.focus_mode != Control.FOCUS_NONE \
					and not (control is BaseButton and control.disabled):
				return control
		var nested := _find_focusable(child)
		if nested != null:
			return nested
	return null


func get_drag_stack(group: String, index: int) -> Dictionary:
	if group == "trash":
		return {}
	if group == "chest" and player != null and player.world != null:
		return player.world.get_chest_slot(station_position, index)
	if group == "warehouse":
		return HamletState.get_warehouse_slot(index)
	if group.begins_with("furnace_") and player != null and player.world != null:
		return player.world.get_furnace_slot(
			station_position, _furnace_target_for_group(group), index)
	return Inventory.get_group_slot(group, index)


func can_drop_stack(source_group: String, source_index: int,
		destination_group: String, destination_index: int) -> bool:
	if get_drag_stack(source_group, source_index).is_empty():
		return false
	if source_group == destination_group and source_index == destination_index:
		return false
	if destination_group == "trash":
		return craft_mode == "creative" \
			and source_group in ["hotbar", "backpack", "craft"]
	if destination_group == "chest" and craft_mode != "chest":
		return false
	if destination_group == "warehouse" and (
			craft_mode != "warehouse"
			or not HamletState.permission_enabled("warehouse_deposit")):
		return false
	if source_group == "warehouse" and not HamletState.permission_enabled("warehouse_withdraw"):
		return false
	if (source_group.begins_with("furnace_")
			or destination_group.begins_with("furnace_")) \
			and craft_mode not in ["furnace", "mana_furnace"]:
		return false
	if destination_group == "furnace_output":
		return false
	var source := get_drag_stack(source_group, source_index)
	var destination := get_drag_stack(destination_group, destination_index)
	if destination_group in ["furnace_input", "furnace_fuel"] \
			and not player.world.furnace_slot_accepts_stack(
				_furnace_target_for_group(destination_group), source,
				player.world.furnace_station_at(station_position)):
		return false
	# An incompatible occupied destination causes a swap. Validate the stack
	# moving back into a furnace source before advertising the drop as legal.
	if source_group.begins_with("furnace_") and not destination.is_empty() \
			and not Inventory._can_merge(destination, source):
		if source_group == "furnace_output" \
			or not player.world.furnace_slot_accepts_stack(
					_furnace_target_for_group(source_group), destination,
					player.world.furnace_station_at(station_position)):
			return false
	if destination_group == "craft" \
			and not Inventory.get_active_craft_indices().has(destination_index):
		return false
	return destination_group in [
		"hotbar", "backpack", "craft", "chest", "warehouse",
		"furnace_input", "furnace_fuel",
	]


func handle_drop_stack(source_group: String, source_index: int,
		destination_group: String, destination_index: int) -> void:
	if not can_drop_stack(source_group, source_index, destination_group, destination_index):
		return
	if destination_group == "trash":
		var deleted := get_drag_stack(source_group, source_index).duplicate(true)
		if _set_endpoint(source_group, source_index, {}):
			Inventory._update_craft_output()
			Inventory._emit_inventory_changed()
			Inventory.craft_grid_changed.emit()
			_show_context("Creative trash deleted %d x %s." % [
				int(deleted.get("count", 0)), Inventory.stack_name(deleted)])
		_refresh_all()
		return
	if source_group not in EXTERNAL_SLOT_GROUPS \
			and destination_group not in EXTERNAL_SLOT_GROUPS:
		Inventory.transfer_group_slot(
			source_group, source_index, destination_group, destination_index)
	else:
		_transfer_external_endpoint(
			source_group, source_index, destination_group, destination_index)
	_refresh_all()


func _transfer_external_endpoint(source_group: String, source_index: int,
		destination_group: String, destination_index: int) -> void:
	var source := get_drag_stack(source_group, source_index).duplicate(true)
	var destination := get_drag_stack(destination_group, destination_index).duplicate(true)
	if source.is_empty():
		return
	if destination.is_empty():
		destination = source
		source = {}
	elif Inventory.stack_kind(source) == Inventory.stack_kind(destination) \
			and int(source.get("id", -1)) == int(destination.get("id", -2)) \
			and not source.has("instance") and not destination.has("instance"):
		var move := mini(
			int(source["count"]),
			Inventory.stack_max_count(destination) - int(destination["count"]))
		if move <= 0:
			return
		destination["count"] = int(destination["count"]) + move
		source["count"] = int(source["count"]) - move
		if int(source["count"]) <= 0:
			source = {}
	else:
		var swap := destination
		destination = source
		source = swap
	var original_source := get_drag_stack(source_group, source_index).duplicate(true)
	if not _set_endpoint(source_group, source_index, source):
		return
	if not _set_endpoint(destination_group, destination_index, destination):
		_set_endpoint(source_group, source_index, original_source)
		return
	Inventory._update_craft_output()
	Inventory._emit_inventory_changed()
	Inventory.craft_grid_changed.emit()


func _set_endpoint(group: String, index: int, stack: Dictionary) -> bool:
	if group == "chest":
		return player.world.set_chest_slot(station_position, index, stack)
	if group == "warehouse":
		return HamletState.set_warehouse_slot(index, stack)
	if group.begins_with("furnace_"):
		return player.world.set_furnace_slot(
			station_position, _furnace_target_for_group(group), index, stack)
	return Inventory.set_group_slot(group, index, stack, false)


func _furnace_target_for_group(group: String) -> String:
	return {
		"furnace_input": "input",
		"furnace_fuel": "fuel",
		"furnace_output": "output",
	}.get(group, "")


# ---------- Furnace ----------

func _on_furnace_input(index: int) -> void:
	var state := player.world.get_furnace_state(station_position)
	if state.is_empty():
		return
	if state["inputs"][index].is_empty():
		player.world.furnace_insert_selected(station_position, "input")
	else:
		player.world.furnace_take_slot(station_position, "input", index)
	_refresh_furnace()


func _on_furnace_fuel() -> void:
	var state := player.world.get_furnace_state(station_position)
	if state.is_empty():
		return
	if state["fuel"].is_empty():
		player.world.furnace_insert_selected(station_position, "fuel")
	else:
		player.world.furnace_take_slot(station_position, "fuel")
	_refresh_furnace()


func _on_furnace_output() -> void:
	player.world.furnace_take_slot(station_position, "output")
	_refresh_furnace()


# ---------- Painting ----------

func _paint_slot(button: Button, stack: Dictionary, selected := false, prefix := "") -> void:
	var style := StyleBoxFlat.new()
	style.border_color = Color(1, 0.85, 0.2) if selected else Color(1, 1, 1, 0.25)
	var width := 3 if selected else 2
	style.border_width_left = width
	style.border_width_right = width
	style.border_width_top = width
	style.border_width_bottom = width
	button.icon = null
	button.tooltip_text = ""
	button.expand_icon = true
	button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.add_theme_font_size_override("font_size", 10)
	button.add_theme_color_override("font_color", Color.WHITE)
	if stack.is_empty():
		style.bg_color = Color(0, 0, 0, 0.5)
		button.text = prefix
	else:
		style.bg_color = Color(0.055, 0.06, 0.07, 0.94)
		var label := Inventory.stack_name(stack)
		var count := int(stack.get("count", 0))
		button.icon = _icon_renderer.get_icon(stack)
		button.tooltip_text = "%s\n%s" % [label, Inventory.stack_stable_id(stack)]
		var amount_text := ""
		if stack.has("instance"):
			var instance: Dictionary = stack["instance"]
			amount_text = "%d/%d" % [
				int(instance.get("durability", 0)),
				int(instance.get("max_durability", 0)),
			]
		elif count > 1:
			amount_text = "×%d" % count
		button.text = "%s\n%s" % [prefix, amount_text] \
			if not prefix.is_empty() else amount_text
	button.add_theme_stylebox_override("normal", style)


func _refresh_all() -> void:
	if _hotbar_buttons.is_empty():
		return
	for i in HOTBAR_SLOTS:
		_paint_slot(_hotbar_buttons[i], Inventory.hotbar[i], i == Inventory.selected_slot)
	for i in Inventory.BACKPACK_SIZE:
		_paint_slot(_backpack_buttons[i], Inventory.backpack[i])
	_refresh_vitals_and_abilities()
	_refresh_objective()
	_refresh_combat_status()
	if not craft_open:
		return
	_refresh_context_visibility()
	_refresh_crafting()
	_refresh_chest()
	_refresh_warehouse()
	_refresh_requests()
	_refresh_dialogue()
	_refresh_furnace()
	_refresh_automation()
	_refresh_magic()
	_refresh_abilities()
	_refresh_stage8()


func _refresh_context_visibility() -> void:
	var show_backpack := craft_mode in [
		"hand", "workbench", "rune_table", "furnace", "mana_furnace",
		"chest", "warehouse", "inventory", "creative",
	]
	_backpack_box.visible = show_backpack
	_left_content.custom_minimum_size = Vector2(
		420 if show_backpack else 680, 390)
	_crafting_area.visible = craft_mode in ["hand", "workbench", "rune_table"]
	_chest_area.visible = craft_mode == "chest"
	_warehouse_area.visible = craft_mode == "warehouse"
	_automation_area.visible = craft_mode == "automation"
	_magic_area.visible = craft_mode == "magic"
	_abilities_area.visible = craft_mode == "abilities"
	_request_area.visible = craft_mode == "request_board"
	_dialogue_area.visible = craft_mode == "npc"
	_creative_area.visible = craft_mode == "creative"
	_guide_area.visible = craft_mode == "guide"
	_inventory_area.visible = craft_mode == "inventory"
	_village_area.visible = craft_mode == "village"
	_map_area.visible = craft_mode == "map"
	_raid_area.visible = craft_mode == "raid"
	_pause_area.visible = craft_mode == "pause"
	_settings_area.visible = craft_mode == "settings"
	_controls_scroll.visible = craft_mode == "controls"
	_help_area.visible = craft_mode == "help"
	_furnace_row.visible = craft_mode in ["furnace", "mana_furnace"]
	_furnace_progress.visible = craft_mode in ["furnace", "mana_furnace"]
	_craft_title.text = {
		"hand": "Hand Crafting (2×2)",
		"workbench": "Workbench Crafting (3×3)",
		"furnace": "Stone Furnace",
		"rune_table": "Rune Table (3×3)",
		"mana_furnace": "Mana Furnace",
		"chest": "Wooden Chest",
		"warehouse": "Forest Hamlet Warehouse",
		"automation": "Automation Inspection",
		"magic": "Magic Infrastructure",
		"abilities": "Ability and Action Bar",
		"request_board": "Hamlet Request Board",
		"npc": "Village Conversation",
		"creative": "Creative Testing Catalogue",
		"guide": "Current Guide",
		"inventory": "Inventory and Equipment",
		"village": "Forest Hamlet Overview",
		"map": "Discovered Local Map",
		"raid": "Raid Readiness and Aftermath",
		"pause": "Pause and Session",
		"settings": "Settings and Accessibility",
		"controls": "Controls and Input Rebinding",
		"help": "Help and Replayable Tutorials",
	}.get(craft_mode, craft_mode.capitalize())


func _refresh_vitals_and_abilities() -> void:
	if _health_hearts == null or _mana_pips == null:
		return
	var maximum := maxf(1.0, CombatState.player_max_health)
	var filled := clampi(
		ceili(CombatState.player_health / maximum * 10.0), 0, 10)
	_health_hearts.text = "♥".repeat(filled) + "♡".repeat(10 - filled)
	_health_hearts.tooltip_text = "Health %d/%d" % [
		roundi(CombatState.player_health), roundi(maximum)]
	var filled_mana := clampi(
		ceili(MagicState.mana / MagicState.MAX_MANA * 10.0), 0, 10)
	_mana_pips.text = String.chr(0x25C6).repeat(filled_mana) \
		+ String.chr(0x25C7).repeat(10 - filled_mana)
	_mana_pips.tooltip_text = "Mana %d/%d" % [
		roundi(MagicState.mana), roundi(MagicState.MAX_MANA)]
	_mana_pips.visible = ProgressionState.has_basic_magic_knowledge()
	if _item_hotbar_bar != null:
		_item_hotbar_bar.visible = not MagicState.action_bar_active
	if _ability_hotbar_bar != null:
		_ability_hotbar_bar.visible = MagicState.action_bar_active
	for i in mini(_ability_hud_buttons.size(), MagicState.ABILITY_SLOT_COUNT):
		var ability_id := MagicState.get_ability_slot(i)
		var definition := MagicState.spell_definition(ability_id)
		var name := str(definition.get("name", "Empty"))
		var cooldown := MagicState.cooldown_remaining(ability_id)
		_ability_hud_buttons[i].text = "%d\n%s%s" % [
			i + 1,
			name.replace(" ", "\n"),
			"\n%.1fs" % cooldown if cooldown > 0.0 else "",
		]
		_ability_hud_buttons[i].button_pressed = \
			i == MagicState.selected_ability_slot
		_ability_hud_buttons[i].tooltip_text = (
			"Press K to assign a learned skill."
			if ability_id.is_empty()
			else "%s · %.0f mana · Q switches bars · LMB uses it" % [
				name, float(definition.get("cost", 0.0))])


func _refresh_abilities() -> void:
	if _abilities_area == null or not _abilities_area.visible:
		return
	for i in mini(_ability_slot_buttons.size(), MagicState.ABILITY_SLOT_COUNT):
		var ability_id := MagicState.get_ability_slot(i)
		var name := str(
			MagicState.spell_definition(ability_id).get("name", "Empty"))
		_ability_slot_buttons[i].text = "%d\n%s" % [i + 1, name]
		_ability_slot_buttons[i].toggle_mode = true
		_ability_slot_buttons[i].button_pressed = i == _selected_ability_slot
	for spell_id in _known_ability_buttons:
		var button: Button = _known_ability_buttons[spell_id]
		var definition := MagicState.spell_definition(str(spell_id))
		var learned := MagicState.is_spell_known(str(spell_id))
		button.text = "%s%s\n%.0f mana · %.1fs cooldown" % [
			"✓ " if MagicState.ability_slots.has(str(spell_id)) else "",
			str(definition.get("name", spell_id)),
			float(definition.get("cost", 0.0)),
			float(definition.get("cooldown", 0.0)),
		]
		button.disabled = not learned
		button.tooltip_text = (
			"Learn this from the rune ruin or village mage."
			if not learned else "Assign to the selected slot.")


func _refresh_crafting() -> void:
	if not _crafting_area.visible:
		return
	var active := Inventory.get_active_craft_indices()
	_craft_grid.columns = 2 if craft_mode == "hand" else 3
	for i in Inventory.CRAFT_SIZE:
		_craft_buttons[i].visible = active.has(i)
		_paint_slot(_craft_buttons[i], Inventory.craft_grid[i])
	_paint_slot(_craft_output_button, Inventory.craft_output, false, "Output")
	var recipe := RecipeRegistry.get_recipe(Inventory.active_craft_recipe_id)
	_craft_result_label.text = str(recipe.get(
		"name",
		"No matching known recipe — inputs remain safe in the grid"))
	var station_recipes := RecipeRegistry.get_recipes_for_station(
		Inventory.crafting_station)
	var known: Array[String] = []
	var hinted := 0
	for station_recipe in station_recipes:
		var recipe_id := str(station_recipe.get("id", ""))
		if ProgressionState.is_recipe_known(recipe_id):
			known.append(str(station_recipe.get("name", recipe_id)))
		else:
			hinted += 1
	_recipe_knowledge_label.text = "Recipe knowledge: %d known · %d hinted/undiscovered%s" % [
		known.size(), hinted,
		"\nKnown here: %s" % ", ".join(known.slice(0, 4))
		if not known.is_empty() else "",
	]


func _refresh_chest() -> void:
	if not _chest_area.visible or player == null or player.world == null:
		return
	_craft_title.text = BlockRegistry.get_block_name(
		player.world.get_block_global(station_position))
	var slots := player.world.get_chest_state(station_position)
	if slots.is_empty():
		_set_craft_open(false)
		return
	for i in 27:
		_paint_slot(_chest_buttons[i], slots[i])


func _refresh_warehouse() -> void:
	if not _warehouse_area.visible:
		return
	var can_view := HamletState.permission_enabled("warehouse_view")
	var can_deposit := HamletState.permission_enabled("warehouse_deposit")
	var can_withdraw := HamletState.permission_enabled("warehouse_withdraw")
	var occupied := 0
	var stored_units := 0
	for stack in HamletState.warehouse_slots:
		if not stack.is_empty():
			occupied += 1
			stored_units += int(stack.get("count", 0))
	var reserved_units := 0
	for count in HamletState.project.get("reserved", {}).values():
		reserved_units += int(count)
	_warehouse_permission_label.text = "%s · %s\nPhysical stock: %d units in %d/%d slots · Project reserve: %d\nRecent contribution and shortages are explained in Village." % [
		HamletState.reputation_name(),
		"Deposit and withdraw" if can_withdraw else (
			"Approved direct deposits" if can_deposit
			else "Use the request board to make deliveries"),
		stored_units, occupied, HamletState.WAREHOUSE_SIZE, reserved_units,
	]
	_warehouse_grid.visible = can_view
	if can_view:
		for i in HamletState.WAREHOUSE_SIZE:
			_paint_slot(_warehouse_buttons[i], HamletState.get_warehouse_slot(i))


func _refresh_requests() -> void:
	if not _request_area.visible:
		return
	_ensure_request_buttons()
	_request_reputation_label.text = "%s · %d reputation" % [
		HamletState.reputation_name(), HamletState.reputation_points]
	var stage := HamletState.get_project_stage_definition()
	_request_project_label.text = "%s\nLocation: hamlet watchtower site · Worker: Talia Stonehand\nStage reward: %+d reputation · Effect: better raid warning and defence\nIncomplete stages provide no hidden defence bonus." % [
		HamletState.project_status_text(), int(stage.get("reward", 0))]
	for request in HamletState.get_requests():
		var request_id := str(request["id"])
		var button: Button = _request_buttons.get(request_id)
		if button == null:
			continue
		button.text = "%s%s\n%s" % [
			"✓ " if bool(request.get("complete", false)) else "",
			str(request["name"]),
			HamletState.request_progress_text(request_id),
		]
		button.disabled = bool(request.get("complete", false)) \
			or not HamletState.permission_enabled("request_delivery") \
			or not HamletState.is_request_available(request_id)


func _refresh_dialogue() -> void:
	if not _dialogue_area.visible:
		return
	var record := HamletState.get_npc_record(interaction_subject_id)
	if record.is_empty():
		_set_craft_open(false)
		return
	_dialogue_title.text = "%s · %s" % [record["name"], record["job"]]
	_dialogue_text.text = HamletState.get_dialogue(interaction_subject_id)
	var is_elder := str(record.get("job_id", "")) == "job.leader.elder"
	var is_guard := str(record.get("job_id", "")) == "job.guard.militia"
	_dialogue_action.visible = is_elder
	_dialogue_action.text = "Offer to help the hamlet" \
		if HamletState.reputation_state == HamletState.REP_STRANGER \
		else "Open the request board"
	_raid_action.visible = is_guard and CombatState.phase in ["dormant", "resolved"]
	if _raid_action.visible:
		if CombatState.phase == "dormant":
			_raid_action.text = "Sound the Stage 7 raid warning"
		elif CombatState.unresolved_damage_count() > 0:
			_raid_action.text = "Repair next damaged voxel (1 Oak Beam)"
		else:
			_raid_action.text = "Reset raid test"


func _refresh_furnace() -> void:
	if craft_mode not in ["furnace", "mana_furnace"] \
			or not craft_open or player == null or player.world == null:
		return
	var state := player.world.get_furnace_state(station_position)
	if state.is_empty():
		_set_craft_open(false)
		return
	for i in 3:
		_paint_slot(_furnace_input_buttons[i], state["inputs"][i], false, "Input %d" % (i + 1))
	_paint_slot(
		_furnace_fuel_button, state["fuel"], false,
		"Network Mana" if craft_mode == "mana_furnace" else "Fuel")
	_furnace_fuel_button.disabled = craft_mode == "mana_furnace"
	_paint_slot(_furnace_output_button, state["output"], false, "Output")
	var recipe := RecipeRegistry.get_recipe(str(state.get("recipe_id", "")))
	var duration := float(recipe.get("seconds", 0.0))
	var percent := 0
	if duration > 0.0:
		percent = clampi(roundi(float(state["progress"]) / duration * 100.0), 0, 100)
	var process_status := str(recipe.get("name", "Missing valid input"))
	var output: Dictionary = state.get("output", {})
	if not output.is_empty() \
			and int(output.get("count", 0)) >= Inventory.stack_max_count(output):
		process_status = "OUTPUT BLOCKED - take or route the finished stack"
	elif not recipe.is_empty() and float(state.get("burn_remaining", 0.0)) <= 0.0 \
			and state.get("fuel", {}).is_empty() and craft_mode == "furnace":
		process_status = "NO FUEL - insert coal, logs, or planks"
	if craft_mode == "mana_furnace":
		var inspection: Dictionary = player.world.get_magic_inspection(
			station_position)
		var fault := str(player.world.get_magic_state(
			station_position).get("fault", "unavailable"))
		if fault in ["unlinked", "no_mana"]:
			process_status = "MAGIC FAULT - %s" % fault.replace("_", " ")
		_furnace_progress.text = "%s · %d%% · mana %.1f/%.1f · %s" % [
			process_status, percent,
			float(state.get("mana_spent", 0.0)),
			float(recipe.get("mana_cost", 0.0)),
			str(inspection.get("status", "offline")),
		]
	else:
		_furnace_progress.text = "%s · %d%% · fuel %.1fs" % [
			process_status,
			percent,
			float(state.get("burn_remaining", 0.0)),
		]


func _refresh_automation() -> void:
	if craft_mode != "automation" or not craft_open \
			or player == null or player.world == null:
		return
	var inspection := player.world.get_automation_inspection(station_position)
	if inspection.is_empty():
		_set_craft_open(false)
		return
	_craft_title.text = str(inspection.get("title", "Automation"))
	_automation_status_label.text = "Status: %s" % str(
		inspection.get("status", "Unknown"))
	var detail_lines: Array = inspection.get("lines", [])
	_automation_details_label.text = "\n".join(detail_lines)
	if _automation_overlay_enabled:
		_flow_overlay_label.text = "FLOW OVERLAY  ·  direction / status / destination\n%s" % (
			"\n".join(detail_lines.slice(0, 5))
			if not detail_lines.is_empty()
			else "No active ports or route are reported for this machine.")
	var action := str(inspection.get("action", ""))
	_automation_action_button.visible = not action.is_empty()
	_automation_action_button.text = action
	var requires_wrench := bool(inspection.get("requires_wrench", false))
	var selected_stable_id := Inventory.stack_stable_id(Inventory.get_selected_stack())
	_automation_action_button.tooltip_text = (
		"Select a Basic Wrench first."
		if requires_wrench and selected_stable_id != "item.tool.wrench_basic"
		else action)
	var recent := HamletState.get_recent_automation_deliveries(3)
	var ledger_lines: Array[String] = []
	for entry in recent:
		var stack := Inventory.make_stack_from_ref({
			"kind": str(entry.get("kind", "item")),
			"stable_id": str(entry.get("stable_id", "")),
			"count": int(entry.get("count", 1)),
		})
		ledger_lines.append("%s: %d x %s" % [
			str(entry.get("mode", "donation")).capitalize(),
			int(entry.get("count", 0)),
			Inventory.stack_name(stack),
		])
	_automation_ledger_label.text = "Recent warehouse deliveries\n%s" % (
		"No automated deliveries yet."
		if ledger_lines.is_empty() else "\n".join(ledger_lines))


func _refresh_magic() -> void:
	if craft_mode != "magic" or not craft_open \
			or player == null or player.world == null:
		return
	var inspection := player.world.get_magic_inspection(station_position)
	if inspection.is_empty():
		_set_craft_open(false)
		return
	_craft_title.text = str(inspection.get("title", "Magic Infrastructure"))
	_magic_status_label.text = "Status: %s" % str(
		inspection.get("status", "Unknown"))
	var lines: Array = inspection.get("lines", [])
	_magic_details_label.text = "\n".join(lines)
	var action := str(inspection.get("action", ""))
	_magic_action_button.visible = not action.is_empty()
	_magic_action_button.text = action
	_magic_action_button.tooltip_text = action


func _refresh_stage8() -> void:
	_refresh_objective()
	_refresh_inventory_summary()
	_refresh_village_overview()
	_refresh_map()
	_refresh_raid_overview()
	_refresh_bindings()
	if _help_list != null and _help_list.item_count > 0 \
			and _help_list.get_selected_items().is_empty():
		_help_list.select(0)
		_on_help_selected(0)


func _refresh_objective() -> void:
	if _objective_title == null:
		return
	var objective := UIState.current_objective()
	_objective_title.text = "TRACKED  ·  %s" % str(objective.get("title", "Explore"))
	_objective_text.text = str(objective.get("instruction", ""))
	_objective_panel.tooltip_text = str(objective.get("cause", ""))
	if _guide_title != null:
		_guide_title.text = str(objective.get("title", "Explore"))
		_guide_instruction.text = str(objective.get("instruction", ""))
		_guide_cause.text = str(objective.get("cause", ""))
	var tutorial_mode := str(UIState.settings.get("tutorial_mode", "contextual"))
	var hud_preset := str(UIState.settings.get("hud_preset", "standard"))
	_objective_panel.visible = not craft_open \
		and tutorial_mode != "minimal" and hud_preset != "immersive"


func _refresh_combat_status() -> void:
	if _target_status_label == null:
		return
	match CombatState.phase:
		"warning":
			_target_status_label.visible = true
			_target_status_label.text = "RAID WARNING  ·  %ds\nDirection: raid approach  ·  Open Raid for readiness" % \
				ceili(CombatState.phase_seconds)
		"assault":
			_target_status_label.visible = true
			_target_status_label.text = "RAID ACTIVE\nEnemies remaining: %d  ·  Guards and civilians at risk" % \
				CombatState.living_enemy_count()
		"resolved":
			_target_status_label.visible = true
			_target_status_label.text = "AFTERMATH  ·  %s\nRepairs remaining: %d  ·  Open Raid for cause and effect" % [
				str(CombatState.outcome.get("title", "Resolved")),
				CombatState.unresolved_damage_count(),
			]
		_:
			_target_status_label.visible = false


func _refresh_inventory_summary() -> void:
	if _inventory_list == null or craft_mode != "inventory":
		return
	var query := _inventory_search.text.strip_edges().to_lower()
	var selected_stable := ""
	var selected := _inventory_list.get_selected_items()
	if not selected.is_empty():
		var previous: Dictionary = _inventory_list.get_item_metadata(selected[0])
		selected_stable = Inventory.stack_stable_id(previous.get("stack", {}))
	_inventory_list.clear()
	var rows: Array[Dictionary] = []
	for i in HOTBAR_SLOTS:
		if not Inventory.hotbar[i].is_empty():
			rows.append({"group": "hotbar", "index": i, "stack": Inventory.hotbar[i]})
	for i in Inventory.BACKPACK_SIZE:
		if not Inventory.backpack[i].is_empty():
			rows.append({"group": "backpack", "index": i, "stack": Inventory.backpack[i]})
	for row in rows:
		var stack: Dictionary = row["stack"]
		var searchable := "%s %s %s" % [
			Inventory.stack_name(stack), Inventory.stack_stable_id(stack),
			Inventory.stack_kind(stack)]
		if not query.is_empty() and query not in searchable.to_lower():
			continue
		var amount := "durability %d/%d" % [
			int(stack.get("instance", {}).get("durability", 0)),
			int(stack.get("instance", {}).get("max_durability", 0)),
		] if stack.has("instance") else "count %d" % int(stack.get("count", 0))
		_inventory_list.add_item("%s  —  %s  [%s %d]" % [
			Inventory.stack_name(stack), amount,
			str(row["group"]).capitalize(), int(row["index"]) + 1])
		var index := _inventory_list.item_count - 1
		_inventory_list.set_item_metadata(index, row)
		if Inventory.stack_stable_id(stack) == selected_stable:
			_inventory_list.select(index)
	if _inventory_list.item_count == 0:
		_inventory_details.text = "No matching stacks. Clearing a search never changes inventory state."
	elif _inventory_list.get_selected_items().is_empty():
		_inventory_list.select(0)
		_on_inventory_summary_selected(0)


func _refresh_village_overview() -> void:
	if _village_area == null or craft_mode != "village":
		return
	var injured := 0
	for npc_id in HamletState.get_npc_ids():
		if bool(HamletState.get_npc_record(npc_id).get("injured", false)):
			injured += 1
	var active_requests := 0
	for request in HamletState.get_requests():
		if HamletState.is_request_available(str(request.get("id", ""))) \
				and not bool(request.get("complete", false)):
			active_requests += 1
	_village_summary.text = "%s  ·  %d reputation\nPopulation %d  ·  Injured %d  ·  Active shortages %d" % [
		HamletState.reputation_name(), HamletState.reputation_points,
		HamletState.get_npc_ids().size(), injured, active_requests,
	]
	var stage := HamletState.get_project_stage_definition()
	var permissions: Array[String] = []
	for permission_id in [
		"request_delivery", "warehouse_view", "warehouse_deposit",
		"warehouse_withdraw", "automation_import",
	]:
		permissions.append("%s %s" % [
			"[OPEN]" if HamletState.permission_enabled(permission_id) else "[LOCKED]",
			permission_id.replace("_", " ").capitalize(),
		])
	_village_project.text = "WATCHTOWER PROJECT\n%s\nCurrent stage: %s\n\nPERMISSIONS\n%s" % [
		HamletState.project_status_text(),
		"Complete" if bool(HamletState.project.get("complete", false)) \
			else str(stage.get("name", "Current stage")),
		"\n".join(permissions),
	]
	var recent := HamletState.get_recent_automation_deliveries(3)
	var changes: Array[String] = []
	for entry in recent:
		changes.append("%s: %d × %s" % [
			str(entry.get("mode", "delivery")).capitalize(),
			int(entry.get("count", 0)),
			str(entry.get("stable_id", "")).replace("_", " "),
		])
	_village_history.text = "RECENT AUTOMATION CONTRIBUTION\n%s" % (
		"No automated warehouse deliveries recorded."
		if changes.is_empty() else "\n".join(changes))


func _refresh_map() -> void:
	if _map_view == null or player == null or player.world == null:
		return
	var objective := UIState.current_objective()
	var route_values: Array = player.world.valley_plan.routes \
		if player.world.valley_plan != null else []
	var player_position := player.position
	if player.is_inside_tree():
		player_position = player.global_position
	_map_view.set_map_data(
		player.world.get_valley_anchors(), route_values,
		UIState.discovered_anchors,
		Vector2(player_position.x, player_position.z),
		str(objective.get("anchor_id", "")), UIState.custom_pin,
		UIState.has_custom_pin)
	_map_summary.text = "%d landmarks discovered  ·  Tracked: %s\nWorld reports reveal knowledge; undiscovered sites remain hidden." % [
		UIState.discovered_anchors.size(),
		str(objective.get("title", "Explore")),
	]


func _refresh_raid_overview() -> void:
	if _raid_area == null or craft_mode != "raid":
		return
	var preparation: Dictionary = CombatState.preparation
	if preparation.is_empty() and raid_runtime != null \
			and raid_runtime.has_method("preparation_snapshot"):
		preparation = raid_runtime.call("preparation_snapshot")
	if CombatState.phase == "resolved":
		var outcome := CombatState.outcome
		_raid_summary.text = "AFTERMATH  ·  %s" % str(
			outcome.get("title", "Resolved"))
		var stolen_total := 0
		for stack in CombatState.stolen_stacks:
			stolen_total += int(stack.get("count", 0))
		_raid_details.text = "CAUSE\nPreparation %d versus camp pressure %d\n\nCONSEQUENCES\nDefeated enemies: %d\nInjured villagers: %d\nResources stolen: %d\nStructure damage: %d\nReputation change: %+d\n\nFOLLOW-UP\nRepairs restore recorded original voxels and consume one Oak Beam each." % [
			int(outcome.get("preparation_score", 0)),
			int(outcome.get("camp_pressure", 0)),
			int(outcome.get("defeated_enemies", 0)),
			int(outcome.get("injuries", 0)), stolen_total,
			int(outcome.get("damage_count", 0)),
			int(outcome.get("reputation_delta", 0)),
		]
		_raid_repair_button.visible = true
		_raid_repair_button.text = (
			"Repair next damage (1 Oak Beam)"
			if CombatState.unresolved_damage_count() > 0
			else "Reset raid test with Elric")
		return
	var score := 0
	var readiness: Array[String] = []
	for entry in [
		["tower_stages", "Watchtower stages", 0],
		["guard_ready", "Guard ready", false],
		["food_stocked", "Warehouse food", false],
		["lighting_ready", "Village lighting", false],
		["ward_active", "Powered ward coverage", false],
	]:
		var key := str(entry[0])
		var value: Variant = preparation.get(key, entry[2])
		var ready := int(value) > 0 if key == "tower_stages" else bool(value)
		readiness.append("%s %s%s" % [
			"[READY]" if ready else "[MISSING]",
			str(entry[1]),
			" (%d/4)" % int(value) if key == "tower_stages" else "",
		])
	score = CombatState.preparation_score() if not CombatState.preparation.is_empty() \
		else int(preparation.get("tower_stages", 0)) * 10 \
			+ (20 if bool(preparation.get("ward_active", false)) else 0) \
			+ (15 if bool(preparation.get("guard_ready", false)) else 0) \
			+ (10 if bool(preparation.get("food_stocked", false)) else 0) \
			+ (10 if bool(preparation.get("lighting_ready", false)) else 0)
	_raid_summary.text = "READINESS  ·  %s" % CombatState.status_text()
	_raid_details.text = "Confidence: %s\nApproach: raid road from the goblin camp\nReadiness score: %d  ·  Camp pressure: %d\n\n%s\n\nBetter infrastructure improves both warning confidence and the deterministic outcome." % [
		"confirmed" if int(preparation.get("tower_stages", 0)) >= 3 else "limited",
		score, int(preparation.get("camp_pressure", CombatState.camp_pressure)),
		"\n".join(readiness),
	]
	_raid_repair_button.visible = CombatState.phase == "dormant"
	_raid_repair_button.text = "Sound warning through Elric"


func _refresh_bindings() -> void:
	if _binding_buttons.is_empty():
		return
	for action in _binding_buttons:
		var button: Button = _binding_buttons[action]
		if action == _rebind_action:
			continue
		var conflict_text := ""
		var conflicts := UIState.binding_conflicts(action)
		if not conflicts.is_empty():
			conflict_text = "  [CONFLICT: %s]" % ", ".join(conflicts)
		button.text = "%s  —  %s%s" % [
			UIState.action_label(action), UIState.binding_text(action),
			conflict_text]
	if _hud_hint_label != null:
		_hud_hint_label.text = "%s Guide  ·  %s Inventory  ·  %s Craft  ·  %s Map  ·  %s Item/Skill Bar" % [
			UIState.binding_text("toggle_guide"),
			UIState.binding_text("toggle_inventory"),
			UIState.binding_text("toggle_craft"),
			UIState.binding_text("toggle_map"),
			UIState.binding_text("toggle_action_bar"),
		]


func _apply_ui_settings() -> void:
	if _craft_panel == null:
		return
	var scale := UIState.setting_float("ui_scale", 1.0)
	get_window().content_scale_factor = scale
	var high_contrast := UIState.setting_bool("high_contrast")
	var panel_style := StyleBoxFlat.new()
	panel_style.bg_color = Color(0.01, 0.012, 0.015, 0.98) \
		if high_contrast else Color(0.055, 0.05, 0.04, 0.94)
	panel_style.border_color = Color.WHITE if high_contrast \
		else Color(0.7, 0.58, 0.32, 0.8)
	panel_style.set_border_width_all(3 if high_contrast else 2)
	panel_style.set_corner_radius_all(4)
	_craft_panel.add_theme_stylebox_override("panel", panel_style)
	if _objective_panel != null:
		_objective_panel.add_theme_stylebox_override("panel", panel_style)
	var preset := str(UIState.settings.get("hud_preset", "standard"))
	_status_label.visible = preset != "immersive"
	_hud_hint_label.visible = preset != "immersive"
	_refresh_objective()
	_refresh_bindings()


func _show_context(message: String) -> void:
	_context_label.text = message
	_context_seconds = 4.0 if UIState.setting_bool("captions") else 2.5
