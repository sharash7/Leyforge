extends Node
## LOD-001 probe for persistent presence, invariant transitions, bounded
## catch-up, workload budgets, save round-trips and settlement-owner wiring.

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	_test_contract_and_world_time()
	_test_transition_invariants()
	_test_bounded_catchup()
	_test_persistence()
	_test_settlement_owner_integration()
	print("SIMULATION_LOD_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"subject_count": SimulationLodManager.subject_count(),
		"world_tick": int(ProductionKernel.world_time_reference().get(
			"world_tick", -1)),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _snapshot(subject_id: String = "resident.probe.ada") -> Dictionary:
	return {
		"identity": {
			"record_type": "Resident",
			"resident_id": subject_id,
			"name": "Ada",
		},
		"ownership": {
			"settlement_id": "settlement.probe.lod",
			"household_id": "household.probe.1",
			"job_id": "job.builder.basic",
		},
		"quantities": {
			"health": 30.0,
			"inventory": [{
				"kind": "item",
				"stable_id": "item.resource.log_oak",
				"count": 6,
			}],
		},
		"history": [{"event_id": "history.probe.birth"}],
		"irreversible": {"alive": true, "unique_item_ids": ["relic.probe.1"]},
		"state": {"representation": "actor", "position": [1.0, 2.0, 3.0]},
	}


func _test_contract_and_world_time() -> void:
	ProductionKernel.reset_for_verification()
	SimulationLodManager.reset()
	SimulationLodManager.initialize(88117, "world.simulation.lod.probe")
	_expect(SimulationLodManager.VALID_MODES \
			== ["local", "regional", "distant", "dormant"],
		"canonical representation modes are explicit and ordered")
	_expect(SimulationLodManager.workload_budget("local") == {
		"cadence_minutes": 1.0,
		"max_steps_per_pass": 8,
		"max_minutes_per_pass": 8.0,
	}, "local workload budget is fixed and inspectable")
	_expect(SimulationLodManager.workload_budget("distant") == {
		"cadence_minutes": 15.0,
		"max_steps_per_pass": 8,
		"max_minutes_per_pass": 120.0,
	}, "distant workload budget is fixed and inspectable")
	_expect(SimulationLodManager.workload_budget("invalid").is_empty(),
		"unknown representation has no implicit workload budget")
	_expect(SimulationLodManager.advance_runtime_minutes(0.0).get(
		"error") == "elapsed_minutes_must_be_positive",
		"world time rejects non-positive elapsed work")
	var fractional := SimulationLodManager.advance_runtime_minutes(0.4)
	_expect(bool(fractional.get("ok", false)) \
			and int(fractional.get("advanced_ticks", -1)) == 0,
		"sub-minute runtime time is retained without inventing a tick")
	var advanced := SimulationLodManager.advance_runtime_minutes(0.7)
	_expect(int(advanced.get("advanced_ticks", 0)) == 1 \
			and int(ProductionKernel.world_time_reference().get(
				"world_tick", 0)) == 1,
		"fractional runtime time advances the authoritative world timeline once")
	_expect(is_equal_approx(float(advanced.get(
		"fractional_minutes", -1.0)), 0.1),
		"fractional world minutes remain deterministic after the tick")
	SimulationLodManager.reset()
	_expect(SimulationLodManager.advance_runtime_minutes(1.0).get(
		"error") == "lod_not_initialized",
		"world time cannot advance through an unbound LOD coordinator")
	SimulationLodManager.initialize(88117, "world.simulation.lod.probe")


func _test_transition_invariants() -> void:
	var fixture := _snapshot()
	_expect(SimulationLodManager.register_subject(
		"", "resident", "settlement.probe.lod", "region.probe", "local",
		fixture).get("error") == "subject_identity_required",
		"subject registration requires stable identity")
	_expect(SimulationLodManager.register_subject(
		"resident.bad.mode", "resident", "settlement.probe.lod",
		"region.probe", "invented", fixture).get("error") \
		== "invalid_lod_mode",
		"subject registration rejects unknown representation")
	var malformed := fixture.duplicate(true)
	malformed.erase("quantities")
	_expect(SimulationLodManager.register_subject(
		"resident.bad.snapshot", "resident", "settlement.probe.lod",
		"region.probe", "local", malformed).get("error") \
		== "invalid_snapshot_quantities",
		"subject registration rejects incomplete owner snapshots")
	var registered := SimulationLodManager.register_subject(
		"resident.probe.ada", "resident", "settlement.probe.lod",
		"region.probe", "local", fixture)
	_expect(bool(registered.get("ok", false)) \
			and not bool(registered.get("duplicate", true)),
		"owner snapshot registers one persistent LOD subject")
	var record := SimulationLodManager.subject_record("resident.probe.ada")
	_expect(str(record.get("record_type", "")) == "SimulationLodRecord" \
			and int(record.get("revision", 0)) == 1,
		"persistent subject record is versioned and revisioned")
	_expect(str(record.get("presence_state", {}).get("mode", "")) == "near" \
			and str(record.get("region_id", "")) == "region.probe",
		"local representation publishes canonical near presence")
	_expect(str(record.get("record_hash", "")).length() == 64 \
			and str(record.get("snapshot_hash", "")).length() == 64,
		"subject and owner snapshots receive canonical hashes")
	_expect(bool(SimulationLodManager.register_subject(
		"resident.probe.ada", "resident", "settlement.probe.lod",
		"region.probe", "local", fixture).get("duplicate", false)),
		"identical subject registration is idempotent")
	_expect(SimulationLodManager.register_subject(
		"resident.probe.ada", "resident", "settlement.other",
		"region.probe", "local", fixture).get("error") == "subject_conflict",
		"stable subject identity cannot be reassigned to another owner")

	var regional := fixture.duplicate(true)
	regional["state"]["representation"] = "regional_record"
	regional["state"]["position"] = [1.0, 0.0, 3.0]
	var transition := SimulationLodManager.transition_subject(
		"resident.probe.ada", "regional", fixture, regional,
		"transition.probe.ada.local.regional",
		{"owner_id": "settlement.probe.lod"})
	_expect(bool(transition.get("ok", false)) \
			and not bool(transition.get("duplicate", true)),
		"demotion may change representation state")
	record = SimulationLodManager.subject_record("resident.probe.ada")
	_expect(str(record.get("lod_mode", "")) == "regional" \
			and str(record.get("presence_state", {}).get("mode", "")) \
			== "regional",
		"demotion updates mode and global presence together")
	_expect((record.get("transition_history", []) as Array).size() == 1 \
			and (record.get("evidence_refs", []) as Array).size() == 1,
		"demotion retains transition history and shared evidence")
	_expect(bool(SimulationLodManager.transition_subject(
		"resident.probe.ada", "regional", fixture, regional,
		"transition.probe.ada.local.regional",
		{"owner_id": "settlement.probe.lod"}).get("duplicate", false)),
		"replayed transition identity is idempotent")
	var replay_conflict := regional.duplicate(true)
	replay_conflict["state"]["position"] = [9.0, 0.0, 3.0]
	_expect(SimulationLodManager.transition_subject(
		"resident.probe.ada", "regional", fixture, replay_conflict,
		"transition.probe.ada.local.regional",
		{"owner_id": "settlement.probe.lod"}).get("error") \
		== "transition_conflict",
		"changed replay payload is rejected as a transition conflict")

	var current: Dictionary = record.get("snapshot", {})
	for invariant in [
		"identity", "ownership", "quantities", "history", "irreversible",
	]:
		var changed := current.duplicate(true)
		if invariant == "history":
			(changed["history"] as Array).append({"event_id": "invented"})
		else:
			(changed[invariant] as Dictionary)["tampered"] = true
		_expect(SimulationLodManager.transition_subject(
			"resident.probe.ada", "distant", current, changed,
			"transition.invalid.%s" % invariant,
			{"owner_id": "settlement.probe.lod"}).get("error") \
			== "%s_changed" % invariant,
			"transition rejects changed %s" % invariant)
	_expect(SimulationLodManager.transition_subject(
		"resident.probe.ada", "distant", fixture, current,
		"transition.stale", {"owner_id": "settlement.probe.lod"}).get(
		"error") == "stale_owner_snapshot",
		"transition rejects a stale detailed owner snapshot")
	_expect(SimulationLodManager.transition_subject(
		"resident.probe.ada", "distant", current, current,
		"transition.owner.denied", {"owner_id": "settlement.other"}).get(
		"error") == "owner_mismatch",
		"only the authoritative owner may change representation")
	var distant := current.duplicate(true)
	distant["state"]["representation"] = "summary_record"
	_expect(bool(SimulationLodManager.transition_subject(
		"resident.probe.ada", "distant", current, distant,
		"transition.probe.ada.regional.distant",
		{"owner_id": "settlement.probe.lod"}).get("ok", false)),
		"regional record demotes deterministically to distant summary")
	var kernel := ProductionKernel.serialize_state()
	_expect((kernel.get("evidence", []) as Array).size() == 2 \
			and (kernel.get("events", []) as Array).size() == 2,
		"each committed representation change publishes evidence and event once")


func _test_bounded_catchup() -> void:
	var subject_id := "resident.probe.ada"
	var queued := SimulationLodManager.queue_catchup(
		subject_id, 95.0, "catchup.probe.ada.95")
	_expect(bool(queued.get("ok", false)) \
			and is_equal_approx(float(queued.get("pending_minutes", 0.0)), 95.0),
		"distant elapsed time queues against the persistent subject")
	_expect(bool(SimulationLodManager.queue_catchup(
		subject_id, 95.0, "catchup.probe.ada.95").get("duplicate", false)) \
			and is_equal_approx(
				SimulationLodManager.pending_catchup_minutes(subject_id), 95.0),
		"catch-up request identity prevents duplicate elapsed time")
	_expect(SimulationLodManager.queue_catchup(
		subject_id, 96.0, "catchup.probe.ada.95").get("error") \
		== "catchup_request_conflict",
		"changed replay minutes are rejected as a catch-up conflict")
	var distant_snapshot: Dictionary = SimulationLodManager.subject_record(
		subject_id).get("snapshot", {})
	_expect(SimulationLodManager.transition_subject(
		subject_id, "regional", distant_snapshot, distant_snapshot,
		"transition.premature.promotion",
		{"owner_id": "settlement.probe.lod"}).get("error") \
		== "catchup_required",
		"promotion is blocked by the reconciliation barrier")
	var planned := SimulationLodManager.plan_catchup(subject_id)
	var plan: Dictionary = planned.get("plan", {})
	_expect(bool(planned.get("ok", false)) \
			and (plan.get("steps", []) as Array).size() == 6 \
			and is_equal_approx(float(plan.get("planned_minutes", 0.0)), 90.0),
		"distant catch-up batches only full cadence steps within its budget")
	_expect(SimulationLodManager.plan_catchup(subject_id).get("error") \
		== "catchup_plan_open",
		"a subject cannot receive overlapping catch-up plans")
	_expect(SimulationLodManager.commit_catchup(
		str(plan.get("plan_id", "")), 90.0, distant_snapshot,
		{"owner_id": "settlement.probe.lod"}).get("error") \
		== "owner_validation_required",
		"unvalidated distant mutation cannot consume catch-up backlog")
	_expect(SimulationLodManager.commit_catchup(
		str(plan.get("plan_id", "")), 75.0, distant_snapshot, {
			"owner_id": "settlement.probe.lod",
			"owner_commit_validated": true,
		}).get("error") == "catchup_minutes_mismatch" \
			and is_equal_approx(
				SimulationLodManager.pending_catchup_minutes(subject_id), 95.0),
		"partial or mismatched commit cannot consume planned time")
	_expect(bool(SimulationLodManager.cancel_catchup(
		str(plan.get("plan_id", "")), "settlement.probe.lod").get("ok", false)) \
			and is_equal_approx(
				SimulationLodManager.pending_catchup_minutes(subject_id), 95.0),
		"cancelled two-phase plan leaves the owner backlog untouched")

	planned = SimulationLodManager.plan_catchup(subject_id)
	plan = planned.get("plan", {})
	var simulated := distant_snapshot.duplicate(true)
	(simulated["quantities"] as Dictionary)["health"] = 28.0
	(simulated["history"] as Array).append({"event_id": "history.probe.catchup"})
	var committed := SimulationLodManager.commit_catchup(
		str(plan.get("plan_id", "")), 90.0, simulated, {
			"owner_id": "settlement.probe.lod",
			"owner_commit_validated": true,
			"transaction_hash": "a".repeat(64),
		})
	_expect(bool(committed.get("ok", false)) \
			and is_equal_approx(float(committed.get("remaining_minutes", 0.0)), 5.0),
		"validated owner simulation atomically consumes exact planned minutes")
	_expect(SimulationLodManager.plan_catchup(subject_id).get("error") \
		== "catchup_below_cadence",
		"sub-cadence remainder waits instead of causing per-frame distant work")
	planned = SimulationLodManager.plan_catchup(subject_id, -1, true)
	plan = planned.get("plan", {})
	_expect((plan.get("steps", []) as Array) == [5.0],
		"explicit reconciliation plan may include the final bounded remainder")
	committed = SimulationLodManager.commit_catchup(
		str(plan.get("plan_id", "")), 5.0, simulated, {
			"owner_id": "settlement.probe.lod",
			"owner_commit_validated": true,
			"transaction_hash": "b".repeat(64),
		})
	_expect(bool(committed.get("ok", false)) \
			and SimulationLodManager.is_reconciled(subject_id),
		"final remainder clears the reconciliation barrier exactly")
	var ready_snapshot: Dictionary = SimulationLodManager.subject_record(
		subject_id).get("snapshot", {})
	var promoted := ready_snapshot.duplicate(true)
	promoted["state"]["representation"] = "regional_record"
	_expect(bool(SimulationLodManager.transition_subject(
		subject_id, "regional", ready_snapshot, promoted,
		"transition.probe.ada.promoted",
		{"owner_id": "settlement.probe.lod"}).get("ok", false)),
		"promotion succeeds only after bounded catch-up is reconciled")

	var dormant_id := "settlement.probe.dormant"
	var dormant_snapshot := _snapshot(dormant_id)
	dormant_snapshot["ownership"]["settlement_id"] = dormant_id
	_expect(bool(SimulationLodManager.register_subject(
		dormant_id, "settlement", dormant_id, "region.probe", "dormant",
		dormant_snapshot).get("ok", false)),
		"dormant scheduled subject registers without a live node")
	var clamped := SimulationLodManager.queue_catchup(
		dormant_id, 50000.0, "catchup.probe.clamped")
	_expect(bool(clamped.get("clamped", false)) \
			and is_equal_approx(float(clamped.get("accepted_minutes", 0.0)),
				SimulationLodManager.MAX_PENDING_CATCHUP_MINUTES) \
			and float(clamped.get("dropped_minutes", 0.0)) > 0.0,
		"offline elapsed time is capped rather than simulated without bound")
	var work := SimulationLodManager.plan_ready_work(8, 32)
	var plans: Array = work.get("plans", [])
	_expect(int(work.get("planned_steps", 0)) <= 32 \
			and plans.size() == 1 \
			and (plans[0].get("steps", []) as Array).size() == 4 \
			and is_equal_approx(float(plans[0].get(
				"planned_minutes", 0.0)), 240.0),
		"global pass and dormant-mode budgets cap scheduled workload")


func _test_persistence() -> void:
	SimulationLodManager.advance_runtime_minutes(0.35)
	var saved := SimulationLodManager.serialize_state()
	var kernel_saved := ProductionKernel.serialize_state()
	_expect(str(saved.get("schema", "")) \
			== "leyforge.simulation-lod-state" \
			and str(saved.get("state_hash", "")).length() == 64,
		"LOD save domain declares schema and canonical state hash")
	var saved_dormant: Dictionary = {}
	for record_value in saved.get("subjects", []):
		if str(record_value.get("subject_id", "")) \
				== "settlement.probe.dormant":
			saved_dormant = record_value
	_expect(str(saved_dormant.get("reconciliation_state", "")) == "queued" \
			and float(saved_dormant.get("pending_catchup_minutes", 0.0)) > 0.0,
		"open work plan serializes as recoverable backlog rather than in-flight state")
	var json_state: Variant = JSON.parse_string(JSON.stringify(saved))
	var expected_subjects := SimulationLodManager.subject_ids()
	ProductionKernel.reset_for_verification()
	SimulationLodManager.reset()
	_expect(ProductionKernel.restore_state(kernel_saved),
		"shared LOD evidence restores before the representation domain")
	_expect(SimulationLodManager.restore_state(
		json_state, 88117, "world.simulation.lod.probe"),
		"simulation LOD state survives JSON save round-trip")
	_expect(SimulationLodManager.subject_ids() == expected_subjects \
			and SimulationLodManager.has_subject("resident.probe.ada"),
		"save round-trip preserves every stable subject identity")
	_expect(not SimulationLodManager.is_reconciled("settlement.probe.dormant") \
			and bool(SimulationLodManager.plan_catchup(
				"settlement.probe.dormant").get("ok", false)),
		"restored backlog can be replanned with no persisted open transaction")
	var before := SimulationLodManager.serialize_state()
	var tampered: Dictionary = json_state.duplicate(true)
	tampered["subjects"][0]["pending_catchup_minutes"] = 999.0
	_expect(not SimulationLodManager.restore_state(
		tampered, 88117, "world.simulation.lod.probe") \
			and SimulationLodManager.serialize_state() == before,
		"tampered LOD state hash is rejected atomically")
	_expect(not SimulationLodManager.restore_state(
		json_state, 7, "world.simulation.lod.probe") \
			and SimulationLodManager.serialize_state() == before,
		"wrong-seed LOD state is rejected without mutation")
	_expect(not SimulationLodManager.restore_state(
		json_state, 88117, "world.other") \
			and SimulationLodManager.serialize_state() == before,
		"wrong-world LOD state is rejected without mutation")


func _test_settlement_owner_integration() -> void:
	ProductionKernel.reset_for_verification()
	SimulationLodManager.reset()
	StructureManager.reset()
	SettlementManager.reset()
	PoliticalManager.reset()
	var seed_value := 557799
	SimulationLodManager.initialize(seed_value, "world.lod.settlement.integration")
	StructureManager.initialize(seed_value, "world.lod.settlement.integration")
	var anchors := {
		"hamlet": Vector2i(0, 0),
		"warehouse": Vector2i(6, 0),
		"watchtower_site": Vector2i(10, 0),
		"goblin_camp": Vector2i(120, 0),
	}
	HamletState.initialized = false
	HamletState.initialize(seed_value, anchors)
	CombatState.initialized = false
	CombatState.initialize(seed_value, anchors)
	_expect(SettlementManager.initialize_legacy(seed_value),
		"settlement integration fixture initializes focused owner record")
	SettlementManager.refresh_lod_subjects()
	var focused_id := SettlementManager.focused_settlement_id
	_expect(SimulationLodManager.has_subject(focused_id) \
			and str(SimulationLodManager.subject_record(focused_id).get(
				"lod_mode", "")) == "local" \
			and not (SimulationLodManager.subject_record(focused_id).get(
				"snapshot", {}).get("state", {}).get(
					"political_owner", {}).get("governments", []) as Array).is_empty() \
			and not (SimulationLodManager.subject_record(focused_id).get(
				"snapshot", {}).get("state", {}).get(
					"movement_owner", {}) as Dictionary).is_empty() \
			and int(SimulationLodManager.subject_record(focused_id).get(
				"snapshot", {}).get("state", {}).get(
					"movement_summary", {}).get("mover_count", 0)) > 0,
		"focused settlement registers local presence with political and movement owner projections")
	var npc_id := HamletState.get_npc_ids()[0]
	var npc_snapshot := HamletState.npc_lod_snapshot(npc_id)
	_expect(bool(SimulationLodManager.validate_snapshot(
		npc_snapshot).get("ok", false)) \
			and str(npc_snapshot.get("identity", {}).get(
				"resident_id", "")) == npc_id \
			and str(npc_snapshot.get("ownership", {}).get(
				"movement_record_ref", "")).begins_with("movement.runtime.") \
			and not (npc_snapshot.get("state", {}).get(
				"movement_owner_state", {}) as Dictionary).is_empty(),
		"Hamlet owner exposes a valid stable resident LOD snapshot with movement ownership")
	_expect((npc_snapshot.get("quantities", {}).get(
		"personal_inventory", []) as Array).size() == 8 \
			and npc_snapshot.get("ownership", {}).has("household_id"),
		"resident snapshot covers inventory quantities and persistent household ownership")

	var far_id := "settlement.probe.far"
	var far_record := SettlementManager.get_focused_settlement().duplicate(true)
	far_record["settlement_id"] = far_id
	far_record["site_id"] = "site.probe.far"
	far_record["is_starter"] = false
	far_record["simulation_mode"] = "far"
	far_record["lod_mode"] = "distant"
	var far_state: Dictionary = far_record.get("hamlet_state", {}).duplicate(true)
	far_state["village_id"] = far_id
	var buildings := [
		_runtime_building("farm.probe", "building.food.basic_farm_plot", far_id),
		_runtime_building("lumber.probe", "building.extraction.lumber_camp", far_id, {
			"resource_zone_id": "resource_zone.forest.probe",
			"resource_zone_active": true,
		}),
	]
	far_state["runtime_buildings"] = {
		"farm.probe": buildings[0],
		"lumber.probe": buildings[1],
	}
	far_record["hamlet_state"] = far_state
	far_record["resource_ledger"] = {}
	SettlementManager.settlements[far_id] = far_record
	SettlementManager.refresh_lod_subjects()
	_expect(SimulationLodManager.subject_count() == 2 \
			and str(SimulationLodManager.subject_record(far_id).get(
				"lod_mode", "")) == "distant",
		"record-only settlement registers as distant presence without a node")
	var expected := SettlementSimulationEngine.simulate(
		buildings, {}, 120.0, SettlementSimulationEngine.MODE_FAR)
	SettlementManager.advance_far_simulation(120.0)
	var simulated_record := SettlementManager.get_settlement(far_id)
	_expect(simulated_record.get("resource_ledger", {}) \
			== expected.get("ledger", {}),
		"bounded distant settlement work matches deterministic owner kernel")
	_expect(SimulationLodManager.is_reconciled(far_id) \
			and (SimulationLodManager.subject_record(far_id).get(
				"catchup_history", []) as Array).size() == 1,
		"validated settlement transaction commits exact catch-up and clears backlog")
	_expect(str(simulated_record.get("simulation_mode", "")) == "far" \
			and int(simulated_record.get("last_simulation_tick", -1)) == 0,
		"owner record retains distant compatibility mode and authoritative time reference")
	var before_quantities: Dictionary = SimulationLodManager.subject_record(far_id).get(
		"snapshot", {}).get("quantities", {})
	_expect(before_quantities.get("resource_ledger", {}) \
			== simulated_record.get("resource_ledger", {}),
		"LOD snapshot reconciles quantities back to settlement owner truth")
	SimulationLodManager.queue_catchup(far_id, 300.0, "catchup.focus.barrier")
	_expect(not SettlementManager.focus_settlement(far_id) \
			and is_equal_approx(
				SimulationLodManager.pending_catchup_minutes(far_id), 180.0) \
			and SettlementManager.focused_settlement_id == focused_id,
		"focus promotion processes one bounded pass and keeps old owner active until reconciled")


func _runtime_building(
		instance_id: String,
		definition_id: String,
		owner_id: String,
		extra: Dictionary = {}) -> Dictionary:
	var record := {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"blueprint_id": "",
		"owner_id": owner_id,
		"condition": 1.0,
		"staffing": 1.0,
		"inputs_available": 1.0,
		"access": 1.0,
		"utilities": 1.0,
		"suitability": 1.0,
		"active": true,
		"buffers": {},
		"history": [],
	}
	record.merge(extra, true)
	return record


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
