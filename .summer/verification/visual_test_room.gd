extends Node3D
## Directly runnable visual inspection room for every registry model.
##
## Controls: mouse look, WASD move, E rise, C descend, Shift accelerate,
## Escape releases the mouse, and left click captures it again.

const HumanoidVisualScript = preload("res://scripts/visual/humanoid_visual.gd")
const ItemModelFactoryScript = preload("res://scripts/visual/item_model_factory.gd")
const OUTPUT_PATH := "res://.summer/verification/visual_test_room_capture.png"
const GRID_COLUMNS := 16
const GRID_SPACING := 2.35
const FLY_SPEED := 9.0
const FAST_MULTIPLIER := 3.0
const MOUSE_SENSITIVITY := 0.0022

var camera: Camera3D
var pitch := -0.08
var yaw := 0.0
var block_model_count := 0
var item_model_count := 0
var held_kind_count := 0
var rig_count := 0


func _ready() -> void:
	_build_environment()
	_build_instructions()
	_build_camera()
	_build_rig_gallery()
	_build_registry_gallery()
	print("VISUAL_TEST_ROOM_READY blocks=%d items=%d rigs=%d held_kinds=%d" % [
		block_model_count, item_model_count, rig_count, held_kind_count])
	if "--capture" in OS.get_cmdline_user_args():
		call_deferred("_capture_and_quit")
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _build_environment() -> void:
	var world_environment := WorldEnvironment.new()
	var environment := Environment.new()
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color(0.11, 0.15, 0.20)
	environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	environment.ambient_light_color = Color(0.76, 0.82, 0.90)
	environment.ambient_light_energy = 0.72
	environment.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	world_environment.environment = environment
	add_child(world_environment)

	var light := DirectionalLight3D.new()
	light.rotation_degrees = Vector3(-48.0, -32.0, 0.0)
	light.light_energy = 1.15
	light.shadow_enabled = true
	add_child(light)

	_add_box(
		self, Vector3(43.0, 0.20, 82.0), Vector3(0.0, -0.10, -34.0),
		Color(0.20, 0.23, 0.27))
	# Coloured section strips make the large catalogue easy to navigate.
	_add_box(
		self, Vector3(41.5, 0.025, 0.32), Vector3(0.0, 0.02, -7.0),
		Color(0.25, 0.54, 0.78))
	_add_box(
		self, Vector3(41.5, 0.025, 0.32), Vector3(0.0, 0.02, -31.0),
		Color(0.78, 0.49, 0.23))


func _build_instructions() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)
	var panel := ColorRect.new()
	panel.position = Vector2(14, 14)
	panel.size = Vector2(720, 76)
	panel.color = Color(0.025, 0.035, 0.05, 0.88)
	layer.add_child(panel)
	var label := Label.new()
	label.position = Vector2(14, 8)
	label.size = Vector2(690, 62)
	label.text = "LEYFORGE VISUAL TEST ROOM\nMouse look · WASD move · E/C rise/descend · Shift fast · Esc releases mouse\nFront: T-pose rigs + held kinds   Blue line: all blocks   Orange line: all items"
	label.add_theme_font_size_override("font_size", 16)
	panel.add_child(label)


func _build_camera() -> void:
	camera = Camera3D.new()
	camera.name = "InspectionCamera"
	camera.position = Vector3(0.0, 2.35, 8.5)
	camera.rotation = Vector3(pitch, yaw, 0.0)
	camera.near = 0.06
	camera.current = true
	add_child(camera)


func _build_rig_gallery() -> void:
	var rigs := [
		{
			"label": "PLAYER REFERENCE",
			"clothing": Color(0.24, 0.42, 0.62),
			"skin": Color(0.72, 0.52, 0.38),
			"trousers": Color(0.18, 0.22, 0.28),
			"held": _stack("item.tool.stone_pickaxe", "item"),
		},
		{
			"label": "VILLAGER REFERENCE",
			"clothing": Color(0.46, 0.29, 0.15),
			"skin": Color(0.74, 0.55, 0.40),
			"trousers": Color(0.17, 0.20, 0.24),
			"held": _stack("item.tool.hammer_basic", "item"),
		},
		{
			"label": "GOBLIN REFERENCE",
			"clothing": Color(0.28, 0.20, 0.15),
			"skin": Color(0.31, 0.55, 0.20),
			"trousers": Color(0.12, 0.15, 0.12),
			"held": _stack("item.weapon.iron_sword", "item"),
		},
	]
	for index in rigs.size():
		var spec: Dictionary = rigs[index]
		var rig := HumanoidVisualScript.new()
		rig.position = Vector3((index - 1) * 3.4, 0.0, 2.0)
		rig.configure(
			spec["clothing"], spec["skin"], spec["trousers"])
		rig.set_reference_t_pose()
		rig.set_held_stack(spec["held"])
		add_child(rig)
		_add_world_label(
			str(spec["label"]), rig.position + Vector3(0.0, 2.35, 0.0), 32)
		rig_count += 1

	var representative_stacks := _representative_visual_kinds()
	for index in representative_stacks.size():
		var stack: Dictionary = representative_stacks[index]
		var col := index % 8
		var row := index / 8
		var rig := HumanoidVisualScript.new()
		rig.position = Vector3(
			-10.5 + col * 3.0, 0.0, -1.4 - row * 3.4)
		rig.configure(
			Color(0.30, 0.34, 0.39), Color(0.70, 0.50, 0.36),
			Color(0.16, 0.18, 0.22))
		rig.set_reference_t_pose()
		rig.set_held_stack(stack)
		add_child(rig)
		_add_world_label(
			ItemModelFactoryScript.visual_kind_for(stack).to_upper(),
			rig.position + Vector3(0.0, 2.25, 0.0), 25)
		held_kind_count += 1
		rig_count += 1


