extends Node
## Set 23 Milestone 4 compiled VFX/audio/material runtime gate.

const ROOT := "res://content/forge/runtime/set23_stage4"
const FOUNDATION := "res://content/forge/presentation/set23/foundation"
const EXPECTED_CHECKS := 436
const EXPECTED_HASH := "4e8dab37ac015e8db0afd198e2448bf2d4f8ef2e4b1f739bb9e43faf54088d92"
const KEYS := ["mining", "footsteps", "furnace_lifecycle", "mana_conduit",
	"ward_warning", "rain_shelter", "village_ambience", "goblin_raid"]
const LOOPS := ["furnace_lifecycle", "mana_conduit", "rain_shelter",
	"village_ambience"]

var _checks := 0
var _failures: Array[String] = []
var _hashes: Array[String] = []
var _graphs: Array[ForgeVfxGraph] = []
var _forms: Array[ForgeVfxForm] = []
var _effects: Array[ForgeVfxDefinition] = []
var _sounds: Array[ForgeSoundEvent] = []
var _material_table: ForgeMaterialResponseTable


func _ready() -> void:
	_verify_schemas_manifest_and_index()
	_load_sources()
	_verify_compilers_and_roundtrips()
	_verify_material_resolution()
	_verify_runtime_scenarios()
	_verify_negative_and_budget_cases()
	_hashes.sort()
	var deterministic_hash := ForgeStableRecord.hash_record({"hashes": _hashes})
	_check(deterministic_hash.length() == 64,
		"Stage 4 deterministic aggregate is not SHA-256")
	if not EXPECTED_HASH.is_empty():
		_check(deterministic_hash == EXPECTED_HASH,
			"Stage 4 deterministic aggregate hash drifted")
	_check(_checks + 1 == EXPECTED_CHECKS,
		"pinned check count changed: expected %d, got %d" % [EXPECTED_CHECKS, _checks + 1])
	print("SET23_STAGE4_RUNTIME_PRESENTATION_PROBE %s" % JSON.stringify({
		"ok": _failures.is_empty(), "checks": _checks,
		"failures": _failures, "deterministic_hash": deterministic_hash}))
	get_tree().quit(0 if _failures.is_empty() else 1)


