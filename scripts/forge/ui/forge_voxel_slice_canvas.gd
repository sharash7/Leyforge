class_name ForgeVoxelSliceCanvas
extends Control

signal voxel_edit_requested(position: Vector3i, value: int)
signal voxel_batch_edit_requested(positions: Array, value: int)
signal voxel_values_edit_requested(values: Dictionary)

const TOOL_PENCIL := "pencil"
const TOOL_SQUARE := "square"
const TOOL_CIRCLE := "circle"
const TOOL_DIAMOND := "diamond"
const TOOL_FILL := "fill"

var volume: ForgeVoxelVolume
var palette: ForgePaletteDefinition
var slice_axis := 2
var slice_index := 0
var active_palette_index := 0
var mirror_x := false
var tool_mode := TOOL_PENCIL
var brush_size := 1
var randomizer_enabled := false
var random_palette_indices := PackedInt32Array()

var _stroke_button := 0
var _last_stroke_cell := Vector2i(-1, -1)
var _stroke_sequence := 0
var _randomizer_rng := RandomNumberGenerator.new()
var _randomizer_seeded := false


func _ready() -> void:
	custom_minimum_size = Vector2(320, 320)
	mouse_default_cursor_shape = Control.CURSOR_CROSS
	focus_mode = Control.FOCUS_ALL


func configure(
		new_volume: ForgeVoxelVolume,
		new_palette: ForgePaletteDefinition) -> void:
	volume = new_volume
	palette = new_palette
	if volume != null:
		slice_index = clampi(slice_index, 0, _slice_limit())
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("#11181d"))
	if volume == null:
		draw_string(
			ThemeDB.fallback_font, Vector2(24, 42),
			"No voxel source", HORIZONTAL_ALIGNMENT_LEFT, -1, 18,
			Color("#d4c9b1"))
		return
	var dimensions := _plane_dimensions()
	var cell_size := minf(size.x / dimensions.x, size.y / dimensions.y)
	var origin := (size - Vector2(dimensions) * cell_size) * 0.5
	for y in dimensions.y:
		for x in dimensions.x:
			var cell := _position_for(x, y)
			var value := volume.get_cell(cell)
			var color := Color("#202a30")
			if value >= 0:
				color = palette.color_for(value) \
					if palette != null else Color("#8a8a8a")
			draw_rect(Rect2(
				origin + Vector2(x, y) * cell_size,
				Vector2.ONE * maxf(1.0, cell_size - 1.0)), color)
	if mirror_x:
		var mirror_line := origin.x + dimensions.x * cell_size * 0.5
		draw_line(
			Vector2(mirror_line, origin.y),
			Vector2(mirror_line, origin.y + dimensions.y * cell_size),
			Color("#f2c86f"), 2.0)


func _gui_input(event: InputEvent) -> void:
	if volume == null:
		return
	if event is InputEventMouseButton \
			and event.button_index in [MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT]:
		if event.pressed:
			var coordinates := _cell_at(event.position)
			if coordinates.x < 0:
				return
			_stroke_button = event.button_index
			_last_stroke_cell = coordinates
			_apply_tool_between(coordinates, coordinates)
			if tool_mode == TOOL_FILL:
				_stroke_button = 0
			grab_focus()
		else:
			_stroke_button = 0
			_last_stroke_cell = Vector2i(-1, -1)
		accept_event()
	elif event is InputEventMouseMotion and _stroke_button != 0:
		var expected_mask := MOUSE_BUTTON_MASK_LEFT \
			if _stroke_button == MOUSE_BUTTON_LEFT \
			else MOUSE_BUTTON_MASK_RIGHT
		if (event.button_mask & expected_mask) == 0:
			_stroke_button = 0
			_last_stroke_cell = Vector2i(-1, -1)
			return
		var coordinates := _cell_at(event.position)
		if coordinates.x < 0 or coordinates == _last_stroke_cell:
			return
		_apply_tool_between(_last_stroke_cell, coordinates)
		_last_stroke_cell = coordinates


func tool_cells_at(center: Vector2i) -> Array[Vector2i]:
	var cells: Array[Vector2i] = []
	if volume == null:
		return cells
	var radius := maxi(0, brush_size)
	if tool_mode == TOOL_PENCIL:
		cells.append(center)
	elif tool_mode == TOOL_SQUARE:
		for y in range(center.y - radius, center.y + radius + 1):
			for x in range(center.x - radius, center.x + radius + 1):
				_append_if_valid(cells, Vector2i(x, y))
	elif tool_mode == TOOL_CIRCLE:
		for y in range(center.y - radius, center.y + radius + 1):
			for x in range(center.x - radius, center.x + radius + 1):
				var offset := Vector2i(x, y) - center
				if offset.length_squared() <= radius * radius:
					_append_if_valid(cells, Vector2i(x, y))
	elif tool_mode == TOOL_DIAMOND:
		for y in range(center.y - radius, center.y + radius + 1):
			for x in range(center.x - radius, center.x + radius + 1):
				var offset := Vector2i(x, y) - center
				if absi(offset.x) + absi(offset.y) <= radius:
					_append_if_valid(cells, Vector2i(x, y))
	elif tool_mode == TOOL_FILL:
		cells = _flood_cells(center)
	return cells


