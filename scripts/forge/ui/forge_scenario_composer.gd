class_name ForgeScenarioComposer
extends VBoxContainer
## Visual isolated scenario composer backed by ForgePresentationTestScenario.
## Sources live under user:// and never touch gameplay-world saves.

signal status_changed(message: String, is_error: bool)
signal scenario_saved(scenario: ForgePresentationTestScenario)

const SCENARIO_ROOT := "user://leyforge/forge/test_scenarios"

var scenario: ForgePresentationTestScenario
var scenarios: Array[ForgePresentationTestScenario] = []
var available_records: Array[Dictionary] = []

var _scenario_selector: OptionButton
var _name: LineEdit
var _stable_id: Label
var _search: LineEdit
var _kind: OptionButton
var _palette: ItemList
var _graph: GraphEdit
var _fixture_selector: OptionButton
var _action_list: ItemList
var _action_kind: OptionButton
var _action_value: OptionButton
var _seed: SpinBox
var _instances: SpinBox
var _quality_full: CheckButton
var _quality_reduced: CheckButton
var _access_normal: CheckButton
var _access_motion: CheckButton
var _access_muted: CheckButton
var _summary: Label
var _is_new := false


func configure(
		existing: Array[ForgePresentationTestScenario],
		records: Array[Dictionary]) -> void:
	scenarios = existing
	available_records = records.duplicate(true)
	_build_ui()
	if scenarios.is_empty():
		_new_scenario()
	else:
		_open_scenario(0)


func _build_ui() -> void:
	add_theme_constant_override("separation", 8)
	var banner := Label.new()
	banner.text = (
		"VISUAL SCENARIO COMPOSER  |  Place fixtures and cues together, vary states, "
		+ "seeds and density, then save an isolated reusable test source.")
	banner.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	banner.add_theme_color_override("font_color", Color("#9DD6D1"))
	add_child(banner)
	var document := HBoxContainer.new()
	_scenario_selector = OptionButton.new()
	for existing in scenarios:
		_scenario_selector.add_item(existing.display_name)
		_scenario_selector.set_item_metadata(_scenario_selector.item_count - 1, existing)
	_scenario_selector.item_selected.connect(_open_scenario)
	document.add_child(_labeled("Open scenario", _scenario_selector))
	_name = LineEdit.new()
	_name.placeholder_text = "Scenario name"
	_name.text_changed.connect(_on_name_changed)
	document.add_child(_labeled("Name", _name))
	_stable_id = Label.new()
	_stable_id.custom_minimum_size.x = 300
	_stable_id.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	document.add_child(_labeled("Generated stable ID", _stable_id))
	document.add_child(_button("Blank scenario", _new_scenario))
	document.add_child(_button("Duplicate", _duplicate_scenario))
	document.add_child(_button("Save isolated source", _save_scenario))
	add_child(document)

	var split := HSplitContainer.new()
	split.custom_minimum_size = Vector2(0, 500)
	split.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var palette_stack := VBoxContainer.new()
	palette_stack.custom_minimum_size.x = 300
	_search = LineEdit.new()
	_search.placeholder_text = "Search structures, entities, items, VFX or audio"
	_search.text_changed.connect(func(_value: String) -> void: _refresh_palette())
	palette_stack.add_child(_search)
	_kind = OptionButton.new()
	_kind.add_item("All fixture types")
	_kind.set_item_metadata(0, "all")
	var kinds := PackedStringArray()
	for record in available_records:
		var value := str(record.get("foundation_kind", "source"))
		if value not in kinds:
			kinds.append(value)
	kinds.sort()
	for value in kinds:
		_kind.add_item(value.replace("_", " ").capitalize())
		_kind.set_item_metadata(_kind.item_count - 1, value)
	_kind.item_selected.connect(func(_index: int) -> void: _refresh_palette())
	palette_stack.add_child(_kind)
	_palette = ItemList.new()
	_palette.custom_minimum_size = Vector2(290, 365)
	_palette.size_flags_vertical = Control.SIZE_EXPAND_FILL
	palette_stack.add_child(_palette)
	palette_stack.add_child(_button("Place selected fixture", _place_fixture))
	split.add_child(palette_stack)
	_graph = GraphEdit.new()
	_graph.name = "ScenarioVisualCanvas"
	_graph.custom_minimum_size = Vector2(560, 470)
	_graph.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_graph.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_graph.show_grid = true
	_graph.minimap_enabled = true
	split.add_child(_graph)
	var inspector := VBoxContainer.new()
	inspector.custom_minimum_size.x = 340
	var action_title := Label.new()
	action_title.text = "SCENARIO INPUTS"
	action_title.add_theme_font_size_override("font_size", 17)
	inspector.add_child(action_title)
	_fixture_selector = OptionButton.new()
	inspector.add_child(_labeled("Target fixture", _fixture_selector))
	_action_kind = OptionButton.new()
	for value in ["construction_stage", "structure_state", "animation",
			"presentation_event", "spawn", "remove"]:
		_action_kind.add_item(value.replace("_", " ").capitalize())
		_action_kind.set_item_metadata(_action_kind.item_count - 1, value)
	inspector.add_child(_labeled("Input", _action_kind))
	_action_value = OptionButton.new()
	for value in ["default", "foundation", "frame", "enclosure", "functional",
			"intact", "damaged", "repaired", "idle", "walk", "activate"]:
		_action_value.add_item(value.capitalize())
		_action_value.set_item_metadata(_action_value.item_count - 1, value)
	inspector.add_child(_labeled("State / value", _action_value))
	var numeric := HBoxContainer.new()
	_seed = SpinBox.new()
	_seed.min_value = 0
	_seed.max_value = 2147483647
	_seed.value = 23006
	numeric.add_child(_labeled("Seed", _seed))
	_instances = SpinBox.new()
	_instances.min_value = 1
	_instances.max_value = 10000
	_instances.value = 1
	numeric.add_child(_labeled("Instances", _instances))
	inspector.add_child(numeric)
	inspector.add_child(_button("Add scenario input", _add_action))
	_action_list = ItemList.new()
	_action_list.custom_minimum_size = Vector2(330, 120)
	inspector.add_child(_action_list)
	inspector.add_child(_button("Remove selected input", _remove_action))
	var variants := GridContainer.new()
	variants.columns = 2
	_quality_full = _check("Full quality", true)
	_quality_reduced = _check("Reduced quality", true)
	_access_normal = _check("Normal", true)
	_access_motion = _check("Reduced motion", true)
	_access_muted = _check("Audio muted", true)
	for control in [_quality_full, _quality_reduced, _access_normal,
			_access_motion, _access_muted]:
		variants.add_child(control)
	inspector.add_child(_labeled("Capture variants", variants))
	_summary = Label.new()
	_summary.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	inspector.add_child(_summary)
	split.add_child(inspector)
	add_child(split)
	_refresh_palette()


