extends SceneTree
## Generates the development-only Set 21 end-to-end acceptance family.
## The assets deliberately do not enter the gameplay block/item registries;
## they exercise Forge discovery, validation, bake and runtime resolution while
## preserving the historical registry/save compatibility boundary.

const ASSET_ROOT := "res://content/forge/assets/acceptance"
const CONTRACT_ROOT := "res://content/forge/contracts"
const PACK_PATH := "res://content/forge/packs/pack_test_forge_acceptance.tres"
const OVERRIDE_PATH := "res://content/forge/assets/acceptance/override_test_forge_surface_weathered.tres"

const SPECS := [
	{
		"source": "res://content/forge/assets/forge_asset_terrain_grass_basic.tres",
		"gameplay_id": "test.forge.block.acceptance_surface",
		"display_name": "Forge Acceptance Mosaic Block",
		"contract_id": "contract.test.forge.acceptance_surface.v1",
		"contract_kind": "surface",
		"colours": ["#203c4a", "#2f7180", "#d6a756", "#6f3f78"],
	},
	{
		"source": "res://content/forge/assets/forge_asset_magic_conduit_mana_basic.tres",
		"gameplay_id": "test.forge.block.acceptance_relay",
		"display_name": "Forge Acceptance Relay Block",
		"contract_id": "contract.test.forge.acceptance_relay.v1",
		"contract_kind": "relay",
		"colours": ["#263849", "#35b9c7", "#e8c45b", "#9b5de5"],
	},
	{
		"source": "res://content/forge/assets/forge_asset_functional_furnace_stone.tres",
		"gameplay_id": "test.forge.block.acceptance_machine",
		"display_name": "Forge Acceptance State Machine",
		"contract_id": "contract.test.forge.acceptance_machine.v1",
		"contract_kind": "machine",
		"colours": ["#33404a", "#677784", "#d78b37", "#ffe47a"],
	},
	{
		"source": "res://content/forge/assets/forge_asset_item_tool_crude_pickaxe.tres",
		"gameplay_id": "test.forge.item.acceptance_tool",
		"display_name": "Forge Acceptance Tuning Tool",
		"contract_id": "contract.test.forge.acceptance_tool.v1",
		"contract_kind": "tool",
		"colours": ["#5b3c26", "#45a7b8", "#e1c45a", "#d8e4ea"],
	},
]

var _documents := ForgeDocumentService.new()
var _baker := ForgeBakeService.new()
var _failures: Array[String] = []
var _generated: Array[String] = []


func _initialize() -> void:
	call_deferred("_run")


func _run() -> void:
	ForgeAccessPolicy.test_override = true
	_ensure_directory(ASSET_ROOT)
	_ensure_directory(CONTRACT_ROOT)
	_ensure_directory(PACK_PATH.get_base_dir())
	var assets: Array[ForgeAssetDefinition] = []
	for spec in SPECS:
		var contract := _make_contract(spec)
		_save_resource(contract, _contract_path(str(spec["contract_id"])))
		var asset := _make_asset(spec)
		if asset == null:
			continue
		var diagnostics := ForgeValidationService.new().validate_asset(
			asset, contract)
		if ForgeValidationService.new().has_blockers(diagnostics):
			_failures.append("validation:%s:%s" % [asset.forge_asset_id,
				JSON.stringify(_diagnostic_records(diagnostics))])
			continue
		var bake_result := _bake_or_reuse(asset, contract)
		if not bool(bake_result.get("ok", false)):
			_failures.append("bake:%s:%s" % [asset.forge_asset_id,
				str(bake_result.get("error", "unknown"))])
			continue
		var source_path := ASSET_ROOT.path_join(
			"%s.tres" % ForgeId.safe_filename(asset.forge_asset_id))
		var save_result := _save_asset_if_changed(asset, source_path)
		if not bool(save_result.get("ok", false)):
			_failures.append("save:%s:%s" % [asset.forge_asset_id,
				str(save_result.get("error", "unknown"))])
			continue
		assets.append(asset)
		_generated.append(asset.forge_asset_id)
	_create_override()
	_create_pack(assets)
	ForgeAccessPolicy.clear_test_override()
	var hashes: Array[String] = []
	for asset in assets:
		hashes.append(asset.canonical_hash())
	hashes.sort()
	var report := {
		"ok": _failures.is_empty(),
		"asset_count": assets.size(),
		"assets": _generated,
		"deterministic_hash": ForgeStableRecord.hash_record({"hashes": hashes}),
		"failures": _failures,
	}
	print("FORGE_ACCEPTANCE_SUITE_GENERATOR %s" % JSON.stringify(report))
	quit(0 if _failures.is_empty() else 1)


