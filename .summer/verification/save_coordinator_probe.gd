extends Node
## SAVE-001 exhaustive ordered-migration, storage and pack-compatibility probe.

var checks := 0
var failures: Array[String] = []
var coordinator := SaveCoordinator.new()


func _ready() -> void:
	_test_ordered_version_matrix()
	_test_generated_base_delta_contract()
	_test_registry_compatibility()
	_test_restore_and_recovery_order()
	print("SAVE_COORDINATOR_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"migration_steps": SaveCoordinator.MIGRATION_STEPS.size(),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _context() -> Dictionary:
	return {
		"seed_default": 99117,
		"world_id": "world.save.coordinator.probe",
		"world_name": "Coordinator Frontier",
		"seed_original": "Coordinator Seed",
		"world_manifest": {
			"manifest_hash": "1".repeat(64),
			"content_lock": {
				"registry_generation_hash": "2".repeat(64),
			},
		},
		"build": {"probe": true},
		"written_unix": 1786200000,
		"current_pack_ids": [],
		"current_catalogue_hash": "",
		"current_registry_state": {},
	}


func _fixture(version: int) -> Dictionary:
	var result := {
		"version": version,
		"seed": 99117,
		"player_position": [1.5, 9.0, -4.5],
		"player_yaw": 0.25,
		"player_pitch": -0.1,
		"edits": {"1,2,3": "terrain.stone.basic"},
		"sentinel_extension": {"preserved": true},
	}
	if version == 2:
		result["hotbar"] = [{"item_id": "item.resource.log_oak", "count": 3}]
		result["selected_slot"] = 0
	else:
		result["inventory"] = {
			"hotbar": [{"item_id": "item.resource.log_oak", "count": 3}],
			"backpack": [],
			"craft_grid": [],
			"selected_slot": 0,
		}
	if version >= 4:
		result["worldgen"] = {"worldgen_version": 2, "version": 3}
	if version >= 7:
		result["item_drops"] = []
	if version >= 9:
		result["magic_player"] = {"mana": 42.0}
	if version >= 10:
		result["combat"] = {"phase": "dormant"}
	if version >= 12:
		result["ui"] = {"tutorial": "guided"}
	if version >= 13:
		result["save_manifest"] = {
			"format": "leyforge.legacy.save",
			"save_version": version,
		}
	if version >= 15:
		result["world_id"] = "world.save.coordinator.probe"
	if version >= 16:
		result["settlements"] = {}
	if version >= 17:
		result["edit_provenance"] = {"1,2,3": {"source": "probe"}}
	if version == 18:
		result["production_kernel"] = {}
		result["structures"] = {}
		result["registry_state"] = {}
		result["biology"] = {}
	return result


func _test_ordered_version_matrix() -> void:
	var full_plan := coordinator.migration_plan(2)
	_expect(full_plan.size() == 16,
		"v2-to-v18 migration plan contains every version boundary")
	_expect(str(full_plan[0].get("id", "")) == "v02_inventory_envelope" \
			and str(full_plan[-1].get("id", "")) \
			== "v17_canonical_block_projection",
		"migration plan retains named first and final transitions")
	var expected_from := 2
	var chain_valid := true
	for step in full_plan:
		if int(step.get("from", -1)) != expected_from \
				or int(step.get("to", -1)) != expected_from + 1:
			chain_valid = false
		expected_from += 1
	_expect(chain_valid and expected_from == 18,
		"migration plan is contiguous and strictly ordered")

	for version in range(2, 19):
		var source := _fixture(version)
		var prepared := coordinator.prepare_for_load(source, _context())
		_expect(bool(prepared.get("ok", false)),
			"v%d has a supported migration/load path" % version)
		var migrated: Dictionary = prepared.get("data", {})
		_expect(int(migrated.get("version", 0)) == 18,
			"v%d resolves to save v18" % version)
		_expect(migrated.get("sentinel_extension", {}).get(
			"preserved", false),
			"v%d migration preserves extension domains" % version)
		var report_steps: Array = prepared.get("migration_steps", [])
		_expect(report_steps.size() == 18 - version,
			"v%d applies exactly one step per version boundary" % version)
		if version < 18:
			var manifest: Dictionary = migrated.get("save_manifest", {})
			_expect(int(manifest.get("migrated_from", -1)) == version \
					and manifest.get("migration_steps", []) == report_steps,
				"v%d persists its ordered migration evidence" % version)
			_expect(manifest.get("restore_order", []) \
					== coordinator.restore_order(),
				"v%d persists canonical domain restore order" % version)
			_expect(bool(coordinator.validate_storage_contract(
				migrated).get("ok", false)),
				"v%d receives a valid generated-base delta contract" % version)
			_expect(migrated.get("inventory", {}) is Dictionary \
					and migrated.get("item_drops", []) is Array \
					and migrated.get("structures", {}) is Dictionary \
					and migrated.get("simulation_lod", {}) is Dictionary \
					and migrated.get("people", {}) is Dictionary \
					and migrated.get("biology", {}) is Dictionary \
					and migrated.get("social", {}) is Dictionary,
				"v%d normalises every current persistence domain" % version)
		else:
			_expect(bool(coordinator.validate_storage_contract(
				migrated).get("legacy", false)),
				"existing v18 state without the new optional contract remains readable")
			_expect(report_steps.is_empty(),
				"existing v18 state does not run migration steps")
			_expect(migrated == source,
				"existing v18 payload remains byte-model equivalent")

	var migrated_v2: Dictionary = coordinator.prepare_for_load(
		_fixture(2), _context()).get("data", {})
	_expect((migrated_v2.get("inventory", {}) as Dictionary).get(
		"hotbar", []).size() == 1 \
			and not migrated_v2.has("hotbar") \
			and not migrated_v2.has("selected_slot"),
		"v2 raw hotbar is moved into the inventory envelope once")
	_expect(coordinator.prepare_for_load({"version": 1}, _context()).get(
		"error") == "unsupported_save_version",
		"unsupported pre-v2 state is rejected")
	_expect(coordinator.prepare_for_load({"version": 19}, _context()).get(
		"error") == "unsupported_save_version",
		"future save state is rejected")
	var first := coordinator.prepare_for_load(_fixture(6), _context())
	var second := coordinator.prepare_for_load(_fixture(6), _context())
	_expect(first.get("data", {}) == second.get("data", {}),
		"ordered migration is deterministic for a fixed context")


func _test_generated_base_delta_contract() -> void:
	var migrated: Dictionary = coordinator.prepare_for_load(
		_fixture(2), _context()).get("data", {})
	var contract: Dictionary = migrated.get(
		"save_manifest", {}).get("storage_contract", {})
	_expect(str(contract.get("schema", "")) \
			== "leyforge.generated-base-delta" \
			and str(contract.get("mode", "")) \
			== "generated_base_plus_delta",
		"save contract declares generated base plus persistent delta")
	_expect(str(contract.get("base_manifest_hash", "")) == "1".repeat(64) \
			and str(contract.get("registry_generation_hash", "")) \
			== "2".repeat(64),
		"storage contract locks world and registry base generations")
	_expect(int(contract.get("delta_counts", {}).get("edits", -1)) == 1 \
			and str(contract.get("delta_sha256", "")).length() == 64,
		"storage contract counts and hashes persistent deltas")
	var tampered := migrated.duplicate(true)
	tampered["edits"]["4,5,6"] = "terrain.dirt.basic"
	_expect(coordinator.validate_storage_contract(tampered).get(
		"error") == "storage_contract_mismatch",
		"delta mutation is rejected independently of outer save integrity")
	var rejected := coordinator.prepare_for_load(tampered, _context())
	_expect(not bool(rejected.get("ok", true)) \
			and rejected.get("error") == "storage_contract_mismatch",
		"load coordinator blocks mismatched generated-base delta state")


func _test_registry_compatibility() -> void:
	var current := coordinator.evaluate_registry_compatibility(
		ProductionCatalogue.serialize_registry_state(),
		PackedStringArray(ProductionCatalogue.pack_order()),
		ProductionCatalogue.catalogue_hash())
	_expect(bool(current.get("ok", false)) \
			and str(current.get("status", "")) == "exact" \
			and int(current.get("quarantined_count", -1)) == 0,
		"active Core registry generation is exactly compatible")
	var changed := coordinator.evaluate_registry_compatibility(
		ProductionCatalogue.serialize_registry_state(),
		PackedStringArray(ProductionCatalogue.pack_order()),
		"0".repeat(64))
	_expect(bool(changed.get("ok", false)) \
			and str(changed.get("status", "")) == "catalogue_changed",
		"valid older catalogue generation is identified for content migration")
	var fixture := _optional_registry_state()
	_expect(not fixture.is_empty(),
		"optional-pack registry fixture compiles and activates")
	var quarantined := coordinator.evaluate_registry_compatibility(
		fixture, PackedStringArray(["pack.save.required"]))
	_expect(bool(quarantined.get("ok", false)) \
			and int(quarantined.get("quarantined_count", 0)) == 1 \
			and quarantined.get("quarantined_definition_ids", []) \
			== ["save.optional.marker"],
		"missing optional pack definitions are quarantined deterministically")
	var blocked := coordinator.evaluate_registry_compatibility(
		fixture, PackedStringArray(["pack.save.optional"]))
	_expect(not bool(blocked.get("ok", true)) \
			and blocked.get("error") == "required_pack_missing" \
			and blocked.get("target_id") == "pack.save.required",
		"missing required pack blocks save materialisation")
	var corrupted := fixture.duplicate(true)
	corrupted["active_generation"]["compiled_definitions"][0][
		"payload"] = {"tampered": true}
	_expect(coordinator.evaluate_registry_compatibility(
		corrupted, PackedStringArray(["pack.save.required"])).get(
			"error") == "registry_state_hash_mismatch",
		"tampered saved registry generation is rejected")


func _test_restore_and_recovery_order() -> void:
	_expect(coordinator.restore_order() == [
		"production_kernel", "registry_generation", "structure_owner",
		"simulation_lod", "people_owner", "biology_owner", "social_owner",
		"political_owner", "movement_owner", "world_delta",
		"inventory", "progression", "magic",
		"settlements", "combat", "ui", "forge_presentation", "player",
	], "restore order places evidence and owners before dependent views")
	_expect(coordinator.recovery_candidate_roles() \
		== ["final", "previous", "backup", "temporary"],
		"recovery order prefers committed generations before scratch state")
	var copy := coordinator.restore_order()
	copy.clear()
	_expect(coordinator.restore_order().size() == 18,
		"callers cannot mutate the canonical restore order")


func _optional_registry_state() -> Dictionary:
	var kernel := ProductionRegistryKernel.new()
	var registered := kernel.register_schema(
		"leyforge.save.probe", 1, PackedStringArray())
	if not bool(registered.get("ok", false)):
		return {}
	var packs: Array[Dictionary] = [
		{
			"pack_id": "pack.save.optional",
			"version": "1.0.0",
			"dependencies": ["pack.save.required"],
			"optional": true,
		},
		{
			"pack_id": "pack.save.required",
			"version": "1.0.0",
			"dependencies": [],
			"optional": false,
		},
	]
	var definitions: Array[Dictionary] = [
		{
			"qualified_id": "save.optional.marker",
			"owner_pack": "pack.save.optional",
			"schema_id": "leyforge.save.probe",
			"schema_version": 1,
			"facets": {},
			"payload": {"kind": "optional"},
			"references": [],
		},
		{
			"qualified_id": "save.required.marker",
			"owner_pack": "pack.save.required",
			"schema_id": "leyforge.save.probe",
			"schema_version": 1,
			"facets": {},
			"payload": {"kind": "required"},
			"references": [],
		},
	]
	var compiled := kernel.compile_catalogue(packs, definitions)
	if not bool(compiled.get("ok", false)) \
			or not bool(kernel.activate_compilation(compiled).get("ok", false)):
		return {}
	return kernel.serialize_state()


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
