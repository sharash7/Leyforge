class_name ForgePresentationContextBuilder
extends RefCounted
## Builds immutable typed context packets from bounded declared inputs.

var _schemas: Dictionary = {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(
		schemas: Array[ForgePresentationContextSchema]) -> Dictionary:
	_schemas.clear()
	diagnostics.clear()
	for schema in schemas:
		if schema == null or _schemas.has(schema.stable_id):
			diagnostics.append(_diagnostic(
				"EVT-002", "error", "",
				"Context schema is empty or duplicated."))
			continue
		var source_diagnostics := ForgePresentationValidationService.new().validate(
			schema)
		for diagnostic in source_diagnostics:
			diagnostics.append(diagnostic.to_record())
		_schemas[schema.stable_id] = schema
	return {
		"ok": diagnostics.is_empty(),
		"schema_count": _schemas.size(),
		"diagnostics": diagnostics.duplicate(true),
	}


func has(schema_id: String) -> bool:
	return _schemas.has(schema_id)


func resolve(schema_id: String) -> Dictionary:
	var schema := _schemas.get(schema_id) as ForgePresentationContextSchema
	return schema.to_record() if schema != null else {}


func filtered_list() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for schema in _schemas.values():
		result.append((schema as ForgePresentationContextSchema).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("stable_id", "")) < str(b.get("stable_id", "")))
	return result


func build(
		schema_id: String, event_id: String, payload: Dictionary,
		supplied_context: Dictionary = {}, metadata: Dictionary = {}) -> Dictionary:
	var schema := _schemas.get(schema_id) as ForgePresentationContextSchema
	if schema == null:
		return {"ok": false, "diagnostics": [
			_diagnostic("EVT-002", "error", schema_id,
				"Context schema is not registered.")]}
	var fields := supplied_context.duplicate(true)
	for key in payload:
		fields[key] = payload[key]
	var packet := {
		"context_version": schema.compatibility_version,
		"context_schema_id": schema.stable_id,
		"event_id": event_id,
		"event_timestamp_msec": int(metadata.get("timestamp_msec", 0)),
		"sequence_id": str(metadata.get("sequence_id", "")),
		"authority_state": str(metadata.get("authority_state", "authoritative")),
		"deterministic_seed": int(metadata.get("deterministic_seed", 0)),
		"fields": fields,
	}
	var packet_diagnostics: Array[Dictionary] = []
	for field_id in schema.field_definitions:
		var definition: Dictionary = schema.field_definitions[field_id]
		var required := bool(definition.get("required", false))
		if required and not fields.has(field_id):
			packet_diagnostics.append(_diagnostic(
				"EVT-002", "error", event_id,
				"Required context field is missing: %s" % field_id))
			continue
		if fields.has(field_id) and not _value_matches(
				fields[field_id], str(definition.get("type", ""))):
			packet_diagnostics.append(_diagnostic(
				"EVT-002", "error", event_id,
				"Context field type is invalid: %s" % field_id))
	if schema.unknown_field_policy == "reject":
		for field_id in fields:
			if not schema.field_definitions.has(field_id):
				packet_diagnostics.append(_diagnostic(
					"EVT-002", "error", event_id,
					"Context contains an undeclared field: %s" % field_id))
	packet["context_hash"] = ForgeStableRecord.hash_record(packet)
	return {
		"ok": packet_diagnostics.is_empty(),
		"packet": packet,
		"diagnostics": packet_diagnostics,
	}


func _value_matches(value: Variant, type_name: String) -> bool:
	match type_name:
		"bool":
			return value is bool
		"int":
			return value is int or (value is float and is_equal_approx(
				value, round(value)))
		"float":
			return value is float or value is int
		"string":
			return value is String or value is StringName
		"vector3":
			return value is Vector3 or (value is Array and value.size() == 3)
	return false


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {
		"code": code, "severity": severity,
		"target_id": target_id, "message": message,
	}
