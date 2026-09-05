extends Node

const ProfessionEngine = preload(
	"res://scripts/settlement/settlement_profession_engine.gd")
const WorksiteVisualScript = preload(
	"res://scripts/world/settlement_worksite_visual.gd")

var _checks := 0
var _failures: Array[String] = []


func _ready() -> void:
	_verify_registry_and_ownership()
	_verify_farming_lifecycle()
	_verify_worksite_visual_projection()
	_verify_material_blockers()
	_verify_mining_and_forestry()
	_verify_far_task_kernel()
	print("SET_001_PROFESSION_PROBE %s" % JSON.stringify({
		"ok": _failures.is_empty(),
		"checks": _checks,
		"failures": _failures,
	}))
	get_tree().quit(0 if _failures.is_empty() else 1)


func _verify_registry_and_ownership() -> void:
	var report := ProfessionEngine.validation_report()
	_check(bool(report.get("ok", false)),
		"profession registry did not validate: %s" % report)
	_check(int(report.get("definition_count", 0)) == 8,
		"profession registry does not cover all eight current jobs")
	_check(int(report.get("material_job_count", 0)) == 3,
		"material profession ownership is not limited to farmer/miner/lumberjack")
	var initial_sources := ProfessionEngine.initial_resource_sources(
		"building.food.basic_farm_plot", "building.probe.initial_farm",
		"settlement.probe.set_001", "survey.probe.initial_farm",
		"world.probe.set_001")
	var initial_farm: Dictionary = initial_sources.get(
		"source_contract.settlement.basic_farm_cultivation", {})
	_check(int(initial_farm.get("remaining_units", 0)) == 3 \
		and int(initial_farm.get("capacity_units", 0)) == 6,
		"completed farm did not receive its bounded cultivated-source state")
	_check(str((initial_farm.get("provenance", {}) as Dictionary).get(
		"evidence_id", "")) == "survey.probe.initial_farm",
		"completed workplace source lacks survey provenance")
	var expected := {
		"job.leader.elder": ["SET-001", "operational_non_material"],
		"job.builder.basic": ["SET-001", "operational"],
		"job.farmer.basic": ["SET-001", "operational"],
		"job.miner.basic": ["SET-001", "operational"],
		"job.lumberjack.basic": ["SET-001", "operational"],
		"job.guard.militia": ["COMBAT-001", "compatible_external_owner"],
		"job.merchant.basic": ["ECO-001", "deferred"],
		"job.mage.apprentice": ["SYS-001", "deferred"],
	}
	for job_id in expected:
		var definition := ProfessionEngine.profession_definition(job_id)
		_check(not definition.is_empty(), "missing profession %s" % job_id)
		_check(str(definition.get("owner_package_id", "")) == expected[job_id][0],
			"wrong package owner for %s" % job_id)
		_check(str(definition.get("implementation_status", "")) == expected[job_id][1],
			"wrong implementation status for %s" % job_id)
		if str(definition.get("implementation_status", "")) in [
			"deferred", "compatible_external_owner"]:
			_check(not str(definition.get("deferred_reason", "")).is_empty(),
				"deferred job has no explicit reason: %s" % job_id)


