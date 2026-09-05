class_name SettlementSimulationEngine
extends RefCounted
## Deterministic near/far settlement kernel for Document 20 behavior records.
##
## Near mode may have actor and voxel views, while far mode remains record
## only. Both modes call this exact fixed-step transaction kernel.

const ServiceEngine = preload(
	"res://scripts/settlement/settlement_service_engine.gd")

const MODE_NEAR := "near"
const MODE_FAR := "far"
const MODES: Array[String] = [MODE_NEAR, MODE_FAR]
const RESOURCE_SOURCE_SCHEMA := "leyforge.resource-source-state"
const RESOURCE_SOURCE_VERSION := 1


static func simulate(
		runtime_buildings: Array,
		resource_ledger: Dictionary,
		elapsed_minutes: float,
		mode: String = MODE_FAR,
		skip_source_backed_recipes: bool = false,
		apply_source_recovery: bool = true) -> Dictionary:
	var records: Array[Dictionary] = []
	for value in runtime_buildings:
		if value is Dictionary:
			records.append(value.duplicate(true))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("instance_id", "")) < str(b.get("instance_id", "")))
	var ledger := _normalise_ledger(resource_ledger)
	var before := ledger.duplicate(true)
	var transactions: Array[Dictionary] = []
	var source_before := _source_quantity_snapshot(records)
	var source_events: Array[Dictionary] = []
	if elapsed_minutes <= 0.0:
		return _result(records, ledger, before, transactions, source_before,
			source_events, mode)
	for record in records:
		var definition_id := str(record.get("definition_id", ""))
		var behavior := SettlementContentRegistry.get_behavior_for_definition(
			definition_id)
		if behavior.is_empty():
			continue
		var resource_sources: Dictionary = record.get(
			"resource_sources", {}).duplicate(true)
		var recipes: Array = behavior.get("recipes", [])
		recipes.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str((a as Dictionary).get("id", "")) \
				< str((b as Dictionary).get("id", "")))
		for recipe_value in recipes:
			var source_recipe: Dictionary = recipe_value
			var source_contract: Dictionary = source_recipe.get(
				"source_contract", {})
			if source_contract.is_empty() or not apply_source_recovery:
				continue
			var contract_id := str(source_contract.get("id", ""))
			var source_state: Dictionary = resource_sources.get(
				contract_id, {}).duplicate(true)
			if not _source_matches_contract(source_state, source_contract):
				continue
			source_state = _apply_source_recovery(
				record, source_recipe, source_contract, source_state,
				elapsed_minutes, source_events)
			resource_sources[contract_id] = source_state
		record["resource_sources"] = resource_sources
		if not ServiceEngine.is_service_available(record) \
				or float(record.get("condition", 1.0)) <= 0.0:
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
		for recipe_value in recipes:
			var recipe: Dictionary = recipe_value
			if skip_source_backed_recipes and not (recipe.get(
					"source_contract", {}) as Dictionary).is_empty():
				continue
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
			var source_contract: Dictionary = recipe.get("source_contract", {})
			var contract_id := str(source_contract.get("id", ""))
			for _cycle in possible_cycles:
				if not _can_consume(ledger, recipe.get("inputs", [])):
					break
				var source_state: Dictionary = resource_sources.get(
					contract_id, {}).duplicate(true)
				if not source_contract.is_empty() and not _can_deplete_source(
						source_state, source_contract):
					break
				var consumed := _apply_amounts(
					ledger, recipe.get("inputs", []), -1)
				var source_evidence := {}
				if not source_contract.is_empty():
					var depletion := _deplete_source(
						record, recipe, source_contract, source_state,
						source_events)
					source_state = depletion.get("state", {})
					source_evidence = depletion.get("evidence", {})
					resource_sources[contract_id] = source_state
				var produced := _apply_amounts(
					ledger, recipe.get("outputs", []), 1)
				transactions.append({
					"instance_id": str(record.get("instance_id", "")),
					"definition_id": definition_id,
					"recipe_id": recipe_id,
					"consumed": consumed,
					"produced": produced,
					"source": source_evidence,
				})
				committed_cycles += 1
			progress -= float(committed_cycles) * cycle_minutes
			if committed_cycles < possible_cycles:
				# A starved building may retain one ready cycle, but cannot bank
				# unbounded work and burst-create resources after a late input.
				progress = minf(progress, cycle_minutes)
			buffers[progress_key] = maxf(0.0, progress)
		record["buffers"] = buffers
		record["resource_sources"] = resource_sources
	return _result(records, ledger, before, transactions, source_before,
		source_events, mode)


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
		if not ServiceEngine.is_service_available(record):
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
		if not (value is Dictionary) \
				or not ServiceEngine.is_service_available(value):
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
		if value is Dictionary and ServiceEngine.is_service_available(value):
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
	var source_events_by_id := {}
	var expected_sources := (result.get(
		"source_before", {}) as Dictionary).duplicate(true)
	for event_value in result.get("source_events", []):
		if not (event_value is Dictionary):
			return false
		var source_event: Dictionary = event_value
		var event_id := str(source_event.get("event_id", ""))
		var source_key := str(source_event.get("source_key", ""))
		var event_type := str(source_event.get("type", ""))
		var units := int(source_event.get("units", 0))
		var before_units := int(source_event.get("before_units", -1))
		var after_units := int(source_event.get("after_units", -1))
		if event_id.is_empty() or source_events_by_id.has(event_id) \
				or not expected_sources.has(source_key) or units <= 0 \
				or int(expected_sources[source_key]) != before_units:
			return false
		if event_type == "recovery":
			if after_units != before_units + units:
				return false
		elif event_type == "depletion":
			if after_units != before_units - units or after_units < 0:
				return false
		else:
			return false
		expected_sources[source_key] = after_units
		source_events_by_id[event_id] = source_event
	for transaction in result.get("transactions", []):
		if not (transaction is Dictionary):
			return false
		var transaction_record: Dictionary = transaction
		for consumed in transaction_record.get("consumed", []):
			var stable_id := str((consumed as Dictionary).get("stable_id", ""))
			expected[stable_id] = int(expected.get(stable_id, 0)) \
				- int((consumed as Dictionary).get("count", 0))
		for produced in transaction_record.get("produced", []):
			var stable_id := str((produced as Dictionary).get("stable_id", ""))
			expected[stable_id] = int(expected.get(stable_id, 0)) \
				+ int((produced as Dictionary).get("count", 0))
		var source: Dictionary = transaction_record.get("source", {})
		if (transaction_record.get("consumed", []) as Array).is_empty() \
				and not (transaction_record.get("produced", []) as Array).is_empty() \
				and source.is_empty():
			return false
		if not source.is_empty():
			var source_event_id := str(source.get("event_id", ""))
			if not source_events_by_id.has(source_event_id) \
					or str((source_events_by_id[source_event_id] as Dictionary).get(
						"type", "")) != "depletion" \
					or str(source.get("source_id", "")).is_empty() \
					or str(source.get("origin_id", "")).is_empty() \
					or str(source.get("owner_id", "")).is_empty() \
					or str(source.get("evidence_id", "")).is_empty():
				return false
	for stable_id in expected:
		if int(expected[stable_id]) != int(
				(result.get("ledger", {}) as Dictionary).get(stable_id, 0)):
			return false
	var final_sources := _source_quantity_snapshot(result.get("buildings", []))
	if final_sources.size() != expected_sources.size():
		return false
	for source_key in expected_sources:
		if int(expected_sources[source_key]) != int(
				final_sources.get(source_key, -1)):
			return false
	return true


