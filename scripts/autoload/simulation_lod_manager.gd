extends Node
## Canonical time, presence and catch-up coordinator for simulation LOD.
##
## Gameplay domains keep their authoritative records. This coordinator owns
## only representation mode, reconciliation backlog, bounded work plans and
## evidence that promotion or demotion preserved owner-supplied invariants.

signal subjects_changed
signal subject_changed(subject_id: String)

const STATE_SCHEMA := "leyforge.simulation-lod-state"
const STATE_VERSION := 1
const RECORD_TYPE := "SimulationLodRecord"
const VALID_MODES: Array[String] = [
	"local", "regional", "distant", "dormant",
]
const PRESENCE_BY_MODE := {
	"local": "near",
	"regional": "regional",
	"distant": "distant",
	"dormant": "offline",
}
const MODE_RANK := {
	"local": 0,
	"regional": 1,
	"distant": 2,
	"dormant": 3,
}
const WORKLOAD_BUDGETS := {
	"local": {
		"cadence_minutes": 1.0,
		"max_steps_per_pass": 8,
		"max_minutes_per_pass": 8.0,
	},
	"regional": {
		"cadence_minutes": 5.0,
		"max_steps_per_pass": 8,
		"max_minutes_per_pass": 40.0,
	},
	"distant": {
		"cadence_minutes": 15.0,
		"max_steps_per_pass": 8,
		"max_minutes_per_pass": 120.0,
	},
	"dormant": {
		"cadence_minutes": 60.0,
		"max_steps_per_pass": 4,
		"max_minutes_per_pass": 240.0,
	},
}
const MAX_PENDING_CATCHUP_MINUTES := 43200.0
const MAX_GLOBAL_STEPS_PER_PASS := 32
const MAX_HISTORY := 128
const EPSILON := 0.0001

var initialized := false
var world_seed := 0
var world_id := ""
var _fractional_world_minutes := 0.0
var _next_plan_sequence := 0
var _subjects: Dictionary = {}
var _open_plans: Dictionary = {}
var _catchup_requests: Dictionary = {}


func reset() -> void:
	initialized = false
	world_seed = 0
	world_id = ""
	_fractional_world_minutes = 0.0
	_next_plan_sequence = 0
	_subjects.clear()
	_open_plans.clear()
	_catchup_requests.clear()


func initialize(seed_value: int, requested_world_id: String = "") -> void:
	if initialized and world_seed == seed_value \
			and (requested_world_id.is_empty() or world_id == requested_world_id):
		return
	reset()
	initialized = true
	world_seed = seed_value
	world_id = requested_world_id


func subject_ids() -> Array[String]:
	var result: Array[String] = []
	for subject_value in _subjects.keys():
		result.append(str(subject_value))
	result.sort()
	return result


func subject_count() -> int:
	return _subjects.size()


func has_subject(subject_id: String) -> bool:
	return _subjects.has(subject_id)


func subject_record(subject_id: String) -> Dictionary:
	return (_subjects.get(subject_id, {}) as Dictionary).duplicate(true)


func workload_budget(mode: String) -> Dictionary:
	if mode not in VALID_MODES:
		return {}
	return (WORKLOAD_BUDGETS[mode] as Dictionary).duplicate(true)


func pending_catchup_minutes(subject_id: String) -> float:
	return float((_subjects.get(subject_id, {}) as Dictionary).get(
		"pending_catchup_minutes", 0.0))


func is_reconciled(subject_id: String) -> bool:
	if not _subjects.has(subject_id):
		return false
	var record: Dictionary = _subjects[subject_id]
	return float(record.get("pending_catchup_minutes", 0.0)) <= EPSILON \
			and not _has_open_plan_for(subject_id)


