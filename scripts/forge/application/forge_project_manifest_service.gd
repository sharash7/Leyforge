class_name ForgeProjectManifestService
extends RefCounted

const DEFAULT_MANIFEST := "res://content/forge/forge_project_manifest.tres"

var manifest: ForgeProjectManifest
var schema_registry := ForgeSchemaRegistry.new()
var migration_service := ForgeMigrationService.new()
var diagnostics: Array[Dictionary] = []


func load_and_validate(path := DEFAULT_MANIFEST) -> Dictionary:
	diagnostics.clear()
	var loaded := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if not loaded is ForgeProjectManifest:
		diagnostics.append({
			"code": "EFB-SCHEMA-001",
			"severity": "critical",
			"target_id": path,
			"message": "Forge project manifest is missing or invalid.",
		})
		return {"ok": false, "diagnostics": diagnostics.duplicate(true)}
	manifest = loaded
	var migration_report := migration_service.migrate_project_manifest(manifest)
	if not bool(migration_report.get("ok", false)):
		diagnostics.append({
			"code": "EFB-SCHEMA-001",
			"severity": "error",
			"target_id": manifest.project_id,
			"message": str(migration_report.get(
				"error", "Forge project manifest schema is unsupported.")),
		})
	var schema_report := schema_registry.load_and_validate(manifest)
	diagnostics.append_array(schema_report.get("diagnostics", []))
	for registry_path in manifest.semantic_registry_paths:
		if not FileAccess.file_exists(registry_path):
			diagnostics.append({
				"code": "EFB-DEP-001",
				"severity": "error",
				"target_id": registry_path,
				"message": "Manifest semantic registry dependency is missing.",
			})
	for inventory_path in manifest.migration_inventory_paths:
		if not FileAccess.file_exists(inventory_path):
			diagnostics.append({
				"code": "EFB-DEP-001",
				"severity": "error",
				"target_id": inventory_path,
				"message": "Manifest migration inventory dependency is missing.",
			})
	for source_root in manifest.source_roots:
		if DirAccess.open(source_root) == null:
			diagnostics.append({
				"code": "EFB-DEP-001",
				"severity": "error",
				"target_id": source_root,
				"message": "Manifest source root dependency is missing.",
			})
	return {
		"ok": diagnostics.is_empty(),
		"manifest_id": manifest.project_id,
		"manifest_hash": manifest.canonical_hash(),
		"migration_steps": migration_report.get("steps", []),
		"diagnostics": diagnostics.duplicate(true),
	}


func resolve(target_id: String) -> Dictionary:
	if manifest != null and target_id == manifest.project_id:
		return manifest.to_record()
	return schema_registry.resolve(target_id)


func has(target_id: String) -> bool:
	return (manifest != null and target_id == manifest.project_id) \
		or schema_registry.has(target_id)


func filtered_list(domain := "") -> Array[Dictionary]:
	var out := schema_registry.filtered_list(domain)
	if manifest != null and (domain.is_empty() or domain == "manifest"):
		out.push_front(manifest.to_record())
	return out
