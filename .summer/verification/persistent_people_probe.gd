extends Node
## NPC-001 probe for the canonical persistent-person, household, ordinary-job
## and schedule owner plus Hamlet/settlement compatibility projections.

const SaveCoordinatorScript = preload("res://scripts/core/save_coordinator.gd")

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	_test_owner_records_and_interfaces()
	_test_owner_mutations()
	_test_persistence()
	_test_hamlet_materialisation_integration()
	_test_save_restore_order()
	print("PERSISTENT_PEOPLE_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"person_count": PeopleManager.person_count(),
		"household_count": PeopleManager.household_count(),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_owner_records_and_interfaces() -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	PeopleManager.initialize(71007, "world.people.probe")
	_expect(PeopleManager.initialized \
			and PeopleManager.world_seed == 71007 \
			and not PeopleManager.restored_from_state,
		"people owner initializes as fresh world authority")
	var fixture := _fixture()
	var reconciled := PeopleManager.reconcile_settlement_projection(
		"settlement.people.probe",
		fixture["residents"],
		fixture["households"],
		fixture["job_slots"],
		"probe_fixture")
	_expect(bool(reconciled.get("ok", false)),
		"settlement adapter hands persistent people to the owner")
	_expect(PeopleManager.person_ids("settlement.people.probe") \
			== ["person.probe.ada", "person.probe.borin"],
		"person IDs are deterministic and settlement scoped")
	_expect(PeopleManager.person_count() == 2 \
			and PeopleManager.household_count() == 1 \
			and PeopleManager.job_assignment_ids().size() == 2 \
			and PeopleManager.schedule_ids().size() == 2,
		"four canonical record families are created exactly once")
	var person := PeopleManager.get_person("person.probe.ada")
	_expect(str(person.get("record_type", "")) == "PersistentPerson" \
			and int(person.get("version", 0)) == 1 \
			and str(person.get("state_hash", "")).length() == 64,
		"persistent person is versioned, revisioned and hashed")
	_expect(str(person.get("settlement_id", "")) == "settlement.people.probe" \
			and str(person.get("household_id", "")) == "household.probe.shared" \
			and str(person.get("residence_id", "")) == "structure.probe.home",
		"person owner retains settlement, household and residence links")
	_expect(str(person.get("job_assignment_id", "")) \
			== "job_assignment.probe.ada" \
			and str(person.get("schedule_id", "")) \
			== "person.probe.ada.schedule.ordinary",
		"person owner retains ordinary job and schedule references")
	_expect(not person.has("health") and not person.has("needs") \
			and not person.has("position") and not person.has("trust") \
			and not person.has("wage"),
		"person record does not copy specialist biology, movement, social or economy truth")
	var refs: Dictionary = person.get("external_domain_refs", {})
	_expect(refs.keys().size() == 4 \
			and str(refs.get("biological_record_ref", "")).is_empty() \
			and str(refs.get("movement_record_ref", "")).is_empty(),
		"unimplemented specialist owners remain explicit recoverable references")

	var household := PeopleManager.get_household("household.probe.shared")
	_expect(str(household.get("record_type", "")) \
			== "PersistentHousehold" \
			and household.get("member_person_ids", []) \
			== ["person.probe.ada", "person.probe.borin"],
		"household owner has one sorted operational membership")
	_expect(not household.has("partnership_ids") \
			and not household.has("gestation_due_day") \
			and not household.has("trust"),
		"household record does not absorb social or biological compatibility state")
	var assignment := PeopleManager.get_job_assignment(
		"job_assignment.probe.ada")
	_expect(str(assignment.get("record_type", "")) \
			== "OrdinaryJobAssignment" \
			and str(assignment.get("person_id", "")) == "person.probe.ada" \
			and str(assignment.get("job_definition_ref", "")) \
			== "job.builder.basic",
		"ordinary job assignment links a person and job definition")
	_expect(not assignment.has("wage") and not assignment.has("position") \
			and not assignment.has("reachable"),
		"job assignment does not copy Set-27 wages or Set-30 reachability")
	var schedule := PeopleManager.schedule_for_person("person.probe.ada")
	_expect(str(schedule.get("record_type", "")) == "OrdinarySchedule" \
			and str(schedule.get("current_intent", "")) == "work" \
			and str(schedule.get("current_task_intent_ref", "")) \
			== "task.probe.build",
		"schedule owns broad routine intent and task reference")
	_expect(not schedule.has("position") and not schedule.has("path") \
			and not schedule.has("arrival"),
		"schedule does not move an actor or claim arrival")

	var projected_residents: Dictionary = reconciled.get("resident_records", {})
	var projected_ada: Dictionary = projected_residents.get("person.probe.ada", {})
	_expect(float(projected_ada.get("health", 0.0)) == 27.0 \
			and projected_ada.get("position", []) == [4.0, 1.0, 6.0] \
			and int(projected_ada.get("authoritative_person_revision", 0)) == 1,
		"compatibility projection retains specialist fields while annotating owner revision")
	var projected_households: Dictionary = reconciled.get("households", {})
	_expect(projected_households["household.probe.shared"].get(
		"partnership_ids", []) == ["person.probe.ada", "person.probe.borin"] \
			and int(projected_households["household.probe.shared"].get(
				"gestation_due_day", 0)) == 12,
		"social and biological compatibility fields survive without becoming owner truth")
	var projected_jobs: Dictionary = reconciled.get("job_slots", {})
	_expect(bool(projected_jobs["job_assignment.probe.ada"].get(
		"reachable", false)) \
			and projected_jobs["job_assignment.probe.ada"].get(
				"position", []) == [9, 0, 9],
		"movement and structure slot facts survive only in the compatibility view")

	_expect(str(PeopleManager.person_interface("person.probe.ada").get(
		"schema", "")) == "leyforge.document07.person-interface",
		"person interface is typed and versioned")
	_expect(str(PeopleManager.household_interface(
		"household.probe.shared").get("schema", "")) \
			== "leyforge.document07.household-interface",
		"household interface is typed and versioned")
	_expect(str(PeopleManager.job_assignment_interface(
		"job_assignment.probe.ada").get("schema", "")) \
			== "leyforge.document07.job-assignment-interface",
		"job interface is typed and versioned")
	_expect(str(PeopleManager.schedule_interface("person.probe.ada").get(
		"schema", "")) == "leyforge.document07.schedule-interface",
		"schedule interface is typed and versioned")
	for domain in PeopleManager.VALID_SPECIALIST_DOMAINS:
		var context := PeopleManager.specialist_context("person.probe.ada", domain)
		_expect(str(context.get("consumer_domain", "")) == domain \
				and str(context.get("specialist_resolution_state", "")) \
				== "recoverable_unresolved" \
				and not context.has("health") and not context.has("price") \
				and not context.has("trust") and not context.has("position"),
			"%s context supplies references without duplicating owner formula" % domain)
	var movement := PeopleManager.movement_intent_for_person("person.probe.ada")
	_expect(bool(movement.get("ok", false)) \
			and str(movement.get("schema", "")) \
			== "leyforge.xset.external-movement-intent" \
			and str(movement.get("request_owner", "")) == "document07.people",
		"ordinary schedule emits the reconciled Set-30 movement intent shape")
	_expect(not movement.has("path") and not movement.has("eta") \
			and not movement.has("arrival_evidence"),
		"movement intent does not execute or invent a journey")
	var evidence_before := (ProductionKernel.serialize_state().get(
		"evidence", []) as Array).size()
	var replay := PeopleManager.reconcile_settlement_projection(
		"settlement.people.probe", fixture["residents"],
		fixture["households"], fixture["job_slots"], "probe_fixture")
	_expect(bool(replay.get("ok", false)) \
			and (ProductionKernel.serialize_state().get(
				"evidence", []) as Array).size() == evidence_before,
		"identical settlement projection is idempotent and emits no duplicate consequence")
	var conflicting: Dictionary = fixture["residents"]["person.probe.ada"].duplicate(true)
	conflicting["name"] = "Different Person"
	_expect(PeopleManager.register_person_projection(
		"settlement.people.probe", conflicting).get("error") \
		== "person_identity_conflict",
		"same person ID cannot silently register a conflicting identity")


func _test_owner_mutations() -> void:
	var projection := PeopleManager.compatibility_person_view(
		"person.probe.ada", _fixture()["residents"]["person.probe.ada"])
	projection["household_id"] = "household.probe.ada_new"
	projection["job_assignment_id"] = "job_assignment.probe.ada_new"
	projection["job_id"] = "job.carpenter.basic"
	projection["job"] = "Carpenter"
	projection["schedule_state"] = "training"
	projection["home"] = [12, 13]
	projection["work"] = [20, 21]
	var updated := PeopleManager.update_person_projection(
		"person.probe.ada", projection, "mutation.probe.reassignment")
	_expect(bool(updated.get("ok", false)) \
			and not bool(updated.get("duplicate", true)),
		"owner accepts an explicit ordinary-person reassignment")
	var person := PeopleManager.get_person("person.probe.ada")
	_expect(str(person.get("household_id", "")) \
			== "household.probe.ada_new" \
			and str(person.get("job_definition_ref", "")) \
			== "job.carpenter.basic" \
			and person.get("residence_anchor", []) == [12, 13],
		"person owner commits household, job and assigned-place changes together")
	_expect("person.probe.ada" not in (PeopleManager.get_household(
		"household.probe.shared").get("member_person_ids", []) as Array) \
			and PeopleManager.get_household("household.probe.ada_new").get(
				"member_person_ids", []) == ["person.probe.ada"],
		"household reindex removes stale duplicate membership")
	_expect(not bool(PeopleManager.get_job_assignment(
		"job_assignment.probe.ada").get("active", true)) \
			and bool(PeopleManager.get_job_assignment(
				"job_assignment.probe.ada_new").get("active", false)),
		"job reassignment closes the old assignment and activates one successor")
	_expect(str(PeopleManager.schedule_for_person("person.probe.ada").get(
		"current_intent", "")) == "training",
		"person mutation updates broad schedule intent without movement execution")
	var scheduled := PeopleManager.set_schedule_intent(
		"person.probe.ada", "home", "structure.probe.home.2",
		"mutation.probe.schedule.home")
	_expect(bool(scheduled.get("ok", false)) \
			and str(PeopleManager.schedule_for_person("person.probe.ada").get(
				"target_ref", "")) == "structure.probe.home.2",
		"schedule intent accepts a destination reference, not a path")
	_expect(bool(PeopleManager.set_schedule_intent(
		"person.probe.ada", "home", "structure.probe.home.2",
		"mutation.probe.schedule.home").get("duplicate", false)),
		"identical schedule intent is idempotent")
	_expect(PeopleManager.set_schedule_intent(
		"person.probe.ada", "").get("error") == "NPC-SCHED-001",
		"empty schedule intent returns the stable diagnostic family")
	var linked := PeopleManager.set_external_domain_ref(
		"person.probe.ada", "set29_biology", "biology.person.probe.ada", 4,
		"mutation.probe.biological_ref")
	_expect(bool(linked.get("ok", false)) \
			and str(PeopleManager.specialist_context(
				"person.probe.ada", "set29_biology").get(
					"specialist_record_ref", "")) == "biology.person.probe.ada",
		"specialist owner can attach a versioned reference without copying payload")
	_expect(PeopleManager.set_external_domain_ref(
		"person.probe.ada", "invalid", "x", 0, "mutation.invalid").get(
		"error") == "invalid_specialist_reference",
		"unknown specialist domain cannot acquire authority accidentally")
	var dead := PeopleManager.set_existence_state(
		"person.probe.ada", "dead", "mutation.probe.death")
	_expect(bool(dead.get("ok", false)) \
			and str(PeopleManager.get_person("person.probe.ada").get(
				"existence_state", "")) == "dead",
		"one persistent lifecycle state records death")
	_expect(not bool(PeopleManager.get_job_assignment(
		"job_assignment.probe.ada_new").get("active", true)),
		"dead person cannot retain active ordinary work")
	_expect(PeopleManager.set_existence_state(
		"person.probe.ada", "invented").get("error") \
		== "invalid_existence_state",
		"lifecycle owner rejects unknown states")
	_expect(bool(PeopleManager.set_existence_state(
		"person.probe.ada", "alive", "mutation.probe.revive_fixture").get(
		"ok", false)),
		"probe restores live fixture through the same lifecycle owner")


func _test_persistence() -> void:
	var saved := PeopleManager.serialize_state()
	_expect(str(saved.get("schema", "")) == "leyforge.people-state" \
			and str(saved.get("state_hash", "")).length() == 64,
		"people save domain has explicit schema and canonical state hash")
	_expect((saved.get("people", []) as Array).size() == 2 \
			and (saved.get("households", []) as Array).size() == 2 \
			and (saved.get("job_assignments", []) as Array).size() == 3 \
			and (saved.get("schedules", []) as Array).size() == 2,
		"save persists every owner record family including closed job history")
	var json_state: Variant = JSON.parse_string(JSON.stringify(saved))
	PeopleManager.reset()
	_expect(PeopleManager.restore_state(
		json_state, 71007, "world.people.probe"),
		"people owner survives JSON save round-trip")
	_expect(PeopleManager.restored_from_state \
			and PeopleManager.person_ids() \
			== ["person.probe.ada", "person.probe.borin"],
		"restore marks canonical authority and preserves stable person IDs")
	_expect(str(PeopleManager.get_person("person.probe.ada").get(
		"household_id", "")) == "household.probe.ada_new" \
			and str(PeopleManager.schedule_for_person("person.probe.ada").get(
				"current_intent", "")) == "home",
		"save round-trip preserves owner mutations rather than regenerating defaults")
	var before := PeopleManager.serialize_state()
	var tampered: Dictionary = json_state.duplicate(true)
	tampered["people"][0]["household_id"] = "household.tampered"
	_expect(not PeopleManager.restore_state(
		tampered, 71007, "world.people.probe") \
			and PeopleManager.serialize_state() == before,
		"tampered state hash is rejected atomically")
	_expect(not PeopleManager.restore_state(
		json_state, 999, "world.people.probe") \
			and PeopleManager.serialize_state() == before,
		"wrong world seed is rejected without mutating current authority")
	_expect(not PeopleManager.restore_state(
		json_state, 71007, "world.other") \
			and PeopleManager.serialize_state() == before,
		"wrong world identity is rejected without cross-world person leakage")
	_expect(bool(PeopleManager.validate_person_record(
		PeopleManager.get_person("person.probe.ada")).get("ok", false)) \
			and bool(PeopleManager.validate_household_record(
				PeopleManager.get_household("household.probe.ada_new")).get(
					"ok", false)),
		"restored person and household hashes validate independently")


func _test_hamlet_materialisation_integration() -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	SimulationLodManager.reset()
	StructureManager.reset()
	SettlementManager.reset()
	var seed_value := 77119
	PeopleManager.initialize(seed_value, "world.people.hamlet")
	SimulationLodManager.initialize(seed_value, "world.people.hamlet")
	StructureManager.initialize(seed_value, "world.people.hamlet")
	var anchors := {
		"hamlet": Vector2i(0, 0),
		"warehouse": Vector2i(6, 0),
		"watchtower_site": Vector2i(12, 0),
		"goblin_camp": Vector2i(120, 0),
	}
	HamletState.initialized = false
	HamletState.initialize(seed_value, anchors)
	_expect(PeopleManager.person_count(HamletState.VILLAGE_ID) == 8,
		"fresh Hamlet roster hands all stable identities to people owner")
	var person_id := HamletState.get_npc_ids()[0]
	var owner_before := PeopleManager.get_person(person_id)
	var facade := HamletState.get_npc_record(person_id)
	_expect(str(facade.get("person_id", "")) == person_id \
			and str(facade.get("authoritative_person_state_hash", "")) \
			== str(owner_before.get("state_hash", "")),
		"focused facade reads stable identity from the owner")
	_expect(HamletState.update_resident_runtime(person_id, {
		"household_id": "household.hamlet.reassigned",
		"job_assignment_id": "job_assignment.hamlet.reassigned",
		"job_id": "job.builder.master",
		"job": "Master Builder",
		"schedule_state": "work",
	}), "legacy mutation adapter commits through people owner")
	var owner_after := PeopleManager.get_person(person_id)
	_expect(str(owner_after.get("household_id", "")) \
			== "household.hamlet.reassigned" \
			and str(owner_after.get("job_definition_ref", "")) \
			== "job.builder.master" \
			and int(owner_after.get("revision", 0)) \
			> int(owner_before.get("revision", 0)),
		"facade mutation advances canonical person revision")
	var lod_snapshot := HamletState.npc_lod_snapshot(person_id)
	_expect(str(lod_snapshot.get("identity", {}).get(
		"resident_id", "")) == person_id \
			and str(lod_snapshot.get("ownership", {}).get(
				"household_id", "")) == "household.hamlet.reassigned",
		"LOD snapshot consumes canonical identity and ownership")
	_expect(bool(SimulationLodManager.register_subject(
		person_id, "resident", HamletState.VILLAGE_ID, HamletState.VILLAGE_ID,
		"local", lod_snapshot).get("ok", false)),
		"persistent person registers for actor materialisation LOD")
	var record_view := lod_snapshot.duplicate(true)
	record_view["state"]["representation"] = "record"
	_expect(bool(SimulationLodManager.transition_subject(
		person_id, "distant", lod_snapshot, record_view,
		"transition.people.hamlet.actor.record",
		{"owner_id": HamletState.VILLAGE_ID}).get("ok", false)),
		"actor dematerialises without replacing its persistent identity")
	_expect(str(SimulationLodManager.subject_record(person_id).get(
		"snapshot", {}).get("identity", {}).get("resident_id", "")) \
			== person_id,
		"record-only representation retains exact person identity")
	var hamlet_saved := HamletState.serialize_state()
	var people_saved := PeopleManager.serialize_state()
	PeopleManager.reset()
	_expect(PeopleManager.restore_state(
		people_saved, seed_value, "world.people.hamlet"),
		"canonical people restore before compatibility facade")
	var tampered_hamlet := hamlet_saved.duplicate(true)
	tampered_hamlet["npc_records"][person_id]["job_id"] = "job.tampered"
	tampered_hamlet["npc_records"][person_id]["household_id"] \
		= "household.tampered"
	HamletState.initialized = false
	_expect(HamletState.restore_state(
		tampered_hamlet, seed_value, HamletState.VILLAGE_ID),
		"compatibility facade restores after canonical people owner")
	var restored_facade := HamletState.get_npc_record(person_id)
	_expect(str(restored_facade.get("job_id", "")) == "job.builder.master" \
			and str(restored_facade.get("household_id", "")) \
			== "household.hamlet.reassigned",
		"saved canonical owner defeats stale or tampered facade ownership fields")
	CombatState.initialized = false
	CombatState.initialize(seed_value, anchors)
	_expect(SettlementManager.initialize_legacy(seed_value),
		"settlement compatibility collection initializes from focused facade")
	var refreshed := SettlementManager.refresh_people_owner()
	_expect(bool(refreshed.get("ok", false)) \
			and int(refreshed.get("person_count", 0)) == 8,
		"settlement collection reconciles all people-owner projections")
	var settlement := SettlementManager.get_focused_settlement()
	_expect((settlement.get("households", {}) as Dictionary).has(
		"household.hamlet.reassigned") \
			and (settlement.get("job_slots", {}) as Dictionary).has(
				"job_assignment.hamlet.reassigned"),
		"settlement household and job dictionaries are compatibility projections")
	_expect(str((settlement.get("hamlet_state", {}) as Dictionary).get(
		"npc_records", {}).get(person_id, {}).get(
			"authoritative_person_state_hash", "")) \
			== str(PeopleManager.get_person(person_id).get("state_hash", "")),
		"regional record and focused actor facade reference one owner hash")


func _test_save_restore_order() -> void:
	var coordinator: SaveCoordinator = SaveCoordinatorScript.new()
	var order := coordinator.restore_order()
	_expect(order.size() == 19,
		"save coordinator exposes nineteen ordered restore domains")
	_expect(order.find("people_owner") == order.find("simulation_lod") + 1 \
			and order.find("biology_owner") == order.find("people_owner") + 1 \
			and order.find("social_owner") == order.find("biology_owner") + 1 \
			and order.find("political_owner") == order.find("social_owner") + 1 \
			and order.find("movement_owner") == order.find("political_owner") + 1 \
			and order.find("event_owner") == order.find("movement_owner") + 1 \
			and order.find("event_owner") < order.find("settlements"),
		"specialist owners and events restore before settlement projections")
	var copy := coordinator.restore_order()
	copy.clear()
	_expect(coordinator.restore_order().size() == 19,
		"callers cannot mutate canonical restore order")
	_expect(PeopleManager.serialize_state().get("schema", "") \
			== "leyforge.people-state",
		"live world save includes an independently serialisable people domain")


func _fixture() -> Dictionary:
	var shared := {
		"record_type": "Resident",
		"version": 1,
		"alive": true,
		"health": 27.0,
		"max_health": 30.0,
		"needs": {"food": 0.8, "shelter": 1.0},
		"position": [4.0, 1.0, 6.0],
		"home": [2, 3],
		"work": [9, 9],
		"age_days": 8800,
		"age_band": "adult",
		"household_id": "household.probe.shared",
		"residence_id": "structure.probe.home",
		"bed_id": "marker.probe.bed.0",
		"schedule_state": "work",
		"personal_inventory": [],
		"equipment": {},
		"trust": 0.9,
		"wage": 44,
	}
	var ada := shared.duplicate(true)
	ada.merge({
		"id": "person.probe.ada",
		"resident_id": "person.probe.ada",
		"name": "Ada Stone",
		"job_id": "job.builder.basic",
		"job": "Builder",
		"job_assignment_id": "job_assignment.probe.ada",
		"current_task": {"task_id": "task.probe.build"},
	}, true)
	var borin := shared.duplicate(true)
	borin.merge({
		"id": "person.probe.borin",
		"resident_id": "person.probe.borin",
		"name": "Borin Reed",
		"job_id": "job.farmer.basic",
		"job": "Farmer",
		"job_assignment_id": "job_assignment.probe.borin",
		"bed_id": "marker.probe.bed.1",
		"current_task": {"task_id": "task.probe.farm"},
	}, true)
	return {
		"residents": {
			"person.probe.ada": ada,
			"person.probe.borin": borin,
		},
		"households": {
			"household.probe.shared": {
				"record_type": "Household",
				"household_id": "household.probe.shared",
				"resident_ids": ["person.probe.ada", "person.probe.borin"],
				"partnership_ids": ["person.probe.ada", "person.probe.borin"],
				"gestation_due_day": 12,
				"trust": 0.8,
			},
		},
		"job_slots": {
			"job_assignment.probe.ada": {
				"job_assignment_id": "job_assignment.probe.ada",
				"role": "building",
				"reachable": true,
				"position": [9, 0, 9],
				"wage": 12,
			},
			"job_assignment.probe.borin": {
				"job_assignment_id": "job_assignment.probe.borin",
				"role": "food",
				"reachable": true,
				"position": [8, 0, 8],
				"wage": 11,
			},
		},
	}


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
