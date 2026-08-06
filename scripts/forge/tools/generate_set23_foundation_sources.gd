@tool
extends SceneTree
## Generates the small, reviewable Set 23 schema fixture library.

const ROOT := "res://content/forge/presentation/set23/foundation"

var _saved := 0
var _failures: Array[String] = []


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(ROOT))
	_generate_contracts()
	_generate_spatial()
	_generate_vfx()
	_generate_audio()
	_generate_resolution_and_evidence()
	_generate_pack_manifest()
	print("SET23_FOUNDATION_SOURCE_GENERATOR %s" % JSON.stringify({
		"ok": _failures.is_empty(),
		"saved": _saved,
		"failures": _failures,
	}))
	quit(0 if _failures.is_empty() else 1)


func _generate_contracts() -> void:
	var context := ForgePresentationContextSchema.new()
	_common(context, "context.schema.presentation.foundation",
		"Foundation Presentation Context")
	context.field_definitions = {
		"position": {"type": "vector3", "required": true},
		"normal": {"type": "vector3", "required": false},
		"target_material": {"type": "string", "required": true},
		"intensity": {"type": "float", "required": true, "min": 0.0,
			"max": 1.0},
		"wetness": {"type": "float", "required": false, "min": 0.0,
			"max": 1.0},
		"acoustic_zone": {"type": "string", "required": false},
	}
	context.required_groups = PackedStringArray([
		"identity", "materials", "spatial"])
	_save(context)

	var event := ForgePresentationEventContract.new()
	_common(event, "event.block.mining_impact", "Mining Impact")
	event.owner_system = "block_interaction"
	event.payload_fields = {
		"position": {"type": "vector3", "required": true},
		"normal": {"type": "vector3", "required": true},
		"target_material": {"type": "string", "required": true},
		"intensity": {"type": "float", "required": true, "min": 0.0,
			"max": 1.0},
	}
	event.required_context_fields = PackedStringArray([
		"position", "target_material", "intensity"])
	event.allowed_outputs = PackedStringArray(["vfx", "audio", "surface"])
	event.dependency_ids = PackedStringArray([context.stable_id])
	_save(event)

	var state := ForgePresentationStateContract.new()
	_common(state, "state.machine.furnace.foundation", "Furnace State")
	state.owner_system = "automation"
	state.state_fields = {
		"active": {"type": "bool"},
		"heat_ratio": {"type": "float", "min": 0.0, "max": 1.0},
		"blocked": {"type": "bool"},
	}
	_save(state)

	var parameter := ForgePresentationParameterContract.new()
	_common(parameter, "parameter.machine.heat_ratio", "Machine Heat Ratio")
	parameter.value_type = "float"
	parameter.minimum_value = 0.0
	parameter.maximum_value = 1.0
	parameter.default_value = 0.0
	parameter.mapping_policy = "clamp"
	parameter.smoothing_policy = "bounded_lerp"
	_save(parameter)

	var profile := ForgePresentationProfile.new()
	_common(profile, "presentation.profile.contact.mining.stone.foundation",
		"Stone Mining Foundation Profile")
	profile.allowed_contract_ids = PackedStringArray([event.stable_id])
	profile.required_context_fields = event.required_context_fields
	profile.component_ids = {
		"vfx": "vfx.effect.contact.mining.stone.foundation",
		"audio": "sound.event.contact.mining.stone.foundation",
	}
	profile.spatial_role_ids = PackedStringArray([
		"runtime_anchor.block.mining_impact"])
	profile.channels = PackedStringArray(["temporary_event"])
	profile.budget_profile_id = "budget.profile.presentation.foundation"
	profile.accessibility_profile_id = "access.profile.presentation.foundation"
	profile.dependency_ids = PackedStringArray([
		"vfx.effect.contact.mining.stone.foundation",
		"sound.event.contact.mining.stone.foundation",
		profile.budget_profile_id,
		profile.accessibility_profile_id,
	])
	_save(profile)

	var binding := ForgePresentationBinding.new()
	_common(binding, "presentation.binding.block.mining.stone.foundation",
		"Stone Mining Foundation Binding")
	binding.owner_id = "block.stone"
	binding.event_contract_id = event.stable_id
	binding.profile_id = profile.stable_id
	binding.spatial_role_id = "runtime_anchor.block.mining_impact"
	binding.conditions = {"target_material": "stone"}
	binding.parameter_mappings = [{
		"source": "intensity", "target": "intensity", "policy": "clamp"}]
	binding.dependency_ids = PackedStringArray([
		event.stable_id, profile.stable_id,
		"spatial.reference.runtime.mining_impact",
	])
	_save(binding)


