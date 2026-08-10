extends Control
## Startup shell for selecting worlds and editing the global player profile.

const GAME_SCENE := "res://main.tscn"
const FORGE_SCENE := "res://forge_runtime_host.tscn"

var _continue_button: Button
var _worlds_button: Button
var _page_title: Label
var _page_scroll: ScrollContainer
var _page: VBoxContainer
var _world_name: LineEdit
var _seed_entry: LineEdit
var _seed_preview: Label
var _create_status: Label
var _random_preview_seed := 0
var _pending_binding := ""
var _binding_buttons: Dictionary = {}
var _dialog: AcceptDialog


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = false
	_build_shell()
	WorldManager.worlds_changed.connect(_refresh_continue)
	_refresh_continue()
	_show_welcome()
	call_deferred("_focus_initial")


func _build_shell() -> void:
	var background := ColorRect.new()
	background.color = Color("#101922")
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(background)

	var margin := MarginContainer.new()
	margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	margin.add_theme_constant_override("margin_left", 48)
	margin.add_theme_constant_override("margin_right", 48)
	margin.add_theme_constant_override("margin_top", 36)
	margin.add_theme_constant_override("margin_bottom", 36)
	add_child(margin)

	var columns := HBoxContainer.new()
	columns.add_theme_constant_override("separation", 40)
	margin.add_child(columns)

	var navigation := VBoxContainer.new()
	navigation.custom_minimum_size = Vector2(300, 0)
	navigation.add_theme_constant_override("separation", 10)
	columns.add_child(navigation)

	var title := Label.new()
	title.text = "LEYFORGE"
	title.add_theme_font_size_override("font_size", 42)
	title.add_theme_color_override("font_color", Color("#f3d38a"))
	navigation.add_child(title)
	var subtitle := Label.new()
	subtitle.text = "Seeded Living Frontier"
	subtitle.add_theme_font_size_override("font_size", 17)
	subtitle.add_theme_color_override("font_color", Color("#9fb8c6"))
	navigation.add_child(subtitle)
	navigation.add_spacer(false)

	_continue_button = _nav_button("Continue", _continue_latest)
	navigation.add_child(_continue_button)
	_worlds_button = _nav_button("Worlds", _show_worlds)
	navigation.add_child(_worlds_button)
	navigation.add_child(_nav_button("New World", _show_new_world))
	navigation.add_child(_nav_button(
		"Settings & Accessibility", _show_settings))
	navigation.add_child(_nav_button("Controls", _show_controls))
	if ForgeAccessPolicy.is_development_enabled():
		navigation.add_child(_nav_button(
			"Developer Tools", _show_developer_tools))
	navigation.add_spacer(false)
	navigation.add_child(_nav_button("Quit", _quit))

	var separator := VSeparator.new()
	columns.add_child(separator)

	var content := VBoxContainer.new()
	content.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	content.add_theme_constant_override("separation", 16)
	columns.add_child(content)
	_page_title = Label.new()
	_page_title.add_theme_font_size_override("font_size", 30)
	_page_title.add_theme_color_override("font_color", Color("#f2ead6"))
	content.add_child(_page_title)
	_page_scroll = ScrollContainer.new()
	_page_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_page_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	content.add_child(_page_scroll)
	_page = VBoxContainer.new()
	_page.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_page.add_theme_constant_override("separation", 12)
	_page_scroll.add_child(_page)

	_dialog = AcceptDialog.new()
	_dialog.title = "Leyforge"
	add_child(_dialog)


func _nav_button(label: String, action: Callable) -> Button:
	var button := Button.new()
	button.text = label
	button.custom_minimum_size = Vector2(0, 48)
	button.alignment = HORIZONTAL_ALIGNMENT_LEFT
	button.pressed.connect(action)
	return button


func _clear_page(title: String) -> void:
	_pending_binding = ""
	_page_title.text = title
	for child in _page.get_children():
		_page.remove_child(child)
		child.queue_free()
	_page_scroll.scroll_vertical = 0


func _show_welcome() -> void:
	_clear_page("Ready to test the valley")
	_add_body(
		"Create randomized worlds, revisit an existing save, or tune your player-wide settings before loading terrain.")
	var world_count := WorldManager.list_worlds().size()
	_add_note("%d world%s available" % [
		world_count, "" if world_count == 1 else "s"])


