class_name ForgeStructureVoxelBuilder
extends VBoxContainer
## Visual-first 3D gameplay-block builder with cumulative construction stages.

signal source_change_requested(source: ForgeStructureVoxelSource, label: String)
signal status_changed(message: String, is_error: bool)

const PREFERENCES_PATH := "user://leyforge/forge/visual_creativity.cfg"
const TOOLS := [
	"pencil", "erase", "line", "rectangle", "box", "fill", "replace", "select",
]

var source: ForgeStructureVoxelSource
var registry_bridge := ForgeRegistryBridge.new()
var block_records: Array[Dictionary] = []
var block_by_id := {}
var active_block_id := ""
var active_tool := "pencil"
var active_stage_id := "stage.foundation"
var prior_stage_view := "solid"
var selection := {}
var clipboard: Array[ForgeStructureVoxelCell] = []
var favourites := PackedStringArray()
var recents := PackedStringArray()
var semantic_overlay_records: Array[Dictionary] = []

var _canvas: ForgeVoxel3DCanvas
var _tool_selector: OptionButton
var _layer_spin: SpinBox
var _stage_selector: OptionButton
var _stage_list: ItemList
var _stage_name: LineEdit
var _view_selector: OptionButton
var _pad_selector: OptionButton
var _search: LineEdit
var _category: OptionButton
var _block_list: ItemList
var _block_status: Label
var _selection_status: Label
var _source_summary: Label
var _anchor: Variant
var _pending_source: ForgeStructureVoxelSource


func configure(value: ForgeStructureVoxelSource) -> void:
	source = value if value != null else ForgeStructureVoxelSource.new()
	source.ensure_defaults()
	active_stage_id = str(source.stage_ids[0])
	_load_preferences()
	_load_blocks()
	_build_ui()
	_refresh_all()


func set_semantic_overlays(records: Array[Dictionary]) -> void:
	semantic_overlay_records = records.duplicate(true)
	_refresh_canvas()


func _build_ui() -> void:
	add_theme_constant_override("separation", 8)
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var banner := Label.new()
	banner.text = "VISUAL BUILDING WORKSPACE  |  Place canonical blocks directly; advanced source fields remain below."
	banner.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	banner.add_theme_color_override("font_color", Color("#9DD6D1"))
	add_child(banner)
	var toolbar := HBoxContainer.new()
	toolbar.add_theme_constant_override("separation", 6)
	_tool_selector = OptionButton.new()
	_tool_selector.name = "StructureVisualTool"
	for tool in TOOLS:
		_tool_selector.add_item(tool.capitalize())
		_tool_selector.set_item_metadata(_tool_selector.item_count - 1, tool)
	_tool_selector.item_selected.connect(func(index: int) -> void:
		active_tool = str(_tool_selector.get_item_metadata(index))
		_anchor = null
		_update_status("%s tool ready." % active_tool.capitalize(), false))
	toolbar.add_child(_labeled("Tool", _tool_selector))
	_layer_spin = SpinBox.new()
	_layer_spin.min_value = -128
	_layer_spin.max_value = 512
	_layer_spin.step = 1
	_layer_spin.value_changed.connect(func(value: float) -> void:
		_canvas.set_active_layer(int(value)))
	toolbar.add_child(_labeled("Build layer Y", _layer_spin))
	_stage_selector = OptionButton.new()
	_stage_selector.name = "StructureStageSelector"
	_stage_selector.custom_minimum_size.x = 170
	_stage_selector.item_selected.connect(func(index: int) -> void:
		active_stage_id = str(_stage_selector.get_item_metadata(index))
		_refresh_canvas())
	toolbar.add_child(_labeled("Construction stage", _stage_selector))
	_view_selector = OptionButton.new()
	for value in ["solid", "ghost", "hide"]:
		_view_selector.add_item("Earlier: %s" % value.capitalize())
		_view_selector.set_item_metadata(_view_selector.item_count - 1, value)
	_view_selector.item_selected.connect(func(index: int) -> void:
		prior_stage_view = str(_view_selector.get_item_metadata(index))
		_refresh_canvas())
	toolbar.add_child(_view_selector)
	_pad_selector = OptionButton.new()
	for value in ["grid", "slope", "scale", "slope_scale"]:
		_pad_selector.add_item(value.replace("_", " + ").capitalize())
		_pad_selector.set_item_metadata(_pad_selector.item_count - 1, value)
	_pad_selector.item_selected.connect(func(index: int) -> void:
		_canvas.set_test_pad_mode(str(_pad_selector.get_item_metadata(index))))
	toolbar.add_child(_labeled("Test pad", _pad_selector))
	toolbar.add_child(_button("Frame build", func() -> void: _canvas.focus_records()))
	add_child(toolbar)

	var split := HSplitContainer.new()
	split.custom_minimum_size = Vector2(0, 520)
	split.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	add_child(split)
	_build_palette(split)
	_canvas = ForgeVoxel3DCanvas.new()
	_canvas.name = "StructureVoxel3DCanvas"
	_canvas.cell_pressed.connect(_on_canvas_cell)
	_canvas.stroke_finished.connect(_on_stroke_finished)
	_canvas.hover_changed.connect(func(position: Vector3i) -> void:
		_selection_status.text = "Cursor %s  |  Selection %d" % [
			str(position), selection.size()])
	split.add_child(_canvas)
	_build_stage_and_selection_panel(split)