func _make_asset(spec: Dictionary) -> ForgeAssetDefinition:
	var source := ResourceLoader.load(
		str(spec["source"]), "", ResourceLoader.CACHE_MODE_IGNORE)
	if not source is ForgeAssetDefinition:
		_failures.append("missing_source:%s" % str(spec["source"]))
		return null
	var asset := source.duplicate(true) as ForgeAssetDefinition
	var gameplay_id := str(spec["gameplay_id"])
	asset.forge_asset_id = ForgeId.source_id_for(gameplay_id)
	asset.presentation_id = ForgeId.presentation_id_for(gameplay_id)
	asset.display_name = str(spec["display_name"])
	asset.gameplay_links = PackedStringArray([gameplay_id])
	asset.presentation_contract_id = str(spec["contract_id"])
	asset.source_revision = 1
	asset.source_status = "draft"
	asset.source_pack_id = "pack.test.forge.acceptance"
	asset.planning_tags = PackedStringArray([
		"development_only", "forge_acceptance", "set21_vertical_slice",
		"do_not_ship_as_gameplay_content", str(spec["contract_kind"]),
	])
	asset.provenance_note = (
		"Development-only acceptance fixture derived from an approved golden "
		+ "source. It is not a gameplay registry entry or production asset.")
	_retarget_nested_ids(asset, gameplay_id)
	_recolour(asset, spec.get("colours", []))
	if str(spec["contract_kind"]) == "tool":
		var grip := ForgeSocketDefinition.new()
		grip.socket_key = "grip"
		grip.socket_type = "equipment"
		grip.local_transform = Transform3D(Basis.IDENTITY, Vector3(0.5, 0.1, 0.5))
		grip.direction = Vector3.UP
		grip.tags = PackedStringArray(["socket.hand.primary", "acceptance"])
		grip.contract_required = true
		asset.sockets = [grip]
	return asset


func _retarget_nested_ids(asset: ForgeAssetDefinition, gameplay_id: String) -> void:
	for palette_resource in asset.palettes:
		if palette_resource is ForgePaletteDefinition:
			var palette := palette_resource as ForgePaletteDefinition
			palette.palette_id = "palette.%s" % gameplay_id
			palette.display_name = "%s Acceptance Palette" % asset.display_name
	if asset.collision_profile is ForgeCollisionProfile:
		asset.collision_profile.collision_profile_id = (
			"collision.%s" % asset.presentation_id)
	if asset.footprint_profile is ForgeFootprintProfile:
		asset.footprint_profile.footprint_profile_id = (
			"footprint.%s" % asset.presentation_id)
	if asset.animation_set is ForgeAnimationSet:
		asset.animation_set.animation_set_id = "animations.%s" % gameplay_id
	if asset.state_binding is ForgeStateBindingDefinition:
		asset.state_binding.state_binding_id = "statebinding.%s" % gameplay_id
		asset.state_binding.state_contract_id = "test.forge.acceptance"
	for variant_resource in asset.variant_sets:
		if variant_resource is ForgeVariantSet:
			var variant := variant_resource as ForgeVariantSet
			variant.variant_set_id = "variantset.%s.material" % asset.presentation_id
			variant.parent_presentation_id = asset.presentation_id
			variant.seed_salt = "acceptance-%s" % gameplay_id
	asset.dependency_ids = PackedStringArray()


func _recolour(asset: ForgeAssetDefinition, values: Array) -> void:
	if values.is_empty():
		return
	for palette_resource in asset.palettes:
		if not palette_resource is ForgePaletteDefinition:
			continue
		var palette := palette_resource as ForgePaletteDefinition
		var entries := palette.entries.duplicate(true)
		for index in entries.size():
			var entry: Dictionary = entries[index]
			entry["albedo"] = Color(str(values[index % values.size()]))
			if index == values.size() - 1:
				entry["emission"] = Color(str(values[index % values.size()])) * 0.35
			entries[index] = entry
		palette.entries = entries


func _make_contract(spec: Dictionary) -> ForgePresentationContract:
	var contract := ForgePresentationContract.new()
	contract.contract_id = str(spec["contract_id"])
	contract.gameplay_categories = PackedStringArray([
		"development_test", str(spec["contract_kind"]),
	])
	contract.fallback_presentation_id = "presentation.terrain.stone.basic"
	contract.accessibility_requirements = PackedStringArray([
		"critical_state_not_colour_only", "reduced_motion_equivalent",
	])
	match str(spec["contract_kind"]):
		"surface":
			contract.required_representations = PackedStringArray([
				"world", "preview", "icon"])
		"relay":
			contract.required_representations = PackedStringArray([
				"world", "preview", "icon"])
			contract.required_sockets = PackedStringArray(["input", "output"])
			contract.required_states = PackedStringArray(["flow_active"])
			contract.footprint_profile_id = (
				"footprint.presentation.test.forge.block.acceptance_relay")
		"machine":
			contract.required_representations = PackedStringArray([
				"world", "preview", "icon"])
			contract.required_parts = PackedStringArray(["body", "gear", "flame"])
			contract.required_sockets = PackedStringArray([
				"item_input", "item_output", "smoke", "work_audio"])
			contract.required_states = PackedStringArray([
				"processing", "blocked", "damaged"])
			contract.critical_responses = PackedStringArray(["blocked", "damaged"])
			contract.footprint_profile_id = (
				"footprint.presentation.test.forge.block.acceptance_machine")
		"tool":
			contract.required_representations = PackedStringArray([
				"held", "dropped", "icon", "preview"])
			contract.required_sockets = PackedStringArray(["grip"])
	return contract


