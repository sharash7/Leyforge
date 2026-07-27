class_name SettlementSimulationEngine
extends RefCounted
## Deterministic near/far settlement kernel for Document 20 behavior records.
##
## Near mode may have actor and voxel views, while far mode remains record
## only. Both modes call this exact fixed-step transaction kernel.

const MODE_NEAR := "near"
const MODE_FAR := "far"
const MODES: Array[String] = [MODE_NEAR, MODE_FAR]


static func simulate(
		runtime_buildings: Array,
		resource_ledger: Dictionary,
		elapsed_minutes: float,
		mode: String = MODE_FAR) -> Dictionary:
	var records: Array[Dictionary] = []
	for value in runtime_buildings:
		if value is Dictionary:
			records.append(value.duplicate(true))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("instance_id", "")) < str(b.get("instance_id", "")))
	var ledger := _normalise_ledger(resource_ledger)
	var before := ledger.duplicate(true)
	var transactions: Array[Dictionary] = []
	if elapsed_minutes <= 0.0:
		return _result(records, ledger, before, transactions, mode)
	for record in records:
		if not bool(record.get("active", false)) \
				or float(record.get("condition", 1.0)) <= 0.0:
			continue
		var definition_id := str(record.get("definition_id", ""))
		var behavior := SettlementContentRegistry.get_behavior_for_definition(
			definition_id)
		if behavior.is_empty() or not _resource_zone_is_valid(
				definition_id, record):
			continue
		var factor := SettlementSimulationRules.effective_contribution(
			1.0,
			float(record.get("condition", 1.0)),
			float(record.get("staffing", 1.0)),
			1.0,
			float(record.get("access", 1.0)),
			float(record.get("utilities", 1.0)),
			float(record.get("suitability", 1.0)))
		if factor <= 0.0:
			continue
		var buffers: Dictionary = record.get("buffers", {}).duplicate(true)
		var recipes: Array = behavior.get("recipes", [])
		recipes.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str((a as Dictionary).get("id", "")) \
				< str((b as Dictionary).get("id", "")))
		for recipe_value in recipes:
			var recipe: Dictionary = recipe_value
			if factor < float(recipe.get("minimum_staffing", 0.0)):
				continue
			var recipe_id := str(recipe.get("id", ""))
			var progress_key := "recipe_progress:%s" % recipe_id
			var cycle_minutes := maxf(
				1.0, float(recipe.get("cycle_minutes", 1.0)))
			var progress := float(buffers.get(progress_key, 0.0)) \
				+ elapsed_minutes * factor
			var possible_cycles := maxi(0, floori(progress / cycle_minutes))
			var committed_cycles := 0
			for _cycle in possible_cycles:
				if not _can_consume(ledger, recipe.get("inputs", [])):
					break
				var consumed := _apply_amounts(
					ledger, recipe.get("inputs", []), -1)
				var produced := _apply_amounts(
					ledger, recipe.get("outputs", []), 1)
				transactions.append({
					"instance_id": str(record.get("instance_id", "")),
					"definition_id": definition_id,
					"recipe_id": recipe_id,
					"consumed": consumed,
					"produced": produced,
				})
				committed_cycles += 1
			progress -= float(committed_cycles) * cycle_minutes
			if committed_cycles < possible_cycles:
				# A starved building may retain one ready cycle, but cannot bank
				# unbounded work and burst-create resources after a late input.
				progress = minf(progress, cycle_minutes)
			buffers[progress_key] = maxf(0.0, progress)
		record["buffers"] = buffers
	return _result(records, ledger, before, transactions, mode)


static func service_snapshot(runtime_buildings: Array) -> Dictionary:
	var needs := {}
	var jobs := 0
	var storage := 0
	var networks := {}
	for need in SettlementSimulationRules.NEEDS:
		needs[need] = 0.0
	for value in runtime_buildings:
		if not (value is Dictionary):
			continue
		var record: Dictionary = value
		if not bool(record.get("active", false)):
			continue
		var behavior := SettlementContentRegistry.get_behavior_for_definition(
			str(record.get("definition_id", "")))
		if behavior.is_empty():
			continue
		var factor := SettlementSimulationRules.effective_contribution(
			1.0,
			float(record.get("condition", 1.0)),
			float(record.get("staffing", 1.0)),
			float(record.get("inputs_available", 1.0)),
			float(record.get("access", 1.0)),
			float(record.get("utilities", 1.0)),
			float(record.get("suitability", 1.0)))
		for need in behavior.get("need_capacity", {}):
			if str(need) in SettlementSimulationRules.NEEDS:
				needs[str(need)] = float(needs[str(need)]) \
					+ float(behavior["need_capacity"][need]) * factor
		jobs += floori(float(behavior.get("job_slots", 0)) * factor)
		storage += floori(float(behavior.get("storage_capacity", 0)) * factor)
		for role in behavior.get("network_roles", []):
			networks[str(role)] = int(networks.get(str(role), 0)) + 1
	return {
		"needs": needs,
		"jobs": jobs,
		"storage_capacity": storage,
		"networks": networks,
	}


