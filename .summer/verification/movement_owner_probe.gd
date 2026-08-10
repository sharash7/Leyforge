extends Node
## MOV-001 probe for Set-30 ownership, XSET-006/007/008/009/010/011,
## route/journey truth, authoritative arrival, LOD, replay and persistence.

const SaveCoordinatorScript = preload("res://scripts/core/save_coordinator.gd")

const SEED := 73030
const WORLD_ID := "world.movement.probe"
const SETTLEMENT_ID := "settlement.movement.probe"
const ADA := "person.movement.probe.ada"
const BRAM := "person.movement.probe.bram"

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	_test_foundation_and_specialist_boundaries()
	_test_external_intent_and_authoritative_arrival()
	_test_route_truth_and_journeys()
	_test_lod_persistence_and_save_order()
	print("MOVEMENT_OWNER_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"mover_count": MovementManager.mover_ids().size(),
		"intent_count": MovementManager.intent_ids().size(),
		"route_count": MovementManager.route_ids().size(),
		"journey_count": MovementManager.journey_ids().size(),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _fresh_owners() -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	SocialManager.reset()
	MovementManager.reset()
	PeopleManager.initialize(SEED, WORLD_ID)
	BiologyManager.initialize(SEED, WORLD_ID)
	SocialManager.initialize(SEED, WORLD_ID)
	MovementManager.initialize(SEED, WORLD_ID)
	for person_id in [ADA, BRAM]:
		_expect(bool(PeopleManager.register_person_projection(SETTLEMENT_ID, {
			"id": person_id,
			"resident_id": person_id,
			"name": person_id.get_file().capitalize(),
			"alive": true,
			"age_days": 8000,
			"age_band": "adult",
			"job_id": "job.probe.movement",
			"schedule_state": "work",
			"workplace_id": "workplace.movement.probe",
		}).get("ok", false)),
			"persistent person fixture registers before movement ownership")
		_expect(bool(BiologyManager.register_actor_projection(
			person_id, {"health": 100.0, "max_health": 100.0,
				"max_stamina": 100.0, "stamina": 100.0},
			"movement_probe", person_id, SETTLEMENT_ID, "persistent").get(
				"ok", false)),
			"biological movement input remains separately owned")


func _register_humanoid(person_id: String, position: Vector3) -> Dictionary:
	return MovementManager.register_mover({
		"transaction_id": "movement.probe.register.%s" % person_id,
		"entity_ref": person_id,
		"mover_profile_ref": "mover_profile.humanoid.npc",
		"position": position,
		"semantic_location": {
			"kind": "settlement",
			"ref": SETTLEMENT_ID,
			"settlement_ref": SETTLEMENT_ID,
			"position": position,
		},
		"movement_mode": "Ground",
		"movement_state": "Idle",
		"lod_state": "local",
	})


func _test_foundation_and_specialist_boundaries() -> void:
	_fresh_owners()
	var aquatic := MovementManager.provider_contract("set26.aquatic")
	_expect(str(aquatic.get("owner", "")) == "set26.aquatic" \
			and str(aquatic.get("facade_owner", "")) == "set30.movement" \
			and str(aquatic.get("implementation_state", "")) \
				== "compatibility_adapter",
		"XSET-011 retains Set-26E aquatic execution behind the Set-30 facade")
	var profile := MovementManager.mover_profile("mover_profile.humanoid.npc")
	_expect(str(profile.get("mover_family", "")) == "humanoid" \
			and "Aquatic" in (profile.get("supported_movement_modes", []) as Array),
		"canonical mover profile exposes stable modes and capabilities")
	var registered := _register_humanoid(ADA, Vector3(1.0, 2.0, 3.0))
	_expect(bool(registered.get("ok", false)) \
			and not bool(registered.get("duplicate", false)),
		"mover registers once through the movement authority")
	_expect(bool(_register_humanoid(ADA, Vector3(9.0, 9.0, 9.0)).get(
			"duplicate", false)),
		"mover registration is stable and does not overwrite runtime position")
	_expect(MovementManager.register_mover({
		"entity_ref": ADA,
		"mover_profile_ref": "mover_profile.humanoid.standard",
		"position": [1, 2, 3],
	}).get("error") == "movement.mover_profile_conflict",
		"stable mover identity rejects a conflicting profile")
	var record := MovementManager.mover_record(ADA)
	_expect(str(record.get("record_type", "")) == "MovementRuntimeRecord" \
			and str(record.get("state_hash", "")).length() == 64 \
			and int(record.get("movement_revision", 0)) >= 1,
		"runtime movement truth is versioned, revisioned and hashed")
	var people_context := PeopleManager.specialist_context(ADA, "set30_movement")
	_expect(str(people_context.get("specialist_record_ref", "")) \
			== MovementManager.movement_record_ref(ADA),
		"Document-07 person stores only the typed Set-30 record reference")
	var mode := MovementManager.current_movement_mode(ADA)
	_expect(str(mode.get("movement_mode", "")) == "Ground" \
			and str(mode.get("spatial_frame", "")) == "world",
		"CurrentMovementMode returns Set-30 authority without scene-tree identity")
	var speed := MovementManager.max_speed(ADA)
	_expect(bool(speed.get("ok", false)) \
			and is_equal_approx(float(speed.get("achievable_speed", 0.0)), 1.65) \
			and not (speed.get("applied_modifier_refs", []) as Array).is_empty(),
		"MaxSpeed consumes the typed Set-29 mobility snapshot without owning biology")
	var before_biology := BiologyManager.get_record(ADA)
	var estimate := MovementManager.estimate_exertion(ADA, {
		"request_id": "movement.probe.exertion.estimate",
		"movement_action_family": "ground_locomotion",
		"intensity_band": "moderate",
		"distance_or_progress": 5.0,
		"base_stamina_cost": 4.0,
	})
	_expect(str(estimate.get("schema", "")) \
			== "leyforge.xset.movement-exertion-decision" \
			and str(estimate.get("commit_status", "")) == "estimated",
		"XSET-008 estimates exertion through Set 29")
	_expect(BiologyManager.get_record(ADA) == before_biology,
		"route exertion estimation is side-effect free")
	var exertion_request := {
		"request_id": "movement.probe.exertion.commit",
		"idempotency_key": "movement.probe.exertion.once",
		"movement_action_family": "ground_locomotion",
		"intensity_band": "moderate",
		"distance_or_progress": 5.0,
		"base_stamina_cost": 4.0,
	}
	var committed := MovementManager.commit_exertion(ADA, exertion_request)
	_expect(str(committed.get("commit_status", "")) == "committed" \
			and float((committed.get("stamina_spend_result", {}) as Dictionary).get(
				"spent", 0.0)) > 0.0,
		"Set 30 submits physical intensity while Set 29 commits biological cost")
	_expect(bool(MovementManager.commit_exertion(
		ADA, exertion_request).get("duplicate", false)),
		"movement exertion retry is idempotent under the frozen XSET key")
	var changed_exertion := exertion_request.duplicate(true)
	changed_exertion["base_stamina_cost"] = 8.0
	_expect(MovementManager.commit_exertion(ADA, changed_exertion).get("error") \
			== "biological_transaction_conflict",
		"changed biological consequence cannot reuse movement evidence identity")
	_expect(MovementManager.submit_external_movement_intent({
		"movement_intent_id": "movement.probe.permission.denied",
		"request_owner": "set28.social",
		"requester_entity_or_group_ref": ADA,
		"goal_type": "FollowEntity",
		"goal_ref_or_region": BRAM,
		"arrival_profile_id": "arrival.follow",
		"requires_companion_permission": true,
		"social_authorisation": {},
	}).get("error") == "movement.social_permission_denied",
		"Set 30 consumes Set-28 consent and cannot manufacture companion permission")
	var aquatic_snapshot := MovementManager.commit_physical_snapshot({
		"snapshot_id": "movement.probe.aquatic.snapshot",
		"entity_ref": ADA,
		"position": [2.0, 1.0, 3.0],
		"rotation": [0.0, 0.0, 0.0],
		"velocity": [0.0, 0.2, 0.0],
		"movement_mode": "Aquatic",
		"movement_provider_ref": "set26.aquatic",
		"movement_state": "SurfaceSupported",
	})
	_expect(bool(aquatic_snapshot.get("ok", false)) \
			and str(MovementManager.current_movement_mode(ADA).get(
				"movement_provider_ref", "")) == "set26.aquatic",
		"universal Aquatic mode records the specialist Set-26E provider")
	_expect(MovementManager.commit_physical_snapshot({
		"entity_ref": ADA,
		"position": [2.0, 1.0, 3.0],
		"movement_mode": "Aquatic",
		"movement_provider_ref": "set30.duplicate_swim_solver",
	}).get("error") == "movement.provider_boundary_violation",
		"Set 30 rejects a duplicate aquatic locomotion owner")
	_expect(bool(MovementManager.commit_physical_snapshot({
		"entity_ref": ADA,
		"position": [2.0, 2.0, 3.0],
		"rotation": [0.0, 0.0, 0.0],
		"velocity": [0.0, 0.0, 0.0],
		"movement_mode": "Ground",
		"movement_provider_ref": "",
		"movement_state": "Idle",
		"safe_position": true,
	}).get("ok", false)),
		"cross-medium handoff returns authority to the Ground specialist state")


func _test_external_intent_and_authoritative_arrival() -> void:
	var people_intent := PeopleManager.movement_intent_for_person(ADA)
	people_intent["goal_position"] = [8.0, 2.0, 3.0]
	people_intent["allowed_movement_modes"] = ["Ground", "Traverse"]
	people_intent["wait_policy"] = "wait_and_replan"
	people_intent["replan_policy"] = "on_blocker"
	people_intent["failure_policy"] = "report_failure"
	var accepted := MovementManager.submit_external_movement_intent(people_intent)
	var intent_id := str(people_intent.get("movement_intent_id", ""))
	_expect(bool(accepted.get("ok", false)) \
			and str((accepted.get("status", {}) as Dictionary).get(
				"movement_status", "")) == "Accepted",
		"Document-07 schedule submits intent without owning physical arrival")
	_expect(bool(MovementManager.submit_external_movement_intent(
		people_intent).get("duplicate", false)),
		"exact external movement intent replay is idempotent")
	var changed := people_intent.duplicate(true)
	changed["goal_ref_or_region"] = "workplace.movement.other"
	_expect(MovementManager.submit_external_movement_intent(changed).get("error") \
			== "movement.intent_conflict",
		"changed goal cannot reuse an intent identity")
	var path_request := {
		"request_id": "movement.probe.local_path.1",
		"transaction_id": "movement.probe.local_path.1",
		"ordered_path_points_or_cells": [
			[3.0, 2.0, 3.0], [5.0, 2.0, 3.0], [8.0, 2.0, 3.0]],
		"estimated_local_time": 4.0,
		"navigation_revision": 7,
		"profile_revision": 1,
		"confidence": 950,
	}
	var path := MovementManager.publish_local_path(intent_id, path_request)
	_expect(bool(path.get("ok", false)) \
			and not str(path.get("local_path_ref", "")).is_empty(),
		"Set 30 commits a local path result supplied by the current voxel adapter")
	_expect(bool(MovementManager.publish_local_path(
		intent_id, path_request).get("duplicate", false)),
		"local path evidence replays without duplicate path state")
	var status := MovementManager.report_intent_status(intent_id, "Moving", {
		"transaction_id": "movement.probe.intent.moving",
	})
	_expect(str((status.get("status", {}) as Dictionary).get(
			"movement_status", "")) == "Moving",
		"specialist controller reports movement without deciding task meaning")
	_expect(bool(MovementManager.commit_physical_snapshot({
		"snapshot_id": "movement.probe.arrival.snapshot",
		"entity_ref": ADA,
		"position": [8.0, 2.0, 3.0],
		"rotation": [0.0, 0.0, 0.0],
		"velocity": [0.0, 0.0, 0.0],
		"movement_mode": "Ground",
		"movement_state": "Idle",
		"safe_position": true,
	}).get("ok", false)),
		"specialist physics publishes the consequential transform")
	var arrived := MovementManager.report_intent_status(intent_id, "Arrived", {
		"transaction_id": "movement.probe.intent.arrived",
		"position": [8.0, 2.0, 3.0],
	})
	_expect(str((arrived.get("status", {}) as Dictionary).get(
			"movement_status", "")) == "Arrived" \
			and not str(arrived.get("evidence_id", "")).is_empty(),
		"only Set 30 publishes authoritative arrival evidence")
	var arrived_record := MovementManager.mover_record(ADA)
	_expect(str((arrived_record.get("semantic_location", {}) as Dictionary).get(
			"ref", "")) == "workplace.movement.probe" \
			and str(arrived_record.get("local_path_ref", "x")).is_empty(),
		"arrival updates semantic location and clears disposable local path state")
	_expect(bool(MovementManager.report_intent_status(
		intent_id, "Arrived", {}).get("duplicate", false)),
		"authoritative arrival retry cannot commit twice")
	_expect(MovementManager.report_intent_status(
		intent_id, "Moving", {}).get("error") == "movement.intent_already_terminal",
		"terminal movement intent cannot silently resume")
	var formation := MovementManager.formation_spatial_plan({
		"ok": true,
		"schema": "leyforge.xset.formation-intent",
		"formation_intent_id": "formation.movement.probe",
		"leader_ref": ADA,
		"member_refs": [ADA, BRAM, "person.movement.probe.missing"],
		"formation_style": "column",
	})
	_expect(str(formation.get("source_owner", "")) == "set30.movement" \
			and "person.movement.probe.missing" in (
				formation.get("blocked_member_refs", []) as Array) \
			and not formation.has("social_permission"),
		"XSET-006 keeps social formation intent separate from physical slot resolution")


func _test_route_truth_and_journeys() -> void:
	_expect(bool(_register_humanoid(BRAM, Vector3(8.0, 2.0, 3.0)).get(
			"ok", false)),
		"second persistent mover registers for journey and formation tests")
	var route_a := {
		"transaction_id": "movement.probe.route.a.v1",
		"route_segment_id": "route.movement.probe.a",
		"source_owner": "settlement.infrastructure",
		"source_revision": 4,
		"route_class": "road",
		"surface": "dirt",
		"quality": "ordinary",
		"width": 2.0,
		"vertical_clearance": 3.0,
		"grade": 0.1,
		"supported_transport_classes": ["humanoid"],
		"condition": "passable",
		"closure": false,
	}
	var observed := MovementManager.record_route_observation(route_a)
	_expect(bool(observed.get("ok", false)) \
			and int(observed.get("route_revision", 0)) == 1,
		"physical provider observation becomes canonical Set-30 route truth")
	_expect(bool(MovementManager.record_route_observation(
		route_a).get("duplicate", false)),
		"route observation is idempotent under its evidence identity")
	var objective := MovementManager.route_observation("route.movement.probe.a")
	_expect(str(objective.get("schema", "")) \
			== "leyforge.xset.route-observation" \
			and int(objective.get("objective_confidence", 0)) == 1000,
		"XSET-007 publishes objective route evidence separately from social belief")
	var accessible := MovementManager.route_accessibility(
		ADA, "route.movement.probe.a")
	_expect(str(accessible.get("accessibility_state", "")) == "accessible" \
			and (accessible.get("blockers", []) as Array).is_empty(),
		"RouteAccessibility returns mover-specific physical truth")
	var route_b := route_a.duplicate(true)
	route_b["transaction_id"] = "movement.probe.route.b.v1"
	route_b["route_segment_id"] = "route.movement.probe.b"
	_expect(bool(MovementManager.record_route_observation(route_b).get(
			"ok", false)),
		"second connected route observation commits independently")
	var aquatic_route := route_a.duplicate(true)
	aquatic_route["transaction_id"] = "movement.probe.route.aquatic.v1"
	aquatic_route["route_segment_id"] = "route.movement.probe.aquatic"
	aquatic_route["movement_provider_ref"] = "set26.aquatic"
	_expect(bool(MovementManager.record_route_observation(aquatic_route).get(
			"ok", false)) \
			and "set26.aquatic" in (MovementManager.route_accessibility(
				ADA, "route.movement.probe.aquatic").get(
					"required_transitions", []) as Array),
		"route graph consumes the aquatic provider edge without duplicating swimming")
	var plan_request := {
		"transaction_id": "movement.probe.plan.1",
		"route_plan_id": "route_plan.movement.probe.1",
		"origin": {"kind": "goal", "ref": "workplace.movement.probe"},
		"destination": {"kind": "settlement", "ref": "settlement.destination"},
		"mover_profile_refs": ["mover_profile.humanoid.npc"],
		"ordered_leg_records": [
			{"route_segment_id": "route.movement.probe.a", "cost": 2.0},
			{"route_segment_id": "route.movement.probe.b", "cost": 3.0},
		],
		"estimated_travel_time": 5.0,
		"knowledge_revision": 2,
		"route_graph_revision": 4,
	}
	var plan := MovementManager.create_route_plan(plan_request)
	_expect(bool(plan.get("ok", false)) \
			and (plan.get("known_blockers", []) as Array).is_empty(),
		"route plan references authoritative segment revisions and no teleport assumption")
	var travel := MovementManager.travel_time(ADA, "route_plan.movement.probe.1")
	_expect(is_equal_approx(float(travel.get("expected_time", 0.0)), 5.0) \
			and int(travel.get("confidence", 0)) == 1000,
		"TravelTime exposes route estimate and confidence without economic meaning")
	var cost := MovementManager.traversal_cost(ADA, "route.movement.probe.a")
	_expect(str(cost.get("accessibility_state", "")) == "accessible" \
			and float(cost.get("cost", 0.0)) > 0.0,
		"TraversalCost preserves blocker and physical cost semantics")
	var journey_request := {
		"transaction_id": "movement.probe.journey.start",
		"journey_id": "journey.movement.probe.1",
		"route_plan_id": "route_plan.movement.probe.1",
		"traveller_or_convoy_refs": [ADA, BRAM],
		"passenger_refs": [BRAM],
		"cargo_refs": ["cargo.probe.exact"],
		"last_valid_route_node": "route_node.origin",
	}
	var journey := MovementManager.start_journey(journey_request)
	_expect(bool(journey.get("ok", false)) \
			and int(journey.get("revision", 0)) == 1,
		"persistent long-distance journey starts with exact travellers and cargo refs")
	_expect(bool(MovementManager.start_journey(
		journey_request).get("duplicate", false)),
		"journey start transaction replays exactly once")
	var first_progress := {
		"transaction_id": "movement.probe.journey.progress.1",
		"progress_delta": 0.5,
		"world_tick": 10,
	}
	var progressed := MovementManager.advance_journey(
		"journey.movement.probe.1", first_progress)
	_expect(is_equal_approx(float(progressed.get("segment_progress", 0.0)), 0.5) \
			and str(progressed.get("journey_status", "")) == "active",
		"far journey advances deterministically without per-frame steering")
	_expect(bool(MovementManager.advance_journey(
		"journey.movement.probe.1", first_progress).get("duplicate", false)),
		"far journey progress is idempotent")
	var changed_progress := first_progress.duplicate(true)
	changed_progress["progress_delta"] = 0.75
	_expect(MovementManager.advance_journey(
		"journey.movement.probe.1", changed_progress).get("error") \
			== "movement.transaction_conflict",
		"changed far movement cannot reuse a committed journey transaction")
	var leg_two := MovementManager.advance_journey("journey.movement.probe.1", {
		"transaction_id": "movement.probe.journey.progress.2",
		"progress_delta": 0.5,
		"world_tick": 20,
	})
	_expect(int(MovementManager.journey_record("journey.movement.probe.1").get(
			"current_leg_index", -1)) == 1 \
			and is_equal_approx(float(leg_two.get("segment_progress", -1.0)), 0.0),
		"completed route leg advances to the next authoritative segment")
	var arrived := MovementManager.advance_journey("journey.movement.probe.1", {
		"transaction_id": "movement.probe.journey.progress.3",
		"progress_delta": 1.0,
		"world_tick": 30,
	})
	_expect(str(arrived.get("journey_status", "")) == "arrived" \
			and str((MovementManager.mover_record(ADA).get(
				"semantic_location", {}) as Dictionary).get(
					"ref", "")) == "settlement.destination",
		"journey arrival updates semantic location without inventing a local transform")
	var closed_route := route_a.duplicate(true)
	closed_route["transaction_id"] = "movement.probe.route.closed.v1"
	closed_route["route_segment_id"] = "route.movement.probe.closed"
	closed_route["closure"] = true
	closed_route["condition"] = "bridge_destroyed"
	_expect(bool(MovementManager.record_route_observation(closed_route).get(
			"ok", false)) \
			and str(MovementManager.route_accessibility(
				ADA, "route.movement.probe.closed").get(
					"accessibility_state", "")) == "blocked",
		"destroyed or closed infrastructure blocks abstract travel truth")


func _test_lod_persistence_and_save_order() -> void:
	var lod_before := MovementManager.lod_snapshot(ADA)
	_expect(str((lod_before.get("irreversible", {}) as Dictionary).get(
			"journey_ref", "")) == "journey.movement.probe.1" \
			and not (lod_before.get("state", {}) as Dictionary).is_empty(),
		"XSET-010 movement payload preserves journey, location and last valid state")
	var transition := MovementManager.transition_lod(ADA, "local", {
		"transaction_id": "movement.probe.lod.promote",
		"transition_id": "simulation.transition.probe",
	})
	_expect(bool(transition.get("ok", false)) \
			and str(transition.get("lod_state", "")) == "local",
		"global LOD request changes only Set-30 movement representation state")
	_expect(bool(MovementManager.transition_lod(ADA, "local", {}).get(
			"duplicate", false)),
		"same LOD transition is stable")
	var summary := MovementManager.settlement_movement_summary("settlement.destination")
	_expect(str(summary.get("source_owner", "")) == "set30.movement" \
			and int(summary.get("source_revision", 0)) > 0,
		"settlements consume a typed movement summary rather than owning movement")
	var vehicle := MovementManager.register_mover({
		"transaction_id": "movement.probe.vehicle.register",
		"entity_ref": "vehicle.movement.probe",
		"mover_profile_ref": "mover_profile.vehicle.compatibility",
		"position": [0.0, 0.0, 0.0],
		"movement_mode": "Vehicle",
		"movement_state": "Parked",
		"lod_state": "local",
	})
	_expect(bool(vehicle.get("ok", false)) \
			and float(MovementManager.cargo_capacity(
				"vehicle.movement.probe").get("capacity_total", 0.0)) == 100.0,
		"movement-safe cargo capacity remains separate from inventory ownership/value")
	_expect(str(MovementManager.vehicle_condition(
		"vehicle.movement.probe").get("operability_state", "")) \
			== "compatibility_unknown" \
			and MovementManager.mount_status("vehicle.movement.probe").get("error") \
				== "movement.not_mount_or_rider",
		"unimplemented vehicle and mount specialists remain explicit, not fabricated")
	var saved := MovementManager.serialize_state()
	_expect(str(saved.get("schema", "")) == "leyforge.movement-state" \
			and str(saved.get("state_hash", "")).length() == 64 \
			and not (saved.get("journeys", []) as Array).is_empty(),
		"movement runtime, intents, routes and journeys enter one hashed envelope")
	var json_round_trip: Variant = JSON.parse_string(JSON.stringify(saved))
	MovementManager.reset()
	_expect(MovementManager.restore_state(
		json_round_trip, SEED, WORLD_ID) \
			and MovementManager.restored_from_state,
		"Set-30 state round-trips through the actual JSON persistence boundary")
	_expect(str(MovementManager.journey_record(
		"journey.movement.probe.1").get("journey_status", "")) == "arrived" \
			and MovementManager.mover_ids().has(ADA),
		"save/load preserves journey consequence and stable mover identity")
	var live_hash := str(MovementManager.serialize_state().get("state_hash", ""))
	var corrupt: Dictionary = saved.duplicate(true)
	(corrupt.get("movers", []) as Array)[0]["movement_mode"] = "Teleport"
	_expect(not MovementManager.restore_state(corrupt, SEED, WORLD_ID) \
			and str(MovementManager.serialize_state().get("state_hash", "")) == live_hash,
		"corrupt movement state is rejected without replacing live authority")
	var validation := MovementManager.validate_state()
	_expect(bool(validation.get("ok", false)) \
			and int(validation.get("mover_count", 0)) >= 3,
		"complete movement owner validates all record families and references")
	var coordinator := SaveCoordinatorScript.new()
	var order := coordinator.restore_order()
	_expect(order.find("political_owner") < order.find("movement_owner") \
			and order.find("movement_owner") < order.find("settlements") \
			and order.find("movement_owner") < order.find("player"),
		"save order restores external inputs then Set-30 truth before compatibility actors")
	_expect(order.size() == 18,
		"canonical save order includes exactly one additive movement-owner domain")


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
