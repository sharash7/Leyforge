class_name SettlementServiceEngine
extends RefCounted
## Document-20 functional-service activation over authoritative owner evidence.
##
## This kernel never assigns people or changes structure truth. It consumes
## Document-07 job assignments plus the StructureManager compatibility view and
## persists the resulting ServiceRecord on the building runtime projection.

const Rules = preload("res://scripts/settlement/settlement_simulation_rules.gd")

const SERVICE_RECORD_SCHEMA := "leyforge.building-service-record"
const SERVICE_RECORD_VERSION := 1
const AVAILABLE_STATUSES: Array[String] = ["active", "strained", "partial"]


static func evaluate_buildings(
		runtime_buildings: Array,
		residents_value: Variant,
		job_slots_value: Variant,
		world_time: Dictionary = {},
		resource_ledger: Dictionary = {}) -> Dictionary:
	var residents: Dictionary = (
		residents_value if residents_value is Dictionary else {})
	var job_slots: Dictionary = (
		job_slots_value if job_slots_value is Dictionary else {})
	var buildings: Array[Dictionary] = []
	for building_value in runtime_buildings:
		if building_value is Dictionary:
			buildings.append((building_value as Dictionary).duplicate(true))
	buildings.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("instance_id", "")) < str(b.get("instance_id", "")))
	var service_records := {}
	var errors: Array[String] = []
	var changed := false
	for index in buildings.size():
		var before: Dictionary = buildings[index]
		var result := evaluate_building(
			before, residents, job_slots, world_time, resource_ledger)
		if not bool(result.get("ok", false)):
			errors.append(str(result.get("reason", "service_evaluation_failed")))
			continue
		var building: Dictionary = result.get("building", before)
		buildings[index] = building
		changed = changed or bool(result.get("changed", false))
		var service_record: Dictionary = result.get("service_record", {})
		if not service_record.is_empty():
			service_records[str(service_record.get("service_record_id", ""))] = (
				service_record.duplicate(true))
	return {
		"ok": errors.is_empty(),
		"changed": changed,
		"buildings": buildings,
		"service_records": service_records,
		"errors": errors,
	}


