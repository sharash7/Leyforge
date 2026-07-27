extends Node
## Alpha through Final catalogue, planner, plan graph and persistence gate.

const PlanEngine = preload(
	"res://scripts/settlement/settlement_plan_engine.gd")
const SimulationEngine = preload(
	"res://scripts/settlement/settlement_simulation_engine.gd")

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _runtime(instance_id: String, definition_id: String) -> Dictionary:
	return {
		"instance_id": instance_id,
		"definition_id": definition_id,
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


func _run() -> void:
	var summary := SettlementContentRegistry.catalogue_summary()
	_check(int(summary.get("definitions", 0)) == 120
			and int(summary.get("blueprints", 0)) == 120
			and int(summary.get("construction_projects", 0)) == 120
			and int(summary.get("behaviors", 0)) == 120
			and int(summary.get("plan_specs", 0)) == 13,
		"full catalogue contracts were not loaded at exact counts")
	var wave_counts := {}
	var kind_counts := {}
	var recipe_behaviors := 0
	for definition in SettlementContentRegistry.all_definitions():
		var wave := int(definition.get("release_wave", 0))
		wave_counts[wave] = int(wave_counts.get(wave, 0)) + 1
		var kind := str(definition.get("kind", ""))
		kind_counts[kind] = int(kind_counts.get(kind, 0)) + 1
		var definition_id := str(definition.get("id", ""))
		_check(not SettlementContentRegistry.get_construction_project_for_definition(
				definition_id).is_empty()
				and not SettlementContentRegistry.get_behavior_for_definition(
					definition_id).is_empty(),
			"%s did not resolve through shared full-catalogue contracts"
				% definition_id)
		if not (SettlementContentRegistry.get_behavior_for_definition(
				definition_id).get("recipes", []) as Array).is_empty():
			recipe_behaviors += 1
	_check(wave_counts == {1: 30, 2: 20, 3: 25, 4: 25, 5: 20},
		"release-wave counts did not match the approved cumulative roadmap")
	_check(kind_counts == {"building": 103, "project": 10, "plan": 7},
		"catalogue kind ownership counts drifted")
	_check(recipe_behaviors >= 20,
		"production and extraction behaviors were not populated across waves")

	_verify_planner_rejections()
	_verify_capital_progression()
	_verify_megaproject_graph()
	_verify_full_persistence()

	var payload := {
		"checks": checks,
		"failures": failures,
		"ok": failures.is_empty(),
		"wave_counts": wave_counts,
	}
	print("SETTLEMENT_WAVES2_5_PROBE %s" % JSON.stringify(payload))
	get_tree().quit(0 if failures.is_empty() else 1)


func _verify_planner_rejections() -> void:
	var definitions := [
		{"id": "allowed", "min_stage": "village",
			"primary_need": "work", "planner_class": "required"},
		{"id": "unaffordable", "min_stage": "village",
			"primary_need": "work", "planner_class": "required"},
		{"id": "unauthorised", "min_stage": "village",
			"primary_need": "work", "planner_class": "optional"},
		{"id": "unbound", "min_stage": "village",
			"primary_need": "work", "planner_class": "conditional"},
		{"id": "redundant", "min_stage": "village",
			"primary_need": "work", "planner_class": "optional"},
	]
	var ranked := SettlementSimulationRules.rank_projects(
		definitions, "village", {
			"allowed": {
				"resources_available": true,
				"authority_available": true,
				"need_pressure": {"work": 1.0},
			},
			"unaffordable": {"resources_available": false},
			"unauthorised": {"authority_available": false},
			"unbound": {
				"conditions_met": true,
				"requires_resource_zone": true,
				"resource_zone_bound": false,
			},
			"redundant": {"redundancy_blocked": true},
		})
	_check(ranked.size() == 1 and str(ranked[0].get("id", "")) == "allowed",
		"planner admitted unaffordable, unauthorised, unbound or redundant work")


func _verify_capital_progression() -> void:
	var records: Array = []
	var seen := {}
	for stage in [
		"camp", "hamlet", "village", "fortified_village", "town", "city",
		"capital", "magical_metropolis",
	]:
		for definition_id in SettlementContentRegistry.get_capability_gate(stage):
			if seen.has(definition_id):
				continue
			seen[definition_id] = true
			records.append(_runtime("gate.%03d" % records.size(), definition_id))
	var state := SimulationEngine.capability_stage(records)
	_check(str(state.get("stage", "")) == "magical_metropolis",
		"Capital and Magical Metropolis did not require real completed capabilities")
	records.pop_back()
	state = SimulationEngine.capability_stage(records)
	_check(str(state.get("stage", "")) == "capital",
		"missing Final capability did not block Magical Metropolis")


func _verify_megaproject_graph() -> void:
	var plan_id := "project.megaproject.city_ward_portal_nexus"
	var plan := SettlementContentRegistry.get_plan(plan_id)
	_check(str(plan.get("graph_kind", "")) == "megaproject"
			and (plan.get("components", []) as Array).size() == 5,
		"city ward/portal nexus was not a five-component megaproject graph")
	var runtime := PlanEngine.create_runtime(
		plan_id, "plan_runtime.probe.ward_nexus", HamletState.VILLAGE_ID)
	var ledger := {}
	for component_value in plan.get("components", []):
		for requirement_value in (component_value as Dictionary).get(
				"requirements", []):
			var stable_id := str(
				(requirement_value as Dictionary).get("stable_id", ""))
			ledger[stable_id] = int(ledger.get(stable_id, 0)) \
				+ int((requirement_value as Dictionary).get("count", 0))
	var original_ledger := ledger.duplicate(true)
	var first_id := str(
		(plan.get("components", []) as Array)[0].get("id", ""))
	var cancellation := PlanEngine.reserve_component(
		runtime, first_id, ledger)
	var cancelled := PlanEngine.cancel_component(
		cancellation.get("runtime", runtime),
		first_id,
		cancellation.get("ledger", ledger))
	_check(bool(cancellation.get("ok", false))
			and bool(cancelled.get("ok", false))
			and _ledgers_equal(original_ledger, cancelled.get("ledger", {})),
		"megaproject cancellation did not return every reserved resource")

	runtime = PlanEngine.create_runtime(
		plan_id, "plan_runtime.probe.ward_nexus", HamletState.VILLAGE_ID)
	ledger = original_ledger.duplicate(true)
	var enabling := _reserve_and_complete(runtime, first_id, ledger)
	runtime = enabling["runtime"]
	ledger = enabling["ledger"]
	var available := PlanEngine.available_components(runtime)
	_check(available.size() == 2,
		"megaproject prerequisites did not unlock core and workforce support")
	for component_id in available:
		var step := _reserve_and_complete(runtime, component_id, ledger)
		runtime = step["runtime"]
		ledger = step["ledger"]
	_check(bool(runtime.get("active", false))
			and float(runtime.get("activation", 0.0)) >= 0.45
			and not bool(runtime.get("complete", false)),
		"megaproject did not partially activate from completed subprojects")
	var core_id := "%s.component.core" % plan_id
	runtime = PlanEngine.damage_component(runtime, core_id, 0.8)
	_check(not bool(runtime.get("active", true)),
		"damaged core did not remove unsupported partial activation")
	runtime = PlanEngine.restore_component(runtime, core_id, 0.8)
	_check(bool(runtime.get("active", false)),
		"restored core did not restore bounded partial activation")
	while not bool(runtime.get("complete", false)):
		available = PlanEngine.available_components(runtime)
		_check(not available.is_empty(),
			"megaproject graph deadlocked before commissioning")
		if available.is_empty():
			break
		for component_id in available:
			var step := _reserve_and_complete(runtime, component_id, ledger)
			runtime = step["runtime"]
			ledger = step["ledger"]
	var effects := PlanEngine.bounded_effects(runtime)
	_check(bool(runtime.get("complete", false))
			and is_equal_approx(float(runtime.get("activation", 0.0)), 1.0)
			and float(effects.get("regional_radius", 0.0)) <= 4096.0
			and float(effects.get("capacity_multiplier", 0.0)) <= 2.0,
		"completed megaproject exceeded bounded effects or lost graph completion")

	HamletState.initialized = false
	HamletState.initialize(12520, {
		"hamlet": Vector2i.ZERO,
		"warehouse": Vector2i(4, 0),
		"watchtower_site": Vector2i(10, 0),
	})
	HamletState.runtime_plans["plan_runtime.probe.ward_nexus"] = runtime
	var saved := HamletState.serialize_state()
	HamletState.runtime_plans.clear()
	_check(HamletState.restore_state(saved, 12520)
			and bool(HamletState.runtime_plans.get(
				"plan_runtime.probe.ward_nexus", {}).get("complete", false)),
		"independent megaproject subprojects did not survive persistence")


func _reserve_and_complete(
		runtime: Dictionary,
		component_id: String,
		ledger: Dictionary) -> Dictionary:
	var reserved := PlanEngine.reserve_component(runtime, component_id, ledger)
	_check(bool(reserved.get("ok", false)),
		"%s could not reserve its component resources" % component_id)
	var next_runtime: Dictionary = reserved.get("runtime", runtime)
	if bool(reserved.get("ok", false)):
		next_runtime = PlanEngine.advance_component(
			next_runtime, component_id, 1.0)
	return {
		"runtime": next_runtime,
		"ledger": reserved.get("ledger", ledger),
	}


func _ledgers_equal(left: Dictionary, right: Dictionary) -> bool:
	var keys := {}
	for key in left:
		keys[str(key)] = true
	for key in right:
		keys[str(key)] = true
	for key in keys:
		if int(left.get(key, 0)) != int(right.get(key, 0)):
			return false
	return true


func _verify_full_persistence() -> void:
	HamletState.initialized = false
	HamletState.initialize(12025, {
		"hamlet": Vector2i.ZERO,
		"warehouse": Vector2i(4, 0),
		"watchtower_site": Vector2i(10, 0),
	})
	HamletState.runtime_buildings.clear()
	HamletState.runtime_plans.clear()
	var expected_project_ids: Array[String] = []
	for definition in SettlementContentRegistry.all_definitions():
		var number := int(definition.get("catalogue_no", 0))
		var instance_id := "full.%03d" % number
		var definition_id := str(definition.get("id", ""))
		match str(definition.get("kind", "")):
			"building":
				HamletState.runtime_buildings[instance_id] = _runtime(
					instance_id, definition_id)
			"project":
				var project := SettlementContentRegistry.get_construction_project_for_definition(
					definition_id)
				var project_instance_id := "project.%s" % instance_id
				HamletState.runtime_projects[project_instance_id] = {
					"instance_id": project_instance_id,
					"id": str(project.get("id", "")),
					"definition_id": str(project.get("id", "")),
					"blueprint_id": str(project.get("blueprint_id", "")),
					"owner_id": HamletState.VILLAGE_ID,
					"stage_index": 1,
					"complete": false,
					"reserved": {},
					"history": [],
				}
				expected_project_ids.append(project_instance_id)
			"plan":
				HamletState.runtime_plans[instance_id] = PlanEngine.create_runtime(
					definition_id, instance_id, HamletState.VILLAGE_ID)
	var saved := HamletState.serialize_state()
	HamletState.runtime_buildings.clear()
	HamletState.runtime_projects.clear()
	HamletState.runtime_plans.clear()
	_check(HamletState.restore_state(saved, 12025),
		"all-catalogue runtime save was rejected")
	_check(HamletState.runtime_buildings.size() == 103
			and HamletState.runtime_plans.size() == 7,
		"building or district records were lost from the 120-definition save")
	for instance_id in expected_project_ids:
		_check(HamletState.runtime_projects.has(instance_id),
			"%s was lost from the full-catalogue save" % instance_id)
	_check(str(HamletState.runtime_buildings.get(
			"full.001", {}).get("owner_id", "")) == HamletState.VILLAGE_ID
			and is_equal_approx(float(HamletState.runtime_buildings.get(
				"full.001", {}).get("condition", 0.0)), 1.0),
		"full-catalogue persistence changed ownership or condition")
