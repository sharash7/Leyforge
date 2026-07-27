class_name SettlementSimulationRules
extends RefCounted
## Shared seven-needs calculations and deterministic project-planner scoring.

const NEEDS: Array[String] = [
	"housing",
	"provisions",
	"health",
	"work",
	"safety",
	"infrastructure",
	"morale",
]

const STAGE_ORDER := {
	"camp": 0,
	"hamlet": 1,
	"village": 2,
	"fortified_village": 3,
	"town": 4,
	"city": 5,
	"capital": 6,
	"magical_metropolis": 7,
}

const STATE_THRESHOLDS: Array[Dictionary] = [
	{"minimum": 1.25, "state": "thriving"},
	{"minimum": 1.00, "state": "stable"},
	{"minimum": 0.75, "state": "strained"},
	{"minimum": 0.40, "state": "critical"},
	{"minimum": -INF, "state": "collapsed"},
]


static func effective_contribution(
		base_capacity: float,
		condition: float,
		staffing: float,
		inputs_available: float,
		access: float,
		utilities: float,
		suitability: float) -> float:
	return maxf(0.0, base_capacity) \
		* clampf(condition, 0.0, 1.0) \
		* clampf(staffing, 0.0, 1.0) \
		* clampf(inputs_available, 0.0, 1.0) \
		* clampf(access, 0.0, 1.0) \
		* clampf(utilities, 0.0, 1.0) \
		* clampf(suitability, 0.0, 1.0)


static func state_for_ratio(ratio: float) -> String:
	for threshold in STATE_THRESHOLDS:
		if ratio >= float(threshold["minimum"]):
			return str(threshold["state"])
	return "collapsed"


static func aggregate_needs(
		building_definitions: Dictionary,
		runtime_buildings: Array,
		demand_by_need: Dictionary,
		previous_ratios: Dictionary = {}) -> Dictionary:
	var contributions := {}
	var causes := {}
	for need in NEEDS:
		contributions[need] = 0.0
		causes[need] = []

	for runtime_value in runtime_buildings:
		var runtime: Dictionary = runtime_value if runtime_value is Dictionary else {}
		if not bool(runtime.get("active", false)):
			continue
		var definition_id := str(runtime.get("definition_id", ""))
		var definition: Dictionary = building_definitions.get(definition_id, {})
		if definition.is_empty():
			continue
		var primary_need := str(definition.get("primary_need", ""))
		if primary_need not in NEEDS:
			continue
		var capacity: Dictionary = definition.get("capacity", {})
		var base := float(capacity.get("base", 0.0))
		var effective := effective_contribution(
			base,
			float(runtime.get("condition", 1.0)),
			float(runtime.get("staffing", 1.0)),
			float(runtime.get("inputs_available", 1.0)),
			float(runtime.get("access", 1.0)),
			float(runtime.get("utilities", 1.0)),
			float(runtime.get("suitability", 1.0)))
		contributions[primary_need] = float(contributions[primary_need]) + effective
		var blocker := _primary_blocker(runtime)
		if not blocker.is_empty():
			(causes[primary_need] as Array).append({
				"definition_id": definition_id,
				"cause": blocker,
			})

	var result := {}
	for need in NEEDS:
		var demand := maxf(0.0, float(demand_by_need.get(need, 0.0)))
		var contribution := float(contributions[need])
		var ratio := contribution / demand if demand > 0.0 else 1.25
		var previous := float(previous_ratios.get(need, ratio))
		result[need] = {
			"demand": demand,
			"contribution": contribution,
			"ratio": ratio,
			"state": state_for_ratio(ratio),
			"trend": "improving" if ratio > previous + 0.01 \
				else ("declining" if ratio < previous - 0.01 else "steady"),
			"causes": (causes[need] as Array).slice(0, 2),
			"remedy": _remedy_for(need, causes[need]),
		}
	return result


