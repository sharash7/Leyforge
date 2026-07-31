class_name ForgeVoxelFrameBaker
extends RefCounted
## Precomputes every bounded voxel frame. Runtime geometry generation is
## deliberately absent from this product format.

const BAKER_VERSION := "forge-voxel-frame-v1"


static func bake(
		clip: ForgeVoxelFrameClip,
		palette: ForgePaletteDefinition) -> Dictionary:
	var diagnostics: Array[Dictionary] = []
	var baked_frames: Array[Dictionary] = []
	if clip == null or clip.clip_id.is_empty():
		return {
			"ok": false,
			"diagnostics": [{
				"code": "FORGE-FRAME-001",
				"severity": "error",
				"message": "Voxel-frame clip has no stable clip_id.",
			}],
		}
	var expected_dimensions := Vector3i.ZERO
	for index in clip.frames.size():
		var source := clip.frames[index]
		if not source is ForgeVoxelVolume:
			diagnostics.append({
				"code": "FORGE-FRAME-002",
				"severity": "error",
				"message": "Frame %d has no voxel volume." % index,
			})
			continue
		var volume: ForgeVoxelVolume = source
		if expected_dimensions == Vector3i.ZERO:
			expected_dimensions = volume.dimensions
		elif volume.dimensions != expected_dimensions:
			diagnostics.append({
				"code": "FORGE-FRAME-003",
				"severity": "error",
				"message": "Frame %d dimensions do not match the clip." % index,
			})
			continue
		var result := ForgeMeshBaker.bake(volume, palette)
		if not bool(result.get("ok", false)):
			diagnostics.append({
				"code": "FORGE-FRAME-004",
				"severity": "error",
				"message": "Frame %d could not be meshed." % index,
			})
			continue
		baked_frames.append({
			"index": index,
			"duration": clip.duration_for(index),
			"mesh": result["mesh"],
			"metrics": result.get("metrics", {}).duplicate(true),
		})
	if baked_frames.is_empty():
		diagnostics.append({
			"code": "FORGE-FRAME-001",
			"severity": "error",
			"message": "Voxel-frame clip contains no bakeable frames.",
		})
	return {
		"ok": diagnostics.filter(func(value: Dictionary) -> bool:
			return str(value.get("severity", "")) == "error").is_empty(),
		"frames": baked_frames,
		"frame_count": baked_frames.size(),
		"reduced_motion_frame": clampi(
			clip.reduced_motion_frame, 0, maxi(0, baked_frames.size() - 1)),
		"total_duration": clip.total_duration(),
		"loop": clip.loop,
		"onion_skin_enabled": clip.onion_skin_enabled,
		"lod_policy": clip.lod_policy.duplicate(true),
		"diagnostics": diagnostics,
		"baker_version": BAKER_VERSION,
	}
