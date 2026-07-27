class_name SettlementPlanEngine
extends RefCounted
## Persistent component-graph runtime for districts, complexes and megaprojects.


static func create_runtime(
		plan_id: String,
		instance_id: String,
		owner_id: String,
		boundary: Array = []) -> Dictionary:
	var plan := SettlementContentRegistry.get_plan(plan_id)
	if plan.is_empty() or instance_id.is_empty():
		return {}
	var component_records := {}
	var component_ids: Array[String] = []
	for component_value in plan.get("components", []):
		var component: Dictionary = component_value
		var component_id := str(component.get("id", ""))
		component_ids.append(component_id)
		component_records[component_id] = {
			"id": component_id,
			"role": str(component.get("role", "")),
			"project_template_id": str(
				component.get("project_template_id", "")),
			"status": "blocked" if not (
				component.get("prerequisites", []) as Array).is_empty()
				else "available",
			"progress": 0.0,
			"condition": 1.0,
			"reserved": {},
			"history": [],
		}
	var runtime := {
		"instance_id": instance_id,
		"definition_id": SettlementContentRegistry.canonical_id(plan_id),
		"owner_id": owner_id,
		"graph_kind": str(plan.get("graph_kind", "district_plan")),
		"phase_index": 0,
		"component_ids": component_ids,
		"component_records": component_records,
		"active": false,
		"complete": false,
		"activation": 0.0,
		"condition": 1.0,
		"lod_state": "record",
		"boundary": boundary.duplicate(true),
		"history": [],
	}
	return _recompute(runtime, plan)


static func available_components(runtime: Dictionary) -> Array[String]:
	var plan := SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", "")))
	var out: Array[String] = []
	for component_value in plan.get("components", []):
		var component: Dictionary = component_value
		var component_id := str(component.get("id", ""))
		var record: Dictionary = runtime.get(
			"component_records", {}).get(component_id, {})
		if str(record.get("status", "")) in ["complete", "building", "cancelled"]:
			continue
		if _prerequisites_complete(runtime, component):
			out.append(component_id)
	out.sort()
	return out


static func reserve_component(
		runtime_value: Dictionary,
		component_id: String,
		ledger_value: Dictionary) -> Dictionary:
	var runtime := runtime_value.duplicate(true)
	var ledger := _normalise_ledger(ledger_value)
	var plan := SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", "")))
	var component := _component(plan, component_id)
	if component.is_empty() or not _prerequisites_complete(runtime, component):
		return {"ok": false, "runtime": runtime, "ledger": ledger}
	var records: Dictionary = runtime.get("component_records", {})
	var record: Dictionary = records.get(component_id, {})
	if str(record.get("status", "")) not in ["available", "blocked"]:
		return {"ok": false, "runtime": runtime, "ledger": ledger}
	for requirement_value in component.get("requirements", []):
		var requirement: Dictionary = requirement_value
		if int(ledger.get(str(requirement.get("stable_id", "")), 0)) \
				< int(requirement.get("count", 0)):
			return {
				"ok": false,
				"reason": "insufficient_resources",
				"runtime": runtime,
				"ledger": ledger,
			}
	var reserved := {}
	for requirement_value in component.get("requirements", []):
		var requirement: Dictionary = requirement_value
		var stable_id := str(requirement.get("stable_id", ""))
		var count := int(requirement.get("count", 0))
		ledger[stable_id] = int(ledger.get(stable_id, 0)) - count
		reserved[stable_id] = int(reserved.get(stable_id, 0)) + count
	record["reserved"] = reserved
	record["status"] = "building"
	_append_component_history(record, "resources_reserved", {
		"reserved": reserved.duplicate(true),
	})
	records[component_id] = record
	runtime["component_records"] = records
	return {"ok": true, "runtime": runtime, "ledger": ledger}


static func advance_component(
		runtime_value: Dictionary,
		component_id: String,
		progress_delta: float) -> Dictionary:
	var runtime := runtime_value.duplicate(true)
	var plan := SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", "")))
	var component := _component(plan, component_id)
	var records: Dictionary = runtime.get("component_records", {})
	var record: Dictionary = records.get(component_id, {})
	if component.is_empty() or str(record.get("status", "")) != "building" \
			or progress_delta <= 0.0:
		return runtime
	record["progress"] = clampf(
		float(record.get("progress", 0.0)) + progress_delta, 0.0, 1.0)
	if float(record["progress"]) >= 1.0:
		record["status"] = "complete"
		record["reserved"] = {}
		_append_component_history(record, "component_activated")
	records[component_id] = record
	runtime["component_records"] = records
	return _recompute(runtime, plan)


static func cancel_component(
		runtime_value: Dictionary,
		component_id: String,
		ledger_value: Dictionary) -> Dictionary:
	var runtime := runtime_value.duplicate(true)
	var ledger := _normalise_ledger(ledger_value)
	var records: Dictionary = runtime.get("component_records", {})
	var record: Dictionary = records.get(component_id, {})
	if str(record.get("status", "")) != "building":
		return {"ok": false, "runtime": runtime, "ledger": ledger}
	for stable_value in (record.get("reserved", {}) as Dictionary):
		var stable_id := str(stable_value)
		ledger[stable_id] = int(ledger.get(stable_id, 0)) \
			+ int(record["reserved"][stable_value])
	record["reserved"] = {}
	record["status"] = "cancelled"
	record["progress"] = 0.0
	_append_component_history(record, "component_cancelled")
	records[component_id] = record
	runtime["component_records"] = records
	return {"ok": true, "runtime": runtime, "ledger": ledger}