func _new_scenario() -> void:
	scenario = ForgePresentationTestScenario.new()
	scenario.stable_id = "test.presentation.user.untitled_scenario"
	scenario.display_name = "Untitled Scenario"
	scenario.lifecycle = "draft"
	scenario.source_status = "draft"
	scenario.duration_seconds = 5.0
	scenario.manual_review_status = "open"
	_is_new = true
	_refresh_document()


func _duplicate_scenario() -> void:
	if scenario == null:
		_new_scenario()
		return
	scenario = scenario.duplicate(true) as ForgePresentationTestScenario
	scenario.display_name += " Copy"
	scenario.stable_id = _generated_id(scenario.display_name)
	scenario.source_status = "draft"
	scenario.lifecycle = "draft"
	scenario.manual_review_status = "open"
	_is_new = true
	_refresh_document()


func _open_scenario(index: int) -> void:
	if index < 0 or index >= _scenario_selector.item_count:
		return
	var value: Variant = _scenario_selector.get_item_metadata(index)
	if not value is ForgePresentationTestScenario:
		return
	scenario = value
	_is_new = false
	_refresh_document()


func _refresh_document() -> void:
	if scenario == null or not is_instance_valid(_name):
		return
	_name.text = scenario.display_name
	_stable_id.text = scenario.stable_id
	_quality_full.button_pressed = "full" in scenario.quality_tiers
	_quality_reduced.button_pressed = "reduced" in scenario.quality_tiers
	_access_normal.button_pressed = "default" in scenario.accessibility_modes
	_access_motion.button_pressed = "reduced_motion" in scenario.accessibility_modes
	_access_muted.button_pressed = "audio_muted" in scenario.accessibility_modes
	_rebuild_graph()
	_refresh_actions()
	_refresh_fixture_selector()
	_refresh_summary()


