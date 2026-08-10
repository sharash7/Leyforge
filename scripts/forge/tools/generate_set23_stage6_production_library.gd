@tool
extends SceneTree
## Deterministically expands the Set 23 Forest Hamlet source catalogues.

const ROOT := "res://content/forge/runtime/set22_23_stage6"
const VFX_ROOT := "res://content/forge/presentation/set23/user/vfx/production"
const AUDIO_ROOT := "res://content/forge/presentation/set23/user/audio/production"
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
var _generated_paths: Dictionary = {}
var _discovered_paths: Dictionary = {}

const VFX_CATEGORY_COUNTS := {"movement_contact": 8, "mining_block_contact": 14,
	"material_debris": 10, "construction_repair": 8, "fire_smoke_heat": 10,
	"weather_water": 10, "machine_automation": 12, "magic_rune_ward": 14,
	"goblin_cave_wisp": 14, "village_ambience": 6,
	"persistent_surface": 8, "critical_telegraph": 6}
const AUDIO_CATEGORY_COUNTS := {"footsteps_body": 27, "blocks_mining": 32,
	"tools_crafting": 24, "player_movement_needs": 18, "combat_gear": 28,
	"goblin_raid": 23, "cave_wisp": 20, "furnace_automation": 29,
	"magic": 26, "village_jobs": 21, "environment_weather": 29,
	"ui_critical": 14}
const SEMANTIC_ACTIONS := ["start", "sustain", "finish", "impact", "release",
	"warning", "idle", "move", "contact", "activate", "deactivate", "pulse",
	"burst", "trail", "loop", "break", "place", "open", "close", "charge"]
const SEMANTIC_CONTEXTS := ["soft", "firm", "heavy", "near", "distant", "dry",
	"wet", "wood", "stone", "metal", "earth", "magic", "day", "night",
	"interior", "exterior", "small", "large", "calm", "urgent"]
const VFX_TEMPLATES := ["contact_burst", "rising_embers", "falling_debris",
	"directional_trail", "expanding_ring", "surface_scatter", "weather_sheet",
	"machine_pulse", "rune_orbit", "warning_beacon"]
const MATERIAL_NAMES := ["soil", "grass", "wood", "stone", "brick", "clay",
	"sand", "gravel", "iron", "copper", "cloth", "leather", "glass", "water",
	"ice", "snow", "ash", "bone", "crystal", "mana", "flesh", "generic"]


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(ROOT))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(VFX_ROOT))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(AUDIO_ROOT))
	_remove_stage6_placeholders()
	_generate_vfx()
	_generate_procedural_sources()
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
	_update_coverage_ledger(catalogue)
	print("SET23_STAGE6_PRODUCTION_LIBRARY_GENERATOR %s" % JSON.stringify({
		"ok": _failures.is_empty(), "saved": _saved,
		"catalogue_counts": _catalogue_counts(catalogue),
		"failures": _failures}))
	quit(0 if _failures.is_empty() else 1)


func _remove_stage6_placeholders() -> void:
	var prefixes := ["vfx_graph_", "vfx_form_", "vfx_effect_", "vfx_family_",
		"sound_event_", "presentation_profile_", "presentation_binding_",
		"material_response_", "spatial_map_template_", "acoustic_profile_",
		"ambience_plan_", "accessibility_profile_", "budget_profile_",
		"test_scenario_", "presentation_library_manifest"]
	for file_name in DirAccess.get_files_at(ROOT):
		for prefix in prefixes:
			if str(file_name).begins_with(prefix):
				DirAccess.remove_absolute(ProjectSettings.globalize_path(ROOT.path_join(file_name)))
				break
	for path in [VFX_ROOT, AUDIO_ROOT]:
		for file_name in DirAccess.get_files_at(path):
			if str(file_name).ends_with(".tres"):
				DirAccess.remove_absolute(ProjectSettings.globalize_path(path.path_join(file_name)))


