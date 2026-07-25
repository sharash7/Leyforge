class_name LocalMapView
extends Control
## Lightweight discovered-knowledge map for the Stage 8 POC.

signal pin_requested(world_point: Vector2)

var anchors: Dictionary = {}
var routes: Array = []
var discovered: Dictionary = {}
var player_point := Vector2.ZERO
var objective_anchor := ""
var custom_pin := Vector2.ZERO
var has_custom_pin := false
var _bounds := Rect2(-160.0, -160.0, 320.0, 320.0)


func _ready() -> void:
	custom_minimum_size = Vector2(660, 300)
	focus_mode = Control.FOCUS_ALL
	mouse_default_cursor_shape = Control.CURSOR_CROSS
	tooltip_text = "Click or activate the map to place a custom pin."


func set_map_data(new_anchors: Dictionary, new_routes: Array,
		new_discovered: Dictionary, new_player_point: Vector2,
		new_objective_anchor: String, new_custom_pin: Vector2,
		new_has_custom_pin: bool) -> void:
	anchors = new_anchors.duplicate(true)
	routes = new_routes.duplicate(true)
	discovered = new_discovered.duplicate(true)
	player_point = new_player_point
	objective_anchor = new_objective_anchor
	custom_pin = new_custom_pin
	has_custom_pin = new_has_custom_pin
	_recalculate_bounds()
	queue_redraw()


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed \
			and event.button_index == MOUSE_BUTTON_LEFT:
		pin_requested.emit(_screen_to_world(event.position))
		accept_event()
	elif event.is_action_pressed("ui_accept"):
		pin_requested.emit(player_point)
		accept_event()


func _recalculate_bounds() -> void:
	var points: Array[Vector2] = [player_point]
	for anchor_id in anchors:
		if discovered.has(str(anchor_id)):
			points.append(Vector2(anchors[anchor_id]))
	if has_custom_pin:
		points.append(custom_pin)
	if points.is_empty():
		_bounds = Rect2(-160.0, -160.0, 320.0, 320.0)
		return
	var minimum := points[0]
	var maximum := points[0]
	for point in points:
		minimum = minimum.min(point)
		maximum = maximum.max(point)
	var centre := (minimum + maximum) * 0.5
	var extent := maximum - minimum
	var side := maxf(120.0, maxf(extent.x, extent.y) + 64.0)
	_bounds = Rect2(centre - Vector2.ONE * side * 0.5, Vector2.ONE * side)


func _draw() -> void:
	var panel := Rect2(Vector2.ZERO, size)
	draw_rect(panel, Color(0.055, 0.045, 0.03, 0.97), true)
	draw_rect(panel.grow(-2.0), Color(0.72, 0.62, 0.38, 0.9), false, 2.0)
	for i in range(1, 5):
		var x := size.x * float(i) / 5.0
		var y := size.y * float(i) / 5.0
		draw_line(Vector2(x, 0), Vector2(x, size.y), Color(0.5, 0.44, 0.3, 0.13))
		draw_line(Vector2(0, y), Vector2(size.x, y), Color(0.5, 0.44, 0.3, 0.13))
	for route_value in routes:
		if not (route_value is Dictionary):
			continue
		var route: Dictionary = route_value
		var from_id := str(route.get("from", ""))
		var to_id := str(route.get("to", ""))
		if not discovered.has(from_id) or not discovered.has(to_id):
			continue
		if not anchors.has(from_id) or not anchors.has(to_id):
			continue
		draw_dashed_line(
			_world_to_screen(Vector2(anchors[from_id])),
			_world_to_screen(Vector2(anchors[to_id])),
			Color(0.74, 0.62, 0.39, 0.75), 2.0, 6.0)
	for anchor_id_value in anchors:
		var anchor_id := str(anchor_id_value)
		if not discovered.has(anchor_id):
			continue
		var point := _world_to_screen(Vector2(anchors[anchor_id]))
		var is_objective := anchor_id == objective_anchor
		var radius := 8.0 if is_objective else 5.0
		draw_circle(point, radius, Color(1.0, 0.78, 0.18) if is_objective \
			else Color(0.78, 0.86, 0.76))
		draw_circle(point, radius, Color(0.08, 0.07, 0.04), false, 2.0)
		if is_objective:
			draw_arc(point, 13.0, 0.0, TAU, 20, Color.WHITE, 2.0)
		var label_offset: Vector2 = {
			"hamlet": Vector2(-72, -10),
			"warehouse": Vector2(10, 18),
			"watchtower_site": Vector2(10, -12),
			"raid_approach": Vector2(10, -9),
			"cave_entrance": Vector2(10, 14),
		}.get(anchor_id, Vector2(10, 4))
		draw_string(ThemeDB.fallback_font, point + label_offset,
			anchor_id.replace("_", " ").capitalize(),
			HORIZONTAL_ALIGNMENT_LEFT, -1, 13, Color(0.96, 0.93, 0.82))
	var player_screen := _world_to_screen(player_point)
	var player_shape := PackedVector2Array([
		player_screen + Vector2(0, -9),
		player_screen + Vector2(7, 7),
		player_screen + Vector2(-7, 7),
	])
	draw_colored_polygon(player_shape, Color(0.28, 0.72, 1.0))
	draw_polyline(player_shape + PackedVector2Array([player_shape[0]]),
		Color.WHITE, 2.0)
	if has_custom_pin:
		var pin := _world_to_screen(custom_pin)
		draw_line(pin + Vector2(0, -10), pin + Vector2(0, 8),
			Color(1.0, 0.48, 0.25), 3.0)
		draw_circle(pin + Vector2(0, -10), 5.0, Color(1.0, 0.48, 0.25))
	draw_string(ThemeDB.fallback_font, Vector2(10, size.y - 10),
		"Triangle: you  |  Ring: tracked goal  |  Pin: custom marker",
		HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color(0.84, 0.8, 0.68))


func _world_to_screen(point: Vector2) -> Vector2:
	var normalised := (point - _bounds.position) / _bounds.size
	return Vector2(normalised.x * size.x, normalised.y * size.y)


func _screen_to_world(point: Vector2) -> Vector2:
	var normalised := Vector2(
		clampf(point.x / maxf(1.0, size.x), 0.0, 1.0),
		clampf(point.y / maxf(1.0, size.y), 0.0, 1.0))
	return _bounds.position + normalised * _bounds.size
