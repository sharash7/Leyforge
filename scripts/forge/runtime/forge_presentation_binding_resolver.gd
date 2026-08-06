class_name ForgePresentationBindingResolver
extends RefCounted
## Deterministic binding/profile selection and parameter mapping.

var _bindings: Dictionary = {}
var _profiles: Dictionary = {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(
		p_bindings: Array[ForgePresentationBinding],
		p_profiles: Array[ForgePresentationProfile]) -> Dictionary:
	_bindings.clear()
	_profiles.clear()
	diagnostics.clear()
	for profile_index in p_profiles.size():
		var profile: ForgePresentationProfile = p_profiles[profile_index]
		if profile == null or _profiles.has(profile.stable_id):
			diagnostics.append(_diagnostic(
				"REG-001", "error", "", "Profile is empty or duplicated."))
			continue
		_profiles[profile.stable_id] = profile
	for binding_index in p_bindings.size():
		var binding: ForgePresentationBinding = p_bindings[binding_index]
		if binding == null or _bindings.has(binding.stable_id):
			diagnostics.append(_diagnostic(
				"REG-001", "error", "", "Binding is empty or duplicated."))
			continue
		if not _profiles.has(binding.profile_id):
			diagnostics.append(_diagnostic(
				"EVT-003", "error", binding.stable_id,
				"Binding profile dependency is missing."))
		_bindings[binding.stable_id] = binding
	return {
		"ok": diagnostics.is_empty(),
		"binding_count": _bindings.size(),
		"profile_count": _profiles.size(),
		"diagnostics": diagnostics.duplicate(true),
	}


func has(stable_id: String) -> bool:
	return _bindings.has(stable_id) or _profiles.has(stable_id)


func resolve_source(stable_id: String) -> Dictionary:
	if _bindings.has(stable_id):
		return (_bindings[stable_id] as ForgePresentationBinding).to_record()
	if _profiles.has(stable_id):
		return (_profiles[stable_id] as ForgePresentationProfile).to_record()
	return {}


func filtered_list(kind := "") -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	if kind.is_empty() or kind == "binding":
		for binding in _bindings.values():
			result.append((binding as ForgePresentationBinding).to_record())
	if kind.is_empty() or kind == "profile":
		for profile in _profiles.values():
			result.append((profile as ForgePresentationProfile).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("stable_id", "")) < str(b.get("stable_id", "")))
	return result


