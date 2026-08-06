class_name ForgePresentationEventGateway
extends RefCounted
## Validates typed gameplay presentation events and emits keyed resolver commands.

var context_builder := ForgePresentationContextBuilder.new()
var binding_resolver := ForgePresentationBindingResolver.new()
var trace_recorder := ForgePresentationTraceRecorder.new()
var spatial_resolver: ForgeSpatialResolver
var diagnostics: Array[Dictionary] = []

var _events: Dictionary = {}
var _states: Dictionary = {}
var _aliases: Dictionary = {}
var _deduplication_keys: Dictionary = {}
var _sequence := 0


func load_and_validate(
		event_contracts: Array[ForgePresentationEventContract],
		state_contracts: Array[ForgePresentationStateContract],
		context_schemas: Array[ForgePresentationContextSchema],
		bindings: Array[ForgePresentationBinding],
		profiles: Array[ForgePresentationProfile],
		p_spatial_resolver: ForgeSpatialResolver,
		registry_snapshot_id := "") -> Dictionary:
	_events.clear()
	_states.clear()
	_aliases.clear()
	_deduplication_keys.clear()
	_sequence = 0
	diagnostics.clear()
	spatial_resolver = p_spatial_resolver
	var validator := ForgePresentationValidationService.new()
	for contract in event_contracts:
		_register_contract(contract, _events, validator)
	for contract in state_contracts:
		_register_contract(contract, _states, validator)
	var context_report := context_builder.load_and_validate(context_schemas)
	var binding_report := binding_resolver.load_and_validate(bindings, profiles)
	diagnostics.append_array(context_report.get("diagnostics", []))
	diagnostics.append_array(binding_report.get("diagnostics", []))
	if spatial_resolver == null:
		diagnostics.append(_diagnostic(
			"SPT-003", "error", "", "Spatial resolver is missing."))
	trace_recorder.start(registry_snapshot_id, 0)
	return {
		"ok": diagnostics.is_empty(),
		"event_count": _events.size(),
		"state_count": _states.size(),
		"context_count": context_schemas.size(),
		"binding_count": binding_report.get("binding_count", 0),
		"profile_count": binding_report.get("profile_count", 0),
		"alias_count": _aliases.size(),
		"diagnostics": diagnostics.duplicate(true),
	}


func has(contract_id: String) -> bool:
	var canonical := ForgeId.canonical_id(contract_id, _aliases)
	return _events.has(canonical) or _states.has(canonical)


func resolve(contract_id: String) -> Dictionary:
	var canonical := ForgeId.canonical_id(contract_id, _aliases)
	if _events.has(canonical):
		return (_events[canonical] as ForgePresentationEventContract).to_record()
	if _states.has(canonical):
		return (_states[canonical] as ForgePresentationStateContract).to_record()
	return {}


func filtered_list(kind := "") -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	if kind.is_empty() or kind == "event":
		for contract in _events.values():
			result.append((contract as ForgePresentationEventContract).to_record())
	if kind.is_empty() or kind == "state":
		for contract in _states.values():
			result.append((contract as ForgePresentationStateContract).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("stable_id", "")) < str(b.get("stable_id", "")))
	return result


