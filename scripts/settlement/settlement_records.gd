class_name SettlementRecords
extends RefCounted
## Typed, serialisable records shared by the Document 20 settlement systems.
##
## Definitions are immutable after registry load. Runtime records are mutable
## save-state objects owned by HamletState and keyed by stable string IDs.


class DefinitionBase:
	extends RefCounted

	var id := ""
	var aliases: Array[String] = []
	var display_name := ""
	var schema_version := 1
	var source: Dictionary = {}

	func _load_common(value: Dictionary) -> void:
		source = value.duplicate(true)
		id = str(value.get("id", ""))
		display_name = str(value.get("display_name", id))
		schema_version = int(value.get("schema_version", 1))
		aliases.assign(value.get("aliases", []))

	func to_dictionary() -> Dictionary:
		return source.duplicate(true)


class BuildingDefinition:
	extends DefinitionBase

	var catalogue_no := 0
	var min_stage := "camp"
	var primary_need := ""
	var secondary_needs: Array[String] = []
	var planner_class := "optional"
	var scope := "deferred"
	var owner_document := ""
	var release_wave := 0
	var purpose := ""
	var tags: Array[String] = []
	var capacity: Dictionary = {}
	var jobs: Array = []
	var inputs: Array = []
	var outputs: Array = []
	var required_markers: Array[String] = []
	var utility_requirements: Array[String] = []
	var upgrade_from: Array[String] = []
	var upgrade_to: Array[String] = []
	var damage_profile: Array[String] = []
	var maintenance_profile := "standard"
	var capabilities: Array[String] = []
	var construction: Dictionary = {}
	var planner: Dictionary = {}
	var upgrade_notes := ""
	var culture_and_style := ""
	var player_blueprint_validation := ""
	var implementation_status := "registry"

	static func from_dictionary(value: Dictionary) -> BuildingDefinition:
		var record := BuildingDefinition.new()
		record._load_common(value)
		record.catalogue_no = int(value.get("catalogue_no", 0))
		record.min_stage = str(value.get("min_stage", "camp"))
		record.primary_need = str(value.get("primary_need", ""))
		record.secondary_needs.assign(value.get("secondary_needs", []))
		record.planner_class = str(value.get("planner_class", "optional"))
		record.scope = str(value.get("scope", "deferred"))
		record.owner_document = str(value.get("owner_document", ""))
		record.release_wave = int(value.get("release_wave", 0))
		record.purpose = str(value.get("purpose", ""))
		record.tags.assign(value.get("tags", []))
		record.capacity = value.get("capacity", {}).duplicate(true)
		record.jobs = value.get("jobs", []).duplicate(true)
		record.inputs = value.get("inputs", []).duplicate(true)
		record.outputs = value.get("outputs", []).duplicate(true)
		record.required_markers.assign(value.get("required_markers", []))
		record.utility_requirements.assign(value.get("utility_requirements", []))
		record.upgrade_from.assign(value.get("upgrade_from", []))
		record.upgrade_to.assign(value.get("upgrade_to", []))
		record.damage_profile.assign(value.get("damage_profile", []))
		record.maintenance_profile = str(
			value.get("maintenance_profile", "standard"))
		record.capabilities.assign(value.get("capabilities", []))
		record.construction = value.get("construction", {}).duplicate(true)
		record.planner = value.get("planner", {}).duplicate(true)
		record.upgrade_notes = str(value.get("upgrade_notes", ""))
		record.culture_and_style = str(value.get("culture_and_style", ""))
		record.player_blueprint_validation = str(
			value.get("player_blueprint_validation", ""))
		record.implementation_status = str(
			value.get("implementation_status", "registry"))
		return record


class ProjectDefinition:
	extends DefinitionBase

	var catalogue_no := 0
	var catalogue_definition_id := ""
	var building_id := ""
	var blueprint_id := ""
	var min_stage := "camp"
	var primary_need := ""
	var planner_class := "optional"
	var scope := "deferred"
	var owner_document := ""
	var stages: Array[Dictionary] = []
	var activation: Dictionary = {}
	var builder_job_tags: Array[String] = []
	var repair: Dictionary = {}
	var cancellation: Dictionary = {}

	static func from_dictionary(value: Dictionary) -> ProjectDefinition:
		var record := ProjectDefinition.new()
		record._load_common(value)
		record.catalogue_no = int(value.get("catalogue_no", 0))
		record.catalogue_definition_id = str(value.get(
			"catalogue_definition_id", value.get("building_id", "")))
		record.building_id = str(value.get("building_id", ""))
		record.blueprint_id = str(value.get("blueprint_id", ""))
		record.min_stage = str(value.get("min_stage", "camp"))
		record.primary_need = str(value.get("primary_need", ""))
		record.planner_class = str(value.get("planner_class", "optional"))
		record.scope = str(value.get("scope", "deferred"))
		record.owner_document = str(value.get("owner_document", ""))
		for stage in value.get("stages", []):
			if stage is Dictionary:
				record.stages.append(stage.duplicate(true))
		record.activation = value.get("activation", {}).duplicate(true)
		record.builder_job_tags.assign(value.get("builder_job_tags", []))
		record.repair = value.get("repair", {}).duplicate(true)
		record.cancellation = value.get("cancellation", {}).duplicate(true)
		return record

	func get_stage(stage_index: int) -> Dictionary:
		for stage in stages:
			if int(stage.get("index", 0)) == stage_index:
				return stage.duplicate(true)
		return {}


