class_name ForgeSpatialResolver
extends RefCounted
## Shared owner-local resolver for semantic roles and runtime contacts.

const QUALITY_ORDER := {
	"exact": 0,
	"equivalent": 1,
	"approximate": 2,
	"fallback": 3,
	"suppressed": 4,
	"invalid": 5,
}

var _maps_by_id: Dictionary = {}
var _map_id_by_owner: Dictionary = {}
var _aliases: Dictionary = {}
var _owners: Dictionary = {}
var _generic_owner_actors: Dictionary = {}
var _semantic_registry: ForgeSemanticRegistry
var diagnostics: Array[Dictionary] = []


func load_and_validate(
		maps: Array[ForgeSpatialMap],
		semantic_registry: ForgeSemanticRegistry = null) -> Dictionary:
	_maps_by_id.clear()
	_map_id_by_owner.clear()
	_aliases.clear()
	_owners.clear()
	for actor in _generic_owner_actors.values():
		if actor != null:
			(actor as ForgeRuntimeActor).free()
	_generic_owner_actors.clear()
	diagnostics.clear()
	_semantic_registry = semantic_registry
	var validator := ForgeRuntimeAssemblyValidationService.new()
	for spatial_map in maps:
		if spatial_map == null:
			continue
		if _maps_by_id.has(spatial_map.spatial_map_id) \
				or _map_id_by_owner.has(spatial_map.owner_asset_id):
			diagnostics.append(_diagnostic(
				"SPT-001", "critical", spatial_map.spatial_map_id,
				"Spatial map ID or owner is duplicated."))
			continue
		_maps_by_id[spatial_map.spatial_map_id] = spatial_map
		_map_id_by_owner[spatial_map.owner_asset_id] = spatial_map.spatial_map_id
		for alias_id in spatial_map.aliases:
			if _aliases.has(alias_id):
				diagnostics.append(_diagnostic(
					"SPT-002", "error", alias_id,
					"Spatial map import alias is duplicated."))
			else:
				_aliases[alias_id] = spatial_map.spatial_map_id
		for diagnostic in validator.validate_spatial_map(
				spatial_map, semantic_registry):
			diagnostics.append(diagnostic.to_record())
	return {
		"ok": diagnostics.is_empty(),
		"map_count": _maps_by_id.size(),
		"alias_count": _aliases.size(),
		"diagnostics": diagnostics.duplicate(true),
	}


func has(map_or_owner_id: String) -> bool:
	return resolve_map(map_or_owner_id) != null


func resolve_map(map_or_owner_id: String) -> ForgeSpatialMap:
	var canonical := ForgeId.canonical_id(map_or_owner_id, _aliases)
	if _maps_by_id.has(canonical):
		return _maps_by_id[canonical] as ForgeSpatialMap
	var map_id := str(_map_id_by_owner.get(canonical, ""))
	return _maps_by_id.get(map_id) as ForgeSpatialMap


func filtered_list(owner_asset_id := "") -> Array[ForgeSpatialMap]:
	var result: Array[ForgeSpatialMap] = []
	for spatial_map in _maps_by_id.values():
		if owner_asset_id.is_empty() \
				or spatial_map.owner_asset_id == owner_asset_id:
			result.append(spatial_map)
	result.sort_custom(func(a: ForgeSpatialMap, b: ForgeSpatialMap) -> bool:
		return a.spatial_map_id < b.spatial_map_id)
	return result


func bind_owner(
		owner_instance_id: String, actor: ForgeRuntimeActor,
		spatial_map_id := "", variant_id := "", lod_level := -1) -> bool:
	if owner_instance_id.is_empty() or actor == null:
		return false
	var selected_map_id := spatial_map_id
	if selected_map_id.is_empty() and actor.assembly_profile != null:
		selected_map_id = actor.assembly_profile.spatial_map_id
	var spatial_map := resolve_map(selected_map_id)
	if spatial_map == null:
		return false
	_owners[owner_instance_id] = {
		"actor": actor,
		"map_id": spatial_map.spatial_map_id,
		"variant_id": actor.variant_id if variant_id.is_empty() else variant_id,
		"lod_level": actor.lod_level if lod_level < 0 else lod_level,
	}
	return true


func unbind_owner(owner_instance_id: String) -> void:
	_owners.erase(owner_instance_id)
	var generic := _generic_owner_actors.get(owner_instance_id) as ForgeRuntimeActor
	if generic != null:
		generic.free()
	_generic_owner_actors.erase(owner_instance_id)


func bind_transform_owner(
		owner_instance_id: String, spatial_map_id: String,
		world_transform: Transform3D = Transform3D.IDENTITY,
		variant_id := "base", lod_level := 0) -> bool:
	var spatial_map := resolve_map(spatial_map_id)
	if owner_instance_id.is_empty() or spatial_map == null:
		return false
	var actor := ForgeRuntimeActor.new()
	actor.instance_id = owner_instance_id
	actor.variant_id = variant_id
	actor.lod_level = maxi(0, lod_level)
	actor.transform = world_transform
	_generic_owner_actors[owner_instance_id] = actor
	_owners[owner_instance_id] = {
		"actor": actor,
		"map_id": spatial_map.spatial_map_id,
		"variant_id": variant_id,
		"lod_level": actor.lod_level,
	}
	return true


