class_name ForgeEntityAppearanceResolver
extends RefCounted
## Seeded profile selection for deterministic entity reconstruction.

var _profiles: Dictionary = {}
var _aliases: Dictionary = {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(profiles: Array[ForgeEntityVariantProfile]) -> Dictionary:
	_profiles.clear()
	_aliases.clear()
	diagnostics.clear()
	var validator := ForgeEntityAnimationValidationService.new()
	for profile in profiles:
		if profile == null or _profiles.has(profile.variant_profile_id):
			diagnostics.append({"code": "EFB-VARIANT-001", "severity": "critical",
				"target_id": "", "message": "Variant profile is empty or duplicated."})
			continue
		_profiles[profile.variant_profile_id] = profile
		for alias_id in profile.aliases:
			if _aliases.has(alias_id):
				diagnostics.append({"code": "EFB-ID-001", "severity": "critical",
					"target_id": alias_id, "message": "Variant alias is duplicated."})
			else:
				_aliases[alias_id] = profile.variant_profile_id
		for diagnostic in validator.validate_variant(profile):
			diagnostics.append(diagnostic.to_record())
	return {"ok": diagnostics.is_empty(), "profile_count": _profiles.size(),
		"alias_count": _aliases.size(), "diagnostics": diagnostics.duplicate(true)}


func has(profile_id: String) -> bool:
	return _profiles.has(ForgeId.canonical_id(profile_id, _aliases))


func resolve(profile_id: String) -> Dictionary:
	var canonical := ForgeId.canonical_id(profile_id, _aliases)
	var profile := _profiles.get(canonical) as ForgeEntityVariantProfile
	return profile.to_record() if profile != null else {}


func filtered_list(entity_definition_id := "") -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for profile in _profiles.values():
		if entity_definition_id.is_empty() \
				or profile.entity_definition_id == entity_definition_id:
			result.append(profile.to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("variant_profile_id", "")) < str(
			b.get("variant_profile_id", "")))
	return result


func reconstruct(profile_id: String, seed: int) -> Dictionary:
	var canonical := ForgeId.canonical_id(profile_id, _aliases)
	var profile := _profiles.get(canonical) as ForgeEntityVariantProfile
	if profile == null:
		return {"ok": false}
	var result := {
		"ok": true,
		"variant_profile_id": profile.variant_profile_id,
		"entity_definition_id": profile.entity_definition_id,
		"seed": seed,
		"proportion_scale": profile.proportion_scale,
		"material_variant_id": _select(
			profile.material_variant_ids, seed, "materials"),
		"equipment_profile_id": _select(
			profile.equipment_profile_ids, seed, "equipment"),
		"entity_role_ids": Array(profile.entity_role_ids),
	}
	result["appearance_hash"] = ForgeStableRecord.hash_record(result)
	return result


func apply(actor: ForgeRuntimeActor, appearance: Dictionary) -> bool:
	if actor == null or not bool(appearance.get("ok", false)) \
			or actor.entity_definition == null \
			or str(appearance.get("entity_definition_id", "")) != \
			actor.entity_definition.entity_definition_id:
		return false
	actor.variant_id = str(appearance.get("variant_profile_id", "base"))
	actor.scale = appearance.get("proportion_scale", Vector3.ONE)
	actor.set_meta("forge_appearance_hash", appearance.get("appearance_hash", ""))
	return true


func _select(values: PackedStringArray, seed: int, channel: String) -> String:
	if values.is_empty():
		return ""
	var digest := ("%d|%s" % [seed, channel]).sha256_text()
	var value := digest.substr(0, 8).hex_to_int()
	return values[posmod(value, values.size())]