func publish(
		contract_id: String, owner_id: String, owner_instance_id: String,
		payload: Dictionary, supplied_context: Dictionary,
		metadata: Dictionary = {},
		runtime_contact: ForgeRuntimeContactRecord = null) -> Dictionary:
	var canonical := ForgeId.canonical_id(contract_id, _aliases)
	var contract := _events.get(canonical) as ForgePresentationEventContract
	if contract == null:
		return _failure("EVT-001", canonical,
			"Presentation event contract is not registered.")
	var payload_diagnostics := _validate_fields(
		payload, contract.payload_fields, canonical)
	if not payload_diagnostics.is_empty():
		return _failed_diagnostics(payload_diagnostics)
	var context_schema_id := str(metadata.get("context_schema_id", ""))
	var enriched_context := supplied_context.duplicate(true)
	enriched_context["owner_id"] = owner_id
	enriched_context["owner_instance_id"] = owner_instance_id
	var event_metadata := metadata.duplicate(true)
	_sequence += 1
	if not event_metadata.has("sequence_id"):
		event_metadata["sequence_id"] = "%s:%06d" % [owner_instance_id, _sequence]
	var context_report := context_builder.build(
		context_schema_id, canonical, payload, enriched_context, event_metadata)
	if not bool(context_report.get("ok", false)):
		return _failed_diagnostics(context_report.get("diagnostics", []))
	var packet: Dictionary = context_report["packet"]
	for required_field in contract.required_context_fields:
		if not (packet.get("fields", {}) as Dictionary).has(required_field):
			return _failure("EVT-002", canonical,
				"Required event context field is missing: %s" % required_field)
	var deduplication_key := str(metadata.get("deduplication_key", ""))
	if not deduplication_key.is_empty() and _deduplication_keys.has(
			deduplication_key):
		return {"ok": true, "deduplicated": true,
			"event_hash": _deduplication_keys[deduplication_key],
			"commands": []}
	var resolution := binding_resolver.resolve(
		canonical, owner_id, packet, owner_instance_id,
		spatial_resolver, runtime_contact, "play")
	if not bool(resolution.get("ok", false)):
		return resolution
	var event_record := {
		"contract_id": canonical,
		"owner_id": owner_id,
		"owner_instance_id": owner_instance_id,
		"payload": payload.duplicate(true),
		"timestamp_msec": int(metadata.get("timestamp_msec", 0)),
		"sequence_id": event_metadata["sequence_id"],
		"deterministic_seed": int(metadata.get("deterministic_seed", 0)),
		"authority_state": str(metadata.get("authority_state", "authoritative")),
	}
	event_record["event_hash"] = ForgeStableRecord.hash_record(event_record)
	if not deduplication_key.is_empty():
		_deduplication_keys[deduplication_key] = event_record["event_hash"]
	trace_recorder.record_event(event_record, packet, resolution)
	return {
		"ok": true,
		"deduplicated": false,
		"event": event_record,
		"context": packet,
		"resolution": resolution,
		"commands": resolution.get("commands", []),
	}


func observe_state(
		contract_id: String, owner_id: String, owner_instance_id: String,
		state: Dictionary, context_schema_id: String,
		metadata: Dictionary = {}) -> Dictionary:
	var canonical := ForgeId.canonical_id(contract_id, _aliases)
	var contract := _states.get(canonical) as ForgePresentationStateContract
	if contract == null:
		return _failure("EVT-001", canonical,
			"Presentation state contract is not registered.")
	var state_diagnostics := _validate_fields(
		state, contract.state_fields, canonical)
	if not state_diagnostics.is_empty():
		return _failed_diagnostics(state_diagnostics)
	var supplied := {
		"owner_id": owner_id,
		"owner_instance_id": owner_instance_id,
	}
	for field_id in (metadata.get("context_fields", {}) as Dictionary):
		supplied[field_id] = metadata["context_fields"][field_id]
	var context_report := context_builder.build(
		context_schema_id, canonical, state, supplied, metadata)
	if not bool(context_report.get("ok", false)):
		return _failed_diagnostics(context_report.get("diagnostics", []))
	var packet: Dictionary = context_report["packet"]
	var verb := "stop" if bool(metadata.get("stop", false)) else "update"
	var resolution := binding_resolver.resolve(
		canonical, owner_id, packet, owner_instance_id,
		spatial_resolver, null, verb)
	if not bool(resolution.get("ok", false)):
		return resolution
	var state_record := {
		"contract_id": canonical,
		"owner_id": owner_id,
		"owner_instance_id": owner_instance_id,
		"state": state.duplicate(true),
		"timestamp_msec": int(metadata.get("timestamp_msec", 0)),
	}
	state_record["state_hash"] = ForgeStableRecord.hash_record(state_record)
	trace_recorder.record_state(state_record, resolution)
	return {"ok": true, "state": state_record, "context": packet,
		"resolution": resolution, "commands": resolution.get("commands", [])}