func _representative_visual_kinds() -> Array[Dictionary]:
	var representatives: Dictionary = {}
	for id in ItemRegistry.get_all_ids():
		var definition := ItemRegistry.get_definition(int(id))
		var stack := _stack(str(definition.get("stable_id", "")), "item")
		var visual_kind := ItemModelFactoryScript.visual_kind_for(stack)
		if not representatives.has(visual_kind):
			representatives[visual_kind] = stack
	for id in BlockRegistry.get_all_ids():
		if int(id) == BlockRegistry.AIR:
			continue
		var definition := BlockRegistry.get_definition(int(id))
		var stack := _stack(str(definition.get("stable_id", "")), "block")
		var visual_kind := ItemModelFactoryScript.visual_kind_for(stack)
		if not representatives.has(visual_kind):
			representatives[visual_kind] = stack
	var kinds: Array = representatives.keys()
	kinds.sort()
	var result: Array[Dictionary] = []
	for visual_kind in kinds:
		result.append(representatives[visual_kind])
	return result


func _build_registry_gallery() -> void:
	var block_ids := BlockRegistry.get_all_ids()
	block_ids.sort()
	var block_index := 0
	for id in block_ids:
		if int(id) == BlockRegistry.AIR:
			continue
		var definition := BlockRegistry.get_definition(int(id))
		var stack := _stack(str(definition.get("stable_id", "")), "block")
		_add_catalogue_model(
			stack, str(definition.get("name", "Block %d" % int(id))),
			block_index, -11.0)
		block_index += 1
	block_model_count = block_index

	var item_ids := ItemRegistry.get_all_ids()
	item_ids.sort()
	for index in item_ids.size():
		var definition := ItemRegistry.get_definition(int(item_ids[index]))
		var stack := _stack(str(definition.get("stable_id", "")), "item")
		_add_catalogue_model(
			stack, str(definition.get("name", "Item %d" % int(item_ids[index]))),
			index, -35.0)
	item_model_count = item_ids.size()


func _add_catalogue_model(
		stack: Dictionary, display_name: String, index: int,
		start_z: float) -> void:
	var col := index % GRID_COLUMNS
	var row := index / GRID_COLUMNS
	var position := Vector3(
		(col - (GRID_COLUMNS - 1) * 0.5) * GRID_SPACING,
		0.46,
		start_z - row * GRID_SPACING)
	_add_box(
		self, Vector3(1.35, 0.30, 1.35),
		Vector3(position.x, 0.15, position.z),
		Color(0.13, 0.15, 0.18))
	var model := ItemModelFactoryScript.build(stack, 1.45)
	model.position = position
	add_child(model)
	_add_world_label(
		"%s\n%s" % [display_name, Inventory.stack_stable_id(stack)],
		position + Vector3(0.0, 0.92, 0.0), 18)


func _stack(stable_id: String, kind: String) -> Dictionary:
	return Inventory.make_stack_from_ref({
		"kind": kind,
		"stable_id": stable_id,
		"count": 1,
	})


func _add_world_label(text: String, position: Vector3, font_size: int) -> void:
	var label := Label3D.new()
	label.text = text
	label.position = position
	label.font_size = font_size
	label.outline_size = 5
	label.modulate = Color(0.96, 0.97, 1.0)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.no_depth_test = true
	add_child(label)


func _add_box(
		parent: Node3D, size: Vector3, position: Vector3,
		color: Color) -> MeshInstance3D:
	var instance := MeshInstance3D.new()
	var mesh := BoxMesh.new()
	var material := StandardMaterial3D.new()
	mesh.size = size
	material.albedo_color = color
	material.roughness = 0.88
	mesh.material = material
	instance.mesh = mesh
	instance.position = position
	parent.add_child(instance)
	return instance


func _process(delta: float) -> void:
	if camera == null:
		return
	var input := Input.get_vector(
		"move_left", "move_right", "move_forward", "move_back")
	var direction := camera.global_basis * Vector3(input.x, 0.0, input.y)
	var vertical := 0.0
	if Input.is_key_pressed(KEY_E):
		vertical += 1.0
	if Input.is_key_pressed(KEY_C):
		vertical -= 1.0
	direction.y = vertical
	if direction.length_squared() > 0.0:
		var speed := FLY_SPEED * (
			FAST_MULTIPLIER if Input.is_action_pressed("sprint") else 1.0)
		camera.global_position += direction.normalized() * speed * delta


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		return
	if event is InputEventMouseButton and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		return
	if event is InputEventMouseMotion \
			and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		yaw -= event.relative.x * MOUSE_SENSITIVITY
		pitch = clampf(
			pitch - event.relative.y * MOUSE_SENSITIVITY, -1.5, 1.5)
		camera.rotation = Vector3(pitch, yaw, 0.0)


func _capture_and_quit() -> void:
	for _frame in 10:
		await get_tree().process_frame
	var image := get_viewport().get_texture().get_image()
	var error := image.save_png(OUTPUT_PATH)
	print("VISUAL_TEST_ROOM_CAPTURE path=%s error=%d" % [OUTPUT_PATH, error])
	get_tree().quit(0 if error == OK else 1)
