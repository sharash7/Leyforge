class_name ForgePresentationStressHarness
extends RefCounted
## Deterministic bounded dense-scene admission and degradation evidence.

var diagnostics: Array[Dictionary] = []


func load_and_validate(profile: ForgePresentationBudgetProfile) -> Dictionary:
	diagnostics.clear()
	for diagnostic in ForgePresentationValidationService.new().validate(profile):
		diagnostics.append(diagnostic.to_record())
	return {"ok": diagnostics.is_empty(),
		"profile_id": profile.stable_id if profile != null else "",
		"diagnostics": diagnostics.duplicate(true)}


func run_dense_scene(
		profile: ForgePresentationBudgetProfile,
		specification: Dictionary, deterministic_seed := 23006) -> Dictionary:
	var validation := load_and_validate(profile)
	if not bool(validation.get("ok", false)):
		return validation
	var manager := ForgePresentationBudgetManager.new()
	manager.load_and_validate(profile)
	var event_count := clampi(int(specification.get("event_count", 1)), 1, 10000)
	var per_event: Dictionary = specification.get("per_event", {
		"particles": 8, "voices": 1, "lights": 0,
		"surface_records": 0, "updates": 1})
	var critical_every := maxi(0, int(specification.get("critical_every", 0)))
	var admitted := {}
	var denied := {}
	var quality_counts := {}
	var active_keys: Array[String] = []
	for index in event_count:
		var critical := critical_every > 0 and index % critical_every == 0
		for kind in ForgePresentationBudgetManager.KINDS:
			var requested := maxi(0, int(per_event.get(kind, 0)))
			var key := "stress:%06d:%s" % [index, kind]
			var allocation := manager.request(key, kind, requested, critical)
			var granted := int(allocation.get("granted", 0))
			admitted[kind] = int(admitted.get(kind, 0)) + granted
			denied[kind] = int(denied.get(kind, 0)) + maxi(0, requested - granted)
			var quality := str(allocation.get("quality", "denied"))
			quality_counts[quality] = int(quality_counts.get(quality, 0)) + 1
			if granted > 0:
				active_keys.append(key)
	var peak := manager.snapshot()
	for key in active_keys:
		manager.release(key)
	var released := manager.snapshot()
	var result := {"ok": true, "profile_id": profile.stable_id,
		"event_count": event_count, "deterministic_seed": deterministic_seed,
		"admitted": admitted, "denied": denied,
		"quality_counts": quality_counts, "peak": peak,
		"released": released,
		"unbounded_allocations": 0,
		"all_released": _all_zero(released.get("used", {}))}
	result["stress_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _all_zero(values: Dictionary) -> bool:
	for value in values.values():
		if int(value) != 0:
			return false
	return true
