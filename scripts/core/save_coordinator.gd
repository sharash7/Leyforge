class_name SaveCoordinator
extends RefCounted
## SAVE-001 domain coordinator.
##
## File rotation remains in the main scene because it owns the selected-world
## paths. This service owns the version-to-version migration ledger, generated
## base plus delta contract, registry-pack compatibility and restore ordering.

const CURRENT_VERSION := 18
const SAVE_FORMAT := "leyforge.world.save"
const STORAGE_SCHEMA := "leyforge.generated-base-delta"
const STORAGE_VERSION := 1

const MIGRATION_STEPS: Array[Dictionary] = [
	{"from": 2, "to": 3, "id": "v02_inventory_envelope"},
	{"from": 3, "to": 4, "id": "v03_stable_content_worldgen"},
	{"from": 4, "to": 5, "id": "v04_progression_state"},
	{"from": 5, "to": 6, "id": "v05_functional_block_state"},
	{"from": 6, "to": 7, "id": "v06_physical_item_drops"},
	{"from": 7, "to": 8, "id": "v07_automation_state"},
	{"from": 8, "to": 9, "id": "v08_magic_state"},
	{"from": 9, "to": 10, "id": "v09_combat_state"},
	{"from": 10, "to": 11, "id": "v10_ability_orientation_camp"},
	{"from": 11, "to": 12, "id": "v11_ui_learning_profile_split"},
	{"from": 12, "to": 13, "id": "v12_integrity_manifest"},
	{"from": 13, "to": 14, "id": "v13_canonical_settlement_projects"},
	{"from": 14, "to": 15, "id": "v14_per_world_identity"},
	{"from": 15, "to": 16, "id": "v15_regional_settlement_collection"},
	{"from": 16, "to": 17, "id": "v16_living_settlement_delta"},
	{"from": 17, "to": 18, "id": "v17_canonical_block_projection"},
]

const RESTORE_ORDER: Array[String] = [
	"production_kernel",
	"registry_generation",
	"structure_owner",
	"simulation_lod",
	"people_owner",
	"biology_owner",
	"social_owner",
	"political_owner",
	"movement_owner",
	"event_owner",
	"world_delta",
	"inventory",
	"progression",
	"magic",
	"settlements",
	"combat",
	"ui",
	"forge_presentation",
	"player",
]

const RECOVERY_CANDIDATE_ROLES: Array[String] = [
	"final", "previous", "backup", "temporary",
]

var _last_report: Dictionary = {}


func last_report() -> Dictionary:
	return _last_report.duplicate(true)


func restore_order() -> Array[String]:
	return RESTORE_ORDER.duplicate()


func recovery_candidate_roles() -> Array[String]:
	return RECOVERY_CANDIDATE_ROLES.duplicate()


func migration_plan(from_version: int,
		to_version: int = CURRENT_VERSION) -> Array[Dictionary]:
	if from_version < 2 or to_version > CURRENT_VERSION \
			or from_version > to_version:
		return []
	var plan: Array[Dictionary] = []
	var expected := from_version
	for step in MIGRATION_STEPS:
		if int(step.get("from", -1)) < from_version:
			continue
		if int(step.get("from", -1)) >= to_version:
			break
		if int(step.get("from", -1)) != expected:
			return []
		plan.append(step.duplicate(true))
		expected = int(step.get("to", -1))
	return plan if expected == to_version else []


