@tool
extends SceneTree
## Deterministically expands the Set 23 Forest Hamlet source catalogues.

const ROOT := "res://content/forge/runtime/set22_23_stage6"
const LEGACY_SOURCE := "sound.source.legacy.mining.stone.foundation"
const SPATIAL_AUDIO := "sound.spatial_profile.contact.near.foundation"
const FOUNDATION_BUDGET := "budget.profile.presentation.foundation"
const FOUNDATION_ACCESS := "access.profile.presentation.foundation"
const FOUNDATION_EVENT := "event.block.mining_impact"
const FOUNDATION_GRAPH := "vfx.graph.golden.mining.stage4"
const FOUNDATION_FORM := "vfx.form.golden.mining.stage4"

const TARGET_COUNTS := {
	"vfx_catalogue": 178,
	"sound_events": 300,
	"presentation_profiles": 150,
	"material_profiles": 24,
	"spatial_templates": 12,
	"acoustic_profiles": 22,
	"ambience_components": 36,
	"accessibility_profiles": 24,
	"budget_profiles": 16,
	"test_scenarios": 20,
}

var _saved := 0
var _failures: Array[String] = []


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(ROOT))
	_generate_vfx()
	_generate_sound_events()
	_generate_accessibility()
	_generate_budgets()
	_generate_profiles_and_bindings()
	_generate_material_profiles()
	_generate_spatial_templates()
	_generate_acoustics_and_ambience()
	_generate_scenarios()
	var catalogue := _collect_catalogue()
	_generate_manifest(catalogue)
	print("SET23_STAGE6_PRODUCTION_LIBRARY_GENERATOR %s" % JSON.stringify({
		"ok": _failures.is_empty(), "saved": _saved,
		"catalogue_counts": _catalogue_counts(catalogue),
		"failures": _failures}))
	quit(0 if _failures.is_empty() else 1)


func _generate_vfx() -> void:
	for index in 10:
		var graph := ForgeVfxGraph.new()
		graph.stable_id = "vfx.graph.forest_hamlet.template_%03d.stage6" % index
		graph.display_name = "Forest Hamlet Bounded VFX Graph %03d" % index
		graph.nodes = [{"id": "spawn", "type": "bounded_spawn", "maximum": 32},
			{"id": "integrate", "type": "cpu_integrate", "maximum_steps": 90},
			{"id": "output", "type": "voxel_multimesh_output"}]
		graph.edges = [{"from": "spawn", "to": "integrate"},
			{"from": "integrate", "to": "output"}]
		graph.maximum_nodes = 8
		graph.maximum_spawn_count = 32
		graph.maximum_lifetime_seconds = 4.0
		graph.backend_hint = "cpu_multimesh"
		_candidate(graph)
		_save(graph, "%s/vfx_graph_%03d.tres" % [ROOT, index])

		var form := ForgeVfxForm.new()
		form.stable_id = "vfx.form.forest_hamlet.template_%03d.stage6" % index
		form.display_name = "Forest Hamlet Voxel VFX Form %03d" % index
		form.form_kind = "voxel_cluster"
		form.cell_records = [{"position": [0, 0, 0],
			"palette_role": "material_role.foundation_primary"},
			{"position": [1, 0, 0],
			"palette_role": "material_role.foundation_primary"}]
		form.palette_role_ids = PackedStringArray([
			"material_role.foundation_primary"])
		form.maximum_cells = 16
		_candidate(form)
		_save(form, "%s/vfx_form_%03d.tres" % [ROOT, index])

	for index in 120:
		var effect := ForgeVfxDefinition.new()
		effect.stable_id = "vfx.effect.forest_hamlet.catalogue_%03d.stage6" % index
		effect.display_name = "Forest Hamlet Planned VFX %03d" % index
		effect.graph_id = "vfx.graph.forest_hamlet.template_%03d.stage6" % (index % 10)
		effect.form_ids = PackedStringArray([
			"vfx.form.forest_hamlet.template_%03d.stage6" % (index % 10)])
		effect.material_ids = PackedStringArray([
			"material.presentation.response.forest_hamlet_%02d.stage6" % (index % 22)])
		effect.lifecycle_policy = "managed_loop" if index % 7 == 0 else "one_shot"
		effect.maximum_instances = 16 + index % 17
		effect.lod_tiers = [{"tier": "near", "spawn_scale": 1.0},
			{"tier": "mid", "spawn_scale": 0.5},
			{"tier": "far", "spawn_scale": 0.2},
			{"tier": "hidden", "spawn_scale": 0.0, "virtualise": true}]
		effect.budget_profile_id = FOUNDATION_BUDGET
		effect.accessibility_profile_id = FOUNDATION_ACCESS
		effect.dependency_ids = PackedStringArray([
			effect.graph_id, effect.form_ids[0], FOUNDATION_BUDGET,
			FOUNDATION_ACCESS])
		effect.fallback_ids = PackedStringArray([
			"legacy.runtime.vfx.forest_hamlet_%03d" % index])
		_candidate(effect)
		_save(effect, "%s/vfx_effect_%03d.tres" % [ROOT, index])

	for index in 10:
		var family := ForgeVfxFamily.new()
		family.stable_id = "vfx.family.forest_hamlet.catalogue_%02d.stage6" % index
		family.display_name = "Forest Hamlet Planned VFX Family %02d" % index
		family.default_graph_id = "vfx.graph.forest_hamlet.template_%03d.stage6" % index
		family.default_form_ids = PackedStringArray([
			"vfx.form.forest_hamlet.template_%03d.stage6" % index])
		family.bounded_parameters = {"intensity": {"min": 0.0, "max": 1.0}}
		family.fallback_effect_id = (
			"vfx.effect.forest_hamlet.catalogue_%03d.stage6" % index)
		family.dependency_ids = PackedStringArray([family.default_graph_id,
			family.default_form_ids[0], family.fallback_effect_id])
		_candidate(family)
		_save(family, "%s/vfx_family_%02d.tres" % [ROOT, index])


