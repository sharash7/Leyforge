class_name SettlementProfessionEngine
extends RefCounted
## Authoritative material-profession task kernel for SET-001.
##
## Presentation actors may display work, mine or chop actions, but stock can
## only change here after the resident, schedule, tool, workplace, route
## arrival, inputs and resource source have all been evidenced.

const REGISTRY_PATH := "res://data/settlement/settlement_professions.json"
const ServiceEngine = preload(
	"res://scripts/settlement/settlement_service_engine.gd")
const TASK_SCHEMA := "leyforge.settlement-profession-task"
const TASK_VERSION := 1
const WORKSITE_STATE_SCHEMA := "leyforge.settlement-worksite-state"
const WORKSITE_STATE_VERSION := 1
const MATERIAL_ACTION_ENGINE := "settlement.material_profession.v1"

static var _registry: Dictionary = {}


static func profession_definition(job_id: String) -> Dictionary:
	_ensure_registry()
	for value in _registry.get("definitions", []):
		if value is Dictionary and str(value.get("job_id", "")) == job_id:
			return (value as Dictionary).duplicate(true)
	return {}


static func material_job_ids() -> Array[String]:
	_ensure_registry()
	var result: Array[String] = []
	for value in _registry.get("definitions", []):
		if value is Dictionary and bool(value.get("material_profession", false)):
			result.append(str(value.get("job_id", "")))
	result.sort()
	return result


static func initial_resource_sources(
		building_definition_id: String,
		building_instance_id: String,
		owner_id: String,
		evidence_id: String,
		origin_id: String = "") -> Dictionary:
	_ensure_registry()
	if building_instance_id.is_empty() or owner_id.is_empty() \
			or evidence_id.is_empty():
		return {}
	for value in _registry.get("definitions", []):
		if not (value is Dictionary) \
				or not bool(value.get("material_profession", false)):
			continue
		var definition: Dictionary = value
		for workplace_value in definition.get("workplaces", []):
			if not (workplace_value is Dictionary) or str(workplace_value.get(
					"definition_id", "")) != building_definition_id:
				continue
			var workplace: Dictionary = workplace_value
			var recipe := _recipe_for(building_definition_id, definition)
			var contract: Dictionary = recipe.get("source_contract", {})
			var initial: Dictionary = workplace.get("initial_source", {})
			if contract.is_empty() or initial.is_empty():
				return {}
			var contract_id := str(contract.get("id", ""))
			var renewable := str(contract.get(
				"depletion_policy", "")) == "renewable"
			var result := {}
			result[contract_id] = {
				"schema": SettlementSimulationEngine.RESOURCE_SOURCE_SCHEMA,
				"version": SettlementSimulationEngine.RESOURCE_SOURCE_VERSION,
				"source_id": "source.%s.%s" % [
					building_instance_id, contract_id],
				"contract_id": contract_id,
				"chain_ids": (contract.get("chain_ids", []) as Array).duplicate(),
				"source_class": str(contract.get("source_class", "")),
				"depletion_policy": str(contract.get("depletion_policy", "")),
				"active": true,
				"remaining_units": int(initial.get("initial_units", 0)),
				"capacity_units": int(initial.get("capacity_units", 0)),
				"regeneration_units": int(initial.get(
					"regeneration_units", 0)) if renewable else 0,
				"regeneration_minutes": float(initial.get(
					"regeneration_minutes", 0.0)) if renewable else 0.0,
				"regeneration_progress_minutes": 0.0,
				"provenance": {
					"origin_id": origin_id if not origin_id.is_empty() else owner_id,
					"owner_id": owner_id,
					"evidence_id": evidence_id,
				},
			}
			return result
	return {}


static func validation_report() -> Dictionary:
	_ensure_registry()
	var errors: Array[String] = []
	if str(_registry.get("schema", "")) != "leyforge.settlement-professions" \
			or int(_registry.get("version", 0)) != 1 \
			or str(_registry.get("package_id", "")) != "SET-001":
		errors.append("invalid_registry_envelope")
	var definitions: Array = _registry.get("definitions", [])
	var seen := {}
	for value in definitions:
		if not (value is Dictionary):
			errors.append("invalid_profession_record")
			continue
		var definition: Dictionary = value
		var job_id := str(definition.get("job_id", ""))
		if job_id.is_empty() or seen.has(job_id):
			errors.append("invalid_or_duplicate_job:%s" % job_id)
			continue
		seen[job_id] = true
		if str(definition.get("owner_package_id", "")).is_empty() \
				or str(definition.get("implementation_status", "")).is_empty() \
				or str(definition.get("action_engine", "")).is_empty():
			errors.append("missing_ownership_or_status:%s" % job_id)
		if bool(definition.get("material_profession", false)):
			_validate_material_definition(definition, errors)
	return {
		"ok": errors.is_empty(),
		"errors": errors,
		"definition_count": definitions.size(),
		"material_job_count": material_job_ids().size(),
	}


