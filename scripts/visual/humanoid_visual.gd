class_name HumanoidVisual
extends Node3D
## Articulated low-poly humanoid shared by villagers, goblins, and the player.

const ItemModelFactoryScript = preload("res://scripts/visual/item_model_factory.gd")

var left_arm: Node3D
var right_arm: Node3D
var left_leg: Node3D
var right_leg: Node3D
var head_anchor: Node3D
var held_anchor: Node3D
var _held_model: Node3D
var _walk_phase := 0.0
var _action := "idle"
var _action_seconds := 0.0
var _action_duration := 0.55
var _head_parts: Array[VisualInstance3D] = []
var _body_parts: Array[VisualInstance3D] = []
var _arm_parts: Array[VisualInstance3D] = []
var _first_person_torso_parts: Array[VisualInstance3D] = []
var _first_person_leg_parts: Array[VisualInstance3D] = []
var _first_person_left_leg: Node3D
var _first_person_right_leg: Node3D
var _torso_color := Color.WHITE
var _trouser_color := Color(0.20, 0.24, 0.28)
var _owner_view := false


func configure(
		clothing_color: Color, skin_color: Color = Color(0.72, 0.52, 0.38),
		trouser_color: Color = Color(0.20, 0.24, 0.28),
		visibility_layer: int = 1) -> void:
	for child in get_children():
		child.queue_free()
	_head_parts.clear()
	_body_parts.clear()
	_arm_parts.clear()
	_first_person_torso_parts.clear()
	_first_person_leg_parts.clear()
	_first_person_left_leg = null
	_first_person_right_leg = null
	_owner_view = false
	_torso_color = clothing_color
	_trouser_color = trouser_color
	left_arm = Node3D.new()
	right_arm = Node3D.new()
	left_leg = Node3D.new()
	right_leg = Node3D.new()
	head_anchor = Node3D.new()
	head_anchor.name = "HeadAnchor"
	# The anchor is the eye/look pivot, slightly forward of the head centre.
	# Head geometry is offset back by the same amount so the external model
	# keeps its proportions while first-person mouse look rotates in place.
	head_anchor.position = Vector3(0.0, 1.73, -0.18)
	add_child(head_anchor)

	_body_parts.append(_add_part(
		self, Vector3(0.60, 0.78, 0.36), Vector3(0.0, 1.12, 0.0),
		clothing_color, visibility_layer))
	_head_parts.append(_add_part(
		head_anchor, Vector3(0.46, 0.46, 0.46), Vector3(0.0, 0.0, 0.18),
		skin_color, visibility_layer))
	# Hair cap and two eyes make the facing direction readable.
	_head_parts.append(_add_part(
		head_anchor, Vector3(0.47, 0.12, 0.47), Vector3(0.0, 0.21, 0.18),
		clothing_color.darkened(0.38), visibility_layer))
	for x in [-0.11, 0.11]:
		_head_parts.append(_add_part(
			head_anchor, Vector3(0.055, 0.055, 0.025),
			Vector3(x, 0.03, -0.058),
			Color(0.04, 0.05, 0.06), visibility_layer))

	# Shoulder pivots sit on the torso edges. With the arm length rotated into
	# the T-pose this closes the former visible gap without burying the sleeves.
	left_arm.position = Vector3(-0.33, 1.43, 0.0)
	right_arm.position = Vector3(0.33, 1.43, 0.0)
	add_child(left_arm)
	add_child(right_arm)
	_arm_parts.append(_add_part(
		left_arm, Vector3(0.20, 0.76, 0.22), Vector3(0.0, -0.35, 0.0),
		clothing_color.lightened(0.05), visibility_layer))
	_arm_parts.append(_add_part(
		right_arm, Vector3(0.20, 0.76, 0.22), Vector3(0.0, -0.35, 0.0),
		clothing_color.lightened(0.05), visibility_layer))
	_arm_parts.append(_add_part(
		left_arm, Vector3(0.19, 0.19, 0.20), Vector3(0.0, -0.79, 0.0),
		skin_color, visibility_layer))
	_arm_parts.append(_add_part(
		right_arm, Vector3(0.19, 0.19, 0.20), Vector3(0.0, -0.79, 0.0),
		skin_color, visibility_layer))

	left_leg.position = Vector3(-0.18, 0.75, 0.0)
	right_leg.position = Vector3(0.18, 0.75, 0.0)
	add_child(left_leg)
	add_child(right_leg)
	_body_parts.append(_add_part(
		left_leg, Vector3(0.24, 0.75, 0.27), Vector3(0.0, -0.37, 0.0),
		trouser_color, visibility_layer))
	_body_parts.append(_add_part(
		right_leg, Vector3(0.24, 0.75, 0.27), Vector3(0.0, -0.37, 0.0),
		trouser_color, visibility_layer))

	held_anchor = Node3D.new()
	held_anchor.position = Vector3(0.0, -0.79, 0.03)
	held_anchor.rotation = Vector3.ZERO
	right_arm.add_child(held_anchor)


