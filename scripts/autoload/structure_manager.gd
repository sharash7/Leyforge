extends Node
## Canonical owner for persistent physical structures.
##
## Construction, world generation and migration may hand an already-created
## structure to this owner. Combat and settlement simulation may only request
## consequences against an existing StructureInstance; they cannot create or
## replace physical structure truth.

signal structures_changed
signal structure_changed(instance_id: String)

const STATE_VERSION := 1
const RECORD_TYPE := "StructureInstance"
const STATE_SCHEMA := "leyforge.structure-state"
const EVIDENCE_OWNER := "structure"
const VALID_LIFECYCLE_STATES: Array[String] = [
	"complete", "damaged", "destroyed",
]
const VALID_LOD_MODES: Array[String] = ["local", "regional", "dormant"]
const MAX_HISTORY := 256

var initialized := false
var world_seed := 0
var world_id := ""
var _structures: Dictionary = {}


func reset() -> void:
	initialized = false
	world_seed = 0
	world_id = ""
	_structures.clear()


func initialize(seed_value: int, requested_world_id: String = "") -> void:
	if initialized and world_seed == seed_value \
			and (requested_world_id.is_empty() or world_id == requested_world_id):
		return
	reset()
	initialized = true
	world_seed = seed_value
	world_id = requested_world_id


func structure_ids() -> Array[String]:
	var result: Array[String] = []
	for instance_value in _structures.keys():
		result.append(str(instance_value))
	result.sort()
	return result


func structure_count() -> int:
	return _structures.size()


func has_structure(instance_id: String) -> bool:
	return _structures.has(instance_id)


func get_structure(instance_id: String) -> Dictionary:
	return (_structures.get(instance_id, {}) as Dictionary).duplicate(true)


func structure_instance_id_for_project(project_instance_id: String) -> String:
	if project_instance_id.is_empty():
		return ""
	if project_instance_id.begins_with("project_instance."):
		return "building_instance.%s" % project_instance_id.trim_prefix(
			"project_instance.")
	return "structure_instance.%s" % project_instance_id


func seeded_structure_instance_id(
		settlement_id: String, anchor_id: String) -> String:
	if settlement_id.is_empty() or anchor_id.is_empty():
		return ""
	return "structure_instance.%s.%s" % [settlement_id, anchor_id]


