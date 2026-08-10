class_name ProductionRegistryKernel
extends RefCounted
## Owner-neutral production registry compiler.
##
## Forge remains the schema and canonical-record authority. This service adds
## deterministic pack resolution and definition ownership for game-wide data.

var _schema_registry := ForgeSchemaRegistry.new()
var _extension_schemas: Dictionary = {}
var _active_generation: Dictionary = {}
var _previous_generation: Dictionary = {}
var _quarantined_definitions: Array[Dictionary] = []


func register_schema(schema_id: String, version: int,
		facet_ids: PackedStringArray = PackedStringArray()) -> Dictionary:
	if not _is_qualified_id(schema_id, "leyforge."):
		return _failure("invalid_schema_id", schema_id)
	if version <= 0:
		return _failure("invalid_schema_version", schema_id)
	if _schema_registry.has(schema_id):
		var built_in := _schema_registry.resolve(schema_id)
		if int(built_in.get("version", 0)) != version:
			return _failure("schema_version_conflict", schema_id)
		return {"ok": true, "duplicate": true, "schema": built_in}
	var facets: Array[String] = []
	for facet_id in facet_ids:
		if not _is_qualified_id(facet_id, "facet."):
			return _failure("invalid_facet_id", facet_id)
		if facet_id not in facets:
			facets.append(facet_id)
	facets.sort()
	var record := {
		"id": schema_id,
		"version": version,
		"domain": "production_extension",
		"facet_ids": facets,
	}
	if _extension_schemas.has(schema_id):
		if ForgeStableRecord.hash_record(_extension_schemas[schema_id]) \
				!= ForgeStableRecord.hash_record(record):
			return _failure("schema_definition_conflict", schema_id)
		return {"ok": true, "duplicate": true,
			"schema": record.duplicate(true)}
	_extension_schemas[schema_id] = record
	return {"ok": true, "duplicate": false, "schema": record.duplicate(true)}


func resolve_schema(schema_id: String) -> Dictionary:
	if _extension_schemas.has(schema_id):
		return (_extension_schemas[schema_id] as Dictionary).duplicate(true)
	return _schema_registry.resolve(schema_id)


func compile_catalogue(pack_records: Array[Dictionary],
		definition_records: Array[Dictionary]) -> Dictionary:
	var diagnostics: Array[Dictionary] = []
	var packs := _index_packs(pack_records, diagnostics)
	var pack_order := _resolve_pack_order(packs, diagnostics)
	var definitions := _index_definitions(definition_records, packs, diagnostics)
	_validate_definition_references(definitions, packs, diagnostics)
	if not diagnostics.is_empty():
		return {"ok": false, "diagnostics": diagnostics}

	var compiled_definitions: Array[Dictionary] = []
	var definition_ids: Array[String] = []
	for definition_id in definitions:
		definition_ids.append(str(definition_id))
	definition_ids.sort()
	for definition_id in definition_ids:
		var source: Dictionary = definitions[definition_id]
		compiled_definitions.append({
			"resource_class": "ProductionCompiledDefinition",
			"qualified_id": definition_id,
			"owner_pack": source.get("owner_pack", ""),
			"schema_id": source.get("schema_id", ""),
			"schema_version": source.get("schema_version", 0),
			"facets": (source.get("facets", {}) as Dictionary).duplicate(true),
			"payload": (source.get("payload", {}) as Dictionary).duplicate(true),
			"references": Array(source.get("references", [])).duplicate(),
			"source_hash": ForgeStableRecord.hash_record(source),
		})

	var locked_packs: Array[Dictionary] = []
	for pack_id in pack_order:
		var pack: Dictionary = packs[pack_id]
		locked_packs.append({
			"pack_id": pack_id,
			"version": pack.get("version", ""),
			"dependencies": Array(pack.get("dependencies", [])).duplicate(),
			"optional": bool(pack.get("optional", false)),
			"source_hash": ForgeStableRecord.hash_record(pack),
		})
	var catalogue_payload := {
		"schema": "leyforge.production.compiled-catalogue",
		"schema_version": 1,
		"pack_order": Array(pack_order),
		"definitions": compiled_definitions,
	}
	var catalogue_hash := ForgeStableRecord.hash_record(catalogue_payload)
	var lockfile := {
		"schema": "leyforge.production.pack-lock",
		"schema_version": 1,
		"packs": locked_packs,
		"catalogue_hash": catalogue_hash,
	}
	lockfile["lock_hash"] = ForgeStableRecord.hash_record(lockfile)
	return {
		"ok": true,
		"diagnostics": diagnostics,
		"pack_order": Array(pack_order),
		"compiled_definitions": compiled_definitions,
		"catalogue_hash": catalogue_hash,
		"lockfile": lockfile,
	}


