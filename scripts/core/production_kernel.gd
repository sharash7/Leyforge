extends Node
## Shared production authority substrate for Documents 18, 25 and Sets 27-30.
## Gameplay owners keep their own state. This kernel supplies only the common
## time, presence, evidence, authority and idempotent transaction envelopes.

const STATE_VERSION := 1
const EVIDENCE_SCHEMA := "leyforge.cross-set-evidence"
const TRANSACTION_SCHEMA := "leyforge.authoritative-transaction"
const COMMAND_SCHEMA := "leyforge.authoritative-command"
const EVENT_SCHEMA := "leyforge.authoritative-event"
const SCHEDULE_SCHEMA := "leyforge.scheduled-command"
const PRESENCE_MODES := ["near", "regional", "distant", "offline"]

var _world_tick := 0
var _evidence_by_id: Dictionary = {}
var _transactions_by_id: Dictionary = {}
var _commands_by_id: Dictionary = {}
var _events_by_id: Dictionary = {}
var _scheduled_by_id: Dictionary = {}


func reset_for_verification() -> void:
	_world_tick = 0
	_evidence_by_id.clear()
	_transactions_by_id.clear()
	_commands_by_id.clear()
	_events_by_id.clear()
	_scheduled_by_id.clear()


func world_time_reference(calendar_id: String = "calendar.leyforge.default") -> Dictionary:
	return {
		"record_type": "WorldTimeReference", "version": STATE_VERSION,
		"calendar_id": calendar_id, "world_tick": _world_tick,
		"day_index": int(_world_tick / 1440), "minute_of_day": _world_tick % 1440,
	}


func make_authority_context(authority_id: String, owner: String,
		permissions: Array[String]) -> Dictionary:
	return {
		"record_type": "AuthorityContext", "version": STATE_VERSION,
		"authority_id": authority_id, "owner": owner,
		"permissions": permissions.duplicate(),
	}


func advance_world_time(ticks: int, authority: Dictionary) -> Dictionary:
	if ticks <= 0:
		return {"ok": false, "error": "ticks_must_be_positive"}
	if not _has_permission(authority, "world_time.advance"):
		return {"ok": false, "error": "authority_denied"}
	_world_tick += ticks
	return {"ok": true, "time": world_time_reference()}


func actor_presence_state(entity_id: String, mode: String, region_id: String,
		last_observed_tick: int = -1) -> Dictionary:
	if entity_id.is_empty() or region_id.is_empty() or mode not in PRESENCE_MODES:
		return {}
	return {
		"record_type": "ActorPresenceState", "version": STATE_VERSION,
		"entity_id": entity_id, "mode": mode, "region_id": region_id,
		"last_observed_tick": (
			_world_tick if last_observed_tick < 0 else last_observed_tick),
	}


func make_evidence_envelope(evidence_id: String, source_owner: String,
		event_type: String, payload_hash: String,
		correlation_id: String = "") -> Dictionary:
	return {
		"schema": EVIDENCE_SCHEMA, "schema_version": STATE_VERSION,
		"evidence_id": evidence_id, "source_owner": source_owner,
		"event_type": event_type, "occurred_tick": _world_tick,
		"payload_hash": payload_hash.to_lower(), "correlation_id": correlation_id,
	}


func commit_evidence(envelope: Dictionary) -> Dictionary:
	var validation := validate_evidence(envelope)
	if not bool(validation.get("ok", false)):
		return validation
	var evidence_id := str(envelope["evidence_id"])
	if _evidence_by_id.has(evidence_id):
		var existing: Dictionary = _evidence_by_id[evidence_id]
		if str(existing.get("payload_hash", "")) == str(envelope["payload_hash"]) \
				and str(existing.get("source_owner", "")) == str(envelope["source_owner"]):
			return {"ok": true, "duplicate": true, "evidence": existing.duplicate(true)}
		return {"ok": false, "error": "evidence_conflict", "evidence_id": evidence_id}
	_evidence_by_id[evidence_id] = envelope.duplicate(true)
	return {"ok": true, "duplicate": false, "evidence": envelope.duplicate(true)}


