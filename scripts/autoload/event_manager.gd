extends Node
## Canonical EVT-001 owner for quests, events, history and world consequences.
## The shared ProductionKernel remains the low-level evidence and transaction
## substrate; this owner stores the specialist gameplay truth for Document 15.

signal event_changed(event_id: String)
signal quest_changed(quest_id: String)
signal history_changed(history_id: String)

const STATE_SCHEMA := "leyforge.event-state"
const STATE_VERSION := 2
const LEGACY_STATE_VERSION := 1
const INTERFACE_ID := "leyforge.system.interface.event"
const INTERFACE_VERSION := "2.0"
const EVIDENCE_OWNER := "set15.event"
const MAX_HISTORY_ENTRIES := 512

const VALID_EVENT_STATUSES := [
	"proposed", "active", "resolved", "cancelled", "archived",
]
const VALID_EVENT_PHASES := [
	"dormant", "warning", "initiation", "escalation", "crisis",
	"resolution", "aftermath", "historical",
]
const VALID_QUEST_STATUSES := [
	"latent", "discoverable", "offered", "available", "accepted", "active",
	"blocked", "suspended", "branch_pending", "completed", "failed",
	"expired", "abandoned", "superseded", "archived",
]
const VALID_OBJECTIVE_STATUSES := [
	"active", "blocked", "completed", "failed",
]
const VALID_REWARD_CLAIM_STATES := [
	"unclaimed", "committing", "claimed", "partially_claimed",
	"failed_recoverable",
]
const REWARD_CLAIM_TRANSITIONS := {
	"unclaimed": ["committing"],
	"committing": ["claimed", "partially_claimed", "failed_recoverable"],
	"partially_claimed": ["committing", "claimed", "failed_recoverable"],
	"failed_recoverable": ["committing"],
	"claimed": [],
}
const EVENT_STATUS_TRANSITIONS := {
	"proposed": ["active", "resolved", "cancelled", "archived"],
	"active": ["resolved", "cancelled", "archived"],
	"resolved": ["archived"],
	"cancelled": ["archived"],
	"archived": [],
}
const EVENT_PHASE_TRANSITIONS := {
	"dormant": ["warning", "initiation", "resolution"],
	"warning": ["initiation", "resolution"],
	"initiation": ["escalation", "crisis", "resolution"],
	"escalation": ["crisis", "resolution"],
	"crisis": ["resolution"],
	"resolution": ["aftermath", "historical"],
	"aftermath": ["historical"],
	"historical": [],
}
const QUEST_STATUS_TRANSITIONS := {
	"latent": ["discoverable", "offered", "superseded", "archived"],
	"discoverable": ["offered", "available", "superseded", "archived"],
	"offered": ["accepted", "active", "expired", "abandoned", "superseded"],
	"available": ["accepted", "active", "expired", "abandoned", "superseded"],
	"accepted": ["active", "blocked", "suspended", "abandoned", "failed"],
	"active": ["blocked", "suspended", "branch_pending", "completed", "failed",
		"expired", "abandoned", "superseded"],
	"blocked": ["active", "suspended", "branch_pending", "failed", "expired",
		"abandoned", "superseded"],
	"suspended": ["active", "blocked", "failed", "expired", "abandoned"],
	"branch_pending": ["active", "blocked", "failed", "expired", "abandoned"],
	"completed": ["archived"],
	"failed": ["archived"],
	"expired": ["archived"],
	"abandoned": ["archived"],
	"superseded": ["archived"],
	"archived": [],
}
const VALID_BINDING_KINDS := [
	"player", "person", "actor", "settlement", "structure", "faction",
	"government", "jurisdiction", "route", "journey", "movement_intent",
	"household", "job", "social_profile", "event", "quest",
]

var initialized := false
var restored_from_state := false
var world_seed := 0
var world_id := ""

var _events_by_id: Dictionary = {}
var _quests_by_id: Dictionary = {}
var _history_by_id: Dictionary = {}
var _transactions_by_id: Dictionary = {}
var _history_order: Array[String] = []
var _archived_history_count := 0
var _archived_history_hash := ""


func reset() -> void:
	initialized = false
	restored_from_state = false
	world_seed = 0
	world_id = ""
	_events_by_id.clear()
	_quests_by_id.clear()
	_history_by_id.clear()
	_transactions_by_id.clear()
	_history_order.clear()
	_archived_history_count = 0
	_archived_history_hash = ""


func initialize(seed_value: int, requested_world_id: String = "") -> void:
	if initialized and world_seed == seed_value \
			and (requested_world_id.is_empty() or world_id == requested_world_id):
		return
	reset()
	initialized = true
	world_seed = seed_value
	world_id = requested_world_id


func event_ids(status: String = "") -> Array[String]:
	var result: Array[String] = []
	for event_value in _events_by_id.keys():
		var event_id := str(event_value)
		if status.is_empty() or str((_events_by_id[event_id] as Dictionary).get(
				"status", "")) == status:
			result.append(event_id)
	result.sort()
	return result


func quest_ids(status: String = "") -> Array[String]:
	var result: Array[String] = []
	for quest_value in _quests_by_id.keys():
		var quest_id := str(quest_value)
		if status.is_empty() or str((_quests_by_id[quest_id] as Dictionary).get(
				"status", "")) == status:
			result.append(quest_id)
	result.sort()
	return result


func has_event(event_id: String) -> bool:
	return _events_by_id.has(event_id)


func has_quest(quest_id: String) -> bool:
	return _quests_by_id.has(quest_id)


func has_history(history_id: String) -> bool:
	return _history_by_id.has(history_id)


func get_event(event_id: String) -> Dictionary:
	return (_events_by_id.get(event_id, {}) as Dictionary).duplicate(true)


func get_quest(quest_id: String) -> Dictionary:
	return (_quests_by_id.get(quest_id, {}) as Dictionary).duplicate(true)


func get_history(history_id: String) -> Dictionary:
	return (_history_by_id.get(history_id, {}) as Dictionary).duplicate(true)


func get_recent_history(limit: int = 16, settlement_ref: String = "",
		kind: String = "") -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var remaining := maxi(0, limit)
	for index in range(_history_order.size() - 1, -1, -1):
		if remaining <= 0:
			break
		var history_id := _history_order[index]
		var entry: Dictionary = _history_by_id.get(history_id, {}).duplicate(true)
		if entry.is_empty():
			continue
		if not settlement_ref.is_empty() and str(entry.get(
				"settlement_ref", "")) != settlement_ref:
			continue
		if not kind.is_empty() and str(entry.get("kind", "")) != kind:
			continue
		result.append(entry)
		remaining -= 1
	return result


func register_event(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var event_id := str(payload.get("event_id", ""))
	if event_id.is_empty():
		return {"ok": false, "error": "event.id_required"}
	var validation := _validate_event_payload(payload, true)
	if not bool(validation.get("ok", false)):
		return validation
	var transaction_id := str(payload.get(
		"transaction_id", "event.register.%s" % event_id))
	var candidate := _make_event_record(payload)
	var history_preflight := _prepare_event_history(payload, candidate, "created")
	if not bool(history_preflight.get("ok", false)):
		return history_preflight
	var history_record: Dictionary = history_preflight.get("record", {})
	var history_id := str(history_preflight.get("history_id", ""))
	if not history_id.is_empty():
		candidate["history_entry_refs"] = _append_unique_string(
			candidate.get("history_entry_refs", []), history_id)
		candidate["state_hash"] = _record_hash(candidate)
	var request_hash := _hash_value(_event_request_payload(candidate))
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if _events_by_id.has(event_id):
		var existing: Dictionary = _events_by_id[event_id]
		if _event_semantic_hash(existing) == _event_semantic_hash(candidate):
			_store_transaction(transaction_id, request_hash, {
				"event_id": event_id,
				"history_id": history_id,
				"duplicate": true,
			})
			return {"ok": true, "duplicate": true,
				"event": existing.duplicate(true),
				"event_id": event_id,
				"history_id": history_id}
		return {"ok": false, "error": "event.conflict", "event_id": event_id}
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate,
		str(candidate.get("event_family", "event")))
	if not bool(transaction.get("ok", false)):
		return transaction
	var event_record: Dictionary = transaction.get("record", {}).duplicate(true)
	_events_by_id[event_id] = event_record
	if not history_record.is_empty():
		_commit_history_record(history_record)
	_store_transaction(transaction_id, request_hash, {
		"event_id": event_id,
		"history_id": history_id,
		"duplicate": false,
	})
	event_changed.emit(event_id)
	_process_event_for_quests(event_id)
	return {
		"ok": true,
		"duplicate": false,
		"event": _events_by_id[event_id].duplicate(true),
		"event_id": event_id,
		"history_id": history_id,
		"evidence_id": str(transaction.get("evidence_id", "")),
	}


func resolve_event(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var event_id := str(payload.get("event_id", ""))
	if not _events_by_id.has(event_id):
		return {"ok": false, "error": "event.not_found", "event_id": event_id}
	var existing: Dictionary = _events_by_id[event_id]
	var candidate := existing.duplicate(true)
	var status := str(payload.get("status", "resolved"))
	if status not in VALID_EVENT_STATUSES:
		return {"ok": false, "error": "event.invalid_status", "status": status}
	var transaction_id := str(payload.get(
		"transaction_id", "event.resolve.%s.%s" % [event_id, status]))
	var current_status := str(existing.get("status", ""))
	var request_hash := _hash_value({
		"event_id": event_id,
		"status": status,
		"metadata": _dict_value(payload.get("metadata", {})),
		"history_id": str(payload.get(
			"history_id", "history.%s.%s" % [event_id, status])),
		"title": str(payload.get("title", "")),
		"summary": str(payload.get("summary", "")),
	})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if status == current_status:
		return {
			"ok": true,
			"duplicate": true,
			"event": existing.duplicate(true),
			"event_id": event_id,
		}
	var allowed_transitions: Array = EVENT_STATUS_TRANSITIONS.get(
		current_status, [])
	if not allowed_transitions.has(status):
		return {
			"ok": false,
			"error": "event.invalid_transition",
			"event_id": event_id,
			"from_status": current_status,
			"to_status": status,
		}
	candidate["status"] = status
	if status == "resolved" and str(candidate.get("phase", "")) not in [
			"resolution", "aftermath", "historical"]:
		candidate["phase"] = "resolution"
	elif status == "archived":
		candidate["phase"] = "historical"
	candidate["metadata"] = _merge_dict(
		candidate.get("metadata", {}),
		payload.get("metadata", {}))
	candidate["updated_tick"] = int(
		ProductionKernel.world_time_reference().get("world_tick", 0))
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	var history_preflight := _prepare_event_history(payload, candidate, status)
	if not bool(history_preflight.get("ok", false)):
		return history_preflight
	var history_record: Dictionary = history_preflight.get("record", {})
	var history_id := str(history_preflight.get("history_id", ""))
	if not history_id.is_empty():
		candidate["history_entry_refs"] = _append_unique_string(
			candidate.get("history_entry_refs", []), history_id)
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate,
		str(candidate.get("event_family", "event")))
	if not bool(transaction.get("ok", false)):
		return transaction
	_events_by_id[event_id] = transaction.get("record", {}).duplicate(true)
	if not history_record.is_empty():
		_commit_history_record(history_record)
	_store_transaction(transaction_id, request_hash, {
		"event_id": event_id,
		"history_id": history_id,
		"duplicate": false,
	})
	event_changed.emit(event_id)
	_process_event_for_quests(event_id)
	return {
		"ok": true,
		"duplicate": false,
		"event": _events_by_id[event_id].duplicate(true),
		"event_id": event_id,
		"history_id": history_id,
		"evidence_id": str(transaction.get("evidence_id", "")),
	}


