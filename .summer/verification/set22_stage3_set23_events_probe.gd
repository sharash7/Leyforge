extends Node
## Set 22 Stage 3 semantic animation plus Set 23 event/context/replay gate.

const STAGE2_ROOT := "res://content/forge/runtime/set22_23"
const STAGE3_ROOT := "res://content/forge/runtime/set22_23_stage3"
const FOUNDATION_ROOT := "res://content/forge/presentation/set23"
const HUMANOID_ID := "entity.definition.template.humanoid_standard"
const PIG_ID := "entity.definition.template.pig_quadruped"
const GOBLIN_ID := "entity.definition.creature.goblin_standard"
const SPIDER_ID := "entity.definition.creature.spider_standard"
const WISP_ID := "entity.definition.creature.wisp_standard"
const EXPECTED_HASH := (
	"979ebb2b0ce16e78dc5e88d5d9399042d06ce34e7abcca82cb2bf441f1abbc11")
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
var _semantic: ForgeSemanticRegistry
var _density: ForgeDensityProfileRegistry
var _factory: ForgeRuntimeActorFactory
var _actors: Dictionary = {}


func _ready() -> void:
	_semantic = ForgeSemanticRegistry.new()
	var semantic_report := _semantic.load_and_validate()
	_check(bool(semantic_report.get("ok", false)),
		"Stage 3 semantic registry did not load")
	_check((semantic_report.get("diagnostics", []) as Array).is_empty(),
		"Stage 3 semantic registry emitted diagnostics")
	_verify_schema_manifest_and_roles()
	_verify_index_and_roundtrips()
	_verify_actor_families()
	_verify_animation_runtime()
	_verify_variants_equipment_contacts_and_proxies()
	_verify_event_gateway()
	_verify_negative_validation()
	for actor in _actors.values():
		if actor != null:
			(actor as ForgeRuntimeActor).queue_free()
	_hashes.sort()
	var deterministic_hash := ForgeStableRecord.hash_record({"hashes": _hashes})
	_check(deterministic_hash.length() == 64,
		"Stage 3 deterministic aggregate is not SHA-256")
	if not EXPECTED_HASH.is_empty():
		_check(deterministic_hash == EXPECTED_HASH,
			"Stage 3 deterministic aggregate hash drifted")
	var report := {
		"ok": _failures.is_empty(),
		"checks": _checks,
		"failures": _failures,
		"deterministic_hash": deterministic_hash,
	}
	print("SET22_STAGE3_SET23_EVENTS_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if _failures.is_empty() else 1)


func _verify_schema_manifest_and_roles() -> void:
	var schemas := ForgeSchemaRegistry.new()
	var expected := {
		"leyforge.forge.animation-event-marker": "animation_runtime",
		"leyforge.forge.entity-animation-clip": "animation_runtime",
		"leyforge.forge.entity-animation-library": "animation_runtime",
		"leyforge.forge.retarget-map": "animation_runtime",
		"leyforge.forge.foot-placement-profile": "animation_runtime",
		"leyforge.forge.equipment-fit-profile": "entity_customisation_runtime",
		"leyforge.forge.entity-variant-profile": "entity_customisation_runtime",
		"leyforge.forge.gameplay-proxy-profile": "entity_customisation_runtime",
		"leyforge.forge.presentation-trace": "event_runtime",
	}
	_check(schemas.filtered_list("animation_runtime").size() == 5,
		"Stage 3 animation schema family count drifted")
	_check(schemas.filtered_list("entity_customisation_runtime").size() == 3,
		"Stage 3 customisation schema family count drifted")
	_check(schemas.filtered_list("event_runtime").size() == 1,
		"Stage 3 event runtime schema family count drifted")
	for schema_id in expected:
		_check(schemas.has(schema_id),
			"Stage 3 schema is not registered: %s" % schema_id)
		_check(str(schemas.resolve(schema_id).get("domain", "")) == expected[schema_id],
			"Stage 3 schema domain drifted")
	var manifest_service := ForgeProjectManifestService.new()
	var report := manifest_service.load_and_validate()
	_check(bool(report.get("ok", false)), "Stage 3 manifest did not validate")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"Stage 3 manifest emitted diagnostics")
	_check(str(manifest_service.manifest.feature_contract_versions.get(
		"set22_stage3", "")) == "22-stage3-v1",
		"manifest omitted Set 22 Stage 3 contract")
	_check(str(manifest_service.manifest.feature_contract_versions.get(
		"set23_events", "")) == "23-events-v1",
		"manifest omitted Set 23 event contract")
	_check(STAGE3_ROOT in manifest_service.manifest.source_roots,
		"manifest omitted the Stage 3 source root")
	for schema_id in expected:
		_check(manifest_service.has(schema_id),
			"manifest lookup omitted Stage 3 schema")
	var stage3_anatomy := _semantic.filtered_list("anatomy_role").filter(
		func(record: Dictionary) -> bool:
			return str(record.get("contract_version", "")) \
				!= "22-stage6-candidate-v1")
	_check(stage3_anatomy.size() == 32,
		"Stage 3 anatomy role count drifted")
	for role_id in [
		"anatomy.role.arthropod.core", "anatomy.role.arthropod.head",
		"anatomy.role.arthropod.leg.left.1",
		"anatomy.role.arthropod.leg.right.4", "anatomy.role.wisp.core",
		"runtime_anchor.creature.telegraph",
		"runtime_anchor.equipment.release",
	]:
		_check(_semantic.has(role_id),
			"Stage 3 semantic role is missing: %s" % role_id)


