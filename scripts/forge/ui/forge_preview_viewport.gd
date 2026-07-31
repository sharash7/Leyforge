class_name ForgePreviewViewport
extends SubViewportContainer

signal zoom_changed(percent: int)

const MIN_ZOOM := 0.25
const MAX_ZOOM := 8.0
const ZOOM_STEP := 1.2
# Forge authoring treats -Z as the presentation front.
const CAMERA_DIRECTION := Vector3(1.8, 2.2, -5.0)
const BUTTON_PAN_PIXELS := 44.0

var _viewport: SubViewport
var _pivot: Node3D
var _presentation_root: Node3D
var _camera: Camera3D
var _dragging := false
var _panning := false
var _last_mouse := Vector2.ZERO
var _yaw := deg_to_rad(30.0)
var _pitch := deg_to_rad(-15.0)
var _zoom := 1.0
var _base_camera_size := 2.0
var _camera_target := Vector3.ZERO
var _camera_distance := 4.5
var _current_bounds := AABB()
var _has_current_bounds := false


func _ready() -> void:
	# Keep both preview-control rows reachable on compact 720p-class windows.
	custom_minimum_size = Vector2(260, 260)
	focus_mode = Control.FOCUS_ALL
	mouse_default_cursor_shape = Control.CURSOR_MOVE
	stretch = false
	_viewport = SubViewport.new()
	_viewport.size = Vector2i(420, 420)
	_viewport.transparent_bg = false
	_viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(_viewport)
	var world_environment := WorldEnvironment.new()
	var environment := Environment.new()
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color("#111a20")
	environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	environment.ambient_light_color = Color("#b7c8d0")
	environment.ambient_light_energy = 0.65
	world_environment.environment = environment
	_viewport.add_child(world_environment)
	_pivot = Node3D.new()
	_pivot.name = "PreviewPivot"
	_viewport.add_child(_pivot)
	_presentation_root = Node3D.new()
	_presentation_root.name = "Presentation"
	_pivot.add_child(_presentation_root)
	var light := DirectionalLight3D.new()
	light.rotation_degrees = Vector3(-45, -35, 0)
	light.light_energy = 1.15
	_viewport.add_child(light)
	_camera = Camera3D.new()
	_camera.projection = Camera3D.PROJECTION_ORTHOGONAL
	_camera.current = true
	_viewport.add_child(_camera)
	reset_view()
	call_deferred("_sync_viewport_size")


func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED and is_instance_valid(_viewport):
		_sync_viewport_size()
		if _has_current_bounds:
			_recalculate_fit_size()
			_apply_zoom()


func show_asset(asset: ForgeAssetDefinition) -> void:
	if not is_instance_valid(_presentation_root):
		return
	_clear_presentation()
	if asset == null:
		return
	var palette: ForgePaletteDefinition
	for value in asset.palettes:
		if value is ForgePaletteDefinition:
			palette = value
			break
	var result := {}
	if asset.surface_set is ForgeSurfaceSet:
		result = ForgeMeshBaker.bake_textured_surface_cube(
			asset.surface_set, palette)
	elif asset.voxel_volume is ForgeVoxelVolume:
		result = ForgeMeshBaker.bake(asset.voxel_volume, palette)
	elif not asset.parts.is_empty():
		var combined_bounds := AABB()
		var first := true
		for resource in asset.parts:
			if not resource is ForgePartDefinition \
					or not resource.source_volume is ForgeVoxelVolume:
				continue
			var part: ForgePartDefinition = resource
			var part_result := ForgeMeshBaker.bake(
				part.source_volume, palette)
			if not bool(part_result.get("ok", false)):
				continue
			var part_node := MeshInstance3D.new()
			part_node.name = part.part_key.to_pascal_case()
			part_node.mesh = part_result["mesh"]
			part_node.transform = part.local_transform
			_presentation_root.add_child(part_node)
			var part_bounds: AABB = (
				part.local_transform * part_result["bounds"])
			combined_bounds = part_bounds if first \
				else combined_bounds.merge(part_bounds)
			first = false
		if not first:
			_presentation_root.position = -combined_bounds.get_center()
			_fit_bounds(combined_bounds)
		return
	if bool(result.get("ok", false)):
		var mesh_instance := MeshInstance3D.new()
		mesh_instance.name = "Geometry"
		mesh_instance.mesh = result["mesh"]
		_presentation_root.add_child(mesh_instance)
		var bounds: AABB = result.get("bounds", AABB())
		_presentation_root.position = -bounds.get_center()
		_fit_bounds(bounds)


func show_runtime_package(gameplay_id: String, instance_count := 1) -> void:
	if not is_instance_valid(_presentation_root):
		return
	_clear_presentation()
	var count := clampi(instance_count, 1, 5)
	var package: ForgeRuntimePackage = ForgeRuntime.package_for(gameplay_id)
	var combined_bounds := AABB()
	var first := true
	for index in count:
		var instance := ForgeRuntime.instantiate_presentation(
			gameplay_id, "forge_world_test")
		if instance == null:
			continue
		instance.position = Vector3(
			float(index) - float(count - 1) * 0.5, 0.0, 0.0)
		_presentation_root.add_child(instance)
		if package != null:
			var bounds := package.bounds
			bounds.position += instance.position
			combined_bounds = bounds if first else combined_bounds.merge(bounds)
			first = false
	if not first:
		_presentation_root.position = -combined_bounds.get_center()
		_fit_bounds(combined_bounds)
	else:
		_fit_bounds(AABB(Vector3(-1, -0.5, -0.5), Vector3(2, 1, 1)))


func zoom_in() -> void:
	_set_zoom(_zoom * ZOOM_STEP)


