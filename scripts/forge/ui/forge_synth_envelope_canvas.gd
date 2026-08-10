class_name ForgeSynthEnvelopeCanvas
extends Control
## Direct ADSR envelope editor. The completed drag emits one replacement
## dictionary, keeping waveform generation and provenance non-destructive.

signal envelope_changed(value: Dictionary)

var envelope: Dictionary = {}
var _selected := -1
var _dragging := false


func configure(value: Dictionary) -> void:
	envelope = value.duplicate(true)
	custom_minimum_size = Vector2(520, 210)
	focus_mode = Control.FOCUS_ALL
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	set_meta("accessible_label",
		"Amplitude envelope graph with attack, decay, sustain and release handles.")
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("#111821"), true)
	var points := _points()
	for tick in 5:
		var y := 18.0 + float(tick) / 4.0 * (size.y - 46.0)
		draw_line(Vector2(12, y), Vector2(size.x - 12, y),
			Color(0.32, 0.39, 0.46, 0.35), 1.0)
	draw_polyline(PackedVector2Array(points), Color("#E6B85C"), 3.0, true)
	var names := ["start", "attack", "decay / sustain", "release"]
	for index in points.size():
		draw_circle(points[index], 7.0,
			Color("#75C9D2") if index != _selected else Color("#F4F7F9"))
		draw_string(get_theme_default_font(), points[index] + Vector2(-22, 24),
			names[index], HORIZONTAL_ALIGNMENT_CENTER, 70, 12, Color("#C5D0DA"))


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			grab_focus()
			_selected = _nearest_handle(event.position)
			_dragging = _selected in [1, 2, 3]
			if _dragging:
				_update_handle(event.position)
		else:
			if _dragging:
				envelope_changed.emit(envelope.duplicate(true))
			_dragging = false
		queue_redraw()
		accept_event()
	elif event is InputEventMouseMotion and _dragging:
		_update_handle(event.position)
		queue_redraw()
		accept_event()
	elif event is InputEventKey and event.pressed and not event.echo \
			and _selected in [1, 2, 3]:
		var delta := Vector2.ZERO
		if event.keycode == KEY_LEFT: delta.x = -3.0
		if event.keycode == KEY_RIGHT: delta.x = 3.0
		if event.keycode == KEY_UP: delta.y = -3.0
		if event.keycode == KEY_DOWN: delta.y = 3.0
		if delta != Vector2.ZERO:
			_update_handle(_points()[_selected] + delta)
			envelope_changed.emit(envelope.duplicate(true))
			queue_redraw()
			accept_event()


func _points() -> Array[Vector2]:
	var width := maxf(1.0, size.x - 36.0)
	var height := maxf(1.0, size.y - 52.0)
	var origin := Vector2(18.0, size.y - 28.0)
	var attack := clampf(float(envelope.get("attack_seconds", 0.01)), 0.0, 5.0)
	var decay := clampf(float(envelope.get("decay_seconds", 0.12)), 0.0, 5.0)
	var sustain := clampf(float(envelope.get("sustain_level", 0.7)), 0.0, 1.0)
	var release := clampf(float(envelope.get("release_seconds", 0.2)), 0.0, 5.0)
	var total := maxf(0.25, attack + decay + release + 0.5)
	var attack_x := origin.x + width * (attack / total)
	var decay_x := attack_x + width * (decay / total)
	var release_x := origin.x + width
	return [origin, Vector2(attack_x, origin.y - height),
		Vector2(decay_x, origin.y - height * sustain), Vector2(release_x, origin.y)]


func _nearest_handle(position: Vector2) -> int:
	var points := _points()
	var selected := -1
	var best := 24.0
	for index in points.size():
		var distance := position.distance_to(points[index])
		if distance < best:
			best = distance
			selected = index
	return selected


func _update_handle(position: Vector2) -> void:
	var points := _points()
	var width := maxf(1.0, size.x - 36.0)
	var height := maxf(1.0, size.y - 52.0)
	var left := 18.0
	var bottom := size.y - 28.0
	if _selected == 1:
		envelope["attack_seconds"] = clampf((position.x - left) / width * 5.0, 0.0, 5.0)
	elif _selected == 2:
		var attack_x := points[1].x
		envelope["decay_seconds"] = clampf((position.x - attack_x) / width * 5.0, 0.0, 5.0)
		envelope["sustain_level"] = clampf((bottom - position.y) / height, 0.0, 1.0)
	elif _selected == 3:
		var decay_x := points[2].x
		envelope["release_seconds"] = clampf((position.x - decay_x) / width * 5.0, 0.0, 5.0)
