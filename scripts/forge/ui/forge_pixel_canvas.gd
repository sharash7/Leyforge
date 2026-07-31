class_name ForgePixelCanvas
extends Control

signal pixel_edit_requested(face: String, x: int, y: int, value: int)
signal pixel_batch_edit_requested(face: String, cells: Array, value: int)

const TOOL_PENCIL := "pencil"
const TOOL_SQUARE := "square"
const TOOL_CIRCLE := "circle"
const TOOL_DIAMOND := "diamond"
const TOOL_FILL := "fill"

var surface: ForgeSurfaceSet
var palette: ForgePaletteDefinition
var active_face := "north"
var active_palette_index := 0
var show_tiling := false
var tool_mode := TOOL_PENCIL
var brush_size := 1

var _stroke_button := 0
var _last_stroke_cell := Vector2i(-1, -1)


func _ready() -> void:
	custom_minimum_size = Vector2(320, 320)
	mouse_default_cursor_shape = Control.CURSOR_CROSS
	focus_mode = Control.FOCUS_ALL


func configure(
		new_surface: ForgeSurfaceSet,
		new_palette: ForgePaletteDefinition) -> void:
	surface = new_surface
	palette = new_palette
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("#11181d"))
	if surface == null:
		draw_string(
			ThemeDB.fallback_font, Vector2(24, 42),
			"No surface source", HORIZONTAL_ALIGNMENT_LEFT, -1, 18,
			Color("#d4c9b1"))
		return
	surface.ensure_faces()
	var repeats := 2 if show_tiling else 1
	var columns := surface.width * repeats
	var rows := surface.height * repeats
	var cell_size := minf(size.x / columns, size.y / rows)
	var origin := (size - Vector2(columns, rows) * cell_size) * 0.5
	for y in rows:
		for x in columns:
			var source_x := x % surface.width
			var source_y := y % surface.height
			var index := surface.get_pixel(active_face, source_x, source_y)
			var color := palette.color_for(index) \
				if palette != null else Color("#8a8a8a")
			draw_rect(
				Rect2(origin + Vector2(x, y) * cell_size,
					Vector2.ONE * ceilf(cell_size)),
				color)
	if not show_tiling and cell_size >= 8.0:
		var grid_color := Color(0.05, 0.07, 0.08, 0.35)
		for x in surface.width + 1:
			var grid_x := origin.x + x * cell_size
			draw_line(
				Vector2(grid_x, origin.y),
				Vector2(grid_x, origin.y + surface.height * cell_size),
				grid_color)
		for y in surface.height + 1:
			var grid_y := origin.y + y * cell_size
			draw_line(
				Vector2(origin.x, grid_y),
				Vector2(origin.x + surface.width * cell_size, grid_y),
				grid_color)


func _gui_input(event: InputEvent) -> void:
	if surface == null or show_tiling:
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
	if surface == null:
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
	var unique := {}
	for centre in _line_cells(from_cell, to_cell):
		for cell in tool_cells_at(centre):
			unique[cell] = true
		if tool_mode == TOOL_FILL:
			break
	var cells: Array[Vector2i] = []
	for cell in unique:
		cells.append(cell)
	if cells.is_empty():
		return
	var value := active_palette_index \
		if _stroke_button == MOUSE_BUTTON_LEFT else 0
	pixel_batch_edit_requested.emit(active_face, cells, value)
	for cell in cells:
		pixel_edit_requested.emit(active_face, cell.x, cell.y, value)
	accept_event()


func _flood_cells(start: Vector2i) -> Array[Vector2i]:
	var cells: Array[Vector2i] = []
	if not _is_valid_cell(start):
		return cells
	var target := surface.get_pixel(active_face, start.x, start.y)
	var queue: Array[Vector2i] = [start]
	var visited := {start: true}
	while not queue.is_empty():
		var cell: Vector2i = queue.pop_front()
		if surface.get_pixel(active_face, cell.x, cell.y) != target:
			continue
		cells.append(cell)
		for neighbor in [
			cell + Vector2i.LEFT,
			cell + Vector2i.RIGHT,
			cell + Vector2i.UP,
			cell + Vector2i.DOWN,
		]:
			if _is_valid_cell(neighbor) and not visited.has(neighbor):
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
	if _is_valid_cell(cell):
		cells.append(cell)


func _is_valid_cell(cell: Vector2i) -> bool:
	return cell.x >= 0 and cell.y >= 0 \
		and cell.x < surface.width and cell.y < surface.height


func _cell_at(position: Vector2) -> Vector2i:
	var cell_size := minf(
		size.x / surface.width, size.y / surface.height)
	var origin := (
		size - Vector2(surface.width, surface.height) * cell_size) * 0.5
	var local := position - origin
	var result := Vector2i(
		floori(local.x / cell_size), floori(local.y / cell_size))
	if not _is_valid_cell(result):
		return Vector2i(-1, -1)
	return result
