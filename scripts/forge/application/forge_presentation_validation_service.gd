class_name ForgePresentationValidationService
extends RefCounted
## Set 23 source-contract validation. Runtime playback is intentionally absent.

const SUPPORTED_LIFECYCLES: PackedStringArray = [
	"draft", "foundation", "active_fallback", "golden_source_candidate",
	"planned_new_work", "deprecated",
]
const SPATIAL_PREFIXES := {
	"anchor": "anchor.",
	"socket": "socket.",
	"region": "region.",
	"path": "path.",
	"mask": "mask.",
	"zone": "zone.",
	"portal": "portal.audio.",
	"runtime_anchor": "runtime_anchor.",
}


func validate(
		definition: ForgePresentationDefinition,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if definition == null:
		diagnostics.append(_diagnostic(
			"SRC-001", ForgeDiagnostic.BLOCKER, "",
			"Presentation source definition is missing."))
		return diagnostics
	_validate_common(definition, diagnostics)
	if definition is ForgePresentationProfile:
		_validate_profile(definition, diagnostics)
	elif definition is ForgePresentationBinding:
		_validate_binding(definition, diagnostics)
	elif definition is ForgePresentationEventContract:
		_validate_event_contract(definition, diagnostics)
	elif definition is ForgePresentationStateContract:
		_validate_state_contract(definition, diagnostics)
	elif definition is ForgePresentationParameterContract:
		_validate_parameter_contract(definition, diagnostics)
	elif definition is ForgePresentationContextSchema:
		_validate_context_schema(definition, diagnostics)
	elif definition is ForgeSpatialReference:
		_validate_spatial_reference(
			definition, semantic_registry, diagnostics)
	elif definition is ForgeVfxDefinition:
		_validate_vfx_definition(definition, diagnostics)
	elif definition is ForgeVfxFamily:
		_validate_vfx_family(definition, diagnostics)
	elif definition is ForgeVfxGraph:
		_validate_vfx_graph(definition, diagnostics)
	elif definition is ForgeVfxForm:
		_validate_vfx_form(definition, diagnostics)
	elif definition is ForgeSurfaceLayer:
		_validate_surface_layer(definition, semantic_registry, diagnostics)
	elif definition is ForgeSoundEvent:
		_validate_sound_event(definition, diagnostics)
	elif definition is ForgeSoundSource:
		_validate_sound_source(definition, diagnostics)
	elif definition is ForgeAudioFamily:
		_validate_audio_family(definition, diagnostics)
	elif definition is ForgeSpatialAudioProfile:
		_validate_spatial_audio_profile(definition, diagnostics)
	elif definition is ForgeMaterialResponseTable:
		_validate_material_response(definition, diagnostics)
	elif definition is ForgeAcousticProfile:
		_validate_acoustic_profile(
			definition, semantic_registry, diagnostics)
	elif definition is ForgeMixSnapshot:
		_validate_mix_snapshot(definition, diagnostics)
	elif definition is ForgePresentationBudgetProfile:
		_validate_budget_profile(definition, diagnostics)
	elif definition is ForgeAccessibilityProfile:
		_validate_accessibility_profile(definition, diagnostics)
	elif definition is ForgePresentationTestScenario:
		_validate_test_scenario(definition, diagnostics)
	else:
		diagnostics.append(_diagnostic(
			"REG-001", ForgeDiagnostic.ERROR, definition.stable_id,
			"Presentation definition type is not registered."))
	return diagnostics


func validate_pack(pack: ForgeContentPackManifest) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if pack == null or not ForgeId.is_valid(pack.pack_id, "pack.presentation."):
		diagnostics.append(_diagnostic(
			"PAK-001", ForgeDiagnostic.ERROR,
			"" if pack == null else pack.pack_id,
			"Presentation content-pack identity is missing or invalid."))
		return diagnostics
	if pack.contract_version != ForgePresentationDefinition.CONTRACT_VERSION \
			or pack.dependencies.has(pack.pack_id):
		diagnostics.append(_diagnostic(
			"PAK-001", ForgeDiagnostic.ERROR, pack.pack_id,
			"Presentation pack contract or dependency range is invalid."))
	if pack.override_policy not in ["declared_only", "additive_only"]:
		diagnostics.append(_diagnostic(
			"PAK-002", ForgeDiagnostic.BLOCKER, pack.pack_id,
			"Presentation pack override policy can bypass protected behavior."))
	var schemas := ForgeSchemaRegistry.new()
	for schema_id in pack.provided_schema_ids:
		if not schemas.has(schema_id):
			diagnostics.append(_diagnostic(
				"PAK-003", ForgeDiagnostic.BLOCKER, pack.pack_id,
				"Presentation pack declares an unavailable runtime schema."))
	for asset_id in pack.presentation_asset_ids:
		if not ForgeId.is_valid(asset_id) \
				or not ForgeId.is_supported_family(asset_id):
			diagnostics.append(_diagnostic(
				"PAK-003", ForgeDiagnostic.BLOCKER, pack.pack_id,
				"Presentation pack contains an invalid asset identity."))
	return diagnostics


func validate_migration_record(
		record: ForgeMigrationRecord) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if record == null or record.subject_type.is_empty() \
			or record.target_id.is_empty() \
			or record.replacement_strategy.is_empty():
		diagnostics.append(_diagnostic(
			"MIG-001", ForgeDiagnostic.ERROR,
			"" if record == null else record.target_id,
			"Presentation migration record is incomplete."))
		return diagnostics
	if record.lifecycle in ["deprecated", "active_fallback"] \
			and record.fallback_id.is_empty() and record.fallback.is_empty():
		diagnostics.append(_diagnostic(
			"MIG-001", ForgeDiagnostic.ERROR, record.target_id,
			"Presentation migration has no supported fallback."))
	if not record.blocked_reason.is_empty() or record.status == "blocked":
		diagnostics.append(_diagnostic(
			"MIG-002", ForgeDiagnostic.BLOCKER, record.target_id,
			"Presentation migration is blocked and cannot be released."))
	return diagnostics


func _validate_common(
		definition: ForgePresentationDefinition,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	var schema_registry := ForgeSchemaRegistry.new()
	if definition.schema_version != 1 \
			or not schema_registry.has(definition.schema_id):
		diagnostics.append(_diagnostic(
			"REG-001", ForgeDiagnostic.ERROR, definition.stable_id,
			"Presentation source schema is unsupported."))
	if not ForgeId.is_valid(definition.stable_id) \
			or not ForgeId.is_supported_family(definition.stable_id):
		diagnostics.append(_diagnostic(
			"REG-001", ForgeDiagnostic.ERROR, definition.stable_id,
			"Presentation source stable ID is invalid or unregistered."))
	if not ForgeId.is_valid(definition.owner_pack_id, "pack.presentation."):
		diagnostics.append(_diagnostic(
			"REG-002", ForgeDiagnostic.ERROR, definition.stable_id,
			"Presentation source owner pack is missing or invalid."))
	if definition.contract_version != ForgePresentationDefinition.CONTRACT_VERSION:
		diagnostics.append(_diagnostic(
			"REG-001", ForgeDiagnostic.ERROR, definition.stable_id,
			"Presentation source contract version is unsupported."))
	if definition.lifecycle not in SUPPORTED_LIFECYCLES:
		diagnostics.append(_diagnostic(
			"REG-001", ForgeDiagnostic.ERROR, definition.stable_id,
			"Presentation source lifecycle is unclassified."))
	if definition.source_status.is_empty():
		diagnostics.append(_diagnostic(
			"SRC-001", ForgeDiagnostic.BLOCKER, definition.stable_id,
			"Presentation source status is missing."))
	var seen_aliases := {}
	for alias_id in definition.aliases:
		if not ForgeId.is_valid(alias_id) or alias_id == definition.stable_id \
				or seen_aliases.has(alias_id):
			diagnostics.append(_diagnostic(
				"REG-001", ForgeDiagnostic.ERROR, definition.stable_id,
				"Presentation alias is invalid, self-referential or duplicated."))
		seen_aliases[alias_id] = true
	for dependency_id in definition.dependency_ids:
		if dependency_id == definition.stable_id:
			diagnostics.append(_diagnostic(
				"REG-004", ForgeDiagnostic.ERROR, definition.stable_id,
				"Presentation source directly depends on itself."))


func _validate_profile(
		profile: ForgePresentationProfile,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if profile.component_ids.is_empty():
		diagnostics.append(_diagnostic(
			"REG-003", ForgeDiagnostic.WARNING, profile.stable_id,
			"Presentation profile has no component definitions."))
	if profile.critical_cue and profile.accessibility_profile_id.is_empty():
		diagnostics.append(_diagnostic(
			"ACC-001", ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER,
			profile.stable_id,
			"Critical presentation profile has no accessibility equivalent."))


func _validate_binding(
		binding: ForgePresentationBinding,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if binding.owner_id.is_empty() or binding.profile_id.is_empty():
		diagnostics.append(_diagnostic(
			"EVT-001", ForgeDiagnostic.ERROR, binding.stable_id,
			"Presentation binding owner or profile is missing."))
	if binding.event_contract_id.is_empty() \
			and binding.state_contract_id.is_empty():
		diagnostics.append(_diagnostic(
			"EVT-001", ForgeDiagnostic.ERROR, binding.stable_id,
			"Presentation binding declares neither an event nor state contract."))
	if binding.spatial_role_id.is_empty():
		diagnostics.append(_diagnostic(
			"SPT-001", ForgeDiagnostic.ERROR, binding.stable_id,
			"Presentation binding has no semantic spatial role."))


func _validate_event_contract(
		contract: ForgePresentationEventContract,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if contract.owner_system.is_empty() or contract.payload_fields.is_empty():
		diagnostics.append(_diagnostic(
			"EVT-001", ForgeDiagnostic.ERROR, contract.stable_id,
			"Event contract owner or payload schema is missing."))
	for field_id in contract.payload_fields:
		var field: Variant = contract.payload_fields[field_id]
		if not field is Dictionary or str(field.get("type", "")).is_empty():
			diagnostics.append(_diagnostic(
				"EVT-002", ForgeDiagnostic.ERROR, contract.stable_id,
				"Event payload field has no declared type."))


func _validate_state_contract(
		contract: ForgePresentationStateContract,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if contract.owner_system.is_empty() or contract.state_fields.is_empty():
		diagnostics.append(_diagnostic(
			"EVT-001", ForgeDiagnostic.ERROR, contract.stable_id,
			"State contract owner or typed state fields are missing."))


func _validate_parameter_contract(
		contract: ForgePresentationParameterContract,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if contract.value_type not in ["bool", "int", "float", "string", "vector3"]:
		diagnostics.append(_diagnostic(
			"EVT-002", ForgeDiagnostic.ERROR, contract.stable_id,
			"Parameter contract value type is unsupported."))
	if contract.value_type in ["int", "float"] \
			and contract.minimum_value > contract.maximum_value:
		diagnostics.append(_diagnostic(
			"EVT-002", ForgeDiagnostic.ERROR, contract.stable_id,
			"Parameter contract range is inverted."))


func _validate_context_schema(
		schema: ForgePresentationContextSchema,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if schema.field_definitions.is_empty():
		diagnostics.append(_diagnostic(
			"EVT-002", ForgeDiagnostic.ERROR, schema.stable_id,
			"Context schema contains no declared fields."))


func _validate_spatial_reference(
		reference: ForgeSpatialReference,
		semantic_registry: ForgeSemanticRegistry,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if reference.owner_asset_id.is_empty() \
			or reference.spatial_type not in ForgeSpatialReference.TYPES:
		diagnostics.append(_diagnostic(
			"SPT-001", ForgeDiagnostic.ERROR, reference.stable_id,
			"Spatial reference owner or type is invalid."))
	var prefix := str(SPATIAL_PREFIXES.get(reference.spatial_type, ""))
	if prefix.is_empty() \
			or not ForgeId.is_valid(reference.semantic_role_id, prefix):
		diagnostics.append(_diagnostic(
			"SPT-001", ForgeDiagnostic.ERROR, reference.stable_id,
			"Spatial reference semantic role does not match its type."))
	elif semantic_registry != null \
			and not semantic_registry.has(reference.semantic_role_id):
		diagnostics.append(_diagnostic(
			"SPT-001", ForgeDiagnostic.ERROR, reference.stable_id,
			"Spatial semantic role is not registered."))
	if reference.spatial_type == "path" and reference.point_records.size() < 2:
		diagnostics.append(_diagnostic(
			"SPT-001", ForgeDiagnostic.ERROR, reference.stable_id,
			"Spatial path requires at least two points."))
	if reference.fallback_reference_id == reference.stable_id \
			or reference.mirror_partner_id == reference.stable_id:
		diagnostics.append(_diagnostic(
			"REG-004", ForgeDiagnostic.ERROR, reference.stable_id,
			"Spatial fallback or mirror relationship is self-referential."))


func _validate_vfx_definition(
		definition: ForgeVfxDefinition,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if definition.graph_id.is_empty() or definition.maximum_instances <= 0:
		diagnostics.append(_diagnostic(
			"VFX-002", ForgeDiagnostic.ERROR, definition.stable_id,
			"VFX definition has no graph or a non-positive instance bound."))


func _validate_vfx_family(
		family: ForgeVfxFamily,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if family.default_graph_id.is_empty() or family.fallback_effect_id.is_empty():
		diagnostics.append(_diagnostic(
			"VFX-002", ForgeDiagnostic.ERROR, family.stable_id,
			"VFX family requires a default graph and fallback effect."))


func _validate_vfx_graph(
		graph: ForgeVfxGraph,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if graph.maximum_nodes <= 0 or graph.maximum_spawn_count <= 0 \
			or graph.maximum_lifetime_seconds <= 0.0 \
			or graph.nodes.size() > graph.maximum_nodes:
		diagnostics.append(_diagnostic(
			"VFX-002", ForgeDiagnostic.ERROR, graph.stable_id,
			"VFX graph has invalid or exceeded execution bounds."))
	var adjacency := {}
	for node in graph.nodes:
		var node_id := str(node.get("id", ""))
		if node_id.is_empty() or adjacency.has(node_id):
			diagnostics.append(_diagnostic(
				"REG-001", ForgeDiagnostic.ERROR, graph.stable_id,
				"VFX graph node ID is missing or duplicated."))
		else:
			adjacency[node_id] = []
	for edge in graph.edges:
		var from_id := str(edge.get("from", ""))
		var to_id := str(edge.get("to", ""))
		if not adjacency.has(from_id) or not adjacency.has(to_id):
			diagnostics.append(_diagnostic(
				"VFX-002", ForgeDiagnostic.ERROR, graph.stable_id,
				"VFX graph edge references an unknown node."))
		else:
			adjacency[from_id].append(to_id)
	if not graph.cycles_allowed and _has_cycle(adjacency):
		diagnostics.append(_diagnostic(
			"VFX-002", ForgeDiagnostic.ERROR, graph.stable_id,
			"VFX graph contains a forbidden cycle."))


func _validate_vfx_form(
		form: ForgeVfxForm,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if form.maximum_cells <= 0 or form.cell_records.size() > form.maximum_cells:
		diagnostics.append(_diagnostic(
			"VFX-001", ForgeDiagnostic.BLOCKER, form.stable_id,
			"Voxel VFX form is empty-bounded or exceeds its cell limit."))


func _validate_surface_layer(
		layer: ForgeSurfaceLayer,
		semantic_registry: ForgeSemanticRegistry,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if not layer.surface_mask_role_id.is_empty() and semantic_registry != null \
			and not semantic_registry.has(layer.surface_mask_role_id):
		diagnostics.append(_diagnostic(
			"SPT-001", ForgeDiagnostic.ERROR, layer.stable_id,
			"Surface layer mask role is not registered."))
	if layer.persistence_policy != "transient" \
			and layer.expiry_seconds <= 0.0 \
			and layer.maximum_records_per_chunk <= 0:
		diagnostics.append(_diagnostic(
			"VFX-004", ForgeDiagnostic.ERROR, layer.stable_id,
			"Persistent surface layer has no bounded expiry or record cap."))


func _validate_sound_event(
		event: ForgeSoundEvent,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if event.source_ids.is_empty() or event.maximum_voices <= 0:
		diagnostics.append(_diagnostic(
			"SND-001", ForgeDiagnostic.ERROR, event.stable_id,
			"Sound Event has no source or a non-positive voice bound."))
	if event.loop_policy not in ["one_shot", "managed_loop", "state_loop"]:
		diagnostics.append(_diagnostic(
			"SND-001", ForgeDiagnostic.ERROR, event.stable_id,
			"Sound Event loop policy is unsupported."))
	if event.loop_policy != "one_shot" and event.concurrency_group.is_empty():
		diagnostics.append(_diagnostic(
			"SND-001", ForgeDiagnostic.ERROR, event.stable_id,
			"Managed Sound Event loop has no concurrency group."))
	if event.critical_cue and event.caption_key.is_empty():
		diagnostics.append(_diagnostic(
			"SND-003", ForgeDiagnostic.ERROR, event.stable_id,
			"Critical Sound Event has no caption/equivalent routing key."))


func _validate_sound_source(
		source: ForgeSoundSource,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if source.source_status != "planned_new_work" \
			and (source.source_path.is_empty() or source.source_hash.is_empty()):
		diagnostics.append(_diagnostic(
			"SRC-001", ForgeDiagnostic.BLOCKER, source.stable_id,
			"Sound source media path or content hash is missing."))
	if source.lifecycle == "golden_source_candidate" \
			and source.rights_status not in ["owned", "licensed", "public_domain"]:
		diagnostics.append(_diagnostic(
			"LIC-001", ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER,
			source.stable_id,
			"Golden sound source rights are unresolved."))


func _validate_audio_family(
		family: ForgeAudioFamily,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if family.fallback_event_id.is_empty() \
			or family.pitch_range.x > family.pitch_range.y \
			or family.volume_range_db.x > family.volume_range_db.y:
		diagnostics.append(_diagnostic(
			"SND-001", ForgeDiagnostic.ERROR, family.stable_id,
			"Audio family fallback or variation range is invalid."))


func _validate_spatial_audio_profile(
		profile: ForgeSpatialAudioProfile,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if profile.maximum_distance_meters <= 0.0 \
			or profile.directionality < 0.0 or profile.directionality > 1.0 \
			or profile.reverb_send < 0.0 or profile.reverb_send > 1.0:
		diagnostics.append(_diagnostic(
			"SND-001", ForgeDiagnostic.ERROR, profile.stable_id,
			"Spatial audio profile contains an invalid bounded value."))


func _validate_material_response(
		table: ForgeMaterialResponseTable,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if table.default_profile_id.is_empty() \
			or table.material_fallback_order.is_empty():
		diagnostics.append(_diagnostic(
			"REG-003", ForgeDiagnostic.ERROR, table.stable_id,
			"Material response table has no safe fallback path."))


func _validate_acoustic_profile(
		profile: ForgeAcousticProfile,
		semantic_registry: ForgeSemanticRegistry,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if profile.transmission < 0.0 or profile.transmission > 1.0 \
			or profile.occlusion < 0.0 or profile.occlusion > 1.0:
		diagnostics.append(_diagnostic(
			"ACU-001", ForgeDiagnostic.ERROR, profile.stable_id,
			"Acoustic profile transmission or occlusion is out of range."))
	if semantic_registry != null:
		for role_id in profile.zone_role_ids:
			if not semantic_registry.has(role_id):
				diagnostics.append(_diagnostic(
					"ACU-001", ForgeDiagnostic.WARNING, profile.stable_id,
					"Acoustic zone role is not registered."))
		for role_id in profile.portal_role_ids:
			if not semantic_registry.has(role_id):
				diagnostics.append(_diagnostic(
					"ACU-001", ForgeDiagnostic.WARNING, profile.stable_id,
					"Acoustic portal role is not registered."))


func _validate_mix_snapshot(
		snapshot: ForgeMixSnapshot,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	for bus_id in snapshot.protected_bus_ids:
		if snapshot.bus_targets_db.has(bus_id) \
				and float(snapshot.bus_targets_db[bus_id]) < -40.0:
			diagnostics.append(_diagnostic(
				"ACU-002", ForgeDiagnostic.ERROR, snapshot.stable_id,
				"Mix snapshot can mask a protected critical bus."))


func _validate_budget_profile(
		profile: ForgePresentationBudgetProfile,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if profile.maximum_particles <= 0 or profile.maximum_voices <= 0 \
			or profile.maximum_lights <= 0 \
			or profile.maximum_surface_records <= 0 \
			or profile.maximum_updates_per_second <= 0:
		diagnostics.append(_diagnostic(
			"BUD-001", ForgeDiagnostic.ERROR, profile.stable_id,
			"Presentation budget profile has a missing or non-positive limit."))
	if profile.fallback_chain.is_empty():
		diagnostics.append(_diagnostic(
			"BUD-002", ForgeDiagnostic.ERROR, profile.stable_id,
			"Presentation budget has no declared fallback chain."))


func _validate_accessibility_profile(
		profile: ForgeAccessibilityProfile,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if not profile.critical_event_ids.is_empty() \
			and profile.equivalent_feedback.is_empty():
		diagnostics.append(_diagnostic(
			"ACC-001", ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER,
			profile.stable_id,
			"Critical accessibility profile has no equivalent feedback."))


func _validate_test_scenario(
		scenario: ForgePresentationTestScenario,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if scenario.fixture_ids.is_empty() or scenario.action_records.is_empty() \
			or scenario.expected_trace_records.is_empty():
		diagnostics.append(_diagnostic(
			"TST-001", ForgeDiagnostic.ERROR, scenario.stable_id,
			"Presentation test scenario is missing fixtures, actions or traces."))


func _has_cycle(adjacency: Dictionary) -> bool:
	var visiting := {}
	var visited := {}
	for node_id in adjacency:
		if _visit_cycle(str(node_id), adjacency, visiting, visited):
			return true
	return false


func _visit_cycle(
		node_id: String, adjacency: Dictionary,
		visiting: Dictionary, visited: Dictionary) -> bool:
	if visiting.has(node_id):
		return true
	if visited.has(node_id):
		return false
	visiting[node_id] = true
	for child_id in adjacency.get(node_id, []):
		if _visit_cycle(str(child_id), adjacency, visiting, visited):
			return true
	visiting.erase(node_id)
	visited[node_id] = true
	return false


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> ForgeDiagnostic:
	return ForgeDiagnostic.create(code, severity, target_id, message)