class BlueprintDefinition:
	extends DefinitionBase

	var version := 1
	var building_ids: Array[String] = []
	var definition_ids: Array[String] = []
	var bounds: Dictionary = {}
	var pivot: Array = []
	var palette: Dictionary = {}
	var stages: Array[Dictionary] = []
	var markers: Array[Dictionary] = []
	var required_marker_types: Array[String] = []
	var sockets: Array[String] = []
	var terrain_rules: Dictionary = {}
	var status := "draft"

	static func from_dictionary(value: Dictionary) -> BlueprintDefinition:
		var record := BlueprintDefinition.new()
		record._load_common(value)
		record.version = int(value.get("version", 1))
		record.building_ids.assign(value.get("building_ids", []))
		record.definition_ids.assign(value.get(
			"definition_ids", value.get("building_ids", [])))
		record.bounds = value.get("bounds", {}).duplicate(true)
		record.pivot = value.get("pivot", []).duplicate(true)
		record.palette = value.get("palette", {}).duplicate(true)
		for stage in value.get("stages", []):
			if stage is Dictionary:
				record.stages.append(stage.duplicate(true))
		for marker in value.get("markers", []):
			if marker is Dictionary:
				record.markers.append(marker.duplicate(true))
		record.required_marker_types.assign(
			value.get("required_marker_types", []))
		record.sockets.assign(value.get("sockets", []))
		record.terrain_rules = value.get("terrain_rules", {}).duplicate(true)
		record.status = str(value.get("status", "draft"))
		return record

	func get_stage(stage_id: String) -> Dictionary:
		for stage in stages:
			if str(stage.get("id", "")) == stage_id:
				return stage.duplicate(true)
		return {}


class PlanDefinition:
	extends DefinitionBase

	var catalogue_no := 0
	var min_stage := "village"
	var primary_need := ""
	var planner_class := "district"
	var scope := "deferred"
	var owner_document := ""
	var required_roles: Array[Dictionary] = []
	var optional_roles: Array[Dictionary] = []
	var phases: Array[Dictionary] = []
	var network_requirements: Array[String] = []
	var roads: Array[Dictionary] = []
	var utilities: Array[Dictionary] = []
	var components: Array[Dictionary] = []
	var substitutions: Array[Dictionary] = []

	static func from_dictionary(value: Dictionary) -> PlanDefinition:
		var record := PlanDefinition.new()
		record._load_common(value)
		record.catalogue_no = int(value.get("catalogue_no", 0))
		record.min_stage = str(value.get("min_stage", "village"))
		record.primary_need = str(value.get("primary_need", ""))
		record.planner_class = str(value.get("planner_class", "district"))
		record.scope = str(value.get("scope", "deferred"))
		record.owner_document = str(value.get("owner_document", ""))
		for role in value.get("required_roles", []):
			if role is Dictionary:
				record.required_roles.append(role.duplicate(true))
		for role in value.get("optional_roles", []):
			if role is Dictionary:
				record.optional_roles.append(role.duplicate(true))
		for phase in value.get("phases", []):
			if phase is Dictionary:
				record.phases.append(phase.duplicate(true))
		record.network_requirements.assign(
			value.get("network_requirements", []))
		for road in value.get("roads", []):
			if road is Dictionary:
				record.roads.append(road.duplicate(true))
		for utility in value.get("utilities", []):
			if utility is Dictionary:
				record.utilities.append(utility.duplicate(true))
		for component in value.get("components", []):
			if component is Dictionary:
				record.components.append(component.duplicate(true))
		for substitution in value.get("substitutions", []):
			if substitution is Dictionary:
				record.substitutions.append(substitution.duplicate(true))
		return record


