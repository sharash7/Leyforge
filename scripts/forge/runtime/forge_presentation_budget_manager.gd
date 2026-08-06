class_name ForgePresentationBudgetManager
extends RefCounted
## Shared bounded admission, degradation, and release policy for presentation.

const KINDS := ["particles", "voices", "lights", "surface_records", "updates"]

var profile: ForgePresentationBudgetProfile
var _used := {}
var _allocations := {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(p_profile: ForgePresentationBudgetProfile) -> Dictionary:
	profile = p_profile
	_used.clear()
	_allocations.clear()
	diagnostics.clear()
	if profile == null:
		diagnostics.append(_diagnostic(
			"BUD-001", "critical", "", "Budget profile is missing."))
	else:
		for diagnostic in ForgePresentationValidationService.new().validate(profile):
			diagnostics.append(diagnostic.to_record())
	for kind in KINDS:
		_used[kind] = 0
	return {"ok": diagnostics.is_empty(),
		"diagnostics": diagnostics.duplicate(true), "limits": limits()}


func request(
		allocation_key: String, kind: String, requested: int,
		critical := false) -> Dictionary:
	if profile == null or kind not in KINDS or allocation_key.is_empty() \
			or requested < 0:
		return {"ok": false, "quality": "denied", "granted": 0}
	if _allocations.has(allocation_key):
		return _allocations[allocation_key].duplicate(true)
	var limit := _limit(kind)
	var reserve := int(profile.critical_reserve.get(kind, 0))
	var general_limit := limit if critical else maxi(0, limit - reserve)
	var available := maxi(0, general_limit - int(_used.get(kind, 0)))
	var granted := mini(requested, available)
	var quality := "full"
	if granted < requested:
		quality = "reduced" if granted > 0 else "virtualised"
	if critical and granted == 0 and int(_used.get(kind, 0)) < limit:
		granted = mini(requested, limit - int(_used.get(kind, 0)))
		quality = "critical_only"
	var record := {"ok": granted > 0 or requested == 0,
		"allocation_key": allocation_key, "kind": kind,
		"requested": requested, "granted": granted,
		"quality": quality, "critical": critical}
	_allocations[allocation_key] = record
	_used[kind] = int(_used.get(kind, 0)) + granted
	return record.duplicate(true)


func release(allocation_key: String) -> void:
	if not _allocations.has(allocation_key):
		return
	var record: Dictionary = _allocations[allocation_key]
	var kind := str(record.get("kind", ""))
	_used[kind] = maxi(0, int(_used.get(kind, 0)) - int(record.get("granted", 0)))
	_allocations.erase(allocation_key)


func limits() -> Dictionary:
	if profile == null:
		return {}
	return {"particles": profile.maximum_particles,
		"voices": profile.maximum_voices, "lights": profile.maximum_lights,
		"surface_records": profile.maximum_surface_records,
		"updates": profile.maximum_updates_per_second}


func snapshot() -> Dictionary:
	var records: Array[Dictionary] = []
	for record in _allocations.values():
		records.append(record.duplicate(true))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("allocation_key", "")) < str(b.get("allocation_key", "")))
	var result := {"profile_id": profile.stable_id if profile != null else "",
		"limits": limits(), "used": _used.duplicate(true), "allocations": records}
	result["budget_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _limit(kind: String) -> int:
	return int(limits().get(kind, 0))


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
