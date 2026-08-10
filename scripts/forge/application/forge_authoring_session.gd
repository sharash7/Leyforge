class_name ForgeAuthoringSession
extends RefCounted
## Multi-document session state, dirtiness and per-document undo/redo.

signal active_document_changed(source_id: String)
signal document_changed(source_id: String, dirty: bool)
signal document_closed(source_id: String)

var document_service := ForgeAuthoringDocumentService.new()
var resources: Dictionary = {}
var paths: Dictionary = {}
var descriptors: Dictionary = {}
var dirty: Dictionary = {}
var command_histories: Dictionary = {}
var active_source_id := ""


func create(type_id: String, slug: String, title: String) -> Dictionary:
	var result := document_service.create(type_id, slug, title)
	if bool(result.get("ok", false)):
		_register(result["resource"], result["descriptor"], str(result["path"]), true)
	return result


func open(path: String) -> Dictionary:
	var result := document_service.open_path(path)
	if bool(result.get("ok", false)):
		_register(result["resource"], result["descriptor"], path, false)
	return result


func register_recovery(result: Dictionary) -> bool:
	if not bool(result.get("ok", false)):
		return false
	var resource: Resource = result.get("resource")
	var descriptor := document_service.type_registry.for_resource(resource)
	if descriptor == null:
		return false
	_register(resource, descriptor, str(result.get("recovery_for_path", "")), true)
	return true


func save(source_id := "") -> Dictionary:
	var target_id := source_id if not source_id.is_empty() else active_source_id
	if not resources.has(target_id):
		return {"ok": false, "error": "Forge document is not open."}
	var result := document_service.save_draft(
		resources[target_id], str(paths.get(target_id, "")))
	if bool(result.get("ok", false)):
		paths[target_id] = str(result["path"])
		dirty[target_id] = false
		document_changed.emit(target_id, false)
	return result


func execute(
		label: String, apply_action: Callable, revert_action: Callable,
		source_id := "") -> bool:
	var target_id := source_id if not source_id.is_empty() else active_source_id
	var history: ForgeCommandService = command_histories.get(target_id)
	if history == null or not history.execute(label, apply_action, revert_action):
		return false
	mark_dirty(target_id)
	return true


func undo(source_id := "") -> bool:
	var target_id := source_id if not source_id.is_empty() else active_source_id
	var history: ForgeCommandService = command_histories.get(target_id)
	if history == null or not history.undo():
		return false
	mark_dirty(target_id)
	return true


func redo(source_id := "") -> bool:
	var target_id := source_id if not source_id.is_empty() else active_source_id
	var history: ForgeCommandService = command_histories.get(target_id)
	if history == null or not history.redo():
		return false
	mark_dirty(target_id)
	return true


func mark_dirty(source_id := "") -> void:
	var target_id := source_id if not source_id.is_empty() else active_source_id
	if not resources.has(target_id):
		return
	dirty[target_id] = true
	document_changed.emit(target_id, true)


func set_active(source_id: String) -> bool:
	if not resources.has(source_id):
		return false
	active_source_id = source_id
	active_document_changed.emit(source_id)
	return true


func close(source_id: String, discard_changes := false) -> Dictionary:
	if not resources.has(source_id):
		return {"ok": false, "error": "Forge document is not open."}
	if bool(dirty.get(source_id, false)) and not discard_changes:
		return {"ok": false, "requires_confirmation": true,
			"error": "Forge document has unsaved changes."}
	resources.erase(source_id)
	paths.erase(source_id)
	descriptors.erase(source_id)
	dirty.erase(source_id)
	command_histories.erase(source_id)
	if active_source_id == source_id:
		active_source_id = str(resources.keys()[0]) if not resources.is_empty() else ""
		active_document_changed.emit(active_source_id)
	document_closed.emit(source_id)
	return {"ok": true}


func active_resource() -> Resource:
	return resources.get(active_source_id)


func is_dirty(source_id := "") -> bool:
	var target_id := source_id if not source_id.is_empty() else active_source_id
	return bool(dirty.get(target_id, false))


func _register(
		resource: Resource, descriptor: ForgeAuthoringTypeDescriptor,
		path: String, is_dirty: bool) -> void:
	var source_id := descriptor.identity(resource)
	resources[source_id] = resource
	paths[source_id] = path
	descriptors[source_id] = descriptor
	dirty[source_id] = is_dirty
	command_histories[source_id] = ForgeCommandService.new()
	active_source_id = source_id
	active_document_changed.emit(source_id)
	document_changed.emit(source_id, is_dirty)