func _refresh_continue() -> void:
	var latest := WorldManager.continue_world()
	_continue_button.disabled = latest.is_empty()
	_continue_button.tooltip_text = (
		"No playable worlds are available."
		if latest.is_empty()
		else "Continue %s" % str(latest.get("name", "World")))


func _focus_initial() -> void:
	if not _continue_button.disabled:
		_continue_button.grab_focus()
	else:
		_worlds_button.grab_focus()


func _continue_latest() -> void:
	var world := WorldManager.continue_world()
	if world.is_empty():
		_show_error("No playable world is available.")
		return
	_load_world(world)


func _show_worlds() -> void:
	_clear_page("Worlds")
	var worlds := WorldManager.list_worlds()
	if worlds.is_empty():
		_add_body("No worlds yet. Create one to begin randomized-world testing.")
		var new_button := Button.new()
		new_button.text = "Create New World"
		new_button.pressed.connect(_show_new_world)
		_page.add_child(new_button)
		return
	for world in worlds:
		_page.add_child(_world_card(world))


func _world_card(world: Dictionary) -> Control:
	var panel := PanelContainer.new()
	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 18)
	margin.add_theme_constant_override("margin_right", 18)
	margin.add_theme_constant_override("margin_top", 14)
	margin.add_theme_constant_override("margin_bottom", 14)
	panel.add_child(margin)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 18)
	margin.add_child(row)
	var details := VBoxContainer.new()
	details.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(details)
	var heading := Label.new()
	heading.text = str(world.get("name", "Unnamed World"))
	heading.add_theme_font_size_override("font_size", 22)
	details.add_child(heading)
	var original := str(world.get("seed_original", ""))
	if original.is_empty():
		original = "(random)"
	var health := str(world.get("save_health", "unknown"))
	var lines := [
		"Seed: %s  ->  %d" % [original, int(world.get("resolved_seed", 0))],
		"Last played: %s    Playtime: %s" % [
			_format_unix(int(world.get("last_played_unix", 0))),
			_format_duration(int(world.get("playtime_seconds", 0)))],
		"Save v%d    Worldgen v%d / Plan v%d" % [
			int(world.get("save_version", 0)),
			int(world.get("worldgen_version", 0)),
			int(world.get("plan_version", 0))],
		"Profile: %s" % str(world.get("profile_id", "unknown")),
		"Health: %s    Plan: %s" % [
			health.capitalize(),
			str(world.get("plan_id", "unavailable"))],
	]
	for line in lines:
		var label := Label.new()
		label.text = line
		label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		label.add_theme_color_override(
			"font_color",
			Color("#e1a5a5") if health in ["unrecoverable", "incompatible"]
				else Color("#b8c9cf"))
		details.add_child(label)
	var load := Button.new()
	load.text = "Load"
	load.custom_minimum_size = Vector2(110, 46)
	load.disabled = not WorldManager.is_world_playable(world)
	load.tooltip_text = (
		"This world remains visible, but its save cannot be safely loaded."
		if load.disabled else "Load this world")
	load.pressed.connect(_load_world.bind(world))
	row.add_child(load)
	return panel


func _show_new_world() -> void:
	_clear_page("New World")
	_add_body(
		"Every new world uses regional worldgen v4. Hamlets, caves, camps, ruins, mana, and resource sites use independent deterministic placement. The current testing profile guarantees a discoverable hamlet without fixing its direction.")
	_world_name = LineEdit.new()
	_world_name.placeholder_text = "World name"
	_world_name.max_length = 64
	_page.add_child(_labeled_control("World name", _world_name))
	_seed_entry = LineEdit.new()
	_seed_entry.placeholder_text = "Blank = random; signed number or case-sensitive text"
	_seed_entry.text_changed.connect(_on_seed_text_changed)
	_page.add_child(_labeled_control("Seed (optional)", _seed_entry))
	var seed_row := HBoxContainer.new()
	seed_row.add_theme_constant_override("separation", 12)
	_seed_preview = Label.new()
	_seed_preview.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	seed_row.add_child(_seed_preview)
	var reroll := Button.new()
	reroll.text = "Reroll"
	reroll.pressed.connect(_reroll_seed)
	seed_row.add_child(reroll)
	_page.add_child(seed_row)
	_create_status = Label.new()
	_create_status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_page.add_child(_create_status)
	var create := Button.new()
	create.text = "Create and Load World"
	create.custom_minimum_size = Vector2(0, 50)
	create.pressed.connect(_create_world)
	_page.add_child(create)
	_reroll_seed()
	_world_name.grab_focus()