func _verify_index_and_roundtrips() -> void:
	_density = ForgeDensityProfileRegistry.new()
	_check(bool(_density.load_and_validate(PackedStringArray(
		DENSITY_PATHS)).get("ok", false)),
		"Stage 3 density registry did not load")
	var roots := PackedStringArray([
		"res://content/forge/entities",
		"res://content/forge/materials/set22",
		FOUNDATION_ROOT, STAGE2_ROOT, STAGE3_ROOT,
	])
	var index := ForgeAssetIndex.new()
	var report := index.load_and_validate(roots, _semantic, _density)
	_check(bool(report.get("ok", false)),
		"shared Forge index rejected Stage 3 sources: %s" %
		JSON.stringify(report.get("diagnostics", [])))
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"shared Forge index retained Stage 3 diagnostics")
	var files := _resource_files(STAGE3_ROOT)
	_check(files.size() == 85, "Stage 3 generated Resource count drifted")
	var kind_counts := {}
	for record in index.filtered_list():
		var path := str(record.get("source_path", ""))
		if path.begins_with(STAGE3_ROOT):
			var kind := str(record.get("foundation_kind", ""))
			kind_counts[kind] = int(kind_counts.get(kind, 0)) + 1
	var expected_kind_counts := {
		"entity_definition": 3,
		"body_plan": 3,
		"body_part": 22,
		"rig_profile": 3,
		"spatial_map": 4,
		"entity_assembly_profile": 3,
		"entity_animation_library": 5,
		"retarget_map": 5,
		"foot_placement_profile": 4,
		"equipment_fit_profile": 1,
		"entity_variant_profile": 15,
		"gameplay_proxy_profile": 5,
		"event_contract": 3,
		"presentation_profile": 4,
		"presentation_binding": 5,
	}
	for expected_kind in expected_kind_counts:
		_check(int(kind_counts.get(expected_kind, 0)) ==
			expected_kind_counts[expected_kind],
			"Stage 3 source kind count drifted: %s" % expected_kind)
	_check(str(index.resolve("entity.rig.template.goblin_standard").get(
		"rig_profile_id", "")) == "entity.rig.profile.goblin_standard",
		"Stage 3 rig alias resolved in the wrong direction")
	_check(str(index.resolve("entity.animation_set.template.spider_standard").get(
		"animation_library_id", "")) == "entity.animation_set.spider_standard.stage3",
		"Stage 3 animation alias resolved in the wrong direction")
	var roundtrip_root := "user://set22_stage3_roundtrips"
	DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(roundtrip_root))
	for path in files:
		var resource := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(resource != null, "Stage 3 source did not load: %s" % path)
		if resource == null:
			continue
		_check(resource.has_method("canonical_hash"),
			"Stage 3 source has no canonical hash: %s" % path)
		var source_hash := str(resource.call("canonical_hash"))
		_check(source_hash.length() == 64,
			"Stage 3 source hash is not SHA-256: %s" % path)
		var roundtrip_path := "%s/%s" % [roundtrip_root, path.get_file()]
		_check(ResourceSaver.save(resource, roundtrip_path) == OK,
			"Stage 3 source did not serialise: %s" % path)
		var loaded := ResourceLoader.load(
			roundtrip_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(loaded != null and str(loaded.call("canonical_hash")) == source_hash,
			"Stage 3 source hash changed after round-trip: %s" % path)
		_hashes.append(source_hash)


func _verify_actor_families() -> void:
	_factory = ForgeRuntimeActorFactory.new()
	var report := _factory.load_and_validate(PackedStringArray([
		"res://content/forge/entities", "res://content/forge/materials/set22",
		FOUNDATION_ROOT, STAGE2_ROOT, STAGE3_ROOT,
	]), _semantic, _density)
	_check(bool(report.get("ok", false)),
		"actor factory rejected Stage 3 sources: %s" %
		JSON.stringify(report.get("diagnostics", [])))
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"actor factory retained Stage 3 diagnostics")
	_check(int(report.get("entity_count", 0)) == 5,
		"actor factory entity count drifted")
	_check(int(report.get("rig_count", 0)) == 5,
		"actor factory rig count drifted")
	_check(int(report.get("spatial_map_count", 0)) == 6,
		"actor factory spatial-map count drifted")
	_check(int(report.get("assembly_count", 0)) == 5,
		"actor factory assembly count drifted")
	var expectations := {
		HUMANOID_ID: 11,
		PIG_ID: 10,
		GOBLIN_ID: 11,
		SPIDER_ID: 10,
		WISP_ID: 1,
	}
	for entity_id in expectations:
		_check(_factory.has(entity_id),
			"actor factory cannot resolve golden entity: %s" % entity_id)
		var actor := _factory.create_actor(
			entity_id, "%s:stage3" % entity_id, {"action": "idle"})
		_check(actor != null, "golden Stage 3 actor did not instantiate")
		if actor == null:
			continue
		add_child(actor)
		_actors[entity_id] = actor
		var readback := actor.read_back()
		_check(bool(readback.get("ok", false)),
			"golden Stage 3 actor readback failed")
		_check(int(readback.get("part_count", 0)) == expectations[entity_id],
			"golden Stage 3 actor part count drifted")
		_check(actor.play_semantic_action("walk", true),
			"golden Stage 3 actor has no walk motion")
		actor.advance_motion(0.375)
		var walk_hash := actor.pose_hash()
		_check(walk_hash.length() == 64,
			"golden Stage 3 walk pose did not hash")
		var snapshot := actor.snapshot()
		var reconstructed := _factory.reconstruct(
			JSON.parse_string(JSON.stringify(snapshot)))
		_check(reconstructed != null,
			"golden Stage 3 actor did not reconstruct")
		if reconstructed != null:
			add_child(reconstructed)
			_check(reconstructed.snapshot_hash() == actor.snapshot_hash(),
				"golden Stage 3 actor snapshot changed on reconstruction")
			_check(reconstructed.pose_hash() == walk_hash,
				"golden Stage 3 pose changed on reconstruction")
			reconstructed.queue_free()
		_hashes.append(walk_hash)
	var goblin := _actors[GOBLIN_ID] as ForgeRuntimeActor
	for role_id in ["socket.audio.voice", "socket.presentation.mouth",
			"socket.equipment.primary", "socket.presentation.damage"]:
		var resolved := _factory.spatial_resolver.resolve(goblin.instance_id, role_id)
		_check(bool(resolved.get("ok", false)),
			"goblin spatial role did not resolve: %s" % role_id)
		_check(str(resolved.get("quality", "")) == "exact",
			"goblin LOD0 spatial role was not exact")
	var wisp := _actors[WISP_ID] as ForgeRuntimeActor
	var wisp_voice := _factory.spatial_resolver.resolve(
		wisp.instance_id, "socket.audio.voice")
	_check(bool(wisp_voice.get("ok", false)),
		"wisp semantic voice role did not resolve")


