@tool
class_name ForgeAnimationSet
extends Resource
## Source clips remain independent of the eventual runtime player.

@export var schema_version := 1
@export var animation_set_id := ""
@export var clips: Array[Dictionary] = []
@export var voxel_frame_clips: Array[Resource] = []


func get_clip(clip_id: String) -> Dictionary:
	for clip in clips:
		if str(clip.get("clip_id", "")) == clip_id:
			return clip.duplicate(true)
	return {}


func upsert_clip(clip: Dictionary) -> void:
	var clip_id := str(clip.get("clip_id", ""))
	for index in clips.size():
		if str(clips[index].get("clip_id", "")) == clip_id:
			clips[index] = clip.duplicate(true)
			return
	clips.append(clip.duplicate(true))


func get_voxel_frame_clip(clip_id: String) -> ForgeVoxelFrameClip:
	for resource in voxel_frame_clips:
		if resource is ForgeVoxelFrameClip and resource.clip_id == clip_id:
			return resource
	return null


func to_record() -> Dictionary:
	var frame_records: Array[Dictionary] = []
	for resource in voxel_frame_clips:
		frame_records.append(
			resource.to_record() if resource is ForgeVoxelFrameClip else {})
	return {
		"schema_version": schema_version,
		"animation_set_id": animation_set_id,
		"clips": clips.duplicate(true),
		"voxel_frame_clips": frame_records,
	}
