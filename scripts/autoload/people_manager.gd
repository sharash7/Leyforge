extends Node
## Canonical Document-07 owner for persistent ordinary people.
##
## HamletState and SettlementManager remain gameplay-compatible projections.
## This owner stores only persistent person identity, household operation,
## ordinary job assignment and broad schedule intent. Economy, social state,
## biology and movement remain external typed references owned by Sets 27-30.

signal people_changed
signal person_changed(person_id: String)
signal households_changed
signal jobs_changed
signal schedules_changed

const STATE_SCHEMA := "leyforge.people-state"
const STATE_VERSION := 1
const PERSON_RECORD_TYPE := "PersistentPerson"
const HOUSEHOLD_RECORD_TYPE := "PersistentHousehold"
const JOB_RECORD_TYPE := "OrdinaryJobAssignment"
const SCHEDULE_RECORD_TYPE := "OrdinarySchedule"
const EVIDENCE_OWNER := "document07.people"
const MAX_EVIDENCE_REFS := 128

const VALID_EXISTENCE_STATES: Array[String] = [
	"alive", "dead", "departed", "missing", "retired",
]
const VALID_SPECIALIST_DOMAINS: Array[String] = [
	"set27_economy", "set28_social", "set29_biology", "set30_movement",
]
const SPECIALIST_REF_FIELDS := {
	"set27_economy": "economic_party_ref",
	"set28_social": "social_profile_ref",
	"set29_biology": "biological_record_ref",
	"set30_movement": "movement_record_ref",
}

var initialized := false
var restored_from_state := false
var world_seed := 0
var world_id := ""
var _people: Dictionary = {}
var _households: Dictionary = {}
var _job_assignments: Dictionary = {}
var _schedules: Dictionary = {}


func reset() -> void:
	initialized = false
	restored_from_state = false
	world_seed = 0
	world_id = ""
	_people.clear()
	_households.clear()
	_job_assignments.clear()
	_schedules.clear()


func initialize(seed_value: int, requested_world_id: String = "") -> void:
	if initialized and world_seed == seed_value \
			and (requested_world_id.is_empty() or world_id == requested_world_id):
		return
	reset()
	initialized = true
	world_seed = seed_value
	world_id = requested_world_id


func person_ids(settlement_id: String = "") -> Array[String]:
	var result: Array[String] = []
	for person_value in _people.keys():
		var person_id := str(person_value)
		if settlement_id.is_empty() or str(
				(_people[person_id] as Dictionary).get("settlement_id", "")) \
				== settlement_id:
			result.append(person_id)
	result.sort()
	return result


func household_ids(settlement_id: String = "") -> Array[String]:
	var result: Array[String] = []
	for household_value in _households.keys():
		var household_id := str(household_value)
		if settlement_id.is_empty() or str(
				(_households[household_id] as Dictionary).get(
					"settlement_id", "")) == settlement_id:
			result.append(household_id)
	result.sort()
	return result


func job_assignment_ids(settlement_id: String = "") -> Array[String]:
	var result: Array[String] = []
	for assignment_value in _job_assignments.keys():
		var assignment_id := str(assignment_value)
		if settlement_id.is_empty() or str(
				(_job_assignments[assignment_id] as Dictionary).get(
					"settlement_id", "")) == settlement_id:
			result.append(assignment_id)
	result.sort()
	return result


func schedule_ids(settlement_id: String = "") -> Array[String]:
	var result: Array[String] = []
	for schedule_value in _schedules.keys():
		var schedule_id := str(schedule_value)
		if settlement_id.is_empty() or str(
				(_schedules[schedule_id] as Dictionary).get(
					"settlement_id", "")) == settlement_id:
			result.append(schedule_id)
	result.sort()
	return result


func person_count(settlement_id: String = "") -> int:
	return person_ids(settlement_id).size()


func household_count(settlement_id: String = "") -> int:
	return household_ids(settlement_id).size()


func has_person(person_id: String) -> bool:
	return _people.has(person_id)


func get_person(person_id: String) -> Dictionary:
	return (_people.get(person_id, {}) as Dictionary).duplicate(true)


func get_household(household_id: String) -> Dictionary:
	return (_households.get(household_id, {}) as Dictionary).duplicate(true)


func get_job_assignment(assignment_id: String) -> Dictionary:
	return (_job_assignments.get(assignment_id, {}) as Dictionary).duplicate(true)


func get_schedule(schedule_id: String) -> Dictionary:
	return (_schedules.get(schedule_id, {}) as Dictionary).duplicate(true)


func schedule_for_person(person_id: String) -> Dictionary:
	if not _people.has(person_id):
		return {}
	return get_schedule(str((_people[person_id] as Dictionary).get(
		"schedule_id", "")))


func register_person_projection(
		settlement_id: String,
		projection: Dictionary,
		source_kind: String = "compatibility") -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "people_owner_not_initialized"}
	var person_id := _person_id_from(projection)
	if settlement_id.is_empty() or person_id.is_empty():
		return {"ok": false, "error": "NPC-ID-001"}
	if _people.has(person_id):
		var candidate := _person_from_projection(
			settlement_id, projection, source_kind, _people[person_id])
		if _person_semantic_hash(candidate) \
				== _person_semantic_hash(_people[person_id]):
			return {
				"ok": true,
				"duplicate": true,
				"person": get_person(person_id),
			}
		return {"ok": false, "error": "person_identity_conflict"}
	var record := _person_from_projection(
		settlement_id, projection, source_kind, {})
	var validation := validate_person_record(record, false)
	if not bool(validation.get("ok", false)):
		return validation
	var payload := {
		"action": "register_person",
		"person_id": person_id,
		"settlement_id": settlement_id,
		"person_hash": _person_semantic_hash(record),
		"source_kind": source_kind,
	}
	var evidence_id := _evidence_id("person.register", person_id, 1)
	var evidence := _commit_evidence(
		evidence_id, "persistent_person_registered", payload, source_kind)
	if not bool(evidence.get("ok", false)):
		return evidence
	record["evidence_refs"] = [evidence_id]
	record["state_hash"] = _record_hash(record)
	_people[person_id] = record
	var assignment := _sync_job_assignment(record, projection, source_kind)
	if not bool(assignment.get("ok", false)):
		return assignment
	var schedule := _sync_schedule(record, projection, source_kind)
	if not bool(schedule.get("ok", false)):
		return schedule
	_rebuild_households_for_settlement(settlement_id, {}, source_kind)
	person_changed.emit(person_id)
	people_changed.emit()
	return {
		"ok": true,
		"duplicate": false,
		"evidence_id": evidence_id,
		"person": get_person(person_id),
	}