func _verify_animation_runtime() -> void:
	var libraries: Array[ForgeEntityAnimationLibrary] = []
	for key in ["humanoid_standard", "pig_quadruped", "goblin_standard",
			"spider_standard", "wisp_standard"]:
		libraries.append(_load("%s/animation_library_%s.tres" % [
			STAGE3_ROOT, key]) as ForgeEntityAnimationLibrary)
	var runtime := ForgeEntityAnimationRuntime.new()
	var report := runtime.load_and_validate(libraries, _semantic)
	_check(bool(report.get("ok", false)),
		"semantic animation runtime rejected golden libraries")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"semantic animation runtime retained diagnostics")
	_check(int(report.get("library_count", 0)) == 5,
		"semantic animation library count drifted")
	_check(str(runtime.resolve("entity.animation_set.template.goblin_standard").get(
		"animation_library_id", "")) ==
		"entity.animation_set.goblin_standard.stage3",
		"animation runtime alias resolved in the wrong direction")
	for entity_id in _actors:
		var actor := _actors[entity_id] as ForgeRuntimeActor
		var key := _key_for_entity(entity_id)
		_check(runtime.bind_actor(actor,
			"entity.animation_set.%s.stage3" % key),
			"animation runtime did not bind golden actor")
		_check(runtime.play(actor.instance_id, "walk", true),
			"animation runtime did not play semantic walk")
		var advance := runtime.advance(actor.instance_id, 0.7)
		_check(bool(advance.get("ok", false)),
			"animation runtime did not advance semantic walk")
		var expected_markers := 0 if entity_id == WISP_ID else 2
		_check((advance.get("markers", []) as Array).size() == expected_markers,
			"animation foot-contact marker count drifted")
		_hashes.append(str(advance.get("pose_hash", "")))
	var humanoid := _actors[HUMANOID_ID] as ForgeRuntimeActor
	_check(runtime.play(humanoid.instance_id, "mine", true),
		"humanoid semantic mining clip did not play")
	var mining := runtime.advance(humanoid.instance_id, 0.7)
	_check((mining.get("markers", []) as Array).size() == 2,
		"mining clip did not emit release and impact markers")
	_check(str(mining.markers[0].event_contract_id) ==
		"event.animation.equipment_release",
		"mining release marker order drifted")
	_check(str(mining.markers[1].event_contract_id) ==
		"event.block.mining_impact",
		"mining impact marker order drifted")
	var goblin := _actors[GOBLIN_ID] as ForgeRuntimeActor
	_check(runtime.play(goblin.instance_id, "telegraph", true),
		"goblin semantic telegraph did not play")
	var telegraph := runtime.advance(goblin.instance_id, 0.5)
	_check((telegraph.get("markers", []) as Array).size() == 1,
		"goblin telegraph marker did not fire")
	_check(str(telegraph.markers[0].event_contract_id) ==
		"event.creature.telegraph", "goblin telegraph event drifted")


