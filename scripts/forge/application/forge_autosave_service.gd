class_name ForgeAutosaveService
extends RefCounted

const AUTOSAVE_ROOT := "user://leyforge/forge/autosaves"


func autosave(asset: Resource) -> Dictionary:
	if asset == null:
		return {"ok": false, "error": "No asset is open."}
	var identity := _identity(asset)
	if identity.is_empty():
		return {"ok": false, "error": "Resource is not an autosave-capable Forge source."}
	var root := ProjectSettings.globalize_path(AUTOSAVE_ROOT)
	var directory_error := DirAccess.make_dir_recursive_absolute(root)
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(directory_error)}
	var path := AUTOSAVE_ROOT.path_join(
		"%s.autosave.tres" % ForgeId.safe_filename(identity))
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
			var identity := _identity(resource)
			if not identity.is_empty():
				candidates.append({
					"asset_id": identity,
					"display_name": _display_name(resource),
					"source_revision": int(resource.get("source_revision")) \
						if _has_property(resource, "source_revision") else 0,
					"path": path,
					"resource_class": resource.get_class(),
				})
		entry = directory.get_next()
	directory.list_dir_end()
	return candidates


func discard(path: String) -> bool:
	if not path.begins_with(AUTOSAVE_ROOT) or not FileAccess.file_exists(path):
		return false
	return DirAccess.remove_absolute(ProjectSettings.globalize_path(path)) == OK


func load_candidate(path: String) -> Dictionary:
	if not path.begins_with(AUTOSAVE_ROOT) or not FileAccess.file_exists(path):
		return {"ok": false, "error": "Autosave candidate is invalid or missing."}
	var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	var identity := _identity(resource)
	if identity.is_empty():
		return {"ok": false, "error": "Autosave does not contain a supported Forge source."}
	return {"ok": true, "resource": resource, "source_id": identity, "path": path}


func _identity(resource: Resource) -> String:
	if resource is ForgeAssetDefinition:
		return resource.forge_asset_id
	var descriptor := ForgeAuthoringTypeRegistry.new().for_resource(resource)
	return descriptor.identity(resource) if descriptor != null else ""


func _display_name(resource: Resource) -> String:
	if _has_property(resource, "display_name"):
		return str(resource.get("display_name"))
	return _identity(resource)


func _has_property(resource: Resource, property_name: String) -> bool:
	if resource == null:
		return false
	for property in resource.get_property_list():
		if str(property.get("name", "")) == property_name:
			return true
	return false
