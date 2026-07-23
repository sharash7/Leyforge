class_name HumanoidVisual
extends Node3D
## Articulated low-poly humanoid shared by villagers, goblins, and the player.

const ItemModelFactoryScript = preload("res://scripts/visual/item_model_factory.gd")

var left_arm: Node3D
var right_arm: Node3D
var left_leg: Node3D
var right_leg: Node3D
var held_anchor: Node3D
var _held_model: Node3D
var _walk_phase := 0.0
var _action := "idle"
var _action_seconds := 0.0


func configure(
		clothing_color: Color, skin_color: Color = Color(0.72, 0.52, 0.38),
		trouser_color: Color = Color(0.20, 0.24, 0.28),
		visibility_layer: int = 1) -> void:
	for child in get_children():
		child.queue_free()
	left_arm = Node3D.new()
	right_arm = Node3D.new()
	left_leg = Node3D.new()
	right_leg = Node3D.new()

	_add_part(
		self, Vector3(0.60, 0.78, 0.36), Vector3(0.0, 1.12, 0.0),
		clothing_color, visibility_layer)
	_add_part(
		self, Vector3(0.46, 0.46, 0.46), Vector3(0.0, 1.73, 0.0),
		skin_color, visibility_layer)
	# Hair cap and two eyes make the facing direction readable.
	_add_part(
		self, Vector3(0.47, 0.12, 0.47), Vector3(0.0, 1.94, 0.0),
		clothing_color.darkened(0.38), visibility_layer)
	for x in [-0.11, 0.11]:
		_add_part(
			self, Vector3(0.055, 0.055, 0.025), Vector3(x, 1.76, 0.238),
			Color(0.04, 0.05, 0.06), visibility_layer)

	left_arm.position = Vector3(-0.40, 1.43, 0.0)
	right_arm.position = Vector3(0.40, 1.43, 0.0)
	add_child(left_arm)
	add_child(right_arm)
	_add_part(
		left_arm, Vector3(0.20, 0.68, 0.22), Vector3(0.0, -0.31, 0.0),
		clothing_color.lightened(0.05), visibility_layer)
	_add_part(
		right_arm, Vector3(0.20, 0.68, 0.22), Vector3(0.0, -0.31, 0.0),
		clothing_color.lightened(0.05), visibility_layer)
	_add_part(
		left_arm, Vector3(0.19, 0.19, 0.20), Vector3(0.0, -0.67, 0.0),
		skin_color, visibility_layer)
	_add_part(
		right_arm, Vector3(0.19, 0.19, 0.20), Vector3(0.0, -0.67, 0.0),
		skin_color, visibility_layer)

	left_leg.position = Vector3(-0.18, 0.75, 0.0)
	right_leg.position = Vector3(0.18, 0.75, 0.0)
	add_child(left_leg)
	add_child(right_leg)
	_add_part(
		left_leg, Vector3(0.24, 0.75, 0.27), Vector3(0.0, -0.37, 0.0),
		trouser_color, visibility_layer)
	_add_part(
		right_leg, Vector3(0.24, 0.75, 0.27), Vector3(0.0, -0.37, 0.0),
		trouser_color, visibility_layer)

	held_anchor = Node3D.new()
	held_anchor.position = Vector3(0.0, -0.74, 0.12)
	held_anchor.rotation = Vector3(0.10, 0.0, -0.12)
	right_arm.add_child(held_anchor)


func _add_part(
		parent: Node3D, size: Vector3, position: Vector3,
		color: Color, visibility_layer: int) -> MeshInstance3D:
	var instance := MeshInstance3D.new()
	var mesh := BoxMesh.new()
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.roughness = 0.9
	mesh.size = size
	mesh.material = material
	instance.mesh = mesh
	instance.position = position
	instance.layers = visibility_layer
	parent.add_child(instance)
	return instance


func set_held_stack(stack: Dictionary, visibility_layer: int = 1) -> void:
	if _held_model != null and is_instance_valid(_held_model):
		_held_model.queue_free()
		_held_model = null
	if held_anchor == null or stack.is_empty():
		return
	_held_model = ItemModelFactoryScript.build(stack, 0.72)
	_held_model.rotation = Vector3(0.0, 0.0, -0.20)
	_set_model_visibility_layer(_held_model, visibility_layer)
	held_anchor.add_child(_held_model)


func _set_model_visibility_layer(node: Node, layer: int) -> void:
	if node is VisualInstance3D:
		node.layers = layer
	for child in node.get_children():
		_set_model_visibility_layer(child, layer)


func play_action(action: String, duration: float = 0.55) -> void:
	_action = action
	_action_seconds = maxf(duration, 0.05)


func update_pose(delta: float, movement_speed: float, persistent_action := "") -> void:
	if left_arm == null:
		return
	if _action_seconds > 0.0:
		_action_seconds = maxf(0.0, _action_seconds - delta)
	elif not persistent_action.is_empty():
		_action = persistent_action
	else:
		_action = "idle"
	var moving := movement_speed > 0.08
	if moving or _action in ["work", "mine", "chop", "build"]:
		_walk_phase += delta * (6.0 + movement_speed * 1.7)
	var blend := minf(1.0, delta * 10.0)
	var left_arm_x := 0.0
	var right_arm_x := 0.0
	var left_leg_x := 0.0
	var right_leg_x := 0.0
	if moving:
		var swing := sin(_walk_phase) * minf(0.75, 0.28 + movement_speed * 0.16)
		left_arm_x = swing
		right_arm_x = -swing
		left_leg_x = -swing * 0.85
		right_leg_x = swing * 0.85
	if _action in ["work", "mine", "chop", "build"]:
		right_arm_x = -0.75 - absf(sin(_walk_phase * 1.6)) * 1.15
		left_arm_x = -0.30
	elif _action in ["attack", "cast"]:
		var progress := 1.0 - clampf(_action_seconds / 0.55, 0.0, 1.0)
		right_arm_x = -0.55 - sin(progress * PI) * 1.55
		left_arm_x = -0.18
	left_arm.rotation.x = lerpf(left_arm.rotation.x, left_arm_x, blend)
	right_arm.rotation.x = lerpf(right_arm.rotation.x, right_arm_x, blend)
	left_leg.rotation.x = lerpf(left_leg.rotation.x, left_leg_x, blend)
	right_leg.rotation.x = lerpf(right_leg.rotation.x, right_leg_x, blend)


func has_held_model() -> bool:
	return _held_model != null and is_instance_valid(_held_model)
