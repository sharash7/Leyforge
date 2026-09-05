extends Node

const ServiceEngine = preload(
	"res://scripts/settlement/settlement_service_engine.gd")
const ProfessionEngine = preload(
	"res://scripts/settlement/settlement_profession_engine.gd")

var _checks := 0
var _failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	_verify_staffing_contracts()
	_verify_service_lifecycle()
	_verify_owner_assignment_reuse()
	print("SET_001_SERVICE_ACTIVATION_PROBE %s" % JSON.stringify({
		"ok": _failures.is_empty(),
		"checks": _checks,
		"failures": _failures,
	}))
	get_tree().quit(0 if _failures.is_empty() else 1)


func _verify_staffing_contracts() -> void:
	var report := SettlementContentRegistry.validation_report()
	_check(bool(report.get("ok", false)),
		"settlement registry rejected staffing contracts: %s" % report)
	var expected := {
		"building.residential.farmhouse": "job.farmer.basic",
		"building.food.basic_farm_plot": "job.farmer.basic",
		"building.food.irrigated_terraced_farm": "job.farmer.basic",
		"building.extraction.lumber_camp": "job.lumberjack.basic",
		"building.extraction.quarry_stone_yard": "job.miner.basic",
		"building.extraction.mine_entrance": "job.miner.basic",
		"building.extraction.deep_mine_complex": "job.miner.basic",
	}
	var managed := 0
	for definition in SettlementContentRegistry.all_definitions():
		var behavior := SettlementContentRegistry.get_behavior_for_definition(str(
			definition.get("id", "")))
		var contract: Dictionary = behavior.get("staffing_contract", {})
		if contract.is_empty():
			continue
		managed += 1
		var definition_id := str(definition.get("id", ""))
		_check(expected.has(definition_id),
			"staffing contract escaped the governed material-workplace slice: %s" \
			% definition_id)
		_check(str((contract.get("accepted_job_ids", []) as Array)[0]) \
				== str(expected.get(definition_id, "")),
			"staffing contract references the wrong Document-07 job: %s" \
			% definition_id)
		_check(int(contract.get("target_slots", 0)) \
				== int(behavior.get("job_slots", -1)) \
				and is_equal_approx(float(contract.get(
					"minimum_ratio", 0.0)), 0.5),
			"staffing contract lost its explicit minimum/target: %s" \
			% definition_id)
	_check(managed == expected.size(),
		"managed staffing contract count drifted from seven material workplaces")


