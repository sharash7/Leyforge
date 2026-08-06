@tool
extends SceneTree
## Generates Golden Core VFX/audio/material runtime-candidate source records.

const ROOT := "res://content/forge/runtime/set23_stage4"
const LEGACY_SOUND_SOURCE := "sound.source.legacy.mining.stone.foundation"
const SPATIAL_AUDIO := "sound.spatial_profile.contact.near.foundation"
const BUDGET := "budget.profile.presentation.foundation"
const ACCESS := "access.profile.presentation.foundation"
const CONTEXT := "context.schema.presentation.foundation"

const SCENARIOS := [
	{"key": "mining", "display": "Mining", "contract": "event.block.mining_impact",
		"owner": "*", "spatial": "runtime_anchor.block.mining_impact",
		"action": "mining", "surface": "stone", "spawn": 18, "lifetime": 1.2,
		"loop": false, "light": 0, "surface_write": 2, "critical": false},
	{"key": "footsteps", "display": "Footsteps", "contract": "event.movement.foot_contact",
		"owner": "*", "spatial": "runtime_anchor.movement.foot_contact",
		"action": "footstep", "surface": "soil", "spawn": 8, "lifetime": 0.7,
		"loop": false, "light": 0, "surface_write": 1, "critical": false},
	{"key": "furnace_lifecycle", "display": "Furnace Lifecycle",
		"contract": "state.machine.furnace.foundation", "state": true,
		"owner": "block.machine.furnace", "spatial": "anchor.vfx.firebox",
		"action": "machine_operating", "surface": "metal", "spawn": 24,
		"lifetime": 4.0, "loop": true, "light": 1, "surface_write": 0,
		"critical": false},
	{"key": "mana_conduit", "display": "Mana Conduit",
		"contract": "event.magic.mana_conduit_pulse", "owner": "*",
		"spatial": "anchor.presentation.mana_origin", "action": "mana_flow",
		"surface": "arcane", "spawn": 20, "lifetime": 3.0, "loop": true,
		"light": 1, "surface_write": 0, "critical": false},
	{"key": "ward_warning", "display": "Ward Warning and Breach",
		"contract": "event.magic.ward_warning", "owner": "*",
		"spatial": "anchor.presentation.warning", "action": "ward_warning",
		"surface": "arcane", "spawn": 32, "lifetime": 1.8, "loop": false,
		"light": 1, "surface_write": 0, "critical": true},
	{"key": "rain_shelter", "display": "Rain and Shelter",
		"contract": "event.weather.rain_contact", "owner": "*",
		"spatial": "zone.weather.rain", "action": "rain_contact",
		"surface": "generic", "spawn": 48, "lifetime": 2.0, "loop": true,
		"light": 0, "surface_write": 8, "critical": false},
	{"key": "village_ambience", "display": "Village Ambience",
		"contract": "event.ambience.village_tick", "owner": "global",
		"spatial": "zone.audio.exterior", "action": "village_ambience",
		"surface": "generic", "spawn": 12, "lifetime": 6.0, "loop": true,
		"light": 0, "surface_write": 0, "critical": false},
	{"key": "goblin_raid", "display": "Goblin Raid",
		"contract": "event.raid.goblin_warning", "owner": "*",
		"spatial": "anchor.presentation.warning", "action": "raid_warning",
		"surface": "generic", "spawn": 36, "lifetime": 2.5, "loop": false,
		"light": 1, "surface_write": 0, "critical": true},
]

var _saved := 0
var _failures: Array[String] = []


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(ROOT))
	for scenario in SCENARIOS:
		_generate_scenario(scenario)
	_generate_material_table()
	print("SET23_STAGE4_RUNTIME_SOURCE_GENERATOR %s" % JSON.stringify({
		"ok": _failures.is_empty(), "saved": _saved,
		"scenario_count": SCENARIOS.size(), "failures": _failures}))
	quit(0 if _failures.is_empty() else 1)


