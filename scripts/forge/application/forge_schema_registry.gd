class_name ForgeSchemaRegistry
extends RefCounted
## Narrow schema lookup used by both Entity and Blueprint Forge foundations.

const SUPPORTED := {
	"leyforge.forge.project-manifest": {"version": 1, "domain": "shared"},
	"leyforge.forge.semantic-registry": {"version": 1, "domain": "shared"},
	"leyforge.forge.entity-presentation": {"version": 1, "domain": "entity"},
	"leyforge.forge.entity-definition": {"version": 1, "domain": "entity"},
	"leyforge.forge.body-plan": {"version": 1, "domain": "entity"},
	"leyforge.forge.body-part": {"version": 1, "domain": "entity"},
	"leyforge.forge.density-profile": {"version": 1, "domain": "entity"},
	"leyforge.forge.blueprint-definition": {"version": 1, "domain": "blueprint"},
	"leyforge.forge.blueprint-element": {"version": 1, "domain": "blueprint"},
	"leyforge.forge.construction-delta": {"version": 1, "domain": "blueprint"},
	"leyforge.forge.placement-profile": {"version": 1, "domain": "blueprint"},
	"leyforge.forge.blueprint-material-role-set": {
		"version": 1, "domain": "blueprint"},
	"leyforge.forge.migration-record": {"version": 2, "domain": "shared"},
	"leyforge.forge.content-pack": {"version": 2, "domain": "shared"},
}

var _records: Dictionary = {}


func _init() -> void:
	for schema_id in SUPPORTED:
		var record: Dictionary = SUPPORTED[schema_id].duplicate(true)
		record["id"] = schema_id
		_records[schema_id] = record


func load_and_validate(manifest: ForgeProjectManifest) -> Dictionary:
	var diagnostics: Array[Dictionary] = []
	if manifest == null:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", "critical", "", "Project manifest is missing."))
		return {"ok": false, "diagnostics": diagnostics}
	for schema_id in manifest.supported_schema_ids:
		if not has(schema_id):
			diagnostics.append(_diagnostic(
				"EFB-SCHEMA-001", "error", schema_id,
				"Manifest requests an unsupported schema."))
	return {"ok": diagnostics.is_empty(), "diagnostics": diagnostics}


func resolve(schema_id: String) -> Dictionary:
	return _records.get(schema_id, {}).duplicate(true)


func has(schema_id: String) -> bool:
	return _records.has(schema_id)


func filtered_list(domain := "") -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for record in _records.values():
		if domain.is_empty() or str(record.get("domain", "")) == domain:
			out.append(record.duplicate(true))
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("id", "")) < str(b.get("id", "")))
	return out


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {
		"code": code,
		"severity": severity,
		"target_id": target_id,
		"message": message,
	}
