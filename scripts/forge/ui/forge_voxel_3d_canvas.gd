class_name ForgeVoxel3DCanvas
extends SubViewportContainer
## Reusable directly interactive 3D voxel canvas for structures, anatomy and VFX.

signal cell_pressed(position: Vector3i, erase: bool, continuous: bool)
signal stroke_finished()
signal hover_changed(position: Vector3i)

var active_layer := 0
var camera_distance := 34.0
var camera_yaw := -0.75
var camera_pitch := -0.55
var camera_target := Vector3(8.0, 2.0, 8.0)
var test_pad_mode := "grid"
var records: Array[Dictionary] = []

var _viewport: SubViewport
var _root: Node3D
var _cell_root: Node3D
var _environment_root: Node3D
var _camera: Camera3D
var _drag_button := MOUSE_BUTTON_NONE
var _drag_origin := Vector2.ZERO
var _dragged := false
var _stroke_active := false
var _last_stroke_cell := Vector3i(999999, 999999, 999999)


func _ready() -> void:
	custom_minimum_size = Vector2(520, 430)
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	stretch = true
	focus_mode = Control.FOCUS_ALL
	mouse_default_cursor_shape = Control.CURSOR_CROSS
	set_meta("accessible_label",
		"Interactive three dimensional voxel canvas. Use arrow keys to orbit, "
		+ "Page Up and Page Down to change layer, Enter to place, and Delete to erase.")
	_build_viewport()
	_refresh_environment()
	_rebuild_cells()


func set_records(value: Array[Dictionary]) -> void:
	records = value.duplicate(true)
	_rebuild_cells()


func set_active_layer(value: int) -> void:
	active_layer = value
	_refresh_environment()


func set_test_pad_mode(value: String) -> void:
	test_pad_mode = value
	_refresh_environment()


func focus_records() -> void:
	if records.is_empty():
		camera_target = Vector3(8.0, 2.0, 8.0)
		camera_distance = 34.0
		_update_camera()
		return
	var minimum := Vector3(INF, INF, INF)
	var maximum := Vector3(-INF, -INF, -INF)
	for record in records:
		var position := _record_position(record)
		minimum = minimum.min(Vector3(position))
		maximum = maximum.max(Vector3(position) + Vector3.ONE)
	camera_target = (minimum + maximum) * 0.5
	camera_distance = clampf((maximum - minimum).length() * 1.7, 8.0, 160.0)
	_update_camera()


func _build_viewport() -> void:
	_viewport = SubViewport.new()
	_viewport.name = "VoxelEditViewport"
	_viewport.own_world_3d = true
	_viewport.transparent_bg = false
	_viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_viewport.msaa_3d = Viewport.MSAA_2X
	add_child(_viewport)
	_root = Node3D.new()
	_root.name = "VoxelEditRoot"
	_viewport.add_child(_root)
	_environment_root = Node3D.new()
	_environment_root.name = "TestPad"
	_root.add_child(_environment_root)
	_cell_root = Node3D.new()
	_cell_root.name = "VoxelCells"
	_root.add_child(_cell_root)
	_camera = Camera3D.new()
	_camera.name = "VoxelEditCamera"
	_camera.fov = 48.0
	_camera.near = 0.05
	_camera.far = 512.0
	_root.add_child(_camera)
	var sun := DirectionalLight3D.new()
	sun.name = "KeyLight"
	sun.rotation_degrees = Vector3(-55.0, -35.0, 0.0)
	sun.light_energy = 1.15
	_root.add_child(sun)
	var fill := OmniLight3D.new()
	fill.name = "FillLight"
	fill.position = Vector3(-8.0, 12.0, 6.0)
	fill.omni_range = 42.0
	fill.light_energy = 2.0
	_root.add_child(fill)
	var world := WorldEnvironment.new()
	var environment := Environment.new()
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color("#111821")
	environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	environment.ambient_light_color = Color("#9DB2C6")
	environment.ambient_light_energy = 0.42
	world.environment = environment
	_root.add_child(world)
	_update_camera()


