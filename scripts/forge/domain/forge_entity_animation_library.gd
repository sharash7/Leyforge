@tool
class_name ForgeEntityAnimationLibrary
extends Resource
## Versioned semantic clip library for one compatible rig family.

const CONTRACT_VERSION := "22-stage3-v1"

@export var schema_version := 1
@export var animation_library_id := ""
@export var display_name := ""
@export var rig_profile_id := ""
@export var rig_family := ""
@export var clips: Array[ForgeEntityAnimationClip] = []
@export var retarget_map_ids: PackedStringArray = []
@export var foot_placement_profile_id := ""
@export var animation_lod_levels: Array[Dictionary] = []
@export var lifecycle := "draft"
@export var source_status := "validated_runtime_source"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []
@export var aliases: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	var clip_records: Array[Dictionary] = []
	for clip in clips:
		if clip != null:
			clip_records.append(clip.to_record())
	clip_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("clip_id", "")) < str(b.get("clip_id", "")))
	return {
		"schema": "leyforge.forge.entity-animation-library",
		"schema_version": schema_version,
		"animation_library_id": animation_library_id,
		"display_name": display_name,
		"rig_profile_id": rig_profile_id,
		"rig_family": rig_family,
		"clips": clip_records,
		"retarget_map_ids": Array(retarget_map_ids),
		"foot_placement_profile_id": foot_placement_profile_id,
		"animation_lod_levels": animation_lod_levels.duplicate(true),
		"lifecycle": lifecycle,
		"source_status": source_status,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"aliases": Array(aliases),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func clip_for_action(action_id: String, lod_level := 0) -> ForgeEntityAnimationClip:
	for clip in clips:
		if clip != null and clip.semantic_action == action_id \
				and lod_level >= clip.minimum_lod and lod_level <= clip.maximum_lod:
			return clip
	return null