func _apply_tool_between(from_cell: Vector2i, to_cell: Vector2i) -> void:
	var unique_positions := {}
	for centre in _line_cells(from_cell, to_cell):
		for plane_cell in tool_cells_at(centre):
			var position := _position_for(plane_cell.x, plane_cell.y)
			unique_positions[position] = true
			if mirror_x:
				var mirrored := position
				mirrored.x = volume.dimensions.x - 1 - position.x
				unique_positions[mirrored] = true
		if tool_mode == TOOL_FILL:
			break
	var positions: Array[Vector3i] = []
	for position in unique_positions:
		positions.append(position)
	if positions.is_empty():
		return
	if _stroke_button == MOUSE_BUTTON_LEFT \
			and randomizer_enabled and not random_palette_indices.is_empty():
		_stroke_sequence += 1
		var values := {}
		var palette_bag: Array[int] = []
		for position in positions:
			if palette_bag.is_empty():
				palette_bag = _shuffled_random_palette()
			var random_value: int = palette_bag.pop_back()
			values[position] = random_value
			voxel_edit_requested.emit(position, random_value)
		voxel_values_edit_requested.emit(values)
		accept_event()
		return
	var value := active_palette_index \
		if _stroke_button == MOUSE_BUTTON_LEFT else -1
	voxel_batch_edit_requested.emit(positions, value)
	for position in positions:
		voxel_edit_requested.emit(position, value)
	accept_event()


func _flood_cells(start: Vector2i) -> Array[Vector2i]:
	var cells: Array[Vector2i] = []
	if not _is_valid_plane_cell(start):
		return cells
	var target := volume.get_cell(_position_for(start.x, start.y))
	var queue: Array[Vector2i] = [start]
	var visited := {start: true}
	while not queue.is_empty():
		var cell: Vector2i = queue.pop_front()
		if volume.get_cell(_position_for(cell.x, cell.y)) != target:
			continue
		cells.append(cell)
		for neighbor in [
			cell + Vector2i.LEFT,
			cell + Vector2i.RIGHT,
			cell + Vector2i.UP,
			cell + Vector2i.DOWN,
		]:
			if _is_valid_plane_cell(neighbor) and not visited.has(neighbor):
				visited[neighbor] = true
				queue.append(neighbor)
	return cells


func _line_cells(from_cell: Vector2i, to_cell: Vector2i) -> Array[Vector2i]:
	var cells: Array[Vector2i] = []
	var current := from_cell
	var delta := Vector2i(
		absi(to_cell.x - from_cell.x), absi(to_cell.y - from_cell.y))
	var step := Vector2i(
		1 if from_cell.x < to_cell.x else -1,
		1 if from_cell.y < to_cell.y else -1)
	var error := delta.x - delta.y
	while true:
		cells.append(current)
		if current == to_cell:
			break
		var doubled := error * 2
		if doubled > -delta.y:
			error -= delta.y
			current.x += step.x
		if doubled < delta.x:
			error += delta.x
			current.y += step.y
	return cells


func _append_if_valid(cells: Array[Vector2i], cell: Vector2i) -> void:
	if _is_valid_plane_cell(cell):
		cells.append(cell)


func _slice_limit() -> int:
	match slice_axis:
		0:
			return maxi(0, volume.dimensions.x - 1)
		1:
			return maxi(0, volume.dimensions.y - 1)
	return maxi(0, volume.dimensions.z - 1)


func _plane_dimensions() -> Vector2i:
	match slice_axis:
		0:
			return Vector2i(volume.dimensions.z, volume.dimensions.y)
		1:
			return Vector2i(volume.dimensions.x, volume.dimensions.z)
	return Vector2i(volume.dimensions.x, volume.dimensions.y)


func _position_for(x: int, y: int) -> Vector3i:
	match slice_axis:
		0:
			return Vector3i(
				slice_index, volume.dimensions.y - 1 - y, x)
		1:
			return Vector3i(x, slice_index, y)
	return Vector3i(x, volume.dimensions.y - 1 - y, slice_index)


func _shuffled_random_palette() -> Array[int]:
	if not _randomizer_seeded:
		_randomizer_rng.seed = Time.get_ticks_usec() ^ get_instance_id()
		_randomizer_seeded = true
	var bag: Array[int] = []
	for palette_index in random_palette_indices:
		bag.append(int(palette_index))
	for index in range(bag.size() - 1, 0, -1):
		var swap_index := _randomizer_rng.randi_range(0, index)
		var temporary := bag[index]
		bag[index] = bag[swap_index]
		bag[swap_index] = temporary
	return bag


func _is_valid_plane_cell(cell: Vector2i) -> bool:
	var dimensions := _plane_dimensions()
	return cell.x >= 0 and cell.y >= 0 \
		and cell.x < dimensions.x and cell.y < dimensions.y


func _cell_at(position: Vector2) -> Vector2i:
	var dimensions := _plane_dimensions()
	var cell_size := minf(size.x / dimensions.x, size.y / dimensions.y)
	var origin := (size - Vector2(dimensions) * cell_size) * 0.5
	var local := position - origin
	var result := Vector2i(
		floori(local.x / cell_size), floori(local.y / cell_size))
	if not _is_valid_plane_cell(result):
		return Vector2i(-1, -1)
	return result