static func assign_residents(
		residents: Array,
		runtime_buildings: Array) -> Dictionary:
	var resident_records: Array[Dictionary] = []
	for value in residents:
		if value is Dictionary and not str(value.get("id", "")).is_empty():
			resident_records.append(value.duplicate(true))
	resident_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("id", "")) < str(b.get("id", "")))
	var houses: Array[Dictionary] = []
	for value in runtime_buildings:
		if not (value is Dictionary) or not bool(value.get("active", false)):
			continue
		var record: Dictionary = value.duplicate(true)
		var behavior := SettlementContentRegistry.get_behavior_for_definition(
			str(record.get("definition_id", "")))
		var capacity := maxi(0, int(behavior.get("housing_capacity", 0)))
		if capacity <= 0:
			continue
		record["resident_ids"] = []
		record["_remaining_beds"] = capacity
		houses.append(record)
	houses.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("instance_id", "")) < str(b.get("instance_id", "")))
	var unassigned: Array[String] = []
	for resident in resident_records:
		var placed := false
		for house in houses:
			if int(house.get("_remaining_beds", 0)) <= 0:
				continue
			(house["resident_ids"] as Array).append(str(resident.get("id", "")))
			house["_remaining_beds"] = int(house["_remaining_beds"]) - 1
			placed = true
			break
		if not placed:
			unassigned.append(str(resident.get("id", "")))
	for house in houses:
		house.erase("_remaining_beds")
	return {"buildings": houses, "unassigned_resident_ids": unassigned}


static func capability_stage(runtime_buildings: Array) -> Dictionary:
	var active_definitions := {}
	for value in runtime_buildings:
		if value is Dictionary and bool(value.get("active", false)):
			active_definitions[str(value.get("definition_id", ""))] = true
	var achieved := "camp"
	var missing_by_stage := {}
	for stage in [
		"camp", "hamlet", "village", "fortified_village", "town", "city",
		"capital", "magical_metropolis",
	]:
		var missing: Array[String] = []
		for definition_id in SettlementContentRegistry.get_capability_gate(stage):
			if not active_definitions.has(definition_id):
				missing.append(definition_id)
		missing_by_stage[stage] = missing
		if missing.is_empty():
			achieved = stage
		else:
			break
	return {"stage": achieved, "missing_by_stage": missing_by_stage}


static func validate_transaction_result(result: Dictionary) -> bool:
	var expected := (result.get("before", {}) as Dictionary).duplicate(true)
	for transaction in result.get("transactions", []):
		for consumed in (transaction as Dictionary).get("consumed", []):
			var stable_id := str((consumed as Dictionary).get("stable_id", ""))
			expected[stable_id] = int(expected.get(stable_id, 0)) \
				- int((consumed as Dictionary).get("count", 0))
		for produced in (transaction as Dictionary).get("produced", []):
			var stable_id := str((produced as Dictionary).get("stable_id", ""))
			expected[stable_id] = int(expected.get(stable_id, 0)) \
				+ int((produced as Dictionary).get("count", 0))
	for stable_id in expected:
		if int(expected[stable_id]) != int(
				(result.get("ledger", {}) as Dictionary).get(stable_id, 0)):
			return false
	return true


static func _resource_zone_is_valid(
		definition_id: String,
		record: Dictionary) -> bool:
	if ".extraction." not in definition_id:
		return true
	return not str(record.get("resource_zone_id", "")).is_empty() \
		and bool(record.get("resource_zone_active", false))


static func _can_consume(ledger: Dictionary, amounts: Array) -> bool:
	for value in amounts:
		var amount: Dictionary = value
		if int(ledger.get(str(amount.get("stable_id", "")), 0)) \
				< int(amount.get("count", 0)):
			return false
	return true


static func _apply_amounts(
		ledger: Dictionary,
		amounts: Array,
		direction: int) -> Array[Dictionary]:
	var committed: Array[Dictionary] = []
	for value in amounts:
		var amount: Dictionary = value
		var stable_id := str(amount.get("stable_id", ""))
		var count := maxi(0, int(amount.get("count", 0)))
		ledger[stable_id] = maxi(
			0, int(ledger.get(stable_id, 0)) + count * direction)
		committed.append({
			"kind": str(amount.get("kind", "item")),
			"stable_id": stable_id,
			"count": count,
		})
	return committed


static func _normalise_ledger(value: Dictionary) -> Dictionary:
	var out := {}
	for stable_value in value:
		var stable_id := str(stable_value)
		var count := maxi(0, int(value[stable_value]))
		if not stable_id.is_empty() and count > 0:
			out[stable_id] = count
	return out


static func _result(
		records: Array[Dictionary],
		ledger: Dictionary,
		before: Dictionary,
		transactions: Array[Dictionary],
		mode: String) -> Dictionary:
	return {
		"buildings": records,
		"ledger": ledger,
		"before": before,
		"transactions": transactions,
		"mode": mode if mode in MODES else MODE_FAR,
		"kernel": "settlement.fixed_step.v1",
	}
