class_name ForgeFoundationValidationService
extends RefCounted
## Set 22 Stage 0 validation. Existing Forge asset validation stays separate.


func validate_entity_definition(
		entity: ForgeEntityDefinition,
		semantic_registry: ForgeSemanticRegistry = null,
		density_registry: ForgeDensityProfileRegistry = null) \
		-> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if entity == null:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Entity definition source is missing."))
		return diagnostics
	if entity.schema_version != 1:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			entity.entity_definition_id, "Entity definition schema is unsupported."))
	_validate_id(entity.entity_definition_id, "entity.definition.", diagnostics)
	_validate_id(entity.density_profile_id, "density.profile.", diagnostics)
	if entity.body_plan == null:
		diagnostics.append(_diagnostic(
			"EFB-BODY-001", ForgeDiagnostic.ERROR, entity.entity_definition_id,
			"Entity definition has no body plan."))
	else:
		diagnostics.append_array(validate_body_plan(
			entity.body_plan, semantic_registry, density_registry))
		if entity.body_plan.family != entity.body_family:
			diagnostics.append(_diagnostic(
				"EFB-BODY-001", ForgeDiagnostic.ERROR,
				entity.entity_definition_id,
				"Entity and body-plan families do not match."))
	for material_id in entity.material_dna_ids:
		_validate_id(material_id, "material.", diagnostics)
	if density_registry != null and not density_registry.has(
			entity.density_profile_id):
		diagnostics.append(_diagnostic(
			"EFB-DEP-001", ForgeDiagnostic.ERROR,
			entity.entity_definition_id,
			"Entity density profile dependency is missing."))
	if semantic_registry != null:
		for role_id in entity.entity_role_ids:
			if not semantic_registry.has(role_id):
				diagnostics.append(_diagnostic(
					"EFB-DEP-001", ForgeDiagnostic.ERROR,
					entity.entity_definition_id,
					"Entity role is not registered: %s" % role_id))
		if not entity.capture_profile_id.is_empty() \
				and not semantic_registry.has(entity.capture_profile_id):
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", ForgeDiagnostic.ERROR,
				entity.entity_definition_id,
				"Entity capture profile dependency is missing."))
	if entity.world_dimensions_meters.x <= 0.0 \
			or entity.world_dimensions_meters.y <= 0.0 \
			or entity.world_dimensions_meters.z <= 0.0:
		diagnostics.append(_diagnostic(
			"EFB-DENSITY-001", ForgeDiagnostic.ERROR,
			entity.entity_definition_id,
			"Entity world dimensions must be positive."))
	return diagnostics


func validate_entity(
		entity: ForgeEntityPresentation,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if entity == null:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Entity presentation source is missing."))
		return diagnostics
	if entity.schema_version != 1:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			entity.entity_definition_id, "Entity schema is unsupported."))
	_validate_id(entity.entity_definition_id, "entity.definition.", diagnostics)
	_validate_id(entity.body_plan_id, "entity.body_plan.", diagnostics)
	for body_part_id in entity.body_part_ids:
		_validate_id(body_part_id, "entity.body_part.", diagnostics)
	if not entity.rig_id.is_empty():
		_validate_id(entity.rig_id, "entity.rig.", diagnostics)
	if not entity.animation_set_id.is_empty():
		_validate_id(entity.animation_set_id, "entity.animation_set.", diagnostics)
	if not entity.contract_id.is_empty():
		_validate_id(entity.contract_id, "entity.contract.", diagnostics)
	if not entity.equipment_profile_id.is_empty():
		_validate_id(
			entity.equipment_profile_id, "entity.equipment_profile.", diagnostics)
	if semantic_registry != null and not entity.capture_profile_id.is_empty() \
			and not semantic_registry.has(entity.capture_profile_id):
		diagnostics.append(_diagnostic(
			"EFB-DEP-001", ForgeDiagnostic.ERROR, entity.entity_definition_id,
			"Entity capture profile dependency is missing."))
	return diagnostics