func _build_palette(parent: Container) -> void:
	var panel := VBoxContainer.new()
	panel.custom_minimum_size.x = 270
	panel.add_theme_constant_override("separation", 6)
	var title := Label.new()
	title.text = "Known block library"
	title.add_theme_font_size_override("font_size", 17)
	panel.add_child(title)
	_search = LineEdit.new()
	_search.name = "StructureBlockSearch"
	_search.placeholder_text = "Search block name, ID or category"
	_search.text_changed.connect(func(_value: String) -> void: _refresh_block_list())
	panel.add_child(_search)
	_category = OptionButton.new()
	_category.item_selected.connect(func(_index: int) -> void: _refresh_block_list())
	panel.add_child(_category)
	_block_list = ItemList.new()
	_block_list.name = "StructureBlockPalette"
	_block_list.custom_minimum_size = Vector2(260, 330)
	_block_list.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_block_list.allow_reselect = true
	_block_list.item_selected.connect(_select_block)
	panel.add_child(_block_list)
	var actions := HBoxContainer.new()
	actions.add_child(_button("Favourite", _toggle_favourite))
	actions.add_child(_button("Eyedrop selection", _eyedrop_selection))
	panel.add_child(actions)
	_block_status = Label.new()
	_block_status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_block_status.add_theme_color_override("font_color", Color("#B7C2CF"))
	panel.add_child(_block_status)
	parent.add_child(panel)


