extends Node

var checks := 0
var failures: Array[String] = []

func _ready() -> void:
	var ledger := ForgeCoverageLedgerService.new().load_ledger()
	var validation := ForgeCoverageLedgerService.new().validate(ledger)
	_expect(bool(validation.ok), "coverage ledger validates")
	var records: Array = ledger.get("records", [])
	_expect(records.size() == 1321, "ledger covers 124 structures, 5 sets, 14 entities, 178 VFX, 300 events and 700 sources")
	_expect(_count(records, "studio", "characters") == 14, "fourteen canonical entities are review-ready")
	_expect(_count(records, "studio", "vfx") == 178, "VFX catalogue has exactly 178 records")
	_expect(_count(records, "studio", "audio") == 1000, "audio ledger has 300 events and 700 procedural sources")
	_expect(_structure_target_count(records) == 124, "structure migration target count is exactly 124")
	_expect(_count_prefix(records, "blueprint.module_set.") == 5, "five procedural structure families exist")
	_expect(_all_status(records, "review_ready"), "no in-scope ledger target remains planned new work")
	_expect(_unique_targets(records), "coverage ledger stable IDs are unique")
	_expect(_no_active_catalogue_ids(records), "active target IDs contain no numbered catalogue placeholders")
	_expect(_all_have_sources(records), "every coverage target has an editable source path")
	_expect(_all_sources_exist(records), "every ledger source path exists")
	_expect(_all_bake_evidence(records), "every target has matching two-pass bake evidence and a runtime product")
	var manifest: ForgePresentationLibraryManifest = load("res://content/forge/runtime/set22_23_stage6/presentation_library_manifest.tres")
	_expect(manifest != null, "production presentation manifest loads")
	_expect(manifest.catalogue_ids.get("vfx_catalogue", []).size() == 178, "manifest VFX count is exact")
	_expect(manifest.catalogue_ids.get("sound_events", []).size() == 300, "manifest Sound Event count is exact")
	var production_sources := _resources_of_type("res://content/forge/presentation/set23/user/audio/production", ForgeSoundSource)
	_expect(production_sources.size() == 700, "seven hundred procedural Sound Sources load")
	var production_patches := _resources_of_type("res://content/forge/presentation/set23/user/audio/production", ForgeSynthPatchDefinition)
	_expect(production_patches.size() == 700, "seven hundred editable synth recipes load")
	_expect(_procedural_sources_owned(production_sources), "procedural sources have owned provenance and deterministic hashes")
	_expect(_synth_deterministic(production_patches), "sampled procedural sources render deterministically without files")
	_expect(_module_family_complete(), "each procedural family has all eight semantic module roles")
	_expect(_states_complete(), "placeable structures have construction, damaged and repaired state sources")
	_expect(_approval_batches_bounded(), "review batches are coherent and bounded")
	_expect(_guide_records_complete(), "in-depth guides contain all required explanatory fields")
	_expect(_capstones_complete(), "all six Forge capstones cover their complete authoring workflows")
	_expect(FileAccess.file_exists("res://development/FORGE_CREATOR_GUIDES.md"), "external guide is generated from in-app definitions")
	_expect(ForgeSectionGuides.glossary().size() >= 10, "Forge guide exposes the required searchable concepts")
	print("FORGE_PRODUCTION_CATALOGUE_PROBE %s" % JSON.stringify({"ok": failures.is_empty(),
		"checks": checks, "failures": failures}))
	get_tree().quit(0 if failures.is_empty() else 1)

func _count(records: Array, field: String, value: String) -> int:
	return records.filter(func(record): return str(record.get(field, "")) == value).size()

func _count_prefix(records: Array, prefix: String) -> int:
	return records.filter(func(record): return str(record.get("target_id", "")).begins_with(prefix)).size()

func _structure_target_count(records: Array) -> int:
	return records.filter(func(record):
		var id := str(record.get("target_id", ""))
		return str(record.get("studio", "")) == "structures" and not id.begins_with("blueprint.module_set.")).size()

func _all_status(records: Array, status: String) -> bool:
	return records.all(func(record): return str(record.get("status", "")) == status)

func _unique_targets(records: Array) -> bool:
	var ids := {}
	for record in records:
		var id := str(record.get("target_id", ""))
		if ids.has(id): return false
		ids[id] = true
	return true

func _no_active_catalogue_ids(records: Array) -> bool:
	return records.all(func(record): return not str(record.get("target_id", "")).contains("catalogue_"))

func _all_have_sources(records: Array) -> bool:
	return records.all(func(record): return not Array(record.get("source_paths", [])).is_empty())

func _all_sources_exist(records: Array) -> bool:
	for record in records:
		for path in record.get("source_paths", []):
			if not FileAccess.file_exists(str(path)): return false
	return true

func _all_bake_evidence(records: Array) -> bool:
	for record in records:
		var target_id := str(record.get("target_id", ""))
		var product_paths: Array = record.get("runtime_product_paths", [])
		var receipt_paths: Array = record.get("bake_receipt_paths", [])
		if product_paths.size() != 1 or receipt_paths.size() != 1: return false
		var product: Resource = ResourceLoader.load(str(product_paths[0]), "", ResourceLoader.CACHE_MODE_IGNORE)
		var receipt: ForgeCreatorBakeReceipt = ResourceLoader.load(
			str(receipt_paths[0]), "", ResourceLoader.CACHE_MODE_IGNORE)
		if product == null or receipt == null or not product.has_method("canonical_hash"): return false
		if str(product.get("source_id")) != target_id or receipt.source_id != target_id: return false
		if receipt.source_hash != str(product.get("combined_source_hash")): return false
		if str(receipt.product_hashes.get(str(product_paths[0]), "")) != product.call("canonical_hash"): return false
		if int(receipt.validation_summary.get("source_reload_passes", 0)) != 2 \
				or not bool(receipt.validation_summary.get("matching_hashes", false)): return false
	return true