func _verify_schemas_manifest_and_index() -> void:
	var schemas := ForgeSchemaRegistry.new()
	_check(schemas.has("leyforge.forge.compiled-vfx-product"),
		"compiled VFX product schema is not registered")
	_check(schemas.has("leyforge.forge.compiled-sound-plan"),
		"compiled sound plan schema is not registered")
	_check(schemas.filtered_list("vfx_runtime").size() == 1,
		"VFX runtime schema family count drifted")
	_check(schemas.filtered_list("audio_runtime").size() == 1,
		"audio runtime schema family count drifted")
	var manifest_service := ForgeProjectManifestService.new()
	var manifest_report := manifest_service.load_and_validate()
	_check(bool(manifest_report.get("ok", false)),
		"Stage 4 project manifest did not validate")
	_check(ROOT in manifest_service.manifest.source_roots,
		"Stage 4 source root is not in the common manifest")
	for feature in {"set23_vfx_runtime": "23-vfx-runtime-v1",
			"set23_audio_runtime": "23-audio-runtime-v1",
			"set23_material_runtime": "23-material-runtime-v1"}:
		_check(str(manifest_service.manifest.feature_contract_versions.get(
			feature, "")) == {"set23_vfx_runtime": "23-vfx-runtime-v1",
			"set23_audio_runtime": "23-audio-runtime-v1",
			"set23_material_runtime": "23-material-runtime-v1"}[feature],
			"Stage 4 feature contract is absent or drifted: %s" % feature)
	var semantic := ForgeSemanticRegistry.new()
	_check(bool(semantic.load_and_validate().get("ok", false)),
		"semantic registry did not load for Stage 4")
	var density := ForgeDensityProfileRegistry.new()
	var density_paths := PackedStringArray([
		"res://content/forge/entities/density_profiles/density_profile_entity_coarse.tres",
		"res://content/forge/entities/density_profiles/density_profile_entity_colossal_modular.tres",
		"res://content/forge/entities/density_profiles/density_profile_entity_fine.tres",
		"res://content/forge/entities/density_profiles/density_profile_entity_micro_accent.tres",
		"res://content/forge/entities/density_profiles/density_profile_entity_standard.tres"])
	_check(bool(density.load_and_validate(density_paths).get("ok", false)),
		"density registry did not load for Stage 4 index")
	var index := ForgeAssetIndex.new()
	var index_report := index.load_and_validate(PackedStringArray([
		"res://content/forge/entities", "res://content/forge/materials/set22",
		"res://content/forge/presentation/set23",
		"res://content/forge/runtime/set22_23",
		"res://content/forge/runtime/set22_23_stage3", ROOT]), semantic, density)
	_check(bool(index_report.get("ok", false)),
		"common Forge index rejected Stage 4 sources: %s" %
		JSON.stringify(index_report.get("diagnostics", [])))
	_check((index_report.get("diagnostics", []) as Array).is_empty(),
		"common Forge index retained Stage 4 diagnostics")
	var files := _resource_files(ROOT)
	_check(files.size() == 62, "Stage 4 source Resource count drifted")
	var stage4_records := 0
	for record in index.filtered_list():
		if str(record.get("source_path", "")).begins_with(ROOT):
			stage4_records += 1
	_check(stage4_records == 62,
		"common Forge index did not discover every Stage 4 source")
	for key in KEYS:
		for stable_id in ["vfx.effect.golden.%s.stage4" % key,
				"sound.event.golden.%s.stage4" % key,
				"presentation.profile.golden.%s.stage4" % key,
				"presentation.binding.golden.%s.stage4" % key,
				"test.presentation.golden.%s.stage4" % key]:
			_check(index.has(stable_id),
				"Golden Core index target is missing: %s" % stable_id)
	var roundtrip_root := "user://set23_stage4_source_roundtrips"
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(roundtrip_root))
	for path in files:
		var resource := _load(path)
		_check(resource != null and resource.has_method("canonical_hash"),
			"Stage 4 source did not load/hash: %s" % path)
		if resource == null or not resource.has_method("canonical_hash"):
			continue
		var source_hash := str(resource.call("canonical_hash"))
		var target_path := "%s/%s" % [roundtrip_root, path.get_file()]
		_check(ResourceSaver.save(resource, target_path) == OK,
			"Stage 4 source did not serialise")
		var loaded := _load(target_path)
		_check(loaded != null and str(loaded.call("canonical_hash")) == source_hash,
			"Stage 4 source hash changed after round-trip")
		_hashes.append(source_hash)


func _load_sources() -> void:
	for key in KEYS:
		_graphs.append(_load("%s/vfx_graph_%s.tres" % [ROOT, key]) as ForgeVfxGraph)
		_forms.append(_load("%s/vfx_form_%s.tres" % [ROOT, key]) as ForgeVfxForm)
		_effects.append(_load("%s/vfx_effect_%s.tres" % [ROOT, key]) as ForgeVfxDefinition)
		_sounds.append(_load("%s/sound_event_%s.tres" % [ROOT, key]) as ForgeSoundEvent)
	_material_table = _load("%s/material_response_golden_core.tres" % ROOT) \
		as ForgeMaterialResponseTable
	_check(not _graphs.has(null) and _graphs.size() == 8,
		"Golden Core VFX graph inventory is incomplete")
	_check(not _forms.has(null) and _forms.size() == 8,
		"Golden Core VFX form inventory is incomplete")
	_check(not _effects.has(null) and _effects.size() == 8,
		"Golden Core VFX effect inventory is incomplete")
	_check(not _sounds.has(null) and _sounds.size() == 8,
		"Golden Core Sound Event inventory is incomplete")
	_check(_material_table != null,
		"Golden Core material response table is missing")