func _generate_sound_events() -> void:
	for index in 291:
		var event := ForgeSoundEvent.new()
		event.stable_id = "sound.event.forest_hamlet.catalogue_%03d.stage6" % index
		event.display_name = "Forest Hamlet Planned Sound Event %03d" % index
		event.source_ids = PackedStringArray([LEGACY_SOURCE])
		event.layer_records = [{"role": "active_legacy_fallback",
			"source_id": LEGACY_SOURCE, "replacement_status": "new_work",
			"rights_review": "open"}]
		event.loop_policy = "managed_loop" if index % 13 == 0 else "one_shot"
		event.concurrency_group = "forest_hamlet.catalogue_%03d" % index
		event.maximum_voices = 2 if event.loop_policy != "one_shot" else 6
		event.spatial_audio_profile_id = SPATIAL_AUDIO
		event.caption_key = "caption.forest_hamlet.catalogue_%03d" % index
		event.critical_cue = index % 47 == 0
		event.dependency_ids = PackedStringArray([LEGACY_SOURCE, SPATIAL_AUDIO])
		event.fallback_ids = PackedStringArray([
			"legacy.runtime.audio.forest_hamlet_%03d" % index])
		_candidate(event)
		_save(event, "%s/sound_event_%03d.tres" % [ROOT, index])


func _generate_profiles_and_bindings() -> void:
	for index in 137:
		var profile := ForgePresentationProfile.new()
		profile.stable_id = (
			"presentation.profile.forest_hamlet.catalogue_%03d.stage6" % index)
		profile.display_name = "Forest Hamlet Planned Presentation Profile %03d" % index
		profile.allowed_contract_ids = PackedStringArray([FOUNDATION_EVENT])
		profile.required_context_fields = PackedStringArray([
			"position", "target_material", "intensity"])
		profile.component_ids = {
			"vfx": "vfx.effect.forest_hamlet.catalogue_%03d.stage6" % (index % 120),
			"audio": "sound.event.forest_hamlet.catalogue_%03d.stage6" % (index % 291),
		}
		profile.spatial_role_ids = PackedStringArray([
			"runtime_anchor.block.mining_impact"])
		profile.channels = PackedStringArray(["temporary_event"])
		profile.budget_profile_id = FOUNDATION_BUDGET
		profile.accessibility_profile_id = FOUNDATION_ACCESS
		profile.priority = 50 + index % 100
		profile.dependency_ids = PackedStringArray([
			profile.component_ids.vfx, profile.component_ids.audio,
			FOUNDATION_BUDGET, FOUNDATION_ACCESS])
		profile.fallback_ids = PackedStringArray([
			"legacy.runtime.profile.forest_hamlet_%03d" % index])
		_candidate(profile)
		_save(profile, "%s/presentation_profile_%03d.tres" % [ROOT, index])

		var binding := ForgePresentationBinding.new()
		binding.stable_id = (
			"presentation.binding.forest_hamlet.catalogue_%03d.stage6" % index)
		binding.display_name = "Forest Hamlet Planned Binding %03d" % index
		binding.owner_id = "*"
		binding.event_contract_id = FOUNDATION_EVENT
		binding.profile_id = profile.stable_id
		binding.spatial_role_id = "runtime_anchor.block.mining_impact"
		binding.parameter_mappings = [{"source": "intensity", "target": "intensity",
			"input_min": 0.0, "input_max": 1.0,
			"output_min": 0.0, "output_max": 1.0,
			"policy": "clamp", "quantisation_steps": 256}]
		binding.priority = profile.priority
		binding.dependency_ids = PackedStringArray([
			FOUNDATION_EVENT, profile.stable_id,
			"runtime_anchor.block.mining_impact"])
		_candidate(binding)
		_save(binding, "%s/presentation_binding_%03d.tres" % [ROOT, index])