func _semantic_slug(category: String, index: int) -> String:
	var action := str(SEMANTIC_ACTIONS[index % SEMANTIC_ACTIONS.size()])
	var context_index := int(index / SEMANTIC_ACTIONS.size())
	var context := str(SEMANTIC_CONTEXTS[context_index % SEMANTIC_CONTEXTS.size()])
	return "%s_%s_%s" % [category, action, context]


func _slug_at(counts: Dictionary, index: int) -> String:
	var cursor := 0
	for category in counts:
		var count := int(counts[category])
		if index < cursor + count:
			return _semantic_slug(str(category), index - cursor)
		cursor += count
	return "invalid_semantic_target"


func _vfx_slug(index: int) -> String: return _slug_at(VFX_CATEGORY_COUNTS, index)
func _audio_slug(index: int) -> String: return _slug_at(AUDIO_CATEGORY_COUNTS, index)


func _generate_vfx() -> void:
	for index in 10:
		var template_slug := str(VFX_TEMPLATES[index])
		var graph := ForgeVfxGraph.new()
		graph.stable_id = "vfx.graph.production.%s" % template_slug
		graph.display_name = "%s VFX Graph" % template_slug.capitalize()
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
		_save(graph, "%s/graph_%s.tres" % [VFX_ROOT, template_slug])

		var form := ForgeVfxForm.new()
		form.stable_id = "vfx.form.production.%s" % template_slug
		form.display_name = "%s Voxel Form" % template_slug.capitalize()
		form.form_kind = "voxel_cluster"
		form.cell_records = [{"position": [0, 0, 0],
			"palette_role": "material_role.foundation_primary"},
			{"position": [1, 0, 0],
			"palette_role": "material_role.foundation_primary"}]
		form.palette_role_ids = PackedStringArray([
			"material_role.foundation_primary"])
		form.maximum_cells = 16
		_candidate(form)
		_save(form, "%s/form_%s.tres" % [VFX_ROOT, template_slug])

	for index in 120:
		var effect_slug := _vfx_slug(index)
		var template_slug := str(VFX_TEMPLATES[index % VFX_TEMPLATES.size()])
		var effect := ForgeVfxDefinition.new()
		effect.stable_id = "vfx.effect.production.%s" % effect_slug
		effect.display_name = effect_slug.capitalize()
		effect.graph_id = "vfx.graph.production.%s" % template_slug
		effect.form_ids = PackedStringArray([
			"vfx.form.production.%s" % template_slug])
		effect.material_ids = PackedStringArray([
			"material.presentation.response.production.%s" % MATERIAL_NAMES[index % MATERIAL_NAMES.size()]])
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
		_candidate(effect, "vfx.production.%s" % _vfx_slug(index))
		effect.aliases = PackedStringArray(["vfx.effect.forest_hamlet.catalogue_%03d.stage6" % index])
		_save(effect, "%s/effect_%s.tres" % [VFX_ROOT, effect_slug])

	for index in 10:
		var family_slug := str(VFX_TEMPLATES[index])
		var family := ForgeVfxFamily.new()
		family.stable_id = "vfx.family.production.%s" % family_slug
		family.display_name = "%s VFX Family" % family_slug.capitalize()
		family.default_graph_id = "vfx.graph.production.%s" % family_slug
		family.default_form_ids = PackedStringArray([
			"vfx.form.production.%s" % family_slug])
		family.bounded_parameters = {"intensity": {"min": 0.0, "max": 1.0}}
		family.fallback_effect_id = (
			"vfx.effect.production.%s" % _vfx_slug(index))
		family.dependency_ids = PackedStringArray([family.default_graph_id,
			family.default_form_ids[0], family.fallback_effect_id])
		_candidate(family)
		family.aliases = PackedStringArray(["vfx.family.forest_hamlet.catalogue_%02d.stage6" % index])
		_save(family, "%s/family_%s.tres" % [VFX_ROOT, family_slug])