func prepare_for_load(source: Dictionary, context: Dictionary) -> Dictionary:
	var from_version := int(source.get("version", 0))
	if from_version < 2 or from_version > CURRENT_VERSION:
		_last_report = {
			"ok": false,
			"error": "unsupported_save_version",
			"from_version": from_version,
		}
		return _last_report.duplicate(true)
	var working := source.duplicate(true)
	var applied_steps: Array[String] = []
	if from_version < CURRENT_VERSION:
		working.erase("integrity")
		var plan := migration_plan(from_version)
		if plan.is_empty():
			_last_report = {
				"ok": false,
				"error": "migration_path_missing",
				"from_version": from_version,
			}
			return _last_report.duplicate(true)
		for step in plan:
			working = _apply_migration_step(working, step, context)
			if int(working.get("version", -1)) != int(step.get("to", -1)):
				_last_report = {
					"ok": false,
					"error": "migration_step_failed",
					"step_id": str(step.get("id", "")),
				}
				return _last_report.duplicate(true)
			applied_steps.append(str(step.get("id", "")))
		working = _normalise_current_state(
			working, context, from_version, applied_steps)

	var storage_report := validate_storage_contract(working)
	if not bool(storage_report.get("ok", false)):
		_last_report = {
			"ok": false,
			"error": storage_report.get("error", "storage_contract_invalid"),
			"from_version": from_version,
			"migration_steps": applied_steps,
			"storage": storage_report,
		}
		return _last_report.duplicate(true)
	var registry_report := evaluate_registry_compatibility(
		working.get("registry_state", {}),
		PackedStringArray(context.get("current_pack_ids", [])),
		str(context.get("current_catalogue_hash", "")))
	if not bool(registry_report.get("ok", false)):
		_last_report = {
			"ok": false,
			"error": registry_report.get("error", "registry_incompatible"),
			"target_id": registry_report.get("target_id", ""),
			"from_version": from_version,
			"migration_steps": applied_steps,
			"registry": registry_report,
		}
		return _last_report.duplicate(true)
	_last_report = {
		"ok": true,
		"from_version": from_version,
		"to_version": CURRENT_VERSION,
		"migration_steps": applied_steps,
		"restore_order": restore_order(),
		"storage": storage_report,
		"registry": registry_report,
	}
	var response := _last_report.duplicate(true)
	response["data"] = working
	return response


func make_storage_contract(data: Dictionary) -> Dictionary:
	var world_manifest: Dictionary = data.get("world_manifest", {})
	var delta := _delta_payload(data)
	return {
		"schema": STORAGE_SCHEMA,
		"schema_version": STORAGE_VERSION,
		"mode": "generated_base_plus_delta",
		"base_manifest_hash": str(world_manifest.get("manifest_hash", "")),
		"registry_generation_hash": str(
			(world_manifest.get("content_lock", {}) as Dictionary).get(
				"registry_generation_hash", "")),
		"delta_domains": [
			"edits", "edit_provenance", "block_entities", "item_drops",
		],
		"delta_counts": {
			"edits": (data.get("edits", {}) as Dictionary).size(),
			"edit_provenance": (
				data.get("edit_provenance", {}) as Dictionary).size(),
			"block_entities": (
				data.get("block_entities", {}) as Dictionary).size(),
			"item_drops": (data.get("item_drops", []) as Array).size(),
		},
		"delta_sha256": _hash_value(delta),
	}


func validate_storage_contract(data: Dictionary) -> Dictionary:
	var manifest: Dictionary = data.get("save_manifest", {})
	var contract_value: Variant = manifest.get("storage_contract", {})
	if not (contract_value is Dictionary) or contract_value.is_empty():
		return {"ok": true, "legacy": true,
			"status": "legacy_without_storage_contract"}
	var contract: Dictionary = contract_value
	if str(contract.get("schema", "")) != STORAGE_SCHEMA \
			or int(contract.get("schema_version", 0)) != STORAGE_VERSION \
			or str(contract.get("mode", "")) != "generated_base_plus_delta":
		return {"ok": false, "error": "unsupported_storage_contract"}
	var expected := make_storage_contract(data)
	for field in [
		"base_manifest_hash", "registry_generation_hash", "delta_domains",
		"delta_counts", "delta_sha256",
	]:
		# JSON restores every number as a floating-point value. Compare the
		# canonical JSON model so an integer count written as `1` remains equal
		# to the persisted `1.0`, while genuine count or hash changes still fail.
		if _canonical_json(contract.get(field)) \
				!= _canonical_json(expected.get(field)):
			return {
				"ok": false,
				"error": "storage_contract_mismatch",
				"field": field,
			}
	return {
		"ok": true,
		"legacy": false,
		"status": "generated_base_plus_delta",
		"delta_sha256": str(contract.get("delta_sha256", "")),
	}