func resolve(
		owner_instance_id: String, requested_role_id: String,
		runtime_contact: ForgeRuntimeContactRecord = null,
		options: Dictionary = {}) -> Dictionary:
	if runtime_contact != null \
			and requested_role_id == runtime_contact.runtime_anchor_id:
		return {
			"ok": true,
			"requested_role_id": requested_role_id,
			"canonical_role_id": requested_role_id,
			"resolved_reference_id": runtime_contact.runtime_anchor_id,
			"quality": "exact",
			"mapping_source": "runtime_contact",
			"transform": runtime_contact.world_transform(),
			"surface_normal": runtime_contact.surface_normal,
			"fallback_chain": [],
			"contact_hash": runtime_contact.canonical_hash(),
		}
	if not _owners.has(owner_instance_id):
		return _failure(requested_role_id, "owner_not_bound")
	var owner: Dictionary = _owners[owner_instance_id]
	var actor := owner.get("actor") as ForgeRuntimeActor
	var spatial_map := resolve_map(str(owner.get("map_id", "")))
	if actor == null or spatial_map == null:
		return _failure(requested_role_id, "owner_or_map_unavailable")
	var variant_id := str(options.get(
		"variant_id", owner.get("variant_id", actor.variant_id)))
	var lod_level := int(options.get(
		"lod_level", owner.get("lod_level", actor.lod_level)))
	var canonical_role := _canonical_role(spatial_map, requested_role_id)
	var reference := spatial_map.reference_for_role(canonical_role)
	if reference == null:
		var mirrored := _resolve_mirrored(
			spatial_map, actor, canonical_role, variant_id, lod_level)
		if bool(mirrored.get("ok", false)):
			mirrored["requested_role_id"] = requested_role_id
			mirrored["canonical_role_id"] = canonical_role
			return mirrored
		return _failure(requested_role_id, "role_not_mapped", canonical_role)
	return _resolve_reference(
		spatial_map, actor, reference, requested_role_id, canonical_role,
		variant_id, lod_level, [])


func resolution_hash(result: Dictionary) -> String:
	var stable := result.duplicate(true)
	var transform: Variant = stable.get("transform")
	if transform is Transform3D:
		stable["transform"] = _transform_record(transform)
	return ForgeStableRecord.hash_record(stable)


func _resolve_reference(
		spatial_map: ForgeSpatialMap, actor: ForgeRuntimeActor,
		reference: ForgeSpatialReference, requested_role_id: String,
		canonical_role_id: String, variant_id: String, lod_level: int,
		chain: Array) -> Dictionary:
	if reference == null or reference.stable_id in chain:
		return _failure(requested_role_id, "fallback_cycle", canonical_role_id)
	var next_chain := chain.duplicate()
	next_chain.append(reference.stable_id)
	var selected := reference
	var quality := "exact"
	var source := "base"
	var local_position := reference.local_position
	var local_rotation := reference.local_rotation_degrees
	var local_scale := reference.local_scale
	var variant_mapping := _mapping_for(
		reference.variant_mappings, "variant_id", variant_id)
	if not variant_mapping.is_empty():
		quality = str(variant_mapping.get("quality", quality))
		source = "variant"
		var remap := spatial_map.reference_by_id(str(
			variant_mapping.get("reference_id", "")))
		if remap != null:
			selected = remap
		local_position = variant_mapping.get(
			"local_position", selected.local_position)
		local_rotation = variant_mapping.get(
			"local_rotation_degrees", selected.local_rotation_degrees)
		local_scale = variant_mapping.get("local_scale", selected.local_scale)
	var lod_mapping := _mapping_for(reference.lod_mappings, "lod", lod_level)
	if not lod_mapping.is_empty():
		quality = _worse_quality(
			quality, str(lod_mapping.get("quality", quality)))
		source = "lod" if source == "base" else "%s+lod" % source
		var lod_remap := spatial_map.reference_by_id(str(
			lod_mapping.get("reference_id", "")))
		if lod_remap != null:
			selected = lod_remap
		local_position = lod_mapping.get(
			"local_position", selected.local_position)
		local_rotation = lod_mapping.get(
			"local_rotation_degrees", selected.local_rotation_degrees)
		local_scale = lod_mapping.get("local_scale", selected.local_scale)
	if quality == "suppressed":
		return {
			"ok": true,
			"requested_role_id": requested_role_id,
			"canonical_role_id": canonical_role_id,
			"resolved_reference_id": selected.stable_id,
			"quality": quality,
			"mapping_source": source,
			"fallback_chain": next_chain,
			"variant_id": variant_id,
			"lod_level": lod_level,
		}
	var parent_role := str(selected.extension_fields.get("parent_role_id", ""))
	var parent_transform := _actor_world_transform(actor)
	if not parent_role.is_empty():
		var parent_node := actor.role_node(parent_role)
		if parent_node == null:
			return _resolve_fallback(
				spatial_map, actor, reference, requested_role_id,
				canonical_role_id, variant_id, lod_level, next_chain)
		parent_transform = parent_node.global_transform
	var local_transform := _local_transform(
		local_position, local_rotation, local_scale)
	return {
		"ok": true,
		"requested_role_id": requested_role_id,
		"canonical_role_id": canonical_role_id,
		"resolved_reference_id": selected.stable_id,
		"quality": quality,
		"mapping_source": source,
		"transform": parent_transform * local_transform,
		"fallback_chain": next_chain,
		"variant_id": variant_id,
		"lod_level": lod_level,
	}


