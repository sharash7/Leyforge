class_name ForgeCreatorBakeService
extends RefCounted
## Routes creator sources to existing Set 22/23 compilers and records source/product matching.

const RECEIPT_ROOT := "res://generated/forge/creator_receipts"


func bake(resource: Resource, open_resources: Dictionary = {}) -> Dictionary:
	if not ForgeAccessPolicy.can_author():
		return {"ok": false, "error": "Forge authoring is disabled in this build."}
	var document_service := ForgeAuthoringDocumentService.new()
	var descriptor := document_service.type_registry.for_resource(resource)
	if descriptor == null:
		return {"ok": false, "error": "Creator source type is not registered."}
	var diagnostics := document_service.validate(resource)
	if _has_blockers(diagnostics):
		return {"ok": false, "error": "Creator source validation failed.",
			"diagnostics": _diagnostic_records(diagnostics)}
	var product_result := _build_product(resource, open_resources)
	if not bool(product_result.get("ok", false)):
		return product_result
	var product_paths := PackedStringArray()
	var product_hashes := {}
	for product_record in product_result.get("products", []):
		var product: Resource = product_record.get("resource")
		var path := str(product_record.get("path", ""))
		var saved := _save_generated(product, path)
		if not bool(saved.get("ok", false)):
			return saved
		product_paths.append(path)
		product_hashes[path] = _canonical_hash(product)
	var receipt := ForgeCreatorBakeReceipt.new()
	var source_id := descriptor.identity(resource)
	receipt.receipt_id = "receipt.creator.%s" % ForgeId.safe_filename(source_id)
	receipt.source_id = source_id
	receipt.source_type_id = descriptor.type_id
	receipt.source_hash = _canonical_hash(resource)
	receipt.product_kind = str(product_result.get("product_kind", "canonical_source"))
	receipt.product_paths = product_paths
	receipt.product_hashes = product_hashes
	receipt.validation_summary = {"diagnostic_count": diagnostics.size(), "blockers": 0}
	var receipt_path := RECEIPT_ROOT.path_join(
		"%s.tres" % ForgeId.safe_filename(receipt.receipt_id))
	var receipt_save := _save_generated(receipt, receipt_path)
	if not bool(receipt_save.get("ok", false)):
		return receipt_save
	return {
		"ok": true,
		"source_id": source_id,
		"source_hash": receipt.source_hash,
		"product_kind": receipt.product_kind,
		"product_paths": product_paths,
		"product_hashes": product_hashes,
		"receipt": receipt,
		"receipt_path": receipt_path,
	}


static func generated_synth_source_id(patch: ForgeSynthPatchDefinition) -> String:
	return "sound.source.generated.%s.note_%d" % [
		ForgeId.safe_filename(patch.stable_id.trim_prefix("sound.source.synth.")),
		patch.preview_midi_note]


func _build_product(resource: Resource, open_resources: Dictionary) -> Dictionary:
	if resource is ForgeSynthPatchDefinition:
		var source_id := generated_synth_source_id(resource)
		var stream_path := "res://generated/forge/audio/%s_stream.tres" % \
			ForgeId.safe_filename(source_id)
		var rendered := ForgeProceduralAudioBaker.new().bake_source(
			resource, resource.preview_midi_note, stream_path, source_id)
		if not bool(rendered.get("ok", false)):
			return rendered
		return {"ok": true, "product_kind": "procedural_sound_source",
			"products": [{"resource": rendered.sound_source,
				"path": "res://generated/forge/audio/%s_source.tres" % ForgeId.safe_filename(source_id)}]}
	if resource is ForgeBlueprintDefinition:
		return _compile_blueprint(resource, open_resources)
	if resource is ForgeProceduralStructureRuleSet:
		return _compile_procedural_structure(resource, open_resources)
	if resource is ForgeVfxDefinition:
		return _compile_vfx(resource, open_resources)
	if resource is ForgeSoundEvent:
		return _compile_sound_event(resource, open_resources)
	# Entity, rig, animation, source, form and profile resources are consumed
	# directly by stable ID after validation; the receipt is their runtime match.
	return {"ok": true, "product_kind": "canonical_runtime_source", "products": []}


