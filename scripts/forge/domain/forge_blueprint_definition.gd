@tool
class_name ForgeBlueprintDefinition
extends Resource

@export var schema_version := 1
@export var blueprint_id := ""
@export var display_name := ""
@export var definition_ids: PackedStringArray = []
@export var module_ids: PackedStringArray = []
@export var elements: Array[ForgeBlueprintElement] = []
@export var construction_deltas: Array[ForgeConstructionDelta] = []
@export var placement_profile: ForgePlacementProfile
@export var material_role_set: ForgeBlueprintMaterialRoleSet
@export var contract_ids: PackedStringArray = []
@export var capture_profile_id := ""
@export var lifecycle := "draft"
@export var template_id := ""
@export var template_locked := false
@export var extension_points: PackedStringArray = []
@export var source_status := "draft"
@export var visual_approval := "open"
@export var contract_version := "22-stage1-v1"
@export var dependency_ids: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	var element_records: Array[Dictionary] = []
	for element in elements:
		if element != null:
			element_records.append(element.to_record())
	var delta_records: Array[Dictionary] = []
	for delta in construction_deltas:
		if delta != null:
			delta_records.append(delta.to_record())
	return {
		"schema": "leyforge.forge.blueprint-definition",
		"schema_version": schema_version,
		"blueprint_id": blueprint_id,
		"display_name": display_name,
		"definition_ids": Array(definition_ids),
		"module_ids": Array(module_ids),
		"elements": element_records,
		"construction_deltas": delta_records,
		"placement_profile": (
			placement_profile.to_record() if placement_profile != null else {}),
		"material_role_set": (
			material_role_set.to_record() if material_role_set != null else {}),
		"contract_ids": Array(contract_ids),
		"capture_profile_id": capture_profile_id,
		"lifecycle": lifecycle,
		"template_id": template_id,
		"template_locked": template_locked,
		"extension_points": Array(extension_points),
		"source_status": source_status,
		"visual_approval": visual_approval,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