static func advance_profession(
		resident_value: Dictionary,
		runtime_buildings: Array,
		resource_ledger: Dictionary,
		elapsed_minutes: float,
		arrival_evidence: Dictionary = {},
		mode: String = SettlementSimulationEngine.MODE_NEAR) -> Dictionary:
	var resident := resident_value.duplicate(true)
	var buildings: Array[Dictionary] = []
	for value in runtime_buildings:
		if value is Dictionary:
			buildings.append((value as Dictionary).duplicate(true))
	buildings.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("instance_id", "")) < str(b.get("instance_id", "")))
	var ledger := _normalise_ledger(resource_ledger)
	var job_id := str(resident.get("job_id", ""))
	var definition := profession_definition(job_id)
	if definition.is_empty() or not bool(definition.get(
			"material_profession", false)):
		return _blocked(resident, buildings, ledger, "job_not_material_profession")
	var eligibility := _resident_eligibility(resident, definition)
	if not bool(eligibility.get("ok", false)):
		return _blocked(resident, buildings, ledger, str(eligibility.get(
			"reason", "resident_ineligible")))

	var task: Dictionary = resident.get("current_task", {}).duplicate(true)
	var task_is_current := str(task.get("schema", "")) == TASK_SCHEMA \
			and str(task.get("job_id", "")) == job_id \
			and str(task.get("status", "")) not in ["complete", "cancelled"]
	var building_index := -1
	var workplace := {}
	var recipe := {}
	if task_is_current:
		building_index = _building_index(
			buildings, str(task.get("workplace_instance_id", "")))
		if building_index >= 0:
			workplace = buildings[building_index]
			recipe = _recipe_for(
				str(workplace.get("definition_id", "")), definition)
	else:
		var selection := _select_workplace(buildings, definition)
		building_index = int(selection.get("index", -1))
		workplace = selection.get("building", {})
		recipe = selection.get("recipe", {})
	if building_index < 0 or workplace.is_empty() or recipe.is_empty():
		return _blocked(resident, buildings, ledger, "active_workplace_missing")
	var workplace_check := _workplace_eligibility(workplace, recipe)
	if not bool(workplace_check.get("ok", false)):
		return _blocked(resident, buildings, ledger, str(workplace_check.get(
			"reason", "workplace_ineligible")))

	if not task_is_current:
		if not _can_consume(ledger, recipe.get("inputs", [])):
			return _blocked(resident, buildings, ledger, "required_input_missing")
		task = _new_task(resident, workplace, recipe, definition)
		resident["current_task"] = task
		resident["destination"] = (task.get("destination", []) as Array).duplicate()
		buildings[building_index] = _sync_worksite_state(
			workplace, task, resident, recipe, definition, mode)
		return {
			"ok": true,
			"changed": true,
			"status": "traveling",
			"resident": resident,
			"buildings": buildings,
			"ledger": ledger,
			"transactions": [],
		}

	if not bool(task.get("arrival_confirmed", false)):
		var arrival_check := _validate_arrival(
			arrival_evidence, resident, workplace)
		if not bool(arrival_check.get("ok", false)):
			return _blocked(
				resident, buildings, ledger,
				str(arrival_check.get("reason", "arrival_not_confirmed")), false)
		task["arrival_confirmed"] = true
		task["arrival_evidence"] = arrival_evidence.duplicate(true)
		task["status"] = "active"
		task["pause_reason"] = ""
	else:
		task["status"] = "active"
		task["pause_reason"] = ""

	var advance_result := _advance_task(
		task, resident, workplace, recipe, definition, buildings,
		building_index, ledger, maxf(0.0, elapsed_minutes), mode)
	resident = advance_result.get("resident", resident)
	var advanced_task: Dictionary = advance_result.get("task", task)
	resident["current_task"] = advanced_task
	var advanced_buildings: Array = advance_result.get("buildings", buildings)
	if building_index >= 0 and building_index < advanced_buildings.size() \
			and advanced_buildings[building_index] is Dictionary:
		advanced_buildings[building_index] = _sync_worksite_state(
			advanced_buildings[building_index], advanced_task, resident,
			recipe, definition, mode)
	advance_result["buildings"] = advanced_buildings
	resident["destination"] = (
		(resident["current_task"] as Dictionary).get(
			"destination", []) as Array).duplicate()
	return {
		"ok": bool(advance_result.get("ok", false)),
		"changed": true,
		"status": str(advance_result.get("status", "active")),
		"reason": str(advance_result.get("reason", "")),
		"resident": resident,
		"buildings": advance_result.get("buildings", buildings),
		"ledger": advance_result.get("ledger", ledger),
		"transactions": advance_result.get("transactions", []),
		"unused_minutes": float(advance_result.get("unused_minutes", 0.0)),
	}