func _on_seed_text_changed(_value: String) -> void:
	_refresh_seed_preview()


func _reroll_seed() -> void:
	var previous := _random_preview_seed
	_random_preview_seed = WorldManager.preview_random_seed()
	while _random_preview_seed == previous:
		_random_preview_seed = WorldManager.preview_random_seed()
	_refresh_seed_preview()


func _refresh_seed_preview() -> void:
	if not is_instance_valid(_seed_entry) or not is_instance_valid(_seed_preview):
		return
	var result := WorldManager.resolve_seed(_seed_entry.text)
	var resolved := _random_preview_seed \
		if str(result["kind"]) == "random" else int(result["resolved"])
	_seed_preview.text = "Resolved seed: %d (%s)" % [resolved, str(result["kind"])]
	var validation := WorldManager.validate_new_world_seed(resolved)
	if bool(validation["ok"]):
		_create_status.text = "Valid plan: %s" % str(validation["plan_id"])
		_create_status.add_theme_color_override("font_color", Color("#98d9a6"))
	else:
		_create_status.text = "Blocked seed %d: %s" % [
			resolved, ", ".join(validation["errors"])]
		_create_status.add_theme_color_override("font_color", Color("#e9a2a2"))


func _create_world() -> void:
	var result := WorldManager.create_world(
		_world_name.text, _seed_entry.text, _random_preview_seed)
	if not bool(result.get("ok", false)):
		var seed_text := ""
		if result.has("resolved_seed"):
			seed_text = "Seed %d: " % int(result["resolved_seed"])
		_show_error("%s%s" % [seed_text, ", ".join(result.get("errors", []))])
		return
	_load_selected_world()


func _load_world(world: Dictionary) -> void:
	if not WorldManager.select_world(world):
		_show_error("This world is not safely playable.")
		return
	_load_selected_world()


func _load_selected_world() -> void:
	var error := get_tree().change_scene_to_file(GAME_SCENE)
	if error != OK:
		_show_error("Could not open gameplay: %s" % error_string(error))


func _show_settings() -> void:
	_clear_page("Settings & Accessibility")
	_add_body(
		"These settings belong to your global player profile and are saved immediately. They follow you between worlds.")
	_add_option_setting("HUD preset", "hud_preset", [
		["Immersive", "immersive"], ["Standard", "standard"],
		["Accessibility", "accessibility"]])
	_add_option_setting("Tutorial detail", "tutorial_mode", [
		["Minimal", "minimal"], ["Contextual", "contextual"],
		["Guided", "guided"], ["Full", "full"]])
	_add_option_setting("Notifications", "notification_preset", [
		["Quiet", "quiet"], ["Standard", "standard"], ["Detailed", "detailed"]])
	_add_option_setting("Performance profile", "quality_profile", [
		["Performance", "performance"], ["Balanced", "balanced"],
		["Quality", "quality"]])
	_add_slider_setting("UI scale", "ui_scale", 0.8, 1.5, 0.05)
	_add_slider_setting("Aim assist", "aim_assist", 0.0, 1.0, 0.05)
	for entry in [
		["Captions", "captions"],
		["High contrast", "high_contrast"],
		["Reduced motion", "reduced_motion"],
		["Reduce flashes", "reduce_flashes"],
		["Toggle sprint", "toggle_sprint"],
	]:
		var check := CheckButton.new()
		check.text = str(entry[0])
		check.button_pressed = UIState.setting_bool(str(entry[1]))
		check.toggled.connect(_on_bool_setting.bind(str(entry[1])))
		_page.add_child(check)


func _add_option_setting(label_text: String, key: String, entries: Array) -> void:
	var option := OptionButton.new()
	for entry in entries:
		option.add_item(str(entry[0]))
		option.set_item_metadata(option.item_count - 1, entry[1])
		if str(entry[1]) == str(UIState.settings.get(key, "")):
			option.select(option.item_count - 1)
	option.item_selected.connect(_on_option_setting.bind(key, option))
	_page.add_child(_labeled_control(label_text, option))


func _on_option_setting(index: int, key: String, option: OptionButton) -> void:
	UIState.set_setting(key, option.get_item_metadata(index))


func _add_slider_setting(label_text: String, key: String,
		minimum: float, maximum: float, step: float) -> void:
	var row := HBoxContainer.new()
	var slider := HSlider.new()
	slider.min_value = minimum
	slider.max_value = maximum
	slider.step = step
	slider.value = UIState.setting_float(key)
	slider.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var value_label := Label.new()
	value_label.text = "%.2f" % slider.value
	value_label.custom_minimum_size = Vector2(52, 0)
	slider.value_changed.connect(_on_slider_setting.bind(key, value_label))
	row.add_child(slider)
	row.add_child(value_label)
	_page.add_child(_labeled_control(label_text, row))


