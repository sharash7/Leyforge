extends Node
## Focused creator-core probe for shared authoring, synth and modular structures.

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	ForgeAccessPolicy.test_override = true
	_test_schema_and_registry()
	_test_synth()
	_test_modular_structures()
	_test_visual_structure_source()
	_test_document_lifecycle()
	_test_creator_bakes()
	ForgeAccessPolicy.clear_test_override()
	print(JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_schema_and_registry() -> void:
	var schemas := ForgeSchemaRegistry.new()
	_expect(schemas.has("leyforge.forge.synth-patch"), "synth schema registered")
	_expect(schemas.has("leyforge.forge.blueprint-module-set"), "module set schema registered")
	_expect(schemas.has("leyforge.forge.procedural-structure-rule-set"), "rule schema registered")
	_expect(schemas.has("leyforge.forge.structure-voxel-source"),
		"visual structure source schema registered")
	_expect(schemas.has("leyforge.forge.structure-voxel-cell"),
		"persistent structure cell schema registered")
	var registry := ForgeAuthoringTypeRegistry.new()
	_expect(registry.all("structures").size() == 5, "structure creator types available")
	_expect(registry.all("characters").size() == 7, "character creator types available")
	_expect(registry.all("vfx").size() == 3, "vfx creator types available")
	_expect(registry.all("audio").size() == 4, "audio creator types available")
	for descriptor in registry.all():
		var resource := registry.create(
			descriptor.type_id, "probe_%s" % descriptor.type_id.replace(".", "_"),
			"Probe %s" % descriptor.display_name)
		_expect(resource != null, "%s source can be created" % descriptor.type_id)
		_expect(registry.for_resource(resource) != null,
			"%s source resolves its descriptor" % descriptor.type_id)
		_expect(ForgeId.is_valid(descriptor.identity(resource), descriptor.id_prefix),
			"%s source receives a stable ID" % descriptor.type_id)


func _test_synth() -> void:
	var registry := ForgeAuthoringTypeRegistry.new()
	var patch: ForgeSynthPatchDefinition = registry.create(
		"audio.synth_patch", "probe_bell", "Probe Bell")
	patch.sample_rate_hz = 8000
	patch.note_duration_seconds = 0.05
	patch.amplitude_envelope["release_seconds"] = 0.01
	patch.filter_settings["cutoff_hz"] = 3000.0
	patch.oscillators = [
		{"waveform": "sine", "level": 0.8, "detune_cents": 0.0,
			"octave": 0, "phase": 0.0, "pulse_width": 0.5},
		{"waveform": "triangle", "level": 0.25, "detune_cents": 7.0,
			"octave": 1, "phase": 0.0, "pulse_width": 0.5},
	]
	var diagnostics := ForgePresentationValidationService.new().validate(patch)
	_expect(not _has_blockers(diagnostics), "default synth patch validates")
	var baker := ForgeProceduralAudioBaker.new()
	var middle_c := baker.render_note(patch, 60)
	var middle_c_again := baker.render_note(patch, 60)
	var e_note := baker.render_note(patch, 64)
	_expect(bool(middle_c.get("ok", false)), "synth renders without an uploaded file")
	_expect(middle_c.get("stream") is AudioStreamWAV, "synth produces a playable WAV stream")
	_expect((middle_c.get("pcm") as PackedByteArray).size() > 100, "synth produces PCM samples")
	_expect(str(middle_c.get("source_hash")) == str(middle_c_again.get("source_hash")),
		"synth render is deterministic")
	_expect(str(middle_c.get("source_hash")) != str(e_note.get("source_hash")),
		"virtual keyboard notes produce distinct sound data")
	_expect(absf(float(middle_c.get("frequency_hz")) - 261.6256) < 0.1,
		"piano tuning maps MIDI notes to expected frequency")
	var transformed := ForgeAudioTransformService.new().transform(
		middle_c.get("stream"), {"trim_start_seconds": 0.01,
			"trim_end_seconds": 0.04, "normalize_peak_db": -1.0,
			"fade_in_seconds": 0.005, "fade_out_seconds": 0.005,
			"reverse": true})
	_expect(bool(transformed.get("ok", false)),
		"waveform tools trim, normalize, fade and reverse generated PCM")
	_expect((transformed.get("data") as PackedByteArray).size() \
			< (middle_c.get("pcm") as PackedByteArray).size(),
		"waveform trimming reduces the PCM frame range")
	_expect(str(transformed.get("source_hash", "")) != str(middle_c.get("source_hash", "")),
		"waveform transformation produces a new content hash")
	var target := "res://generated/forge/audio/forge_creator_probe_note.tres"
	_remove_if_present(target)
	var baked := baker.bake_source(
		patch, 60, target, "sound.source.probe_bell_c4")
	_expect(bool(baked.get("ok", false)), "synth bakes a generated source product")
	_expect(baked.get("sound_source") is ForgeSoundSource,
		"synth bake returns a Sound Source for events")
	_expect(not str((baked.get("sound_source") as ForgeSoundSource).source_hash).is_empty(),
		"generated Sound Source carries its content hash")
	_remove_if_present(target)


func _test_modular_structures() -> void:
	var registry := ForgeAuthoringTypeRegistry.new()
	var room_a: ForgeBlueprintModuleDefinition = registry.create(
		"structure.module", "probe_room_a", "Probe Room A")
	var room_b: ForgeBlueprintModuleDefinition = registry.create(
		"structure.module", "probe_room_b", "Probe Room B")
	var modules := {room_a.module_id: room_a, room_b.module_id: room_b}
	var module_set: ForgeBlueprintModuleSet = registry.create(
		"structure.module_set", "probe_dungeon", "Probe Dungeon")
	module_set.module_ids = PackedStringArray([room_a.module_id, room_b.module_id])
	module_set.start_module_ids = PackedStringArray([room_a.module_id])
	module_set.module_weights = {room_a.module_id: 1.0, room_b.module_id: 2.0}
	module_set.continuation_policy = "continuing"
	var rules: ForgeProceduralStructureRuleSet = registry.create(
		"structure.rule_set", "probe_dungeon", "Probe Dungeon Rules")
	rules.module_set_id = module_set.module_set_id
	rules.maximum_modules = 2
	rules.maximum_depth = 8
	rules.maximum_open_connectors = 16
	rules.termination_chance = 0.0
	rules.continuing = true
	rules.seed = 1337
	var validator := ForgeModularStructureValidationService.new()
	_expect(not _has_blockers(validator.validate_module_set(module_set, modules)),
		"room set validates against its modules")
	_expect(not _has_blockers(validator.validate_rule_set(rules, module_set)),
		"procedural structure rules validate")
	var assembler := ForgeProceduralStructureAssembler.new()
	var first := assembler.generate(module_set, modules, rules)
	var repeat := assembler.generate(module_set, modules, rules)
	_expect(bool(first.get("ok", false)), "procedural room set assembles")
	_expect((first.get("placements") as Array).size() == 2,
		"procedural assembly obeys module budget")
	_expect(str(first.get("source_hash")) == str(repeat.get("source_hash")),
		"same seed produces the same room layout")
	_expect(not (first.get("continuation_state") as Dictionary).is_empty(),
		"continuing structure emits resumable frontier state")
	rules.maximum_modules = 4
	var continued := assembler.generate(
		module_set, modules, rules, first.get("continuation_state"))
	_expect(bool(continued.get("ok", false)), "continuing structure resumes")
	_expect((continued.get("placements") as Array).size() > 2,
		"continuation adds rooms without rebuilding prior placements")


func _test_visual_structure_source() -> void:
	var block_ids := PackedStringArray()
	var seen_blocks := {}
	for record in ForgeRegistryBridge.new().all_gameplay_records():
		if str(record.get("kind", "")) != "block":
			continue
		var block_id := str(record.get("gameplay_id", ""))
		block_ids.append(block_id)
		seen_blocks[block_id] = true
	_expect(block_ids.size() > 0 and seen_blocks.size() == block_ids.size(),
		"visual structure palette source contains every registry block exactly once")
	var registry := ForgeAuthoringTypeRegistry.new()
	var blueprint: ForgeBlueprintDefinition = registry.create(
		"structure.blueprint", "probe_guard_building", "Probe Guard Building")
	var source := blueprint.structure_voxel_source
	source.stage_ids = PackedStringArray([
		"stage.foundation", "stage.enclosure", "stage.functional"])
	# Two adjacent rooms: floor, enclosure, then a functional doorway and repairable post.
	for z in 4:
		for x in 8:
			source.place_cell(Vector3i(x, 0, z), block_ids[0], "stage.foundation")
	for z in 4:
		for x in 8:
			if x in [0, 3, 4, 7] or z in [0, 3]:
				source.place_cell(Vector3i(x, 1, z),
					block_ids[mini(1, block_ids.size() - 1)], "stage.enclosure")
	var doorway := source.place_cell(Vector3i(3, 1, 1),
		block_ids[mini(2, block_ids.size() - 1)], "stage.functional")
	var replaced_post := source.place_cell(Vector3i(4, 1, 1), block_ids[0],
		"stage.enclosure")
	replaced_post.removed_stage_id = "stage.functional"
	_expect(source.active_cells("stage.foundation").size() == 32,
		"cumulative stage playback isolates foundation work")
	_expect(source.active_cells("stage.functional").has(doorway) \
			and not source.active_cells("stage.functional").has(replaced_post),
		"cumulative stage playback applies deliberate additions and removals")
	var marker := ForgeBlueprintElement.new()
	marker.element_id = "marker.guard_entrance"
	marker.element_kind = "semantic_marker"
	marker.stage_id = "stage.functional"
	marker.position = Vector3i(3, 1, 0)
	marker.metadata = {"semantic_kind": "access_point", "room": "guard_room"}
	blueprint.elements.append(marker)
	var module: ForgeBlueprintModuleDefinition = registry.create(
		"structure.module", "probe_guard_room", "Probe Reusable Guard Room")
	module.structure_voxel_source.stage_ids = PackedStringArray([
		"stage.foundation", "stage.enclosure", "stage.functional"])
	module.structure_voxel_source.place_cell(Vector3i.ZERO, block_ids[0],
		"stage.foundation")
	blueprint.module_ids = PackedStringArray([module.module_id])
	var module_instance := ForgeBlueprintElement.new()
	module_instance.element_id = "module.reusable_guard_room"
	module_instance.element_kind = "module"
	module_instance.module_id = module.module_id
	module_instance.position = Vector3i(10, 0, 0)
	blueprint.elements.append(module_instance)
	var damaged := ForgeBlueprintStateDefinition.new()
	damaged.state_id = "blueprint.state.probe_guard_building.damaged"
	damaged.blueprint_id = blueprint.blueprint_id
	damaged.state_kind = "light_damage"
	damaged.remove_element_ids = PackedStringArray([
		"voxel.%s" % ForgeId.safe_filename(doorway.cell_id)])
	var voxel_diagnostics := ForgeStructureVoxelValidationService.new().validate(
		source, blueprint.blueprint_id)
	_expect(not _has_blockers(voxel_diagnostics),
		"two-room visual guard-building source validates against the live block registry")
	var compiler := ForgeBlueprintCompiler.new()
	var loaded := compiler.load_and_validate([blueprint], [module], [damaged])
	_expect(bool(loaded.get("ok", false)),
		"visual structure and reusable room module load into the existing compiler")
	var first := compiler.compile(blueprint.blueprint_id)
	var second := compiler.compile(blueprint.blueprint_id)
	_expect(bool(first.get("ok", false)) and bool(second.get("ok", false)),
		"visual structure compiles to the existing runtime blueprint product")
	var first_product := first.get("product") as ForgeBlueprintRuntimeProduct
	var second_product := second.get("product") as ForgeBlueprintRuntimeProduct
	_expect(first_product.canonical_hash() == second_product.canonical_hash(),
		"visual structure compilation is deterministic")
	_expect(first_product.compiled_elements.size() == source.cells.size() + 2,
		"compiled product contains voxel cells, semantic marker and module geometry")
	_expect(first_product.construction_stage_records.size() == 3 \
			and int(first_product.construction_stage_records[2].get(
				"sequence_index", -1)) == 2,
		"compiled construction stages retain cumulative visual ordering")
	var before_reorder_hash := blueprint.canonical_hash()
	source.cells.reverse()
	_expect(blueprint.canonical_hash() == before_reorder_hash,
		"persistent cell IDs make serialization independent of array order")
	var roundtrip_path := "user://leyforge/forge/probes/visual_guard_building.tres"
	var absolute_root := ProjectSettings.globalize_path(roundtrip_path.get_base_dir())
	DirAccess.make_dir_recursive_absolute(absolute_root)
	_remove_if_present(roundtrip_path)
	_expect(ResourceSaver.save(blueprint, roundtrip_path) == OK,
		"visual structure source saves without touching gameplay saves")
	var reopened := ResourceLoader.load(roundtrip_path, "",
		ResourceLoader.CACHE_MODE_IGNORE) as ForgeBlueprintDefinition
	_expect(reopened != null and reopened.schema_version == 2 \
			and reopened.physical_authoring_mode == "voxel_grid",
		"schema-v2 visual structure reopens in its explicit authoring mode")
	_expect(reopened.structure_voxel_source.cells.size() == source.cells.size() \
			and reopened.structure_voxel_source.canonical_hash() == source.canonical_hash(),
		"visual cells and stage assignments survive save/reopen identically")
	var missing_id := "block.missing.probe_visual_source"
	var unresolved := reopened.structure_voxel_source.cells[0]
	var preserved_id := unresolved.block_id
	unresolved.block_id = missing_id
	var missing_diagnostics := ForgeStructureVoxelValidationService.new().validate(
		reopened.structure_voxel_source, reopened.blueprint_id)
	_expect(_has_blockers(missing_diagnostics) and unresolved.block_id == missing_id,
		"missing blocks remain unresolved and block baking without silent replacement")
	unresolved.block_id = preserved_id
	var legacy := ForgeBlueprintDefinition.new()
	legacy.blueprint_id = "blueprint.leyforge.probe_schema_v1"
	var legacy_record := legacy.to_record()
	_expect(not legacy_record.has("physical_authoring_mode") \
			and not legacy_record.has("structure_voxel_source"),
		"schema-v1 blueprint records remain byte-contract compatible until conversion")
	_remove_if_present(roundtrip_path)


func _test_document_lifecycle() -> void:
	var service := ForgeAuthoringDocumentService.new()
	var created := service.create("audio.synth_patch", "probe_document", "Probe Document")
	_expect(bool(created.get("ok", false)), "shared document service creates source")
	var resource: Resource = created.get("resource")
	var duplicate := service.duplicate_source(
		resource, "probe_document_copy", "Probe Document Copy")
	_expect(bool(duplicate.get("ok", false)), "shared document service duplicates source")
	_expect(str(duplicate.get("source_id")) != str(created.get("source_id")),
		"duplicate receives a new stable identity")
	var deprecated := service.deprecate(duplicate.get("resource"), str(created.get("source_id")))
	_expect(bool(deprecated.get("ok", false)), "shared document service deprecates source")
	_expect((duplicate.get("resource") as ForgeSynthPatchDefinition).lifecycle == "deprecated",
		"deprecation remains explicit and non-destructive")
	var target := "res://content/forge/presentation/set23/user/audio/sound_source_synth_probe_document.tres"
	var previous := "%s.previous.tres" % target.trim_suffix(".tres")
	_remove_if_present(target)
	_remove_if_present(previous)
	var saved := service.save_draft(resource, target)
	_expect(bool(saved.get("ok", false)), "shared document service atomically saves source")
	_expect(FileAccess.file_exists(target), "canonical source exists after save")
	(resource as ForgeSynthPatchDefinition).master_gain_db = -9.0
	var second_save := service.save_draft(resource, target)
	_expect(bool(second_save.get("ok", false)), "shared document service saves a revision")
	_expect(FileAccess.file_exists(previous), "source revision preserves recoverable previous file")
	var recovered := service.recover_previous(target)
	_expect(bool(recovered.get("ok", false)), "previous source revision can be recovered")
	var session := ForgeAuthoringSession.new()
	var session_created := session.create("vfx.graph", "probe_session", "Probe Session")
	_expect(bool(session_created.get("ok", false)), "authoring session opens a new document")
	var graph: ForgeVfxGraph = session.active_resource()
	var before := graph.maximum_spawn_count
	var changed := session.execute("Change spawn limit",
		func() -> void: graph.maximum_spawn_count = 12,
		func() -> void: graph.maximum_spawn_count = before)
	_expect(changed and graph.maximum_spawn_count == 12 and session.is_dirty(),
		"session command mutates and marks source dirty")
	_expect(session.undo() and graph.maximum_spawn_count == before,
		"session provides shared undo")
	_expect(session.redo() and graph.maximum_spawn_count == 12,
		"session provides shared redo")
	var autosaves := ForgeAutosaveService.new()
	var autosaved := autosaves.autosave(graph)
	_expect(bool(autosaved.get("ok", false)), "autosave accepts non-voxel Forge source")
	var loaded := autosaves.load_candidate(str(autosaved.get("path", "")))
	_expect(bool(loaded.get("ok", false)), "autosave recovery loads non-voxel source")
	autosaves.discard(str(autosaved.get("path", "")))
	_remove_if_present(target)
	_remove_if_present(previous)


func _test_creator_bakes() -> void:
	var registry := ForgeAuthoringTypeRegistry.new()
	var bake_service := ForgeCreatorBakeService.new()
	var patch: ForgeSynthPatchDefinition = registry.create(
		"audio.synth_patch", "probe_approval", "Probe Approval")
	patch.sample_rate_hz = 8000
	patch.note_duration_seconds = 0.03
	patch.amplitude_envelope["release_seconds"] = 0.01
	patch.filter_settings["cutoff_hz"] = 3000.0
	var source_path := "res://content/forge/presentation/set23/user/audio/sound_source_synth_probe_approval.tres"
	_remove_if_present(source_path)
	_remove_if_present("%s.previous.tres" % source_path.trim_suffix(".tres"))
	var approved := ForgeAuthoringDocumentService.new().approve(
		patch, source_path, func(resource: Resource) -> Dictionary:
			return bake_service.bake(resource, {}))
	_expect(bool(approved.get("ok", false)) and bool(approved.get("approved", false)),
		"creator approval requires a successful generated product")
	var bake: Dictionary = approved.get("bake", {})
	_expect(bake.get("receipt") is ForgeCreatorBakeReceipt,
		"creator approval emits a bake receipt")
	_expect(str(bake.get("source_hash", "")) == patch.canonical_hash(),
		"approved source hash matches its generated receipt")
	_expect((bake.get("product_paths", PackedStringArray()) as PackedStringArray).size() == 1,
		"synth approval emits a generated Sound Source product")
	var runtime_registry := ForgeCreatorRuntimeRegistry.new()
	var runtime_summary := runtime_registry.reload()
	_expect(int(runtime_summary.get("active_count", 0)) >= 1,
		"approved creator outputs enter the runtime registry")
	_expect(bool(runtime_registry.resolve(patch.stable_id).get("ok", false)),
		"runtime resolves the receipt-matched creator output")
	_expect(runtime_registry.product_for(patch.stable_id) is ForgeSoundSource,
		"runtime exposes the approved generated Sound Source")
	var synth_spatial: ForgeSpatialAudioProfile = registry.create(
		"audio.spatial_profile", "probe_synth_spatial", "Probe Synth Spatial")
	var synth_event: ForgeSoundEvent = registry.create(
		"audio.event", "probe_synth_event", "Probe Synth Event")
	var generated_source_id := ForgeCreatorBakeService.generated_synth_source_id(patch)
	synth_event.source_ids = PackedStringArray([generated_source_id])
	synth_event.layer_records = [{"layer_id": "instrument_note",
		"source_id": generated_source_id, "gain_db": 0.0,
		"pitch_scale": 1.0, "start_delay_seconds": 0.0}]
	synth_event.spatial_audio_profile_id = synth_spatial.stable_id
	var synth_event_bake := bake_service.bake(synth_event, {
		synth_spatial.stable_id: synth_spatial})
	_expect(bool(synth_event_bake.get("ok", false)),
		"Sound Event compiler discovers an approved file-free synth source")
	_cleanup_bake(synth_event_bake)
	patch.master_gain_db = -11.0
	ForgeAuthoringDocumentService.new().save_draft(patch, source_path)
	runtime_summary = runtime_registry.reload()
	_expect(not bool(runtime_registry.resolve(patch.stable_id).get("ok", false))
			and int(runtime_summary.get("stale_count", 0)) >= 1,
		"an unapproved source change makes its generated product stale")
	_cleanup_bake(bake)
	_remove_if_present(source_path)
	_remove_if_present("%s.previous.tres" % source_path.trim_suffix(".tres"))
	_remove_if_present(
		"res://generated/forge/audio/sound_source_generated_probe_approval_note_60_stream.tres")

	var room: ForgeBlueprintModuleDefinition = registry.create(
		"structure.module", "probe_bake_room", "Probe Bake Room")
	var module_set: ForgeBlueprintModuleSet = registry.create(
		"structure.module_set", "probe_bake_set", "Probe Bake Set")
	module_set.module_ids = PackedStringArray([room.module_id])
	module_set.start_module_ids = PackedStringArray([room.module_id])
	var rules: ForgeProceduralStructureRuleSet = registry.create(
		"structure.rule_set", "probe_bake_rules", "Probe Bake Rules")
	rules.module_set_id = module_set.module_set_id
	rules.maximum_modules = 3
	rules.maximum_depth = 4
	rules.termination_chance = 0.0
	var structure_bake := bake_service.bake(rules, {
		room.module_id: room, module_set.module_set_id: module_set})
	_expect(bool(structure_bake.get("ok", false)),
		"procedural structure rules bake a runtime product")
	_expect(str(structure_bake.get("product_kind", "")) == "procedural_structure_product",
		"procedural structure bake is classified explicitly")
	_cleanup_bake(structure_bake)

	var graph: ForgeVfxGraph = registry.create("vfx.graph", "probe_bake", "Probe VFX Graph")
	var effect: ForgeVfxDefinition = registry.create("vfx.effect", "probe_bake", "Probe VFX")
	effect.graph_id = graph.stable_id
	var vfx_bake := bake_service.bake(effect, {graph.stable_id: graph})
	_expect(bool(vfx_bake.get("ok", false)), "VFX effect compiles to a runtime product")
	_expect(str(vfx_bake.get("product_kind", "")) == "compiled_vfx_product",
		"VFX runtime product is classified explicitly")
	_cleanup_bake(vfx_bake)

	var sound_source: ForgeSoundSource = registry.create(
		"audio.source", "probe_bake", "Probe Sound Source")
	sound_source.source_path = "res://generated/forge/audio/probe_source.tres"
	sound_source.source_hash = "a".repeat(64)
	var spatial: ForgeSpatialAudioProfile = registry.create(
		"audio.spatial_profile", "probe_bake", "Probe Spatial")
	var event: ForgeSoundEvent = registry.create("audio.event", "probe_bake", "Probe Event")
	event.source_ids = PackedStringArray([sound_source.stable_id])
	event.spatial_audio_profile_id = spatial.stable_id
	var sound_bake := bake_service.bake(event, {
		sound_source.stable_id: sound_source, spatial.stable_id: spatial})
	_expect(bool(sound_bake.get("ok", false)), "Sound Event compiles to a runtime plan")
	_expect(str(sound_bake.get("product_kind", "")) == "compiled_sound_plan",
		"Sound Event runtime plan is classified explicitly")
	_cleanup_bake(sound_bake)


func _cleanup_bake(result: Dictionary) -> void:
	for path in result.get("product_paths", []):
		_remove_if_present(str(path))
	_remove_if_present(str(result.get("receipt_path", "")))


func _has_blockers(diagnostics: Array[ForgeDiagnostic]) -> bool:
	for diagnostic in diagnostics:
		if diagnostic.severity in [ForgeDiagnostic.ERROR, ForgeDiagnostic.CRITICAL,
				ForgeDiagnostic.BLOCKER, ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER]:
			return true
	return false


func _remove_if_present(path: String) -> void:
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))


func _expect(condition: bool, label: String) -> void:
	checks += 1
	if not condition:
		failures.append(label)
