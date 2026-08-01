class_name ForgeAssetIndex
extends RefCounted
## Rebuildable metadata index. It never becomes canonical asset truth.

const DEFAULT_ASSET_ROOT := "res://content/forge/assets"

var records_by_source_id: Dictionary = {}
var source_paths: Dictionary = {}
var diagnostics: Array[Dictionary] = []
var foundation_records_by_id: Dictionary = {}
var foundation_source_paths: Dictionary = {}
var foundation_diagnostics: Array[Dictionary] = []
var registry_bridge := ForgeRegistryBridge.new()


func rebuild(asset_root := DEFAULT_ASSET_ROOT) -> Dictionary:
	records_by_source_id.clear()
	source_paths.clear()
	diagnostics.clear()
	for record in registry_bridge.all_gameplay_records():
		var gameplay_id := str(record["gameplay_id"])
		var source_id := ForgeId.source_id_for(gameplay_id)
		var indexed := record.duplicate(true)
		indexed["forge_asset_id"] = source_id
		indexed["source_status"] = "legacy_wrapper"
		indexed["source_path"] = ""
		records_by_source_id[source_id] = indexed
	_scan_directory(asset_root)
	return summary()


func summary() -> Dictionary:
	var statuses := {}
	for record in records_by_source_id.values():
		var status := str(record.get("source_status", "unknown"))
		statuses[status] = int(statuses.get(status, 0)) + 1
	return {
		"asset_count": records_by_source_id.size(),
		"status_counts": statuses,
		"diagnostics": diagnostics.duplicate(true),
	}


func all_records() -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for record in records_by_source_id.values():
		records.append(record.duplicate(true))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("gameplay_id", "")) < str(b.get("gameplay_id", "")))
	return records


func search(query: String, filters: Dictionary = {}) -> Array[Dictionary]:
	var needle := query.strip_edges().to_lower()
	var results: Array[Dictionary] = []
	for record in all_records():
		if not _matches_filters(record, filters):
			continue
		var haystack := " ".join([
			str(record.get("display_name", "")),
			str(record.get("gameplay_id", "")),
			str(record.get("category", "")),
			str(record.get("asset_kind", "")),
			str(record.get("source_status", "")),
		]).to_lower()
		if needle.is_empty() or needle in haystack:
			results.append(record)
	return results


func record_for_source_id(source_id: String) -> Dictionary:
	return records_by_source_id.get(source_id, {}).duplicate(true)


func path_for_source_id(source_id: String) -> String:
	return str(source_paths.get(source_id, ""))


func load_and_validate(
		source_roots: PackedStringArray,
		semantic_registry: ForgeSemanticRegistry = null,
		density_registry: ForgeDensityProfileRegistry = null) -> Dictionary:
	foundation_records_by_id.clear()
	foundation_source_paths.clear()
	foundation_diagnostics.clear()
	for source_root in source_roots:
		_scan_foundation_directory(
			source_root, semantic_registry, density_registry)
	return {
		"ok": foundation_diagnostics.is_empty(),
		"record_count": foundation_records_by_id.size(),
		"diagnostics": foundation_diagnostics.duplicate(true),
	}


func resolve(source_id: String) -> Dictionary:
	return foundation_records_by_id.get(source_id, {}).duplicate(true)


func has(source_id: String) -> bool:
	return foundation_records_by_id.has(source_id)


func filtered_list(kind := "") -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for record in foundation_records_by_id.values():
		if kind.is_empty() or str(record.get("foundation_kind", "")) == kind:
			records.append(record.duplicate(true))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("source_id", "")) < str(b.get("source_id", "")))
	return records


func foundation_path_for(source_id: String) -> String:
	return str(foundation_source_paths.get(source_id, ""))


func _scan_directory(path: String) -> void:
	var directory := DirAccess.open(path)
	if directory == null:
		return
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if entry.begins_with("."):
			entry = directory.get_next()
			continue
		var child_path := path.path_join(entry)
		if directory.current_is_dir():
			_scan_directory(child_path)
		elif (entry.ends_with(".tres") or entry.ends_with(".res")) \
				and not entry.ends_with(".previous.tres") \
				and ".tmp." not in entry \
				and ".autosave." not in entry:
			_index_source(child_path)
		entry = directory.get_next()
	directory.list_dir_end()


func _scan_foundation_directory(
		path: String, semantic_registry: ForgeSemanticRegistry,
		density_registry: ForgeDensityProfileRegistry) -> void:
	var directory := DirAccess.open(path)
	if directory == null:
		foundation_diagnostics.append({
			"code": "EFB-DEP-001",
			"severity": "error",
			"target_id": path,
			"message": "Forge foundation source root is missing.",
		})
		return
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if entry.begins_with("."):
			entry = directory.get_next()
			continue
		var child_path := path.path_join(entry)
		if directory.current_is_dir():
			_scan_foundation_directory(
				child_path, semantic_registry, density_registry)
		elif entry.ends_with(".tres") or entry.ends_with(".res"):
			_index_foundation_source(
				child_path, semantic_registry, density_registry)
		entry = directory.get_next()
	directory.list_dir_end()