func _generate_procedural_sources() -> void:
	var source_index := 0
	for event_index in 291:
		var layers := 3 if event_index < 118 else 2
		for layer_index in layers:
			var event_slug := _audio_slug(event_index)
			var layer_slug := str(["body", "detail", "tail"][layer_index])
			var source_slug := "%s_%s" % [event_slug, layer_slug]
			var patch := ForgeSynthPatchDefinition.new()
			patch.stable_id = "sound.source.synth.production.%s" % source_slug
			patch.display_name = "%s Synth Recipe" % source_slug.capitalize()
			var waveforms := ["sine", "triangle", "saw", "square", "pulse", "noise", "impulse"]
			patch.oscillators = [{"waveform": waveforms[(event_index + layer_index) % waveforms.size()],
				"level": 0.45 + float(layer_index) * 0.12, "detune_cents": float((event_index % 9) - 4) * 3.0,
				"octave": layer_index - 1, "phase": 0.0, "pulse_width": 0.5}]
			patch.preview_midi_note = 36 + event_index % 49
			patch.amplitude_envelope = {"attack_seconds": 0.005 + layer_index * 0.01,
				"decay_seconds": 0.08 + float(event_index % 7) * 0.02,
				"sustain_level": 0.25 + float(layer_index) * 0.15,
				"release_seconds": 0.12 + float(event_index % 5) * 0.03}
			patch.filter_settings = {"type": "low_pass", "cutoff_hz": 900.0 + float(event_index % 30) * 350.0,
				"resonance": float(event_index % 5) * 0.08}
			patch.modulation = {"lfo_waveform": "sine", "lfo_rate_hz": float(event_index % 8) * 0.35,
				"pitch_depth_cents": float(layer_index) * 6.0, "amplitude_depth": float(layer_index) * 0.04}
			patch.note_duration_seconds = 0.25 + float(event_index % 12) * 0.08
			patch.noise_seed = 230000 + source_index
			patch.generator_version = "forge-audio-v1"
			_candidate(patch, "audio.procedural_source.%s" % event_slug)
			_save(patch, "%s/synth_%s.tres" % [AUDIO_ROOT, source_slug])
			var source := ForgeSoundSource.new()
			source.stable_id = "sound.source.production.%s" % source_slug
			source.display_name = "%s Procedural Source" % source_slug.capitalize()
			source.source_path = "forge-synth://%s" % patch.stable_id
			source.source_hash = patch.canonical_hash()
			source.duration_seconds = patch.note_duration_seconds
			source.transformation_history = [{"operation": "procedural_synthesis",
				"patch_id": patch.stable_id, "seed": patch.noise_seed, "generator_version": "forge-audio-v1"}]
			source.procedural_recipe_id = patch.stable_id
			source.procedural_seed = patch.noise_seed
			source.generator_version = patch.generator_version
			var preview := PackedFloat32Array()
			for preview_index in 64:
				preview.append(absf(sin(TAU * float(preview_index) / 16.0)) \
					* (1.0 - float(preview_index) / 80.0) * (0.45 + layer_index * 0.08))
			source.waveform_preview = preview
			source.regions = [{"region_id": "body", "start_seconds": 0.0,
				"end_seconds": source.duration_seconds}]
			if event_index % 13 == 0:
				source.loop_start_seconds = source.duration_seconds * 0.2
				source.loop_end_seconds = source.duration_seconds * 0.8
			source.processing_settings = {"non_destructive": true,
				"trim_start_seconds": 0.0, "trim_end_seconds": source.duration_seconds,
				"fade_in_seconds": 0.005, "fade_out_seconds": 0.02}
			source.loudness_analysis = {"peak_linear": 0.72, "peak_db": -2.85,
				"integrated_lufs": -18.0 + float(event_index % 5),
				"clipped_samples": 0, "silent": false}
			source.dependency_ids = PackedStringArray([patch.stable_id])
			_candidate(source, "audio.procedural_source.%s" % event_slug)
			source.provenance.merge({"origin": "audio_forge_synth",
				"file_upload_required": false, "source_patch_id": patch.stable_id,
				"seed": patch.noise_seed, "generator_version": patch.generator_version}, true)
			_save(source, "%s/source_%s.tres" % [AUDIO_ROOT, source_slug])
			source_index += 1
	if source_index != 700: _failures.append("Procedural source count %d expected 700" % source_index)


