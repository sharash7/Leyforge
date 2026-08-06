class_name ForgeRuntimeAssemblyValidationService
extends RefCounted
## Cross-domain validation for Set 22 rig assembly and Set 23 spatial maps.


func validate_rig_profile(
		profile: ForgeRigProfile, entity: ForgeEntityDefinition = null,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if profile == null:
		diagnostics.append(_diagnostic(
			"EFB-RIG-001", ForgeDiagnostic.CRITICAL, "",
			"Rig profile source is missing."))
		return diagnostics
	if profile.schema_version != 1 \
			or profile.contract_version != ForgeRigProfile.CONTRACT_VERSION:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR, profile.rig_profile_id,
			"Rig profile schema or contract version is unsupported."))
	_validate_id(profile.rig_profile_id, "entity.rig.", diagnostics)
	_validate_id(profile.entity_definition_id, "entity.definition.", diagnostics)
	_validate_id(profile.body_plan_id, "entity.body_plan.", diagnostics)
	if profile.role_bindings.is_empty() or profile.root_role_id.is_empty():
		diagnostics.append(_diagnostic(
			"EFB-RIG-001", ForgeDiagnostic.ERROR, profile.rig_profile_id,
			"Rig profile has no semantic bindings or root role."))
	var roles := {}
	var parts := {}
	var parent_by_role := {}
	var joint_ids := {}
	for binding in profile.role_bindings:
		if binding == null or binding.schema_version != 1:
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, profile.rig_profile_id,
				"Rig profile contains an empty or unsupported role binding."))
			continue
		if roles.has(binding.role_id) or parts.has(binding.body_part_id):
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, profile.rig_profile_id,
				"Rig semantic role or rigid body-part binding is duplicated."))
		roles[binding.role_id] = true
		parts[binding.body_part_id] = true
		parent_by_role[binding.role_id] = binding.parent_role_id
		if binding.binding_mode not in ForgeRigRoleBinding.BINDING_MODES:
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, binding.role_id,
				"Rig binding mode is unsupported."))
		if semantic_registry != null and not semantic_registry.has(binding.role_id):
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", ForgeDiagnostic.ERROR, binding.role_id,
				"Rig semantic role is not registered."))
		if entity != null and entity.body_plan != null \
				and entity.body_plan.find_body_part(binding.body_part_id) == null:
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, binding.body_part_id,
				"Rig binding body part does not resolve in the entity body plan."))
	for joint in profile.joints:
		if joint == null or joint.schema_version != 1:
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, profile.rig_profile_id,
				"Rig contains an empty or unsupported joint."))
			continue
		if joint_ids.has(joint.joint_id) or not ForgeId.is_valid(
				joint.joint_id, profile.rig_profile_id + ".joint."):
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, joint.joint_id,
				"Rig joint ID is invalid or duplicated."))
		joint_ids[joint.joint_id] = true
		if joint.joint_type not in ForgeRigJointDefinition.JOINT_TYPES \
				or not roles.has(joint.parent_role_id) \
				or not roles.has(joint.child_role_id):
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, joint.joint_id,
				"Rig joint type or semantic endpoints are invalid."))
		if joint.minimum_angles_degrees.x > joint.maximum_angles_degrees.x \
				or joint.minimum_angles_degrees.y > joint.maximum_angles_degrees.y \
				or joint.minimum_angles_degrees.z > joint.maximum_angles_degrees.z:
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, joint.joint_id,
				"Rig joint angular limits are inverted."))
	if not roles.has(profile.root_role_id):
		diagnostics.append(_diagnostic(
			"EFB-RIG-001", ForgeDiagnostic.ERROR, profile.rig_profile_id,
			"Rig root semantic role does not resolve."))
	for role_id in parent_by_role:
		var parent_id := str(parent_by_role[role_id])
		if role_id == profile.root_role_id:
			if not parent_id.is_empty():
				diagnostics.append(_diagnostic(
					"EFB-RIG-001", ForgeDiagnostic.ERROR, role_id,
					"Rig root role must not have a parent."))
		elif parent_id.is_empty() or not roles.has(parent_id):
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, role_id,
				"Rig role parent does not resolve."))
		var binding := profile.binding_for_role(role_id)
		if role_id != profile.root_role_id \
				and (binding == null or not joint_ids.has(binding.joint_id)):
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, role_id,
				"Non-root rig role has no valid joint binding."))
	if _has_parent_cycle(parent_by_role):
		diagnostics.append(_diagnostic(
			"EFB-RIG-001", ForgeDiagnostic.CRITICAL, profile.rig_profile_id,
			"Rig semantic hierarchy contains a cycle."))
	var lods := {}
	for lod_record in profile.rig_lod_levels:
		lods[int(lod_record.get("lod", -1))] = true
	for required_lod in [0, 1, 2]:
		if not lods.has(required_lod):
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, profile.rig_profile_id,
				"Golden rig has no declared LOD %d profile." % required_lod))
	for action_id in ["idle", "walk"]:
		if not profile.motion_profiles.has(action_id):
			diagnostics.append(_diagnostic(
				"EFB-RIG-001", ForgeDiagnostic.ERROR, profile.rig_profile_id,
				"Golden rig has no basic %s motion profile." % action_id))
	return diagnostics


