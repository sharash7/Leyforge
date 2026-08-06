extends Node
## Unified Set 22/23 Milestone 6 production-library and workflow gate.

const ROOT := "res://content/forge/runtime/set22_23_stage6"
const EXPECTED_CHECKS := 6113
const EXPECTED_HASH := "0446101c57324f157cc21925a18ac1a04dacf298edd7d3ecf0ff4ebee7740675"
const TARGETS := {
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
const ADVANCED := {
	"centipede_giant": ["entity.definition.creature.centipede_giant", 9,
		"travel_wave"],
	"bird_small": ["entity.definition.creature.bird_small", 8, "flight"],
	"dragon_scale_test": ["entity.definition.creature.dragon_scale_test", 12,
		"breath_charge"],
}
const DENSITY_PATHS := [
	"res://content/forge/entities/density_profiles/density_profile_entity_coarse.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_colossal_modular.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_fine.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_micro_accent.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_standard.tres",
]

var _checks := 0
var _failures: Array[String] = []
var _hashes: Array[String] = []
var _semantic := ForgeSemanticRegistry.new()
var _manifest_service := ForgeProjectManifestService.new()
var _index := ForgeAssetIndex.new()
var _library: ForgePresentationLibraryManifest
var _advanced_entities: Array[ForgeEntityDefinition] = []
var _advanced_rigs: Array[ForgeRigProfile] = []
var _advanced_maps: Array[ForgeSpatialMap] = []
var _advanced_assemblies: Array[ForgeEntityAssemblyProfile] = []
var _advanced_animations: Array[ForgeEntityAnimationLibrary] = []
var _accessibility: Array[ForgeAccessibilityProfile] = []
var _budgets: Array[ForgePresentationBudgetProfile] = []
var _scenarios: Array[ForgePresentationTestScenario] = []


func _ready() -> void:
	_verify_contract_registration()
	_load_and_roundtrip_sources()
	_verify_shared_index_and_library()
	_verify_advanced_body_runtime()
	_verify_atomic_registry()
	_verify_replication_and_listeners()
	_verify_stress_and_laboratory()
	_verify_workspace_and_ui()
	_verify_negative_cases()
	_hashes.sort()
	var deterministic_hash := ForgeStableRecord.hash_record({"hashes": _hashes})
	_check(deterministic_hash.length() == 64,
		"Milestone 6 deterministic aggregate is not SHA-256")
	if not EXPECTED_HASH.is_empty():
		_check(deterministic_hash == EXPECTED_HASH,
			"Milestone 6 deterministic aggregate hash drifted")
	if EXPECTED_CHECKS > 0:
		_check(_checks + 1 == EXPECTED_CHECKS,
			"pinned check count changed: expected %d, got %d" % [
				EXPECTED_CHECKS, _checks + 1])
	print("SET22_STAGE6_SET23_PRODUCTION_PROBE %s" % JSON.stringify({
		"ok": _failures.is_empty(), "checks": _checks,
		"failures": _failures, "deterministic_hash": deterministic_hash}))
	get_tree().quit(0 if _failures.is_empty() else 1)


func _verify_contract_registration() -> void:
	var schemas := ForgeSchemaRegistry.new()
	for schema_id in ["leyforge.forge.presentation-library-manifest",
			"leyforge.forge.runtime-registry-generation"]:
		_check(schemas.has(schema_id),
			"Milestone 6 schema is not registered: %s" % schema_id)
	_check(schemas.filtered_list("presentation_production").size() == 1,
		"presentation production schema count drifted")
	_check(schemas.filtered_list("presentation_runtime_registry").size() == 1,
		"runtime registry schema count drifted")
	var manifest_report := _manifest_service.load_and_validate()
	_check(bool(manifest_report.get("ok", false)),
		"shared Forge manifest rejected Milestone 6")
	_check(ROOT in _manifest_service.manifest.source_roots,
		"Milestone 6 source root is absent from the shared manifest")
	for feature in {"set22_stage6_advanced_bodies": "22-stage6-candidate-v1",
			"set23_production_library": "23-production-library-v1",
			"set23_runtime_registry": "23-runtime-registry-v1",
			"set23_multiplayer": "23-replication-v1",
			"set23_test_laboratory": "23-test-laboratory-v1"}:
		_check(str(_manifest_service.manifest.feature_contract_versions.get(
			feature, "")) == str({
			"set22_stage6_advanced_bodies": "22-stage6-candidate-v1",
			"set23_production_library": "23-production-library-v1",
			"set23_runtime_registry": "23-runtime-registry-v1",
			"set23_multiplayer": "23-replication-v1",
			"set23_test_laboratory": "23-test-laboratory-v1"}[feature]),
			"Milestone 6 feature contract is missing: %s" % feature)
	_check(_manifest_service.manifest.engine_feature == "4.6",
		"Godot project target changed during Milestone 6")
	_check(_manifest_service.manifest.rendering_method == "gl_compatibility",
		"renderer baseline changed during Milestone 6")
	_check(_manifest_service.manifest.generated_product_policy == "replaceable_output",
		"generated-product policy changed during Milestone 6")
	_check(_semantic.load_and_validate().get("ok", false),
		"shared semantic registry rejected advanced roles")
	for role_id in ["entity_role.centipede", "entity_role.bird",
			"entity_role.dragon", "anatomy.role.centipede.segment.006",
			"anatomy.role.avian.wing.left", "anatomy.role.avian.wing.right",
			"anatomy.role.dragon.neck.01", "anatomy.role.dragon.tail.02",
			"anatomy.role.dragon.wing.left", "anatomy.role.dragon.wing.right"]:
		_check(_semantic.has(role_id),
			"advanced semantic role is missing: %s" % role_id)


func _load_and_roundtrip_sources() -> void:
	var files := _resource_files(ROOT)
	_check(files.size() == 867, "Milestone 6 source count drifted")
	var temporary := "res://.summer/verification/.set22_23_stage6_roundtrip.tres"
	for path in files:
		var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(resource != null, "Milestone 6 source did not load: %s" % path)
		if resource == null:
			continue
		_check(resource.has_method("canonical_hash"),
			"Milestone 6 source is not hashable: %s" % path)
		if not resource.has_method("canonical_hash"):
			continue
		var source_hash := str(resource.call("canonical_hash"))
		_check(source_hash.length() == 64,
			"Milestone 6 source hash is invalid: %s" % path)
		var save_error := ResourceSaver.save(resource, temporary)
		_check(save_error == OK,
			"Milestone 6 source did not serialize: %s" % path)
		var restored := ResourceLoader.load(
			temporary, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(restored != null and restored.call("canonical_hash") == source_hash,
			"Milestone 6 source round-trip drifted: %s" % path)
		if FileAccess.file_exists(temporary):
			DirAccess.remove_absolute(ProjectSettings.globalize_path(temporary))
		_hashes.append(source_hash)
		_collect_source(resource)
	_check(_library != null, "production library manifest did not load")
	_check(_advanced_entities.size() == 3,
		"advanced entity source count drifted")
	_check(_advanced_rigs.size() == 3, "advanced rig source count drifted")
	_check(_advanced_maps.size() == 3,
		"advanced spatial-map source count drifted")
	_check(_advanced_assemblies.size() == 3,
		"advanced assembly source count drifted")
	_check(_advanced_animations.size() == 3,
		"advanced animation-library source count drifted")
	_check(_accessibility.size() == 23,
		"Stage 6 accessibility-source count drifted")
	_check(_budgets.size() == 15, "Stage 6 budget-source count drifted")
	_check(_scenarios.size() == 11, "Stage 6 scenario-source count drifted")


func _collect_source(resource: Resource) -> void:
	if resource is ForgePresentationLibraryManifest:
		_library = resource
	elif resource is ForgeEntityDefinition:
		_advanced_entities.append(resource)
	elif resource is ForgeRigProfile:
		_advanced_rigs.append(resource)
	elif resource is ForgeSpatialMap \
			and resource.spatial_map_id.begins_with("spatial.map.entity."):
		_advanced_maps.append(resource)
	elif resource is ForgeEntityAssemblyProfile:
		_advanced_assemblies.append(resource)
	elif resource is ForgeEntityAnimationLibrary:
		_advanced_animations.append(resource)
	elif resource is ForgeAccessibilityProfile:
		_accessibility.append(resource)
	elif resource is ForgePresentationBudgetProfile:
		_budgets.append(resource)
	elif resource is ForgePresentationTestScenario:
		_scenarios.append(resource)


func _verify_shared_index_and_library() -> void:
	var density := ForgeDensityProfileRegistry.new()
	_check(density.load_and_validate(DENSITY_PATHS).get("ok", false),
		"density registry rejected Milestone 6")
	var report := _index.load_and_validate(
		_manifest_service.manifest.source_roots, _semantic, density)
	_check(bool(report.get("ok", false)),
		"shared Forge index rejected Milestone 6: %s" % JSON.stringify(
			report.get("diagnostics", [])))
	_check(_index.has(_library.library_id),
		"production library is absent from the shared Forge index")
	_check(_index.resolve("presentation.library.forest_hamlet.planning").get(
		"source_id", "") == _library.library_id,
		"production library alias direction is invalid")
	var diagnostics := ForgeValidationService.new().\
		validate_presentation_library_source(_library)
	_check(diagnostics.is_empty(),
		"production library manifest did not validate")
	for key in TARGETS:
		var values: Array = _library.catalogue_ids.get(key, [])
		_check(int(_library.target_counts.get(key, -1)) == int(TARGETS[key]),
			"production library target drifted: %s" % key)
		_check(values.size() == int(TARGETS[key]),
			"production library membership drifted: %s" % key)
		var seen := {}
		for value in values:
			var source_id := str(value)
			_check(not seen.has(source_id),
				"production library contains duplicate membership: %s" % source_id)
			seen[source_id] = true
			if key != "ambience_components":
				_check(_index.has(source_id),
					"production library member does not resolve: %s" % source_id)
			else:
				_check(ForgeId.is_valid(source_id, "acoustic.ambience_component."),
					"ambience component identity is invalid: %s" % source_id)
	_check(_library.audio_source_planning_range == Vector2i(700, 1100)
		and not _library.audio_source_count_is_completion_gate,
		"audio-source planning guidance became a completion count")
	_check(_library.rights_policy == "verified_usable_rights_required",
		"production audio rights policy drifted")
	for gate in ["visual", "listening", "accessibility", "rights",
			"performance_tier", "owner"]:
		_check(str(_library.review_gates.get(gate, "")) == "open",
			"human evidence gate was closed without evidence: %s" % gate)


func _verify_advanced_body_runtime() -> void:
	var density := ForgeDensityProfileRegistry.new()
	density.load_and_validate(DENSITY_PATHS)
	var factory := ForgeRuntimeActorFactory.new()
	var report := factory.load_and_validate(
		_manifest_service.manifest.source_roots, _semantic, density)
	_check(bool(report.get("ok", false)),
		"actor factory rejected advanced bodies: %s" % JSON.stringify(
			report.get("diagnostics", [])))
	var animation := ForgeEntityAnimationRuntime.new()
	_check(animation.load_and_validate(_advanced_animations, _semantic).get(
		"ok", false), "animation runtime rejected advanced libraries")
	for key in ADVANCED:
		var spec: Array = ADVANCED[key]
		var entity_id := str(spec[0])
		_check(factory.has(entity_id), "advanced entity does not resolve: %s" % key)
		var actor := factory.create_actor(entity_id, "advanced:%s" % key)
		_check(actor != null, "advanced actor did not instantiate: %s" % key)
		if actor == null:
			continue
		add_child(actor)
		_check(_mesh_count(actor) == int(spec[1]),
			"advanced actor part/mesh count drifted: %s" % key)
		var snapshot := actor.snapshot()
		_check(snapshot.get("entity_definition_id", "") == entity_id,
			"advanced actor snapshot identity drifted: %s" % key)
		var restored := factory.reconstruct(snapshot)
		_check(restored != null and restored.pose_hash().length() == 64,
			"advanced actor did not reconstruct: %s" % key)
		if restored != null:
			restored.free()
		var library_id := "entity.animation_set.%s.stage6" % key
		_check(animation.bind_actor(actor, library_id),
			"advanced animation did not bind: %s" % key)
		_check(animation.play(actor.instance_id, str(spec[2]), true),
			"advanced semantic action is missing: %s" % key)
		var advanced_step := animation.advance(actor.instance_id, 0.7)
		_check(advanced_step.get("ok", false)
			and str(advanced_step.get("pose_hash", "")).length() == 64,
			"advanced semantic action did not advance: %s" % key)
		_check(animation.play(actor.instance_id, "walk", true),
			"advanced walk action is missing: %s" % key)
		var walk_step := animation.advance(actor.instance_id, 0.8)
		_check(walk_step.get("ok", false)
			and not walk_step.get("markers", []).is_empty(),
			"advanced contact marker did not emit: %s" % key)
		_hashes.append(actor.snapshot_hash())
		actor.free()


func _verify_atomic_registry() -> void:
	var first: Array[Dictionary] = [{"source_id": "presentation.profile.test.hot_reload",
		"schema": "leyforge.forge.presentation-profile",
		"contract_version": "23-foundation-v1",
		"foundation_kind": "presentation_profile",
		"aliases": ["presentation.profile.test.hot_reload.old"],
		"dependency_ids": [], "display_name": "Initial"}]
	var publisher := ForgeRuntimeRegistryPublisher.new()
	var initial := publisher.load_and_validate(first, 23006)
	_check(initial.get("ok", false) and initial.get("published", false),
		"initial registry generation was not atomically published")
	var initial_id := str(publisher.current_generation().generation_id)
	_check(publisher.has("presentation.profile.test.hot_reload.old")
		and publisher.resolve("presentation.profile.test.hot_reload.old").source_id \
			== "presentation.profile.test.hot_reload",
		"runtime registry alias did not resolve canonical direction")
	_check(publisher.filtered_list("presentation_profile").size() == 1,
		"runtime registry filtered list drifted")
	var second := first.duplicate(true)
	second[0]["display_name"] = "Candidate"
	second[0]["replacement_strategy"] = "preserve"
	var staged := publisher.stage(second, 23006)
	_check(staged.get("ok", false)
		and staged.compatibility.modified == ["presentation.profile.test.hot_reload"],
		"compatible registry delta was not staged")
	_check(publisher.current_generation().generation_id == initial_id,
		"staging mutated the published generation")
	var published := publisher.publish_staged()
	_check(published.get("ok", false)
		and publisher.resolve("presentation.profile.test.hot_reload").display_name \
			== "Candidate", "validated registry delta was not published")
	var candidate_id := str(publisher.current_generation().generation_id)
	_check(candidate_id != initial_id,
		"registry generation ID did not change with source content")
	var rollback := publisher.rollback()
	_check(rollback.get("ok", false)
		and publisher.current_generation().generation_id == initial_id
		and publisher.resolve("presentation.profile.test.hot_reload").display_name \
			== "Initial", "registry rollback did not restore known-good data")
	_hashes.append(str(published.get("generation_hash", "")))


func _verify_replication_and_listeners() -> void:
	var event := ResourceLoader.load(
		"res://content/forge/presentation/set23/foundation/event_block_mining_impact.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE) as ForgePresentationEventContract
	var state := ResourceLoader.load(
		"res://content/forge/presentation/set23/foundation/state_machine_furnace_foundation.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE) as ForgePresentationStateContract
	var replication := ForgePresentationReplicationService.new()
	var event_contracts: Array[ForgePresentationEventContract] = [event]
	var state_contracts: Array[ForgePresentationStateContract] = [state]
	_check(replication.load_and_validate(event_contracts, state_contracts).get("ok", false),
		"presentation replication contracts were rejected")
	_check(replication.has(event.stable_id) and replication.has(state.stable_id)
		and replication.filtered_list().size() == 2,
		"presentation replication lookup surface drifted")
	var event_record := {"contract_id": event.stable_id,
		"owner_instance_id": "player.01", "payload": {"intensity": 0.75},
		"sequence_id": "player.01:000001", "timestamp_msec": 1250,
		"deterministic_seed": 23006, "importance": "standard",
		"authority_state": "predicted"}
	var context := {"fields": {"position": Vector3(1.234, 2.345, 3.456),
		"normal": Vector3.UP, "target_material": "stone",
		"intensity": 0.75, "rendered_instance": "must_not_replicate"}}
	var encoded := replication.encode_event(event_record, context)
	_check(encoded.get("ok", false), "presentation event did not encode")
	var packet: Dictionary = encoded.get("packet", {})
	_check(packet.position == [1.23, 2.35, 3.46]
		and not packet.context.has("rendered_instance"),
		"replicated event was not quantised or filtered")
	_check(replication.decode(packet).get("ok", false),
		"replicated event did not decode")
	_check(replication.begin_prediction(packet).get("ok", false),
		"predicted presentation event was not tracked")
	var authoritative := packet.duplicate(true)
	authoritative.authority_state = "authoritative"
	authoritative.erase("packet_hash")
	authoritative.packet_hash = ForgeStableRecord.hash_record(authoritative)
	var reconciliation := replication.reconcile(authoritative)
	_check(reconciliation.get("ok", false)
		and reconciliation.get("action", "") == "confirm",
		"matching presentation prediction was not confirmed")
	var state_record := {"contract_id": state.stable_id,
		"owner_instance_id": "furnace.01", "state": {"active": true},
		"sequence_id": "furnace.01:000001", "timestamp_msec": 1300,
		"deterministic_seed": 23007}
	var encoded_state := replication.encode_state(state_record, context)
	_check(encoded_state.get("ok", false)
		and replication.remember_continuous_state(encoded_state.packet).get(
			"ok", false), "continuous presentation state was not retained")
	var late_join := replication.late_join_snapshot()
	_check(late_join.continuous_states.size() == 1
		and late_join.one_shot_events.is_empty()
		and str(late_join.snapshot_hash).length() == 64,
		"late-join state included one-shots or lost continuous state")
	_hashes.append(packet.packet_hash)
	_hashes.append(late_join.snapshot_hash)

	var all_access: Array[ForgeAccessibilityProfile] = []
	all_access.assign(_presentation_resources("accessibility_profile"))
	var all_budgets: Array[ForgePresentationBudgetProfile] = []
	all_budgets.assign(_presentation_resources("budget_profile"))
	var listeners := ForgeMultiListenerPresentationService.new()
	_check(listeners.load_and_validate(all_access, all_budgets, 2).get(
		"ok", false), "split-listener contracts were rejected")
	var access_id := (all_access[0] as ForgeAccessibilityProfile).stable_id
	var budget_id := (all_budgets[0] as ForgePresentationBudgetProfile).stable_id
	_check(listeners.register_listener("player.01", Vector3.ZERO,
		access_id, budget_id, {"primary": true, "vfx_quality": "reduced"}).get(
			"ok", false), "primary split listener was rejected")
	_check(listeners.register_listener("player.02", Vector3(8, 0, 0),
		access_id, budget_id, {"primary": false, "vfx_quality": "full"}).get(
			"ok", false), "secondary split listener was rejected")
	var normal_audio := listeners.resolve_audio(Vector3(2, 0, 0), false, "primary")
	_check(normal_audio.routes.size() == 1
		and normal_audio.routes[0].listener_id == "player.01",
		"primary-listener audio arbitration drifted")
	var critical_audio := listeners.resolve_audio(Vector3(2, 0, 0), true)
	_check(critical_audio.routes.size() == 2
		and critical_audio.mix_policy == "critical_per_listener",
		"critical cue was not routed per listener")
	var vfx := listeners.resolve_vfx("full", "reduced")
	_check(vfx.quality == "reduced" and vfx.listener_count == 2,
		"split-listener VFX quality was not capped deterministically")
	_hashes.append(normal_audio.routing_hash)
	_hashes.append(critical_audio.routing_hash)


func _verify_stress_and_laboratory() -> void:
	var profile := ResourceLoader.load(
		"res://content/forge/presentation/set23/foundation/budget_profile_presentation_foundation.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE) as ForgePresentationBudgetProfile
	var stress := ForgePresentationStressHarness.new()
	var specification := {"event_count": 256, "critical_every": 31,
		"per_event": {"particles": 12, "voices": 1, "lights": 1,
			"surface_records": 2, "updates": 1}}
	var first := stress.run_dense_scene(profile, specification, 23006)
	var second := stress.run_dense_scene(profile, specification, 23006)
	_check(first.get("ok", false) and second.get("ok", false),
		"dense-scene stress harness failed")
	_check(first.stress_hash == second.stress_hash,
		"dense-scene stress evidence is nondeterministic")
	_check(first.unbounded_allocations == 0 and first.all_released,
		"dense-scene stress harness leaked or admitted unbounded work")
	_check(_dictionary_sum(first.denied) > 0,
		"dense-scene stress did not exercise degradation")
	_hashes.append(first.stress_hash)

	var all_scenarios: Array[ForgePresentationTestScenario] = []
	all_scenarios.assign(_presentation_resources("test_scenario"))
	var laboratory := ForgePresentationTestLaboratory.new()
	var load_report := laboratory.load_and_validate(all_scenarios)
	_check(load_report.get("ok", false)
		and int(load_report.get("scenario_count", 0)) == 20,
		"Presentation Test Laboratory did not load all scenarios")
	for scenario in all_scenarios:
		var capture := laboratory.capture(scenario.stable_id,
			"registry.presentation.milestone6", 23006)
		_check(capture.get("ok", false)
			and capture.get("manual_review_status", "") == "open",
			"Presentation Test Laboratory capture failed: %s" % scenario.stable_id)
		var replay := laboratory.replay(str(capture.get("capture_id", "")))
		_check(replay.get("ok", false)
			and str(replay.get("replay_hash", "")).length() == 64,
			"Presentation Test Laboratory replay failed: %s" % scenario.stable_id)
		var matrix := laboratory.accessibility_matrix(scenario.stable_id)
		_check(matrix.get("ok", false)
			and int(matrix.get("cell_count", 0)) \
				== scenario.quality_tiers.size() * scenario.accessibility_modes.size(),
			"accessibility/quality matrix drifted: %s" % scenario.stable_id)
		_hashes.append(str(capture.trace.trace_hash))
	_check(laboratory.filtered_list().size() == 20,
		"Test Laboratory filtered-list count drifted")


func _verify_workspace_and_ui() -> void:
	var workspace := ForgePresentationWorkspaceService.new()
	var report := workspace.load_and_validate()
	_check(report.get("ok", false),
		"Presentation workspace rejected unified sources: %s" % JSON.stringify(
			report.get("diagnostics", [])))
	_check(int(report.get("record_count", 0)) == _index.foundation_records_by_id.size(),
		"Presentation workspace and shared index disagree")
	_check(not workspace.registry_publisher.current_generation().is_empty(),
		"Presentation workspace did not publish a known-good generation")
	var repair := workspace.repair_plan("presentation.profile.missing.example")
	_check(repair.get("ok", false) and repair.get("non_destructive", false)
		and not repair.get("applied", true),
		"Presentation repair plan was destructive or implicit")
	var source_id := "presentation.profile.forest_hamlet.catalogue_000.stage6"
	var compare := workspace.bake_comparison(source_id,
		{"source_hash": "stale"})
	_check(compare.get("ok", false) and compare.get("stale", false)
		and compare.get("approval_state", "") == "draft"
		and compare.get("manual_approval_required", false),
		"stale presentation product did not return to draft")
	var ui_source := FileAccess.get_file_as_string(
		"res://scripts/forge/ui/forge_workspace.gd")
	for label in ["Presentation Forge", "Spatial Roles", "Events & Profiles",
			"VFX Graph Authoring", "Sound Event Authoring",
			"Accessibility Preview", "Capture & Replay", "Test Laboratory",
			"Hot Reload & Repair"]:
		_check(label in ui_source,
			"shared Forge workspace is missing Presentation page: %s" % label)
	_check("700-1,100 source" in ui_source,
		"Forge UI does not explain audio-source planning guidance")


func _verify_negative_cases() -> void:
	var bad_library := _library.duplicate(true) as ForgePresentationLibraryManifest
	bad_library.target_counts["sound_events"] = 299
	bad_library.review_gates["rights"] = "approved"
	var library_diagnostics := ForgePresentationProductionValidationService.new().\
		validate_library_manifest(bad_library)
	_check(_has_diagnostic(library_diagnostics, "PAK-002")
		and _has_diagnostic(library_diagnostics, "PAK-003"),
		"invalid catalogue target or closed evidence gate was not diagnosed")
	var duplicate_generation := ForgeRuntimeRegistryGeneration.new()
	duplicate_generation.generation_id = "registry.presentation.bad"
	duplicate_generation.records = [{"source_id": "event.bad"},
		{"source_id": "event.bad"}]
	var generation_diagnostics := ForgePresentationProductionValidationService.new().\
		validate_generation(duplicate_generation)
	_check(_has_diagnostic(generation_diagnostics, "REG-001"),
		"duplicate runtime registry ID was not diagnosed")
	var publisher := ForgeRuntimeRegistryPublisher.new()
	var baseline: Array[Dictionary] = [{"source_id": "event.test.contract",
		"schema": "leyforge.forge.presentation-event-contract",
		"contract_version": "23-foundation-v1", "dependency_ids": []}]
	publisher.load_and_validate(baseline)
	var changed := baseline.duplicate(true)
	changed[0]["contract_version"] = "23-breaking-v2"
	var change_report := publisher.stage(changed)
	_check(not change_report.get("ok", true)
		and _has_code(change_report.get("diagnostics", []), "MIG-003"),
		"unclassified contract change did not block publication")
	_check(publisher.current_generation().records[0].contract_version \
		== "23-foundation-v1",
		"rejected hot reload mutated the known-good generation")
	var event := ResourceLoader.load(
		"res://content/forge/presentation/set23/foundation/event_block_mining_impact.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE) as ForgePresentationEventContract
	var replication := ForgePresentationReplicationService.new()
	var event_contracts: Array[ForgePresentationEventContract] = [event]
	var no_state_contracts: Array[ForgePresentationStateContract] = []
	replication.load_and_validate(event_contracts, no_state_contracts)
	var malformed := {"packet_version": 1, "packet_kind": "event",
		"contract_id": event.stable_id, "packet_hash": "bad"}
	_check(not replication.decode(malformed).get("ok", true)
		and _has_code(replication.decode(malformed).get("diagnostics", []), "EVT-004"),
		"malformed replicated presentation event was not rejected")
	var access: Array[ForgeAccessibilityProfile] = []
	access.assign(_presentation_resources("accessibility_profile"))
	var budgets: Array[ForgePresentationBudgetProfile] = []
	budgets.assign(_presentation_resources("budget_profile"))
	var listeners := ForgeMultiListenerPresentationService.new()
	listeners.load_and_validate(access, budgets, 1)
	listeners.register_listener("one", Vector3.ZERO, access[0].stable_id,
		budgets[0].stable_id)
	_check(not listeners.register_listener("two", Vector3.ZERO,
		access[0].stable_id, budgets[0].stable_id).get("ok", true),
		"split-listener capacity was not bounded")
	var unsafe_budget := ForgePresentationBudgetProfile.new()
	unsafe_budget.stable_id = "budget.profile.unsafe.stage6"
	var stress := ForgePresentationStressHarness.new()
	_check(not stress.load_and_validate(unsafe_budget).get("ok", true),
		"unsafe stress budget was not rejected")


func _presentation_resources(kind: String) -> Array:
	var result: Array = []
	for record in _index.filtered_list(kind):
		var path := _index.foundation_path_for(str(record.get("source_id", "")))
		var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if resource != null:
			result.append(resource)
	return result


func _resource_files(root: String) -> Array[String]:
	var result: Array[String] = []
	for file_name in DirAccess.get_files_at(root):
		if file_name.ends_with(".tres"):
			result.append(root.path_join(file_name))
	for directory_name in DirAccess.get_directories_at(root):
		result.append_array(_resource_files(root.path_join(directory_name)))
	result.sort()
	return result


func _mesh_count(node: Node) -> int:
	var count := 1 if node is MeshInstance3D else 0
	for child in node.get_children():
		count += _mesh_count(child)
	return count


func _dictionary_sum(values: Dictionary) -> int:
	var total := 0
	for value in values.values():
		total += int(value)
	return total


func _has_code(diagnostics: Array, code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic is Dictionary and str(diagnostic.get("code", "")) == code:
			return true
	return false


func _has_diagnostic(diagnostics: Array[ForgeDiagnostic], code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic != null and diagnostic.code == code:
			return true
	return false


func _check(condition: bool, message: String) -> void:
	_checks += 1
	if not condition:
		_failures.append(message)
