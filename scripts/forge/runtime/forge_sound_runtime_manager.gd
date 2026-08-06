class_name ForgeSoundRuntimeManager
extends Node3D
## Seeded, bounded Sound Event lifecycle with legacy-source wrapping.

var budget_manager: ForgePresentationBudgetManager
var _plans: Dictionary = {}
var _sources: Dictionary = {}
var _spatial_profiles: Dictionary = {}
var _accessibility_profiles: Dictionary = {}
var _active: Dictionary = {}
var _group_counts: Dictionary = {}
var _captions: Array[Dictionary] = []
var diagnostics: Array[Dictionary] = []


func load_and_validate(
		plans: Array[ForgeCompiledSoundPlan], sources: Array[ForgeSoundSource],
		spatial_profiles: Array[ForgeSpatialAudioProfile],
		accessibility_profiles: Array[ForgeAccessibilityProfile],
		p_budget_manager: ForgePresentationBudgetManager) -> Dictionary:
	_clear_active()
	_plans.clear()
	_sources.clear()
	_spatial_profiles.clear()
	_accessibility_profiles.clear()
	_captions.clear()
	diagnostics.clear()
	budget_manager = p_budget_manager
	for source in sources:
		if source != null:
			_sources[source.stable_id] = source
	for profile in spatial_profiles:
		if profile != null:
			_spatial_profiles[profile.stable_id] = profile
	for profile in accessibility_profiles:
		if profile != null:
			_accessibility_profiles[profile.stable_id] = profile
	for plan in plans:
		if plan == null or _plans.has(plan.source_event_id) \
				or plan.product_hash != ForgeStableRecord.hash_record(plan.to_record(false)):
			diagnostics.append(_diagnostic(
				"SND-001", "error", "", "Sound runtime plan is invalid or duplicated."))
			continue
		for source_id in plan.source_ids:
			if not _sources.has(source_id):
				diagnostics.append(_diagnostic(
					"SND-001", "error", plan.source_event_id,
					"Sound runtime source is missing."))
		if not _spatial_profiles.has(plan.spatial_audio_profile_id):
			diagnostics.append(_diagnostic(
				"SND-001", "error", plan.source_event_id,
				"Sound runtime spatial profile is missing."))
		if plan.critical_cue and plan.caption_key.is_empty():
			diagnostics.append(_diagnostic(
				"ACC-001", "critical", plan.source_event_id,
				"Critical Sound Event has no caption equivalent."))
		_plans[plan.source_event_id] = plan
	if budget_manager == null:
		diagnostics.append(_diagnostic(
			"BUD-001", "critical", "", "Sound budget manager is missing."))
	return {"ok": diagnostics.is_empty(), "plan_count": _plans.size(),
		"source_count": _sources.size(), "diagnostics": diagnostics.duplicate(true)}


func has(event_id: String) -> bool:
	return _plans.has(event_id)


func resolve(event_id: String) -> Dictionary:
	var plan := _plans.get(event_id) as ForgeCompiledSoundPlan
	return plan.to_record() if plan != null else {}


func filtered_list() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for plan in _plans.values():
		result.append((plan as ForgeCompiledSoundPlan).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("source_event_id", "")) < str(b.get("source_event_id", "")))
	return result


func play(
		ownership_key: String, event_id: String, world_transform: Transform3D,
		parameters: Dictionary = {}, deterministic_seed := 0,
		options: Dictionary = {}) -> Dictionary:
	if _active.has(ownership_key):
		return update(ownership_key, parameters, world_transform)
	var plan := _plans.get(event_id) as ForgeCompiledSoundPlan
	if plan == null or ownership_key.is_empty():
		return {"ok": false, "diagnostics": [_diagnostic(
			"SND-001", "error", event_id, "Compiled Sound Event is unavailable.")]}
	var group_count := int(_group_counts.get(plan.concurrency_group, 0))
	if group_count >= plan.maximum_voices:
		return {"ok": true, "virtualised": true, "quality": "concurrency_limited",
			"ownership_key": ownership_key, "event_id": event_id,
			"commands": []}
	var spatial := _spatial_profiles.get(
		plan.spatial_audio_profile_id) as ForgeSpatialAudioProfile
	var distance := float(options.get("distance_meters", 0.0))
	var beyond_range := spatial != null and distance > spatial.maximum_distance_meters
	var voice_budget := budget_manager.request(
		"%s|voices" % ownership_key, "voices", 1, plan.critical_cue)
	var virtualised := beyond_range or int(voice_budget.get("granted", 0)) == 0
	var source_id := _select_source(plan, deterministic_seed)
	var source := _sources.get(source_id) as ForgeSoundSource
	var legacy_fallback := source != null and source.source_path.begins_with("legacy://")
	var player: AudioStreamPlayer3D
	if not virtualised:
		player = AudioStreamPlayer3D.new()
		player.name = "ForgeSound_%s" % ForgeId.safe_filename(ownership_key)
		player.max_distance = spatial.maximum_distance_meters if spatial != null else 24.0
		player.attenuation_model = AudioStreamPlayer3D.ATTENUATION_INVERSE_DISTANCE
		player.bus = _safe_bus(plan.bus_id)
		player.transform = world_transform
		player.set_meta("forge_sound_event_id", event_id)
		player.set_meta("forge_legacy_fallback", legacy_fallback)
		if source != null and source.source_path.begins_with("res://"):
			player.stream = ResourceLoader.load(source.source_path) as AudioStream
		add_child(player)
		if player.stream != null:
			player.play()
	var duration := source.duration_seconds if source != null else 0.0
	if duration <= 0.0:
		duration = 0.35
	var record := {"ownership_key": ownership_key, "event_id": event_id,
		"plan": plan, "player": player, "source_id": source_id,
		"legacy_fallback": legacy_fallback, "parameters": parameters.duplicate(true),
		"seed": deterministic_seed, "age": 0.0, "phase": 0.0,
		"duration": duration, "virtualised": virtualised,
		"quality": voice_budget.get("quality", "full"),
		"world_transform": world_transform}
	_active[ownership_key] = record
	_group_counts[plan.concurrency_group] = group_count + 1
	if not plan.caption_key.is_empty():
		_captions.append({"ownership_key": ownership_key,
			"caption_key": plan.caption_key, "critical": plan.critical_cue,
			"position": world_transform.origin})
	return _public_record(record)


