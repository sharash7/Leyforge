class_name ForgeEntityAnimationRuntime
extends RefCounted
## Deterministic semantic-clip playback with named marker emission.

var _libraries: Dictionary = {}
var _aliases: Dictionary = {}
var _bindings: Dictionary = {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(
		libraries: Array[ForgeEntityAnimationLibrary],
		semantic_registry: ForgeSemanticRegistry = null) -> Dictionary:
	_libraries.clear()
	_aliases.clear()
	_bindings.clear()
	diagnostics.clear()
	var validator := ForgeEntityAnimationValidationService.new()
	for library in libraries:
		if library == null or _libraries.has(library.animation_library_id):
			diagnostics.append(_diagnostic(
				"EFB-ANIM-001", "critical", "",
				"Animation library is empty or duplicated."))
			continue
		_libraries[library.animation_library_id] = library
		for alias_id in library.aliases:
			if _aliases.has(alias_id):
				diagnostics.append(_diagnostic(
					"EFB-ID-001", "critical", alias_id,
					"Animation library alias is duplicated."))
			else:
				_aliases[alias_id] = library.animation_library_id
		for diagnostic in validator.validate_animation_library(
				library, semantic_registry):
			diagnostics.append(diagnostic.to_record())
	return {
		"ok": diagnostics.is_empty(),
		"library_count": _libraries.size(),
		"alias_count": _aliases.size(),
		"diagnostics": diagnostics.duplicate(true),
	}


func has(library_id: String) -> bool:
	return _libraries.has(ForgeId.canonical_id(library_id, _aliases))


func resolve(library_id: String) -> Dictionary:
	var canonical := ForgeId.canonical_id(library_id, _aliases)
	var library := _libraries.get(canonical) as ForgeEntityAnimationLibrary
	return library.to_record() if library != null else {}


func filtered_list() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for library in _libraries.values():
		result.append((library as ForgeEntityAnimationLibrary).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("animation_library_id", "")) < str(
			b.get("animation_library_id", "")))
	return result


func bind_actor(
		actor: ForgeRuntimeActor, library_id: String) -> bool:
	if actor == null:
		return false
	var canonical := ForgeId.canonical_id(library_id, _aliases)
	var library := _libraries.get(canonical) as ForgeEntityAnimationLibrary
	if library == null or actor.rig_profile == null \
			or library.rig_profile_id != actor.rig_profile.rig_profile_id:
		return false
	_bindings[actor.instance_id] = {
		"actor": actor,
		"library_id": canonical,
		"action": "idle",
		"time": 0.0,
		"cycle": 0,
	}
	return play(actor.instance_id, "idle", true)


func unbind_actor(instance_id: String) -> void:
	_bindings.erase(instance_id)


func play(instance_id: String, semantic_action: String, restart := false) -> bool:
	if not _bindings.has(instance_id):
		return false
	var binding: Dictionary = _bindings[instance_id]
	var library := _libraries.get(binding["library_id"]) \
		as ForgeEntityAnimationLibrary
	var actor := binding.get("actor") as ForgeRuntimeActor
	var clip := library.clip_for_action(
		semantic_action, actor.lod_level) if library != null and actor != null else null
	if clip == null:
		return false
	if str(binding.get("action", "")) != semantic_action or restart:
		binding["time"] = 0.0
		binding["cycle"] = 0
	binding["action"] = semantic_action
	_bindings[instance_id] = binding
	actor.play_semantic_action(semantic_action, restart)
	_apply_clip_pose(actor, clip, 0.0)
	return true