func _verify_farming_lifecycle() -> void:
	var resident := _resident(
		"resident.probe.farmer", "job.farmer.basic", "item.tool.hoe_basic")
	var building := _building(
		"building.probe.farm", "building.food.basic_farm_plot", 3, 4)
	var ledger := {"item.seed.wheat_basic": 1}
	var result := ProfessionEngine.advance_profession(
		resident, [building], ledger, 90.0)
	_check(bool(result.get("ok", false)) and str(result.get("status", "")) \
		== "traveling", "farmer task intent was not created before work")
	resident = result.get("resident", resident)
	building = result.get("buildings", [building])[0]
	_check(result.get("ledger", {}) == ledger,
		"task intent changed stock before reservation")
	var task: Dictionary = resident.get("current_task", {})
	_check(str(task.get("phase", "")) == "till" \
		and not bool(task.get("arrival_confirmed", false)),
		"farmer task did not begin with travel to tilling")
	var worksite: Dictionary = building.get("worksite_state", {})
	_check(str(worksite.get("schema", "")) \
			== ProfessionEngine.WORKSITE_STATE_SCHEMA \
			and str(worksite.get("crop_state", "")) == "fallow",
		"traveling farmer did not create a persistent fallow worksite state")

	result = ProfessionEngine.advance_profession(
		resident, [building], ledger, 90.0)
	_check(not bool(result.get("ok", false)) \
		and str(result.get("reason", "")) == "arrival_not_confirmed",
		"farmer performed off-screen work without arrival evidence")
	resident = result.get("resident", resident)
	result = ProfessionEngine.advance_profession(
		resident, [building], ledger, 90.0,
		_arrival(resident, "building.probe.farm"))
	_check(bool(result.get("ok", false)), "arrived farmer could not till")
	resident = result.get("resident", resident)
	building = result.get("buildings", [building])[0]
	ledger = result.get("ledger", ledger)
	task = resident.get("current_task", {})
	_check(str(task.get("phase", "")) == "plant" \
		and int(ledger.get("item.seed.wheat_basic", 0)) == 1,
		"tilling skipped directly to stock reservation or the wrong phase")
	worksite = building.get("worksite_state", {})
	_check(str(worksite.get("crop_state", "")) == "tilled",
		"completed tilling did not project tilled soil")

	result = ProfessionEngine.advance_profession(
		resident, [building], ledger, 36.0, _arrival(resident, "building.probe.farm"))
	resident = result.get("resident", resident)
	building = result.get("buildings", [building])[0]
	ledger = result.get("ledger", ledger)
	task = resident.get("current_task", {})
	_check(str(task.get("phase", "")) == "tend" \
		and int(ledger.get("item.seed.wheat_basic", 0)) == 0 \
		and bool(task.get("inputs_reserved", false)),
		"planting did not reserve exactly one seed")
	_check((task.get("reservation_transactions", []) as Array).size() == 1,
		"seed reservation was not journalled exactly once")
	worksite = building.get("worksite_state", {})
	_check(str(worksite.get("crop_state", "")) == "seeded" \
			and bool(worksite.get("inputs_reserved", false)),
		"planting did not project its reserved seed into the worksite")

	result = ProfessionEngine.advance_profession(
		resident, [building], ledger, 180.0, _arrival(resident, "building.probe.farm"))
	resident = result.get("resident", resident)
	building = result.get("buildings", [building])[0]
	ledger = result.get("ledger", ledger)
	_check(str((resident.get("current_task", {}) as Dictionary).get(
		"phase", "")) == "harvest", "crop tending did not precede harvest")
	worksite = building.get("worksite_state", {})
	_check(str(worksite.get("crop_state", "")) == "mature",
		"tending did not project a mature crop before harvest")

	result = ProfessionEngine.advance_profession(
		resident, [building], ledger, 54.0, _arrival(resident, "building.probe.farm"))
	resident = result.get("resident", resident)
	building = result.get("buildings", [building])[0]
	ledger = result.get("ledger", ledger)
	task = resident.get("current_task", {})
	_check(bool(result.get("ok", false)) and str(task.get("status", "")) \
		== "complete", "harvest did not complete its task")
	_check(int(ledger.get("item.crop.wheat", 0)) == 4 \
		and int(ledger.get("item.seed.wheat_basic", 0)) == 1,
		"harvest did not conserve and return planting stock")
	_check((result.get("transactions", []) as Array).size() == 1 \
		and str(result.get("transactions", [])[0].get("recipe_id", "")) \
			== "recipe.settlement.wheat_harvest",
		"farmer committed anything other than one canonical recipe cycle")
	var contract_id := "source_contract.settlement.basic_farm_cultivation"
	var source: Dictionary = (building.get(
		"resource_sources", {}) as Dictionary).get(contract_id, {})
	_check(int(source.get("remaining_units", -1)) == 2,
		"harvest did not deplete its cultivated source")
	_check((resident.get("transaction_history", []) as Array).size() == 1 \
		and bool((resident.get("transaction_history", [])[0] \
			as Dictionary).get("conserved", false)),
		"resident history lacks conserved result evidence")
	worksite = building.get("worksite_state", {})
	_check(str(worksite.get("crop_state", "")) == "harvested" \
			and (worksite.get("evidence_refs", []) as Array).size() >= 2,
		"harvested worksite lacks its movement and conserved-result evidence")
	var roundtrip: Variant = JSON.parse_string(JSON.stringify({
		"resident": resident, "building": building, "ledger": ledger,
	}))
	_check(roundtrip is Dictionary \
		and str((roundtrip["resident"]["current_task"] as Dictionary).get(
			"status", "")) == "complete" \
		and int(roundtrip["building"]["resource_sources"][contract_id].get(
			"remaining_units", -1)) == 2,
		"profession task or source state did not survive persistence roundtrip")
	_check(str(roundtrip["building"]["worksite_state"].get(
		"crop_state", "")) == "harvested",
		"worksite crop state did not survive persistence roundtrip")


