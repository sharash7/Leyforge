extends Node
## Canonical Set-30 movement authority and persistence facade.
##
## Specialist controllers still execute local physics. External gameplay owners
## submit goals and consume status; they do not write authoritative arrival or
## route truth. Set 28 supplies social permission and route belief, Set 29 owns
## biological exertion/impact consequences, and Set 26E remains the detailed
## aquatic locomotion provider behind this universal facade.

signal movement_changed
signal mover_changed(entity_ref: String)
signal intent_changed(movement_intent_id: String)
signal journey_changed(journey_id: String)
signal route_changed(route_segment_id: String)

const STATE_SCHEMA := "leyforge.movement-state"
const STATE_VERSION := 1
const OWNER := "set30.movement"
const RUNTIME_RECORD_TYPE := "MovementRuntimeRecord"
const INTENT_RECORD_TYPE := "ExternalMovementIntent"
const PATH_RECORD_TYPE := "LocalPathResult"
const ROUTE_RECORD_TYPE := "RouteSegmentRecord"
const ROUTE_PLAN_RECORD_TYPE := "RoutePlanRecord"
const JOURNEY_RECORD_TYPE := "LongDistanceJourneyRecord"
const HISTORY_RECORD_TYPE := "MovementHistoryRecord"
const AQUATIC_PROVIDER_REF := "set26.aquatic"
const MAX_HISTORY := 512
const MAX_TRANSACTIONS := 1024

const VALID_MODES: Array[String] = [
	"Ground", "Airborne", "Traverse", "Glide", "Mounted", "Vehicle",
	"Guided", "Aquatic", "Disabled/Restrained", "Recovery",
]
const VALID_INTENT_STATUSES: Array[String] = [
	"Accepted", "Pathing", "Moving", "Waiting", "Replanning", "Arrived",
	"Failed", "Cancelled", "SuspendedByLOD",
]
const TERMINAL_INTENT_STATUSES: Array[String] = [
	"Arrived", "Failed", "Cancelled",
]
const VALID_LOD_STATES: Array[String] = [
	"active_player", "local", "reduced", "route_transit", "regional",
	"distant", "dormant", "static",
]

var initialized := false
var restored_from_state := false
var world_seed := 0
var world_id := ""
var _movers: Dictionary = {}
var _intents: Dictionary = {}
var _local_paths: Dictionary = {}
var _route_segments: Dictionary = {}
var _route_plans: Dictionary = {}
var _journeys: Dictionary = {}
var _providers: Dictionary = {}
var _transactions: Dictionary = {}
var _transaction_order: Array[String] = []
var _history: Dictionary = {}
var _history_order: Array[String] = []


func reset() -> void:
	initialized = false
	restored_from_state = false
	world_seed = 0
	world_id = ""
	_movers.clear()
	_intents.clear()
	_local_paths.clear()
	_route_segments.clear()
	_route_plans.clear()
	_journeys.clear()
	_providers.clear()
	_transactions.clear()
	_transaction_order.clear()
	_history.clear()
	_history_order.clear()


func initialize(seed_value: int, requested_world_id: String = "") -> void:
	if initialized and world_seed == seed_value \
			and (requested_world_id.is_empty() or world_id == requested_world_id):
		return
	reset()
	initialized = true
	world_seed = seed_value
	world_id = requested_world_id
	_register_builtin_providers()


func movement_record_ref(entity_ref: String) -> String:
	if entity_ref.is_empty():
		return ""
	return "movement.runtime.%s" % _world_scoped_token({
		"entity_ref": entity_ref,
	})


func has_mover(entity_ref: String) -> bool:
	return _movers.has(entity_ref)


func mover_ids() -> Array[String]:
	return _sorted_ids(_movers)


func intent_ids() -> Array[String]:
	return _sorted_ids(_intents)


func journey_ids() -> Array[String]:
	return _sorted_ids(_journeys)


func route_ids() -> Array[String]:
	return _sorted_ids(_route_segments)


func mover_record(entity_ref: String) -> Dictionary:
	return (_movers.get(entity_ref, {}) as Dictionary).duplicate(true)


func movement_intent(movement_intent_id: String) -> Dictionary:
	return (_intents.get(movement_intent_id, {}) as Dictionary).duplicate(true)


func local_path(local_path_ref: String) -> Dictionary:
	return (_local_paths.get(local_path_ref, {}) as Dictionary).duplicate(true)


func route_segment(route_segment_id: String) -> Dictionary:
	return (_route_segments.get(route_segment_id, {}) as Dictionary).duplicate(true)


func route_plan(route_plan_id: String) -> Dictionary:
	return (_route_plans.get(route_plan_id, {}) as Dictionary).duplicate(true)


func journey_record(journey_id: String) -> Dictionary:
	return (_journeys.get(journey_id, {}) as Dictionary).duplicate(true)


func provider_contract(provider_ref: String) -> Dictionary:
	return (_providers.get(provider_ref, {}) as Dictionary).duplicate(true)


func mover_profile(profile_ref: String) -> Dictionary:
	return (_mover_profiles().get(profile_ref, {}) as Dictionary).duplicate(true)


