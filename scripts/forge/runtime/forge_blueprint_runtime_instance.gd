class_name ForgeBlueprintRuntimeInstance
extends Node3D
## Runtime-only visual/semantic assembly from a compiled blueprint product.

const STAGE_ORDER := {
	"site": 0, "foundation": 1, "frame": 2, "shell": 3,
	"roof": 4, "interior": 5, "equipment": 6, "complete": 7,
}

var product: ForgeBlueprintRuntimeProduct
var instance_id := ""
var construction_stage_id := "complete"
var state_id := ""
var ownership_id := ""
var seed := 0
var active_element_ids: PackedStringArray = []
var active_marker_roles: Dictionary = {}
var active_network_roles: Dictionary = {}


func configure(source: ForgeBlueprintRuntimeProduct, new_instance_id: String,
		stage := "complete", state := "", instance_seed := 0) -> Dictionary:
	product = source
	instance_id = new_instance_id
	construction_stage_id = stage
	state_id = state
	seed = instance_seed
	return rebuild()


func apply_construction_stage(stage: String) -> Dictionary:
	construction_stage_id = stage
	return rebuild()


func apply_state(state: String) -> Dictionary:
	state_id = state
	return rebuild()


func rebuild() -> Dictionary:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	active_element_ids.clear()
	active_marker_roles.clear()
	active_network_roles.clear()
	if product == null:
		return {"ok": false, "error": "missing_product"}
	var active := _active_element_records()
	for record in active:
		_spawn_record(record)
	return {"ok": true, "instance_id": instance_id,
		"element_count": active_element_ids.size(),
		"marker_roles": _sorted_keys(active_marker_roles),
		"network_roles": _sorted_keys(active_network_roles),
		"hash": runtime_hash()}


func marker_transforms(role_id: String) -> Array[Transform3D]:
	var result: Array[Transform3D] = []
	for node_value in active_marker_roles.get(role_id, []):
		var marker: Node3D = node_value
		if is_instance_valid(marker):
			result.append(marker.global_transform)
	return result


func snapshot() -> ForgeBlueprintInstanceSnapshot:
	var record := ForgeBlueprintInstanceSnapshot.new()
	record.instance_id = instance_id
	record.blueprint_id = product.blueprint_id if product != null else ""
	record.product_id = product.product_id if product != null else ""
	record.construction_stage_id = construction_stage_id
	record.state_id = state_id
	record.ownership_id = ownership_id
	record.seed = seed
	record.transform_record = {
		"origin": [position.x, position.y, position.z],
		"rotation": [rotation.x, rotation.y, rotation.z],
		"scale": [scale.x, scale.y, scale.z],
	}
	return record


func runtime_hash() -> String:
	return ForgeStableRecord.hash_record({
		"product_id": product.product_id if product != null else "",
		"instance_id": instance_id,
		"construction_stage_id": construction_stage_id,
		"state_id": state_id,
		"active_element_ids": Array(active_element_ids),
		"markers": _sorted_keys(active_marker_roles),
		"networks": _sorted_keys(active_network_roles),
		"seed": seed,
	})


func _active_element_records() -> Array[Dictionary]:
	var selected := {}
	var stage_rank := int(STAGE_ORDER.get(construction_stage_id, 7))
	for record in product.compiled_elements:
		var element_id := str(record.get("element_id", ""))
		var element_stage := str(record.get("stage_id", "site"))
		var element_rank := int(STAGE_ORDER.get(element_stage, 0))
		if element_rank <= stage_rank and not bool(record.get("optional", false)):
			selected[element_id] = record.duplicate(true)
	for delta in product.construction_stage_records:
		var delta_rank := int(STAGE_ORDER.get(str(delta.get("stage_id", "site")), 0))
		if delta_rank > stage_rank:
			continue
		for element_id in delta.get("remove_element_ids", []):
			selected.erase(str(element_id))
		for element_id in delta.get("add_element_ids", []):
			var source := _element_record(str(element_id))
			if not source.is_empty():
				selected[str(element_id)] = source
	var state := _state_record(state_id)
	if not state.is_empty():
		for element_id in state.get("remove_element_ids", []):
			selected.erase(str(element_id))
		for element_id in state.get("add_element_ids", []):
			var source := _element_record(str(element_id))
			if not source.is_empty():
				selected[str(element_id)] = source
	var result: Array[Dictionary] = []
	for element_id in selected:
		var record: Dictionary = selected[element_id]
		if not state.is_empty():
			var overrides: Dictionary = state.get("material_role_overrides", {})
			var role_id := str(record.get("material_role_id", ""))
			if overrides.has(role_id):
				record["resolved_material_id"] = str(overrides[role_id])
		result.append(record)
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("element_id", "")) < str(b.get("element_id", "")))
	return result


