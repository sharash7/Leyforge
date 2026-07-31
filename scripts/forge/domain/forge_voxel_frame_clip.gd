@tool
class_name ForgeVoxelFrameClip
extends Resource
## Bounded shape-changing source frames. Frames are baked to meshes; runtime
## playback only swaps precomputed mesh resources.

@export var schema_version := 1
@export var clip_id := ""
@export var frames: Array[Resource] = []
@export var frame_durations := PackedFloat32Array()
@export var loop := true
@export var onion_skin_enabled := true
@export var reduced_motion_frame := 0
@export var lod_policy := {
	"near": "animated",
	"mid": "reduced_rate",
	"far": "static_reduced_motion_frame",
}


func duration_for(frame_index: int) -> float:
	if frame_index >= 0 and frame_index < frame_durations.size():
		return maxf(0.01, frame_durations[frame_index])
	return 0.1


func total_duration() -> float:
	var result := 0.0
	for index in frames.size():
		result += duration_for(index)
	return maxf(0.01, result)


func to_record() -> Dictionary:
	var frame_records: Array[Dictionary] = []
	for frame in frames:
		frame_records.append(
			frame.to_record() if frame is ForgeVoxelVolume else {})
	return {
		"schema_version": schema_version,
		"clip_id": clip_id,
		"frames": frame_records,
		"frame_durations": Array(frame_durations),
		"loop": loop,
		"onion_skin_enabled": onion_skin_enabled,
		"reduced_motion_frame": reduced_motion_frame,
		"lod_policy": lod_policy.duplicate(true),
	}