func _verify_worksite_visual_projection() -> void:
	var visual: Node3D = WorksiteVisualScript.new()
	visual.setup("building.probe.visual_farm")
	add_child(visual)
	var state := {
		"schema": ProfessionEngine.WORKSITE_STATE_SCHEMA,
		"job_id": "job.farmer.basic",
		"crop_state": "seeded",
		"phase_progress": 0.0,
	}
	_check(visual.apply_state(state),
		"seeded worksite state was rejected by its visual projection")
	var snapshot: Dictionary = visual.visual_snapshot()
	_check(int(snapshot.get("soil_row_count", 0)) == 3 \
			and int(snapshot.get("plant_count", 0)) == 9,
		"seeded visual omitted soil rows or seedlings")
	state["crop_state"] = "growing"
	state["phase_progress"] = 0.8
	_check(visual.apply_state(state) \
			and int(visual.visual_snapshot().get("plant_count", 0)) == 15 \
			and float(visual.visual_snapshot().get("plant_height", 0.0)) > 0.7,
		"growing visual did not become a taller full crop")
	state["job_id"] = "job.miner.basic"
	_check(not visual.apply_state(state),
		"farm visual accepted a non-farming worksite")
	visual.queue_free()


func _verify_material_blockers() -> void:
	var farmer := _resident(
		"resident.probe.blocked_farmer", "job.farmer.basic", "item.tool.hoe_basic")
	var farm := _building(
		"building.probe.blocked_farm", "building.food.basic_farm_plot", 2, 3)
	var result := ProfessionEngine.advance_profession(
		farmer, [], {"item.seed.wheat_basic": 1}, 360.0)
	_check(not bool(result.get("ok", false)) \
		and str(result.get("reason", "")) == "active_workplace_missing",
		"farmer produced without a workplace")
	var no_tool := farmer.duplicate(true)
	no_tool["equipment"] = {}
	result = ProfessionEngine.advance_profession(
		no_tool, [farm], {"item.seed.wheat_basic": 1}, 360.0)
	_check(not bool(result.get("ok", false)) \
		and str(result.get("reason", "")) == "required_tool_missing",
		"farmer produced without a hoe")
	result = ProfessionEngine.advance_profession(
		farmer, [farm], {}, 360.0)
	_check(not bool(result.get("ok", false)) \
		and str(result.get("reason", "")) == "required_input_missing",
		"farmer produced without seed")
	var source_less := farm.duplicate(true)
	source_less["resource_sources"] = {}
	result = ProfessionEngine.advance_profession(
		farmer, [source_less], {"item.seed.wheat_basic": 1}, 360.0)
	_check(not bool(result.get("ok", false)) \
		and str(result.get("reason", "")) == "active_workplace_missing",
		"farmer produced without cultivated-source evidence")
	var off_schedule := farmer.duplicate(true)
	off_schedule["schedule_state"] = "rest"
	result = ProfessionEngine.advance_profession(
		off_schedule, [farm], {"item.seed.wheat_basic": 1}, 360.0)
	_check(not bool(result.get("ok", false)) \
		and str(result.get("reason", "")) == "resident_not_scheduled_for_work",
		"off-schedule farmer produced stock")


func _verify_mining_and_forestry() -> void:
	var cases := [
		{
			"resident": _resident("resident.probe.miner", "job.miner.basic",
				"item.tool.stone_pickaxe"),
			"building": _building("building.probe.mine",
				"building.extraction.mine_entrance", 2, 2),
			"minutes": 240.0,
			"outputs": {"item.resource.stone_chunk": 2,
				"item.resource.raw_iron_ore": 1},
		},
		{
			"resident": _resident("resident.probe.lumber",
				"job.lumberjack.basic", "item.tool.stone_axe"),
			"building": _building("building.probe.lumber",
				"building.extraction.lumber_camp", 2, 3),
			"minutes": 240.0,
			"outputs": {"natural.log.oak": 2},
		},
	]
	for case_value in cases:
		var case: Dictionary = case_value
		var resident: Dictionary = case["resident"]
		var building: Dictionary = case["building"]
		var result := ProfessionEngine.advance_profession(
			resident, [building], {}, 0.0)
		resident = result.get("resident", resident)
		result = ProfessionEngine.advance_profession(
			resident, result.get("buildings", [building]), {},
			float(case["minutes"]),
			_arrival(resident, str(building.get("instance_id", ""))))
		_check(bool(result.get("ok", false)) \
			and str((result.get("resident", {}).get(
				"current_task", {}) as Dictionary).get("status", "")) == "complete",
			"material worker did not complete: %s" % resident.get("job_id", ""))
		for stable_id in (case["outputs"] as Dictionary):
			_check(int(result.get("ledger", {}).get(stable_id, 0)) \
				== int(case["outputs"][stable_id]),
				"wrong conserved output for %s" % stable_id)