func _verify_variants_equipment_contacts_and_proxies() -> void:
	var variants: Array[ForgeEntityVariantProfile] = []
	for path in _resource_files(STAGE3_ROOT):
		if path.get_file().begins_with("variant_"):
			variants.append(_load(path) as ForgeEntityVariantProfile)
	var appearances := ForgeEntityAppearanceResolver.new()
	var report := appearances.load_and_validate(variants)
	_check(bool(report.get("ok", false)),
		"appearance resolver rejected Stage 3 variants")
	_check(int(report.get("profile_count", 0)) == 15,
		"player/profession/creature variant inventory drifted")
	_check(appearances.filtered_list(HUMANOID_ID).size() == 9,
		"player plus eight Forest Hamlet humanoid variants are incomplete")
	for profile_id in ["entity.variant.player.base",
			"entity.variant.profession.builder", "entity.variant.profession.farmer",
			"entity.variant.profession.guard", "entity.variant.profession.lumberjack",
			"entity.variant.profession.mage", "entity.variant.profession.merchant",
			"entity.variant.profession.miner", "entity.variant.profession.elder",
			"entity.variant.pig.base", "entity.variant.spider.base",
			"entity.variant.goblin.scout", "entity.variant.goblin.raider",
			"entity.variant.goblin.shaman", "entity.variant.wisp.base"]:
		_check(appearances.has(profile_id),
			"golden variant target is missing: %s" % profile_id)
	var first := appearances.reconstruct("entity.variant.player.base", 220023)
	var second := appearances.reconstruct("entity.variant.player.base", 220023)
	_check(first == second and str(first.get("appearance_hash", "")).length() == 64,
		"seeded player appearance was not deterministic")
	_check(appearances.apply(_actors[HUMANOID_ID], first),
		"seeded player appearance did not apply")
	_hashes.append(first.appearance_hash)
	var foot := _load("%s/foot_placement_humanoid_standard.tres" % STAGE3_ROOT) \
		as ForgeFootPlacementProfile
	var foot_result := ForgeFootPlacementService.new().resolve(
		_actors[HUMANOID_ID], foot, {
			"anatomy.role.humanoid.foot.left": {
				"height_offset": 0.08, "confidence": 0.9,
				"normal": Vector3.UP, "surface_material_id": "material.stone"},
			"anatomy.role.humanoid.foot.right": {
				"height_offset": -0.04, "confidence": 0.8,
				"normal": Vector3.UP, "surface_material_id": "material.stone"},
		}, "foot-test")
	_check(bool(foot_result.get("ok", false)),
		"bounded foot placement did not resolve")
	_check((foot_result.get("contacts", []) as Array).size() == 2,
		"bounded foot placement did not emit two contacts")
	_check(absf(float(foot_result.adjustments[
		"anatomy.role.humanoid.foot.left"])) <= foot.maximum_step_height_meters,
		"foot placement exceeded its declared bounds")
	_hashes.append(str(foot_result.get("result_hash", "")))
	var equipment := _load("%s/equipment_fit_crude_pickaxe.tres" % STAGE3_ROOT) \
		as ForgeEquipmentFitProfile
	var fitting := ForgeEquipmentFittingService.new()
	var fit := fitting.fit(
		_actors[HUMANOID_ID], equipment, _factory.spatial_resolver)
	_check(bool(fit.get("ok", false)),
		"crude pickaxe did not fit the semantic hand socket")
	var release_contact := _contact(
		"runtime_anchor.equipment.release", "equipment-release:1",
		_actors[HUMANOID_ID].instance_id, Vector3(2, 1, 0))
	var release := fitting.release(
		_actors[HUMANOID_ID], equipment, _factory.spatial_resolver,
		"equipment-release:1", release_contact)
	_check(bool(release.get("ok", false)),
		"crude pickaxe release point did not resolve")
	_check(str(release.get("contact_hash", "")).length() == 64,
		"equipment release contact did not hash")
	_hashes.append(release.contact_hash)
	for key in ["humanoid_standard", "pig_quadruped", "goblin_standard",
			"spider_standard", "wisp_standard"]:
		var proxy := _load("%s/gameplay_proxy_%s.tres" % [STAGE3_ROOT, key]) \
			as ForgeGameplayProxyProfile
		var built := ForgeGameplayProxyAdapter.new().build(
			_actors[_entity_for_key(key)], proxy)
		_check(bool(built.get("ok", false)),
			"presentation-aligned gameplay proxy did not build")
		_check(bool(built.get("presentation_only", false)),
			"gameplay proxy incorrectly claimed authority")


