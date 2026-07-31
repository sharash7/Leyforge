class_name ForgeAutosaveService
extends RefCounted

const AUTOSAVE_ROOT := "user://leyforge/forge/autosaves"


func autosave(asset: ForgeAssetDefinition) -> Dictionary:
	if asset == null:
		return {"ok": false, "error": "No asset is open."}
	var root := ProjectSettings.globalize_path(AUTOSAVE_ROOT)
	var directory_error := DirAccess.make_dir_recursive_absolute(root)
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(directory_error)}
	var path := AUTOSAVE_ROOT.path_join(
		"%s.autosave.tres" % ForgeId.safe_filename(asset.forge_asset_id))
	var error := ResourceSaver.save(asset, path)
	return {
		"ok": error == OK,
		"path": path,
		"error": "" if error == OK else error_string(error),
	}


func recovery_candidates() -> Array[Dictionary]:
	var candidates: Array[Dictionary] = []
	var directory := DirAccess.open(AUTOSAVE_ROOT)
	if directory == null:
		return candidates
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if not directory.current_is_dir() and entry.ends_with(".autosave.tres"):
			var path := AUTOSAVE_ROOT.path_join(entry)
			var resource := ResourceLoader.load(
				path, "", ResourceLoader.CACHE_MODE_IGNORE)
			if resource is ForgeAssetDefinition:
				candidates.append({
					"asset_id": resource.forge_asset_id,
					"display_name": resource.display_name,
					"source_revision": resource.source_revision,
					"path": path,
				})
		entry = directory.get_next()
	directory.list_dir_end()
	return candidates


func discard(path: String) -> bool:
	if not path.begins_with(AUTOSAVE_ROOT) or not FileAccess.file_exists(path):
		return false
	return DirAccess.remove_absolute(ProjectSettings.globalize_path(path)) == OK
