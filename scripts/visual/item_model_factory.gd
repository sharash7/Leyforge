class_name ItemModelFactory
extends RefCounted
## Shared low-poly presentation for held and dropped registry content.
## Stable registry identity selects a readable silhouette; the returned model
## never owns inventory quantity or gameplay state.

const CANONICAL_TOOL_BOTTOM_Y := -0.40
const HELD_ITEM_ROTATION := Vector3(PI * 0.5, PI, 0.0)


static func build(stack: Dictionary, model_scale: float = 1.0) -> Node3D:
	var root := Node3D.new()
	root.name = "ItemModel"
	root.scale = Vector3.ONE * model_scale
	if stack.is_empty():
		return root
	var stable_id := Inventory.stack_stable_id(stack)
	var color := Inventory.stack_color(stack).lightened(0.08)
	if Inventory.stack_kind(stack) == "block":
		_build_block(root, stable_id, color)
	else:
		_build_item(root, stable_id, color)
		# Every item is authored upright along local +Y, facing local -Z.
		# Keeping one canonical basis lets every player/NPC hand apply the same
		# requested rotation and align the actual bottom of the item to its grip.
		root.set_meta(
			"canonical_hold_bottom",
			Vector3(0.0, _canonical_item_bottom_y(stable_id), 0.0))
		root.set_meta("canonical_up_axis", Vector3.UP)
		root.set_meta("canonical_forward_axis", Vector3.FORWARD)
	return root


static func visual_kind_for(stack: Dictionary) -> String:
	if stack.is_empty():
		return "empty"
	var stable_id := Inventory.stack_stable_id(stack)
	if Inventory.stack_kind(stack) == "block":
		return BlockRegistry.get_shape(int(stack.get("id", -1)))
	for kind in [
		"pickaxe", "hammer", "sword", "spear", "staff", "wand", "bow",
		"crystal", "mana", "rune", "ingot", "plate",
	]:
		if kind in stable_id:
			return "staff" if kind == "wand" else (
				"crystal" if kind == "mana" else kind)
	if stable_id.ends_with("_axe") or ".axe" in stable_id:
		return "axe"
	if stable_id.begins_with("item.tool.") \
			or stable_id.begins_with("item.weapon."):
		return "tool"
	if ".food." in stable_id or "berries" in stable_id:
		return "food"
	return "resource"


static func apply_hold_transform(
		model: Node3D, stack: Dictionary, context := "humanoid") -> void:
	## All non-block items share one authored direction and one hand transform:
	## rotate +90 degrees around X, reverse Y with a 180-degree yaw, then place
	## the canonical bottom point exactly at the centre of the hand anchor.
	if model == null:
		return
	var kind := visual_kind_for(stack)
	var is_block := Inventory.stack_kind(stack) == "block"
	if not is_block:
		if context == "first_person":
			model.scale = Vector3.ONE * (
				0.62 if kind in ["sword", "spear", "staff", "bow"] else (
					0.82 if kind in [
						"pickaxe", "axe", "hammer", "tool"] else 0.48))
		elif context == "owner_humanoid":
			model.scale = Vector3.ONE * (
				0.82 if kind in ["sword", "spear", "staff", "bow"] else (
					0.88 if kind in [
						"pickaxe", "axe", "hammer", "tool"] else 0.48))
		else:
			model.scale = Vector3.ONE * (
				1.0 if kind in ["sword", "spear", "staff", "bow"] else (
					0.95 if kind in [
						"pickaxe", "axe", "hammer", "tool"] else 0.55))
		model.rotation = HELD_ITEM_ROTATION
		_align_canonical_bottom_to_hand(model)
		return
	if context == "first_person":
		model.position = Vector3(-0.04, -0.08, 0.02)
		model.scale = Vector3.ONE * 0.38
		model.rotation = Vector3(0.08, -0.18, 0.02)
		return
	if context == "owner_humanoid":
		model.position = Vector3(-0.10, -0.01, -0.16)
		model.scale = Vector3.ONE * 0.42
		model.rotation = Vector3(0.0, 0.0, -0.28)
		return
	model.position = Vector3(0.06, -0.02, -0.14)
	model.scale = Vector3.ONE * 0.46
	model.rotation = Vector3(0.0, 0.0, -0.04)


static func _align_canonical_bottom_to_hand(model: Node3D) -> void:
	var bottom: Vector3 = model.get_meta(
		"canonical_hold_bottom", Vector3.ZERO)
	# The model basis already includes its selected presentation scale.
	model.position = -(model.basis * bottom)


