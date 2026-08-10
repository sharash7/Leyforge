extends Node
## Canonical Set-28 social, relationship, knowledge, dialogue and companion owner.
##
## Persistent people remain owned by Document 07. This owner stores only
## social interpretation and agreements around those stable identities. It
## never grants political/economic authority or mutates biology/movement.

signal social_changed
signal profile_changed(actor_id: String)
signal relationship_changed(subject_id: String, target_id: String)
signal knowledge_changed(actor_id: String, proposition_key: String)
signal conversation_changed(session_id: String)
signal companion_changed(companion_id: String)
signal reputation_changed(scope_ref: String, target_ref: String)

const STATE_SCHEMA := "leyforge.social-state"
const STATE_VERSION := 1
const INTERFACE_ID := "leyforge.system.interface.social"
const INTERFACE_VERSION := "1.0"
const EVIDENCE_OWNER := "set28.social"
const PLAYER_ACTOR_ID := "actor.player.local"
const MAX_EVIDENCE_REFS := 128
const MAX_TRANSACTION_JOURNAL := 256
const MAX_PROFILE_REFS := 64
const MAX_CONVERSATION_HISTORY := 32

const SIGNED_DIMENSIONS: Array[String] = ["trust", "affection", "respect"]
const UNSIGNED_DIMENSIONS: Array[String] = [
	"fear", "loyalty", "gratitude", "grievance", "familiarity",
]
const ALL_DIMENSIONS: Array[String] = [
	"trust", "affection", "fear", "loyalty", "respect", "gratitude",
	"grievance", "familiarity",
]
const VALID_AWARENESS: Array[String] = [
	"unaware", "heard_of", "partial", "informed", "detailed", "specialist",
]
const VALID_STANCES: Array[String] = [
	"unknown", "reject", "leans_reject", "uncertain", "leans_accept", "accept",
	"disputed",
]
const VALID_CONVERSATION_STATES: Array[String] = [
	"requested", "establishing", "active", "awaiting_choice", "resolving",
	"suspended", "closing", "ended", "invalidated",
]
const VALID_COMPANION_STATUSES: Array[String] = [
	"candidate", "joining", "active", "travelling_to_rendezvous", "waiting",
	"resting", "home_reserve", "assigned_externally", "temporarily_unavailable",
	"injured_recovering", "missing", "captured", "stranded", "suspended",
	"notice_period", "departing", "expired", "dismissed", "resigned", "deserted",
	"defected", "deceased", "former_companion",
]
const TERMINAL_COMPANION_STATUSES: Array[String] = [
	"expired", "dismissed", "resigned", "deserted", "defected", "deceased",
	"former_companion",
]
const VALID_PERMISSION_STATES: Array[String] = [
	"allowed", "ask_each_time", "contextual", "prohibited", "external", "unknown",
]
const MUTUAL_MILESTONE_FAMILIES: Array[String] = [
	"friend", "close_friend", "partner", "married", "family_bond",
]

var initialized := false
var restored_from_state := false
var world_seed := 0
var world_id := ""
var _profiles: Dictionary = {}
var _relationships: Dictionary = {}
var _relationship_impacts: Dictionary = {}
var _social_memories: Dictionary = {}
var _milestones: Dictionary = {}
var _beliefs: Dictionary = {}
var _conversations: Dictionary = {}
var _conversation_commits: Dictionary = {}
var _companion_agreements: Dictionary = {}
var _companion_statuses: Dictionary = {}
var _reputations: Dictionary = {}
var _transactions: Dictionary = {}
var _transaction_order: Array[String] = []


func reset() -> void:
	initialized = false
	restored_from_state = false
	world_seed = 0
	world_id = ""
	_profiles.clear()
	_relationships.clear()
	_relationship_impacts.clear()
	_social_memories.clear()
	_milestones.clear()
	_beliefs.clear()
	_conversations.clear()
	_conversation_commits.clear()
	_companion_agreements.clear()
	_companion_statuses.clear()
	_reputations.clear()
	_transactions.clear()
	_transaction_order.clear()


func initialize(seed_value: int, requested_world_id: String = "") -> void:
	if initialized and world_seed == seed_value \
			and (requested_world_id.is_empty() or world_id == requested_world_id):
		return
	reset()
	initialized = true
	world_seed = seed_value
	world_id = requested_world_id
	register_profile(
		PLAYER_ACTOR_ID, {}, "player_actor", "", "", "player")


func profile_ids(settlement_ref: String = "") -> Array[String]:
	var result: Array[String] = []
	for actor_value in _profiles.keys():
		var actor_id := str(actor_value)
		if settlement_ref.is_empty() or str(
				(_profiles[actor_id] as Dictionary).get(
					"settlement_ref", "")) == settlement_ref:
			result.append(actor_id)
	result.sort()
	return result


func relationship_ids(subject_id: String = "") -> Array[String]:
	var result: Array[String] = []
	for id_value in _relationships.keys():
		var relationship_ref := str(id_value)
		if subject_id.is_empty() or str(
				(_relationships[relationship_ref] as Dictionary).get(
					"subject_id", "")) == subject_id:
			result.append(relationship_ref)
	result.sort()
	return result


func belief_ids(actor_id: String = "") -> Array[String]:
	var result: Array[String] = []
	for id_value in _beliefs.keys():
		var belief_ref := str(id_value)
		if actor_id.is_empty() or str(
				(_beliefs[belief_ref] as Dictionary).get(
					"actor_id", "")) == actor_id:
			result.append(belief_ref)
	result.sort()
	return result


func conversation_ids(include_closed: bool = true) -> Array[String]:
	var result: Array[String] = []
	for id_value in _conversations.keys():
		var session_id := str(id_value)
		var state := str((_conversations[session_id] as Dictionary).get(
			"state", ""))
		if include_closed or state not in ["ended", "invalidated"]:
			result.append(session_id)
	result.sort()
	return result


func companion_ids(active_only: bool = false) -> Array[String]:
	var result: Array[String] = []
	for companion_value in _companion_statuses.keys():
		var companion_id := str(companion_value)
		var status := str((_companion_statuses[companion_id] as Dictionary).get(
			"status", ""))
		if not active_only or status not in TERMINAL_COMPANION_STATUSES:
			result.append(companion_id)
	result.sort()
	return result


func has_profile(actor_id: String) -> bool:
	return _profiles.has(actor_id)


func has_relationship(subject_id: String, target_id: String) -> bool:
	return _relationships.has(relationship_record_id(subject_id, target_id))


func social_profile_id(actor_id: String) -> String:
	return "social_profile.%s" % actor_id if not actor_id.is_empty() else ""


func relationship_record_id(subject_id: String, target_id: String) -> String:
	if subject_id.is_empty() or target_id.is_empty():
		return ""
	return "relationship:%s:%s" % [subject_id, target_id]


func get_profile(actor_id: String) -> Dictionary:
	return (_profiles.get(actor_id, {}) as Dictionary).duplicate(true)


func get_relationship(subject_id: String, target_id: String) -> Dictionary:
	return (_relationships.get(
		relationship_record_id(subject_id, target_id), {}) as Dictionary).duplicate(true)


func get_belief(actor_id: String, proposition: Variant) -> Dictionary:
	var key := proposition_key(proposition)
	return (_beliefs.get(belief_record_id(actor_id, key), {}) \
		as Dictionary).duplicate(true)