func _generate_spatial() -> void:
	var chimney := ForgeSpatialReference.new()
	_common(chimney, "spatial.reference.furnace.chimney",
		"Foundation Furnace Chimney")
	chimney.aliases = PackedStringArray([
		"presentation.spatial.definition.furnace.chimney"])
	chimney.owner_asset_id = "building.production.stone_furnace"
	chimney.spatial_type = "socket"
	chimney.semantic_role_id = "socket.vfx.chimney"
	chimney.mapping_mode = "feature_bound"
	chimney.local_position = Vector3(0.0, 1.5, 0.0)
	chimney.required_status = "required_for_approval"
	chimney.approximation_policy = "owner_center_at_far_lod"
	chimney.lod_mappings = [{
		"tier": "far", "quality": "approximate",
		"role_id": "anchor.presentation.center"}]
	_save(chimney)

	var impact := ForgeSpatialReference.new()
	_common(impact, "spatial.reference.runtime.mining_impact",
		"Runtime Mining Impact")
	impact.owner_asset_id = "runtime.block_interaction"
	impact.spatial_type = "runtime_anchor"
	impact.semantic_role_id = "runtime_anchor.block.mining_impact"
	impact.coordinate_space = "world_runtime"
	impact.mapping_mode = "authoritative_event_contact"
	impact.required_status = "required_for_event"
	_save(impact)


func _generate_vfx() -> void:
	var graph := ForgeVfxGraph.new()
	_common(graph, "vfx.graph.template.burst.foundation",
		"Bounded Burst Graph")
	graph.nodes = [
		{"id": "spawn", "type": "bounded_spawn", "maximum": 12},
		{"id": "output", "type": "voxel_multimesh_output"},
	]
	graph.edges = [{"from": "spawn", "to": "output"}]
	graph.maximum_nodes = 8
	graph.maximum_spawn_count = 32
	graph.maximum_lifetime_seconds = 3.0
	_save(graph)

	var form := ForgeVfxForm.new()
	_common(form, "vfx.form.debris.stone.foundation",
		"Stone Debris Foundation Form")
	form.form_kind = "voxel_cluster"
	form.cell_records = [
		{"position": [0, 0, 0], "palette_role": "stone_primary"},
		{"position": [1, 0, 0], "palette_role": "stone_accent"},
	]
	form.palette_role_ids = PackedStringArray([
		"material_role.foundation_primary"])
	form.maximum_cells = 16
	_save(form)

	var effect := ForgeVfxDefinition.new()
	_common(effect, "vfx.effect.contact.mining.stone.foundation",
		"Stone Mining Foundation Effect")
	effect.graph_id = graph.stable_id
	effect.family_definition_id = "vfx.family.debris.stone"
	effect.form_ids = PackedStringArray([form.stable_id])
	effect.material_ids = PackedStringArray([
		"material.dna.entity.stone_carved_stone"])
	effect.maximum_instances = 32
	effect.lod_tiers = [
		{"tier": "near", "spawn_scale": 1.0},
		{"tier": "far", "spawn_scale": 0.25},
	]
	effect.budget_profile_id = "budget.profile.presentation.foundation"
	effect.accessibility_profile_id = "access.profile.presentation.foundation"
	effect.dependency_ids = PackedStringArray([
		graph.stable_id, form.stable_id, effect.budget_profile_id,
		effect.accessibility_profile_id,
	])
	_save(effect)

	var family := ForgeVfxFamily.new()
	_common(family, "vfx.family.debris.stone", "Stone Debris Family")
	family.default_graph_id = graph.stable_id
	family.default_form_ids = PackedStringArray([form.stable_id])
	family.bounded_parameters = {
		"intensity": {"min": 0.0, "max": 1.0},
		"spawn_count": {"min": 1, "max": 32},
	}
	family.fallback_effect_id = effect.stable_id
	family.dependency_ids = PackedStringArray([graph.stable_id, form.stable_id])
	_save(family)

	var surface := ForgeSurfaceLayer.new()
	_common(surface, "surface.layer.environment.wetness.foundation",
		"Bounded Wetness Surface")
	surface.surface_mask_role_id = "mask.surface.wetness"
	surface.persistence_policy = "bounded_persistent"
	surface.expiry_seconds = 3600.0
	surface.maximum_records_per_chunk = 64
	surface.merge_policy = "merge_by_owner_face"
	surface.save_policy = "v17_optional_record"
	_save(surface)