func attach_consequence(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var event_id := str(payload.get("event_id", ""))
	if not _events_by_id.has(event_id):
		return {"ok": false, "error": "event.not_found", "event_id": event_id}
	var consequence_ref := str(payload.get("consequence_ref", ""))
	if consequence_ref.is_empty():
		return {"ok": false, "error": "event.consequence_ref_required"}
	var transaction_id := str(payload.get(
		"transaction_id", "event.consequence.%s.%s" % [event_id, consequence_ref]))
	var existing: Dictionary = _events_by_id[event_id]
	var consequences: Array = existing.get("consequence_refs", []).duplicate(true)
	var consequence := {
		"consequence_ref": consequence_ref,
		"owner_ref": str(payload.get("owner_ref", "")),
		"kind": str(payload.get("kind", "consequence")),
		"evidence_ref": str(payload.get("evidence_ref", "")),
		"metadata": payload.get("metadata", {}).duplicate(true),
	}
	var binding_validation := _validate_consequence_binding(consequence)
	if not bool(binding_validation.get("ok", false)):
		return binding_validation
	var request_hash := _hash_value({"event_id": event_id,
		"consequence": consequence})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	for consequence_value in consequences:
		if consequence_value is Dictionary and str((consequence_value as Dictionary).get(
				"consequence_ref", "")) == consequence_ref:
			if _hash_value(consequence_value) != _hash_value(consequence):
				return {"ok": false, "error": "event.consequence_conflict",
					"consequence_ref": consequence_ref}
			_store_transaction(transaction_id, request_hash, {
				"event_id": event_id,
				"history_id": "",
				"duplicate": true,
			})
			return {"ok": true, "duplicate": true,
				"event": existing.duplicate(true),
				"event_id": event_id}
	var candidate := existing.duplicate(true)
	consequences.append(consequence)
	candidate["consequence_refs"] = consequences
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	candidate["updated_tick"] = int(
		ProductionKernel.world_time_reference().get("world_tick", 0))
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate,
		"consequence.%s" % str(payload.get("kind", "generic")))
	if not bool(transaction.get("ok", false)):
		return transaction
	_events_by_id[event_id] = transaction.get("record", {}).duplicate(true)
	event_changed.emit(event_id)
	return {
		"ok": true,
		"duplicate": false,
		"event": _events_by_id[event_id].duplicate(true),
		"event_id": event_id,
		"evidence_id": str(transaction.get("evidence_id", "")),
	}


