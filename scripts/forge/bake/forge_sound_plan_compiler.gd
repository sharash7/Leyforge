class_name ForgeSoundPlanCompiler
extends RefCounted
## Compiles Sound Events into bounded source/layer/lifecycle plans.

var _events: Dictionary = {}
var _sources: Dictionary = {}
var _spatial_profiles: Dictionary = {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(
		events: Array[ForgeSoundEvent], sources: Array[ForgeSoundSource],
		spatial_profiles: Array[ForgeSpatialAudioProfile]) -> Dictionary:
	_events.clear()
	_sources.clear()
	_spatial_profiles.clear()
	diagnostics.clear()
	var validator := ForgePresentationValidationService.new()
	for source in sources:
		_register(source, _sources, validator)
	for profile in spatial_profiles:
		_register(profile, _spatial_profiles, validator)
	for event in events:
		_register(event, _events, validator)
		if event == null:
			continue
		for source_id in event.source_ids:
			if not _sources.has(source_id):
				diagnostics.append(_diagnostic(
					"SND-001", "error", event.stable_id,
					"Sound Event source dependency is missing."))
		if not _spatial_profiles.has(event.spatial_audio_profile_id):
			diagnostics.append(_diagnostic(
				"SND-001", "error", event.stable_id,
				"Sound Event spatial profile is missing."))
	return {"ok": diagnostics.is_empty(), "event_count": _events.size(),
		"source_count": _sources.size(),
		"spatial_profile_count": _spatial_profiles.size(),
		"diagnostics": diagnostics.duplicate(true)}


func has(event_id: String) -> bool:
	return _events.has(event_id)


func resolve(event_id: String) -> Dictionary:
	var event := _events.get(event_id) as ForgeSoundEvent
	return event.to_record() if event != null else {}


func filtered_list() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for event in _events.values():
		result.append((event as ForgeSoundEvent).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("stable_id", "")) < str(b.get("stable_id", "")))
	return result


func compile(event_id: String) -> Dictionary:
	var event := _events.get(event_id) as ForgeSoundEvent
	if event == null:
		return {"ok": false, "diagnostics": [_diagnostic(
			"SND-001", "error", event_id, "Sound Event is unavailable.")]}
	var plan := ForgeCompiledSoundPlan.new()
	plan.plan_id = "runtime.sound.%s" % event.stable_id.trim_prefix("sound.")
	plan.source_event_id = event.stable_id
	plan.source_hash = event.canonical_hash()
	plan.source_ids = event.source_ids
	plan.layer_records = event.layer_records.duplicate(true)
	plan.variation_policy = event.variation_policy
	plan.loop_policy = event.loop_policy
	plan.concurrency_group = event.concurrency_group
	plan.maximum_voices = event.maximum_voices
	plan.spatial_audio_profile_id = event.spatial_audio_profile_id
	plan.bus_id = event.bus_id
	plan.caption_key = event.caption_key
	plan.critical_cue = event.critical_cue
	plan.fallback_ids = event.fallback_ids
	plan.seal()
	return {"ok": true, "plan": plan,
		"product_hash": plan.product_hash, "diagnostics": []}


func compile_all() -> Dictionary:
	var plans: Array[ForgeCompiledSoundPlan] = []
	var failures: Array[Dictionary] = []
	var ids: Array = _events.keys()
	ids.sort()
	for event_id in ids:
		var result := compile(str(event_id))
		if bool(result.get("ok", false)):
			plans.append(result.plan)
		else:
			failures.append_array(result.get("diagnostics", []))
	return {"ok": failures.is_empty(), "plans": plans,
		"diagnostics": failures}


func source(source_id: String) -> ForgeSoundSource:
	return _sources.get(source_id) as ForgeSoundSource


func spatial_profile(profile_id: String) -> ForgeSpatialAudioProfile:
	return _spatial_profiles.get(profile_id) as ForgeSpatialAudioProfile


func _register(value: ForgePresentationDefinition, target: Dictionary,
		validator: ForgePresentationValidationService) -> void:
	if value == null or target.has(value.stable_id):
		diagnostics.append(_diagnostic(
			"REG-001", "critical", "", "Sound source is empty or duplicated."))
		return
	for diagnostic in validator.validate(value):
		diagnostics.append(diagnostic.to_record())
	target[value.stable_id] = value


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