func _compile_blueprint(
		blueprint: ForgeBlueprintDefinition, open_resources: Dictionary) -> Dictionary:
	var modules: Array[ForgeBlueprintModuleDefinition] = []
	var states: Array[ForgeBlueprintStateDefinition] = []
	_collect_typed(open_resources, modules, states, [], [], [], [])
	_collect_source_tree(modules, states, [], [], [], [])
	var compiler := ForgeBlueprintCompiler.new()
	var loaded := compiler.load_and_validate([blueprint], modules, states)
	if not bool(loaded.get("ok", false)):
		return {"ok": false, "error": "Blueprint dependencies failed validation.",
			"diagnostics": loaded.get("diagnostics", [])}
	var compiled := compiler.compile(blueprint.blueprint_id)
	if not bool(compiled.get("ok", false)):
		return compiled
	var product: ForgeBlueprintRuntimeProduct = compiled.product
	return {"ok": true, "product_kind": "blueprint_runtime_product",
		"products": [{"resource": product,
			"path": "res://generated/forge/runtime/blueprints/%s.tres" % \
				ForgeId.safe_filename(product.product_id)}]}


func _compile_procedural_structure(
		rules: ForgeProceduralStructureRuleSet, open_resources: Dictionary) -> Dictionary:
	var module_set: ForgeBlueprintModuleSet
	var modules := {}
	for value in open_resources.values():
		if value is ForgeBlueprintModuleSet and value.module_set_id == rules.module_set_id:
			module_set = value
		elif value is ForgeBlueprintModuleDefinition:
			modules[value.module_id] = value
	if module_set == null:
		for path in _resource_paths("res://content/forge/blueprints"):
			var value := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
			if value is ForgeBlueprintModuleSet and value.module_set_id == rules.module_set_id:
				module_set = value
			elif value is ForgeBlueprintModuleDefinition:
				modules[value.module_id] = value
	if module_set == null:
		return {"ok": false, "error": "Procedural rules reference a missing structure set."}
	var assembled := ForgeProceduralStructureAssembler.new().generate(
		module_set, modules, rules)
	if not bool(assembled.get("ok", false)):
		return assembled
	var product := ForgeProceduralStructureProduct.new()
	product.product_id = "runtime.blueprint.procedural.%s" % \
		rules.rule_set_id.trim_prefix("blueprint.ruleset.")
	product.rule_set_id = rules.rule_set_id
	product.module_set_id = module_set.module_set_id
	product.source_hash = str(assembled.source_hash)
	product.placements.assign(assembled.placements)
	product.open_connectors.assign(assembled.open_connectors)
	product.continuation_state = assembled.continuation_state
	product.terminated = bool(assembled.terminated)
	return {"ok": true, "product_kind": "procedural_structure_product",
		"products": [{"resource": product,
			"path": "res://generated/forge/runtime/blueprints/%s.tres" % \
				ForgeId.safe_filename(product.product_id)}]}


func _compile_vfx(effect: ForgeVfxDefinition, open_resources: Dictionary) -> Dictionary:
	var graphs: Array[ForgeVfxGraph] = []
	var forms: Array[ForgeVfxForm] = []
	var effects: Array[ForgeVfxDefinition] = []
	_collect_typed(open_resources, [], [], graphs, forms, effects, [])
	_collect_source_tree([], [], graphs, forms, effects, [])
	if effect not in effects:
		effects.append(effect)
	var compiler := ForgeVfxGraphCompiler.new()
	var loaded := compiler.load_and_validate(graphs, forms, effects)
	if not bool(loaded.get("ok", false)):
		return {"ok": false, "error": "VFX dependencies failed validation.",
			"diagnostics": loaded.get("diagnostics", [])}
	var compiled := compiler.compile(effect.stable_id)
	if not bool(compiled.get("ok", false)):
		return compiled
	var product: ForgeCompiledVfxProduct = compiled.product
	return {"ok": true, "product_kind": "compiled_vfx_product",
		"products": [{"resource": product,
			"path": "res://generated/forge/runtime/vfx/%s.tres" % \
				ForgeId.safe_filename(product.product_id)}]}


func _compile_sound_event(event: ForgeSoundEvent, open_resources: Dictionary) -> Dictionary:
	var events: Array[ForgeSoundEvent] = []
	var sources: Array[ForgeSoundSource] = []
	var profiles: Array[ForgeSpatialAudioProfile] = []
	for value in open_resources.values():
		if value is ForgeSoundEvent: events.append(value)
		elif value is ForgeSoundSource: sources.append(value)
		elif value is ForgeSpatialAudioProfile: profiles.append(value)
	for root in ["res://content/forge/presentation/set23", "res://generated/forge/audio"]:
		for path in _resource_paths(root):
			var value := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
			if value is ForgeSoundEvent and not _contains_id(events, value.stable_id): events.append(value)
			elif value is ForgeSoundSource and not _contains_id(sources, value.stable_id): sources.append(value)
			elif value is ForgeSpatialAudioProfile and not _contains_id(profiles, value.stable_id): profiles.append(value)
	if event not in events:
		events.append(event)
	var compiler := ForgeSoundPlanCompiler.new()
	var loaded := compiler.load_and_validate(events, sources, profiles)
	if not bool(loaded.get("ok", false)):
		return {"ok": false, "error": "Sound Event dependencies failed validation.",
			"diagnostics": loaded.get("diagnostics", [])}
	var compiled := compiler.compile(event.stable_id)
	if not bool(compiled.get("ok", false)):
		return compiled
	var plan: ForgeCompiledSoundPlan = compiled.plan
	return {"ok": true, "product_kind": "compiled_sound_plan",
		"products": [{"resource": plan,
			"path": "res://generated/forge/runtime/audio/%s.tres" % \
				ForgeId.safe_filename(plan.plan_id)}]}