func _generate_scenario(spec: Dictionary) -> void:
	var key := str(spec.key)
	var form := ForgeVfxForm.new()
	form.stable_id = "vfx.form.golden.%s.stage4" % key
	form.display_name = "%s Voxel Form" % spec.display
	form.form_kind = "voxel_cluster"
	form.cell_records = _cells_for(key)
	form.palette_role_ids = PackedStringArray(["material_role.foundation_primary"])
	form.maximum_cells = 32
	_source_candidate(form)

	var graph := ForgeVfxGraph.new()
	graph.stable_id = "vfx.graph.golden.%s.stage4" % key
	graph.display_name = "%s Bounded Graph" % spec.display
	graph.nodes = _graph_nodes(spec)
	graph.edges = _linear_edges(graph.nodes)
	graph.maximum_nodes = 16
	graph.maximum_spawn_count = int(spec.spawn)
	graph.maximum_lifetime_seconds = float(spec.lifetime)
	graph.backend_hint = "cpu_multimesh"
	_source_candidate(graph)

	var effect := ForgeVfxDefinition.new()
	effect.stable_id = "vfx.effect.golden.%s.stage4" % key
	effect.display_name = "%s Golden Core Effect" % spec.display
	effect.graph_id = graph.stable_id
	effect.form_ids = PackedStringArray([form.stable_id])
	effect.material_ids = PackedStringArray([
		"material.presentation.golden.%s" % key])
	effect.lifecycle_policy = "managed_loop" if bool(spec.loop) else "one_shot"
	effect.maximum_instances = int(spec.spawn)
	effect.lod_tiers = [{"tier": "near", "spawn_scale": 1.0},
		{"tier": "mid", "spawn_scale": 0.5},
		{"tier": "far", "spawn_scale": 0.2},
		{"tier": "hidden", "spawn_scale": 0.0, "virtualise": true}]
	effect.budget_profile_id = BUDGET
	effect.accessibility_profile_id = ACCESS
	effect.dependency_ids = PackedStringArray([
		graph.stable_id, form.stable_id, BUDGET, ACCESS])
	effect.fallback_ids = PackedStringArray([
		"legacy.runtime.vfx.%s" % key])
	_source_candidate(effect)

	var sound := ForgeSoundEvent.new()
	sound.stable_id = "sound.event.golden.%s.stage4" % key
	sound.display_name = "%s Golden Core Sound" % spec.display
	sound.source_ids = PackedStringArray([LEGACY_SOUND_SOURCE])
	sound.layer_records = [{"role": "legacy_active_fallback",
		"source_id": LEGACY_SOUND_SOURCE, "gain_db": 0.0,
		"provenance_review": "open"}]
	sound.variation_policy = "seeded_round_robin"
	sound.loop_policy = "managed_loop" if bool(spec.loop) else "one_shot"
	sound.concurrency_group = "golden.%s" % key
	sound.maximum_voices = 2 if bool(spec.loop) else 8
	sound.spatial_audio_profile_id = SPATIAL_AUDIO
	sound.caption_key = "caption.golden.%s" % key
	sound.critical_cue = bool(spec.critical)
	sound.dependency_ids = PackedStringArray([LEGACY_SOUND_SOURCE, SPATIAL_AUDIO])
	sound.fallback_ids = PackedStringArray(["legacy.runtime.audio.%s" % key])
	_source_candidate(sound)

	if str(spec.contract) not in ["event.block.mining_impact",
			"event.movement.foot_contact", "state.machine.furnace.foundation"]:
		var event := ForgePresentationEventContract.new()
		event.stable_id = spec.contract
		event.display_name = "%s Event" % spec.display
		event.owner_system = "presentation_golden_core"
		event.payload_fields = _payload_fields()
		event.required_context_fields = PackedStringArray([
			"position", "target_material", "intensity"])
		event.allowed_outputs = PackedStringArray(["vfx", "audio", "surface"])
		event.accessibility_importance = "critical" if bool(spec.critical) else "standard"
		event.dependency_ids = PackedStringArray([CONTEXT])
		_source_candidate(event)
		_save(event, "%s/event_%s.tres" % [ROOT, key])

	var profile := ForgePresentationProfile.new()
	profile.stable_id = "presentation.profile.golden.%s.stage4" % key
	profile.display_name = "%s Runtime Profile" % spec.display
	profile.allowed_contract_ids = PackedStringArray([spec.contract])
	profile.required_context_fields = PackedStringArray([
		"position", "target_material", "intensity"])
	profile.component_ids = {"vfx": effect.stable_id, "audio": sound.stable_id}
	profile.spatial_role_ids = PackedStringArray([spec.spatial])
	profile.channels = PackedStringArray([
		"persistent_state" if bool(spec.loop) else "temporary_event"])
	profile.budget_profile_id = BUDGET
	profile.accessibility_profile_id = ACCESS
	profile.priority = 200 if bool(spec.critical) else 100
	profile.critical_cue = bool(spec.critical)
	profile.dependency_ids = PackedStringArray([
		effect.stable_id, sound.stable_id, BUDGET, ACCESS])
	profile.fallback_ids = PackedStringArray([
		"legacy.runtime.profile.%s" % key])
	_source_candidate(profile)

	var binding := ForgePresentationBinding.new()
	binding.stable_id = "presentation.binding.golden.%s.stage4" % key
	binding.display_name = "%s Runtime Binding" % spec.display
	binding.owner_id = spec.owner
	if bool(spec.get("state", false)):
		binding.state_contract_id = spec.contract
		binding.channel = "persistent_state"
	else:
		binding.event_contract_id = spec.contract
	binding.profile_id = profile.stable_id
	binding.spatial_role_id = spec.spatial
	binding.parameter_mappings = [{"source": "intensity", "target": "intensity",
		"input_min": 0.0, "input_max": 1.0, "output_min": 0.0,
		"output_max": 1.0, "policy": "clamp", "quantisation_steps": 256}]
	binding.priority = profile.priority
	binding.dependency_ids = PackedStringArray([
		spec.contract, profile.stable_id, spec.spatial])
	_source_candidate(binding)

	var scenario := ForgePresentationTestScenario.new()
	scenario.stable_id = "test.presentation.golden.%s.stage4" % key
	scenario.display_name = "%s Golden Core Scenario" % spec.display
	scenario.fixture_ids = PackedStringArray([
		effect.stable_id, sound.stable_id, profile.stable_id])
	scenario.action_records = [{"action": "publish_contract",
		"contract_id": spec.contract, "seed": 23004},
		{"action": "advance", "seconds": minf(float(spec.lifetime), 1.0)},
		{"action": "stop", "required": bool(spec.loop)}]
	scenario.expected_trace_records = [{"kind": "dispatch", "count": 2},
		{"kind": "unbounded_instances", "maximum": 0},
		{"kind": "legacy_fallback_active", "expected": true}]
	scenario.quality_tiers = PackedStringArray(["full", "reduced", "aggregated",
		"critical_only"])
	scenario.accessibility_modes = PackedStringArray([
		"default", "reduced_motion", "audio_muted", "captions"])
	scenario.duration_seconds = maxf(1.0, float(spec.lifetime))
	scenario.manual_review_status = "open"
	scenario.dependency_ids = scenario.fixture_ids
	_source_candidate(scenario)

	_save(form, "%s/vfx_form_%s.tres" % [ROOT, key])
	_save(graph, "%s/vfx_graph_%s.tres" % [ROOT, key])
	_save(effect, "%s/vfx_effect_%s.tres" % [ROOT, key])
	_save(sound, "%s/sound_event_%s.tres" % [ROOT, key])
	_save(profile, "%s/presentation_profile_%s.tres" % [ROOT, key])
	_save(binding, "%s/presentation_binding_%s.tres" % [ROOT, key])
	_save(scenario, "%s/test_scenario_%s.tres" % [ROOT, key])