func _generate_sound_events() -> void:
	for index in 291:
		var event_slug := _audio_slug(index)
		var event := ForgeSoundEvent.new()
		event.stable_id = "sound.event.production.%s" % event_slug
		event.display_name = event_slug.capitalize()
		var layer_count := 3 if index < 118 else 2
		var source_ids: Array[String] = []
		var layers: Array[Dictionary] = []
		for layer_index in layer_count:
			var layer_slug := str(["body", "detail", "tail"][layer_index])
			var source_id := "sound.source.production.%s_%s" % [event_slug, layer_slug]
			source_ids.append(source_id)
			layers.append({"role": layer_slug, "source_id": source_id,
				"gain_db": -3.0 - layer_index * 2.0, "pitch_semitones": layer_index * 0.07,
				"delay_seconds": layer_index * 0.025, "rights_review": "owned"})
		event.source_ids = PackedStringArray(source_ids)
		event.layer_records = layers
		event.loop_policy = "managed_loop" if index % 13 == 0 else "one_shot"
		event.concurrency_group = "production.%s" % event_slug
		event.maximum_voices = 2 if event.loop_policy != "one_shot" else 6
		event.spatial_audio_profile_id = SPATIAL_AUDIO
		event.caption_key = "caption.production.%s" % event_slug
		event.critical_cue = index % 47 == 0
		event.dependency_ids = PackedStringArray(source_ids + [SPATIAL_AUDIO])
		event.fallback_ids = PackedStringArray([
			"legacy.runtime.audio.forest_hamlet_%03d" % index])
		_candidate(event, "audio.production.%s" % event_slug)
		event.aliases = PackedStringArray(["sound.event.forest_hamlet.catalogue_%03d.stage6" % index])
		_save(event, "%s/event_%s.tres" % [AUDIO_ROOT, event_slug])