func _on_name_changed(value: String) -> void:
	if scenario == null:
		return
	scenario.display_name = value.strip_edges()
	if _is_new:
		scenario.stable_id = _generated_id(scenario.display_name)
	_stable_id.text = scenario.stable_id


func _refresh_palette() -> void:
	if not is_instance_valid(_palette):
		return
	_palette.clear()
	var query := _search.text.strip_edges().to_lower()
	var selected_kind := str(_kind.get_item_metadata(_kind.selected))
	for record in available_records:
		var source_id := str(record.get("source_id", ""))
		var kind := str(record.get("foundation_kind", "source"))
		var name := str(record.get("display_name", source_id))
		if selected_kind != "all" and kind != selected_kind:
			continue
		if not query.is_empty() and not query in ("%s %s %s" % [source_id, name, kind]).to_lower():
			continue
		_palette.add_item("%s\n%s  |  %s" % [name, source_id, kind.replace("_", " ")])
		_palette.set_item_metadata(_palette.item_count - 1, record)


func _place_fixture() -> void:
	if scenario == null or _palette.get_selected_items().is_empty():
		status_changed.emit("Select a fixture from the source palette first.", true)
		return
	var record: Dictionary = _palette.get_item_metadata(_palette.get_selected_items()[0])
	var source_id := str(record.get("source_id", ""))
	if source_id in scenario.fixture_ids:
		status_changed.emit("That fixture is already placed in this scenario.", true)
		return
	var ids := scenario.fixture_ids.duplicate()
	ids.append(source_id)
	scenario.fixture_ids = ids
	scenario.editor_layout[source_id] = [80.0 + float(ids.size() % 3) * 250.0,
		80.0 + float(ids.size() / 3) * 180.0]
	_rebuild_graph()
	_refresh_fixture_selector()
	_refresh_summary()


func _rebuild_graph() -> void:
	if not is_instance_valid(_graph) or scenario == null:
		return
	for child in _graph.get_children():
		if child is GraphNode:
			_graph.remove_child(child)
			child.queue_free()
	for index in scenario.fixture_ids.size():
		var source_id := str(scenario.fixture_ids[index])
		var record := _record_for_id(source_id)
		var node := GraphNode.new()
		node.name = ForgeId.safe_filename(source_id)
		node.title = str(record.get("display_name", source_id))
		node.custom_minimum_size = Vector2(220, 110)
		node.set_meta("fixture_id", source_id)
		var layout: Variant = scenario.editor_layout.get(source_id,
			[80.0 + float(index % 3) * 250.0, 80.0 + float(index / 3) * 180.0])
		node.position_offset = Vector2(float(layout[0]), float(layout[1]))
		var details := Label.new()
		details.text = "%s\n%s\n%s" % [source_id,
			str(record.get("foundation_kind", "fixture")).replace("_", " "),
			str(record.get("source_status", "available"))]
		details.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		node.add_child(details)
		var remove := _button("Remove from scenario", _remove_fixture.bind(source_id))
		node.add_child(remove)
		node.position_offset_changed.connect(_store_node_position.bind(node))
		_graph.add_child(node)


func _store_node_position(node: GraphNode) -> void:
	if scenario == null:
		return
	scenario.editor_layout[str(node.get_meta("fixture_id", ""))] = [
		node.position_offset.x, node.position_offset.y]


func _remove_fixture(source_id: String) -> void:
	var ids := scenario.fixture_ids.duplicate()
	ids.remove_at(ids.find(source_id))
	scenario.fixture_ids = ids
	scenario.editor_layout.erase(source_id)
	var actions: Array[Dictionary] = []
	for action in scenario.action_records:
		if str(action.get("target_id", "")) != source_id:
			actions.append(action.duplicate(true))
	scenario.action_records = actions
	_refresh_document()


func _refresh_fixture_selector() -> void:
	_fixture_selector.clear()
	for source_id in scenario.fixture_ids:
		_fixture_selector.add_item(str(source_id))
		_fixture_selector.set_item_metadata(_fixture_selector.item_count - 1, str(source_id))


func _add_action() -> void:
	if _fixture_selector.item_count == 0:
		status_changed.emit("Place a fixture before adding a scenario input.", true)
		return
	var actions := scenario.action_records.duplicate(true)
	actions.append({"target_id": str(_fixture_selector.get_item_metadata(
		_fixture_selector.selected)),
		"action": str(_action_kind.get_item_metadata(_action_kind.selected)),
		"value": str(_action_value.get_item_metadata(_action_value.selected)),
		"seed": int(_seed.value), "instance_count": int(_instances.value),
		"contract_id": "event.test.visual_composer"})
	scenario.action_records = actions
	_refresh_actions()
	_refresh_summary()