static func evaluate_building(
		building_value: Dictionary,
		residents: Dictionary,
		job_slots: Dictionary,
		world_time: Dictionary = {},
		resource_ledger: Dictionary = {}) -> Dictionary:
	var building := building_value.duplicate(true)
	var instance_id := str(building.get("instance_id", ""))
	var definition_id := str(building.get("definition_id", ""))
	if instance_id.is_empty() or definition_id.is_empty():
		return {"ok": false, "reason": "service_building_identity_missing"}
	var behavior := SettlementContentRegistry.get_behavior_for_definition(
		definition_id)
	var definition := SettlementContentRegistry.get_building(definition_id)
	if behavior.is_empty():
		return {"ok": false, "reason": "service_behavior_missing:%s" % definition_id}
	var contract: Dictionary = behavior.get("staffing_contract", {})
	if contract.is_empty():
		return {
			"ok": true,
			"changed": false,
			"building": building,
			"service_record": (
				building.get("service_record", {}) as Dictionary).duplicate(true),
			"managed": false,
		}
	var target_slots := maxi(1, int(contract.get(
		"target_slots", behavior.get("job_slots", 1))))
	var minimum_ratio := clampf(float(contract.get(
		"minimum_ratio", 1.0)), 0.0, 1.0)
	var minimum_slots := maxi(1, ceili(float(target_slots) * minimum_ratio))
	var accepted_job_ids: Array = contract.get("accepted_job_ids", [])
	var valid_slots: Array[Dictionary] = []
	for slot_value in job_slots.values():
		if not (slot_value is Dictionary):
			continue
		var slot: Dictionary = slot_value
		if str(slot.get("workplace_ref", "")) != instance_id:
			continue
		if not bool(slot.get("active", true)) \
				or not bool(slot.get("reachable", false)) \
				or not bool(slot.get("marker_valid", false)):
			continue
		valid_slots.append(slot.duplicate(true))
	valid_slots.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("job_assignment_id", "")) \
			< str(b.get("job_assignment_id", "")))
	var assigned_resident_ids: Array[String] = []
	var assigned_slot_ids: Array[String] = []
	var staffing_revisions := {}
	for slot in valid_slots:
		var slot_id := str(slot.get("job_assignment_id", ""))
		var resident := _resident_for_slot(slot_id, slot, residents)
		if resident.is_empty() or not _resident_matches_contract(
				resident, instance_id, accepted_job_ids):
			continue
		var resident_id := str(resident.get(
			"resident_id", resident.get("id", "")))
		assigned_resident_ids.append(resident_id)
		assigned_slot_ids.append(slot_id)
		staffing_revisions[slot_id] = int(slot.get(
			"authoritative_job_revision", resident.get(
				"authoritative_person_revision", 0)))
	var staffing_ratio := clampf(
		float(assigned_resident_ids.size()) / float(target_slots), 0.0, 1.0)
	var blockers: Array[String] = []
	var physical_active := bool(building.get("active", false))
	var condition := clampf(float(building.get("condition", 0.0)), 0.0, 1.0)
	var declared_inputs_available := clampf(
		float(building.get("inputs_available", 1.0)), 0.0, 1.0)
	var access := clampf(float(building.get("access", 1.0)), 0.0, 1.0)
	var utilities := clampf(float(building.get("utilities", 1.0)), 0.0, 1.0)
	var suitability := clampf(
		float(building.get("suitability", 1.0)), 0.0, 1.0)
	if not physical_active:
		blockers.append("structure_not_active")
	if condition <= 0.0:
		blockers.append("condition_unsafe")
	var requires_access := bool(behavior.get("activation_requires_access", false))
	var requires_utilities := not (definition.get(
		"utility_requirements", []) as Array).is_empty()
	var stock_evidence := _material_stock_evidence(
		building, behavior, residents, resource_ledger)
	var inputs_available := declared_inputs_available \
		if bool(stock_evidence.get("available", false)) else 0.0
	var effective_access := access if requires_access else 1.0
	var effective_utilities := utilities if requires_utilities else 1.0
	if requires_access and access <= 0.0:
		blockers.append("access_unavailable")
	if requires_utilities and utilities <= 0.0:
		blockers.append("utilities_unavailable")
	if suitability <= 0.0:
		blockers.append("site_unsuitable")
	if inputs_available <= 0.0:
		var stock_reasons: Array = stock_evidence.get("reason_codes", [])
		if stock_reasons.is_empty():
			stock_reasons = ["service_inputs_unavailable"]
		for reason in stock_reasons:
			if str(reason) not in blockers:
				blockers.append(str(reason))
	if valid_slots.size() < minimum_slots:
		blockers.append("staffing_slots_missing")
	if assigned_resident_ids.size() < minimum_slots:
		blockers.append("minimum_staffing_unmet")
	elif assigned_resident_ids.size() < target_slots:
		blockers.append("target_staffing_unmet")
	var critical_blockers: Array[String] = []
	for blocker in blockers:
		if blocker != "target_staffing_unmet":
			critical_blockers.append(blocker)
	var effective_capacity := Rules.effective_contribution(
		1.0, condition, staffing_ratio, inputs_available, effective_access,
		effective_utilities, suitability)
	var status := "active"
	if condition <= 0.0:
		status = "unsafe"
	elif not critical_blockers.is_empty():
		status = "offline"
	elif effective_capacity + 0.0001 < 1.0:
		status = "partial"
	var previous: Dictionary = building.get("service_record", {})
	var service_record := {
		"schema": SERVICE_RECORD_SCHEMA,
		"version": SERVICE_RECORD_VERSION,
		"service_record_id": "building_service.%s" % instance_id,
		"structure_ref": str(building.get("structure_instance_id", instance_id)),
		"function_ref": definition_id,
		"declared_capacity_ref": str(behavior.get("id", definition_id)),
		"effective_capacity": effective_capacity,
		"status": status,
		"staffing": {
			"minimum_ratio": minimum_ratio,
			"minimum_slots": minimum_slots,
			"target_slots": target_slots,
			"valid_slot_ids": _slot_ids(valid_slots),
			"assigned_slot_ids": assigned_slot_ids.duplicate(),
			"assigned_resident_ids": assigned_resident_ids.duplicate(),
			"ratio": staffing_ratio,
		},
		"evidence_refs": {
			"staffing": assigned_slot_ids.duplicate(),
			"stock": (stock_evidence.get(
				"evidence_refs", []) as Array).duplicate(),
			"access": ["route_access.%s" % instance_id] if access > 0.0 else [],
			"permission": [str(building.get("owner_id", ""))] \
				if not str(building.get("owner_id", "")).is_empty() else [],
			"network": [],
			"condition": [str(building.get(
				"authoritative_state_hash", "structure.%s" % instance_id))],
			"specialist": [],
		},
		"blocker_reason_codes": blockers.duplicate(),
		"evaluated_world_time": world_time.duplicate(true),
		"source_revisions": {
			"structure": int(building.get("authoritative_revision", 0)),
			"staffing": staffing_revisions,
			"stock": JSON.stringify(resource_ledger).hash(),
		},
		"revision": maxi(1, int(previous.get("revision", 0))),
	}
	var changed := _semantic_service_record(service_record) \
		!= _semantic_service_record(previous)
	if changed and not previous.is_empty():
		service_record["revision"] = int(previous.get("revision", 0)) + 1
	building["staffing"] = staffing_ratio
	building["service_active"] = status in AVAILABLE_STATUSES
	building["service_status"] = status
	building["service_record"] = service_record
	return {
		"ok": true,
		"changed": changed,
		"managed": true,
		"building": building,
		"service_record": service_record,
	}


