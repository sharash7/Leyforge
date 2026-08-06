extends Node
## Set 22/23 Milestone 5 blueprint, acoustic and persistence gate.

const ROOT := "res://content/forge/runtime/set22_23_stage5"
const EXPECTED_CHECKS := 564
const EXPECTED_HASH := "db51c5500c773f777ce86fdfd419395e70e19060a421f13775e9cbba4bbbae10"
const TARGETS := {
	"cottage": "blueprint.leyforge.residential.small_cottage_a",
	"warehouse": "blueprint.leyforge.storage.village_warehouse_a",
	"workshop": "blueprint.leyforge.crafting.carpenter_workshop_a",
	"watchtower": "blueprint.leyforge.safety.wooden_watchtower_a",
	"bridge": "blueprint.leyforge.transport.stone_road_bridge_set_a",
	"goblin_camp": "blueprint.leyforge.worldgen.goblin_camp_a",
	"rune_ruin": "blueprint.leyforge.worldgen.rune_ruin_a",
	"road_module": "blueprint.module.road.forest_path_a",
	"farm_pen_module": "blueprint.module.farm.pen_basic_a",
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
var _blueprints: Array[ForgeBlueprintDefinition] = []
var _modules: Array[ForgeBlueprintModuleDefinition] = []
var _states: Array[ForgeBlueprintStateDefinition] = []
var _layers: Array[ForgeSurfaceLayer] = []
var _graphs: Array[ForgeAcousticZoneGraph] = []
var _profiles: Array[ForgeAcousticProfile] = []
var _plans: Array[ForgeAmbiencePlan] = []
var _products: Array[ForgeBlueprintRuntimeProduct] = []


func _ready() -> void:
	_verify_contract_registration()
	_load_and_roundtrip_sources()
	_verify_shared_index()
	_verify_blueprint_compilation()
	_verify_runtime_assembly_and_placement()
	_verify_acoustics_and_ambience()
	_verify_persistent_world_state()
	_verify_negative_cases()
	_hashes.sort()
	var deterministic_hash := ForgeStableRecord.hash_record({"hashes": _hashes})
	_check(deterministic_hash.length() == 64,
		"Milestone 5 deterministic aggregate is not SHA-256")
	if not EXPECTED_HASH.is_empty():
		_check(deterministic_hash == EXPECTED_HASH,
			"Milestone 5 deterministic aggregate hash drifted")
	_check(_checks + 1 == EXPECTED_CHECKS,
		"pinned check count changed: expected %d, got %d" % [EXPECTED_CHECKS, _checks + 1])
	print("SET22_STAGE5_SET23_WORLD_PRESENTATION_PROBE %s" % JSON.stringify({
		"ok": _failures.is_empty(), "checks": _checks,
		"failures": _failures, "deterministic_hash": deterministic_hash}))
	get_tree().quit(0 if _failures.is_empty() else 1)


func _verify_contract_registration() -> void:
	var schemas := ForgeSchemaRegistry.new()
	for schema_id in [
		"leyforge.forge.blueprint-module-definition",
		"leyforge.forge.blueprint-state-definition",
		"leyforge.forge.blueprint-runtime-product",
		"leyforge.forge.blueprint-instance-snapshot",
		"leyforge.forge.acoustic-zone-graph",
		"leyforge.forge.ambience-plan",
		"leyforge.forge.persistent-surface-record",
		"leyforge.forge.persistent-surface-state",
		"leyforge.forge.world-presentation-state",
	]:
		_check(schemas.has(schema_id), "Milestone 5 schema is not registered: %s" % schema_id)
	_check(schemas.filtered_list("blueprint_runtime").size() == 4,
		"blueprint runtime schema count drifted")
	_check(schemas.filtered_list("acoustic_runtime").size() == 2,
		"acoustic runtime schema count drifted")
	_check(schemas.filtered_list("surface_runtime").size() == 2,
		"surface runtime schema count drifted")
	_check(schemas.filtered_list("world_presentation_runtime").size() == 1,
		"world presentation runtime schema count drifted")
	var manifest_service := ForgeProjectManifestService.new()
	var report := manifest_service.load_and_validate()
	_check(bool(report.get("ok", false)), "shared Forge manifest rejected Milestone 5")
	_check(ROOT in manifest_service.manifest.source_roots,
		"Milestone 5 source root is absent from the shared manifest")
	var expected_versions := {
		"set22_stage5_blueprints": "22-stage5-v1",
		"set22_stage5_runtime": "22-stage5-runtime-v1",
		"set23_acoustic_runtime": "23-acoustic-runtime-v1",
		"set23_surface_persistence": "23-surface-persistence-v1",
	}
	for feature in expected_versions:
		_check(str(manifest_service.manifest.feature_contract_versions.get(
			feature, "")) == expected_versions[feature],
			"Milestone 5 feature contract is missing: %s" % feature)
	_check(_semantic.load_and_validate().get("ok", false),
		"shared semantic registry rejected Milestone 5 roles")
	for role_id in ["mask.surface.soot", "mask.surface.scorch",
			"mask.surface.corruption", "portal.audio.chimney",
			"zone.audio.cottage_interior", "zone.audio.warehouse_interior",
			"zone.audio.watchtower_interior", "zone.audio.goblin_camp",
			"zone.audio.rune_ruin"]:
		_check(_semantic.has(role_id), "Milestone 5 semantic role is missing: %s" % role_id)


func _load_and_roundtrip_sources() -> void:
	var files := _resource_files(ROOT)
	_check(files.size() == 69, "Milestone 5 source count drifted")
	for path in files:
		var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(resource != null, "Milestone 5 source did not load: %s" % path)
		if resource == null:
			continue
		if resource is ForgeBlueprintDefinition:
			_blueprints.append(resource)
		elif resource is ForgeBlueprintModuleDefinition:
			_modules.append(resource)
		elif resource is ForgeBlueprintStateDefinition:
			_states.append(resource)
		elif resource is ForgeSurfaceLayer:
			_layers.append(resource)
		elif resource is ForgeAcousticZoneGraph:
			_graphs.append(resource)
		elif resource is ForgeAcousticProfile:
			_profiles.append(resource)
		elif resource is ForgeAmbiencePlan:
			_plans.append(resource)
		else:
			_check(false, "Unexpected Milestone 5 source class: %s" % path)
			continue
		var source_hash := str(resource.call("canonical_hash"))
		_check(source_hash.length() == 64,
			"Milestone 5 source hash is invalid: %s" % path)
		var temporary := "res://.summer/verification/.set22_23_stage5_roundtrip.tres"
		var save_error := ResourceSaver.save(resource, temporary)
		_check(save_error == OK, "Milestone 5 source did not serialize: %s" % path)
		var restored := ResourceLoader.load(temporary, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(restored != null and restored.call("canonical_hash") == source_hash,
			"Milestone 5 source round-trip drifted: %s" % path)
		if FileAccess.file_exists(temporary):
			DirAccess.remove_absolute(ProjectSettings.globalize_path(temporary))
		_hashes.append(source_hash)
	var canonical_cottage := ResourceLoader.load(
		"res://content/forge/blueprints/blueprint_golden_small_forest_cottage.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE) as ForgeBlueprintDefinition
	_check(canonical_cottage != null,
		"canonical Stage 1 cottage source is missing from Milestone 5")
	if canonical_cottage != null:
		_blueprints.append(canonical_cottage)
		_hashes.append(canonical_cottage.canonical_hash())
	_check(_blueprints.size() == 9, "Golden blueprint candidate count drifted")
	_check(_modules.size() == 12, "shared blueprint module count drifted")
	_check(_states.size() == 27, "blueprint state candidate count drifted")
	_check(_layers.size() == 4, "persistent surface source count drifted")
	_check(_graphs.size() == 6, "acoustic graph count drifted")
	_check(_profiles.size() == 6, "acoustic profile count drifted")
	_check(_plans.size() == 6, "ambience plan count drifted")
	for key in TARGETS:
		var blueprint := _blueprint(TARGETS[key])
		_check(blueprint != null, "Golden blueprint candidate is missing: %s" % key)
		if blueprint == null:
			continue
		_check(not blueprint.legacy_fallback.is_empty(),
			"Golden blueprint dropped its active legacy fallback: %s" % key)
		_check(blueprint.lifecycle in ["runtime_candidate", "golden_source_candidate"]
			and blueprint.visual_approval == "open",
			"Golden blueprint overstates approval: %s" % key)
		_check(_states_for(blueprint.blueprint_id).size() == 3,
			"Golden blueprint does not have three reversible state deltas: %s" % key)


func _verify_shared_index() -> void:
	var manifest := ForgeProjectManifestService.new()
	_check(manifest.load_and_validate().get("ok", false),
		"manifest failed before shared index validation")
	var density := ForgeDensityProfileRegistry.new()
	_check(density.load_and_validate(PackedStringArray(DENSITY_PATHS)).get("ok", false),
		"density registry failed before Milestone 5 indexing")
	var index := ForgeAssetIndex.new()
	var report := index.load_and_validate(
		manifest.manifest.source_roots, _semantic, density)
	_check(bool(report.get("ok", false)),
		"shared Forge index rejected Milestone 5: %s" %
		JSON.stringify(report.get("diagnostics", [])))
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"shared Forge index emitted Milestone 5 diagnostics")
	for blueprint in _blueprints:
		_check(index.has(blueprint.blueprint_id),
			"shared index cannot resolve blueprint: %s" % blueprint.blueprint_id)
	for module in _modules:
		_check(index.has(module.module_id),
			"shared index cannot resolve module: %s" % module.module_id)
	for state in _states:
		_check(index.has(state.state_id),
			"shared index cannot resolve state: %s" % state.state_id)
	var stage5_graphs := index.filtered_list("acoustic_zone_graph").filter(
		func(record: Dictionary) -> bool:
			return str(record.get("source_path", "")).begins_with(ROOT))
	var stage5_plans := index.filtered_list("ambience_plan").filter(
		func(record: Dictionary) -> bool:
			return str(record.get("source_path", "")).begins_with(ROOT))
	_check(stage5_graphs.size() == 6,
		"shared index acoustic graph filtering drifted")
	_check(stage5_plans.size() == 6,
		"shared index ambience plan filtering drifted")


func _verify_blueprint_compilation() -> void:
	var compiler := ForgeBlueprintCompiler.new()
	var load_report := compiler.load_and_validate(_blueprints, _modules, _states)
	_check(bool(load_report.get("ok", false)),
		"blueprint compiler rejected Golden sources")
	var report := compiler.compile_all()
	_check(bool(report.get("ok", false)), "blueprint compiler did not compile all targets")
	_products.assign(report.get("products", []))
	_check(_products.size() == 9, "compiled blueprint product count drifted")
	_check(str(report.get("deterministic_hash", "")).length() == 64,
		"compiled blueprint aggregate hash is invalid")
	var service_report := ForgeBakeService.new().compile_blueprint_sources(
		_blueprints, _modules, _states)
	_check(bool(service_report.get("ok", false)),
		"existing Forge bake service rejected blueprint compilation")
	_check(str(service_report.get("deterministic_hash", "")) ==
		str(report.get("deterministic_hash", "")),
		"shared bake service blueprint output is nondeterministic")
	_hashes.append(str(report.get("deterministic_hash", "")))
	var validator := ForgeBlueprintRuntimeValidationService.new()
	for product in _products:
		_check(validator.validate_product(product).is_empty(),
			"compiled blueprint product failed domain validation: %s" % product.product_id)
		_check(product.compiled_elements.size() >= 10,
			"compiled blueprint product is not materially assembled: %s" % product.product_id)
		_check(product.state_records.size() == 3,
			"compiled blueprint product state count drifted: %s" % product.product_id)
		_check(not product.legacy_fallback.is_empty(),
			"compiled blueprint product dropped its fallback: %s" % product.product_id)
		_hashes.append(product.canonical_hash())


func _verify_runtime_assembly_and_placement() -> void:
	var assembler := ForgeBlueprintRuntimeAssembler.new()
	var report := assembler.load_and_validate(_products)
	_check(bool(report.get("ok", false)), "blueprint runtime assembler rejected products")
	_check(assembler.filtered_list().size() == 9,
		"blueprint runtime filtered list count drifted")
	for key in TARGETS:
		var product := _product_for_blueprint(TARGETS[key])
		_check(product != null, "runtime product missing for target: %s" % key)
		if product == null:
			continue
		var instance := assembler.instantiate(product.product_id,
			"blueprint.instance.%s" % key, "complete", "", 4100)
		_check(instance != null, "runtime blueprint did not instantiate: %s" % key)
		if instance == null:
			continue
		add_child(instance)
		_check(_mesh_count(instance) >= 5,
			"runtime blueprint did not build physical meshes: %s" % key)
		_check(not instance.active_marker_roles.is_empty(),
			"runtime blueprint did not expose semantic markers: %s" % key)
		var complete_count := instance.active_element_ids.size()
		var foundation_report := instance.apply_construction_stage("foundation")
		_check(bool(foundation_report.get("ok", false))
			and instance.active_element_ids.size() < complete_count,
			"runtime blueprint construction stage did not change: %s" % key)
		instance.apply_construction_stage("complete")
		var damage_id := "blueprint.state.%s.light_damage" % key
		var damaged := instance.apply_state(damage_id)
		var roof_element_id := "block_group.roof" if key == "cottage" else "volume.roof"
		var has_rubble_source := false
		for record in product.compiled_elements:
			if str(record.get("element_id", "")) == \
					"module.damage_rubble/damage_rubble.primary":
				has_rubble_source = true
		_check(bool(damaged.get("ok", false))
			and (not has_rubble_source
				or "module.damage_rubble/damage_rubble.primary" in instance.active_element_ids)
			and roof_element_id not in instance.active_element_ids,
			"runtime blueprint damage delta failed: %s" % key)
		var repaired := instance.apply_state("blueprint.state.%s.repaired" % key)
		_check(bool(repaired.get("ok", false))
			and roof_element_id in instance.active_element_ids
			and (not has_rubble_source
				or "module.damage_rubble/damage_rubble.primary" not in instance.active_element_ids),
			"runtime blueprint repair delta failed: %s" % key)
		var snapshot := instance.snapshot()
		var restored := assembler.restore(snapshot)
		_check(restored != null and restored.runtime_hash() == instance.runtime_hash(),
			"runtime blueprint reconstruction drifted: %s" % key)
		_hashes.append(instance.runtime_hash())
		instance.queue_free()
		if restored != null:
			restored.free()
	var placement := ForgeBlueprintPlacementService.new()
	var profiles: Array[ForgePlacementProfile] = []
	for blueprint in _blueprints:
		profiles.append(blueprint.placement_profile)
	_check(placement.load_and_validate(profiles).get("ok", false),
		"placement service rejected Golden profiles")
	var cottage := _blueprint(TARGETS.cottage)
	var context := {"zone_role_id": "zone.role.placement", "slope": 1,
		"available_socket_role_ids": ["socket.role.road_access"],
		"available_network_role_ids": [], "origin": [12, 64, -8], "seed": 2205}
	var first := placement.resolve(cottage.placement_profile, context)
	var second := placement.resolve(cottage.placement_profile, context)
	_check(first.get("ok", false) and not first.get("fallback_used", true),
		"valid cottage placement did not resolve exactly")
	_check(first.get("placement_hash", "") == second.get("placement_hash", ""),
		"placement resolution is nondeterministic")
	var fallback_context := context.duplicate(true)
	fallback_context.slope = 8
	fallback_context.available_socket_role_ids = []
	fallback_context.progression_critical = true
	var fallback := placement.resolve(cottage.placement_profile, fallback_context)
	_check(fallback.get("ok", false) and fallback.get("fallback_used", false),
		"progression-critical worldgen did not use its safe fallback")
	_hashes.append(str(first.get("placement_hash", "")))
	_hashes.append(str(fallback.get("placement_hash", "")))


func _verify_acoustics_and_ambience() -> void:
	var acoustics := ForgeAcousticRuntimeService.new()
	var report := acoustics.load_and_validate(_graphs, _profiles, _plans)
	_check(bool(report.get("ok", false)),
		"acoustic runtime rejected authored structure graphs: %s" %
		JSON.stringify(report.get("diagnostics", [])))
	_check(acoustics.filtered_list().size() == 6,
		"acoustic runtime filtered graph count drifted")
	var cottage_graph := "acoustic.zone_graph.cottage.stage5"
	_check(acoustics.zone_at(cottage_graph, Vector3(1, 1, 1)) ==
		"acoustic.zone.cottage.interior", "cottage interior zone did not resolve")
	_check(acoustics.zone_at(cottage_graph, Vector3(-4, 1, 1)) ==
		"acoustic.zone.exterior", "cottage exterior zone did not resolve")
	var closed := acoustics.source_to_listener(
		cottage_graph, Vector3(1, 1, 1), Vector3(-4, 1, 1))
	_check(closed.get("ok", false) and float(closed.get("transmission", 1.0)) < 0.2,
		"closed cottage door did not attenuate sound")
	_check(acoustics.set_portal_state(cottage_graph,
		"acoustic.portal.cottage.front_door", 1.0),
		"cottage door portal state did not update")
	var opened := acoustics.source_to_listener(
		cottage_graph, Vector3(1, 1, 1), Vector3(-4, 1, 1))
	_check(float(opened.get("transmission", 0.0)) > float(closed.get("transmission", 1.0)),
		"open cottage door did not increase sound transmission")
	var rain := acoustics.rain_response(cottage_graph, Vector3(1, 1, 1), 0.8)
	_check(rain.get("sheltered", false) and is_zero_approx(rain.get("direct_rain", 1.0))
		and float(rain.get("roof_contact", 0.0)) > 0.0,
		"rain shelter response did not aggregate roof contact")
	var workshop_graph := "acoustic.zone_graph.workshop.stage5"
	var workshop: ForgeAcousticZoneGraph = acoustics.resolve(workshop_graph)
	_check(workshop != null and workshop.portals.size() == 2,
		"workshop did not retain front-door and chimney portals")
	var ambience := acoustics.ambience_snapshot(
		"acoustic.ambience.workshop.stage5", {"occupied": true, "raining": true})
	_check(ambience.get("ok", false)
		and (ambience.get("components", []) as Array).size() == 2,
		"workshop ambience did not compose occupation and rain")
	_check(int(ambience.get("virtualised_count", -1)) == 0,
		"bounded workshop ambience virtualisation count drifted")
	_hashes.append(str(ambience.get("hash", "")))
	_hashes.append(ForgeStableRecord.hash_record(acoustics.portal_state_snapshot()))


func _verify_persistent_world_state() -> void:
	var wetness := ResourceLoader.load(
		"res://content/forge/presentation/set23/foundation/" \
		+ "surface_layer_environment_wetness_foundation.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE) as ForgeSurfaceLayer
	var layers := _layers.duplicate()
	layers.append(wetness)
	var store := ForgePersistentSurfaceStore.new()
	var report := store.load_and_validate(layers)
	_check(bool(report.get("ok", false)), "persistent surface store rejected layers")
	for layer in layers:
		var applied := store.apply_layer(layer.stable_id, "structure.watchtower.01",
			"chunk.0.0", Vector3(1, 2, 3), 0.45, 100, 23)
		_check(applied.get("ok", false),
			"persistent surface layer did not apply: %s" % layer.stable_id)
	var merged := store.apply_layer("surface.layer.scorch.stage5",
		"structure.watchtower.01", "chunk.0.0", Vector3(1, 2, 3), 0.8, 120, 23)
	_check(merged.get("merged", false)
		and is_equal_approx(merged.record.intensity, 0.8),
		"persistent scorch did not merge by bounded policy")
	for index in 33:
		store.apply_layer("surface.layer.scorch.stage5", "structure.%d" % index,
			"chunk.budget", Vector3(index, 0, 0), 0.1 + float(index) * 0.01,
			200 + index, index)
	_check(store.filtered_list("surface.layer.scorch.stage5", "chunk.budget").size() == 32,
		"persistent surface chunk budget was not enforced")
	var before_expiry := store.filtered_list("surface.layer.repair_patch.stage5").size()
	_check(before_expiry == 1 and store.advance(7401) >= 1,
		"expiring repair presentation did not age out")
	var encoded := store.serialize_state()
	_check(int(encoded.get("save_version", 0)) == 17,
		"persistent surface state changed the save version")
	var encoded_hash := store.canonical_hash()
	var restored_store := ForgePersistentSurfaceStore.new()
	_check(restored_store.load_and_validate(layers).get("ok", false)
		and restored_store.restore_state(JSON.parse_string(JSON.stringify(encoded))),
		"persistent surface state did not restore")
	_check(restored_store.canonical_hash() == encoded_hash,
		"persistent surface state hash drifted after JSON round-trip")
	_hashes.append(encoded_hash)
	var world_state := ForgeWorldPresentationStateService.new()
	_check(world_state.configure(_products, layers).get("ok", false),
		"world presentation state service did not configure")
	for key in ["cottage", "workshop", "watchtower"]:
		var product := _product_for_blueprint(TARGETS[key])
		var snapshot := ForgeBlueprintInstanceSnapshot.new()
		snapshot.instance_id = "structure.%s.01" % key
		snapshot.product_id = product.product_id
		snapshot.blueprint_id = product.blueprint_id
		snapshot.construction_stage_id = "roof" if key == "watchtower" else "complete"
		snapshot.state_id = "blueprint.state.%s.repaired" % key
		snapshot.transform_record = {"origin": [2, 64, 2],
			"rotation": [0, 0, 0], "scale": [1, 1, 1]}
		snapshot.seed = 1700
		_check(world_state.register_instance(snapshot),
			"world presentation snapshot did not register: %s" % key)
	world_state.set_portal_state(cottage_graph_id(),
		"acoustic.portal.cottage.front_door", 0.35)
	world_state.surface_store.apply_layer("surface.layer.soot.stage5",
		"structure.workshop.01", "chunk.1.0", Vector3(4, 67, 4), 0.6, 300, 5)
	var world_record := world_state.serialize_state()
	_check(int(world_record.get("save_version", 0)) == 17
		and (world_record.get("blueprint_instances", []) as Array).size() == 3,
		"optional world presentation record is not save-v17 compatible")
	var world_hash := world_state.canonical_hash()
	var restored_world := ForgeWorldPresentationStateService.new()
	_check(restored_world.configure(_products, layers).get("ok", false)
		and restored_world.restore_state(
			JSON.parse_string(JSON.stringify(world_record))),
		"optional world presentation state did not restore")
	_check(restored_world.canonical_hash() == world_hash,
		"optional world presentation state hash drifted: %s != %s; %s" % [
			world_hash, restored_world.canonical_hash(),
			JSON.stringify(restored_world.serialize_state())])
	_check(restored_world.has("structure.cottage.01")
		and restored_world.acoustic_portal_states().size() == 1,
		"blueprint or portal state was lost during restore")
	var empty_world := ForgeWorldPresentationStateService.new()
	_check(empty_world.configure(_products, layers).get("ok", false)
		and empty_world.restore_state({})
		and empty_world.filtered_list().is_empty(),
		"missing v17 presentation fields did not reconstruct safe defaults")
	_hashes.append(world_hash)


func _verify_negative_cases() -> void:
	var compiler := ForgeBlueprintCompiler.new()
	var one_blueprint: Array[ForgeBlueprintDefinition] = [_blueprints[0]]
	var no_modules: Array[ForgeBlueprintModuleDefinition] = []
	var one_states: Array[ForgeBlueprintStateDefinition] = []
	var missing_report := compiler.load_and_validate(one_blueprint, no_modules, one_states)
	_check(not missing_report.get("ok", true)
		and _has_code(missing_report.get("diagnostics", []), "EFB-DEP-001"),
		"missing blueprint modules were not diagnosed")
	var bad_state := ForgeBlueprintStateDefinition.new()
	bad_state.state_id = "blueprint.state.bad.self"
	bad_state.blueprint_id = TARGETS.cottage
	bad_state.parent_state_id = bad_state.state_id
	bad_state.state_kind = "unsupported"
	var state_diagnostics := ForgeBlueprintRuntimeValidationService.new().validate_state(
		bad_state, _semantic)
	_check(_has_diagnostic(state_diagnostics, "EFB-BP-010")
		and _has_diagnostic(state_diagnostics, "EFB-BP-001"),
		"invalid blueprint state contract was not diagnosed")
	var bad_graph := ForgeAcousticZoneGraph.new()
	bad_graph.stable_id = "acoustic.zone_graph.bad"
	bad_graph.owner_blueprint_id = TARGETS.cottage
	bad_graph.zones = [{"zone_id": "acoustic.zone.bad", "minimum": [2, 2, 2],
		"maximum": [1, 1, 1]}]
	bad_graph.portals = [{"portal_id": "acoustic.portal.bad",
		"from_zone_id": "acoustic.zone.missing", "to_zone_id": "acoustic.zone.exterior"}]
	var graph_diagnostics := ForgeBlueprintRuntimeValidationService.new().validate_acoustic_graph(
		bad_graph)
	_check(_has_diagnostic(graph_diagnostics, "ACU-001")
		and _has_diagnostic(graph_diagnostics, "ACU-002"),
		"invalid acoustic zones/portals were not diagnosed")
	var unsafe_layer := ForgeSurfaceLayer.new()
	unsafe_layer.stable_id = "surface.layer.unsafe"
	unsafe_layer.persistence_policy = "persistent"
	unsafe_layer.save_policy = "not_saved"
	unsafe_layer.maximum_records_per_chunk = 0
	var unsafe_report := ForgePersistentSurfaceStore.new().load_and_validate([unsafe_layer])
	_check(not unsafe_report.get("ok", true)
		and _has_code(unsafe_report.get("diagnostics", []), "BUD-001")
		and _has_code(unsafe_report.get("diagnostics", []), "SRC-001"),
		"unsafe persistent surface policy was not diagnosed")
	var state_service := ForgeWorldPresentationStateService.new()
	var layers := _layers.duplicate()
	_check(state_service.configure(_products, layers).get("ok", false)
		and not state_service.restore_state({"schema_version": 99,
			"save_version": 17, "blueprint_instances": []}),
		"unsupported world presentation state schema was not rejected")


func cottage_graph_id() -> String:
	return "acoustic.zone_graph.cottage.stage5"


func _blueprint(blueprint_id: String) -> ForgeBlueprintDefinition:
	for blueprint in _blueprints:
		if blueprint.blueprint_id == blueprint_id:
			return blueprint
	return null


func _product_for_blueprint(blueprint_id: String) -> ForgeBlueprintRuntimeProduct:
	for product in _products:
		if product.blueprint_id == blueprint_id:
			return product
	return null


func _states_for(blueprint_id: String) -> Array[ForgeBlueprintStateDefinition]:
	var result: Array[ForgeBlueprintStateDefinition] = []
	for state in _states:
		if state.blueprint_id == blueprint_id:
			result.append(state)
	return result


func _mesh_count(node: Node) -> int:
	var count := 1 if node is MeshInstance3D else 0
	for child in node.get_children():
		count += _mesh_count(child)
	return count


func _resource_files(root: String) -> Array[String]:
	var result: Array[String] = []
	for file_name in DirAccess.get_files_at(root):
		if file_name.ends_with(".tres"):
			result.append(root.path_join(file_name))
	for directory_name in DirAccess.get_directories_at(root):
		result.append_array(_resource_files(root.path_join(directory_name)))
	result.sort()
	return result


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