func _verify_event_gateway() -> void:
	var events: Array[ForgePresentationEventContract] = [
		_load("%s/foundation/event_block_mining_impact.tres" % FOUNDATION_ROOT),
		_load("%s/event_movement_foot_contact.tres" % STAGE3_ROOT),
		_load("%s/event_animation_equipment_release.tres" % STAGE3_ROOT),
		_load("%s/event_creature_telegraph.tres" % STAGE3_ROOT),
	]
	var states: Array[ForgePresentationStateContract] = [
		_load("%s/foundation/state_machine_furnace_foundation.tres" % FOUNDATION_ROOT)]
	var contexts: Array[ForgePresentationContextSchema] = [
		_load("%s/foundation/context_schema_presentation_foundation.tres" % FOUNDATION_ROOT)]
	var profiles: Array[ForgePresentationProfile] = [
		_load("%s/foundation/presentation_profile_contact_mining_stone_foundation.tres" % FOUNDATION_ROOT),
		_load("%s/presentation_profile_movement_foot_contact_stage3.tres" % STAGE3_ROOT),
		_load("%s/presentation_profile_animation_equipment_release_stage3.tres" % STAGE3_ROOT),
		_load("%s/presentation_profile_creature_telegraph_stage3.tres" % STAGE3_ROOT),
		_load("%s/presentation_profile_machine_furnace_stage3.tres" % STAGE3_ROOT),
	]
	var bindings: Array[ForgePresentationBinding] = [
		_load("%s/presentation_binding_entity_mining_stage3.tres" % STAGE3_ROOT),
		_load("%s/presentation_binding_movement_foot_contact_stage3.tres" % STAGE3_ROOT),
		_load("%s/presentation_binding_animation_equipment_release_stage3.tres" % STAGE3_ROOT),
		_load("%s/presentation_binding_creature_telegraph_stage3.tres" % STAGE3_ROOT),
		_load("%s/presentation_binding_machine_furnace_stage3.tres" % STAGE3_ROOT),
	]
	var gateway := ForgePresentationEventGateway.new()
	var load_report := gateway.load_and_validate(
		events, states, contexts, bindings, profiles,
		_factory.spatial_resolver, "stage3-registry-snapshot")
	_check(bool(load_report.get("ok", false)),
		"event gateway rejected Stage 3 contracts: %s" %
		JSON.stringify(load_report.get("diagnostics", [])))
	_check((load_report.get("diagnostics", []) as Array).is_empty(),
		"event gateway retained Stage 3 diagnostics")
	_check(int(load_report.get("event_count", 0)) == 4,
		"event gateway contract count drifted")
	_check(int(load_report.get("state_count", 0)) == 1,
		"event gateway state count drifted")
	for contract_id in ["event.block.mining_impact",
			"event.movement.foot_contact", "event.animation.equipment_release",
			"event.creature.telegraph", "state.machine.furnace.foundation"]:
		_check(gateway.has(contract_id),
			"event gateway cannot resolve contract: %s" % contract_id)
	var common := {"position": Vector3(1, 2, 3), "normal": Vector3.UP,
		"target_material": "stone", "intensity": 0.75}
	var metadata := {"context_schema_id": "context.schema.presentation.foundation",
		"timestamp_msec": 23000, "deterministic_seed": 23,
		"authority_state": "authoritative"}
	var malformed := gateway.publish(
		"event.block.mining_impact", HUMANOID_ID,
		_actors[HUMANOID_ID].instance_id, {"intensity": "loud"}, {}, metadata)
	_check(not bool(malformed.get("ok", true)),
		"event gateway accepted malformed mining payload")
	_check(_dictionary_has_code(malformed.get("diagnostics", []), "EVT-002"),
		"malformed mining payload did not emit EVT-002")
	var mining_contact := _contact(
		"runtime_anchor.block.mining_impact", "mining:1",
		_actors[HUMANOID_ID].instance_id, common.position)
	var mining := gateway.publish(
		"event.block.mining_impact", HUMANOID_ID,
		_actors[HUMANOID_ID].instance_id, common, {}, metadata, mining_contact)
	_verify_gateway_result(mining, "play", 2, "mining")
	var foot_contact := _contact(
		"runtime_anchor.movement.foot_contact", "foot:1",
		_actors[PIG_ID].instance_id, Vector3.ZERO)
	var foot := gateway.publish(
		"event.movement.foot_contact", PIG_ID, _actors[PIG_ID].instance_id,
		common, {}, metadata, foot_contact)
	_verify_gateway_result(foot, "play", 2, "pig foot")
	var equipment_contact := _contact(
		"runtime_anchor.equipment.release", "release:2",
		_actors[HUMANOID_ID].instance_id, Vector3.ZERO)
	var equipment := gateway.publish(
		"event.animation.equipment_release", HUMANOID_ID,
		_actors[HUMANOID_ID].instance_id, common, {}, metadata, equipment_contact)
	_verify_gateway_result(equipment, "play", 2, "equipment release")
	var creature_contact := _contact(
		"runtime_anchor.creature.telegraph", "telegraph:1",
		_actors[GOBLIN_ID].instance_id, Vector3.ZERO)
	var creature := gateway.publish(
		"event.creature.telegraph", GOBLIN_ID, _actors[GOBLIN_ID].instance_id,
		common, {}, metadata, creature_contact)
	_verify_gateway_result(creature, "play", 2, "goblin telegraph")
	var dedup_metadata := metadata.duplicate(true)
	dedup_metadata["deduplication_key"] = "foot:deduplicate"
	var first_dedup := gateway.publish(
		"event.movement.foot_contact", PIG_ID, _actors[PIG_ID].instance_id,
		common, {}, dedup_metadata, foot_contact)
	var second_dedup := gateway.publish(
		"event.movement.foot_contact", PIG_ID, _actors[PIG_ID].instance_id,
		common, {}, dedup_metadata, foot_contact)
	_check(bool(first_dedup.get("ok", false)) and
		bool(second_dedup.get("deduplicated", false)),
		"event gateway did not suppress a duplicate event")
	_check((second_dedup.get("commands", []) as Array).is_empty(),
		"deduplicated event emitted runtime commands")
	_check(_factory.spatial_resolver.bind_transform_owner(
		"furnace:stage3", "spatial.map.machine.furnace.stage3",
		Transform3D(Basis.IDENTITY, Vector3(5, 0, 2))),
		"generic furnace spatial owner did not bind")
	var furnace := gateway.observe_state(
		"state.machine.furnace.foundation", "block.machine.furnace",
		"furnace:stage3", {"active": true, "blocked": false,
			"heat_ratio": 0.8}, "context.schema.presentation.foundation", {
			"timestamp_msec": 23001, "deterministic_seed": 24,
			"context_fields": common,
		})
	_verify_gateway_result(furnace, "update", 2, "furnace state")
	var trace := gateway.capture_trace()
	_check(gateway.trace_recorder.validate_trace(trace),
		"captured Stage 3 presentation trace did not validate")
	_check((trace.get("events", []) as Array).size() == 5,
		"captured trace event count drifted")
	_check((trace.get("state_samples", []) as Array).size() == 1,
		"captured trace state count drifted")
	_check((trace.get("lifecycle_actions", []) as Array).size() == 12,
		"captured keyed lifecycle command count drifted")
	var replay := gateway.replay(trace)
	_check(bool(replay.get("ok", false)),
		"captured Stage 3 presentation trace did not replay")
	_check((replay.get("records", []) as Array).size() == 5,
		"Stage 3 replay event count drifted")
	_check(str(replay.get("replay_hash", "")).length() == 64,
		"Stage 3 replay did not produce a deterministic hash")
	_hashes.append(str(trace.get("trace_hash", "")))
	_hashes.append(str(replay.get("replay_hash", "")))
	_factory.spatial_resolver.unbind_owner("furnace:stage3")