func _spawn_record(record: Dictionary) -> void:
	var element_id := str(record.get("element_id", ""))
	active_element_ids.append(element_id)
	var kind := str(record.get("element_kind", "module"))
	var location := _vector3(record.get("position", [0, 0, 0]))
	if kind == "marker":
		var marker := Node3D.new()
		marker.name = ForgeId.safe_filename(element_id)
		marker.position = location
		marker.set_meta("forge_element_id", element_id)
		add_child(marker)
		for role_value in record.get("marker_role_ids", []):
			var role_id := str(role_value)
			var nodes: Array = active_marker_roles.get(role_id, [])
			nodes.append(marker)
			active_marker_roles[role_id] = nodes
	else:
		var mesh_instance := MeshInstance3D.new()
		mesh_instance.name = ForgeId.safe_filename(element_id)
		var box := BoxMesh.new()
		var dimensions := _vector3(record.get("size", [1, 1, 1]))
		box.size = Vector3(maxf(dimensions.x, 0.05), maxf(dimensions.y, 0.05),
			maxf(dimensions.z, 0.05))
		var material := StandardMaterial3D.new()
		var role_id := str(record.get("material_role_id", "material_role.functional"))
		var material_id := str(record.get("resolved_material_id",
			product.material_bindings.get(role_id, role_id)))
		material.albedo_color = _material_color(material_id)
		material.roughness = 0.82
		box.material = material
		mesh_instance.mesh = box
		mesh_instance.position = location + dimensions * 0.5
		mesh_instance.rotation.y = float(record.get("rotation_quarters", 0)) * PI * 0.5
		mesh_instance.set_meta("forge_element_id", element_id)
		mesh_instance.set_meta("material_role_id", role_id)
		mesh_instance.set_meta("resolved_material_id", material_id)
		add_child(mesh_instance)
	for role_value in record.get("network_role_ids", []):
		active_network_roles[str(role_value)] = true


func _element_record(element_id: String) -> Dictionary:
	for record in product.compiled_elements:
		if str(record.get("element_id", "")) == element_id:
			return record.duplicate(true)
	return {}


func _state_record(requested_state_id: String) -> Dictionary:
	if requested_state_id.is_empty():
		return {}
	for record in product.state_records:
		if str(record.get("state_id", "")) == requested_state_id:
			return record.duplicate(true)
	return {}


func _material_color(material_id: String) -> Color:
	var digest := material_id.sha256_text()
	var hue := float(("0x%s" % digest.substr(0, 4)).hex_to_int() % 360) / 360.0
	var value := 0.48 + float(("0x%s" % digest.substr(4, 2)).hex_to_int() % 30) / 100.0
	return Color.from_hsv(hue, 0.38, value, 1.0)


func _vector3(value: Variant) -> Vector3:
	if value is Array and value.size() >= 3:
		return Vector3(float(value[0]), float(value[1]), float(value[2]))
	return Vector3.ZERO


func _sorted_keys(value: Dictionary) -> Array[String]:
	var keys: Array[String] = []
	for key in value:
		keys.append(str(key))
	keys.sort()
	return keys