func _bake_or_reuse(
		asset: ForgeAssetDefinition, contract: ForgePresentationContract) -> Dictionary:
	var previous_status := asset.source_status
	asset.source_status = "approved"
	var expected_hash := asset.canonical_hash()
	asset.source_status = previous_status
	var manifest_path := "res://generated/forge/manifests/%s.tres" % (
		ForgeId.safe_filename(asset.presentation_id))
	var manifest: Resource
	if ResourceLoader.exists(manifest_path):
		manifest = ResourceLoader.load(
			manifest_path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if manifest is ForgeBakeManifest and manifest.source_hash == expected_hash \
			and manifest.approved_status == "approved" \
			and _products_exist(manifest.products):
		asset.source_status = "approved"
		return {"ok": true, "reused": true, "manifest_path": manifest_path}
	return _baker.bake(asset, contract, true)


func _save_asset_if_changed(
		asset: ForgeAssetDefinition, path: String) -> Dictionary:
	var existing: Resource
	if ResourceLoader.exists(path):
		existing = ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if existing is ForgeAssetDefinition \
			and existing.canonical_hash() == asset.canonical_hash():
		return {"ok": true, "path": path, "unchanged": true}
	return _documents.save_draft(asset, path)


func _create_override() -> void:
	var override := ForgeOverrideDefinition.new()
	override.override_id = "override.test.forge.acceptance_surface.weathered"
	override.target_presentation_id = (
		"presentation.test.forge.block.acceptance_surface")
	override.source_pack_id = "pack.test.forge.acceptance"
	override.source_layer = "project"
	override.priority = 21
	override.contract_requirement = "contract.test.forge.acceptance_surface.v1"
	override.field_operations = {
		"material": {"op": "replace", "value": "weathered_acceptance"},
		"tags": {"op": "append", "value": ["weathered", "test"]},
	}
	override.status = "approved_test_fixture"
	override.provenance_note = (
		"Deterministic Set 21 field-level override acceptance fixture.")
	_save_resource(override, OVERRIDE_PATH)


func _create_pack(assets: Array[ForgeAssetDefinition]) -> void:
	var pack := ForgeContentPackManifest.new()
	pack.pack_id = "pack.test.forge.acceptance"
	pack.display_name = "Forge End-to-End Acceptance Fixtures"
	pack.version = "1.0.0"
	pack.priority = 21
	pack.dependencies = PackedStringArray(["pack.leyforge.project_visuals"])
	var asset_ids: Array[String] = []
	var presentation_ids: Array[String] = []
	for asset in assets:
		asset_ids.append(asset.forge_asset_id)
		presentation_ids.append(asset.presentation_id)
	pack.asset_ids = PackedStringArray(asset_ids)
	pack.presentation_asset_ids = PackedStringArray(presentation_ids)
	pack.override_ids = PackedStringArray([
		"override.test.forge.acceptance_surface.weathered"])
	pack.enabled_by_default = false
	pack.provenance_note = (
		"Development-only deterministic fixtures. No external media or rights claim.")
	pack.subject_type = "forge_acceptance_suite"
	pack.target_id = pack.pack_id
	pack.lifecycle = "validated_test_fixture"
	pack.contract_version = "21-acceptance-v1"
	pack.dependency_information = {
		"required": ["pack.leyforge.project_visuals"],
		"purpose": "end_to_end_forge_verification",
	}
	pack.replacement_strategy = "preserve"
	pack.fallback = "legacy_runtime"
	pack.removal_gate = "replace_with_equivalent_vertical_acceptance_suite"
	pack.review_history = [{
		"status": "automated_validation",
		"evidence": "forge_end_to_end_probe",
		"human_visual_approval": "open",
	}]
	_save_resource(pack, PACK_PATH)


func _contract_path(contract_id: String) -> String:
	return CONTRACT_ROOT.path_join(
		"%s.tres" % ForgeId.safe_filename(contract_id))


func _save_resource(resource: Resource, path: String) -> void:
	_ensure_directory(path.get_base_dir())
	var error := ResourceSaver.save(resource, path)
	if error != OK:
		_failures.append("resource_save:%s:%s" % [path, error_string(error)])


func _ensure_directory(path: String) -> void:
	var error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(path))
	if error not in [OK, ERR_ALREADY_EXISTS]:
		_failures.append("directory:%s:%s" % [path, error_string(error)])


func _products_exist(products: Array[Dictionary]) -> bool:
	if products.is_empty():
		return false
	for product in products:
		var path := str(product.get("path", ""))
		if path.is_empty() or not FileAccess.file_exists(path):
			return false
	return true


func _diagnostic_records(diagnostics: Array[ForgeDiagnostic]) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for diagnostic in diagnostics:
		records.append(diagnostic.to_record())
	return records
