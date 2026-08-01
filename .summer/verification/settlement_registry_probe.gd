extends Node
## Document 20 registry, blueprint, needs, planner and pack foundation probe.

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var report := SettlementContentRegistry.validation_report()
	_check(bool(report.get("loaded", false)), "settlement registry did not load")
	_check(bool(report.get("ok", false)), "settlement registry validation failed")
	_check((report.get("errors", []) as Array).is_empty(),
		"settlement registry reported validation errors")

	var summary: Dictionary = report.get("summary", {})
	var scopes: Dictionary = summary.get("scopes", {})
	_check(int(summary.get("definitions", 0)) == 120,
		"catalogue did not contain exactly 120 definitions")
	_check(int(scopes.get("technical_poc", 0)) == 16
			and int(scopes.get("extended_slice", 0)) == 14,
		"v0.2 protected scopes did not split into exactly 16 and 14 definitions")
	_check(int(scopes.get("alpha", 0)) == 35,
		"Alpha scope did not contain exactly 35 definitions")
	_check(int(scopes.get("beta", 0)) == 49,
		"Beta scope did not contain exactly 49 definitions")
	_check(int(scopes.get("final", 0)) == 6,
		"Final scope did not contain exactly 6 definitions")

	_check(
		SettlementContentRegistry.canonical_id(
			"building.infrastructure.builder_supply_yard")
			== "building.construction.builder_supply_yard",
		"builder supply yard migration alias did not resolve")
	_check(
		SettlementContentRegistry.has_definition(
			"building.storage.village_warehouse"),
		"canonical village warehouse definition was absent")
	_check(
		SettlementContentRegistry.canonical_id("project.watchtower.basic")
			== "project.build.wooden_watchtower",
		"legacy watchtower project alias did not resolve")
	_check(
		str(SettlementContentRegistry.get_project(
			"project.watchtower.basic").get("building_id", ""))
			== "building.safety.wooden_watchtower",
		"legacy watchtower project did not resolve to the generic building")

	_verify_blueprint(
		"blueprint.leyforge.safety.wooden_watchtower_a",
		{"foundation": 25, "frame": 28, "platform": 25, "finishing": 4})
	_verify_blueprint(
		"blueprint.leyforge.residential.small_cottage_a",
		{"foundation": 25, "frame": 12, "shell": 31, "roof": 28,
			"furnishing": 1})
	_verify_project_costs()
	_verify_needs()
	_verify_planner()
	_verify_pack_resolution()

	var payload := {
		"checks": checks,
		"failures": failures,
		"ok": failures.is_empty(),
	}
	print("SETTLEMENT_REGISTRY_PROBE %s" % JSON.stringify(payload))
	get_tree().quit(0 if failures.is_empty() else 1)


func _verify_blueprint(id: String, expected_counts: Dictionary) -> void:
	var validation := SettlementContentRegistry.validate_blueprint(id)
	_check(bool(validation.get("ok", false)),
		"%s did not pass blueprint validation" % id)
	for stage_id in expected_counts:
		var first := SettlementContentRegistry.expand_blueprint_stage(
			id, str(stage_id))
		var second := SettlementContentRegistry.expand_blueprint_stage(
			id, str(stage_id))
		_check(first.size() == int(expected_counts[stage_id]),
			"%s:%s expanded to the wrong cell count" % [id, stage_id])
		_check(JSON.stringify(first) == JSON.stringify(second),
			"%s:%s did not expand deterministically" % [id, stage_id])


func _verify_project_costs() -> void:
	var costs := SettlementContentRegistry.compile_project_costs(
		"project.watchtower.basic")
	var total: Dictionary = costs.get("total", {})
	_check(int(total.get("item:item.material.stone_brick", 0)) == 48,
		"watchtower stone-brick cost drifted during migration")
	_check(int(total.get("item:item.material.beam_oak", 0)) == 28,
		"watchtower oak-beam cost drifted during migration")
	_check(int(total.get("item:item.material.plank_oak", 0)) == 24,
		"watchtower oak-plank cost drifted during migration")
	_check(int(total.get("item:item.material.iron_nails", 0)) == 20,
		"watchtower iron-nail cost drifted during migration")
	_check(int(total.get("item:item.material.iron_plate", 0)) == 8,
		"watchtower iron-plate cost drifted during migration")
	_check(int(total.get("block:light.torch.basic", 0)) == 4,
		"watchtower torch cost drifted during migration")


func _verify_needs() -> void:
	_check(SettlementSimulationRules.NEEDS.size() == 7,
		"visible need count was not exactly seven")
	var definition := {
		"id": "building.residential.small_cottage",
		"primary_need": "housing",
		"capacity": {"base": 8.0},
	}
	var runtime := {
		"definition_id": "building.residential.small_cottage",
		"active": true,
		"condition": 1.0,
		"staffing": 1.0,
		"inputs_available": 1.0,
		"access": 0.5,
		"utilities": 1.0,
		"suitability": 1.0,
	}
	var result := SettlementSimulationRules.aggregate_needs(
		{definition["id"]: definition}, [runtime], {"housing": 8.0})
	var housing: Dictionary = result.get("housing", {})
	_check(is_equal_approx(float(housing.get("contribution", 0.0)), 4.0),
		"seven-needs contribution did not apply access multiplicatively")
	_check(str(housing.get("state", "")) == "critical",
		"seven-needs state threshold was incorrect")
	_check(str(housing.get("remedy", "")) == "restore_route_access",
		"seven-needs primary remedy was not readable")


func _verify_planner() -> void:
	var definitions := [
		{"id": "required", "min_stage": "camp",
			"primary_need": "housing", "planner_class": "required"},
		{"id": "optional", "min_stage": "camp",
			"primary_need": "housing", "planner_class": "optional"},
		{"id": "locked", "min_stage": "town",
			"primary_need": "housing", "planner_class": "required"},
		{"id": "conditional", "min_stage": "camp",
			"primary_need": "work", "planner_class": "conditional"},
	]
	var ranked := SettlementSimulationRules.rank_projects(
		definitions, "hamlet", {
			"required": {"need_pressure": {"housing": 1.0}},
			"optional": {"need_pressure": {"housing": 1.0}},
			"conditional": {"conditions_met": false},
		})
	_check(ranked.size() == 2,
		"planner did not filter stage and conditional prerequisites")
	_check(str(ranked[0].get("id", "")) == "required",
		"planner did not prioritize a required shortage")


func _verify_pack_resolution() -> void:
	var resolved := SettlementContentRegistry.resolve_pack_stack([
		"pack.culture.riverward_frontier",
		"pack.faction.briarhook_raiders",
	])
	var ids: Array = resolved.get("pack_ids", [])
	_check(ids.size() == 3,
		"pack resolution did not include the shared foundation dependency")
	_check(str(ids[0]) == "pack.foundation.forest_neutral_poc",
		"pack dependency did not resolve before overlays")
	_check((resolved.get("errors", []) as Array).is_empty(),
		"valid POC pack stack reported errors")
