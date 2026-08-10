class_name ForgeAssetIndex
extends RefCounted
## Rebuildable metadata index. It never becomes canonical asset truth.

const DEFAULT_ASSET_ROOT := "res://content/forge/assets"

var records_by_source_id: Dictionary = {}
var source_paths: Dictionary = {}
var diagnostics: Array[Dictionary] = []
var foundation_records_by_id: Dictionary = {}
var foundation_source_paths: Dictionary = {}
var foundation_aliases: Dictionary = {}
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
	foundation_aliases.clear()
	foundation_diagnostics.clear()
	for source_root in source_roots:
		_scan_foundation_directory(
			source_root, semantic_registry, density_registry)
	_validate_foundation_dependencies(semantic_registry)
	return {
		"ok": foundation_diagnostics.is_empty(),
		"record_count": foundation_records_by_id.size(),
		"alias_count": foundation_aliases.size(),
		"diagnostics": foundation_diagnostics.duplicate(true),
	}


func resolve(source_id: String) -> Dictionary:
	var canonical := ForgeId.canonical_id(source_id, foundation_aliases)
	return foundation_records_by_id.get(canonical, {}).duplicate(true)


func has(source_id: String) -> bool:
	return not resolve(source_id).is_empty()


func filtered_list(kind := "") -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for record in foundation_records_by_id.values():
		if kind.is_empty() or str(record.get("foundation_kind", "")) == kind:
			records.append(record.duplicate(true))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("source_id", "")) < str(b.get("source_id", "")))
	return records