func _verify_compilers_and_roundtrips() -> void:
	var vfx_compiler := ForgeVfxGraphCompiler.new()
	var vfx_report := vfx_compiler.load_and_validate(_graphs, _forms, _effects)
	_check(bool(vfx_report.get("ok", false)),
		"VFX graph compiler rejected Golden Core sources")
	_check((vfx_report.get("diagnostics", []) as Array).is_empty(),
		"VFX graph compiler retained diagnostics")
	_check(int(vfx_report.get("definition_count", 0)) == 8,
		"VFX compiler definition count drifted")
	var vfx_result := vfx_compiler.compile_all()
	_check(bool(vfx_result.get("ok", false)),
		"VFX compiler did not compile every Golden Core effect")
	var products: Array[ForgeCompiledVfxProduct] = vfx_result.products
	_check(products.size() == 8, "compiled VFX product count drifted")
	var source := _load("%s/sound_source_legacy_mining_stone_foundation.tres" % FOUNDATION) \
		as ForgeSoundSource
	var spatial := _load("%s/sound_spatial_profile_contact_near_foundation.tres" % FOUNDATION) \
		as ForgeSpatialAudioProfile
	var sound_compiler := ForgeSoundPlanCompiler.new()
	var sound_report := sound_compiler.load_and_validate(
		_sounds, [source], [spatial])
	_check(bool(sound_report.get("ok", false)),
		"Sound plan compiler rejected Golden Core sources")
	_check((sound_report.get("diagnostics", []) as Array).is_empty(),
		"Sound plan compiler retained diagnostics")
	var sound_result := sound_compiler.compile_all()
	_check(bool(sound_result.get("ok", false)),
		"Sound compiler did not compile every Golden Core event")
	var plans: Array[ForgeCompiledSoundPlan] = sound_result.plans
	_check(plans.size() == 8, "compiled Sound Event plan count drifted")
	var bake_service := ForgeBakeService.new()
	var shared_vfx := bake_service.compile_vfx_sources(_graphs, _forms, _effects)
	var shared_sound := bake_service.compile_sound_sources(_sounds, [source], [spatial])
	_check(bool(shared_vfx.get("ok", false)) and
		(shared_vfx.get("products", []) as Array).size() == 8,
		"shared Forge bake service did not compile VFX")
	_check(bool(shared_sound.get("ok", false)) and
		(shared_sound.get("plans", []) as Array).size() == 8,
		"shared Forge bake service did not compile Sound Events")
	var product_root := "user://set23_stage4_compiled_roundtrips"
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(product_root))
	for product in products:
		_check(product.product_id.begins_with("runtime.vfx."),
			"compiled VFX product ID is outside the runtime namespace")
		_check(product.maximum_spawn_count > 0 and product.maximum_spawn_count <= 256,
			"compiled VFX product has an unsafe spawn bound")
		_check(product.maximum_lifetime_seconds > 0.0 and
			product.maximum_lifetime_seconds <= 30.0,
			"compiled VFX product has an unsafe lifetime bound")
		_roundtrip_product(product, product_root)
		_hashes.append(product.product_hash)
	for plan in plans:
		_check(plan.plan_id.begins_with("runtime.sound."),
			"compiled sound plan ID is outside the runtime namespace")
		_check(plan.maximum_voices > 0 and plan.maximum_voices <= 8,
			"compiled sound plan has an unsafe voice bound")
		_roundtrip_product(plan, product_root)
		_hashes.append(plan.product_hash)
	set_meta("stage4_products", products)
	set_meta("stage4_plans", plans)
	set_meta("stage4_sound_source", source)
	set_meta("stage4_spatial_audio", spatial)


