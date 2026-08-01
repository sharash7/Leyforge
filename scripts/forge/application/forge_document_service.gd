class_name ForgeDocumentService
extends RefCounted
## Opens, creates and atomically saves canonical Forge source.

signal document_saved(asset_id: String, path: String)

const ASSET_ROOT := "res://content/forge/assets"

var open_documents: Dictionary = {}
var source_paths: Dictionary = {}
var dirty_documents: Dictionary = {}


func create_from_registry(
		record: Dictionary, authoring_mode_override := "") \
		-> ForgeAssetDefinition:
	var gameplay_id := str(record.get("gameplay_id", ""))
	var asset := ForgeAssetDefinition.new()
	asset.forge_asset_id = ForgeId.source_id_for(gameplay_id)
	asset.presentation_id = str(record.get(
		"presentation_id", ForgeId.presentation_id_for(gameplay_id)))
	asset.display_name = str(record.get("display_name", gameplay_id))
	asset.asset_kind = _asset_kind(record)
	asset.gameplay_links = PackedStringArray([gameplay_id])
	asset.presentation_contract_id = str(record.get("contract_id", ""))
	asset.authoring_profile = _authoring_profile(record)
	asset.planning_tags = PackedStringArray([
		"mvp", "legacy_migration", str(record.get("category", "")),
	])
	asset.provenance_note = "Created from the live gameplay registry."
	var palette := ForgePaletteDefinition.new()
	palette.palette_id = "palette.%s" % gameplay_id
	palette.display_name = "%s Palette" % asset.display_name
	palette.ensure_default_entries()
	asset.palettes = [palette]
	var authoring_mode := authoring_mode_override \
		if authoring_mode_override in ["surface", "voxel", "compound"] \
		else str(record.get("authoring_mode", "surface"))
	if authoring_mode == "surface":
		var surface := ForgeSurfaceSet.new()
		surface.material_dna_id = "material.%s" % gameplay_id
		surface.ensure_faces()
		asset.surface_set = surface
		asset.authoring_profile = "surface.block.standard"
		asset.asset_kind = "standard_block_surface"
	elif authoring_mode == "compound":
		var body_volume := ForgeVoxelVolume.new()
		body_volume.dimensions = Vector3i(32, 32, 32)
		body_volume.ensure_storage()
		var body_part := ForgePartDefinition.new()
		body_part.part_key = "body"
		body_part.source_volume = body_volume
		asset.parts = [body_part]
		asset.authoring_profile = "voxel.standard.machine_2x1"
		asset.asset_kind = "compound_machine"
	else:
		var volume := ForgeVoxelVolume.new()
		volume.dimensions = Vector3i(32, 32, 32)
		volume.ensure_storage()
		asset.voxel_volume = volume
		var item_like := _is_item_asset(asset, record)
		asset.authoring_profile = (
			_authoring_profile(record) if authoring_mode_override.is_empty()
			else (
				"voxel.standard.item_long" if item_like
				else "voxel.standard.block"))
		asset.asset_kind = "item_model" if item_like else "unique_voxel_block"
	asset.collision_profile = _default_collision(asset)
	asset.footprint_profile = _default_footprint(asset)
	open_documents[asset.forge_asset_id] = asset
	source_paths[asset.forge_asset_id] = default_path(asset)
	dirty_documents[asset.forge_asset_id] = true
	return asset


func ensure_authoring_mode(
		asset: ForgeAssetDefinition, mode: String,
		record: Dictionary = {}) -> bool:
	if asset == null or mode not in ["surface", "voxel"]:
		return false
	var item_like := _is_item_asset(asset, record)
	if mode == "surface":
		if not asset.surface_set is ForgeSurfaceSet:
			var surface := ForgeSurfaceSet.new()
			surface.material_dna_id = "material.%s" % _gameplay_id(asset, record)
			surface.ensure_faces()
			asset.surface_set = surface
		asset.authoring_profile = "surface.block.standard"
		asset.asset_kind = "standard_block_surface"
	else:
		if not asset.voxel_volume is ForgeVoxelVolume:
			var volume := ForgeVoxelVolume.new()
			volume.dimensions = Vector3i(32, 32, 32)
			volume.ensure_storage()
			asset.voxel_volume = volume
		asset.authoring_profile = (
			"voxel.standard.item_long" if item_like
			else "voxel.standard.block")
		asset.asset_kind = "item_model" if item_like else "unique_voxel_block"
	mark_dirty(asset.forge_asset_id)
	return true


func open_path(path: String) -> ForgeAssetDefinition:
	var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if not resource is ForgeAssetDefinition:
		return null
	var asset: ForgeAssetDefinition = resource
	open_documents[asset.forge_asset_id] = asset
	source_paths[asset.forge_asset_id] = path
	dirty_documents[asset.forge_asset_id] = false
	return asset