func validate_spatial_map(
		spatial_map: ForgeSpatialMap,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if spatial_map == null:
		diagnostics.append(_diagnostic(
			"SPT-001", ForgeDiagnostic.CRITICAL, "",
			"Spatial map source is missing."))
		return diagnostics
	if spatial_map.schema_version != 1 \
			or spatial_map.contract_version != ForgeSpatialMap.CONTRACT_VERSION:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			spatial_map.spatial_map_id,
			"Spatial map schema or contract version is unsupported."))
	_validate_id(spatial_map.spatial_map_id, "spatial.map.", diagnostics)
	if spatial_map.owner_asset_id.is_empty() or spatial_map.references.is_empty():
		diagnostics.append(_diagnostic(
			"SPT-001", ForgeDiagnostic.ERROR, spatial_map.spatial_map_id,
			"Spatial map owner or references are missing."))
	var references_by_id := {}
	var references_by_role := {}
	var presentation_validator := ForgePresentationValidationService.new()
	for reference in spatial_map.references:
		if reference == null:
			diagnostics.append(_diagnostic(
				"SPT-001", ForgeDiagnostic.ERROR, spatial_map.spatial_map_id,
				"Spatial map contains an empty reference."))
			continue
		diagnostics.append_array(presentation_validator.validate(
			reference, semantic_registry))
		if reference.owner_asset_id != spatial_map.owner_asset_id:
			diagnostics.append(_diagnostic(
				"SPT-001", ForgeDiagnostic.ERROR, reference.stable_id,
				"Spatial reference owner differs from its map owner."))
		if references_by_id.has(reference.stable_id) \
				or references_by_role.has(reference.semantic_role_id):
			diagnostics.append(_diagnostic(
				"SPT-001", ForgeDiagnostic.ERROR, reference.stable_id,
				"Spatial reference ID or semantic role is duplicated."))
		references_by_id[reference.stable_id] = reference
		references_by_role[reference.semantic_role_id] = reference
	for required_role_id in spatial_map.required_role_ids:
		if not references_by_role.has(required_role_id):
			diagnostics.append(_diagnostic(
				"SPT-001", ForgeDiagnostic.ERROR, spatial_map.spatial_map_id,
				"Required spatial role is not mapped: %s" % required_role_id))
	for alias_id in spatial_map.alias_mappings:
		var target_id: Variant = spatial_map.alias_mappings[alias_id]
		if not target_id is String or str(target_id).is_empty() \
				or not references_by_role.has(str(target_id)) \
				or alias_id == str(target_id):
			diagnostics.append(_diagnostic(
				"SPT-002", ForgeDiagnostic.ERROR, spatial_map.spatial_map_id,
				"Spatial alias is ambiguous, self-referential or unresolved."))
	if _dictionary_cycle(spatial_map.alias_mappings):
		diagnostics.append(_diagnostic(
			"REG-004", ForgeDiagnostic.ERROR, spatial_map.spatial_map_id,
			"Spatial alias mappings contain a cycle."))
	var fallback_edges := {}
	for reference_id in references_by_id:
		var reference: ForgeSpatialReference = references_by_id[reference_id]
		if not reference.fallback_reference_id.is_empty():
			if not references_by_id.has(reference.fallback_reference_id):
				diagnostics.append(_diagnostic(
					"SPT-001", ForgeDiagnostic.ERROR, reference.stable_id,
					"Spatial fallback reference does not resolve."))
			else:
				fallback_edges[reference.stable_id] = reference.fallback_reference_id
		if not reference.mirror_partner_id.is_empty() \
				and not references_by_id.has(reference.mirror_partner_id):
			diagnostics.append(_diagnostic(
				"SPT-001", ForgeDiagnostic.ERROR, reference.stable_id,
				"Spatial mirror partner does not resolve."))
		for mapping in reference.variant_mappings:
			_validate_mapping(mapping, references_by_id, "variant_id",
				reference.stable_id, diagnostics)
		for mapping in reference.lod_mappings:
			_validate_mapping(mapping, references_by_id, "lod",
				reference.stable_id, diagnostics)
	if _dictionary_cycle(fallback_edges):
		diagnostics.append(_diagnostic(
			"REG-004", ForgeDiagnostic.ERROR, spatial_map.spatial_map_id,
			"Spatial fallback mappings contain a cycle."))
	for mirror in spatial_map.mirror_mappings:
		if str(mirror.get("target_role_id", "")).is_empty() \
				or not references_by_role.has(str(mirror.get("source_role_id", ""))) \
				or str(mirror.get("axis", "")) not in ["x", "y", "z"]:
			diagnostics.append(_diagnostic(
				"SPT-002", ForgeDiagnostic.ERROR, spatial_map.spatial_map_id,
				"Spatial mirror mapping is incomplete or invalid."))
	return diagnostics


