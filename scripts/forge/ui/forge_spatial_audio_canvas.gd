class_name ForgeSpatialAudioCanvas
extends Control
## Isolated spatial-audio test view. Listener/source positions are preview-only
## and never touch a gameplay world or save.

var profile: ForgeSpatialAudioProfile
var listener_position := Vector2(0.28, 0.56)
var source_position := Vector2(0.72, 0.43)
var barrier_enabled := false
var _drag_target := ""


func configure(value: ForgeSpatialAudioProfile) -> void:
	profile = value
	custom_minimum_size = Vector2(560, 320)
	focus_mode = Control.FOCUS_ALL
	set_meta("accessible_label",
		"Isolated spatial sound test view with draggable listener and source, distance cone and optional occlusion barrier.")
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("#111821"), true)
	for step in 9:
		var x := float(step) / 8.0 * size.x
		var y := float(step) / 8.0 * size.y
		draw_line(Vector2(x, 0), Vector2(x, size.y), Color(0.25, 0.32, 0.39, 0.35))
		draw_line(Vector2(0, y), Vector2(size.x, y), Color(0.25, 0.32, 0.39, 0.35))
	var listener := listener_position * size
	var source := source_position * size
	var distance := source.distance_to(listener)
	var maximum := maxf(1.0, profile.maximum_distance_meters if profile != null else 24.0)
	var radius := clampf(maximum * 5.0, 24.0, maxf(size.x, size.y) * 0.8)
	draw_circle(source, radius, Color(0.46, 0.79, 0.82, 0.08))
	draw_arc(source, radius, 0, TAU, 64, Color("#75C9D2"), 2.0)
	draw_line(source, listener, Color("#E6B85C"), 2.0)
	if barrier_enabled:
		var barrier_x := size.x * 0.5
		draw_rect(Rect2(barrier_x - 8, size.y * 0.18, 16, size.y * 0.64),
			Color("#A65E58"), true)
	draw_circle(listener, 15.0, Color("#F4F7F9"))
	draw_circle(source, 15.0, Color("#E6B85C"))
	draw_string(get_theme_default_font(), listener + Vector2(-30, 35), "LISTENER")
	draw_string(get_theme_default_font(), source + Vector2(-25, 35), "SOURCE")
	draw_string(get_theme_default_font(), Vector2(12, 24),
		"Preview distance %.1f grid units  |  max %.1fm  |  occlusion %s" % [
			distance / 5.0, maximum,
			"barrier enabled" if barrier_enabled else "clear"],
		HORIZONTAL_ALIGNMENT_LEFT, size.x - 24, 14, Color("#D4DCE4"))


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			grab_focus()
			var normalized: Vector2 = event.position / size
			_drag_target = "listener" if normalized.distance_to(listener_position) \
				< normalized.distance_to(source_position) else "source"
			_move_target(normalized)
		else:
			_drag_target = ""
		accept_event()
	elif event is InputEventMouseMotion and not _drag_target.is_empty():
		_move_target(event.position / size)
		accept_event()
	elif event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_O:
			barrier_enabled = not barrier_enabled
			queue_redraw()
			accept_event()


func _move_target(normalized: Vector2) -> void:
	normalized = normalized.clamp(Vector2(0.04, 0.1), Vector2(0.96, 0.94))
	if _drag_target == "listener":
		listener_position = normalized
	elif _drag_target == "source":
		source_position = normalized
	queue_redraw()