func record_history_entry(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	return _record_history_internal(payload, false)


func register_quest(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var quest_id := str(payload.get("quest_id", ""))
	if quest_id.is_empty():
		return {"ok": false, "error": "quest.id_required"}
	var validation := _validate_quest_payload(payload, true)
	if not bool(validation.get("ok", false)):
		return validation
	var transaction_id := str(payload.get(
		"transaction_id", "quest.register.%s" % quest_id))
	var candidate := _make_quest_record(payload)
	var request_hash := _hash_value(_quest_request_payload(candidate))
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if _quests_by_id.has(quest_id):
		var existing: Dictionary = _quests_by_id[quest_id]
		if _record_hash(existing) == _record_hash(candidate):
			_store_transaction(transaction_id, request_hash, {
				"quest_id": quest_id,
				"duplicate": true,
			})
			return {"ok": true, "duplicate": true,
				"quest": existing.duplicate(true), "quest_id": quest_id}
		return {"ok": false, "error": "quest.conflict", "quest_id": quest_id}
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate, "quest")
	if not bool(transaction.get("ok", false)):
		return transaction
	_quests_by_id[quest_id] = transaction.get("record", {}).duplicate(true)
	var source_event_ref := str(_quests_by_id[quest_id].get("source_event_ref", ""))
	if not source_event_ref.is_empty() and _events_by_id.has(source_event_ref):
		var source_event: Dictionary = _events_by_id[source_event_ref].duplicate(true)
		source_event["generated_quest_refs"] = _append_unique_string(
			source_event.get("generated_quest_refs", []), quest_id)
		source_event["state_hash"] = _record_hash(source_event)
		_events_by_id[source_event_ref] = source_event
		event_changed.emit(source_event_ref)
	quest_changed.emit(quest_id)
	if not source_event_ref.is_empty():
		_process_event_for_quests(source_event_ref)
	return {
		"ok": true,
		"duplicate": false,
		"quest": _quests_by_id[quest_id].duplicate(true),
		"quest_id": quest_id,
		"evidence_id": str(transaction.get("evidence_id", "")),
	}


func advance_quest_from_event(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var quest_id := str(payload.get("quest_id", ""))
	var event_ref := str(payload.get("event_ref", ""))
	var objective_id := str(payload.get("objective_id", ""))
	if not _quests_by_id.has(quest_id):
		return {"ok": false, "error": "quest.not_found", "quest_id": quest_id}
	if event_ref.is_empty() or not _events_by_id.has(event_ref):
		return {"ok": false, "error": "quest.event_ref_required"}
	if objective_id.is_empty():
		return {"ok": false, "error": "quest.objective_required"}
	var transaction_id := str(payload.get(
		"transaction_id", "quest.advance.%s.%s" % [quest_id, objective_id]))
	var existing: Dictionary = _quests_by_id[quest_id]
	var objective_status := str(payload.get("objective_status", "completed"))
	if objective_status not in VALID_OBJECTIVE_STATUSES:
		return {"ok": false, "error": "quest.invalid_objective_status",
			"status": objective_status}
	var canonical_event: Dictionary = _events_by_id[event_ref]
	var satisfied_predicates := _canonical_event_predicates(canonical_event)
	var request_hash := _hash_value({
		"quest_id": quest_id,
		"objective_id": objective_id,
		"event_ref": event_ref,
		"objective_status": objective_status,
	})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if str(existing.get("status", "")) not in [
			"accepted", "active", "blocked", "branch_pending"]:
		return {"ok": false, "error": "quest.not_advanceable",
			"status": str(existing.get("status", ""))}
	var required_event_refs: Array = existing.get("required_event_refs", [])
	if not required_event_refs.is_empty() and not required_event_refs.has(event_ref):
		return {"ok": false, "error": "quest.event_not_required",
			"event_ref": event_ref}
	var candidate := existing.duplicate(true)
	var objectives: Array = candidate.get("objective_records", []).duplicate(true)
	var matched := false
	for index in objectives.size():
		var objective: Dictionary = objectives[index].duplicate(true)
		if str(objective.get("objective_id", "")) != objective_id:
			continue
		if not _objective_stage_is_active(candidate, objective):
			return {"ok": false, "error": "quest.objective_stage_inactive",
				"objective_id": objective_id}
		var required_families: Array = objective.get(
			"required_event_families", [])
		var event_family := str(canonical_event.get("event_family", ""))
		if not required_families.is_empty() \
				and not required_families.has(event_family):
			return {"ok": false, "error": "quest.event_family_mismatch",
				"event_family": event_family, "objective_id": objective_id}
		var missing_predicates: Array[String] = []
		for predicate_value in objective.get("required_predicates", []):
			var predicate := str(predicate_value)
			if not satisfied_predicates.has(predicate):
				missing_predicates.append(predicate)
		if not missing_predicates.is_empty():
			return {"ok": false, "error": "quest.predicates_unsatisfied",
				"missing_predicates": missing_predicates,
				"objective_id": objective_id}
		var refs: Array = objective.get("completion_event_refs", []).duplicate(true)
		if refs.has(event_ref):
			_store_transaction(transaction_id, request_hash, {
				"quest_id": quest_id,
				"duplicate": true,
			})
			return {"ok": true, "duplicate": true,
				"quest": existing.duplicate(true), "quest_id": quest_id}
		refs.append(event_ref)
		objective["completion_event_refs"] = refs
		var evidence_refs: Array = objective.get(
			"completion_evidence_refs", []).duplicate(true)
		for evidence_value in canonical_event.get("source_evidence_refs", []):
			var evidence_ref := str(evidence_value)
			if not evidence_ref.is_empty() and not evidence_refs.has(evidence_ref):
				evidence_refs.append(evidence_ref)
		objective["completion_evidence_refs"] = evidence_refs
		objective["status"] = objective_status
		objectives[index] = objective
		matched = true
		break
	if not matched:
		return {"ok": false, "error": "quest.objective_not_found",
			"objective_id": objective_id}
	candidate["objective_records"] = objectives
	candidate = _advance_quest_graph(candidate, objective_id)
	candidate["status"] = _derive_quest_status(candidate)
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate, "quest.advance")
	if not bool(transaction.get("ok", false)):
		return transaction
	_quests_by_id[quest_id] = transaction.get("record", {}).duplicate(true)
	quest_changed.emit(quest_id)
	return {
		"ok": true,
		"duplicate": false,
		"quest": _quests_by_id[quest_id].duplicate(true),
		"quest_id": quest_id,
		"evidence_id": str(transaction.get("evidence_id", "")),
	}


func advance_quest_from_evidence(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var quest_id := str(payload.get("quest_id", ""))
	var objective_id := str(payload.get("objective_id", ""))
	var evidence_ref := str(payload.get("evidence_ref", ""))
	if not _quests_by_id.has(quest_id):
		return {"ok": false, "error": "quest.not_found", "quest_id": quest_id}
	var evidence := ProductionKernel.get_evidence(evidence_ref)
	if evidence.is_empty():
		return {"ok": false, "error": "quest.evidence_not_found",
			"evidence_ref": evidence_ref}
	var existing: Dictionary = _quests_by_id[quest_id]
	var transaction_id := str(payload.get("transaction_id",
		"quest.evidence.%s.%s.%s" % [quest_id, objective_id, evidence_ref]))
	var request_hash := _hash_value({
		"quest_id": quest_id,
		"objective_id": objective_id,
		"evidence_ref": evidence_ref,
	})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if str(existing.get("status", "")) not in [
			"accepted", "active", "blocked", "branch_pending"]:
		return {"ok": false, "error": "quest.not_advanceable",
			"status": str(existing.get("status", ""))}
	var candidate := existing.duplicate(true)
	var objectives: Array = candidate.get("objective_records", []).duplicate(true)
	var matched := false
	for index in objectives.size():
		var objective: Dictionary = objectives[index].duplicate(true)
		if str(objective.get("objective_id", "")) != objective_id:
			continue
		if not _objective_stage_is_active(candidate, objective):
			return {"ok": false, "error": "quest.objective_stage_inactive",
				"objective_id": objective_id}
		var required_types: Array = objective.get("required_evidence_types", [])
		var evidence_type := str(evidence.get("event_type", ""))
		if not required_types.is_empty() and not required_types.has(evidence_type):
			return {"ok": false, "error": "quest.evidence_type_mismatch",
				"evidence_type": evidence_type}
		var required_owners: Array = objective.get("required_evidence_owners", [])
		var evidence_owner := str(evidence.get("source_owner", ""))
		if not required_owners.is_empty() and not required_owners.has(evidence_owner):
			return {"ok": false, "error": "quest.evidence_owner_mismatch",
				"evidence_owner": evidence_owner}
		var evidence_refs: Array = objective.get(
			"completion_evidence_refs", []).duplicate(true)
		if evidence_refs.has(evidence_ref):
			_store_transaction(transaction_id, request_hash, {
				"quest_id": quest_id, "duplicate": true})
			return {"ok": true, "duplicate": true,
				"quest": existing.duplicate(true), "quest_id": quest_id}
		evidence_refs.append(evidence_ref)
		objective["completion_evidence_refs"] = evidence_refs
		objective["status"] = str(payload.get("objective_status", "completed"))
		if str(objective.get("status", "")) not in VALID_OBJECTIVE_STATUSES:
			return {"ok": false, "error": "quest.invalid_objective_status"}
		objectives[index] = objective
		matched = true
		break
	if not matched:
		return {"ok": false, "error": "quest.objective_not_found",
			"objective_id": objective_id}
	candidate["objective_records"] = objectives
	candidate["evidence_refs"] = _append_unique_string(
		candidate.get("evidence_refs", []), evidence_ref)
	candidate = _advance_quest_graph(candidate, objective_id)
	candidate["status"] = _derive_quest_status(candidate)
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate, "quest.evidence")
	if not bool(transaction.get("ok", false)):
		return transaction
	_quests_by_id[quest_id] = transaction.get("record", {}).duplicate(true)
	quest_changed.emit(quest_id)
	return {"ok": true, "duplicate": false,
		"quest": _quests_by_id[quest_id].duplicate(true),
		"quest_id": quest_id,
		"evidence_id": str(transaction.get("evidence_id", ""))}


func transition_quest(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var quest_id := str(payload.get("quest_id", ""))
	if not _quests_by_id.has(quest_id):
		return {"ok": false, "error": "quest.not_found", "quest_id": quest_id}
	var existing: Dictionary = _quests_by_id[quest_id]
	var current_status := str(existing.get("status", ""))
	var next_status := str(payload.get("status", ""))
	if next_status not in VALID_QUEST_STATUSES:
		return {"ok": false, "error": "quest.invalid_status", "status": next_status}
	var transaction_id := str(payload.get("transaction_id",
		"quest.transition.%s.%s" % [quest_id, next_status]))
	var request_hash := _hash_value({"quest_id": quest_id,
		"to_status": next_status,
		"reason_ref": str(payload.get("reason_ref", ""))})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if next_status == current_status:
		return {"ok": true, "duplicate": true,
			"quest": existing.duplicate(true), "quest_id": quest_id}
	var allowed: Array = QUEST_STATUS_TRANSITIONS.get(current_status, [])
	if not allowed.has(next_status):
		return {"ok": false, "error": "quest.invalid_transition",
			"from_status": current_status, "to_status": next_status}
	var candidate := existing.duplicate(true)
	candidate["status"] = next_status
	var reason_ref := str(payload.get("reason_ref", ""))
	if next_status in ["failed", "expired", "abandoned", "superseded"] \
			and not reason_ref.is_empty():
		candidate["failure_reason_refs"] = _append_unique_string(
			candidate.get("failure_reason_refs", []), reason_ref)
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate, "quest.transition")
	if not bool(transaction.get("ok", false)):
		return transaction
	_quests_by_id[quest_id] = transaction.get("record", {}).duplicate(true)
	quest_changed.emit(quest_id)
	return {"ok": true, "duplicate": false,
		"quest": _quests_by_id[quest_id].duplicate(true), "quest_id": quest_id}


func choose_quest_branch(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var quest_id := str(payload.get("quest_id", ""))
	var branch_id := str(payload.get("branch_id", ""))
	if not _quests_by_id.has(quest_id):
		return {"ok": false, "error": "quest.not_found", "quest_id": quest_id}
	if branch_id.is_empty():
		return {"ok": false, "error": "quest.branch_required"}
	var existing: Dictionary = _quests_by_id[quest_id]
	var evidence_ref := str(payload.get("evidence_ref", ""))
	if not evidence_ref.is_empty() and not ProductionKernel.has_evidence(evidence_ref):
		return {"ok": false, "error": "quest.evidence_not_found",
			"evidence_ref": evidence_ref}
	var transaction_id := str(payload.get("transaction_id",
		"quest.branch.%s.%s" % [quest_id, branch_id]))
	var request_hash := _hash_value({"quest_id": quest_id,
		"branch_id": branch_id, "evidence_ref": evidence_ref})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	var current_stage_ref := str(existing.get("current_stage_ref", ""))
	var selected: Dictionary = {}
	var stages: Array = existing.get("stage_records", []).duplicate(true)
	var current_index := -1
	for index in stages.size():
		var stage: Dictionary = stages[index]
		if str(stage.get("stage_id", "")) != current_stage_ref:
			continue
		current_index = index
		for option_value in stage.get("branch_options", []):
			if option_value is Dictionary and str((option_value as Dictionary).get(
					"branch_id", "")) == branch_id:
				selected = (option_value as Dictionary).duplicate(true)
				break
		break
	if current_index < 0 or selected.is_empty():
		return {"ok": false, "error": "quest.branch_not_available",
			"branch_id": branch_id}
	var next_stage_ref := str(selected.get("next_stage_ref", ""))
	var next_index := _stage_index(stages, next_stage_ref)
	if next_index < 0:
		return {"ok": false, "error": "quest.branch_target_missing",
			"next_stage_ref": next_stage_ref}
	var current_stage: Dictionary = stages[current_index].duplicate(true)
	current_stage["status"] = "completed"
	stages[current_index] = current_stage
	var next_stage: Dictionary = stages[next_index].duplicate(true)
	next_stage["status"] = "active"
	stages[next_index] = next_stage
	var candidate := existing.duplicate(true)
	candidate["stage_records"] = stages
	candidate["current_stage_ref"] = next_stage_ref
	candidate["status"] = "active"
	var decisions: Array = candidate.get(
		"branch_decision_records", []).duplicate(true)
	decisions.append({"branch_id": branch_id,
		"from_stage_ref": current_stage_ref,
		"next_stage_ref": next_stage_ref,
		"evidence_ref": evidence_ref,
		"committed_tick": int(ProductionKernel.world_time_reference().get(
			"world_tick", 0))})
	candidate["branch_decision_records"] = decisions
	if not evidence_ref.is_empty():
		candidate["evidence_refs"] = _append_unique_string(
			candidate.get("evidence_refs", []), evidence_ref)
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate, "quest.branch")
	if not bool(transaction.get("ok", false)):
		return transaction
	_quests_by_id[quest_id] = transaction.get("record", {}).duplicate(true)
	quest_changed.emit(quest_id)
	return {"ok": true, "duplicate": false,
		"quest": _quests_by_id[quest_id].duplicate(true), "quest_id": quest_id}


func record_quest_contribution(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var quest_id := str(payload.get("quest_id", ""))
	var contribution_id := str(payload.get("contribution_id", ""))
	if not _quests_by_id.has(quest_id):
		return {"ok": false, "error": "quest.not_found", "quest_id": quest_id}
	if contribution_id.is_empty():
		return {"ok": false, "error": "quest.contribution_id_required"}
	var binding := {"kind": str(payload.get("contributor_kind", "")),
		"ref": str(payload.get("contributor_ref", ""))}
	var binding_validation := _validate_identity_bindings([binding], true, false)
	if not bool(binding_validation.get("ok", false)):
		return binding_validation
	var evidence_refs := _string_array(payload.get("evidence_refs", []))
	for evidence_ref in evidence_refs:
		if not ProductionKernel.has_evidence(evidence_ref):
			return {"ok": false, "error": "quest.evidence_not_found",
				"evidence_ref": evidence_ref}
	var transaction_id := str(payload.get("transaction_id",
		"quest.contribution.%s.%s" % [quest_id, contribution_id]))
	var request_hash := _hash_value({"quest_id": quest_id,
		"contribution_id": contribution_id, "binding": binding,
		"type": str(payload.get("contribution_type", "evidence")),
		"evidence_refs": evidence_refs})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	var candidate: Dictionary = _quests_by_id[quest_id].duplicate(true)
	var contributions: Array = candidate.get(
		"contribution_records", []).duplicate(true)
	for value in contributions:
		if value is Dictionary and str((value as Dictionary).get(
				"contribution_id", "")) == contribution_id:
			return {"ok": false, "error": "quest.contribution_conflict",
				"contribution_id": contribution_id}
	contributions.append({
		"contribution_id": contribution_id,
		"contributor_binding": binding,
		"contribution_type": str(payload.get("contribution_type", "evidence")),
		"evidence_refs": evidence_refs,
		"significance_band": str(payload.get("significance_band", "minor")),
		"committed_tick": int(ProductionKernel.world_time_reference().get(
			"world_tick", 0)),
	})
	candidate["contribution_records"] = contributions
	for evidence_ref in evidence_refs:
		candidate["evidence_refs"] = _append_unique_string(
			candidate.get("evidence_refs", []), evidence_ref)
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate, "quest.contribution")
	if not bool(transaction.get("ok", false)):
		return transaction
	_quests_by_id[quest_id] = transaction.get("record", {}).duplicate(true)
	quest_changed.emit(quest_id)
	return {"ok": true, "duplicate": false,
		"quest": _quests_by_id[quest_id].duplicate(true), "quest_id": quest_id}


func transition_reward_claim(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var quest_id := str(payload.get("quest_id", ""))
	if not _quests_by_id.has(quest_id):
		return {"ok": false, "error": "quest.not_found", "quest_id": quest_id}
	var existing: Dictionary = _quests_by_id[quest_id]
	if str(existing.get("status", "")) != "completed":
		return {"ok": false, "error": "quest.reward_not_available"}
	var current_state := str(existing.get("reward_claim_state", "unclaimed"))
	var next_state := str(payload.get("reward_claim_state", ""))
	if next_state not in VALID_REWARD_CLAIM_STATES:
		return {"ok": false, "error": "quest.invalid_reward_claim_state",
			"reward_claim_state": next_state}
	var evidence_refs := _string_array(payload.get("evidence_refs", []))
	var transaction_id := str(payload.get("transaction_id",
		"quest.reward.%s.%s" % [quest_id, next_state]))
	var request_hash := _hash_value({"quest_id": quest_id,
		"to_state": next_state,
		"evidence_refs": evidence_refs})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if next_state == current_state:
		return {"ok": true, "duplicate": true,
			"quest": existing.duplicate(true), "quest_id": quest_id}
	var allowed: Array = REWARD_CLAIM_TRANSITIONS.get(current_state, [])
	if not allowed.has(next_state):
		return {"ok": false, "error": "quest.invalid_reward_transition",
			"from_state": current_state, "to_state": next_state}
	if next_state in ["claimed", "partially_claimed"] and evidence_refs.is_empty():
		return {"ok": false, "error": "quest.reward_evidence_required"}
	for evidence_ref in evidence_refs:
		if not ProductionKernel.has_evidence(evidence_ref):
			return {"ok": false, "error": "quest.evidence_not_found",
				"evidence_ref": evidence_ref}
	var candidate := existing.duplicate(true)
	candidate["reward_claim_state"] = next_state
	for evidence_ref in evidence_refs:
		candidate["evidence_refs"] = _append_unique_string(
			candidate.get("evidence_refs", []), evidence_ref)
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate, "quest.reward")
	if not bool(transaction.get("ok", false)):
		return transaction
	_quests_by_id[quest_id] = transaction.get("record", {}).duplicate(true)
	quest_changed.emit(quest_id)
	return {"ok": true, "duplicate": false,
		"quest": _quests_by_id[quest_id].duplicate(true), "quest_id": quest_id}


func advance_event_phase(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var event_id := str(payload.get("event_id", ""))
	if not _events_by_id.has(event_id):
		return {"ok": false, "error": "event.not_found", "event_id": event_id}
	var existing: Dictionary = _events_by_id[event_id]
	var current_phase := str(existing.get("phase", ""))
	var next_phase := str(payload.get("phase", ""))
	if next_phase not in VALID_EVENT_PHASES:
		return {"ok": false, "error": "event.invalid_phase", "phase": next_phase}
	var transaction_id := str(payload.get("transaction_id",
		"event.phase.%s.%s" % [event_id, next_phase]))
	var request_hash := _hash_value({"event_id": event_id,
		"to_phase": next_phase,
		"outcome_ref": str(payload.get("outcome_ref", "")),
		"aftermath_refs": _string_array(payload.get("aftermath_refs", [])),
		"metadata": _dict_value(payload.get("metadata", {})),
		"history_id": str(payload.get(
			"history_id", "history.%s.%s" % [event_id, next_phase])),
		"title": str(payload.get("title", "")),
		"summary": str(payload.get("summary", "")),
	})
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if next_phase == current_phase:
		return {"ok": true, "duplicate": true,
			"event": existing.duplicate(true), "event_id": event_id}
	var allowed: Array = EVENT_PHASE_TRANSITIONS.get(current_phase, [])
	if not allowed.has(next_phase):
		return {"ok": false, "error": "event.invalid_phase_transition",
			"from_phase": current_phase, "to_phase": next_phase}
	var candidate := existing.duplicate(true)
	candidate["phase"] = next_phase
	candidate["metadata"] = _merge_dict(
		candidate.get("metadata", {}), payload.get("metadata", {}))
	candidate["outcome_ref"] = str(payload.get(
		"outcome_ref", candidate.get("outcome_ref", "")))
	for aftermath_ref in _string_array(payload.get("aftermath_refs", [])):
		candidate["aftermath_refs"] = _append_unique_string(
			candidate.get("aftermath_refs", []), aftermath_ref)
	if next_phase in ["resolution", "aftermath", "historical"]:
		candidate["status"] = "resolved" if next_phase != "historical" else "archived"
	candidate["revision"] = int(candidate.get("revision", 0)) + 1
	var history_preflight := _prepare_event_history(payload, candidate, next_phase)
	if not bool(history_preflight.get("ok", false)):
		return history_preflight
	var history_record: Dictionary = history_preflight.get("record", {})
	var history_id := str(history_preflight.get("history_id", ""))
	if not history_id.is_empty():
		candidate["history_entry_refs"] = _append_unique_string(
			candidate.get("history_entry_refs", []), history_id)
	candidate["state_hash"] = _record_hash(candidate)
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate, "event.phase")
	if not bool(transaction.get("ok", false)):
		return transaction
	_events_by_id[event_id] = transaction.get("record", {}).duplicate(true)
	if not history_record.is_empty():
		_commit_history_record(history_record)
	_store_transaction(transaction_id, request_hash, {"event_id": event_id,
		"history_id": history_id, "duplicate": false})
	event_changed.emit(event_id)
	_process_event_for_quests(event_id)
	return {"ok": true, "duplicate": false,
		"event": _events_by_id[event_id].duplicate(true),
		"event_id": event_id, "history_id": history_id,
		"evidence_id": str(transaction.get("evidence_id", ""))}


func import_legacy_combat_history(history: Array, settlement_ref: String = "",
		raid_serial: int = 0) -> Dictionary:
	_ensure_initialized({})
	var imported := 0
	for index in history.size():
		if not (history[index] is Dictionary):
			continue
		var entry: Dictionary = (history[index] as Dictionary).duplicate(true)
		var kind := str(entry.get("kind", "legacy"))
		var event_id := "legacy.raid.%s.%03d.%s.%d" % [
			settlement_ref if not settlement_ref.is_empty() else "world",
			raid_serial, kind, index,
		]
		var result := register_event({
			"event_id": event_id,
			"transaction_id": "legacy.import.combat.%s" % event_id,
			"definition_ref": "legacy.event.raid.%s" % kind,
			"event_family": "raid",
			"event_type": kind,
			"status": "resolved" if kind == "resolved" else "archived",
			"settlement_ref": settlement_ref,
			"metadata": {
				"legacy_import": true,
				"legacy_kind": kind,
				"facts": entry.get("facts", {}).duplicate(true),
				"day": int(entry.get("day", 0)),
				"minute": float(entry.get("minute", 0.0)),
			},
			"history_id": "history.%s" % event_id,
			"history_kind": "raid",
			"title": "Legacy raid %s" % kind,
			"summary": "Imported legacy raid history entry for %s." % kind,
			"record_history": true,
		})
		if bool(result.get("ok", false)):
			imported += 1
	return {"ok": true, "imported": imported}


func import_legacy_history_entry(payload: Dictionary) -> Dictionary:
	_ensure_initialized(payload)
	var history_id := str(payload.get("history_id", ""))
	if history_id.is_empty():
		return {"ok": false, "error": "history.id_required"}
	var candidate := payload.duplicate(true)
	candidate["metadata"] = _merge_dict(
		candidate.get("metadata", {}), {"legacy_import": true})
	return _record_history_internal(candidate, false)


func serialize_state() -> Dictionary:
	var events: Array = []
	for event_id in event_ids():
		events.append((_events_by_id[event_id] as Dictionary).duplicate(true))
	var quests: Array = []
	for quest_id in quest_ids():
		quests.append((_quests_by_id[quest_id] as Dictionary).duplicate(true))
	var history: Array = []
	for history_id in _history_order:
		history.append((_history_by_id.get(history_id, {}) as Dictionary).duplicate(true))
	var transactions: Array = []
	var transaction_ids: Array = []
	for transaction_id in _transactions_by_id.keys():
		transaction_ids.append(str(transaction_id))
	transaction_ids.sort()
	for transaction_id in transaction_ids:
		transactions.append((_transactions_by_id[transaction_id] as Dictionary).duplicate(true))
	var data := {
		"schema": STATE_SCHEMA,
		"version": STATE_VERSION,
		"interface_id": INTERFACE_ID,
		"interface_version": INTERFACE_VERSION,
		"world_seed": world_seed,
		"world_id": world_id,
		"events": events,
		"quests": quests,
		"history": history,
		"transactions": transactions,
		"archived_history_count": _archived_history_count,
		"archived_history_hash": _archived_history_hash,
		"state_hash": "",
	}
	data["state_hash"] = _state_hash(data)
	return data


func restore_state(value: Variant, expected_seed: int,
		expected_world_id: String = "",
		expected_settlement_refs: Array[String] = []) -> bool:
	if not (value is Dictionary):
		return false
	var data: Dictionary = value
	var source_version := int(data.get("version", 0))
	if str(data.get("schema", "")) != STATE_SCHEMA \
			or source_version not in [LEGACY_STATE_VERSION, STATE_VERSION]:
		return false
	if int(data.get("world_seed", -1)) != expected_seed:
		return false
	if not expected_world_id.is_empty() and str(data.get(
			"world_id", "")) != expected_world_id:
		return false
	if str(data.get("state_hash", "")) != _state_hash(data):
		return false
	for field in ["events", "quests", "history", "transactions"]:
		if not (data.get(field, []) is Array):
			return false
	var candidate_events: Dictionary = {}
	var candidate_quests: Dictionary = {}
	var candidate_history: Dictionary = {}
	var candidate_history_order: Array[String] = []
	var candidate_transactions: Dictionary = {}
	for event_value in data.get("events", []):
		if not (event_value is Dictionary):
			return false
		var event_record: Dictionary = (event_value as Dictionary).duplicate(true)
		if str(event_record.get("state_hash", "")) != _record_hash(event_record):
			return false
		event_record = _migrate_event_record(event_record, source_version)
		if not bool(_validate_event_payload(event_record, false).get("ok", false)):
			return false
		var event_id := str(event_record.get("event_id", ""))
		if event_id.is_empty() or candidate_events.has(event_id) \
				or int(event_record.get("world_seed", -1)) != expected_seed \
				or str(event_record.get("world_id", "")) != str(data.get("world_id", "")):
			return false
		candidate_events[event_id] = event_record
	for quest_value in data.get("quests", []):
		if not (quest_value is Dictionary):
			return false
		var quest_record: Dictionary = (quest_value as Dictionary).duplicate(true)
		if str(quest_record.get("state_hash", "")) != _record_hash(quest_record):
			return false
		quest_record = _migrate_quest_record(quest_record, source_version)
		if not bool(_validate_quest_payload(quest_record, false).get("ok", false)):
			return false
		var quest_id := str(quest_record.get("quest_id", ""))
		if quest_id.is_empty() or candidate_quests.has(quest_id):
			return false
		candidate_quests[quest_id] = quest_record
	for history_value in data.get("history", []):
		if not (history_value is Dictionary):
			return false
		var history_record: Dictionary = (history_value as Dictionary).duplicate(true)
		if str(history_record.get("state_hash", "")) != _record_hash(history_record):
			return false
		history_record = _migrate_history_record(history_record, source_version)
		if not bool(_validate_history_payload(history_record, false).get("ok", false)):
			return false
		var history_id := str(history_record.get("history_id", ""))
		if history_id.is_empty() or candidate_history.has(history_id) \
				or str(history_record.get("world_ref", "")) != str(data.get(
					"world_id", "")):
			return false
		candidate_history[history_id] = history_record
		candidate_history_order.append(history_id)
	for transaction_value in data.get("transactions", []):
		if not (transaction_value is Dictionary):
			return false
		var transaction: Dictionary = (transaction_value as Dictionary).duplicate(true)
		var transaction_id := str(transaction.get("transaction_id", ""))
		if transaction_id.is_empty() or candidate_transactions.has(transaction_id) \
				or not _is_sha256(str(transaction.get("request_hash", ""))):
			return false
		candidate_transactions[transaction_id] = transaction
	if not _validate_restored_references(
			candidate_events, candidate_quests, candidate_history,
			candidate_transactions, expected_settlement_refs):
		return false
	var archived_count := int(data.get("archived_history_count", 0))
	var archived_hash := str(data.get("archived_history_hash", ""))
	if candidate_history_order.size() > MAX_HISTORY_ENTRIES or archived_count < 0 \
			or (archived_count == 0 and not archived_hash.is_empty()) \
			or (archived_count > 0 and not _is_sha256(archived_hash)):
		return false
	initialized = true
	restored_from_state = true
	world_seed = expected_seed
	world_id = str(data.get("world_id", ""))
	_events_by_id = candidate_events
	_quests_by_id = candidate_quests
	_history_by_id = candidate_history
	_history_order = candidate_history_order
	_transactions_by_id = candidate_transactions
	_archived_history_count = archived_count
	_archived_history_hash = archived_hash
	return true


func _prepare_event_history(payload: Dictionary, event_record: Dictionary,
		action_token: String) -> Dictionary:
	if not bool(payload.get("record_history", true)):
		return {"ok": true, "history_id": "", "record": {}}
	var event_id := str(event_record.get("event_id", ""))
	var history_payload := {
		"history_id": str(payload.get("history_id",
			"history.%s.%s" % [event_id, action_token])),
		"kind": str(payload.get("history_kind",
			event_record.get("event_family", "event"))),
		"title": str(payload.get("title",
			event_record.get("event_type", "Event"))),
		"summary": str(payload.get("summary",
			"Event %s recorded %s." % [event_id, action_token])),
		"event_ref": event_id,
		"consequence_refs": (event_record.get(
			"consequence_refs", []) as Array).duplicate(true),
		"settlement_ref": str(event_record.get("settlement_ref", "")),
		"world_ref": world_id,
		"time_ref": event_record.get("time_ref", {}).duplicate(true),
		"tags": [str(event_record.get("event_family", "event")), action_token],
		"metadata": payload.get("metadata", {}).duplicate(true),
	}
	var history_record := _make_history_record(history_payload)
	var history_id := str(history_record.get("history_id", ""))
	if history_id.is_empty():
		return {"ok": false, "error": "history.id_required"}
	if _history_by_id.has(history_id):
		var existing: Dictionary = _history_by_id[history_id]
		for field in ["event_ref", "kind", "title", "summary"]:
			if str(existing.get(field, "")) != str(history_record.get(field, "")):
				return {"ok": false, "error": "history.conflict",
					"history_id": history_id}
		if str(existing.get("world_ref", "")) != str(history_record.get(
				"world_ref", "")):
			return {"ok": false, "error": "history.conflict",
				"history_id": history_id}
		history_record = existing.duplicate(true)
	return {"ok": true, "history_id": history_id, "record": history_record}


func _commit_history_record(history_record: Dictionary) -> void:
	var history_id := str(history_record.get("history_id", ""))
	if history_id.is_empty():
		return
	_history_by_id[history_id] = history_record.duplicate(true)
	if not _history_order.has(history_id):
		_history_order.append(history_id)
	while _history_order.size() > MAX_HISTORY_ENTRIES:
		var archived_id: String = _history_order.pop_front()
		var archived: Dictionary = _history_by_id.get(archived_id, {})
		_archived_history_hash = _hash_value({
			"previous_hash": _archived_history_hash,
			"history": archived,
		})
		_archived_history_count += 1
		_history_by_id.erase(archived_id)
		_remove_history_ref(archived_id)
	history_changed.emit(history_id)


func _remove_history_ref(history_id: String) -> void:
	for event_id in _events_by_id.keys():
		var event_record: Dictionary = _events_by_id[event_id]
		var refs: Array = event_record.get("history_entry_refs", []).duplicate(true)
		if refs.has(history_id):
			refs.erase(history_id)
			event_record["history_entry_refs"] = refs
			event_record["state_hash"] = _record_hash(event_record)
			_events_by_id[event_id] = event_record
	for quest_id in _quests_by_id.keys():
		var quest_record: Dictionary = _quests_by_id[quest_id]
		var refs: Array = quest_record.get("history_entry_refs", []).duplicate(true)
		if refs.has(history_id):
			refs.erase(history_id)
			quest_record["history_entry_refs"] = refs
			quest_record["state_hash"] = _record_hash(quest_record)
			_quests_by_id[quest_id] = quest_record
	for transaction_id in _transactions_by_id.keys():
		var transaction: Dictionary = _transactions_by_id[transaction_id]
		if str(transaction.get("history_id", "")) == history_id:
			transaction["history_id"] = ""
			_transactions_by_id[transaction_id] = transaction


func _record_history_internal(payload: Dictionary,
		append_to_event: bool) -> Dictionary:
	var history_id := str(payload.get("history_id", ""))
	if history_id.is_empty():
		return {"ok": false, "error": "history.id_required"}
	var payload_validation := _validate_history_payload(payload, true)
	if not bool(payload_validation.get("ok", false)):
		return payload_validation
	var event_ref := str(payload.get("event_ref", ""))
	if not event_ref.is_empty() and not _events_by_id.has(event_ref):
		return {"ok": false, "error": "history.event_not_found",
			"event_ref": event_ref}
	var settlement_ref := str(payload.get("settlement_ref", ""))
	if not settlement_ref.is_empty() \
			and not _identity_exists("settlement", settlement_ref, false):
		return {"ok": false, "error": "event.identity_not_found",
			"kind": "settlement", "ref": settlement_ref}
	var transaction_id := str(payload.get(
		"transaction_id", "history.record.%s" % history_id))
	var candidate := _make_history_record(payload)
	var request_hash := _hash_value(_history_request_payload(candidate))
	var duplicate := _transaction_duplicate(transaction_id, request_hash)
	if not duplicate.is_empty():
		return duplicate
	if _history_by_id.has(history_id):
		var existing: Dictionary = _history_by_id[history_id]
		if _record_hash(existing) == _record_hash(candidate):
			_store_transaction(transaction_id, request_hash, {
				"history_id": history_id,
				"duplicate": true,
			})
			return {"ok": true, "duplicate": true,
				"history": existing.duplicate(true), "history_id": history_id}
		return {"ok": false, "error": "history.conflict", "history_id": history_id}
	var transaction := _open_transaction(
		transaction_id, request_hash, payload, candidate,
		"history.%s" % str(candidate.get("kind", "entry")))
	if not bool(transaction.get("ok", false)):
		return transaction
	_commit_history_record(transaction.get("record", {}).duplicate(true))
	if append_to_event:
		if _events_by_id.has(event_ref):
			var event_record: Dictionary = _events_by_id[event_ref].duplicate(true)
			var refs: Array = event_record.get("history_entry_refs", []).duplicate(true)
			if not refs.has(history_id):
				refs.append(history_id)
				event_record["history_entry_refs"] = refs
				event_record["state_hash"] = _record_hash(event_record)
				_events_by_id[event_ref] = event_record
	return {
		"ok": true,
		"duplicate": false,
		"history": _history_by_id[history_id].duplicate(true),
		"history_id": history_id,
		"evidence_id": str(transaction.get("evidence_id", "")),
	}


func _validate_history_payload(payload: Dictionary,
		resolve_identities: bool) -> Dictionary:
	for field in ["tags"]:
		var validation := _validate_string_array_field(
			payload, field, "history.invalid_%s" % field)
		if not bool(validation.get("ok", false)):
			return validation
	for field in ["time_ref", "metadata"]:
		if payload.has(field) and not (payload.get(field) is Dictionary):
			return {"ok": false, "error": "history.invalid_%s" % field}
	if payload.has("consequence_refs"):
		var consequences: Variant = payload.get("consequence_refs")
		if not (consequences is Array):
			return {"ok": false, "error": "history.invalid_consequence_refs"}
		for consequence_value in consequences:
			if not (consequence_value is Dictionary) or str(
					((consequence_value as Dictionary).get(
						"consequence_ref", ""))).is_empty():
				return {"ok": false, "error": "history.invalid_consequence_refs"}
			if resolve_identities and not bool(_validate_consequence_binding(
					consequence_value).get("ok", false)):
				return {"ok": false, "error": "history.invalid_consequence_refs"}
	return {"ok": true}


func _open_transaction(transaction_id: String, request_hash: String,
		payload: Dictionary, record: Dictionary, event_type: String) -> Dictionary:
	var evidence_id := str(payload.get(
		"evidence_id", "evidence.%s" % transaction_id.replace(" ", "_")))
	var envelope := ProductionKernel.make_evidence_envelope(
		evidence_id,
		EVIDENCE_OWNER,
		event_type,
		request_hash,
		str(payload.get("correlation_id", transaction_id)))
	var publication_id := str(payload.get("publication_id", transaction_id))
	if publication_id.is_empty():
		publication_id = transaction_id
	var committed := ProductionKernel.commit_event_transaction_bundle({
		"evidence": envelope,
		"transaction_id": transaction_id,
		"owner": EVIDENCE_OWNER,
		"payload_hash": request_hash,
		"publication_id": publication_id,
		"event_type": event_type,
		"authority": _authority_context(),
	})
	if not bool(committed.get("ok", false)):
		var error := str(committed.get("error", ""))
		if error in ["transaction_exists", "transaction_commit_conflict"]:
			return {"ok": false, "error": "event.transaction_conflict",
				"transaction_id": transaction_id}
		return committed
	_store_transaction(transaction_id, request_hash, {
		"event_id": str(record.get("event_id", "")),
		"quest_id": str(record.get("quest_id", "")),
		"history_id": str(record.get("history_id", "")),
		"duplicate": false,
	})
	return {
		"ok": true,
		"record": record.duplicate(true),
		"evidence_id": evidence_id,
	}


func _transaction_duplicate(transaction_id: String,
		request_hash: String) -> Dictionary:
	if not _transactions_by_id.has(transaction_id):
		return {}
	var existing: Dictionary = _transactions_by_id[transaction_id]
	if str(existing.get("request_hash", "")) != request_hash:
		return {"ok": false, "error": "event.transaction_conflict",
			"transaction_id": transaction_id}
	var event_id := str(existing.get("event_id", ""))
	var quest_id := str(existing.get("quest_id", ""))
	var history_id := str(existing.get("history_id", ""))
	return {
		"ok": true,
		"duplicate": true,
		"event": get_event(event_id),
		"event_id": event_id,
		"quest": get_quest(quest_id),
		"quest_id": quest_id,
		"history": (_history_by_id.get(history_id, {}) as Dictionary).duplicate(true),
		"history_id": history_id,
	}


func _store_transaction(transaction_id: String, request_hash: String,
		result: Dictionary) -> void:
	_transactions_by_id[transaction_id] = {
		"transaction_id": transaction_id,
		"request_hash": request_hash,
		"event_id": str(result.get("event_id", "")),
		"quest_id": str(result.get("quest_id", "")),
		"history_id": str(result.get("history_id", "")),
		"duplicate": bool(result.get("duplicate", false)),
	}


func _make_event_record(payload: Dictionary) -> Dictionary:
	var event_id := str(payload.get("event_id", ""))
	var status := str(payload.get("status", "active"))
	var metadata := _dict_value(payload.get("metadata", {}))
	var requested_phase := str(payload.get("phase", metadata.get("phase", "")))
	if requested_phase not in VALID_EVENT_PHASES:
		requested_phase = "historical" if status == "archived" else (
			"resolution" if status == "resolved" else "initiation")
	var event_record := {
		"record_type": "EventRecord",
		"version": STATE_VERSION,
		"event_id": event_id,
		"definition_ref": str(payload.get("definition_ref", "")),
		"definition_revision": maxi(1, int(payload.get("definition_revision", 1))),
		"atlas_foundation_ref": str(payload.get("atlas_foundation_ref", "")),
		"source_arc_ref": str(payload.get("source_arc_ref", "")),
		"event_family": str(payload.get("event_family", "event")),
		"event_type": str(payload.get("event_type", payload.get(
			"history_kind", "event"))),
		"status": status,
		"phase": requested_phase,
		"severity_band": str(payload.get("severity_band", "local")),
		"escalation_state": str(payload.get("escalation_state", "stable")),
		"source_owner": str(payload.get("source_owner", EVIDENCE_OWNER)),
		"world_seed": world_seed,
		"world_id": world_id,
		"settlement_ref": str(payload.get("settlement_ref", "")),
		"structure_refs": _string_array(payload.get("structure_refs", [])),
		"participant_refs": _string_array(payload.get("participant_refs", [])),
		"identity_bindings": _event_identity_bindings(payload),
		"location": _dict_value(payload.get("location", {})),
		"time_ref": _dict_value(payload.get(
			"time_ref", ProductionKernel.world_time_reference())),
		"source_evidence_refs": _string_array(payload.get("source_evidence_refs", [])),
		"evidence_predicates": _string_array(payload.get("evidence_predicates", [])),
		"intervention_refs": _string_array(payload.get("intervention_refs", [])),
		"contribution_refs": _string_array(payload.get("contribution_refs", [])),
		"generated_quest_refs": _string_array(payload.get("generated_quest_refs", [])),
		"consequence_refs": _dict_array(payload.get("consequence_refs", [])),
		"aftermath_refs": _string_array(payload.get("aftermath_refs", [])),
		"outcome_ref": str(payload.get("outcome_ref", "")),
		"history_entry_refs": _string_array(payload.get("history_entry_refs", [])),
		"lod_state": str(payload.get("lod_state", "E0")),
		"metadata": metadata,
		"migration_revision": maxi(1, int(payload.get("migration_revision", 1))),
		"revision": int(payload.get("revision", 1)),
		"created_tick": int(ProductionKernel.world_time_reference().get("world_tick", 0)),
		"updated_tick": int(ProductionKernel.world_time_reference().get("world_tick", 0)),
		"state_hash": "",
	}
	event_record["state_hash"] = _record_hash(event_record)
	return event_record


func _make_quest_record(payload: Dictionary) -> Dictionary:
	var status := str(payload.get("status", "offered"))
	var definition_ref := str(payload.get(
		"definition_ref", payload.get("template_id", "")))
	var objectives := _quest_objectives(payload.get("objective_records", []))
	var stages := _quest_stages(payload.get("stage_records", []), objectives)
	var current_stage_ref := str(payload.get("current_stage_ref", ""))
	if current_stage_ref.is_empty() and not stages.is_empty():
		current_stage_ref = str((stages[0] as Dictionary).get("stage_id", ""))
	var quest := {
		"record_type": "QuestRecord",
		"version": STATE_VERSION,
		"quest_id": str(payload.get("quest_id", "")),
		"template_id": definition_ref,
		"definition_ref": definition_ref,
		"definition_revision": maxi(1, int(payload.get("definition_revision", 1))),
		"source_arc_ref": str(payload.get("source_arc_ref", "")),
		"source_event_ref": str(payload.get("source_event_ref", "")),
		"status": status,
		"owner_scope_ref": str(payload.get("owner_scope_ref", "")),
		"participant_refs": _string_array(payload.get("participant_refs", [])),
		"identity_bindings": _quest_identity_bindings(payload),
		"objective_records": objectives,
		"stage_records": stages,
		"current_stage_ref": current_stage_ref,
		"branch_decision_records": _dict_array(payload.get(
			"branch_decision_records", [])),
		"evidence_refs": _string_array(payload.get("evidence_refs", [])),
		"contribution_records": _dict_array(payload.get("contribution_records", [])),
		"required_event_refs": _string_array(payload.get("required_event_refs", [])),
		"history_entry_refs": _string_array(payload.get("history_entry_refs", [])),
		"failure_reason_refs": _string_array(payload.get("failure_reason_refs", [])),
		"reward_claim_state": str(payload.get("reward_claim_state", "unclaimed")),
		"aftermath_refs": _string_array(payload.get("aftermath_refs", [])),
		"deadline_tick": int(payload.get("deadline_tick", -1)),
		"lod_state": str(payload.get("lod_state", "Q0")),
		"migration_revision": maxi(1, int(payload.get("migration_revision", 1))),
		"revision": int(payload.get("revision", 1)),
		"state_hash": "",
	}
	quest["state_hash"] = _record_hash(quest)
	return quest


func _make_history_record(payload: Dictionary) -> Dictionary:
	var history := {
		"record_type": "HistoryEntry",
		"version": STATE_VERSION,
		"history_id": str(payload.get("history_id", "")),
		"kind": str(payload.get("kind", "event")),
		"title": str(payload.get("title", "History Entry")),
		"summary": str(payload.get("summary", "")),
		"event_ref": str(payload.get("event_ref", "")),
		"consequence_refs": _dict_array(payload.get("consequence_refs", [])),
		"settlement_ref": str(payload.get("settlement_ref", "")),
		"world_ref": str(payload.get("world_ref", world_id)),
		"time_ref": _dict_value(payload.get(
			"time_ref", ProductionKernel.world_time_reference())),
		"tags": _string_array(payload.get("tags", [])),
		"metadata": _dict_value(payload.get("metadata", {})),
		"state_hash": "",
	}
	history["state_hash"] = _record_hash(history)
	return history


func _derive_quest_status(quest: Dictionary) -> String:
	var objectives: Array = quest.get("objective_records", [])
	if objectives.is_empty():
		return str(quest.get("status", "active"))
	var stages: Array = quest.get("stage_records", [])
	var current_stage_ref := str(quest.get("current_stage_ref", ""))
	var current_stage_index := _stage_index(stages, current_stage_ref)
	if current_stage_index >= 0:
		var current_stage: Dictionary = stages[current_stage_index]
		var stage_status := str(current_stage.get("status", "active"))
		if stage_status == "failed":
			return "failed"
		if stage_status == "blocked":
			return "blocked"
		if stage_status == "branch_pending":
			return "branch_pending"
		if stage_status == "completed" \
				and (current_stage.get("next_stage_refs", []) as Array).is_empty():
			return "completed"
		var current_objective_refs: Array = current_stage.get("objective_refs", [])
		var current_blocked := false
		var current_completed := true
		for objective_value in objectives:
			if not (objective_value is Dictionary) or not current_objective_refs.has(
					str((objective_value as Dictionary).get("objective_id", ""))):
				continue
			var objective_status := str((objective_value as Dictionary).get(
				"status", "active"))
			if objective_status == "failed":
				return "failed"
			current_blocked = current_blocked or objective_status == "blocked"
			current_completed = current_completed and objective_status == "completed"
		if current_blocked:
			return "blocked"
		if not current_completed:
			return "active"
	var has_blocked := false
	for objective_value in objectives:
		if not (objective_value is Dictionary):
			continue
		var objective_status := str((objective_value as Dictionary).get(
			"status", "active"))
		if objective_status == "failed":
			return "failed"
		if objective_status == "blocked":
			has_blocked = true
		elif objective_status != "completed":
			return "active"
	if has_blocked:
		return "blocked"
	for stage_value in stages:
		if stage_value is Dictionary and str((stage_value as Dictionary).get(
				"status", "")) == "branch_pending":
			return "branch_pending"
	return "completed"


func _quest_objectives(values: Array) -> Array:
	var result: Array = []
	for value in values:
		if not (value is Dictionary):
			continue
		var objective: Dictionary = (value as Dictionary).duplicate(true)
		objective["objective_id"] = str(objective.get("objective_id", ""))
		objective["kind"] = str(objective.get("kind", "generic"))
		objective["status"] = str(objective.get("status", "active"))
		objective["required_predicates"] = _string_array(
			objective.get("required_predicates", []))
		objective["required_event_families"] = _string_array(
			objective.get("required_event_families", []))
		objective["required_evidence_types"] = _string_array(
			objective.get("required_evidence_types", []))
		objective["required_evidence_owners"] = _string_array(
			objective.get("required_evidence_owners", []))
		objective["completion_event_refs"] = _string_array(
			objective.get("completion_event_refs", []))
		objective["completion_evidence_refs"] = _string_array(
			objective.get("completion_evidence_refs", []))
		objective["stage_ref"] = str(objective.get("stage_ref", ""))
		objective["target_bindings"] = _normalise_bindings(
			objective.get("target_bindings", []))
		objective["blocking_reason"] = str(objective.get("blocking_reason", ""))
		result.append(objective)
	return result


func _quest_stages(values: Array, objectives: Array) -> Array:
	var result: Array = []
	if values.is_empty() and not objectives.is_empty():
		var objective_refs: Array[String] = []
		for objective_value in objectives:
			if objective_value is Dictionary:
				var objective_id := str((objective_value as Dictionary).get(
					"objective_id", ""))
				if not objective_id.is_empty():
					objective_refs.append(objective_id)
		result.append({
			"stage_id": "stage.default",
			"status": "active",
			"objective_refs": objective_refs,
			"next_stage_refs": [],
			"branch_options": [],
		})
		for index in objectives.size():
			var objective: Dictionary = objectives[index]
			if str(objective.get("stage_ref", "")).is_empty():
				objective["stage_ref"] = "stage.default"
				objectives[index] = objective
		return result
	for value in values:
		if not (value is Dictionary):
			continue
		var stage: Dictionary = (value as Dictionary).duplicate(true)
		stage["stage_id"] = str(stage.get("stage_id", ""))
		stage["status"] = str(stage.get("status", "locked"))
		stage["objective_refs"] = _string_array(stage.get("objective_refs", []))
		stage["next_stage_refs"] = _string_array(stage.get("next_stage_refs", []))
		stage["branch_options"] = _dict_array(stage.get("branch_options", []))
		result.append(stage)
	return result


func _validate_event_payload(payload: Dictionary,
		resolve_identities: bool = false) -> Dictionary:
	var status := str(payload.get("status", "active"))
	if status not in VALID_EVENT_STATUSES:
		return {"ok": false, "error": "event.invalid_status", "status": status}
	if str(payload.get("definition_ref", "")).is_empty() \
			and not bool(_dict_value(payload.get("metadata", {})).get(
				"legacy_import", false)):
		return {"ok": false, "error": "event.definition_ref_required"}
	if payload.has("phase") and str(payload.get("phase", "")) not in VALID_EVENT_PHASES:
		return {"ok": false, "error": "event.invalid_phase",
			"phase": str(payload.get("phase", ""))}
	if int(payload.get("definition_revision", 1)) < 1:
		return {"ok": false, "error": "event.invalid_definition_revision"}
	if str(payload.get("lod_state", "E0")) not in ["E0", "E1", "E2", "E3"]:
		return {"ok": false, "error": "event.invalid_lod_state"}
	for field in [
		"structure_refs", "participant_refs", "source_evidence_refs",
		"history_entry_refs", "evidence_predicates", "intervention_refs",
		"contribution_refs", "generated_quest_refs", "aftermath_refs",
	]:
		var validation := _validate_string_array_field(
			payload, field, "event.invalid_%s" % field)
		if not bool(validation.get("ok", false)):
			return validation
	if payload.has("consequence_refs"):
		var consequences: Variant = payload.get("consequence_refs")
		if not (consequences is Array):
			return {"ok": false, "error": "event.invalid_consequence_refs"}
		for consequence_value in consequences:
			if not (consequence_value is Dictionary) or str(
					(consequence_value as Dictionary).get(
						"consequence_ref", "")).strip_edges().is_empty():
				return {"ok": false, "error": "event.invalid_consequence_refs"}
			if resolve_identities:
				var consequence_validation := _validate_consequence_binding(
					consequence_value)
				if not bool(consequence_validation.get("ok", false)):
					return consequence_validation
	for field in ["location", "time_ref", "metadata"]:
		if payload.has(field) and not (payload.get(field) is Dictionary):
			return {"ok": false, "error": "event.invalid_%s" % field}
	var bindings := _event_identity_bindings(payload)
	var allow_legacy := str(payload.get("settlement_ref", "")) == "settlement.legacy" \
			or bool(_dict_value(payload.get("metadata", {})).get("legacy_import", false))
	var bindings_validation := _validate_identity_bindings(
		bindings, resolve_identities, allow_legacy)
	if not bool(bindings_validation.get("ok", false)):
		return bindings_validation
	if resolve_identities:
		for evidence_ref in _string_array(payload.get("source_evidence_refs", [])):
			if not ProductionKernel.has_evidence(evidence_ref):
				return {"ok": false, "error": "event.evidence_not_found",
					"evidence_ref": evidence_ref}
	return {"ok": true}


func _validate_quest_payload(payload: Dictionary,
		resolve_identities: bool = false) -> Dictionary:
	var status := str(payload.get("status", "offered"))
	if status not in VALID_QUEST_STATUSES:
		return {"ok": false, "error": "quest.invalid_status", "status": status}
	var definition_ref := str(payload.get(
		"definition_ref", payload.get("template_id", "")))
	if definition_ref.is_empty():
		return {"ok": false, "error": "quest.definition_ref_required"}
	if str(payload.get("reward_claim_state", "unclaimed")) \
			not in VALID_REWARD_CLAIM_STATES:
		return {"ok": false, "error": "quest.invalid_reward_claim_state"}
	if int(payload.get("definition_revision", 1)) < 1:
		return {"ok": false, "error": "quest.invalid_definition_revision"}
	if str(payload.get("lod_state", "Q0")) not in ["Q0", "Q1", "Q2", "Q3"]:
		return {"ok": false, "error": "quest.invalid_lod_state"}
	if int(payload.get("deadline_tick", -1)) < -1:
		return {"ok": false, "error": "quest.invalid_deadline"}
	for field in [
		"participant_refs", "required_event_refs", "history_entry_refs",
		"evidence_refs", "failure_reason_refs", "aftermath_refs",
	]:
		var validation := _validate_string_array_field(
			payload, field, "quest.invalid_%s" % field)
		if not bool(validation.get("ok", false)):
			return validation
	if payload.has("objective_records") and not (payload.get(
			"objective_records") is Array):
		return {"ok": false, "error": "quest.invalid_objective_records"}
	for objective_value in payload.get("objective_records", []):
		if not (objective_value is Dictionary):
			return {"ok": false, "error": "quest.invalid_objective_records"}
	if payload.has("stage_records") and not (payload.get("stage_records") is Array):
		return {"ok": false, "error": "quest.invalid_stage_records"}
	for stage_value in payload.get("stage_records", []):
		if not (stage_value is Dictionary):
			return {"ok": false, "error": "quest.invalid_stage_records"}
	var objectives := _quest_objectives(payload.get("objective_records", []))
	var objective_ids: Dictionary = {}
	for objective_value in objectives:
		if not (objective_value is Dictionary):
			return {"ok": false, "error": "quest.invalid_objective_records"}
		var objective: Dictionary = objective_value
		var objective_id := str(objective.get("objective_id", "")).strip_edges()
		if objective_id.is_empty() or objective_ids.has(objective_id):
			return {"ok": false, "error": "quest.invalid_objective_id",
				"objective_id": objective_id}
		objective_ids[objective_id] = true
		var objective_status := str(objective.get("status", "active"))
		if objective_status not in VALID_OBJECTIVE_STATUSES:
			return {"ok": false, "error": "quest.invalid_objective_status",
				"status": objective_status}
		for field in [
			"required_predicates", "required_event_families",
			"required_evidence_types", "required_evidence_owners",
			"completion_event_refs", "completion_evidence_refs",
		]:
			var validation := _validate_string_array_field(
				objective, field, "quest.invalid_objective_%s" % field)
			if not bool(validation.get("ok", false)):
				return validation
		var target_validation := _validate_identity_bindings(
			objective.get("target_bindings", []), resolve_identities, false)
		if not bool(target_validation.get("ok", false)):
			return target_validation
	var stages := _quest_stages(payload.get("stage_records", []), objectives)
	if not objectives.is_empty() and stages.is_empty():
		return {"ok": false, "error": "quest.stage_records_required"}
	var stage_ids: Dictionary = {}
	for stage_value in stages:
		if not (stage_value is Dictionary):
			return {"ok": false, "error": "quest.invalid_stage_records"}
		var stage: Dictionary = stage_value
		var stage_id := str(stage.get("stage_id", ""))
		if stage_id.is_empty() or stage_ids.has(stage_id):
			return {"ok": false, "error": "quest.invalid_stage_id",
				"stage_id": stage_id}
		if str(stage.get("status", "")) not in [
				"locked", "active", "blocked", "branch_pending", "completed",
				"failed", "skipped"]:
			return {"ok": false, "error": "quest.invalid_stage_status",
				"status": str(stage.get("status", ""))}
		stage_ids[stage_id] = true
	for stage_value in stages:
		var stage: Dictionary = stage_value
		for objective_ref in stage.get("objective_refs", []):
			if not objective_ids.has(str(objective_ref)):
				return {"ok": false, "error": "quest.stage_objective_missing",
					"objective_ref": str(objective_ref)}
		for next_stage_ref in stage.get("next_stage_refs", []):
			if not stage_ids.has(str(next_stage_ref)):
				return {"ok": false, "error": "quest.next_stage_missing",
					"stage_ref": str(next_stage_ref)}
		var branch_ids: Dictionary = {}
		for option_value in stage.get("branch_options", []):
			if not (option_value is Dictionary):
				return {"ok": false, "error": "quest.invalid_branch_option"}
			var branch_id := str((option_value as Dictionary).get("branch_id", ""))
			var branch_target := str((option_value as Dictionary).get(
				"next_stage_ref", ""))
			if branch_id.is_empty() or branch_ids.has(branch_id) \
					or not stage_ids.has(branch_target):
				return {"ok": false, "error": "quest.invalid_branch_option",
					"branch_id": branch_id, "next_stage_ref": branch_target}
			branch_ids[branch_id] = true
	var decision_ids: Dictionary = {}
	for decision_value in payload.get("branch_decision_records", []):
		if not (decision_value is Dictionary):
			return {"ok": false, "error": "quest.invalid_branch_decision"}
		var decision: Dictionary = decision_value
		var branch_id := str(decision.get("branch_id", ""))
		if branch_id.is_empty() or decision_ids.has(branch_id) \
				or not stage_ids.has(str(decision.get("from_stage_ref", ""))) \
				or not stage_ids.has(str(decision.get("next_stage_ref", ""))):
			return {"ok": false, "error": "quest.invalid_branch_decision",
				"branch_id": branch_id}
		decision_ids[branch_id] = true
	var contribution_ids: Dictionary = {}
	for contribution_value in payload.get("contribution_records", []):
		if not (contribution_value is Dictionary):
			return {"ok": false, "error": "quest.invalid_contribution"}
		var contribution: Dictionary = contribution_value
		var contribution_id := str(contribution.get("contribution_id", ""))
		if contribution_id.is_empty() or contribution_ids.has(contribution_id):
			return {"ok": false, "error": "quest.invalid_contribution",
				"contribution_id": contribution_id}
		contribution_ids[contribution_id] = true
		var contributor_validation := _validate_identity_bindings(
			[contribution.get("contributor_binding", {})],
			resolve_identities, false)
		if not bool(contributor_validation.get("ok", false)):
			return contributor_validation
		var evidence_validation := _validate_string_array_field(
			contribution, "evidence_refs", "quest.invalid_contribution_evidence")
		if not bool(evidence_validation.get("ok", false)):
			return evidence_validation
	var current_stage_ref := str(payload.get("current_stage_ref", ""))
	if current_stage_ref.is_empty() and not stages.is_empty():
		current_stage_ref = str((stages[0] as Dictionary).get("stage_id", ""))
	if not current_stage_ref.is_empty() and not stage_ids.has(current_stage_ref):
		return {"ok": false, "error": "quest.current_stage_missing",
			"stage_ref": current_stage_ref}
	var bindings_validation := _validate_identity_bindings(
		_quest_identity_bindings(payload), resolve_identities, false)
	if not bool(bindings_validation.get("ok", false)):
		return bindings_validation
	if resolve_identities:
		var source_event_ref := str(payload.get("source_event_ref", ""))
		if not source_event_ref.is_empty() and not _events_by_id.has(source_event_ref):
			return {"ok": false, "error": "quest.source_event_not_found",
				"event_ref": source_event_ref}
		for evidence_ref in _string_array(payload.get("evidence_refs", [])):
			if not ProductionKernel.has_evidence(evidence_ref):
				return {"ok": false, "error": "quest.evidence_not_found",
					"evidence_ref": evidence_ref}
	if status == "completed":
		var consistency_candidate := payload.duplicate(true)
		consistency_candidate["objective_records"] = objectives
		consistency_candidate["stage_records"] = stages
		consistency_candidate["current_stage_ref"] = current_stage_ref
		if _derive_quest_status(consistency_candidate) != "completed":
			return {"ok": false, "error": "quest.completed_with_open_objective"}
	return {"ok": true}


func _validate_string_array_field(payload: Dictionary, field: String,
		error_code: String) -> Dictionary:
	if not payload.has(field):
		return {"ok": true}
	var value: Variant = payload.get(field)
	if not (value is Array):
		return {"ok": false, "error": error_code, "field": field}
	for entry in value:
		if not (entry is String) or str(entry).strip_edges().is_empty():
			return {"ok": false, "error": error_code, "field": field}
	return {"ok": true}


func _event_identity_bindings(payload: Dictionary) -> Array:
	var bindings := _normalise_bindings(payload.get("identity_bindings", []))
	var settlement_ref := str(payload.get("settlement_ref", ""))
	if not settlement_ref.is_empty():
		bindings = _append_binding(bindings, "settlement", settlement_ref)
	for structure_ref in _string_array(payload.get("structure_refs", [])):
		bindings = _append_binding(bindings, "structure", structure_ref)
	for participant_ref in _string_array(payload.get("participant_refs", [])):
		var binding := _binding_for_ref(participant_ref)
		if not binding.is_empty():
			bindings = _append_binding(
				bindings, str(binding.get("kind", "")), str(binding.get("ref", "")))
	return bindings


func _quest_identity_bindings(payload: Dictionary) -> Array:
	var bindings := _normalise_bindings(payload.get("identity_bindings", []))
	var owner_scope_ref := str(payload.get("owner_scope_ref", ""))
	var owner_binding := _binding_for_ref(owner_scope_ref)
	if not owner_binding.is_empty():
		bindings = _append_binding(bindings,
			str(owner_binding.get("kind", "")), str(owner_binding.get("ref", "")))
	for participant_ref in _string_array(payload.get("participant_refs", [])):
		var binding := _binding_for_ref(participant_ref)
		if not binding.is_empty():
			bindings = _append_binding(bindings,
				str(binding.get("kind", "")), str(binding.get("ref", "")))
	return bindings


func _binding_for_ref(identity_ref: String) -> Dictionary:
	if identity_ref.is_empty():
		return {}
	if identity_ref in ["actor.player", "player.local"] \
			or identity_ref.begins_with("player."):
		return {"kind": "player", "ref": identity_ref}
	if identity_ref.begins_with("settlement."):
		return {"kind": "settlement", "ref": identity_ref}
	if identity_ref.begins_with("structure.") \
			or identity_ref.begins_with("structure_instance.") \
			or identity_ref.begins_with("building_instance."):
		return {"kind": "structure", "ref": identity_ref}
	if identity_ref.begins_with("person.") or identity_ref.begins_with("npc."):
		return {"kind": "person", "ref": identity_ref}
	if identity_ref.begins_with("faction."):
		return {"kind": "faction", "ref": identity_ref}
	if identity_ref.begins_with("government."):
		return {"kind": "government", "ref": identity_ref}
	if identity_ref.begins_with("journey."):
		return {"kind": "journey", "ref": identity_ref}
	if identity_ref.begins_with("route."):
		return {"kind": "route", "ref": identity_ref}
	return {}


func _normalise_bindings(value: Variant) -> Array:
	var result: Array = []
	if not (value is Array):
		return [{"kind": "", "ref": ""}]
	for entry in value:
		if not (entry is Dictionary):
			result.append({"kind": "", "ref": ""})
			continue
		var binding := {
			"kind": str((entry as Dictionary).get("kind", "")),
			"ref": str((entry as Dictionary).get("ref", "")),
			"role": str((entry as Dictionary).get("role", "")),
		}
		result = _append_binding(result, str(binding["kind"]),
			str(binding["ref"]), str(binding["role"]))
	return result


func _append_binding(bindings: Array, kind: String, identity_ref: String,
		role: String = "") -> Array:
	for value in bindings:
		if value is Dictionary \
				and str((value as Dictionary).get("kind", "")) == kind \
				and str((value as Dictionary).get("ref", "")) == identity_ref \
				and str((value as Dictionary).get("role", "")) == role:
			return bindings
	bindings.append({"kind": kind, "ref": identity_ref, "role": role})
	return bindings


func _validate_identity_bindings(bindings_value: Variant,
		resolve_identities: bool, allow_legacy: bool,
		known_settlement_refs: Array[String] = []) -> Dictionary:
	if not (bindings_value is Array):
		return {"ok": false, "error": "event.invalid_identity_bindings"}
	var roles: Dictionary = {}
	for value in bindings_value:
		if not (value is Dictionary):
			return {"ok": false, "error": "event.invalid_identity_binding"}
		var binding: Dictionary = value
		var kind := str(binding.get("kind", ""))
		var identity_ref := str(binding.get("ref", ""))
		var role := str(binding.get("role", ""))
		if kind not in VALID_BINDING_KINDS or identity_ref.is_empty():
			return {"ok": false, "error": "event.invalid_identity_binding",
				"kind": kind, "ref": identity_ref}
		if not role.is_empty():
			var role_key := "%s:%s" % [kind, role]
			if roles.has(role_key) and str(roles[role_key]) != identity_ref:
				return {"ok": false, "error": "event.duplicate_binding_role",
					"kind": kind, "role": role}
			roles[role_key] = identity_ref
		if resolve_identities and not _identity_exists(
				kind, identity_ref, allow_legacy, known_settlement_refs):
			return {"ok": false, "error": "event.identity_not_found",
				"kind": kind, "ref": identity_ref}
	return {"ok": true}


func _identity_exists(kind: String, identity_ref: String,
		allow_legacy: bool,
		known_settlement_refs: Array[String] = []) -> bool:
	if allow_legacy and identity_ref == "settlement.legacy":
		return true
	match kind:
		"player":
			return identity_ref in ["actor.player", "player.local"] \
				or identity_ref.begins_with("player.")
		"person":
			return PeopleManager.has_person(identity_ref)
		"actor":
			return PeopleManager.has_person(identity_ref) \
				or BiologyManager.has_actor(identity_ref) \
				or MovementManager.has_mover(identity_ref) \
				or identity_ref == "actor.player"
		"settlement":
			return known_settlement_refs.has(identity_ref) \
				or not SettlementManager.get_settlement(identity_ref).is_empty() \
				or (HamletState.initialized \
					and HamletState.active_village_id == identity_ref)
		"structure":
			return StructureManager.has_structure(identity_ref)
		"faction":
			return not PoliticalManager.get_faction(identity_ref).is_empty()
		"government":
			return not PoliticalManager.get_government(identity_ref).is_empty()
		"jurisdiction":
			return not PoliticalManager.get_jurisdiction(identity_ref).is_empty()
		"route":
			return not MovementManager.route_segment(identity_ref).is_empty() \
				or not MovementManager.route_plan(identity_ref).is_empty()
		"journey":
			return not MovementManager.journey_record(identity_ref).is_empty()
		"movement_intent":
			return not MovementManager.movement_intent(identity_ref).is_empty()
		"household":
			return not PeopleManager.get_household(identity_ref).is_empty()
		"job":
			return not PeopleManager.get_job_assignment(identity_ref).is_empty()
		"social_profile":
			return SocialManager.has_profile(identity_ref)
		"event":
			return _events_by_id.has(identity_ref)
		"quest":
			return _quests_by_id.has(identity_ref)
	return false


func _validate_consequence_binding(consequence: Dictionary) -> Dictionary:
	var owner_ref := str(consequence.get("owner_ref", ""))
	var kind := str(consequence.get("kind", "consequence"))
	if owner_ref.is_empty():
		return {"ok": false, "error": "event.consequence_owner_required"}
	var owner_kind := "structure" if kind.begins_with("structure_") else str(
		consequence.get("owner_kind", ""))
	if owner_kind.is_empty():
		var inferred := _binding_for_ref(owner_ref)
		owner_kind = str(inferred.get("kind", ""))
	if owner_kind.is_empty() or not _identity_exists(owner_kind, owner_ref, false):
		return {"ok": false, "error": "event.consequence_owner_not_found",
			"kind": owner_kind, "ref": owner_ref}
	var evidence_ref := str(consequence.get("evidence_ref", ""))
	if not evidence_ref.is_empty() and not ProductionKernel.has_evidence(evidence_ref):
		return {"ok": false, "error": "event.evidence_not_found",
			"evidence_ref": evidence_ref}
	return {"ok": true}


func _canonical_event_predicates(event_record: Dictionary) -> Array[String]:
	var predicates := _string_array(event_record.get("evidence_predicates", []))
	for predicate in [
		"event.family:%s" % str(event_record.get("event_family", "")),
		"event.type:%s" % str(event_record.get("event_type", "")),
		"event.status:%s" % str(event_record.get("status", "")),
		"event.phase:%s" % str(event_record.get("phase", "")),
	]:
		predicates = _append_unique_string(predicates, predicate)
	return predicates


func _objective_stage_is_active(quest: Dictionary, objective: Dictionary) -> bool:
	var stage_ref := str(objective.get("stage_ref", ""))
	if stage_ref.is_empty():
		return true
	if stage_ref != str(quest.get("current_stage_ref", "")):
		return false
	var stages: Array = quest.get("stage_records", [])
	var index := _stage_index(stages, stage_ref)
	return index >= 0 and str((stages[index] as Dictionary).get(
		"status", "")) in ["active", "blocked"]


func _stage_index(stages: Array, stage_ref: String) -> int:
	for index in stages.size():
		if stages[index] is Dictionary and str((stages[index] as Dictionary).get(
				"stage_id", "")) == stage_ref:
			return index
	return -1


func _advance_quest_graph(quest: Dictionary, objective_id: String) -> Dictionary:
	var candidate := quest.duplicate(true)
	var objectives: Array = candidate.get("objective_records", [])
	var stages: Array = candidate.get("stage_records", []).duplicate(true)
	var stage_ref := ""
	for objective_value in objectives:
		if objective_value is Dictionary and str((objective_value as Dictionary).get(
				"objective_id", "")) == objective_id:
			stage_ref = str((objective_value as Dictionary).get("stage_ref", ""))
			break
	var stage_index := _stage_index(stages, stage_ref)
	if stage_index < 0:
		return candidate
	var stage: Dictionary = stages[stage_index].duplicate(true)
	var stage_failed := false
	var stage_blocked := false
	var stage_completed := true
	for objective_ref in stage.get("objective_refs", []):
		for objective_value in objectives:
			if not (objective_value is Dictionary) or str(
					((objective_value as Dictionary).get("objective_id", ""))) != str(
					objective_ref):
				continue
			var objective_status := str((objective_value as Dictionary).get(
				"status", "active"))
			stage_failed = stage_failed or objective_status == "failed"
			stage_blocked = stage_blocked or objective_status == "blocked"
			stage_completed = stage_completed and objective_status == "completed"
	if stage_failed:
		stage["status"] = "failed"
	elif stage_blocked:
		stage["status"] = "blocked"
	elif not stage_completed:
		stage["status"] = "active"
	elif not (stage.get("branch_options", []) as Array).is_empty():
		stage["status"] = "branch_pending"
		candidate["status"] = "branch_pending"
	else:
		stage["status"] = "completed"
		var next_refs: Array = stage.get("next_stage_refs", [])
		if next_refs.size() == 1:
			var next_ref := str(next_refs[0])
			var next_index := _stage_index(stages, next_ref)
			if next_index >= 0:
				var next_stage: Dictionary = stages[next_index].duplicate(true)
				next_stage["status"] = "active"
				stages[next_index] = next_stage
				candidate["current_stage_ref"] = next_ref
	stages[stage_index] = stage
	candidate["stage_records"] = stages
	return candidate


func _process_event_for_quests(event_id: String) -> void:
	if not _events_by_id.has(event_id):
		return
	var event_record: Dictionary = _events_by_id[event_id]
	var predicates := _canonical_event_predicates(event_record)
	for quest_id in quest_ids():
		var quest: Dictionary = _quests_by_id[quest_id]
		if str(quest.get("status", "")) not in [
				"accepted", "active", "blocked", "branch_pending"]:
			continue
		var required_events: Array = quest.get("required_event_refs", [])
		if not required_events.is_empty() and not required_events.has(event_id):
			continue
		for objective_value in quest.get("objective_records", []):
			if not (objective_value is Dictionary):
				continue
			var objective: Dictionary = objective_value
			if str(objective.get("status", "")) not in ["active", "blocked"] \
					or not _objective_stage_is_active(quest, objective):
				continue
			var families: Array = objective.get("required_event_families", [])
			var required_predicates: Array = objective.get("required_predicates", [])
			if families.is_empty() and required_predicates.is_empty() \
					and required_events.is_empty():
				continue
			if not families.is_empty() and not families.has(str(event_record.get(
					"event_family", ""))):
				continue
			var requirements_met := true
			for predicate in required_predicates:
				if not predicates.has(str(predicate)):
					requirements_met = false
					break
			if not requirements_met:
				continue
			advance_quest_from_event({
				"quest_id": quest_id,
				"objective_id": str(objective.get("objective_id", "")),
				"event_ref": event_id,
				"transaction_id": "quest.auto.%s.%s.%s" % [
					quest_id, str(objective.get("objective_id", "")), event_id],
			})
			break


func _migrate_event_record(record: Dictionary, source_version: int) -> Dictionary:
	if source_version >= STATE_VERSION:
		return record
	record["version"] = STATE_VERSION
	var event_id := str(record.get("event_id", ""))
	var definition_ref := str(record.get("definition_ref", ""))
	if definition_ref.is_empty():
		definition_ref = "legacy.event.%s" % event_id
	record["definition_ref"] = definition_ref
	record["definition_revision"] = maxi(1, int(record.get("definition_revision", 1)))
	record["atlas_foundation_ref"] = str(record.get("atlas_foundation_ref", ""))
	record["source_arc_ref"] = str(record.get("source_arc_ref", ""))
	var status := str(record.get("status", "active"))
	var metadata := _dict_value(record.get("metadata", {}))
	var phase := str(metadata.get("phase", ""))
	if phase not in VALID_EVENT_PHASES:
		phase = "historical" if status == "archived" else (
			"resolution" if status == "resolved" else "initiation")
	record["phase"] = phase
	record["severity_band"] = "local"
	record["escalation_state"] = "stable"
	record["identity_bindings"] = _event_identity_bindings(record)
	for field in ["evidence_predicates", "intervention_refs", "contribution_refs",
			"generated_quest_refs", "aftermath_refs"]:
		record[field] = _string_array(record.get(field, []))
	record["outcome_ref"] = str(record.get("outcome_ref", ""))
	record["lod_state"] = str(record.get("lod_state", "E0"))
	record["migration_revision"] = 2
	record["state_hash"] = _record_hash(record)
	return record


func _migrate_quest_record(record: Dictionary, source_version: int) -> Dictionary:
	if source_version >= STATE_VERSION:
		return record
	record["version"] = STATE_VERSION
	var quest_id := str(record.get("quest_id", ""))
	var definition_ref := str(record.get("template_id", ""))
	if definition_ref.is_empty():
		definition_ref = "legacy.inline.%s" % quest_id
	record["template_id"] = definition_ref
	record["definition_ref"] = definition_ref
	record["definition_revision"] = 1
	record["source_arc_ref"] = ""
	record["source_event_ref"] = ""
	record["identity_bindings"] = _quest_identity_bindings(record)
	var objectives := _quest_objectives(record.get("objective_records", []))
	record["objective_records"] = objectives
	record["stage_records"] = _quest_stages([], objectives)
	record["current_stage_ref"] = "stage.default" if not objectives.is_empty() else ""
	record["branch_decision_records"] = []
	record["evidence_refs"] = []
	record["contribution_records"] = []
	record["failure_reason_refs"] = []
	record["reward_claim_state"] = "unclaimed"
	record["aftermath_refs"] = []
	record["deadline_tick"] = -1
	record["lod_state"] = "Q0"
	record["migration_revision"] = 2
	record["state_hash"] = _record_hash(record)
	return record


func _migrate_history_record(record: Dictionary, source_version: int) -> Dictionary:
	if source_version >= STATE_VERSION:
		return record
	record["version"] = STATE_VERSION
	record["state_hash"] = _record_hash(record)
	return record


func _validate_restored_references(events: Dictionary, quests: Dictionary,
		history: Dictionary, transactions: Dictionary,
		known_settlement_refs: Array[String]) -> bool:
	for event_value in events.values():
		var event_record: Dictionary = event_value
		var binding_validation := _validate_identity_bindings(
			event_record.get("identity_bindings", []), true,
			str(event_record.get("settlement_ref", "")) == "settlement.legacy",
			known_settlement_refs)
		if not bool(binding_validation.get("ok", false)):
			return false
		for history_ref in event_record.get("history_entry_refs", []):
			if not history.has(str(history_ref)):
				return false
		for evidence_ref in event_record.get("source_evidence_refs", []):
			if not ProductionKernel.has_evidence(str(evidence_ref)):
				return false
		for consequence_value in event_record.get("consequence_refs", []):
			if not (consequence_value is Dictionary) or not bool(
					_validate_consequence_binding(consequence_value).get("ok", false)):
				return false
	for quest_value in quests.values():
		var quest: Dictionary = quest_value
		if not bool(_validate_identity_bindings(
				quest.get("identity_bindings", []), true, false,
				known_settlement_refs).get("ok", false)):
			return false
		var source_event_ref := str(quest.get("source_event_ref", ""))
		if not source_event_ref.is_empty() and not events.has(source_event_ref):
			return false
		for event_ref in quest.get("required_event_refs", []):
			if not events.has(str(event_ref)):
				return false
		for history_ref in quest.get("history_entry_refs", []):
			if not history.has(str(history_ref)):
				return false
		for evidence_ref in quest.get("evidence_refs", []):
			if not ProductionKernel.has_evidence(str(evidence_ref)):
				return false
		for objective_value in quest.get("objective_records", []):
			var objective: Dictionary = objective_value
			for event_ref in objective.get("completion_event_refs", []):
				if not events.has(str(event_ref)):
					return false
			for evidence_ref in objective.get("completion_evidence_refs", []):
				if not ProductionKernel.has_evidence(str(evidence_ref)):
					return false
	for history_value in history.values():
		var history_record: Dictionary = history_value
		var event_ref := str(history_record.get("event_ref", ""))
		if not event_ref.is_empty() and not events.has(event_ref):
			return false
	for transaction_value in transactions.values():
		var transaction: Dictionary = transaction_value
		var event_ref := str(transaction.get("event_id", ""))
		var quest_ref := str(transaction.get("quest_id", ""))
		var history_ref := str(transaction.get("history_id", ""))
		if not event_ref.is_empty() and not events.has(event_ref):
			return false
		if not quest_ref.is_empty() and not quests.has(quest_ref):
			return false
		if not history_ref.is_empty() and not history.has(history_ref):
			return false
	return true


func _append_unique_string(value: Variant, token: String) -> Array:
	var result: Array = value.duplicate(true) if value is Array else []
	if not token.is_empty() and not result.has(token):
		result.append(token)
	return result


func _is_sha256(value: String) -> bool:
	if value.length() != 64:
		return false
	for character in value.to_lower():
		if character not in "0123456789abcdef":
			return false
	return true


func _authority_context() -> Dictionary:
	return ProductionKernel.make_authority_context(
		"authority.%s.%d" % [EVIDENCE_OWNER, world_seed],
		EVIDENCE_OWNER,
		["commit:%s" % EVIDENCE_OWNER])


func _ensure_initialized(context: Variant) -> void:
	if initialized:
		return
	var seed_value := int(world_seed)
	var requested_world_id := world_id
	if context is Dictionary:
		seed_value = int((context as Dictionary).get("world_seed", world_seed))
		requested_world_id = str((context as Dictionary).get(
			"world_id", world_id))
	initialize(seed_value, requested_world_id)


func _merge_dict(base_value: Variant, overlay_value: Variant) -> Dictionary:
	var result: Dictionary = _dict_value(base_value)
	var overlay: Dictionary = _dict_value(overlay_value)
	for key in overlay:
		result[str(key)] = overlay[key]
	return result


func _dict_value(value: Variant) -> Dictionary:
	return value.duplicate(true) if value is Dictionary else {}


func _dict_array(value: Variant) -> Array:
	var result: Array = []
	if not (value is Array):
		return result
	for entry in value:
		if entry is Dictionary:
			result.append((entry as Dictionary).duplicate(true))
	return result


func _string_array(value: Variant) -> Array[String]:
	var result: Array[String] = []
	if not (value is Array):
		return result
	for entry in value:
		var token := str(entry)
		if not token.is_empty():
			result.append(token)
	return result


func _state_hash(data: Dictionary) -> String:
	var payload := data.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _record_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _event_semantic_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	for field in ["revision", "created_tick", "updated_tick", "state_hash"]:
		payload.erase(field)
	return _hash_value(payload)


func _event_request_payload(record: Dictionary) -> Dictionary:
	var payload := record.duplicate(true)
	for field in ["state_hash", "created_tick", "updated_tick"]:
		payload.erase(field)
	return payload


func _quest_request_payload(record: Dictionary) -> Dictionary:
	var payload := record.duplicate(true)
	payload.erase("state_hash")
	return payload


func _history_request_payload(record: Dictionary) -> Dictionary:
	var payload := record.duplicate(true)
	payload.erase("state_hash")
	return payload


func _hash_value(value: Variant) -> String:
	var normalised: Variant = JSON.parse_string(JSON.stringify(value))
	var text := _canonical_json(normalised if normalised != null else value)
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(text.to_utf8_buffer())
	return context.finish().hex_encode()


func _canonical_json(value: Variant) -> String:
	if value is Dictionary:
		var dictionary: Dictionary = value
		var keys: Array = dictionary.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str(a) < str(b))
		var entries: Array[String] = []
		for key in keys:
			entries.append("%s:%s" % [
				JSON.stringify(str(key)), _canonical_json(dictionary[key])])
		return "{%s}" % ",".join(entries)
	if value is Array:
		var entries: Array[String] = []
		for entry in value:
			entries.append(_canonical_json(entry))
		return "[%s]" % ",".join(entries)
	if value is int or value is float:
		return String.num(float(value), 15)
	return JSON.stringify(value)
