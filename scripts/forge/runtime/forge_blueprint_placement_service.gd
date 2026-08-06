class_name ForgeBlueprintPlacementService
extends RefCounted
## Deterministic world-generation placement and safe fallback evaluator.


func load_and_validate(profiles: Array[ForgePlacementProfile]) -> Dictionary:
	var diagnostics: Array[Dictionary] = []
	var ids := {}
	for profile in profiles:
		if profile == null or profile.placement_profile_id.is_empty() \
				or ids.has(profile.placement_profile_id):
			diagnostics.append({"code": "EFB-BP-001", "severity": "error",
				"target_id": "", "message": "Placement profile is missing or duplicated."})
			continue
		ids[profile.placement_profile_id] = true
	return {"ok": diagnostics.is_empty(), "diagnostics": diagnostics,
		"profile_count": ids.size()}


func resolve(profile: ForgePlacementProfile, context: Dictionary) -> Dictionary:
	if profile == null:
		return {"ok": false, "diagnostics": [{"code": "EFB-BP-001",
			"severity": "error", "message": "Placement profile is missing."}]}
	var failures: Array[String] = []
	var zone_id := str(context.get("zone_role_id", "zone.role.placement"))
	if not profile.allowed_zone_role_ids.is_empty() \
			and zone_id not in profile.allowed_zone_role_ids:
		failures.append("zone")
	var slope := int(context.get("slope", 0))
	if slope > profile.max_slope:
		failures.append("slope")
	var sockets: Array = context.get("available_socket_role_ids", [])
	for role_id in profile.required_socket_role_ids:
		if role_id not in sockets:
			failures.append("socket:%s" % role_id)
	var networks: Array = context.get("available_network_role_ids", [])
	for role_id in profile.required_network_role_ids:
		if role_id not in networks:
			failures.append("network:%s" % role_id)
	var critical := bool(context.get("progression_critical", false))
	var fallback_used := not failures.is_empty() and critical
	if not failures.is_empty() and not fallback_used:
		return {"ok": false, "fallback_used": false, "failures": failures}
	var placement_seed := int(context.get("seed", 0))
	var rotation_quarters := posmod(int(ForgeStableRecord.hash_record({
		"profile": profile.placement_profile_id,
		"seed": placement_seed,
		"origin": context.get("origin", [0, 0, 0]),
	}).substr(0, 8).hex_to_int()), 4)
	return {"ok": true, "fallback_used": fallback_used,
		"fallback_policy": "level_and_retry_nearest_valid" if fallback_used else "none",
		"repaired_constraints": failures,
		"rotation_quarters": rotation_quarters,
		"terrain_mode": profile.terrain_mode,
		"origin": context.get("origin", [0, 0, 0]),
		"placement_hash": ForgeStableRecord.hash_record({
			"profile": profile.to_record(), "context": context,
			"fallback": fallback_used, "rotation": rotation_quarters})}
