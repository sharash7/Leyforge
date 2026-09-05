extends Node
## Immutable Document 20 content registry and blueprint compiler.

signal registry_reloaded(report: Dictionary)

const Records = preload("res://scripts/settlement/settlement_records.gd")
const SchemaMigration = preload(
	"res://scripts/settlement/settlement_schema_migration.gd")
const CataloguePath := "res://data/settlement/settlement_catalogue.json"
const BlueprintsPath := "res://data/settlement/settlement_blueprints.json"
const ProjectsPath := "res://data/settlement/settlement_projects.json"
const PacksPath := "res://data/settlement/settlement_packs.json"
const BehaviorsPath := "res://data/settlement/settlement_behaviors.json"
const PlansPath := "res://data/settlement/settlement_plans.json"
const EXPECTED_SCOPE_COUNTS := {
	"technical_poc": 16,
	"extended_slice": 14,
	"alpha": 35,
	"beta": 49,
	"final": 6,
}
const EXPECTED_DELIVERY_GROUP_COUNTS := {
	"core_infrastructure": 12,
	"raid_extension": 4,
	"extended_forest_hamlet": 14,
}
const VALID_NEEDS := [
	"housing",
	"provisions",
	"health",
	"work",
	"safety",
	"infrastructure",
	"morale",
]
const VALID_STAGES := [
	"camp",
	"hamlet",
	"village",
	"fortified_village",
	"town",
	"city",
	"capital",
	"magical_metropolis",
]
const VALID_PLANNER_CLASSES := [
	"required",
	"optional",
	"conditional",
	"upgrade",
	"district",
	"megaproject",
]
const VALID_RESOURCE_SOURCE_CLASSES := [
	"cultivated",
	"renewable_wild",
	"finite_geological",
	"large_deposit",
	"realm_or_leyline",
]
const VALID_RESOURCE_DEPLETION_POLICIES := ["finite", "renewable"]
const REQUIRED_RESOURCE_PROVENANCE_FIELDS := [
	"origin_id",
	"owner_id",
	"evidence_id",
]

var loaded := false
var catalogue_definitions: Dictionary = {}
var building_definitions: Dictionary = {}
var catalogue_project_definitions: Dictionary = {}
var plan_definitions: Dictionary = {}
var plan_specs: Dictionary = {}
var construction_projects: Dictionary = {}
var projects_by_definition: Dictionary = {}
var blueprints: Dictionary = {}
var packs: Dictionary = {}
var behaviors: Dictionary = {}
var behaviors_by_definition: Dictionary = {}
var capability_gates: Dictionary = {}
var fixed_step_minutes := 10
var catalogue_version := ""
var aliases: Dictionary = {}
var resolution_order: Array[String] = []
var validation_errors: Array[String] = []
var validation_warnings: Array[String] = []
var schema_migration_reports: Array[Dictionary] = []
var migration_service: SettlementSchemaMigration = SchemaMigration.new()


func _ready() -> void:
	reload()


func reload() -> Dictionary:
	_clear()
	_load_catalogue()
	_load_plan_specs()
	_load_blueprints()
	_load_projects()
	_load_packs()
	_load_behaviors()
	_validate_cross_references()
	loaded = validation_errors.is_empty()
	var report := validation_report()
	if not loaded:
		push_error("SETTLEMENT REGISTRY: %s" % "; ".join(validation_errors))
	else:
		print(
			"SETTLEMENT REGISTRY: %d definitions, %d blueprints, %d projects, %d packs"
			% [
				catalogue_definitions.size(),
				blueprints.size(),
				construction_projects.size(),
				packs.size(),
			])
	registry_reloaded.emit(report)
	return report


func canonical_id(requested_id: String) -> String:
	var current := requested_id
	var visited := {}
	while aliases.has(current) and not visited.has(current):
		visited[current] = true
		current = str(aliases[current])
	return current


func migrate_v1_payload(payload: Dictionary) -> Dictionary:
	return migration_service.migrate_payload(payload)


func has_definition(requested_id: String) -> bool:
	return catalogue_definitions.has(canonical_id(requested_id))


func get_definition(requested_id: String) -> Dictionary:
	var value: Variant = catalogue_definitions.get(
		canonical_id(requested_id), null)
	return value.to_dictionary() if value != null else {}


func get_building(requested_id: String) -> Dictionary:
	var value: Variant = building_definitions.get(
		canonical_id(requested_id), null)
	return value.to_dictionary() if value != null else {}


func get_project(requested_id: String) -> Dictionary:
	var value: Variant = construction_projects.get(
		canonical_id(requested_id), null)
	return value.to_dictionary() if value != null else {}


func get_construction_project_for_definition(
		requested_id: String) -> Dictionary:
	var definition_id := canonical_id(requested_id)
	var project_id := str(projects_by_definition.get(definition_id, ""))
	return get_project(project_id) if not project_id.is_empty() else {}


func get_plan(requested_id: String) -> Dictionary:
	var id := canonical_id(requested_id)
	var value: Variant = plan_specs.get(
		id, plan_definitions.get(id, null))
	return value.to_dictionary() if value != null else {}


func get_blueprint(requested_id: String) -> Dictionary:
	var value: Variant = blueprints.get(canonical_id(requested_id), null)
	return value.to_dictionary() if value != null else {}


func get_pack(requested_id: String) -> Dictionary:
	var value: Variant = packs.get(canonical_id(requested_id), null)
	return value.to_dictionary() if value != null else {}


