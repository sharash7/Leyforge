class_name ForgeRuntimeRegistryPublisher
extends RefCounted
## Validates a candidate registry off to the side, then atomically publishes it.

var diagnostics: Array[Dictionary] = []
var _current: ForgeRuntimeRegistryGeneration
var _previous: ForgeRuntimeRegistryGeneration
var _staged: ForgeRuntimeRegistryGeneration
var _records_by_id: Dictionary = {}


func load_and_validate(
		records: Array, deterministic_seed := 0,
		options: Dictionary = {}) -> Dictionary:
	var report := stage(records, deterministic_seed, options)
	if bool(report.get("ok", false)) and _current == null \
			and bool(options.get("publish_initial", true)):
		var publication := publish_staged()
		report["published"] = bool(publication.get("ok", false))
		report["generation_id"] = publication.get(
			"generation_id", report.get("generation_id", ""))
	return report


func stage(
		records: Array, deterministic_seed := 0,
		options: Dictionary = {}) -> Dictionary:
	diagnostics.clear()
	var sorted_records: Array[Dictionary] = []
	for record_value in records:
		if record_value is Dictionary:
			sorted_records.append(record_value.duplicate(true))
	sorted_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return ForgeRuntimeRegistryGeneration._record_id(a) \
			< ForgeRuntimeRegistryGeneration._record_id(b))
	var fingerprint := ForgeStableRecord.hash_record({
		"records": sorted_records, "deterministic_seed": deterministic_seed})
	var generation := ForgeRuntimeRegistryGeneration.new()
	generation.generation_id = "registry.presentation.%s" % fingerprint.substr(0, 24)
	generation.base_generation_id = _current.generation_id if _current != null else ""
	generation.records = sorted_records
	generation.deterministic_seed = deterministic_seed
	generation.aliases = _collect_aliases(sorted_records)
	generation.compatibility_report = _compatibility_report(sorted_records)
	for diagnostic in ForgePresentationProductionValidationService.new().\
			validate_generation(generation):
		diagnostics.append(diagnostic.to_record())
	_validate_schemas(sorted_records)
	_validate_dependencies(sorted_records,
		PackedStringArray(options.get("known_external_ids", PackedStringArray())))
	if not bool(options.get("allow_contract_changes", false)) \
			and not generation.compatibility_report.get("unclassified_changes", []).is_empty():
		diagnostics.append(_diagnostic(
			"MIG-003", "error", generation.generation_id,
			"Runtime registry contains an unclassified contract change."))
	generation.validation_diagnostics = diagnostics.duplicate(true)
	generation.publication_state = "validated" if not _has_blocking(diagnostics) else "rejected"
	_staged = generation
	return {"ok": generation.publication_state == "validated",
		"generation_id": generation.generation_id,
		"generation_hash": generation.canonical_hash(),
		"record_count": generation.records.size(),
		"compatibility": generation.compatibility_report.duplicate(true),
		"diagnostics": diagnostics.duplicate(true)}


func publish_staged() -> Dictionary:
	if _staged == null or _staged.publication_state != "validated" \
			or _has_blocking(_staged.validation_diagnostics):
		return {"ok": false, "diagnostics": [_diagnostic(
			"REG-005", "error", "", "No validated registry generation is staged.")]}
	_previous = _current
	_current = _staged
	_current.publication_state = "published"
	_staged = null
	_rebuild_lookup()
	return {"ok": true, "generation_id": _current.generation_id,
		"generation_hash": _current.canonical_hash(),
		"record_count": _records_by_id.size()}


func rollback() -> Dictionary:
	if _previous == null:
		return {"ok": false, "diagnostics": [_diagnostic(
			"REG-005", "warning", "", "No previous known-good generation exists.")]}
	var replaced := _current
	_current = _previous
	_previous = replaced
	_current.publication_state = "published"
	_rebuild_lookup()
	return {"ok": true, "generation_id": _current.generation_id,
		"generation_hash": _current.canonical_hash(), "rolled_back": true}


func resolve(source_id: String) -> Dictionary:
	if _current == null:
		return {}
	var canonical := ForgeId.canonical_id(source_id, _current.aliases)
	return _records_by_id.get(canonical, {}).duplicate(true)


func has(source_id: String) -> bool:
	return not resolve(source_id).is_empty()


func filtered_list(kind := "") -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for record in _records_by_id.values():
		if kind.is_empty() or str(record.get("foundation_kind",
				record.get("asset_class", ""))) == kind:
			result.append(record.duplicate(true))
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return ForgeRuntimeRegistryGeneration._record_id(a) \
			< ForgeRuntimeRegistryGeneration._record_id(b))
	return result


