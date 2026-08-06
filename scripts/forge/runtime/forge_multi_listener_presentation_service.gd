class_name ForgeMultiListenerPresentationService
extends RefCounted
## Explicit split-screen listener, caption, audio and VFX arbitration contract.

const QUALITY_RANK := {"critical_only": 0, "aggregated": 1,
	"reduced": 2, "full": 3}

var diagnostics: Array[Dictionary] = []
var _accessibility: Dictionary = {}
var _budgets: Dictionary = {}
var _listeners: Dictionary = {}
var _maximum_listeners := 4


func load_and_validate(
		accessibility_profiles: Array[ForgeAccessibilityProfile],
		budget_profiles: Array[ForgePresentationBudgetProfile],
		maximum_listeners := 4) -> Dictionary:
	diagnostics.clear()
	_accessibility.clear()
	_budgets.clear()
	_listeners.clear()
	_maximum_listeners = clampi(maximum_listeners, 1, 8)
	var validator := ForgePresentationValidationService.new()
	for profile in accessibility_profiles:
		if profile == null or _accessibility.has(profile.stable_id):
			diagnostics.append(_diagnostic(
				"ACC-002", "error", "", "Accessibility profile is empty or duplicated."))
			continue
		_accessibility[profile.stable_id] = profile
		for diagnostic in validator.validate(profile):
			diagnostics.append(diagnostic.to_record())
	for profile in budget_profiles:
		if profile == null or _budgets.has(profile.stable_id):
			diagnostics.append(_diagnostic(
				"BUD-001", "error", "", "Budget profile is empty or duplicated."))
			continue
		_budgets[profile.stable_id] = profile
		for diagnostic in validator.validate(profile):
			diagnostics.append(diagnostic.to_record())
	return {"ok": diagnostics.is_empty(),
		"accessibility_count": _accessibility.size(),
		"budget_count": _budgets.size(),
		"maximum_listeners": _maximum_listeners,
		"diagnostics": diagnostics.duplicate(true)}


func register_listener(
		listener_id: String, world_position: Vector3,
		accessibility_profile_id: String, budget_profile_id: String,
		options: Dictionary = {}) -> Dictionary:
	if listener_id.is_empty() or _listeners.size() >= _maximum_listeners \
			and not _listeners.has(listener_id) \
			or not _accessibility.has(accessibility_profile_id) \
			or not _budgets.has(budget_profile_id):
		return {"ok": false, "diagnostics": [_diagnostic(
			"ACC-002", "error", listener_id,
			"Listener capacity, accessibility or budget contract is invalid.")]}
	_listeners[listener_id] = {"listener_id": listener_id,
		"position": world_position,
		"accessibility_profile_id": accessibility_profile_id,
		"budget_profile_id": budget_profile_id,
		"caption_enabled": bool(options.get("caption_enabled", true)),
		"requested_vfx_quality": str(options.get("vfx_quality", "full")),
		"audio_weight": clampf(float(options.get("audio_weight", 1.0)), 0.0, 1.0),
		"primary": bool(options.get("primary", _listeners.is_empty()))}
	return {"ok": true, "listener": _listeners[listener_id].duplicate(true)}


func update_listener(listener_id: String, values: Dictionary) -> Dictionary:
	if not _listeners.has(listener_id):
		return {"ok": false}
	var record: Dictionary = _listeners[listener_id]
	for key in values:
		if key in ["position", "caption_enabled", "requested_vfx_quality",
				"audio_weight", "primary"]:
			record[key] = values[key]
	_listeners[listener_id] = record
	return {"ok": true, "listener": record.duplicate(true)}


func resolve_audio(
		world_position: Vector3, critical := false,
		mix_policy := "primary") -> Dictionary:
	var routes: Array[Dictionary] = []
	for listener in _sorted_listeners():
		var distance := (listener.position as Vector3).distance_to(world_position)
		var active := critical or mix_policy == "blended" or bool(listener.primary)
		if active:
			routes.append({"listener_id": listener.listener_id,
				"distance_meters": snappedf(distance, 0.01),
				"gain_weight": 1.0 if bool(listener.primary) else listener.audio_weight,
				"critical_overlay": critical,
				"caption_enabled": listener.caption_enabled,
				"accessibility_profile_id": listener.accessibility_profile_id})
	var result := {"ok": not routes.is_empty(), "routes": routes,
		"mix_policy": "critical_per_listener" if critical else mix_policy}
	result["routing_hash"] = ForgeStableRecord.hash_record(result)
	return result


func resolve_vfx(requested_quality := "full", maximum_quality := "full") -> Dictionary:
	var rank := mini(int(QUALITY_RANK.get(requested_quality, 0)),
		int(QUALITY_RANK.get(maximum_quality, 0)))
	for listener in _listeners.values():
		rank = mini(int(QUALITY_RANK.get(maximum_quality, 0)), maxi(rank,
			int(QUALITY_RANK.get(listener.requested_vfx_quality, 0))))
	var resolved := "critical_only"
	for quality in QUALITY_RANK:
		if int(QUALITY_RANK[quality]) == rank:
			resolved = quality
			break
	return {"ok": true, "quality": resolved,
		"listener_count": _listeners.size(), "budget_capped": resolved != requested_quality}


func resolve(listener_id: String) -> Dictionary:
	return _listeners.get(listener_id, {}).duplicate(true)


func has(listener_id: String) -> bool:
	return _listeners.has(listener_id)


func filtered_list() -> Array[Dictionary]:
	return _sorted_listeners()


func _sorted_listeners() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for listener in _listeners.values():
		result.append(listener.duplicate(true))
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.listener_id) < str(b.listener_id))
	return result


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
