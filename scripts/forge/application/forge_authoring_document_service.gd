class_name ForgeAuthoringDocumentService
extends RefCounted
## Generic, atomic source lifecycle for Structures, Characters, VFX and Audio.

signal document_saved(source_id: String, path: String)
signal document_approved(source_id: String, path: String)

var type_registry := ForgeAuthoringTypeRegistry.new()


func create(type_id: String, slug: String, title: String) -> Dictionary:
	if not ForgeAccessPolicy.can_author():
		return {"ok": false, "error": "Forge authoring is disabled in this build."}
	var resource := type_registry.create(type_id, slug, title)
	var descriptor := type_registry.resolve(type_id)
	if resource == null or descriptor == null:
		return {"ok": false, "error": "Forge source type is not registered."}
	return {
		"ok": true,
		"resource": resource,
		"descriptor": descriptor,
		"source_id": descriptor.identity(resource),
		"path": descriptor.default_path(resource),
		"diagnostics": _diagnostic_records(validate(resource)),
	}


func open_path(path: String) -> Dictionary:
	if not _is_source_path(path) or not FileAccess.file_exists(path):
		return {"ok": false, "error": "Forge source path is invalid or missing."}
	var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	var descriptor := type_registry.for_resource(resource)
	if resource == null or descriptor == null or descriptor.identity(resource).is_empty():
		return {"ok": false, "error": "Resource is not a registered Forge authoring source."}
	return {
		"ok": true,
		"resource": resource,
		"descriptor": descriptor,
		"source_id": descriptor.identity(resource),
		"path": path,
		"diagnostics": _diagnostic_records(validate(resource)),
	}


func save_draft(resource: Resource, path := "") -> Dictionary:
	if not ForgeAccessPolicy.can_author():
		return {"ok": false, "error": "Forge authoring is disabled in this build."}
	var descriptor := type_registry.for_resource(resource)
	if descriptor == null:
		return {"ok": false, "error": "Resource is not a registered Forge source."}
	var source_id := descriptor.identity(resource)
	if not ForgeId.is_valid(source_id, descriptor.id_prefix):
		return {"ok": false, "error": "Forge source ID is invalid."}
	var target := path if not path.is_empty() else descriptor.default_path(resource)
	if not _is_source_path(target) or not target.begins_with(descriptor.source_root):
		return {"ok": false, "error": "Forge source path is outside its canonical root."}
	var directory_error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(target.get_base_dir()))
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(directory_error)}
	var temporary := "%s.tmp.tres" % target.trim_suffix(".tres")
	var previous := "%s.previous.tres" % target.trim_suffix(".tres")
	_remove_if_present(temporary)
	var save_error := ResourceSaver.save(resource, temporary)
	if save_error != OK:
		return {"ok": false, "error": error_string(save_error)}
	var verified := ResourceLoader.load(
		temporary, "", ResourceLoader.CACHE_MODE_IGNORE)
	var verified_descriptor := type_registry.for_resource(verified)
	if verified_descriptor == null \
			or verified_descriptor.type_id != descriptor.type_id \
			or verified_descriptor.identity(verified) != source_id:
		_remove_if_present(temporary)
		return {"ok": false, "error": "Temporary source failed identity read-back."}
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
	var diagnostics := validate(resource)
	document_saved.emit(source_id, target)
	return {
		"ok": true,
		"path": target,
		"previous_path": previous if FileAccess.file_exists(previous) else "",
		"source_id": source_id,
		"source_hash": _canonical_hash(resource),
		"valid": not _has_blocking_diagnostic(diagnostics),
		"diagnostics": _diagnostic_records(diagnostics),
	}


func duplicate_source(
		resource: Resource, new_slug: String, new_title: String) -> Dictionary:
	var descriptor := type_registry.for_resource(resource)
	if descriptor == null:
		return {"ok": false, "error": "Resource is not a registered Forge source."}
	var duplicate: Resource = resource.duplicate(true)
	if not type_registry.assign_new_identity(
			duplicate, descriptor.type_id, new_slug, new_title):
		return {"ok": false, "error": "Could not assign the duplicate identity."}
	return {
		"ok": true,
		"resource": duplicate,
		"descriptor": descriptor,
		"source_id": descriptor.identity(duplicate),
		"path": descriptor.default_path(duplicate),
		"diagnostics": _diagnostic_records(validate(duplicate)),
	}


func deprecate(resource: Resource, replacement_id := "") -> Dictionary:
	var descriptor := type_registry.for_resource(resource)
	if descriptor == null:
		return {"ok": false, "error": "Resource is not a registered Forge source."}
	if not descriptor.lifecycle_property.is_empty():
		resource.set(descriptor.lifecycle_property, "deprecated")
	if not descriptor.status_property.is_empty():
		resource.set(descriptor.status_property, "deprecated")
	if resource is ForgePresentationDefinition and not replacement_id.is_empty():
		resource.fallback_ids = PackedStringArray([replacement_id])
	elif _has_property(resource, "legacy_fallback") and not replacement_id.is_empty():
		resource.set("legacy_fallback", replacement_id)
	return {"ok": true, "resource": resource,
		"source_id": descriptor.identity(resource)}