func current_generation() -> Dictionary:
	return _current.to_record() if _current != null else {}


func staged_generation() -> Dictionary:
	return _staged.to_record() if _staged != null else {}


func _collect_aliases(records: Array[Dictionary]) -> Dictionary:
	var aliases := {}
	for record in records:
		var source_id := ForgeRuntimeRegistryGeneration._record_id(record)
		for alias_value in record.get("aliases", []):
			var alias_id := str(alias_value)
			if aliases.has(alias_id):
				diagnostics.append(_diagnostic(
					"REG-001", "critical", alias_id,
					"Runtime registry alias is duplicated."))
			else:
				aliases[alias_id] = source_id
	return aliases


func _compatibility_report(candidate_records: Array[Dictionary]) -> Dictionary:
	var before := _map_records(_current.records if _current != null else [])
	var after := _map_records(candidate_records)
	var added: Array[String] = []
	var removed: Array[String] = []
	var modified: Array[String] = []
	var unchanged: Array[String] = []
	var contract_changes: Array[Dictionary] = []
	var dependency_changes: Array[Dictionary] = []
	var unclassified: Array[String] = []
	for source_id in after:
		if not before.has(source_id):
			added.append(source_id)
			continue
		var old_record: Dictionary = before[source_id]
		var new_record: Dictionary = after[source_id]
		if ForgeStableRecord.hash_record(old_record) == ForgeStableRecord.hash_record(new_record):
			unchanged.append(source_id)
			continue
		modified.append(source_id)
		var classified := str(new_record.get("replacement_strategy", "")) in [
			"wrap", "convert", "replace", "defer", "preserve"] \
			or not str(new_record.get("migration_record_id", "")).is_empty()
		if str(old_record.get("schema", "")) != str(new_record.get("schema", "")) \
				or str(old_record.get("contract_version", "")) != str(
					new_record.get("contract_version", "")):
			contract_changes.append({"source_id": source_id,
				"from_schema": old_record.get("schema", ""),
				"to_schema": new_record.get("schema", ""),
				"from_contract": old_record.get("contract_version", ""),
				"to_contract": new_record.get("contract_version", ""),
				"classified": classified})
			if not classified:
				unclassified.append(source_id)
		if Array(old_record.get("dependency_ids", [])) != Array(
				new_record.get("dependency_ids", [])):
			dependency_changes.append({"source_id": source_id,
				"from": old_record.get("dependency_ids", []),
				"to": new_record.get("dependency_ids", [])})
	for source_id in before:
		if not after.has(source_id):
			removed.append(source_id)
	for list in [added, removed, modified, unchanged, unclassified]:
		list.sort()
	contract_changes.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.source_id) < str(b.source_id))
	dependency_changes.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.source_id) < str(b.source_id))
	return {"added": added, "removed": removed, "modified": modified,
		"unchanged": unchanged, "contract_changes": contract_changes,
		"dependency_changes": dependency_changes,
		"unclassified_changes": unclassified}


func _validate_schemas(records: Array[Dictionary]) -> void:
	var registry := ForgeSchemaRegistry.new()
	for record in records:
		var schema_id := str(record.get("schema", ""))
		if not schema_id.is_empty() and not registry.has(schema_id):
			diagnostics.append(_diagnostic(
				"REG-002", "error", ForgeRuntimeRegistryGeneration._record_id(record),
				"Runtime registry record uses an unsupported schema."))


func _validate_dependencies(
		records: Array[Dictionary], known_external_ids: PackedStringArray) -> void:
	var ids := _map_records(records)
	var external := {}
	for value in known_external_ids:
		external[value] = true
	for record in records:
		var source_id := ForgeRuntimeRegistryGeneration._record_id(record)
		for dependency_value in record.get("dependency_ids", []):
			var dependency_id := str(dependency_value)
			if not ids.has(dependency_id) and not external.has(dependency_id):
				diagnostics.append(_diagnostic(
					"REG-003", "error", source_id,
					"Runtime registry dependency is missing: %s" % dependency_id))


func _map_records(records: Array) -> Dictionary:
	var result := {}
	for record_value in records:
		if not record_value is Dictionary:
			continue
		var record: Dictionary = record_value
		var source_id := ForgeRuntimeRegistryGeneration._record_id(record)
		if not source_id.is_empty():
			result[source_id] = record.duplicate(true)
	return result


func _rebuild_lookup() -> void:
	_records_by_id = _map_records(_current.records if _current != null else [])


func _has_blocking(items: Array) -> bool:
	for diagnostic in items:
		if str(diagnostic.get("severity", "")) in [
				"error", "blocker", "critical", "critical_release_blocker"]:
			return true
	return false


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