func _on_slider_setting(value: float, key: String, value_label: Label) -> void:
	value_label.text = "%.2f" % value
	UIState.set_setting(key, value)


func _on_bool_setting(enabled: bool, key: String) -> void:
	UIState.set_setting(key, enabled)


func _show_controls() -> void:
	_clear_page("Controls")
	_add_body(
		"Select a binding, then press a keyboard, mouse, or controller input. Bindings save immediately and follow you between worlds.")
	_binding_buttons.clear()
	for action in UIState.REBINDABLE_ACTIONS:
		var row := HBoxContainer.new()
		var label := Label.new()
		label.text = UIState.action_label(action)
		label.custom_minimum_size = Vector2(220, 0)
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(label)
		var button := Button.new()
		button.text = UIState.binding_text(action)
		button.custom_minimum_size = Vector2(300, 42)
		button.pressed.connect(_begin_rebind.bind(action))
		row.add_child(button)
		_binding_buttons[action] = button
		_page.add_child(row)


func _show_developer_tools() -> void:
	_clear_page("Developer Tools")
	_add_body(
		"Development-only project tools. These entries are omitted from "
		+ "non-development builds and never become part of world save data.")
	var forge := Button.new()
	forge.text = "Leyforge Forge"
	forge.custom_minimum_size = Vector2(0, 54)
	forge.tooltip_text = (
		"Author and validate block, item and machine presentations")
	forge.pressed.connect(_open_forge)
	_page.add_child(forge)
	_add_note(
		"Forge sources use stable presentation links and retain the current "
		+ "legacy runtime as a safe fallback.")


func _open_forge() -> void:
	if not ForgeAccessPolicy.is_development_enabled():
		_show_error("Leyforge Forge is unavailable in this build.")
		return
	var error := get_tree().change_scene_to_file(FORGE_SCENE)
	if error != OK:
		_show_error("Could not open Leyforge Forge: %s" % error_string(error))


func _begin_rebind(action: String) -> void:
	_pending_binding = action
	for existing in _binding_buttons:
		var button: Button = _binding_buttons[existing]
		button.text = (
			"Press an input... (Esc cancels)"
			if existing == action else UIState.binding_text(existing))


func _input(event: InputEvent) -> void:
	if _pending_binding.is_empty() or not event.is_pressed() or event.is_echo():
		return
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		_pending_binding = ""
		_refresh_binding_buttons()
		get_viewport().set_input_as_handled()
		return
	if UIState.rebind_action(_pending_binding, event):
		var rebound := _pending_binding
		_pending_binding = ""
		_refresh_binding_buttons()
		var conflicts := UIState.binding_conflicts(rebound)
		if not conflicts.is_empty():
			_show_error("Binding saved. It is also used by: %s" % ", ".join(conflicts))
		get_viewport().set_input_as_handled()


func _refresh_binding_buttons() -> void:
	for action in _binding_buttons:
		var button: Button = _binding_buttons[action]
		button.text = UIState.binding_text(action)


func _labeled_control(label_text: String, control: Control) -> Control:
	var box := VBoxContainer.new()
	var label := Label.new()
	label.text = label_text
	label.add_theme_color_override("font_color", Color("#a9bdc7"))
	box.add_child(label)
	box.add_child(control)
	return box


func _add_body(text: String) -> void:
	var label := Label.new()
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.add_theme_font_size_override("font_size", 17)
	label.add_theme_color_override("font_color", Color("#c5d2d5"))
	_page.add_child(label)


func _add_note(text: String) -> void:
	var label := Label.new()
	label.text = text
	label.add_theme_color_override("font_color", Color("#89adba"))
	_page.add_child(label)


func _show_error(message: String) -> void:
	_dialog.dialog_text = message
	_dialog.popup_centered(Vector2i(620, 220))


func _format_unix(value: int) -> String:
	if value <= 0:
		return "Never"
	return Time.get_datetime_string_from_unix_time(value, true)


func _format_duration(seconds: int) -> String:
	var hours := seconds / 3600
	var minutes := (seconds % 3600) / 60
	return "%dh %02dm" % [hours, minutes]


func _quit() -> void:
	get_tree().quit()
