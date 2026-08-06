class_name ForgePresentationWorkspaceService
extends RefCounted
## Read-only shared Forge workspace facade plus explicit non-destructive repairs.

var manifest_service := ForgeProjectManifestService.new()
var semantic_registry := ForgeSemanticRegistry.new()
var asset_index := ForgeAssetIndex.new()
var registry_publisher := ForgeRuntimeRegistryPublisher.new()
var diagnostics: Array[Dictionary] = []


func load_and_validate() -> Dictionary:
	diagnostics.clear()
	var manifest_report := manifest_service.load_and_validate()
	diagnostics.append_array(manifest_report.get("diagnostics", []))
	var semantic_report := semantic_registry.load_and_validate()
	diagnostics.append_array(semantic_report.get("diagnostics", []))
	if manifest_service.manifest == null:
		return _report()
	var index_report := asset_index.load_and_validate(
		manifest_service.manifest.source_roots, semantic_registry)
	diagnostics.append_array(index_report.get("diagnostics", []))
	if not _has_blocking(diagnostics):
		var records := asset_index.filtered_list()
		var known_external := _known_external_ids(records)
		var publication := registry_publisher.load_and_validate(records, 23006, {
			"known_external_ids": known_external, "publish_initial": true})
		diagnostics.append_array(publication.get("diagnostics", []))
	return _report()


func resolve(source_id: String) -> Dictionary:
	return registry_publisher.resolve(source_id)


func has(source_id: String) -> bool:
	return registry_publisher.has(source_id)


func filtered_list(kind := "") -> Array[Dictionary]:
	return registry_publisher.filtered_list(kind)


func source_summary() -> Dictionary:
	var counts := {}
	var status_counts := {}
	for record in asset_index.filtered_list():
		var kind := str(record.get("foundation_kind", "unknown"))
		counts[kind] = int(counts.get(kind, 0)) + 1
		var status := str(record.get("source_status", "unknown"))
		status_counts[status] = int(status_counts.get(status, 0)) + 1
	return {"counts": counts, "status_counts": status_counts,
		"generation": registry_publisher.current_generation(),
		"diagnostics": diagnostics.duplicate(true)}


func inspect_dependencies(source_id: String) -> Dictionary:
	var record := resolve(source_id)
	if record.is_empty():
		return {"ok": false, "source_id": source_id, "dependencies": []}
	var dependencies: Array[Dictionary] = []
	for dependency_value in record.get("dependency_ids", []):
		var dependency_id := str(dependency_value)
		dependencies.append({"source_id": dependency_id,
			"resolved": has(dependency_id) or semantic_registry.has(dependency_id),
			"record": resolve(dependency_id)})
	return {"ok": true, "source_id": source_id,
		"dependencies": dependencies}


func repair_plan(source_id: String) -> Dictionary:
	var record := resolve(source_id)
	var actions: Array[Dictionary] = []
	if record.is_empty():
		actions.append({"action": "restore_or_recreate_source",
			"target_id": source_id, "automatic": false, "destructive": false})
	else:
		for dependency in inspect_dependencies(source_id).dependencies:
			if not bool(dependency.resolved):
				actions.append({"action": "resolve_missing_dependency",
					"target_id": dependency.source_id,
					"automatic": false, "destructive": false})
	return {"ok": true, "source_id": source_id, "actions": actions,
		"applied": false, "non_destructive": true}


func bake_comparison(source_id: String, product_record: Dictionary) -> Dictionary:
	var source := resolve(source_id)
	if source.is_empty():
		return {"ok": false, "source_id": source_id}
	var source_hash := ForgeStableRecord.hash_record(source)
	var product_source_hash := str(product_record.get("source_hash", ""))
	var result := {"ok": true, "source_id": source_id,
		"source_hash": source_hash,
		"product_source_hash": product_source_hash,
		"stale": source_hash != product_source_hash,
		"approval_state": "draft" if source_hash != product_source_hash else "unchanged",
		"manual_approval_required": true}
	result["comparison_hash"] = ForgeStableRecord.hash_record(result)
	return result


func stage_current_sources(allow_contract_changes := false) -> Dictionary:
	var records := asset_index.filtered_list()
	var known_external := _known_external_ids(records)
	return registry_publisher.stage(records, 23006, {
		"known_external_ids": known_external,
		"allow_contract_changes": allow_contract_changes})


func publish_staged() -> Dictionary:
	return registry_publisher.publish_staged()


func rollback_generation() -> Dictionary:
	return registry_publisher.rollback()


func _known_external_ids(records: Array[Dictionary]) -> PackedStringArray:
	var known := {}
	for record in semantic_registry.filtered_list():
		known[str(record.id)] = true
	for record in records:
		var placement: Dictionary = record.get("placement_profile", {})
		var placement_id := str(placement.get("placement_profile_id", ""))
		if not placement_id.is_empty():
			known[placement_id] = true
		var role_set: Dictionary = record.get("material_role_set", {})
		var role_set_id := str(role_set.get("material_role_set_id", ""))
		if not role_set_id.is_empty():
			known[role_set_id] = true
		for dependency_value in record.get("dependency_ids", []):
			var dependency_id := str(dependency_value)
			if dependency_id.begins_with("material.mvp."):
				known[dependency_id] = true
	var result := PackedStringArray()
	var ids := known.keys()
	ids.sort()
	for value in ids:
		result.append(str(value))
	return result


func _report() -> Dictionary:
	return {"ok": not _has_blocking(diagnostics),
		"record_count": asset_index.foundation_records_by_id.size(),
		"generation_id": registry_publisher.current_generation().get(
			"generation_id", ""), "diagnostics": diagnostics.duplicate(true)}


func _has_blocking(items: Array) -> bool:
	for diagnostic in items:
		if str(diagnostic.get("severity", "")) in [
				"error", "blocker", "critical", "critical_release_blocker"]:
			return true
	return false