func activate_compilation(compilation: Dictionary) -> Dictionary:
	if not bool(compilation.get("ok", false)):
		return _failure("compilation_not_accepted", "catalogue")
	if str(compilation.get("catalogue_hash", "")).length() != 64:
		return _failure("invalid_catalogue_hash", "catalogue")
	_previous_generation = _active_generation.duplicate(true)
	_active_generation = {
		"catalogue_hash": compilation.get("catalogue_hash", ""),
		"pack_order": Array(compilation.get("pack_order", [])).duplicate(),
		"compiled_definitions": Array(
			compilation.get("compiled_definitions", [])).duplicate(true),
		"lockfile": (compilation.get("lockfile", {}) as Dictionary).duplicate(true),
	}
	_quarantined_definitions.clear()
	return {"ok": true, "catalogue_hash": _active_generation.catalogue_hash,
		"definition_count": _active_generation.compiled_definitions.size()}


func serialize_state() -> Dictionary:
	return {
		"schema": "leyforge.production.registry-state",
		"schema_version": 1,
		"extension_schemas": _extension_schemas.duplicate(true),
		"active_generation": _active_generation.duplicate(true),
		"previous_generation": _previous_generation.duplicate(true),
		"quarantined_definitions": _quarantined_definitions.duplicate(true),
	}


func restore_state(state: Dictionary,
		available_pack_ids: PackedStringArray = PackedStringArray()) -> Dictionary:
	var migrated_from := -1
	var candidate: Dictionary = ForgeStableRecord.normalise_json_data(
		state.duplicate(true))
	if int(candidate.get("schema_version", -1)) == 0:
		migrated_from = 0
		candidate = {
			"schema": "leyforge.production.registry-state",
			"schema_version": 1,
			"extension_schemas": candidate.get("schemas", {}),
			"active_generation": candidate.get("active", {}),
			"previous_generation": candidate.get("previous", {}),
			"quarantined_definitions": [],
		}
	if candidate.get("schema") != "leyforge.production.registry-state" \
			or int(candidate.get("schema_version", 0)) != 1:
		return _failure("unsupported_registry_state", "registry_state")
	var active: Dictionary = candidate.get("active_generation", {})
	if not active.is_empty() and not _generation_hash_is_valid(active):
		var failure := _failure(
			"registry_state_hash_mismatch", "active_generation")
		failure["expected_hash"] = active.get("catalogue_hash", "")
		failure["actual_hash"] = _generation_hash(active)
		return failure

	var quarantine: Array[Dictionary] = []
	for quarantined_value in candidate.get("quarantined_definitions", []):
		if quarantined_value is Dictionary:
			quarantine.append(
				(quarantined_value as Dictionary).duplicate(true))
	if not available_pack_ids.is_empty() and not active.is_empty():
		var available := {}
		for pack_id in available_pack_ids:
			available[pack_id] = true
		var optional := {}
		for locked_pack in active.get("lockfile", {}).get("packs", []):
			var pack: Dictionary = locked_pack
			var pack_id := str(pack.get("pack_id", ""))
			if available.has(pack_id):
				continue
			if not bool(pack.get("optional", false)):
				return _failure("required_pack_missing", pack_id)
			optional[pack_id] = true
		if not optional.is_empty():
			var retained: Array[Dictionary] = []
			for compiled_value in active.get("compiled_definitions", []):
				var compiled: Dictionary = compiled_value
				if optional.has(str(compiled.get("owner_pack", ""))):
					quarantine.append(compiled.duplicate(true))
				else:
					retained.append(compiled.duplicate(true))
			active["compiled_definitions"] = retained

	_extension_schemas = (candidate.get(
		"extension_schemas", {}) as Dictionary).duplicate(true)
	_active_generation = active.duplicate(true)
	_previous_generation = (candidate.get(
		"previous_generation", {}) as Dictionary).duplicate(true)
	_quarantined_definitions = quarantine
	return {
		"ok": true,
		"migrated_from": migrated_from,
		"quarantined_count": _quarantined_definitions.size(),
		"active_definition_count": Array(_active_generation.get(
			"compiled_definitions", [])).size(),
	}


