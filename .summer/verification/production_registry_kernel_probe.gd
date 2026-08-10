extends Node
## Focused REG-001 probe for canonical schemas, packs, ownership and compilation.

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	_test_schema_registration()
	_test_deterministic_compilation()
	_test_rejection_contracts()
	_test_representative_round_trip()
	print(JSON.stringify({
		"ok": failures.is_empty(), "checks": checks, "failures": failures,
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_schema_registration() -> void:
	var kernel := ProductionRegistryKernel.new()
	_expect(not kernel.resolve_schema(
		"leyforge.forge.entity-definition").is_empty(),
		"compiler reuses the Forge schema registry")
	var facets := PackedStringArray(["facet.presentation", "facet.gameplay"])
	var registered := kernel.register_schema(
		"leyforge.production.world-object", 1, facets)
	_expect(bool(registered.get("ok", false)),
		"production extension schema registers")
	_expect(not bool(registered.get("duplicate", true)),
		"first schema registration is not a duplicate")
	_expect(kernel.resolve_schema("leyforge.production.world-object").get(
		"facet_ids", []) == ["facet.gameplay", "facet.presentation"],
		"schema facets are canonicalised")
	_expect(bool(kernel.register_schema(
		"leyforge.production.world-object", 1, facets).get("duplicate", false)),
		"identical schema registration is idempotent")
	_expect(kernel.register_schema(
		"leyforge.production.world-object", 2).get("error") \
		== "schema_definition_conflict", "conflicting schema is rejected")
	_expect(kernel.register_schema("World Object", 1).get("error") \
		== "invalid_schema_id", "malformed schema ID is rejected")
	_expect(kernel.register_schema(
		"leyforge.production.invalid", 0).get("error") \
		== "invalid_schema_version", "non-positive schema version is rejected")
	_expect(kernel.register_schema(
		"leyforge.production.invalid", 1,
		PackedStringArray(["presentation"])).get("error") \
		== "invalid_facet_id", "unqualified facet ID is rejected")


func _test_deterministic_compilation() -> void:
	var kernel := _configured_kernel()
	var packs := _valid_packs()
	var definitions := _valid_definitions()
	var compiled := kernel.compile_catalogue(packs, definitions)
	_expect(bool(compiled.get("ok", false)), "valid catalogue compiles")
	_expect(compiled.get("pack_order", []) == ["pack.core", "pack.frontier"],
		"pack dependencies resolve before dependants")
	_expect((compiled.get("compiled_definitions", []) as Array).size() == 2,
		"every definition produces one compiled runtime record")
	var first: Dictionary = compiled.get("compiled_definitions", [])[0]
	_expect(first.get("qualified_id") == "block.core.stone",
		"compiled definitions use qualified-ID order")
	_expect(first.get("resource_class") == "ProductionCompiledDefinition",
		"compiled output declares its Godot runtime resource class")
	_expect(str(first.get("source_hash", "")).length() == 64,
		"compiled definition records their canonical source hashes")
	var lockfile: Dictionary = compiled.get("lockfile", {})
	_expect(lockfile.get("schema") == "leyforge.production.pack-lock",
		"compilation emits a typed pack lockfile")
	_expect((lockfile.get("packs", []) as Array).size() == 2,
		"lockfile captures every resolved pack")
	_expect(str(lockfile.get("lock_hash", "")).length() == 64,
		"lockfile has a canonical SHA-256 digest")

	var reversed_packs := packs.duplicate(true)
	reversed_packs.reverse()
	var reversed_definitions := definitions.duplicate(true)
	reversed_definitions.reverse()
	var repeated := kernel.compile_catalogue(reversed_packs, reversed_definitions)
	_expect(repeated.get("catalogue_hash") == compiled.get("catalogue_hash"),
		"catalogue output is deterministic across source order")
	_expect(repeated.get("lockfile", {}).get("lock_hash") \
		== lockfile.get("lock_hash"),
		"lockfile output is deterministic across source order")


func _test_rejection_contracts() -> void:
	var kernel := _configured_kernel()
	var duplicate_packs := _valid_packs()
	duplicate_packs.append(duplicate_packs[0].duplicate(true))
	_expect(_has_error(kernel.compile_catalogue(
		duplicate_packs, _valid_definitions()), "duplicate_pack"),
		"duplicate pack IDs fail compilation")
	var invalid_pack_version := _valid_packs()
	invalid_pack_version[0]["version"] = "first"
	_expect(_has_error(kernel.compile_catalogue(
		invalid_pack_version, _valid_definitions()), "invalid_pack_version"),
		"invalid pack versions fail compilation")
	var missing_dependency := _valid_packs()
	missing_dependency[0]["dependencies"] = ["pack.missing"]
	_expect(_has_error(kernel.compile_catalogue(
		missing_dependency, _valid_definitions()),
		"unresolved_pack_dependency"),
		"missing pack dependencies fail compilation")
	var cyclic_packs := _valid_packs()
	cyclic_packs[0]["dependencies"] = ["pack.frontier"]
	_expect(_has_error(kernel.compile_catalogue(
		cyclic_packs, _valid_definitions()), "pack_dependency_cycle"),
		"pack dependency cycles fail compilation")
	var duplicate_definitions := _valid_definitions()
	var conflicting_owner: Dictionary = duplicate_definitions[0].duplicate(true)
	conflicting_owner["owner_pack"] = "pack.frontier"
	duplicate_definitions.append(conflicting_owner)
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), duplicate_definitions), "duplicate_definition_owner"),
		"duplicate definition owners fail compilation")
	var unknown_owner := _valid_definitions()
	unknown_owner[0]["owner_pack"] = "pack.missing"
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), unknown_owner), "unknown_definition_owner"),
		"unknown definition owners fail compilation")
	var unknown_schema := _valid_definitions()
	unknown_schema[0]["schema_id"] = "leyforge.production.missing"
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), unknown_schema), "unknown_schema"),
		"unknown schemas fail compilation")
	var wrong_schema_version := _valid_definitions()
	wrong_schema_version[0]["schema_version"] = 2
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), wrong_schema_version),
		"definition_schema_version_mismatch"),
		"schema version mismatches fail compilation")
	var missing_reference := _valid_definitions()
	missing_reference[1]["references"] = ["block.core.missing"]
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), missing_reference),
		"unresolved_definition_reference"),
		"unresolved definition references fail compilation")
	var invalid_definition := _valid_definitions()
	invalid_definition[0]["qualified_id"] = "STONE BLOCK"
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), invalid_definition), "invalid_definition_id"),
		"malformed definition IDs fail compilation")
	var invalid_facet := _valid_definitions()
	invalid_facet[0]["facets"] = {"gameplay": {}}
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), invalid_facet), "invalid_definition_facet"),
		"unqualified definition facets fail compilation")
	var undeclared_facet := _valid_definitions()
	undeclared_facet[0]["facets"] = {"facet.unknown": {}}
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), undeclared_facet), "undeclared_schema_facet"),
		"facets not admitted by their schema fail compilation")
	var undeclared_pack_reference := _valid_definitions()
	undeclared_pack_reference[1]["references"] = ["object.frontier.marker"]
	_expect(_has_error(kernel.compile_catalogue(
		_valid_packs(), undeclared_pack_reference),
		"undeclared_cross_pack_reference"),
		"cross-pack references require a declared dependency path")


