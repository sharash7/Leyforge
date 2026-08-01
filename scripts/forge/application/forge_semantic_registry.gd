class_name ForgeSemanticRegistry
extends RefCounted

const DEFAULT_PATH := "res://data/forge/semantic_registry.json"
const SUPPORTED_FAMILIES := [
	"marker", "zone", "socket", "network", "material_role",
	"entity_role", "anatomy_role", "capture_profile",
]

var records: Dictionary = {}
var aliases: Dictionary = {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(path := DEFAULT_PATH) -> Dictionary:
	records.clear()
	aliases.clear()
	diagnostics.clear()
	if not FileAccess.file_exists(path):
		diagnostics.append(_diagnostic(
			"EFB-DEP-001", "critical", path,
			"Semantic registry file is missing."))
		return _report()
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if not parsed is Dictionary:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", "critical", path,
			"Semantic registry JSON is invalid."))
		return _report()
	var root: Dictionary = parsed
	if str(root.get("schema", "")) != "leyforge.forge.semantic-registry" \
			or int(root.get("schema_version", 0)) != 1:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", "error", path,
			"Semantic registry schema is unsupported."))
	var families: Dictionary = root.get("families", {})
	for family in families:
		if str(family) not in SUPPORTED_FAMILIES:
			diagnostics.append(_diagnostic(
				"EFB-SCHEMA-001", "error", str(family),
				"Semantic family is not registered."))
			continue
		for value in families[family]:
			if not value is Dictionary:
				continue
			var record: Dictionary = value.duplicate(true)
			var role_id := str(record.get("id", ""))
			if role_id.is_empty() or records.has(role_id):
				diagnostics.append(_diagnostic(
					"EFB-ID-001", "critical", role_id,
					"Semantic role ID is empty or duplicated."))
				continue
			record["family"] = str(family)
			records[role_id] = record
			for alias_value in record.get("aliases", []):
				var alias_id := str(alias_value)
				if records.has(alias_id) or aliases.has(alias_id):
					diagnostics.append(_diagnostic(
						"EFB-ID-001", "critical", alias_id,
						"Semantic role alias is duplicated."))
				else:
					aliases[alias_id] = role_id
	for role_id in records:
		for dependency in records[role_id].get("dependencies", []):
			if not has(str(dependency)):
				diagnostics.append(_diagnostic(
					"EFB-DEP-001", "error", role_id,
					"Semantic role dependency is missing: %s" % dependency))
	return _report()


func resolve(requested_id: String) -> Dictionary:
	var canonical := str(aliases.get(requested_id, requested_id))
	return records.get(canonical, {}).duplicate(true)


func has(requested_id: String) -> bool:
	return not resolve(requested_id).is_empty()


func filtered_list(family := "", prefix := "") -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for record in records.values():
		var role_id := str(record.get("id", ""))
		if (family.is_empty() or str(record.get("family", "")) == family) \
				and (prefix.is_empty() or role_id.begins_with(prefix)):
			out.append(record.duplicate(true))
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("id", "")) < str(b.get("id", "")))
	return out


func _report() -> Dictionary:
	return {
		"ok": diagnostics.is_empty(),
		"record_count": records.size(),
		"alias_count": aliases.size(),
		"diagnostics": diagnostics.duplicate(true),
	}


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {
		"code": code,
		"severity": severity,
		"target_id": target_id,
		"message": message,
	}
