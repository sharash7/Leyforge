class_name ForgeEntityAnimationValidationService
extends RefCounted
## Validation for Stage 3 semantic animation and entity presentation sources.


func validate_animation_library(
		library: ForgeEntityAnimationLibrary,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if library == null:
		diagnostics.append(_diagnostic(
			"EFB-ANIM-001", ForgeDiagnostic.CRITICAL, "",
			"Entity animation library is missing."))
		return diagnostics
	_validate_id(library.animation_library_id, "entity.animation_set.", diagnostics)
	_validate_id(library.rig_profile_id, "entity.rig.", diagnostics)
	if library.schema_version != 1 \
			or library.contract_version != ForgeEntityAnimationLibrary.CONTRACT_VERSION:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			library.animation_library_id,
			"Animation library schema or contract version is unsupported."))
	if library.clips.is_empty():
		diagnostics.append(_diagnostic(
			"EFB-ANIM-001", ForgeDiagnostic.ERROR,
			library.animation_library_id,
			"Animation library contains no semantic clips."))
	var clip_ids := {}
	var actions := {}
	for clip in library.clips:
		if clip == null or clip.clip_id.is_empty() or clip_ids.has(clip.clip_id):
			diagnostics.append(_diagnostic(
				"EFB-ANIM-001", ForgeDiagnostic.ERROR,
				library.animation_library_id,
				"Animation clip identity is empty or duplicated."))
			continue
		clip_ids[clip.clip_id] = true
		if actions.has(clip.semantic_action):
			diagnostics.append(_diagnostic(
				"EFB-ANIM-001", ForgeDiagnostic.ERROR, clip.clip_id,
				"Animation semantic action is duplicated within a library."))
		actions[clip.semantic_action] = true
		_validate_clip(clip, semantic_registry, diagnostics)
	for required_action in ["idle", "walk"]:
		if not actions.has(required_action):
			diagnostics.append(_diagnostic(
				"EFB-ANIM-001", ForgeDiagnostic.ERROR,
				library.animation_library_id,
				"Golden animation library is missing %s." % required_action))
	return diagnostics


func validate_retarget_map(record: ForgeRetargetMap) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if record == null:
		diagnostics.append(_diagnostic(
			"EFB-ANIM-002", ForgeDiagnostic.CRITICAL, "",
			"Retarget map is missing."))
		return diagnostics
	_validate_id(record.retarget_map_id, "entity.retarget_map.", diagnostics)
	_validate_id(record.source_rig_profile_id, "entity.rig.", diagnostics)
	_validate_id(record.target_rig_profile_id, "entity.rig.", diagnostics)
	if record.schema_version != 1 \
			or record.contract_version != ForgeRetargetMap.CONTRACT_VERSION \
			or record.compatibility_level not in ["exact", "compatible", "partial"]:
		diagnostics.append(_diagnostic(
			"EFB-ANIM-002", ForgeDiagnostic.ERROR, record.retarget_map_id,
			"Retarget contract, schema, or compatibility level is invalid."))
	return diagnostics


func validate_foot_placement(
		profile: ForgeFootPlacementProfile,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if profile == null:
		return [_diagnostic("EFB-ANIM-003", ForgeDiagnostic.CRITICAL, "",
			"Foot-placement profile is missing.")]
	_validate_id(profile.foot_placement_profile_id,
		"entity.foot_placement.", diagnostics)
	_validate_id(profile.rig_profile_id, "entity.rig.", diagnostics)
	if profile.schema_version != 1 \
			or profile.contract_version != ForgeFootPlacementProfile.CONTRACT_VERSION \
			or profile.contact_role_ids.is_empty() \
			or profile.maximum_step_height_meters <= 0.0 \
			or profile.maximum_offset_meters <= 0.0:
		diagnostics.append(_diagnostic(
			"EFB-ANIM-003", ForgeDiagnostic.ERROR,
			profile.foot_placement_profile_id,
			"Foot-placement bounds or contract are invalid."))
	for role_id in profile.contact_role_ids:
		if semantic_registry != null and not semantic_registry.has(role_id):
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", ForgeDiagnostic.ERROR, role_id,
				"Foot contact role is not registered."))
	return diagnostics


func validate_equipment_fit(
		profile: ForgeEquipmentFitProfile,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if profile == null:
		return [_diagnostic("EFB-EQUIP-001", ForgeDiagnostic.CRITICAL, "",
			"Equipment-fit profile is missing.")]
	_validate_id(profile.equipment_profile_id,
		"entity.equipment_profile.", diagnostics)
	if profile.schema_version != 1 \
			or profile.contract_version != ForgeEquipmentFitProfile.CONTRACT_VERSION \
			or profile.equipment_asset_id.is_empty() \
			or profile.compatible_rig_profile_ids.is_empty():
		diagnostics.append(_diagnostic(
			"EFB-EQUIP-001", ForgeDiagnostic.ERROR,
			profile.equipment_profile_id,
			"Equipment source, compatible rigs, or contract is missing."))
	for role_id in [profile.socket_role_id, profile.release_spatial_role_id,
			profile.fallback_socket_role_id]:
		if semantic_registry != null and not semantic_registry.has(role_id):
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", ForgeDiagnostic.ERROR, role_id,
				"Equipment semantic spatial role is not registered."))
	return diagnostics


