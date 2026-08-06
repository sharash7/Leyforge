extends Node
## Final vertical acceptance probe for Documents 21A-21G and the unified Forge.
## Four development-only fixtures cover surface, voxel, compound/state, and item
## authoring without entering the gameplay registries or changing save identity.

const ForgeHostScene = preload("res://forge_runtime_host.tscn")

const EXPECTED_CHECKS := 250
const EXPECTED_HASH := "1b2d507444d3caa0f29e5135521ec5ba1f0475d513f5225b5ee3bbf64370f01c"
const USER_ROOT := "user://forge_end_to_end"
const ACCEPTANCE_ROOT := "res://content/forge/assets/acceptance"
const GUIDE_PATH := "res://development/FORGE_USER_AND_DEVELOPER_GUIDE.md"
const SPECS := [
	{
		"gameplay_id": "test.forge.block.acceptance_surface",
		"source_id": "forge_asset.test.forge.block.acceptance_surface",
		"presentation_id": "presentation.test.forge.block.acceptance_surface",
		"display_name": "Forge Acceptance Mosaic Block",
		"mode": "surface",
	},
	{
		"gameplay_id": "test.forge.block.acceptance_relay",
		"source_id": "forge_asset.test.forge.block.acceptance_relay",
		"presentation_id": "presentation.test.forge.block.acceptance_relay",
		"display_name": "Forge Acceptance Relay Block",
		"mode": "voxel",
	},
	{
		"gameplay_id": "test.forge.block.acceptance_machine",
		"source_id": "forge_asset.test.forge.block.acceptance_machine",
		"presentation_id": "presentation.test.forge.block.acceptance_machine",
		"display_name": "Forge Acceptance State Machine",
		"mode": "compound",
	},
	{
		"gameplay_id": "test.forge.item.acceptance_tool",
		"source_id": "forge_asset.test.forge.item.acceptance_tool",
		"presentation_id": "presentation.test.forge.item.acceptance_tool",
		"display_name": "Forge Acceptance Tuning Tool",
		"mode": "item",
	},
]