static func _sync_worksite_state(
		workplace_value: Dictionary,
		task: Dictionary,
		resident: Dictionary,
		recipe: Dictionary,
		definition: Dictionary,
		mode: String) -> Dictionary:
	var workplace := workplace_value.duplicate(true)
	var previous: Dictionary = workplace.get("worksite_state", {}).duplicate(true)
	var phase := str(task.get("phase", ""))
	var status := str(task.get("status", "unknown"))
	var phases: Array = definition.get("phases", [])
	var phase_index := int(task.get("phase_index", 0))
	var cycle_minutes := maxf(1.0, float(recipe.get("cycle_minutes", 1.0)))
	var phase_progress := maxf(0.0, float(task.get(
		"phase_progress_minutes", 0.0)))
	var phase_duration := 1.0
	if phase_index >= 0 and phase_index < phases.size():
		phase_duration = maxf(1.0, cycle_minutes * float(
			(phases[phase_index] as Dictionary).get("cycle_weight", 0.0)))
	var evidence_refs: Array[String] = []
	var arrival_id := str((task.get(
		"arrival_evidence", {}) as Dictionary).get("evidence_id", ""))
	if not arrival_id.is_empty():
		evidence_refs.append(arrival_id)
	var result_id := str((task.get(
		"result_evidence", {}) as Dictionary).get("event", ""))
	if not result_id.is_empty():
		evidence_refs.append("%s:%s" % [
			result_id, str(task.get("task_id", ""))])
	var history: Array = previous.get("phase_history", []).duplicate(true)
	if str(previous.get("task_id", "")) != str(task.get("task_id", "")) \
			or str(previous.get("phase", "")) != phase \
			or str(previous.get("status", "")) != status:
		history.append({
			"task_id": str(task.get("task_id", "")),
			"phase": phase,
			"status": status,
			"phase_index": phase_index,
		})
	while history.size() > 32:
		history.pop_front()
	workplace["worksite_state"] = {
		"record_type": "SettlementWorksiteState",
		"schema": WORKSITE_STATE_SCHEMA,
		"version": WORKSITE_STATE_VERSION,
		"worksite_instance_id": str(workplace.get("instance_id", "")),
		"worksite_definition_id": str(workplace.get("definition_id", "")),
		"resident_id": str(resident.get(
			"resident_id", resident.get("id", ""))),
		"job_id": str(resident.get("job_id", "")),
		"task_id": str(task.get("task_id", "")),
		"recipe_id": str(recipe.get("id", "")),
		"status": status,
		"phase": phase,
		"phase_index": phase_index,
		"phase_progress": clampf(phase_progress / phase_duration, 0.0, 1.0),
		"cycle_progress": clampf(float(task.get(
			"elapsed_work_minutes", 0.0)) / cycle_minutes, 0.0, 1.0),
		"crop_state": _crop_state_for_task(task, definition),
		"visual_profile": _visual_profile_for_recipe(recipe, definition),
		"inputs_reserved": bool(task.get("inputs_reserved", false)),
		"evidence_refs": evidence_refs,
		"phase_history": history,
		"simulation_mode": mode,
		"revision": int(previous.get("revision", 0)) + 1,
	}
	return workplace