func get_behavior_for_definition(requested_id: String) -> Dictionary:
	var definition_id := canonical_id(requested_id)
	var behavior_id := str(behaviors_by_definition.get(definition_id, ""))
	var value: Variant = behaviors.get(behavior_id, null)
	return value.to_dictionary() if value != null else {}


func get_capability_gate(stage: String) -> Array[String]:
	var out: Array[String] = []
	out.assign(capability_gates.get(stage, []))
	return out


func all_definitions() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var keys := catalogue_definitions.keys()
	keys.sort_custom(func(a: Variant, b: Variant) -> bool:
		var left: Dictionary = catalogue_definitions[a].to_dictionary()
		var right: Dictionary = catalogue_definitions[b].to_dictionary()
		return int(left.get("catalogue_no", 0)) \
			< int(right.get("catalogue_no", 0)))
	for key in keys:
		out.append(catalogue_definitions[key].to_dictionary())
	return out


func definitions_for_scope(scope: String) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for definition in all_definitions():
		if str(definition.get("scope", "")) == scope:
			out.append(definition)
	return out


func validate_blueprint(requested_id: String) -> Dictionary:
	var blueprint := get_blueprint(requested_id)
	var errors: Array[String] = []
	var warnings: Array[String] = []
	if blueprint.is_empty():
		errors.append("unknown_blueprint")
		return {"ok": false, "errors": errors, "warnings": warnings}
	if int(blueprint.get("version", 0)) <= 0:
		errors.append("invalid_version")
	var bounds: Dictionary = blueprint.get("bounds", {})
	if not _is_vector_array(bounds.get("min", [])) \
			or not _is_vector_array(bounds.get("max", [])):
		errors.append("invalid_bounds")
	var palette: Dictionary = blueprint.get("palette", {})
	for token in palette:
		var stable_id := str(palette[token])
		if str(token).is_empty() \
				or BlockRegistry.get_id_by_stable_id(stable_id) <= 0:
			errors.append("invalid_palette_token:%s:%s" % [token, stable_id])
	var stage_ids := {}
	for stage_value in blueprint.get("stages", []):
		if not (stage_value is Dictionary):
			errors.append("invalid_stage")
			continue
		var stage: Dictionary = stage_value
		var stage_id := str(stage.get("id", ""))
		if stage_id.is_empty() or stage_ids.has(stage_id):
			errors.append("duplicate_or_empty_stage:%s" % stage_id)
		stage_ids[stage_id] = true
		if (stage.get("operations", []) as Array).is_empty():
			warnings.append("empty_stage:%s" % stage_id)
	var marker_types := {}
	for marker_value in blueprint.get("markers", []):
		if not (marker_value is Dictionary):
			errors.append("invalid_marker")
			continue
		var marker: Dictionary = marker_value
		var marker_type := str(marker.get("type", ""))
		if marker_type.is_empty() \
				or not _is_vector_array(marker.get("position", [])):
			errors.append("invalid_marker:%s" % str(marker.get("id", "")))
		elif not _position_within_bounds(marker.get("position", []), bounds):
			errors.append("marker_out_of_bounds:%s" % str(marker.get("id", "")))
		marker_types[marker_type] = true
	for required_type in blueprint.get("required_marker_types", []):
		if not marker_types.has(str(required_type)):
			errors.append("missing_marker:%s" % str(required_type))
	for stage_value in blueprint.get("stages", []):
		var stage: Dictionary = stage_value
		var expansion := expand_blueprint_stage(
			requested_id, str(stage.get("id", "")))
		if expansion.is_empty():
			errors.append("stage_has_no_cells:%s" % str(stage.get("id", "")))
		for cell in expansion:
			if not _position_within_bounds(
					(cell as Dictionary).get("local_position", []), bounds):
				errors.append(
					"cell_out_of_bounds:%s" % str(stage.get("id", "")))
				break
	return {
		"ok": errors.is_empty(),
		"errors": errors,
		"warnings": warnings,
	}


func expand_blueprint_stage(
		requested_id: String,
		stage_id: String,
		palette_override: Dictionary = {}) -> Array[Dictionary]:
	var blueprint := get_blueprint(requested_id)
	if blueprint.is_empty():
		return []
	var palette: Dictionary = blueprint.get("palette", {}).duplicate(true)
	for token in palette_override:
		palette[token] = palette_override[token]
	var selected: Dictionary = {}
	for stage_value in blueprint.get("stages", []):
		if str((stage_value as Dictionary).get("id", "")) == stage_id:
			selected = (stage_value as Dictionary).duplicate(true)
			break
	if selected.is_empty():
		return []
	var cells := {}
	for operation_value in selected.get("operations", []):
		if operation_value is Dictionary:
			_expand_operation(operation_value, palette, cells)
	var out: Array[Dictionary] = []
	for value in cells.values():
		out.append((value as Dictionary).duplicate(true))
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var left: Array = a["local_position"]
		var right: Array = b["local_position"]
		if int(left[1]) != int(right[1]):
			return int(left[1]) < int(right[1])
		if int(left[2]) != int(right[2]):
			return int(left[2]) < int(right[2])
		return int(left[0]) < int(right[0]))
	return out