func rollback() -> Dictionary:
	if _previous_generation.is_empty():
		return _failure("no_previous_generation", "registry_state")
	var replaced := _active_generation
	_active_generation = _previous_generation
	_previous_generation = replaced
	_quarantined_definitions.clear()
	return {"ok": true,
		"catalogue_hash": _active_generation.get("catalogue_hash", "")}


func active_generation() -> Dictionary:
	return _active_generation.duplicate(true)


func quarantined_definitions() -> Array[Dictionary]:
	return _quarantined_definitions.duplicate(true)


func _generation_hash_is_valid(generation: Dictionary) -> bool:
	return _generation_hash(generation) \
		== str(generation.get("catalogue_hash", ""))


func _generation_hash(generation: Dictionary) -> String:
	var payload := {
		"schema": "leyforge.production.compiled-catalogue",
		"schema_version": 1,
		"pack_order": Array(generation.get("pack_order", [])),
		"definitions": Array(generation.get("compiled_definitions", [])),
	}
	return ForgeStableRecord.hash_record(payload)


func _index_packs(records: Array[Dictionary],
		diagnostics: Array[Dictionary]) -> Dictionary:
	var packs := {}
	for source in records:
		var pack: Dictionary = ForgeStableRecord.normalise_json_data(
			source.duplicate(true))
		var pack_id := str(pack.get("pack_id", ""))
		if not _is_qualified_id(pack_id, "pack."):
			_add_diagnostic(diagnostics, "invalid_pack_id", pack_id)
			continue
		if packs.has(pack_id):
			_add_diagnostic(diagnostics, "duplicate_pack", pack_id)
			continue
		if not _is_semver(str(pack.get("version", ""))):
			_add_diagnostic(diagnostics, "invalid_pack_version", pack_id)
		var dependencies: Array[String] = []
		for value in pack.get("dependencies", []):
			var dependency_id := str(value)
			if dependency_id not in dependencies:
				dependencies.append(dependency_id)
		dependencies.sort()
		pack["dependencies"] = dependencies
		packs[pack_id] = pack
	return packs


func _resolve_pack_order(packs: Dictionary,
		diagnostics: Array[Dictionary]) -> Array[String]:
	var graph_records: Array[Dictionary] = []
	for pack_id in packs:
		var pack: Dictionary = packs[pack_id]
		for dependency_id in pack.get("dependencies", []):
			if not packs.has(dependency_id):
				_add_diagnostic(diagnostics, "unresolved_pack_dependency",
					"%s:%s" % [pack_id, dependency_id])
		graph_records.append({
			"source_id": pack_id,
			"dependency_ids": pack.get("dependencies", []),
		})
	var graph := ForgeDependencyGraph.new()
	var graph_report := graph.rebuild(graph_records)
	if not (graph_report.get("cycles", []) as Array).is_empty():
		_add_diagnostic(diagnostics, "pack_dependency_cycle", "packs")

	var remaining := packs.duplicate()
	var resolved := {}
	var order: Array[String] = []
	while not remaining.is_empty():
		var ready: Array[String] = []
		for pack_id in remaining:
			var all_resolved := true
			for dependency_id in (remaining[pack_id] as Dictionary).get(
					"dependencies", []):
				if not resolved.has(dependency_id):
					all_resolved = false
					break
			if all_resolved:
				ready.append(str(pack_id))
		ready.sort()
		if ready.is_empty():
			break
		for pack_id in ready:
			order.append(pack_id)
			resolved[pack_id] = true
			remaining.erase(pack_id)
	return order