func _verify_far_task_kernel() -> void:
	var resident := _resident(
		"resident.probe.far_farmer", "job.farmer.basic", "item.tool.hoe_basic")
	var building := _building(
		"building.probe.far_farm", "building.food.basic_farm_plot", 3, 4)
	var unstaffed := SettlementSimulationEngine.simulate(
		[building], {"item.seed.wheat_basic": 1}, 360.0,
		SettlementSimulationEngine.MODE_FAR, true, true)
	_check(int(unstaffed.get("ledger", {}).get("item.crop.wheat", 0)) == 0 \
		and (unstaffed.get("transactions", []) as Array).is_empty(),
		"far building produced source material without a profession task")
	var result := ProfessionEngine.simulate_far_professions(
		{resident["resident_id"]: resident}, [building],
		{"item.seed.wheat_basic": 1}, 360.0)
	var far_resident: Dictionary = result.get(
		"residents", {}).get(resident["resident_id"], {})
	_check(bool(result.get("ok", false)) \
		and str((far_resident.get("current_task", {}) as Dictionary).get(
			"status", "")) == "complete",
		"far simulation skipped the persistent profession task sequence")
	_check(int(result.get("ledger", {}).get("item.crop.wheat", 0)) == 4 \
		and int(result.get("ledger", {}).get("item.seed.wheat_basic", 0)) == 1,
		"far profession kernel diverged from near conserved output")
	_check((result.get("transactions", []) as Array).size() == 1,
		"far profession kernel did not commit exactly one recipe transaction")


func _resident(resident_id: String, job_id: String, tool_id: String) -> Dictionary:
	return {
		"record_type": "Resident",
		"version": 1,
		"id": resident_id,
		"resident_id": resident_id,
		"job_id": job_id,
		"schedule_state": "work",
		"alive": true,
		"health": 30.0,
		"equipment": {"primary": {"item_id": tool_id, "count": 1,
			"instance": {"durability": 32, "max_durability": 32}}},
		"current_task": {},
		"destination": [],
		"transaction_history": [],
	}


func _building(
		instance_id: String,
		definition_id: String,
		remaining_units: int,
		capacity_units: int) -> Dictionary:
	var profession := {}
	for job_id in ProfessionEngine.material_job_ids():
		var candidate := ProfessionEngine.profession_definition(job_id)
		for workplace_value in candidate.get("workplaces", []):
			if str(workplace_value.get("definition_id", "")) == definition_id:
				profession = candidate
				break
	var recipe := {}
	var wanted_id := ""
	for workplace_value in profession.get("workplaces", []):
		if str(workplace_value.get("definition_id", "")) == definition_id:
			wanted_id = str(workplace_value.get("recipe_id", ""))
	for recipe_value in SettlementContentRegistry.get_behavior_for_definition(
			definition_id).get("recipes", []):
		if str(recipe_value.get("id", "")) == wanted_id:
			recipe = recipe_value
	var contract: Dictionary = recipe.get("source_contract", {})
	var renewable := str(contract.get("depletion_policy", "")) == "renewable"
	var source := {
		"schema": SettlementSimulationEngine.RESOURCE_SOURCE_SCHEMA,
		"version": SettlementSimulationEngine.RESOURCE_SOURCE_VERSION,
		"source_id": "source.probe.%s" % instance_id,
		"contract_id": str(contract.get("id", "")),
		"chain_ids": (contract.get("chain_ids", []) as Array).duplicate(),
		"source_class": str(contract.get("source_class", "")),
		"depletion_policy": str(contract.get("depletion_policy", "")),
		"active": true,
		"remaining_units": remaining_units,
		"capacity_units": capacity_units,
		"regeneration_units": 1 if renewable else 0,
		"regeneration_minutes": 1440.0 if renewable else 0.0,
		"regeneration_progress_minutes": 0.0,
		"provenance": {
			"origin_id": "world.probe.set_001",
			"owner_id": "settlement.probe.set_001",
			"evidence_id": "survey.probe.%s" % instance_id,
		},
	}
	return {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"owner_id": "settlement.probe.set_001",
		"condition": 1.0,
		"staffing": 1.0,
		"inputs_available": 1.0,
		"access": 1.0,
		"utilities": 1.0,
		"suitability": 1.0,
		"active": true,
		"position": [10.0, 2.0, 20.0],
		"buffers": {},
		"history": [],
		"resource_sources": {str(contract.get("id", "")): source},
	}


func _arrival(resident: Dictionary, workplace_id: String) -> Dictionary:
	var resident_id := str(resident.get("resident_id", ""))
	return {
		"arrived": true,
		"mover_id": resident_id,
		"destination_ref": workplace_id,
		"movement_intent_id": "movement_intent.probe.%s" % resident_id,
		"evidence_id": "movement_evidence.probe.%s" % resident_id,
	}


func _check(condition: bool, message: String) -> void:
	_checks += 1
	if not condition:
		_failures.append(message)