static func is_service_available(building: Dictionary) -> bool:
	var service_record: Dictionary = building.get("service_record", {})
	if service_record.is_empty():
		return bool(building.get("active", false))
	return str(service_record.get("status", "unknown")) in AVAILABLE_STATUSES


static func validate_service_record(record: Dictionary) -> Dictionary:
	var errors: Array[String] = []
	if str(record.get("schema", "")) != SERVICE_RECORD_SCHEMA \
			or int(record.get("version", 0)) != SERVICE_RECORD_VERSION:
		errors.append("invalid_service_schema")
	if str(record.get("service_record_id", "")).is_empty() \
			or str(record.get("structure_ref", "")).is_empty() \
			or str(record.get("function_ref", "")).is_empty():
		errors.append("service_identity_missing")
	if str(record.get("status", "")) not in [
		"active", "strained", "partial", "offline", "unsafe", "unknown",
	]:
		errors.append("invalid_service_status")
	if not (record.get("evidence_refs", {}) is Dictionary) \
			or not (record.get("blocker_reason_codes", []) is Array) \
			or int(record.get("revision", 0)) <= 0:
		errors.append("invalid_service_evidence")
	return {"ok": errors.is_empty(), "errors": errors}


static func _resident_for_slot(
		slot_id: String, slot: Dictionary, residents: Dictionary) -> Dictionary:
	var assigned_person_id := str(slot.get("assigned_person_id", ""))
	if not assigned_person_id.is_empty() \
			and residents.get(assigned_person_id, {}) is Dictionary:
		return (residents[assigned_person_id] as Dictionary).duplicate(true)
	var resident_ids: Array = residents.keys()
	resident_ids.sort()
	for resident_value in resident_ids:
		var resident: Variant = residents[resident_value]
		if resident is Dictionary and str((resident as Dictionary).get(
				"job_assignment_id", "")) == slot_id:
			return (resident as Dictionary).duplicate(true)
	return {}