func _refresh_environment() -> void:
	if not is_instance_valid(_environment_root):
		return
	_clear_children(_environment_root)
	var floor_mesh := PlaneMesh.new()
	floor_mesh.size = Vector2(48.0, 48.0)
	var floor_material := StandardMaterial3D.new()
	floor_material.albedo_color = Color("#263540")
	floor_material.roughness = 0.92
	floor_mesh.material = floor_material
	var floor_node := MeshInstance3D.new()
	floor_node.name = "AuthoringGround"
	floor_node.mesh = floor_mesh
	floor_node.position = Vector3(8.0, -0.02, 8.0)
	if test_pad_mode == "slope":
		floor_node.rotation_degrees.z = -7.0
	_environment_root.add_child(floor_node)
	var layer_mesh := PlaneMesh.new()
	layer_mesh.size = Vector2(32.0, 32.0)
	var layer_material := StandardMaterial3D.new()
	layer_material.albedo_color = Color(0.2, 0.75, 0.8, 0.12)
	layer_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	layer_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	layer_mesh.material = layer_material
	var layer_node := MeshInstance3D.new()
	layer_node.name = "ActiveLayer"
	layer_node.mesh = layer_mesh
	layer_node.position = Vector3(8.0, float(active_layer) + 0.005, 8.0)
	_environment_root.add_child(layer_node)
	if test_pad_mode in ["scale", "slope_scale"]:
		_add_scale_figure()


func _add_scale_figure() -> void:
	var body := MeshInstance3D.new()
	body.name = "ScaleFigure"
	var capsule := CapsuleMesh.new()
	capsule.radius = 0.28
	capsule.height = 1.8
	var material := StandardMaterial3D.new()
	material.albedo_color = Color("#D7C28C")
	material.roughness = 0.65
	capsule.material = material
	body.mesh = capsule
	body.position = Vector3(-1.0, 0.9, 0.0)
	_environment_root.add_child(body)


func _rebuild_cells() -> void:
	if not is_instance_valid(_cell_root):
		return
	_clear_children(_cell_root)
	var shared_mesh := BoxMesh.new()
	shared_mesh.size = Vector3(0.96, 0.96, 0.96)
	var materials := {}
	for record in records:
		var position := _record_position(record)
		var color: Color = record.get("color", Color("#C08045"))
		var alpha := clampf(float(record.get("alpha", 1.0)), 0.08, 1.0)
		var material_key := "%s:%0.2f" % [color.to_html(false), alpha]
		var material: StandardMaterial3D = materials.get(material_key)
		if material == null:
			material = StandardMaterial3D.new()
			material.albedo_color = Color(color.r, color.g, color.b, alpha)
			material.roughness = 0.76
			if alpha < 0.99:
				material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			materials[material_key] = material
		var node := MeshInstance3D.new()
		node.name = str(record.get("name", "Cell_%d_%d_%d" % [
			position.x, position.y, position.z]))
		node.mesh = shared_mesh
		node.material_override = material
		node.position = Vector3(position) + Vector3.ONE * 0.5
		_cell_root.add_child(node)


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_handle_mouse_button(event)
	elif event is InputEventMouseMotion:
		_handle_mouse_motion(event)
	elif event is InputEventKey and event.pressed and not event.echo:
		_handle_key(event)


func _handle_mouse_button(event: InputEventMouseButton) -> void:
	if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
		camera_distance = maxf(3.0, camera_distance * 0.88)
		_update_camera()
		accept_event()
		return
	if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
		camera_distance = minf(200.0, camera_distance * 1.14)
		_update_camera()
		accept_event()
		return
	if event.button_index not in [MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT,
			MOUSE_BUTTON_MIDDLE]:
		return
	if event.pressed:
		grab_focus()
		_drag_button = event.button_index
		_drag_origin = event.position
		_dragged = false
		if event.button_index == MOUSE_BUTTON_LEFT \
				or (event.button_index == MOUSE_BUTTON_RIGHT and not event.shift_pressed):
			_stroke_active = true
			_last_stroke_cell = Vector3i(999999, 999999, 999999)
			_emit_cell(event.position, event.button_index == MOUSE_BUTTON_RIGHT, false)
	else:
		if _stroke_active:
			stroke_finished.emit()
		_stroke_active = false
		_drag_button = MOUSE_BUTTON_NONE
	accept_event()