func register_mover(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var entity_ref := str(request.get(
		"entity_or_transport_ref", request.get("entity_ref", "")))
	var profile_ref := str(request.get(
		"mover_profile_ref", "mover_profile.humanoid.standard"))
	if entity_ref.is_empty() or mover_profile(profile_ref).is_empty():
		return {"ok": false, "error": "movement.invalid_mover_identity"}
	if _movers.has(entity_ref):
		var existing: Dictionary = _movers[entity_ref]
		if str(existing.get("mover_profile_ref", "")) != profile_ref:
			return {"ok": false, "error": "movement.mover_profile_conflict"}
		_attach_people_reference(entity_ref, existing)
		return {
			"ok": true,
			"duplicate": true,
			"movement_record_ref": str(existing.get("movement_record_ref", "")),
			"record": existing.duplicate(true),
		}
	var position := _normalise_vector3(request.get(
		"position", request.get("exact_transform", [])))
	if position.is_empty():
		position = [0.0, 0.0, 0.0]
	var rotation := _normalise_vector3(request.get("rotation", []))
	if rotation.is_empty():
		rotation = [0.0, 0.0, 0.0]
	var velocity := _normalise_vector3(request.get("velocity", []))
	if velocity.is_empty():
		velocity = [0.0, 0.0, 0.0]
	var mode := _canonical_mode(str(request.get("movement_mode", "Ground")))
	if mode.is_empty():
		return {"ok": false, "error": "movement.invalid_mode"}
	var profile := mover_profile(profile_ref)
	var provider_ref := str(request.get("movement_provider_ref", ""))
	if mode == "Aquatic" and provider_ref.is_empty():
		provider_ref = AQUATIC_PROVIDER_REF
	if not _provider_allows_mode(provider_ref, mode):
		return {"ok": false, "error": "movement.provider_boundary_violation"}
	var now := _world_tick()
	var record := {
		"record_type": RUNTIME_RECORD_TYPE,
		"schema_version": STATE_VERSION,
		"entity_or_transport_ref": entity_ref,
		"movement_record_ref": movement_record_ref(entity_ref),
		"mover_profile_ref": profile_ref,
		"mover_family": str(profile.get("mover_family", "humanoid")),
		"position": position,
		"rotation": rotation,
		"velocity": velocity,
		"semantic_location": _normalise_semantic_location(request.get(
			"semantic_location", {}), position),
		"movement_mode": mode,
		"movement_state": str(request.get("movement_state", "Idle")),
		"stance_or_body_profile": str(request.get(
			"stance_or_body_profile", "Stand")),
		"support_ref": str(request.get("support_ref", "")),
		"spatial_frame_ref": str(request.get("spatial_frame_ref", "world")),
		"attachment_refs": _normalised_refs(request.get("attachment_refs", [])),
		"active_movement_capabilities": (
			profile.get("movement_capability_ids", []) as Array).duplicate(true),
		"movement_modifier_snapshot_ref": str(request.get(
			"movement_modifier_snapshot_ref", "")),
		"external_lock_flags": _normalised_refs(request.get(
			"external_lock_flags", [])),
		"movement_provider_ref": provider_ref,
		"route_plan_ref": "",
		"journey_ref": "",
		"local_path_ref": "",
		"current_route_leg_or_node": "",
		"movement_goal_ref": "",
		"safe_position": position.duplicate(true),
		"safe_position_ref": "safe_position.%s" % _stable_token({
			"entity_ref": entity_ref, "position": position}),
		"lod_state": str(request.get("lod_state", "local")),
		"network_authority_ref": str(request.get(
			"network_authority_ref", "local_host")),
		"authoritative_tick": now,
		"movement_revision": 1,
		"created_tick": now,
		"updated_tick": now,
		"last_validation_version": STATE_VERSION,
		"migration_history": [],
		"state_hash": "",
	}
	if str(record["lod_state"]) not in VALID_LOD_STATES:
		return {"ok": false, "error": "movement.invalid_lod_state"}
	record["state_hash"] = _record_hash(record)
	var validation := validate_mover_record(record)
	if not bool(validation.get("ok", false)):
		return validation
	var transaction_id := str(request.get(
		"transaction_id", "movement.register.%s" % _world_scoped_token({
			"entity_ref": entity_ref, "profile_ref": profile_ref})))
	var request_copy := request.duplicate(true)
	request_copy["transaction_id"] = transaction_id
	var replay := _transaction_replay(transaction_id, request_copy)
	if not replay.is_empty():
		return replay
	_movers[entity_ref] = record
	var evidence_id := _commit_history(
		"mover_registered", entity_ref, request_copy, transaction_id)
	var result := {
		"ok": true,
		"movement_record_ref": str(record["movement_record_ref"]),
		"evidence_id": evidence_id,
		"record": record.duplicate(true),
	}
	_store_transaction(transaction_id, request_copy, result)
	_attach_people_reference(entity_ref, record)
	mover_changed.emit(entity_ref)
	movement_changed.emit()
	return result


func commit_physical_snapshot(request: Dictionary) -> Dictionary:
	var entity_ref := str(request.get("entity_ref", ""))
	if not _movers.has(entity_ref):
		return {"ok": false, "error": "movement.unknown_mover"}
	if not bool(request.get("authoritative", true)):
		return {"ok": false, "error": "movement.non_authoritative_snapshot"}
	var position := _normalise_vector3(request.get("position", []))
	if position.is_empty():
		return {"ok": false, "error": "movement.invalid_position"}
	var before: Dictionary = _movers[entity_ref]
	var candidate := before.duplicate(true)
	var mode := _canonical_mode(str(request.get(
		"movement_mode", before.get("movement_mode", "Ground"))))
	if mode.is_empty():
		return {"ok": false, "error": "movement.invalid_mode"}
	var provider_ref := str(request.get(
		"movement_provider_ref", before.get("movement_provider_ref", "")))
	if mode == "Aquatic" and provider_ref.is_empty():
		provider_ref = AQUATIC_PROVIDER_REF
	if not _provider_allows_mode(provider_ref, mode):
		return {"ok": false, "error": "movement.provider_boundary_violation"}
	var snapshot_id := str(request.get("snapshot_id", ""))
	if not snapshot_id.is_empty():
		var replay := _transaction_replay(snapshot_id, request)
		if not replay.is_empty():
			return replay
	candidate["position"] = position
	candidate["rotation"] = _normalise_vector3(request.get(
		"rotation", before.get("rotation", [])), true)
	candidate["velocity"] = _normalise_vector3(request.get(
		"velocity", before.get("velocity", [])), true)
	candidate["movement_mode"] = mode
	candidate["movement_state"] = str(request.get(
		"movement_state", before.get("movement_state", "Idle")))
	candidate["movement_provider_ref"] = provider_ref
	candidate["support_ref"] = str(request.get(
		"support_ref", before.get("support_ref", "")))
	candidate["spatial_frame_ref"] = str(request.get(
		"spatial_frame_ref", before.get("spatial_frame_ref", "world")))
	if request.has("attachment_refs"):
		candidate["attachment_refs"] = _normalised_refs(
			request.get("attachment_refs", []))
	if request.has("external_lock_flags"):
		candidate["external_lock_flags"] = _normalised_refs(
			request.get("external_lock_flags", []))
	if request.has("semantic_location"):
		candidate["semantic_location"] = _normalise_semantic_location(
			request.get("semantic_location", {}), position)
	if bool(request.get("safe_position", false)):
		if _normalise_vector3(before.get("safe_position", [])) != position:
			candidate["safe_position"] = position.duplicate(true)
			candidate["safe_position_ref"] = "safe_position.%s" % _stable_token({
				"entity_ref": entity_ref,
				"position": position,
				"revision": int(before.get("movement_revision", 0)) + 1,
			})
	if _record_semantic_hash(candidate) == _record_semantic_hash(before):
		return {
			"ok": true,
			"duplicate": true,
			"movement_record_ref": str(before.get("movement_record_ref", "")),
			"authoritative_revision": int(before.get("movement_revision", 0)),
		}
	candidate["movement_revision"] = int(before.get("movement_revision", 0)) + 1
	candidate["authoritative_tick"] = int(request.get(
		"authoritative_tick", _world_tick()))
	candidate["updated_tick"] = _world_tick()
	candidate["state_hash"] = _record_hash(candidate)
	var validation := validate_mover_record(candidate)
	if not bool(validation.get("ok", false)):
		return validation
	_movers[entity_ref] = candidate
	var result := {
		"ok": true,
		"movement_record_ref": str(candidate.get("movement_record_ref", "")),
		"authoritative_revision": int(candidate.get("movement_revision", 0)),
	}
	if not snapshot_id.is_empty():
		_store_transaction(snapshot_id, request, result)
	_attach_people_reference(entity_ref, candidate)
	mover_changed.emit(entity_ref)
	return result


func submit_external_movement_intent(request: Dictionary) -> Dictionary:
	var intent_id := str(request.get("movement_intent_id", ""))
	var requester_ref := str(request.get(
		"requester_entity_or_group_ref", request.get("requester_ref", "")))
	if intent_id.is_empty() or requester_ref.is_empty() \
			or str(request.get("request_owner", "")).is_empty() \
			or str(request.get("goal_type", "")).is_empty() \
			or str(request.get("goal_ref_or_region", "")).is_empty() \
			or str(request.get("arrival_profile_id", "")).is_empty():
		return {"ok": false, "error": "movement.invalid_external_intent"}
	if not _movers.has(requester_ref):
		return {"ok": false, "error": "movement.intent_mover_missing"}
	var request_hash := _hash_value(_intent_request_payload(request))
	if _intents.has(intent_id):
		var existing: Dictionary = _intents[intent_id]
		if str(existing.get("request_hash", "")) != request_hash:
			return {"ok": false, "error": "movement.intent_conflict"}
		return {
			"ok": true,
			"duplicate": true,
			"movement_intent_id": intent_id,
			"status": _intent_status_payload(existing),
		}
	var allowed_modes := _normalised_modes(request.get("allowed_movement_modes", []))
	var forbidden_modes := _normalised_modes(
		request.get("forbidden_movement_modes", []))
	for mode in allowed_modes:
		if mode in forbidden_modes:
			return {"ok": false, "error": "movement.intent_mode_conflict"}
	var social_value: Variant = request.get("social_authorisation", {})
	if not (social_value is Dictionary):
		return {"ok": false, "error": "movement.invalid_social_authorisation"}
	var social: Dictionary = social_value
	if not social.is_empty() and str(social.get("schema", "")) \
			!= "leyforge.xset.social-movement-authorisation":
		return {"ok": false, "error": "movement.invalid_social_authorisation"}
	if bool(request.get("requires_companion_permission", false)) \
			and not bool(social.get("companion_travel_permission", false)):
		return {"ok": false, "error": "movement.social_permission_denied"}
	var now := _world_tick()
	var goal_position := _normalise_vector3(request.get("goal_position", []))
	var intent := {
		"record_type": INTENT_RECORD_TYPE,
		"schema_version": STATE_VERSION,
		"movement_intent_id": intent_id,
		"request_owner": str(request.get("request_owner", "")),
		"requester_entity_or_group_ref": requester_ref,
		"goal_type": str(request.get("goal_type", "")),
		"goal_ref_or_region": str(request.get("goal_ref_or_region", "")),
		"goal_position": goal_position,
		"arrival_profile_id": str(request.get("arrival_profile_id", "")),
		"urgency": str(request.get("urgency", "routine")),
		"route_policy_ref": str(request.get("route_policy_ref", "")),
		"formation_intent_ref": str(request.get("formation_intent_ref", "")),
		"allowed_movement_modes": allowed_modes,
		"forbidden_movement_modes": forbidden_modes,
		"wait_policy": str(request.get("wait_policy", "wait_and_replan")),
		"replan_policy": str(request.get("replan_policy", "on_blocker")),
		"failure_policy": str(request.get("failure_policy", "report_failure")),
		"expiry_or_cancel_condition": request.get(
			"expiry_or_cancel_condition", {}).duplicate(true) \
			if request.get("expiry_or_cancel_condition", {}) is Dictionary else {},
		"knowledge_context_ref": str(request.get("knowledge_context_ref", "")),
		"permission_context_ref": str(request.get("permission_context_ref", "")),
		"task_or_assignment_ref": str(request.get(
			"task_or_assignment_ref", request.get("task_or_action_ref", ""))),
		"social_authorisation_ref": str(social.get("context_id", "")),
		"movement_status": "Accepted",
		"resolved_goal_ref": str(request.get("goal_ref_or_region", "")),
		"route_plan_ref": "",
		"local_path_ref": "",
		"current_movement_mode": str(
			(_movers[requester_ref] as Dictionary).get("movement_mode", "Ground")),
		"current_location_summary": (
			(_movers[requester_ref] as Dictionary).get(
				"semantic_location", {}) as Dictionary).duplicate(true),
		"estimated_arrival": {},
		"arrival_confidence": 0,
		"waiting_reason": "",
		"failure_reason_codes": [],
		"blocked_resource_refs": [],
		"replan_state": "not_required",
		"request_revision": maxi(1, int(request.get("revision", 1))),
		"authoritative_revision": 1,
		"created_tick": now,
		"updated_tick": now,
		"request_hash": request_hash,
		"evidence_refs": [],
		"state_hash": "",
	}
	intent["state_hash"] = _record_hash(intent)
	var validation := validate_intent_record(intent)
	if not bool(validation.get("ok", false)):
		return validation
	var transaction_id := str(request.get(
		"transaction_id", "movement.intent.accept.%s" % intent_id))
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	_intents[intent_id] = intent
	var mover: Dictionary = _movers[requester_ref]
	mover["movement_goal_ref"] = intent_id
	mover["movement_revision"] = int(mover.get("movement_revision", 0)) + 1
	mover["updated_tick"] = now
	mover["state_hash"] = _record_hash(mover)
	_movers[requester_ref] = mover
	var evidence_id := _commit_history(
		"movement_intent_accepted", intent_id, request, transaction_id)
	intent = _intents[intent_id]
	intent["evidence_refs"] = _append_ref(intent.get("evidence_refs", []), evidence_id)
	intent["state_hash"] = _record_hash(intent)
	_intents[intent_id] = intent
	var result := {
		"ok": true,
		"movement_intent_id": intent_id,
		"evidence_id": evidence_id,
		"status": _intent_status_payload(intent),
	}
	_store_transaction(transaction_id, request, result)
	intent_changed.emit(intent_id)
	mover_changed.emit(requester_ref)
	movement_changed.emit()
	return result


func publish_local_path(movement_intent_id: String, request: Dictionary) -> Dictionary:
	if not _intents.has(movement_intent_id):
		return {"ok": false, "error": "movement.unknown_intent"}
	var intent: Dictionary = _intents[movement_intent_id]
	if str(intent.get("movement_status", "")) in TERMINAL_INTENT_STATUSES:
		return {"ok": false, "error": "movement.intent_already_terminal"}
	var point_value: Variant = request.get("ordered_path_points_or_cells", [])
	if not (point_value is Array) or (point_value as Array).is_empty():
		return {"ok": false, "error": "navigation.no_path"}
	var points: Array = []
	for value in point_value:
		var point := _normalise_vector3(value)
		if point.is_empty():
			return {"ok": false, "error": "navigation.invalid_path_point"}
		points.append(point)
	var entity_ref := str(intent.get("requester_entity_or_group_ref", ""))
	var request_id := str(request.get(
		"request_id", "local_path_request.%s.%s" % [
			movement_intent_id, _stable_token(points)]))
	var path_id := str(request.get(
		"local_path_ref", "local_path.%s" % _stable_token({
			"intent": movement_intent_id,
			"points": points,
			"navigation_revision": int(request.get("navigation_revision", 1)),
		})))
	var transaction_id := str(request.get("transaction_id", request_id))
	var request_copy := request.duplicate(true)
	request_copy["movement_intent_id"] = movement_intent_id
	request_copy["ordered_path_points_or_cells"] = points
	var replay := _transaction_replay(transaction_id, request_copy)
	if not replay.is_empty():
		return replay
	var now := _world_tick()
	var path_record := {
		"record_type": PATH_RECORD_TYPE,
		"schema_version": STATE_VERSION,
		"local_path_ref": path_id,
		"request_id": request_id,
		"movement_intent_id": movement_intent_id,
		"mover_ref": entity_ref,
		"status": "Pathing",
		"corridor_ref": str(request.get("corridor_ref", "")),
		"ordered_path_points_or_cells": points,
		"transition_link_refs": _normalised_refs(
			request.get("transition_link_refs", [])),
		"interactive_link_refs": _normalised_refs(
			request.get("interactive_link_refs", [])),
		"reservation_requirements": _normalised_refs(
			request.get("reservation_requirements", [])),
		"estimated_local_time": maxf(0.0, float(request.get(
			"estimated_local_time", points.size()))),
		"local_cost": maxf(0.0, float(request.get("local_cost", points.size()))),
		"confidence": clampi(int(request.get("confidence", 1000)), 0, 1000),
		"hard_blockers": [],
		"reason_codes": _normalised_refs(request.get("reason_codes", [])),
		"navigation_revision": maxi(1, int(request.get("navigation_revision", 1))),
		"profile_revision": maxi(1, int(request.get("profile_revision", 1))),
		"created_tick": now,
		"state_hash": "",
	}
	path_record["state_hash"] = _record_hash(path_record)
	_local_paths[path_id] = path_record
	intent["movement_status"] = "Pathing"
	intent["local_path_ref"] = path_id
	intent["estimated_arrival"] = {"world_tick": now + ceili(float(
		path_record.get("estimated_local_time", 0.0)))}
	intent["arrival_confidence"] = int(path_record.get("confidence", 0))
	intent["authoritative_revision"] = int(intent.get(
		"authoritative_revision", 0)) + 1
	intent["updated_tick"] = now
	intent["state_hash"] = _record_hash(intent)
	_intents[movement_intent_id] = intent
	var mover: Dictionary = _movers[entity_ref]
	mover["local_path_ref"] = path_id
	mover["movement_state"] = "Pathing"
	mover["movement_revision"] = int(mover.get("movement_revision", 0)) + 1
	mover["updated_tick"] = now
	mover["state_hash"] = _record_hash(mover)
	_movers[entity_ref] = mover
	var evidence_id := _commit_history(
		"local_path_started", path_id, request_copy, transaction_id)
	var result := {
		"ok": true,
		"local_path_ref": path_id,
		"movement_intent_id": movement_intent_id,
		"evidence_id": evidence_id,
		"status": _intent_status_payload(intent),
	}
	_store_transaction(transaction_id, request_copy, result)
	intent_changed.emit(movement_intent_id)
	mover_changed.emit(entity_ref)
	movement_changed.emit()
	return result


func report_intent_status(
		movement_intent_id: String,
		status: String,
		request: Dictionary = {}) -> Dictionary:
	if not _intents.has(movement_intent_id):
		return {"ok": false, "error": "movement.unknown_intent"}
	if status not in VALID_INTENT_STATUSES:
		return {"ok": false, "error": "movement.invalid_intent_status"}
	var before: Dictionary = _intents[movement_intent_id]
	if str(before.get("movement_status", "")) in TERMINAL_INTENT_STATUSES:
		if str(before.get("movement_status", "")) == status:
			return {"ok": true, "duplicate": true,
				"status": _intent_status_payload(before)}
		return {"ok": false, "error": "movement.intent_already_terminal"}
	var transaction_id := str(request.get(
		"transaction_id", "movement.intent.%s.%s.%s" % [
			movement_intent_id, status.to_lower(), _stable_token(request)]))
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var candidate := before.duplicate(true)
	candidate["movement_status"] = status
	candidate["waiting_reason"] = str(request.get("waiting_reason", ""))
	candidate["failure_reason_codes"] = _normalised_refs(
		request.get("failure_reason_codes", []))
	candidate["blocked_resource_refs"] = _normalised_refs(
		request.get("blocked_resource_refs", []))
	candidate["replan_state"] = str(request.get(
		"replan_state", "not_required" if status != "Replanning" else "requested"))
	candidate["authoritative_revision"] = int(before.get(
		"authoritative_revision", 0)) + 1
	candidate["updated_tick"] = _world_tick()
	var entity_ref := str(candidate.get("requester_entity_or_group_ref", ""))
	if _movers.has(entity_ref):
		var mover: Dictionary = _movers[entity_ref]
		candidate["current_movement_mode"] = str(mover.get(
			"movement_mode", "Ground"))
		candidate["current_location_summary"] = (
			mover.get("semantic_location", {}) as Dictionary).duplicate(true)
		if status == "Arrived":
			var arrival_position := _normalise_vector3(request.get(
				"position", mover.get("position", [])))
			if not arrival_position.is_empty():
				mover["position"] = arrival_position
				mover["safe_position"] = arrival_position.duplicate(true)
			mover["semantic_location"] = _normalise_semantic_location({
				"kind": "goal",
				"ref": str(candidate.get("resolved_goal_ref", "")),
				"position": arrival_position,
			}, arrival_position)
			mover["movement_state"] = "Idle"
			mover["local_path_ref"] = ""
		mover["movement_revision"] = int(mover.get("movement_revision", 0)) + 1
		mover["updated_tick"] = _world_tick()
		mover["state_hash"] = _record_hash(mover)
		_movers[entity_ref] = mover
	candidate["state_hash"] = _record_hash(candidate)
	_intents[movement_intent_id] = candidate
	var event_type: String = str({
		"Arrived": "authoritative_arrival_committed",
		"Failed": "movement_intent_failed",
		"Cancelled": "movement_intent_cancelled",
	}.get(status, "movement_intent_status_changed"))
	var evidence_id := _commit_history(
		str(event_type), movement_intent_id, request, transaction_id)
	candidate = _intents[movement_intent_id]
	candidate["evidence_refs"] = _append_ref(
		candidate.get("evidence_refs", []), evidence_id)
	candidate["state_hash"] = _record_hash(candidate)
	_intents[movement_intent_id] = candidate
	var result := {
		"ok": true,
		"movement_intent_id": movement_intent_id,
		"evidence_id": evidence_id,
		"status": _intent_status_payload(candidate),
	}
	_store_transaction(transaction_id, request, result)
	intent_changed.emit(movement_intent_id)
	if not entity_ref.is_empty():
		mover_changed.emit(entity_ref)
	movement_changed.emit()
	return result


func record_route_observation(request: Dictionary) -> Dictionary:
	var route_id := str(request.get(
		"route_segment_id", request.get("route_or_region_ref", "")))
	if route_id.is_empty() or str(request.get("source_owner", "")).is_empty():
		return {"ok": false, "error": "route.invalid_observation"}
	var transaction_id := str(request.get(
		"transaction_id", "movement.route.%s.%s" % [
			route_id, _stable_token(_route_payload(request))]))
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var before: Dictionary = _route_segments.get(route_id, {})
	var now := _world_tick()
	var record := {
		"record_type": ROUTE_RECORD_TYPE,
		"schema_version": STATE_VERSION,
		"route_segment_id": route_id,
		"route_class": str(request.get("route_class", "local_path")),
		"surface": str(request.get("surface", "unknown")),
		"quality": str(request.get("quality", "ordinary")),
		"width": maxf(0.0, float(request.get("width", 1.0))),
		"vertical_clearance": maxf(0.0, float(request.get(
			"vertical_clearance", 2.0))),
		"grade": float(request.get("grade", 0.0)),
		"turn_constraints": _normalised_refs(request.get("turn_constraints", [])),
		"supported_transport_classes": _normalised_refs(
			request.get("supported_transport_classes", ["humanoid"])),
		"bridge_load_class": str(request.get("bridge_load_class", "")),
		"gate_dependencies": _normalised_refs(request.get("gate_dependencies", [])),
		"permission_ref": str(request.get("permission_ref", "")),
		"condition": str(request.get("condition", "passable")),
		"closure": bool(request.get("closure", false)),
		"capacity_band": str(request.get("capacity_band", "ordinary")),
		"congestion_band": str(request.get("congestion_band", "low")),
		"movement_provider_ref": str(request.get("movement_provider_ref", "")),
		"source_owner": str(request.get("source_owner", "")),
		"source_revision": maxi(0, int(request.get("source_revision", 0))),
		"navigation_revision": int(before.get("navigation_revision", 0)) + 1,
		"observed_tick": now,
		"revision": int(before.get("revision", 0)) + 1,
		"state_hash": "",
	}
	if record["movement_provider_ref"] == AQUATIC_PROVIDER_REF \
			and not _providers.has(AQUATIC_PROVIDER_REF):
		return {"ok": false, "error": "movement.aquatic_provider_missing"}
	record["state_hash"] = _record_hash(record)
	var validation := validate_route_record(record)
	if not bool(validation.get("ok", false)):
		return validation
	_route_segments[route_id] = record
	var evidence_id := _commit_history(
		"route_observation_committed", route_id, request, transaction_id)
	var result := {
		"ok": true,
		"route_segment_id": route_id,
		"route_revision": int(record.get("revision", 0)),
		"evidence_id": evidence_id,
	}
	_store_transaction(transaction_id, request, result)
	route_changed.emit(route_id)
	movement_changed.emit()
	return result


func route_observation(route_id: String) -> Dictionary:
	if not _route_segments.has(route_id):
		return {"ok": false, "error": "route.unknown_segment"}
	var route: Dictionary = _route_segments[route_id]
	return {
		"ok": true,
		"schema": "leyforge.xset.route-observation",
		"version": "1.1",
		"source_owner": OWNER,
		"route_or_region_ref": route_id,
		"observed_access_state": "closed" if bool(route.get("closure", false)) \
			else "passable",
		"observed_condition_or_blocker_summary": str(route.get("condition", "")),
		"observation_time": {"world_tick": int(route.get("observed_tick", 0))},
		"coverage": "route_segment",
		"observation_source_ref": str(route.get("source_owner", "")),
		"objective_confidence": 1000,
		"route_revision": int(route.get("revision", 0)),
	}


func route_accessibility(
		mover_or_transport_id: String,
		route_or_segment: Variant) -> Dictionary:
	if not _movers.has(mover_or_transport_id):
		return {"ok": false, "error": "movement.unknown_mover"}
	var route: Dictionary = {}
	if route_or_segment is Dictionary:
		route = (route_or_segment as Dictionary).duplicate(true)
	else:
		route = route_segment(str(route_or_segment))
	if route.is_empty():
		return {"ok": false, "error": "route.unknown_segment"}
	var mover: Dictionary = _movers[mover_or_transport_id]
	var profile := mover_profile(str(mover.get("mover_profile_ref", "")))
	var blockers: Array[String] = []
	var required: Array[String] = []
	if bool(route.get("closure", false)):
		blockers.append("route.closed")
	var family := str(profile.get("mover_family", "humanoid"))
	var supported: Array = route.get("supported_transport_classes", [])
	if not supported.is_empty() and family not in supported:
		blockers.append("route.unsupported_mover_class")
	if float(route.get("vertical_clearance", 0.0)) \
			< float(profile.get("standing_height", 1.7)):
		blockers.append("route.geometry.clearance")
	var provider_ref := str(route.get("movement_provider_ref", ""))
	if not provider_ref.is_empty():
		required.append(provider_ref)
		if not bool((_providers.get(provider_ref, {}) as Dictionary).get(
				"available", false)):
			blockers.append("movement.provider.unavailable")
	return {
		"ok": true,
		"schema": "leyforge.movement.route-accessibility",
		"movement_owner": OWNER,
		"mover_ref": mover_or_transport_id,
		"route_segment_id": str(route.get("route_segment_id", "")),
		"accessibility_state": "blocked" if not blockers.is_empty() else "accessible",
		"required_transitions": required,
		"estimated_time": maxf(1.0, 1.0 + absf(float(route.get("grade", 0.0)))),
		"traversal_cost": maxf(1.0, 1.0 + absf(float(route.get("grade", 0.0)))),
		"blockers": blockers,
		"reason_codes": blockers.duplicate(),
		"confidence": 1000,
		"revision": int(route.get("revision", 0)),
	}


func create_route_plan(request: Dictionary) -> Dictionary:
	var mover_refs := _normalised_refs(request.get("mover_profile_refs", []))
	var legs_value: Variant = request.get("ordered_leg_records", [])
	if mover_refs.is_empty() or not (legs_value is Array) \
			or (legs_value as Array).is_empty():
		return {"ok": false, "error": "route.invalid_plan"}
	var legs: Array = []
	var blockers: Array[String] = []
	var effective_cost := 0.0
	for value in legs_value:
		if not (value is Dictionary):
			return {"ok": false, "error": "route.invalid_leg"}
		var leg: Dictionary = (value as Dictionary).duplicate(true)
		var route_id := str(leg.get("route_segment_id", ""))
		if route_id.is_empty() or not _route_segments.has(route_id):
			return {"ok": false, "error": "route.unknown_plan_segment"}
		var route: Dictionary = _route_segments[route_id]
		leg["route_revision"] = int(route.get("revision", 0))
		leg["movement_provider_ref"] = str(route.get("movement_provider_ref", ""))
		effective_cost += maxf(1.0, float(leg.get("cost", 1.0)))
		if bool(route.get("closure", false)):
			blockers.append(route_id)
		legs.append(leg)
	var route_plan_id := str(request.get(
		"route_plan_id", "route_plan.%s" % _stable_token({
			"origin": request.get("origin", {}),
			"destination": request.get("destination", {}),
			"movers": mover_refs,
			"legs": legs,
	})))
	var transaction_id := str(request.get(
		"transaction_id", "movement.route_plan.%s" % route_plan_id))
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	if _route_plans.has(route_plan_id):
		return {"ok": false, "error": "route.plan_identity_conflict"}
	var record := {
		"record_type": ROUTE_PLAN_RECORD_TYPE,
		"schema_version": STATE_VERSION,
		"route_plan_id": route_plan_id,
		"origin": _normalise_location_value(request.get("origin", {})),
		"destination": _normalise_location_value(request.get("destination", {})),
		"mover_profile_refs": mover_refs,
		"route_policy_id": str(request.get("route_policy_id", "route_policy.safe")),
		"ordered_leg_records": legs,
		"transfer_node_refs": _normalised_refs(request.get("transfer_node_refs", [])),
		"effective_cost": effective_cost,
		"estimated_travel_time": maxf(1.0, float(request.get(
			"estimated_travel_time", effective_cost))),
		"estimated_time_range": request.get(
			"estimated_time_range", [effective_cost, effective_cost * 1.25]).duplicate(true),
		"confidence": clampi(int(request.get("confidence", 1000)), 0, 1000),
		"known_blockers": blockers,
		"required_permissions": _normalised_refs(
			request.get("required_permissions", [])),
		"required_transport_services": _normalised_refs(
			request.get("required_transport_services", [])),
		"route_graph_revision": maxi(1, int(request.get("route_graph_revision", 1))),
		"knowledge_revision": maxi(0, int(request.get("knowledge_revision", 0))),
		"environment_revision": maxi(0, int(request.get("environment_revision", 0))),
		"revision": 1,
		"created_tick": _world_tick(),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	_route_plans[route_plan_id] = record
	var evidence_id := _commit_history(
		"route_plan_created", route_plan_id, request, transaction_id)
	var result := {"ok": true, "route_plan_id": route_plan_id,
		"evidence_id": evidence_id, "known_blockers": blockers}
	_store_transaction(transaction_id, request, result)
	movement_changed.emit()
	return result


func start_journey(request: Dictionary) -> Dictionary:
	var journey_id := str(request.get("journey_id", ""))
	var route_plan_id := str(request.get("route_plan_id", ""))
	var travellers := _normalised_refs(request.get("traveller_or_convoy_refs", []))
	if journey_id.is_empty() or not _route_plans.has(route_plan_id) \
			or travellers.is_empty():
		return {"ok": false, "error": "journey.invalid_start"}
	for traveller_ref in travellers:
		if not _movers.has(traveller_ref):
			return {"ok": false, "error": "journey.unknown_traveller"}
	var plan: Dictionary = _route_plans[route_plan_id]
	if not (plan.get("known_blockers", []) as Array).is_empty():
		return {"ok": false, "error": "journey.route_blocked",
			"blockers": (plan.get("known_blockers", []) as Array).duplicate()}
	var transaction_id := str(request.get(
		"transaction_id", "movement.journey.start.%s" % journey_id))
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	if _journeys.has(journey_id):
		return {"ok": false, "error": "journey.identity_conflict"}
	var legs: Array = plan.get("ordered_leg_records", [])
	var first_leg: Dictionary = legs.front() if not legs.is_empty() else {}
	var now := _world_tick()
	var record := {
		"record_type": JOURNEY_RECORD_TYPE,
		"schema_version": STATE_VERSION,
		"journey_id": journey_id,
		"route_plan_id": route_plan_id,
		"traveller_or_convoy_refs": travellers,
		"departure_time": now,
		"expected_arrival": now + ceili(float(plan.get(
			"estimated_travel_time", 1.0))),
		"current_leg_index": 0,
		"current_segment_ref": str(first_leg.get("route_segment_id", "")),
		"segment_progress": 0.0,
		"movement_mode": str(request.get("movement_mode", "Ground")),
		"mover_snapshot_refs": travellers.duplicate(),
		"cargo_refs": _normalised_refs(request.get("cargo_refs", [])),
		"passenger_refs": _normalised_refs(request.get("passenger_refs", [])),
		"last_valid_route_node": str(request.get("last_valid_route_node", "")),
		"interruption_state": "",
		"journey_status": "active",
		"lod_state": "route_transit",
		"route_revision": int(plan.get("route_graph_revision", 1)),
		"service_revision": maxi(0, int(request.get("service_revision", 0))),
		"environment_revision": int(plan.get("environment_revision", 0)),
		"last_simulation_time": now,
		"revision": 1,
		"evidence_refs": [],
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	_journeys[journey_id] = record
	for traveller_ref in travellers:
		var mover: Dictionary = _movers[traveller_ref]
		mover["route_plan_ref"] = route_plan_id
		mover["journey_ref"] = journey_id
		mover["current_route_leg_or_node"] = str(record["current_segment_ref"])
		mover["lod_state"] = "route_transit"
		mover["movement_revision"] = int(mover.get("movement_revision", 0)) + 1
		mover["updated_tick"] = now
		mover["state_hash"] = _record_hash(mover)
		_movers[traveller_ref] = mover
	var evidence_id := _commit_history(
		"journey_started", journey_id, request, transaction_id)
	record = _journeys[journey_id]
	record["evidence_refs"] = _append_ref(record.get("evidence_refs", []), evidence_id)
	record["state_hash"] = _record_hash(record)
	_journeys[journey_id] = record
	var result := {"ok": true, "journey_id": journey_id,
		"evidence_id": evidence_id, "revision": 1}
	_store_transaction(transaction_id, request, result)
	journey_changed.emit(journey_id)
	movement_changed.emit()
	return result


func advance_journey(journey_id: String, request: Dictionary) -> Dictionary:
	if not _journeys.has(journey_id):
		return {"ok": false, "error": "journey.unknown"}
	var before: Dictionary = _journeys[journey_id]
	if str(before.get("journey_status", "")) != "active":
		return {"ok": false, "error": "journey.not_active"}
	var transaction_id := str(request.get("transaction_id", ""))
	if transaction_id.is_empty():
		return {"ok": false, "error": "journey.transaction_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var segment_ref := str(before.get("current_segment_ref", ""))
	if not _route_segments.has(segment_ref) \
			or bool((_route_segments[segment_ref] as Dictionary).get("closure", false)):
		return {"ok": false, "error": "journey.route_invalidated",
			"route_segment_id": segment_ref}
	var candidate := before.duplicate(true)
	var delta_progress := maxf(0.0, float(request.get("progress_delta", 0.0)))
	var progress := clampf(float(before.get("segment_progress", 0.0)) \
		+ delta_progress, 0.0, 1.0)
	candidate["segment_progress"] = progress
	candidate["last_simulation_time"] = maxi(
		int(before.get("last_simulation_time", 0)),
		int(request.get("world_tick", _world_tick())))
	var plan: Dictionary = _route_plans[str(before.get("route_plan_id", ""))]
	var legs: Array = plan.get("ordered_leg_records", [])
	var leg_index := int(before.get("current_leg_index", 0))
	if progress >= 1.0:
		leg_index += 1
		if leg_index >= legs.size():
			candidate["journey_status"] = "arrived"
			candidate["lod_state"] = str(request.get("arrival_lod_state", "distant"))
			candidate["segment_progress"] = 1.0
		else:
			candidate["current_leg_index"] = leg_index
			candidate["current_segment_ref"] = str(
				(legs[leg_index] as Dictionary).get("route_segment_id", ""))
			candidate["segment_progress"] = 0.0
	candidate["revision"] = int(before.get("revision", 0)) + 1
	var event_type := "journey_arrived" if str(candidate.get(
		"journey_status", "")) == "arrived" else "journey_progressed"
	var evidence_id := _commit_history(event_type, journey_id, request, transaction_id)
	candidate["evidence_refs"] = _append_ref(
		candidate.get("evidence_refs", []), evidence_id)
	candidate["state_hash"] = _record_hash(candidate)
	_journeys[journey_id] = candidate
	for traveller_ref in candidate.get("traveller_or_convoy_refs", []):
		if not _movers.has(str(traveller_ref)):
			continue
		var mover: Dictionary = _movers[str(traveller_ref)]
		mover["current_route_leg_or_node"] = str(candidate.get(
			"current_segment_ref", ""))
		mover["lod_state"] = str(candidate.get("lod_state", "route_transit"))
		if str(candidate.get("journey_status", "")) == "arrived":
			mover["semantic_location"] = _normalise_semantic_location(
				plan.get("destination", {}), mover.get("position", []))
		mover["movement_revision"] = int(mover.get("movement_revision", 0)) + 1
		mover["updated_tick"] = _world_tick()
		mover["state_hash"] = _record_hash(mover)
		_movers[str(traveller_ref)] = mover
	var result := {"ok": true, "journey_id": journey_id,
		"journey_status": str(candidate.get("journey_status", "")),
		"segment_progress": float(candidate.get("segment_progress", 0.0)),
		"evidence_id": evidence_id, "revision": int(candidate.get("revision", 0))}
	_store_transaction(transaction_id, request, result)
	journey_changed.emit(journey_id)
	movement_changed.emit()
	return result


func transition_lod(
		entity_ref: String,
		target_lod: String,
		request: Dictionary = {}) -> Dictionary:
	if not _movers.has(entity_ref):
		return {"ok": false, "error": "movement.unknown_mover"}
	if target_lod not in VALID_LOD_STATES:
		return {"ok": false, "error": "movement.invalid_lod_state"}
	var before: Dictionary = _movers[entity_ref]
	if str(before.get("lod_state", "")) == target_lod:
		return {"ok": true, "duplicate": true,
			"movement_record_ref": str(before.get("movement_record_ref", "")),
			"lod_state": target_lod}
	if target_lod in ["route_transit", "regional", "distant", "dormant"] \
			and (before.get("semantic_location", {}) as Dictionary).is_empty():
		return {"ok": false, "error": "movement.semantic_location_required"}
	var transaction_id := str(request.get(
		"transaction_id", "movement.lod.%s.%s.%d" % [
			entity_ref, target_lod, int(before.get("movement_revision", 0))]))
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var candidate := before.duplicate(true)
	candidate["lod_state"] = target_lod
	candidate["movement_revision"] = int(before.get("movement_revision", 0)) + 1
	candidate["updated_tick"] = _world_tick()
	candidate["state_hash"] = _record_hash(candidate)
	_movers[entity_ref] = candidate
	var evidence_id := _commit_history(
		"movement_lod_transitioned", entity_ref, request, transaction_id)
	var result := {"ok": true,
		"movement_record_ref": str(candidate.get("movement_record_ref", "")),
		"lod_state": target_lod,
		"evidence_id": evidence_id,
		"authoritative_revision": int(candidate.get("movement_revision", 0))}
	_store_transaction(transaction_id, request, result)
	mover_changed.emit(entity_ref)
	movement_changed.emit()
	return result


func current_movement_mode(entity_or_transport_id: String) -> Dictionary:
	if not _movers.has(entity_or_transport_id):
		return {"ok": false, "error": "movement.unknown_mover"}
	var record: Dictionary = _movers[entity_or_transport_id]
	return {
		"ok": true,
		"movement_mode": str(record.get("movement_mode", "")),
		"movement_state": str(record.get("movement_state", "")),
		"spatial_frame": str(record.get("spatial_frame_ref", "world")),
		"attachment_ref": str((record.get("attachment_refs", []) as Array).front()) \
			if not (record.get("attachment_refs", []) as Array).is_empty() else "",
		"movement_provider_ref": str(record.get("movement_provider_ref", "")),
		"authoritative_revision": int(record.get("movement_revision", 0)),
	}


func max_speed(entity_or_transport_id: String, context: Dictionary = {}) -> Dictionary:
	if not _movers.has(entity_or_transport_id):
		return {"ok": false, "error": "movement.unknown_mover"}
	var record: Dictionary = _movers[entity_or_transport_id]
	var profile := mover_profile(str(record.get("mover_profile_ref", "")))
	var base_speed := maxf(0.0, float(profile.get("base_speed", 0.0)))
	var modifier := 1.0
	var applied_refs: Array[String] = []
	var restrictions: Array[String] = []
	var reasons: Array[String] = []
	if BiologyManager.initialized and BiologyManager.has_actor(entity_or_transport_id):
		var biological := BiologyManager.biological_mobility_modifier_snapshot(
			entity_or_transport_id)
		if bool(biological.get("ok", false)):
			modifier *= clampf(float(biological.get(
				"max_speed_modifier", 1.0)), 0.0, 4.0)
			applied_refs.append(BiologyManager.biological_record_id(
				entity_or_transport_id))
			restrictions.append_array(_normalised_refs(
				biological.get("hard_restrictions", [])))
			reasons.append_array(_normalised_refs(
				biological.get("reason_codes", [])))
	if context.has("surface_modifier"):
		modifier *= clampf(float(context.get("surface_modifier", 1.0)), 0.0, 4.0)
		applied_refs.append(str(context.get("surface_ref", "surface.context")))
	var speed := maxf(0.0, base_speed * modifier)
	return {
		"ok": true,
		"achievable_speed": speed,
		"speed_band": "stopped" if speed <= 0.0 else "slow" if speed < 1.0 \
			else "ordinary" if speed < 4.0 else "fast",
		"applied_modifier_refs": applied_refs,
		"restrictions": restrictions,
		"reason_codes": reasons,
		"revision": int(record.get("movement_revision", 0)),
	}


func estimate_exertion(entity_ref: String, context: Dictionary) -> Dictionary:
	if not _movers.has(entity_ref):
		return {"ok": false, "error": "movement.unknown_mover"}
	if not BiologyManager.has_actor(entity_ref):
		return {"ok": false, "error": "movement.biological_owner_missing"}
	var request := _movement_exertion_request(entity_ref, context, "estimate")
	return BiologyManager.apply_movement_exertion_context(request)


func commit_exertion(entity_ref: String, context: Dictionary) -> Dictionary:
	if not _movers.has(entity_ref):
		return {"ok": false, "error": "movement.unknown_mover"}
	if not BiologyManager.has_actor(entity_ref):
		return {"ok": false, "error": "movement.biological_owner_missing"}
	var request := _movement_exertion_request(entity_ref, context, "commit")
	if str(request.get("idempotency_key", "")).is_empty():
		return {"ok": false, "error": "movement.exertion_key_required"}
	return BiologyManager.apply_movement_exertion_context(request)


func submit_physical_impact(entity_ref: String, evidence: Dictionary) -> Dictionary:
	if not _movers.has(entity_ref):
		return {"ok": false, "error": "movement.unknown_mover"}
	if not BiologyManager.has_actor(entity_ref):
		return {"ok": false, "error": "movement.biological_owner_missing"}
	var request := evidence.duplicate(true)
	request["entity_id"] = entity_ref
	request["movement_revision"] = int((_movers[entity_ref] as Dictionary).get(
		"movement_revision", 0))
	var result := BiologyManager.apply_physical_impact_event(request)
	if bool(result.get("ok", false)):
		var mover: Dictionary = _movers[entity_ref]
		mover["external_lock_flags"] = _normalised_refs(
			result.get("movement_restrictions", []))
		mover["movement_modifier_snapshot_ref"] = BiologyManager.biological_record_id(
			entity_ref)
		mover["movement_revision"] = int(mover.get("movement_revision", 0)) + 1
		mover["updated_tick"] = _world_tick()
		mover["state_hash"] = _record_hash(mover)
		_movers[entity_ref] = mover
		mover_changed.emit(entity_ref)
	return result


func travel_time(mover_or_group_id: String, route_or_destination: Variant) -> Dictionary:
	if _route_plans.has(str(route_or_destination)):
		var plan: Dictionary = _route_plans[str(route_or_destination)]
		return {
			"ok": true,
			"route_plan_id": str(plan.get("route_plan_id", "")),
			"expected_time": float(plan.get("estimated_travel_time", 0.0)),
			"likely_time_range": (
				plan.get("estimated_time_range", []) as Array).duplicate(true),
			"confidence": int(plan.get("confidence", 0)),
			"required_modes": _required_plan_modes(plan),
			"known_blockers": (
				plan.get("known_blockers", []) as Array).duplicate(true),
			"revision": int(plan.get("revision", 0)),
		}
	if _route_segments.has(str(route_or_destination)):
		var access := route_accessibility(mover_or_group_id, route_or_destination)
		return {
			"ok": bool(access.get("ok", false)),
			"route_plan_id": "",
			"expected_time": float(access.get("estimated_time", 0.0)),
			"likely_time_range": [float(access.get("estimated_time", 0.0))],
			"confidence": int(access.get("confidence", 0)),
			"required_modes": access.get("required_transitions", []).duplicate(true),
			"known_blockers": access.get("blockers", []).duplicate(true),
			"revision": int(access.get("revision", 0)),
		}
	return {"ok": false, "error": "route.unknown_destination"}


func traversal_cost(mover_id: String, segment_or_context: Variant) -> Dictionary:
	var access := route_accessibility(mover_id, segment_or_context)
	if not bool(access.get("ok", false)):
		return access
	return {
		"ok": true,
		"accessibility_state": str(access.get("accessibility_state", "blocked")),
		"cost": float(access.get("traversal_cost", 0.0)),
		"estimated_time": float(access.get("estimated_time", 0.0)),
		"required_transitions": access.get("required_transitions", []).duplicate(true),
		"blockers": access.get("blockers", []).duplicate(true),
		"confidence": int(access.get("confidence", 0)),
		"revision": int(access.get("revision", 0)),
	}


func cargo_capacity(transport_id: String, _route_context: Variant = {}) -> Dictionary:
	if not _movers.has(transport_id):
		return {"ok": false, "error": "movement.unknown_mover"}
	var profile := mover_profile(str((_movers[transport_id] as Dictionary).get(
		"mover_profile_ref", "")))
	var total := maxf(0.0, float(profile.get("movement_safe_capacity", 0.0)))
	return {"ok": true, "capacity_total": total, "capacity_used": 0.0,
		"capacity_available": total, "movement_load_band": "unloaded",
		"hard_overload": false, "reason_codes": [],
		"revision": int((_movers[transport_id] as Dictionary).get(
			"movement_revision", 0))}


func vehicle_condition(vehicle_id: String) -> Dictionary:
	if not _movers.has(vehicle_id):
		return {"ok": false, "error": "movement.unknown_mover"}
	var mover: Dictionary = _movers[vehicle_id]
	if str(mover.get("mover_family", "")) != "vehicle":
		return {"ok": false, "error": "movement.not_vehicle"}
	return {"ok": true, "operability_state": "compatibility_unknown",
		"movement_faults": [], "speed_modifier": 1.0, "braking_modifier": 1.0,
		"steering_modifier": 1.0, "immobilised": false,
		"reason_codes": ["movement.vehicle.provider_not_implemented"],
		"revision": int(mover.get("movement_revision", 0))}


func mount_status(mount_or_rider_id: String) -> Dictionary:
	if not _movers.has(mount_or_rider_id):
		return {"ok": false, "error": "movement.unknown_mover"}
	var mover: Dictionary = _movers[mount_or_rider_id]
	if str(mover.get("mover_family", "")) != "mount" \
			and str(mover.get("movement_mode", "")) != "Mounted":
		return {"ok": false, "error": "movement.not_mount_or_rider"}
	return {"ok": true, "mount_ref": mount_or_rider_id, "rider_ref": "",
		"seat_state": "unassigned", "movement_mode": str(mover.get(
			"movement_mode", "Mounted")), "physical_availability": "unknown",
		"movement_modifier": 1.0, "route_restrictions": [],
		"reason_codes": ["movement.mount.provider_not_implemented"],
		"revision": int(mover.get("movement_revision", 0))}


func formation_spatial_plan(formation_intent: Dictionary) -> Dictionary:
	if str(formation_intent.get("schema", "")) != "leyforge.xset.formation-intent" \
			or not bool(formation_intent.get("ok", true)):
		return {"ok": false, "error": "formation.invalid_intent"}
	var leader_ref := str(formation_intent.get("leader_ref", ""))
	var members := _normalised_refs(formation_intent.get("member_refs", []))
	if leader_ref.is_empty() or members.is_empty():
		return {"ok": false, "error": "formation.invalid_members"}
	var slots := {}
	var blocked: Array[String] = []
	var index := 0
	for member_ref in members:
		if not _movers.has(member_ref):
			blocked.append(member_ref)
			continue
		slots[member_ref] = {"slot_index": index, "relative_band": "follow"}
		index += 1
	return {
		"ok": true,
		"schema": "leyforge.xset.formation-spatial-plan",
		"source_owner": OWNER,
		"formation_spatial_plan_id": "formation_spatial.%s" % _stable_token(
			formation_intent),
		"formation_intent_id": str(formation_intent.get(
			"formation_intent_id", "")),
		"leader_ref": leader_ref,
		"assigned_slots": slots,
		"current_shape": str(formation_intent.get("formation_style", "follow")),
		"compression_state": "normal",
		"corridor_width_required": maxf(0.7, float(slots.size()) * 0.45),
		"separated_member_refs": [],
		"blocked_member_refs": blocked,
		"regroup_target": {},
		"reason_codes": ["formation.mover_missing"] if not blocked.is_empty() else [],
		"navigation_revision": _maximum_mover_revision(members),
	}


func lod_snapshot(entity_ref: String) -> Dictionary:
	if not _movers.has(entity_ref):
		return {}
	var mover: Dictionary = _movers[entity_ref]
	var journey: Dictionary = _journeys.get(str(mover.get("journey_ref", "")), {})
	return {
		"identity": {
			"record_type": RUNTIME_RECORD_TYPE,
			"schema_version": STATE_VERSION,
			"entity_ref": entity_ref,
			"movement_record_ref": str(mover.get("movement_record_ref", "")),
			"mover_profile_ref": str(mover.get("mover_profile_ref", "")),
		},
		"ownership": {
			"movement_owner": OWNER,
			"movement_provider_ref": str(mover.get("movement_provider_ref", "")),
			"network_authority_ref": str(mover.get("network_authority_ref", "")),
		},
		"quantities": {
			"position": (mover.get("position", []) as Array).duplicate(true),
			"velocity": (mover.get("velocity", []) as Array).duplicate(true),
			"segment_progress": float(journey.get("segment_progress", 0.0)),
		},
		"history": {
			"movement_revision": int(mover.get("movement_revision", 0)),
			"journey_revision": int(journey.get("revision", 0)),
		},
		"irreversible": {
			"entity_ref": entity_ref,
			"attachment_refs": (
				mover.get("attachment_refs", []) as Array).duplicate(true),
			"journey_ref": str(mover.get("journey_ref", "")),
			"route_plan_ref": str(mover.get("route_plan_ref", "")),
		},
		"state": {
			"semantic_location": (
				mover.get("semantic_location", {}) as Dictionary).duplicate(true),
			"movement_mode": str(mover.get("movement_mode", "")),
			"movement_state": str(mover.get("movement_state", "")),
			"current_route_leg_or_node": str(mover.get(
				"current_route_leg_or_node", "")),
			"last_valid_transform": (
				mover.get("safe_position", []) as Array).duplicate(true),
			"safe_position_ref": str(mover.get("safe_position_ref", "")),
			"movement_goal_ref": str(mover.get("movement_goal_ref", "")),
			"lod_state": str(mover.get("lod_state", "")),
		},
	}


func settlement_movement_summary(settlement_ref: String) -> Dictionary:
	var matching: Array[String] = []
	for entity_ref in mover_ids():
		var semantic: Dictionary = (_movers[entity_ref] as Dictionary).get(
			"semantic_location", {})
		if str(semantic.get("settlement_ref", "")) == settlement_ref \
				or str(semantic.get("ref", "")) == settlement_ref:
			matching.append(entity_ref)
	var active_intents := 0
	var blocked_intents := 0
	for intent_id in intent_ids():
		var intent: Dictionary = _intents[intent_id]
		if str(intent.get("requester_entity_or_group_ref", "")) not in matching:
			continue
		if str(intent.get("movement_status", "")) not in TERMINAL_INTENT_STATUSES:
			active_intents += 1
		if str(intent.get("movement_status", "")) in ["Failed", "Waiting"]:
			blocked_intents += 1
	return {
		"schema": "leyforge.set30.settlement-movement-summary",
		"source_owner": OWNER,
		"settlement_ref": settlement_ref,
		"mover_count": matching.size(),
		"active_intent_count": active_intents,
		"blocked_intent_count": blocked_intents,
		"mover_refs": matching,
		"source_revision": _maximum_mover_revision(matching),
		"world_time": ProductionKernel.world_time_reference(),
	}


func serialize_state() -> Dictionary:
	var data := {
		"schema": STATE_SCHEMA,
		"version": STATE_VERSION,
		"world_seed": world_seed,
		"world_id": world_id,
		"movers": _sorted_records(_movers, "entity_or_transport_ref"),
		"intents": _sorted_records(_intents, "movement_intent_id"),
		"local_paths": _sorted_records(_local_paths, "local_path_ref"),
		"route_segments": _sorted_records(_route_segments, "route_segment_id"),
		"route_plans": _sorted_records(_route_plans, "route_plan_id"),
		"journeys": _sorted_records(_journeys, "journey_id"),
		"providers": _sorted_records(_providers, "provider_ref"),
		"transactions": _ordered_records(_transactions, _transaction_order),
		"history": _ordered_records(_history, _history_order),
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
	var specifications := [
		["movers", "entity_or_transport_ref"],
		["intents", "movement_intent_id"],
		["local_paths", "local_path_ref"],
		["route_segments", "route_segment_id"],
		["route_plans", "route_plan_id"],
		["journeys", "journey_id"],
		["providers", "provider_ref"],
		["transactions", "transaction_id"],
		["history", "history_id"],
	]
	var restored_sets := {}
	for specification in specifications:
		var field := str(specification[0])
		if not (data.get(field, []) is Array):
			return false
		var restored := _restore_records(data.get(field, []), str(specification[1]))
		if not bool(restored.get("ok", false)):
			return false
		restored_sets[field] = restored.get("records", {})
	var candidate_movers: Dictionary = restored_sets["movers"]
	var candidate_intents: Dictionary = restored_sets["intents"]
	var candidate_routes: Dictionary = restored_sets["route_segments"]
	var candidate_plans: Dictionary = restored_sets["route_plans"]
	var candidate_journeys: Dictionary = restored_sets["journeys"]
	for entity_ref in candidate_movers:
		if not bool(validate_mover_record(candidate_movers[entity_ref]).get(
				"ok", false)):
			return false
	for intent_id in candidate_intents:
		var intent: Dictionary = candidate_intents[intent_id]
		if not bool(validate_intent_record(intent).get("ok", false)) \
				or not candidate_movers.has(str(intent.get(
					"requester_entity_or_group_ref", ""))):
			return false
	for route_id in candidate_routes:
		if not bool(validate_route_record(candidate_routes[route_id]).get(
				"ok", false)):
			return false
	for plan_id in candidate_plans:
		var plan: Dictionary = candidate_plans[plan_id]
		if str(plan.get("record_type", "")) != ROUTE_PLAN_RECORD_TYPE \
				or str(plan.get("state_hash", "")) != _record_hash(plan):
			return false
		for leg in plan.get("ordered_leg_records", []):
			if not (leg is Dictionary) or not candidate_routes.has(str(
					(leg as Dictionary).get("route_segment_id", ""))):
				return false
	for journey_id in candidate_journeys:
		var journey: Dictionary = candidate_journeys[journey_id]
		if str(journey.get("record_type", "")) != JOURNEY_RECORD_TYPE \
				or str(journey.get("state_hash", "")) != _record_hash(journey) \
				or not candidate_plans.has(str(journey.get("route_plan_id", ""))):
			return false
		for traveller_ref in journey.get("traveller_or_convoy_refs", []):
			if not candidate_movers.has(str(traveller_ref)):
				return false
	initialized = true
	restored_from_state = true
	world_seed = expected_seed
	world_id = expected_world_id if not expected_world_id.is_empty() else saved_world_id
	_movers = candidate_movers
	_intents = candidate_intents
	_local_paths = restored_sets["local_paths"]
	_route_segments = candidate_routes
	_route_plans = candidate_plans
	_journeys = candidate_journeys
	_providers = restored_sets["providers"]
	_transactions = restored_sets["transactions"]
	_transaction_order = _ordered_ids_from_records(
		data.get("transactions", []), "transaction_id")
	_history = restored_sets["history"]
	_history_order = _ordered_ids_from_records(data.get("history", []), "history_id")
	if not _providers.has(AQUATIC_PROVIDER_REF):
		return false
	movement_changed.emit()
	return true


func validate_state() -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "movement.owner_not_initialized"}
	for entity_ref in _movers:
		var validation := validate_mover_record(_movers[entity_ref])
		if not bool(validation.get("ok", false)):
			validation["entity_ref"] = entity_ref
			return validation
	for intent_id in _intents:
		var validation := validate_intent_record(_intents[intent_id])
		if not bool(validation.get("ok", false)):
			validation["movement_intent_id"] = intent_id
			return validation
		if not _movers.has(str((_intents[intent_id] as Dictionary).get(
				"requester_entity_or_group_ref", ""))):
			return {"ok": false, "error": "movement.intent_mover_missing",
				"movement_intent_id": intent_id}
	for route_id in _route_segments:
		var validation := validate_route_record(_route_segments[route_id])
		if not bool(validation.get("ok", false)):
			validation["route_segment_id"] = route_id
			return validation
	for journey_id in _journeys:
		var journey: Dictionary = _journeys[journey_id]
		if str(journey.get("state_hash", "")) != _record_hash(journey) \
				or not _route_plans.has(str(journey.get("route_plan_id", ""))):
			return {"ok": false, "error": "movement.invalid_journey",
				"journey_id": journey_id}
	return {"ok": true, "mover_count": _movers.size(),
		"intent_count": _intents.size(), "route_count": _route_segments.size(),
		"journey_count": _journeys.size()}


func validate_mover_record(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != RUNTIME_RECORD_TYPE \
			or int(record.get("schema_version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "movement.unsupported_runtime_record"}
	for field in [
		"entity_or_transport_ref", "movement_record_ref", "mover_profile_ref",
		"movement_mode", "movement_state", "spatial_frame_ref", "lod_state",
	]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "movement.missing_%s" % field}
	if mover_profile(str(record.get("mover_profile_ref", ""))).is_empty():
		return {"ok": false, "error": "movement.unknown_mover_profile"}
	if str(record.get("movement_mode", "")) not in VALID_MODES:
		return {"ok": false, "error": "movement.invalid_mode"}
	if str(record.get("lod_state", "")) not in VALID_LOD_STATES:
		return {"ok": false, "error": "movement.invalid_lod_state"}
	for field in ["position", "rotation", "velocity", "safe_position"]:
		if _normalise_vector3(record.get(field, [])).is_empty():
			return {"ok": false, "error": "movement.invalid_%s" % field}
	for field in [
		"attachment_refs", "active_movement_capabilities", "external_lock_flags",
		"migration_history",
	]:
		if not (record.get(field, []) is Array):
			return {"ok": false, "error": "movement.invalid_%s" % field}
	if not (record.get("semantic_location", {}) is Dictionary) \
			or int(record.get("movement_revision", 0)) < 1:
		return {"ok": false, "error": "movement.invalid_runtime_fields"}
	if not _provider_allows_mode(str(record.get(
			"movement_provider_ref", "")), str(record.get("movement_mode", ""))):
		return {"ok": false, "error": "movement.provider_boundary_violation"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "movement.runtime_hash_mismatch"}
	return {"ok": true}


func validate_intent_record(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != INTENT_RECORD_TYPE \
			or int(record.get("schema_version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "movement.unsupported_intent_record"}
	for field in [
		"movement_intent_id", "request_owner", "requester_entity_or_group_ref",
		"goal_type", "goal_ref_or_region", "arrival_profile_id", "movement_status",
		"request_hash",
	]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "movement.intent_missing_%s" % field}
	if str(record.get("movement_status", "")) not in VALID_INTENT_STATUSES \
			or int(record.get("authoritative_revision", 0)) < 1:
		return {"ok": false, "error": "movement.invalid_intent_fields"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "movement.intent_hash_mismatch"}
	return {"ok": true}


func validate_route_record(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != ROUTE_RECORD_TYPE \
			or int(record.get("schema_version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "route.unsupported_record"}
	for field in ["route_segment_id", "route_class", "source_owner"]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "route.missing_%s" % field}
	if float(record.get("width", -1.0)) < 0.0 \
			or float(record.get("vertical_clearance", -1.0)) < 0.0 \
			or int(record.get("revision", 0)) < 1:
		return {"ok": false, "error": "route.invalid_geometry_or_revision"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "route.hash_mismatch"}
	return {"ok": true}


func _ensure_initialized(request: Dictionary) -> void:
	if initialized:
		return
	initialize(int(request.get("world_seed", 0)), str(request.get("world_id", "")))


func _register_builtin_providers() -> void:
	_providers[AQUATIC_PROVIDER_REF] = {
		"provider_ref": AQUATIC_PROVIDER_REF,
		"owner": "set26.aquatic",
		"movement_mode": "Aquatic",
		"available": true,
		"implementation_state": "compatibility_adapter",
		"owns": [
			"aquatic_entry_classification", "surface_swimming", "diving",
			"underwater_locomotion", "buoyancy", "current_response",
		],
		"facade_owner": OWNER,
		"queries": [
			"AquaticMovementState", "AquaticEntryEligibility",
			"AquaticExitCandidate", "AquaticRouteAccessibility",
			"AquaticTraversalCost", "AquaticMovementSnapshot",
		],
		"revision": 1,
	}


func _mover_profiles() -> Dictionary:
	return {
		"mover_profile.humanoid.standard": {
			"mover_profile_id": "mover_profile.humanoid.standard",
			"mover_family": "humanoid",
			"body_shape_ref": "body.capsule.humanoid",
			"width": 0.72,
			"standing_height": 1.8,
			"base_speed": 6.0,
			"movement_safe_capacity": 0.0,
			"supported_movement_modes": [
				"Ground", "Airborne", "Traverse", "Aquatic", "Recovery"],
			"movement_capability_ids": [
				"movement.ground.walk", "movement.ground.sprint",
				"movement.jump.basic", "movement.aquatic.facade"],
			"version": 1,
			"lifecycle_state": "Validated",
		},
		"mover_profile.humanoid.npc": {
			"mover_profile_id": "mover_profile.humanoid.npc",
			"mover_family": "humanoid",
			"body_shape_ref": "body.capsule.humanoid_npc",
			"width": 0.64,
			"standing_height": 1.7,
			"base_speed": 1.65,
			"movement_safe_capacity": 0.0,
			"supported_movement_modes": [
				"Ground", "Airborne", "Traverse", "Aquatic", "Recovery"],
			"movement_capability_ids": [
				"movement.ground.walk", "movement.jump.basic",
				"navigation.follow_route", "movement.aquatic.facade"],
			"version": 1,
			"lifecycle_state": "Validated",
		},
		"mover_profile.vehicle.compatibility": {
			"mover_profile_id": "mover_profile.vehicle.compatibility",
			"mover_family": "vehicle",
			"body_shape_ref": "body.vehicle.compatibility",
			"width": 1.5,
			"standing_height": 2.0,
			"base_speed": 2.5,
			"movement_safe_capacity": 100.0,
			"supported_movement_modes": ["Vehicle", "Guided", "Recovery"],
			"movement_capability_ids": ["movement.transport.drive"],
			"version": 1,
			"lifecycle_state": "Prototype",
		},
	}


func _provider_allows_mode(provider_ref: String, mode: String) -> bool:
	if mode != "Aquatic":
		return provider_ref.is_empty() or _providers.has(provider_ref)
	return provider_ref == AQUATIC_PROVIDER_REF \
		and bool((_providers.get(provider_ref, {}) as Dictionary).get(
			"available", false))


func _attach_people_reference(entity_ref: String, record: Dictionary) -> void:
	if not PeopleManager.initialized or not PeopleManager.has_person(entity_ref):
		return
	var person := PeopleManager.get_person(entity_ref)
	var refs: Dictionary = person.get("external_domain_refs", {})
	if str(refs.get("movement_record_ref", "")) \
			== str(record.get("movement_record_ref", "")):
		return
	PeopleManager.set_external_domain_ref(
		entity_ref, "set30_movement", str(record.get("movement_record_ref", "")),
		int(record.get("movement_revision", 0)),
		"movement.owner_ref.%s.%d" % [
			entity_ref, int(record.get("movement_revision", 0))])


func _intent_request_payload(request: Dictionary) -> Dictionary:
	var payload := request.duplicate(true)
	for field in ["transaction_id", "social_authorisation"]:
		payload.erase(field)
	if request.get("social_authorisation", {}) is Dictionary:
		var social: Dictionary = request.get("social_authorisation", {})
		payload["social_authorisation_ref"] = str(social.get("context_id", ""))
		payload["social_authorisation_revision"] = int(social.get(
			"source_revision", 0))
	return payload


func _intent_status_payload(intent: Dictionary) -> Dictionary:
	return {
		"schema": "leyforge.set30.movement-intent-status",
		"movement_intent_id": str(intent.get("movement_intent_id", "")),
		"movement_status": str(intent.get("movement_status", "")),
		"resolved_goal_ref": str(intent.get("resolved_goal_ref", "")),
		"route_plan_ref": str(intent.get("route_plan_ref", "")),
		"local_path_ref": str(intent.get("local_path_ref", "")),
		"current_movement_mode": str(intent.get("current_movement_mode", "")),
		"current_location_summary": (
			intent.get("current_location_summary", {}) as Dictionary).duplicate(true),
		"estimated_arrival": intent.get("estimated_arrival", {}).duplicate(true),
		"arrival_confidence": int(intent.get("arrival_confidence", 0)),
		"waiting_reason": str(intent.get("waiting_reason", "")),
		"failure_reason_codes": (
			intent.get("failure_reason_codes", []) as Array).duplicate(true),
		"blocked_resource_refs": (
			intent.get("blocked_resource_refs", []) as Array).duplicate(true),
		"replan_state": str(intent.get("replan_state", "")),
		"authoritative_revision": int(intent.get("authoritative_revision", 0)),
	}


func _movement_exertion_request(
		entity_ref: String, context: Dictionary, query_mode: String) -> Dictionary:
	var request := context.duplicate(true)
	request["request_id"] = str(context.get(
		"request_id", "movement.exertion.%s.%s" % [
			entity_ref, _stable_token(context)]))
	request["idempotency_key"] = str(context.get("idempotency_key", ""))
	request["query_mode"] = query_mode
	request["entity_id"] = entity_ref
	request["movement_action_id"] = str(context.get("movement_action_id", ""))
	request["movement_action_family"] = str(context.get(
		"movement_action_family", "ground_locomotion"))
	request["movement_mode"] = str(context.get("movement_mode", str(
		(_movers[entity_ref] as Dictionary).get("movement_mode", "Ground"))))
	request["intensity_band"] = str(context.get("intensity_band", "moderate"))
	request["world_time"] = ProductionKernel.world_time_reference()
	request["movement_revision"] = int((_movers[entity_ref] as Dictionary).get(
		"movement_revision", 0))
	return request


func _route_payload(request: Dictionary) -> Dictionary:
	var payload := request.duplicate(true)
	payload.erase("transaction_id")
	return payload


func _required_plan_modes(plan: Dictionary) -> Array[String]:
	var result: Array[String] = []
	for leg in plan.get("ordered_leg_records", []):
		if not (leg is Dictionary):
			continue
		var provider_ref := str((leg as Dictionary).get(
			"movement_provider_ref", ""))
		var mode := "Aquatic" if provider_ref == AQUATIC_PROVIDER_REF else "Ground"
		if mode not in result:
			result.append(mode)
	return result


func _maximum_mover_revision(entity_refs: Array) -> int:
	var result := 0
	for entity_ref in entity_refs:
		if _movers.has(str(entity_ref)):
			result = maxi(result, int((_movers[str(entity_ref)] as Dictionary).get(
				"movement_revision", 0)))
	return result


func _commit_history(
		event_type: String,
		subject_ref: String,
		payload: Dictionary,
		correlation_id: String) -> String:
	var history_id := "movement_history.%s" % _stable_token({
		"event_type": event_type,
		"subject_ref": subject_ref,
		"correlation_id": correlation_id,
		"payload": payload,
	})
	if _history.has(history_id):
		return history_id
	var payload_hash := _hash_value(payload)
	var evidence_id := "evidence.%s" % history_id
	var envelope := ProductionKernel.make_evidence_envelope(
		evidence_id, OWNER, event_type, payload_hash, correlation_id)
	var committed := ProductionKernel.commit_evidence(envelope)
	if not bool(committed.get("ok", false)):
		return ""
	var published := ProductionKernel.publish_event(
		"event.%s" % history_id, OWNER, event_type, payload_hash, [evidence_id])
	if not bool(published.get("ok", false)):
		return ""
	var record := {
		"record_type": HISTORY_RECORD_TYPE,
		"schema_version": STATE_VERSION,
		"history_id": history_id,
		"event_type": event_type,
		"subject_ref": subject_ref,
		"correlation_id": correlation_id,
		"evidence_id": evidence_id,
		"payload_hash": payload_hash,
		"world_tick": _world_tick(),
		"revision": 1,
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	_history[history_id] = record
	_history_order.append(history_id)
	while _history_order.size() > MAX_HISTORY:
		var removed: String = _history_order.pop_front()
		_history.erase(removed)
	return evidence_id


func _transaction_replay(transaction_id: String, request: Dictionary) -> Dictionary:
	if transaction_id.is_empty() or not _transactions.has(transaction_id):
		return {}
	var stored: Dictionary = _transactions[transaction_id]
	if str(stored.get("request_hash", "")) != _hash_value(request):
		return {"ok": false, "error": "movement.transaction_conflict",
			"transaction_id": transaction_id}
	var result: Dictionary = stored.get("result", {}).duplicate(true)
	result["duplicate"] = true
	return result


func _store_transaction(
		transaction_id: String, request: Dictionary, result: Dictionary) -> void:
	if transaction_id.is_empty() or _transactions.has(transaction_id):
		return
	_transactions[transaction_id] = {
		"transaction_id": transaction_id,
		"request_hash": _hash_value(request),
		"result": result.duplicate(true),
		"world_tick": _world_tick(),
	}
	_transaction_order.append(transaction_id)
	while _transaction_order.size() > MAX_TRANSACTIONS:
		var removed: String = _transaction_order.pop_front()
		_transactions.erase(removed)


func _world_tick() -> int:
	var reference := ProductionKernel.world_time_reference()
	return int(reference.get("world_tick", reference.get("tick", 0)))


func _world_scoped_token(value: Variant) -> String:
	return _stable_token({
		"world_id": world_id,
		"world_seed": world_seed,
		"value": value,
	})


func _stable_token(value: Variant) -> String:
	return _hash_value(value).substr(0, 24)


func _canonical_mode(value: String) -> String:
	var lowered := value.strip_edges().to_lower()
	for mode in VALID_MODES:
		if mode.to_lower() == lowered:
			return mode
	return ""


func _normalised_modes(value: Variant) -> Array[String]:
	if not (value is Array):
		return []
	var result: Array[String] = []
	for entry in value:
		var mode := _canonical_mode(str(entry))
		if not mode.is_empty() and mode not in result:
			result.append(mode)
	result.sort()
	return result


func _normalised_refs(value: Variant) -> Array[String]:
	if not (value is Array):
		return []
	var result: Array[String] = []
	for entry in value:
		var ref := str(entry)
		if not ref.is_empty() and ref not in result:
			result.append(ref)
	result.sort()
	return result


func _normalise_vector3(value: Variant, allow_empty: bool = false) -> Array:
	if value is Vector3:
		return [value.x, value.y, value.z]
	if value is Vector3i:
		return [value.x, value.y, value.z]
	if value is Array and value.size() == 3:
		var result: Array = []
		for component in value:
			if not (component is int or component is float):
				return []
			result.append(float(component))
		return result
	return [] if allow_empty else []


func _normalise_semantic_location(value: Variant, fallback_position: Array) -> Dictionary:
	var result: Dictionary = value.duplicate(true) if value is Dictionary else {}
	if str(result.get("kind", "")).is_empty():
		result["kind"] = "exact_transform"
	if str(result.get("ref", "")).is_empty():
		result["ref"] = "world.position"
	var position := _normalise_vector3(result.get("position", fallback_position))
	result["position"] = position if not position.is_empty() \
		else fallback_position.duplicate(true)
	result["world_id"] = str(result.get("world_id", world_id))
	return result


func _normalise_location_value(value: Variant) -> Dictionary:
	if value is Dictionary:
		return (value as Dictionary).duplicate(true)
	var position := _normalise_vector3(value)
	return {"kind": "exact_transform", "position": position} \
		if not position.is_empty() else {"kind": "unknown"}


func _append_ref(value: Variant, ref: String) -> Array:
	var result: Array = value.duplicate(true) if value is Array else []
	if not ref.is_empty() and ref not in result:
		result.append(ref)
	return result


func _sorted_ids(source: Dictionary) -> Array[String]:
	var result: Array[String] = []
	for key in source.keys():
		result.append(str(key))
	result.sort()
	return result


func _sorted_records(source: Dictionary, identity_field: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for identity in _sorted_ids(source):
		var record: Dictionary = source[identity]
		if str(record.get(identity_field, "")) == identity:
			result.append(record.duplicate(true))
	return result


func _ordered_records(source: Dictionary, order: Array[String]) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for identity in order:
		if source.has(identity):
			result.append((source[identity] as Dictionary).duplicate(true))
	return result


func _restore_records(values: Array, identity_field: String) -> Dictionary:
	var records := {}
	for value in values:
		if not (value is Dictionary):
			return {"ok": false, "error": "movement.invalid_saved_record"}
		var record: Dictionary = (value as Dictionary).duplicate(true)
		var identity := str(record.get(identity_field, ""))
		if identity.is_empty() or records.has(identity):
			return {"ok": false, "error": "movement.duplicate_saved_identity"}
		records[identity] = record
	return {"ok": true, "records": records}


func _ordered_ids_from_records(values: Array, identity_field: String) -> Array[String]:
	var result: Array[String] = []
	for value in values:
		if value is Dictionary:
			result.append(str((value as Dictionary).get(identity_field, "")))
	return result


func _state_hash(data: Dictionary) -> String:
	var payload := data.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _record_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _record_semantic_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	for field in [
		"movement_revision", "authoritative_tick", "updated_tick", "state_hash",
	]:
		payload.erase(field)
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
