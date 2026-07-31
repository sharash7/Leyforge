class_name ForgeAssetIndex
extends RefCounted
## Rebuildable metadata index. It never becomes canonical asset truth.

const DEFAULT_ASSET_ROOT := "res://content/forge/assets"

var records_by_source_id: Dictionary = {}
var source_paths: Dictionary = {}
var diagnostics: Array[Dictionary] = []
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