func _verify_service_lifecycle() -> void:
	var instance_id := "building.probe.staffed_farm"
	var building := _farm(instance_id)
	var slots := _staffing_slots(instance_id)
	var ledger := {"item.seed.wheat_basic": 1}
	var unstaffed := ServiceEngine.evaluate_building(
		building, {}, slots, {"day": 4, "clock_minutes": 600.0}, ledger)
	_check(bool(unstaffed.get("ok", false)),
		"unstaffed service evaluation failed")
	var offline_building: Dictionary = unstaffed.get("building", {})
	var offline: Dictionary = unstaffed.get("service_record", {})
	_check(str(offline.get("status", "")) == "offline" \
			and not ServiceEngine.is_service_available(offline_building),
		"physically complete farm became operational without a worker")
	_check("minimum_staffing_unmet" in offline.get("blocker_reason_codes", []) \
			and is_zero_approx(float(offline_building.get("staffing", -1.0))),
		"offline ServiceRecord lacks its staffing blocker or zero ratio")
	_check(bool(ServiceEngine.validate_service_record(offline).get("ok", false)),
		"offline ServiceRecord does not satisfy the persisted schema")
	var blocked_profession := ProfessionEngine.advance_profession(
		_resident("resident.probe.farmer_a", ""), [offline_building],
		{"item.seed.wheat_basic": 1}, 0.0)
	_check(not bool(blocked_profession.get("ok", false)) \
			and str(blocked_profession.get("reason", "")) \
				== "active_workplace_missing",
		"profession work bypassed an offline ServiceRecord")
	var offline_snapshot := SettlementSimulationEngine.service_snapshot(
		[offline_building])
	_check(is_zero_approx(float((offline_snapshot.get(
		"needs", {}) as Dictionary).get("provisions", -1.0))),
		"offline farm contributed invisible Provisions capacity")

	var resident_a := _resident(
		"resident.probe.farmer_a", "%s.slot.0" % instance_id)
	var partial_result := ServiceEngine.evaluate_building(
		building, {resident_a["resident_id"]: resident_a}, slots,
		{"day": 4, "clock_minutes": 610.0}, ledger)
	var partial_building: Dictionary = partial_result.get("building", {})
	var partial: Dictionary = partial_result.get("service_record", {})
	_check(str(partial.get("status", "")) == "partial" \
			and ServiceEngine.is_service_available(partial_building),
		"minimum staffing did not activate bounded partial service")
	_check(is_equal_approx(float(partial_building.get("staffing", 0.0)), 0.5) \
			and is_equal_approx(float(partial.get(
				"effective_capacity", 0.0)), 0.5),
		"one of two declared workers did not yield half capacity")
	_check((partial.get("evidence_refs", {}) as Dictionary).get(
		"staffing", []) == ["%s.slot.0" % instance_id] \
			and "target_staffing_unmet" in partial.get(
				"blocker_reason_codes", []),
		"partial service lacks exact staffing evidence and target blocker")
	_check("stock.item.seed.wheat_basic" in (
			partial.get("evidence_refs", {}) as Dictionary).get("stock", []) \
			and "survey.probe.service" in (
			partial.get("evidence_refs", {}) as Dictionary).get("stock", []),
		"active farm service lacks canonical stock/source evidence")
	var partial_snapshot := SettlementSimulationEngine.service_snapshot(
		[partial_building])
	_check(is_equal_approx(float((partial_snapshot.get(
		"needs", {}) as Dictionary).get("provisions", 0.0)), 3.0),
		"partial service did not scale governed need contribution")
	var started := ProfessionEngine.advance_profession(
		resident_a, [partial_building], {"item.seed.wheat_basic": 1}, 0.0)
	_check(bool(started.get("ok", false)) \
			and str(started.get("status", "")) == "traveling",
		"staffed farmer could not create an authoritative work intent")

	var wrong_worker := _resident(
		"resident.probe.miner", "%s.slot.0" % instance_id,
		"job.miner.basic", "item.tool.stone_pickaxe")
	var wrong_result := ServiceEngine.evaluate_building(
		building, {wrong_worker["resident_id"]: wrong_worker}, slots, {}, ledger)
	_check(str((wrong_result.get("service_record", {}) as Dictionary).get(
		"status", "")) == "offline",
		"wrong Document-07 job activated the farm")
	var unavailable := resident_a.duplicate(true)
	unavailable["alive"] = false
	unavailable["existence_state"] = "dead"
	var unavailable_result := ServiceEngine.evaluate_building(
		building, {unavailable["resident_id"]: unavailable}, slots, {}, ledger)
	_check(str((unavailable_result.get("service_record", {}) as Dictionary).get(
		"status", "")) == "offline",
		"unavailable resident continued to staff the service")

	var resident_b := _resident(
		"resident.probe.farmer_b", "%s.slot.1" % instance_id)
	var full_result := ServiceEngine.evaluate_building(building, {
		resident_a["resident_id"]: resident_a,
		resident_b["resident_id"]: resident_b,
	}, slots, {"day": 4, "clock_minutes": 620.0}, ledger)
	var full_building: Dictionary = full_result.get("building", {})
	var full: Dictionary = full_result.get("service_record", {})
	_check(str(full.get("status", "")) == "active" \
			and is_equal_approx(float(full.get("effective_capacity", 0.0)), 1.0),
		"target staffing did not produce full service capacity")
	_check((full.get("staffing", {}) as Dictionary).get(
		"assigned_resident_ids", []) \
			== ["resident.probe.farmer_a", "resident.probe.farmer_b"],
		"full service evidence did not remain deterministic")
	var roundtrip: Variant = JSON.parse_string(JSON.stringify(full_building))
	_check(roundtrip is Dictionary \
			and bool(ServiceEngine.validate_service_record(
				roundtrip["service_record"]).get("ok", false)) \
			and str(roundtrip["service_record"].get("status", "")) == "active",
		"ServiceRecord did not survive JSON persistence")
	var reevaluated := ServiceEngine.evaluate_building(
		full_building, {
			resident_a["resident_id"]: resident_a,
			resident_b["resident_id"]: resident_b,
		}, slots, {"day": 4, "clock_minutes": 630.0}, ledger)
	_check(not bool(reevaluated.get("changed", true)) \
			and int((reevaluated.get("service_record", {}) as Dictionary).get(
				"revision", 0)) == int(full.get("revision", -1)),
		"unchanged service evaluation churned its semantic revision")
	var starved := ServiceEngine.evaluate_building(
		building, {resident_a["resident_id"]: resident_a}, slots, {}, {})
	_check(str((starved.get("service_record", {}) as Dictionary).get(
		"status", "")) == "offline" \
			and "service_inputs_unavailable" in (
				starved.get("service_record", {}) as Dictionary).get(
					"blocker_reason_codes", []),
		"staffing activated farm service without canonical seed stock")
	var reserved_worker := resident_a.duplicate(true)
	reserved_worker["current_task"] = {
		"workplace_instance_id": instance_id,
		"recipe_id": "recipe.settlement.wheat_harvest",
		"inputs_reserved": true,
		"reserved_inputs": {"item.seed.wheat_basic": 1},
	}
	var reserved := ServiceEngine.evaluate_building(
		building, {reserved_worker["resident_id"]: reserved_worker},
		slots, {}, {})
	_check(str((reserved.get("service_record", {}) as Dictionary).get(
		"status", "")) == "partial",
		"reserved task input switched service off midway through work")

	var legacy := building.duplicate(true)
	legacy["definition_id"] = "building.storage.village_warehouse"
	legacy.erase("service_record")
	var legacy_result := ServiceEngine.evaluate_building(legacy, {}, {})
	_check(bool(legacy_result.get("ok", false)) \
			and not bool(legacy_result.get("managed", true)) \
			and bool(ServiceEngine.is_service_available(
				legacy_result.get("building", {}))),
		"unreconciled catalogue services lost legacy compatibility")