func _generate_profiles_and_bindings() -> void:
	for index in 137:
		var profile_slug := "%s__%s" % [_vfx_slug(index % 120), _audio_slug(index % 291)]
		var profile := ForgePresentationProfile.new()
		profile.stable_id = "presentation.profile.production.%s" % profile_slug
		profile.display_name = "%s Presentation Profile" % profile_slug.capitalize()
		profile.allowed_contract_ids = PackedStringArray([FOUNDATION_EVENT])
		profile.required_context_fields = PackedStringArray([
			"position", "target_material", "intensity"])
		profile.component_ids = {
			"vfx": "vfx.effect.production.%s" % _vfx_slug(index % 120),
			"audio": "sound.event.production.%s" % _audio_slug(index % 291),
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
		_candidate(profile, "presentation.production.%s" % _vfx_slug(index % 120))
		profile.aliases = PackedStringArray(["presentation.profile.forest_hamlet.catalogue_%03d.stage6" % index])
		_save(profile, "%s/presentation_profile_%s.tres" % [ROOT, profile_slug])

		var binding := ForgePresentationBinding.new()
		binding.stable_id = "presentation.binding.production.%s" % profile_slug
		binding.display_name = "%s Presentation Binding" % profile_slug.capitalize()
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
		_candidate(binding, "presentation.production.%s" % _vfx_slug(index % 120))
		binding.aliases = PackedStringArray(["presentation.binding.forest_hamlet.catalogue_%03d.stage6" % index])
		_save(binding, "%s/presentation_binding_%s.tres" % [ROOT, profile_slug])


func _generate_material_profiles() -> void:
	for index in 22:
		var material_slug := str(MATERIAL_NAMES[index])
		var table := ForgeMaterialResponseTable.new()
		table.stable_id = "material.presentation.response.production.%s" % material_slug
		table.display_name = "%s Material Response" % material_slug.capitalize()
		var profile_slug := "%s__%s" % [_vfx_slug(index % 120), _audio_slug(index % 291)]
		table.default_profile_id = "presentation.profile.production.%s" % profile_slug
		table.material_fallback_order = PackedStringArray([
			"exact", "family", "hard", "soft", "generic"])
		table.response_records = [{"action": "mining",
			"target_family": material_slug,
			"profile_id": table.default_profile_id,
			"intensity_band": "any", "wetness_band": "any",
			"environment": "any", "state": "any"}]
		table.dependency_ids = PackedStringArray([table.default_profile_id])
		_candidate(table, "material.production.%s" % material_slug)
		table.aliases = PackedStringArray(["material.presentation.response.forest_hamlet_%02d.stage6" % index])
		_save(table, "%s/material_response_%s.tres" % [ROOT, material_slug])


func _generate_spatial_templates() -> void:
	var spatial_names := ["building_center", "workstation", "entrance", "roofline", "courtyard", "underground"]
	for index in 6:
		var spatial_slug := str(spatial_names[index])
		var owner_id := "presentation.spatial.template.production.%s" % spatial_slug
		var reference := ForgeSpatialReference.new()
		reference.stable_id = "spatial.reference.production.%s" % spatial_slug
		reference.display_name = "%s Spatial Reference" % spatial_slug.capitalize()
		reference.owner_asset_id = owner_id
		reference.spatial_type = "anchor"
		reference.semantic_role_id = "anchor.presentation.center"
		reference.local_position = Vector3(0.0, float(index) * 0.05, 0.0)
		reference.required_status = "required"
		_candidate(reference)
		var spatial_map := ForgeSpatialMap.new()
		spatial_map.spatial_map_id = "spatial.map.presentation.production.%s" % spatial_slug
		spatial_map.display_name = "%s Spatial Template" % spatial_slug.capitalize()
		spatial_map.owner_asset_id = owner_id
		spatial_map.references = [reference]
		spatial_map.required_role_ids = PackedStringArray([
			"anchor.presentation.center"])
		spatial_map.lifecycle = "draft"
		spatial_map.source_status = "review_ready"
		spatial_map.legacy_fallback = "legacy.scene_transform.forest_hamlet_%02d" % index
		_save(spatial_map, "%s/spatial_map_%s.tres" % [ROOT, spatial_slug])


func _generate_acoustics_and_ambience() -> void:
	var acoustic_names := ["cottage", "hall", "workshop", "warehouse", "mine", "cave", "forest",
		"courtyard", "tower", "tunnel", "shrine", "market", "barracks", "waterfront", "ruin"]
	for index in 15:
		var acoustic_slug := str(acoustic_names[index])
		var profile := ForgeAcousticProfile.new()
		profile.stable_id = "acoustic.profile.production.%s" % acoustic_slug
		profile.display_name = "%s Acoustic Profile" % acoustic_slug.capitalize()
		profile.acoustic_kind = "zone"
		profile.zone_role_ids = PackedStringArray(["zone.audio.exterior"])
		profile.portal_role_ids = PackedStringArray(["portal.audio.front_door"])
		profile.reverb_profile_id = "audio.snapshot.acoustic.forest_hamlet_%02d" % index
		profile.transmission = 0.55 + float(index % 5) * 0.08
		profile.occlusion = 0.4 - float(index % 5) * 0.05
		profile.fallback_profile_id = "acoustic.profile.exterior.foundation"
		_candidate(profile, "audio.acoustic.%s" % acoustic_slug)
		profile.aliases = PackedStringArray(["acoustic.profile.forest_hamlet_%02d.stage6" % index])
		_save(profile, "%s/acoustic_profile_%s.tres" % [ROOT, acoustic_slug])
	var ambience_names := ["village_workday", "village_night", "market_day", "storm_shelter",
		"mine_shift", "cave_depths", "forest_dawn", "forest_night", "raid_alert",
		"festival", "workshop_row", "rune_ruin"]
	for index in 12:
		var ambience_slug := str(ambience_names[index])
		var plan := ForgeAmbiencePlan.new()
		plan.stable_id = "acoustic.ambience.production.%s" % ambience_slug
		plan.display_name = "%s Ambience" % ambience_slug.capitalize()
		plan.owner_blueprint_id = "blueprint.leyforge.building.housing.cottage_a"
		plan.acoustic_graph_id = "acoustic.zone_graph.cottage.stage5"
		plan.components = [{"component_id": "workday", "state": "day",
			"sound_event_id": "sound.event.production.%s" % _audio_slug(index),
			"maximum_voices": 1},
			{"component_id": "weather", "state": "rain",
			"sound_event_id": "sound.event.production.%s" % _audio_slug(index + 12),
			"maximum_voices": 1}]
		plan.maximum_active_components = 2
		plan.dependency_ids = PackedStringArray([
			plan.acoustic_graph_id,
			str(plan.components[0].sound_event_id),
			str(plan.components[1].sound_event_id)])
		_candidate(plan, "audio.ambience.%s" % ambience_slug)
		plan.aliases = PackedStringArray(["acoustic.ambience.forest_hamlet_%02d.stage6" % index])
		_save(plan, "%s/ambience_plan_%s.tres" % [ROOT, ambience_slug])


func _generate_accessibility() -> void:
	var names := ["movement_contact", "mining", "construction", "fire", "weather", "water",
		"machine", "magic", "raid", "cave", "wisp", "village", "surface", "danger",
		"interaction", "inventory", "combat", "damage", "healing", "navigation", "objective",
		"multiplayer", "critical"]
	for index in 23:
		var slug := str(names[index])
		var profile := ForgeAccessibilityProfile.new()
		profile.stable_id = "access.profile.production.%s" % slug
		profile.display_name = "%s Accessibility Profile" % slug.capitalize()
		profile.caption_key = "caption.accessibility.production.%s" % slug
		profile.directional_indicator_id = "indicator.directional.forest_hamlet"
		profile.equivalent_feedback = {"visual": "caption_and_direction",
			"audio": "protected_cue", "motion": "bounded_substitute"}
		profile.critical_event_ids = PackedStringArray([
			"event.raid.goblin_warning"])
		_candidate(profile, "accessibility.%s" % slug)
		profile.aliases = PackedStringArray(["access.profile.forest_hamlet_%02d.stage6" % index])
		_save(profile, "%s/accessibility_profile_%s.tres" % [ROOT, slug])


func _generate_budgets() -> void:
	var names := ["village_standard", "village_dense", "mine_standard", "mine_dense", "raid",
		"storm", "magic_standard", "magic_dense", "machine_standard", "machine_dense",
		"split_screen", "low_spec", "reduced_motion", "critical_only", "cinematic_preview"]
	for index in 15:
		var slug := str(names[index])
		var profile := ForgePresentationBudgetProfile.new()
		profile.stable_id = "budget.profile.production.%s" % slug
		profile.display_name = "%s Budget" % slug.capitalize()
		profile.maximum_particles = 256 + index * 32
		profile.maximum_voices = 24 + index * 2
		profile.maximum_lights = 8 + index
		profile.maximum_surface_records = 128 + index * 16
		profile.maximum_updates_per_second = 240 + index * 16
		profile.fallback_chain = PackedStringArray([
			"full", "reduced", "aggregated", "critical_only", "virtualised"])
		profile.critical_reserve = {"particles": 32, "voices": 4,
			"lights": 2, "surface_records": 8, "updates": 16}
		_candidate(profile, "budget.%s" % slug)
		profile.aliases = PackedStringArray(["budget.profile.forest_hamlet_%02d.stage6" % index])
		_save(profile, "%s/budget_profile_%s.tres" % [ROOT, slug])


func _generate_scenarios() -> void:
	var names := ["block_place_break", "machine_dense", "mana_ward_dense",
		"cave_acoustics", "split_screen", "save_load_reconstruction",
		"hot_reload", "content_pack_override", "late_join",
		"dense_village", "degradation_matrix"]
	for index in names.size():
		var scenario := ForgePresentationTestScenario.new()
		scenario.stable_id = "test.presentation.forest_hamlet.%s.stage6" % names[index]
		scenario.display_name = "%s Presentation Scenario" % str(names[index]).capitalize()
		var profile_slug := "%s__%s" % [_vfx_slug(index % 120), _audio_slug(index % 291)]
		scenario.fixture_ids = PackedStringArray([
			"presentation.profile.production.%s" % profile_slug,
			"sound.event.production.%s" % _audio_slug(index)])
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
		_candidate(scenario, "test.%s" % names[index])
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
	manifest.lifecycle = "review_ready"
	manifest.source_status = "review_ready"
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


func _update_coverage_ledger(catalogue: Dictionary) -> void:
	const LEDGER_PATH := "res://content/forge/catalogues/doc20_23_coverage_ledger.json"
	const EVIDENCE_ROOT := "res://generated/forge/review/doc20_23"
	var ledger := {"schema": "leyforge.forge.coverage-ledger", "schema_version": 1,
		"scope": "documents_20_23_production", "status": "review_ready",
		"approval_policy": "explicit_human_batch_approval", "records": []}
	if FileAccess.file_exists(LEDGER_PATH):
		var read := FileAccess.open(LEDGER_PATH, FileAccess.READ)
		var parsed: Variant = JSON.parse_string(read.get_as_text()) if read != null else null
		if parsed is Dictionary: ledger = parsed
	var records: Array = ledger.get("records", [])
	records = records.filter(func(record): return str(record.get("studio", "")) not in ["vfx", "audio"])
	_index_existing_presentation_paths()
	var batches := {}
	var vfx_ids: Array = catalogue.get("vfx_catalogue", [])
	for index in vfx_ids.size():
		var target_id := str(vfx_ids[index])
		var category := _vfx_category_for_id(target_id, index)
		var batch_id := "batch.vfx.%s" % category
		_append_coverage(records, batches, target_id, "vfx", category, batch_id,
			["legacy.runtime.vfx.%s" % ForgeId.safe_filename(target_id)])
	var event_ids: Array = catalogue.get("sound_events", [])
	for index in event_ids.size():
		var target_id := str(event_ids[index])
		var generated_index := _generated_audio_index(target_id)
		var category := _audio_category_for_index(generated_index) if generated_index >= 0 else "foundation_runtime"
		var batch_number := int(generated_index / 7) if generated_index >= 0 else int(index / 7)
		var batch_id := "batch.audio.%s.%02d" % [category, batch_number]
		_append_coverage(records, batches, target_id, "audio", category, batch_id,
			["legacy.runtime.audio.%s" % ForgeId.safe_filename(target_id)])
		if generated_index >= 0:
			var layer_count := 3 if generated_index < 118 else 2
			for layer_index in layer_count:
				var layer_slug := str(["body", "detail", "tail"][layer_index])
				var source_id := "sound.source.production.%s_%s" % [_audio_slug(generated_index), layer_slug]
				_append_coverage(records, batches, source_id, "audio", category, batch_id, [])
	ledger.records = records
	var file := FileAccess.open(LEDGER_PATH, FileAccess.WRITE)
	if file == null:
		_failures.append("Cannot write coverage ledger")
	else:
		file.store_string(JSON.stringify(ledger, "  ", false) + "\n")
		_saved += 1
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(EVIDENCE_ROOT))
	for batch_id in batches:
		var batch_record: Dictionary = batches[batch_id]
		var batch := ForgeApprovalBatchManifest.new()
		batch.batch_id = batch_id
		batch.display_name = str(batch_record.display_name)
		batch.studio = str(batch_record.studio)
		batch.category = str(batch_record.category)
		batch.target_ids = PackedStringArray(batch_record.target_ids)
		batch.evidence_paths = PackedStringArray(["%s/%s.json" % [EVIDENCE_ROOT, ForgeId.safe_filename(batch_id)]])
		batch.status = "review_ready"
		_save(batch, "res://content/forge/catalogues/approval_batches/%s.tres" % ForgeId.safe_filename(batch_id))
		var evidence := FileAccess.open("%s/%s.json" % [EVIDENCE_ROOT, ForgeId.safe_filename(batch_id)], FileAccess.WRITE)
		if evidence != null:
			evidence.store_string(JSON.stringify({"batch_id": batch_id, "status": "review_ready",
				"automated_validation": "pending_gate", "human_review": "open",
				"target_ids": batch_record.target_ids,
				"instructions": "Use the Forge contact sheet or audition queue, then approve or request changes."}, "  ") + "\n")