func _resources_of_type(root: String, expected: Variant) -> Array:
	var result := []
	for path in _resource_paths(root):
		var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if is_instance_of(resource, expected): result.append(resource)
	return result

func _resource_paths(root: String) -> PackedStringArray:
	var result := PackedStringArray()
	if DirAccess.open(root) == null: return result
	for directory in DirAccess.get_directories_at(root): result.append_array(_resource_paths(root.path_join(directory)))
	for file_name in DirAccess.get_files_at(root):
		if file_name.ends_with(".tres"): result.append(root.path_join(file_name))
	return result

func _procedural_sources_owned(sources: Array) -> bool:
	return sources.all(func(source): return (
		source.rights_status == "owned"
		and str(source.source_path).begins_with("forge-synth://")
		and not source.source_hash.is_empty()))

func _synth_deterministic(patches: Array) -> bool:
	var baker := ForgeProceduralAudioBaker.new()
	for index in mini(8, patches.size()):
		var first := baker.render_note(patches[index], patches[index].preview_midi_note)
		var second := baker.render_note(patches[index], patches[index].preview_midi_note)
		if not bool(first.get("ok", false)) or first.get("source_hash") != second.get("source_hash"):
			print("SYNTH_DETERMINISM_FAILURE %s" % JSON.stringify({"id": patches[index].stable_id,
				"first_ok": first.get("ok", false), "first_error": first.get("error", ""),
				"first_hash": first.get("source_hash", ""), "second_hash": second.get("source_hash", "")}))
			return false
	return true

func _module_family_complete() -> bool:
	for family in ["forest_road", "mine_tunnel", "cave_nest", "goblin_den", "rune_vault"]:
		var set: ForgeBlueprintModuleSet = load("res://content/forge/blueprints/user/production/sets/%s.tres" % ForgeId.safe_filename("blueprint.module_set.%s" % family))
		if set == null or set.module_ids.size() != 8 or set.start_module_ids.size() != 1 or set.end_module_ids.size() != 1: return false
	return true

func _states_complete() -> bool:
	var counts := {}
	for root in ["res://content/forge/blueprints/user/production/states",
			"res://content/forge/runtime/set22_23_stage5"]:
		for path in _resource_paths(root):
			var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
			if resource is ForgeBlueprintStateDefinition \
					and resource.state_kind in ["under_construction", "light_damage", "repaired"]:
				counts[resource.blueprint_id] = int(counts.get(resource.blueprint_id, 0)) + 1
	var ledger := ForgeCoverageLedgerService.new().load_ledger()
	var target_ids := {}
	for record in ledger.get("records", []):
		var target_id := str(record.get("target_id", ""))
		if str(record.get("studio", "")) == "structures" \
				and not target_id.begins_with("blueprint.module_set."):
			target_ids[target_id] = true
	return target_ids.size() == 124 and target_ids.keys().all(
		func(target_id): return int(counts.get(target_id, 0)) >= 2)

func _approval_batches_bounded() -> bool:
	for path in _resource_paths("res://content/forge/catalogues/approval_batches"):
		var batch: ForgeApprovalBatchManifest = load(path)
		if batch != null and (batch.target_ids.is_empty() or batch.target_ids.size() > 32): return false
	return true

func _guide_records_complete() -> bool:
	var required := ["where", "control_label", "example_input", "input_format", "why_now",
		"what_it_controls", "expected_result", "verification", "common_mistakes", "recovery", "related_information"]
	for title in ["Blueprint Composition Editor", "Entity Model Editor", "Live VFX Graph Editor", "Waveform & Event Editor"]:
		for record in ForgeSectionGuides.records_for_page(title, ForgeSectionGuides.IN_DEPTH):
			for field in required:
				if str(record.get(field, "")).strip_edges().is_empty(): return false
	return true

func _capstones_complete() -> bool:
	var requirements := {
		"Items & Blocks": ["workshop lantern", "voxel", "material", "collision", "animation", "icon", "world"],
		"Blueprint Composition Editor": ["two-room guard building", "construction", "light_damage",
			"eight small training modules", "opening size", "continuation", "seed 104729"],
		"Entity Model Editor": ["training pig", "body part", "rig", "animation", "equipment",
			"collision", "thumbnail", "lod"],
		"Live VFX Graph Editor": ["mining spark burst", "voxel", "graph", "event binding",
			"reduced motion", "flash safety", "dense-scene"],
		"Waveform & Event Editor": ["workshop chime", "a4 tuning", "cent offset", "oscillator",
			"waveform overview", "region", "spatial", "caption", "clipping"],
	}
	for page in requirements:
		var text := ""
		for record in ForgeSectionGuides.records_for_page(page, ForgeSectionGuides.IN_DEPTH):
			text += " " + str(record.get("action", "")).to_lower()
		for keyword in requirements[page]:
			if str(keyword) not in text:
				print("FORGE_GUIDE_CAPSTONE_MISSING page=%s keyword=%s" % [page, keyword])
				return false
	return true

func _expect(condition: bool, label: String) -> void:
	checks += 1
	if not condition: failures.append(label)