func _verify_negative_validation() -> void:
	var validator := ForgeValidationService.new()
	var bad_library := ForgeEntityAnimationLibrary.new()
	bad_library.animation_library_id = "entity.animation_set.invalid.stage3"
	bad_library.rig_profile_id = "entity.rig.invalid"
	var animation_diagnostics := validator.validate_animation_library_source(
		bad_library, _semantic)
	_check(_diagnostics_have_code(animation_diagnostics, "EFB-ANIM-001"),
		"empty animation library did not emit EFB-ANIM-001")
	var bad_foot := ForgeFootPlacementProfile.new()
	bad_foot.foot_placement_profile_id = "entity.foot_placement.invalid"
	bad_foot.rig_profile_id = "entity.rig.invalid"
	bad_foot.maximum_offset_meters = -1.0
	var foot_diagnostics := validator.validate_foot_placement_source(
		bad_foot, _semantic)
	_check(_diagnostics_have_code(foot_diagnostics, "EFB-ANIM-003"),
		"unsafe foot-placement profile did not emit EFB-ANIM-003")
	var bad_equipment := ForgeEquipmentFitProfile.new()
	bad_equipment.equipment_profile_id = "entity.equipment_profile.invalid"
	bad_equipment.socket_role_id = "socket.missing"
	var equipment_diagnostics := validator.validate_equipment_fit_source(
		bad_equipment, _semantic)
	_check(_diagnostics_have_code(equipment_diagnostics, "EFB-EQUIP-001"),
		"incomplete equipment profile did not emit EFB-EQUIP-001")
	_check(_diagnostics_have_code(equipment_diagnostics, "EFB-DEP-001"),
		"missing equipment spatial role did not emit EFB-DEP-001")
	var bad_variant := ForgeEntityVariantProfile.new()
	bad_variant.variant_profile_id = "entity.variant.invalid"
	bad_variant.entity_definition_id = HUMANOID_ID
	bad_variant.proportion_scale = Vector3.ZERO
	var variant_diagnostics := validator.validate_entity_variant_source(bad_variant)
	_check(_diagnostics_have_code(variant_diagnostics, "EFB-VARIANT-001"),
		"unsafe entity variant did not emit EFB-VARIANT-001")