static func _resident_matches_contract(
		resident: Dictionary,
		instance_id: String,
		accepted_job_ids: Array) -> bool:
	if not bool(resident.get("alive", true)) \
			or str(resident.get("existence_state", "alive")) != "alive" \
			or str(resident.get("age_band", "adult")) != "adult" \
			or float(resident.get("health", 1.0)) <= 0.0:
		return false
	if str(resident.get("workplace_id", instance_id)) != instance_id:
		return false
	return accepted_job_ids.is_empty() \
		or str(resident.get("job_id", resident.get(
			"job_definition_ref", ""))) in accepted_job_ids


static func _slot_ids(slots: Array[Dictionary]) -> Array[String]:
	var result: Array[String] = []
	for slot in slots:
		result.append(str(slot.get("job_assignment_id", "")))
	return result


static func _material_stock_evidence(
		building: Dictionary,
		behavior: Dictionary,
		residents: Dictionary,
		resource_ledger: Dictionary) -> Dictionary:
	var recipes: Array = behavior.get("recipes", [])
	if recipes.is_empty():
		return {"available": true, "evidence_refs": [], "reason_codes": []}
	var fallback_reasons: Array[String] = []
	for recipe_value in recipes:
		if not (recipe_value is Dictionary):
			continue
		var recipe: Dictionary = recipe_value
		var recipe_id := str(recipe.get("id", ""))
		var reserved := _reserved_inputs_for(
			str(building.get("instance_id", "")), recipe_id, residents)
		var evidence_refs: Array[String] = []
		var inputs_valid := true
		for input_value in recipe.get("inputs", []):
			if not (input_value is Dictionary):
				continue
			var input: Dictionary = input_value
			var stable_id := str(input.get("stable_id", ""))
			var required := maxi(0, int(input.get("count", 0)))
			var available := int(resource_ledger.get(stable_id, 0)) \
				+ int(reserved.get(stable_id, 0))
			if stable_id.is_empty() or required <= 0 or available < required:
				inputs_valid = false
				break
			evidence_refs.append("stock.%s" % stable_id)
		if not inputs_valid:
			if "service_inputs_unavailable" not in fallback_reasons:
				fallback_reasons.append("service_inputs_unavailable")
			continue
		var source_contract: Dictionary = recipe.get("source_contract", {})
		if not source_contract.is_empty():
			var source: Dictionary = (building.get(
				"resource_sources", {}) as Dictionary).get(str(
					source_contract.get("id", "")), {})
			if source.is_empty() or not bool(source.get("active", false)) \
					or int(source.get("remaining_units", 0)) \
						< int(source_contract.get("units_per_cycle", 1)):
				if "resource_source_unavailable" not in fallback_reasons:
					fallback_reasons.append("resource_source_unavailable")
				continue
			var provenance: Dictionary = source.get("provenance", {})
			evidence_refs.append(str(provenance.get(
				"evidence_id", source.get("source_id", ""))))
		return {
			"available": true,
			"evidence_refs": evidence_refs,
			"reason_codes": [],
		}
	return {
		"available": false,
		"evidence_refs": [],
		"reason_codes": fallback_reasons \
			if not fallback_reasons.is_empty() else ["service_inputs_unavailable"],
	}


static func _reserved_inputs_for(
		instance_id: String,
		recipe_id: String,
		residents: Dictionary) -> Dictionary:
	var result := {}
	for resident_value in residents.values():
		if not (resident_value is Dictionary):
			continue
		var task: Dictionary = resident_value.get("current_task", {})
		if str(task.get("workplace_instance_id", "")) != instance_id \
				or str(task.get("recipe_id", "")) != recipe_id \
				or not bool(task.get("inputs_reserved", false)):
			continue
		for stable_value in (task.get("reserved_inputs", {}) as Dictionary):
			var stable_id := str(stable_value)
			result[stable_id] = int(result.get(stable_id, 0)) \
				+ int(task["reserved_inputs"][stable_value])
	return result


static func _semantic_service_record(record: Dictionary) -> String:
	if record.is_empty():
		return ""
	var value := record.duplicate(true)
	value.erase("evaluated_world_time")
	value.erase("revision")
	return JSON.stringify(value)