func approve(
		resource: Resource, path := "", bake_action: Callable = Callable()) -> Dictionary:
	if not ForgeAccessPolicy.can_approve():
		return {"ok": false, "error": "Forge approval is disabled in this build."}
	var diagnostics := validate(resource)
	if _has_blocking_diagnostic(diagnostics):
		return {"ok": false, "error": "Source has blocking validation diagnostics.",
			"diagnostics": _diagnostic_records(diagnostics)}
	var descriptor := type_registry.for_resource(resource)
	if descriptor == null:
		return {"ok": false, "error": "Resource is not a registered Forge source."}
	var previous_status: Variant = resource.get(descriptor.status_property) \
		if not descriptor.status_property.is_empty() else null
	var previous_lifecycle: Variant = resource.get(descriptor.lifecycle_property) \
		if not descriptor.lifecycle_property.is_empty() else null
	var previous_visual: Variant = resource.get("visual_approval") \
		if _has_property(resource, "visual_approval") else null
	var previous_reviews: Array[Dictionary] = resource.review_history.duplicate(true) \
		if resource is ForgePresentationDefinition else []
	if not descriptor.status_property.is_empty():
		resource.set(descriptor.status_property, "approved")
	if _has_property(resource, "visual_approval"):
		resource.set("visual_approval", "approved")
	if resource is ForgePresentationDefinition:
		resource.lifecycle = "golden_source_candidate"
		resource.review_history.append({"action": "approved"})
	var bake_result: Variant = {"ok": true}
	if bake_action.is_valid():
		bake_result = bake_action.call(resource)
		if not bake_result is Dictionary or not bool(bake_result.get("ok", false)):
			if not descriptor.status_property.is_empty(): resource.set(descriptor.status_property, previous_status)
			if not descriptor.lifecycle_property.is_empty(): resource.set(descriptor.lifecycle_property, previous_lifecycle)
			if _has_property(resource, "visual_approval"): resource.set("visual_approval", previous_visual)
			if resource is ForgePresentationDefinition: resource.review_history = previous_reviews
			return {"ok": false, "error": "Forge bake failed.", "bake": bake_result}
	var saved := save_draft(resource, path)
	if not bool(saved.get("ok", false)):
		return saved
	document_approved.emit(descriptor.identity(resource), str(saved["path"]))
	saved["bake"] = bake_result
	saved["approved"] = true
	return saved


func recover_previous(path: String) -> Dictionary:
	if not _is_source_path(path):
		return {"ok": false, "error": "Forge source path is invalid."}
	var previous := "%s.previous.tres" % path.trim_suffix(".tres")
	if not FileAccess.file_exists(previous):
		return {"ok": false, "error": "No previous source revision exists."}
	var recovered := open_path(previous)
	if bool(recovered.get("ok", false)):
		recovered["recovery_for_path"] = path
	return recovered


func validate(resource: Resource) -> Array[ForgeDiagnostic]:
	if resource is ForgePresentationDefinition:
		return ForgePresentationValidationService.new().validate(resource)
	if resource is ForgeEntityDefinition:
		return ForgeFoundationValidationService.new().validate_entity_definition(resource)
	if resource is ForgeBodyPlanDefinition:
		return ForgeFoundationValidationService.new().validate_body_plan(resource)
	if resource is ForgeBodyPartDefinition:
		return ForgeFoundationValidationService.new().validate_body_part(resource)
	if resource is ForgeBlueprintDefinition:
		return ForgeFoundationValidationService.new().validate_blueprint(resource)
	if resource is ForgeBlueprintModuleDefinition:
		return ForgeBlueprintRuntimeValidationService.new().validate_module(resource)
	if resource is ForgeBlueprintStateDefinition:
		return ForgeBlueprintRuntimeValidationService.new().validate_state(resource)
	if resource is ForgeBlueprintModuleSet:
		return ForgeModularStructureValidationService.new().validate_module_set(resource)
	if resource is ForgeProceduralStructureRuleSet:
		return ForgeModularStructureValidationService.new().validate_rule_set(resource)
	if resource is ForgeRigProfile:
		return ForgeRuntimeAssemblyValidationService.new().validate_rig_profile(resource)
	if resource is ForgeEntityAnimationLibrary:
		return ForgeEntityAnimationValidationService.new().validate_animation_library(resource)
	if resource is ForgeEntityVariantProfile:
		return ForgeEntityAnimationValidationService.new().validate_variant(resource)
	if resource is ForgeEquipmentFitProfile:
		return ForgeEntityAnimationValidationService.new().validate_equipment_fit(resource)
	return [ForgeDiagnostic.create("FORGE-TYPE-001", ForgeDiagnostic.ERROR, "",
		"Forge source type has no validation adapter.")]


func _canonical_hash(resource: Resource) -> String:
	if resource != null and resource.has_method("canonical_hash"):
		return str(resource.call("canonical_hash"))
	return ""


func _has_blocking_diagnostic(diagnostics: Array[ForgeDiagnostic]) -> bool:
	for diagnostic in diagnostics:
		if diagnostic.severity in [
				ForgeDiagnostic.ERROR, ForgeDiagnostic.CRITICAL,
				ForgeDiagnostic.BLOCKER, ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER]:
			return true
	return false


func _diagnostic_records(diagnostics: Array[ForgeDiagnostic]) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for diagnostic in diagnostics:
		records.append(diagnostic.to_record())
	return records


func _is_source_path(path: String) -> bool:
	return path.begins_with("res://content/forge/") \
			and (path.ends_with(".tres") or path.ends_with(".res")) \
			and "/generated/" not in path


func _has_property(resource: Resource, property_name: String) -> bool:
	for property in resource.get_property_list():
		if str(property.get("name", "")) == property_name:
			return true
	return false


func _remove_if_present(path: String) -> void:
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