func _collect_typed(
		values: Dictionary, modules: Array, states: Array, graphs: Array,
		forms: Array, effects: Array, _unused: Array) -> void:
	for value in values.values():
		if value is ForgeBlueprintModuleDefinition and value not in modules: modules.append(value)
		elif value is ForgeBlueprintStateDefinition and value not in states: states.append(value)
		elif value is ForgeVfxGraph and value not in graphs: graphs.append(value)
		elif value is ForgeVfxForm and value not in forms: forms.append(value)
		elif value is ForgeVfxDefinition and value not in effects: effects.append(value)


func _collect_source_tree(
		modules: Array, states: Array, graphs: Array,
		forms: Array, effects: Array, _unused: Array) -> void:
	for path in _resource_paths("res://content/forge"):
		var value := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if value is ForgeBlueprintModuleDefinition and not _contains_module(modules, value.module_id): modules.append(value)
		elif value is ForgeBlueprintStateDefinition and not _contains_state(states, value.state_id): states.append(value)
		elif value is ForgeVfxGraph and not _contains_id(graphs, value.stable_id): graphs.append(value)
		elif value is ForgeVfxForm and not _contains_id(forms, value.stable_id): forms.append(value)
		elif value is ForgeVfxDefinition and not _contains_id(effects, value.stable_id): effects.append(value)


func _save_generated(resource: Resource, path: String) -> Dictionary:
	if resource == null or not path.begins_with("res://generated/forge/") \
			or not path.ends_with(".tres"):
		return {"ok": false, "error": "Generated product target is invalid."}
	var error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(path.get_base_dir()))
	if error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(error)}
	var temporary := "%s.tmp.tres" % path.trim_suffix(".tres")
	if FileAccess.file_exists(temporary):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(temporary))
	var save_error := ResourceSaver.save(resource, temporary)
	if save_error != OK:
		return {"ok": false, "error": error_string(save_error)}
	var verified := ResourceLoader.load(temporary, "", ResourceLoader.CACHE_MODE_IGNORE)
	if verified == null:
		DirAccess.remove_absolute(ProjectSettings.globalize_path(temporary))
		return {"ok": false, "error": "Generated product failed read-back."}
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
	var promote := DirAccess.rename_absolute(
		ProjectSettings.globalize_path(temporary), ProjectSettings.globalize_path(path))
	return {"ok": promote == OK, "path": path,
		"error": "" if promote == OK else error_string(promote)}


func _resource_paths(root: String) -> PackedStringArray:
	var results := PackedStringArray()
	var directory := DirAccess.open(root)
	if directory == null: return results
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if not entry.begins_with("."):
			var path := root.path_join(entry)
			if directory.current_is_dir(): results.append_array(_resource_paths(path))
			elif (entry.ends_with(".tres") or entry.ends_with(".res")) \
					and ".previous." not in entry and ".tmp." not in entry:
				results.append(path)
		entry = directory.get_next()
	directory.list_dir_end()
	return results


func _contains_module(values: Array, source_id: String) -> bool:
	for value in values:
		if value.module_id == source_id: return true
	return false


func _contains_state(values: Array, source_id: String) -> bool:
	for value in values:
		if value.state_id == source_id: return true
	return false


func _contains_id(values: Array, source_id: String) -> bool:
	for value in values:
		if value.stable_id == source_id: return true
	return false


func _canonical_hash(resource: Resource) -> String:
	return str(resource.call("canonical_hash")) if resource.has_method("canonical_hash") else ""


func _has_blockers(diagnostics: Array[ForgeDiagnostic]) -> bool:
	for diagnostic in diagnostics:
		if diagnostic.severity in [ForgeDiagnostic.ERROR, ForgeDiagnostic.CRITICAL,
				ForgeDiagnostic.BLOCKER, ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER]: return true
	return false


func _diagnostic_records(diagnostics: Array[ForgeDiagnostic]) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for diagnostic in diagnostics: records.append(diagnostic.to_record())
	return records