func _generate_audio() -> void:
	var source := ForgeSoundSource.new()
	_common(source, "sound.source.legacy.mining.stone.foundation",
		"Legacy Stone Mining Source")
	source.lifecycle = "active_fallback"
	source.source_status = "legacy_fallback_inventory"
	source.source_path = "legacy://runtime/mining_stone"
	source.source_hash = source.source_path.sha256_text()
	source.rights_status = "legacy_runtime_unverified"
	source.provenance = {
		"classification": "existing_runtime_fallback",
		"manual_rights_review": "open",
	}
	_save(source)

	var spatial := ForgeSpatialAudioProfile.new()
	_common(spatial, "sound.spatial_profile.contact.near.foundation",
		"Near Contact Spatial Audio")
	spatial.maximum_distance_meters = 24.0
	spatial.attenuation_model = "inverse_distance"
	spatial.occlusion_policy = "single_query_fallback"
	spatial.virtualisation_policy = "stop_one_shot"
	_save(spatial)

	var event := ForgeSoundEvent.new()
	_common(event, "sound.event.contact.mining.stone.foundation",
		"Stone Mining Foundation Sound Event")
	event.source_ids = PackedStringArray([source.stable_id])
	event.layer_records = [{
		"source_id": source.stable_id,
		"role": "contact_body",
		"gain_db": 0.0,
	}]
	event.maximum_voices = 8
	event.concurrency_group = "contact.mining"
	event.spatial_audio_profile_id = spatial.stable_id
	event.dependency_ids = PackedStringArray([
		source.stable_id, spatial.stable_id])
	_save(event)

	var family := ForgeAudioFamily.new()
	_common(family, "sound.family.contact.mining.stone",
		"Stone Mining Audio Family")
	family.default_spatial_profile_id = spatial.stable_id
	family.intensity_bands = [
		{"id": "light", "minimum": 0.0, "maximum": 0.49},
		{"id": "heavy", "minimum": 0.5, "maximum": 1.0},
	]
	family.pitch_range = Vector2(0.94, 1.06)
	family.volume_range_db = Vector2(-3.0, 0.0)
	family.concurrency_defaults = {"maximum_voices": 8}
	family.fallback_event_id = event.stable_id
	family.dependency_ids = PackedStringArray([
		spatial.stable_id, event.stable_id])
	_save(family)


func _generate_resolution_and_evidence() -> void:
	var budget := ForgePresentationBudgetProfile.new()
	_common(budget, "budget.profile.presentation.foundation",
		"Presentation Foundation Budget")
	budget.maximum_particles = 256
	budget.maximum_voices = 32
	budget.maximum_lights = 8
	budget.maximum_surface_records = 256
	budget.maximum_updates_per_second = 120
	budget.fallback_chain = PackedStringArray([
		"full", "reduced", "aggregated", "critical_only"])
	budget.critical_reserve = {"voices": 4, "lights": 1, "particles": 16}
	_save(budget)

	var accessibility := ForgeAccessibilityProfile.new()
	_common(accessibility, "access.profile.presentation.foundation",
		"Presentation Foundation Accessibility")
	accessibility.caption_key = "presentation.caption.mining_impact"
	accessibility.directional_indicator_id = "ui.indicator.contact"
	accessibility.critical_event_ids = PackedStringArray([
		"event.block.mining_impact"])
	accessibility.equivalent_feedback = {
		"audio_muted": "ui.indicator.contact",
		"reduced_motion": "vfx.effect.contact.mining.stone.foundation",
		"reduced_flash": "vfx.effect.contact.mining.stone.foundation",
	}
	_save(accessibility)

	var response := ForgeMaterialResponseTable.new()
	_common(response, "material.presentation.response.foundation",
		"Foundation Material Response")
	response.response_records = [{
		"target_family": "stone",
		"action": "mining",
		"profile_id": "presentation.profile.contact.mining.stone.foundation",
	}]
	response.material_fallback_order = PackedStringArray([
		"exact", "target_family", "hard", "generic"])
	response.default_profile_id = (
		"presentation.profile.contact.mining.stone.foundation")
	response.dependency_ids = PackedStringArray([response.default_profile_id])
	_save(response)

	var acoustic := ForgeAcousticProfile.new()
	_common(acoustic, "acoustic.profile.room.workshop.foundation",
		"Workshop Acoustic Foundation")
	acoustic.zone_role_ids = PackedStringArray([
		"zone.audio.workshop_interior"])
	acoustic.portal_role_ids = PackedStringArray([
		"portal.audio.front_door"])
	acoustic.reverb_profile_id = "audio.reverb.workshop.foundation"
	acoustic.transmission = 0.35
	acoustic.occlusion = 0.4
	_save(acoustic)

	var snapshot := ForgeMixSnapshot.new()
	_common(snapshot, "audio.snapshot.workshop.foundation",
		"Workshop Mix Foundation")
	snapshot.bus_targets_db = {
		"audio.bus.environment": -4.0,
		"audio.bus.machine": -1.0,
		"audio.bus.critical": 0.0,
	}
	snapshot.protected_bus_ids = PackedStringArray(["audio.bus.critical"])
	_save(snapshot)

	var scenario := ForgePresentationTestScenario.new()
	_common(scenario, "test.presentation.mining_impact.foundation",
		"Mining Impact Foundation Scenario")
	scenario.fixture_ids = PackedStringArray([
		"presentation.binding.block.mining.stone.foundation",
		"presentation.profile.contact.mining.stone.foundation",
	])
	scenario.action_records = [{
		"event_id": "event.block.mining_impact",
		"seed": 23001,
		"payload": {"target_material": "stone", "intensity": 0.75},
	}]
	scenario.expected_trace_records = [{
		"profile_id": "presentation.profile.contact.mining.stone.foundation",
		"spatial_role_id": "runtime_anchor.block.mining_impact",
	}]
	scenario.quality_tiers = PackedStringArray(["full", "reduced"])
	scenario.accessibility_modes = PackedStringArray([
		"default", "reduced_motion", "audio_muted"])
	scenario.duration_seconds = 5.0
	scenario.dependency_ids = scenario.fixture_ids
	_save(scenario)