func resolve(
		contract_id: String, owner_id: String, context_packet: Dictionary,
		owner_instance_id: String, spatial_resolver: ForgeSpatialResolver,
		runtime_contact: ForgeRuntimeContactRecord = null,
		command_verb := "play") -> Dictionary:
	var fields: Dictionary = context_packet.get("fields", {})
	var candidates: Array[Dictionary] = []
	for binding in _bindings.values():
		var typed := binding as ForgePresentationBinding
		var contract_matches := typed.event_contract_id == contract_id \
				or typed.state_contract_id == contract_id
		if not contract_matches:
			continue
		var context_owner := str(fields.get("owner_id", ""))
		var owner_matches := typed.owner_id.is_empty() \
				or typed.owner_id == "*" or typed.owner_id == "global" \
				or typed.owner_id == owner_id or typed.owner_id == context_owner
		if not owner_matches:
			continue
		if not _conditions_match(typed.conditions, fields):
			continue
		var score := typed.priority * 10 + typed.conditions.size() * 100
		if typed.owner_id == owner_id:
			score += 1000
		candidates.append({"binding": typed, "score": score})
	candidates.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a["score"]) != int(b["score"]):
			return int(a["score"]) > int(b["score"])
		return (a["binding"] as ForgePresentationBinding).stable_id < \
			(b["binding"] as ForgePresentationBinding).stable_id)
	if candidates.is_empty():
		return {
			"ok": false,
			"diagnostics": [_diagnostic(
				"EVT-003", "error", contract_id,
				"No presentation binding matched the contract context.")],
			"candidate_binding_ids": [],
		}
	var binding := candidates[0]["binding"] as ForgePresentationBinding
	var profile := _profiles.get(binding.profile_id) as ForgePresentationProfile
	if profile == null:
		return {"ok": false, "diagnostics": [_diagnostic(
			"EVT-003", "error", binding.stable_id,
			"Selected binding profile is unavailable.")]}
	var spatial := spatial_resolver.resolve(
		owner_instance_id, binding.spatial_role_id, runtime_contact)
	if not bool(spatial.get("ok", false)):
		return {
			"ok": false,
			"diagnostics": [_diagnostic(
				"SPT-003", "error", binding.stable_id,
				"Selected binding spatial role did not resolve.")],
			"selected_binding_id": binding.stable_id,
		}
	var parameters := _mapped_parameters(binding.parameter_mappings, fields)
	var ownership_key := "%s|%s|%s" % [
		owner_instance_id, profile.stable_id, binding.channel]
	var commands: Array[Dictionary] = []
	var component_types: Array = profile.component_ids.keys()
	component_types.sort()
	for component_type in component_types:
		commands.append({
			"command": command_verb,
			"ownership_key": "%s|%s" % [ownership_key, component_type],
			"component_type": str(component_type),
			"component_id": str(profile.component_ids[component_type]),
			"profile_id": profile.stable_id,
			"spatial_role_id": binding.spatial_role_id,
			"resolved_reference_id": str(spatial.get(
				"resolved_reference_id", "")),
			"spatial_quality": str(spatial.get("quality", "")),
			"parameters": parameters.duplicate(true),
			"deterministic_seed": int(context_packet.get(
				"deterministic_seed", 0)),
		})
	var candidate_ids: Array[String] = []
	for candidate in candidates:
		candidate_ids.append(
			(candidate["binding"] as ForgePresentationBinding).stable_id)
	var result := {
		"ok": true,
		"contract_id": contract_id,
		"context_hash": str(context_packet.get("context_hash", "")),
		"candidate_binding_ids": candidate_ids,
		"selected_binding_id": binding.stable_id,
		"selected_profile_id": profile.stable_id,
		"specificity_score": int(candidates[0]["score"]),
		"ownership_key": ownership_key,
		"parameters": parameters,
		"spatial": _stable_spatial_record(spatial),
		"commands": commands,
	}
	result["resolution_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _conditions_match(conditions: Dictionary, fields: Dictionary) -> bool:
	for field_id in conditions:
		if not fields.has(field_id):
			return false
		var expected: Variant = conditions[field_id]
		var actual: Variant = fields[field_id]
		if expected is Dictionary:
			if expected.has("min") and float(actual) < float(expected["min"]):
				return false
			if expected.has("max") and float(actual) > float(expected["max"]):
				return false
			if expected.has("equals") and actual != expected["equals"]:
				return false
		elif actual != expected:
			return false
	return true


func _mapped_parameters(
		mappings: Array[Dictionary], fields: Dictionary) -> Dictionary:
	var result := {}
	for mapping in mappings:
		var source := str(mapping.get("source", ""))
		var target := str(mapping.get("target", source))
		var value := float(fields.get(source, mapping.get("fallback_value", 0.0)))
		var input_min := float(mapping.get("input_min", 0.0))
		var input_max := float(mapping.get("input_max", 1.0))
		var output_min := float(mapping.get("output_min", input_min))
		var output_max := float(mapping.get("output_max", input_max))
		var ratio := inverse_lerp(input_min, input_max, value) \
			if not is_equal_approx(input_min, input_max) else 0.0
		if str(mapping.get("policy", "clamp")) == "clamp":
			ratio = clampf(ratio, 0.0, 1.0)
		var mapped := lerpf(output_min, output_max, ratio)
		var steps := int(mapping.get("quantisation_steps", 0))
		if steps > 1:
			mapped = snappedf(mapped, (output_max - output_min) / float(steps - 1))
		result[target] = mapped
	return result


func _stable_spatial_record(spatial: Dictionary) -> Dictionary:
	var result := spatial.duplicate(true)
	var transform: Variant = result.get("transform")
	if transform is Transform3D:
		result["transform"] = {
			"basis_x": transform.basis.x,
			"basis_y": transform.basis.y,
			"basis_z": transform.basis.z,
			"origin": transform.origin,
		}
	return result


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {
		"code": code, "severity": severity,
		"target_id": target_id, "message": message,
	}