func advance_runtime_minutes(elapsed_minutes: float) -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "lod_not_initialized"}
	if elapsed_minutes <= 0.0:
		return {"ok": false, "error": "elapsed_minutes_must_be_positive"}
	_fractional_world_minutes += elapsed_minutes
	var whole_minutes := floori(_fractional_world_minutes)
	if whole_minutes <= 0:
		return {
			"ok": true,
			"advanced_ticks": 0,
			"fractional_minutes": _fractional_world_minutes,
			"time": ProductionKernel.world_time_reference(),
		}
	var authority := ProductionKernel.make_authority_context(
		"authority.simulation_lod.world_time", "simulation_lod",
		["world_time.advance"])
	var advanced := ProductionKernel.advance_world_time(whole_minutes, authority)
	if not bool(advanced.get("ok", false)):
		return advanced
	_fractional_world_minutes -= float(whole_minutes)
	return {
		"ok": true,
		"advanced_ticks": whole_minutes,
		"fractional_minutes": _fractional_world_minutes,
		"time": advanced.get("time", {}),
	}


func register_subject(
		subject_id: String,
		domain_id: String,
		owner_id: String,
		region_id: String,
		mode: String,
		snapshot: Dictionary) -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "lod_not_initialized"}
	if subject_id.is_empty() or domain_id.is_empty() or owner_id.is_empty() \
			or region_id.is_empty():
		return {"ok": false, "error": "subject_identity_required"}
	if mode not in VALID_MODES:
		return {"ok": false, "error": "invalid_lod_mode"}
	var validation := validate_snapshot(snapshot)
	if not bool(validation.get("ok", false)):
		return validation
	var snapshot_hash := _hash_value(snapshot)
	if _subjects.has(subject_id):
		var existing: Dictionary = _subjects[subject_id]
		if str(existing.get("domain_id", "")) == domain_id \
				and str(existing.get("owner_id", "")) == owner_id \
				and str(existing.get("region_id", "")) == region_id \
				and str(existing.get("lod_mode", "")) == mode \
				and str(existing.get("snapshot_hash", "")) == snapshot_hash:
			return {
				"ok": true,
				"duplicate": true,
				"record": existing.duplicate(true),
			}
		return {"ok": false, "error": "subject_conflict"}
	var tick := _world_tick()
	var record := {
		"record_type": RECORD_TYPE,
		"version": STATE_VERSION,
		"subject_id": subject_id,
		"domain_id": domain_id,
		"owner_id": owner_id,
		"region_id": region_id,
		"lod_mode": mode,
		"presence_state": ProductionKernel.actor_presence_state(
			subject_id, str(PRESENCE_BY_MODE[mode]), region_id, tick),
		"revision": 1,
		"created_tick": tick,
		"updated_tick": tick,
		"last_simulated_tick": tick,
		"pending_catchup_minutes": 0.0,
		"reconciliation_state": "ready",
		"snapshot": snapshot.duplicate(true),
		"snapshot_hash": snapshot_hash,
		"invariant_hash": _invariant_hash(snapshot),
		"evidence_refs": [],
		"transition_history": [],
		"catchup_history": [],
		"record_hash": "",
	}
	record["record_hash"] = _record_hash(record)
	_subjects[subject_id] = record
	subject_changed.emit(subject_id)
	subjects_changed.emit()
	return {"ok": true, "duplicate": false, "record": record.duplicate(true)}


func refresh_subject(
		subject_id: String, snapshot: Dictionary, owner_id: String) -> Dictionary:
	if not _subjects.has(subject_id):
		return {"ok": false, "error": "unknown_subject"}
	var record: Dictionary = _subjects[subject_id]
	if owner_id.is_empty() or owner_id != str(record.get("owner_id", "")):
		return {"ok": false, "error": "owner_mismatch"}
	var validation := validate_snapshot(snapshot)
	if not bool(validation.get("ok", false)):
		return validation
	if _immutable_hash(snapshot) != _immutable_hash(
			record.get("snapshot", {}) as Dictionary):
		return {"ok": false, "error": "immutable_identity_changed"}
	var next_hash := _hash_value(snapshot)
	if next_hash == str(record.get("snapshot_hash", "")):
		return {"ok": true, "duplicate": true, "record": record.duplicate(true)}
	record["snapshot"] = snapshot.duplicate(true)
	record["snapshot_hash"] = next_hash
	record["invariant_hash"] = _invariant_hash(snapshot)
	record["revision"] = int(record.get("revision", 0)) + 1
	record["updated_tick"] = _world_tick()
	record["record_hash"] = _record_hash(record)
	_subjects[subject_id] = record
	subject_changed.emit(subject_id)
	return {"ok": true, "duplicate": false, "record": record.duplicate(true)}