func update_person_projection(
		person_id: String,
		projection: Dictionary,
		mutation_id: String = "compatibility_update") -> Dictionary:
	if not _people.has(person_id):
		return {"ok": false, "error": "unknown_person"}
	if _person_id_from(projection) not in ["", person_id]:
		return {"ok": false, "error": "person_identity_conflict"}
	var before: Dictionary = _people[person_id]
	var settlement_id := str(before.get("settlement_id", ""))
	var candidate := _person_from_projection(
		settlement_id, projection, str(before.get("source_kind", "")), before)
	var validation := validate_person_record(candidate, false)
	if not bool(validation.get("ok", false)):
		return validation
	if _person_semantic_hash(candidate) == _person_semantic_hash(before):
		return {"ok": true, "duplicate": true, "person": before.duplicate(true)}
	var old_household_id := str(before.get("household_id", ""))
	var old_assignment_id := str(before.get("job_assignment_id", ""))
	var next_revision := int(before.get("revision", 0)) + 1
	var payload := {
		"action": "update_person",
		"person_id": person_id,
		"before_hash": _person_semantic_hash(before),
		"after_hash": _person_semantic_hash(candidate),
		"mutation_id": mutation_id,
	}
	var evidence_id := _evidence_id("person.update", person_id, next_revision)
	var evidence := _commit_evidence(
		evidence_id, "persistent_person_updated", payload, mutation_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	candidate["revision"] = next_revision
	candidate["created_tick"] = int(before.get("created_tick", 0))
	candidate["updated_tick"] = _world_tick()
	candidate["evidence_refs"] = _append_ref(
		before.get("evidence_refs", []) as Array, evidence_id)
	candidate["state_hash"] = _record_hash(candidate)
	_people[person_id] = candidate
	var new_assignment_id := str(candidate.get("job_assignment_id", ""))
	if not old_assignment_id.is_empty() and old_assignment_id != new_assignment_id:
		_close_job_assignment(old_assignment_id, new_assignment_id, mutation_id)
	var assignment := _sync_job_assignment(candidate, projection, mutation_id)
	if not bool(assignment.get("ok", false)):
		return assignment
	var schedule := _sync_schedule(candidate, projection, mutation_id)
	if not bool(schedule.get("ok", false)):
		return schedule
	_rebuild_households_for_settlement(settlement_id, {}, mutation_id)
	if not old_household_id.is_empty() \
			and old_household_id != str(candidate.get("household_id", "")):
		households_changed.emit()
	person_changed.emit(person_id)
	people_changed.emit()
	return {
		"ok": true,
		"duplicate": false,
		"evidence_id": evidence_id,
		"person": get_person(person_id),
	}


func set_existence_state(
		person_id: String,
		existence_state: String,
		mutation_id: String = "lifecycle_update") -> Dictionary:
	if existence_state not in VALID_EXISTENCE_STATES:
		return {"ok": false, "error": "invalid_existence_state"}
	if not _people.has(person_id):
		return {"ok": false, "error": "unknown_person"}
	var projection := compatibility_person_view(person_id, {})
	projection["alive"] = existence_state == "alive"
	projection["existence_state"] = existence_state
	return update_person_projection(person_id, projection, mutation_id)


func set_schedule_intent(
		person_id: String,
		intent: String,
		target_ref: String = "",
		mutation_id: String = "schedule_update") -> Dictionary:
	if not _people.has(person_id):
		return {"ok": false, "error": "unknown_person"}
	if intent.strip_edges().is_empty():
		return {"ok": false, "error": "NPC-SCHED-001"}
	var person: Dictionary = _people[person_id]
	var schedule_id := str(person.get("schedule_id", ""))
	if not _schedules.has(schedule_id):
		return {"ok": false, "error": "NPC-SCHED-001"}
	var before: Dictionary = _schedules[schedule_id]
	if str(before.get("current_intent", "")) == intent \
			and str(before.get("target_ref", "")) == target_ref:
		return {"ok": true, "duplicate": true, "schedule": before.duplicate(true)}
	var candidate := before.duplicate(true)
	candidate["current_intent"] = intent
	candidate["target_ref"] = target_ref
	return _store_schedule_change(candidate, before, mutation_id)


func set_external_domain_ref(
		person_id: String,
		domain: String,
		record_ref: String,
		source_revision: int,
		mutation_id: String) -> Dictionary:
	if not _people.has(person_id):
		return {"ok": false, "error": "unknown_person"}
	if domain not in VALID_SPECIALIST_DOMAINS or record_ref.is_empty() \
			or source_revision < 0 or mutation_id.is_empty():
		return {"ok": false, "error": "invalid_specialist_reference"}
	var before: Dictionary = _people[person_id]
	var projection := compatibility_person_view(person_id, {})
	var refs: Dictionary = (
		before.get("external_domain_refs", {}) as Dictionary).duplicate(true)
	refs[str(SPECIALIST_REF_FIELDS[domain])] = record_ref
	refs["%s_revision" % domain] = source_revision
	projection["external_domain_refs"] = refs
	return update_person_projection(person_id, projection, mutation_id)


func reconcile_settlement_projection(
		settlement_id: String,
		resident_value: Variant,
		household_value: Variant = {},
		job_slot_value: Variant = {},
		source_kind: String = "settlement_projection",
		allow_existing_updates: bool = false) -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "people_owner_not_initialized"}
	if settlement_id.is_empty() or not (resident_value is Dictionary):
		return {"ok": false, "error": "invalid_settlement_projection"}
	var residents: Dictionary = resident_value
	var projected_residents := residents.duplicate(true)
	var resident_ids: Array = residents.keys()
	resident_ids.sort_custom(func(a: Variant, b: Variant) -> bool:
		return str(a) < str(b))
	for resident_value_id in resident_ids:
		var person_id := str(resident_value_id)
		if not (residents[resident_value_id] is Dictionary):
			return {"ok": false, "error": "invalid_person_projection"}
		var projection: Dictionary = residents[resident_value_id].duplicate(true)
		projection["id"] = person_id
		projection["resident_id"] = person_id
		var result: Dictionary
		if not _people.has(person_id):
			result = register_person_projection(
				settlement_id, projection, source_kind)
		elif allow_existing_updates:
			result = update_person_projection(
				person_id, projection, "%s.reconcile" % source_kind)
		else:
			result = {"ok": true, "duplicate": true}
		if not bool(result.get("ok", false)):
			return result
	var households: Dictionary = (
		household_value if household_value is Dictionary else {})
	var rebuilt := _rebuild_households_for_settlement(
		settlement_id, households, source_kind)
	if not bool(rebuilt.get("ok", false)):
		return rebuilt
	var job_slots: Dictionary = (
		job_slot_value if job_slot_value is Dictionary else {})
	for person_id in person_ids(settlement_id):
		var person: Dictionary = _people[person_id]
		var assignment_id := str(person.get("job_assignment_id", ""))
		var slot: Dictionary = {}
		if not assignment_id.is_empty() and job_slots.has(assignment_id) \
				and job_slots[assignment_id] is Dictionary:
			slot = job_slots[assignment_id]
		var assignment := _sync_job_assignment(person, slot, source_kind)
		if not bool(assignment.get("ok", false)):
			return assignment
		var projection: Dictionary = residents.get(person_id, {})
		var schedule := _sync_schedule(person, projection, source_kind)
		if not bool(schedule.get("ok", false)):
			return schedule
	for person_id in person_ids(settlement_id):
		projected_residents[person_id] = compatibility_person_view(
			person_id, projected_residents.get(person_id, {}))
	return {
		"ok": true,
		"resident_records": projected_residents,
		"households": compatibility_household_views(
			settlement_id, households),
		"job_slots": compatibility_job_slot_views(
			settlement_id, job_slots),
		"person_count": person_ids(settlement_id).size(),
		"household_count": household_ids(settlement_id).size(),
	}