func validate_body_plan(
		body_plan: ForgeBodyPlanDefinition,
		semantic_registry: ForgeSemanticRegistry = null,
		density_registry: ForgeDensityProfileRegistry = null) \
		-> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if body_plan == null:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Body plan source is missing."))
		return diagnostics
	if body_plan.schema_version != 1:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR, body_plan.body_plan_id,
			"Body-plan schema is unsupported."))
	_validate_id(body_plan.body_plan_id, "entity.body_plan.", diagnostics)
	_validate_id(body_plan.density_profile_id, "density.profile.", diagnostics)
	if density_registry != null and not density_registry.has(
			body_plan.density_profile_id):
		diagnostics.append(_diagnostic(
			"EFB-DEP-001", ForgeDiagnostic.ERROR, body_plan.body_plan_id,
			"Body-plan density profile dependency is missing."))
	var part_ids := {}
	var parent_by_id := {}
	if not body_plan.body_parts.is_empty():
		for part in body_plan.body_parts:
			if part == null:
				diagnostics.append(_diagnostic(
					"EFB-BODY-001", ForgeDiagnostic.ERROR,
					body_plan.body_plan_id,
					"Body plan contains an empty typed part."))
				continue
			var part_id := part.body_part_id
			if part_ids.has(part_id):
				diagnostics.append(_diagnostic(
					"EFB-ID-001", ForgeDiagnostic.CRITICAL, part_id,
					"Body part ID is duplicated."))
			else:
				part_ids[part_id] = true
			parent_by_id[part_id] = part.parent_part_id
			diagnostics.append_array(validate_body_part(
				part, body_plan, semantic_registry, density_registry))
	else:
		for legacy_part in body_plan.parts:
			var part_id := str(legacy_part.get("id", ""))
			if part_ids.has(part_id):
				diagnostics.append(_diagnostic(
					"EFB-ID-001", ForgeDiagnostic.CRITICAL, part_id,
					"Body part ID is duplicated."))
			else:
				part_ids[part_id] = true
			_validate_id(part_id, "entity.body_part.", diagnostics)
	var has_parts := not body_plan.body_parts.is_empty() \
		or not body_plan.parts.is_empty()
	if has_parts and not part_ids.has(body_plan.root_part_id):
		diagnostics.append(_diagnostic(
			"EFB-BODY-001", ForgeDiagnostic.ERROR, body_plan.body_plan_id,
			"Body plan root part does not resolve."))
	if not body_plan.body_parts.is_empty():
		for part_id in parent_by_id:
			var parent_id := str(parent_by_id[part_id])
			if part_id == body_plan.root_part_id:
				if not parent_id.is_empty():
					diagnostics.append(_diagnostic(
						"EFB-BODY-001", ForgeDiagnostic.ERROR, part_id,
						"Body-plan root must not have a parent."))
			elif parent_id.is_empty() or not part_ids.has(parent_id):
				diagnostics.append(_diagnostic(
					"EFB-BODY-001", ForgeDiagnostic.ERROR, part_id,
					"Body part parent does not resolve."))
		if _has_body_cycle(parent_by_id):
			diagnostics.append(_diagnostic(
				"EFB-BODY-010", ForgeDiagnostic.CRITICAL,
				body_plan.body_plan_id, "Body-plan graph contains a cycle."))
		if not _all_parts_reach_root(parent_by_id, body_plan.root_part_id):
			diagnostics.append(_diagnostic(
				"EFB-BODY-001", ForgeDiagnostic.ERROR,
				body_plan.body_plan_id,
				"Body-plan graph contains a disconnected part."))
	if semantic_registry != null:
		for role_id in body_plan.required_entity_roles:
			if not semantic_registry.has(role_id):
				diagnostics.append(_diagnostic(
					"EFB-DEP-001", ForgeDiagnostic.ERROR,
					body_plan.body_plan_id,
					"Body plan entity role is not registered: %s" % role_id))
	return diagnostics


func validate_body_part(
		part: ForgeBodyPartDefinition,
		body_plan: ForgeBodyPlanDefinition = null,
		semantic_registry: ForgeSemanticRegistry = null,
		density_registry: ForgeDensityProfileRegistry = null) \
		-> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if part == null:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Body part source is missing."))
		return diagnostics
	if part.schema_version != 1:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR, part.body_part_id,
			"Body-part schema is unsupported."))
	_validate_id(part.body_part_id, "entity.body_part.", diagnostics)
	_validate_id(part.density_profile_id, "density.profile.", diagnostics)
	if not part.material_dna_id.is_empty():
		_validate_id(part.material_dna_id, "material.", diagnostics)
	if part.voxel_source == null or part.voxel_source.occupied_count() == 0:
		diagnostics.append(_diagnostic(
			"EFB-BODY-001", ForgeDiagnostic.ERROR, part.body_part_id,
			"Visible body part has no occupied voxel source."))
	elif part.voxel_source.density_profile != part.density_profile_id:
		diagnostics.append(_diagnostic(
			"EFB-DENSITY-001", ForgeDiagnostic.ERROR, part.body_part_id,
			"Body part and voxel source density profiles do not match."))
	if density_registry != null:
		var profile := density_registry.resolve(part.density_profile_id)
		if profile == null:
			diagnostics.append(_diagnostic(
				"EFB-DEP-001", ForgeDiagnostic.ERROR, part.body_part_id,
				"Body-part density profile dependency is missing."))
		elif part.voxel_source != null:
			if not is_equal_approx(
					part.voxel_source.voxel_size_meters,
					profile.voxel_size_meters):
				diagnostics.append(_diagnostic(
					"EFB-DENSITY-001", ForgeDiagnostic.ERROR,
					part.body_part_id,
					"Body-part voxel scale does not match its density profile."))
			var dimensions := part.voxel_source.dimensions
			if dimensions.x > profile.maximum_part_dimensions.x \
					or dimensions.y > profile.maximum_part_dimensions.y \
					or dimensions.z > profile.maximum_part_dimensions.z:
				diagnostics.append(_diagnostic(
					"EFB-DENSITY-001", ForgeDiagnostic.ERROR,
					part.body_part_id,
					"Body-part source exceeds its density profile bounds."))
	if body_plan != null and part.density_profile_id != body_plan.density_profile_id:
		diagnostics.append(_diagnostic(
			"EFB-DENSITY-001", ForgeDiagnostic.WARNING, part.body_part_id,
			"Mixed-density part requires an explicit transition contract."))
	if semantic_registry != null and not part.anatomy_role_id.is_empty() \
			and not semantic_registry.has(part.anatomy_role_id):
		diagnostics.append(_diagnostic(
			"EFB-DEP-001", ForgeDiagnostic.ERROR, part.body_part_id,
			"Body-part anatomy role is not registered."))
	return diagnostics