func _test_representative_round_trip() -> void:
	var fixture := _load_fixture()
	_expect(not fixture.is_empty(), "representative registry fixture loads")
	var kernel := ProductionRegistryKernel.new()
	for schema_value in fixture.get("schemas", []):
		var schema: Dictionary = schema_value
		var facet_ids := PackedStringArray(schema.get("facet_ids", []))
		_expect(bool(kernel.register_schema(str(schema.get("id", "")),
			int(schema.get("version", 0)), facet_ids).get("ok", false)),
			"fixture schema registers: %s" % schema.get("id", ""))
	var compiled := kernel.compile_catalogue(
		_typed_dictionary_array(fixture.get("packs", [])),
		_typed_dictionary_array(fixture.get("definitions", [])))
	_expect(bool(compiled.get("ok", false)),
		"representative Block-to-UI fixture compiles")
	_expect(compiled.get("pack_order", []) == ["pack.core", "pack.ui.frontier"],
		"optional UI pack resolves after its Block provider")
	var ui_definition: Dictionary = _compiled_definition(
		compiled, "ui.inventory.stone_tile")
	_expect(ui_definition.get("references", []) == ["block.core.stone"],
		"compiled UI binding retains its canonical Block reference")
	_expect(bool(kernel.activate_compilation(compiled).get("ok", false)),
		"compiled fixture activates as a registry generation")
	var first_hash := str(compiled.get("catalogue_hash", ""))
	var saved := kernel.serialize_state()
	var encoded := JSON.stringify(saved)
	var decoded = JSON.parse_string(encoded)
	var restored := ProductionRegistryKernel.new()
	var restore_report := restored.restore_state(decoded)
	_expect(bool(restore_report.get("ok", false)),
		"registry generation restores from JSON save data: %s" % restore_report)
	_expect(restored.active_generation().get("catalogue_hash") == first_hash,
		"registry save round-trip is lossless")

	var without_optional := ProductionRegistryKernel.new()
	var quarantine_report := without_optional.restore_state(
		decoded, PackedStringArray(["pack.core"]))
	_expect(bool(quarantine_report.get("ok", false)),
		"missing optional pack does not invalidate the save: %s" \
		% quarantine_report)
	_expect(int(quarantine_report.get("quarantined_count", 0)) == 1,
		"missing optional pack definition is quarantined")
	var quarantined := without_optional.quarantined_definitions()
	_expect(not quarantined.is_empty() and quarantined[0].get(
		"qualified_id") == "ui.inventory.stone_tile",
		"quarantine preserves the optional UI definition losslessly")
	var missing_required := ProductionRegistryKernel.new().restore_state(
		decoded, PackedStringArray(["pack.ui.frontier"]))
	_expect(missing_required.get("error") == "required_pack_missing",
		"missing required pack blocks restore")

	var legacy_state := {
		"schema_version": 0,
		"schemas": saved.get("extension_schemas", {}),
		"active": saved.get("active_generation", {}),
		"previous": {},
	}
	var migrated := ProductionRegistryKernel.new()
	var migration_report := migrated.restore_state(legacy_state)
	_expect(bool(migration_report.get("ok", false)),
		"legacy registry state migrates")
	_expect(int(migration_report.get("migrated_from", -1)) == 0,
		"registry migration reports its source version")
	_expect(migrated.active_generation().get("catalogue_hash") == first_hash,
		"registry migration preserves the active catalogue")

	var changed_definitions := _typed_dictionary_array(
		fixture.get("definitions", [])).duplicate(true)
	changed_definitions[0]["payload"]["hardness"] = 4
	var changed := kernel.compile_catalogue(
		_typed_dictionary_array(fixture.get("packs", [])), changed_definitions)
	_expect(changed.get("catalogue_hash") != first_hash,
		"changed canonical source produces a new catalogue generation")
	_expect(bool(kernel.activate_compilation(changed).get("ok", false)),
		"replacement catalogue generation activates")
	_expect(bool(kernel.rollback().get("ok", false)),
		"registry generation rolls back")
	_expect(kernel.active_generation().get("catalogue_hash") == first_hash,
		"rollback restores the exact prior catalogue")
	_expect(ForgeStableRecord.hash_record(kernel.active_generation()) \
		== ForgeStableRecord.hash_record(saved.get("active_generation", {})),
		"rollback is lossless at the record boundary")