class PackManifest:
	extends DefinitionBase

	var version := 1
	var pack_namespace := ""
	var type := "foundation"
	var priority := 0
	var dependencies: Array[String] = []
	var compatibility: Dictionary = {}
	var runtime_requirements: Array[String] = []
	var optional := true
	var palette: Dictionary = {}
	var blueprint_ids: Array[String] = []
	var allowed_overrides: Array[String] = []

	static func from_dictionary(value: Dictionary) -> PackManifest:
		var record := PackManifest.new()
		record._load_common(value)
		record.version = int(value.get("version", 1))
		record.pack_namespace = str(value.get(
			"namespace", value.get("id", "")))
		record.type = str(value.get("type", "foundation"))
		record.priority = int(value.get("priority", 0))
		record.dependencies.assign(value.get("dependencies", []))
		record.compatibility = value.get("compatibility", {}).duplicate(true)
		record.runtime_requirements.assign(
			value.get("runtime_requirements", []))
		record.optional = bool(value.get("optional", true))
		record.palette = value.get("palette", {}).duplicate(true)
		record.blueprint_ids.assign(value.get("blueprint_ids", []))
		record.allowed_overrides.assign(value.get("allowed_overrides", []))
		return record


class PackOverlay:
	extends RefCounted

	var pack_ids: Array[String] = []
	var palette: Dictionary = {}
	var blueprint_ids: Array[String] = []
	var layers: Array[Dictionary] = []
	var errors: Array[String] = []

	func to_dictionary() -> Dictionary:
		return {
			"pack_ids": pack_ids.duplicate(),
			"palette": palette.duplicate(true),
			"blueprint_ids": blueprint_ids.duplicate(),
			"layers": layers.duplicate(true),
			"errors": errors.duplicate(),
		}


class BehaviorDefinition:
	extends DefinitionBase

	var definition_id := ""
	var min_stage := "camp"
	var need_capacity: Dictionary = {}
	var housing_capacity := 0
	var job_slots := 0
	var storage_capacity := 0
	var network_roles: Array[String] = []
	var capabilities: Array[String] = []
	var recipes: Array[Dictionary] = []
	var required_inputs: Array = []
	var service_outputs: Array = []
	var failure_rules := ""
	var activation_requires_access := false
	var near_far_kernel := "settlement.fixed_step.v1"

	static func from_dictionary(value: Dictionary) -> BehaviorDefinition:
		var record := BehaviorDefinition.new()
		record._load_common(value)
		record.definition_id = str(value.get("definition_id", ""))
		record.min_stage = str(value.get("min_stage", "camp"))
		record.need_capacity = value.get("need_capacity", {}).duplicate(true)
		record.housing_capacity = maxi(
			0, int(value.get("housing_capacity", 0)))
		record.job_slots = maxi(0, int(value.get("job_slots", 0)))
		record.storage_capacity = maxi(
			0, int(value.get("storage_capacity", 0)))
		record.network_roles.assign(value.get("network_roles", []))
		record.capabilities.assign(value.get("capabilities", []))
		for recipe in value.get("recipes", []):
			if recipe is Dictionary:
				record.recipes.append(recipe.duplicate(true))
		record.required_inputs = value.get("required_inputs", []).duplicate(true)
		record.service_outputs = value.get("service_outputs", []).duplicate(true)
		record.failure_rules = str(value.get("failure_rules", ""))
		record.activation_requires_access = bool(
			value.get("activation_requires_access", false))
		record.near_far_kernel = str(value.get(
			"near_far_kernel", "settlement.fixed_step.v1"))
		return record


class BuildingRuntimeRecord:
	extends RefCounted

	var instance_id := ""
	var definition_id := ""
	var blueprint_id := ""
	var owner_id := ""
	var condition := 1.0
	var staffing := 1.0
	var inputs_available := 1.0
	var access := 1.0
	var utilities := 1.0
	var suitability := 1.0
	var active := false
	var position: Array = []
	var buffers: Dictionary = {}
	var history: Array[Dictionary] = []

	static func from_dictionary(value: Dictionary) -> BuildingRuntimeRecord:
		var record := BuildingRuntimeRecord.new()
		record.instance_id = str(value.get("instance_id", ""))
		record.definition_id = str(value.get("definition_id", ""))
		record.blueprint_id = str(value.get("blueprint_id", ""))
		record.owner_id = str(value.get("owner_id", ""))
		record.condition = clampf(float(value.get("condition", 1.0)), 0.0, 1.0)
		record.staffing = clampf(float(value.get("staffing", 1.0)), 0.0, 1.0)
		record.inputs_available = clampf(
			float(value.get("inputs_available", 1.0)), 0.0, 1.0)
		record.access = clampf(float(value.get("access", 1.0)), 0.0, 1.0)
		record.utilities = clampf(float(value.get("utilities", 1.0)), 0.0, 1.0)
		record.suitability = clampf(
			float(value.get("suitability", 1.0)), 0.0, 1.0)
		record.active = bool(value.get("active", false))
		record.position = value.get("position", []).duplicate(true)
		record.buffers = value.get("buffers", {}).duplicate(true)
		for entry in value.get("history", []):
			if entry is Dictionary:
				record.history.append(entry.duplicate(true))
		return record

	func to_dictionary() -> Dictionary:
		return {
			"instance_id": instance_id,
			"definition_id": definition_id,
			"blueprint_id": blueprint_id,
			"owner_id": owner_id,
			"condition": condition,
			"staffing": staffing,
			"inputs_available": inputs_available,
			"access": access,
			"utilities": utilities,
			"suitability": suitability,
			"active": active,
			"position": position.duplicate(true),
			"buffers": buffers.duplicate(true),
			"history": history.duplicate(true),
		}


