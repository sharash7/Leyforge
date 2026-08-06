@tool
class_name ForgeRetargetMap
extends Resource
## Explicit semantic retarget compatibility and correction record.

const CONTRACT_VERSION := "22-stage3-v1"

@export var schema_version := 1
@export var retarget_map_id := ""
@export var display_name := ""
@export var source_rig_profile_id := ""
@export var target_rig_profile_id := ""
@export var compatibility_level := "exact"
@export var role_mappings: Dictionary = {}
@export var scale_corrections: Dictionary = {}
@export var orientation_corrections: Dictionary = {}
@export var missing_role_fallbacks: Dictionary = {}
@export var lifecycle := "draft"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []
@export var aliases: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.retarget-map",
		"schema_version": schema_version,
		"retarget_map_id": retarget_map_id,
		"display_name": display_name,
		"source_rig_profile_id": source_rig_profile_id,
		"target_rig_profile_id": target_rig_profile_id,
		"compatibility_level": compatibility_level,
		"role_mappings": role_mappings.duplicate(true),
		"scale_corrections": scale_corrections.duplicate(true),
		"orientation_corrections": orientation_corrections.duplicate(true),
		"missing_role_fallbacks": missing_role_fallbacks.duplicate(true),
		"lifecycle": lifecycle,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"aliases": Array(aliases),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