func _configured_kernel() -> ProductionRegistryKernel:
	var kernel := ProductionRegistryKernel.new()
	kernel.register_schema("leyforge.production.world-object", 1,
		PackedStringArray(["facet.gameplay", "facet.presentation"]))
	return kernel


func _valid_packs() -> Array[Dictionary]:
	return [
		{"pack_id": "pack.frontier", "version": "1.0.0",
			"dependencies": ["pack.core"]},
		{"pack_id": "pack.core", "version": "1.0.0", "dependencies": []},
	]


func _valid_definitions() -> Array[Dictionary]:
	return [
		{
			"qualified_id": "object.frontier.marker",
			"owner_pack": "pack.frontier",
			"schema_id": "leyforge.production.world-object",
			"schema_version": 1,
			"facets": {"facet.presentation": {"label": "Frontier Marker"}},
			"payload": {"kind": "marker"},
			"references": ["block.core.stone"],
		},
		{
			"qualified_id": "block.core.stone",
			"owner_pack": "pack.core",
			"schema_id": "leyforge.production.world-object",
			"schema_version": 1,
			"facets": {"facet.gameplay": {"solid": true}},
			"payload": {"hardness": 3},
			"references": [],
		},
	]


func _has_error(report: Dictionary, code: String) -> bool:
	for diagnostic in report.get("diagnostics", []):
		if str((diagnostic as Dictionary).get("code", "")) == code:
			return true
	return false


func _load_fixture() -> Dictionary:
	var file := FileAccess.open(
		"res://.summer/verification/production_registry_vertical_fixture.json",
		FileAccess.READ)
	if file == null:
		return {}
	var parsed = JSON.parse_string(file.get_as_text())
	return parsed if parsed is Dictionary else {}


func _typed_dictionary_array(values: Array) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for value in values:
		if value is Dictionary:
			result.append((value as Dictionary).duplicate(true))
	return result


func _compiled_definition(report: Dictionary, qualified_id: String) -> Dictionary:
	for value in report.get("compiled_definitions", []):
		var definition: Dictionary = value
		if definition.get("qualified_id") == qualified_id:
			return definition
	return {}


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