func _remove_action() -> void:
	if _action_list.get_selected_items().is_empty():
		return
	var actions := scenario.action_records.duplicate(true)
	actions.remove_at(_action_list.get_selected_items()[0])
	scenario.action_records = actions
	_refresh_actions()
	_refresh_summary()


func _refresh_actions() -> void:
	_action_list.clear()
	for action in scenario.action_records:
		_action_list.add_item("%s  |  %s = %s  |  seed %d  |  x%d" % [
			str(action.get("target_id", "")), str(action.get("action", "")),
			str(action.get("value", "")), int(action.get("seed", 0)),
			int(action.get("instance_count", 1))])


func _save_scenario() -> void:
	if scenario == null or scenario.display_name.strip_edges().is_empty():
		status_changed.emit("Name the scenario before saving it.", true)
		return
	_apply_variants()
	scenario.dependency_ids = scenario.fixture_ids.duplicate()
	scenario.expected_trace_records.clear()
	for action in scenario.action_records:
		scenario.expected_trace_records.append({"target_id": action.get("target_id", ""),
			"action": action.get("action", ""), "manual_review": "open"})
	var diagnostics := ForgePresentationValidationService.new().validate(scenario)
	if not diagnostics.is_empty():
		status_changed.emit("Scenario validation is blocked: %s" % diagnostics[0].message, true)
		return
	var absolute_root := ProjectSettings.globalize_path(SCENARIO_ROOT)
	var make_error := DirAccess.make_dir_recursive_absolute(absolute_root)
	if make_error != OK:
		status_changed.emit("Could not create the isolated scenario folder.", true)
		return
	var path := SCENARIO_ROOT.path_join("%s.tres" % ForgeId.safe_filename(scenario.stable_id))
	var save_error := ResourceSaver.save(scenario, path)
	if save_error != OK:
		status_changed.emit("Could not save the isolated scenario source.", true)
		return
	_is_new = false
	status_changed.emit("Saved isolated test scenario: %s" % path, false)
	scenario_saved.emit(scenario)


func _apply_variants() -> void:
	var quality := PackedStringArray()
	if _quality_full.button_pressed: quality.append("full")
	if _quality_reduced.button_pressed: quality.append("reduced")
	var accessibility := PackedStringArray()
	if _access_normal.button_pressed: accessibility.append("default")
	if _access_motion.button_pressed: accessibility.append("reduced_motion")
	if _access_muted.button_pressed: accessibility.append("audio_muted")
	scenario.quality_tiers = quality
	scenario.accessibility_modes = accessibility


func _refresh_summary() -> void:
	_summary.text = "%d fixture(s)  |  %d input(s)  |  %d capture variants  |  manual review %s" % [
		scenario.fixture_ids.size(), scenario.action_records.size(),
		maxi(1, scenario.quality_tiers.size()) * maxi(1, scenario.accessibility_modes.size()),
		scenario.manual_review_status]


func _record_for_id(source_id: String) -> Dictionary:
	for record in available_records:
		if str(record.get("source_id", "")) == source_id:
			return record
	return {"source_id": source_id, "display_name": source_id,
		"foundation_kind": "unresolved", "source_status": "missing"}


func _generated_id(title: String) -> String:
	return "test.presentation.user.%s" % ForgeId.safe_filename(
		title.strip_edges().to_lower().replace(" ", "_"))


func _check(label: String, value: bool) -> CheckButton:
	var check := CheckButton.new()
	check.text = label
	check.button_pressed = value
	return check


func _labeled(label_text: String, control: Control) -> Control:
	var stack := VBoxContainer.new()
	stack.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var label := Label.new()
	label.text = label_text
	label.add_theme_font_size_override("font_size", 12)
	stack.add_child(label)
	control.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	control.set_meta("accessible_label", label_text)
	stack.add_child(control)
	return stack


func _button(label: String, action: Callable) -> Button:
	var button := Button.new()
	button.text = label
	button.custom_minimum_size.y = 36
	button.set_meta("accessible_label", label)
	button.pressed.connect(action)
	return button
