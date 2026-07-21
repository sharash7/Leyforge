class_name Hud
extends CanvasLayer
## Hotbar + crosshair + 2x2 crafting panel, driven by the Inventory autoload.

const HOTBAR_SLOTS := 9

var player: Player
var craft_open := false

var _hotbar_buttons: Array[Button] = []
var _craft_buttons: Array[Button] = []
var _output_button: Button
var _craft_panel: PanelContainer


func _ready() -> void:
	_build_ui()
	Inventory.hotbar_changed.connect(_refresh_hotbar)
	Inventory.craft_grid_changed.connect(_refresh_crafting)
	Inventory.selected_slot_changed.connect(func(_i: int) -> void: _refresh_hotbar())
	_refresh_hotbar()
	_refresh_crafting()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if craft_open:
			_set_craft_open(false)
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		return
	if event.is_action_pressed("toggle_craft"):
		_set_craft_open(not craft_open)
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


func _set_craft_open(open: bool) -> void:
	craft_open = open
	_craft_panel.visible = open
	if player != null:
		player.controls_locked = open
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if open else Input.MOUSE_MODE_CAPTURED


# ---------- UI construction ----------

func _build_ui() -> void:
	# Crosshair.
	var crosshair := CenterContainer.new()
	crosshair.set_anchors_preset(Control.PRESET_FULL_RECT)
	var dot := Label.new()
	dot.text = "+"
	dot.add_theme_font_size_override("font_size", 24)
	dot.add_theme_color_override("font_color", Color(1, 1, 1, 0.85))
	crosshair.add_child(dot)
	add_child(crosshair)

	# Hotbar.
	var bar := HBoxContainer.new()
	bar.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	bar.position = Vector2(-(HOTBAR_SLOTS * 60) / 2.0, -76)
	bar.add_theme_constant_override("separation", 4)
	for i in HOTBAR_SLOTS:
		var b := Button.new()
		b.custom_minimum_size = Vector2(56, 56)
		b.focus_mode = Control.FOCUS_NONE
		b.pressed.connect(_on_hotbar_pressed.bind(i))
		bar.add_child(b)
		_hotbar_buttons.append(b)
	add_child(bar)

	# Hint line.
	var hint := Label.new()
	hint.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	hint.position = Vector2(0, -18)
	hint.text = "LMB break · RMB place · 1-9 / wheel select · E craft · Esc mouse"
	hint.add_theme_color_override("font_color", Color(1, 1, 1, 0.6))
	hint.add_theme_font_size_override("font_size", 12)
	add_child(hint)

	# Crafting panel (2x2 grid + output).
	_craft_panel = PanelContainer.new()
	_craft_panel.set_anchors_preset(Control.PRESET_CENTER)
	_craft_panel.position = Vector2(-170, -130)
	_craft_panel.visible = false
	var vbox := VBoxContainer.new()
	vbox.add_theme_constant_override("separation", 10)
	var title := Label.new()
	title.text = "Crafting (2x2)"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(title)
	var row := HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 20)
	var grid := GridContainer.new()
	grid.columns = 2
	grid.add_theme_constant_override("h_separation", 4)
	grid.add_theme_constant_override("v_separation", 4)
	for i in 4:
		var b := Button.new()
		b.custom_minimum_size = Vector2(64, 64)
		b.focus_mode = Control.FOCUS_NONE
		b.tooltip_text = "Click: add selected hotbar block / take back"
		b.pressed.connect(_on_craft_slot_pressed.bind(i))
		grid.add_child(b)
		_craft_buttons.append(b)
	row.add_child(grid)
	var arrow := Label.new()
	arrow.text = "->"
	arrow.add_theme_font_size_override("font_size", 28)
	row.add_child(arrow)
	_output_button = Button.new()
	_output_button.custom_minimum_size = Vector2(64, 64)
	_output_button.focus_mode = Control.FOCUS_NONE
	_output_button.tooltip_text = "Click to craft"
	_output_button.pressed.connect(_on_output_pressed)
	row.add_child(_output_button)
	vbox.add_child(row)
	_craft_panel.add_child(vbox)
	add_child(_craft_panel)


# ---------- Callbacks ----------

func _on_hotbar_pressed(i: int) -> void:
	Inventory.select_slot(i)


func _on_craft_slot_pressed(i: int) -> void:
	if Inventory.get_craft_slot(i).is_empty():
		Inventory.move_hotbar_to_craft(Inventory.selected_slot, i, 1)
	else:
		Inventory.return_craft_to_hotbar(i)


func _on_output_pressed() -> void:
	var out: Dictionary = Inventory.take_craft_output()
	if out.is_empty():
		return
	var leftover: int = Inventory.add_item(int(out["id"]), int(out["count"]))
	if leftover > 0:
		push_warning("Hud: no hotbar room for %d x %s" % [leftover, BlockRegistry.get_block_name(int(out["id"]))])


# ---------- Painting ----------

func _paint_slot(b: Button, stack: Dictionary, selected := false) -> void:
	var style := StyleBoxFlat.new()
	style.border_color = Color(1, 0.85, 0.2, 1.0) if selected else Color(1, 1, 1, 0.25)
	var w := 3 if selected else 2
	style.border_width_left = w
	style.border_width_right = w
	style.border_width_top = w
	style.border_width_bottom = w
	if stack.is_empty():
		style.bg_color = Color(0, 0, 0, 0.5)
		b.text = ""
	else:
		var id := int(stack["id"])
		var count := int(stack["count"])
		var c := BlockRegistry.get_color(id)
		style.bg_color = c
		var label := BlockRegistry.get_block_name(id)
		b.text = "%s\n%d" % [label, count] if count > 1 else label
		b.add_theme_font_size_override("font_size", 10)
		b.add_theme_color_override("font_color", Color.WHITE if c.get_luminance() < 0.5 else Color.BLACK)
	b.add_theme_stylebox_override("normal", style)


func _refresh_hotbar() -> void:
	for i in HOTBAR_SLOTS:
		_paint_slot(_hotbar_buttons[i], Inventory.hotbar[i], i == Inventory.selected_slot)


func _refresh_crafting() -> void:
	for i in 4:
		_paint_slot(_craft_buttons[i], Inventory.craft_grid[i])
	_paint_slot(_output_button, Inventory.craft_output)
