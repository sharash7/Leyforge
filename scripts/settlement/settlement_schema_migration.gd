@tool
class_name SettlementSchemaMigration
extends RefCounted
## Deterministic, in-memory Set 20 schema and stable-ID migration.

const CURRENT_SCHEMA_VERSION := 2
const CURRENT_CATALOGUE_VERSION := "20H-v0.2"

var _aliases: Dictionary = {
	"building.infrastructure.builder_supply_yard":
		"building.construction.builder_supply_yard",
	"pack.occupation.frontier_builders":
		"pack.overlay.occupation.frontier_builders",
	"pack.occupation.arcane_artisans":
		"pack.overlay.occupation.arcane_artisans",
	"pack.diaspora.riverward_exiles":
		"pack.overlay.diaspora.riverward_exiles",
	"pack.history.rebuilt_after_raid":
		"pack.overlay.history.rebuilt_after_raid",
	"pack.realm_access.portal_network":
		"pack.realm.portal_network_access",
	"culture_kit.forest_neutral": "pack.foundation.forest_neutral_poc",
	"style_kit.forest_neutral": "pack.foundation.forest_neutral_poc",
	"culture_kit.forest_human": "pack.culture.riverward_frontier",
	"style_kit.forest_human": "pack.culture.riverward_frontier",
}


func register_alias(alias_id: String, canonical_id: String) -> void:
	if alias_id.is_empty() or canonical_id.is_empty() or alias_id == canonical_id:
		return
	_aliases[alias_id] = canonical_id


func register_aliases(canonical_id: String, alias_ids: Array) -> void:
	for alias_value in alias_ids:
		register_alias(str(alias_value), canonical_id)


func canonical_id(requested_id: String) -> String:
	var current := requested_id
	var visited := {}
	while _aliases.has(current) and not visited.has(current):
		visited[current] = true
		current = str(_aliases[current])
	return current


func migrate_document(root: Dictionary, expected_schema := "") -> Dictionary:
	var source := root.duplicate(true)
	var source_schema := str(source.get("schema", ""))
	var from_version := int(source.get("schema_version", 1))
	if not expected_schema.is_empty() and source_schema != expected_schema:
		return {
			"ok": false,
			"errors": ["invalid_schema:%s" % source_schema],
			"from_version": from_version,
			"to_version": from_version,
			"data": source,
		}
	if from_version > CURRENT_SCHEMA_VERSION or from_version < 1:
		return {
			"ok": false,
			"errors": ["unsupported_schema_version:%d" % from_version],
			"from_version": from_version,
			"to_version": from_version,
			"data": source,
		}

	var steps: Array[String] = []
	if from_version == 1:
		_preserve_migrated_ids(source)
		_migrate_v1_blueprint_definitions(source)
		steps.append("%s:1->2" % source_schema)
	var replacements := [0]
	var migrated: Dictionary = _canonicalize_value(
		source, "", replacements)
	migrated["schema_version"] = CURRENT_SCHEMA_VERSION
	if source_schema.begins_with("leyforge.settlement."):
		migrated["catalogue_version"] = CURRENT_CATALOGUE_VERSION
	return {
		"ok": true,
		"errors": [],
		"schema": source_schema,
		"from_version": from_version,
		"to_version": CURRENT_SCHEMA_VERSION,
		"steps": steps,
		"replacement_count": replacements[0],
		"input_hash": canonical_hash(root),
		"output_hash": canonical_hash(migrated),
		"data": migrated,
	}


func migrate_payload(payload: Dictionary) -> Dictionary:
	var replacements := [0]
	var migrated: Dictionary = _canonicalize_value(
		payload.duplicate(true), "", replacements)
	return {
		"ok": true,
		"replacement_count": replacements[0],
		"input_hash": canonical_hash(payload),
		"output_hash": canonical_hash(migrated),
		"data": migrated,
	}


func canonical_hash(value: Variant) -> String:
	return JSON.stringify(_sorted_value(value)).sha256_text()


func _migrate_v1_blueprint_definitions(root: Dictionary) -> void:
	if str(root.get("schema", "")) != "leyforge.settlement.blueprints":
		return
	for value in root.get("blueprints", []):
		if not value is Dictionary:
			continue
		var blueprint: Dictionary = value
		var definition_ids: Array = blueprint.get(
			"definition_ids", blueprint.get("building_ids", []))
		if definition_ids.is_empty():
			continue
		var definition_id := canonical_id(str(definition_ids[0]))
		var parts := definition_id.split(".")
		if parts.size() != 3:
			continue
		var old_id := str(blueprint.get("id", ""))
		var new_id := "blueprint.leyforge.%s.%s_a" % [parts[1], parts[2]]
		var alias_values: Array = blueprint.get("aliases", []).duplicate()
		if not old_id.is_empty() and old_id != new_id and old_id not in alias_values:
			alias_values.append(old_id)
		blueprint["aliases"] = alias_values
		blueprint["id"] = new_id
		register_alias(old_id, new_id)


func _preserve_migrated_ids(value: Variant) -> void:
	if value is Dictionary:
		if value.has("id") and value["id"] is String:
			var old_id := str(value["id"])
			var new_id := canonical_id(old_id)
			if old_id != new_id:
				var alias_values: Array = value.get("aliases", []).duplicate()
				alias_values.erase(new_id)
				if old_id not in alias_values:
					alias_values.append(old_id)
				value["aliases"] = alias_values
		for child in value.values():
			_preserve_migrated_ids(child)
	elif value is Array:
		for child in value:
			_preserve_migrated_ids(child)


func _canonicalize_value(
		value: Variant, source_key: String, replacements: Array) -> Variant:
	if value is Dictionary:
		var out := {}
		for key_value in value:
			var key := str(key_value)
			if key in ["aliases", "legacy_id"]:
				out[key_value] = value[key_value]
			else:
				out[key_value] = _canonicalize_value(
					value[key_value], key, replacements)
		return out
	if value is Array:
		var out: Array = []
		for child in value:
			out.append(_canonicalize_value(child, source_key, replacements))
		return out
	if value is String:
		var canonical := canonical_id(value)
		if canonical != value:
			replacements[0] = int(replacements[0]) + 1
		return canonical
	return value


func _sorted_value(value: Variant) -> Variant:
	if value is Dictionary:
		var keys: Array = value.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str(a) < str(b))
		var out := {}
		for key in keys:
			out[key] = _sorted_value(value[key])
		return out
	if value is Array:
		var out: Array = []
		for child in value:
			out.append(_sorted_value(child))
		return out
	return value