static func _canonical_item_bottom_y(stable_id: String) -> float:
	if stable_id.begins_with("item.tool.") \
			or stable_id.begins_with("item.weapon."):
		return CANONICAL_TOOL_BOTTOM_Y
	if ".ingot" in stable_id or ".plate" in stable_id:
		return -0.05
	if "rune" in stable_id:
		return -0.035
	if "mana" in stable_id or "crystal" in stable_id:
		return -0.16
	if ".food." in stable_id or "berries" in stable_id:
		return -0.20
	return -0.21


static func _build_item(root: Node3D, stable_id: String, color: Color) -> void:
	if stable_id.begins_with("item.tool.") \
			or stable_id.begins_with("item.weapon."):
		_build_tool(root, stable_id, color)
		return
	if ".ingot" in stable_id or ".plate" in stable_id:
		_add_box(root, Vector3(0.34, 0.10, 0.20), Vector3.ZERO, color, 0.45)
		_add_box(
			root, Vector3(0.24, 0.04, 0.12), Vector3(0.0, 0.065, 0.0),
			color.lightened(0.16), 0.35)
		return
	if "rune" in stable_id:
		_add_cylinder(root, 0.20, 0.07, Vector3.ZERO, color, 10)
		_add_box(
			root, Vector3(0.05, 0.09, 0.30), Vector3(0.0, 0.045, 0.0),
			Color(0.35, 0.9, 1.0), 0.2)
		return
	if "mana" in stable_id or "crystal" in stable_id:
		var crystal := _add_cylinder(
			root, 0.16, 0.42, Vector3.ZERO, color.lightened(0.18), 6)
		crystal.rotation.z = PI * 0.5
		return
	if ".food." in stable_id or "berries" in stable_id:
		_add_sphere(root, 0.20, Vector3.ZERO, color)
		_add_box(
			root, Vector3(0.05, 0.15, 0.05), Vector3(0.0, 0.18, 0.0),
			Color(0.16, 0.32, 0.08))
		return
	# Components and raw resources retain a faceted, hand-sized silhouette.
	var item := _add_sphere(root, 0.21, Vector3.ZERO, color)
	item.scale = Vector3(0.88, 1.0, 0.68)


static func _build_tool(root: Node3D, stable_id: String, color: Color) -> void:
	# Canonical tool authoring contract:
	# - handle runs from the shared Y=-0.40 bottom toward local +Y;
	# - working end/blade is always at +Y;
	# - readable front faces local -Z.
	# Hand transforms may rotate this basis, but individual tools never do.
	var handle_color := Color(0.30, 0.16, 0.07)
	var metal_color := color.lightened(0.14)
	if ".iron_" in stable_id or "sword" in stable_id \
			or "hammer" in stable_id or "wrench" in stable_id:
		metal_color = Color(0.58, 0.62, 0.66)
	elif ".stone_" in stable_id or "stone_spear" in stable_id:
		metal_color = Color(0.38, 0.41, 0.43)
	elif ".crude_" in stable_id:
		metal_color = Color(0.32, 0.22, 0.12)
	elif "staff" in stable_id or "wand" in stable_id:
		metal_color = Color(0.30, 0.62, 0.82)
	var long_handle := "spear" in stable_id or "staff" in stable_id \
		or "wand" in stable_id
	_add_box(
		root,
		Vector3(0.065, 1.02, 0.065) if long_handle \
			else Vector3(0.075, 0.62, 0.075),
		Vector3(0.0, 0.11, 0.0) if long_handle \
			else Vector3(0.0, -0.09, 0.0),
		handle_color)
	if "spear" in stable_id:
		_add_cone(
			root, 0.12, 0.34, Vector3(0.0, 0.78, 0.0),
			metal_color, 6)
	elif "pickaxe" in stable_id:
		_add_box(
			root, Vector3(0.52, 0.11, 0.11), Vector3(0.0, 0.24, 0.0),
			metal_color, 0.32)
		_add_box(
			root, Vector3(0.12, 0.18, 0.10), Vector3(-0.23, 0.17, 0.0),
			metal_color, 0.32)
	elif stable_id.ends_with("_axe") or ".axe" in stable_id:
		_add_box(
			root, Vector3(0.28, 0.28, 0.10), Vector3(0.11, 0.18, 0.0),
			metal_color, 0.32)
	elif "hammer" in stable_id:
		_add_box(
			root, Vector3(0.42, 0.20, 0.18), Vector3(0.0, 0.22, 0.0),
			metal_color, 0.42)
	elif "sword" in stable_id:
		_add_box(
			root, Vector3(0.09, 0.64, 0.045), Vector3(0.0, 0.30, 0.0),
			metal_color, 0.2)
		_add_box(
			root, Vector3(0.34, 0.07, 0.08), Vector3(0.0, -0.01, 0.0),
			Color(0.48, 0.30, 0.10))
	elif "staff" in stable_id or "wand" in stable_id:
		_add_sphere(root, 0.13, Vector3(0.0, 0.28, 0.0), Color(0.3, 0.8, 1.0))
	elif "bow" in stable_id:
		_add_box(
			root, Vector3(0.08, 0.50, 0.08), Vector3(0.0, 0.12, 0.0),
			Color(0.42, 0.23, 0.08))
	else:
		_add_box(
			root, Vector3(0.34, 0.12, 0.14), Vector3(0.0, 0.20, 0.0),
			metal_color, 0.4)