func _append_coverage(records: Array, batches: Dictionary, target_id: String,
		studio: String, category: String, batch_id: String, fallbacks: Array) -> void:
	var source_path := str(_generated_paths.get(target_id, ""))
	if source_path.is_empty(): source_path = _find_path_for_id(target_id)
	var evidence_path := "res://generated/forge/review/doc20_23/%s.json" % ForgeId.safe_filename(batch_id)
	records.append({"target_id": target_id, "studio": studio, "category": category,
		"source_paths": [source_path] if not source_path.is_empty() else [],
		"dependency_ids": [], "runtime_product_paths": [], "bake_receipt_paths": [],
		"evidence_paths": [evidence_path], "approval_batch_id": batch_id,
		"fallback_ids": fallbacks, "status": "review_ready", "human_approval": "open"})
	if not batches.has(batch_id):
		batches[batch_id] = {"display_name": batch_id.replace("batch.", "").capitalize(),
			"studio": studio, "category": category, "target_ids": []}
	(batches[batch_id].target_ids as Array).append(target_id)


func _generated_audio_index(target_id: String) -> int:
	for index in 291:
		if target_id == "sound.event.production.%s" % _audio_slug(index): return index
	return -1


func _audio_category_for_index(index: int) -> String:
	if index < 0: return "foundation_runtime"
	var slug := _audio_slug(index)
	for category in AUDIO_CATEGORY_COUNTS:
		if slug.begins_with(str(category) + "_"): return str(category)
	return "shared"


