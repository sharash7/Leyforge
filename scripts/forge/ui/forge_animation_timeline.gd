class_name ForgeAnimationTimeline
extends Control
## Accessible dope-sheet for semantic animation roles. Key movement is emitted
## once at gesture completion so it becomes one undoable authoring command.

signal key_time_changed(track_index: int, key_index: int, normalized_time: float)
signal playhead_changed(normalized_time: float)

var clip: ForgeEntityAnimationClip
var playhead := 0.0
var playing := false
var _selected_track := -1
var _selected_key := -1
var _dragging := false
var _drag_time := 0.0

const LABEL_WIDTH := 180.0
const HEADER_HEIGHT := 34.0
const LANE_HEIGHT := 38.0


func configure(value: ForgeEntityAnimationClip) -> void:
	clip = value
	custom_minimum_size = Vector2(660, maxf(150.0,
		HEADER_HEIGHT + LANE_HEIGHT * maxf(2.0, float(clip.role_tracks.size()))))
	focus_mode = Control.FOCUS_ALL
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	set_process(true)
	set_meta("accessible_label",
		"Semantic animation dope sheet. Select a diamond key and use left or right arrows, or drag it in time.")
	queue_redraw()


func set_playing(value: bool) -> void:
	playing = value
	queue_redraw()


func _process(delta: float) -> void:
	if not playing or clip == null:
		return
	var duration := maxf(0.01, clip.duration_seconds)
	playhead += delta / duration
	if playhead > 1.0:
		if clip.looping:
			playhead = fmod(playhead, 1.0)
		else:
			playhead = 1.0
			playing = false
	playhead_changed.emit(playhead)
	queue_redraw()


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color("#111821"), true)
	if clip == null:
		return
	draw_string(get_theme_default_font(), Vector2(10, 23),
		"ROLE / TIME", HORIZONTAL_ALIGNMENT_LEFT, LABEL_WIDTH - 16, 14,
		Color("#D5B86B"))
	for tick in 11:
		var normalized := float(tick) / 10.0
		var x := _x_for_time(normalized)
		draw_line(Vector2(x, HEADER_HEIGHT - 5), Vector2(x, size.y),
			Color(0.34, 0.4, 0.47, 0.45), 1.0)
		draw_string(get_theme_default_font(), Vector2(x + 2, 23),
			"%.1f" % (normalized * clip.duration_seconds),
			HORIZONTAL_ALIGNMENT_LEFT, 44, 12, Color("#8FA2B5"))
	for track_index in clip.role_tracks.size():
		var track: Dictionary = clip.role_tracks[track_index]
		var y := HEADER_HEIGHT + float(track_index) * LANE_HEIGHT
		draw_rect(Rect2(0, y, size.x, LANE_HEIGHT),
			Color("#18232E") if track_index % 2 == 0 else Color("#1C2935"), true)
		draw_string(get_theme_default_font(), Vector2(10, y + 24),
			str(track.get("role_id", "unassigned role")),
			HORIZONTAL_ALIGNMENT_LEFT, LABEL_WIDTH - 18, 13, Color("#D4DCE4"))
		var keys: Array = track.get("keys", [])
		for key_index in keys.size():
			var time := clampf(float(keys[key_index].get("time", 0.0)), 0.0, 1.0)
			if _dragging and track_index == _selected_track and key_index == _selected_key:
				time = _drag_time
			var centre := Vector2(_x_for_time(time), y + LANE_HEIGHT * 0.5)
			var color := Color("#75C9D2")
			if track_index == _selected_track and key_index == _selected_key:
				color = Color("#F2C45E")
			var diamond := PackedVector2Array([
				centre + Vector2(0, -8), centre + Vector2(8, 0),
				centre + Vector2(0, 8), centre + Vector2(-8, 0)])
			draw_colored_polygon(diamond, color)
	for marker in clip.event_markers:
		if marker == null:
			continue
		var marker_x := _x_for_time(marker.normalized_time)
		draw_line(Vector2(marker_x, HEADER_HEIGHT), Vector2(marker_x, size.y),
			Color("#E67C73"), 2.0)
	var play_x := _x_for_time(playhead)
	draw_line(Vector2(play_x, HEADER_HEIGHT - 6), Vector2(play_x, size.y),
		Color("#F4F7F9"), 2.0)


func _gui_input(event: InputEvent) -> void:
	if clip == null:
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			grab_focus()
			_select_nearest(event.position)
			_dragging = _selected_key >= 0
			_drag_time = _time_for_x(event.position.x)
		else:
			if _dragging and _selected_track >= 0 and _selected_key >= 0:
				key_time_changed.emit(_selected_track, _selected_key, _drag_time)
			_dragging = false
		queue_redraw()
		accept_event()
	elif event is InputEventMouseMotion and _dragging:
		_drag_time = _time_for_x(event.position.x)
		queue_redraw()
		accept_event()
	elif event is InputEventKey and event.pressed and not event.echo:
		if _selected_key >= 0 and event.keycode in [KEY_LEFT, KEY_RIGHT]:
			var direction := -1.0 if event.keycode == KEY_LEFT else 1.0
			var old_time := _selected_time()
			key_time_changed.emit(_selected_track, _selected_key,
				clampf(old_time + direction * 0.01, 0.0, 1.0))
			accept_event()


func _select_nearest(position: Vector2) -> void:
	_selected_track = clampi(int((position.y - HEADER_HEIGHT) / LANE_HEIGHT),
		0, maxi(0, clip.role_tracks.size() - 1))
	_selected_key = -1
	if _selected_track >= clip.role_tracks.size():
		return
	var keys: Array = clip.role_tracks[_selected_track].get("keys", [])
	var best := 16.0
	for key_index in keys.size():
		var distance := absf(position.x - _x_for_time(
			float(keys[key_index].get("time", 0.0))))
		if distance < best:
			best = distance
			_selected_key = key_index
	if _selected_key < 0:
		playhead = _time_for_x(position.x)
		playhead_changed.emit(playhead)


func _selected_time() -> float:
	if _selected_track < 0 or _selected_track >= clip.role_tracks.size():
		return 0.0
	var keys: Array = clip.role_tracks[_selected_track].get("keys", [])
	if _selected_key < 0 or _selected_key >= keys.size():
		return 0.0
	return float(keys[_selected_key].get("time", 0.0))


func _x_for_time(value: float) -> float:
	return LABEL_WIDTH + clampf(value, 0.0, 1.0) * maxf(1.0, size.x - LABEL_WIDTH - 12.0)


func _time_for_x(value: float) -> float:
	return clampf((value - LABEL_WIDTH) / maxf(1.0, size.x - LABEL_WIDTH - 12.0), 0.0, 1.0)