func validate_evidence(envelope: Dictionary) -> Dictionary:
	if str(envelope.get("schema", "")) != EVIDENCE_SCHEMA \
			or int(envelope.get("schema_version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_evidence_schema"}
	for field in ["evidence_id", "source_owner", "event_type"]:
		if str(envelope.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	if int(envelope.get("occurred_tick", -1)) < 0:
		return {"ok": false, "error": "invalid_occurred_tick"}
	if not _is_sha256(str(envelope.get("payload_hash", ""))):
		return {"ok": false, "error": "invalid_payload_hash"}
	return {"ok": true}


func has_evidence(evidence_id: String) -> bool:
	return _evidence_by_id.has(evidence_id)


func get_evidence(evidence_id: String) -> Dictionary:
	return (_evidence_by_id.get(evidence_id, {}) as Dictionary).duplicate(true)


func get_transaction(transaction_id: String) -> Dictionary:
	return (_transactions_by_id.get(transaction_id, {}) as Dictionary).duplicate(true)


func get_published_event(event_id: String) -> Dictionary:
	return (_events_by_id.get(event_id, {}) as Dictionary).duplicate(true)


func begin_transaction(transaction_id: String, owner: String,
		evidence_refs: Array[String], authority: Dictionary) -> Dictionary:
	if transaction_id.is_empty() or owner.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	if not (_has_permission(authority, "commit:*") \
			or _has_permission(authority, "commit:%s" % owner)):
		return {"ok": false, "error": "authority_denied"}
	for evidence_id in evidence_refs:
		if not _evidence_by_id.has(evidence_id):
			return {"ok": false, "error": "missing_evidence", "evidence_id": evidence_id}
	if _transactions_by_id.has(transaction_id):
		return {"ok": false, "error": "transaction_exists"}
	var transaction := {
		"schema": TRANSACTION_SCHEMA, "schema_version": STATE_VERSION,
		"transaction_id": transaction_id, "owner": owner,
		"authority_id": str(authority.get("authority_id", "")),
		"evidence_refs": evidence_refs.duplicate(), "opened_tick": _world_tick,
		"state": "open", "payload_hash": "", "committed_tick": -1,
	}
	_transactions_by_id[transaction_id] = transaction
	return {"ok": true, "transaction": transaction.duplicate(true)}


func commit_transaction(transaction_id: String, payload_hash: String) -> Dictionary:
	if not _transactions_by_id.has(transaction_id):
		return {"ok": false, "error": "transaction_not_found"}
	if not _is_sha256(payload_hash):
		return {"ok": false, "error": "invalid_payload_hash"}
	var transaction: Dictionary = _transactions_by_id[transaction_id]
	if str(transaction.get("state", "")) == "committed":
		if str(transaction.get("payload_hash", "")) == payload_hash.to_lower():
			return {"ok": true, "duplicate": true,
				"transaction": transaction.duplicate(true)}
		return {"ok": false, "error": "transaction_commit_conflict"}
	transaction["state"] = "committed"
	transaction["payload_hash"] = payload_hash.to_lower()
	transaction["committed_tick"] = _world_tick
	_transactions_by_id[transaction_id] = transaction
	return {"ok": true, "duplicate": false,
		"transaction": transaction.duplicate(true)}


func commit_event_transaction_bundle(request: Dictionary) -> Dictionary:
	var evidence_value: Variant = request.get("evidence", {})
	if not (evidence_value is Dictionary):
		return {"ok": false, "error": "invalid_evidence"}
	var evidence: Dictionary = (evidence_value as Dictionary).duplicate(true)
	var validation := validate_evidence(evidence)
	if not bool(validation.get("ok", false)):
		return validation
	var transaction_id := str(request.get("transaction_id", ""))
	var owner := str(request.get("owner", ""))
	var payload_hash := str(request.get("payload_hash", "")).to_lower()
	var publication_id := str(request.get("publication_id", ""))
	var event_type := str(request.get("event_type", ""))
	var authority_value: Variant = request.get("authority", {})
	var authority: Dictionary = authority_value if authority_value is Dictionary else {}
	if transaction_id.is_empty() or owner.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	if publication_id.is_empty() or event_type.is_empty():
		return {"ok": false, "error": "event_identity_required"}
	if not _is_sha256(payload_hash):
		return {"ok": false, "error": "invalid_payload_hash"}
	if str(evidence.get("source_owner", "")) != owner:
		return {"ok": false, "error": "evidence_owner_mismatch"}
	if not (_has_permission(authority, "commit:*") \
			or _has_permission(authority, "commit:%s" % owner)):
		return {"ok": false, "error": "authority_denied"}
	var evidence_id := str(evidence.get("evidence_id", ""))
	var transaction := {
		"schema": TRANSACTION_SCHEMA,
		"schema_version": STATE_VERSION,
		"transaction_id": transaction_id,
		"owner": owner,
		"authority_id": str(authority.get("authority_id", "")),
		"evidence_refs": [evidence_id],
		"opened_tick": _world_tick,
		"state": "committed",
		"payload_hash": payload_hash,
		"committed_tick": _world_tick,
	}
	var publication := {
		"schema": EVENT_SCHEMA,
		"schema_version": STATE_VERSION,
		"event_id": publication_id,
		"source_owner": owner,
		"event_type": event_type,
		"payload_hash": payload_hash,
		"evidence_refs": [evidence_id],
		"published_tick": _world_tick,
	}
	var evidence_existed := _evidence_by_id.has(evidence_id)
	var transaction_existed := _transactions_by_id.has(transaction_id)
	var publication_existed := _events_by_id.has(publication_id)
	if evidence_existed:
		var existing_evidence: Dictionary = _evidence_by_id[evidence_id]
		if str(existing_evidence.get("payload_hash", "")) != payload_hash \
				or str(existing_evidence.get("source_owner", "")) != owner \
				or str(existing_evidence.get("event_type", "")) != event_type:
			return {"ok": false, "error": "evidence_conflict",
				"evidence_id": evidence_id}
	if transaction_existed:
		var existing_transaction: Dictionary = _transactions_by_id[transaction_id]
		if str(existing_transaction.get("state", "")) != "committed" \
				or str(existing_transaction.get("payload_hash", "")) != payload_hash \
				or str(existing_transaction.get("owner", "")) != owner \
				or existing_transaction.get("evidence_refs", []) != [evidence_id]:
			return {"ok": false, "error": "transaction_commit_conflict",
				"transaction_id": transaction_id}
	if publication_existed:
		var existing_publication: Dictionary = _events_by_id[publication_id]
		if str(existing_publication.get("payload_hash", "")) != payload_hash \
				or str(existing_publication.get("source_owner", "")) != owner \
				or str(existing_publication.get("event_type", "")) != event_type \
				or existing_publication.get("evidence_refs", []) != [evidence_id]:
			return {"ok": false, "error": "event_conflict",
				"event_id": publication_id}
	# Every failure condition is checked before these three authoritative maps
	# change, so observers can never see only part of the bundle.
	_evidence_by_id[evidence_id] = evidence
	_transactions_by_id[transaction_id] = transaction
	_events_by_id[publication_id] = publication
	return {
		"ok": true,
		"duplicate": evidence_existed and transaction_existed and publication_existed,
		"evidence": evidence.duplicate(true),
		"transaction": transaction.duplicate(true),
		"event": publication.duplicate(true),
	}


func make_command_envelope(command_id: String, target_owner: String,
		action: String, payload_hash: String, evidence_refs: Array[String],
		authority: Dictionary) -> Dictionary:
	return {
		"schema": COMMAND_SCHEMA, "schema_version": STATE_VERSION,
		"command_id": command_id, "target_owner": target_owner,
		"action": action, "payload_hash": payload_hash.to_lower(),
		"evidence_refs": evidence_refs.duplicate(),
		"authority_id": str(authority.get("authority_id", "")),
		"issued_tick": _world_tick,
	}


func submit_command(command: Dictionary, authority: Dictionary) -> Dictionary:
	var validation := validate_command(command, authority)
	if not bool(validation.get("ok", false)):
		return validation
	var command_id := str(command["command_id"])
	if _commands_by_id.has(command_id):
		var existing: Dictionary = _commands_by_id[command_id]
		if str(existing.get("payload_hash", "")) == str(command["payload_hash"]) \
				and str(existing.get("target_owner", "")) == str(command["target_owner"]) \
				and str(existing.get("action", "")) == str(command["action"]):
			return {"ok": true, "duplicate": true, "command": existing.duplicate(true)}
		return {"ok": false, "error": "command_conflict", "command_id": command_id}
	var stored := command.duplicate(true)
	stored["state"] = "accepted"
	_commands_by_id[command_id] = stored
	return {"ok": true, "duplicate": false, "command": stored.duplicate(true)}


func validate_command(command: Dictionary, authority: Dictionary) -> Dictionary:
	if str(command.get("schema", "")) != COMMAND_SCHEMA \
			or int(command.get("schema_version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_command_schema"}
	for field in ["command_id", "target_owner", "action", "authority_id"]:
		if str(command.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	if str(command.get("authority_id", "")) != str(authority.get("authority_id", "")):
		return {"ok": false, "error": "authority_mismatch"}
	var target_owner := str(command.get("target_owner", ""))
	if not (_has_permission(authority, "command:*") \
			or _has_permission(authority, "command:%s" % target_owner)):
		return {"ok": false, "error": "authority_denied"}
	if not _is_sha256(str(command.get("payload_hash", ""))):
		return {"ok": false, "error": "invalid_payload_hash"}
	var refs: Variant = command.get("evidence_refs", [])
	if not (refs is Array):
		return {"ok": false, "error": "invalid_evidence_refs"}
	for evidence_id in refs:
		if not _evidence_by_id.has(str(evidence_id)):
			return {"ok": false, "error": "missing_evidence",
				"evidence_id": str(evidence_id)}
	return {"ok": true}


func publish_event(event_id: String, source_owner: String, event_type: String,
		payload_hash: String, evidence_refs: Array[String]) -> Dictionary:
	if event_id.is_empty() or source_owner.is_empty() or event_type.is_empty():
		return {"ok": false, "error": "event_identity_required"}
	if not _is_sha256(payload_hash):
		return {"ok": false, "error": "invalid_payload_hash"}
	for evidence_id in evidence_refs:
		if not _evidence_by_id.has(evidence_id):
			return {"ok": false, "error": "missing_evidence", "evidence_id": evidence_id}
	var event := {
		"schema": EVENT_SCHEMA, "schema_version": STATE_VERSION,
		"event_id": event_id, "source_owner": source_owner,
		"event_type": event_type, "payload_hash": payload_hash.to_lower(),
		"evidence_refs": evidence_refs.duplicate(), "published_tick": _world_tick,
	}
	if _events_by_id.has(event_id):
		var existing: Dictionary = _events_by_id[event_id]
		if str(existing.get("payload_hash", "")) == str(event["payload_hash"]) \
				and str(existing.get("source_owner", "")) == source_owner:
			return {"ok": true, "duplicate": true, "event": existing.duplicate(true)}
		return {"ok": false, "error": "event_conflict", "event_id": event_id}
	_events_by_id[event_id] = event
	return {"ok": true, "duplicate": false, "event": event.duplicate(true)}


func schedule_command(schedule_id: String, command_id: String, owner: String,
		due_tick: int, authority: Dictionary) -> Dictionary:
	if schedule_id.is_empty() or owner.is_empty() or not _commands_by_id.has(command_id):
		return {"ok": false, "error": "schedule_identity_or_command_invalid"}
	if due_tick < _world_tick:
		return {"ok": false, "error": "schedule_due_in_past"}
	if not (_has_permission(authority, "schedule:*") \
			or _has_permission(authority, "schedule:%s" % owner)):
		return {"ok": false, "error": "authority_denied"}
	if _scheduled_by_id.has(schedule_id):
		return {"ok": false, "error": "schedule_exists"}
	var scheduled := {
		"schema": SCHEDULE_SCHEMA, "schema_version": STATE_VERSION,
		"schedule_id": schedule_id, "command_id": command_id, "owner": owner,
		"due_tick": due_tick, "state": "pending", "dispatched_tick": -1,
	}
	_scheduled_by_id[schedule_id] = scheduled
	return {"ok": true, "scheduled": scheduled.duplicate(true)}


func claim_due_commands(max_count: int, authority: Dictionary) -> Dictionary:
	if max_count < 1 or max_count > 100:
		return {"ok": false, "error": "invalid_claim_limit"}
	if not _has_permission(authority, "scheduler.dispatch"):
		return {"ok": false, "error": "authority_denied"}
	var candidates: Array[Dictionary] = []
	for scheduled in _scheduled_by_id.values():
		if str(scheduled.get("state", "")) == "pending" \
				and int(scheduled.get("due_tick", -1)) <= _world_tick:
			candidates.append(scheduled)
	candidates.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var a_tick := int(a.get("due_tick", 0))
		var b_tick := int(b.get("due_tick", 0))
		return str(a.get("schedule_id", "")) < str(b.get("schedule_id", "")) \
			if a_tick == b_tick else a_tick < b_tick)
	var claimed: Array[Dictionary] = []
	for index in range(mini(max_count, candidates.size())):
		var scheduled: Dictionary = candidates[index]
		scheduled["state"] = "dispatched"
		scheduled["dispatched_tick"] = _world_tick
		_scheduled_by_id[str(scheduled["schedule_id"])] = scheduled
		claimed.append(scheduled.duplicate(true))
	return {"ok": true, "commands": claimed}


func validate_cross_set_contract(contract_type: String,
		payload: Dictionary) -> Dictionary:
	var contracts := {
		"TransportMissionRequest": {"owner": "set27", "fields": [
			"request_id", "origin_id", "destination_id", "cargo_refs", "evidence_id"]},
		"SocialMovementAuthorisation": {"owner": "set28", "fields": [
			"authorisation_id", "entity_id", "allowed", "evidence_id"]},
		"MovementExertionRequest": {"owner": "set30", "fields": [
			"request_id", "entity_id", "exertion_units", "evidence_id"]},
		"BiologicalMobilityModifierSnapshot": {"owner": "set29", "fields": [
			"entity_id", "modifier", "valid_at_tick", "evidence_id"]},
		"PhysicalImpactEvent": {"owner": "set30", "fields": [
			"event_id", "entity_id", "impulse", "evidence_id"]},
		"AquaticMovementProviderHandoff": {"owner": "set26e", "fields": [
			"handoff_id", "entity_id", "medium", "evidence_id"]},
	}
	if not contracts.has(contract_type):
		return {"ok": false, "error": "unknown_contract"}
	var contract: Dictionary = contracts[contract_type]
	if str(payload.get("source_owner", "")) != str(contract["owner"]):
		return {"ok": false, "error": "owner_mismatch"}
	for field in contract["fields"]:
		if not payload.has(field):
			return {"ok": false, "error": "missing_%s" % field}
		if payload[field] is String and str(payload[field]).is_empty():
			return {"ok": false, "error": "empty_%s" % field}
	return {"ok": true}


func serialize_state() -> Dictionary:
	return {"version": STATE_VERSION, "world_tick": _world_tick,
		"evidence": _sorted_values(_evidence_by_id),
		"transactions": _sorted_values(_transactions_by_id),
		"commands": _sorted_values(_commands_by_id),
		"events": _sorted_values(_events_by_id),
		"scheduled": _sorted_values(_scheduled_by_id)}


func restore_state(state: Dictionary) -> bool:
	if int(state.get("version", 0)) != STATE_VERSION \
			or not (state.get("evidence", []) is Array) \
			or not (state.get("transactions", []) is Array) \
			or not (state.get("commands", []) is Array) \
			or not (state.get("events", []) is Array) \
			or not (state.get("scheduled", []) is Array):
		return false
	var restored_evidence := {}
	for entry in state.get("evidence", []):
		if not (entry is Dictionary) or not bool(validate_evidence(entry).get("ok", false)):
			return false
		var evidence_id := str(entry.get("evidence_id", ""))
		if restored_evidence.has(evidence_id):
			return false
		restored_evidence[evidence_id] = entry.duplicate(true)
	var restored_transactions := {}
	for entry in state.get("transactions", []):
		if not (entry is Dictionary):
			return false
		var transaction_id := str(entry.get("transaction_id", ""))
		if transaction_id.is_empty() or restored_transactions.has(transaction_id):
			return false
		if str(entry.get("state", "")) not in ["open", "committed"]:
			return false
		if str(entry.get("state", "")) == "committed" \
				and not _is_sha256(str(entry.get("payload_hash", ""))):
			return false
		restored_transactions[transaction_id] = entry.duplicate(true)
	var restored_commands := _restore_unique_records(state.get("commands", []), "command_id")
	var restored_events := _restore_unique_records(state.get("events", []), "event_id")
	var restored_scheduled := _restore_unique_records(state.get("scheduled", []), "schedule_id")
	if restored_commands.is_empty() != (state.get("commands", []) as Array).is_empty() \
			or restored_events.is_empty() != (state.get("events", []) as Array).is_empty() \
			or restored_scheduled.is_empty() != (state.get("scheduled", []) as Array).is_empty():
		return false
	_world_tick = maxi(0, int(state.get("world_tick", 0)))
	_evidence_by_id = restored_evidence
	_transactions_by_id = restored_transactions
	_commands_by_id = restored_commands
	_events_by_id = restored_events
	_scheduled_by_id = restored_scheduled
	return true


func _has_permission(authority: Dictionary, permission: String) -> bool:
	if str(authority.get("record_type", "")) != "AuthorityContext" \
			or str(authority.get("authority_id", "")).is_empty():
		return false
	var permissions: Variant = authority.get("permissions", [])
	return permissions is Array and permission in permissions


func _is_sha256(value: String) -> bool:
	if value.length() != 64:
		return false
	for character in value.to_lower():
		if character not in "0123456789abcdef":
			return false
	return true


func _sorted_values(source: Dictionary) -> Array[Dictionary]:
	var keys: Array = source.keys()
	keys.sort_custom(func(a: Variant, b: Variant) -> bool: return str(a) < str(b))
	var result: Array[Dictionary] = []
	for key in keys:
		result.append((source[key] as Dictionary).duplicate(true))
	return result


func _restore_unique_records(entries: Array, identity_field: String) -> Dictionary:
	var result := {}
	for entry in entries:
		if not (entry is Dictionary):
			return {}
		var identity := str(entry.get(identity_field, ""))
		if identity.is_empty() or result.has(identity):
			return {}
		result[identity] = entry.duplicate(true)
	return result