static func _crop_state_for_task(
		task: Dictionary, definition: Dictionary) -> String:
	if str(definition.get("job_id", "")) != "job.farmer.basic":
		return "not_applicable"
	if str(task.get("status", "")) == "complete":
		return "harvested"
	match str(task.get("phase", "")):
		"till":
			return "fallow" if not bool(task.get(
				"arrival_confirmed", false)) else "tilled"
		"plant":
			return "tilled"
		"tend":
			return "growing" if float(task.get(
				"phase_progress_minutes", 0.0)) > 0.0 else "seeded"
		"harvest":
			return "mature"
	return "fallow"


static func _visual_profile_for_recipe(
		recipe: Dictionary, definition: Dictionary) -> String:
	if str(definition.get("job_id", "")) != "job.farmer.basic":
		return ""
	var recipe_id := str(recipe.get("id", ""))
	if "wheat" in recipe_id:
		return "farm.wheat.basic"
	if "advanced_provisions" in recipe_id:
		return "farm.terraced.mixed"
	return "farm.provisions.mixed"


static func simulate_far_professions(
		resident_records: Dictionary,
		runtime_buildings: Array,
		resource_ledger: Dictionary,
		elapsed_minutes: float) -> Dictionary:
	var residents := resident_records.duplicate(true)
	var buildings: Array = runtime_buildings.duplicate(true)
	var ledger := _normalise_ledger(resource_ledger)
	var transactions: Array = []
	var resident_ids: Array = residents.keys()
	resident_ids.sort()
	for resident_value in resident_ids:
		var resident_id := str(resident_value)
		var resident: Dictionary = residents[resident_value]
		if str(resident.get("job_id", "")) not in material_job_ids():
			continue
		var task: Dictionary = resident.get("current_task", {})
		var result := advance_profession(
			resident, buildings, ledger, 0.0, {},
			SettlementSimulationEngine.MODE_FAR)
		if bool(result.get("changed", false)):
			resident = result.get("resident", resident)
			buildings = result.get("buildings", buildings)
			ledger = result.get("ledger", ledger)
			task = resident.get("current_task", {})
		if not bool(result.get("ok", false)) \
				and str(result.get("reason", "")) != "arrival_not_confirmed":
			residents[resident_id] = resident
			continue
		var workplace_id := str(task.get("workplace_instance_id", ""))
		var evidence := {
			"arrived": true,
			"mover_id": resident_id,
			"destination_ref": workplace_id,
			"movement_intent_id": "movement_intent.far.%s.%s" % [
				resident_id, workplace_id],
			"evidence_id": "movement_evidence.far.%s.%s" % [
				resident_id, workplace_id],
			"lod_mode": "far",
		}
		result = advance_profession(
			resident, buildings, ledger, elapsed_minutes, evidence,
			SettlementSimulationEngine.MODE_FAR)
		if bool(result.get("changed", false)):
			resident = result.get("resident", resident)
			buildings = result.get("buildings", buildings)
			ledger = result.get("ledger", ledger)
			transactions.append_array(result.get("transactions", []))
		residents[resident_id] = resident
	return {
		"ok": true,
		"residents": residents,
		"buildings": buildings,
		"ledger": ledger,
		"transactions": transactions,
		"mode": SettlementSimulationEngine.MODE_FAR,
		"kernel": MATERIAL_ACTION_ENGINE,
	}


static func is_source_backed_recipe(recipe: Dictionary) -> bool:
	return not (recipe.get("source_contract", {}) as Dictionary).is_empty()


