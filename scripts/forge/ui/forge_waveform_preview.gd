class_name ForgeWaveformPreview
extends Control
## Accessible waveform overview with direct trim, fade and loop handles.

signal edit_completed(values: Dictionary)

var samples: PackedFloat32Array = []:
	set(value):
		samples = value
		queue_redraw()

var duration_seconds := 1.0
var trim_start_seconds := 0.0
var trim_end_seconds := 1.0
var fade_in_seconds := 0.0
var fade_out_seconds := 0.0
var loop_start_seconds := -1.0
var loop_end_seconds := -1.0
var interactive := false
var _drag_handle := ""


func _ready() -> void:
	custom_minimum_size = Vector2(0, 120)
	focus_mode = Control.FOCUS_ALL if interactive else Control.FOCUS_NONE
	mouse_filter = Control.MOUSE_FILTER_STOP if interactive else Control.MOUSE_FILTER_IGNORE
	set_meta("accessible_label", "Waveform over time. Drag written trim, fade and loop handles; exact values remain in Advanced Source.")


func configure_editor(source: ForgeSoundSource) -> void:
	interactive = true
	samples = source.waveform_preview
	duration_seconds = maxf(0.001, source.duration_seconds)
	trim_start_seconds = 0.0
	trim_end_seconds = duration_seconds
	loop_start_seconds = source.loop_start_seconds
	loop_end_seconds = source.loop_end_seconds
	focus_mode = Control.FOCUS_ALL
	mouse_filter = Control.MOUSE_FILTER_STOP
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("#111821"), true)
	var centre := size.y * 0.5
	draw_line(Vector2(0, centre), Vector2(size.x, centre), Color("#526172"), 1.0)
	if samples.size() < 2: return
	var points := PackedVector2Array()
	for index in samples.size():
		var x := float(index) / float(samples.size() - 1) * size.x
		var amplitude := clampf(float(samples[index]), -1.0, 1.0)
		points.append(Vector2(x, centre - amplitude * (centre - 8.0)))
	draw_polyline(points, Color("#E6B85C"), 2.0, true)
	if not interactive:
		return
	_draw_handle("TRIM IN", trim_start_seconds, Color("#75C9D2"), 14.0)
	_draw_handle("TRIM OUT", trim_end_seconds, Color("#75C9D2"), 14.0)
	_draw_handle("FADE IN", fade_in_seconds, Color("#B99BE6"), 34.0)
	_draw_handle("FADE OUT", duration_seconds - fade_out_seconds, Color("#B99BE6"), 34.0)
	if loop_start_seconds >= 0.0:
		_draw_handle("LOOP IN", loop_start_seconds, Color("#7ED68B"), 54.0)
	if loop_end_seconds >= 0.0:
		_draw_handle("LOOP OUT", loop_end_seconds, Color("#7ED68B"), 54.0)


func _draw_handle(label: String, seconds: float, color: Color, label_y: float) -> void:
	var x := _x_for_seconds(seconds)
	draw_line(Vector2(x, 0), Vector2(x, size.y), color, 2.0)
	draw_string(get_theme_default_font(), Vector2(x + 3, label_y), label,
		HORIZONTAL_ALIGNMENT_LEFT, 80, 11, color)


func _gui_input(event: InputEvent) -> void:
	if not interactive:
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			grab_focus()
			_drag_handle = _nearest_handle(event.position.x)
			_update_handle(event.position.x)
		else:
			if not _drag_handle.is_empty():
				edit_completed.emit(_values())
			_drag_handle = ""
		queue_redraw()
		accept_event()
	elif event is InputEventMouseMotion and not _drag_handle.is_empty():
		_update_handle(event.position.x)
		queue_redraw()
		accept_event()


func _nearest_handle(mouse_x: float) -> String:
	var handles := {
		"trim_start": trim_start_seconds,
		"trim_end": trim_end_seconds,
		"fade_in": fade_in_seconds,
		"fade_out": duration_seconds - fade_out_seconds,
	}
	if loop_start_seconds >= 0.0: handles["loop_start"] = loop_start_seconds
	if loop_end_seconds >= 0.0: handles["loop_end"] = loop_end_seconds
	var closest := ""
	var best := 28.0
	for key in handles:
		var distance := absf(mouse_x - _x_for_seconds(float(handles[key])))
		if distance < best:
			best = distance
			closest = str(key)
	return closest


func _update_handle(mouse_x: float) -> void:
	if _drag_handle.is_empty():
		return
	var seconds := clampf(mouse_x / maxf(1.0, size.x) * duration_seconds,
		0.0, duration_seconds)
	match _drag_handle:
		"trim_start": trim_start_seconds = minf(seconds, trim_end_seconds)
		"trim_end": trim_end_seconds = maxf(seconds, trim_start_seconds)
		"fade_in": fade_in_seconds = minf(seconds, trim_end_seconds)
		"fade_out": fade_out_seconds = minf(duration_seconds - seconds,
			duration_seconds - trim_start_seconds)
		"loop_start": loop_start_seconds = minf(seconds,
			loop_end_seconds if loop_end_seconds >= 0.0 else duration_seconds)
		"loop_end": loop_end_seconds = maxf(seconds,
			loop_start_seconds if loop_start_seconds >= 0.0 else 0.0)


func _values() -> Dictionary:
	return {
		"trim_start_seconds": trim_start_seconds,
		"trim_end_seconds": trim_end_seconds,
		"fade_in_seconds": fade_in_seconds,
		"fade_out_seconds": fade_out_seconds,
		"loop_start_seconds": loop_start_seconds,
		"loop_end_seconds": loop_end_seconds,
	}


func _x_for_seconds(seconds: float) -> float:
	return clampf(seconds / maxf(0.001, duration_seconds), 0.0, 1.0) * size.x