func compile_project_costs(requested_id: String) -> Dictionary:
	var project := get_project(requested_id)
	if project.is_empty():
		return {}
	var stages: Array[Dictionary] = []
	var total := {}
	for stage_value in project.get("stages", []):
		var stage: Dictionary = stage_value
		var stage_requirements: Array[Dictionary] = []
		for requirement_value in stage.get("requirements", []):
			var requirement: Dictionary = requirement_value
			var key := "%s:%s" % [
				str(requirement.get("kind", "item")),
				str(requirement.get("stable_id", "")),
			]
			var count := maxi(0, int(requirement.get("count", 0)))
			total[key] = int(total.get(key, 0)) + count
			stage_requirements.append(requirement.duplicate(true))
		stages.append({
			"index": int(stage.get("index", stages.size() + 1)),
			"id": str(stage.get("id", "")),
			"requirements": stage_requirements,
		})
	return {
		"project_id": canonical_id(requested_id),
		"stages": stages,
		"total": total,
	}


func resolve_pack_stack(requested_ids: Array[String]) -> Dictionary:
	return resolve_pack_stack_with_context(requested_ids, {})


func resolve_pack_stack_with_context(
		requested_ids: Array[String],
		context: Dictionary) -> Dictionary:
	var overlay := Records.PackOverlay.new()
	var selected: Dictionary = {}
	for requested_id in requested_ids:
		_collect_pack(
			canonical_id(requested_id), selected, overlay.errors, context)
	if selected.is_empty():
		_collect_pack(
			"pack.foundation.forest_neutral_poc",
			selected,
			overlay.errors,
			context)
	var ordered: Array = selected.values()
	ordered.sort_custom(func(a: Variant, b: Variant) -> bool:
		var left: Dictionary = a.to_dictionary()
		var right: Dictionary = b.to_dictionary()
		var left_layer := resolution_order.find(str(left.get("type", "")))
		var right_layer := resolution_order.find(str(right.get("type", "")))
		if left_layer != right_layer:
			return left_layer < right_layer
		if int(left.get("priority", 0)) != int(right.get("priority", 0)):
			return int(left.get("priority", 0)) < int(right.get("priority", 0))
		return str(left.get("id", "")) < str(right.get("id", "")))
	var seen_blueprints := {}
	for value in ordered:
		var pack: Dictionary = value.to_dictionary()
		overlay.pack_ids.append(str(pack.get("id", "")))
		overlay.layers.append({
			"id": str(pack.get("id", "")),
			"type": str(pack.get("type", "")),
			"priority": int(pack.get("priority", 0)),
		})
		for token in (pack.get("palette", {}) as Dictionary):
			overlay.palette[token] = pack["palette"][token]
		for blueprint_id in pack.get("blueprint_ids", []):
			if not seen_blueprints.has(str(blueprint_id)):
				seen_blueprints[str(blueprint_id)] = true
				overlay.blueprint_ids.append(str(blueprint_id))
	return overlay.to_dictionary()


func catalogue_summary() -> Dictionary:
	var scope_counts := {}
	var delivery_group_counts := {}
	var kind_counts := {}
	var owner_counts := {}
	for definition in all_definitions():
		var scope := str(definition.get("scope", ""))
		var kind := str(definition.get("kind", ""))
		var owner := str(definition.get("owner_document", ""))
		scope_counts[scope] = int(scope_counts.get(scope, 0)) + 1
		var delivery_group := str(definition.get("delivery_group", ""))
		if not delivery_group.is_empty():
			delivery_group_counts[delivery_group] = int(
				delivery_group_counts.get(delivery_group, 0)) + 1
		kind_counts[kind] = int(kind_counts.get(kind, 0)) + 1
		owner_counts[owner] = int(owner_counts.get(owner, 0)) + 1
	return {
		"definitions": catalogue_definitions.size(),
		"scopes": scope_counts,
		"delivery_groups": delivery_group_counts,
		"kinds": kind_counts,
		"owners": owner_counts,
		"blueprints": blueprints.size(),
		"construction_projects": construction_projects.size(),
		"packs": packs.size(),
		"behaviors": behaviors.size(),
		"plan_specs": plan_specs.size(),
	}


func validation_report() -> Dictionary:
	return {
		"ok": validation_errors.is_empty(),
		"loaded": loaded,
		"errors": validation_errors.duplicate(),
		"warnings": validation_warnings.duplicate(),
		"summary": catalogue_summary(),
		"schema_migrations": schema_migration_reports.duplicate(true),
	}


func _clear() -> void:
	loaded = false
	catalogue_definitions.clear()
	building_definitions.clear()
	catalogue_project_definitions.clear()
	plan_definitions.clear()
	plan_specs.clear()
	construction_projects.clear()
	projects_by_definition.clear()
	blueprints.clear()
	packs.clear()
	behaviors.clear()
	behaviors_by_definition.clear()
	capability_gates.clear()
	fixed_step_minutes = 10
	catalogue_version = ""
	aliases.clear()
	resolution_order.clear()
	validation_errors.clear()
	validation_warnings.clear()
	schema_migration_reports.clear()
	migration_service = SchemaMigration.new()