func _verify_material_resolution() -> void:
	var resolver := ForgeMaterialResponseResolver.new()
	var report := resolver.load_and_validate([_material_table])
	_check(bool(report.get("ok", false)),
		"material response resolver rejected Golden Core table")
	_check(resolver.has(_material_table.stable_id),
		"material response resolver cannot find Golden Core table")
	for key in KEYS:
		var spec := _scenario_spec(key)
		var result := resolver.resolve(_material_table.stable_id, {
			"action": spec.action, "target_family": spec.surface,
			"intensity_band": "standard", "wetness_band": "dry",
			"environment": "outdoor", "state": "active"})
		_check(bool(result.get("ok", false)),
			"Golden Core material response did not resolve")
		_check(str(result.get("profile_id", "")) ==
			"presentation.profile.golden.%s.stage4" % key,
			"Golden Core material response selected the wrong profile")
		_hashes.append(str(result.get("resolution_hash", "")))
	var fallback := resolver.resolve(_material_table.stable_id, {
		"action": "unknown", "target_family": "unknown"})
	_check(str(fallback.get("quality", "")) == "safe_default",
		"unknown material response did not use safe default")
	_check(str(fallback.get("profile_id", "")) ==
		"presentation.profile.golden.mining.stage4",
		"unknown material response default drifted")
	set_meta("stage4_material_resolver", resolver)


func _verify_runtime_scenarios() -> void:
	var budget_profile := _load("%s/budget_profile_presentation_foundation.tres" % FOUNDATION) \
		as ForgePresentationBudgetProfile
	var accessibility := _load("%s/access_profile_presentation_foundation.tres" % FOUNDATION) \
		as ForgeAccessibilityProfile
	var budget := ForgePresentationBudgetManager.new()
	var budget_report := budget.load_and_validate(budget_profile)
	_check(bool(budget_report.get("ok", false)),
		"shared presentation budget did not validate")
	var vfx := ForgeVfxRuntimeManager.new()
	var sound := ForgeSoundRuntimeManager.new()
	var products: Array[ForgeCompiledVfxProduct] = get_meta("stage4_products")
	var plans: Array[ForgeCompiledSoundPlan] = get_meta("stage4_plans")
	var source: ForgeSoundSource = get_meta("stage4_sound_source")
	var spatial: ForgeSpatialAudioProfile = get_meta("stage4_spatial_audio")
	var vfx_report := vfx.load_and_validate(products, budget)
	var sound_report := sound.load_and_validate(
		plans, [source], [spatial], [accessibility], budget)
	_check(bool(vfx_report.get("ok", false)),
		"VFX runtime rejected compiled Golden Core products")
	_check(bool(sound_report.get("ok", false)),
		"sound runtime rejected compiled Golden Core plans")
	var dispatcher := ForgeRuntimePresentationDispatcher.new()
	add_child(dispatcher)
	var configured := dispatcher.configure(
		vfx, sound, get_meta("stage4_material_resolver"))
	_check(bool(configured.get("ok", false)),
		"shared runtime presentation dispatcher did not configure")
	for index in KEYS.size():
		var key: String = KEYS[index]
		var effect_id := "vfx.effect.golden.%s.stage4" % key
		var sound_id := "sound.event.golden.%s.stage4" % key
		var transform := Transform3D(Basis.IDENTITY,
			Vector3(float(index) * 2.0, 1.0, -float(index)))
		var parameters := {"intensity": 0.75,
			"action": _scenario_spec(key).action,
			"target_family": _scenario_spec(key).surface}
		var commands := [_command("play", key, "vfx", effect_id, parameters),
			_command("play", key, "audio", sound_id, parameters)]
		var result := dispatcher.dispatch_all(commands, transform)
		_check(bool(result.get("ok", false)),
			"Golden Core scenario did not dispatch: %s" % key)
		_check((result.get("results", []) as Array).size() == 2,
			"Golden Core scenario did not emit VFX and audio")
		var vfx_record: Dictionary = result.results[0]
		var sound_record: Dictionary = result.results[1]
		_check(int(vfx_record.get("particle_count", 0)) <=
			int(_scenario_spec(key).spawn),
			"Golden Core VFX exceeded its compiled spawn bound")
		_check(bool(sound_record.get("legacy_fallback", false)),
			"unverified Golden Core audio did not retain legacy fallback")
		_check(str(vfx_record.get("instance_hash", "")).length() == 64,
			"Golden Core VFX instance did not hash")
		_check(str(sound_record.get("instance_hash", "")).length() == 64,
			"Golden Core sound instance did not hash")
		if key in LOOPS:
			var update_result := dispatcher.dispatch_all([
				_command("update", key, "vfx", effect_id, {"intensity": 0.5}),
				_command("update", key, "audio", sound_id, {"intensity": 0.5})],
				transform)
			_check(bool(update_result.get("ok", false)),
				"Golden Core managed loop did not update")
			var advanced := dispatcher.advance(0.5)
			_check(str(advanced.get("runtime_hash", "")).length() == 64,
				"Golden Core managed loop did not preserve phase")
			var stop_result := dispatcher.dispatch_all([
				_command("stop", key, "vfx", effect_id, {}),
				_command("stop", key, "audio", sound_id, {})], transform)
			_check(bool(stop_result.get("ok", false)),
				"Golden Core managed loop did not stop")
		else:
			var product := _product_for(products, effect_id)
			var advanced := dispatcher.advance(product.maximum_lifetime_seconds + 0.1)
			_check(str(advanced.get("runtime_hash", "")).length() == 64,
				"Golden Core one-shot lifecycle did not advance")
		_hashes.append(str(result.get("dispatch_hash", "")))
	_check(sound.captions().size() == 8,
		"Golden Core caption routing count drifted")
	_check(vfx.snapshot().active.is_empty(),
		"Golden Core VFX retained unbounded active instances")
	_check(sound.snapshot().active.is_empty(),
		"Golden Core audio retained unbounded active voices")
	var budget_snapshot := budget.snapshot()
	for kind in budget_snapshot.used:
		_check(int(budget_snapshot.used[kind]) <=
			int(budget_snapshot.limits.get(kind, 0)),
			"shared presentation runtime exceeded budget: %s" % kind)
	_check(vfx.snapshot().pool_size > 0,
		"VFX runtime did not return MultiMesh instances to its pool")
	var runtime_snapshot := dispatcher.snapshot()
	_check(str(runtime_snapshot.get("runtime_hash", "")).length() == 64,
		"runtime presentation snapshot did not hash")
	_hashes.append(runtime_snapshot.runtime_hash)
	dispatcher.queue_free()