func compatibility_person_view(
		person_id: String, compatibility: Dictionary) -> Dictionary:
	var result := compatibility.duplicate(true)
	if not _people.has(person_id):
		return result
	var person: Dictionary = _people[person_id]
	var identity: Dictionary = person.get("identity", {})
	var life_stage: Dictionary = person.get("life_stage", {})
	result["id"] = person_id
	result["resident_id"] = person_id
	result["person_id"] = person_id
	result["name"] = str(identity.get("display_name", result.get("name", "")))
	result["alive"] = str(person.get("existence_state", "alive")) == "alive"
	result["existence_state"] = str(person.get("existence_state", "alive"))
	result["age_days"] = int(life_stage.get("age_days", 0))
	result["age_band"] = str(life_stage.get("age_band", "adult"))
	for field in [
		"household_id", "residence_id", "bed_id", "job_assignment_id",
		"job_definition_ref", "schedule_id",
	]:
		result[field] = person.get(field, "")
	result["job_id"] = str(person.get("job_definition_ref", ""))
	result["home"] = (person.get("residence_anchor", []) as Array).duplicate(true)
	result["work"] = (person.get("workplace_anchor", []) as Array).duplicate(true)
	var assignment := get_job_assignment(str(person.get("job_assignment_id", "")))
	if not assignment.is_empty():
		result["job"] = str(assignment.get(
			"display_name", result.get("job", "")))
		result["workplace_id"] = str(assignment.get("workplace_ref", ""))
		result["workplace_role_ref"] = str(
			assignment.get("workplace_role_ref", ""))
	var schedule := schedule_for_person(person_id)
	if not schedule.is_empty():
		result["schedule_state"] = str(schedule.get("current_intent", ""))
		result["schedule_profile_ref"] = str(schedule.get("profile_ref", ""))
		result["current_task_intent_ref"] = str(
			schedule.get("current_task_intent_ref", ""))
	result["authoritative_person_record_type"] = PERSON_RECORD_TYPE
	result["authoritative_person_revision"] = int(person.get("revision", 0))
	result["authoritative_person_state_hash"] = str(
		person.get("state_hash", ""))
	return result


func compatibility_household_views(
		settlement_id: String, compatibility: Dictionary = {}) -> Dictionary:
	var result := compatibility.duplicate(true)
	for household_id in household_ids(settlement_id):
		var household: Dictionary = _households[household_id]
		var view: Dictionary = result.get(household_id, {}).duplicate(true)
		view["record_type"] = "Household"
		view["version"] = 1
		view["household_id"] = household_id
		view["settlement_id"] = settlement_id
		view["resident_ids"] = (
			household.get("member_person_ids", []) as Array).duplicate(true)
		view["residence_refs"] = (
			household.get("residence_refs", []) as Array).duplicate(true)
		view["displacement_state"] = str(
			household.get("displacement_state", "none"))
		view["authoritative_household_record_type"] = HOUSEHOLD_RECORD_TYPE
		view["authoritative_household_revision"] = int(
			household.get("revision", 0))
		view["authoritative_household_state_hash"] = str(
			household.get("state_hash", ""))
		result[household_id] = view
	return result


func compatibility_job_slot_views(
		settlement_id: String, compatibility: Dictionary = {}) -> Dictionary:
	var result := compatibility.duplicate(true)
	for assignment_id in job_assignment_ids(settlement_id):
		var assignment: Dictionary = _job_assignments[assignment_id]
		var has_physical_slot := result.has(assignment_id)
		var view: Dictionary = result.get(assignment_id, {}).duplicate(true)
		var physical_slot_active := bool(view.get("active", true)) \
			if has_physical_slot else false
		var assignment_active := bool(assignment.get("active", false))
		view["record_type"] = "JobAssignment"
		view["job_assignment_id"] = assignment_id
		view["assigned_person_id"] = str(assignment.get(
			"person_id", "")) if assignment_active else ""
		view["job_definition_ref"] = str(
			assignment.get("job_definition_ref", ""))
		if assignment_active:
			view["role"] = str(assignment.get("workplace_role_ref", ""))
		view["active"] = physical_slot_active
		view["physical_slot"] = has_physical_slot
		view["assignment_active"] = assignment_active
		view["authoritative_job_record_type"] = JOB_RECORD_TYPE
		view["authoritative_job_revision"] = int(
			assignment.get("revision", 0))
		view["authoritative_job_state_hash"] = str(
			assignment.get("state_hash", ""))
		result[assignment_id] = view
	return result


