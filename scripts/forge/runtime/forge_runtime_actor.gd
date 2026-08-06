class_name ForgeRuntimeActor
extends Node3D
## Deterministic rigid-part actor assembled from Forge semantic sources.

const SNAPSHOT_VERSION := 1

var assembly_profile: ForgeEntityAssemblyProfile
var entity_definition: ForgeEntityDefinition
var rig_profile: ForgeRigProfile
var instance_id := ""
var variant_id := "base"
var lod_level := 0
var semantic_action := "idle"
var motion_time_seconds := 0.0
var role_nodes: Dictionary = {}
var part_nodes: Dictionary = {}
var _rest_transforms: Dictionary = {}


func configure(
		p_assembly: ForgeEntityAssemblyProfile,
		p_entity: ForgeEntityDefinition, p_rig: ForgeRigProfile,
		p_instance_id: String, p_role_nodes: Dictionary,
		p_part_nodes: Dictionary) -> void:
	assembly_profile = p_assembly
	entity_definition = p_entity
	rig_profile = p_rig
	instance_id = p_instance_id
	variant_id = p_assembly.default_variant_id
	lod_level = p_assembly.default_lod_level
	role_nodes = p_role_nodes.duplicate()
	part_nodes = p_part_nodes.duplicate()
	_rest_transforms.clear()
	for role_id in role_nodes:
		var node := role_nodes[role_id] as Node3D
		if node != null:
			_rest_transforms[role_id] = node.transform
	set_meta("forge_instance_id", instance_id)
	set_meta("forge_entity_definition_id", p_entity.entity_definition_id)
	set_meta("forge_rig_profile_id", p_rig.rig_profile_id)


func play_semantic_action(action_id: String, restart := false) -> bool:
	if rig_profile == null or not rig_profile.motion_profiles.has(action_id):
		return false
	if semantic_action != action_id or restart:
		motion_time_seconds = 0.0
	semantic_action = action_id
	_apply_motion_pose()
	return true


func advance_motion(delta_seconds: float) -> void:
	if delta_seconds < 0.0 or rig_profile == null:
		return
	motion_time_seconds += delta_seconds
	_apply_motion_pose()


func role_node(role_id: String) -> Node3D:
	return role_nodes.get(role_id) as Node3D


func rest_transform(role_id: String) -> Transform3D:
	return _rest_transforms.get(role_id, Transform3D.IDENTITY)


func reset_semantic_pose() -> void:
	for role_id in _rest_transforms:
		var node := role_node(role_id)
		if node != null:
			node.transform = _rest_transforms[role_id]


func apply_role_offset(
		role_id: String, position_offset: Vector3,
		rotation_offset_degrees: Vector3,
		scale_multiplier: Vector3 = Vector3.ONE) -> bool:
	var node := role_node(role_id)
	if node == null:
		return false
	var rest: Transform3D = _rest_transforms.get(role_id, node.transform)
	node.transform = rest
	node.position += position_offset
	node.rotation_degrees += rotation_offset_degrees
	node.scale *= scale_multiplier
	return true


func snapshot() -> Dictionary:
	return {
		"schema": "leyforge.forge.actor-snapshot",
		"snapshot_version": SNAPSHOT_VERSION,
		"assembly_profile_id": (
			assembly_profile.assembly_profile_id if assembly_profile != null else ""),
		"entity_definition_id": (
			entity_definition.entity_definition_id if entity_definition != null else ""),
		"instance_id": instance_id,
		"variant_id": variant_id,
		"lod_level": lod_level,
		"semantic_action": semantic_action,
		"motion_time_seconds": motion_time_seconds,
		"position": [position.x, position.y, position.z],
		"rotation_degrees": [
			rotation_degrees.x, rotation_degrees.y, rotation_degrees.z],
		"scale": [scale.x, scale.y, scale.z],
	}