var failures: Array[String] = []
var checks := 0
var hashes: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	ForgeAccessPolicy.test_override = true
	_test_manifest_schemas_semantics_and_docs()
	var assets := _test_index_sources_contracts_and_products()
	_test_pack_override_and_registry_boundary()
	_test_author_save_validate_bake_roundtrip(assets)
	await _test_runtime_variations()
	await _test_workspace_discovery()
	_test_unified_foundation_workspace()
	ForgeAccessPolicy.clear_test_override()
	hashes.sort()
	var deterministic_hash := ForgeStableRecord.hash_record({"hashes": hashes})
	_check(EXPECTED_HASH.is_empty() or deterministic_hash == EXPECTED_HASH,
		"end-to-end deterministic hash drifted")
	_check(EXPECTED_CHECKS == 0 or checks + 1 == EXPECTED_CHECKS,
		"end-to-end exact check count drifted")
	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"fixture_count": SPECS.size(),
		"deterministic_hash": deterministic_hash,
		"failures": failures,
	}
	print("FORGE_END_TO_END_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_manifest_schemas_semantics_and_docs() -> void:
	var manifest_service := ForgeProjectManifestService.new()
	var manifest_report := manifest_service.load_and_validate()
	_check(bool(manifest_report.get("ok", false)),
		"shared Forge project manifest failed validation")
	_check((manifest_report.get("diagnostics", []) as Array).is_empty(),
		"shared Forge project manifest emitted diagnostics")
	_check(manifest_service.manifest != null,
		"shared Forge project manifest did not load")
	if manifest_service.manifest == null:
		return
	var manifest := manifest_service.manifest
	_check(manifest.schema_version == 2,
		"Forge project manifest schema is not v2")
	_check(manifest.engine_feature == "4.6",
		"Forge project manifest lost its Godot 4.6 target")
	_check(manifest.rendering_method == "gl_compatibility",
		"Forge project manifest renderer drifted")
	_check(manifest.generated_product_policy == "replaceable_output",
		"Forge generated-product policy drifted")
	_check(str(manifest.feature_contract_versions.get(
		"set21_acceptance", "")) == "21-acceptance-v1",
		"Set 21 acceptance contract is absent from the common manifest")
	for feature in ["set20", "set22", "set23", "set23_runtime_registry"]:
		_check(manifest.feature_contract_versions.has(feature),
			"unified manifest lost feature contract %s" % feature)
	var schema_registry := ForgeSchemaRegistry.new()
	var schema_report := schema_registry.load_and_validate(manifest)
	_check(bool(schema_report.get("ok", false)),
		"common schema registry rejected the manifest")
	for schema_id in [
		"leyforge.forge.project-manifest",
		"leyforge.forge.entity-definition",
		"leyforge.forge.blueprint-definition",
		"leyforge.forge.presentation-profile",
		"leyforge.forge.compiled-vfx-product",
		"leyforge.forge.compiled-sound-plan",
		"leyforge.forge.runtime-registry-generation",
	]:
		_check(schema_registry.has(schema_id),
			"common schema registry cannot resolve %s" % schema_id)
	var semantic := ForgeSemanticRegistry.new()
	var semantic_report := semantic.load_and_validate()
	_check(bool(semantic_report.get("ok", false)),
		"shared semantic registry failed validation")
	_check((semantic_report.get("diagnostics", []) as Array).is_empty(),
		"shared semantic registry emitted diagnostics")
	for semantic_id in [
		"socket.role.transport", "network.role.logistics",
		"material_role.wall_primary", "entity_role.player",
		"capture.profile.entity.current_state", "anchor.presentation.center",
		"region.entity.body", "runtime_anchor.block.mining_impact",
		"portal.audio.front_door",
	]:
		_check(semantic.has(semantic_id),
			"shared semantic registry cannot resolve %s" % semantic_id)
	_check(FileAccess.file_exists(GUIDE_PATH),
		"Forge user and developer guide is missing")
	var guide_text := FileAccess.get_file_as_string(GUIDE_PATH)
	_check(guide_text.length() >= 12000,
		"Forge user and developer guide is not detailed enough")
	for heading in [
		"Create a standard surface block", "Create a unique voxel block",
		"Create an animated compound machine", "Create an item or tool",
		"Events, contexts and presentation profiles",
		"Document Set 21 implementation status",
		"Recovery and source safety",
	]:
		_check(heading in guide_text,
			"Forge guide is missing section: %s" % heading)
	_check(ForgeSectionGuides.GUIDES.size() >= 32,
		"in-Forge progressive help lost the eight-studio guidance")
	var step_count := 0
	for steps in ForgeSectionGuides.GUIDES.values():
		step_count += (steps as Array).size()
	_check(step_count >= 200,
		"in-Forge progressive help lost detailed steps")
	for letter in ["A", "B", "C", "D", "E", "F", "G"]:
		var matches := _files_matching(
			"res://.summer/00_Docs/21-A-G", "21%s_" % letter)
		_check(matches.size() == 1,
			"Document 21%s canonical Markdown source is missing or duplicated" % letter)
		if not matches.is_empty():
			var text := FileAccess.get_file_as_string(matches[0])
			_check(text.length() > 1000 and "Forge" in text,
				"Document 21%s source is incomplete" % letter)
	hashes.append(str(manifest_report.get("manifest_hash", "")))
	hashes.append(ForgeStableRecord.hash_record({
		"guide_sections": ForgeSectionGuides.GUIDES.size(),
		"guide_steps": step_count,
	}))


func _test_index_sources_contracts_and_products() -> Array[ForgeAssetDefinition]:
	var assets: Array[ForgeAssetDefinition] = []
	var index := ForgeAssetIndex.new()
	var summary := index.rebuild()
	_check(int(summary.get("asset_count", 0)) == 316,
		"asset index did not include 312 gameplay records and four fixtures")
	_check((summary.get("diagnostics", []) as Array).is_empty(),
		"asset index emitted source diagnostics")
	var results := index.search("Forge Acceptance")
	_check(results.size() == 4,
		"Asset Browser search cannot discover all acceptance fixtures")
	var validation := ForgeValidationService.new()
	for spec in SPECS:
		var source_id := str(spec.source_id)
		var source_path := index.path_for_source_id(source_id)
		var indexed := index.record_for_source_id(source_id)
		_check(not source_path.is_empty() and source_path.begins_with(ACCEPTANCE_ROOT),
			"acceptance source path is missing: %s" % source_id)
		_check(bool(indexed.get("development_only", false)),
			"acceptance source is not development-only: %s" % source_id)
		_check(str(indexed.get("category", "")) == "Forge / Acceptance Fixtures",
			"acceptance source is not grouped in the Asset Browser")
		_check(str(indexed.get("gameplay_id", "")) == str(spec.gameplay_id),
			"acceptance source gameplay link drifted")
		var loaded := ResourceLoader.load(
			source_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(loaded is ForgeAssetDefinition,
			"acceptance source is not a ForgeAssetDefinition: %s" % source_id)
		if not loaded is ForgeAssetDefinition:
			continue
		var asset: ForgeAssetDefinition = loaded
		assets.append(asset)
		_check(asset.display_name == str(spec.display_name),
			"acceptance fixture display name drifted: %s" % source_id)
		_check(asset.presentation_id == str(spec.presentation_id),
			"acceptance fixture presentation identity drifted")
		_check(asset.source_status == "approved",
			"acceptance fixture is not an approved test source")
		_check("development_only" in asset.planning_tags
			and "do_not_ship_as_gameplay_content" in asset.planning_tags,
			"acceptance fixture lost its non-shipping classification")
		_check(_mode_for(asset) == str(spec.mode),
			"acceptance fixture authoring mode drifted: %s" % source_id)
		var contract := _load_contract(asset.presentation_contract_id)
		_check(contract != null,
			"acceptance presentation contract is missing: %s" % source_id)
		var diagnostics := validation.validate_asset(asset, contract)
		_check(not validation.has_blockers(diagnostics),
			"acceptance source has validation blockers: %s" % source_id)
		_check(asset.canonical_hash().length() == 64,
			"acceptance source canonical hash is invalid")
		var safe_name := ForgeId.safe_filename(asset.presentation_id)
		var manifest_path := "res://generated/forge/manifests/%s.tres" % safe_name
		var package_path := "res://generated/forge/packages/%s.tres" % safe_name
		var bake_manifest := ResourceLoader.load(
			manifest_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		var package := ResourceLoader.load(
			package_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(bake_manifest is ForgeBakeManifest,
			"acceptance bake manifest is missing: %s" % source_id)
		_check(package is ForgeRuntimePackage,
			"acceptance runtime package is missing: %s" % source_id)
		if bake_manifest is ForgeBakeManifest:
			_check(bake_manifest.approved_status == "approved",
				"acceptance bake manifest is not approved")
			_check(bake_manifest.source_hash == asset.canonical_hash(),
				"acceptance bake manifest is stale")
			var intact: bool = not bake_manifest.products.is_empty()
			for product in bake_manifest.products:
				var path := str(product.get("path", ""))
				intact = intact and FileAccess.file_exists(path) \
					and FileAccess.get_sha256(path) == str(product.get("hash", ""))
			_check(intact, "acceptance bake product integrity failed")
		if package is ForgeRuntimePackage:
			_check(package.presentation_id == asset.presentation_id,
				"acceptance runtime package identity drifted")
			_check(package.product_hash.length() == 64,
				"acceptance runtime package hash is invalid")
		hashes.append(asset.canonical_hash())
	return assets


func _test_pack_override_and_registry_boundary() -> void:
	var bridge := ForgeRegistryBridge.new()
	var records := bridge.all_gameplay_records()
	_check(records.size() == 312,
		"acceptance fixtures changed the gameplay registry boundary")
	var block_count := 0
	var item_count := 0
	for record in records:
		if str(record.get("kind", "")) == "block":
			block_count += 1
		elif str(record.get("kind", "")) == "item":
			item_count += 1
	_check(block_count == 143 and item_count == 169,
		"acceptance fixtures entered the block or item registries")
	_check(WorldManager.CURRENT_SAVE_VERSION == 17,
		"Forge acceptance work changed save schema v17")
	var pack := ResourceLoader.load(
		"res://content/forge/packs/pack_test_forge_acceptance.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE)
	_check(pack is ForgeContentPackManifest,
		"acceptance content-pack contract is missing")
	if pack is ForgeContentPackManifest:
		_check(pack.pack_id == "pack.test.forge.acceptance",
			"acceptance pack stable ID drifted")
		_check(pack.asset_ids.size() == 4 and pack.presentation_asset_ids.size() == 4,
			"acceptance pack does not contain all four fixtures")
		_check(not pack.enabled_by_default,
			"development-only acceptance pack is enabled by default")
		_check(pack.lifecycle == "validated_test_fixture"
			and pack.contract_version == "21-acceptance-v1",
			"acceptance pack lifecycle contract drifted")
		_check(pack.replacement_strategy == "preserve"
			and pack.fallback == "legacy_runtime",
			"acceptance pack lost its non-destructive fallback policy")
		hashes.append(ForgeStableRecord.hash_record(pack.to_record()))
	var override := ResourceLoader.load(
		"res://content/forge/assets/acceptance/override_test_forge_surface_weathered.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE)
	_check(override is ForgeOverrideDefinition,
		"acceptance override contract is missing")
	if override is ForgeOverrideDefinition:
		var resolver := ForgeOverrideResolver.new()
		var resolved := resolver.resolve({
			"material": "clean_acceptance", "tags": ["base"],
		}, [override])
		_check(bool(resolved.get("ok", false)),
			"acceptance field-level override did not resolve")
		_check(str(resolved.record.get("material", "")) == "weathered_acceptance",
			"acceptance replace override failed")
		_check(resolved.record.get("tags", []) == ["base", "weathered", "test"],
			"acceptance append override failed")
		_check(str(resolved.provenance.material.get("source_id", ""))
			== override.override_id,
			"acceptance override provenance was not retained")
		var copy: ForgeOverrideDefinition = override.duplicate(true)
		_check(resolver.revert_field(copy, "material")
			and not copy.field_operations.has("material"),
			"acceptance override field could not be reverted")


func _test_author_save_validate_bake_roundtrip(
		assets: Array[ForgeAssetDefinition]) -> void:
	_check(assets.size() == SPECS.size(),
		"not all acceptance sources reached the authoring pipeline")
	var documents := ForgeDocumentService.new()
	var baker := ForgeBakeService.new().set_output_root(USER_ROOT.path_join("bakes"))
	_check(str(baker.output_paths().root).begins_with("user://"),
		"acceptance bake output was not isolated from approved products")
	for asset in assets:
		var source_path := USER_ROOT.path_join("sources").path_join(
			"%s.tres" % ForgeId.safe_filename(asset.forge_asset_id))
		var saved := documents.save_draft(asset, source_path)
		_check(bool(saved.get("ok", false)),
			"acceptance source save failed: %s" % asset.forge_asset_id)
		var reopened := documents.open_path(source_path)
		_check(reopened != null,
			"acceptance source round-trip load failed")
		if reopened == null:
			continue
		_check(reopened.canonical_hash() == asset.canonical_hash(),
			"acceptance source round-trip hash drifted")
		var contract := _load_contract(reopened.presentation_contract_id)
		var first := baker.bake(reopened, contract, true)
		var second := baker.bake(reopened, contract, true)
		_check(bool(first.get("ok", false)) and bool(second.get("ok", false)),
			"acceptance isolated bake failed: %s" % asset.forge_asset_id)
		_check(str(first.get("source_hash", "")) == str(second.get("source_hash", "")),
			"acceptance repeated bake source hash drifted")
		_check(str(first.get("product_hash", "")) == str(second.get("product_hash", "")),
			"acceptance repeated bake package hash drifted")
		_check(first.get("metrics", {}) == second.get("metrics", {}),
			"acceptance repeated bake metrics drifted")
		_check(_product_signature(first.get("products", []))
			== _product_signature(second.get("products", [])),
			"acceptance repeated bake products were nondeterministic")
		_check(str(second.get("package_path", "")).begins_with(USER_ROOT),
			"acceptance bake escaped its isolated output root")
		var package := ResourceLoader.load(
			str(second.get("package_path", "")), "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(package is ForgeRuntimePackage,
			"isolated acceptance runtime package failed read-back")
		hashes.append(str(second.get("source_hash", "")))
		hashes.append(str(second.get("product_hash", "")))
		hashes.append(ForgeStableRecord.hash_record({
			"metrics": second.get("metrics", {}),
			"products": _product_signature(second.get("products", [])),
		}))
	var invalid: ForgeAssetDefinition = assets[1].duplicate(true) if assets.size() > 1 else null
	if invalid != null:
		invalid.voxel_volume = ForgeVoxelVolume.new()
		invalid.voxel_volume.dimensions = Vector3i(4, 4, 4)
		invalid.voxel_volume.ensure_storage()
		var rejected := baker.bake(
			invalid, _load_contract(invalid.presentation_contract_id), true)
		_check(not bool(rejected.get("ok", false)),
			"acceptance bake did not reject empty voxel source")
		_check(_has_diagnostic_code(rejected.get("diagnostics", []), "FORGE-GEO-001"),
			"empty voxel rejection lost FORGE-GEO-001")


func _test_runtime_variations() -> void:
	var summary := ForgeRuntime.reload_packages()
	_check(int(summary.get("package_count", 0)) >= 11,
		"runtime package resolver lost approved Forge packages")
	for spec in SPECS:
		var gameplay_id := str(spec.gameplay_id)
		var resolution := ForgeRuntime.resolve(gameplay_id)
		_check(bool(resolution.get("ok", false)),
			"runtime cannot resolve acceptance fixture: %s" % gameplay_id)
		_check(str(resolution.get("presentation_id", "")) == str(spec.presentation_id),
			"runtime acceptance resolution used the wrong stable presentation")
		var instance := ForgeRuntime.instantiate_presentation(gameplay_id)
		_check(instance != null,
			"runtime cannot instantiate acceptance fixture: %s" % gameplay_id)
		if instance == null:
			continue
		add_child(instance)
		await get_tree().process_frame
		_check(instance.get_child_count() > 0,
			"runtime acceptance presentation has no visual children")
		match str(spec.mode):
			"surface":
				_check(ForgeRuntime.surface_paths(gameplay_id).size() == 6,
					"surface acceptance block lost six baked faces")
				_check(ForgeRuntime.average_surface_color(gameplay_id) is Color,
					"surface acceptance block has no runtime colour")
			"voxel":
				_check(ForgeRuntime.uses_custom_chunk_geometry(gameplay_id),
					"voxel acceptance block is not custom chunk geometry")
				_check(not ForgeRuntime.mesh_arrays(gameplay_id).is_empty(),
					"voxel acceptance block has no baked mesh arrays")
				var relay_package := ForgeRuntime.package_for(gameplay_id)
				_check(relay_package.socket_map.has("input")
					and relay_package.socket_map.has("output"),
					"voxel acceptance relay lost its typed sockets")
			"compound":
				_check(ForgeRuntime.uses_scene_presentation(gameplay_id),
					"compound acceptance machine is not scene-backed")
				for node_name in [
					"Body", "Gear", "Flame", "AnimationPlayer",
					"VoxelFramePlayer", "StateAdapter", "RuntimeEffects",
				]:
					_check(instance.get_node_or_null(node_name) != null,
						"compound acceptance machine lost %s" % node_name)
			"item":
				var item_package := ForgeRuntime.package_for(gameplay_id)
				var profiles: Dictionary = item_package.runtime_metadata.get(
					"representation_profiles", {})
				_check(profiles.has("held") and profiles.has("dropped")
					and profiles.has("icon"),
					"acceptance item lost held/drop/icon representations")
				_check(item_package.socket_map.has("grip"),
					"acceptance item lost its grip socket")
				_check(not item_package.icon_path.is_empty()
					and FileAccess.file_exists(item_package.icon_path),
					"acceptance item lost its baked icon")
		var package := ForgeRuntime.package_for(gameplay_id)
		if package != null:
			hashes.append(package.product_hash)
		instance.queue_free()
	await get_tree().process_frame


func _test_workspace_discovery() -> void:
	var host := ForgeHostScene.instantiate()
	add_child(host)
	await get_tree().process_frame
	var workspace: ForgeWorkspace = host.get_node_or_null("ForgeWorkspace")
	_check(workspace != null, "runtime Forge host has no shared workspace")
	if workspace != null:
		_check(workspace.asset_index.search("Forge Acceptance").size() == 4,
			"runtime Asset Browser cannot find acceptance fixtures")
		var record := workspace.asset_index.record_for_source_id(
			"forge_asset.test.forge.block.acceptance_machine")
		workspace._open_record(record)
		await get_tree().process_frame
		_check(workspace.current_asset != null
			and workspace.current_asset.forge_asset_id == str(record.forge_asset_id),
			"runtime Forge workspace could not open the acceptance machine")
		_check(workspace._preview._presentation_root.get_child_count() > 0,
			"runtime Forge workspace did not preview the acceptance machine")
		workspace._preview._clear_presentation()
		host.queue_free()
	await get_tree().process_frame


func _test_unified_foundation_workspace() -> void:
	var workspace := ForgePresentationWorkspaceService.new()
	var report := workspace.load_and_validate()
	_check(bool(report.get("ok", false)),
		"unified Set 22/23 Forge workspace failed validation")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"unified Set 22/23 Forge workspace emitted diagnostics")
	_check(int(report.get("record_count", 0)) > 1000,
		"unified Forge workspace lost foundation/production sources")
	for kind in [
		"entity_definition", "blueprint_definition", "rig_profile",
		"spatial_map", "presentation_profile", "vfx_effect",
		"sound_event", "accessibility_profile", "test_scenario",
	]:
		_check(not workspace.filtered_list(kind).is_empty(),
			"unified Forge workspace cannot filter %s" % kind)
	var generation := workspace.registry_publisher.current_generation()
	_check(not generation.is_empty()
		and str(generation.get("generation_hash", "")).length() == 64,
		"unified Forge runtime registry did not publish atomically")
	hashes.append(str(generation.get("generation_hash", "")))


func _load_contract(contract_id: String) -> ForgePresentationContract:
	var path := "res://content/forge/contracts/%s.tres" % (
		ForgeId.safe_filename(contract_id))
	var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	return resource if resource is ForgePresentationContract else null


func _mode_for(asset: ForgeAssetDefinition) -> String:
	if asset.asset_kind == "item_model":
		return "item"
	if asset.uses_surface_authoring():
		return "surface"
	if asset.uses_voxel_authoring():
		return "voxel"
	return "compound" if not asset.parts.is_empty() else "unknown"


func _product_signature(products: Array) -> Array[Dictionary]:
	var signature: Array[Dictionary] = []
	for product in products:
		signature.append({
			"type": str(product.get("type", "")),
		})
	signature.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.type) < str(b.type))
	return signature


func _has_diagnostic_code(diagnostics: Array, code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic is ForgeDiagnostic and diagnostic.code == code:
			return true
		if diagnostic is Dictionary and str(diagnostic.get("code", "")) == code:
			return true
	return false


func _files_matching(root: String, prefix: String) -> PackedStringArray:
	var result := PackedStringArray()
	var directory := DirAccess.open(root)
	if directory == null:
		return result
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if not directory.current_is_dir() and entry.begins_with(prefix) \
				and entry.ends_with(".md"):
			result.append(root.path_join(entry))
		entry = directory.get_next()
	directory.list_dir_end()
	return result