func foundation_path_for(source_id: String) -> String:
	var canonical := ForgeId.canonical_id(source_id, foundation_aliases)
	return str(foundation_source_paths.get(canonical, ""))


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
			"code": "REG-001" if resource is ForgePresentationDefinition \
				else "EFB-ID-001",
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
	if resource is ForgePresentationDefinition:
		for alias_id in resource.aliases:
			if foundation_records_by_id.has(alias_id) \
					or foundation_aliases.has(alias_id):
				foundation_diagnostics.append({
					"code": "REG-001",
					"severity": "critical",
					"target_id": alias_id,
					"message": "Presentation alias is duplicated.",
				})
			else:
				foundation_aliases[alias_id] = source_id
	elif resource is ForgeRigProfile \
			or resource is ForgeSpatialMap \
			or resource is ForgeEntityAssemblyProfile \
			or resource is ForgeEntityAnimationLibrary \
			or resource is ForgeRetargetMap \
			or resource is ForgeEntityVariantProfile \
			or resource is ForgeBlueprintModuleDefinition \
			or resource is ForgeBlueprintStateDefinition \
			or resource is ForgeBlueprintRuntimeProduct \
			or resource is ForgePresentationLibraryManifest:
		for alias_id in resource.aliases:
			if foundation_records_by_id.has(alias_id) \
					or foundation_aliases.has(alias_id):
				foundation_diagnostics.append({
					"code": "EFB-ID-001",
					"severity": "critical",
					"target_id": alias_id,
					"message": "Runtime Forge alias is duplicated.",
				})
			else:
				foundation_aliases[alias_id] = source_id
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
	elif resource is ForgeBlueprintModuleDefinition:
		resource_diagnostics = ForgeBlueprintRuntimeValidationService.new().\
			validate_module(resource, semantic_registry)
	elif resource is ForgeBlueprintModuleSet:
		resource_diagnostics = ForgeModularStructureValidationService.new().\
			validate_module_set(resource)
	elif resource is ForgeProceduralStructureRuleSet:
		resource_diagnostics = ForgeModularStructureValidationService.new().\
			validate_rule_set(resource)
	elif resource is ForgeBlueprintStateDefinition:
		resource_diagnostics = ForgeBlueprintRuntimeValidationService.new().\
			validate_state(resource, semantic_registry)
	elif resource is ForgeBlueprintRuntimeProduct:
		resource_diagnostics = ForgeBlueprintRuntimeValidationService.new().\
			validate_product(resource)
	elif resource is ForgeMaterialDefinition:
		if resource.schema_version != 1 \
				or not ForgeId.is_valid(resource.material_id, "material."):
			foundation_diagnostics.append({
				"code": "EFB-SCHEMA-001",
				"severity": "error",
				"target_id": source_id,
				"message": "Material DNA source contract is invalid.",
			})
	elif resource is ForgeAcousticZoneGraph:
		resource_diagnostics = ForgeBlueprintRuntimeValidationService.new().\
			validate_acoustic_graph(resource)
	elif resource is ForgeAmbiencePlan:
		resource_diagnostics = ForgeBlueprintRuntimeValidationService.new().\
			validate_ambience_plan(resource)
	elif resource is ForgePresentationLibraryManifest:
		resource_diagnostics = ForgePresentationProductionValidationService.new().\
			validate_library_manifest(resource)
	elif resource is ForgePresentationDefinition:
		resource_diagnostics = ForgePresentationValidationService.new().validate(
			resource, semantic_registry)
	elif resource is ForgeRigProfile:
		resource_diagnostics = ForgeRuntimeAssemblyValidationService.new().\
			validate_rig_profile(resource, null, semantic_registry)
	elif resource is ForgeSpatialMap:
		resource_diagnostics = ForgeRuntimeAssemblyValidationService.new().\
			validate_spatial_map(resource, semantic_registry)
	elif resource is ForgeEntityAssemblyProfile:
		resource_diagnostics = ForgeRuntimeAssemblyValidationService.new().\
			validate_assembly_profile(resource)
	elif resource is ForgeEntityAnimationLibrary:
		resource_diagnostics = ForgeEntityAnimationValidationService.new().\
			validate_animation_library(resource, semantic_registry)
	elif resource is ForgeRetargetMap:
		resource_diagnostics = ForgeEntityAnimationValidationService.new().\
			validate_retarget_map(resource)
	elif resource is ForgeFootPlacementProfile:
		resource_diagnostics = ForgeEntityAnimationValidationService.new().\
			validate_foot_placement(resource, semantic_registry)
	elif resource is ForgeEquipmentFitProfile:
		resource_diagnostics = ForgeEntityAnimationValidationService.new().\
			validate_equipment_fit(resource, semantic_registry)
	elif resource is ForgeEntityVariantProfile:
		resource_diagnostics = ForgeEntityAnimationValidationService.new().\
			validate_variant(resource)
	elif resource is ForgeGameplayProxyProfile:
		resource_diagnostics = ForgeEntityAnimationValidationService.new().\
			validate_gameplay_proxy(resource)
	for diagnostic in resource_diagnostics:
		foundation_diagnostics.append(diagnostic.to_record())