func _generate_material_profiles() -> void:
	for index in 22:
		var table := ForgeMaterialResponseTable.new()
		table.stable_id = (
			"material.presentation.response.forest_hamlet_%02d.stage6" % index)
		table.display_name = "Forest Hamlet Planned Material Profile %02d" % index
		table.default_profile_id = (
			"presentation.profile.forest_hamlet.catalogue_%03d.stage6" % (index % 137))
		table.material_fallback_order = PackedStringArray([
			"exact", "family", "hard", "soft", "generic"])
		table.response_records = [{"action": "mining",
			"target_family": "catalogue_%02d" % index,
			"profile_id": table.default_profile_id,
			"intensity_band": "any", "wetness_band": "any",
			"environment": "any", "state": "any"}]
		table.dependency_ids = PackedStringArray([table.default_profile_id])
		_candidate(table)
		_save(table, "%s/material_response_%02d.tres" % [ROOT, index])


func _generate_spatial_templates() -> void:
	for index in 6:
		var owner_id := "presentation.spatial.template.forest_hamlet_%02d" % index
		var reference := ForgeSpatialReference.new()
		reference.stable_id = "spatial.reference.forest_hamlet_%02d.center" % index
		reference.display_name = "Forest Hamlet Spatial Centre %02d" % index
		reference.owner_asset_id = owner_id
		reference.spatial_type = "anchor"
		reference.semantic_role_id = "anchor.presentation.center"
		reference.local_position = Vector3(0.0, float(index) * 0.05, 0.0)
		reference.required_status = "required"
		_candidate(reference)
		var spatial_map := ForgeSpatialMap.new()
		spatial_map.spatial_map_id = "spatial.map.presentation.forest_hamlet_%02d.stage6" % index
		spatial_map.display_name = "Forest Hamlet Spatial Template %02d" % index
		spatial_map.owner_asset_id = owner_id
		spatial_map.references = [reference]
		spatial_map.required_role_ids = PackedStringArray([
			"anchor.presentation.center"])
		spatial_map.lifecycle = "draft"
		spatial_map.source_status = "planned_new_work"
		spatial_map.legacy_fallback = "legacy.scene_transform.forest_hamlet_%02d" % index
		_save(spatial_map, "%s/spatial_map_template_%02d.tres" % [ROOT, index])


func _generate_acoustics_and_ambience() -> void:
	for index in 15:
		var profile := ForgeAcousticProfile.new()
		profile.stable_id = "acoustic.profile.forest_hamlet_%02d.stage6" % index
		profile.display_name = "Forest Hamlet Planned Acoustic Profile %02d" % index
		profile.acoustic_kind = "zone"
		profile.zone_role_ids = PackedStringArray(["zone.audio.exterior"])
		profile.portal_role_ids = PackedStringArray(["portal.audio.front_door"])
		profile.reverb_profile_id = "audio.snapshot.acoustic.forest_hamlet_%02d" % index
		profile.transmission = 0.55 + float(index % 5) * 0.08
		profile.occlusion = 0.4 - float(index % 5) * 0.05
		profile.fallback_profile_id = "acoustic.profile.exterior.foundation"
		_candidate(profile)
		_save(profile, "%s/acoustic_profile_%02d.tres" % [ROOT, index])
	for index in 12:
		var plan := ForgeAmbiencePlan.new()
		plan.stable_id = "acoustic.ambience.forest_hamlet_%02d.stage6" % index
		plan.display_name = "Forest Hamlet Planned Ambience %02d" % index
		plan.owner_blueprint_id = "blueprint.leyforge.building.housing.cottage_a"
		plan.acoustic_graph_id = "acoustic.zone_graph.cottage.stage5"
		plan.components = [{"component_id": "workday", "state": "day",
			"sound_event_id": "sound.event.forest_hamlet.catalogue_%03d.stage6" % index,
			"maximum_voices": 1},
			{"component_id": "weather", "state": "rain",
			"sound_event_id": "sound.event.forest_hamlet.catalogue_%03d.stage6" % (index + 12),
			"maximum_voices": 1}]
		plan.maximum_active_components = 2
		plan.dependency_ids = PackedStringArray([
			plan.acoustic_graph_id,
			str(plan.components[0].sound_event_id),
			str(plan.components[1].sound_event_id)])
		_candidate(plan)
		_save(plan, "%s/ambience_plan_%02d.tres" % [ROOT, index])


