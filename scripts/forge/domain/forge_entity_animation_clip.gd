@tool
class_name ForgeEntityAnimationClip
extends Resource
## Semantic transform clip independent of concrete Godot bone names.

@export var schema_version := 1
@export var clip_id := ""
@export var display_name := ""
@export var semantic_action := "idle"
@export var duration_seconds := 1.0
@export var looping := true
@export var role_tracks: Array[Dictionary] = []
@export var event_markers: Array[ForgeAnimationEventMarker] = []
@export var root_motion_policy := "in_place"
@export var interrupt_policy := "blend"
@export var minimum_lod := 0
@export var maximum_lod := 3
@export var deterministic := true
@export var lifecycle := "draft"


func to_record() -> Dictionary:
	var marker_records: Array[Dictionary] = []
	for marker in event_markers:
		if marker != null:
			marker_records.append(marker.to_record())
	marker_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if float(a.get("normalized_time", 0.0)) != float(
				b.get("normalized_time", 0.0)):
			return float(a.get("normalized_time", 0.0)) < float(
				b.get("normalized_time", 0.0))
		return str(a.get("marker_id", "")) < str(b.get("marker_id", "")))
	return {
		"schema": "leyforge.forge.entity-animation-clip",
		"schema_version": schema_version,
		"clip_id": clip_id,
		"display_name": display_name,
		"semantic_action": semantic_action,
		"duration_seconds": duration_seconds,
		"looping": looping,
		"role_tracks": role_tracks.duplicate(true),
		"event_markers": marker_records,
		"root_motion_policy": root_motion_policy,
		"interrupt_policy": interrupt_policy,
		"minimum_lod": minimum_lod,
		"maximum_lod": maximum_lod,
		"deterministic": deterministic,
		"lifecycle": lifecycle,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