func _load_catalogue() -> void:
	var root := _load_json(CataloguePath, "leyforge.settlement.catalogue")
	if root.is_empty():
		return
	catalogue_version = str(root.get("catalogue_version", ""))
	if catalogue_version != "20H-v0.2":
		validation_errors.append("catalogue_version_must_be_20H_v0_2")
	if int(root.get("definition_count", 0)) != 120:
		validation_errors.append("catalogue_definition_count_must_be_120")
	for value in root.get("definitions", []):
		if not (value is Dictionary):
			validation_errors.append("catalogue_entry_not_dictionary")
			continue
		var definition: Dictionary = value
		var id := str(definition.get("id", ""))
		if id.is_empty() or catalogue_definitions.has(id) or aliases.has(id):
			validation_errors.append("duplicate_or_empty_definition:%s" % id)
			continue
		var kind := str(definition.get("kind", ""))
		var record: Variant
		match kind:
			"building":
				record = Records.BuildingDefinition.from_dictionary(definition)
				building_definitions[id] = record
			"project":
				record = Records.ProjectDefinition.from_dictionary(definition)
				catalogue_project_definitions[id] = record
			"plan":
				record = Records.PlanDefinition.from_dictionary(definition)
				plan_definitions[id] = record
			_:
				validation_errors.append("invalid_definition_kind:%s" % id)
				continue
		catalogue_definitions[id] = record
		_register_aliases(id, definition.get("aliases", []))
		_validate_catalogue_definition(definition)
	if catalogue_definitions.size() != 120:
		validation_errors.append(
			"catalogue_loaded_%d_expected_120" % catalogue_definitions.size())
	_validate_catalogue_links()
	var summary := catalogue_summary()
	for scope in EXPECTED_SCOPE_COUNTS:
		var actual := int((summary.get("scopes", {}) as Dictionary).get(scope, 0))
		if actual != int(EXPECTED_SCOPE_COUNTS[scope]):
			validation_errors.append(
				"scope_count_%s_%d_expected_%d" % [
					scope, actual, int(EXPECTED_SCOPE_COUNTS[scope])])
	for delivery_group in EXPECTED_DELIVERY_GROUP_COUNTS:
		var actual := int((summary.get(
			"delivery_groups", {}) as Dictionary).get(delivery_group, 0))
		if actual != int(EXPECTED_DELIVERY_GROUP_COUNTS[delivery_group]):
			validation_errors.append(
				"delivery_group_count_%s_%d_expected_%d" % [
					delivery_group, actual,
					int(EXPECTED_DELIVERY_GROUP_COUNTS[delivery_group])])


func _load_blueprints() -> void:
	var root := _load_json(BlueprintsPath, "leyforge.settlement.blueprints")
	for value in root.get("blueprints", []):
		if not (value is Dictionary):
			validation_errors.append("blueprint_entry_not_dictionary")
			continue
		var definition: Dictionary = value
		var id := str(definition.get("id", ""))
		if id.is_empty() or blueprints.has(id):
			validation_errors.append("duplicate_or_empty_blueprint:%s" % id)
			continue
		blueprints[id] = Records.BlueprintDefinition.from_dictionary(definition)
		_register_aliases(id, definition.get("aliases", []))


func _load_plan_specs() -> void:
	var root := _load_json(PlansPath, "leyforge.settlement.plans")
	for value in root.get("plans", []):
		if not (value is Dictionary):
			validation_errors.append("plan_spec_entry_not_dictionary")
			continue
		var specification: Dictionary = value
		var id := canonical_id(str(specification.get("id", "")))
		if id.is_empty() or plan_specs.has(id):
			validation_errors.append("duplicate_or_empty_plan_spec:%s" % id)
			continue
		if not catalogue_definitions.has(id):
			validation_errors.append("plan_spec_missing_catalogue:%s" % id)
			continue
		var merged := get_definition(id)
		merged.merge(specification, true)
		var record := Records.PlanDefinition.from_dictionary(merged)
		plan_specs[id] = record
		if str(merged.get("kind", "")) == "plan":
			plan_definitions[id] = record
			catalogue_definitions[id] = record


func _load_projects() -> void:
	var root := _load_json(ProjectsPath, "leyforge.settlement.projects")
	for value in root.get("projects", []):
		if not (value is Dictionary):
			validation_errors.append("project_entry_not_dictionary")
			continue
		var definition: Dictionary = value
		var id := str(definition.get("id", ""))
		if id.is_empty() or construction_projects.has(id):
			validation_errors.append("duplicate_or_empty_project:%s" % id)
			continue
		construction_projects[id] = Records.ProjectDefinition.from_dictionary(
			definition)
		_register_aliases(id, definition.get("aliases", []))
		var target_id := canonical_id(str(definition.get(
			"catalogue_definition_id", definition.get("building_id", ""))))
		if not target_id.is_empty():
			if projects_by_definition.has(target_id):
				validation_errors.append(
					"duplicate_construction_project_for:%s" % target_id)
			else:
				projects_by_definition[target_id] = id


func _load_packs() -> void:
	var root := _load_json(PacksPath, "leyforge.settlement.packs")
	resolution_order.assign(root.get("resolution_order", []))
	for value in root.get("packs", []):
		if not (value is Dictionary):
			validation_errors.append("pack_entry_not_dictionary")
			continue
		var definition: Dictionary = value
		var id := str(definition.get("id", ""))
		if id.is_empty() or packs.has(id):
			validation_errors.append("duplicate_or_empty_pack:%s" % id)
			continue
		packs[id] = Records.PackManifest.from_dictionary(definition)
		_register_aliases(id, definition.get("aliases", []))


func _load_behaviors() -> void:
	var root := _load_json(BehaviorsPath, "leyforge.settlement.behaviors")
	fixed_step_minutes = maxi(1, int(root.get("fixed_step_minutes", 10)))
	capability_gates = root.get("capability_gates", {}).duplicate(true)
	for value in root.get("behaviors", []):
		if not (value is Dictionary):
			validation_errors.append("behavior_entry_not_dictionary")
			continue
		var definition: Dictionary = value
		var id := str(definition.get("id", ""))
		var definition_id := canonical_id(str(
			definition.get("definition_id", "")))
		if id.is_empty() or behaviors.has(id):
			validation_errors.append("duplicate_or_empty_behavior:%s" % id)
			continue
		if behaviors_by_definition.has(definition_id):
			validation_errors.append(
				"duplicate_behavior_for_definition:%s" % definition_id)
			continue
		behaviors[id] = Records.BehaviorDefinition.from_dictionary(definition)
		behaviors_by_definition[definition_id] = id