static func score_project(definition: Dictionary, context: Dictionary) -> float:
	var required_bonus := 100.0 \
		if str(definition.get("planner_class", "")) == "required" else 0.0
	var conditional_bonus := 10.0 \
		if str(definition.get("planner_class", "")) == "conditional" else 0.0
	var primary_need := str(definition.get("primary_need", ""))
	var need_pressure: Dictionary = context.get("need_pressure", {})
	var score := required_bonus + conditional_bonus
	score += 50.0 * clampf(float(need_pressure.get(primary_need, 0.0)), 0.0, 2.0)
	score += float(context.get("population_pressure", 0.0))
	score += float(context.get("job_demand", 0.0))
	score += float(context.get("safety_risk", 0.0))
	score += float(context.get("culture_preference", 0.0))
	score += float(context.get("story_weight", 0.0))
	score += float(context.get("trade_opportunity", 0.0))
	score += float(context.get("player_priority", 0.0))
	score -= float(context.get("cost", 0.0))
	score -= float(context.get("terrain_difficulty", 0.0))
	score -= float(context.get("redundancy", 0.0))
	score -= float(context.get("maintenance_burden", 0.0))
	score -= float(context.get("danger", 0.0))
	return score


static func eligible_for_stage(
		definition: Dictionary,
		settlement_stage: String) -> bool:
	var minimum := str(definition.get("min_stage", "camp"))
	return int(STAGE_ORDER.get(minimum, 999)) \
		<= int(STAGE_ORDER.get(settlement_stage, -1))


static func rank_projects(
		definitions: Array,
		settlement_stage: String,
		context_by_id: Dictionary) -> Array[Dictionary]:
	var ranked: Array[Dictionary] = []
	for value in definitions:
		var definition: Dictionary = value if value is Dictionary else {}
		if definition.is_empty() \
				or not eligible_for_stage(definition, settlement_stage):
			continue
		var id := str(definition.get("id", ""))
		var context: Dictionary = context_by_id.get(id, {})
		if str(definition.get("planner_class", "")) == "conditional" \
				and not bool(context.get("conditions_met", false)):
			continue
		if not _context_allows_project(context):
			continue
		ranked.append({
			"id": id,
			"score": score_project(definition, context),
		})
	ranked.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if not is_equal_approx(float(a["score"]), float(b["score"])):
			return float(a["score"]) > float(b["score"])
		return str(a["id"]) < str(b["id"]))
	return ranked


static func _context_allows_project(context: Dictionary) -> bool:
	for field in [
		"authority_available",
		"resources_available",
		"access_available",
		"terrain_allowed",
		"staffing_available",
		"maintenance_affordable",
		"danger_acceptable",
	]:
		if context.has(field) and not bool(context[field]):
			return false
	if bool(context.get("redundancy_blocked", false)):
		return false
	if bool(context.get("requires_resource_zone", false)) \
			and not bool(context.get("resource_zone_bound", false)):
		return false
	return true


static func _primary_blocker(runtime: Dictionary) -> String:
	for key in [
		"condition", "staffing", "inputs_available", "access", "utilities",
		"suitability",
	]:
		if float(runtime.get(key, 1.0)) < 0.999:
			return key
	return ""


static func _remedy_for(need: String, need_causes: Array) -> String:
	if not need_causes.is_empty():
		var cause := str((need_causes[0] as Dictionary).get("cause", ""))
		match cause:
			"condition":
				return "repair_or_maintain"
			"staffing":
				return "assign_or_train_workers"
			"inputs_available":
				return "supply_required_inputs"
			"access":
				return "restore_route_access"
			"utilities":
				return "restore_required_utilities"
			"suitability":
				return "adapt_or_replace_blueprint"
	match need:
		"housing":
			return "build_or_repair_housing"
		"provisions":
			return "increase_food_water_or_reserves"
		"health":
			return "increase_treatment_or_prevention"
		"work":
			return "open_jobs_tools_or_training"
		"safety":
			return "improve_warning_guards_or_refuge"
		"infrastructure":
			return "improve_storage_routes_or_utilities"
		"morale":
			return "restore_stability_or_community_service"
	return "inspect_settlement"
