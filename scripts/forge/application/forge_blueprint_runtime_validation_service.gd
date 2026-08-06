class_name ForgeBlueprintRuntimeValidationService
extends RefCounted
## Domain validation for compiled blueprints, state deltas and world acoustics.


func validate_module(module: ForgeBlueprintModuleDefinition,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if module == null:
		return [_diag("EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Blueprint module source is missing.")]
	if module.schema_version != 1 \
			or not ForgeId.is_valid(module.module_id, "blueprint.module."):
		diagnostics.append(_diag("EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			module.module_id, "Blueprint module contract is invalid."))
	var element_ids := {}
	for element in module.elements:
		if element == null or element.element_id.is_empty() \
				or element_ids.has(element.element_id):
			diagnostics.append(_diag("EFB-ID-001", ForgeDiagnostic.CRITICAL,
				module.module_id, "Blueprint module element is missing or duplicated."))
			continue
		element_ids[element.element_id] = true
		if not element.module_id.is_empty():
			diagnostics.append(_diag("EFB-BP-010", ForgeDiagnostic.ERROR,
				module.module_id, "Nested module sources must be flattened by the owning blueprint."))
		_validate_element_roles(element, module.module_id, semantic_registry, diagnostics)
	return diagnostics


func validate_state(state: ForgeBlueprintStateDefinition,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if state == null:
		return [_diag("EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Blueprint state source is missing.")]
	if state.schema_version != 1 \
			or not ForgeId.is_valid(state.state_id, "blueprint.state.") \
			or not ForgeId.is_valid(state.blueprint_id, "blueprint."):
		diagnostics.append(_diag("EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			state.state_id, "Blueprint state identity is invalid."))
	if state.state_id == state.parent_state_id:
		diagnostics.append(_diag("EFB-BP-010", ForgeDiagnostic.CRITICAL,
			state.state_id, "Blueprint state cannot inherit itself."))
	if state.state_kind not in ["intact", "under_construction", "light_damage",
			"heavy_damage", "repaired", "occupied", "corrupted"]:
		diagnostics.append(_diag("EFB-BP-001", ForgeDiagnostic.ERROR,
			state.state_id, "Blueprint state kind is unsupported."))
	for role_id in state.material_role_overrides:
		if semantic_registry != null and not semantic_registry.has(str(role_id)):
			diagnostics.append(_diag("EFB-BP-MAT-001", ForgeDiagnostic.ERROR,
				state.state_id, "Blueprint state material role is not registered."))
	for layer_id in state.surface_layer_ids:
		if not ForgeId.is_valid(layer_id, "surface.layer."):
			diagnostics.append(_diag("SRC-001", ForgeDiagnostic.ERROR,
				state.state_id, "Blueprint state surface layer ID is invalid."))
	return diagnostics


func validate_product(product: ForgeBlueprintRuntimeProduct) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if product == null:
		return [_diag("EFB-SCHEMA-001", ForgeDiagnostic.CRITICAL, "",
			"Blueprint runtime product is missing.")]
	if product.schema_version != 1 \
			or not ForgeId.is_valid(product.product_id, "runtime.blueprint.") \
			or not ForgeId.is_valid(product.blueprint_id, "blueprint."):
		diagnostics.append(_diag("EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			product.product_id, "Blueprint runtime product identity is invalid."))
	if product.source_hash.length() != 64 or product.compiled_elements.is_empty():
		diagnostics.append(_diag("EFB-BP-001", ForgeDiagnostic.ERROR,
			product.product_id, "Blueprint runtime product is empty or unhashed."))
	var element_ids := {}
	for record in product.compiled_elements:
		var element_id := str(record.get("element_id", ""))
		if element_id.is_empty() or element_ids.has(element_id):
			diagnostics.append(_diag("EFB-ID-001", ForgeDiagnostic.CRITICAL,
				product.product_id, "Compiled blueprint element is missing or duplicated."))
		element_ids[element_id] = true
	return diagnostics


func validate_snapshot(snapshot: ForgeBlueprintInstanceSnapshot) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if snapshot == null or snapshot.schema_version != 1 \
			or snapshot.instance_id.is_empty() \
			or not ForgeId.is_valid(snapshot.product_id, "runtime.blueprint."):
		diagnostics.append(_diag("EFB-SCHEMA-001", ForgeDiagnostic.ERROR,
			"", "Blueprint instance snapshot is invalid."))
	return diagnostics


func validate_acoustic_graph(graph: ForgeAcousticZoneGraph) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if graph == null or graph.schema_version != 1 \
			or not ForgeId.is_valid(graph.stable_id, "acoustic."):
		return [_diag("ACU-001", ForgeDiagnostic.ERROR, "",
			"Acoustic zone graph contract is invalid.")]
	var zone_ids := {graph.exterior_zone_id: true}
	for zone in graph.zones:
		var zone_id := str(zone.get("zone_id", ""))
		var minimum := _vector3(zone.get("minimum", [0, 0, 0]))
		var maximum := _vector3(zone.get("maximum", [0, 0, 0]))
		if zone_id.is_empty() or zone_ids.has(zone_id) \
				or minimum.x > maximum.x or minimum.y > maximum.y \
				or minimum.z > maximum.z:
			diagnostics.append(_diag("ACU-001", ForgeDiagnostic.ERROR,
				graph.stable_id, "Acoustic zone bounds or ID are invalid."))
		else:
			zone_ids[zone_id] = true
	var portal_ids := {}
	for portal in graph.portals:
		var portal_id := str(portal.get("portal_id", ""))
		if portal_id.is_empty() or portal_ids.has(portal_id) \
				or not zone_ids.has(str(portal.get("from_zone_id", ""))) \
				or not zone_ids.has(str(portal.get("to_zone_id", ""))):
			diagnostics.append(_diag("ACU-002", ForgeDiagnostic.ERROR,
				graph.stable_id, "Acoustic portal is invalid or disconnected."))
		else:
			portal_ids[portal_id] = true
	return diagnostics


func validate_ambience_plan(plan: ForgeAmbiencePlan) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if plan == null or plan.schema_version != 1 \
			or not ForgeId.is_valid(plan.stable_id, "acoustic.") \
			or not ForgeId.is_valid(plan.acoustic_graph_id, "acoustic."):
		return [_diag("ACU-001", ForgeDiagnostic.ERROR, "",
			"Ambience plan contract is invalid.")]
	if plan.components.size() > plan.maximum_active_components:
		diagnostics.append(_diag("BUD-001", ForgeDiagnostic.ERROR,
			plan.stable_id, "Ambience plan exceeds its component budget."))
	var ids := {}
	for component in plan.components:
		var component_id := str(component.get("component_id", ""))
		if component_id.is_empty() or ids.has(component_id) \
				or not ForgeId.is_valid(str(component.get("sound_event_id", "")),
					"sound.event."):
			diagnostics.append(_diag("ACU-001", ForgeDiagnostic.ERROR,
				plan.stable_id, "Ambience component identity is invalid."))
		ids[component_id] = true
	return diagnostics


func _validate_element_roles(element: ForgeBlueprintElement, target_id: String,
		semantic_registry: ForgeSemanticRegistry,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if semantic_registry == null:
		return
	for role_id in element.marker_role_ids:
		if not semantic_registry.has(role_id):
			diagnostics.append(_diag("EFB-BP-MARKER-001", ForgeDiagnostic.ERROR,
				target_id, "Blueprint module marker role is not registered."))
	for role_id in element.socket_role_ids:
		if not semantic_registry.has(role_id):
			diagnostics.append(_diag("SPT-002", ForgeDiagnostic.ERROR,
				target_id, "Blueprint module socket role is not registered."))
	for role_id in element.network_role_ids:
		if not semantic_registry.has(role_id):
			diagnostics.append(_diag("EFB-BP-NET-001", ForgeDiagnostic.ERROR,
				target_id, "Blueprint module network role is not registered."))


func _vector3(value: Variant) -> Vector3:
	if value is Array and value.size() >= 3:
		return Vector3(float(value[0]), float(value[1]), float(value[2]))
	return Vector3.ZERO


func _diag(code: String, severity: String, target_id: String,
		message: String) -> ForgeDiagnostic:
	return ForgeDiagnostic.create(code, severity, target_id, message)