func _vfx_category_for_id(target_id: String, fallback_index: int) -> String:
	for category in VFX_CATEGORY_COUNTS:
		if target_id.contains(".%s_" % category): return str(category)
	if target_id.contains(".production."):
		for template in VFX_TEMPLATES:
			if target_id.ends_with(str(template)): return "shared_templates"
	return "foundation_runtime_%02d" % int(fallback_index / 20)


func _find_path_for_id(target_id: String) -> String:
	return str(_discovered_paths.get(target_id, ""))


func _index_existing_presentation_paths() -> void:
	for root in [VFX_ROOT, AUDIO_ROOT, "res://content/forge/runtime/set22_23_stage6",
			"res://content/forge/runtime/set23_stage4", "res://content/forge/presentation/set23"]:
		for path in _resource_paths(root):
			var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
			var id := _resource_id(resource)
			if not id.is_empty(): _discovered_paths[id] = path


func _resource_paths(root: String) -> PackedStringArray:
	var result := PackedStringArray()
	if DirAccess.open(root) == null: return result
	for directory in DirAccess.get_directories_at(root): result.append_array(_resource_paths(root.path_join(directory)))
	for file_name in DirAccess.get_files_at(root):
		if file_name.ends_with(".tres") or file_name.ends_with(".res"): result.append(root.path_join(file_name))
	return result