func _verify_gateway_result(
		result: Dictionary, verb: String, expected_commands: int,
		label: String) -> void:
	_check(bool(result.get("ok", false)),
		"%s gateway fixture failed: %s" % [label,
		JSON.stringify(result.get("diagnostics", []))])
	var commands: Array = result.get("commands", [])
	_check(commands.size() == expected_commands,
		"%s gateway command count drifted" % label)
	for command in commands:
		_check(str(command.get("command", "")) == verb,
			"%s gateway command verb drifted" % label)
		_check(not str(command.get("ownership_key", "")).is_empty(),
			"%s gateway command omitted its ownership key" % label)


func _contact(
		role_id: String, event_id: String, owner_id: String,
		position: Vector3) -> ForgeRuntimeContactRecord:
	var contact := ForgeRuntimeContactRecord.new()
	contact.runtime_anchor_id = role_id
	contact.event_instance_id = event_id
	contact.source_owner_id = owner_id
	contact.world_position = position
	contact.surface_normal = Vector3.UP
	contact.target_material_id = "material.stone"
	contact.timestamp_msec = 23000
	contact.deterministic_seed = 23
	return contact


func _load(path: String) -> Resource:
	return ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)


func _resource_files(root: String) -> Array[String]:
	var result: Array[String] = []
	for file_name in DirAccess.get_files_at(root):
		if file_name.ends_with(".tres"):
			result.append(root.path_join(file_name))
	result.sort()
	return result


func _key_for_entity(entity_id: String) -> String:
	return {
		HUMANOID_ID: "humanoid_standard",
		PIG_ID: "pig_quadruped",
		GOBLIN_ID: "goblin_standard",
		SPIDER_ID: "spider_standard",
		WISP_ID: "wisp_standard",
	}.get(entity_id, "")


func _entity_for_key(key: String) -> String:
	return {
		"humanoid_standard": HUMANOID_ID,
		"pig_quadruped": PIG_ID,
		"goblin_standard": GOBLIN_ID,
		"spider_standard": SPIDER_ID,
		"wisp_standard": WISP_ID,
	}.get(key, "")


func _diagnostics_have_code(
		diagnostics: Array[ForgeDiagnostic], code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic != null and diagnostic.code == code:
			return true
	return false


func _dictionary_has_code(diagnostics: Array, code: String) -> bool:
	for diagnostic in diagnostics:
		if str(diagnostic.get("code", "")) == code:
			return true
	return false


func _check(condition: bool, message: String) -> void:
	_checks += 1
	if not condition:
		_failures.append(message)