func configure_first_person_owner_view(
		visible_layer: int, hidden_layer: int) -> void:
	# The player owns this same complete articulated model. Callers choose the
	# layer that an external/future third-person camera sees; the first-person
	# eye camera can cull it while retaining the real head/camera hierarchy.
	_owner_view = true
	for part in _body_parts:
		if is_instance_valid(part):
			part.layers = visible_layer
	for part in _head_parts:
		if is_instance_valid(part):
			part.layers = hidden_layer
	for part in _arm_parts:
		if is_instance_valid(part):
			part.layers = visible_layer


func set_first_person_body_visible(value: bool) -> void:
	for part in _body_parts:
		if is_instance_valid(part):
			part.visible = value
	if _owner_view and left_arm != null:
		left_arm.visible = value
	if _owner_view and right_arm != null:
		right_arm.visible = value


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


func set_held_stack(
		stack: Dictionary, visibility_layer: int = 1,
		context: String = "humanoid") -> void:
	if _held_model != null and is_instance_valid(_held_model):
		_held_model.queue_free()
		_held_model = null
	if held_anchor == null or stack.is_empty():
		return
	_held_model = ItemModelFactoryScript.build(stack)
	ItemModelFactoryScript.apply_hold_transform(_held_model, stack, context)
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
	_action_duration = _action_seconds


func set_reference_t_pose() -> void:
	## Stable inspection pose used by the visual test room. The held anchor is
	## a child of the right arm, so every equipped model follows the hand.
	_action = "idle"
	_action_seconds = 0.0
	left_arm.rotation = Vector3(0.0, 0.0, -PI * 0.5)
	right_arm.rotation = Vector3(0.0, 0.0, PI * 0.5)
	# Compensate the right shoulder's T-pose roll so a held tool remains
	# upright and forward-facing instead of lying along/clipping through the arm.
	held_anchor.rotation = Vector3(0.0, 0.0, -PI * 0.5)
	left_leg.rotation = Vector3.ZERO
	right_leg.rotation = Vector3.ZERO


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
	var left_arm_x := 0.04 if _owner_view else 0.0
	var right_arm_x := 1.05 if _owner_view else 0.0
	var left_leg_x := 0.0
	var right_leg_x := 0.0
	if moving:
		var swing := sin(_walk_phase) * minf(0.75, 0.28 + movement_speed * 0.16)
		left_arm_x = swing
		right_arm_x = -swing
		left_leg_x = -swing * 0.85
		right_leg_x = swing * 0.85
	if _action in ["work", "mine", "chop", "build"]:
		right_arm_x = 0.75 + absf(sin(_walk_phase * 1.6)) * 1.15
		left_arm_x = 0.30
	elif _action in ["attack", "cast"]:
		var progress := 1.0 - clampf(
			_action_seconds / maxf(_action_duration, 0.05), 0.0, 1.0)
		right_arm_x = 0.48 + sin(progress * PI) * 1.78
		left_arm_x = 0.24
	left_arm.rotation.x = lerpf(left_arm.rotation.x, left_arm_x, blend)
	right_arm.rotation.x = lerpf(right_arm.rotation.x, right_arm_x, blend)
	left_leg.rotation.x = lerpf(left_leg.rotation.x, left_leg_x, blend)
	right_leg.rotation.x = lerpf(right_leg.rotation.x, right_leg_x, blend)
	if held_anchor != null:
		# The first-person player's wrist counter-rotates most of the raised
		# forearm angle. This keeps a tool upright/readable while preserving
		# enough shoulder motion for swings and mining actions.
		var wrist_x := -right_arm.rotation.x * 0.65 if _owner_view else 0.0
		held_anchor.rotation.x = lerpf(held_anchor.rotation.x, wrist_x, blend)
	if _first_person_left_leg != null:
		_first_person_left_leg.rotation.x = lerpf(
			_first_person_left_leg.rotation.x, left_leg_x, blend)
	if _first_person_right_leg != null:
		_first_person_right_leg.rotation.x = lerpf(
			_first_person_right_leg.rotation.x, right_leg_x, blend)


func has_held_model() -> bool:
	return _held_model != null and is_instance_valid(_held_model)