func validate_assembly_profile(
		profile: ForgeEntityAssemblyProfile) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if profile == null:
		diagnostics.append(_diagnostic(
			"EFB-ASSEMBLY-001", ForgeDiagnostic.CRITICAL, "",
			"Entity assembly profile is missing."))
		return diagnostics
	if profile.schema_version != 1 \
			or profile.contract_version != ForgeEntityAssemblyProfile.CONTRACT_VERSION:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			profile.assembly_profile_id,
			"Entity assembly schema or contract version is unsupported."))
	_validate_id(profile.assembly_profile_id,
		"entity.assembly_profile.", diagnostics)
	_validate_id(profile.entity_definition_id, "entity.definition.", diagnostics)
	_validate_id(profile.rig_profile_id, "entity.rig.", diagnostics)
	_validate_id(profile.spatial_map_id, "spatial.map.", diagnostics)
	if profile.reconstruction_version <= 0 \
			or profile.default_lod_level < 0 \
			or profile.default_variant_id.is_empty():
		diagnostics.append(_diagnostic(
			"EFB-ASSEMBLY-001", ForgeDiagnostic.ERROR,
			profile.assembly_profile_id,
			"Entity assembly defaults or reconstruction version are invalid."))
	return diagnostics


func validate_runtime_contact(
		contact: ForgeRuntimeContactRecord,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if contact == null or contact.schema_version != 1 \
			or contact.contract_version != ForgeRuntimeContactRecord.CONTRACT_VERSION:
		diagnostics.append(_diagnostic(
			"SPT-003", ForgeDiagnostic.ERROR, "",
			"Runtime contact schema or contract version is invalid."))
		return diagnostics
	if not ForgeId.is_valid(contact.runtime_anchor_id, "runtime_anchor.") \
			or contact.event_instance_id.is_empty() \
			or contact.lifetime_seconds <= 0.0:
		diagnostics.append(_diagnostic(
			"SPT-003", ForgeDiagnostic.ERROR, contact.runtime_anchor_id,
			"Runtime contact identity, event instance or lifetime is invalid."))
	if semantic_registry != null \
			and not semantic_registry.has(contact.runtime_anchor_id):
		diagnostics.append(_diagnostic(
			"SPT-003", ForgeDiagnostic.ERROR, contact.runtime_anchor_id,
			"Runtime contact role is not registered."))
	if contact.surface_normal.length_squared() < 0.99 \
			or contact.surface_normal.length_squared() > 1.01:
		diagnostics.append(_diagnostic(
			"SPT-003", ForgeDiagnostic.ERROR, contact.runtime_anchor_id,
			"Runtime contact surface normal is not normalised."))
	return diagnostics


func _validate_mapping(
		mapping: Dictionary, references_by_id: Dictionary, selector_key: String,
		target_id: String, diagnostics: Array[ForgeDiagnostic]) -> void:
	var quality := str(mapping.get("quality", ""))
	if not mapping.has(selector_key) or quality not in [
			"exact", "equivalent", "approximate", "fallback", "suppressed"]:
		diagnostics.append(_diagnostic(
			"SPT-002", ForgeDiagnostic.ERROR, target_id,
			"Spatial variant or LOD mapping has no selector or quality."))
	var reference_id := str(mapping.get("reference_id", ""))
	if not reference_id.is_empty() and not references_by_id.has(reference_id):
		diagnostics.append(_diagnostic(
			"SPT-002", ForgeDiagnostic.ERROR, target_id,
			"Spatial variant or LOD remap target does not resolve."))


func _has_parent_cycle(parent_by_id: Dictionary) -> bool:
	for start in parent_by_id:
		var cursor := str(start)
		var visited := {}
		while not cursor.is_empty() and parent_by_id.has(cursor):
			if visited.has(cursor):
				return true
			visited[cursor] = true
			cursor = str(parent_by_id[cursor])
	return false


func _dictionary_cycle(edges: Dictionary) -> bool:
	for start in edges:
		var cursor := str(start)
		var visited := {}
		while edges.has(cursor):
			if visited.has(cursor):
				return true
			visited[cursor] = true
			cursor = str(edges[cursor])
	return false


func _validate_id(
		value: String, prefix: String,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if not ForgeId.is_valid(value, prefix):
		diagnostics.append(_diagnostic(
			"EFB-ID-001", ForgeDiagnostic.ERROR, value,
			"Runtime Forge stable ID is missing or invalid."))


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> ForgeDiagnostic:
	return ForgeDiagnostic.create(code, severity, target_id, message)