func _build_stage_and_selection_panel(parent: Container) -> void:
	var panel := VBoxContainer.new()
	panel.custom_minimum_size.x = 290
	panel.add_theme_constant_override("separation", 6)
	var stage_title := Label.new()
	stage_title.text = "Cumulative construction timeline"
	stage_title.add_theme_font_size_override("font_size", 17)
	panel.add_child(stage_title)
	_stage_list = ItemList.new()
	_stage_list.name = "StructureStageTimeline"
	_stage_list.custom_minimum_size = Vector2(280, 150)
	_stage_list.item_selected.connect(func(index: int) -> void:
		_stage_selector.select(index)
		active_stage_id = str(_stage_selector.get_item_metadata(index))
		_refresh_canvas())
	panel.add_child(_stage_list)
	_stage_name = LineEdit.new()
	_stage_name.placeholder_text = "New stage name"
	panel.add_child(_stage_name)
	var stage_actions := GridContainer.new()
	stage_actions.columns = 3
	stage_actions.add_child(_button("Add stage", _add_stage))
	stage_actions.add_child(_button("Duplicate", _duplicate_stage))
	stage_actions.add_child(_button("Remove", _remove_stage))
	stage_actions.add_child(_button("Move earlier", _move_stage.bind(-1)))
	stage_actions.add_child(_button("Move later", _move_stage.bind(1)))
	stage_actions.add_child(_button("Clear anchor", func() -> void: _anchor = null))
	panel.add_child(stage_actions)
	var selection_title := Label.new()
	selection_title.text = "Selection tools"
	selection_title.add_theme_font_size_override("font_size", 17)
	panel.add_child(selection_title)
	var transforms := GridContainer.new()
	transforms.columns = 3
	for definition in [
		["X -", "move_x_negative"], ["Y +", "move_y_positive"],
		["X +", "move_x_positive"], ["Z -", "move_z_negative"],
		["Y -", "move_y_negative"], ["Z +", "move_z_positive"],
		["Rotate Y", "rotate_y"], ["Mirror X", "mirror_x"],
		["Mirror Z", "mirror_z"], ["Copy", "copy"],
		["Paste", "paste"], ["Delete", "delete"],
	]:
		transforms.add_child(_button(str(definition[0]),
			_transform_selection.bind(str(definition[1]))))
	panel.add_child(transforms)
	_selection_status = Label.new()
	_selection_status.text = "Selection 0"
	_selection_status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(_selection_status)
	_source_summary = Label.new()
	_source_summary.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_source_summary.add_theme_color_override("font_color", Color("#D5B86B"))
	panel.add_child(_source_summary)
	var help := Label.new()
	help.text = (
		"Left-click places or selects. Right-click erases. Drag to paint. "
		+ "Line, rectangle and box use two clicks. Middle-drag pans; wheel zooms. "
		+ "Page Up/Down changes the active layer.")
	help.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(help)
	parent.add_child(panel)


func _load_blocks() -> void:
	block_records.clear()
	block_by_id.clear()
	for record in registry_bridge.all_gameplay_records():
		if str(record.get("kind", "")) != "block":
			continue
		var value := record.duplicate(true)
		var block_id := str(value.get("gameplay_id", ""))
		value["color"] = _color_for_id(block_id)
		block_records.append(value)
		block_by_id[block_id] = value
	if active_block_id.is_empty() and not block_records.is_empty():
		active_block_id = str(block_records[0].get("gameplay_id", ""))


func _refresh_all() -> void:
	_refresh_categories()
	_refresh_block_list()
	_refresh_stages()
	_refresh_canvas()


func _refresh_categories() -> void:
	var current := str(_category.get_item_metadata(_category.selected)) \
		if _category.item_count > 0 and _category.selected >= 0 else "all"
	_category.clear()
	_category.add_item("All block categories")
	_category.set_item_metadata(0, "all")
	var categories := PackedStringArray()
	for record in block_records:
		var category := str(record.get("category", "Uncategorised"))
		if category not in categories:
			categories.append(category)
	categories.sort()
	for category in categories:
		_category.add_item(category)
		_category.set_item_metadata(_category.item_count - 1, category)
		if category == current:
			_category.select(_category.item_count - 1)


func _refresh_block_list() -> void:
	if not is_instance_valid(_block_list):
		return
	_block_list.clear()
	var query := _search.text.strip_edges().to_lower()
	var category := str(_category.get_item_metadata(_category.selected)) \
		if _category.selected >= 0 else "all"
	var ordered := block_records.duplicate(true)
	ordered.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var a_id := str(a.get("gameplay_id", ""))
		var b_id := str(b.get("gameplay_id", ""))
		var a_rank := 0 if a_id in favourites else (1 if a_id in recents else 2)
		var b_rank := 0 if b_id in favourites else (1 if b_id in recents else 2)
		if a_rank != b_rank:
			return a_rank < b_rank
		return str(a.get("display_name", a_id)) < str(b.get("display_name", b_id)))
	for record in ordered:
		var block_id := str(record.get("gameplay_id", ""))
		var display_name := str(record.get("display_name", block_id))
		var record_category := str(record.get("category", "Uncategorised"))
		var haystack := "%s %s %s" % [display_name, block_id, record_category]
		if not query.is_empty() and query not in haystack.to_lower():
			continue
		if category != "all" and record_category != category:
			continue
		var prefix := "★ " if block_id in favourites else ("◷ " if block_id in recents else "")
		_block_list.add_item("%s%s\n%s" % [prefix, display_name, record_category])
		_block_list.set_item_metadata(_block_list.item_count - 1, block_id)
		if block_id == active_block_id:
			_block_list.select(_block_list.item_count - 1)
	_block_status.text = "%d canonical blocks shown  |  %d available" % [
		_block_list.item_count, block_records.size()]