func handoff_completed_project(
		project_record: Dictionary, context: Dictionary = {}) -> Dictionary:
	## The ConstructionProject owner calls this once visible construction is
	## complete. Repeated identical handoffs are idempotent and never reset
	## damage accumulated after activation.
	if not bool(project_record.get("complete", false)):
		return {"ok": false, "error": "project_not_complete"}
	var project_instance_id := str(project_record.get("instance_id", ""))
	var instance_id := str(context.get(
		"structure_instance_id",
		structure_instance_id_for_project(project_instance_id)))
	var definition_id := str(project_record.get("building_definition_id", ""))
	var settlement_id := str(context.get(
		"settlement_id", project_record.get("owner_id", "")))
	if instance_id.is_empty() or project_instance_id.is_empty() \
			or definition_id.is_empty() or settlement_id.is_empty():
		return {"ok": false, "error": "construction_identity_required"}
	_ensure_initialized(context)
	var identity := {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"blueprint_id": str(project_record.get("blueprint_id", "")),
		"owner_id": str(project_record.get("owner_id", settlement_id)),
		"settlement_id": settlement_id,
		"source_kind": "construction",
		"source_project_id": project_instance_id,
		"anchor_id": str(context.get("anchor_id", "")),
		"position": _normalise_position(project_record.get("position", [])),
	}
	if _structures.has(instance_id):
		return _idempotent_handoff(instance_id, identity)
	var payload := identity.duplicate(true)
	payload["world_seed"] = world_seed
	payload["world_id"] = world_id
	payload["project_definition_id"] = str(project_record.get(
		"definition_id", project_record.get("id", "")))
	payload["completion_day"] = int(context.get("day", 0))
	payload["completion_minute"] = float(context.get("clock_minutes", 0.0))
	var evidence_id := "evidence.%s.construction_complete" % instance_id
	var evidence := _commit_evidence(
		evidence_id, "structure_construction_completed", payload,
		project_instance_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var event := _event_record(
		"construction_complete", project_instance_id, 0.0, 1.0, 1.0,
		evidence_id, "construction", context)
	var record := _new_record(identity, 1.0, evidence_id, event)
	_store_new_structure(record)
	return {
		"ok": true,
		"duplicate": false,
		"structure": record.duplicate(true),
		"evidence_id": evidence_id,
	}


func register_seeded_structure(definition: Dictionary) -> Dictionary:
	## World/settlement assembly uses this boundary for structures that already
	## exist in the generated base. Combat deliberately has no equivalent API.
	var settlement_id := str(definition.get("settlement_id", ""))
	var anchor_id := str(definition.get("anchor_id", ""))
	var instance_id := str(definition.get(
		"instance_id", seeded_structure_instance_id(settlement_id, anchor_id)))
	var definition_id := str(definition.get("definition_id", ""))
	if instance_id.is_empty() or settlement_id.is_empty() \
			or anchor_id.is_empty() or definition_id.is_empty():
		return {"ok": false, "error": "generated_structure_identity_required"}
	_ensure_initialized(definition)
	var identity := {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"blueprint_id": str(definition.get("blueprint_id", "")),
		"owner_id": str(definition.get("owner_id", settlement_id)),
		"settlement_id": settlement_id,
		"source_kind": "worldgen",
		"source_project_id": "",
		"anchor_id": anchor_id,
		"position": _normalise_position(definition.get("position", [])),
	}
	if _structures.has(instance_id):
		return _idempotent_handoff(instance_id, identity)
	var condition := clampf(float(definition.get("condition", 1.0)), 0.0, 1.0)
	var payload := identity.duplicate(true)
	payload["world_seed"] = world_seed
	payload["world_id"] = world_id
	payload["generation_evidence"] = str(definition.get(
		"generation_evidence", ""))
	var evidence_id := "evidence.%s.generated" % instance_id
	var evidence := _commit_evidence(
		evidence_id, "structure_generated", payload,
		str(definition.get("generation_evidence", anchor_id)))
	if not bool(evidence.get("ok", false)):
		return evidence
	var event := _event_record(
		"generated", anchor_id, 0.0, condition, condition, evidence_id,
		"worldgen", definition)
	var record := _new_record(identity, condition, evidence_id, event)
	_store_new_structure(record)
	return {
		"ok": true,
		"duplicate": false,
		"structure": record.duplicate(true),
		"evidence_id": evidence_id,
	}


func adopt_legacy_building(
		building_record: Dictionary, context: Dictionary = {}) -> Dictionary:
	## Supported saves before STR-001 contain settlement building projections
	## but no StructureInstance domain. Migration may adopt those projections;
	## ordinary gameplay cannot call this as a creation path.
	var instance_id := str(building_record.get("instance_id", ""))
	var definition_id := str(building_record.get("definition_id", ""))
	var settlement_id := str(context.get(
		"settlement_id", building_record.get("owner_id", "")))
	if instance_id.is_empty() or definition_id.is_empty() \
			or settlement_id.is_empty():
		return {"ok": false, "error": "legacy_structure_identity_required"}
	_ensure_initialized(context)
	var identity := {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"blueprint_id": str(building_record.get("blueprint_id", "")),
		"owner_id": str(building_record.get("owner_id", settlement_id)),
		"settlement_id": settlement_id,
		"source_kind": "migration",
		"source_project_id": str(context.get("source_project_id", "")),
		"anchor_id": str(context.get("anchor_id", "")),
		"position": _normalise_position(building_record.get("position", [])),
	}
	if _structures.has(instance_id):
		var existing := get_structure(instance_id)
		if _same_immutable_identity(existing, identity):
			return {"ok": true, "duplicate": true, "structure": existing}
		return {"ok": false, "error": "structure_identity_conflict"}
	var condition := clampf(float(building_record.get("condition", 1.0)), 0.0, 1.0)
	var payload := identity.duplicate(true)
	payload["world_seed"] = world_seed
	payload["world_id"] = world_id
	payload["condition"] = condition
	var evidence_id := "evidence.%s.legacy_adoption" % instance_id
	var evidence := _commit_evidence(
		evidence_id, "legacy_structure_adopted", payload,
		str(context.get("migration_id", "save.v18.structure_owner")))
	if not bool(evidence.get("ok", false)):
		return evidence
	var event := _event_record(
		"legacy_adopted", str(context.get("migration_id", "v18")),
		0.0, condition, condition, evidence_id, "migration", context)
	var record := _new_record(identity, condition, evidence_id, event)
	_store_new_structure(record)
	return {
		"ok": true,
		"duplicate": false,
		"structure": record.duplicate(true),
		"evidence_id": evidence_id,
	}


func find_structure_for_anchor(
		settlement_id: String, anchor_id: String) -> String:
	for instance_id in structure_ids():
		var record: Dictionary = _structures[instance_id]
		if str(record.get("settlement_id", "")) == settlement_id \
				and str(record.get("anchor_id", "")) == anchor_id:
			return instance_id
	return ""


func can_accept_consequence(
		instance_id: String, consequence_type: String,
		consequence_id: String, amount: float) -> Dictionary:
	if not _structures.has(instance_id):
		return {"ok": false, "error": "unknown_structure"}
	if consequence_type not in ["damage", "repair"]:
		return {"ok": false, "error": "unknown_consequence_type"}
	if consequence_id.is_empty() or amount <= 0.0:
		return {"ok": false, "error": "invalid_consequence"}
	var record: Dictionary = _structures[instance_id]
	var history_key := "%s_history" % consequence_type
	for entry_value in record.get(history_key, []):
		if not (entry_value is Dictionary) \
				or str(entry_value.get("consequence_id", "")) != consequence_id:
			continue
		if is_equal_approx(float(entry_value.get("amount", 0.0)), amount):
			return {"ok": true, "duplicate": true}
		return {"ok": false, "error": "consequence_conflict"}
	if consequence_type == "repair" \
			and float(record.get("condition", 1.0)) >= 1.0:
		return {"ok": false, "error": "structure_not_damaged"}
	return {"ok": true, "duplicate": false}


func record_damage(
		instance_id: String, amount: float,
		consequence: Dictionary) -> Dictionary:
	return _record_consequence(instance_id, amount, consequence, false)


func record_repair(
		instance_id: String, amount: float,
		consequence: Dictionary) -> Dictionary:
	return _record_consequence(instance_id, amount, consequence, true)


func project_lod(instance_id: String, lod_mode: String) -> Dictionary:
	if not _structures.has(instance_id) or lod_mode not in VALID_LOD_MODES:
		return {}
	var source: Dictionary = _structures[instance_id]
	var view := {
		"record_type": "StructureLODView",
		"version": STATE_VERSION,
		"lod_mode": lod_mode,
		"structure_instance_id": instance_id,
		"definition_id": str(source.get("definition_id", "")),
		"owner_id": str(source.get("owner_id", "")),
		"settlement_id": str(source.get("settlement_id", "")),
		"world_id": str(source.get("world_id", "")),
		"world_seed": int(source.get("world_seed", 0)),
		"lifecycle_state": str(source.get("lifecycle_state", "")),
		"condition": float(source.get("condition", 0.0)),
		"revision": int(source.get("revision", 0)),
		"source_state_hash": str(source.get("state_hash", "")),
		"damage_count": (source.get("damage_history", []) as Array).size(),
		"repair_count": (source.get("repair_history", []) as Array).size(),
	}
	if lod_mode in ["local", "regional"]:
		view["position"] = (source.get("position", []) as Array).duplicate()
		view["anchor_id"] = str(source.get("anchor_id", ""))
		view["source_kind"] = str(source.get("source_kind", ""))
	if lod_mode == "local":
		view["blueprint_id"] = str(source.get("blueprint_id", ""))
		view["source_project_id"] = str(source.get("source_project_id", ""))
		view["evidence_refs"] = (source.get("evidence_refs", []) as Array).duplicate()
	return view


func validate_lod_view(view: Dictionary) -> Dictionary:
	var instance_id := str(view.get("structure_instance_id", ""))
	if not _structures.has(instance_id):
		return {"ok": false, "error": "unknown_structure"}
	if str(view.get("lod_mode", "")) not in VALID_LOD_MODES:
		return {"ok": false, "error": "invalid_lod_mode"}
	var source: Dictionary = _structures[instance_id]
	for field in [
		"definition_id", "owner_id", "settlement_id", "world_id",
		"lifecycle_state", "revision",
	]:
		if view.get(field) != source.get(field):
			return {"ok": false, "error": "lod_owner_mismatch", "field": field}
	if int(view.get("world_seed", -1)) != int(source.get("world_seed", 0)) \
			or not is_equal_approx(
				float(view.get("condition", -1.0)),
				float(source.get("condition", 0.0))) \
			or str(view.get("source_state_hash", "")) \
				!= str(source.get("state_hash", "")):
		return {"ok": false, "error": "lod_state_mismatch"}
	return {"ok": true}


func compatibility_building_view(
		instance_id: String, existing: Dictionary = {}) -> Dictionary:
	if not _structures.has(instance_id):
		return existing.duplicate(true)
	var source: Dictionary = _structures[instance_id]
	var view := existing.duplicate(true)
	view["instance_id"] = instance_id
	view["structure_instance_id"] = instance_id
	view["definition_id"] = str(source.get("definition_id", ""))
	view["blueprint_id"] = str(source.get("blueprint_id", ""))
	view["owner_id"] = str(source.get("owner_id", ""))
	view["condition"] = float(source.get("condition", 0.0))
	view["active"] = str(source.get("lifecycle_state", "")) != "destroyed"
	view["position"] = (source.get("position", []) as Array).duplicate()
	view["lod_state"] = str(view.get("lod_state", "record"))
	view["authoritative_record_type"] = RECORD_TYPE
	view["authoritative_revision"] = int(source.get("revision", 0))
	view["authoritative_state_hash"] = str(source.get("state_hash", ""))
	return view


func serialize_state() -> Dictionary:
	var records: Array[Dictionary] = []
	for instance_id in structure_ids():
		records.append((_structures[instance_id] as Dictionary).duplicate(true))
	return {
		"schema": STATE_SCHEMA,
		"version": STATE_VERSION,
		"world_seed": world_seed,
		"world_id": world_id,
		"structures": records,
	}


func restore_state(value: Variant, expected_seed: int,
		expected_world_id: String = "") -> bool:
	if not (value is Dictionary):
		return false
	var data: Dictionary = value
	if str(data.get("schema", "")) != STATE_SCHEMA \
			or int(data.get("version", 0)) != STATE_VERSION \
			or int(data.get("world_seed", -1)) != expected_seed \
			or not (data.get("structures", []) is Array):
		return false
	var saved_world_id := str(data.get("world_id", ""))
	if not expected_world_id.is_empty() and not saved_world_id.is_empty() \
			and saved_world_id != expected_world_id:
		return false
	var restored := {}
	for record_value in data.get("structures", []):
		if not (record_value is Dictionary):
			return false
		var record: Dictionary = record_value.duplicate(true)
		var validation := validate_structure_record(record, expected_seed)
		if not bool(validation.get("ok", false)):
			return false
		var instance_id := str(record.get("instance_id", ""))
		if restored.has(instance_id):
			return false
		restored[instance_id] = record
	initialized = true
	world_seed = expected_seed
	world_id = expected_world_id if not expected_world_id.is_empty() \
		else saved_world_id
	_structures = restored
	structures_changed.emit()
	return true


func validate_structure_record(
		record: Dictionary, expected_seed: int = -1) -> Dictionary:
	if str(record.get("record_type", "")) != RECORD_TYPE \
			or int(record.get("version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_structure_record"}
	for field in [
		"instance_id", "definition_id", "owner_id", "settlement_id",
		"source_kind", "lifecycle_state", "state_hash",
	]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	if expected_seed >= 0 and int(record.get("world_seed", -1)) != expected_seed:
		return {"ok": false, "error": "world_seed_mismatch"}
	var condition := float(record.get("condition", -1.0))
	if condition < 0.0 or condition > 1.0 \
			or str(record.get("lifecycle_state", "")) \
				not in VALID_LIFECYCLE_STATES:
		return {"ok": false, "error": "invalid_structure_condition"}
	if _lifecycle_for_condition(condition) \
			!= str(record.get("lifecycle_state", "")):
		return {"ok": false, "error": "lifecycle_condition_mismatch"}
	for array_field in [
		"position", "evidence_refs", "event_history", "damage_history",
		"repair_history",
	]:
		if not (record.get(array_field, []) is Array):
			return {"ok": false, "error": "invalid_%s" % array_field}
	if int(record.get("revision", 0)) < 1:
		return {"ok": false, "error": "invalid_structure_revision"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "structure_hash_mismatch"}
	return {"ok": true}


func _record_consequence(
		instance_id: String, amount: float,
		consequence: Dictionary, repairing: bool) -> Dictionary:
	var consequence_type := "repair" if repairing else "damage"
	var consequence_id := str(consequence.get("consequence_id", ""))
	var preflight := can_accept_consequence(
		instance_id, consequence_type, consequence_id, amount)
	if not bool(preflight.get("ok", false)):
		return preflight
	if bool(preflight.get("duplicate", false)):
		return {
			"ok": true,
			"duplicate": true,
			"structure": get_structure(instance_id),
			"condition": float(_structures[instance_id].get("condition", 0.0)),
		}
	var record: Dictionary = _structures[instance_id]
	var previous := float(record.get("condition", 1.0))
	var next := clampf(previous + amount if repairing else previous - amount, 0.0, 1.0)
	var payload := {
		"instance_id": instance_id,
		"consequence_id": consequence_id,
		"consequence_type": consequence_type,
		"source_owner": str(consequence.get("source_owner", "unknown")),
		"source_event_id": str(consequence.get("source_event_id", consequence_id)),
		"amount": amount,
		"previous_condition": previous,
		"condition": next,
		"position": _normalise_position(consequence.get("position", [])),
		"material_ref": str(consequence.get("material_ref", "")),
	}
	var evidence_id := "evidence.%s.%s.%s" % [
		instance_id, consequence_type, consequence_id]
	var evidence := _commit_evidence(
		evidence_id, "structure_%s_recorded" % consequence_type,
		payload, consequence_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var event := _event_record(
		consequence_type, consequence_id, amount, previous, next,
		evidence_id, str(consequence.get("source_owner", "unknown")),
		consequence)
	var history_key := "%s_history" % consequence_type
	var consequence_history: Array = record.get(history_key, [])
	consequence_history.append(event.duplicate(true))
	_trim_history(consequence_history)
	record[history_key] = consequence_history
	var event_history: Array = record.get("event_history", [])
	event_history.append(event)
	_trim_history(event_history)
	record["event_history"] = event_history
	var refs: Array = record.get("evidence_refs", [])
	if evidence_id not in refs:
		refs.append(evidence_id)
	record["evidence_refs"] = refs
	record["condition"] = next
	record["lifecycle_state"] = _lifecycle_for_condition(next)
	record["revision"] = int(record.get("revision", 0)) + 1
	record["updated_tick"] = int(event.get("world_tick", 0))
	record["state_hash"] = _record_hash(record)
	_structures[instance_id] = record
	structure_changed.emit(instance_id)
	structures_changed.emit()
	return {
		"ok": true,
		"duplicate": false,
		"condition": next,
		"lifecycle_state": record["lifecycle_state"],
		"evidence_id": evidence_id,
		"structure": record.duplicate(true),
	}


func _new_record(identity: Dictionary, condition: float,
		evidence_id: String, initial_event: Dictionary) -> Dictionary:
	var record := {
		"record_type": RECORD_TYPE,
		"version": STATE_VERSION,
		"instance_id": str(identity.get("instance_id", "")),
		"definition_id": str(identity.get("definition_id", "")),
		"blueprint_id": str(identity.get("blueprint_id", "")),
		"owner_id": str(identity.get("owner_id", "")),
		"settlement_id": str(identity.get("settlement_id", "")),
		"world_id": world_id,
		"world_seed": world_seed,
		"source_kind": str(identity.get("source_kind", "")),
		"source_project_id": str(identity.get("source_project_id", "")),
		"anchor_id": str(identity.get("anchor_id", "")),
		"position": _normalise_position(identity.get("position", [])),
		"lifecycle_state": _lifecycle_for_condition(condition),
		"condition": condition,
		"revision": 1,
		"created_tick": int(initial_event.get("world_tick", 0)),
		"updated_tick": int(initial_event.get("world_tick", 0)),
		"evidence_refs": [evidence_id],
		"event_history": [initial_event.duplicate(true)],
		"damage_history": [],
		"repair_history": [],
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	return record


func _store_new_structure(record: Dictionary) -> void:
	var instance_id := str(record.get("instance_id", ""))
	_structures[instance_id] = record
	structure_changed.emit(instance_id)
	structures_changed.emit()


func _idempotent_handoff(
		instance_id: String, identity: Dictionary) -> Dictionary:
	var existing := get_structure(instance_id)
	if not _same_immutable_identity(existing, identity):
		return {"ok": false, "error": "structure_identity_conflict"}
	return {"ok": true, "duplicate": true, "structure": existing}


func _same_immutable_identity(
		existing: Dictionary, requested: Dictionary) -> bool:
	var requested_kind := str(requested.get("source_kind", ""))
	var existing_kind := str(existing.get("source_kind", ""))
	var migration_bridge := requested_kind == "migration" \
		or existing_kind == "migration"
	for field in [
		"instance_id", "definition_id", "blueprint_id", "owner_id",
		"settlement_id",
	]:
		if existing.get(field) != requested.get(field):
			return false
	if not _positions_equal(
			existing.get("position", []), requested.get("position", [])):
		return false
	if not migration_bridge:
		for source_field in ["source_project_id", "anchor_id"]:
			if existing.get(source_field) != requested.get(source_field):
				return false
	return requested_kind == existing_kind \
		or migration_bridge


func _positions_equal(first_value: Variant, second_value: Variant) -> bool:
	var first := _normalise_position(first_value)
	var second := _normalise_position(second_value)
	if first.size() != second.size():
		return false
	for index in first.size():
		if not is_equal_approx(float(first[index]), float(second[index])):
			return false
	return true


func _commit_evidence(evidence_id: String, event_type: String,
		payload: Dictionary, correlation_id: String) -> Dictionary:
	var payload_hash := _hash_value(payload)
	var envelope := ProductionKernel.make_evidence_envelope(
		evidence_id, EVIDENCE_OWNER, event_type, payload_hash, correlation_id)
	var committed := ProductionKernel.commit_evidence(envelope)
	if not bool(committed.get("ok", false)):
		return committed
	var published := ProductionKernel.publish_event(
		"event.%s" % evidence_id.trim_prefix("evidence."), EVIDENCE_OWNER,
		event_type, payload_hash, [evidence_id])
	if not bool(published.get("ok", false)):
		return published
	return {
		"ok": true,
		"duplicate": bool(committed.get("duplicate", false)),
		"evidence_id": evidence_id,
		"payload_hash": payload_hash,
	}


func _event_record(event_type: String, consequence_id: String,
		amount: float, previous: float, condition: float,
		evidence_id: String, source_owner: String,
		context: Dictionary) -> Dictionary:
	var time: Dictionary = ProductionKernel.world_time_reference()
	return {
		"event_type": event_type,
		"consequence_id": consequence_id,
		"source_owner": source_owner,
		"source_event_id": str(context.get("source_event_id", consequence_id)),
		"amount": amount,
		"previous_condition": previous,
		"condition": condition,
		"day": int(context.get("day", 0)),
		"clock_minutes": float(context.get("clock_minutes", 0.0)),
		"world_tick": int(time.get("world_tick", 0)),
		"position": _normalise_position(context.get("position", [])),
		"material_ref": str(context.get("material_ref", "")),
		"evidence_id": evidence_id,
	}


func _ensure_initialized(context: Dictionary) -> void:
	if initialized:
		return
	initialize(
		int(context.get("world_seed", 0)),
		str(context.get("world_id", "")))


func _normalise_position(value: Variant) -> Array:
	if value is Vector2i:
		return [value.x, value.y]
	if value is Vector3i:
		return [value.x, value.y, value.z]
	if value is Vector2:
		return [value.x, value.y]
	if value is Vector3:
		return [value.x, value.y, value.z]
	if value is Array and value.size() in [2, 3]:
		var result: Array = []
		for component in value:
			if not (component is int or component is float):
				return []
			result.append(component)
		return result
	return []


func _lifecycle_for_condition(condition: float) -> String:
	if condition <= 0.0:
		return "destroyed"
	if condition < 1.0:
		return "damaged"
	return "complete"


func _trim_history(history: Array) -> void:
	while history.size() > MAX_HISTORY:
		history.pop_front()


func _record_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


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
	return JSON.stringify(value)