func _generate_pack_manifest() -> void:
	var pack := ForgeContentPackManifest.new()
	pack.pack_id = "pack.presentation.leyforge.foundation"
	pack.display_name = "Leyforge Presentation Foundation"
	pack.version = "0.1.0"
	pack.priority = 230
	pack.enabled_by_default = false
	pack.provenance_note = (
		"Set 23 foundation contracts only; no runtime or production approval.")
	pack.subject_type = "presentation_content_pack"
	pack.target_id = pack.pack_id
	pack.lifecycle = "foundation"
	pack.contract_version = ForgePresentationDefinition.CONTRACT_VERSION
	pack.replacement_strategy = "additive"
	pack.fallback = "active_legacy_runtime"
	pack.removal_gate = "explicit_pack_migration"
	pack.override_policy = "declared_only"
	pack.required_contract_versions = {
		"set22": "22-stage1-v1",
		"set23": ForgePresentationDefinition.CONTRACT_VERSION,
	}
	var schemas := ForgeSchemaRegistry.new().filtered_list("presentation")
	for record in schemas:
		pack.provided_schema_ids.append(str(record.get("id", "")))
	var directory := DirAccess.open(ROOT)
	if directory != null:
		directory.list_dir_begin()
		var entry := directory.get_next()
		while not entry.is_empty():
			if not directory.current_is_dir() and entry.ends_with(".tres"):
				var resource := ResourceLoader.load(
					ROOT.path_join(entry), "", ResourceLoader.CACHE_MODE_IGNORE)
				if resource is ForgePresentationDefinition:
					pack.asset_ids.append(resource.stable_id)
			entry = directory.get_next()
		directory.list_dir_end()
	pack.asset_ids.sort()
	var target_path := "res://content/forge/presentation/set23/golden_core_targets.json"
	var parsed: Variant = JSON.parse_string(
		FileAccess.get_file_as_string(target_path))
	if parsed is Dictionary:
		for records in parsed.get("libraries", {}).values():
			for record in records:
				pack.presentation_asset_ids.append(str(record.get("stable_id", "")))
	pack.presentation_asset_ids.sort()
	var path := "res://content/forge/presentation/set23/%s.tres" % (
		ForgeId.safe_filename(pack.pack_id))
	var error := ResourceSaver.save(pack, path)
	if error == OK:
		_saved += 1
	else:
		_failures.append("%s:%s" % [pack.pack_id, error])


func _common(
		definition: ForgePresentationDefinition,
		stable_id: String, display_name: String) -> void:
	definition.stable_id = stable_id
	definition.display_name = display_name
	definition.lifecycle = "foundation"
	definition.source_status = "validated_foundation_contract"
	definition.rights_status = "not_applicable"
	definition.provenance = {
		"document_set": "23",
		"production_status": "foundation_only",
		"manual_review": "open",
	}


func _save(definition: ForgePresentationDefinition) -> void:
	var path := ROOT.path_join(
		"%s.tres" % ForgeId.safe_filename(definition.stable_id))
	var error := ResourceSaver.save(definition, path)
	if error == OK:
		_saved += 1
	else:
		_failures.append("%s:%s" % [definition.stable_id, error])
