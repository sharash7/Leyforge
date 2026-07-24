extends Node3D
## Deterministic rendered contact sheet for the Stage 7 low-poly visual pass.

const HumanoidVisualScript = preload("res://scripts/visual/humanoid_visual.gd")
const ItemModelFactoryScript = preload("res://scripts/visual/item_model_factory.gd")
const OUTPUT_PATH := "res://.summer/verification/phase7_visual_capture.png"


func _ready() -> void:
	_build_environment()
	_build_humanoids()
	_build_functional_lineup()
	for _frame in 12:
		await get_tree().process_frame
	var image := get_viewport().get_texture().get_image()
	var error := image.save_png(OUTPUT_PATH)
	print("PHASE7_VISUAL_CAPTURE path=%s error=%d" % [OUTPUT_PATH, error])
	get_tree().quit(0 if error == OK else 1)


func _build_environment() -> void:
	var environment_node := WorldEnvironment.new()
	var environment := Environment.new()
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color(0.34, 0.45, 0.58)
	environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	environment.ambient_light_color = Color(0.75, 0.80, 0.88)
	environment.ambient_light_energy = 0.72
	environment.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	environment_node.environment = environment
	add_child(environment_node)

	var light := DirectionalLight3D.new()
	light.rotation_degrees = Vector3(-52.0, -28.0, 0.0)
	light.light_energy = 1.25
	light.shadow_enabled = true
	add_child(light)

	var camera := Camera3D.new()
	camera.position = Vector3(0.0, 3.65, 9.0)
	camera.look_at_from_position(camera.position, Vector3(0.0, 1.0, 0.3))
	camera.fov = 52.0
	add_child(camera)
	camera.current = true

	var floor := MeshInstance3D.new()
	var floor_mesh := BoxMesh.new()
	var floor_material := StandardMaterial3D.new()
	floor_material.albedo_color = Color(0.16, 0.22, 0.18)
	floor_material.roughness = 0.96
	floor_mesh.size = Vector3(12.0, 0.18, 7.0)
	floor_mesh.material = floor_material
	floor.mesh = floor_mesh
	floor.position = Vector3(0.0, -0.12, -0.5)
	add_child(floor)
	var transparency_target := MeshInstance3D.new()
	var target_mesh := BoxMesh.new()
	var target_material := StandardMaterial3D.new()
	target_material.albedo_color = Color(0.12, 0.04, 0.04)
	target_mesh.size = Vector3(0.18, 0.82, 0.18)
	target_mesh.material = target_material
	transparency_target.mesh = target_mesh
	transparency_target.position = Vector3(4.3, 0.55, 2.05)
	add_child(transparency_target)


func _build_humanoids() -> void:
	var definitions := [
		[
			Vector3(-2.8, 0.0, 0.0), Color(0.78, 0.52, 0.22),
			"item.tool.hammer_basic", "build",
		],
		[
			Vector3(0.0, 0.0, 0.0), Color(0.42, 0.47, 0.56),
			"item.weapon.iron_sword", "attack",
		],
		[
			Vector3(2.8, 0.0, 0.0), Color(0.32, 0.24, 0.12),
			"item.weapon.stone_spear", "walk",
		],
	]
	for definition in definitions:
		var humanoid: Node3D = HumanoidVisualScript.new()
		humanoid.position = definition[0]
		humanoid.rotation.y = PI
		add_child(humanoid)
		var goblin := str(definition[2]) == "item.weapon.stone_spear"
		humanoid.configure(
			definition[1],
			Color(0.32, 0.55, 0.18) if goblin else Color(0.72, 0.52, 0.38),
			Color(0.16, 0.18, 0.14))
		humanoid.set_held_stack(Inventory.make_stack_from_ref({
			"kind": "item",
			"stable_id": str(definition[2]),
			"count": 1,
		}))
		if str(definition[3]) == "walk":
			humanoid.update_pose(0.3, 1.8)
		else:
			humanoid.play_action(str(definition[3]), 0.55)
			humanoid.update_pose(0.22, 0.0)


func _build_functional_lineup() -> void:
	var definitions := [
		["functional.furnace.stone", Vector3(-4.3, 0.55, 2.5)],
		["storage.chest.wood", Vector3(-2.15, 0.48, 2.5)],
		["automation.transport.chute", Vector3(0.0, 0.42, 2.5)],
		["construction.door.oak", Vector3(2.15, 0.58, 2.5)],
		["construction.window.glass", Vector3(4.3, 0.55, 2.5)],
	]
	for definition in definitions:
		var model := ItemModelFactoryScript.build(
			Inventory.make_stack_from_ref({
				"kind": "block",
				"stable_id": str(definition[0]),
				"count": 1,
			}), 1.55)
		model.position = definition[1]
		add_child(model)