func save_draft(asset: ForgeAssetDefinition, path := "") -> Dictionary:
	if not ForgeAccessPolicy.can_author():
		return {"ok": false, "error": "Forge authoring is disabled in this build."}
	if asset == null or not ForgeId.is_valid(asset.forge_asset_id, "forge_asset."):
		return {"ok": false, "error": "Forge asset ID is invalid."}
	var target := path if not path.is_empty() else str(
		source_paths.get(asset.forge_asset_id, default_path(asset)))
	var parent := target.get_base_dir()
	var absolute_parent := ProjectSettings.globalize_path(parent)
	var directory_error := DirAccess.make_dir_recursive_absolute(absolute_parent)
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(directory_error)}
	var temporary := "%s.tmp.tres" % target.trim_suffix(".tres")
	var previous := "%s.previous.bak" % target.trim_suffix(".tres")
	var save_error := ResourceSaver.save(asset, temporary)
	if save_error != OK:
		return {"ok": false, "error": error_string(save_error)}
	var verified := ResourceLoader.load(
		temporary, "", ResourceLoader.CACHE_MODE_IGNORE)
	if not verified is ForgeAssetDefinition \
			or verified.forge_asset_id != asset.forge_asset_id:
		_remove_if_present(temporary)
		return {"ok": false, "error": "Temporary source failed read-back validation."}
	_remove_if_present(previous)
	if FileAccess.file_exists(target):
		var rotate_error := DirAccess.rename_absolute(
			ProjectSettings.globalize_path(target),
			ProjectSettings.globalize_path(previous))
		if rotate_error != OK:
			_remove_if_present(temporary)
			return {"ok": false, "error": error_string(rotate_error)}
	var promote_error := DirAccess.rename_absolute(
		ProjectSettings.globalize_path(temporary),
		ProjectSettings.globalize_path(target))
	if promote_error != OK:
		if FileAccess.file_exists(previous):
			DirAccess.rename_absolute(
				ProjectSettings.globalize_path(previous),
				ProjectSettings.globalize_path(target))
		_remove_if_present(temporary)
		return {"ok": false, "error": error_string(promote_error)}
	source_paths[asset.forge_asset_id] = target
	open_documents[asset.forge_asset_id] = asset
	dirty_documents[asset.forge_asset_id] = false
	document_saved.emit(asset.forge_asset_id, target)
	return {
		"ok": true,
		"path": target,
		"source_hash": asset.canonical_hash(),
		"previous_path": previous if FileAccess.file_exists(previous) else "",
	}


func mark_dirty(asset_id: String) -> void:
	dirty_documents[asset_id] = true


func is_dirty(asset_id: String) -> bool:
	return bool(dirty_documents.get(asset_id, false))


func default_path(asset: ForgeAssetDefinition) -> String:
	return ASSET_ROOT.path_join(
		"%s.tres" % ForgeId.safe_filename(asset.forge_asset_id))


func _asset_kind(record: Dictionary) -> String:
	if str(record.get("kind", "")) == "item":
		return "item_model"
	return {
		"surface": "standard_block_surface",
		"voxel": "unique_voxel_block",
		"compound": "compound_machine",
	}.get(str(record.get("authoring_mode", "surface")), "standard_block_surface")


func _authoring_profile(record: Dictionary) -> String:
	if str(record.get("kind", "")) == "item":
		return "voxel.standard.item_long"
	var gameplay_id := str(record.get("gameplay_id", ""))
	if ".door." in gameplay_id and "trapdoor" not in gameplay_id:
		return "voxel.standard.door_1x2"
	return {
		"surface": "surface.block.standard",
		"voxel": "voxel.standard.block",
		"compound": "voxel.standard.machine_2x1",
	}.get(str(record.get("authoring_mode", "surface")), "surface.block.standard")


func _default_collision(asset: ForgeAssetDefinition) -> ForgeCollisionProfile:
	var profile := ForgeCollisionProfile.new()
	profile.collision_profile_id = "collision.%s" % asset.presentation_id
	var maximum_height := 2.0 if _is_tall_door(asset) else 1.0
	profile.boxes = [{
		"minimum": [0.0, 0.0, 0.0],
		"maximum": [1.0, maximum_height, 1.0],
	}]
	return profile


func _default_footprint(asset: ForgeAssetDefinition) -> ForgeFootprintProfile:
	var profile := ForgeFootprintProfile.new()
	profile.footprint_profile_id = "footprint.%s" % asset.presentation_id
	if _is_tall_door(asset):
		profile.occupied_cells = [Vector3i.ZERO, Vector3i.UP]
	return profile


func _is_tall_door(asset: ForgeAssetDefinition) -> bool:
	for gameplay_id in asset.gameplay_links:
		if ".door." in gameplay_id and "trapdoor" not in gameplay_id:
			return true
	return false


func _is_item_asset(
		asset: ForgeAssetDefinition, record: Dictionary) -> bool:
	if str(record.get("kind", "")) == "item" \
			or asset.asset_kind == "item_model":
		return true
	for gameplay_id in asset.gameplay_links:
		if str(gameplay_id).begins_with("item."):
			return true
	return false


func _gameplay_id(
		asset: ForgeAssetDefinition, record: Dictionary) -> String:
	var from_record := str(record.get("gameplay_id", ""))
	if not from_record.is_empty():
		return from_record
	if not asset.gameplay_links.is_empty():
		return str(asset.gameplay_links[0])
	return asset.forge_asset_id.trim_prefix("forge_asset.")


func _remove_if_present(path: String) -> void:
	if not FileAccess.file_exists(path):
		return
	DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
