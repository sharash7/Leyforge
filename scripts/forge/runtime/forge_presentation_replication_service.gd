class_name ForgePresentationReplicationService
extends RefCounted
## Authority-safe event replication, prediction, reconciliation and late join.

const PACKET_VERSION := 1
const POSITION_STEP := 0.01
const NORMAL_STEP := 0.001

var diagnostics: Array[Dictionary] = []
var _event_contracts: Dictionary = {}
var _state_contracts: Dictionary = {}
var _continuous_states: Dictionary = {}
var _predictions: Dictionary = {}


func load_and_validate(
		event_contracts: Array[ForgePresentationEventContract],
		state_contracts: Array[ForgePresentationStateContract]) -> Dictionary:
	diagnostics.clear()
	_event_contracts.clear()
	_state_contracts.clear()
	_continuous_states.clear()
	_predictions.clear()
	for contract in event_contracts:
		_register(contract, _event_contracts)
	for contract in state_contracts:
		_register(contract, _state_contracts)
	return {"ok": not _has_blocking(diagnostics),
		"event_count": _event_contracts.size(),
		"state_count": _state_contracts.size(),
		"diagnostics": diagnostics.duplicate(true)}


func resolve(contract_id: String) -> Dictionary:
	if _event_contracts.has(contract_id):
		return (_event_contracts[contract_id] as ForgePresentationEventContract).to_record()
	if _state_contracts.has(contract_id):
		return (_state_contracts[contract_id] as ForgePresentationStateContract).to_record()
	return {}


func has(contract_id: String) -> bool:
	return not resolve(contract_id).is_empty()


func filtered_list(kind := "") -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	if kind.is_empty() or kind == "event":
		for contract in _event_contracts.values():
			result.append((contract as ForgePresentationEventContract).to_record())
	if kind.is_empty() or kind == "state":
		for contract in _state_contracts.values():
			result.append((contract as ForgePresentationStateContract).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.stable_id) < str(b.stable_id))
	return result


func encode_event(
		event_record: Dictionary, context_packet: Dictionary,
		reliability := "unreliable_ordered") -> Dictionary:
	var contract_id := str(event_record.get("contract_id", ""))
	if not _event_contracts.has(contract_id) \
			or reliability not in ["unreliable", "unreliable_ordered", "reliable"]:
		return _failure("EVT-004", contract_id,
			"Replicated event contract or reliability policy is invalid.")
	var fields: Dictionary = context_packet.get("fields", {})
	var packet := {
		"packet_version": PACKET_VERSION,
		"packet_kind": "event",
		"contract_id": contract_id,
		"contract_version": str((_event_contracts[contract_id] \
			as ForgePresentationEventContract).contract_version),
		"source_runtime_id": str(event_record.get("owner_instance_id", "")),
		"target_runtime_id": str(fields.get("target_runtime_id", "")),
		"position": _quantise_vector(fields.get("position", Vector3.ZERO), POSITION_STEP),
		"normal": _quantise_vector(fields.get("normal", Vector3.UP), NORMAL_STEP),
		"context": _replicable_context(fields),
		"payload": event_record.get("payload", {}).duplicate(true),
		"sequence_id": str(event_record.get("sequence_id", "")),
		"timestamp_msec": int(event_record.get("timestamp_msec", 0)),
		"seed": int(event_record.get("deterministic_seed", 0)),
		"importance": str(event_record.get("importance", "standard")),
		"reliability": reliability,
		"authority_state": str(event_record.get("authority_state", "authoritative")),
	}
	packet["packet_hash"] = ForgeStableRecord.hash_record(packet)
	return {"ok": true, "packet": packet}


func encode_state(
		state_record: Dictionary, context_packet: Dictionary,
		reliability := "reliable") -> Dictionary:
	var contract_id := str(state_record.get("contract_id", ""))
	if not _state_contracts.has(contract_id):
		return _failure("EVT-004", contract_id,
			"Replicated state contract is not registered.")
	var fields: Dictionary = context_packet.get("fields", {})
	var packet := {
		"packet_version": PACKET_VERSION,
		"packet_kind": "state",
		"contract_id": contract_id,
		"contract_version": str((_state_contracts[contract_id] \
			as ForgePresentationStateContract).contract_version),
		"source_runtime_id": str(state_record.get("owner_instance_id", "")),
		"target_runtime_id": str(fields.get("target_runtime_id", "")),
		"position": _quantise_vector(fields.get("position", Vector3.ZERO), POSITION_STEP),
		"normal": _quantise_vector(fields.get("normal", Vector3.UP), NORMAL_STEP),
		"context": _replicable_context(fields),
		"state": state_record.get("state", {}).duplicate(true),
		"sequence_id": str(state_record.get("sequence_id", "")),
		"timestamp_msec": int(state_record.get("timestamp_msec", 0)),
		"seed": int(state_record.get("deterministic_seed", 0)),
		"importance": str(state_record.get("importance", "standard")),
		"reliability": reliability,
		"authority_state": "authoritative",
	}
	packet["packet_hash"] = ForgeStableRecord.hash_record(packet)
	return {"ok": true, "packet": packet}


