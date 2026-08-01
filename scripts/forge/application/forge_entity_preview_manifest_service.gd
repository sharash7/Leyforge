class_name ForgeEntityPreviewManifestService
extends RefCounted
## Deterministic source-only preview manifests. No runtime factory or rigging.


func build(entity: ForgeEntityDefinition) -> Dictionary:
	if entity == null or entity.body_plan == null:
		return {}
	var body_plan := entity.body_plan
	var ordered := _ordered_parts(body_plan)
	if ordered.size() != body_plan.body_parts.size():
		return {}
	var world_positions := {}
	var part_records: Array[Dictionary] = []
	var bounds_min := Vector3(INF, INF, INF)
	var bounds_max := Vector3(-INF, -INF, -INF)
	var occupied_total := 0
	for part in ordered:
		var parent_position: Vector3 = world_positions.get(
			part.parent_part_id, Vector3.ZERO)
		var world_position := parent_position + part.local_position_meters
		world_positions[part.body_part_id] = world_position
		var size := part.physical_size_meters() * part.local_scale
		bounds_min = bounds_min.min(world_position)
		bounds_max = bounds_max.max(world_position + size)
		var occupied := (
			part.voxel_source.occupied_count()
			if part.voxel_source != null else 0)
		occupied_total += occupied
		part_records.append({
			"body_part_id": part.body_part_id,
			"parent_part_id": part.parent_part_id,
			"anatomy_role_id": part.anatomy_role_id,
			"density_profile_id": part.density_profile_id,
			"material_dna_id": part.material_dna_id,
			"dimensions": (
				part.voxel_source.dimensions
				if part.voxel_source != null else Vector3i.ZERO),
			"occupied_voxels": occupied,
			"world_position_meters": world_position,
			"physical_size_meters": size,
			"local_rotation_degrees": part.local_rotation_degrees,
			"source_hash": part.canonical_hash(),
		})
	if part_records.is_empty():
		bounds_min = Vector3.ZERO
		bounds_max = Vector3.ZERO
	var manifest := {
		"schema": "leyforge.forge.entity-preview-manifest",
		"schema_version": 1,
		"entity_definition_id": entity.entity_definition_id,
		"body_plan_id": body_plan.body_plan_id,
		"body_family": entity.body_family,
		"density_profile_id": entity.density_profile_id,
		"part_count": part_records.size(),
		"occupied_voxel_count": occupied_total,
		"bounds_min_meters": bounds_min,
		"bounds_max_meters": bounds_max,
		"parts": part_records,
		"source_hash": entity.canonical_hash(),
		"visual_approval": entity.visual_approval,
	}
	manifest["preview_hash"] = ForgeStableRecord.hash_record(manifest)
	return manifest


func preview_hash(entity: ForgeEntityDefinition) -> String:
	return str(build(entity).get("preview_hash", ""))


func _ordered_parts(
		body_plan: ForgeBodyPlanDefinition) -> Array[ForgeBodyPartDefinition]:
	var ordered: Array[ForgeBodyPartDefinition] = []
	var visited := {}
	var visiting := {}
	var root := body_plan.find_body_part(body_plan.root_part_id)
	if root == null:
		return ordered
	if not _visit(body_plan, root, visited, visiting, ordered):
		ordered.clear()
	return ordered


func _visit(
		body_plan: ForgeBodyPlanDefinition, part: ForgeBodyPartDefinition,
		visited: Dictionary, visiting: Dictionary,
		ordered: Array[ForgeBodyPartDefinition]) -> bool:
	if visiting.has(part.body_part_id):
		return false
	if visited.has(part.body_part_id):
		return true
	visiting[part.body_part_id] = true
	visited[part.body_part_id] = true
	ordered.append(part)
	var children: Array[ForgeBodyPartDefinition] = []
	for candidate in body_plan.body_parts:
		if candidate != null and candidate.parent_part_id == part.body_part_id:
			children.append(candidate)
	children.sort_custom(func(a: ForgeBodyPartDefinition,
			b: ForgeBodyPartDefinition) -> bool:
		return a.body_part_id < b.body_part_id)
	for child in children:
		if not _visit(body_plan, child, visited, visiting, ordered):
			return false
	visiting.erase(part.body_part_id)
	return true