func _validate_cross_references() -> void:
	for id in construction_projects:
		var project: Dictionary = construction_projects[id].to_dictionary()
		var catalogue_definition_id := canonical_id(str(project.get(
			"catalogue_definition_id", project.get("building_id", ""))))
		if not catalogue_definitions.has(catalogue_definition_id):
			validation_errors.append(
				"project_missing_catalogue_definition:%s" % id)
		var building_id := canonical_id(str(project.get("building_id", "")))
		if not building_id.is_empty() and not building_definitions.has(building_id):
			validation_errors.append("project_missing_building:%s" % id)
		if not blueprints.has(
				canonical_id(str(project.get("blueprint_id", "")))):
			validation_errors.append("project_missing_blueprint:%s" % id)
		var blueprint := get_blueprint(str(project.get("blueprint_id", "")))
		var blueprint_stage_ids := {}
		for stage in blueprint.get("stages", []):
			blueprint_stage_ids[str((stage as Dictionary).get("id", ""))] = true
		var stage_indexes := {}
		for stage in project.get("stages", []):
			var stage_id := str((stage as Dictionary).get("id", ""))
			var index := int((stage as Dictionary).get("index", 0))
			if stage_id.is_empty() or not blueprint_stage_ids.has(stage_id):
				validation_errors.append(
					"project_stage_missing_blueprint_stage:%s:%s" % [id, stage_id])
			if index <= 0 or stage_indexes.has(index):
				validation_errors.append(
					"project_duplicate_or_invalid_stage_index:%s:%d" % [id, index])
			stage_indexes[index] = true
			for requirement_value in (stage as Dictionary).get(
					"requirements", []):
				var requirement: Dictionary = requirement_value
				var kind := str(requirement.get("kind", "item"))
				var stable_id := str(requirement.get("stable_id", ""))
				var valid_content := (
					BlockRegistry.get_id_by_stable_id(stable_id) > 0
					if kind == "block"
					else ItemRegistry.get_id_by_stable_id(stable_id) > 0)
				if not valid_content or int(requirement.get("count", 0)) <= 0:
					validation_errors.append(
						"project_invalid_requirement:%s:%s" % [id, stable_id])
	for id in blueprints:
		var report := validate_blueprint(id)
		for error in report.get("errors", []):
			validation_errors.append("blueprint:%s:%s" % [id, str(error)])
		for warning in report.get("warnings", []):
			validation_warnings.append("blueprint:%s:%s" % [id, str(warning)])
		var blueprint := get_blueprint(id)
		for definition_id in blueprint.get(
				"definition_ids", blueprint.get("building_ids", [])):
			if not catalogue_definitions.has(canonical_id(str(definition_id))):
				validation_errors.append(
					"blueprint_missing_definition:%s:%s" % [
						id, str(definition_id)])
	for id in packs:
		var pack: Dictionary = packs[id].to_dictionary()
		if str(pack.get("type", "")) not in resolution_order:
			validation_errors.append("pack_invalid_layer:%s" % id)
		var compatibility: Dictionary = pack.get("compatibility", {})
		if int(compatibility.get("registry_schema", 0)) != 2 \
				or str(compatibility.get("catalogue_version", "")) \
				!= catalogue_version:
			validation_errors.append("pack_incompatible_version:%s" % id)
		if not (pack.get("palette", {}) as Dictionary).is_empty() \
				and "palette" not in pack.get("allowed_overrides", []):
			validation_errors.append("pack_palette_override_not_permitted:%s" % id)
		for token in (pack.get("palette", {}) as Dictionary):
			var stable_id := str(pack["palette"][token])
			if BlockRegistry.get_id_by_stable_id(stable_id) <= 0:
				validation_errors.append(
					"pack_invalid_palette:%s:%s" % [id, stable_id])
		for dependency in pack.get("dependencies", []):
			if not packs.has(canonical_id(str(dependency))):
				validation_errors.append(
					"pack_missing_dependency:%s:%s" % [id, str(dependency)])
		for blueprint_id in pack.get("blueprint_ids", []):
			if not blueprints.has(canonical_id(str(blueprint_id))):
				validation_errors.append(
					"pack_missing_blueprint:%s:%s" % [id, str(blueprint_id)])
		for requirement in pack.get("runtime_requirements", []):
			if not catalogue_definitions.has(canonical_id(str(requirement))):
				validation_errors.append(
					"pack_missing_runtime_requirement:%s:%s" % [
						id, str(requirement)])
	var source_contract_ids := {}
	for id in behaviors:
		var behavior: Dictionary = behaviors[id].to_dictionary()
		var definition_id := canonical_id(str(
			behavior.get("definition_id", "")))
		if not catalogue_definitions.has(definition_id):
			validation_errors.append(
				"behavior_missing_definition:%s:%s" % [id, definition_id])
		if str(behavior.get("near_far_kernel", "")) \
				!= "settlement.fixed_step.v1":
			validation_errors.append("behavior_invalid_kernel:%s" % id)
		var staffing_contract: Dictionary = behavior.get(
			"staffing_contract", {})
		if not staffing_contract.is_empty():
			var minimum_ratio := float(staffing_contract.get(
				"minimum_ratio", 0.0))
			var target_slots := int(staffing_contract.get("target_slots", 0))
			if str(staffing_contract.get("owner_document", "")) \
					!= "Document 20" \
					or str(staffing_contract.get("assignment_owner", "")) \
					!= "Document 07" \
					or minimum_ratio <= 0.0 or minimum_ratio > 1.0 \
					or target_slots <= 0 \
					or target_slots != int(behavior.get("job_slots", 0)) \
					or (staffing_contract.get(
						"accepted_job_ids", []) as Array).is_empty() \
					or (staffing_contract.get(
						"staffing_marker_types", []) as Array).is_empty():
				validation_errors.append(
					"behavior_invalid_staffing_contract:%s" % id)
			else:
				for job_id in staffing_contract.get("accepted_job_ids", []):
					if not str(job_id).begins_with("job."):
						validation_errors.append(
							"behavior_invalid_staffing_job:%s:%s" % [
								id, str(job_id)])
				var project := get_construction_project_for_definition(
					definition_id)
				var blueprint := get_blueprint(str(project.get(
					"blueprint_id", "")))
				var marker_types := {}
				for marker_value in blueprint.get("markers", []):
					if marker_value is Dictionary:
						marker_types[str(marker_value.get(
							"type", "")).to_lower()] = true
				var matching_marker := false
				for marker_type in staffing_contract.get(
						"staffing_marker_types", []):
					if marker_types.has(str(marker_type).to_lower()):
						matching_marker = true
						break
				if project.is_empty() or blueprint.is_empty() \
						or not matching_marker:
					validation_errors.append(
						"behavior_staffing_marker_missing:%s" % id)
		for recipe in behavior.get("recipes", []):
			var recipe_record: Dictionary = recipe
			if int(recipe_record.get("cycle_minutes", 0)) <= 0:
				validation_errors.append("behavior_invalid_recipe_cycle:%s" % id)
			var inputs: Array = recipe_record.get("inputs", [])
			var outputs: Array = recipe_record.get("outputs", [])
			var source_contract: Dictionary = recipe_record.get(
				"source_contract", {})
			if inputs.is_empty() and not outputs.is_empty() \
					and source_contract.is_empty():
				validation_errors.append(
					"behavior_unbound_source_recipe:%s:%s" % [
						id, str(recipe_record.get("id", ""))])
			if not source_contract.is_empty():
				var contract_id := str(source_contract.get("id", ""))
				if contract_id.is_empty() or source_contract_ids.has(contract_id):
					validation_errors.append(
						"behavior_invalid_source_contract_id:%s:%s" % [
							id, contract_id])
				source_contract_ids[contract_id] = true
				if str(source_contract.get("source_class", "")) \
							not in VALID_RESOURCE_SOURCE_CLASSES:
					validation_errors.append(
						"behavior_invalid_source_class:%s:%s" % [
							id, contract_id])
				if str(source_contract.get("depletion_policy", "")) \
							not in VALID_RESOURCE_DEPLETION_POLICIES:
					validation_errors.append(
						"behavior_invalid_depletion_policy:%s:%s" % [
							id, contract_id])
				if int(source_contract.get("units_per_cycle", 0)) <= 0 \
						or (source_contract.get("chain_ids", []) as Array).is_empty():
					validation_errors.append(
						"behavior_incomplete_source_contract:%s:%s" % [
							id, contract_id])
				var provenance_fields: Array = source_contract.get(
					"required_provenance_fields", [])
				for field_name in REQUIRED_RESOURCE_PROVENANCE_FIELDS:
					if field_name not in provenance_fields:
						validation_errors.append(
							"behavior_missing_source_provenance:%s:%s:%s" % [
								id, contract_id, field_name])
			for direction in ["inputs", "outputs"]:
				for amount in recipe_record.get(direction, []):
					var stable_id := str(
						(amount as Dictionary).get("stable_id", ""))
					var kind := str((amount as Dictionary).get("kind", "item"))
					var valid_content := (
						BlockRegistry.get_id_by_stable_id(stable_id) > 0
						if kind == "block"
						else ItemRegistry.get_id_by_stable_id(stable_id) > 0)
					if not valid_content \
							or int((amount as Dictionary).get("count", 0)) <= 0:
						validation_errors.append(
							"behavior_invalid_recipe_content:%s:%s"
							% [id, stable_id])
	for id in plan_specs:
		var plan: Dictionary = plan_specs[id].to_dictionary()
		var component_ids := {}
		for component_value in plan.get("components", []):
			var component: Dictionary = component_value
			var component_id := str(component.get("id", ""))
			if component_id.is_empty() or component_ids.has(component_id):
				validation_errors.append(
					"plan_invalid_component:%s:%s" % [id, component_id])
			component_ids[component_id] = true
			if not construction_projects.has(canonical_id(str(
					component.get("project_template_id", "")))):
				validation_errors.append(
					"plan_missing_project_template:%s:%s" % [
						id, component_id])
			for requirement_value in component.get("requirements", []):
				var requirement: Dictionary = requirement_value
				var stable_id := str(requirement.get("stable_id", ""))
				var kind := str(requirement.get("kind", "item"))
				var valid_content := (
					BlockRegistry.get_id_by_stable_id(stable_id) > 0
					if kind == "block"
					else ItemRegistry.get_id_by_stable_id(stable_id) > 0)
				if not valid_content or int(requirement.get("count", 0)) <= 0:
					validation_errors.append(
						"plan_invalid_requirement:%s:%s" % [id, stable_id])
		for component_value in plan.get("components", []):
			for prerequisite in (component_value as Dictionary).get(
					"prerequisites", []):
				if not component_ids.has(str(prerequisite)):
					validation_errors.append(
						"plan_missing_prerequisite:%s:%s" % [
							id, str(prerequisite)])
	for stage in capability_gates:
		if str(stage) not in VALID_STAGES:
			validation_errors.append(
				"behavior_invalid_capability_stage:%s" % str(stage))
		for definition_id in capability_gates[stage]:
			if not catalogue_definitions.has(canonical_id(str(definition_id))):
				validation_errors.append(
					"behavior_gate_missing_definition:%s:%s" % [
						str(stage), str(definition_id)])
	if not aliases.has("building.infrastructure.builder_supply_yard") \
			or str(aliases["building.infrastructure.builder_supply_yard"]) \
			!= "building.construction.builder_supply_yard":
		validation_errors.append("builder_supply_yard_alias_missing")
	if not aliases.has("project.watchtower.basic") \
			or str(aliases["project.watchtower.basic"]) \
			!= "project.build.wooden_watchtower":
		validation_errors.append("watchtower_project_alias_missing")
	if blueprints.size() != 120 or construction_projects.size() != 120:
		validation_errors.append("catalogue_blueprint_project_content_incomplete")
	if behaviors.size() != 120:
		validation_errors.append("catalogue_behaviors_incomplete")
	if plan_specs.size() != 13:
		validation_errors.append("district_megaproject_plan_graphs_incomplete")
	if packs.size() != 25:
		validation_errors.append("culture_faction_biome_pack_set_incomplete")
	for definition in all_definitions():
		var definition_id := str(definition.get("id", ""))
		if not projects_by_definition.has(definition_id):
			validation_errors.append(
				"definition_missing_construction_project:%s" % definition_id)
		if not behaviors_by_definition.has(definition_id):
			validation_errors.append(
				"definition_missing_behavior:%s" % definition_id)


