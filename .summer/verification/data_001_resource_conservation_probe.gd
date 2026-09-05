extends Node
## DATA-001 gate for authored source provenance and conserved settlement output.

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	_verify_catalogue_contracts()
	_verify_finite_source_depletion()
	_verify_renewable_source_recovery()
	_verify_near_far_and_tamper_rejection()
	print("DATA_001_RESOURCE_CONSERVATION_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _verify_catalogue_contracts() -> void:
	_check(SettlementContentRegistry.validation_errors.is_empty(),
		"settlement catalogue did not pass source-contract validation")
	var recipe_count := 0
	var source_recipe_count := 0
	var input_recipe_count := 0
	var contract_ids := {}
	for behavior_value in SettlementContentRegistry.behaviors.values():
		var behavior: Dictionary = behavior_value.to_dictionary()
		for recipe_value in behavior.get("recipes", []):
			var recipe: Dictionary = recipe_value
			recipe_count += 1
			var inputs: Array = recipe.get("inputs", [])
			var outputs: Array = recipe.get("outputs", [])
			var contract: Dictionary = recipe.get("source_contract", {})
			_check(not outputs.is_empty(),
				"recipe has no declared output: %s" % recipe.get("id", ""))
			_check(not inputs.is_empty() or not contract.is_empty(),
				"recipe can create output without stock or a source: %s/%s" % [
					behavior.get("definition_id", ""), recipe.get("id", "")])
			if not inputs.is_empty():
				input_recipe_count += 1
			if not contract.is_empty():
				source_recipe_count += 1
				var contract_id := str(contract.get("id", ""))
				_check(not contract_ids.has(contract_id),
					"source contract identity was reused: %s" % contract_id)
				contract_ids[contract_id] = true
				_check((contract.get("chain_ids", []) as Array).size() > 0,
					"source contract omitted its governed chain: %s" % contract_id)
				for field_name in ["origin_id", "owner_id", "evidence_id"]:
					_check(field_name in contract.get(
						"required_provenance_fields", []),
						"source contract omitted %s: %s" % [
							field_name, contract_id])
	_check(recipe_count == 23 and input_recipe_count == 17 \
			and source_recipe_count == 10,
		"settlement recipe/source inventory drifted from the DATA-001 disposition")
	var fishery := SettlementContentRegistry.get_behavior_for_definition(
		"building.food.fishery_fishing_dock")
	_check((fishery.get("recipes", []) as Array).is_empty(),
		"Set 26 fishery still used the retired wild-berries placeholder recipe")
	var sawmill := SettlementContentRegistry.get_behavior_for_definition(
		"building.extraction.sawmill")
	var sawmill_recipe: Dictionary = sawmill.get("recipes", [])[0]
	_check(str(sawmill_recipe.get("inputs", [])[0].get("stable_id", "")) \
			== "natural.log.oak" \
			and str(sawmill_recipe.get("outputs", [])[0].get(
				"stable_id", "")) == "construction.planks.oak",
		"sawmill did not transform conserved logs into canonical planks")


func _verify_finite_source_depletion() -> void:
	var definition_id := "building.extraction.mine_entrance"
	var contract := _contract(definition_id)
	var source := _source_state(contract, "source.probe.iron", 2, 2)
	var building := _runtime_building(
		"building.probe.mine", definition_id, contract, source)
	var result := SettlementSimulationEngine.simulate([building], {}, 720.0)
	var ledger: Dictionary = result.get("ledger", {})
	_check(int(ledger.get("item.resource.stone_chunk", 0)) == 4 \
			and int(ledger.get("item.resource.raw_iron_ore", 0)) == 2,
		"finite mine did not commit exactly two bounded yields")
	_check((result.get("transactions", []) as Array).size() == 2 \
			and (result.get("source_events", []) as Array).size() == 2,
		"finite mine did not journal each source depletion with its output")
	_check(_remaining(result, contract) == 0,
		"finite mine did not persist its exhausted quantity")
	_check(SettlementSimulationEngine.validate_transaction_result(result),
		"finite mine ledger/source transaction did not reconcile")
	var exhausted := SettlementSimulationEngine.simulate(
		result.get("buildings", []), ledger, 240.0)
	_check(exhausted.get("ledger", {}) == ledger \
			and (exhausted.get("transactions", []) as Array).is_empty(),
		"exhausted finite source created material on a later tick")
	var legacy_zone_only := _runtime_building(
		"building.probe.legacy_zone", definition_id, {}, {})
	legacy_zone_only["resource_zone_id"] = "resource_zone.legacy.unquantified"
	legacy_zone_only["resource_zone_active"] = true
	var rejected := SettlementSimulationEngine.simulate(
		[legacy_zone_only], {}, 480.0)
	_check((rejected.get("ledger", {}) as Dictionary).is_empty() \
			and (rejected.get("source_events", []) as Array).is_empty(),
		"legacy zone flags bypassed quantified source ownership")


func _verify_renewable_source_recovery() -> void:
	var definition_id := "building.food.basic_farm_plot"
	var contract := _contract(definition_id)
	var source := _source_state(contract, "source.probe.cultivated_plot", 0, 2)
	source["regeneration_units"] = 1
	source["regeneration_minutes"] = 360.0
	var building := _runtime_building(
		"building.probe.farm", definition_id, contract, source)
	var result := SettlementSimulationEngine.simulate(
		[building], {"item.seed.wheat_basic": 1}, 720.0)
	_check(int(result.get("ledger", {}).get("item.crop.wheat", 0)) == 8 \
			and int(result.get("ledger", {}).get(
				"item.seed.wheat_basic", 0)) == 1,
		"renewable plot did not recover and commit its bounded harvest")
	_check((result.get("source_events", []) as Array).size() == 3 \
			and str(result.get("source_events", [])[0].get("type", "")) \
				== "recovery" \
			and int(result.get("source_events", [])[0].get("units", 0)) == 2,
		"renewable source recovery was not journalled before depletion")
	_check(_remaining(result, contract) == 0 \
			and SettlementSimulationEngine.validate_transaction_result(result),
		"renewable recovery/depletion did not reconcile to the final source")
	var next := SettlementSimulationEngine.simulate(
		result.get("buildings", []), result.get("ledger", {}), 360.0)
	_check(int(next.get("ledger", {}).get("item.crop.wheat", 0)) == 12 \
			and _remaining(next, contract) == 0,
		"renewable source failed its next bounded recovery window")


func _verify_near_far_and_tamper_rejection() -> void:
	var definition_id := "building.extraction.lumber_camp"
	var contract := _contract(definition_id)
	var source := _source_state(contract, "source.probe.forest", 2, 3)
	source["regeneration_units"] = 1
	source["regeneration_minutes"] = 480.0
	var building := _runtime_building(
		"building.probe.lumber", definition_id, contract, source)
	var near := SettlementSimulationEngine.simulate(
		[building], {}, 480.0, SettlementSimulationEngine.MODE_NEAR)
	var far := SettlementSimulationEngine.simulate(
		[building], {}, 480.0, SettlementSimulationEngine.MODE_FAR)
	_check(near.get("ledger", {}) == far.get("ledger", {}) \
			and near.get("buildings", []) == far.get("buildings", []) \
			and near.get("source_events", []) == far.get("source_events", []),
		"near/far modes diverged in source recovery or depletion")
	_check(SettlementSimulationEngine.validate_transaction_result(near) \
			and SettlementSimulationEngine.validate_transaction_result(far),
		"near/far source journals did not independently reconcile")
	var tampered_ledger: Dictionary = near.duplicate(true)
	tampered_ledger["ledger"]["natural.log.oak"] = 999
	_check(not SettlementSimulationEngine.validate_transaction_result(
		tampered_ledger), "tampered produced quantity was accepted")
	var tampered_source: Dictionary = near.duplicate(true)
	var first_record: Dictionary = tampered_source["buildings"][0]
	var sources: Dictionary = first_record.get("resource_sources", {})
	sources[str(contract.get("id", ""))]["remaining_units"] = 2
	_check(not SettlementSimulationEngine.validate_transaction_result(
		tampered_source), "tampered source depletion was accepted")
	var tampered_provenance: Dictionary = near.duplicate(true)
	tampered_provenance["transactions"][0]["source"]["evidence_id"] = ""
	_check(not SettlementSimulationEngine.validate_transaction_result(
		tampered_provenance), "missing source provenance was accepted")


func _contract(definition_id: String) -> Dictionary:
	var behavior := SettlementContentRegistry.get_behavior_for_definition(
		definition_id)
	return (behavior.get("recipes", [])[0] as Dictionary).get(
		"source_contract", {}).duplicate(true)


func _source_state(
		contract: Dictionary,
		source_id: String,
		remaining_units: int,
		capacity_units: int) -> Dictionary:
	var renewable := str(contract.get("depletion_policy", "")) == "renewable"
	return {
		"schema": SettlementSimulationEngine.RESOURCE_SOURCE_SCHEMA,
		"version": SettlementSimulationEngine.RESOURCE_SOURCE_VERSION,
		"source_id": source_id,
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
			"origin_id": "world.probe.data_001",
			"owner_id": "settlement.probe.data_001",
			"evidence_id": "survey.probe.%s" % source_id,
		},
	}


func _runtime_building(
		instance_id: String,
		definition_id: String,
		contract: Dictionary,
		source: Dictionary) -> Dictionary:
	var sources := {}
	if not contract.is_empty() and not source.is_empty():
		sources[str(contract.get("id", ""))] = source.duplicate(true)
	return {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"owner_id": "settlement.probe.data_001",
		"condition": 1.0,
		"staffing": 1.0,
		"inputs_available": 1.0,
		"access": 1.0,
		"utilities": 1.0,
		"suitability": 1.0,
		"active": true,
		"buffers": {},
		"history": [],
		"resource_sources": sources,
	}


func _remaining(result: Dictionary, contract: Dictionary) -> int:
	var record: Dictionary = result.get("buildings", [])[0]
	var source: Dictionary = (record.get(
		"resource_sources", {}) as Dictionary).get(
			str(contract.get("id", "")), {})
	return int(source.get("remaining_units", -1))