func _select_block(index: int) -> void:
	active_block_id = str(_block_list.get_item_metadata(index))
	_add_recent(active_block_id)
	var record: Dictionary = block_by_id.get(active_block_id, {})
	_block_status.text = "%s\n%s" % [
		str(record.get("display_name", active_block_id)), active_block_id]


func _refresh_stages() -> void:
	_stage_selector.clear()
	_stage_list.clear()
	for index in source.stage_ids.size():
		var stage_id := str(source.stage_ids[index])
		var label := stage_id.trim_prefix("stage.").replace("_", " ").capitalize()
		_stage_selector.add_item("%d. %s" % [index + 1, label])
		_stage_selector.set_item_metadata(index, stage_id)
		_stage_list.add_item("%d  %s" % [index + 1, label])
		_stage_list.set_item_metadata(index, stage_id)
		if stage_id == active_stage_id:
			_stage_selector.select(index)
			_stage_list.select(index)
	if active_stage_id not in source.stage_ids and not source.stage_ids.is_empty():
		active_stage_id = str(source.stage_ids[0])


func _refresh_canvas() -> void:
	if not is_instance_valid(_canvas):
		return
	var stage_index := source.stage_ids.find(active_stage_id)
	var canvas_records: Array[Dictionary] = []
	var missing_count := 0
	for cell in source.cells:
		if cell == null:
			continue
		var placed_index := source.stage_ids.find(cell.placed_stage_id)
		var removed_index := source.stage_ids.find(cell.removed_stage_id) \
			if not cell.removed_stage_id.is_empty() else -1
		if placed_index < 0 or placed_index > stage_index \
				or (removed_index >= 0 and removed_index <= stage_index):
			continue
		if placed_index < stage_index and prior_stage_view == "hide":
			continue
		var known := block_by_id.has(cell.block_id)
		if not known:
			missing_count += 1
		var alpha := 0.28 if placed_index < stage_index \
			and prior_stage_view == "ghost" else 1.0
		canvas_records.append({
			"position": cell.position,
			"name": "StructureCell_%s" % ForgeId.safe_filename(cell.cell_id),
			"color": block_by_id.get(cell.block_id, {}).get(
				"color", Color("#F05AC8")),
			"alpha": alpha,
			"block_id": cell.block_id,
			"cell_id": cell.cell_id,
		})
	for overlay in semantic_overlay_records:
		var record := overlay.duplicate(true)
		if not record.has("alpha"):
			record["alpha"] = 0.46
		canvas_records.append(record)
	_canvas.set_records(canvas_records)
	_canvas.set_active_layer(int(_layer_spin.value))
	_source_summary.text = (
		"%d authored cell(s)  |  %d visible at %s  |  %d semantic overlay(s)\nBounds %s from %s%s" % [
			source.cells.size(), canvas_records.size(), active_stage_id,
			semantic_overlay_records.size(),
			str(source.dimensions), str(source.origin),
			"\nBLOCKED: %d missing block reference(s)" % missing_count \
				if missing_count > 0 else ""])


