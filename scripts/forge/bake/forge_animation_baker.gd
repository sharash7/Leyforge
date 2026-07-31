class_name ForgeAnimationBaker
extends RefCounted
## Converts source clip dictionaries into cached Animation resources.

const BAKER_VERSION := "forge-animation-v1"


static func bake(source: ForgeAnimationSet) -> Dictionary:
	var library := AnimationLibrary.new()
	var diagnostics: Array[Dictionary] = []
	if source == null:
		return {
			"ok": true,
			"library": library,
			"clip_count": 0,
			"diagnostics": diagnostics,
		}
	for clip in source.clips:
		var clip_id := str(clip.get("clip_id", ""))
		if clip_id.is_empty():
			diagnostics.append({
				"code": "FORGE-ANIM-001",
				"severity": "error",
				"message": "Animation clip has no stable clip_id.",
			})
			continue
		var animation := Animation.new()
		animation.length = maxf(0.001, float(clip.get("length", 1.0)))
		animation.loop_mode = (
			Animation.LOOP_LINEAR
			if bool(clip.get("loop", false))
			else Animation.LOOP_NONE)
		for track in clip.get("tracks", []):
			if not track is Dictionary:
				continue
			_add_track(animation, track)
		library.add_animation(clip_id, animation)
	return {
		"ok": diagnostics.filter(func(value: Dictionary) -> bool:
			return str(value.get("severity", "")) == "error").is_empty(),
		"library": library,
		"clip_count": library.get_animation_list().size(),
		"diagnostics": diagnostics,
		"baker_version": BAKER_VERSION,
	}


static func _add_track(animation: Animation, track: Dictionary) -> void:
	var track_type := str(track.get("type", "position"))
	var target := str(track.get("target", ""))
	var path := NodePath(target)
	var index := -1
	match track_type:
		"position":
			index = animation.add_track(Animation.TYPE_POSITION_3D)
		"rotation":
			index = animation.add_track(Animation.TYPE_ROTATION_3D)
		"scale":
			index = animation.add_track(Animation.TYPE_SCALE_3D)
		"value", "material_parameter", "visibility":
			index = animation.add_track(Animation.TYPE_VALUE)
		"call":
			index = animation.add_track(Animation.TYPE_METHOD)
		_:
			return
	animation.track_set_path(index, path)
	animation.track_set_interpolation_type(
		index, Animation.INTERPOLATION_NEAREST
		if str(track.get("interpolation", "linear")) == "nearest"
		else Animation.INTERPOLATION_LINEAR)
	for key in track.get("keys", []):
		if not key is Dictionary:
			continue
		var value: Variant = _coerce_value(track_type, key.get("value"))
		animation.track_insert_key(index, float(key.get("time", 0.0)), value)


static func _coerce_value(track_type: String, value: Variant) -> Variant:
	if not value is Array:
		return value
	var array: Array = value
	match track_type:
		"position", "scale":
			if array.size() >= 3:
				return Vector3(float(array[0]), float(array[1]), float(array[2]))
		"rotation":
			if array.size() >= 4:
				return Quaternion(
					float(array[0]), float(array[1]),
					float(array[2]), float(array[3]))
	return value
