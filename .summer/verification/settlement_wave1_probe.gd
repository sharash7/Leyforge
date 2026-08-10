extends Node
## Protected 30-definition Forest Hamlet data, simulation and persistence gate.

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _runtime(
		instance_id: String,
		definition_id: String,
		extra: Dictionary = {}) -> Dictionary:
	var record := {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"blueprint_id": "",
		"owner_id": HamletState.VILLAGE_ID,
		"condition": 1.0,
		"staffing": 1.0,
		"inputs_available": 1.0,
		"access": 1.0,
		"utilities": 1.0,
		"suitability": 1.0,
		"active": true,
		"buffers": {},
		"history": [],
	}
	record.merge(extra, true)
	return record


func _run() -> void:
	var definitions := SettlementContentRegistry.definitions_for_scope(
		"technical_poc")
	definitions.append_array(SettlementContentRegistry.definitions_for_scope(
		"extended_slice"))
	_check(definitions.size() == 30,
		"protected Forest Hamlet roster was not exactly 30 definitions")
	var catalogue_ids := {}
	for definition in definitions:
		var definition_id := str(definition.get("id", ""))
		catalogue_ids[definition_id] = true
		_check(not str(definition.get("purpose", "")).is_empty()
				and int(definition.get("release_wave", 0)) == 1,
			"%s did not carry its detailed companion profile" % definition_id)
		_check(not (definition.get("required_markers", []) as Array).is_empty()
				and not (definition.get("capabilities", []) as Array).is_empty(),
			"%s omitted markers or capabilities" % definition_id)
		var project := SettlementContentRegistry.get_construction_project_for_definition(
			definition_id)
		var behavior := SettlementContentRegistry.get_behavior_for_definition(
			definition_id)
		_check(not project.is_empty() and not behavior.is_empty(),
			"%s omitted its project or behavior contract" % definition_id)
		var blueprint_id := str(project.get("blueprint_id", ""))
		_check(bool(SettlementContentRegistry.validate_blueprint(
			blueprint_id).get("ok", false)),
			"%s did not own a validated forest-neutral blueprint" % definition_id)
	_check(catalogue_ids.has("building.construction.builder_supply_yard")
			and catalogue_ids.has("building.storage.village_warehouse"),
		"canonical protected infrastructure IDs were absent")

	var foundation_pack := SettlementContentRegistry.resolve_pack_stack([
		"pack.foundation.forest_neutral_poc",
	])
	_check((foundation_pack.get("blueprint_ids", []) as Array).size() == 30,
		"forest-neutral pack did not expose all 30 protected blueprints")
	_check((foundation_pack.get("errors", []) as Array).is_empty(),
		"forest-neutral pack failed deterministic resolution")
	_check(not bool(SettlementContentRegistry.validate_blueprint(
		"bp.invalid.missing").get("ok", true)),
		"invalid blueprint identity was not rejected")

	_verify_near_far_simulation()
	_verify_housing_and_capabilities()
	_verify_all_definition_persistence(definitions)

	var payload := {
		"checks": checks,
		"definitions": definitions.size(),
		"failures": failures,
		"ok": failures.is_empty(),
	}
	print("SETTLEMENT_WAVE1_PROBE %s" % JSON.stringify(payload))
	get_tree().quit(0 if failures.is_empty() else 1)


func _verify_near_far_simulation() -> void:
	var buildings := [
		_runtime("a_farm", "building.food.basic_farm_plot"),
		_runtime("b_kitchen", "building.food.communal_kitchen"),
		_runtime("c_lumber", "building.extraction.lumber_camp", {
			"resource_zone_id": "resource_zone.forest.probe",
			"resource_zone_active": true,
		}),
		_runtime("d_mine_unbound", "building.extraction.mine_entrance"),
	]
	var near := SettlementSimulationEngine.simulate(
		buildings, {}, 720.0, SettlementSimulationEngine.MODE_NEAR)
	var far := SettlementSimulationEngine.simulate(
		buildings, {}, 720.0, SettlementSimulationEngine.MODE_FAR)
	_check(JSON.stringify(near.get("ledger", {}))
			== JSON.stringify(far.get("ledger", {}))
			and JSON.stringify(near.get("buildings", []))
				== JSON.stringify(far.get("buildings", [])),
		"near and distant simulation did not conserve equivalent outcomes")
	var ledger: Dictionary = near.get("ledger", {})
	_check(int(ledger.get("item.food.village_meal_pack", 0)) == 4
			and int(ledger.get("natural.log.oak", 0)) == 6,
		"Forest Hamlet production chains produced unexpected conserved totals")
	_check(int(ledger.get("item.resource.stone_chunk", 0)) == 0
			and int(ledger.get("item.resource.raw_iron_ore", 0)) == 0,
		"unbound mine produced resources without a real resource zone")
	_check(SettlementSimulationEngine.validate_transaction_result(near)
			and SettlementSimulationEngine.validate_transaction_result(far),
		"near/far transaction ledger did not reconcile")
	for record in near.get("buildings", []):
		_check(str((record as Dictionary).get("owner_id", ""))
				== HamletState.VILLAGE_ID,
			"simulation changed persistent ownership")

	var bound_mine := _runtime(
		"mine_bound", "building.extraction.mine_entrance", {
			"resource_zone_id": "resource_zone.iron.probe",
			"resource_zone_active": true,
		})
	var extraction := SettlementSimulationEngine.simulate(
		[bound_mine], {}, 240.0)
	_check(int(extraction.get("ledger", {}).get(
			"item.resource.stone_chunk", 0)) == 2
			and int(extraction.get("ledger", {}).get(
				"item.resource.raw_iron_ore", 0)) == 1,
		"bound extraction zone did not enable its documented outputs")