func _generate_material_table() -> void:
	var table := ForgeMaterialResponseTable.new()
	table.stable_id = "material.presentation.response.golden_core.stage4"
	table.display_name = "Golden Core Material Responses"
	for spec in SCENARIOS:
		table.response_records.append({"action": spec.action,
			"target_family": spec.surface,
			"profile_id": "presentation.profile.golden.%s.stage4" % spec.key,
			"intensity_band": "standard", "wetness_band": "any",
			"environment": "any", "state": "any"})
	table.material_fallback_order = PackedStringArray([
		"exact", "target_family", "hard", "soft", "generic"])
	table.default_profile_id = "presentation.profile.golden.mining.stage4"
	var dependencies: Array[String] = []
	for spec in SCENARIOS:
		dependencies.append("presentation.profile.golden.%s.stage4" % spec.key)
	table.dependency_ids = PackedStringArray(dependencies)
	_source_candidate(table)
	_save(table, "%s/material_response_golden_core.tres" % ROOT)


func _graph_nodes(spec: Dictionary) -> Array[Dictionary]:
	var nodes: Array[Dictionary] = [
		{"id": "spawn", "type": "bounded_spawn", "maximum": int(spec.spawn)},
		{"id": "initialise", "type": "initialise", "seeded": true,
			"lifetime_seconds": float(spec.lifetime)},
	]
	if str(spec.key) in ["mana_conduit", "ward_warning"]:
		nodes.append({"id": "path", "type": "path_sample", "maximum_points": 16})
	if str(spec.key) in ["rain_shelter", "village_ambience"]:
		nodes.append({"id": "volume", "type": "bounded_volume", "maximum_cells": 32})
	nodes.append({"id": "integrate", "type": "cpu_integrate", "maximum_steps": 120})
	if int(spec.light) > 0:
		nodes.append({"id": "light", "type": "light_request", "maximum": int(spec.light)})
	if int(spec.surface_write) > 0:
		nodes.append({"id": "surface", "type": "surface_write",
			"maximum": int(spec.surface_write)})
	nodes.append({"id": "output", "type": "voxel_multimesh_output"})
	return nodes


func _linear_edges(nodes: Array[Dictionary]) -> Array[Dictionary]:
	var edges: Array[Dictionary] = []
	for index in range(nodes.size() - 1):
		edges.append({"from": nodes[index].id, "to": nodes[index + 1].id})
	return edges


func _cells_for(key: String) -> Array[Dictionary]:
	var cells: Array[Dictionary] = []
	var count := 4 if key in ["mining", "footsteps"] else 8
	for index in count:
		cells.append({"position": [index % 2, index / 2, 0],
			"palette_role": "material_role.foundation_primary"})
	return cells


func _payload_fields() -> Dictionary:
	return {"position": {"type": "vector3", "required": true},
		"normal": {"type": "vector3", "required": true},
		"target_material": {"type": "string", "required": true},
		"intensity": {"type": "float", "required": true,
			"min": 0.0, "max": 1.0}}


func _source_candidate(source: ForgePresentationDefinition) -> void:
	source.lifecycle = "golden_source_candidate"
	source.source_status = "validated_runtime_source"
	source.rights_status = "not_applicable"
	source.provenance = {"document_set": "23", "milestone": "4",
		"manual_review": "open", "legacy_replacement_status": "active_fallback"}


func _save(resource: Resource, path: String) -> void:
	var error := ResourceSaver.save(resource, path)
	if error == OK:
		_saved += 1
	else:
		_failures.append("Failed to save %s: %s" % [path, error_string(error)])