func evaluate_registry_compatibility(saved_state: Variant,
		available_pack_ids: PackedStringArray,
		current_catalogue_hash: String = "") -> Dictionary:
	if not (saved_state is Dictionary) or saved_state.is_empty():
		return {
			"ok": true,
			"status": "legacy_without_registry_generation",
			"quarantined_count": 0,
			"quarantined_definition_ids": [],
		}
	var kernel := ProductionRegistryKernel.new()
	var restored := kernel.restore_state(saved_state, available_pack_ids)
	if not bool(restored.get("ok", false)):
		return restored
	var active := kernel.active_generation()
	var saved_hash := str(active.get("catalogue_hash", ""))
	var quarantined_ids: Array[String] = []
	for definition in kernel.quarantined_definitions():
		quarantined_ids.append(str(definition.get("qualified_id", "")))
	quarantined_ids.sort()
	return {
		"ok": true,
		"status": (
			"exact"
			if current_catalogue_hash.is_empty() \
				or saved_hash == current_catalogue_hash
			else "catalogue_changed"),
		"saved_catalogue_hash": saved_hash,
		"current_catalogue_hash": current_catalogue_hash,
		"quarantined_count": quarantined_ids.size(),
		"quarantined_definition_ids": quarantined_ids,
		"active_definition_count": int(restored.get(
			"active_definition_count", 0)),
	}


func _apply_migration_step(data: Dictionary, step: Dictionary,
		context: Dictionary) -> Dictionary:
	var result := data.duplicate(true)
	var to_version := int(step.get("to", -1))
	match to_version:
		3:
			if not (result.get("inventory", {}) is Dictionary) \
					or (result.get("inventory", {}) as Dictionary).is_empty():
				result["inventory"] = {
					"hotbar": result.get("hotbar", []),
					"backpack": [],
					"craft_grid": [],
					"selected_slot": int(result.get("selected_slot", 0)),
				}
			result.erase("hotbar")
			result.erase("selected_slot")
		4:
			_ensure_dictionary(result, "worldgen")
		5:
			_ensure_dictionary(result, "progression")
		6:
			_ensure_dictionary(result, "block_entities")
		7:
			_ensure_array(result, "item_drops")
		8:
			_ensure_dictionary(result, "block_entities")
		9:
			_ensure_dictionary(result, "magic_player")
		10:
			_ensure_dictionary(result, "combat")
		11:
			_ensure_dictionary(result, "combat")
		12:
			_ensure_dictionary(result, "ui")
		13:
			_ensure_dictionary(result, "save_manifest")
		14:
			_ensure_dictionary(result, "hamlet")
		15:
			if str(result.get("world_id", "")).is_empty():
				result["world_id"] = str(context.get("world_id", ""))
		16:
			_ensure_dictionary(result, "settlements")
		17:
			_ensure_dictionary(result, "edit_provenance")
			_ensure_dictionary(result, "forge_presentation")
		18:
			_ensure_dictionary(result, "production_kernel")
			_ensure_dictionary(result, "structures")
			_ensure_dictionary(result, "simulation_lod")
			_ensure_dictionary(result, "people")
			_ensure_dictionary(result, "biology")
			_ensure_dictionary(result, "social")
			_ensure_dictionary(result, "political")
			_ensure_dictionary(result, "movement")
			_ensure_dictionary(result, "events")
			_ensure_dictionary(result, "registry_state")
			_ensure_dictionary(result, "world_manifest")
	result["version"] = to_version
	return result


