class_name ForgeSemanticRigAdapter
extends RefCounted
## Godot adapter for semantic rigid-part rigs; authored source stays engine-neutral.

const ADAPTER_VERSION := "semantic-rigid-part-v1"


func build(
		entity: ForgeEntityDefinition, rig: ForgeRigProfile,
		instance_id: String) -> Dictionary:
	if entity == null or entity.body_plan == null or rig == null:
		return {"ok": false, "diagnostics": [
			"Entity, body plan or rig source is missing."]}
	var actor := ForgeRuntimeActor.new()
	actor.name = ForgeId.safe_filename(instance_id)
	var role_nodes := {}
	var part_nodes := {}
	var diagnostics: Array[String] = []
	var pending: Array[ForgeRigRoleBinding] = []
	for binding in rig.role_bindings:
		if binding != null:
			pending.append(binding)
	var passes := 0
	while not pending.is_empty() and passes <= rig.role_bindings.size():
		passes += 1
		var progressed := false
		for binding in pending.duplicate():
			if not binding.parent_role_id.is_empty() \
					and not role_nodes.has(binding.parent_role_id):
				continue
			var part := entity.body_plan.find_body_part(binding.body_part_id)
			if part == null:
				diagnostics.append(
					"Body part does not resolve: %s" % binding.body_part_id)
				pending.erase(binding)
				continue
			var part_node := _part_node(part, binding)
			if binding.parent_role_id.is_empty():
				actor.add_child(part_node)
			else:
				var parent := role_nodes[binding.parent_role_id] as Node3D
				parent.add_child(part_node)
			role_nodes[binding.role_id] = part_node
			part_nodes[binding.body_part_id] = part_node
			pending.erase(binding)
			progressed = true
		if not progressed:
			break
	for binding in pending:
		diagnostics.append("Unresolved rig parent for %s" % binding.role_id)
	actor.set_meta("forge_rig_adapter_version", ADAPTER_VERSION)
	return {
		"ok": diagnostics.is_empty(),
		"actor": actor,
		"role_nodes": role_nodes,
		"part_nodes": part_nodes,
		"diagnostics": diagnostics,
	}


func _part_node(
		part: ForgeBodyPartDefinition,
		binding: ForgeRigRoleBinding) -> Node3D:
	var node := Node3D.new()
	node.name = ForgeId.safe_filename(binding.role_id)
	node.position = part.local_position_meters
	node.rotation_degrees = part.local_rotation_degrees
	node.scale = part.local_scale
	node.set_meta("forge_role_id", binding.role_id)
	node.set_meta("forge_body_part_id", part.body_part_id)
	node.set_meta("forge_binding_mode", binding.binding_mode)
	if part.voxel_source != null and part.voxel_source.occupied_count() > 0:
		var baked := ForgeMeshBaker.bake(part.voxel_source, null)
		if bool(baked.get("ok", false)):
			var mesh_node := MeshInstance3D.new()
			mesh_node.name = "RigidVoxelMesh"
			mesh_node.mesh = baked.get("mesh") as Mesh
			mesh_node.position = -part.physical_size_meters() * 0.5
			mesh_node.set_meta("forge_rigid_binding", true)
			node.add_child(mesh_node)
	return node