func _on_canvas_cell(position: Vector3i, erase: bool, _continuous: bool) -> void:
	if active_tool == "select":
		var key := _position_key(position)
		if selection.has(key):
			selection.erase(key)
		else:
			selection[key] = position
		_refresh_canvas()
		_selection_status.text = "Selection %d" % selection.size()
		return
	if active_tool in ["line", "rectangle", "box"]:
		if _anchor == null:
			_anchor = position
			_update_status("Anchor %s set; choose the opposite end." % str(position), false)
			return
		var points: Array[Vector3i] = _shape_points(active_tool, _anchor, position)
		_anchor = null
		_apply_positions(points, erase or active_tool == "erase",
			"Draw structure %s" % active_tool)
		return
	if active_tool == "fill":
		_apply_positions(_flood_positions(position), erase, "Fill structure region")
		return
	if active_tool == "replace":
		_replace_block_at(position)
		return
	_begin_pending()
	if erase or active_tool == "erase":
		_pending_source.remove_cell(position, active_stage_id)
	elif not active_block_id.is_empty():
		_pending_source.place_cell(position, active_block_id, active_stage_id)


func _on_stroke_finished() -> void:
	_commit_pending("Paint structure voxels")


func _begin_pending() -> void:
	if _pending_source == null:
		_pending_source = source.duplicate_source()


func _commit_pending(label: String) -> void:
	if _pending_source == null:
		return
	var next := _pending_source
	_pending_source = null
	_commit_source(next, label)


func _apply_positions(
		positions: Array[Vector3i], erase: bool, label: String) -> void:
	var next := source.duplicate_source()
	for position in positions:
		if erase:
			next.remove_cell(position, active_stage_id)
		elif not active_block_id.is_empty():
			next.place_cell(position, active_block_id, active_stage_id)
	_commit_source(next, label)


func _shape_points(kind: String, start: Vector3i, finish: Vector3i) \
		-> Array[Vector3i]:
	var points: Array[Vector3i] = []
	var minimum := Vector3i(
		mini(start.x, finish.x), mini(start.y, finish.y), mini(start.z, finish.z))
	var maximum := Vector3i(
		maxi(start.x, finish.x), maxi(start.y, finish.y), maxi(start.z, finish.z))
	if kind == "line":
		var distance := finish - start
		var steps := maxi(absi(distance.x), maxi(absi(distance.y), absi(distance.z)))
		for index in steps + 1:
			var ratio := float(index) / float(maxi(1, steps))
			var position := Vector3(start).lerp(Vector3(finish), ratio).round()
			var cell := Vector3i(position)
			if cell not in points:
				points.append(cell)
		return points
	if kind == "rectangle":
		for x in range(minimum.x, maximum.x + 1):
			for z in range(minimum.z, maximum.z + 1):
				points.append(Vector3i(x, start.y, z))
		return points
	for x in range(minimum.x, maximum.x + 1):
		for y in range(minimum.y, maximum.y + 1):
			for z in range(minimum.z, maximum.z + 1):
				points.append(Vector3i(x, y, z))
	return points


func _flood_positions(start: Vector3i) -> Array[Vector3i]:
	var original := source.cell_at(start)
	var original_id := original.block_id if original != null else ""
	var queue: Array[Vector3i] = [start]
	var visited := {}
	var result: Array[Vector3i] = []
	while not queue.is_empty() and result.size() < 32768:
		var position: Vector3i = queue.pop_front()
		var key := _position_key(position)
		if visited.has(key) or not source.contains(position):
			continue
		visited[key] = true
		var cell := source.cell_at(position)
		var block_id := cell.block_id if cell != null else ""
		if block_id != original_id:
			continue
		result.append(position)
		for direction in [Vector3i.RIGHT, Vector3i.LEFT, Vector3i.UP,
				Vector3i.DOWN, Vector3i.FORWARD, Vector3i.BACK]:
			queue.append(position + direction)
	return result