func person_interface(person_id: String) -> Dictionary:
	if not _people.has(person_id):
		return {}
	var person: Dictionary = _people[person_id]
	return {
		"schema": "leyforge.document07.person-interface",
		"version": STATE_VERSION,
		"person_id": person_id,
		"existence_state": str(person.get("existence_state", "")),
		"settlement_ref": str(person.get("settlement_id", "")),
		"household_ref": str(person.get("household_id", "")),
		"residence_ref": str(person.get("residence_id", "")),
		"job_assignment_ref": str(person.get("job_assignment_id", "")),
		"schedule_ref": str(person.get("schedule_id", "")),
		"source_revision": int(person.get("revision", 0)),
		"authoritative_world_time": ProductionKernel.world_time_reference(),
	}


func household_interface(household_id: String) -> Dictionary:
	if not _households.has(household_id):
		return {}
	var household: Dictionary = _households[household_id]
	return {
		"schema": "leyforge.document07.household-interface",
		"version": STATE_VERSION,
		"household_id": household_id,
		"settlement_ref": str(household.get("settlement_id", "")),
		"member_person_refs": (
			household.get("member_person_ids", []) as Array).duplicate(true),
		"residence_refs": (
			household.get("residence_refs", []) as Array).duplicate(true),
		"displacement_state": str(
			household.get("displacement_state", "none")),
		"source_revision": int(household.get("revision", 0)),
		"authoritative_world_time": ProductionKernel.world_time_reference(),
	}


func job_assignment_interface(assignment_id: String) -> Dictionary:
	if not _job_assignments.has(assignment_id):
		return {}
	var assignment: Dictionary = _job_assignments[assignment_id]
	return {
		"schema": "leyforge.document07.job-assignment-interface",
		"version": STATE_VERSION,
		"job_assignment_id": assignment_id,
		"person_ref": str(assignment.get("person_id", "")),
		"settlement_ref": str(assignment.get("settlement_id", "")),
		"job_definition_ref": str(
			assignment.get("job_definition_ref", "")),
		"workplace_ref": str(assignment.get("workplace_ref", "")),
		"workplace_role_ref": str(
			assignment.get("workplace_role_ref", "")),
		"schedule_ref": str(assignment.get("schedule_id", "")),
		"active": bool(assignment.get("active", false)),
		"economic_employment_ref": str(
			assignment.get("economic_employment_ref", "")),
		"source_revision": int(assignment.get("revision", 0)),
		"authoritative_world_time": ProductionKernel.world_time_reference(),
	}


func schedule_interface(person_id: String) -> Dictionary:
	var schedule := schedule_for_person(person_id)
	if schedule.is_empty():
		return {}
	return {
		"schema": "leyforge.document07.schedule-interface",
		"version": STATE_VERSION,
		"schedule_id": str(schedule.get("schedule_id", "")),
		"person_ref": person_id,
		"profile_ref": str(schedule.get("profile_ref", "")),
		"current_intent": str(schedule.get("current_intent", "")),
		"window_ref": str(schedule.get("window_ref", "")),
		"target_ref": str(schedule.get("target_ref", "")),
		"current_task_intent_ref": str(
			schedule.get("current_task_intent_ref", "")),
		"source_revision": int(schedule.get("revision", 0)),
		"authoritative_world_time": ProductionKernel.world_time_reference(),
	}


func specialist_context(person_id: String, domain: String) -> Dictionary:
	if not _people.has(person_id) or domain not in VALID_SPECIALIST_DOMAINS:
		return {}
	var person: Dictionary = _people[person_id]
	var refs: Dictionary = person.get("external_domain_refs", {})
	var ref_field := str(SPECIALIST_REF_FIELDS[domain])
	return {
		"schema": "leyforge.document07.specialist-context",
		"version": STATE_VERSION,
		"consumer_domain": domain,
		"person_ref": person_id,
		"settlement_ref": str(person.get("settlement_id", "")),
		"household_ref": str(person.get("household_id", "")),
		"job_assignment_ref": str(person.get("job_assignment_id", "")),
		"schedule_ref": str(person.get("schedule_id", "")),
		"specialist_record_ref": str(refs.get(ref_field, "")),
		"specialist_resolution_state": (
			"resolved" if not str(refs.get(ref_field, "")).is_empty()
			else "recoverable_unresolved"),
		"source_revision": int(person.get("revision", 0)),
		"authoritative_world_time": ProductionKernel.world_time_reference(),
	}


func movement_intent_for_person(
		person_id: String, request_id: String = "") -> Dictionary:
	if not _people.has(person_id):
		return {"ok": false, "error": "unknown_person"}
	var person: Dictionary = _people[person_id]
	var schedule := schedule_for_person(person_id)
	if schedule.is_empty():
		return {"ok": false, "error": "NPC-SCHED-001"}
	var intent := str(schedule.get("current_intent", ""))
	var goal_ref := str(schedule.get("target_ref", ""))
	if goal_ref.is_empty():
		goal_ref = str(person.get(
			"workplace_ref", "")) if intent in ["work", "training"] \
			else str(person.get("residence_id", "")) \
			if intent in ["sleep", "rest", "home", "household"] \
			else str(person.get("settlement_id", ""))
	if goal_ref.is_empty():
		goal_ref = str(person.get("settlement_id", ""))
	if request_id.is_empty():
		request_id = "movement_intent.%s.%d" % [
			person_id, int(schedule.get("revision", 0))]
	return {
		"ok": true,
		"schema": "leyforge.xset.external-movement-intent",
		"version": STATE_VERSION,
		"movement_intent_id": request_id,
		"request_owner": EVIDENCE_OWNER,
		"requester_entity_or_group_ref": person_id,
		"goal_type": "schedule_intent",
		"goal_ref_or_region": goal_ref,
		"arrival_profile_id": "arrival.schedule.%s" % intent,
		"urgency": "routine",
		"task_or_assignment_ref": str(
			schedule.get("current_task_intent_ref", "")),
		"revision": int(schedule.get("revision", 0)),
	}


func lod_identity_snapshot(person_id: String) -> Dictionary:
	if not _people.has(person_id):
		return {}
	var person: Dictionary = _people[person_id]
	var identity: Dictionary = person.get("identity", {})
	return {
		"identity": {
			"record_type": PERSON_RECORD_TYPE,
			"version": STATE_VERSION,
			"person_id": person_id,
			"resident_id": person_id,
			"name": str(identity.get("display_name", "")),
			"identity_seed": str(identity.get("identity_seed", "")),
		},
		"ownership": {
			"settlement_id": str(person.get("settlement_id", "")),
			"household_id": str(person.get("household_id", "")),
			"residence_id": str(person.get("residence_id", "")),
			"bed_id": str(person.get("bed_id", "")),
			"job_id": str(person.get("job_definition_ref", "")),
			"job_assignment_id": str(person.get("job_assignment_id", "")),
			"schedule_id": str(person.get("schedule_id", "")),
		},
		"irreversible": {
			"person_id": person_id,
			"existence_state": str(person.get("existence_state", "")),
		},
	}