static func _build_block(root: Node3D, stable_id: String, color: Color) -> void:
	if "furnace" in stable_id:
		_add_box(root, Vector3(0.58, 0.50, 0.58), Vector3.ZERO, color)
		_add_box(
			root, Vector3(0.30, 0.22, 0.035), Vector3(0.0, -0.06, 0.305),
			Color(0.035, 0.025, 0.02), 1.0, true)
		return
	if "chest" in stable_id or "crate" in stable_id:
		_add_box(root, Vector3(0.62, 0.36, 0.46), Vector3(0.0, -0.08, 0.0), color)
		_add_box(
			root, Vector3(0.66, 0.15, 0.50), Vector3(0.0, 0.175, 0.0),
			color.lightened(0.10))
		_add_box(
			root, Vector3(0.09, 0.20, 0.035), Vector3(0.0, 0.02, 0.25),
			Color(0.68, 0.48, 0.12), 0.3)
		return
	if "chute" in stable_id:
		_add_box(root, Vector3(0.66, 0.10, 0.66), Vector3.ZERO, color)
		for side in [-1.0, 1.0]:
			_add_box(
				root, Vector3(0.10, 0.26, 0.66), Vector3(side * 0.28, 0.10, 0.0),
				color.darkened(0.08))
		return
	if "door" in stable_id:
		_add_box(root, Vector3(0.46, 0.92, 0.08), Vector3.ZERO, color)
		_add_sphere(
			root, 0.045, Vector3(0.18, 0.13, 0.065),
			Color(0.75, 0.55, 0.15))
		_add_sphere(
			root, 0.045, Vector3(0.18, 0.13, -0.065),
			Color(0.75, 0.55, 0.15))
		return
	if "glass" in stable_id:
		_add_box(
			root, Vector3(0.58, 0.58, 0.07), Vector3.ZERO,
			Color(color.r, color.g, color.b, 0.32), 0.05, true)
		return
	_add_box(root, Vector3(0.52, 0.52, 0.52), Vector3.ZERO, color)


static func _material(
		color: Color, roughness: float = 0.82,
		transparent: bool = false) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.roughness = roughness
	if transparent or color.a < 0.99:
		material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS
		material.cull_mode = BaseMaterial3D.CULL_BACK
	return material


static func _add_box(
		parent: Node3D, size: Vector3, position: Vector3, color: Color,
		roughness: float = 0.82, transparent: bool = false) -> MeshInstance3D:
	var instance := MeshInstance3D.new()
	var mesh := BoxMesh.new()
	mesh.size = size
	mesh.material = _material(color, roughness, transparent)
	instance.mesh = mesh
	instance.position = position
	parent.add_child(instance)
	return instance


static func _add_sphere(
		parent: Node3D, radius: float, position: Vector3,
		color: Color) -> MeshInstance3D:
	var instance := MeshInstance3D.new()
	var mesh := SphereMesh.new()
	mesh.radius = radius
	mesh.height = radius * 2.0
	mesh.radial_segments = 8
	mesh.rings = 4
	mesh.material = _material(color)
	instance.mesh = mesh
	instance.position = position
	parent.add_child(instance)
	return instance


static func _add_cylinder(
		parent: Node3D, radius: float, height: float, position: Vector3,
		color: Color, sides: int = 8) -> MeshInstance3D:
	var instance := MeshInstance3D.new()
	var mesh := CylinderMesh.new()
	mesh.top_radius = radius
	mesh.bottom_radius = radius
	mesh.height = height
	mesh.radial_segments = sides
	mesh.rings = 1
	mesh.material = _material(color, 0.48, color.a < 0.99)
	instance.mesh = mesh
	instance.position = position
	parent.add_child(instance)
	return instance


static func _add_cone(
		parent: Node3D, radius: float, height: float, position: Vector3,
		color: Color, sides: int = 8) -> MeshInstance3D:
	var instance := MeshInstance3D.new()
	var mesh := CylinderMesh.new()
	mesh.top_radius = 0.0
	mesh.bottom_radius = radius
	mesh.height = height
	mesh.radial_segments = sides
	mesh.rings = 1
	mesh.material = _material(color, 0.38)
	instance.mesh = mesh
	instance.position = position
	parent.add_child(instance)
	return instance
