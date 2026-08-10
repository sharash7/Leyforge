class_name ForgeModularStructureValidationService
extends RefCounted
## Validation shared by the Structures Forge editor and procedural assembler.


func validate_connector(
		connector: ForgeBlueprintConnectorDefinition,
		owner_module_id := "") -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if connector == null:
		return [_diag("STR-CON-001", ForgeDiagnostic.ERROR, "",
			"Structure connection point is missing.")]
	if connector.schema_version != 1 \
			or not ForgeId.is_valid(connector.connector_id, "blueprint.connector."):
		diagnostics.append(_diag("STR-CON-001", ForgeDiagnostic.ERROR,
			connector.connector_id, "Connection point identity is invalid."))
	var expected_owner := owner_module_id \
		if not owner_module_id.is_empty() else connector.owner_module_id
	if not ForgeId.is_valid(expected_owner, "blueprint.module.") \
			or connector.owner_module_id != expected_owner:
		diagnostics.append(_diag("STR-CON-002", ForgeDiagnostic.ERROR,
			connector.connector_id,
			"Connection point owner does not match its module."))
	if not ForgeId.is_valid(connector.socket_role_id, "socket.role."):
		diagnostics.append(_diag("STR-CON-003", ForgeDiagnostic.ERROR,
			connector.connector_id, "Connection point socket role is invalid."))
	if connector.direction not in ForgeBlueprintConnectorDefinition.CARDINAL_DIRECTIONS:
		diagnostics.append(_diag("STR-CON-004", ForgeDiagnostic.ERROR,
			connector.connector_id,
			"Connection point direction must be a cardinal grid direction."))
	if connector.clearance.x <= 0 or connector.clearance.y <= 0 \
			or connector.clearance.z <= 0 or connector.maximum_connections <= 0:
		diagnostics.append(_diag("STR-CON-005", ForgeDiagnostic.ERROR,
			connector.connector_id,
			"Connection point clearance or connection limit is invalid."))
	if connector.opening_size.x <= 0 or connector.opening_size.y <= 0 \
			or connector.opening_size.z <= 0 \
			or connector.navigation_mode not in ["walk", "crawl", "climb", "jump", "rail", "none"] \
			or connector.terrain_policy not in ["inherit_module", "surface_fit", "carve", "bridge", "none"] \
			or connector.allowed_rotations.is_empty():
		diagnostics.append(_diag("STR-CON-006", ForgeDiagnostic.ERROR,
			connector.connector_id, "Connection opening, navigation, terrain or rotations are invalid."))
	return diagnostics


func validate_module_connectors(
		module: ForgeBlueprintModuleDefinition) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if module == null:
		return [_diag("STR-MOD-001", ForgeDiagnostic.ERROR, "",
			"Structure module is missing.")]
	var connector_ids := {}
	for connector in module.connectors:
		diagnostics.append_array(validate_connector(connector, module.module_id))
		if connector == null:
			continue
		if connector_ids.has(connector.connector_id):
			diagnostics.append(_diag("STR-CON-001", ForgeDiagnostic.CRITICAL,
				module.module_id, "Structure module repeats a connection point ID."))
		connector_ids[connector.connector_id] = true
	return diagnostics


func validate_module_set(
		module_set: ForgeBlueprintModuleSet,
		modules_by_id: Dictionary = {}) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if module_set == null:
		return [_diag("STR-SET-001", ForgeDiagnostic.ERROR, "",
			"Structure set is missing.")]
	if module_set.schema_version != 1 \
			or not ForgeId.is_valid(module_set.module_set_id, "blueprint.module_set.") \
			or module_set.module_ids.is_empty():
		diagnostics.append(_diag("STR-SET-001", ForgeDiagnostic.ERROR,
			module_set.module_set_id, "Structure set identity or module list is invalid."))
	if module_set.continuation_policy not in ["finite", "continuing"]:
		diagnostics.append(_diag("STR-SET-002", ForgeDiagnostic.ERROR,
			module_set.module_set_id, "Structure continuation policy is unsupported."))
	var seen := {}
	for module_id in module_set.module_ids:
		if not ForgeId.is_valid(module_id, "blueprint.module.") or seen.has(module_id):
			diagnostics.append(_diag("STR-SET-003", ForgeDiagnostic.ERROR,
				module_set.module_set_id, "Structure set module ID is invalid or duplicated."))
		seen[module_id] = true
		if not modules_by_id.is_empty() and not modules_by_id.has(module_id):
			diagnostics.append(_diag("STR-SET-004", ForgeDiagnostic.ERROR,
				module_set.module_set_id, "Structure set references a missing module: %s" % module_id))
		if module_set.weight_for(module_id) <= 0.0:
			diagnostics.append(_diag("STR-SET-005", ForgeDiagnostic.ERROR,
				module_set.module_set_id, "Structure module weight must be positive."))
	for module_id in module_set.start_module_ids:
		if module_id not in module_set.module_ids:
			diagnostics.append(_diag("STR-SET-006", ForgeDiagnostic.ERROR,
				module_set.module_set_id, "Start module is not part of the structure set."))
	for module_id in module_set.end_module_ids:
		if module_id not in module_set.module_ids:
			diagnostics.append(_diag("STR-SET-006", ForgeDiagnostic.ERROR,
				module_set.module_set_id, "End module is not part of the structure set."))
	return diagnostics


func validate_rule_set(
		rules: ForgeProceduralStructureRuleSet,
		module_set: ForgeBlueprintModuleSet = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if rules == null:
		return [_diag("STR-RULE-001", ForgeDiagnostic.ERROR, "",
			"Procedural structure rules are missing.")]
	if rules.schema_version != 1 \
			or not ForgeId.is_valid(rules.rule_set_id, "blueprint.ruleset.") \
			or not ForgeId.is_valid(rules.module_set_id, "blueprint.module_set."):
		diagnostics.append(_diag("STR-RULE-001", ForgeDiagnostic.ERROR,
			rules.rule_set_id, "Procedural structure rule identity is invalid."))
	if module_set != null and rules.module_set_id != module_set.module_set_id:
		diagnostics.append(_diag("STR-RULE-002", ForgeDiagnostic.ERROR,
			rules.rule_set_id, "Rules reference a different structure set."))
	if rules.maximum_modules <= 0 or rules.maximum_depth < 0 \
			or rules.maximum_open_connectors <= 0 \
			or rules.termination_chance < 0.0 or rules.termination_chance > 1.0:
		diagnostics.append(_diag("STR-RULE-003", ForgeDiagnostic.ERROR,
			rules.rule_set_id, "Procedural generation bounds are invalid."))
	if rules.collision_policy not in ["none", "module_origin", "occupied_bounds_and_clearance"]:
		diagnostics.append(_diag("STR-RULE-004", ForgeDiagnostic.ERROR,
			rules.rule_set_id, "Procedural collision policy is unsupported."))
	if rules.maximum_repeats_per_module <= 0 \
			or rules.continuation_checkpoint_interval <= 0 \
			or rules.dead_end_policy not in ["terminate_with_cap", "leave_open", "seal"]:
		diagnostics.append(_diag("STR-RULE-005", ForgeDiagnostic.ERROR,
			rules.rule_set_id, "Repetition, checkpoint, or dead-end policy is invalid."))
	return diagnostics


func _diag(code: String, severity: String, target_id: String,
		message: String) -> ForgeDiagnostic:
	return ForgeDiagnostic.create(code, severity, target_id, message)