func serialize_state() -> Dictionary:
	var data := {
		"schema": STATE_SCHEMA,
		"version": STATE_VERSION,
		"world_seed": world_seed,
		"world_id": world_id,
		"people": _sorted_records(_people, "person_id"),
		"households": _sorted_records(_households, "household_id"),
		"job_assignments": _sorted_records(
			_job_assignments, "job_assignment_id"),
		"schedules": _sorted_records(_schedules, "schedule_id"),
		"state_hash": "",
	}
	data["state_hash"] = _state_hash(data)
	return data


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
			or str(data.get("state_hash", "")) != _state_hash(data):
		return false
	var saved_world_id := str(data.get("world_id", ""))
	if not expected_world_id.is_empty() and not saved_world_id.is_empty() \
			and saved_world_id != expected_world_id:
		return false
	for field in ["people", "households", "job_assignments", "schedules"]:
		if not (data.get(field, []) is Array):
			return false
	var people_result := _restore_records(data.get("people", []), "person_id")
	var household_result := _restore_records(
		data.get("households", []), "household_id")
	var job_result := _restore_records(
		data.get("job_assignments", []), "job_assignment_id")
	var schedule_result := _restore_records(
		data.get("schedules", []), "schedule_id")
	for result in [people_result, household_result, job_result, schedule_result]:
		if not bool((result as Dictionary).get("ok", false)):
			return false
	var restored_people: Dictionary = people_result.get("records", {})
	var restored_households: Dictionary = household_result.get("records", {})
	var restored_jobs: Dictionary = job_result.get("records", {})
	var restored_schedules: Dictionary = schedule_result.get("records", {})
	for person_id in restored_people:
		var person: Dictionary = restored_people[person_id]
		if not bool(validate_person_record(person).get("ok", false)):
			return false
		var household_id := str(person.get("household_id", ""))
		if not household_id.is_empty() and not restored_households.has(household_id):
			return false
		var assignment_id := str(person.get("job_assignment_id", ""))
		if not assignment_id.is_empty() and not restored_jobs.has(assignment_id):
			return false
		var schedule_id := str(person.get("schedule_id", ""))
		if schedule_id.is_empty() or not restored_schedules.has(schedule_id):
			return false
	for household_id in restored_households:
		var household: Dictionary = restored_households[household_id]
		if not bool(validate_household_record(household).get("ok", false)):
			return false
		for member_value in household.get("member_person_ids", []):
			var person_id := str(member_value)
			if not restored_people.has(person_id) \
					or str(restored_people[person_id].get("household_id", "")) \
					!= str(household_id):
				return false
	for assignment_id in restored_jobs:
		var assignment: Dictionary = restored_jobs[assignment_id]
		if not bool(validate_job_record(assignment).get("ok", false)) \
				or not restored_people.has(str(assignment.get("person_id", ""))):
			return false
	for schedule_id in restored_schedules:
		var schedule: Dictionary = restored_schedules[schedule_id]
		if not bool(validate_schedule_record(schedule).get("ok", false)) \
				or not restored_people.has(str(schedule.get("person_id", ""))):
			return false
	initialized = true
	restored_from_state = true
	world_seed = expected_seed
	world_id = expected_world_id if not expected_world_id.is_empty() \
		else saved_world_id
	_people = restored_people
	_households = restored_households
	_job_assignments = restored_jobs
	_schedules = restored_schedules
	people_changed.emit()
	households_changed.emit()
	jobs_changed.emit()
	schedules_changed.emit()
	return true