func _replace_block_at(position: Vector3i) -> void:
	var original := source.cell_at(position)
	if original == null or active_block_id.is_empty():
		_update_status("Choose an occupied cell and a replacement block.", true)
		return
	var next := source.duplicate_source()
	for cell in next.cells:
		if cell != null and cell.block_id == original.block_id \
				and cell.placed_stage_id == active_stage_id:
			cell.block_id = active_block_id
	_commit_source(next, "Replace structure block family")


func _transform_selection(action: String) -> void:
	if action == "copy":
		clipboard.clear()
		for value in selection.values():
			var cell := source.cell_at(value)
			if cell != null:
				clipboard.append(cell.duplicate_cell())
		_update_status("Copied %d selected cell(s)." % clipboard.size(), false)
		return
	if action == "paste":
		if clipboard.is_empty():
			_update_status("The structure clipboard is empty.", true)
			return
		var minimum := clipboard[0].position
		for cell in clipboard:
			minimum = Vector3i(mini(minimum.x, cell.position.x),
				mini(minimum.y, cell.position.y), mini(minimum.z, cell.position.z))
		var destination := Vector3i(
			floori(_canvas.camera_target.x), int(_layer_spin.value),
			floori(_canvas.camera_target.z))
		var next := source.duplicate_source()
		selection.clear()
		for cell in clipboard:
			var position := destination + cell.position - minimum
			next.place_cell(position, cell.block_id, active_stage_id)
			selection[_position_key(position)] = position
		_commit_source(next, "Paste structure selection")
		return
	if selection.is_empty():
		_update_status("Select structure cells before using a transform.", true)
		return
	var next := source.duplicate_source()
	if action == "delete":
		for value in selection.values():
			next.remove_cell(value, active_stage_id)
		selection.clear()
		_commit_source(next, "Delete structure selection")
		return
	var selected_cells: Array[ForgeStructureVoxelCell] = []
	var centre := Vector3.ZERO
	for value in selection.values():
		var cell := next.cell_at(value)
		if cell != null:
			selected_cells.append(cell)
			centre += Vector3(cell.position)
	if selected_cells.is_empty():
		return
	centre /= float(selected_cells.size())
	var offset: Vector3i = {
		"move_x_negative": Vector3i.LEFT, "move_x_positive": Vector3i.RIGHT,
		"move_y_negative": Vector3i.DOWN, "move_y_positive": Vector3i.UP,
		"move_z_negative": Vector3i.FORWARD, "move_z_positive": Vector3i.BACK,
	}.get(action, Vector3i.ZERO)
	for cell in selected_cells:
		var position: Vector3i = cell.position + offset
		if action == "rotate_y":
			var relative := Vector3(cell.position) - centre
			position = Vector3i((centre + Vector3(-relative.z, relative.y, relative.x)).round())
		elif action == "mirror_x":
			position.x = roundi(centre.x * 2.0 - float(cell.position.x))
		elif action == "mirror_z":
			position.z = roundi(centre.z * 2.0 - float(cell.position.z))
		cell.position = position
		next.ensure_contains(position)
	selection.clear()
	for cell in selected_cells:
		selection[_position_key(cell.position)] = cell.position
	_commit_source(next, action.replace("_", " ").capitalize())


func _add_stage() -> void:
	var next := source.duplicate_source()
	var slug := ForgeId.safe_filename(_stage_name.text.strip_edges().to_lower())
	if slug.is_empty():
		slug = "custom_%02d" % (next.stage_ids.size() + 1)
	var stage_id := "stage.%s" % slug.trim_prefix("stage_")
	var suffix := 2
	while stage_id in next.stage_ids:
		stage_id = "stage.%s_%d" % [slug, suffix]
		suffix += 1
	var insert_index := next.stage_ids.find(active_stage_id) + 1
	next.stage_ids.insert(insert_index, stage_id)
	active_stage_id = stage_id
	_stage_name.text = ""
	_commit_source(next, "Add construction stage")


func _duplicate_stage() -> void:
	_stage_name.text = "%s Copy" % active_stage_id.trim_prefix("stage.").capitalize()
	_add_stage()