class ProjectRuntimeRecord:
	extends RefCounted

	var instance_id := ""
	var definition_id := ""
	var building_definition_id := ""
	var blueprint_id := ""
	var owner_id := ""
	var stage_index := 1
	var placed_cells := 0
	var stage_cell_total := 0
	var complete := false
	var cancelled := false
	var reserved: Dictionary = {}
	var delivered: Dictionary = {}
	var condition := 1.0
	var damage: Dictionary = {}
	var position: Array = []
	var history: Array[Dictionary] = []

	static func from_dictionary(value: Dictionary) -> ProjectRuntimeRecord:
		var record := ProjectRuntimeRecord.new()
		record.instance_id = str(value.get("instance_id", ""))
		record.definition_id = str(value.get("definition_id", ""))
		record.building_definition_id = str(
			value.get("building_definition_id", ""))
		record.blueprint_id = str(value.get("blueprint_id", ""))
		record.owner_id = str(value.get("owner_id", ""))
		record.stage_index = maxi(1, int(value.get("stage_index", 1)))
		record.placed_cells = maxi(0, int(value.get("placed_cells", 0)))
		record.stage_cell_total = maxi(0, int(value.get("stage_cell_total", 0)))
		record.complete = bool(value.get("complete", false))
		record.cancelled = bool(value.get("cancelled", false))
		record.reserved = value.get("reserved", {}).duplicate(true)
		record.delivered = value.get("delivered", {}).duplicate(true)
		record.condition = clampf(float(value.get("condition", 1.0)), 0.0, 1.0)
		record.damage = value.get("damage", {}).duplicate(true)
		record.position = value.get("position", []).duplicate(true)
		for entry in value.get("history", []):
			if entry is Dictionary:
				record.history.append(entry.duplicate(true))
		return record

	func to_dictionary() -> Dictionary:
		return {
			"instance_id": instance_id,
			"definition_id": definition_id,
			"building_definition_id": building_definition_id,
			"blueprint_id": blueprint_id,
			"owner_id": owner_id,
			"stage_index": stage_index,
			"placed_cells": placed_cells,
			"stage_cell_total": stage_cell_total,
			"complete": complete,
			"cancelled": cancelled,
			"reserved": reserved.duplicate(true),
			"delivered": delivered.duplicate(true),
			"condition": condition,
			"damage": damage.duplicate(true),
			"position": position.duplicate(true),
			"history": history.duplicate(true),
		}


class PlanRuntimeRecord:
	extends RefCounted

	var instance_id := ""
	var definition_id := ""
	var owner_id := ""
	var graph_kind := "district_plan"
	var phase_index := 0
	var component_ids: Array[String] = []
	var component_records: Dictionary = {}
	var active := false
	var activation := 0.0
	var condition := 1.0
	var lod_state := "record"
	var boundary: Array = []
	var history: Array[Dictionary] = []

	static func from_dictionary(value: Dictionary) -> PlanRuntimeRecord:
		var record := PlanRuntimeRecord.new()
		record.instance_id = str(value.get("instance_id", ""))
		record.definition_id = str(value.get("definition_id", ""))
		record.owner_id = str(value.get("owner_id", ""))
		record.graph_kind = str(value.get("graph_kind", "district_plan"))
		record.phase_index = maxi(0, int(value.get("phase_index", 0)))
		record.component_ids.assign(value.get("component_ids", []))
		record.component_records = value.get(
			"component_records", {}).duplicate(true)
		record.active = bool(value.get("active", false))
		record.activation = clampf(
			float(value.get("activation", 0.0)), 0.0, 1.0)
		record.condition = clampf(
			float(value.get("condition", 1.0)), 0.0, 1.0)
		record.lod_state = str(value.get("lod_state", "record"))
		record.boundary = value.get("boundary", []).duplicate(true)
		for entry in value.get("history", []):
			if entry is Dictionary:
				record.history.append(entry.duplicate(true))
		return record

	func to_dictionary() -> Dictionary:
		return {
			"instance_id": instance_id,
			"definition_id": definition_id,
			"owner_id": owner_id,
			"graph_kind": graph_kind,
			"phase_index": phase_index,
			"component_ids": component_ids.duplicate(),
			"component_records": component_records.duplicate(true),
			"active": active,
			"activation": activation,
			"condition": condition,
			"lod_state": lod_state,
			"boundary": boundary.duplicate(true),
			"history": history.duplicate(true),
		}
