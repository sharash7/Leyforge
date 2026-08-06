class_name ForgeRuntimeActorFactory
extends RefCounted
## Stable-ID actor assembly and reconstruction using the shared Forge index.

var asset_index := ForgeAssetIndex.new()
var spatial_resolver := ForgeSpatialResolver.new()
var diagnostics: Array[Dictionary] = []
var _entities: Dictionary = {}
var _rigs: Dictionary = {}
var _spatial_maps: Dictionary = {}
var _assemblies: Dictionary = {}
var _assembly_by_entity: Dictionary = {}
var _aliases: Dictionary = {}


func load_and_validate(
		source_roots: PackedStringArray,
		semantic_registry: ForgeSemanticRegistry = null,
		density_registry: ForgeDensityProfileRegistry = null) -> Dictionary:
	_entities.clear()
	_rigs.clear()
	_spatial_maps.clear()
	_assemblies.clear()
	_assembly_by_entity.clear()
	_aliases.clear()
	diagnostics.clear()
	var index_report := asset_index.load_and_validate(
		source_roots, semantic_registry, density_registry)
	diagnostics.append_array(index_report.get("diagnostics", []))
	for record in asset_index.filtered_list():
		var source_id := str(record.get("source_id", ""))
		var path := asset_index.foundation_path_for(source_id)
		var resource := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if resource is ForgeEntityDefinition:
			_entities[source_id] = resource
		elif resource is ForgeRigProfile:
			_rigs[source_id] = resource
			_register_aliases(resource.aliases, source_id)
		elif resource is ForgeSpatialMap:
			_spatial_maps[source_id] = resource
			_register_aliases(resource.aliases, source_id)
		elif resource is ForgeEntityAssemblyProfile:
			_assemblies[source_id] = resource
			_register_aliases(resource.aliases, source_id)
			if _assembly_by_entity.has(resource.entity_definition_id):
				diagnostics.append(_diagnostic(
					"EFB-ASSEMBLY-001", "critical", source_id,
					"Entity has more than one canonical assembly profile."))
			else:
				_assembly_by_entity[resource.entity_definition_id] = source_id
	_validate_cross_dependencies(semantic_registry)
	var maps: Array[ForgeSpatialMap] = []
	for spatial_map in _spatial_maps.values():
		maps.append(spatial_map)
	var spatial_report := spatial_resolver.load_and_validate(
		maps, semantic_registry)
	for diagnostic in spatial_report.get("diagnostics", []):
		if diagnostic not in diagnostics:
			diagnostics.append(diagnostic)
	return {
		"ok": diagnostics.is_empty(),
		"entity_count": _entities.size(),
		"rig_count": _rigs.size(),
		"spatial_map_count": _spatial_maps.size(),
		"assembly_count": _assemblies.size(),
		"alias_count": _aliases.size(),
		"diagnostics": diagnostics.duplicate(true),
	}


func has(stable_id: String) -> bool:
	return not resolve(stable_id).is_empty()


func resolve(stable_id: String) -> Dictionary:
	var canonical := ForgeId.canonical_id(stable_id, _aliases)
	if _entities.has(canonical):
		return (_entities[canonical] as ForgeEntityDefinition).to_record()
	if _rigs.has(canonical):
		return (_rigs[canonical] as ForgeRigProfile).to_record()
	if _spatial_maps.has(canonical):
		return (_spatial_maps[canonical] as ForgeSpatialMap).to_record()
	if _assemblies.has(canonical):
		return (_assemblies[canonical] as ForgeEntityAssemblyProfile).to_record()
	return {}


func filtered_list(kind := "") -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	if kind.is_empty() or kind == "entity_definition":
		for entity in _entities.values():
			var record: Dictionary = entity.to_record()
			record["runtime_kind"] = "entity_definition"
			records.append(record)
	if kind.is_empty() or kind == "rig_profile":
		for rig in _rigs.values():
			var record: Dictionary = rig.to_record()
			record["runtime_kind"] = "rig_profile"
			records.append(record)
	if kind.is_empty() or kind == "spatial_map":
		for spatial_map in _spatial_maps.values():
			var record: Dictionary = spatial_map.to_record()
			record["runtime_kind"] = "spatial_map"
			records.append(record)
	if kind.is_empty() or kind == "assembly_profile":
		for assembly in _assemblies.values():
			var record: Dictionary = assembly.to_record()
			record["runtime_kind"] = "assembly_profile"
			records.append(record)
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return _record_id(a) < _record_id(b))
	return records