static func _advance_task(
		task_value: Dictionary,
		resident_value: Dictionary,
		workplace: Dictionary,
		recipe: Dictionary,
		definition: Dictionary,
		buildings_value: Array[Dictionary],
		building_index: int,
		ledger_value: Dictionary,
		elapsed_minutes: float,
		mode: String) -> Dictionary:
	var task := task_value.duplicate(true)
	var resident := resident_value.duplicate(true)
	var buildings := buildings_value.duplicate(true)
	var ledger := ledger_value.duplicate(true)
	var remaining := elapsed_minutes
	var transactions: Array = []
	var phases: Array = definition.get("phases", [])
	while remaining > 0.0 and int(task.get("phase_index", 0)) < phases.size():
		var phase_index := int(task.get("phase_index", 0))
		var phase: Dictionary = phases[phase_index]
		if bool(phase.get("reserve_inputs", false)) \
				and not bool(task.get("inputs_reserved", false)):
			var reservation := _reserve_inputs(
				ledger, recipe.get("inputs", []), resident, task)
			if not bool(reservation.get("ok", false)):
				task["status"] = "paused"
				task["pause_reason"] = str(reservation.get(
					"reason", "required_input_missing"))
				return _task_result(false, task, resident, buildings, ledger,
					transactions, remaining, task["pause_reason"])
			ledger = reservation.get("ledger", ledger)
			task = reservation.get("task", task)
		var cycle_minutes := maxf(1.0, float(recipe.get("cycle_minutes", 1.0)))
		var phase_minutes := maxf(
			1.0, cycle_minutes * float(phase.get("cycle_weight", 0.0)))
		var phase_progress := maxf(
			0.0, float(task.get("phase_progress_minutes", 0.0)))
		var applied := minf(remaining, maxf(0.0, phase_minutes - phase_progress))
		phase_progress += applied
		remaining -= applied
		task["phase_progress_minutes"] = phase_progress
		task["elapsed_work_minutes"] = float(task.get(
			"elapsed_work_minutes", 0.0)) + applied
		if phase_progress + 0.0001 < phase_minutes:
			break
		if bool(phase.get("commit_recipe", false)):
			var commit := _commit_recipe(
				workplace, recipe, task, ledger, mode)
			if not bool(commit.get("ok", false)):
				task["status"] = "paused"
				task["pause_reason"] = str(commit.get(
					"reason", "recipe_commit_rejected"))
				return _task_result(false, task, resident, buildings, ledger,
					transactions, remaining, task["pause_reason"])
			ledger = commit.get("ledger", ledger)
			buildings[building_index] = commit.get("building", workplace)
			transactions = commit.get("transactions", [])
			var evidence := {
				"event": "profession_recipe_committed",
				"task_id": str(task.get("task_id", "")),
				"resident_id": str(resident.get("resident_id", resident.get(
					"id", ""))),
				"job_id": str(resident.get("job_id", "")),
				"workplace_instance_id": str(workplace.get("instance_id", "")),
				"recipe_id": str(recipe.get("id", "")),
				"arrival_evidence_id": str((task.get(
					"arrival_evidence", {}) as Dictionary).get("evidence_id", "")),
				"transactions": transactions.duplicate(true),
				"conserved": true,
			}
			var history: Array = resident.get("transaction_history", []).duplicate(true)
			history.append(evidence)
			resident["transaction_history"] = history
			task["status"] = "complete"
			task["phase"] = "complete"
			task["phase_index"] = phases.size()
			task["phase_progress_minutes"] = 0.0
			task["result_evidence"] = evidence
			task["pause_reason"] = ""
			return _task_result(true, task, resident, buildings, ledger,
				transactions, remaining, "")
		task["phase_index"] = phase_index + 1
		task["phase_progress_minutes"] = 0.0
		if int(task["phase_index"]) < phases.size():
			task["phase"] = str((phases[int(task["phase_index"])] \
				as Dictionary).get("id", ""))
	return _task_result(true, task, resident, buildings, ledger,
		transactions, remaining, "")


static func _commit_recipe(
		workplace_value: Dictionary,
		recipe: Dictionary,
		task: Dictionary,
		ledger_value: Dictionary,
		mode: String) -> Dictionary:
	var workplace := workplace_value.duplicate(true)
	workplace["buffers"] = {}
	workplace["staffing"] = 1.0
	var commit_ledger := ledger_value.duplicate(true)
	for stable_value in (task.get("reserved_inputs", {}) as Dictionary):
		var stable_id := str(stable_value)
		commit_ledger[stable_id] = int(commit_ledger.get(stable_id, 0)) \
			+ int(task["reserved_inputs"][stable_value])
	var simulation := SettlementSimulationEngine.simulate(
		[workplace], commit_ledger,
		maxf(1.0, float(recipe.get("cycle_minutes", 1.0))), mode,
		false, mode != SettlementSimulationEngine.MODE_FAR)
	if not SettlementSimulationEngine.validate_transaction_result(simulation):
		return {"ok": false, "reason": "invalid_recipe_transaction"}
	var matching: Array = []
	for transaction_value in simulation.get("transactions", []):
		if transaction_value is Dictionary and str(transaction_value.get(
				"recipe_id", "")) == str(recipe.get("id", "")):
			matching.append(transaction_value)
	if matching.size() != 1:
		var source_contract: Dictionary = recipe.get("source_contract", {})
		var source_id := str(source_contract.get("id", ""))
		var source: Dictionary = (workplace.get(
			"resource_sources", {}) as Dictionary).get(source_id, {})
		return {
			"ok": false,
			"reason": "resource_source_unavailable" if source.is_empty() \
				else "recipe_inputs_or_source_exhausted",
		}
	return {
		"ok": true,
		"building": simulation.get("buildings", [workplace])[0],
		"ledger": simulation.get("ledger", commit_ledger),
		"transactions": matching,
	}


