@tool
class_name ForgeFootPlacementProfile
extends Resource
## Bounded deterministic terrain-contact assistance profile.

const CONTRACT_VERSION := "22-stage3-v1"

@export var schema_version := 1
@export var foot_placement_profile_id := ""
@export var display_name := ""
@export var rig_profile_id := ""
@export var contact_role_ids: PackedStringArray = []
@export var maximum_step_height_meters := 0.35
@export var maximum_offset_meters := 0.2
@export var blend_speed := 8.0
@export var minimum_confidence := 0.4
@export var failure_fallback := "authored_animation"
@export var lod_max := 1
@export var lifecycle := "draft"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.foot-placement-profile",
		"schema_version": schema_version,
		"foot_placement_profile_id": foot_placement_profile_id,
		"display_name": display_name,
		"rig_profile_id": rig_profile_id,
		"contact_role_ids": Array(contact_role_ids),
		"maximum_step_height_meters": maximum_step_height_meters,
		"maximum_offset_meters": maximum_offset_meters,
		"blend_speed": blend_speed,
		"minimum_confidence": minimum_confidence,
		"failure_fallback": failure_fallback,
		"lod_max": lod_max,
		"lifecycle": lifecycle,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