func _index_foundation_source(
		path: String, semantic_registry: ForgeSemanticRegistry,
		density_registry: ForgeDensityProfileRegistry) -> void:
	var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	var identity := _foundation_identity(resource)
	var source_id := str(identity.get("source_id", ""))
	if source_id.is_empty():
		return
	if foundation_records_by_id.has(source_id):
		foundation_diagnostics.append({
			"code": "EFB-ID-001",
			"severity": "critical",
			"target_id": source_id,
			"message": "Duplicate Forge foundation source ID.",
			"paths": [foundation_source_paths[source_id], path],
		})
		return
	var record: Dictionary = resource.call("to_record")
	record["source_id"] = source_id
	record["foundation_kind"] = str(identity.get("kind", ""))
	record["source_path"] = path
	foundation_records_by_id[source_id] = record
	foundation_source_paths[source_id] = path
	var validator := ForgeFoundationValidationService.new()
	var resource_diagnostics: Array[ForgeDiagnostic] = []
	if resource is ForgeEntityDefinition:
		resource_diagnostics = validator.validate_entity_definition(
			resource, semantic_registry, density_registry)
	elif resource is ForgeBodyPlanDefinition:
		resource_diagnostics = validator.validate_body_plan(
			resource, semantic_registry, density_registry)
	elif resource is ForgeBodyPartDefinition:
		resource_diagnostics = validator.validate_body_part(
			resource, null, semantic_registry, density_registry)
	elif resource is ForgeDensityProfile:
		resource_diagnostics = validator.validate_density_profile(resource)
	elif resource is ForgeBlueprintDefinition:
		resource_diagnostics = validator.validate_blueprint(
			resource, semantic_registry)
	elif resource is ForgeBlueprintMaterialRoleSet:
		resource_diagnostics = validator.validate_material_role_set(
			resource, semantic_registry)
	elif resource is ForgeMaterialDefinition:
		if resource.schema_version != 1 \
				or not ForgeId.is_valid(resource.material_id, "material."):
			foundation_diagnostics.append({
				"code": "EFB-SCHEMA-001",
				"severity": "error",
				"target_id": source_id,
				"message": "Material DNA source contract is invalid.",
			})
	for diagnostic in resource_diagnostics:
		foundation_diagnostics.append(diagnostic.to_record())


func _foundation_identity(resource: Resource) -> Dictionary:
	if resource is ForgeEntityDefinition:
		return {"source_id": resource.entity_definition_id,
			"kind": "entity_definition"}
	if resource is ForgeBodyPlanDefinition:
		return {"source_id": resource.body_plan_id, "kind": "body_plan"}
	if resource is ForgeBodyPartDefinition:
		return {"source_id": resource.body_part_id, "kind": "body_part"}
	if resource is ForgeDensityProfile:
		return {"source_id": resource.density_profile_id,
			"kind": "density_profile"}
	if resource is ForgeBlueprintDefinition:
		return {"source_id": resource.blueprint_id,
			"kind": "blueprint_definition"}
	if resource is ForgeBlueprintMaterialRoleSet:
		return {"source_id": resource.material_role_set_id,
			"kind": "blueprint_material_role_set"}
	if resource is ForgeMaterialDefinition:
		return {"source_id": resource.material_id, "kind": "material_dna"}
	return {}


func _index_source(path: String) -> void:
	var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if resource == null or not resource is ForgeAssetDefinition:
		return
	var source_id := str(resource.get("forge_asset_id"))
	if not ForgeId.is_valid(source_id, "forge_asset."):
		diagnostics.append({
			"code": "FORGE-ID-001",
			"severity": "error",
			"asset_id": source_id,
			"message": "Forge source has an invalid stable ID.",
			"path": path,
		})
		return
	if source_paths.has(source_id):
		diagnostics.append({
			"code": "FORGE-ID-001",
			"severity": "critical",
			"asset_id": source_id,
			"message": "Duplicate Forge source ID.",
			"paths": [source_paths[source_id], path],
		})
		return
	var record: Dictionary = resource.call("to_record")
	if resource.source_status == "approved":
		var manifest_path := (
			"res://generated/forge/manifests/%s.tres"
			% ForgeId.safe_filename(resource.presentation_id))
		var manifest := ResourceLoader.load(
			manifest_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if manifest is ForgeBakeManifest \
				and manifest.source_hash != resource.canonical_hash():
			record["source_status"] = "draft"
			record["approved_product_stale"] = true
	record["source_path"] = path
	record["legacy_fallback"] = false
	records_by_source_id[source_id] = record
	source_paths[source_id] = path


func _matches_filters(record: Dictionary, filters: Dictionary) -> bool:
	for key in filters:
		var expected: Variant = filters[key]
		if expected is Array:
			if not record.get(key) in expected:
				return false
		elif str(record.get(key, "")) != str(expected):
			return false
	return true