static func _new_task(
		resident: Dictionary,
		workplace: Dictionary,
		recipe: Dictionary,
		definition: Dictionary) -> Dictionary:
	var resident_id := str(resident.get("resident_id", resident.get("id", "")))
	var history_count := (resident.get("transaction_history", []) as Array).size()
	var phases: Array = definition.get("phases", [])
	return {
		"record_type": "NpcTask",
		"schema": TASK_SCHEMA,
		"version": TASK_VERSION,
		"task_id": "profession_task.%s.%s.%06d" % [
			resident_id, str(recipe.get("id", "")).replace(".", "_"), history_count],
		"kind": "material_profession",
		"job_id": str(resident.get("job_id", "")),
		"status": "traveling",
		"pause_reason": "",
		"workplace_instance_id": str(workplace.get("instance_id", "")),
		"workplace_definition_id": str(workplace.get("definition_id", "")),
		"recipe_id": str(recipe.get("id", "")),
		"phase_index": 0,
		"phase": str((phases[0] as Dictionary).get("id", "")),
		"phase_progress_minutes": 0.0,
		"elapsed_work_minutes": 0.0,
		"arrival_confirmed": false,
		"arrival_evidence": {},
		"inputs_reserved": false,
		"reserved_inputs": {},
		"reservation_transactions": [],
		"result_evidence": {},
		"destination": _building_destination(workplace),
		"progress_consumed": false,
	}


static func _reserve_inputs(
		ledger_value: Dictionary,
		inputs: Array,
		resident: Dictionary,
		task_value: Dictionary) -> Dictionary:
	var ledger := ledger_value.duplicate(true)
	var task := task_value.duplicate(true)
	if not _can_consume(ledger, inputs):
		return {"ok": false, "reason": "required_input_missing"}
	var reserved := {}
	var transactions: Array = task.get(
		"reservation_transactions", []).duplicate(true)
	for value in inputs:
		var content: Dictionary = value
		var stable_id := str(content.get("stable_id", ""))
		var count := maxi(0, int(content.get("count", 0)))
		ledger[stable_id] = int(ledger.get(stable_id, 0)) - count
		if int(ledger[stable_id]) <= 0:
			ledger.erase(stable_id)
		reserved[stable_id] = int(reserved.get(stable_id, 0)) + count
		transactions.append({
			"event": "profession_input_reserved",
			"task_id": str(task.get("task_id", "")),
			"resident_id": str(resident.get("resident_id", resident.get("id", ""))),
			"content_ref": content.duplicate(true),
			"conserved": true,
		})
	task["inputs_reserved"] = true
	task["reserved_inputs"] = reserved
	task["reservation_transactions"] = transactions
	return {"ok": true, "ledger": ledger, "task": task}


static func _resident_eligibility(
		resident: Dictionary, definition: Dictionary) -> Dictionary:
	if not bool(resident.get("alive", true)) \
			or float(resident.get("health", 1.0)) <= 0.0:
		return {"ok": false, "reason": "resident_biologically_unavailable"}
	if str(resident.get("schedule_state", "")) != "work":
		return {"ok": false, "reason": "resident_not_scheduled_for_work"}
	if not _has_required_tool(
			resident.get("equipment", {}), definition.get("tool_stable_ids", [])):
		return {"ok": false, "reason": "required_tool_missing"}
	return {"ok": true}