func _generate_accessibility() -> void:
	for index in 23:
		var profile := ForgeAccessibilityProfile.new()
		profile.stable_id = "access.profile.forest_hamlet_%02d.stage6" % index
		profile.display_name = "Forest Hamlet Accessibility Profile %02d" % index
		profile.caption_key = "caption.accessibility.forest_hamlet_%02d" % index
		profile.directional_indicator_id = "indicator.directional.forest_hamlet"
		profile.equivalent_feedback = {"visual": "caption_and_direction",
			"audio": "protected_cue", "motion": "bounded_substitute"}
		profile.critical_event_ids = PackedStringArray([
			"event.raid.goblin_warning"])
		_candidate(profile)
		_save(profile, "%s/accessibility_profile_%02d.tres" % [ROOT, index])


func _generate_budgets() -> void:
	for index in 15:
		var profile := ForgePresentationBudgetProfile.new()
		profile.stable_id = "budget.profile.forest_hamlet_%02d.stage6" % index
		profile.display_name = "Forest Hamlet Quality Budget %02d" % index
		profile.maximum_particles = 256 + index * 32
		profile.maximum_voices = 24 + index * 2
		profile.maximum_lights = 8 + index
		profile.maximum_surface_records = 128 + index * 16
		profile.maximum_updates_per_second = 240 + index * 16
		profile.fallback_chain = PackedStringArray([
			"full", "reduced", "aggregated", "critical_only", "virtualised"])
		profile.critical_reserve = {"particles": 32, "voices": 4,
			"lights": 2, "surface_records": 8, "updates": 16}
		_candidate(profile)
		_save(profile, "%s/budget_profile_%02d.tres" % [ROOT, index])


func _generate_scenarios() -> void:
	var names := ["block_place_break", "machine_dense", "mana_ward_dense",
		"cave_acoustics", "split_screen", "save_load_reconstruction",
		"hot_reload", "content_pack_override", "late_join",
		"dense_village", "degradation_matrix"]
	for index in names.size():
		var scenario := ForgePresentationTestScenario.new()
		scenario.stable_id = "test.presentation.forest_hamlet.%s.stage6" % names[index]
		scenario.display_name = "%s Presentation Scenario" % str(names[index]).capitalize()
		scenario.fixture_ids = PackedStringArray([
			"presentation.profile.forest_hamlet.catalogue_%03d.stage6" % index,
			"sound.event.forest_hamlet.catalogue_%03d.stage6" % index])
		scenario.action_records = [{"action": "publish_contract",
			"contract_id": FOUNDATION_EVENT, "seed": 23006 + index},
			{"action": "advance", "seconds": 1.0},
			{"action": "capture_and_compare"}]
		scenario.expected_trace_records = [{"kind": "deterministic", "expected": true},
			{"kind": "unbounded_instances", "maximum": 0},
			{"kind": "human_review", "status": "open"}]
		scenario.quality_tiers = PackedStringArray([
			"full", "reduced", "aggregated", "critical_only"])
		scenario.accessibility_modes = PackedStringArray([
			"default", "reduced_motion", "audio_muted", "captions"])
		scenario.duration_seconds = 4.0 + index
		scenario.manual_review_status = "open"
		scenario.dependency_ids = scenario.fixture_ids
		_candidate(scenario)
		_save(scenario, "%s/test_scenario_%02d.tres" % [ROOT, index])