static func _source_matches_contract(
		source: Dictionary,
		contract: Dictionary) -> bool:
	if source.is_empty() or not bool(source.get("active", false)) \
			or str(source.get("schema", "")) != RESOURCE_SOURCE_SCHEMA \
			or int(source.get("version", 0)) != RESOURCE_SOURCE_VERSION \
			or str(source.get("source_id", "")).is_empty() \
			or str(source.get("contract_id", "")) != str(contract.get("id", "")) \
			or str(source.get("source_class", "")) \
				!= str(contract.get("source_class", "")) \
			or str(source.get("depletion_policy", "")) \
				!= str(contract.get("depletion_policy", "")):
		return false
	var source_chains: Array = source.get("chain_ids", [])
	var contract_chains: Array = contract.get("chain_ids", [])
	if source_chains != contract_chains:
		return false
	var remaining := int(source.get("remaining_units", -1))
	var capacity := int(source.get("capacity_units", -1))
	if remaining < 0 or capacity <= 0 or remaining > capacity:
		return false
	var provenance: Dictionary = source.get("provenance", {})
	for field_name in contract.get("required_provenance_fields", []):
		if str(provenance.get(str(field_name), "")).is_empty():
			return false
	if str(contract.get("depletion_policy", "")) == "renewable" \
			and (int(source.get("regeneration_units", 0)) <= 0 \
				or float(source.get("regeneration_minutes", 0.0)) <= 0.0):
		return false
	return true