func _resolve_fallback(
		spatial_map: ForgeSpatialMap, actor: ForgeRuntimeActor,
		reference: ForgeSpatialReference, requested_role_id: String,
		canonical_role_id: String, variant_id: String, lod_level: int,
		chain: Array) -> Dictionary:
	if reference.fallback_reference_id.is_empty():
		return _failure(
			requested_role_id, "parent_and_fallback_unavailable",
			canonical_role_id, chain)
	var fallback := spatial_map.reference_by_id(reference.fallback_reference_id)
	var result := _resolve_reference(
		spatial_map, actor, fallback, requested_role_id, canonical_role_id,
		variant_id, lod_level, chain)
	if bool(result.get("ok", false)):
		result["quality"] = _worse_quality(
			str(result.get("quality", "exact")), "fallback")
		result["mapping_source"] = "fallback"
	return result


func _resolve_mirrored(
		spatial_map: ForgeSpatialMap, actor: ForgeRuntimeActor,
		target_role_id: String, variant_id: String, lod_level: int) -> Dictionary:
	for mapping in spatial_map.mirror_mappings:
		if str(mapping.get("target_role_id", "")) != target_role_id:
			continue
		var source_role := str(mapping.get("source_role_id", ""))
		var source_reference := spatial_map.reference_for_role(source_role)
		if source_reference == null:
			return {}
		var result := _resolve_reference(
			spatial_map, actor, source_reference, target_role_id,
			target_role_id, variant_id, lod_level, [])
		if not bool(result.get("ok", false)) or not result.has("transform"):
			return result
		var transform: Transform3D = result["transform"]
		var owner_transform := _actor_world_transform(actor)
		var owner_inverse := owner_transform.affine_inverse()
		var local := owner_inverse * transform
		var axis := str(mapping.get("axis", "x"))
		if axis == "x":
			local.origin.x *= -1.0
		elif axis == "y":
			local.origin.y *= -1.0
		else:
			local.origin.z *= -1.0
		result["transform"] = owner_transform * local
		result["quality"] = _worse_quality(
			str(result.get("quality", "exact")), "equivalent")
		result["mapping_source"] = "mirror"
		return result
	return {}


func _canonical_role(spatial_map: ForgeSpatialMap, role_id: String) -> String:
	var current := role_id
	var visited := {}
	while spatial_map.alias_mappings.has(current) and not visited.has(current):
		visited[current] = true
		current = str(spatial_map.alias_mappings[current])
	if _semantic_registry != null:
		current = _semantic_registry.canonical_id(current)
	return current


func _mapping_for(
		records: Array[Dictionary], selector_key: String,
		selector_value: Variant) -> Dictionary:
	for mapping in records:
		if mapping.get(selector_key) == selector_value:
			return mapping
	return {}


func _local_transform(
		position: Vector3, rotation: Vector3, local_scale: Vector3) -> Transform3D:
	var radians := Vector3(
		deg_to_rad(rotation.x), deg_to_rad(rotation.y), deg_to_rad(rotation.z))
	return Transform3D(Basis.from_euler(radians).scaled(local_scale), position)


func _actor_world_transform(actor: ForgeRuntimeActor) -> Transform3D:
	return actor.global_transform if actor.is_inside_tree() else actor.transform


func _worse_quality(first: String, second: String) -> String:
	return first if int(QUALITY_ORDER.get(first, 5)) >= int(
		QUALITY_ORDER.get(second, 5)) else second


func _failure(
		requested_role_id: String, reason: String, canonical_role_id := "",
		chain: Array = []) -> Dictionary:
	return {
		"ok": false,
		"requested_role_id": requested_role_id,
		"canonical_role_id": canonical_role_id,
		"quality": "invalid",
		"reason": reason,
		"fallback_chain": chain.duplicate(),
	}


func _transform_record(transform: Transform3D) -> Dictionary:
	return {
		"basis_x": transform.basis.x,
		"basis_y": transform.basis.y,
		"basis_z": transform.basis.z,
		"origin": transform.origin,
	}


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {
		"code": code,
		"severity": severity,
		"target_id": target_id,
		"message": message,
	}