func validate_density_profile(
		profile: ForgeDensityProfile) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if profile == null:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Density profile is missing."))
		return diagnostics
	_validate_id(profile.density_profile_id, "density.profile.", diagnostics)
	if profile.schema_version != 1 or profile.voxels_per_meter <= 0 \
			or profile.voxel_size_meters <= 0.0 \
			or not is_equal_approx(
				profile.voxel_size_meters,
				1.0 / float(profile.voxels_per_meter)):
		diagnostics.append(_diagnostic(
			"EFB-DENSITY-001", ForgeDiagnostic.ERROR,
			profile.density_profile_id,
			"Density profile scale is invalid."))
	return diagnostics


func validate_material_role_set(
		role_set: ForgeBlueprintMaterialRoleSet,
		semantic_registry: ForgeSemanticRegistry = null) \
		-> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if role_set == null:
		return diagnostics
	_validate_id(
		role_set.material_role_set_id,
		"blueprint.material_role_set.", diagnostics)
	for role_id in role_set.required_role_ids:
		if not role_set.role_bindings.has(role_id):
			diagnostics.append(_diagnostic(
				"EFB-BP-MAT-001", ForgeDiagnostic.ERROR,
				role_set.material_role_set_id,
				"Required blueprint material role is unbound: %s" % role_id))
	for role_id in role_set.role_bindings:
		if semantic_registry != null and not semantic_registry.has(str(role_id)):
			diagnostics.append(_diagnostic(
				"EFB-BP-MAT-001", ForgeDiagnostic.ERROR,
				role_set.material_role_set_id,
				"Blueprint material role is not registered: %s" % role_id))
		_validate_id(str(role_set.role_bindings[role_id]), "material.", diagnostics)
	return diagnostics


func validate_blueprint(
		blueprint: ForgeBlueprintDefinition,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if blueprint == null:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Blueprint source is missing."))
		return diagnostics
	if blueprint.schema_version != 1:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR, blueprint.blueprint_id,
			"Blueprint schema is unsupported."))
	_validate_id(blueprint.blueprint_id, "blueprint.", diagnostics)
	for module_id in blueprint.module_ids:
		_validate_id(module_id, "blueprint.module.", diagnostics)
	if not blueprint.module_ids.is_empty() and blueprint.elements.is_empty():
		diagnostics.append(_diagnostic(
			"EFB-BP-001", ForgeDiagnostic.ERROR, blueprint.blueprint_id,
			"Blueprint declares modules but contains no elements."))
	var element_ids := {}
	for element in blueprint.elements:
		if element == null:
			diagnostics.append(_diagnostic(
				"EFB-BP-001", ForgeDiagnostic.ERROR, blueprint.blueprint_id,
				"Blueprint contains an empty element."))
			continue
		if element.element_id.is_empty() or element_ids.has(element.element_id):
			diagnostics.append(_diagnostic(
				"EFB-ID-001", ForgeDiagnostic.CRITICAL, element.element_id,
				"Blueprint element ID is empty or duplicated."))
		element_ids[element.element_id] = true
		if element.child_blueprint_id == blueprint.blueprint_id:
			diagnostics.append(_diagnostic(
				"EFB-BP-010", ForgeDiagnostic.CRITICAL, blueprint.blueprint_id,
				"Blueprint dependency cycle includes itself."))
		if semantic_registry != null:
			if not element.material_role_id.is_empty() \
					and not semantic_registry.has(element.material_role_id):
				diagnostics.append(_diagnostic(
					"EFB-BP-MAT-001", ForgeDiagnostic.ERROR,
					blueprint.blueprint_id,
					"Blueprint material role is invalid: %s" \
						% element.material_role_id))
			for marker_id in element.marker_role_ids:
				if not semantic_registry.has(marker_id):
					diagnostics.append(_diagnostic(
						"EFB-BP-MARKER-001", ForgeDiagnostic.ERROR,
						blueprint.blueprint_id,
						"Blueprint marker role is invalid: %s" % marker_id))
			for network_id in element.network_role_ids:
				if not semantic_registry.has(network_id):
					diagnostics.append(_diagnostic(
						"EFB-BP-NET-001", ForgeDiagnostic.ERROR,
						blueprint.blueprint_id,
						"Blueprint network role is invalid: %s" % network_id))
	if blueprint.placement_profile != null:
		diagnostics.append_array(validate_placement_profile(
			blueprint.placement_profile, semantic_registry))
	if blueprint.material_role_set != null:
		diagnostics.append_array(validate_material_role_set(
			blueprint.material_role_set, semantic_registry))
	return diagnostics