func advance(instance_id: String, delta_seconds: float) -> Dictionary:
	if not _bindings.has(instance_id) or delta_seconds < 0.0:
		return {"ok": false, "markers": []}
	var binding: Dictionary = _bindings[instance_id]
	var actor := binding.get("actor") as ForgeRuntimeActor
	var library := _libraries.get(binding["library_id"]) \
		as ForgeEntityAnimationLibrary
	var clip := library.clip_for_action(
		str(binding.get("action", "idle")), actor.lod_level) \
		if library != null and actor != null else null
	if clip == null:
		return {"ok": false, "markers": []}
	var previous := float(binding.get("time", 0.0))
	var next := previous + delta_seconds
	var markers: Array[Dictionary] = []
	_collect_markers(clip, previous, next, markers)
	if clip.looping:
		binding["cycle"] = int(floor(next / clip.duration_seconds))
		binding["time"] = fposmod(next, clip.duration_seconds)
	else:
		binding["time"] = minf(next, clip.duration_seconds)
	_bindings[instance_id] = binding
	actor.advance_motion(delta_seconds)
	_apply_clip_pose(
		actor, clip, float(binding["time"]) / clip.duration_seconds)
	return {
		"ok": true,
		"instance_id": instance_id,
		"semantic_action": clip.semantic_action,
		"clip_id": clip.clip_id,
		"time_seconds": binding["time"],
		"cycle": binding["cycle"],
		"markers": markers,
		"pose_hash": actor.pose_hash(),
	}


func snapshot(instance_id: String) -> Dictionary:
	if not _bindings.has(instance_id):
		return {}
	var binding: Dictionary = _bindings[instance_id]
	return {
		"instance_id": instance_id,
		"library_id": binding.get("library_id", ""),
		"action": binding.get("action", ""),
		"time": binding.get("time", 0.0),
		"cycle": binding.get("cycle", 0),
	}


func _collect_markers(
		clip: ForgeEntityAnimationClip, previous: float, next: float,
		result: Array[Dictionary]) -> void:
	var duration := clip.duration_seconds
	var first_cycle := int(floor(previous / duration))
	var last_cycle := int(floor(next / duration))
	last_cycle = mini(last_cycle, first_cycle + 8)
	for cycle in range(first_cycle, last_cycle + 1):
		for marker in clip.event_markers:
			if marker == null:
				continue
			var marker_time := (cycle + marker.normalized_time) * duration
			if marker_time > previous and marker_time <= next:
				var record := marker.to_record()
				record["clip_id"] = clip.clip_id
				record["semantic_action"] = clip.semantic_action
				record["cycle"] = cycle
				record["time_seconds"] = marker_time
				result.append(record)


func _apply_clip_pose(
		actor: ForgeRuntimeActor, clip: ForgeEntityAnimationClip,
		normalized_time: float) -> void:
	for track in clip.role_tracks:
		var role_id := str(track.get("role_id", ""))
		var keys: Array = track.get("keys", [])
		if keys.is_empty():
			continue
		var sample := _sample_keys(keys, normalized_time)
		actor.apply_role_offset(
			role_id,
			_vector3(sample.get("position", Vector3.ZERO), Vector3.ZERO),
			_vector3(sample.get("rotation_degrees", Vector3.ZERO), Vector3.ZERO),
			_vector3(sample.get("scale", Vector3.ONE), Vector3.ONE))


func _sample_keys(keys: Array, normalized_time: float) -> Dictionary:
	var before: Dictionary = keys[0]
	var after: Dictionary = keys[keys.size() - 1]
	for key in keys:
		if float(key.get("time", 0.0)) <= normalized_time:
			before = key
		if float(key.get("time", 0.0)) >= normalized_time:
			after = key
			break
	var before_time := float(before.get("time", 0.0))
	var after_time := float(after.get("time", before_time))
	var weight := 0.0 if is_equal_approx(before_time, after_time) else clampf(
		inverse_lerp(before_time, after_time, normalized_time), 0.0, 1.0)
	return {
		"position": _vector3(before.get("position", Vector3.ZERO), Vector3.ZERO).lerp(
			_vector3(after.get("position", Vector3.ZERO), Vector3.ZERO), weight),
		"rotation_degrees": _vector3(
			before.get("rotation_degrees", Vector3.ZERO), Vector3.ZERO).lerp(
			_vector3(after.get("rotation_degrees", Vector3.ZERO), Vector3.ZERO), weight),
		"scale": _vector3(before.get("scale", Vector3.ONE), Vector3.ONE).lerp(
			_vector3(after.get("scale", Vector3.ONE), Vector3.ONE), weight),
	}


func _vector3(value: Variant, fallback: Vector3) -> Vector3:
	if value is Vector3:
		return value
	if value is Array and value.size() == 3:
		return Vector3(float(value[0]), float(value[1]), float(value[2]))
	return fallback


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
