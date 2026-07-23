class_name Hud
extends CanvasLayer
## Contextual inventory, Minecraft-style crafting, furnace, and chest UI.

const HOTBAR_SLOTS := 9
const INVALID_TARGET := Vector3i(0, -100000, 0)
const StackIconRendererScript = preload("res://scripts/ui/stack_icon_renderer.gd")
const EXTERNAL_SLOT_GROUPS: Array[String] = [
	"chest", "warehouse", "furnace_input", "furnace_fuel", "furnace_output",
]

var player: Player
var craft_open := false
var craft_mode := "hand"
var station_position := INVALID_TARGET
var interaction_subject_id := ""
var _icon_renderer := StackIconRendererScript.new()

var _hotbar_buttons: Array[InventorySlotButton] = []
var _backpack_buttons: Array[InventorySlotButton] = []
var _craft_buttons: Array[InventorySlotButton] = []
var _chest_buttons: Array[InventorySlotButton] = []
var _warehouse_buttons: Array[InventorySlotButton] = []
var _craft_panel: PanelContainer
var _craft_title: Label
var _crafting_area: VBoxContainer
var _craft_grid: GridContainer
var _craft_output_button: Button
var _craft_result_label: Label
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
var _magic_area: VBoxContainer
var _magic_status_label: Label
var _magic_details_label: Label
var _magic_action_button: Button
var _request_area: VBoxContainer
var _request_reputation_label: Label
var _request_project_label: Label
var _request_buttons: Dictionary = {}
var _dialogue_area: VBoxContainer
var _dialogue_title: Label
var _dialogue_text: Label
var _dialogue_action: Button
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
var _context_label: Label
var _status_accum := 0.0
var _context_seconds := 0.0


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
	_refresh_all()