func _foundation_identity(resource: Resource) -> Dictionary:
	if resource is ForgePresentationDefinition:
		return {"source_id": resource.stable_id,
			"kind": resource.asset_class}
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
	if resource is ForgeBlueprintModuleDefinition:
		return {"source_id": resource.module_id,
			"kind": "blueprint_module_definition"}
	if resource is ForgeBlueprintModuleSet:
		return {"source_id": resource.module_set_id,
			"kind": "blueprint_module_set"}
	if resource is ForgeProceduralStructureRuleSet:
		return {"source_id": resource.rule_set_id,
			"kind": "procedural_structure_rule_set"}
	if resource is ForgeBlueprintStateDefinition:
		return {"source_id": resource.state_id,
			"kind": "blueprint_state_definition"}
	if resource is ForgeBlueprintRuntimeProduct:
		return {"source_id": resource.product_id,
			"kind": "blueprint_runtime_product"}
	if resource is ForgeMaterialDefinition:
		return {"source_id": resource.material_id, "kind": "material_dna"}
	if resource is ForgeRigProfile:
		return {"source_id": resource.rig_profile_id, "kind": "rig_profile"}
	if resource is ForgeSpatialMap:
		return {"source_id": resource.spatial_map_id, "kind": "spatial_map"}
	if resource is ForgeEntityAssemblyProfile:
		return {"source_id": resource.assembly_profile_id,
			"kind": "entity_assembly_profile"}
	if resource is ForgeEntityAnimationLibrary:
		return {"source_id": resource.animation_library_id,
			"kind": "entity_animation_library"}
	if resource is ForgeRetargetMap:
		return {"source_id": resource.retarget_map_id, "kind": "retarget_map"}
	if resource is ForgeFootPlacementProfile:
		return {"source_id": resource.foot_placement_profile_id,
			"kind": "foot_placement_profile"}
	if resource is ForgeEquipmentFitProfile:
		return {"source_id": resource.equipment_profile_id,
			"kind": "equipment_fit_profile"}
	if resource is ForgeEntityVariantProfile:
		return {"source_id": resource.variant_profile_id,
			"kind": "entity_variant_profile"}
	if resource is ForgeGameplayProxyProfile:
		return {"source_id": resource.gameplay_proxy_profile_id,
			"kind": "gameplay_proxy_profile"}
	if resource is ForgePresentationLibraryManifest:
		return {"source_id": resource.library_id,
			"kind": "presentation_library_manifest"}
	return {}


func _validate_foundation_dependencies(
		semantic_registry: ForgeSemanticRegistry) -> void:
	var presentation_records: Array[Dictionary] = []
	for record in foundation_records_by_id.values():
		var contract_version := str(record.get("contract_version", ""))
		if contract_version not in [
				ForgePresentationDefinition.CONTRACT_VERSION,
				ForgeRigProfile.CONTRACT_VERSION,
				ForgeSpatialMap.CONTRACT_VERSION,
				ForgeEntityAssemblyProfile.CONTRACT_VERSION,
				ForgeEntityAnimationLibrary.CONTRACT_VERSION,
				ForgeRetargetMap.CONTRACT_VERSION,
				ForgeFootPlacementProfile.CONTRACT_VERSION,
				ForgeEquipmentFitProfile.CONTRACT_VERSION,
				ForgeEntityVariantProfile.CONTRACT_VERSION,
				ForgeGameplayProxyProfile.CONTRACT_VERSION,
				ForgeBlueprintModuleDefinition.CONTRACT_VERSION,
				ForgeBlueprintModuleSet.CONTRACT_VERSION,
				ForgeBlueprintStateDefinition.CONTRACT_VERSION,
				ForgeBlueprintRuntimeProduct.CONTRACT_VERSION,
				ForgePresentationLibraryManifest.CONTRACT_VERSION]:
			continue
		presentation_records.append(record)
		var source_id := str(record.get("source_id", ""))
		for dependency_id in record.get("dependency_ids", []):
			var dependency := str(dependency_id)
			if not has(dependency) \
					and (semantic_registry == null \
					or not semantic_registry.has(dependency)):
				foundation_diagnostics.append({
					"code": "REG-001" if contract_version == \
						ForgePresentationDefinition.CONTRACT_VERSION else "EFB-DEP-001",
					"severity": "error",
					"target_id": source_id,
					"message": "Presentation dependency is missing: %s" % dependency,
				})
	var graph := ForgeDependencyGraph.new()
	var report := graph.rebuild(presentation_records)
	for cycle in report.get("cycles", []):
		foundation_diagnostics.append({
			"code": "REG-004",
			"severity": "error",
			"target_id": " -> ".join(Array(cycle)),
			"message": "Presentation dependency cycle detected.",
		})


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
	var gameplay_id := ""
	if not resource.gameplay_links.is_empty():
		gameplay_id = str(resource.gameplay_links[0])
	record["gameplay_id"] = gameplay_id
	record["kind"] = "item" if resource.asset_kind == "item_model" else "block"
	var development_only: bool = "development_only" in resource.planning_tags
	record["development_only"] = development_only
	if development_only:
		record["category"] = "Forge / Acceptance Fixtures"
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