func validate_variant(profile: ForgeEntityVariantProfile) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if profile == null:
		return [_diagnostic("EFB-VARIANT-001", ForgeDiagnostic.CRITICAL, "",
			"Entity variant profile is missing.")]
	_validate_id(profile.variant_profile_id, "entity.variant.", diagnostics)
	_validate_id(profile.entity_definition_id, "entity.definition.", diagnostics)
	if profile.schema_version != 1 \
			or profile.contract_version != ForgeEntityVariantProfile.CONTRACT_VERSION \
			or profile.seed_channels.is_empty() \
			or profile.proportion_scale.x <= 0.0 \
			or profile.proportion_scale.y <= 0.0 \
			or profile.proportion_scale.z <= 0.0:
		diagnostics.append(_diagnostic(
			"EFB-VARIANT-001", ForgeDiagnostic.ERROR,
			profile.variant_profile_id,
			"Variant contract, seed channels, or proportions are invalid."))
	return diagnostics


func validate_gameplay_proxy(profile: ForgeGameplayProxyProfile) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if profile == null:
		return [_diagnostic("EFB-PROXY-001", ForgeDiagnostic.CRITICAL, "",
			"Gameplay proxy profile is missing.")]
	_validate_id(profile.gameplay_proxy_profile_id,
		"entity.gameplay_proxy.", diagnostics)
	_validate_id(profile.entity_definition_id, "entity.definition.", diagnostics)
	if profile.schema_version != 1 \
			or profile.contract_version != ForgeGameplayProxyProfile.CONTRACT_VERSION \
			or profile.collision_shape not in ["capsule", "box", "sphere"] \
			or profile.collision_size_meters.x <= 0.0 \
			or profile.collision_size_meters.y <= 0.0 \
			or profile.collision_size_meters.z <= 0.0:
		diagnostics.append(_diagnostic(
			"EFB-PROXY-001", ForgeDiagnostic.ERROR,
			profile.gameplay_proxy_profile_id,
			"Gameplay proxy contract or bounded collision shape is invalid."))
	return diagnostics


func _validate_clip(
		clip: ForgeEntityAnimationClip,
		semantic_registry: ForgeSemanticRegistry,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if clip.duration_seconds <= 0.0 or not clip.deterministic:
		diagnostics.append(_diagnostic(
			"EFB-ANIM-001", ForgeDiagnostic.ERROR, clip.clip_id,
			"Animation duration must be positive and deterministic."))
	var previous_time := -1.0
	var marker_ids := {}
	for marker in clip.event_markers:
		if marker == null or marker.marker_id.is_empty() \
				or marker_ids.has(marker.marker_id) \
				or marker.normalized_time < 0.0 or marker.normalized_time > 1.0:
			diagnostics.append(_diagnostic(
				"EFB-ANIM-001", ForgeDiagnostic.ERROR, clip.clip_id,
				"Animation event marker identity or time is invalid."))
			continue
		marker_ids[marker.marker_id] = true
		if marker.normalized_time < previous_time:
			diagnostics.append(_diagnostic(
				"EFB-ANIM-001", ForgeDiagnostic.ERROR, clip.clip_id,
				"Animation event markers are not in deterministic order."))
		previous_time = marker.normalized_time
		if marker.event_contract_id.is_empty():
			diagnostics.append(_diagnostic(
				"EVT-001", ForgeDiagnostic.ERROR, marker.marker_id,
				"Animation marker has no presentation event contract."))
		if not marker.spatial_role_id.is_empty() and semantic_registry != null \
				and not semantic_registry.has(marker.spatial_role_id):
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", ForgeDiagnostic.ERROR, marker.spatial_role_id,
				"Animation marker spatial role is not registered."))
	for track in clip.role_tracks:
		var role_id := str(track.get("role_id", ""))
		if role_id.is_empty() or not track.has("keys"):
			diagnostics.append(_diagnostic(
				"EFB-ANIM-001", ForgeDiagnostic.ERROR, clip.clip_id,
				"Animation semantic role track is incomplete."))
		elif semantic_registry != null and not semantic_registry.has(role_id):
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", ForgeDiagnostic.ERROR, role_id,
				"Animation semantic role is not registered."))


func _validate_id(
		value: String, prefix: String,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if not ForgeId.is_valid(value, prefix):
		diagnostics.append(_diagnostic(
			"EFB-ID-001", ForgeDiagnostic.ERROR, value,
			"Stage 3 stable ID is missing or invalid."))


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> ForgeDiagnostic:
	return ForgeDiagnostic.create(code, severity, target_id, message)