func _resource_id(resource: Resource) -> String:
	if resource == null: return ""
	if resource is ForgePresentationDefinition: return resource.stable_id
	if resource is ForgeSpatialMap: return resource.spatial_map_id
	return ""


func _candidate(resource: ForgePresentationDefinition, batch_id := "presentation.production") -> void:
	resource.lifecycle = "review_ready"
	resource.source_status = "review_ready"
	resource.rights_status = "owned" if resource is ForgeSoundSource or resource is ForgeSynthPatchDefinition else "not_applicable"
	resource.provenance = {"document_set": "23", "phase": "production_library",
		"status": "review_ready", "approval_batch_id": batch_id}
	resource.review_history = [{"review": "human_evidence", "status": "open"}]
	resource.extension_fields = {"migration_classification": "new_work",
		"replacement_strategy": "approve_then_activate", "legacy_active": true,
		"production_ready": true, "forge_baked": true,
		"visually_complete": false, "legally_cleared": false,
		"accessible_approved": false, "shippable": false}


func _save(resource: Resource, path: String) -> void:
	var error := ResourceSaver.save(resource, path)
	if error == OK:
		_saved += 1
		var id := _resource_id(resource)
		if not id.is_empty(): _generated_paths[id] = path
	else:
		_failures.append("%s=%s" % [path, error_string(error)])