func _index_definitions(records: Array[Dictionary], packs: Dictionary,
		diagnostics: Array[Dictionary]) -> Dictionary:
	var definitions := {}
	for source in records:
		var definition: Dictionary = ForgeStableRecord.normalise_json_data(
			source.duplicate(true))
		var definition_id := str(definition.get("qualified_id", ""))
		if not _is_qualified_id(definition_id):
			_add_diagnostic(diagnostics, "invalid_definition_id", definition_id)
			continue
		if definitions.has(definition_id):
			_add_diagnostic(diagnostics, "duplicate_definition_owner", definition_id)
			continue
		var owner_pack := str(definition.get("owner_pack", ""))
		if not packs.has(owner_pack):
			_add_diagnostic(diagnostics, "unknown_definition_owner",
				"%s:%s" % [definition_id, owner_pack])
		var schema_id := str(definition.get("schema_id", ""))
		var schema := resolve_schema(schema_id)
		if schema.is_empty():
			_add_diagnostic(diagnostics, "unknown_schema",
				"%s:%s" % [definition_id, schema_id])
		elif int(definition.get("schema_version", 0)) \
				!= int(schema.get("version", 0)):
			_add_diagnostic(diagnostics, "definition_schema_version_mismatch",
				definition_id)
		var facets: Dictionary = definition.get("facets", {})
		var allowed_facets: Array = schema.get("facet_ids", [])
		for facet_id in facets:
			if not _is_qualified_id(str(facet_id), "facet."):
				_add_diagnostic(diagnostics, "invalid_definition_facet",
					"%s:%s" % [definition_id, facet_id])
			elif not allowed_facets.is_empty() \
					and str(facet_id) not in allowed_facets:
				_add_diagnostic(diagnostics, "undeclared_schema_facet",
					"%s:%s" % [definition_id, facet_id])
		definitions[definition_id] = definition
	return definitions


func _validate_definition_references(definitions: Dictionary, packs: Dictionary,
		diagnostics: Array[Dictionary]) -> void:
	for definition_id in definitions:
		var definition: Dictionary = definitions[definition_id]
		for value in definition.get("references", []):
			var reference_id := str(value)
			if not definitions.has(reference_id):
				_add_diagnostic(diagnostics, "unresolved_definition_reference",
					"%s:%s" % [definition_id, reference_id])
				continue
			var target: Dictionary = definitions[reference_id]
			var source_pack := str(definition.get("owner_pack", ""))
			var target_pack := str(target.get("owner_pack", ""))
			if not _pack_can_reference(source_pack, target_pack, packs):
				_add_diagnostic(diagnostics, "undeclared_cross_pack_reference",
					"%s:%s" % [definition_id, reference_id])


func _pack_can_reference(source_pack: String, target_pack: String,
		packs: Dictionary) -> bool:
	if source_pack == target_pack:
		return true
	var visited := {}
	var pending: Array[String] = [source_pack]
	while not pending.is_empty():
		var current: String = pending.pop_front()
		if visited.has(current) or not packs.has(current):
			continue
		visited[current] = true
		for dependency_value in (packs[current] as Dictionary).get(
				"dependencies", []):
			var dependency_id := str(dependency_value)
			if dependency_id == target_pack:
				return true
			pending.append(dependency_id)
	return false


func _is_qualified_id(value: String, required_prefix := "") -> bool:
	return ForgeId.is_valid(value, required_prefix) and value.contains(".")


func _is_semver(value: String) -> bool:
	var parts := value.split(".")
	if parts.size() != 3:
		return false
	for part in parts:
		if part.is_empty() or not part.is_valid_int() or int(part) < 0:
			return false
	return true


func _failure(code: String, target_id: String) -> Dictionary:
	return {"ok": false, "error": code, "target_id": target_id}


func _add_diagnostic(diagnostics: Array[Dictionary], code: String,
		target_id: String) -> void:
	diagnostics.append({"code": code, "severity": "error",
		"target_id": target_id})