func restore_snapshot(record: Dictionary) -> bool:
	if int(record.get("snapshot_version", 0)) != SNAPSHOT_VERSION \
			or str(record.get("entity_definition_id", "")) != (
				entity_definition.entity_definition_id
				if entity_definition != null else ""):
		return false
	instance_id = str(record.get("instance_id", instance_id))
	variant_id = str(record.get("variant_id", variant_id))
	lod_level = maxi(0, int(record.get("lod_level", lod_level)))
	semantic_action = str(record.get("semantic_action", "idle"))
	motion_time_seconds = maxf(0.0, float(record.get(
		"motion_time_seconds", 0.0)))
	position = _vector3_from(record.get("position", []), Vector3.ZERO)
	rotation_degrees = _vector3_from(
		record.get("rotation_degrees", []), Vector3.ZERO)
	scale = _vector3_from(record.get("scale", []), Vector3.ONE)
	_apply_motion_pose()
	return true


func snapshot_hash() -> String:
	return ForgeStableRecord.hash_record(snapshot())


func pose_hash() -> String:
	var roles := {}
	var sorted_roles: Array = role_nodes.keys()
	sorted_roles.sort()
	for role_id in sorted_roles:
		var node := role_nodes[role_id] as Node3D
		if node != null:
			roles[role_id] = {
				"position": node.position,
				"rotation_degrees": node.rotation_degrees,
				"scale": node.scale,
			}
	return ForgeStableRecord.hash_record({
		"action": semantic_action,
		"time": motion_time_seconds,
		"roles": roles,
	})


func read_back() -> Dictionary:
	var missing_roles: Array[String] = []
	var invalid_parents: Array[String] = []
	if rig_profile != null:
		for binding in rig_profile.role_bindings:
			if binding == null:
				continue
			var node := role_node(binding.role_id)
			if node == null:
				missing_roles.append(binding.role_id)
			elif not binding.parent_role_id.is_empty() \
					and node.get_parent() != role_node(binding.parent_role_id):
				invalid_parents.append(binding.role_id)
	return {
		"ok": missing_roles.is_empty() and invalid_parents.is_empty(),
		"instance_id": instance_id,
		"role_count": role_nodes.size(),
		"part_count": part_nodes.size(),
		"missing_roles": missing_roles,
		"invalid_parents": invalid_parents,
		"action": semantic_action,
		"lod_level": lod_level,
	}


func _apply_motion_pose() -> void:
	for role_id in _rest_transforms:
		var node := role_node(role_id)
		if node != null:
			node.transform = _rest_transforms[role_id]
	if rig_profile == null:
		return
	var profile: Dictionary = rig_profile.motion_profiles.get(
		semantic_action, {})
	var frequency := float(profile.get("frequency_hz", 1.0))
	var phase := motion_time_seconds * frequency * TAU
	var bob := float(profile.get("root_bob_meters", 0.0))
	var root := role_node(rig_profile.root_role_id)
	if root != null and not is_zero_approx(bob):
		root.position.y += sin(phase * 2.0) * bob
	var swing_records: Dictionary = profile.get("role_swings", {})
	for role_id in swing_records:
		var node := role_node(str(role_id))
		var swing: Dictionary = swing_records[role_id]
		if node == null or not swing is Dictionary:
			continue
		var axis_name := str(swing.get("axis", "x"))
		var axis := Vector3.RIGHT
		if axis_name == "y":
			axis = Vector3.UP
		elif axis_name == "z":
			axis = Vector3.BACK
		var angle := deg_to_rad(float(swing.get("amplitude_degrees", 0.0)))
		var role_phase := float(swing.get("phase", 0.0))
		node.rotate_object_local(axis, sin(phase + role_phase) * angle)


func _vector3_from(value: Variant, fallback: Vector3) -> Vector3:
	if value is Vector3:
		return value
	if value is Array and value.size() == 3:
		return Vector3(float(value[0]), float(value[1]), float(value[2]))
	return fallback