func decode(packet: Dictionary) -> Dictionary:
	var expected := str(packet.get("packet_hash", ""))
	var source := packet.duplicate(true)
	source.erase("packet_hash")
	if int(packet.get("packet_version", 0)) != PACKET_VERSION \
			or expected.length() != 64 \
			or ForgeStableRecord.hash_record(source) != expected:
		return _failure("EVT-004", str(packet.get("contract_id", "")),
			"Replicated presentation packet is malformed or has an invalid hash.")
	var kind := str(packet.get("packet_kind", ""))
	var contract_id := str(packet.get("contract_id", ""))
	if kind == "event" and not _event_contracts.has(contract_id) \
			or kind == "state" and not _state_contracts.has(contract_id):
		return _failure("EVT-004", contract_id,
			"Replicated presentation packet contract is unknown.")
	return {"ok": true, "packet": packet.duplicate(true)}


func begin_prediction(packet: Dictionary) -> Dictionary:
	var decoded := decode(packet)
	if not bool(decoded.get("ok", false)) or packet.get("packet_kind", "") != "event":
		return decoded
	var key := _prediction_key(packet)
	_predictions[key] = packet.duplicate(true)
	return {"ok": true, "prediction_key": key,
		"predicted_hash": packet.packet_hash}


func reconcile(authoritative_packet: Dictionary) -> Dictionary:
	var decoded := decode(authoritative_packet)
	if not bool(decoded.get("ok", false)):
		return decoded
	var key := _prediction_key(authoritative_packet)
	if not _predictions.has(key):
		return {"ok": true, "action": "apply_authoritative",
			"prediction_key": key}
	var predicted: Dictionary = _predictions[key]
	_predictions.erase(key)
	var comparable_predicted := predicted.duplicate(true)
	var comparable_authoritative := authoritative_packet.duplicate(true)
	for value in [comparable_predicted, comparable_authoritative]:
		value.erase("packet_hash")
		value["authority_state"] = "authoritative"
	var matches := ForgeStableRecord.hash_record(comparable_predicted) \
		== ForgeStableRecord.hash_record(comparable_authoritative)
	return {"ok": true, "action": "confirm" if matches else "correct",
		"prediction_key": key,
		"authoritative_packet": authoritative_packet.duplicate(true)}


func remember_continuous_state(packet: Dictionary) -> Dictionary:
	var decoded := decode(packet)
	if not bool(decoded.get("ok", false)) or packet.get("packet_kind", "") != "state":
		return decoded
	var key := "%s|%s" % [packet.contract_id, packet.source_runtime_id]
	_continuous_states[key] = packet.duplicate(true)
	return {"ok": true, "state_key": key}


func late_join_snapshot() -> Dictionary:
	var states: Array[Dictionary] = []
	for packet in _continuous_states.values():
		states.append(packet.duplicate(true))
	states.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return "%s|%s" % [a.contract_id, a.source_runtime_id] \
			< "%s|%s" % [b.contract_id, b.source_runtime_id])
	var result := {"packet_version": PACKET_VERSION,
		"continuous_states": states, "one_shot_events": []}
	result["snapshot_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _register(contract: ForgePresentationDefinition, target: Dictionary) -> void:
	if contract == null or contract.stable_id.is_empty() or target.has(contract.stable_id):
		diagnostics.append(_diagnostic(
			"EVT-004", "error", "", "Replication contract is empty or duplicated."))
		return
	target[contract.stable_id] = contract


func _replicable_context(fields: Dictionary) -> Dictionary:
	var result := {}
	for key in fields:
		if str(key) in ["rendered_instance", "audio_player", "particle_node",
				"bus_state", "accessibility_local", "lod_local"]:
			continue
		var value: Variant = fields[key]
		result[key] = _quantise_vector(value, POSITION_STEP) if value is Vector3 else value
	return result


func _quantise_vector(value: Variant, step: float) -> Array[float]:
	var vector: Vector3 = Vector3.ZERO
	if value is Vector3:
		vector = value
	elif value is Array and value.size() == 3:
		vector = Vector3(float(value[0]), float(value[1]), float(value[2]))
	return [snappedf(vector.x, step), snappedf(vector.y, step),
		snappedf(vector.z, step)]


func _prediction_key(packet: Dictionary) -> String:
	return "%s|%s|%s" % [packet.get("contract_id", ""),
		packet.get("source_runtime_id", ""), packet.get("sequence_id", "")]


func _failure(code: String, target_id: String, message: String) -> Dictionary:
	return {"ok": false, "diagnostics": [_diagnostic(
		code, "error", target_id, message)]}


func _has_blocking(items: Array) -> bool:
	for diagnostic in items:
		if str(diagnostic.get("severity", "")) in ["error", "critical"]:
			return true
	return false


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