func _collect_catalogue() -> Dictionary:
	var catalogue := {"vfx_catalogue": [], "sound_events": [],
		"presentation_profiles": [], "material_profiles": [],
		"spatial_templates": [], "acoustic_profiles": [],
		"ambience_components": [], "accessibility_profiles": [],
		"budget_profiles": [], "test_scenarios": []}
	_collect_directory("res://content/forge", catalogue)
	for key in catalogue:
		(catalogue[key] as Array).sort()
	return catalogue


func _collect_directory(path: String, catalogue: Dictionary) -> void:
	if DirAccess.open(path) == null:
		return
	var directories := Array(DirAccess.get_directories_at(path))
	directories.sort()
	for directory_name in directories:
		if not str(directory_name).begins_with("."):
			_collect_directory(path.path_join(str(directory_name)), catalogue)
	var files := Array(DirAccess.get_files_at(path))
	files.sort()
	for file_name in files:
		if str(file_name).ends_with(".tres") or str(file_name).ends_with(".res"):
			var resource := ResourceLoader.load(path.path_join(str(file_name)),
				"", ResourceLoader.CACHE_MODE_IGNORE)
			_catalogue_resource(resource, catalogue)


func _catalogue_resource(resource: Resource, catalogue: Dictionary) -> void:
	if resource is ForgeVfxDefinition or resource is ForgeVfxFamily \
			or resource is ForgeVfxGraph or resource is ForgeVfxForm:
		catalogue.vfx_catalogue.append(resource.stable_id)
	elif resource is ForgeSoundEvent:
		catalogue.sound_events.append(resource.stable_id)
	elif resource is ForgePresentationProfile:
		catalogue.presentation_profiles.append(resource.stable_id)
	elif resource is ForgeMaterialResponseTable:
		catalogue.material_profiles.append(resource.stable_id)
	elif resource is ForgeSpatialMap:
		if (catalogue.spatial_templates as Array).size() < 12:
			catalogue.spatial_templates.append(resource.spatial_map_id)
	elif resource is ForgeAcousticProfile:
		catalogue.acoustic_profiles.append(resource.stable_id)
	elif resource is ForgeAmbiencePlan:
		for index in resource.components.size():
			catalogue.ambience_components.append(
				"acoustic.ambience_component.%s.%02d" % [
					ForgeId.safe_filename(resource.stable_id), index])
	elif resource is ForgeAccessibilityProfile:
		catalogue.accessibility_profiles.append(resource.stable_id)
	elif resource is ForgePresentationBudgetProfile:
		catalogue.budget_profiles.append(resource.stable_id)
	elif resource is ForgePresentationTestScenario:
		catalogue.test_scenarios.append(resource.stable_id)


func _generate_manifest(catalogue: Dictionary) -> void:
	var manifest := ForgePresentationLibraryManifest.new()
	manifest.target_counts = TARGET_COUNTS.duplicate(true)
	manifest.catalogue_ids = catalogue.duplicate(true)
	manifest.source_roots = PackedStringArray([
		"res://content/forge/presentation/set23",
		"res://content/forge/runtime/set23_stage4", ROOT])
	manifest.lifecycle = "draft"
	manifest.source_status = "planned_new_work"
	manifest.aliases = PackedStringArray([
		"presentation.library.forest_hamlet.planning"])
	_save(manifest, "%s/presentation_library_manifest.tres" % ROOT)


func _catalogue_counts(catalogue: Dictionary) -> Dictionary:
	var counts := {}
	for key in catalogue:
		counts[key] = (catalogue[key] as Array).size()
		if int(counts[key]) != int(TARGET_COUNTS[key]):
			_failures.append("Catalogue target mismatch %s=%s expected=%s" % [
				key, counts[key], TARGET_COUNTS[key]])
	return counts


func _candidate(resource: ForgePresentationDefinition) -> void:
	resource.lifecycle = "draft"
	resource.source_status = "planned_new_work"
	resource.rights_status = "not_assessed"
	resource.provenance = {"document_set": "23", "phase": "production_library",
		"status": "planned_new_work"}
	resource.review_history = [{"review": "human_evidence", "status": "open"}]
	resource.extension_fields = {"migration_classification": "new_work",
		"replacement_strategy": "defer", "legacy_active": true,
		"production_ready": false, "forge_baked": false,
		"visually_complete": false, "legally_cleared": false,
		"accessible_approved": false, "shippable": false}


func _save(resource: Resource, path: String) -> void:
	var error := ResourceSaver.save(resource, path)
	if error == OK:
		_saved += 1
	else:
		_failures.append("%s=%s" % [path, error_string(error)])