func register_profile(
		actor_id: String,
		projection: Dictionary = {},
		source_kind: String = "compatibility",
		person_ref: String = "",
		settlement_ref: String = "",
		identity_class: String = "person") -> Dictionary:
	_ensure_initialized(projection)
	if actor_id.is_empty():
		return {"ok": false, "error": "SOC-ID-001"}
	if _profiles.has(actor_id):
		var existing: Dictionary = _profiles[actor_id]
		if not person_ref.is_empty() \
				and str(existing.get("person_ref", "")) not in ["", person_ref]:
			return {"ok": false, "error": "social_identity_conflict"}
		_publish_person_ref(existing, "social.ref.refresh.%s" % _stable_token(actor_id))
		return {
			"ok": true,
			"duplicate": true,
			"profile": existing.duplicate(true),
			"view": compatibility_person_view(actor_id, projection),
		}
	var evidence_id := "evidence.social.profile.register.%s" % (
		_world_scoped_token(actor_id))
	var payload := {
		"actor_id": actor_id,
		"social_profile_id": social_profile_id(actor_id),
		"person_ref": person_ref,
		"settlement_ref": settlement_ref,
		"identity_class": identity_class,
		"source_kind": source_kind,
		"world_seed": world_seed,
		"world_id": world_id,
	}
	var evidence := _commit_evidence(
		evidence_id, "social_profile_registered", payload, actor_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var record := _new_profile(
		actor_id, projection, source_kind, person_ref, settlement_ref,
		identity_class, evidence_id)
	var validation := validate_profile(record)
	if not bool(validation.get("ok", false)):
		return validation
	_profiles[actor_id] = record
	_publish_person_ref(record, "social.register.%s" % _stable_token(actor_id))
	profile_changed.emit(actor_id)
	social_changed.emit()
	return {
		"ok": true,
		"duplicate": false,
		"evidence_id": evidence_id,
		"profile": record.duplicate(true),
		"view": compatibility_person_view(actor_id, projection),
	}


func reconcile_people_owner() -> Dictionary:
	if not PeopleManager.initialized:
		return {"ok": false, "error": "people_owner_not_initialized"}
	var registered := 0
	var failures: Array[Dictionary] = []
	for person_id in PeopleManager.person_ids():
		if _profiles.has(person_id):
			_publish_person_ref(
				_profiles[person_id], "social.ref.refresh.%s" % _stable_token(person_id))
			continue
		var person := PeopleManager.get_person(person_id)
		var result := register_profile(
			person_id, {}, "persistent_person", person_id,
			str(person.get("settlement_id", "")), "person")
		if bool(result.get("ok", false)):
			registered += 1
		else:
			failures.append({
				"person_id": person_id,
				"error": result.get("error", "unknown"),
			})
	return {
		"ok": failures.is_empty(),
		"registered": registered,
		"profile_count": profile_ids().size(),
		"failures": failures,
	}


func reconcile_settlement_projection(
		settlement_ref: String,
		resident_value: Variant,
		_allow_existing_updates: bool = false) -> Dictionary:
	if settlement_ref.is_empty() or not (resident_value is Dictionary):
		return {"ok": false, "error": "invalid_social_projection"}
	var residents: Dictionary = resident_value
	var projected := residents.duplicate(true)
	var ids: Array = residents.keys()
	ids.sort_custom(func(a: Variant, b: Variant) -> bool: return str(a) < str(b))
	for actor_value in ids:
		var actor_id := str(actor_value)
		if not (residents[actor_value] is Dictionary):
			return {"ok": false, "error": "invalid_social_actor_projection"}
		var projection: Dictionary = residents[actor_value]
		var person_ref := actor_id if PeopleManager.has_person(actor_id) else str(
			projection.get("person_id", ""))
		if not _profiles.has(actor_id):
			var registered := register_profile(
				actor_id, projection, "settlement_projection", person_ref,
				settlement_ref, "person")
			if not bool(registered.get("ok", false)):
				return registered
		projected[actor_id] = compatibility_person_view(actor_id, projection)
	return {
		"ok": true,
		"resident_records": projected,
		"profile_count": ids.size(),
		"social_summary": settlement_social_summary(settlement_ref),
	}


func compatibility_person_view(actor_id: String, projection: Dictionary) -> Dictionary:
	var result := projection.duplicate(true)
	if not _profiles.has(actor_id):
		return result
	var profile: Dictionary = _profiles[actor_id]
	result["social_profile_ref"] = str(profile.get("social_profile_id", ""))
	result["knowledge_refs"] = (
		profile.get("knowledge_refs", []) as Array).duplicate()
	result["relationship_refs"] = (
		profile.get("relationship_refs", []) as Array).duplicate()
	result["last_dialogue"] = str(profile.get("last_conversation_ref", ""))
	result["companion_status"] = companion_status(actor_id)
	result["social_projection"] = true
	result["authoritative_social_state_hash"] = str(profile.get("state_hash", ""))
	return result


func relationship_view(
		subject_id: String,
		target_id: String,
		viewer_context: Dictionary = {}) -> Dictionary:
	var relationship_ref := relationship_record_id(subject_id, target_id)
	var record: Dictionary = _relationships.get(
		relationship_ref, _new_relationship(subject_id, target_id))
	var dimensions: Dictionary = record.get("dimensions", {})
	var bands := {}
	for dimension in ALL_DIMENSIONS:
		bands[dimension] = _dimension_band(
			dimension, float(dimensions.get(dimension, 0.0)))
	var visible_milestones: Array[String] = []
	for milestone_id in record.get("milestone_ids", []):
		if _milestones.has(str(milestone_id)):
			visible_milestones.append(str(
				(_milestones[str(milestone_id)] as Dictionary).get(
					"milestone_family", milestone_id)))
	var include_raw := bool(viewer_context.get("developer_authorised", false))
	return {
		"schema": "leyforge.set28.relationship-view",
		"version": STATE_VERSION,
		"relationship_id": relationship_ref,
		"subject_id": subject_id,
		"target_id": target_id,
		"relationship_level": _relationship_level_from(dimensions, visible_milestones),
		"dimension_bands": bands,
		"dimensions": dimensions.duplicate(true) if include_raw else {},
		"visible_milestones": visible_milestones,
		"recent_visible_reasons": (
			record.get("reason_codes", []) as Array).slice(
				maxi(0, (record.get("reason_codes", []) as Array).size() - 5)),
		"disclosure_scope": (
			"developer" if include_raw else "viewer_knowledge_filtered"),
		"source_revision": int(record.get("revision", 0)),
		"authoritative_world_time": _world_time(),
	}


func relationship_level(subject_id: String, target_id: String) -> String:
	return str(relationship_view(subject_id, target_id).get(
		"relationship_level", "stranger"))


func trust(subject_id: String, target_id: String, _domain: String = "general") -> Dictionary:
	return _dimension_query(subject_id, target_id, "trust")


func affection(subject_id: String, target_id: String) -> Dictionary:
	return _dimension_query(subject_id, target_id, "affection")


func fear(subject_id: String, target_id: String) -> Dictionary:
	return _dimension_query(subject_id, target_id, "fear")


func loyalty(subject_id: String, target_id: String) -> Dictionary:
	return _dimension_query(subject_id, target_id, "loyalty")


func respect(subject_id: String, target_id: String) -> Dictionary:
	return _dimension_query(subject_id, target_id, "respect")


func gratitude(subject_id: String, target_id: String) -> Dictionary:
	return _dimension_query(subject_id, target_id, "gratitude")


func grievance(subject_id: String, target_id: String) -> Dictionary:
	return _dimension_query(subject_id, target_id, "grievance")


func familiarity(subject_id: String, target_id: String) -> Dictionary:
	return _dimension_query(subject_id, target_id, "familiarity")


func apply_relationship_event(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var subject_id := str(request.get("subject_id", ""))
	var target_id := str(request.get("target_id", ""))
	var source_event_id := str(request.get(
		"source_event_id", request.get("source_evidence_ref", "")))
	if subject_id.is_empty() or target_id.is_empty() or source_event_id.is_empty():
		return {"ok": false, "error": "relationship_event_identity_required"}
	if not _profiles.has(subject_id) or not _profiles.has(target_id):
		return {"ok": false, "error": "unknown_relationship_endpoint"}
	var forbidden := _forbidden_external_mutation(request)
	if not forbidden.is_empty():
		return {"ok": false, "error": "cross_owner_mutation_forbidden", "field": forbidden}
	var deltas_value: Variant = request.get("dimension_deltas", {})
	if not (deltas_value is Dictionary) or deltas_value.is_empty():
		return {"ok": false, "error": "relationship_deltas_required"}
	var deltas: Dictionary = deltas_value
	for dimension_value in deltas.keys():
		var dimension := str(dimension_value)
		if dimension not in ALL_DIMENSIONS \
				or not (deltas[dimension_value] is int or deltas[dimension_value] is float):
			return {"ok": false, "error": "invalid_relationship_dimension"}
	var event_family := str(request.get("event_family", "social_event"))
	if float(deltas.get("loyalty", 0.0)) > 0.0 \
			and ("fear" in event_family.to_lower() or "coerc" in event_family.to_lower()) \
			and str(request.get("independent_loyalty_evidence_ref", "")).is_empty():
		return {"ok": false, "error": "fear_cannot_create_loyalty"}
	var relationship_ref := relationship_record_id(subject_id, target_id)
	var before: Dictionary = _relationships.get(
		relationship_ref, _new_relationship(subject_id, target_id))
	var expected_revision := int(request.get("expected_revision", -1))
	if expected_revision >= 0 and expected_revision != int(before.get("revision", 0)):
		return {"ok": false, "error": "stale_relationship_revision",
			"current_revision": int(before.get("revision", 0))}
	var candidate := before.duplicate(true)
	var dimensions: Dictionary = candidate.get("dimensions", {}).duplicate(true)
	var applied_deltas := {}
	for dimension_value in deltas.keys():
		var dimension := str(dimension_value)
		var before_value := float(dimensions.get(dimension, 0.0))
		var after_value := before_value + float(deltas[dimension_value])
		after_value = clampf(after_value, -100.0, 100.0) \
			if dimension in SIGNED_DIMENSIONS else clampf(after_value, 0.0, 100.0)
		dimensions[dimension] = after_value
		applied_deltas[dimension] = after_value - before_value
	candidate["dimensions"] = dimensions
	var prior_revision := int(before.get("revision", 0))
	candidate["revision"] = prior_revision + 1
	candidate["last_meaningful_contact_tick"] = int(
		_world_time().get("world_tick", 0))
	candidate["updated_tick"] = int(_world_time().get("world_tick", 0))
	candidate["reason_codes"] = _append_ref(
		candidate.get("reason_codes", []) as Array,
		str(request.get("reason_code", "social.relationship.%s" % event_family)),
		MAX_PROFILE_REFS)
	var impact_id := "relationship_impact.%s" % _world_scoped_token(transaction_id)
	var impact := {
		"record_type": "RelationshipImpactRecord",
		"version": STATE_VERSION,
		"impact_id": impact_id,
		"relationship_id": relationship_ref,
		"source_event_id": source_event_id,
		"source_belief_id": str(request.get("source_belief_id", "")),
		"event_family": event_family,
		"applied_deltas": applied_deltas,
		"confidence": clampf(float(request.get("confidence", 1.0)), 0.0, 1.0),
		"personal_relevance": clampf(float(request.get(
			"personal_relevance", 1.0)), 0.0, 2.0),
		"committed_tick": int(_world_time().get("world_tick", 0)),
		"reappraisal_state": "current",
		"reason_codes": [str(request.get(
			"reason_code", "social.relationship.%s" % event_family))],
		"state_hash": "",
	}
	impact["state_hash"] = _record_hash(impact)
	var impact_refs: Array = candidate.get("impact_refs", []).duplicate()
	impact_refs = _append_ref(impact_refs, impact_id, MAX_PROFILE_REFS)
	candidate["impact_refs"] = impact_refs
	var memory: Dictionary = {}
	var significance := str(request.get("significance", "routine"))
	if bool(request.get("create_memory", false)) \
			or significance in ["meaningful", "major", "defining"]:
		var memory_id := "social_memory.%s" % _world_scoped_token(transaction_id)
		memory = {
			"record_type": "SocialMemoryInterpretationRecord",
			"version": STATE_VERSION,
			"memory_id": memory_id,
			"subject_id": subject_id,
			"target_id": target_id,
			"source_event_id": source_event_id,
			"source_belief_id": str(request.get("source_belief_id", "")),
			"relationship_impact_id": impact_id,
			"event_family": event_family,
			"emotional_tags": (request.get("emotional_tags", []) as Array).duplicate(),
			"original_dimension_deltas": applied_deltas.duplicate(true),
			"retained_weight": clampf(float(request.get("retained_weight", 1.0)), 0.0, 1.0),
			"significance": significance,
			"consolidation_state": "individual",
			"created_tick": int(_world_time().get("world_tick", 0)),
			"state_hash": "",
		}
		memory["state_hash"] = _record_hash(memory)
		candidate["retained_memory_refs"] = _append_ref(
			candidate.get("retained_memory_refs", []) as Array,
			memory_id, MAX_PROFILE_REFS)
	var evidence_id := "evidence.social.relationship.%s" % (
		_world_scoped_token(transaction_id))
	var request_hash := _hash_value(request)
	var evidence := _commit_evidence(evidence_id, "relationship_changed", {
		"transaction_id": transaction_id,
		"relationship_id": relationship_ref,
		"source_event_id": source_event_id,
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"request_hash": request_hash,
		"result_semantic_hash": _record_semantic_hash(candidate),
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	candidate["evidence_refs"] = _append_ref(
		candidate.get("evidence_refs", []) as Array, evidence_id, MAX_EVIDENCE_REFS)
	candidate["transaction_refs"] = _append_ref(
		candidate.get("transaction_refs", []) as Array,
		transaction_id, MAX_TRANSACTION_JOURNAL)
	candidate["state_hash"] = _record_hash(candidate)
	_relationships[relationship_ref] = candidate
	_relationship_impacts[impact_id] = impact
	if not memory.is_empty():
		_social_memories[str(memory.get("memory_id", ""))] = memory
	_update_profile_ref(subject_id, "relationship_refs", relationship_ref, evidence_id)
	var result := {
		"ok": true,
		"schema": "leyforge.social-transaction-result",
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"relationship_id": relationship_ref,
		"impact_id": impact_id,
		"memory_id": str(memory.get("memory_id", "")),
		"applied_deltas": applied_deltas,
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"evidence_id": evidence_id,
		"authoritative_world_time": _world_time(),
	}
	_store_transaction(transaction_id, subject_id, request_hash, result)
	relationship_changed.emit(subject_id, target_id)
	profile_changed.emit(subject_id)
	social_changed.emit()
	return result.duplicate(true)


func form_relationship_milestone(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var subject_id := str(request.get("subject_id", ""))
	var target_id := str(request.get("target_id", ""))
	var family := str(request.get("milestone_family", ""))
	if subject_id.is_empty() or target_id.is_empty() or family.is_empty():
		return {"ok": false, "error": "milestone_identity_required"}
	if not _profiles.has(subject_id) or not _profiles.has(target_id):
		return {"ok": false, "error": "unknown_relationship_endpoint"}
	var mutual := family in MUTUAL_MILESTONE_FAMILIES or bool(
		request.get("mutual", false))
	if mutual and not bool(request.get("mutual_acceptance", false)):
		return {"ok": false, "error": "mutual_acceptance_required"}
	if family in ["partner", "married"] \
			and (not _is_adult_person(subject_id) or not _is_adult_person(target_id)):
		return {"ok": false, "error": "adult_participants_required"}
	if family in ["friend", "close_friend"]:
		var forward := get_relationship(subject_id, target_id)
		var reverse := get_relationship(target_id, subject_id)
		if not _friend_eligible(forward) or not _friend_eligible(reverse):
			return {"ok": false, "error": "friendship_eligibility_not_met"}
	var milestone_id := "relationship_milestone.%s" % _world_scoped_token({
		"subject": subject_id, "target": target_id, "family": family,
	})
	if _milestones.has(milestone_id):
		return {"ok": true, "duplicate": true,
			"milestone": (_milestones[milestone_id] as Dictionary).duplicate(true)}
	var evidence_id := "evidence.social.milestone.%s" % (
		_world_scoped_token(transaction_id))
	var evidence := _commit_evidence(evidence_id, "relationship_milestone_formed", {
		"transaction_id": transaction_id,
		"milestone_id": milestone_id,
		"milestone_family": family,
		"participant_ids": [subject_id, target_id],
		"source_event_id": str(request.get("source_event_id", "")),
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var milestone := {
		"record_type": "RelationshipMilestoneRecord",
		"version": STATE_VERSION,
		"milestone_id": milestone_id,
		"milestone_family": family,
		"participant_ids": [subject_id, target_id],
		"mutual": mutual,
		"started_tick": int(_world_time().get("world_tick", 0)),
		"ended_tick": -1,
		"originating_event_ref": str(request.get("source_event_id", evidence_id)),
		"status": "active",
		"evidence_refs": [evidence_id],
		"state_hash": "",
	}
	milestone["state_hash"] = _record_hash(milestone)
	_milestones[milestone_id] = milestone
	_attach_milestone(subject_id, target_id, milestone_id, evidence_id)
	if mutual:
		_attach_milestone(target_id, subject_id, milestone_id, evidence_id)
	var result := {
		"ok": true,
		"schema": "leyforge.social-transaction-result",
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"milestone": milestone.duplicate(true),
		"evidence_id": evidence_id,
		"authoritative_world_time": _world_time(),
	}
	_store_transaction(transaction_id, subject_id, _hash_value(request), result)
	relationship_changed.emit(subject_id, target_id)
	social_changed.emit()
	return result


func social_memory(actor_id: String, query: Dictionary = {}) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var target_filter := str(query.get("target_id", ""))
	var minimum_significance := str(query.get("minimum_significance", "routine"))
	var minimum_rank := ["routine", "meaningful", "major", "defining"].find(
		minimum_significance)
	for memory_value in _social_memories.values():
		if not (memory_value is Dictionary):
			continue
		var memory: Dictionary = memory_value
		if str(memory.get("subject_id", "")) != actor_id:
			continue
		if not target_filter.is_empty() \
				and str(memory.get("target_id", "")) != target_filter:
			continue
		var rank := ["routine", "meaningful", "major", "defining"].find(
			str(memory.get("significance", "routine")))
		if rank < maxi(0, minimum_rank):
			continue
		result.append(memory.duplicate(true))
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("memory_id", "")) < str(b.get("memory_id", "")))
	return result


func proposition_key(proposition: Variant) -> String:
	if proposition is String:
		return str(proposition)
	if not (proposition is Dictionary) or proposition.is_empty():
		return ""
	var semantic: Dictionary = proposition
	var predicate := str(semantic.get("predicate", ""))
	var subject_ref := str(semantic.get("subject_ref", semantic.get("subject", "")))
	if predicate.is_empty() or subject_ref.is_empty():
		return ""
	return "proposition.%s" % _stable_token({
		"predicate": predicate,
		"subject_ref": subject_ref,
		"object_ref": semantic.get("object_ref", semantic.get("value", null)),
		"temporal_scope": semantic.get("temporal_scope", "current_at_observation"),
		"location_scope": semantic.get("location_scope", ""),
	})


func belief_record_id(actor_id: String, proposition_ref: String) -> String:
	if actor_id.is_empty() or proposition_ref.is_empty():
		return ""
	return "belief.%s.%s" % [
		_stable_token(actor_id), _stable_token(proposition_ref)]


func upsert_belief(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var actor_id := str(request.get("actor_id", ""))
	var semantic_value: Variant = request.get("proposition", request.get(
		"proposition_key", ""))
	var proposition_ref := proposition_key(semantic_value)
	var source_id := str(request.get("source_id", request.get(
		"primary_source_id", "")))
	if actor_id.is_empty() or proposition_ref.is_empty() or source_id.is_empty():
		return {"ok": false, "error": "belief_identity_or_provenance_required"}
	if not _profiles.has(actor_id):
		return {"ok": false, "error": "unknown_knower"}
	var awareness := str(request.get("awareness", "informed"))
	var stance := str(request.get("stance", "uncertain"))
	if awareness not in VALID_AWARENESS or stance not in VALID_STANCES:
		return {"ok": false, "error": "invalid_belief_state"}
	var record_id := belief_record_id(actor_id, proposition_ref)
	var before: Dictionary = _beliefs.get(record_id, {})
	var expected_revision := int(request.get("expected_revision", -1))
	if expected_revision >= 0 and expected_revision != int(before.get("revision", 0)):
		return {"ok": false, "error": "stale_belief_revision",
			"current_revision": int(before.get("revision", 0))}
	var prior_revision := int(before.get("revision", 0))
	var evidence_refs: Array = (
		before.get("evidence_refs", []) as Array).duplicate()
	for value in request.get("evidence_refs", []):
		evidence_refs = _append_ref(evidence_refs, str(value), MAX_EVIDENCE_REFS)
	evidence_refs = _append_ref(evidence_refs, source_id, MAX_EVIDENCE_REFS)
	var proposition_data: Dictionary = semantic_value.duplicate(true) \
		if semantic_value is Dictionary else {
			"predicate": str(request.get("predicate", "semantic_reference")),
			"subject_ref": str(request.get("subject_ref", proposition_ref)),
			"semantic_reference": proposition_ref,
		}
	var candidate := {
		"record_type": "BeliefRecord",
		"version": STATE_VERSION,
		"belief_id": record_id,
		"actor_id": actor_id,
		"proposition_key": proposition_ref,
		"proposition": proposition_data,
		"truth_owner": str(request.get(
			"truth_owner", proposition_data.get("truth_owner", "subjective_or_external"))),
		"awareness": awareness,
		"stance": stance,
		"confidence": clampi(int(request.get("confidence", 500)), 0, 1000),
		"observed_revision": request.get("observed_revision", null),
		"observed_world_time": (request.get(
			"observed_world_time", _world_time()) as Dictionary).duplicate(true),
		"primary_source_id": source_id,
		"root_source_id": str(request.get("root_source_id", source_id)),
		"hop_count": maxi(0, int(request.get("hop_count", 0))),
		"evidence_refs": evidence_refs,
		"contradiction_state": str(request.get("contradiction_state", "none")),
		"disclosure_policy_id": str(request.get(
			"disclosure_policy_id", "social.knowledge.disclosure.public")),
		"salience": clampf(float(request.get("salience", 0.5)), 0.0, 1.0),
		"persistence_priority": str(request.get(
			"persistence_priority", "routine")),
		"scope_tags": (request.get("scope_tags", []) as Array).duplicate(),
		"revision": prior_revision + 1,
		"created_tick": int(before.get(
			"created_tick", _world_time().get("world_tick", 0))),
		"updated_tick": int(_world_time().get("world_tick", 0)),
		"transaction_refs": _append_ref(
			before.get("transaction_refs", []) as Array,
			transaction_id, MAX_TRANSACTION_JOURNAL),
		"state_hash": "",
	}
	var evidence_id := "evidence.social.knowledge.%s" % (
		_world_scoped_token(transaction_id))
	var request_hash := _hash_value(request)
	var evidence := _commit_evidence(evidence_id, "belief_updated", {
		"transaction_id": transaction_id,
		"belief_id": record_id,
		"actor_id": actor_id,
		"proposition_key": proposition_ref,
		"source_id": source_id,
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"request_hash": request_hash,
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	candidate["evidence_refs"] = _append_ref(
		candidate.get("evidence_refs", []) as Array, evidence_id, MAX_EVIDENCE_REFS)
	candidate["state_hash"] = _record_hash(candidate)
	_beliefs[record_id] = candidate
	_update_profile_ref(actor_id, "knowledge_refs", record_id, evidence_id)
	var result := {
		"ok": true,
		"schema": "leyforge.social-transaction-result",
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"belief_id": record_id,
		"proposition_key": proposition_ref,
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"evidence_id": evidence_id,
		"authoritative_world_time": _world_time(),
	}
	_store_transaction(transaction_id, actor_id, request_hash, result)
	knowledge_changed.emit(actor_id, proposition_ref)
	profile_changed.emit(actor_id)
	social_changed.emit()
	return result


func knowledge_state(actor_id: String, proposition: Variant) -> Dictionary:
	var record := get_belief(actor_id, proposition)
	if record.is_empty():
		return {
			"schema": "leyforge.set28.knowledge-state",
			"version": STATE_VERSION,
			"actor_id": actor_id,
			"proposition_key": proposition_key(proposition),
			"awareness": "unaware",
			"stance": "unknown",
			"confidence": 0,
			"source_revision": 0,
		}
	return {
		"schema": "leyforge.set28.knowledge-state",
		"version": STATE_VERSION,
		"actor_id": actor_id,
		"proposition_key": str(record.get("proposition_key", "")),
		"awareness": str(record.get("awareness", "unaware")),
		"stance": str(record.get("stance", "unknown")),
		"confidence": int(record.get("confidence", 0)),
		"freshness": (record.get("observed_world_time", {}) as Dictionary).duplicate(true),
		"primary_provenance": str(record.get("primary_source_id", "")),
		"contradiction_state": str(record.get("contradiction_state", "none")),
		"disclosure_policy_id": str(record.get("disclosure_policy_id", "")),
		"source_revision": int(record.get("revision", 0)),
		"authoritative_world_time": _world_time(),
	}


func belief_state(actor_id: String, proposition: Variant) -> String:
	return str(knowledge_state(actor_id, proposition).get("stance", "unknown"))


func confidence(actor_id: String, proposition: Variant) -> int:
	return int(knowledge_state(actor_id, proposition).get("confidence", 0))


func can_assert(actor_id: String, proposition: Variant, speech_mode: String) -> Dictionary:
	var state := knowledge_state(actor_id, proposition)
	var aware := str(state.get("awareness", "unaware")) != "unaware"
	var explicit_nonknowledge_mode := speech_mode in [
		"question", "guess", "hearsay", "speculation", "fiction", "deception",
	]
	return {
		"ok": true,
		"allowed": aware or explicit_nonknowledge_mode,
		"reason_code": "knowledge_available" if aware else (
			"explicit_nonknowledge_mode" if explicit_nonknowledge_mode
			else "speaker_lacks_knowledge"),
		"knowledge_state": state,
	}


func conversation_availability(request: Dictionary) -> Dictionary:
	var participant_values: Variant = request.get("participant_ids", [])
	if not (participant_values is Array) or participant_values.size() < 2:
		return {"available": false, "reason_codes": ["participants_required"]}
	var reason_codes: Array[String] = []
	for participant_value in participant_values:
		var participant_id := str(participant_value)
		if not _profiles.has(participant_id):
			reason_codes.append("unknown_participant:%s" % participant_id)
			continue
		if PeopleManager.has_person(participant_id) and str(
				PeopleManager.get_person(participant_id).get(
					"existence_state", "alive")) != "alive":
			reason_codes.append("participant_unavailable:%s" % participant_id)
		if BiologyManager.initialized and BiologyManager.has_actor(participant_id):
			var biological: Dictionary = BiologyManager.social_biological_summary(
				participant_id, {"allow_critical_alert": true})
			if not bool(biological.get("conversation_available", true)):
				reason_codes.append("biological_unavailable:%s" % participant_id)
		for session_id in conversation_ids(false):
			var session: Dictionary = _conversations[session_id]
			if bool(session.get("exclusive", true)) \
					and participant_id in (session.get("participant_ids", []) as Array):
				reason_codes.append("exclusive_conversation:%s" % participant_id)
	return {
		"schema": "leyforge.set28.conversation-availability",
		"version": STATE_VERSION,
		"available": reason_codes.is_empty(),
		"availability_class": "available" if reason_codes.is_empty() else "blocked",
		"reason_codes": reason_codes,
		"authoritative_world_time": _world_time(),
	}


func begin_conversation(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var transaction_id := _request_transaction_id(request)
	var session_id := str(request.get("session_id", ""))
	if transaction_id.is_empty() or session_id.is_empty():
		return {"ok": false, "error": "conversation_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	if _conversations.has(session_id):
		return {"ok": false, "error": "conversation_session_exists"}
	var availability := conversation_availability(request)
	if not bool(availability.get("available", false)):
		return {"ok": false, "error": "conversation_unavailable",
			"availability": availability}
	var participant_ids: Array = (request.get("participant_ids", []) as Array).duplicate()
	var initiator_id := str(request.get("initiator_id", participant_ids[0]))
	var controlling_id := str(request.get(
		"controlling_actor_or_group_id", initiator_id))
	var session := {
		"record_type": "ConversationSessionState",
		"version": STATE_VERSION,
		"session_id": session_id,
		"template_id": str(request.get(
			"template_id", "leyforge.core.dialogue.template.systemic")),
		"state": "active",
		"initiator_id": initiator_id,
		"participant_ids": participant_ids,
		"primary_addressee_id": str(request.get(
			"primary_addressee_id", participant_ids[1])),
		"authority_scope": str(request.get("authority_scope", "personal")),
		"controlling_actor_or_group_id": controlling_id,
		"current_beat_id": str(request.get("current_beat_id", "entry")),
		"topic_stack": (request.get("topic_stack", []) as Array).duplicate(),
		"context_snapshot": (request.get(
			"context_snapshot", {}) as Dictionary).duplicate(true),
		"context_revision": 1,
		"candidate_choice_ids": (request.get(
			"candidate_choice_ids", []) as Array).duplicate(),
		"committed_choice_history": [],
		"external_resolution_refs": [],
		"semantic_event_refs": [],
		"save_policy": str(request.get("save_policy", "routine_close_on_save")),
		"exclusive": bool(request.get("exclusive", true)),
		"start_world_time": _world_time(),
		"last_update_world_time": _world_time(),
		"end_reason": "",
		"revision": 1,
		"evidence_refs": [],
		"transaction_refs": [transaction_id],
		"state_hash": "",
	}
	var evidence_id := "evidence.social.conversation.begin.%s" % (
		_world_scoped_token(transaction_id))
	var request_hash := _hash_value(request)
	var evidence := _commit_evidence(evidence_id, "conversation_started", {
		"transaction_id": transaction_id,
		"session_id": session_id,
		"participant_ids": participant_ids,
		"authority_scope": str(session.get("authority_scope", "")),
		"request_hash": request_hash,
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	session["evidence_refs"] = [evidence_id]
	session["semantic_event_refs"] = [evidence_id]
	session["state_hash"] = _record_hash(session)
	_conversations[session_id] = session
	for participant_value in participant_ids:
		_update_profile_conversation(str(participant_value), session_id, evidence_id)
	var result := {
		"ok": true,
		"schema": "leyforge.social-transaction-result",
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"session_id": session_id,
		"result_revision": 1,
		"evidence_id": evidence_id,
		"person_commitment_requests": _conversation_commitment_requests(session),
		"authoritative_world_time": _world_time(),
	}
	_store_transaction(transaction_id, session_id, request_hash, result)
	conversation_changed.emit(session_id)
	social_changed.emit()
	return result


func conversation_view(session_id: String, viewer_id: String = "") -> Dictionary:
	if not _conversations.has(session_id):
		return {}
	var session: Dictionary = _conversations[session_id]
	var participants: Array = session.get("participant_ids", [])
	if not viewer_id.is_empty() and viewer_id not in participants \
			and str(session.get("authority_scope", "")) == "personal":
		return {
			"schema": "leyforge.set28.conversation-view",
			"version": STATE_VERSION,
			"session_id": session_id,
			"visible": false,
			"reason_code": "private_conversation",
		}
	return {
		"schema": "leyforge.set28.conversation-view",
		"version": STATE_VERSION,
		"session_id": session_id,
		"visible": true,
		"state": str(session.get("state", "")),
		"template_id": str(session.get("template_id", "")),
		"participant_ids": participants.duplicate(),
		"primary_addressee_id": str(session.get("primary_addressee_id", "")),
		"authority_scope": str(session.get("authority_scope", "")),
		"current_beat_id": str(session.get("current_beat_id", "")),
		"candidate_choice_ids": (
			session.get("candidate_choice_ids", []) as Array).duplicate(),
		"expected_revision": int(session.get("revision", 0)),
		"context_revision": int(session.get("context_revision", 0)),
		"end_reason": str(session.get("end_reason", "")),
		"authoritative_world_time": _world_time(),
	}


func commit_dialogue_choice(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var session_id := str(request.get("session_id", ""))
	var choice_id := str(request.get("choice_id", ""))
	var chooser_id := str(request.get("chooser_id", ""))
	var semantic_action_id := str(request.get("semantic_action_id", ""))
	if session_id.is_empty() or choice_id.is_empty() or chooser_id.is_empty() \
			or semantic_action_id.is_empty():
		return {"ok": false, "error": "dialogue_choice_identity_required"}
	if not _conversations.has(session_id):
		return {"ok": false, "error": "unknown_conversation_session"}
	var before: Dictionary = _conversations[session_id]
	if str(before.get("state", "")) not in ["active", "awaiting_choice"]:
		return {"ok": false, "error": "conversation_not_committable"}
	if chooser_id not in (before.get("participant_ids", []) as Array):
		return {"ok": false, "error": "chooser_not_participant"}
	var expected_revision := int(request.get("expected_revision", -1))
	if expected_revision != int(before.get("revision", 0)):
		return {"ok": false, "error": "stale_conversation_revision",
			"current_revision": int(before.get("revision", 0))}
	var forbidden := _forbidden_external_mutation(request)
	if not forbidden.is_empty():
		return {"ok": false, "error": "cross_owner_mutation_forbidden", "field": forbidden}
	var next_state := "ended" if bool(request.get("close_after_commit", false)) \
		else str(request.get("next_state", "active"))
	if next_state not in VALID_CONVERSATION_STATES:
		return {"ok": false, "error": "invalid_conversation_state"}
	var candidate := before.duplicate(true)
	var prior_revision := int(before.get("revision", 0))
	var commit_id := "conversation_commit.%s" % _world_scoped_token(transaction_id)
	var commit_record := {
		"record_type": "ConversationCommitRecord",
		"version": STATE_VERSION,
		"commit_id": commit_id,
		"session_id": session_id,
		"choice_id": choice_id,
		"chooser_id": chooser_id,
		"semantic_action_id": semantic_action_id,
		"semantic_claims": (request.get("semantic_claims", []) as Array).duplicate(true),
		"external_command_requests": (
			request.get("external_command_requests", []) as Array).duplicate(true),
		"external_commit_refs": (
			request.get("external_commit_refs", []) as Array).duplicate(),
		"committed_world_time": _world_time(),
		"session_revision_before": prior_revision,
		"session_revision_after": prior_revision + 1,
		"state_hash": "",
	}
	commit_record["state_hash"] = _record_hash(commit_record)
	var evidence_id := "evidence.social.conversation.commit.%s" % (
		_world_scoped_token(transaction_id))
	var request_hash := _hash_value(request)
	var evidence := _commit_evidence(evidence_id, "dialogue_choice_committed", {
		"transaction_id": transaction_id,
		"commit_id": commit_id,
		"session_id": session_id,
		"choice_id": choice_id,
		"semantic_action_id": semantic_action_id,
		"prior_revision": prior_revision,
		"result_revision": prior_revision + 1,
		"request_hash": request_hash,
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var history: Array = candidate.get("committed_choice_history", []).duplicate()
	history = _append_ref(history, commit_id, MAX_CONVERSATION_HISTORY)
	candidate["committed_choice_history"] = history
	candidate["semantic_event_refs"] = _append_ref(
		candidate.get("semantic_event_refs", []) as Array,
		evidence_id, MAX_CONVERSATION_HISTORY)
	candidate["external_resolution_refs"] = _append_refs(
		candidate.get("external_resolution_refs", []) as Array,
		request.get("external_commit_refs", []) as Array,
		MAX_CONVERSATION_HISTORY)
	candidate["revision"] = prior_revision + 1
	candidate["last_update_world_time"] = _world_time()
	if bool(request.get("close_after_commit", false)):
		candidate["state"] = next_state
		candidate["end_reason"] = str(request.get("end_reason", "choice_committed"))
	else:
		candidate["state"] = next_state
		candidate["current_beat_id"] = str(request.get(
			"next_beat_id", candidate.get("current_beat_id", "")))
	candidate["evidence_refs"] = _append_ref(
		candidate.get("evidence_refs", []) as Array, evidence_id, MAX_EVIDENCE_REFS)
	candidate["transaction_refs"] = _append_ref(
		candidate.get("transaction_refs", []) as Array,
		transaction_id, MAX_TRANSACTION_JOURNAL)
	candidate["state_hash"] = _record_hash(candidate)
	_conversation_commits[commit_id] = commit_record
	_conversations[session_id] = candidate
	for participant_value in candidate.get("participant_ids", []):
		_update_profile_conversation(str(participant_value), session_id, evidence_id)
	var result := {
		"ok": true,
		"schema": "leyforge.social-transaction-result",
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"session_id": session_id,
		"commit_id": commit_id,
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"evidence_id": evidence_id,
		"external_command_requests": (
			commit_record.get("external_command_requests", []) as Array).duplicate(true),
		"person_commitment_release_requests": (
			_conversation_commitment_requests(candidate)
			if str(candidate.get("state", "")) in ["ended", "invalidated"] else []),
		"authoritative_world_time": _world_time(),
	}
	_store_transaction(transaction_id, session_id, request_hash, result)
	conversation_changed.emit(session_id)
	social_changed.emit()
	return result


func dialogue_preview(
		speaker_id: String,
		listener_id: String,
		context: Dictionary) -> Dictionary:
	if not _profiles.has(speaker_id) or not _profiles.has(listener_id):
		return {"available": false, "reason_codes": ["unknown_participant"]}
	var biological: Dictionary = BiologyManager.social_biological_summary(
		speaker_id, {"allow_critical_alert": true}) \
		if BiologyManager.initialized and BiologyManager.has_actor(speaker_id) else {}
	if not biological.is_empty() and not bool(
			biological.get("conversation_available", true)):
		return {
			"available": false,
			"reason_codes": biological.get("reason_codes", ["biological_unavailable"]),
			"biological_summary": biological,
		}
	var job_id := str(context.get("job_id", ""))
	var reputation_band := str(context.get("reputation_band", "stranger"))
	var project_complete := bool(context.get("project_complete", false))
	var line_id := "dialogue.hamlet.resident.default"
	if job_id == "job.leader.elder":
		line_id = "dialogue.hamlet.elder.introduction" if reputation_band == "stranger" \
			else "dialogue.hamlet.elder.project_complete" if project_complete \
			else "dialogue.hamlet.elder.requests"
	elif job_id == "job.builder.basic":
		line_id = "dialogue.hamlet.builder.project_complete" if project_complete \
			else "dialogue.hamlet.builder.awaiting_supplies" if bool(
				context.get("awaiting_supplies", true)) \
			else "dialogue.hamlet.builder.building"
	elif job_id == "job.farmer.basic":
		line_id = "dialogue.hamlet.farmer.pantry"
	elif job_id == "job.guard.militia":
		var combat_phase := str(context.get("combat_phase", "dormant"))
		line_id = "dialogue.hamlet.guard.%s" % combat_phase \
			if combat_phase in ["warning", "assault", "resolved"] \
			else "dialogue.hamlet.guard.patrol"
	elif job_id == "job.merchant.basic":
		line_id = "dialogue.hamlet.merchant.trust"
	elif job_id == "job.mage.apprentice":
		line_id = "dialogue.hamlet.mage.introduction" if reputation_band == "stranger" \
			else "dialogue.hamlet.mage.known_rune" if bool(
				context.get("basic_magic_known", false)) \
			else "dialogue.hamlet.mage.teaching_offer"
	elif job_id == "job.miner.basic":
		line_id = "dialogue.hamlet.miner.stone"
	return {
		"schema": "leyforge.set28.dialogue-preview",
		"version": STATE_VERSION,
		"available": true,
		"semantic_line_id": line_id,
		"speaker_id": speaker_id,
		"listener_id": listener_id,
		"relationship_view": relationship_view(speaker_id, listener_id),
		"biological_summary": biological,
		"authoritative_world_time": _world_time(),
	}


func apply_reputation_event(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var scope_ref := str(request.get("scope_ref", ""))
	var target_ref := str(request.get("target_ref", ""))
	var dimension := str(request.get("dimension", "community_helpfulness"))
	var source_event_id := str(request.get("source_event_id", ""))
	if scope_ref.is_empty() or target_ref.is_empty() or source_event_id.is_empty():
		return {"ok": false, "error": "reputation_event_identity_required"}
	var forbidden := _forbidden_external_mutation(request)
	if not forbidden.is_empty():
		return {"ok": false, "error": "cross_owner_mutation_forbidden", "field": forbidden}
	var reputation_id := _reputation_id(scope_ref, target_ref, dimension)
	var before: Dictionary = _reputations.get(reputation_id, {
		"record_type": "SocialReputationRecord",
		"version": STATE_VERSION,
		"reputation_id": reputation_id,
		"scope_ref": scope_ref,
		"target_ref": target_ref,
		"dimension": dimension,
		"score": 0.0,
		"band": _reputation_band(dimension, 0.0),
		"evidence_refs": [],
		"transaction_refs": [],
		"revision": 0,
		"created_tick": int(_world_time().get("world_tick", 0)),
		"updated_tick": int(_world_time().get("world_tick", 0)),
		"state_hash": "",
	})
	var expected_revision := int(request.get("expected_revision", -1))
	if expected_revision >= 0 and expected_revision != int(before.get("revision", 0)):
		return {"ok": false, "error": "stale_reputation_revision",
			"current_revision": int(before.get("revision", 0))}
	var candidate := before.duplicate(true)
	var prior_revision := int(before.get("revision", 0))
	var before_score := float(before.get("score", 0.0))
	var after_score := clampf(
		before_score + float(request.get("delta", 0.0)), -100.0, 100.0)
	candidate["score"] = after_score
	candidate["band"] = _reputation_band(dimension, after_score)
	candidate["revision"] = prior_revision + 1
	candidate["updated_tick"] = int(_world_time().get("world_tick", 0))
	var evidence_id := "evidence.social.reputation.%s" % (
		_world_scoped_token(transaction_id))
	var request_hash := _hash_value(request)
	var evidence := _commit_evidence(evidence_id, "social_reputation_changed", {
		"transaction_id": transaction_id,
		"reputation_id": reputation_id,
		"source_event_id": source_event_id,
		"prior_score": before_score,
		"result_score": after_score,
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"request_hash": request_hash,
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	candidate["evidence_refs"] = _append_ref(
		candidate.get("evidence_refs", []) as Array, evidence_id, MAX_EVIDENCE_REFS)
	candidate["transaction_refs"] = _append_ref(
		candidate.get("transaction_refs", []) as Array,
		transaction_id, MAX_TRANSACTION_JOURNAL)
	candidate["state_hash"] = _record_hash(candidate)
	_reputations[reputation_id] = candidate
	if _profiles.has(target_ref):
		_update_profile_ref(target_ref, "reputation_refs", reputation_id, evidence_id)
	var result := {
		"ok": true,
		"schema": "leyforge.social-transaction-result",
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"reputation_id": reputation_id,
		"prior_score": before_score,
		"score": after_score,
		"band": str(candidate.get("band", "unknown")),
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"evidence_id": evidence_id,
		"authoritative_world_time": _world_time(),
	}
	_store_transaction(transaction_id, target_ref, request_hash, result)
	reputation_changed.emit(scope_ref, target_ref)
	social_changed.emit()
	return result


func migrate_legacy_reputation(
		scope_ref: String,
		target_ref: String,
		points: int,
		legacy_band: String,
		transaction_id: String) -> Dictionary:
	var existing := social_reputation(scope_ref, target_ref, "community_helpfulness")
	if int(existing.get("source_revision", 0)) > 0:
		return {"ok": true, "duplicate": true, "reputation": existing}
	return apply_reputation_event({
		"transaction_id": transaction_id,
		"scope_ref": scope_ref,
		"target_ref": target_ref,
		"dimension": "community_helpfulness",
		"delta": clampi(points, -100, 100),
		"source_event_id": "legacy_reputation:%s" % legacy_band,
		"reason_code": "social.reputation.legacy_migration",
	})


func social_reputation(
		scope_ref: String,
		target_ref: String,
		dimension: String = "community_helpfulness") -> Dictionary:
	var reputation_id := _reputation_id(scope_ref, target_ref, dimension)
	var record: Dictionary = _reputations.get(reputation_id, {})
	if record.is_empty():
		return {
			"schema": "leyforge.set28.social-reputation-view",
			"version": STATE_VERSION,
			"reputation_id": reputation_id,
			"scope_ref": scope_ref,
			"target_ref": target_ref,
			"dimension": dimension,
			"score": 0.0,
			"band": _reputation_band(dimension, 0.0),
			"source_revision": 0,
			"authoritative_world_time": _world_time(),
		}
	return {
		"schema": "leyforge.set28.social-reputation-view",
		"version": STATE_VERSION,
		"reputation_id": reputation_id,
		"scope_ref": scope_ref,
		"target_ref": target_ref,
		"dimension": dimension,
		"score": float(record.get("score", 0.0)),
		"band": str(record.get("band", "unknown")),
		"source_revision": int(record.get("revision", 0)),
		"evidence_refs": (record.get("evidence_refs", []) as Array).duplicate(),
		"authoritative_world_time": _world_time(),
	}


func create_companion_agreement(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var companion_id := str(request.get("companion_id", request.get(
		"companion_person_id", "")))
	var recruiter_scope_id := str(request.get("recruiter_scope_id", ""))
	var companion_class_id := str(request.get("companion_class_id", ""))
	var role_definition_id := str(request.get("role_definition_id", ""))
	var consent_evidence_ref := str(request.get("consent_evidence_ref", ""))
	var social_resolution_ref := str(request.get("social_resolution_ref", ""))
	if companion_id.is_empty() or recruiter_scope_id.is_empty() \
			or companion_class_id.is_empty() or role_definition_id.is_empty() \
			or consent_evidence_ref.is_empty() or social_resolution_ref.is_empty():
		return {"ok": false, "error": "companion_agreement_fields_required"}
	if not _profiles.has(companion_id):
		return {"ok": false, "error": "unknown_companion_identity"}
	if PeopleManager.has_person(companion_id) and str(
			PeopleManager.get_person(companion_id).get(
				"existence_state", "alive")) != "alive":
		return {"ok": false, "error": "companion_not_alive"}
	for status_value in _companion_statuses.values():
		if not (status_value is Dictionary):
			continue
		var status_record: Dictionary = status_value
		if str(status_record.get("companion_id", "")) == companion_id \
				and str(status_record.get("status", "")) \
					not in TERMINAL_COMPANION_STATUSES:
			return {"ok": false, "error": "companion_membership_already_active"}
	var permission_states := {}
	var permission_value: Variant = request.get("permission_states", {})
	if not (permission_value is Dictionary):
		return {"ok": false, "error": "invalid_companion_permissions"}
	for permission_key in (permission_value as Dictionary).keys():
		var state := str((permission_value as Dictionary)[permission_key])
		if state not in VALID_PERMISSION_STATES:
			return {"ok": false, "error": "invalid_companion_permission_state"}
		permission_states[str(permission_key)] = state
	var agreement_id := str(request.get(
		"agreement_id", "companion_agreement.%s" % _world_scoped_token(transaction_id)))
	if _companion_agreements.has(agreement_id):
		return {"ok": false, "error": "companion_agreement_exists"}
	var initial_status := str(request.get("initial_status", "active"))
	if initial_status not in VALID_COMPANION_STATUSES:
		return {"ok": false, "error": "invalid_companion_status"}
	var evidence_id := "evidence.social.companion.create.%s" % (
		_world_scoped_token(transaction_id))
	var request_hash := _hash_value(request)
	var evidence := _commit_evidence(evidence_id, "companion_agreement_created", {
		"transaction_id": transaction_id,
		"agreement_id": agreement_id,
		"companion_id": companion_id,
		"recruiter_scope_id": recruiter_scope_id,
		"consent_evidence_ref": consent_evidence_ref,
		"social_resolution_ref": social_resolution_ref,
		"request_hash": request_hash,
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var agreement := {
		"record_type": "CompanionAgreementRecord",
		"version": STATE_VERSION,
		"agreement_id": agreement_id,
		"companion_id": companion_id,
		"recruiter_scope_id": recruiter_scope_id,
		"companion_class_id": companion_class_id,
		"role_definition_id": role_definition_id,
		"start_world_time": _world_time(),
		"duration_rule": str(request.get("duration_rule", "open_ended_voluntary")),
		"expiry_world_time": (request.get("expiry_world_time", {}) as Dictionary).duplicate(true),
		"origin_social_action_ref": social_resolution_ref,
		"consent_evidence_ref": consent_evidence_ref,
		"economic_contract_ref": str(request.get("economic_contract_ref", "")),
		"faction_mandate_ref": str(request.get("faction_mandate_ref", "")),
		"quest_event_ref": str(request.get("quest_event_ref", "")),
		"agreed_travel_scope": str(request.get("agreed_travel_scope", "local")),
		"agreed_risk_band": str(request.get("agreed_risk_band", "low")),
		"permission_profile_id": str(request.get(
			"permission_profile_id", "leyforge.core.companion.permission.standard")),
		"permission_states": permission_states,
		"home_anchor_ref": str(request.get("home_anchor_ref", "")),
		"termination_terms_ref": str(request.get(
			"termination_terms_ref", "companion.termination.voluntary_standard")),
		"status_history_refs": [],
		"revision": 1,
		"evidence_refs": [evidence_id],
		"transaction_refs": [transaction_id],
		"state_hash": "",
	}
	agreement["state_hash"] = _record_hash(agreement)
	var status_record := {
		"record_type": "CompanionStatusRecord",
		"version": STATE_VERSION,
		"agreement_id": agreement_id,
		"companion_id": companion_id,
		"status": initial_status,
		"status_reason": str(request.get(
			"status_reason", "social.companion.status.agreement_accepted")),
		"active_party_ref": str(request.get("active_party_ref", recruiter_scope_id)),
		"last_known_anchor_ref": str(request.get("last_known_anchor_ref", "")),
		"movement_state_ref": "",
		"biological_state_ref": str(request.get("biological_state_ref", "")),
		"current_assignment_ref": "",
		"status_since": _world_time(),
		"last_transition_event_ref": evidence_id,
		"revision": 1,
		"evidence_refs": [evidence_id],
		"transaction_refs": [transaction_id],
		"state_hash": "",
	}
	status_record["state_hash"] = _record_hash(status_record)
	_companion_agreements[agreement_id] = agreement
	_companion_statuses[companion_id] = status_record
	_update_profile_ref(companion_id, "companion_agreement_refs", agreement_id, evidence_id)
	var result := {
		"ok": true,
		"schema": "leyforge.social-transaction-result",
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"agreement_id": agreement_id,
		"companion_id": companion_id,
		"status": initial_status,
		"result_revision": 1,
		"evidence_id": evidence_id,
		"authoritative_world_time": _world_time(),
	}
	_store_transaction(transaction_id, companion_id, request_hash, result)
	companion_changed.emit(companion_id)
	profile_changed.emit(companion_id)
	social_changed.emit()
	return result


func transition_companion_status(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var companion_id := str(request.get("companion_id", ""))
	var next_status := str(request.get("status", ""))
	var reason := str(request.get("status_reason", ""))
	if companion_id.is_empty() or next_status not in VALID_COMPANION_STATUSES \
			or reason.is_empty() or not _companion_statuses.has(companion_id):
		return {"ok": false, "error": "invalid_companion_transition"}
	if next_status in ["active", "joining", "waiting"] \
			and PeopleManager.has_person(companion_id) and str(
				PeopleManager.get_person(companion_id).get(
					"existence_state", "alive")) != "alive":
		return {"ok": false, "error": "companion_not_alive"}
	var before: Dictionary = _companion_statuses[companion_id]
	var expected_revision := int(request.get("expected_revision", -1))
	if expected_revision != int(before.get("revision", 0)):
		return {"ok": false, "error": "stale_companion_revision",
			"current_revision": int(before.get("revision", 0))}
	var candidate := before.duplicate(true)
	var prior_revision := int(before.get("revision", 0))
	var evidence_id := "evidence.social.companion.transition.%s" % (
		_world_scoped_token(transaction_id))
	var request_hash := _hash_value(request)
	var evidence := _commit_evidence(evidence_id, "companion_status_changed", {
		"transaction_id": transaction_id,
		"companion_id": companion_id,
		"agreement_id": str(before.get("agreement_id", "")),
		"prior_status": str(before.get("status", "")),
		"result_status": next_status,
		"prior_revision": prior_revision,
		"result_revision": prior_revision + 1,
		"request_hash": request_hash,
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	candidate["status"] = next_status
	candidate["status_reason"] = reason
	candidate["status_since"] = _world_time()
	candidate["last_transition_event_ref"] = evidence_id
	candidate["active_party_ref"] = str(request.get(
		"active_party_ref", candidate.get("active_party_ref", "")))
	candidate["last_known_anchor_ref"] = str(request.get(
		"last_known_anchor_ref", candidate.get("last_known_anchor_ref", "")))
	candidate["movement_state_ref"] = str(request.get(
		"movement_state_ref", candidate.get("movement_state_ref", "")))
	candidate["biological_state_ref"] = str(request.get(
		"biological_state_ref", candidate.get("biological_state_ref", "")))
	candidate["current_assignment_ref"] = str(request.get(
		"current_assignment_ref", candidate.get("current_assignment_ref", "")))
	candidate["revision"] = prior_revision + 1
	candidate["evidence_refs"] = _append_ref(
		candidate.get("evidence_refs", []) as Array, evidence_id, MAX_EVIDENCE_REFS)
	candidate["transaction_refs"] = _append_ref(
		candidate.get("transaction_refs", []) as Array,
		transaction_id, MAX_TRANSACTION_JOURNAL)
	candidate["state_hash"] = _record_hash(candidate)
	_companion_statuses[companion_id] = candidate
	var result := {
		"ok": true,
		"schema": "leyforge.social-transaction-result",
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"agreement_id": str(candidate.get("agreement_id", "")),
		"companion_id": companion_id,
		"prior_status": str(before.get("status", "")),
		"status": next_status,
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"evidence_id": evidence_id,
		"authoritative_world_time": _world_time(),
	}
	_store_transaction(transaction_id, companion_id, request_hash, result)
	companion_changed.emit(companion_id)
	social_changed.emit()
	return result


func companion_agreement(companion_id: String) -> Dictionary:
	if not _companion_statuses.has(companion_id):
		return {}
	var status: Dictionary = _companion_statuses[companion_id]
	return (_companion_agreements.get(
		str(status.get("agreement_id", "")), {}) as Dictionary).duplicate(true)


func companion_status(companion_id: String) -> Dictionary:
	if not _companion_statuses.has(companion_id):
		return {
			"schema": "leyforge.set28.companion-status",
			"version": STATE_VERSION,
			"companion_id": companion_id,
			"status": "not_companion",
			"available": false,
			"source_revision": 0,
		}
	var status: Dictionary = _companion_statuses[companion_id]
	var agreement := companion_agreement(companion_id)
	return {
		"schema": "leyforge.set28.companion-status",
		"version": STATE_VERSION,
		"companion_id": companion_id,
		"agreement_id": str(status.get("agreement_id", "")),
		"status": str(status.get("status", "")),
		"status_reason": str(status.get("status_reason", "")),
		"available": str(status.get("status", "")) in [
			"active", "waiting", "home_reserve", "resting"],
		"recruiter_scope_id": str(agreement.get("recruiter_scope_id", "")),
		"companion_class_id": str(agreement.get("companion_class_id", "")),
		"role_definition_id": str(agreement.get("role_definition_id", "")),
		"permission_profile_id": str(agreement.get("permission_profile_id", "")),
		"source_revision": int(status.get("revision", 0)),
		"agreement_revision": int(agreement.get("revision", 0)),
		"authoritative_world_time": _world_time(),
	}


func companion_view(companion_id: String, requester_id: String = "") -> Dictionary:
	var status := companion_status(companion_id)
	if str(status.get("status", "")) == "not_companion":
		return status
	var agreement := companion_agreement(companion_id)
	var biological: Dictionary = BiologyManager.social_biological_summary(
		companion_id, {"observer_id": requester_id}) \
		if BiologyManager.initialized and BiologyManager.has_actor(companion_id) else {}
	return {
		"schema": "leyforge.set28.companion-view",
		"version": STATE_VERSION,
		"status": status,
		"relationship": relationship_view(companion_id, requester_id) \
			if _profiles.has(requester_id) else {},
		"biological_summary": biological,
		"home_anchor_ref": str(agreement.get("home_anchor_ref", "")),
		"economic_contract_ref": str(agreement.get("economic_contract_ref", "")),
		"movement_state_ref": str((_companion_statuses[companion_id] \
			as Dictionary).get("movement_state_ref", "")),
		"authoritative_world_time": _world_time(),
	}


func assignment_willingness(actor_id: String, task: Dictionary) -> Dictionary:
	if not _profiles.has(actor_id):
		return {"ok": false, "available": false, "reason_codes": ["unknown_actor"]}
	var reasons: Array[String] = []
	var biological: Dictionary = BiologyManager.social_biological_summary(
		actor_id, {"allow_critical_alert": true}) \
		if BiologyManager.initialized and BiologyManager.has_actor(actor_id) else {}
	if not biological.is_empty() and not bool(
			biological.get("assignment_survival_availability", true)):
		reasons.append("biological_assignment_unavailable")
	var requires_companion := bool(task.get("requires_companion_agreement", false))
	var status := companion_status(actor_id)
	if requires_companion and str(status.get("status", "")) == "not_companion":
		reasons.append("companion_agreement_required")
	if requires_companion and not bool(status.get("available", false)):
		reasons.append("companion_status_unavailable")
	var permission_id := str(task.get("social_permission_id", ""))
	if not permission_id.is_empty() and str(status.get("status", "")) != "not_companion":
		var agreement := companion_agreement(actor_id)
		var permission_states: Dictionary = agreement.get("permission_states", {})
		var permission_state := str(permission_states.get(permission_id, "unknown"))
		if permission_state in ["prohibited", "unknown"]:
			reasons.append("companion_permission_%s" % permission_state)
	return {
		"ok": true,
		"schema": "leyforge.set28.assignment-willingness",
		"version": STATE_VERSION,
		"actor_id": actor_id,
		"available": reasons.is_empty(),
		"reason_codes": reasons,
		"companion_status": status,
		"biological_summary": biological,
		"social_profile_ref": social_profile_id(actor_id),
		"source_revision": int((_profiles[actor_id] as Dictionary).get("revision", 0)),
		"authoritative_world_time": _world_time(),
	}


func social_care_context(actor_id: String, context: Dictionary) -> Dictionary:
	var caregiver_id := str(context.get("caregiver_id", ""))
	var relationship_ref := relationship_record_id(caregiver_id, actor_id) \
		if not caregiver_id.is_empty() else ""
	return {
		"schema": "leyforge.xset.social-care-context",
		"version": "1.1",
		"source_owner": "set28",
		"entity_ref": actor_id,
		"care_or_assignment_context_ref": str(context.get("context_ref", "")),
		"named_actor_priority_reason": str(context.get("priority_reason", "")),
		"care_action_or_assistance_intent": str(context.get("care_intent", "")),
		"relationship_or_consent_evidence_ref": str(context.get(
			"consent_evidence_ref", relationship_ref)),
		"assignment_status_ref": str(context.get("assignment_status_ref", "")),
		"world_time": _world_time(),
		"source_revision": int((_profiles.get(actor_id, {}) as Dictionary).get(
			"revision", 0)),
	}


func social_movement_authorisation(
		companion_id: String,
		movement_context: Dictionary) -> Dictionary:
	var status := companion_status(companion_id)
	var agreement := companion_agreement(companion_id)
	var allowed := bool(status.get("available", false)) \
		and str(agreement.get("agreed_travel_scope", "")) != "none"
	var agreement_id := str(agreement.get("agreement_id", ""))
	return {
		"schema": "leyforge.xset.social-movement-authorisation",
		"version": "1.1",
		"source_owner": "set28",
		"context_id": str(movement_context.get(
			"context_id", "social_movement.%s" % _stable_token(movement_context))),
		"subject_or_group_ref": companion_id,
		"companion_travel_permission": allowed,
		"ride_or_mount_permission": bool(movement_context.get(
			"ride_or_mount_requested", false)) and allowed,
		"passenger_assignment_refs": (
			movement_context.get("passenger_assignment_refs", []) as Array).duplicate(),
		"control_authority_ref": agreement_id,
		"formation_intent_ref": str(movement_context.get("formation_intent_ref", "")),
		"assignment_ref": str(movement_context.get("assignment_ref", "")),
		"allowed_transport_or_movement_constraints": [
			str(agreement.get("agreed_travel_scope", "none")),
			str(agreement.get("agreed_risk_band", "low")),
		],
		"world_time": _world_time(),
		"source_revision": int(status.get("source_revision", 0)),
		"evidence_id": str((agreement.get("evidence_refs", []) as Array).back()) \
			if not (agreement.get("evidence_refs", []) as Array).is_empty() else "",
	}


func formation_intent(request: Dictionary) -> Dictionary:
	var group_id := str(request.get("group_id", ""))
	var leader_ref := str(request.get("leader_ref", ""))
	var members: Array = (request.get("member_refs", []) as Array).duplicate()
	if group_id.is_empty() or leader_ref.is_empty() or members.is_empty():
		return {"ok": false, "error": "formation_identity_required"}
	var blocked: Array[String] = []
	for member_value in members:
		var member_id := str(member_value)
		if member_id == leader_ref:
			continue
		if not bool(companion_status(member_id).get("available", false)):
			blocked.append(member_id)
	if not blocked.is_empty():
		return {"ok": false, "error": "formation_member_not_authorised",
			"blocked_member_refs": blocked}
	return {
		"ok": true,
		"schema": "leyforge.xset.formation-intent",
		"version": "1.1",
		"source_owner": "set28",
		"formation_intent_id": str(request.get(
			"formation_intent_id", "formation_intent.%s" % _stable_token(request))),
		"group_id": group_id,
		"leader_ref": leader_ref,
		"member_refs": members,
		"formation_style": str(request.get("formation_style", "follow")),
		"spacing_preference": str(request.get("spacing_preference", "normal")),
		"role_slot_preferences": (
			request.get("role_slot_preferences", {}) as Dictionary).duplicate(true),
		"compression_allowed": bool(request.get("compression_allowed", true)),
		"split_allowed": bool(request.get("split_allowed", true)),
		"regroup_policy": str(request.get("regroup_policy", "when_safe")),
		"follow_distance_band": str(request.get("follow_distance_band", "near")),
		"priority_or_urgency": str(request.get("priority_or_urgency", "routine")),
		"social_reason_ref": str(request.get("social_reason_ref", "")),
		"revision": 1,
	}


func route_knowledge_snapshot(observer_id: String, route_ref: String) -> Dictionary:
	var matching: Dictionary = {}
	for belief_id in belief_ids(observer_id):
		var belief: Dictionary = _beliefs[belief_id]
		var proposition: Dictionary = belief.get("proposition", {})
		if str(proposition.get("predicate", "")) in [
			"route.access", "route.condition", "route.accessibility"] \
				and str(proposition.get(
					"subject_ref", proposition.get("subject", ""))) == route_ref:
			matching = belief
			break
	return {
		"schema": "leyforge.xset.route-knowledge-snapshot",
		"version": "1.1",
		"source_owner": "set28",
		"observer_or_group_id": observer_id,
		"route_or_region_ref": route_ref,
		"knowledge_state": str(matching.get("awareness", "unaware")),
		"belief_or_claim_confidence": int(matching.get("confidence", 0)),
		"last_verified_time": (
			matching.get("observed_world_time", {}) as Dictionary).duplicate(true),
		"known_closures": [],
		"known_hazards": [],
		"known_transfers": [],
		"source_provenance_refs": (
			matching.get("evidence_refs", []) as Array).duplicate(),
		"staleness_band": "unknown" if matching.is_empty() else "recorded_observation",
		"permission_to_reveal": str(matching.get(
			"disclosure_policy_id", "social.knowledge.disclosure.public")),
		"knowledge_revision": int(matching.get("revision", 0)),
	}


func settlement_social_summary(settlement_ref: String) -> Dictionary:
	var profiles := profile_ids(settlement_ref)
	var relationship_count := 0
	var knowledge_count := 0
	var companion_count := 0
	for actor_id in profiles:
		relationship_count += relationship_ids(actor_id).size()
		knowledge_count += belief_ids(actor_id).size()
		if str(companion_status(actor_id).get("status", "not_companion")) \
				!= "not_companion":
			companion_count += 1
	return {
		"schema": "leyforge.set28.settlement-social-summary",
		"version": STATE_VERSION,
		"settlement_ref": settlement_ref,
		"profile_count": profiles.size(),
		"directed_relationship_count": relationship_count,
		"knowledge_record_count": knowledge_count,
		"companion_count": companion_count,
		"world_time": _world_time(),
		"source_revision": _summary_revision(profiles),
	}


func lod_snapshot(actor_id: String) -> Dictionary:
	if not _profiles.has(actor_id):
		return {}
	var profile: Dictionary = _profiles[actor_id]
	var relationship_records: Array[Dictionary] = []
	for relationship_ref in (profile.get("relationship_refs", []) as Array).slice(0, 32):
		if _relationships.has(str(relationship_ref)):
			relationship_records.append((
				_relationships[str(relationship_ref)] as Dictionary).duplicate(true))
	var beliefs: Array[Dictionary] = []
	for belief_ref in (profile.get("knowledge_refs", []) as Array).slice(0, 32):
		if _beliefs.has(str(belief_ref)):
			beliefs.append((_beliefs[str(belief_ref)] as Dictionary).duplicate(true))
	return {
		"identity": {
			"record_type": "SocialProfileState",
			"social_profile_id": str(profile.get("social_profile_id", "")),
			"actor_id": actor_id,
			"person_ref": str(profile.get("person_ref", "")),
		},
		"ownership": {
			"owner": EVIDENCE_OWNER,
			"settlement_ref": str(profile.get("settlement_ref", "")),
		},
		"history": {
			"relationships": relationship_records,
			"beliefs": beliefs,
			"social_memory_refs": _memory_refs_for(actor_id),
			"evidence_refs": (profile.get("evidence_refs", []) as Array).duplicate(),
		},
		"irreversible": {
			"milestone_refs": _milestone_refs_for(actor_id),
			"companion_agreement": companion_agreement(actor_id),
		},
		"state": {
			"companion_status": companion_status(actor_id),
			"last_conversation_ref": str(profile.get("last_conversation_ref", "")),
			"representation": "social_record",
			"state_hash": str(profile.get("state_hash", "")),
		},
	}


func serialize_state() -> Dictionary:
	var journal: Array[Dictionary] = []
	for transaction_id in _transaction_order:
		if _transactions.has(transaction_id):
			journal.append((_transactions[transaction_id] as Dictionary).duplicate(true))
	var data := {
		"schema": STATE_SCHEMA,
		"version": STATE_VERSION,
		"interface_id": INTERFACE_ID,
		"interface_version": INTERFACE_VERSION,
		"world_seed": world_seed,
		"world_id": world_id,
		"profiles": _sorted_records(_profiles, "actor_id"),
		"relationships": _sorted_records(_relationships, "relationship_id"),
		"relationship_impacts": _sorted_records(_relationship_impacts, "impact_id"),
		"social_memories": _sorted_records(_social_memories, "memory_id"),
		"milestones": _sorted_records(_milestones, "milestone_id"),
		"beliefs": _sorted_records(_beliefs, "belief_id"),
		"conversations": _persistent_conversations(),
		"conversation_commits": _sorted_records(_conversation_commits, "commit_id"),
		"companion_agreements": _sorted_records(
			_companion_agreements, "agreement_id"),
		"companion_statuses": _sorted_records(_companion_statuses, "companion_id"),
		"reputations": _sorted_records(_reputations, "reputation_id"),
		"transaction_journal": journal,
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
			or str(data.get("interface_id", "")) != INTERFACE_ID \
			or int(data.get("world_seed", -1)) != expected_seed \
			or str(data.get("state_hash", "")) != _state_hash(data):
		return false
	var saved_world_id := str(data.get("world_id", ""))
	if not expected_world_id.is_empty() and not saved_world_id.is_empty() \
			and saved_world_id != expected_world_id:
		return false
	var restored_profiles := _restore_records(
		data.get("profiles", []), "actor_id", Callable(self, "validate_profile"))
	var restored_relationships := _restore_records(
		data.get("relationships", []), "relationship_id",
		Callable(self, "validate_relationship"))
	var restored_beliefs := _restore_records(
		data.get("beliefs", []), "belief_id", Callable(self, "validate_belief"))
	var restored_conversations := _restore_records(
		data.get("conversations", []), "session_id",
		Callable(self, "validate_conversation"))
	var restored_agreements := _restore_records(
		data.get("companion_agreements", []), "agreement_id",
		Callable(self, "validate_companion_agreement"))
	var restored_statuses := _restore_records(
		data.get("companion_statuses", []), "companion_id",
		Callable(self, "validate_companion_status"))
	var restored_reputations := _restore_records(
		data.get("reputations", []), "reputation_id",
		Callable(self, "validate_reputation"))
	for restored in [restored_profiles, restored_relationships, restored_beliefs,
			restored_conversations, restored_agreements, restored_statuses,
			restored_reputations]:
		if not bool((restored as Dictionary).get("ok", false)):
			return false
	var generic_sets := {}
	for spec in [
		["relationship_impacts", "impact_id"],
		["social_memories", "memory_id"],
		["milestones", "milestone_id"],
		["conversation_commits", "commit_id"],
	]:
		var restored := _restore_records(
			data.get(spec[0], []), str(spec[1]), Callable(self, "validate_generic_record"))
		if not bool(restored.get("ok", false)):
			return false
		generic_sets[str(spec[0])] = restored.get("records", {})
	var restored_transactions := {}
	var restored_order: Array[String] = []
	var journal_value: Variant = data.get("transaction_journal", [])
	if not (journal_value is Array):
		return false
	for entry_value in journal_value:
		if not (entry_value is Dictionary):
			return false
		var entry: Dictionary = entry_value.duplicate(true)
		var transaction_id := str(entry.get("transaction_id", ""))
		if transaction_id.is_empty() or restored_transactions.has(transaction_id) \
				or str(entry.get("payload_hash", "")).length() != 64 \
				or not (entry.get("result", {}) is Dictionary):
			return false
		restored_transactions[transaction_id] = entry
		restored_order.append(transaction_id)
	initialized = true
	restored_from_state = true
	world_seed = expected_seed
	world_id = expected_world_id if not expected_world_id.is_empty() else saved_world_id
	_profiles = restored_profiles.get("records", {})
	_relationships = restored_relationships.get("records", {})
	_beliefs = restored_beliefs.get("records", {})
	_conversations = restored_conversations.get("records", {})
	_companion_agreements = restored_agreements.get("records", {})
	_companion_statuses = restored_statuses.get("records", {})
	_reputations = restored_reputations.get("records", {})
	_relationship_impacts = generic_sets.get("relationship_impacts", {})
	_social_memories = generic_sets.get("social_memories", {})
	_milestones = generic_sets.get("milestones", {})
	_conversation_commits = generic_sets.get("conversation_commits", {})
	_transactions = restored_transactions
	_transaction_order = restored_order
	if not _profiles.has(PLAYER_ACTOR_ID):
		return false
	for actor_id in profile_ids():
		_publish_person_ref(
			_profiles[actor_id], "social.restore_ref.%s" % _stable_token(actor_id))
	social_changed.emit()
	return true


func validate_profile(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "SocialProfileState" \
			or int(record.get("version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_social_profile"}
	for field in ["actor_id", "social_profile_id", "identity_class", "state_hash"]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	for field in ["relationship_refs", "knowledge_refs", "conversation_refs",
			"companion_agreement_refs", "reputation_refs", "evidence_refs",
			"transaction_refs"]:
		if not (record.get(field, []) is Array):
			return {"ok": false, "error": "invalid_%s" % field}
	if int(record.get("revision", 0)) < 1 \
			or str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "social_profile_hash_or_revision_invalid"}
	return {"ok": true}


func validate_relationship(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "RelationshipRecord" \
			or str(record.get("relationship_id", "")).is_empty() \
			or not (record.get("dimensions", {}) is Dictionary):
		return {"ok": false, "error": "invalid_relationship_record"}
	var dimensions: Dictionary = record.get("dimensions", {})
	for dimension in ALL_DIMENSIONS:
		var value := float(dimensions.get(dimension, 0.0))
		if dimension in SIGNED_DIMENSIONS and (value < -100.0 or value > 100.0):
			return {"ok": false, "error": "signed_relationship_out_of_range"}
		if dimension in UNSIGNED_DIMENSIONS and (value < 0.0 or value > 100.0):
			return {"ok": false, "error": "unsigned_relationship_out_of_range"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "relationship_hash_mismatch"}
	return {"ok": true}


func validate_belief(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "BeliefRecord" \
			or str(record.get("belief_id", "")).is_empty() \
			or str(record.get("actor_id", "")).is_empty() \
			or str(record.get("proposition_key", "")).is_empty() \
			or str(record.get("awareness", "")) not in VALID_AWARENESS \
			or str(record.get("stance", "")) not in VALID_STANCES:
		return {"ok": false, "error": "invalid_belief_record"}
	if int(record.get("confidence", -1)) < 0 \
			or int(record.get("confidence", 1001)) > 1000 \
			or str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "belief_hash_or_confidence_invalid"}
	return {"ok": true}


func validate_conversation(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "ConversationSessionState" \
			or str(record.get("session_id", "")).is_empty() \
			or str(record.get("state", "")) not in VALID_CONVERSATION_STATES \
			or not (record.get("participant_ids", []) is Array) \
			or (record.get("participant_ids", []) as Array).size() < 2:
		return {"ok": false, "error": "invalid_conversation_record"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "conversation_hash_mismatch"}
	return {"ok": true}


func validate_companion_agreement(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "CompanionAgreementRecord" \
			or str(record.get("agreement_id", "")).is_empty() \
			or str(record.get("companion_id", "")).is_empty() \
			or str(record.get("consent_evidence_ref", "")).is_empty() \
			or not (record.get("permission_states", {}) is Dictionary):
		return {"ok": false, "error": "invalid_companion_agreement"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "companion_agreement_hash_mismatch"}
	return {"ok": true}


func validate_companion_status(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "CompanionStatusRecord" \
			or str(record.get("companion_id", "")).is_empty() \
			or str(record.get("status", "")) not in VALID_COMPANION_STATUSES:
		return {"ok": false, "error": "invalid_companion_status"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "companion_status_hash_mismatch"}
	return {"ok": true}


func validate_reputation(record: Dictionary) -> Dictionary:
	var score := float(record.get("score", 0.0))
	if str(record.get("record_type", "")) != "SocialReputationRecord" \
			or str(record.get("reputation_id", "")).is_empty() \
			or score < -100.0 or score > 100.0 \
			or str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "invalid_social_reputation"}
	return {"ok": true}


func validate_generic_record(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")).is_empty() \
			or str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "invalid_social_generic_record"}
	return {"ok": true}


func _new_profile(
		actor_id: String,
		projection: Dictionary,
		source_kind: String,
		person_ref: String,
		settlement_ref: String,
		identity_class: String,
		evidence_id: String) -> Dictionary:
	var record := {
		"record_type": "SocialProfileState",
		"version": STATE_VERSION,
		"social_profile_id": social_profile_id(actor_id),
		"actor_id": actor_id,
		"person_ref": person_ref,
		"identity_class": identity_class,
		"world_seed": world_seed,
		"world_id": world_id,
		"settlement_ref": settlement_ref,
		"personality_profile_refs": (
			projection.get("social_personality_refs", []) as Array).duplicate(),
		"social_boundary_tags": (
			projection.get("social_boundary_tags", []) as Array).duplicate(),
		"relationship_refs": [],
		"knowledge_refs": [],
		"conversation_refs": [],
		"last_conversation_ref": "",
		"companion_agreement_refs": [],
		"reputation_refs": [],
		"source_kind": source_kind,
		"revision": 1,
		"created_tick": int(_world_time().get("world_tick", 0)),
		"updated_tick": int(_world_time().get("world_tick", 0)),
		"evidence_refs": [evidence_id],
		"transaction_refs": [],
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	return record


func _new_relationship(subject_id: String, target_id: String) -> Dictionary:
	var dimensions := {}
	for dimension in ALL_DIMENSIONS:
		dimensions[dimension] = 0.0
	var record := {
		"record_type": "RelationshipRecord",
		"version": STATE_VERSION,
		"relationship_id": relationship_record_id(subject_id, target_id),
		"subject_id": subject_id,
		"target_id": target_id,
		"dimensions": dimensions,
		"trust_domain_overrides": {},
		"milestone_ids": [],
		"impact_refs": [],
		"retained_memory_refs": [],
		"familiarity_floor": 0.0,
		"retention_class": "transient",
		"last_meaningful_contact_tick": 0,
		"reason_codes": [],
		"revision": 0,
		"created_tick": int(_world_time().get("world_tick", 0)),
		"updated_tick": int(_world_time().get("world_tick", 0)),
		"evidence_refs": [],
		"transaction_refs": [],
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	return record


func _dimension_query(subject_id: String, target_id: String, dimension: String) -> Dictionary:
	var record := get_relationship(subject_id, target_id)
	var value := float((record.get("dimensions", {}) as Dictionary).get(
		dimension, 0.0))
	return {
		"schema": "leyforge.set28.relationship-dimension",
		"version": STATE_VERSION,
		"subject_id": subject_id,
		"target_id": target_id,
		"dimension": dimension,
		"value": value,
		"band": _dimension_band(dimension, value),
		"source_revision": int(record.get("revision", 0)),
		"authoritative_world_time": _world_time(),
	}


func _dimension_band(dimension: String, value: float) -> String:
	if dimension in SIGNED_DIMENSIONS:
		if value <= -76.0:
			return "profound_negative"
		if value <= -41.0:
			return "negative"
		if value <= -16.0:
			return "wary_or_mild_negative"
		if value <= 15.0:
			return "neutral"
		if value <= 40.0:
			return "positive"
		if value <= 75.0:
			return "strong_positive"
		return "deep_positive"
	if value <= 10.0:
		return "none"
	if value <= 25.0:
		return "low"
	if value <= 45.0:
		return "noticeable"
	if value <= 65.0:
		return "strong"
	if value <= 85.0:
		return "very_strong"
	return "defining"


func _relationship_level_from(dimensions: Dictionary, milestones: Array[String]) -> String:
	if "married" in milestones or "partner" in milestones:
		return "committed_partner"
	if "close_friend" in milestones:
		return "close_friend"
	if "friend" in milestones:
		return "friend"
	if float(dimensions.get("grievance", 0.0)) >= 66.0 \
			or float(dimensions.get("trust", 0.0)) <= -41.0:
		return "hostile_or_aggrieved"
	if float(dimensions.get("familiarity", 0.0)) >= 26.0:
		return "familiar"
	if float(dimensions.get("familiarity", 0.0)) >= 11.0:
		return "recognised"
	return "stranger"


func _friend_eligible(record: Dictionary) -> bool:
	if record.is_empty():
		return false
	var dimensions: Dictionary = record.get("dimensions", {})
	return float(dimensions.get("trust", 0.0)) >= 16.0 \
		and float(dimensions.get("affection", 0.0)) >= 16.0 \
		and float(dimensions.get("familiarity", 0.0)) >= 26.0


func _is_adult_person(actor_id: String) -> bool:
	if not PeopleManager.has_person(actor_id):
		return false
	return str((PeopleManager.get_person(actor_id).get(
		"life_stage", {}) as Dictionary).get("age_band", "")) == "adult"


func _attach_milestone(
		subject_id: String,
		target_id: String,
		milestone_id: String,
		evidence_id: String) -> void:
	var relationship_ref := relationship_record_id(subject_id, target_id)
	var record: Dictionary = _relationships.get(
		relationship_ref, _new_relationship(subject_id, target_id))
	record["milestone_ids"] = _append_ref(
		record.get("milestone_ids", []) as Array, milestone_id, MAX_PROFILE_REFS)
	record["retention_class"] = "defining"
	record["revision"] = int(record.get("revision", 0)) + 1
	record["updated_tick"] = int(_world_time().get("world_tick", 0))
	record["evidence_refs"] = _append_ref(
		record.get("evidence_refs", []) as Array, evidence_id, MAX_EVIDENCE_REFS)
	record["state_hash"] = _record_hash(record)
	_relationships[relationship_ref] = record
	_update_profile_ref(subject_id, "relationship_refs", relationship_ref, evidence_id)


func _update_profile_ref(
		actor_id: String,
		field: String,
		record_ref: String,
		evidence_id: String) -> void:
	if not _profiles.has(actor_id):
		return
	var profile: Dictionary = _profiles[actor_id].duplicate(true)
	profile[field] = _append_ref(
		profile.get(field, []) as Array, record_ref, MAX_PROFILE_REFS)
	profile["revision"] = int(profile.get("revision", 0)) + 1
	profile["updated_tick"] = int(_world_time().get("world_tick", 0))
	profile["evidence_refs"] = _append_ref(
		profile.get("evidence_refs", []) as Array, evidence_id, MAX_EVIDENCE_REFS)
	profile["state_hash"] = _record_hash(profile)
	_profiles[actor_id] = profile
	_publish_person_ref(profile, "social.profile_ref.%s" % _stable_token({
		"actor_id": actor_id, "revision": profile.get("revision", 0)}))


func _update_profile_conversation(
		actor_id: String, session_id: String, evidence_id: String) -> void:
	if not _profiles.has(actor_id):
		return
	var profile: Dictionary = _profiles[actor_id].duplicate(true)
	profile["conversation_refs"] = _append_ref(
		profile.get("conversation_refs", []) as Array,
		session_id, MAX_CONVERSATION_HISTORY)
	profile["last_conversation_ref"] = session_id
	profile["revision"] = int(profile.get("revision", 0)) + 1
	profile["updated_tick"] = int(_world_time().get("world_tick", 0))
	profile["evidence_refs"] = _append_ref(
		profile.get("evidence_refs", []) as Array, evidence_id, MAX_EVIDENCE_REFS)
	profile["state_hash"] = _record_hash(profile)
	_profiles[actor_id] = profile
	_publish_person_ref(profile, "social.conversation_ref.%s" % _stable_token({
		"actor_id": actor_id, "revision": profile.get("revision", 0)}))


func _conversation_commitment_requests(session: Dictionary) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for participant_value in session.get("participant_ids", []):
		var participant_id := str(participant_value)
		if PeopleManager.has_person(participant_id):
			result.append({
				"owner": "document07.people",
				"person_id": participant_id,
				"conversation_session_ref": str(session.get("session_id", "")),
				"requested_state": "release" if str(session.get("state", "")) \
					in ["ended", "invalidated"] else "commit",
				"priority": "social_interaction",
			})
	return result


func _publish_person_ref(record: Dictionary, mutation_id: String) -> void:
	var person_ref := str(record.get("person_ref", ""))
	if person_ref.is_empty() or not PeopleManager.initialized \
			or not PeopleManager.has_person(person_ref):
		return
	var result := PeopleManager.set_external_domain_ref(
		person_ref, "set28_social", str(record.get("social_profile_id", "")),
		int(record.get("revision", 0)), mutation_id)
	if not bool(result.get("ok", false)):
		push_warning("SocialManager: person reference handoff failed: %s" % result)


func _forbidden_external_mutation(request: Dictionary) -> String:
	for field in [
		"grant_permission", "political_authority", "legal_authority", "price",
		"currency_delta", "inventory_transfer", "health_delta", "stamina_delta",
		"movement_transform", "arrival_state", "quest_stage", "faction_membership",
		"territory_owner", "tax_rate",
	]:
		if request.has(field):
			return field
	return ""


func _reputation_id(scope_ref: String, target_ref: String, dimension: String) -> String:
	return "social_reputation.%s" % _stable_token({
		"scope_ref": scope_ref, "target_ref": target_ref, "dimension": dimension,
	})


func _reputation_band(dimension: String, score: float) -> String:
	if dimension == "community_helpfulness":
		if score >= 35.0:
			return "trusted_ally"
		if score >= 16.0:
			return "trusted_supplier"
		if score >= 1.0:
			return "helpful_outsider"
		if score < 0.0:
			return "untrusted"
		return "stranger"
	return _dimension_band("trust", score)


func _summary_revision(actor_ids: Array[String]) -> int:
	var revision := 0
	for actor_id in actor_ids:
		revision += int((_profiles[actor_id] as Dictionary).get("revision", 0))
	return revision


func _memory_refs_for(actor_id: String) -> Array[String]:
	var result: Array[String] = []
	for memory_value in _social_memories.values():
		if memory_value is Dictionary and str(memory_value.get(
				"subject_id", "")) == actor_id:
			result.append(str(memory_value.get("memory_id", "")))
	result.sort()
	return result.slice(0, 32)


func _milestone_refs_for(actor_id: String) -> Array[String]:
	var result: Array[String] = []
	for milestone_value in _milestones.values():
		if milestone_value is Dictionary \
				and actor_id in (milestone_value.get("participant_ids", []) as Array):
			result.append(str(milestone_value.get("milestone_id", "")))
	result.sort()
	return result.slice(0, 32)


func _persistent_conversations() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for session_id in conversation_ids():
		var session: Dictionary = _conversations[session_id]
		var save_policy := str(session.get("save_policy", "routine_close_on_save"))
		var state := str(session.get("state", ""))
		if save_policy in ["consequential", "resumable"] \
				or state in ["suspended", "resolving", "awaiting_choice"] \
				or not (session.get("committed_choice_history", []) as Array).is_empty():
			result.append(session.duplicate(true))
	return result


func _request_transaction_id(request: Dictionary) -> String:
	for field in ["transaction_id", "command_id", "event_id", "request_id"]:
		var value := str(request.get(field, ""))
		if not value.is_empty():
			return value
	return ""


func _store_transaction(
		transaction_id: String,
		subject_ref: String,
		payload_hash: String,
		result: Dictionary) -> void:
	_transactions[transaction_id] = {
		"transaction_id": transaction_id,
		"subject_ref": subject_ref,
		"payload_hash": payload_hash,
		"status": "committed",
		"result_revision": int(result.get("result_revision", 0)),
		"authoritative_world_time": _world_time(),
		"result": result.duplicate(true),
	}
	if transaction_id not in _transaction_order:
		_transaction_order.append(transaction_id)
	while _transaction_order.size() > MAX_TRANSACTION_JOURNAL:
		var expired: String = _transaction_order.pop_front()
		_transactions.erase(expired)


func _transaction_replay(transaction_id: String, request: Dictionary) -> Dictionary:
	if transaction_id.is_empty() or not _transactions.has(transaction_id):
		return {}
	var entry: Dictionary = _transactions[transaction_id]
	if str(entry.get("payload_hash", "")) != _hash_value(request):
		return {
			"ok": false,
			"error": "social_transaction_conflict",
			"transaction_id": transaction_id,
		}
	var result: Dictionary = entry.get("result", {}).duplicate(true)
	result["duplicate"] = true
	return result


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


func _world_time() -> Dictionary:
	return ProductionKernel.world_time_reference()


func _ensure_initialized(context: Dictionary) -> void:
	if initialized:
		return
	var seed_value := int(context.get(
		"world_seed", PeopleManager.world_seed if PeopleManager.initialized else 0))
	var requested_world_id := str(context.get(
		"world_id", PeopleManager.world_id if PeopleManager.initialized else ""))
	initialize(seed_value, requested_world_id)


func _append_ref(values: Array, value: String, limit: int) -> Array:
	var result := values.duplicate()
	if not value.is_empty() and value not in result:
		result.append(value)
	while result.size() > limit:
		result.pop_front()
	return result


func _append_refs(values: Array, additions: Array, limit: int) -> Array:
	var result := values.duplicate()
	for value in additions:
		result = _append_ref(result, str(value), limit)
	return result


func _sorted_records(source: Dictionary, identity_field: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var ids: Array = source.keys()
	ids.sort_custom(func(a: Variant, b: Variant) -> bool: return str(a) < str(b))
	for id_value in ids:
		var record: Dictionary = source[id_value]
		if str(record.get(identity_field, "")) == str(id_value):
			result.append(record.duplicate(true))
	return result


func _restore_records(
		values: Variant,
		identity_field: String,
		validator: Callable) -> Dictionary:
	if not (values is Array):
		return {"ok": false, "error": "invalid_record_collection"}
	var result := {}
	for value in values:
		if not (value is Dictionary):
			return {"ok": false, "error": "invalid_record"}
		var record: Dictionary = value.duplicate(true)
		var identity := str(record.get(identity_field, ""))
		if identity.is_empty() or result.has(identity):
			return {"ok": false, "error": "duplicate_or_missing_identity"}
		var validation: Dictionary = validator.call(record)
		if not bool(validation.get("ok", false)):
			return validation
		result[identity] = record
	return {"ok": true, "records": result}


func _record_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _record_semantic_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	for field in [
		"revision", "created_tick", "updated_tick", "evidence_refs",
		"transaction_refs", "state_hash",
	]:
		payload.erase(field)
	return _hash_value(payload)


func _state_hash(data: Dictionary) -> String:
	var payload := data.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _stable_token(value: Variant) -> String:
	return _hash_value(value).substr(0, 24)


func _world_scoped_token(value: Variant) -> String:
	return _stable_token({
		"world_seed": world_seed,
		"world_id": world_id,
		"value": value,
	})


func _hash_value(value: Variant) -> String:
	var normalised: Variant = _json_value(value)
	var text := _canonical_json(normalised)
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(text.to_utf8_buffer())
	return context.finish().hex_encode()


func _json_value(value: Variant) -> Variant:
	if value is Dictionary:
		var result := {}
		for key in value:
			result[str(key)] = _json_value(value[key])
		return result
	if value is Array:
		var result: Array = []
		for entry in value:
			result.append(_json_value(entry))
		return result
	if value is Vector2:
		return [value.x, value.y]
	if value is Vector2i:
		return [value.x, value.y]
	if value is Vector3:
		return [value.x, value.y, value.z]
	if value is Vector3i:
		return [value.x, value.y, value.z]
	if value is PackedStringArray:
		return Array(value)
	if value is PackedFloat32Array:
		return Array(value)
	if value is PackedFloat64Array:
		return Array(value)
	if value is PackedInt32Array:
		return Array(value)
	if value is PackedInt64Array:
		return Array(value)
	return value


func _canonical_json(value: Variant) -> String:
	if value is Dictionary:
		var dictionary: Dictionary = value
		var keys: Array = dictionary.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool: return str(a) < str(b))
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
		return String.num(float(value), 12)
	return JSON.stringify(value)
