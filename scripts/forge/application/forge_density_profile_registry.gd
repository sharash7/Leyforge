class_name ForgeDensityProfileRegistry
extends RefCounted
## Narrow lookup service for versioned Entity Forge density contracts.

var _records: Dictionary = {}


func load_and_validate(paths: PackedStringArray) -> Dictionary:
	_records.clear()
	var diagnostics: Array[Dictionary] = []
	for path in paths:
		var resource := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if not resource is ForgeDensityProfile:
			diagnostics.append(_diagnostic(
				"EFB-SCHEMA-001", path, "Density profile did not load."))
			continue
		var profile: ForgeDensityProfile = resource
		if _records.has(profile.density_profile_id):
			diagnostics.append(_diagnostic(
				"EFB-ID-001", profile.density_profile_id,
				"Density profile ID is duplicated."))
			continue
		if not ForgeId.is_valid(
				profile.density_profile_id, "density.profile."):
			diagnostics.append(_diagnostic(
				"EFB-ID-001", profile.density_profile_id,
				"Density profile ID is invalid."))
			continue
		if profile.voxels_per_meter <= 0 or profile.voxel_size_meters <= 0.0 \
				or not is_equal_approx(
					profile.voxel_size_meters,
					1.0 / float(profile.voxels_per_meter)):
			diagnostics.append(_diagnostic(
				"EFB-DENSITY-001", profile.density_profile_id,
				"Density scale is internally inconsistent."))
			continue
		_records[profile.density_profile_id] = profile
	return {
		"ok": diagnostics.is_empty(),
		"diagnostics": diagnostics,
		"record_count": _records.size(),
	}


func resolve(profile_id: String) -> ForgeDensityProfile:
	return _records.get(profile_id) as ForgeDensityProfile


func has(profile_id: String) -> bool:
	return _records.has(profile_id)


func filtered_list(body_family := "") -> Array[ForgeDensityProfile]:
	var result: Array[ForgeDensityProfile] = []
	for resource in _records.values():
		var profile: ForgeDensityProfile = resource
		if body_family.is_empty() \
				or profile.intended_body_families.is_empty() \
				or body_family in profile.intended_body_families:
			result.append(profile)
	result.sort_custom(func(a: ForgeDensityProfile, b: ForgeDensityProfile) -> bool:
		return a.density_profile_id < b.density_profile_id)
	return result


func _diagnostic(code: String, target_id: String, message: String) -> Dictionary:
	return {
		"code": code,
		"severity": "error",
		"target_id": target_id,
		"message": message,
	}