func validate_person_record(
		record: Dictionary, require_hash: bool = true) -> Dictionary:
	if str(record.get("record_type", "")) != PERSON_RECORD_TYPE \
			or int(record.get("version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_person_record"}
	for field in ["person_id", "settlement_id", "schedule_id"]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	if not (record.get("identity", {}) is Dictionary) \
			or str((record.get("identity", {}) as Dictionary).get(
				"display_name", "")).is_empty():
		return {"ok": false, "error": "NPC-ID-001"}
	if str(record.get("existence_state", "")) not in VALID_EXISTENCE_STATES:
		return {"ok": false, "error": "invalid_existence_state"}
	if not (record.get("life_stage", {}) is Dictionary) \
			or not (record.get("external_domain_refs", {}) is Dictionary) \
			or not (record.get("evidence_refs", []) is Array):
		return {"ok": false, "error": "invalid_person_fields"}
	if int(record.get("revision", 0)) < 1:
		return {"ok": false, "error": "invalid_person_revision"}
	if require_hash and str(record.get("state_hash", "")) \
			!= _record_hash(record):
		return {"ok": false, "error": "person_hash_mismatch"}
	return {"ok": true}


func validate_household_record(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != HOUSEHOLD_RECORD_TYPE \
			or int(record.get("version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_household_record"}
	for field in ["household_id", "settlement_id"]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	for field in [
		"member_person_ids", "residence_refs", "shared_storage_refs",
		"history_refs", "evidence_refs",
	]:
		if not (record.get(field, []) is Array):
			return {"ok": false, "error": "invalid_%s" % field}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "household_hash_mismatch"}
	return {"ok": true}


func validate_job_record(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != JOB_RECORD_TYPE \
			or int(record.get("version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_job_record"}
	for field in ["job_assignment_id", "person_id", "settlement_id"]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "job_hash_mismatch"}
	return {"ok": true}


func validate_schedule_record(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != SCHEDULE_RECORD_TYPE \
			or int(record.get("version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_schedule_record"}
	for field in ["schedule_id", "person_id", "settlement_id", "current_intent"]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "schedule_hash_mismatch"}
	return {"ok": true}


func _person_from_projection(
		settlement_id: String,
		projection: Dictionary,
		source_kind: String,
		existing: Dictionary) -> Dictionary:
	var person_id := _person_id_from(projection)
	if person_id.is_empty():
		person_id = str(existing.get("person_id", ""))
	var identity: Dictionary = (
		existing.get("identity", {}) as Dictionary).duplicate(true)
	identity["display_name"] = str(projection.get(
		"name", identity.get("display_name", person_id)))
	identity["source_profile_ref"] = str(projection.get(
		"source_profile_ref", identity.get(
			"source_profile_ref", "npc_profile.compatibility")))
	if str(identity.get("identity_seed", "")).is_empty():
		identity["identity_seed"] = str(projection.get(
			"identity_seed", _hash_value({
				"world_seed": world_seed,
				"person_id": person_id,
			}).substr(0, 24)))
	identity["provenance"] = identity.get("provenance", {
		"world_id": world_id,
		"world_seed": world_seed,
		"settlement_id": settlement_id,
		"source_kind": source_kind,
	}).duplicate(true)
	var existence_state := str(projection.get(
		"existence_state", existing.get(
			"existence_state", "alive" if bool(projection.get(
				"alive", true)) else "dead")))
	var job_definition_ref := str(projection.get(
		"job_id", projection.get(
			"job_definition_ref", existing.get("job_definition_ref", ""))))
	var assignment_id := str(projection.get(
		"job_assignment_id", existing.get("job_assignment_id", "")))
	if assignment_id.is_empty() and not job_definition_ref.is_empty():
		assignment_id = "%s.assignment.ordinary" % person_id
	var schedule_id := str(projection.get(
		"schedule_id", existing.get(
			"schedule_id", "%s.schedule.ordinary" % person_id)))
	var refs: Dictionary = (
		existing.get("external_domain_refs", {}) as Dictionary).duplicate(true)
	if projection.get("external_domain_refs", {}) is Dictionary:
		refs.merge(
			projection.get("external_domain_refs", {}) as Dictionary, true)
	for ref_field in SPECIALIST_REF_FIELDS.values():
		var field := str(ref_field)
		if projection.has(field):
			refs[field] = str(projection.get(field, ""))
	for field in SPECIALIST_REF_FIELDS.values():
		if not refs.has(str(field)):
			refs[str(field)] = ""
	var task: Dictionary = projection.get("current_task", {}) \
		if projection.get("current_task", {}) is Dictionary else {}
	var record := {
		"record_type": PERSON_RECORD_TYPE,
		"version": STATE_VERSION,
		"person_id": person_id,
		"resident_id": person_id,
		"world_seed": world_seed,
		"world_id": world_id,
		"identity": identity,
		"existence_state": existence_state,
		"life_stage": {
			"age_days": maxi(0, int(projection.get(
				"age_days", (existing.get("life_stage", {}) as Dictionary).get(
					"age_days", 0)))),
			"age_band": str(projection.get(
				"age_band", (existing.get("life_stage", {}) as Dictionary).get(
					"age_band", "adult"))),
		},
		"settlement_id": settlement_id,
		"household_id": str(projection.get(
			"household_id", existing.get("household_id", ""))),
		"residence_id": str(projection.get(
			"residence_id", existing.get("residence_id", ""))),
		"bed_id": str(projection.get(
			"bed_id", existing.get("bed_id", ""))),
		"residence_anchor": _normalise_position(projection.get(
			"home", existing.get("residence_anchor", []))),
		"displacement_state": (
			"displaced" if bool(projection.get(
				"displaced", str(existing.get(
					"displacement_state", "none")) == "displaced")) else "none"),
		"job_assignment_id": assignment_id,
		"job_definition_ref": job_definition_ref,
		"workplace_ref": str(projection.get(
			"workplace_id", existing.get("workplace_ref", ""))),
		"workplace_anchor": _normalise_position(projection.get(
			"work", existing.get("workplace_anchor", []))),
		"schedule_id": schedule_id,
		"personal_inventory_ref": str(projection.get(
			"personal_inventory_ref", existing.get(
				"personal_inventory_ref", "%s.inventory.personal" % person_id))),
		"equipment_state_ref": str(projection.get(
			"equipment_state_ref", existing.get(
				"equipment_state_ref", "%s.equipment" % person_id))),
		"skill_profile_ref": str(projection.get(
			"skill_profile_ref", existing.get("skill_profile_ref", ""))),
		"knowledge_refs": (existing.get("knowledge_refs", []) as Array).duplicate(true),
		"external_domain_refs": refs,
		"current_task_intent_ref": str(projection.get(
			"current_task_intent_ref", task.get(
				"task_id", existing.get("current_task_intent_ref", "")))),
		"history_refs": (existing.get("history_refs", []) as Array).duplicate(true),
		"source_kind": str(existing.get("source_kind", source_kind)),
		"source_revision": int(projection.get(
			"source_revision", existing.get("source_revision", 1))),
		"save_revision": STATE_VERSION,
		"revision": maxi(1, int(existing.get("revision", 1))),
		"created_tick": int(existing.get("created_tick", _world_tick())),
		"updated_tick": int(existing.get("updated_tick", _world_tick())),
		"evidence_refs": (
			existing.get("evidence_refs", []) as Array).duplicate(true),
		"state_hash": "",
	}
	return record


func _sync_job_assignment(
		person: Dictionary,
		projection: Dictionary,
		source_kind: String) -> Dictionary:
	var assignment_id := str(person.get("job_assignment_id", ""))
	if assignment_id.is_empty():
		return {"ok": true, "duplicate": true, "assignment": {}}
	if _job_assignments.has(assignment_id) \
			and str((_job_assignments[assignment_id] as Dictionary).get(
				"person_id", "")) != str(person.get("person_id", "")) \
			and bool((_job_assignments[assignment_id] as Dictionary).get(
				"active", false)):
		return {"ok": false, "error": "NPC-JOB-001"}
	var before: Dictionary = _job_assignments.get(assignment_id, {})
	var candidate := {
		"record_type": JOB_RECORD_TYPE,
		"version": STATE_VERSION,
		"job_assignment_id": assignment_id,
		"person_id": str(person.get("person_id", "")),
		"settlement_id": str(person.get("settlement_id", "")),
		"job_definition_ref": str(person.get("job_definition_ref", "")),
		"display_name": str(projection.get(
			"job", before.get("display_name", ""))),
		"workplace_ref": str(person.get("workplace_ref", "")),
		"workplace_role_ref": str(projection.get(
			"workplace_role_ref", projection.get(
				"role", before.get("workplace_role_ref", "")))),
		"schedule_id": str(person.get("schedule_id", "")),
		"active": str(person.get("existence_state", "")) == "alive" \
			and not str(person.get("job_definition_ref", "")).is_empty(),
		"economic_employment_ref": str(
			(before.get("economic_employment_ref", ""))),
		"eligibility_snapshot_ref": str(
			(before.get("eligibility_snapshot_ref", ""))),
		"reason_codes": (before.get("reason_codes", []) as Array).duplicate(true),
		"revision": maxi(1, int(before.get("revision", 1))),
		"created_tick": int(before.get("created_tick", _world_tick())),
		"updated_tick": int(before.get("updated_tick", _world_tick())),
		"evidence_refs": (
			before.get("evidence_refs", []) as Array).duplicate(true),
		"state_hash": "",
	}
	return _store_job_change(candidate, before, source_kind)


func _store_job_change(
		candidate: Dictionary,
		before: Dictionary,
		mutation_id: String) -> Dictionary:
	var assignment_id := str(candidate.get("job_assignment_id", ""))
	if not before.is_empty() \
			and _record_semantic_hash(candidate) == _record_semantic_hash(before):
		return {"ok": true, "duplicate": true, "assignment": before.duplicate(true)}
	var revision := 1 if before.is_empty() else int(before.get("revision", 0)) + 1
	var evidence_id := _evidence_id("job.assignment", assignment_id, revision)
	var evidence := _commit_evidence(evidence_id, "ordinary_job_assignment_updated", {
		"job_assignment_id": assignment_id,
		"person_id": str(candidate.get("person_id", "")),
		"before_hash": "" if before.is_empty() else _record_semantic_hash(before),
		"after_hash": _record_semantic_hash(candidate),
	}, mutation_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	candidate["revision"] = revision
	candidate["created_tick"] = int(before.get("created_tick", _world_tick()))
	candidate["updated_tick"] = _world_tick()
	candidate["evidence_refs"] = _append_ref(
		before.get("evidence_refs", []) as Array, evidence_id)
	candidate["state_hash"] = _record_hash(candidate)
	_job_assignments[assignment_id] = candidate
	jobs_changed.emit()
	return {
		"ok": true,
		"duplicate": false,
		"evidence_id": evidence_id,
		"assignment": candidate.duplicate(true),
	}


func _close_job_assignment(
		assignment_id: String,
		superseded_by: String,
		mutation_id: String) -> void:
	if not _job_assignments.has(assignment_id):
		return
	var before: Dictionary = _job_assignments[assignment_id]
	if not bool(before.get("active", false)):
		return
	var candidate := before.duplicate(true)
	candidate["active"] = false
	candidate["superseded_by"] = superseded_by
	_store_job_change(candidate, before, mutation_id)


func _sync_schedule(
		person: Dictionary,
		projection: Dictionary,
		source_kind: String) -> Dictionary:
	var schedule_id := str(person.get("schedule_id", ""))
	var before: Dictionary = _schedules.get(schedule_id, {})
	var task: Dictionary = projection.get("current_task", {}) \
		if projection.get("current_task", {}) is Dictionary else {}
	var candidate := {
		"record_type": SCHEDULE_RECORD_TYPE,
		"version": STATE_VERSION,
		"schedule_id": schedule_id,
		"person_id": str(person.get("person_id", "")),
		"settlement_id": str(person.get("settlement_id", "")),
		"profile_ref": str(projection.get(
			"schedule_profile_ref", before.get(
				"profile_ref", "schedule.profile.ordinary_settlement"))),
		"current_intent": str(projection.get(
			"schedule_state", before.get("current_intent", "work"))),
		"window_ref": str(projection.get(
			"schedule_window_ref", before.get("window_ref", ""))),
		"target_ref": str(projection.get(
			"schedule_target_ref", before.get("target_ref", ""))),
		"current_task_intent_ref": str(projection.get(
			"current_task_intent_ref", task.get(
				"task_id", person.get("current_task_intent_ref", "")))),
		"modifier_evidence_refs": (
			before.get("modifier_evidence_refs", []) as Array).duplicate(true),
		"revision": maxi(1, int(before.get("revision", 1))),
		"created_tick": int(before.get("created_tick", _world_tick())),
		"updated_tick": int(before.get("updated_tick", _world_tick())),
		"evidence_refs": (
			before.get("evidence_refs", []) as Array).duplicate(true),
		"state_hash": "",
	}
	return _store_schedule_change(candidate, before, source_kind)


func _store_schedule_change(
		candidate: Dictionary,
		before: Dictionary,
		mutation_id: String) -> Dictionary:
	var schedule_id := str(candidate.get("schedule_id", ""))
	if not before.is_empty() \
			and _record_semantic_hash(candidate) == _record_semantic_hash(before):
		return {"ok": true, "duplicate": true, "schedule": before.duplicate(true)}
	var revision := 1 if before.is_empty() else int(before.get("revision", 0)) + 1
	var evidence_id := _evidence_id("schedule", schedule_id, revision)
	var evidence := _commit_evidence(evidence_id, "ordinary_schedule_updated", {
		"schedule_id": schedule_id,
		"person_id": str(candidate.get("person_id", "")),
		"before_hash": "" if before.is_empty() else _record_semantic_hash(before),
		"after_hash": _record_semantic_hash(candidate),
	}, mutation_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	candidate["revision"] = revision
	candidate["created_tick"] = int(before.get("created_tick", _world_tick()))
	candidate["updated_tick"] = _world_tick()
	candidate["evidence_refs"] = _append_ref(
		before.get("evidence_refs", []) as Array, evidence_id)
	candidate["state_hash"] = _record_hash(candidate)
	_schedules[schedule_id] = candidate
	schedules_changed.emit()
	return {
		"ok": true,
		"duplicate": false,
		"evidence_id": evidence_id,
		"schedule": candidate.duplicate(true),
	}


func _rebuild_households_for_settlement(
		settlement_id: String,
		compatibility: Dictionary,
		mutation_id: String) -> Dictionary:
	var desired: Dictionary = {}
	for person_id in person_ids(settlement_id):
		var person: Dictionary = _people[person_id]
		var household_id := str(person.get("household_id", ""))
		if household_id.is_empty():
			continue
		if not desired.has(household_id):
			desired[household_id] = []
		(desired[household_id] as Array).append(person_id)
	for household_id in household_ids(settlement_id):
		if not desired.has(household_id):
			desired[household_id] = []
	var desired_ids: Array = desired.keys()
	desired_ids.sort_custom(func(a: Variant, b: Variant) -> bool:
		return str(a) < str(b))
	for household_value_id in desired_ids:
		var household_id := str(household_value_id)
		var members: Array = desired[household_value_id]
		members.sort()
		var before: Dictionary = _households.get(household_id, {})
		var legacy: Dictionary = compatibility.get(household_id, {}) \
			if compatibility.get(household_id, {}) is Dictionary else {}
		var residence_refs: Array[String] = []
		var displaced_count := 0
		for person_value in members:
			var person: Dictionary = _people[str(person_value)]
			var residence_id := str(person.get("residence_id", ""))
			if not residence_id.is_empty() and residence_id not in residence_refs:
				residence_refs.append(residence_id)
			if str(person.get("displacement_state", "none")) == "displaced":
				displaced_count += 1
		residence_refs.sort()
		var candidate := {
			"record_type": HOUSEHOLD_RECORD_TYPE,
			"version": STATE_VERSION,
			"household_id": household_id,
			"settlement_id": settlement_id,
			"member_person_ids": members.duplicate(true),
			"residence_refs": residence_refs,
			"shared_storage_refs": (
				before.get("shared_storage_refs", legacy.get(
					"shared_storage_refs", [])) as Array).duplicate(true),
			"dependent_or_care_refs": (
				before.get("dependent_or_care_refs", []) as Array).duplicate(true),
			"displacement_state": (
				"vacant" if members.is_empty() else "displaced"
				if displaced_count == members.size() else "partial"
				if displaced_count > 0 else "none"),
			"relocation_intent_ref": str(before.get(
				"relocation_intent_ref", "")),
			"migration_group_ref": str(before.get(
				"migration_group_ref", "")),
			"operational_priority": str(before.get(
				"operational_priority", "normal")),
			"history_refs": (
				before.get("history_refs", []) as Array).duplicate(true),
			"revision": maxi(1, int(before.get("revision", 1))),
			"created_tick": int(before.get("created_tick", _world_tick())),
			"updated_tick": int(before.get("updated_tick", _world_tick())),
			"evidence_refs": (
				before.get("evidence_refs", []) as Array).duplicate(true),
			"state_hash": "",
		}
		if not before.is_empty() \
				and _record_semantic_hash(candidate) == _record_semantic_hash(before):
			continue
		var revision := (
			1 if before.is_empty() else int(before.get("revision", 0)) + 1)
		var evidence_id := _evidence_id("household", household_id, revision)
		var evidence := _commit_evidence(
			evidence_id, "persistent_household_updated", {
				"household_id": household_id,
				"settlement_id": settlement_id,
				"member_person_ids": members,
				"before_hash": "" if before.is_empty() \
					else _record_semantic_hash(before),
				"after_hash": _record_semantic_hash(candidate),
			}, mutation_id)
		if not bool(evidence.get("ok", false)):
			return evidence
		candidate["revision"] = revision
		candidate["created_tick"] = int(before.get("created_tick", _world_tick()))
		candidate["updated_tick"] = _world_tick()
		candidate["evidence_refs"] = _append_ref(
			before.get("evidence_refs", []) as Array, evidence_id)
		candidate["state_hash"] = _record_hash(candidate)
		_households[household_id] = candidate
	households_changed.emit()
	return {"ok": true}


func _person_id_from(projection: Dictionary) -> String:
	return str(projection.get(
		"person_id", projection.get("resident_id", projection.get("id", ""))))


func _person_semantic_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	for field in [
		"revision", "created_tick", "updated_tick", "evidence_refs", "state_hash",
	]:
		payload.erase(field)
	return _hash_value(payload)


func _record_semantic_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	for field in [
		"revision", "created_tick", "updated_tick", "evidence_refs", "state_hash",
	]:
		payload.erase(field)
	return _hash_value(payload)


func _normalise_position(value: Variant) -> Array:
	if value is Vector2i:
		return [value.x, value.y]
	if value is Vector3i:
		return [value.x, value.y, value.z]
	if value is Vector2:
		return [value.x, value.y]
	if value is Vector3:
		return [value.x, value.y, value.z]
	if value is Array and value.size() in [2, 3]:
		var result: Array = []
		for component in value:
			if not (component is int or component is float):
				return []
			result.append(component)
		return result
	return []


func _append_ref(values: Array, evidence_id: String) -> Array:
	var result := values.duplicate()
	if evidence_id not in result:
		result.append(evidence_id)
	while result.size() > MAX_EVIDENCE_REFS:
		result.pop_front()
	return result


func _evidence_id(kind: String, subject_id: String, revision: int) -> String:
	return "evidence.people.%s.%d.%s.%s.%d" % [
		_hash_value(world_id).substr(0, 10), world_seed, kind, subject_id, revision]


func _commit_evidence(
		evidence_id: String,
		event_type: String,
		payload: Dictionary,
		correlation_id: String) -> Dictionary:
	var payload_hash := _hash_value(payload)
	var envelope := ProductionKernel.make_evidence_envelope(
		evidence_id, EVIDENCE_OWNER, event_type, payload_hash, correlation_id)
	var committed := ProductionKernel.commit_evidence(envelope)
	if not bool(committed.get("ok", false)):
		return committed
	var published := ProductionKernel.publish_event(
		"event.%s" % evidence_id.trim_prefix("evidence."), EVIDENCE_OWNER,
		event_type, payload_hash, [evidence_id])
	if not bool(published.get("ok", false)):
		return published
	return {
		"ok": true,
		"duplicate": bool(committed.get("duplicate", false)),
		"evidence_id": evidence_id,
		"payload_hash": payload_hash,
	}


func _world_tick() -> int:
	return int(ProductionKernel.world_time_reference().get("world_tick", 0))


func _sorted_records(source: Dictionary, identity_field: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var ids: Array = source.keys()
	ids.sort_custom(func(a: Variant, b: Variant) -> bool:
		return str(a) < str(b))
	for id_value in ids:
		var record: Dictionary = source[id_value]
		if str(record.get(identity_field, "")) == str(id_value):
			result.append(record.duplicate(true))
	return result


func _restore_records(values: Array, identity_field: String) -> Dictionary:
	var result := {}
	for value in values:
		if not (value is Dictionary):
			return {"ok": false, "error": "invalid_record"}
		var record: Dictionary = value.duplicate(true)
		var identity := str(record.get(identity_field, ""))
		if identity.is_empty() or result.has(identity):
			return {"ok": false, "error": "duplicate_or_missing_identity"}
		result[identity] = record
	return {"ok": true, "records": result}


func _state_hash(data: Dictionary) -> String:
	var payload := data.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _record_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


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