func _verify_negative_and_budget_cases() -> void:
	var bad_graph := ForgeVfxGraph.new()
	bad_graph.stable_id = "vfx.graph.invalid.cycle"
	bad_graph.display_name = "Invalid Cycle"
	bad_graph.nodes = [{"id": "a", "type": "bounded_spawn"},
		{"id": "b", "type": "voxel_multimesh_output"}]
	bad_graph.edges = [{"from": "a", "to": "b"}, {"from": "b", "to": "a"}]
	bad_graph.maximum_nodes = 2
	bad_graph.maximum_spawn_count = 4
	bad_graph.maximum_lifetime_seconds = 1.0
	bad_graph.lifecycle = "foundation"
	bad_graph.source_status = "validated_runtime_source"
	bad_graph.rights_status = "not_applicable"
	var diagnostics := ForgePresentationValidationService.new().validate(bad_graph)
	_check(_has_code(diagnostics, "VFX-002"),
		"cyclic VFX graph did not emit VFX-002")
	var critical_sound := ForgeSoundEvent.new()
	critical_sound.stable_id = "sound.event.invalid.critical"
	critical_sound.display_name = "Invalid Critical Cue"
	critical_sound.source_ids = PackedStringArray(["sound.source.invalid"])
	critical_sound.maximum_voices = 1
	critical_sound.spatial_audio_profile_id = "sound.spatial_profile.invalid"
	critical_sound.critical_cue = true
	critical_sound.lifecycle = "foundation"
	critical_sound.source_status = "validated_runtime_source"
	critical_sound.rights_status = "not_applicable"
	var sound_diagnostics := ForgePresentationValidationService.new().validate(
		critical_sound)
	_check(_has_code(sound_diagnostics, "SND-003"),
		"critical sound without caption did not emit SND-003")
	var tiny := ForgePresentationBudgetProfile.new()
	tiny.stable_id = "budget.profile.test.tiny"
	tiny.maximum_particles = 2
	tiny.maximum_voices = 1
	tiny.maximum_lights = 1
	tiny.maximum_surface_records = 1
	tiny.maximum_updates_per_second = 1
	tiny.fallback_chain = PackedStringArray(["full", "virtualised"])
	tiny.lifecycle = "foundation"
	tiny.source_status = "validated_runtime_source"
	tiny.rights_status = "not_applicable"
	var budget := ForgePresentationBudgetManager.new()
	_check(bool(budget.load_and_validate(tiny).get("ok", false)),
		"tiny bounded budget did not validate")
	var first := budget.request("first", "particles", 4)
	var second := budget.request("second", "particles", 1)
	_check(int(first.get("granted", 0)) == 2 and
		str(first.get("quality", "")) == "reduced",
		"budget manager did not degrade an oversized request")
	_check(int(second.get("granted", -1)) == 0 and
		str(second.get("quality", "")) == "virtualised",
		"budget manager did not virtualise exhausted work")
	budget.release("first")
	_check(int(budget.snapshot().used.particles) == 0,
		"budget manager did not release pooled capacity")