func capture_trace() -> Dictionary:
	return trace_recorder.capture()


func replay(trace: Dictionary) -> Dictionary:
	if not trace_recorder.validate_trace(trace):
		return _failure("TST-001", "presentation.trace",
			"Presentation trace hash or version is invalid.")
	var replay_records: Array[Dictionary] = []
	var recorded_events: Array = trace.get("events", [])
	var recorded_contexts: Array = trace.get("context_packets", [])
	var recorded_resolutions: Array = trace.get("resolver_results", [])
	for index in recorded_events.size():
		if index >= recorded_contexts.size() or index >= recorded_resolutions.size():
			return _failure("TST-001", "presentation.trace",
				"Presentation trace arrays are incomplete.")
		var resolution: Dictionary = recorded_resolutions[index]
		replay_records.append({
			"event_hash": recorded_events[index].get("event_hash", ""),
			"context_hash": recorded_contexts[index].get("context_hash", ""),
			"resolution_hash": resolution.get("resolution_hash", ""),
			"commands": resolution.get("commands", []).duplicate(true),
		})
	var result := {"ok": true, "records": replay_records,
		"source_trace_hash": trace.get("trace_hash", "")}
	result["replay_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _register_contract(
		contract: ForgePresentationDefinition, target: Dictionary,
		validator: ForgePresentationValidationService) -> void:
	if contract == null or target.has(contract.stable_id):
		diagnostics.append(_diagnostic(
			"REG-001", "critical", "", "Contract is empty or duplicated."))
		return
	target[contract.stable_id] = contract
	for alias_id in contract.aliases:
		if _aliases.has(alias_id):
			diagnostics.append(_diagnostic(
				"REG-001", "critical", alias_id,
				"Presentation contract alias is duplicated."))
		else:
			_aliases[alias_id] = contract.stable_id
	for diagnostic in validator.validate(contract):
		diagnostics.append(diagnostic.to_record())


func _validate_fields(
		values: Dictionary, definitions: Dictionary,
		target_id: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for field_id in definitions:
		var definition: Dictionary = definitions[field_id]
		if bool(definition.get("required", false)) and not values.has(field_id):
			result.append(_diagnostic(
				"EVT-002", "error", target_id,
				"Required field is missing: %s" % field_id))
			continue
		if not values.has(field_id):
			continue
		var value: Variant = values[field_id]
		var type_name := str(definition.get("type", ""))
		if not _type_matches(value, type_name):
			result.append(_diagnostic(
				"EVT-002", "error", target_id,
				"Field type is invalid: %s" % field_id))
		elif type_name in ["int", "float"]:
			if definition.has("min") and float(value) < float(definition["min"]) \
					or definition.has("max") and float(value) > float(definition["max"]):
				result.append(_diagnostic(
					"EVT-002", "error", target_id,
					"Field range is invalid: %s" % field_id))
	for field_id in values:
		if not definitions.has(field_id):
			result.append(_diagnostic(
				"EVT-002", "error", target_id,
				"Payload contains an undeclared field: %s" % field_id))
	return result


func _type_matches(value: Variant, type_name: String) -> bool:
	match type_name:
		"bool":
			return value is bool
		"int":
			return value is int
		"float":
			return value is float or value is int
		"string":
			return value is String or value is StringName
		"vector3":
			return value is Vector3 or value is Array and value.size() == 3
	return false


func _failure(code: String, target_id: String, message: String) -> Dictionary:
	return _failed_diagnostics([_diagnostic(code, "error", target_id, message)])


func _failed_diagnostics(failures: Array) -> Dictionary:
	for diagnostic in failures:
		trace_recorder.record_diagnostic(diagnostic)
	return {"ok": false, "commands": [], "diagnostics": failures.duplicate(true)}


func _diagnostic(
		code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
