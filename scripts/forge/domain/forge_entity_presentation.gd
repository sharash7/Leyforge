@tool
class_name ForgeEntityPresentation
extends Resource

@export var schema_version := 1
@export var entity_presentation_id := ""
@export var entity_definition_id := ""
@export var body_plan_id := ""
@export var body_part_ids: PackedStringArray = []
@export var rig_id := ""
@export var animation_set_id := ""
@export var contract_id := ""
@export var equipment_profile_id := ""
@export var capture_profile_id := ""
@export var lifecycle := "draft"
@export var dependency_ids: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.entity-presentation",
		"schema_version": schema_version,
		"entity_presentation_id": entity_presentation_id,
		"entity_definition_id": entity_definition_id,
		"body_plan_id": body_plan_id,
		"body_part_ids": Array(body_part_ids),
		"rig_id": rig_id,
		"animation_set_id": animation_set_id,
		"contract_id": contract_id,
		"equipment_profile_id": equipment_profile_id,
		"capture_profile_id": capture_profile_id,
		"lifecycle": lifecycle,
		"dependency_ids": Array(dependency_ids),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