func _verify_housing_and_capabilities() -> void:
	var cottage := _runtime(
		"home.cottage", "building.residential.small_cottage")
	var residents := [
		{"id": "npc.named.ada"},
		{"id": "npc.named.bram"},
		{"id": "npc.named.cora"},
	]
	var assignment := SettlementSimulationEngine.assign_residents(
		residents, [cottage])
	var houses: Array = assignment.get("buildings", [])
	_check(houses.size() == 1
			and (houses[0].get("resident_ids", []) as Array).size() == 3
			and (assignment.get(
				"unassigned_resident_ids", []) as Array).is_empty(),
		"housing assignment did not preserve named residents and valid capacity")

	var gate_records: Array = []
	var seen := {}
	for stage in ["camp", "hamlet", "village"]:
		for definition_id in SettlementContentRegistry.get_capability_gate(stage):
			if seen.has(definition_id):
				continue
			seen[definition_id] = true
			gate_records.append(_runtime(
				"gate.%03d" % gate_records.size(), definition_id))
	var capability := SettlementSimulationEngine.capability_stage(gate_records)
	_check(str(capability.get("stage", "")) == "village",
		"Camp to Hamlet to Village gates ignored real capabilities")
	var services := SettlementSimulationEngine.service_snapshot(gate_records)
	var need_keys: Array = (services.get("needs", {}) as Dictionary).keys()
	need_keys.sort()
	var expected_needs := SettlementSimulationRules.NEEDS.duplicate()
	expected_needs.sort()
	_check(need_keys == expected_needs,
		"Forest Hamlet service snapshot exposed needs outside the canonical seven")
	_check(int(services.get("jobs", 0)) > 0
			and int(services.get("storage_capacity", 0)) > 0
			and not (services.get("networks", {}) as Dictionary).is_empty(),
		"jobs, storage, roads, water, safety or civic networks were not integrated")


func _verify_all_definition_persistence(definitions: Array[Dictionary]) -> void:
	HamletState.initialized = false
	HamletState.initialize(12020, {
		"hamlet": Vector2i.ZERO,
		"warehouse": Vector2i(4, 0),
		"watchtower_site": Vector2i(10, 0),
	})
	HamletState.runtime_buildings.clear()
	var expected_buildings: Array[String] = []
	var expected_projects: Array[String] = []
	for definition in definitions:
		var definition_id := str(definition.get("id", ""))
		var project := SettlementContentRegistry.get_construction_project_for_definition(
			definition_id)
		var instance_id := "catalogue.%03d" % int(
			definition.get("catalogue_no", 0))
		if str(definition.get("kind", "")) == "building":
			HamletState.runtime_buildings[instance_id] = _runtime(
				instance_id, definition_id)
			expected_buildings.append(instance_id)
		else:
			var project_instance_id := "project_%s" % instance_id
			HamletState.runtime_projects[project_instance_id] = {
				"instance_id": project_instance_id,
				"id": str(project.get("id", "")),
				"definition_id": str(project.get("id", "")),
				"building_definition_id": "",
				"blueprint_id": str(project.get("blueprint_id", "")),
				"owner_id": HamletState.VILLAGE_ID,
				"stage_index": 1,
				"complete": false,
				"reserved": {},
				"history": [],
			}
			expected_projects.append(project_instance_id)
	var saved := HamletState.serialize_state()
	HamletState.runtime_buildings.clear()
	HamletState.runtime_projects.clear()
	_check(HamletState.restore_state(saved, 12020),
		"protected roster save state was rejected")
	for instance_id in expected_buildings:
		_check(HamletState.runtime_buildings.has(instance_id),
			"%s building runtime was lost on save/load" % instance_id)
	for instance_id in expected_projects:
		_check(HamletState.runtime_projects.has(instance_id),
			"%s project runtime was lost on save/load" % instance_id)