func _roundtrip_product(resource: Resource, root: String) -> void:
	var id := str(resource.get("product_id")) if resource is ForgeCompiledVfxProduct \
		else str(resource.get("plan_id"))
	var path := "%s/%s.tres" % [root, ForgeId.safe_filename(id)]
	var source_hash := str(resource.call("canonical_hash"))
	_check(ResourceSaver.save(resource, path) == OK,
		"compiled runtime product did not serialise")
	var loaded := _load(path)
	_check(loaded != null and str(loaded.call("canonical_hash")) == source_hash,
		"compiled runtime product changed after round-trip")


func _command(verb: String, key: String, component_type: String,
		component_id: String, parameters: Dictionary) -> Dictionary:
	return {"command": verb, "ownership_key": "%s|%s" % [key, component_type],
		"component_type": component_type, "component_id": component_id,
		"parameters": parameters.duplicate(true), "deterministic_seed": 23004}


func _product_for(products: Array[ForgeCompiledVfxProduct],
		effect_id: String) -> ForgeCompiledVfxProduct:
	for product in products:
		if product.source_definition_id == effect_id:
			return product
	return null


func _scenario_spec(key: String) -> Dictionary:
	var actions := {"mining": ["mining", "stone", 18],
		"footsteps": ["footstep", "soil", 8],
		"furnace_lifecycle": ["machine_operating", "metal", 24],
		"mana_conduit": ["mana_flow", "arcane", 20],
		"ward_warning": ["ward_warning", "arcane", 32],
		"rain_shelter": ["rain_contact", "generic", 48],
		"village_ambience": ["village_ambience", "generic", 12],
		"goblin_raid": ["raid_warning", "generic", 36]}
	var value: Array = actions[key]
	return {"action": value[0], "surface": value[1], "spawn": value[2]}


func _resource_files(root: String) -> Array[String]:
	var result: Array[String] = []
	for file_name in DirAccess.get_files_at(root):
		if file_name.ends_with(".tres"):
			result.append(root.path_join(file_name))
	result.sort()
	return result


func _load(path: String) -> Resource:
	return ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)


func _has_code(diagnostics: Array[ForgeDiagnostic], code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic != null and diagnostic.code == code:
			return true
	return false


func _check(condition: bool, message: String) -> void:
	_checks += 1
	if not condition:
		_failures.append(message)