func _process(delta: float) -> void:
	_status_accum += delta
	_context_seconds = maxf(0.0, _context_seconds - delta)
	if _context_seconds <= 0.0 and _context_label != null:
		_context_label.text = ""
	if player != null:
		if not player.interaction_message.is_connected(_show_context):
			player.interaction_message.connect(_show_context)
		if not player.interaction_requested.is_connected(_on_interaction_requested):
			player.interaction_requested.connect(_on_interaction_requested)
	if _status_accum < 0.25:
		return
	_status_accum = 0.0
	_update_status()
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
	_status_label.text = "Seed %d  ·  %s  ·  %s  ·  %s  ·  (%d, %d, %d)  ·  %d FPS" % [
		player.world.world_seed, player.world.biome_name_at(pos.x, pos.z),
		landmark, HamletState.get_clock_text(), floori(pos.x), floori(pos.y), floori(pos.z),
		Engine.get_frames_per_second(),
	]
	_magic_hud_label.text = "%s  ·  Z Stone Sense  ·  X Spark Bolt" % \
		MagicState.status_text()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if craft_open:
			_set_craft_open(false)
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		return
	if event.is_action_pressed("toggle_creative"):
		if craft_open and craft_mode == "creative":
			_set_craft_open(false)
		else:
			_open_mode("creative", INVALID_TARGET)
		return
	if event.is_action_pressed("toggle_craft"):
		if craft_open:
			_set_craft_open(false)
		else:
			_open_mode("hand", INVALID_TARGET)
		return
	for i in HOTBAR_SLOTS:
		if event.is_action_pressed("hotbar_%d" % (i + 1)):
			Inventory.select_slot(i)
			return
	if event is InputEventMouseButton and event.pressed and not craft_open:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			Inventory.cycle_slot(-1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			Inventory.cycle_slot(1)


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

	var bar := HBoxContainer.new()
	bar.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	bar.position = Vector2(-(HOTBAR_SLOTS * 60) / 2.0, -76)
	bar.add_theme_constant_override("separation", 4)
	for i in HOTBAR_SLOTS:
		var button := InventorySlotButton.new()
		button.setup(self, "hotbar", i)
		button.custom_minimum_size = Vector2(56, 56)
		button.focus_mode = Control.FOCUS_NONE
		button.pressed.connect(_on_hotbar_pressed.bind(i))
		bar.add_child(button)
		_hotbar_buttons.append(button)
	add_child(bar)

	var hint := Label.new()
	hint.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	hint.position = Vector2(0, -18)
	hint.text = "LMB harvest · RMB place/interact · E inventory/craft · C creative · drag slots · Esc mouse"
	hint.text = "LMB harvest · RMB interact · Z Stone Sense · X Spark Bolt · E craft · C creative · Esc mouse"
	hint.add_theme_color_override("font_color", Color(1, 1, 1, 0.65))
	hint.add_theme_font_size_override("font_size", 12)
	add_child(hint)

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

	_build_furnace_ui(root_box)
	var body := HBoxContainer.new()
	body.add_theme_constant_override("separation", 14)
	var left := VBoxContainer.new()
	left.custom_minimum_size = Vector2(420, 390)
	_build_crafting_ui(left)
	_build_chest_ui(left)
	_build_warehouse_ui(left)
	_build_automation_ui(left)
	_build_magic_ui(left)
	_build_request_ui(left)
	_build_dialogue_ui(left)
	_build_creative_ui(left)
	body.add_child(left)
	_build_backpack_ui(body)
	root_box.add_child(body)

	var close_hint := Label.new()
	close_hint.text = "Click or drag inventory slots · E / C / Esc closes"
	close_hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	close_hint.add_theme_color_override("font_color", Color(1, 1, 1, 0.6))
	root_box.add_child(close_hint)
	_craft_panel.add_child(root_box)
	add_child(_craft_panel)


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
		button.focus_mode = Control.FOCUS_NONE
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
		button.focus_mode = Control.FOCUS_NONE
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
		button.focus_mode = Control.FOCUS_NONE
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
		input_button.focus_mode = Control.FOCUS_NONE
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
	_furnace_fuel_button.focus_mode = Control.FOCUS_NONE
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
	_furnace_output_button.focus_mode = Control.FOCUS_NONE
	_furnace_output_button.tooltip_text = "Take refined output"
	_furnace_output_button.pressed.connect(_on_furnace_output)
	_furnace_row.add_child(_furnace_output_button)
	parent.add_child(_furnace_row)
	_furnace_progress = Label.new()
	_furnace_progress.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	parent.add_child(_furnace_progress)


func _build_backpack_ui(parent: HBoxContainer) -> void:
	var storage_box := VBoxContainer.new()
	var storage_title := Label.new()
	storage_title.text = "Backpack"
	storage_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	storage_box.add_child(storage_title)
	var storage_grid := GridContainer.new()
	storage_grid.columns = 6
	for i in Inventory.BACKPACK_SIZE:
		var button := InventorySlotButton.new()
		button.setup(self, "backpack", i)
		button.custom_minimum_size = Vector2(50, 50)
		button.focus_mode = Control.FOCUS_NONE
		button.pressed.connect(_on_backpack_pressed.bind(i))
		storage_grid.add_child(button)
		_backpack_buttons.append(button)
	storage_box.add_child(storage_grid)
	parent.add_child(storage_box)


# ---------- Click and drag transfers ----------

func _on_hotbar_pressed(index: int) -> void:
	Inventory.select_slot(index)


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


func _on_automation_action() -> void:
	if player == null or player.world == null:
		return
	var result := player.world.perform_automation_action(station_position)
	_show_context(str(result.get("message", "Automation action failed.")))
	_refresh_automation()


func _on_magic_action() -> void:
	if player == null or player.world == null:
		return
	var result := player.world.perform_magic_action(station_position)
	_show_context(str(result.get("message", "Magic action failed.")))
	_refresh_magic()


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


func _refresh_context_visibility() -> void:
	_crafting_area.visible = craft_mode in ["hand", "workbench", "rune_table"]
	_chest_area.visible = craft_mode == "chest"
	_warehouse_area.visible = craft_mode == "warehouse"
	_automation_area.visible = craft_mode == "automation"
	_magic_area.visible = craft_mode == "magic"
	_request_area.visible = craft_mode == "request_board"
	_dialogue_area.visible = craft_mode == "npc"
	_creative_area.visible = craft_mode == "creative"
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
		"request_board": "Hamlet Request Board",
		"npc": "Village Conversation",
		"creative": "Creative Testing Catalogue",
	}.get(craft_mode, craft_mode.capitalize())


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
	_craft_result_label.text = str(recipe.get("name", "No matching recipe"))


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
	_warehouse_permission_label.text = "%s · %s" % [
		HamletState.reputation_name(),
		"Deposit and withdraw" if can_withdraw else (
			"Approved direct deposits" if can_deposit
			else "Use the request board to make deliveries"),
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
	_request_project_label.text = HamletState.project_status_text()
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
	_dialogue_action.visible = is_elder
	_dialogue_action.text = "Offer to help the hamlet" \
		if HamletState.reputation_state == HamletState.REP_STRANGER \
		else "Open the request board"


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


func _show_context(message: String) -> void:
	_context_label.text = message
	_context_seconds = 2.5