func update(ownership_key: String, parameters: Dictionary,
		world_transform: Transform3D = Transform3D.IDENTITY) -> Dictionary:
	if not _active.has(ownership_key):
		return {"ok": false, "reason": "ownership_key_not_active"}
	var record: Dictionary = _active[ownership_key]
	record.parameters.merge(parameters, true)
	if world_transform != Transform3D.IDENTITY:
		record.world_transform = world_transform
		var player := record.get("player") as AudioStreamPlayer3D
		if player != null:
			player.transform = world_transform
	var player := record.get("player") as AudioStreamPlayer3D
	if player != null:
		player.volume_db = linear_to_db(clampf(
			float(record.parameters.get("intensity", 1.0)), 0.001, 1.0))
	_active[ownership_key] = record
	return _public_record(record)


func stop(ownership_key: String) -> Dictionary:
	if not _active.has(ownership_key):
		return {"ok": true, "stopped": false}
	var record: Dictionary = _active[ownership_key]
	var plan := record.plan as ForgeCompiledSoundPlan
	var player := record.get("player") as AudioStreamPlayer3D
	if player != null:
		player.stop()
		player.free()
	budget_manager.release("%s|voices" % ownership_key)
	_group_counts[plan.concurrency_group] = maxi(
		0, int(_group_counts.get(plan.concurrency_group, 1)) - 1)
	_active.erase(ownership_key)
	return {"ok": true, "stopped": true, "ownership_key": ownership_key}


func advance(delta_seconds: float) -> Dictionary:
	var stopped: Array[String] = []
	if delta_seconds < 0.0:
		return {"ok": false, "stopped": stopped}
	var keys: Array = _active.keys()
	keys.sort()
	for ownership_key in keys:
		var record: Dictionary = _active[ownership_key]
		var plan := record.plan as ForgeCompiledSoundPlan
		record.age = float(record.age) + delta_seconds
		record.phase = fposmod(float(record.phase) + delta_seconds,
			maxf(float(record.duration), 0.001))
		if plan.loop_policy == "one_shot" and float(record.age) >= float(record.duration):
			stop(str(ownership_key))
			stopped.append(str(ownership_key))
			continue
		_active[ownership_key] = record
	return {"ok": true, "active_count": _active.size(), "stopped": stopped,
		"snapshot_hash": snapshot().runtime_hash}


func captions() -> Array[Dictionary]:
	return _captions.duplicate(true)


func snapshot() -> Dictionary:
	var records: Array[Dictionary] = []
	for record in _active.values():
		records.append(_public_record(record))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("ownership_key", "")) < str(b.get("ownership_key", "")))
	var result := {"active": records, "group_counts": _group_counts.duplicate(true),
		"captions": _captions.duplicate(true), "budget": budget_manager.snapshot()}
	result["runtime_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _select_source(plan: ForgeCompiledSoundPlan, seed: int) -> String:
	if plan.source_ids.is_empty():
		return ""
	var digest := ("%s|%d" % [plan.source_event_id, seed]).sha256_text()
	return plan.source_ids[posmod(digest.substr(0, 8).hex_to_int(),
		plan.source_ids.size())]


func _safe_bus(bus_id: String) -> StringName:
	var candidate := bus_id.trim_prefix("audio.bus.").capitalize()
	return StringName(candidate if AudioServer.get_bus_index(candidate) >= 0 else "Master")


func _public_record(record: Dictionary) -> Dictionary:
	var plan := record.plan as ForgeCompiledSoundPlan
	var result := {"ok": true, "ownership_key": record.ownership_key,
		"event_id": record.event_id, "plan_id": plan.plan_id,
		"product_hash": plan.product_hash, "source_id": record.source_id,
		"legacy_fallback": record.legacy_fallback,
		"parameters": record.parameters.duplicate(true), "seed": record.seed,
		"age": record.age, "phase": record.phase,
		"virtualised": record.virtualised, "quality": record.quality,
		"loop_policy": plan.loop_policy,
		"position": (record.world_transform as Transform3D).origin}
	result["instance_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _clear_active() -> void:
	for ownership_key in _active.keys():
		stop(str(ownership_key))
	_active.clear()
	_group_counts.clear()


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