static func _can_deplete_source(
		source: Dictionary,
		contract: Dictionary) -> bool:
	return _source_matches_contract(source, contract) \
		and int(source.get("remaining_units", 0)) \
			>= int(contract.get("units_per_cycle", 0))


static func _apply_source_recovery(
		record: Dictionary,
		recipe: Dictionary,
		contract: Dictionary,
		source: Dictionary,
		elapsed_minutes: float,
		source_events: Array[Dictionary]) -> Dictionary:
	if str(contract.get("depletion_policy", "")) != "renewable":
		return source
	var interval := float(source.get("regeneration_minutes", 0.0))
	var units_per_interval := int(source.get("regeneration_units", 0))
	if interval <= 0.0 or units_per_interval <= 0:
		return source
	var progress := maxf(0.0, float(source.get(
		"regeneration_progress_minutes", 0.0))) + elapsed_minutes
	var intervals := maxi(0, floori(progress / interval))
	progress -= float(intervals) * interval
	source["regeneration_progress_minutes"] = progress
	if intervals <= 0:
		return source
	var before_units := int(source.get("remaining_units", 0))
	var capacity := int(source.get("capacity_units", before_units))
	var after_units := mini(
		capacity, before_units + intervals * units_per_interval)
	source["remaining_units"] = after_units
	var recovered := after_units - before_units
	if recovered > 0:
		source_events.append(_source_event(
			"recovery", record, recipe, contract, source,
			before_units, after_units, recovered, source_events.size()))
	return source


static func _deplete_source(
		record: Dictionary,
		recipe: Dictionary,
		contract: Dictionary,
		source: Dictionary,
		source_events: Array[Dictionary]) -> Dictionary:
	var units := int(contract.get("units_per_cycle", 0))
	var before_units := int(source.get("remaining_units", 0))
	var after_units := before_units - units
	source["remaining_units"] = after_units
	var event := _source_event(
		"depletion", record, recipe, contract, source,
		before_units, after_units, units, source_events.size())
	source_events.append(event)
	var provenance: Dictionary = source.get("provenance", {})
	return {
		"state": source,
		"evidence": {
			"event_id": str(event.get("event_id", "")),
			"source_id": str(source.get("source_id", "")),
			"contract_id": str(contract.get("id", "")),
			"chain_ids": (contract.get("chain_ids", []) as Array).duplicate(),
			"units_consumed": units,
			"remaining_before": before_units,
			"remaining_after": after_units,
			"origin_id": str(provenance.get("origin_id", "")),
			"owner_id": str(provenance.get("owner_id", "")),
			"evidence_id": str(provenance.get("evidence_id", "")),
		},
	}


static func _source_event(
		type: String,
		record: Dictionary,
		recipe: Dictionary,
		contract: Dictionary,
		source: Dictionary,
		before_units: int,
		after_units: int,
		units: int,
		sequence: int) -> Dictionary:
	var instance_id := str(record.get("instance_id", ""))
	var contract_id := str(contract.get("id", ""))
	return {
		"event_id": "source_event.%s.%s.%06d" % [
			instance_id, contract_id, sequence],
		"type": type,
		"source_key": _source_key(instance_id, contract_id),
		"instance_id": instance_id,
		"definition_id": str(record.get("definition_id", "")),
		"recipe_id": str(recipe.get("id", "")),
		"contract_id": contract_id,
		"source_id": str(source.get("source_id", "")),
		"chain_ids": (contract.get("chain_ids", []) as Array).duplicate(),
		"before_units": before_units,
		"after_units": after_units,
		"units": units,
	}


static func _source_quantity_snapshot(records: Array) -> Dictionary:
	var out := {}
	for value in records:
		if not (value is Dictionary):
			continue
		var record: Dictionary = value
		var instance_id := str(record.get("instance_id", ""))
		for contract_value in (record.get(
				"resource_sources", {}) as Dictionary):
			var contract_id := str(contract_value)
			var source: Dictionary = record["resource_sources"][contract_value]
			out[_source_key(instance_id, contract_id)] = maxi(
				0, int(source.get("remaining_units", 0)))
	return out


static func _source_key(instance_id: String, contract_id: String) -> String:
	return "%s|%s" % [instance_id, contract_id]


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
		source_before: Dictionary,
		source_events: Array[Dictionary],
		mode: String) -> Dictionary:
	return {
		"buildings": records,
		"ledger": ledger,
		"before": before,
		"transactions": transactions,
		"source_before": source_before,
		"source_events": source_events,
		"mode": mode if mode in MODES else MODE_FAR,
		"kernel": "settlement.fixed_step.v1",
		"resource_accounting": "settlement.resource-source.v1",
	}