func validate_snapshot(snapshot: Dictionary) -> Dictionary:
	for field in ["identity", "ownership", "quantities", "irreversible"]:
		if not snapshot.has(field) or not (snapshot.get(field, {}) is Dictionary):
			return {"ok": false, "error": "invalid_snapshot_%s" % field}
	if (snapshot.get("identity", {}) as Dictionary).is_empty():
		return {"ok": false, "error": "snapshot_identity_required"}
	if (snapshot.get("ownership", {}) as Dictionary).is_empty():
		return {"ok": false, "error": "snapshot_ownership_required"}
	if not snapshot.has("history"):
		return {"ok": false, "error": "invalid_snapshot_history"}
	var history: Variant = snapshot.get("history", [])
	if not (history is Array) and not (history is Dictionary):
		return {"ok": false, "error": "invalid_snapshot_history"}
	return {"ok": true}


func validate_transition_snapshots(
		before_snapshot: Dictionary,
		after_snapshot: Dictionary) -> Dictionary:
	var before_validation := validate_snapshot(before_snapshot)
	if not bool(before_validation.get("ok", false)):
		return before_validation
	var after_validation := validate_snapshot(after_snapshot)
	if not bool(after_validation.get("ok", false)):
		return after_validation
	for field in [
		"identity", "ownership", "quantities", "history", "irreversible",
	]:
		if _hash_value(before_snapshot.get(field)) \
				!= _hash_value(after_snapshot.get(field)):
			return {"ok": false, "error": "%s_changed" % field}
	return {"ok": true, "invariant_hash": _invariant_hash(after_snapshot)}