static func _workplace_eligibility(
		building: Dictionary, recipe: Dictionary) -> Dictionary:
	if not ServiceEngine.is_service_available(building):
		return {"ok": false, "reason": "workplace_inactive"}
	if float(building.get("condition", 0.0)) <= 0.0:
		return {"ok": false, "reason": "workplace_unserviceable"}
	if float(building.get("access", 0.0)) <= 0.0:
		return {"ok": false, "reason": "workplace_inaccessible"}
	if float(building.get("utilities", 1.0)) <= 0.0 \
			or float(building.get("inputs_available", 1.0)) <= 0.0:
		return {"ok": false, "reason": "workplace_service_missing"}
	var contract: Dictionary = recipe.get("source_contract", {})
	if contract.is_empty():
		return {"ok": false, "reason": "material_recipe_has_no_source_contract"}
	var source: Dictionary = (building.get(
		"resource_sources", {}) as Dictionary).get(
		str(contract.get("id", "")), {})
	if source.is_empty() or not bool(source.get("active", false)):
		return {"ok": false, "reason": "resource_source_unavailable"}
	return {"ok": true}


static func _validate_arrival(
		evidence: Dictionary,
		resident: Dictionary,
		workplace: Dictionary) -> Dictionary:
	var resident_id := str(resident.get("resident_id", resident.get("id", "")))
	if not bool(evidence.get("arrived", false)):
		return {"ok": false, "reason": "arrival_not_confirmed"}
	if str(evidence.get("mover_id", "")) != resident_id \
			or str(evidence.get("destination_ref", "")) \
				!= str(workplace.get("instance_id", "")) \
			or str(evidence.get("movement_intent_id", "")).is_empty() \
			or str(evidence.get("evidence_id", "")).is_empty():
		return {"ok": false, "reason": "arrival_evidence_invalid"}
	return {"ok": true}


static func _select_workplace(
		buildings: Array[Dictionary], definition: Dictionary) -> Dictionary:
	for index in buildings.size():
		var building: Dictionary = buildings[index]
		var recipe := _recipe_for(
			str(building.get("definition_id", "")), definition)
		if recipe.is_empty():
			continue
		if bool(_workplace_eligibility(building, recipe).get("ok", false)):
			return {"index": index, "building": building, "recipe": recipe}
	return {"index": -1, "building": {}, "recipe": {}}


static func _recipe_for(
		building_definition_id: String, profession: Dictionary) -> Dictionary:
	var wanted_recipe_id := ""
	for value in profession.get("workplaces", []):
		if value is Dictionary and str(value.get(
				"definition_id", "")) == building_definition_id:
			wanted_recipe_id = str(value.get("recipe_id", ""))
			break
	if wanted_recipe_id.is_empty():
		return {}
	var behavior := SettlementContentRegistry.get_behavior_for_definition(
		building_definition_id)
	for value in behavior.get("recipes", []):
		if value is Dictionary and str(value.get("id", "")) == wanted_recipe_id:
			return (value as Dictionary).duplicate(true)
	return {}


static func _building_index(buildings: Array[Dictionary], instance_id: String) -> int:
	for index in buildings.size():
		if str(buildings[index].get("instance_id", "")) == instance_id:
			return index
	return -1


static func _building_destination(building: Dictionary) -> Array:
	var position: Array = building.get("position", []).duplicate(true)
	if position.size() >= 3:
		return [float(position[0]), float(position[1]), float(position[2])]
	if position.size() >= 2:
		return [float(position[0]), 0.0, float(position[1])]
	return []


static func _has_required_tool(value: Variant, allowed_value: Array) -> bool:
	var allowed := {}
	for stable_value in allowed_value:
		allowed[str(stable_value)] = true
	if value is Dictionary:
		var record: Dictionary = value
		for field in ["stable_id", "item_id"]:
			if allowed.has(str(record.get(field, ""))):
				var instance: Dictionary = record.get("instance", {})
				return int(instance.get("durability", 1)) > 0
		for child in record.values():
			if _has_required_tool(child, allowed_value):
				return true
	elif value is Array:
		for child in value:
			if _has_required_tool(child, allowed_value):
				return true
	return false


static func _can_consume(ledger: Dictionary, amounts: Array) -> bool:
	for value in amounts:
		if not (value is Dictionary):
			return false
		var amount: Dictionary = value
		if int(ledger.get(str(amount.get("stable_id", "")), 0)) \
				< int(amount.get("count", 0)):
			return false
	return true


static func _normalise_ledger(value: Dictionary) -> Dictionary:
	var result := {}
	for stable_value in value:
		var stable_id := str(stable_value)
		var count := maxi(0, int(value[stable_value]))
		if not stable_id.is_empty() and count > 0:
			result[stable_id] = count
	return result