static func damage_component(
		runtime_value: Dictionary,
		component_id: String,
		amount: float) -> Dictionary:
	var runtime := runtime_value.duplicate(true)
	var records: Dictionary = runtime.get("component_records", {})
	var record: Dictionary = records.get(component_id, {})
	if record.is_empty() or amount <= 0.0:
		return runtime
	record["condition"] = clampf(
		float(record.get("condition", 1.0)) - amount, 0.0, 1.0)
	_append_component_history(record, "component_damaged", {"amount": amount})
	records[component_id] = record
	runtime["component_records"] = records
	return _recompute(runtime, SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", ""))))


static func restore_component(
		runtime_value: Dictionary,
		component_id: String,
		amount: float) -> Dictionary:
	var runtime := runtime_value.duplicate(true)
	var records: Dictionary = runtime.get("component_records", {})
	var record: Dictionary = records.get(component_id, {})
	if record.is_empty() or amount <= 0.0:
		return runtime
	record["condition"] = clampf(
		float(record.get("condition", 1.0)) + amount, 0.0, 1.0)
	_append_component_history(record, "component_restored", {"amount": amount})
	records[component_id] = record
	runtime["component_records"] = records
	return _recompute(runtime, SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", ""))))


static func bounded_effects(runtime: Dictionary) -> Dictionary:
	var plan := SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", "")))
	var bounds: Dictionary = plan.get("bounded_effects", {})
	var activation := clampf(float(runtime.get("activation", 0.0)), 0.0, 1.0)
	return {
		"regional_radius": minf(
			float(bounds.get("maximum_regional_radius", 0.0)),
			float(bounds.get("maximum_regional_radius", 0.0)) * activation),
		"capacity_multiplier": minf(
			float(bounds.get("maximum_capacity_multiplier", 1.0)),
			1.0 + activation),
		"activation": activation,
	}


static func _recompute(runtime_value: Dictionary, plan: Dictionary) -> Dictionary:
	var runtime := runtime_value.duplicate(true)
	var records: Dictionary = runtime.get("component_records", {})
	var activation := 0.0
	var complete_count := 0
	var condition_sum := 0.0
	for component_value in plan.get("components", []):
		var component: Dictionary = component_value
		var component_id := str(component.get("id", ""))
		var record: Dictionary = records.get(component_id, {})
		if str(record.get("status", "")) == "complete":
			complete_count += 1
			var condition := clampf(
				float(record.get("condition", 1.0)), 0.0, 1.0)
			condition_sum += condition
			activation += float(component.get(
				"activation_contribution", 0.0)) * condition
		elif str(record.get("status", "")) == "blocked" \
				and _prerequisites_complete(runtime, component):
			record["status"] = "available"
			records[component_id] = record
	runtime["component_records"] = records
	runtime["activation"] = clampf(activation, 0.0, 1.0)
	runtime["active"] = activation >= float(
		plan.get("partial_activation_threshold", 1.0))
	runtime["complete"] = complete_count == (
		plan.get("components", []) as Array).size()
	runtime["condition"] = condition_sum / float(complete_count) \
		if complete_count > 0 else 1.0
	var phase_index := 0
	for phase_value in plan.get("phases", []):
		var phase: Dictionary = phase_value
		var phase_complete := true
		for component_id in phase.get("component_ids", []):
			if str(records.get(str(component_id), {}).get("status", "")) \
					!= "complete":
				phase_complete = false
				break
		if phase_complete:
			phase_index = int(phase.get("index", phase_index)) + 1
		else:
			break
	runtime["phase_index"] = phase_index
	return runtime


static func _prerequisites_complete(
		runtime: Dictionary,
		component: Dictionary) -> bool:
	var records: Dictionary = runtime.get("component_records", {})
	for prerequisite in component.get("prerequisites", []):
		if str(records.get(str(prerequisite), {}).get("status", "")) \
				!= "complete":
			return false
	return true


static func _component(plan: Dictionary, component_id: String) -> Dictionary:
	for component_value in plan.get("components", []):
		if str((component_value as Dictionary).get("id", "")) == component_id:
			return (component_value as Dictionary).duplicate(true)
	return {}


static func _append_component_history(
		record: Dictionary,
		event_id: String,
		details: Dictionary = {}) -> void:
	var history: Array = record.get("history", [])
	history.append({"event": event_id, "details": details.duplicate(true)})
	if history.size() > 64:
		history.pop_front()
	record["history"] = history


static func _normalise_ledger(value: Dictionary) -> Dictionary:
	var out := {}
	for stable_value in value:
		var stable_id := str(stable_value)
		var count := maxi(0, int(value[stable_value]))
		if not stable_id.is_empty() and count > 0:
			out[stable_id] = count
	return out