func _normalise_current_state(data: Dictionary, context: Dictionary,
		from_version: int, applied_steps: Array[String]) -> Dictionary:
	var result := data.duplicate(true)
	result["version"] = CURRENT_VERSION
	if not result.has("seed"):
		result["seed"] = int(context.get("seed_default", 0))
	for field in [
		"inventory", "edits", "edit_provenance", "block_entities",
		"progression", "magic_player", "settlements", "hamlet", "combat",
		"production_kernel", "structures", "simulation_lod", "people", "biology",
		"social", "political", "movement", "events",
		"registry_state", "ui",
		"forge_presentation", "worldgen", "world_manifest",
	]:
		_ensure_dictionary(result, field)
	for field in ["player_position", "item_drops"]:
		_ensure_array(result, field)
	if not result.has("player_yaw"):
		result["player_yaw"] = 0.0
	if not result.has("player_pitch"):
		result["player_pitch"] = 0.0
	if str(result.get("world_id", "")).is_empty():
		result["world_id"] = str(context.get("world_id", ""))
	if (result.get("world_manifest", {}) as Dictionary).is_empty() \
			and context.get("world_manifest", {}) is Dictionary:
		result["world_manifest"] = (
			context.get("world_manifest", {}) as Dictionary).duplicate(true)
	if (result.get("registry_state", {}) as Dictionary).is_empty() \
			and context.get("current_registry_state", {}) is Dictionary:
		result["registry_state"] = (
			context.get("current_registry_state", {}) as Dictionary).duplicate(true)
	var manifest: Dictionary = result.get("save_manifest", {}).duplicate(true)
	manifest["format"] = SAVE_FORMAT
	manifest["save_version"] = CURRENT_VERSION
	manifest["written_unix"] = int(context.get(
		"written_unix", Time.get_unix_time_from_system()))
	manifest["build"] = (context.get("build", {}) as Dictionary).duplicate(true)
	manifest["migrated_from"] = from_version
	manifest["migration_steps"] = applied_steps.duplicate()
	manifest["restore_order"] = restore_order()
	manifest["world_id"] = str(result.get("world_id", ""))
	manifest["world_name"] = str(context.get("world_name", "Legacy World"))
	manifest["seed_original"] = str(context.get(
		"seed_original", result.get("seed", "")))
	manifest["resolved_seed"] = int(result.get("seed", 0))
	result["save_manifest"] = manifest
	manifest["storage_contract"] = make_storage_contract(result)
	result["save_manifest"] = manifest
	return result


func _delta_payload(data: Dictionary) -> Dictionary:
	return {
		"edits": (data.get("edits", {}) as Dictionary).duplicate(true),
		"edit_provenance": (
			data.get("edit_provenance", {}) as Dictionary).duplicate(true),
		"block_entities": (
			data.get("block_entities", {}) as Dictionary).duplicate(true),
		"item_drops": (data.get("item_drops", []) as Array).duplicate(true),
	}


func _ensure_dictionary(data: Dictionary, field: String) -> void:
	if not (data.get(field, {}) is Dictionary):
		data[field] = {}
	elif not data.has(field):
		data[field] = {}


func _ensure_array(data: Dictionary, field: String) -> void:
	if not (data.get(field, []) is Array):
		data[field] = []
	elif not data.has(field):
		data[field] = []


func _hash_value(value: Variant) -> String:
	var normalised: Variant = JSON.parse_string(JSON.stringify(value))
	var text := _canonical_json(normalised if normalised != null else value)
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(text.to_utf8_buffer())
	return context.finish().hex_encode()


func _canonical_json(value: Variant) -> String:
	if value is Dictionary:
		var dictionary: Dictionary = value
		var keys: Array = dictionary.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str(a) < str(b))
		var entries: Array[String] = []
		for key in keys:
			entries.append("%s:%s" % [
				JSON.stringify(str(key)), _canonical_json(dictionary[key])])
		return "{%s}" % ",".join(entries)
	if value is Array:
		var entries: Array[String] = []
		for entry in value:
			entries.append(_canonical_json(entry))
		return "[%s]" % ",".join(entries)
	if value is int or value is float:
		return String.num(float(value), 15)
	return JSON.stringify(value)