static func _blocked(
		resident: Dictionary,
		buildings: Array,
		ledger: Dictionary,
		reason: String,
		pause_existing: bool = true) -> Dictionary:
	var copy := resident.duplicate(true)
	if pause_existing:
		var task: Dictionary = copy.get("current_task", {}).duplicate(true)
		if str(task.get("schema", "")) == TASK_SCHEMA \
				and str(task.get("status", "")) not in ["complete", "cancelled"]:
			task["status"] = "paused"
			task["pause_reason"] = reason
			copy["current_task"] = task
	return {
		"ok": false,
		"changed": pause_existing and copy != resident,
		"status": "blocked",
		"reason": reason,
		"resident": copy,
		"buildings": buildings,
		"ledger": ledger,
		"transactions": [],
	}


static func _task_result(
		ok: bool,
		task: Dictionary,
		resident: Dictionary,
		buildings: Array,
		ledger: Dictionary,
		transactions: Array,
		unused_minutes: float,
		reason: String) -> Dictionary:
	return {
		"ok": ok,
		"status": str(task.get("status", "active")),
		"reason": reason,
		"task": task,
		"resident": resident,
		"buildings": buildings,
		"ledger": ledger,
		"transactions": transactions,
		"unused_minutes": unused_minutes,
	}


static func _validate_material_definition(
		definition: Dictionary, errors: Array[String]) -> void:
	var job_id := str(definition.get("job_id", ""))
	if str(definition.get("action_engine", "")) != MATERIAL_ACTION_ENGINE:
		errors.append("invalid_material_action_engine:%s" % job_id)
	var tools: Array = definition.get("tool_stable_ids", [])
	if tools.is_empty():
		errors.append("material_tools_missing:%s" % job_id)
	for stable_value in tools:
		if ItemRegistry.get_id_by_stable_id(str(stable_value)) < 0:
			errors.append("unknown_material_tool:%s:%s" % [job_id, stable_value])
	var phases: Array = definition.get("phases", [])
	var weight := 0.0
	var commit_count := 0
	var reserve_count := 0
	for value in phases:
		if not (value is Dictionary) or str(value.get("id", "")).is_empty():
			errors.append("invalid_material_phase:%s" % job_id)
			continue
		weight += float(value.get("cycle_weight", 0.0))
		commit_count += 1 if bool(value.get("commit_recipe", false)) else 0
		reserve_count += 1 if bool(value.get("reserve_inputs", false)) else 0
	if phases.is_empty() or not is_equal_approx(weight, 1.0) or commit_count != 1:
		errors.append("invalid_material_phase_contract:%s" % job_id)
	var workplaces: Array = definition.get("workplaces", [])
	if workplaces.is_empty():
		errors.append("material_workplaces_missing:%s" % job_id)
	for value in workplaces:
		if not (value is Dictionary) or _recipe_for(
				str(value.get("definition_id", "")), definition).is_empty():
			errors.append("unknown_material_workplace_recipe:%s" % job_id)
			continue
		var initial: Dictionary = value.get("initial_source", {})
		var initial_units := int(initial.get("initial_units", 0))
		var capacity_units := int(initial.get("capacity_units", 0))
		if initial_units <= 0 or capacity_units < initial_units:
			errors.append("invalid_material_initial_source:%s" % job_id)
		var recipe := _recipe_for(
			str(value.get("definition_id", "")), definition)
		var renewable := str((recipe.get(
			"source_contract", {}) as Dictionary).get(
				"depletion_policy", "")) == "renewable"
		if renewable and (int(initial.get("regeneration_units", 0)) <= 0 \
				or float(initial.get("regeneration_minutes", 0.0)) <= 0.0):
			errors.append("invalid_material_source_recovery:%s" % job_id)
	if reserve_count == 0:
		for value in workplaces:
			var recipe := _recipe_for(str(value.get("definition_id", "")), definition)
			if not (recipe.get("inputs", []) as Array).is_empty():
				errors.append("input_recipe_has_no_reservation_phase:%s" % job_id)


static func _ensure_registry() -> void:
	if not _registry.is_empty():
		return
	var file := FileAccess.open(REGISTRY_PATH, FileAccess.READ)
	if file == null:
		return
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	if parsed is Dictionary:
		_registry = (parsed as Dictionary).duplicate(true)