func create_actor(
		entity_or_assembly_id: String, instance_id := "",
		options: Dictionary = {}) -> ForgeRuntimeActor:
	var assembly := _assembly_for(entity_or_assembly_id)
	if assembly == null:
		return null
	var entity := _entities.get(
		assembly.entity_definition_id) as ForgeEntityDefinition
	var rig := _rigs.get(assembly.rig_profile_id) as ForgeRigProfile
	if entity == null or rig == null:
		return null
	var resolved_instance_id := instance_id
	if resolved_instance_id.is_empty():
		resolved_instance_id = "%s:runtime" % entity.entity_definition_id
	var build := ForgeSemanticRigAdapter.new().build(
		entity, rig, resolved_instance_id)
	if not bool(build.get("ok", false)):
		return null
	var actor := build.get("actor") as ForgeRuntimeActor
	actor.configure(
		assembly, entity, rig, resolved_instance_id,
		build.get("role_nodes", {}), build.get("part_nodes", {}))
	actor.variant_id = str(options.get(
		"variant_id", assembly.default_variant_id))
	actor.lod_level = int(options.get(
		"lod_level", assembly.default_lod_level))
	actor.play_semantic_action(str(options.get("action", "idle")), true)
	spatial_resolver.bind_owner(
		resolved_instance_id, actor, assembly.spatial_map_id,
		actor.variant_id, actor.lod_level)
	return actor


func reconstruct(snapshot: Dictionary) -> ForgeRuntimeActor:
	var assembly_id := str(snapshot.get("assembly_profile_id", ""))
	var actor := create_actor(
		assembly_id, str(snapshot.get("instance_id", "")), {
			"variant_id": snapshot.get("variant_id", "base"),
			"lod_level": snapshot.get("lod_level", 0),
			"action": snapshot.get("semantic_action", "idle"),
		})
	if actor == null or not actor.restore_snapshot(snapshot):
		if actor != null:
			actor.free()
		return null
	spatial_resolver.bind_owner(
		actor.instance_id, actor, actor.assembly_profile.spatial_map_id,
		actor.variant_id, actor.lod_level)
	return actor


func _assembly_for(stable_id: String) -> ForgeEntityAssemblyProfile:
	var canonical := ForgeId.canonical_id(stable_id, _aliases)
	if _assemblies.has(canonical):
		return _assemblies[canonical] as ForgeEntityAssemblyProfile
	var assembly_id := str(_assembly_by_entity.get(canonical, ""))
	return _assemblies.get(assembly_id) as ForgeEntityAssemblyProfile


func _validate_cross_dependencies(
		semantic_registry: ForgeSemanticRegistry) -> void:
	var validator := ForgeRuntimeAssemblyValidationService.new()
	for rig in _rigs.values():
		var entity := _entities.get(rig.entity_definition_id) as ForgeEntityDefinition
		if entity == null or entity.body_plan == null \
				or entity.body_plan.body_plan_id != rig.body_plan_id:
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", "error", rig.rig_profile_id,
				"Rig entity or body-plan dependency does not resolve."))
		for diagnostic in validator.validate_rig_profile(
				rig, entity, semantic_registry):
			diagnostics.append(diagnostic.to_record())
	for assembly in _assemblies.values():
		for diagnostic in validator.validate_assembly_profile(assembly):
			diagnostics.append(diagnostic.to_record())
		if not _entities.has(assembly.entity_definition_id) \
				or not _rigs.has(assembly.rig_profile_id) \
				or not _spatial_maps.has(assembly.spatial_map_id):
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", "error", assembly.assembly_profile_id,
				"Assembly entity, rig or spatial map dependency is missing."))
		else:
			var rig: ForgeRigProfile = _rigs[assembly.rig_profile_id]
			var spatial_map: ForgeSpatialMap = _spatial_maps[
				assembly.spatial_map_id]
			if rig.entity_definition_id != assembly.entity_definition_id \
					or spatial_map.owner_asset_id != assembly.entity_definition_id \
					or rig.spatial_map_id != assembly.spatial_map_id:
				diagnostics.append(_diagnostic(
					"EFB-ASSEMBLY-001", "error",
					assembly.assembly_profile_id,
					"Assembly sources do not share one entity/spatial identity."))


func _register_aliases(aliases: PackedStringArray, canonical_id: String) -> void:
	for alias_id in aliases:
		if _aliases.has(alias_id):
			diagnostics.append(_diagnostic(
				"EFB-ID-001", "critical", alias_id,
				"Runtime source alias is duplicated."))
		else:
			_aliases[alias_id] = canonical_id


func _record_id(record: Dictionary) -> String:
	for key in [
			"assembly_profile_id", "rig_profile_id", "spatial_map_id",
			"entity_definition_id"]:
		if record.has(key):
			return str(record[key])
	return ""


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {
		"code": code,
		"severity": severity,
		"target_id": target_id,
		"message": message,
	}