func transition_subject(
		subject_id: String,
		target_mode: String,
		before_snapshot: Dictionary,
		after_snapshot: Dictionary,
		transition_id: String,
		context: Dictionary = {}) -> Dictionary:
	if not _subjects.has(subject_id):
		return {"ok": false, "error": "unknown_subject"}
	if target_mode not in VALID_MODES:
		return {"ok": false, "error": "invalid_lod_mode"}
	var record: Dictionary = _subjects[subject_id]
	if str(context.get("owner_id", "")) != str(record.get("owner_id", "")):
		return {"ok": false, "error": "owner_mismatch"}
	var requested_hash := ""
	if not transition_id.is_empty():
		var replay := _find_history_entry(
			record.get("transition_history", []), "transition_id", transition_id)
		if not replay.is_empty():
			if str(replay.get("to_mode", "")) == target_mode \
					and str(replay.get("before_snapshot_hash", "")) \
					== _hash_value(before_snapshot) \
					and str(replay.get("snapshot_hash", "")) \
					== _hash_value(after_snapshot):
				return {
					"ok": true,
					"duplicate": true,
					"record": record.duplicate(true),
				}
			return {"ok": false, "error": "transition_conflict"}
	if _hash_value(before_snapshot) != str(record.get("snapshot_hash", "")):
		return {"ok": false, "error": "stale_owner_snapshot"}
	var validation := validate_transition_snapshots(
		before_snapshot, after_snapshot)
	if not bool(validation.get("ok", false)):
		return validation
	var current_mode := str(record.get("lod_mode", ""))
	if int(MODE_RANK[target_mode]) < int(MODE_RANK[current_mode]) \
			and not is_reconciled(subject_id):
		return {"ok": false, "error": "catchup_required"}
	if current_mode == target_mode \
			and _hash_value(after_snapshot) == str(record.get("snapshot_hash", "")):
		return {"ok": true, "duplicate": true, "record": record.duplicate(true)}
	var next_revision := int(record.get("revision", 0)) + 1
	if transition_id.is_empty():
		transition_id = "transition.%s.%d.%s.%s" % [
			subject_id, next_revision, current_mode, target_mode]
	var tick := _world_tick()
	var payload := {
		"transition_id": transition_id,
		"subject_id": subject_id,
		"owner_id": str(record.get("owner_id", "")),
		"from_mode": current_mode,
		"to_mode": target_mode,
		"snapshot_hash": _hash_value(after_snapshot),
		"invariant_hash": str(validation.get("invariant_hash", "")),
		"world_tick": tick,
	}
	requested_hash = _hash_value({
		"subject_id": subject_id,
		"from": current_mode,
		"to": target_mode,
		"before": _hash_value(before_snapshot),
		"after": _hash_value(after_snapshot),
	})
	var evidence_id := "evidence.lod.transition.%s.%d" % [
		subject_id, next_revision]
	var evidence := _commit_evidence(
		evidence_id, "simulation_lod_transition", payload, transition_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var history: Array = record.get("transition_history", [])
	history.append({
		"transition_id": transition_id,
		"from_mode": current_mode,
		"to_mode": target_mode,
		"world_tick": tick,
		"payload_hash": requested_hash,
		"before_snapshot_hash": _hash_value(before_snapshot),
		"snapshot_hash": _hash_value(after_snapshot),
		"invariant_hash": str(validation.get("invariant_hash", "")),
		"evidence_id": evidence_id,
	})
	_trim_history(history)
	record["lod_mode"] = target_mode
	record["presence_state"] = ProductionKernel.actor_presence_state(
		subject_id, str(PRESENCE_BY_MODE[target_mode]),
		str(record.get("region_id", "")), tick)
	record["snapshot"] = after_snapshot.duplicate(true)
	record["snapshot_hash"] = _hash_value(after_snapshot)
	record["invariant_hash"] = str(validation.get("invariant_hash", ""))
	record["transition_history"] = history
	record["revision"] = next_revision
	record["updated_tick"] = tick
	_append_evidence_ref(record, evidence_id)
	record["record_hash"] = _record_hash(record)
	_subjects[subject_id] = record
	subject_changed.emit(subject_id)
	subjects_changed.emit()
	return {
		"ok": true,
		"duplicate": false,
		"evidence_id": evidence_id,
		"record": record.duplicate(true),
	}


func queue_catchup(
		subject_id: String,
		elapsed_minutes: float,
		request_id: String = "") -> Dictionary:
	if not _subjects.has(subject_id):
		return {"ok": false, "error": "unknown_subject"}
	if elapsed_minutes <= 0.0:
		return {"ok": false, "error": "elapsed_minutes_must_be_positive"}
	if not request_id.is_empty() and _catchup_requests.has(request_id):
		var existing: Dictionary = _catchup_requests[request_id]
		if str(existing.get("subject_id", "")) == subject_id \
				and is_equal_approx(
					float(existing.get("requested_minutes", 0.0)), elapsed_minutes):
			return existing.merged({"ok": true, "duplicate": true}, true)
		return {"ok": false, "error": "catchup_request_conflict"}
	var record: Dictionary = _subjects[subject_id]
	var before := float(record.get("pending_catchup_minutes", 0.0))
	var accepted := minf(
		elapsed_minutes, maxf(0.0, MAX_PENDING_CATCHUP_MINUTES - before))
	var dropped := maxf(0.0, elapsed_minutes - accepted)
	record["pending_catchup_minutes"] = before + accepted
	record["reconciliation_state"] = (
		"queued" if before + accepted > EPSILON else "ready")
	record["updated_tick"] = _world_tick()
	record["record_hash"] = _record_hash(record)
	_subjects[subject_id] = record
	var response := {
		"ok": true,
		"duplicate": false,
		"request_id": request_id,
		"subject_id": subject_id,
		"requested_minutes": elapsed_minutes,
		"accepted_minutes": accepted,
		"dropped_minutes": dropped,
		"pending_minutes": before + accepted,
		"clamped": dropped > EPSILON,
	}
	if not request_id.is_empty():
		_catchup_requests[request_id] = response.duplicate(true)
	subject_changed.emit(subject_id)
	return response


func plan_catchup(
		subject_id: String,
		requested_max_steps: int = -1,
		include_partial: bool = false) -> Dictionary:
	if not _subjects.has(subject_id):
		return {"ok": false, "error": "unknown_subject"}
	if _has_open_plan_for(subject_id):
		return {"ok": false, "error": "catchup_plan_open"}
	var record: Dictionary = _subjects[subject_id]
	var pending := float(record.get("pending_catchup_minutes", 0.0))
	if pending <= EPSILON:
		return {"ok": false, "error": "no_catchup_pending"}
	var mode := str(record.get("lod_mode", ""))
	var budget := workload_budget(mode)
	var cadence := float(budget.get("cadence_minutes", 1.0))
	var step_limit := int(budget.get("max_steps_per_pass", 1))
	if requested_max_steps > 0:
		step_limit = mini(step_limit, requested_max_steps)
	step_limit = mini(step_limit, MAX_GLOBAL_STEPS_PER_PASS)
	var minute_limit := float(budget.get("max_minutes_per_pass", cadence))
	var steps: Array[float] = []
	var remaining := minf(pending, minute_limit)
	while steps.size() < step_limit and remaining + EPSILON >= cadence:
		steps.append(cadence)
		remaining -= cadence
	if include_partial and steps.size() < step_limit and remaining > EPSILON:
		steps.append(remaining)
	if steps.is_empty():
		return {
			"ok": false,
			"error": "catchup_below_cadence",
			"pending_minutes": pending,
			"cadence_minutes": cadence,
		}
	var planned_minutes := 0.0
	for step_minutes in steps:
		planned_minutes += step_minutes
	_next_plan_sequence += 1
	var plan_id := "lod_plan.%d" % _next_plan_sequence
	var plan := {
		"plan_id": plan_id,
		"subject_id": subject_id,
		"owner_id": str(record.get("owner_id", "")),
		"domain_id": str(record.get("domain_id", "")),
		"lod_mode": mode,
		"base_revision": int(record.get("revision", 0)),
		"base_snapshot_hash": str(record.get("snapshot_hash", "")),
		"opened_tick": _world_tick(),
		"steps": steps,
		"planned_minutes": planned_minutes,
		"budget": budget,
	}
	_open_plans[plan_id] = plan
	record["reconciliation_state"] = "catching_up"
	record["record_hash"] = _record_hash(record)
	_subjects[subject_id] = record
	return {"ok": true, "plan": plan.duplicate(true)}


func plan_ready_work(
		max_subjects: int = 8,
		max_steps: int = MAX_GLOBAL_STEPS_PER_PASS,
		include_partial: bool = false) -> Dictionary:
	var subject_limit := clampi(max_subjects, 1, 64)
	var remaining_steps := clampi(max_steps, 1, MAX_GLOBAL_STEPS_PER_PASS)
	var plans: Array[Dictionary] = []
	for subject_id in subject_ids():
		if plans.size() >= subject_limit or remaining_steps <= 0:
			break
		if _has_open_plan_for(subject_id) \
				or pending_catchup_minutes(subject_id) <= EPSILON:
			continue
		var planned := plan_catchup(
			subject_id, remaining_steps, include_partial)
		if not bool(planned.get("ok", false)):
			continue
		var plan: Dictionary = planned.get("plan", {})
		plans.append(plan)
		remaining_steps -= (plan.get("steps", []) as Array).size()
	return {
		"ok": true,
		"plans": plans,
		"planned_subjects": plans.size(),
		"planned_steps": max_steps - remaining_steps,
	}


func commit_catchup(
		plan_id: String,
		applied_minutes: float,
		owner_snapshot: Dictionary,
		context: Dictionary = {}) -> Dictionary:
	if not _open_plans.has(plan_id):
		return {"ok": false, "error": "unknown_catchup_plan"}
	var plan: Dictionary = _open_plans[plan_id]
	var subject_id := str(plan.get("subject_id", ""))
	if not _subjects.has(subject_id):
		return {"ok": false, "error": "unknown_subject"}
	var record: Dictionary = _subjects[subject_id]
	if str(context.get("owner_id", "")) != str(record.get("owner_id", "")):
		return {"ok": false, "error": "owner_mismatch"}
	if not bool(context.get("owner_commit_validated", false)):
		return {"ok": false, "error": "owner_validation_required"}
	if not is_equal_approx(
			applied_minutes, float(plan.get("planned_minutes", 0.0))):
		return {"ok": false, "error": "catchup_minutes_mismatch"}
	if int(plan.get("base_revision", -1)) != int(record.get("revision", 0)) \
			or str(plan.get("base_snapshot_hash", "")) \
			!= str(record.get("snapshot_hash", "")):
		return {"ok": false, "error": "catchup_owner_state_changed"}
	var validation := validate_snapshot(owner_snapshot)
	if not bool(validation.get("ok", false)):
		return validation
	if _immutable_hash(owner_snapshot) != _immutable_hash(
			record.get("snapshot", {}) as Dictionary):
		return {"ok": false, "error": "immutable_identity_changed"}
	var next_revision := int(record.get("revision", 0)) + 1
	var tick := _world_tick()
	var payload := {
		"plan_id": plan_id,
		"subject_id": subject_id,
		"owner_id": str(record.get("owner_id", "")),
		"lod_mode": str(record.get("lod_mode", "")),
		"applied_minutes": applied_minutes,
		"before_snapshot_hash": str(record.get("snapshot_hash", "")),
		"after_snapshot_hash": _hash_value(owner_snapshot),
		"transaction_hash": str(context.get("transaction_hash", "")),
		"world_tick": tick,
	}
	var evidence_id := "evidence.lod.catchup.%s.%d" % [
		subject_id, next_revision]
	var evidence := _commit_evidence(
		evidence_id, "simulation_lod_catchup", payload, plan_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var remaining := maxf(
		0.0,
		float(record.get("pending_catchup_minutes", 0.0)) - applied_minutes)
	if remaining <= EPSILON:
		remaining = 0.0
	var history: Array = record.get("catchup_history", [])
	history.append({
		"plan_id": plan_id,
		"lod_mode": str(record.get("lod_mode", "")),
		"applied_minutes": applied_minutes,
		"remaining_minutes": remaining,
		"step_count": (plan.get("steps", []) as Array).size(),
		"world_tick": tick,
		"transaction_hash": str(context.get("transaction_hash", "")),
		"evidence_id": evidence_id,
	})
	_trim_history(history)
	record["snapshot"] = owner_snapshot.duplicate(true)
	record["snapshot_hash"] = _hash_value(owner_snapshot)
	record["invariant_hash"] = _invariant_hash(owner_snapshot)
	record["pending_catchup_minutes"] = remaining
	record["reconciliation_state"] = "ready" if remaining <= EPSILON else "queued"
	record["catchup_history"] = history
	record["last_simulated_tick"] = tick
	record["updated_tick"] = tick
	record["revision"] = next_revision
	_append_evidence_ref(record, evidence_id)
	_open_plans.erase(plan_id)
	record["record_hash"] = _record_hash(record)
	_subjects[subject_id] = record
	subject_changed.emit(subject_id)
	subjects_changed.emit()
	return {
		"ok": true,
		"subject_id": subject_id,
		"applied_minutes": applied_minutes,
		"remaining_minutes": remaining,
		"evidence_id": evidence_id,
		"record": record.duplicate(true),
	}


func cancel_catchup(plan_id: String, owner_id: String) -> Dictionary:
	if not _open_plans.has(plan_id):
		return {"ok": false, "error": "unknown_catchup_plan"}
	var plan: Dictionary = _open_plans[plan_id]
	var subject_id := str(plan.get("subject_id", ""))
	var record: Dictionary = _subjects.get(subject_id, {})
	if owner_id.is_empty() or owner_id != str(record.get("owner_id", "")):
		return {"ok": false, "error": "owner_mismatch"}
	_open_plans.erase(plan_id)
	record["reconciliation_state"] = (
		"queued"
		if float(record.get("pending_catchup_minutes", 0.0)) > EPSILON
		else "ready")
	record["record_hash"] = _record_hash(record)
	_subjects[subject_id] = record
	return {"ok": true, "subject_id": subject_id}


func serialize_state() -> Dictionary:
	var records: Array[Dictionary] = []
	for subject_id in subject_ids():
		var record: Dictionary = _subjects[subject_id].duplicate(true)
		if _has_open_plan_for(subject_id):
			record["reconciliation_state"] = (
				"queued"
				if float(record.get("pending_catchup_minutes", 0.0)) > EPSILON
				else "ready")
			record["record_hash"] = _record_hash(record)
		records.append(record)
	var requests: Array[Dictionary] = []
	var request_ids: Array = _catchup_requests.keys()
	request_ids.sort_custom(func(a: Variant, b: Variant) -> bool:
		return str(a) < str(b))
	for request_id in request_ids:
		requests.append((_catchup_requests[request_id] as Dictionary).duplicate(true))
	var result := {
		"schema": STATE_SCHEMA,
		"version": STATE_VERSION,
		"world_seed": world_seed,
		"world_id": world_id,
		"fractional_world_minutes": _fractional_world_minutes,
		"next_plan_sequence": _next_plan_sequence,
		"subjects": records,
		"catchup_requests": requests,
		"state_hash": "",
	}
	result["state_hash"] = _state_hash(result)
	return result


func restore_state(
		value: Variant,
		expected_seed: int,
		expected_world_id: String = "") -> bool:
	if not (value is Dictionary):
		return false
	var data: Dictionary = value
	if str(data.get("schema", "")) != STATE_SCHEMA \
			or int(data.get("version", 0)) != STATE_VERSION \
			or int(data.get("world_seed", -1)) != expected_seed \
			or not (data.get("subjects", []) is Array) \
			or not (data.get("catchup_requests", []) is Array) \
			or str(data.get("state_hash", "")) != _state_hash(data):
		return false
	var saved_world_id := str(data.get("world_id", ""))
	if not expected_world_id.is_empty() and not saved_world_id.is_empty() \
			and saved_world_id != expected_world_id:
		return false
	var restored_subjects := {}
	for record_value in data.get("subjects", []):
		if not (record_value is Dictionary):
			return false
		var record: Dictionary = record_value.duplicate(true)
		if not _validate_record(record):
			return false
		var subject_id := str(record.get("subject_id", ""))
		if restored_subjects.has(subject_id):
			return false
		restored_subjects[subject_id] = record
	var restored_requests := {}
	for request_value in data.get("catchup_requests", []):
		if not (request_value is Dictionary):
			return false
		var request: Dictionary = request_value.duplicate(true)
		var request_id := str(request.get("request_id", ""))
		var subject_id := str(request.get("subject_id", ""))
		if request_id.is_empty() or restored_requests.has(request_id) \
				or not restored_subjects.has(subject_id):
			return false
		restored_requests[request_id] = request
	initialized = true
	world_seed = expected_seed
	world_id = expected_world_id if not expected_world_id.is_empty() \
		else saved_world_id
	_fractional_world_minutes = clampf(
		float(data.get("fractional_world_minutes", 0.0)), 0.0, 0.999999)
	_next_plan_sequence = maxi(0, int(data.get("next_plan_sequence", 0)))
	_subjects = restored_subjects
	_catchup_requests = restored_requests
	_open_plans.clear()
	subjects_changed.emit()
	return true


func _validate_record(record: Dictionary) -> bool:
	if str(record.get("record_type", "")) != RECORD_TYPE \
			or int(record.get("version", 0)) != STATE_VERSION \
			or str(record.get("subject_id", "")).is_empty() \
			or str(record.get("domain_id", "")).is_empty() \
			or str(record.get("owner_id", "")).is_empty() \
			or str(record.get("region_id", "")).is_empty() \
			or str(record.get("lod_mode", "")) not in VALID_MODES \
			or int(record.get("revision", 0)) < 1:
		return false
	var snapshot_value: Variant = record.get("snapshot", {})
	if not (snapshot_value is Dictionary):
		return false
	var snapshot: Dictionary = snapshot_value
	if not bool(validate_snapshot(snapshot).get("ok", false)) \
			or str(record.get("snapshot_hash", "")) != _hash_value(snapshot) \
			or str(record.get("invariant_hash", "")) != _invariant_hash(snapshot) \
			or float(record.get("pending_catchup_minutes", -1.0)) < 0.0 \
			or float(record.get("pending_catchup_minutes", 0.0)) \
				> MAX_PENDING_CATCHUP_MINUTES + EPSILON:
		return false
	for field in ["evidence_refs", "transition_history", "catchup_history"]:
		if not (record.get(field, []) is Array):
			return false
	return str(record.get("record_hash", "")) == _record_hash(record)


func _commit_evidence(
		evidence_id: String,
		event_type: String,
		payload: Dictionary,
		correlation_id: String) -> Dictionary:
	var payload_hash := _hash_value(payload)
	var envelope := ProductionKernel.make_evidence_envelope(
		evidence_id, "simulation_lod", event_type, payload_hash, correlation_id)
	var committed := ProductionKernel.commit_evidence(envelope)
	if not bool(committed.get("ok", false)):
		return committed
	var published := ProductionKernel.publish_event(
		"event.%s" % evidence_id.trim_prefix("evidence."),
		"simulation_lod", event_type, payload_hash, [evidence_id])
	if not bool(published.get("ok", false)):
		return published
	return {"ok": true, "evidence_id": evidence_id}


func _append_evidence_ref(record: Dictionary, evidence_id: String) -> void:
	var refs: Array = record.get("evidence_refs", [])
	if evidence_id not in refs:
		refs.append(evidence_id)
	_trim_history(refs)
	record["evidence_refs"] = refs


func _find_history_entry(
		history_value: Variant, field: String, expected: String) -> Dictionary:
	if not (history_value is Array):
		return {}
	for entry_value in history_value:
		if entry_value is Dictionary \
				and str(entry_value.get(field, "")) == expected:
			return entry_value
	return {}


func _has_open_plan_for(subject_id: String) -> bool:
	for plan_value in _open_plans.values():
		if plan_value is Dictionary \
				and str(plan_value.get("subject_id", "")) == subject_id:
			return true
	return false


func _trim_history(history: Array) -> void:
	while history.size() > MAX_HISTORY:
		history.pop_front()


func _world_tick() -> int:
	return int(ProductionKernel.world_time_reference().get("world_tick", 0))


func _immutable_hash(snapshot: Dictionary) -> String:
	return _hash_value({
		"identity": snapshot.get("identity", {}),
	})


func _invariant_hash(snapshot: Dictionary) -> String:
	return _hash_value({
		"identity": snapshot.get("identity", {}),
		"ownership": snapshot.get("ownership", {}),
		"quantities": snapshot.get("quantities", {}),
		"history": snapshot.get("history", []),
		"irreversible": snapshot.get("irreversible", {}),
	})


func _record_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	payload.erase("record_hash")
	return _hash_value(payload)


func _state_hash(state: Dictionary) -> String:
	var payload := state.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _hash_value(value: Variant) -> String:
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(_canonical_json(value).to_utf8_buffer())
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
				JSON.stringify(str(key)),
				_canonical_json(dictionary[key]),
			])
		return "{%s}" % ",".join(entries)
	if value is Array:
		var entries: Array[String] = []
		for entry in value:
			entries.append(_canonical_json(entry))
		return "[%s]" % ",".join(entries)
	if value is int or value is float:
		# LOD records embed projections from multiple owners. Godot's JSON writer
		# rounds harmless binary arithmetic tails, so use the same persistence-safe
		# precision as the biological and social owners that supply those records.
		return String.num(float(value), 12)
	return JSON.stringify(value)