func _handle_mouse_motion(event: InputEventMouseMotion) -> void:
	var delta := event.position - _drag_origin
	if delta.length() > 3.0:
		_dragged = true
	if _drag_button == MOUSE_BUTTON_MIDDLE \
			or (_drag_button == MOUSE_BUTTON_RIGHT and event.shift_pressed):
		var right := _camera.global_transform.basis.x
		var up := Vector3.UP
		camera_target += (-right * event.relative.x + up * event.relative.y) \
			* camera_distance * 0.0018
		_update_camera()
	elif _drag_button == MOUSE_BUTTON_RIGHT and not _stroke_active:
		camera_yaw -= event.relative.x * 0.008
		camera_pitch = clampf(camera_pitch - event.relative.y * 0.008, -1.45, -0.08)
		_update_camera()
	elif _stroke_active and _drag_button in [MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT]:
		_emit_cell(event.position, _drag_button == MOUSE_BUTTON_RIGHT, true)
	else:
		hover_changed.emit(_project_to_layer(event.position))
	_drag_origin = event.position


func _handle_key(event: InputEventKey) -> void:
	match event.keycode:
		KEY_LEFT:
			camera_yaw += 0.12
		KEY_RIGHT:
			camera_yaw -= 0.12
		KEY_UP:
			camera_pitch = clampf(camera_pitch - 0.1, -1.45, -0.08)
		KEY_DOWN:
			camera_pitch = clampf(camera_pitch + 0.1, -1.45, -0.08)
		KEY_PAGEUP:
			set_active_layer(active_layer + 1)
		KEY_PAGEDOWN:
			set_active_layer(active_layer - 1)
		KEY_ENTER, KEY_KP_ENTER:
			cell_pressed.emit(Vector3i(
				floori(camera_target.x), active_layer, floori(camera_target.z)), false, false)
			stroke_finished.emit()
		KEY_DELETE, KEY_BACKSPACE:
			cell_pressed.emit(Vector3i(
				floori(camera_target.x), active_layer, floori(camera_target.z)), true, false)
			stroke_finished.emit()
	_update_camera()


func _emit_cell(mouse_position: Vector2, erase: bool, continuous: bool) -> void:
	var cell := _project_to_layer(mouse_position)
	if cell == _last_stroke_cell:
		return
	_last_stroke_cell = cell
	cell_pressed.emit(cell, erase, continuous)


func _project_to_layer(mouse_position: Vector2) -> Vector3i:
	if not is_instance_valid(_camera):
		return Vector3i.ZERO
	var ray_origin := _camera.project_ray_origin(mouse_position)
	var ray_direction := _camera.project_ray_normal(mouse_position)
	var plane := Plane(Vector3.UP, float(active_layer))
	var intersection: Variant = plane.intersects_ray(ray_origin, ray_direction)
	if intersection == null:
		return Vector3i(floori(camera_target.x), active_layer, floori(camera_target.z))
	var point: Vector3 = intersection
	return Vector3i(floori(point.x), active_layer, floori(point.z))


func _update_camera() -> void:
	if not is_instance_valid(_camera):
		return
	var horizontal := cos(camera_pitch) * camera_distance
	var offset := Vector3(
		cos(camera_yaw) * horizontal,
		-sin(camera_pitch) * camera_distance,
		sin(camera_yaw) * horizontal)
	_camera.position = camera_target + offset
	_camera.look_at(camera_target, Vector3.UP)


func _record_position(record: Dictionary) -> Vector3i:
	var value: Variant = record.get("position", Vector3i.ZERO)
	if value is Vector3i:
		return value
	if value is Array and value.size() >= 3:
		return Vector3i(int(value[0]), int(value[1]), int(value[2]))
	return Vector3i.ZERO


func _clear_children(parent: Node) -> void:
	for child in parent.get_children():
		parent.remove_child(child)
		child.queue_free()