func _verify_owner_assignment_reuse() -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	PeopleManager.initialize(71020, "world.service.assignment.probe")
	var settlement_id := "settlement.service.assignment.probe"
	var slot_id := "job_slot.service.reusable"
	var workplace_id := "building.probe.staffed_farm"
	var slots := {
		slot_id: {
			"record_type": "JobAssignment",
			"job_assignment_id": slot_id,
			"role": "job.farmer.basic",
			"workplace_ref": workplace_id,
			"active": true,
			"reachable": true,
			"marker_valid": true,
		},
	}
	var first := _owner_projection(
		"resident.probe.owner_a", slot_id, workplace_id)
	var reconciled := PeopleManager.reconcile_settlement_projection(
		settlement_id, {first["resident_id"]: first}, {}, slots,
		"service_activation_probe")
	_check(bool(reconciled.get("ok", false)),
		"Document-07 owner rejected initial workplace assignment")
	var released := PeopleManager.compatibility_person_view(
		first["resident_id"], first)
	released["job_assignment_id"] = "%s.assignment.ordinary" % first["resident_id"]
	released["workplace_id"] = ""
	released["workplace_role_ref"] = ""
	var release_result := PeopleManager.update_person_projection(
		first["resident_id"], released, "service_assignment_release")
	_check(bool(release_result.get("ok", false)),
		"Document-07 owner rejected workplace release")
	var vacancy: Dictionary = PeopleManager.compatibility_job_slot_views(
		settlement_id, slots).get(slot_id, {})
	_check(bool(vacancy.get("active", false)) \
			and not bool(vacancy.get("assignment_active", true)) \
			and str(vacancy.get("assigned_person_id", "x")).is_empty(),
		"released assignment destroyed or falsely occupied the physical slot")
	var second := _owner_projection(
		"resident.probe.owner_b", slot_id, workplace_id)
	var reassigned := PeopleManager.register_person_projection(
		settlement_id, second, "service_assignment_reuse")
	_check(bool(reassigned.get("ok", false)),
		"released workplace slot could not be reassigned")
	var assignment := PeopleManager.job_assignment_interface(slot_id)
	_check(str(assignment.get("person_ref", "")) == second["resident_id"] \
			and bool(assignment.get("active", false)) \
			and str(assignment.get("workplace_ref", "")) == workplace_id,
		"reused assignment interface does not name its current person/workplace")


func _farm(instance_id: String) -> Dictionary:
	return {
		"instance_id": instance_id,
		"structure_instance_id": instance_id,
		"definition_id": "building.food.basic_farm_plot",
		"owner_id": "settlement.probe.service",
		"condition": 1.0,
		"staffing": 1.0,
		"inputs_available": 1.0,
		"access": 1.0,
		"utilities": 1.0,
		"suitability": 1.0,
		"active": true,
		"position": [4.0, 1.0, 8.0],
		"buffers": {},
		"resource_sources": ProfessionEngine.initial_resource_sources(
			"building.food.basic_farm_plot", instance_id,
			"settlement.probe.service", "survey.probe.service",
			"world.probe.service"),
	}


func _staffing_slots(instance_id: String) -> Dictionary:
	var result := {}
	for index in 2:
		var slot_id := "%s.slot.%d" % [instance_id, index]
		result[slot_id] = {
			"job_assignment_id": slot_id,
			"role": "job.farmer.basic",
			"workplace_ref": instance_id,
			"active": true,
			"reachable": true,
			"marker_valid": true,
			"authoritative_job_revision": 1,
		}
	return result


func _resident(
		resident_id: String,
		assignment_id: String,
		job_id: String = "job.farmer.basic",
		tool_id: String = "item.tool.hoe_basic") -> Dictionary:
	return {
		"id": resident_id,
		"resident_id": resident_id,
		"job_id": job_id,
		"job_assignment_id": assignment_id,
		"workplace_id": "building.probe.staffed_farm",
		"workplace_role_ref": job_id,
		"schedule_state": "work",
		"alive": true,
		"existence_state": "alive",
		"age_band": "adult",
		"health": 30.0,
		"equipment": {
			"primary": {
				"item_id": tool_id,
				"count": 1,
				"instance": {"durability": 32, "max_durability": 32},
			},
		},
		"current_task": {},
		"transaction_history": [],
	}


func _owner_projection(
		resident_id: String,
		assignment_id: String,
		workplace_id: String) -> Dictionary:
	return {
		"id": resident_id,
		"resident_id": resident_id,
		"name": resident_id,
		"alive": true,
		"existence_state": "alive",
		"age_days": 7200,
		"age_band": "adult",
		"job_id": "job.farmer.basic",
		"job": "Farmer",
		"job_assignment_id": assignment_id,
		"workplace_id": workplace_id,
		"workplace_role_ref": "job.farmer.basic",
		"schedule_state": "work",
		"current_task": {},
	}


func _check(condition: bool, message: String) -> void:
	_checks += 1
	if not condition:
		_failures.append(message)