func _validate_catalogue_definition(definition: Dictionary) -> void:
	var id := str(definition.get("id", ""))
	var number := int(definition.get("catalogue_no", 0))
	if number < 1 or number > 120:
		validation_errors.append("invalid_catalogue_number:%s" % id)
	if str(definition.get("primary_need", "")) not in VALID_NEEDS:
		validation_errors.append("invalid_primary_need:%s" % id)
	for need in definition.get("secondary_needs", []):
		if str(need) not in VALID_NEEDS:
			validation_errors.append("invalid_secondary_need:%s:%s" % [id, need])
	if str(definition.get("min_stage", "")) not in VALID_STAGES:
		validation_errors.append("invalid_min_stage:%s" % id)
	if str(definition.get("planner_class", "")) not in VALID_PLANNER_CLASSES:
		validation_errors.append("invalid_planner_class:%s" % id)
	if str(definition.get("scope", "")) not in EXPECTED_SCOPE_COUNTS:
		validation_errors.append("invalid_scope:%s" % id)
	var owner := str(definition.get("owner_document", ""))
	if owner not in ["20A", "20B", "20C", "20D", "20E", "20F"]:
		validation_errors.append("invalid_owner:%s" % id)


func _validate_catalogue_links() -> void:
	var numbers := {}
	for definition in all_definitions():
		var id := str(definition.get("id", ""))
		var number := int(definition.get("catalogue_no", 0))
		if numbers.has(number):
			validation_errors.append(
				"duplicate_catalogue_number:%d" % number)
		numbers[number] = id
		for target_value in definition.get("upgrade_to", []):
			var target := canonical_id(str(target_value))
			if not catalogue_definitions.has(target):
				validation_errors.append(
					"upgrade_missing_target:%s:%s" % [id, target])
			elif id not in get_definition(target).get("upgrade_from", []):
				validation_errors.append(
					"upgrade_missing_reverse_from:%s:%s" % [id, target])
		for source_value in definition.get("upgrade_from", []):
			var source := canonical_id(str(source_value))
			if not catalogue_definitions.has(source):
				validation_errors.append(
					"upgrade_missing_source:%s:%s" % [id, source])
			elif id not in get_definition(source).get("upgrade_to", []):
				validation_errors.append(
					"upgrade_missing_reverse_to:%s:%s" % [source, id])