func zoom_out() -> void:
	_set_zoom(_zoom / ZOOM_STEP)


func reset_view() -> void:
	_yaw = deg_to_rad(30.0)
	_pitch = deg_to_rad(-15.0)
	_zoom = 1.0
	_camera_target = Vector3.ZERO
	if _has_current_bounds:
		_recalculate_fit_size()
	_apply_orbit()
	_update_camera()
	_apply_zoom()


func get_zoom_percent() -> int:
	return roundi(_zoom * 100.0)


func pan_left() -> void:
	_pan_by(Vector2(BUTTON_PAN_PIXELS, 0.0))


func pan_right() -> void:
	_pan_by(Vector2(-BUTTON_PAN_PIXELS, 0.0))


func pan_up() -> void:
	_pan_by(Vector2(0.0, BUTTON_PAN_PIXELS))


func pan_down() -> void:
	_pan_by(Vector2(0.0, -BUTTON_PAN_PIXELS))


func _clear_presentation() -> void:
	for child in _presentation_root.get_children():
		_presentation_root.remove_child(child)
		child.queue_free()
	_presentation_root.position = Vector3.ZERO
	_has_current_bounds = false


func _sync_viewport_size() -> void:
	if not is_instance_valid(_viewport):
		return
	_viewport.size = Vector2i(
		maxi(1, roundi(size.x)),
		maxi(1, roundi(size.y)))


func _fit_bounds(bounds: AABB) -> void:
	_current_bounds = bounds
	_has_current_bounds = true
	var radius := maxf(bounds.size.length() * 0.5, 0.25)
	_camera_distance = maxf(3.5, radius * 3.2)
	_camera_target = Vector3.ZERO
	_camera.near = maxf(0.01, _camera_distance - radius * 1.75)
	_camera.far = _camera_distance + radius * 4.0
	_zoom = 1.0
	_recalculate_fit_size()
	_update_camera()
	_apply_zoom()


func _recalculate_fit_size() -> void:
	if not _has_current_bounds:
		return
	# A padded bounding sphere stays framed at every orbit angle. Portrait
	# previews need extra vertical camera size because orthographic `size`
	# describes the vertical span.
	var fit_span := maxf(_current_bounds.size.length() * 1.45, 0.5)
	var aspect := 1.0
	if is_instance_valid(_viewport) and _viewport.size.y > 0:
		aspect = float(_viewport.size.x) / float(_viewport.size.y)
	_base_camera_size = clampf(
		fit_span / maxf(0.35, minf(1.0, aspect)), 0.5, 40.0)


func _set_zoom(value: float) -> void:
	_zoom = clampf(value, MIN_ZOOM, MAX_ZOOM)
	_apply_zoom()


func _apply_zoom() -> void:
	if is_instance_valid(_camera):
		_camera.size = _base_camera_size / _zoom
	zoom_changed.emit(get_zoom_percent())


func _pan_by(delta: Vector2) -> void:
	if not is_instance_valid(_camera) or not is_instance_valid(_viewport):
		return
	var viewport_height := maxf(1.0, float(_viewport.size.y))
	var world_per_pixel := _camera.size / viewport_height
	var basis := _camera.global_transform.basis
	_camera_target += (
		-basis.x * delta.x + basis.y * delta.y) * world_per_pixel
	_update_camera()


func _update_camera() -> void:
	if not is_instance_valid(_camera):
		return
	var direction := CAMERA_DIRECTION.normalized()
	var camera_position := _camera_target + direction * _camera_distance
	_camera.look_at_from_position(camera_position, _camera_target)


func _orbit_by(delta: Vector2) -> void:
	_yaw -= delta.x * 0.01
	_pitch = clampf(
		_pitch - delta.y * 0.01,
		deg_to_rad(-85.0), deg_to_rad(85.0))
	_apply_orbit()


func _apply_orbit() -> void:
	if is_instance_valid(_pivot):
		_pivot.rotation = Vector3(_pitch, _yaw, 0.0)


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_panning = event.pressed and event.shift_pressed
			_dragging = event.pressed and not event.shift_pressed
			_last_mouse = event.position
			if event.pressed:
				grab_focus()
			accept_event()
		elif event.button_index in [MOUSE_BUTTON_MIDDLE, MOUSE_BUTTON_RIGHT]:
			_panning = event.pressed
			_dragging = false
			_last_mouse = event.position
			if event.pressed:
				grab_focus()
			accept_event()
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_in()
			accept_event()
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_out()
			accept_event()
	elif event is InputEventMouseMotion and (_dragging or _panning):
		var delta: Vector2 = event.position - _last_mouse
		_last_mouse = event.position
		if _panning:
			_pan_by(delta)
		else:
			_orbit_by(delta)
		accept_event()
	elif event is InputEventPanGesture:
		_set_zoom(_zoom * pow(ZOOM_STEP, -event.delta.y))
		accept_event()
	elif event is InputEventKey and event.pressed and not event.echo:
		if event.keycode in [KEY_EQUAL, KEY_PLUS, KEY_KP_ADD]:
			zoom_in()
			accept_event()
		elif event.keycode in [KEY_MINUS, KEY_KP_SUBTRACT]:
			zoom_out()
			accept_event()
		elif event.keycode == KEY_0:
			reset_view()
			accept_event()
		elif event.keycode == KEY_LEFT:
			pan_left()
			accept_event()
		elif event.keycode == KEY_RIGHT:
			pan_right()
			accept_event()
		elif event.keycode == KEY_UP:
			pan_up()
			accept_event()
		elif event.keycode == KEY_DOWN:
			pan_down()
			accept_event()