func _has_body_cycle(parent_by_id: Dictionary) -> bool:
	for start_id in parent_by_id:
		var cursor := str(start_id)
		var visited := {}
		while not cursor.is_empty() and parent_by_id.has(cursor):
			if visited.has(cursor):
				return true
			visited[cursor] = true
			cursor = str(parent_by_id[cursor])
	return false


func _all_parts_reach_root(
		parent_by_id: Dictionary, root_part_id: String) -> bool:
	for start_id in parent_by_id:
		var cursor := str(start_id)
		var visited := {}
		while cursor != root_part_id:
			if cursor.is_empty() or visited.has(cursor) \
					or not parent_by_id.has(cursor):
				return false
			visited[cursor] = true
			cursor = str(parent_by_id[cursor])
	return true


func validate_placement_profile(
		profile: ForgePlacementProfile,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if profile == null:
		return diagnostics
	_validate_id(
		profile.placement_profile_id, "blueprint.placement_profile.", diagnostics)
	if profile.footprint_min.x > profile.footprint_max.x \
			or profile.footprint_min.y > profile.footprint_max.y \
			or profile.footprint_min.z > profile.footprint_max.z:
		diagnostics.append(_diagnostic(
			"EFB-BP-001", ForgeDiagnostic.ERROR,
			profile.placement_profile_id, "Placement footprint bounds are inverted."))
	if semantic_registry != null:
		for role_id in profile.allowed_zone_role_ids:
			if not semantic_registry.has(role_id):
				diagnostics.append(_diagnostic(
					"EFB-DEP-001", ForgeDiagnostic.ERROR,
					profile.placement_profile_id,
					"Placement zone role is not registered: %s" % role_id))
		for role_id in profile.required_socket_role_ids:
			if not semantic_registry.has(role_id):
				diagnostics.append(_diagnostic(
					"EFB-DEP-001", ForgeDiagnostic.ERROR,
					profile.placement_profile_id,
					"Placement socket role is not registered: %s" % role_id))
	return diagnostics


func validate_migration_record(
		record: ForgeMigrationRecord) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if record == null or record.schema_version != 2:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR, "",
			"Migration record schema is unsupported."))
		return diagnostics
	if record.subject_type.is_empty() or record.target_id.is_empty():
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", ForgeDiagnostic.ERROR, record.target_id,
			"Migration subject type and target ID are required."))
	if record.replacement_strategy.is_empty() \
			or record.removal_gate.is_empty():
		diagnostics.append(_diagnostic(
			"EFB-CONTRACT-010", ForgeDiagnostic.ERROR, record.target_id,
			"Migration replacement strategy or removal gate is unclassified."))
	return diagnostics


func validate_contract_change(change: Dictionary) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if str(change.get("classification", "")).is_empty():
		diagnostics.append(_diagnostic(
			"EFB-CONTRACT-010", ForgeDiagnostic.ERROR,
			str(change.get("target_id", "")),
			"Contract change has no compatibility classification."))
	return diagnostics


func _validate_id(
		value: String, prefix: String,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if not ForgeId.is_valid(value, prefix):
		diagnostics.append(_diagnostic(
			"EFB-ID-001", ForgeDiagnostic.ERROR, value,
			"Set 22 stable ID is invalid for %s." % prefix))


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> ForgeDiagnostic:
	return ForgeDiagnostic.create(code, severity, target_id, message)