func _register_aliases(canonical: String, values: Array) -> void:
	for value in values:
		var alias := str(value)
		if alias.is_empty() or alias == canonical:
			continue
		if aliases.has(alias) and str(aliases[alias]) != canonical:
			validation_errors.append("alias_collision:%s" % alias)
			continue
		if catalogue_definitions.has(alias) or blueprints.has(alias) \
				or construction_projects.has(alias) or packs.has(alias) \
				or behaviors.has(alias) or plan_specs.has(alias):
			validation_errors.append("alias_overwrites_canonical:%s" % alias)
			continue
		aliases[alias] = canonical
		migration_service.register_alias(alias, canonical)


func _load_json(path: String, expected_schema: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		validation_errors.append("missing_file:%s" % path)
		return {}
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if not (parsed is Dictionary):
		validation_errors.append("invalid_json:%s" % path)
		return {}
	var root: Dictionary = parsed
	var migration := migration_service.migrate_document(root, expected_schema)
	var report: Dictionary = migration.duplicate(true)
	report.erase("data")
	report["path"] = path
	schema_migration_reports.append(report)
	if not bool(migration.get("ok", false)):
		for error in migration.get("errors", []):
			validation_errors.append("%s:%s" % [str(error), path])
		return {}
	return (migration.get("data", {}) as Dictionary)


func _collect_pack(
		id: String,
		selected: Dictionary,
		errors: Array[String],
		context: Dictionary,
		stack: Dictionary = {}) -> void:
	if selected.has(id):
		return
	if stack.has(id):
		errors.append("pack_dependency_cycle:%s" % id)
		return
	if not packs.has(id):
		errors.append("missing_pack:%s" % id)
		return
	var next_stack := stack.duplicate()
	next_stack[id] = true
	var pack: Variant = packs[id]
	var source: Dictionary = pack.to_dictionary()
	if not _pack_runtime_allowed(source, context):
		errors.append("pack_runtime_requirement_not_met:%s" % id)
		return
	for dependency in source.get("dependencies", []):
		var dependency_id := canonical_id(str(dependency))
		_collect_pack(
			dependency_id, selected, errors, context, next_stack)
		if not selected.has(dependency_id):
			errors.append("pack_dependency_unavailable:%s:%s" % [
				id, dependency_id])
			return
	selected[id] = pack


func _pack_runtime_allowed(pack: Dictionary, context: Dictionary) -> bool:
	var requirements: Array = pack.get("runtime_requirements", [])
	if requirements.is_empty():
		return true
	var completed := {}
	var completed_value: Variant = context.get("completed_definition_ids", [])
	if completed_value is Dictionary:
		for definition_id in completed_value:
			if bool(completed_value[definition_id]):
				completed[canonical_id(str(definition_id))] = true
	elif completed_value is Array:
		for definition_id in completed_value:
			completed[canonical_id(str(definition_id))] = true
	for requirement in requirements:
		if not completed.has(canonical_id(str(requirement))):
			return false
	return true


func _expand_operation(
		operation: Dictionary,
		palette: Dictionary,
		cells: Dictionary) -> void:
	var token := str(operation.get("token", ""))
	var stable_id := str(palette.get(token, ""))
	if stable_id.is_empty():
		return
	var op := str(operation.get("op", ""))
	match op:
		"point":
			_add_cell(cells, operation.get("position", []), token, stable_id)
		"fill":
			var origin: Array = operation.get("origin", [])
			var size: Array = operation.get("size", [])
			if not _is_vector_array(origin) or not _is_vector_array(size):
				return
			for x in range(int(size[0])):
				for y in range(int(size[1])):
					for z in range(int(size[2])):
						_add_cell(cells, [
							int(origin[0]) + x,
							int(origin[1]) + y,
							int(origin[2]) + z,
						], token, stable_id)
		"pillar":
			var origin: Array = operation.get("origin", [])
			if not _is_vector_array(origin):
				return
			for y in range(maxi(0, int(operation.get("height", 0)))):
				_add_cell(cells, [
					int(origin[0]),
					int(origin[1]) + y,
					int(origin[2]),
				], token, stable_id)
		"line":
			var origin: Array = operation.get("origin", [])
			if not _is_vector_array(origin):
				return
			var axis := str(operation.get("axis", "x"))
			for offset in range(maxi(0, int(operation.get("length", 0)))):
				var position := [
					int(origin[0]),
					int(origin[1]),
					int(origin[2]),
				]
				match axis:
					"x":
						position[0] += offset
					"y":
						position[1] += offset
					"z":
						position[2] += offset
				_add_cell(cells, position, token, stable_id)
		"perimeter":
			_expand_perimeter(operation, token, stable_id, cells)


func _expand_perimeter(
		operation: Dictionary,
		token: String,
		stable_id: String,
		cells: Dictionary) -> void:
	var origin: Array = operation.get("origin", [])
	var size: Array = operation.get("size", [])
	if not _is_vector_array(origin) or not _is_vector_array(size):
		return
	var excluded := {}
	for value in operation.get("exclude", []):
		if _is_vector_array(value):
			excluded[_cell_key(value)] = true
	for x in range(int(size[0])):
		for y in range(int(size[1])):
			for z in range(int(size[2])):
				if x not in [0, int(size[0]) - 1] \
						and z not in [0, int(size[2]) - 1]:
					continue
				var position := [
					int(origin[0]) + x,
					int(origin[1]) + y,
					int(origin[2]) + z,
				]
				if not excluded.has(_cell_key(position)):
					_add_cell(cells, position, token, stable_id)


func _add_cell(
		cells: Dictionary,
		position_value: Variant,
		token: String,
		stable_id: String) -> void:
	if not _is_vector_array(position_value):
		return
	var position: Array = position_value
	cells[_cell_key(position)] = {
		"local_position": [
			int(position[0]),
			int(position[1]),
			int(position[2]),
		],
		"token": token,
		"stable_id": stable_id,
	}


func _cell_key(position: Array) -> String:
	return "%d,%d,%d" % [
		int(position[0]),
		int(position[1]),
		int(position[2]),
	]


func _is_vector_array(value: Variant) -> bool:
	return value is Array and (value as Array).size() == 3


func _position_within_bounds(value: Variant, bounds: Dictionary) -> bool:
	if not _is_vector_array(value) \
			or not _is_vector_array(bounds.get("min", [])) \
			or not _is_vector_array(bounds.get("max", [])):
		return false
	var position: Array = value
	var minimum: Array = bounds["min"]
	var maximum: Array = bounds["max"]
	for axis in 3:
		if int(position[axis]) < int(minimum[axis]) \
				or int(position[axis]) > int(maximum[axis]):
			return false
	return true