func _remove_stage() -> void:
	if source.stage_ids.size() <= 1:
		_update_status("A structure must keep at least one construction stage.", true)
		return
	var next := source.duplicate_source()
	var index := next.stage_ids.find(active_stage_id)
	var replacement := str(next.stage_ids[maxi(0, index - 1)])
	for cell in next.cells:
		if cell == null:
			continue
		if cell.placed_stage_id == active_stage_id:
			cell.placed_stage_id = replacement
		if cell.removed_stage_id == active_stage_id:
			cell.removed_stage_id = ""
	next.stage_ids.remove_at(index)
	active_stage_id = replacement
	_commit_source(next, "Remove construction stage")


func _move_stage(direction: int) -> void:
	var next := source.duplicate_source()
	var index := next.stage_ids.find(active_stage_id)
	var target := clampi(index + direction, 0, next.stage_ids.size() - 1)
	if index == target:
		return
	var value := str(next.stage_ids[index])
	next.stage_ids.remove_at(index)
	next.stage_ids.insert(target, value)
	_commit_source(next, "Reorder construction stage")


func _commit_source(next: ForgeStructureVoxelSource, label: String) -> void:
	source = next
	source_change_requested.emit(next, label)
	_refresh_stages()
	_refresh_canvas()
	_update_status("%s. Source remains a draft until saved." % label, false)


func _toggle_favourite() -> void:
	if active_block_id.is_empty():
		return
	if active_block_id in favourites:
		favourites.remove_at(favourites.find(active_block_id))
	else:
		favourites.append(active_block_id)
	_save_preferences()
	_refresh_block_list()


func _eyedrop_selection() -> void:
	if selection.is_empty():
		_update_status("Select a placed block before using the eyedropper.", true)
		return
	var position: Vector3i = selection.values()[0]
	var cell := source.cell_at(position)
	if cell == null:
		return
	active_block_id = cell.block_id
	_add_recent(active_block_id)
	_refresh_block_list()
	_update_status("Selected %s from the structure." % active_block_id, false)


func _add_recent(block_id: String) -> void:
	if block_id in recents:
		recents.remove_at(recents.find(block_id))
	recents.insert(0, block_id)
	while recents.size() > 12:
		recents.remove_at(recents.size() - 1)
	_save_preferences()


func _load_preferences() -> void:
	var config := ConfigFile.new()
	if config.load(PREFERENCES_PATH) == OK:
		favourites = PackedStringArray(config.get_value("structures", "favourites", []))
		recents = PackedStringArray(config.get_value("structures", "recents", []))


func _save_preferences() -> void:
	var config := ConfigFile.new()
	config.load(PREFERENCES_PATH)
	config.set_value("structures", "favourites", Array(favourites))
	config.set_value("structures", "recents", Array(recents))
	config.save(PREFERENCES_PATH)


func _update_status(message: String, is_error: bool) -> void:
	status_changed.emit(message, is_error)
	if is_instance_valid(_selection_status):
		_selection_status.text = message
		_selection_status.add_theme_color_override("font_color",
			Color("#E78476") if is_error else Color("#B7C2CF"))


func _color_for_id(value: String) -> Color:
	var hue := float(posmod(hash(value), 360)) / 360.0
	return Color.from_hsv(hue, 0.42, 0.82)


func _position_key(position: Vector3i) -> String:
	return "%d,%d,%d" % [position.x, position.y, position.z]


func _labeled(label_text: String, control: Control) -> Control:
	var stack := VBoxContainer.new()
	var label := Label.new()
	label.text = label_text
	label.add_theme_font_size_override("font_size", 11)
	stack.add_child(label)
	control.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	control.set_meta("accessible_label", label_text)
	stack.add_child(control)
	return stack


func _button(label: String, action: Callable) -> Button:
	var button := Button.new()
	button.text = label
	button.tooltip_text = label
	button.set_meta("accessible_label", label)
	button.pressed.connect(action)
	return button
