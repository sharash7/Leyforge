extends Node

var failures: Array[String] = []
var checks := 0
var structure_id := ""
var structure_evidence_id := ""


func _ready() -> void:
	call_deferred("_run")


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	ProductionKernel.reset_for_verification()
	EventManager.reset()
	SettlementManager.reset()
	StructureManager.reset()
	_setup_owned_subjects()
	EventManager.initialize(4242, "world.event.probe")

	_test_validation_and_identity_binding()
	_test_event_history_and_consequences()
	_test_quest_evidence_and_statuses()
	_test_quest_graph_branching_and_contribution()
	_test_event_lifecycle_and_atomicity()
	_test_persistence_and_history_bound()

	print("EVENT_OWNER_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"event_count": EventManager.event_ids().size(),
		"quest_count": EventManager.quest_ids().size(),
		"history_count": EventManager.get_recent_history(1024).size(),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _setup_owned_subjects() -> void:
	_restore_settlement_fixture()
	StructureManager.initialize(4242, "world.event.probe")
	var seeded := StructureManager.register_seeded_structure({
		"world_seed": 4242,
		"world_id": "world.event.probe",
		"settlement_id": "settlement.probe",
		"owner_id": "settlement.probe",
		"anchor_id": "warehouse",
		"definition_id": "building.storage.village_warehouse",
		"position": [3, 9],
		"generation_evidence": "event.owner.probe",
	})
	structure_id = StructureManager.seeded_structure_instance_id(
		"settlement.probe", "warehouse")
	structure_evidence_id = str(seeded.get("evidence_id", ""))
	_expect(bool(seeded.get("ok", false)) and StructureManager.has_structure(
		structure_id), "probe fixture registers a real StructureInstance identity")


func _restore_settlement_fixture() -> void:
	SettlementManager.world_seed = 4242
	SettlementManager.settlements["settlement.probe"] = {
		"settlement_id": "settlement.probe",
	}
	SettlementManager.initialized = true


func _test_validation_and_identity_binding() -> void:
	_expect(EventManager.register_event({
		"event_id": "event.probe.invalid.status",
		"status": "finished",
	}).get("error") == "event.invalid_status",
		"EVT-001 rejects invalid event status instead of normalising it")
	_expect(EventManager.register_event({
		"event_id": "event.probe.invalid.refs",
		"definition_ref": "leyforge.core.event.invalid_refs",
		"participant_refs": ["actor.player", 42],
	}).get("error") == "event.invalid_participant_refs",
		"EVT-001 rejects malformed canonical reference arrays")
	var missing_identity := EventManager.register_event({
		"event_id": "event.probe.missing.identity",
		"definition_ref": "leyforge.core.event.missing_identity",
		"settlement_ref": "settlement.does_not_exist",
		"participant_refs": ["settlement.does_not_exist"],
	})
	_expect(missing_identity.get("error") == "event.identity_not_found"
			and not EventManager.has_event("event.probe.missing.identity"),
		"EVT-001 rejects subject bindings that do not resolve through their owner")
	_expect(EventManager.register_quest({
		"quest_id": "quest.probe.no.definition",
		"status": "active",
	}).get("error") == "quest.definition_ref_required",
		"EVT-001 requires every Quest Instance to retain a stable definition ref")
	_expect(EventManager.register_quest({
		"quest_id": "quest.probe.invalid.graph",
		"definition_ref": "leyforge.core.quest.invalid_graph",
		"status": "active",
		"objective_records": [{
			"objective_id": "objective.invalid",
			"stage_ref": "stage.start",
		}],
		"stage_records": [{
			"stage_id": "stage.start",
			"status": "active",
			"objective_refs": ["objective.invalid"],
			"next_stage_refs": ["stage.missing"],
		}],
	}).get("error") == "quest.next_stage_missing",
		"EVT-001 rejects quest graphs with dangling stage edges")
	_expect(EventManager.register_quest({
		"quest_id": "quest.probe.invalid.completed",
		"definition_ref": "leyforge.core.quest.invalid_completed",
		"status": "completed",
		"objective_records": [{"objective_id": "objective.open"}],
	}).get("error") == "quest.completed_with_open_objective",
		"EVT-001 rejects completed quests that still have open objectives")


func _test_event_history_and_consequences() -> void:
	var registered := EventManager.register_event(_raid_warning_payload())
	_expect(bool(registered.get("ok", false))
			and str(registered.get("event_id", "")) == "event.probe.raid",
		"EVT-001 registers a canonical Event Instance")
	_expect(bool(EventManager.register_event(_raid_warning_payload()).get(
		"duplicate", false)), "EVT-001 suppresses exact event replays")
	var canonical := EventManager.get_event("event.probe.raid")
	_expect(str(canonical.get("event_family", "")) == "raid"
			and str(canonical.get("phase", "")) == "warning",
		"Event Instances retain their family and lifecycle phase")
	_expect((canonical.get("identity_bindings", []) as Array).has({
		"kind": "settlement", "ref": "settlement.probe", "role": ""}),
		"Event Instances persist their resolved typed subject bindings")

	var consequence := EventManager.attach_consequence({
		"event_id": "event.probe.raid",
		"transaction_id": "event.probe.raid.damage",
		"consequence_ref": "structure.damage.probe.1",
		"owner_ref": structure_id,
		"kind": "structure_damage",
		"evidence_ref": structure_evidence_id,
		"metadata": {"amount": 0.1},
	})
	_expect(bool(consequence.get("ok", false))
			and (EventManager.get_event("event.probe.raid").get(
				"consequence_refs", []) as Array).size() == 1,
		"EVT-001 binds consequences to a real owner and evidence record")
	_expect(bool(EventManager.attach_consequence({
		"event_id": "event.probe.raid",
		"transaction_id": "event.probe.raid.damage",
		"consequence_ref": "structure.damage.probe.1",
		"owner_ref": structure_id,
		"kind": "structure_damage",
		"evidence_ref": structure_evidence_id,
		"metadata": {"amount": 0.1},
	}).get("duplicate", false)),
		"EVT-001 suppresses duplicate consequence attachments")
	_expect(EventManager.attach_consequence({
		"event_id": "event.probe.raid",
		"transaction_id": "event.probe.raid.damage",
		"consequence_ref": "structure.damage.probe.1",
		"owner_ref": structure_id,
		"kind": "structure_damage",
		"evidence_ref": structure_evidence_id,
		"metadata": {"amount": 0.2},
	}).get("error") == "event.transaction_conflict"
			and (EventManager.get_event("event.probe.raid").get(
				"consequence_refs", []) as Array).size() == 1,
		"a reused consequence transaction cannot overwrite committed semantics")
	_expect(EventManager.attach_consequence({
		"event_id": "event.probe.raid",
		"consequence_ref": "structure.damage.missing",
		"owner_ref": "structure_instance.missing",
		"kind": "structure_damage",
	}).get("error") == "event.consequence_owner_not_found",
		"world consequences cannot point at a missing specialist owner record")

	var history := EventManager.record_history_entry({
		"history_id": "history.probe.raid.note",
		"transaction_id": "history.probe.raid.note",
		"kind": "raid",
		"title": "Probe Raid Warning",
		"summary": "Warning entered the Chronicle.",
		"event_ref": "event.probe.raid",
		"settlement_ref": "settlement.probe",
		"tags": ["raid", "warning"],
	})
	_expect(bool(history.get("ok", false))
			and EventManager.has_history("history.probe.raid.note"),
		"EVT-001 appends validated Chronicle entries")
	_expect(EventManager.record_history_entry({
		"history_id": "history.probe.orphan",
		"event_ref": "event.missing",
		"settlement_ref": "settlement.probe",
	}).get("error") == "history.event_not_found",
		"Chronicle entries cannot retain an orphan event reference")


func _test_quest_evidence_and_statuses() -> void:
	var quest := EventManager.register_quest({
		"quest_id": "quest.probe.basic",
		"transaction_id": "quest.probe.basic",
		"definition_ref": "leyforge.core.quest.observe_raid",
		"definition_revision": 3,
		"status": "active",
		"owner_scope_ref": "settlement.probe",
		"objective_records": [{
			"objective_id": "objective.warning",
			"kind": "observe_event",
			"status": "active",
			"required_event_families": ["raid"],
		}],
	})
	_expect(bool(quest.get("ok", false))
			and (EventManager.get_quest("quest.probe.basic").get(
				"stage_records", []) as Array).size() == 1,
		"EVT-001 materialises a default quest graph for a flat legacy objective")
	var advanced := EventManager.advance_quest_from_event({
		"quest_id": "quest.probe.basic",
		"transaction_id": "quest.advance.probe.basic",
		"objective_id": "objective.warning",
		"event_ref": "event.probe.raid",
	})
	_expect(bool(advanced.get("ok", false))
			and str(EventManager.get_quest("quest.probe.basic").get(
				"status", "")) == "completed",
		"EVT-001 advances an objective from a canonical event record")
	_expect(bool(EventManager.advance_quest_from_event({
		"quest_id": "quest.probe.basic",
		"transaction_id": "quest.advance.probe.basic",
		"objective_id": "objective.warning",
		"event_ref": "event.probe.raid",
	}).get("duplicate", false)),
		"completed quest advancement remains idempotent")

	var family_quest := EventManager.register_quest({
		"quest_id": "quest.probe.family",
		"definition_ref": "leyforge.core.quest.settlement_event",
		"status": "active",
		"objective_records": [{
			"objective_id": "objective.settlement.only",
			"required_event_families": ["settlement"],
		}],
	})
	var family_mismatch := EventManager.advance_quest_from_event({
		"quest_id": "quest.probe.family",
		"objective_id": "objective.settlement.only",
		"event_ref": "event.probe.raid",
	})
	_expect(bool(family_quest.get("ok", false))
			and family_mismatch.get("error") == "quest.event_family_mismatch",
		"EVT-001 enforces objective event-family requirements")
	var predicate_quest := EventManager.register_quest({
		"quest_id": "quest.probe.predicate",
		"definition_ref": "leyforge.core.quest.canonical_predicate",
		"status": "active",
		"objective_records": [{
			"objective_id": "objective.canonical.only",
			"required_event_families": ["raid"],
			"required_predicates": ["caller_spoof"],
		}],
	})
	var predicate_mismatch := EventManager.advance_quest_from_event({
		"quest_id": "quest.probe.predicate",
		"objective_id": "objective.canonical.only",
		"event_ref": "event.probe.raid",
		"satisfied_predicates": ["caller_spoof"],
	})
	_expect(bool(predicate_quest.get("ok", false))
			and predicate_mismatch.get("error") == "quest.predicates_unsatisfied",
		"caller-supplied predicate claims cannot advance a quest")

	var arrival_evidence := ProductionKernel.make_evidence_envelope(
		"evidence.movement.arrival.probe", "set30.movement", "arrival",
		"a".repeat(64), "journey.probe")
	_expect(bool(ProductionKernel.commit_evidence(arrival_evidence).get("ok", false)),
		"probe fixture commits authoritative movement evidence")
	var evidence_quest := EventManager.register_quest({
		"quest_id": "quest.probe.evidence",
		"definition_ref": "leyforge.core.quest.arrive",
		"status": "active",
		"objective_records": [{
			"objective_id": "objective.arrive",
			"required_evidence_types": ["arrival"],
			"required_evidence_owners": ["set30.movement"],
		}],
	})
	var evidence_advance := EventManager.advance_quest_from_evidence({
		"quest_id": "quest.probe.evidence",
		"objective_id": "objective.arrive",
		"evidence_ref": "evidence.movement.arrival.probe",
	})
	_expect(bool(evidence_quest.get("ok", false))
			and bool(evidence_advance.get("ok", false))
			and str(EventManager.get_quest("quest.probe.evidence").get(
				"status", "")) == "completed",
		"quest objectives consume evidence from the canonical specialist owner")
	_expect(bool(EventManager.advance_quest_from_evidence({
		"quest_id": "quest.probe.evidence",
		"objective_id": "objective.arrive",
		"evidence_ref": "evidence.movement.arrival.probe",
	}).get("duplicate", false)),
		"the same authoritative evidence cannot complete an objective twice")

	var failed_quest := EventManager.register_quest({
		"quest_id": "quest.probe.failed",
		"definition_ref": "leyforge.core.quest.failure",
		"status": "active",
		"objective_records": [{
			"objective_id": "objective.fail",
			"required_event_families": ["raid"],
		}],
	})
	var failed_advance := EventManager.advance_quest_from_event({
		"quest_id": "quest.probe.failed",
		"objective_id": "objective.fail",
		"event_ref": "event.probe.raid",
		"objective_status": "failed",
	})
	_expect(bool(failed_quest.get("ok", false)) and bool(failed_advance.get("ok", false))
			and str(EventManager.get_quest("quest.probe.failed").get(
				"status", "")) == "failed",
		"a failed objective derives a failed quest rather than active")
	var blocked_quest := EventManager.register_quest({
		"quest_id": "quest.probe.blocked",
		"definition_ref": "leyforge.core.quest.blocked",
		"status": "active",
		"objective_records": [{
			"objective_id": "objective.block",
			"required_event_families": ["raid"],
		}],
	})
	var blocked_advance := EventManager.advance_quest_from_event({
		"quest_id": "quest.probe.blocked",
		"objective_id": "objective.block",
		"event_ref": "event.probe.raid",
		"objective_status": "blocked",
	})
	_expect(bool(blocked_quest.get("ok", false))
			and bool(blocked_advance.get("ok", false))
			and str(EventManager.get_quest("quest.probe.blocked").get(
				"status", "")) == "blocked",
		"a blocked objective derives a blocked quest rather than active")


func _test_quest_graph_branching_and_contribution() -> void:
	var graph_quest := EventManager.register_quest({
		"quest_id": "quest.probe.graph",
		"definition_ref": "leyforge.core.quest.raid_aftermath",
		"definition_revision": 4,
		"source_arc_ref": "arc.leyforge.probe",
		"status": "active",
		"owner_scope_ref": "settlement.probe",
		"objective_records": [{
			"objective_id": "objective.observe",
			"stage_ref": "stage.observe",
			"required_event_families": ["raid"],
		}, {
			"objective_id": "objective.repair",
			"stage_ref": "stage.repair",
			"required_event_families": ["settlement"],
		}, {
			"objective_id": "objective.leave",
			"stage_ref": "stage.leave",
			"required_event_families": ["departure"],
		}],
		"stage_records": [{
			"stage_id": "stage.observe",
			"status": "active",
			"objective_refs": ["objective.observe"],
			"next_stage_refs": ["stage.repair", "stage.leave"],
			"branch_options": [{
				"branch_id": "repair",
				"next_stage_ref": "stage.repair",
			}, {
				"branch_id": "leave",
				"next_stage_ref": "stage.leave",
			}],
		}, {
			"stage_id": "stage.repair",
			"status": "locked",
			"objective_refs": ["objective.repair"],
			"next_stage_refs": [],
		}, {
			"stage_id": "stage.leave",
			"status": "locked",
			"objective_refs": ["objective.leave"],
			"next_stage_refs": [],
		}],
		"current_stage_ref": "stage.observe",
	})
	var observed := EventManager.advance_quest_from_event({
		"quest_id": "quest.probe.graph",
		"objective_id": "objective.observe",
		"event_ref": "event.probe.raid",
	})
	_expect(bool(graph_quest.get("ok", false)) and bool(observed.get("ok", false))
			and str(EventManager.get_quest("quest.probe.graph").get(
				"status", "")) == "branch_pending",
		"completing a branching stage persists a branch-pending graph state")
	var branch := EventManager.choose_quest_branch({
		"quest_id": "quest.probe.graph",
		"branch_id": "repair",
	})
	_expect(bool(branch.get("ok", false))
			and str(EventManager.get_quest("quest.probe.graph").get(
				"current_stage_ref", "")) == "stage.repair",
		"a branch decision activates exactly its selected next stage")
	_expect(bool(EventManager.choose_quest_branch({
		"quest_id": "quest.probe.graph",
		"branch_id": "repair",
	}).get("duplicate", false)),
		"branch decisions are idempotent")

	var settlement_event := EventManager.register_event({
		"event_id": "event.probe.settlement.repaired",
		"definition_ref": "leyforge.core.event.settlement.repaired",
		"event_family": "settlement",
		"event_type": "repair_complete",
		"status": "resolved",
		"phase": "resolution",
		"source_owner": "document20.settlement",
		"settlement_ref": "settlement.probe",
		"participant_refs": ["settlement.probe"],
		"title": "Repair Complete",
		"summary": "The settlement repair completed.",
	})
	_expect(bool(settlement_event.get("ok", false))
			and str(EventManager.get_quest("quest.probe.graph").get(
				"status", "")) == "completed",
		"new canonical events automatically advance matching active quest stages")
	var graph_state := EventManager.get_quest("quest.probe.graph")
	_expect((graph_state.get("branch_decision_records", []) as Array).size() == 1
			and str(graph_state.get("definition_ref", "")) ==
				"leyforge.core.quest.raid_aftermath"
			and int(graph_state.get("definition_revision", 0)) == 4,
		"Quest Instances retain branch history and frozen definition revision")

	var contribution := EventManager.record_quest_contribution({
		"quest_id": "quest.probe.graph",
		"contribution_id": "contribution.probe.player.repair",
		"contributor_kind": "player",
		"contributor_ref": "player.local",
		"contribution_type": "repair",
		"evidence_refs": [structure_evidence_id],
		"significance_band": "major",
	})
	_expect(bool(contribution.get("ok", false))
			and (EventManager.get_quest("quest.probe.graph").get(
				"contribution_records", []) as Array).size() == 1,
		"EVT-001 persists contribution credit backed by canonical evidence")
	_expect(bool(EventManager.record_quest_contribution({
		"quest_id": "quest.probe.graph",
		"contribution_id": "contribution.probe.player.repair",
		"contributor_kind": "player",
		"contributor_ref": "player.local",
		"contribution_type": "repair",
		"evidence_refs": [structure_evidence_id],
		"significance_band": "major",
	}).get("duplicate", false)),
		"contribution evidence cannot be credited twice")
	var reward_committing := EventManager.transition_reward_claim({
		"quest_id": "quest.probe.graph",
		"reward_claim_state": "committing",
	})
	var reward_claimed := EventManager.transition_reward_claim({
		"quest_id": "quest.probe.graph",
		"reward_claim_state": "claimed",
		"evidence_refs": [structure_evidence_id],
	})
	_expect(bool(reward_committing.get("ok", false))
			and bool(reward_claimed.get("ok", false))
			and str(EventManager.get_quest("quest.probe.graph").get(
				"reward_claim_state", "")) == "claimed",
		"reward claim state commits transactionally after owner evidence exists")
	_expect(bool(EventManager.transition_reward_claim({
		"quest_id": "quest.probe.graph",
		"reward_claim_state": "claimed",
		"evidence_refs": [structure_evidence_id],
	}).get("duplicate", false)),
		"claimed rewards cannot be committed twice")


func _test_event_lifecycle_and_atomicity() -> void:
	var phase_advance := EventManager.advance_event_phase({
		"event_id": "event.probe.raid",
		"phase": "initiation",
		"history_id": "history.event.probe.raid.initiation",
	})
	_expect(bool(phase_advance.get("ok", false))
			and str(EventManager.get_event("event.probe.raid").get(
				"phase", "")) == "initiation",
		"an Event Instance advances through its canonical lifecycle")
	_expect(EventManager.advance_event_phase({
		"event_id": "event.probe.raid",
		"phase": "warning",
	}).get("error") == "event.invalid_phase_transition",
		"event lifecycle phases cannot regress")
	var resolved := EventManager.resolve_event({
		"event_id": "event.probe.raid",
		"status": "resolved",
	})
	_expect(bool(resolved.get("ok", false))
			and str(EventManager.get_event("event.probe.raid").get(
				"phase", "")) == "resolution",
		"event resolution advances status and lifecycle together")
	_expect(EventManager.resolve_event({
		"event_id": "event.probe.raid",
		"status": "active",
	}).get("error") == "event.invalid_transition",
		"resolved events cannot regress to active")

	var reserved_history := EventManager.record_history_entry({
		"history_id": "history.atomic.reserved",
		"kind": "probe",
		"title": "Reserved",
		"summary": "A conflicting Chronicle identity.",
		"settlement_ref": "settlement.probe",
	})
	var history_conflict := EventManager.register_event({
		"event_id": "event.atomic.history_conflict",
		"transaction_id": "event.atomic.history_conflict",
		"definition_ref": "leyforge.core.event.atomicity",
		"event_family": "probe",
		"event_type": "atomicity",
		"settlement_ref": "settlement.probe",
		"history_id": "history.atomic.reserved",
		"title": "Different",
		"summary": "Must not partially commit.",
	})
	_expect(bool(reserved_history.get("ok", false))
			and history_conflict.get("error") == "history.conflict"
			and not EventManager.has_event("event.atomic.history_conflict"),
		"event and Chronicle creation preflight atomically")

	var kernel_conflict_evidence := ProductionKernel.make_evidence_envelope(
		"evidence.kernel.publication.conflict", "probe.other", "occupied",
		"b".repeat(64), "publication.conflict")
	ProductionKernel.commit_evidence(kernel_conflict_evidence)
	ProductionKernel.publish_event("publication.atomic.conflict", "probe.other",
		"occupied", "b".repeat(64), ["evidence.kernel.publication.conflict"])
	var kernel_conflict := EventManager.register_event({
		"event_id": "event.atomic.kernel_conflict",
		"transaction_id": "event.atomic.kernel_conflict",
		"definition_ref": "leyforge.core.event.atomicity",
		"publication_id": "publication.atomic.conflict",
		"event_family": "probe",
		"event_type": "atomicity",
		"settlement_ref": "settlement.probe",
	})
	_expect(kernel_conflict.get("error") == "event_conflict"
			and not EventManager.has_event("event.atomic.kernel_conflict")
			and not ProductionKernel.has_evidence(
				"evidence.event.atomic.kernel_conflict")
			and ProductionKernel.get_transaction(
				"event.atomic.kernel_conflict").is_empty(),
		"kernel evidence, transaction and publication commit as one atomic bundle")


func _test_persistence_and_history_bound() -> void:
	var saved := EventManager.serialize_state()
	_expect(str(saved.get("schema", "")) == EventManager.STATE_SCHEMA
			and int(saved.get("version", 0)) == EventManager.STATE_VERSION
			and str(saved.get("state_hash", "")).length() == 64,
		"EVT-001 serializes a versioned hashed authoritative state payload")
	var json_round_trip: Variant = JSON.parse_string(JSON.stringify(saved))
	EventManager.reset()
	SettlementManager.reset()
	_expect(EventManager.restore_state(
			json_round_trip, 4242, "world.event.probe", ["settlement.probe"])
			and EventManager.has_event("event.probe.raid")
			and str(EventManager.get_quest("quest.probe.graph").get(
				"current_stage_ref", "")) == "stage.repair",
		"quest graph and events restore against saved identities before settlement materialisation")
	_restore_settlement_fixture()
	var before_invalid := EventManager.serialize_state()
	var invalid_state: Dictionary = before_invalid.duplicate(true)
	var invalid_events: Array = invalid_state.get("events", []).duplicate(true)
	var invalid_event: Dictionary = invalid_events[0].duplicate(true)
	invalid_event["status"] = "corrupted"
	invalid_events[0] = invalid_event
	invalid_state["events"] = invalid_events
	_expect(not EventManager.restore_state(invalid_state, 4242, "world.event.probe")
			and EventManager.serialize_state() == before_invalid,
		"a rejected restore leaves the live EVT state completely unchanged")
	var duplicate_state: Dictionary = before_invalid.duplicate(true)
	var duplicate_events: Array = duplicate_state.get("events", []).duplicate(true)
	duplicate_events.append(duplicate_events[0].duplicate(true))
	duplicate_state["events"] = duplicate_events
	duplicate_state["state_hash"] = _state_hash(duplicate_state)
	_expect(not EventManager.restore_state(
			duplicate_state, 4242, "world.event.probe")
			and EventManager.serialize_state() == before_invalid,
		"restore rejects duplicate identities atomically even with a valid state hash")
	var orphan_state: Dictionary = before_invalid.duplicate(true)
	var orphan_history: Array = orphan_state.get("history", []).duplicate(true)
	var orphan_entry: Dictionary = orphan_history[0].duplicate(true)
	orphan_entry["event_ref"] = "event.missing.after.save"
	orphan_entry["state_hash"] = _record_hash(orphan_entry)
	orphan_history[0] = orphan_entry
	orphan_state["history"] = orphan_history
	orphan_state["state_hash"] = _state_hash(orphan_state)
	_expect(not EventManager.restore_state(orphan_state, 4242, "world.event.probe")
			and EventManager.serialize_state() == before_invalid,
		"restore rejects dangling cross-record references atomically")
	_expect(not EventManager.restore_state(json_round_trip, 9999, "world.event.probe"),
		"EVT-001 rejects incompatible world seeds during restore")

	for index in range(EventManager.MAX_HISTORY_ENTRIES + 4):
		EventManager.record_history_entry({
			"history_id": "history.bound.%04d" % index,
			"transaction_id": "history.bound.%04d" % index,
			"kind": "bounded_probe",
			"title": "Bounded history",
			"summary": "Bounded Chronicle entry %d." % index,
			"settlement_ref": "settlement.probe",
		})
	var bounded := EventManager.serialize_state()
	_expect((bounded.get("history", []) as Array).size() ==
			EventManager.MAX_HISTORY_ENTRIES
			and int(bounded.get("archived_history_count", 0)) >= 4
			and str(bounded.get("archived_history_hash", "")).length() == 64,
		"Chronicle memory is bounded while pruned history retains a hash-chain summary")
	var bounded_round_trip: Variant = JSON.parse_string(JSON.stringify(bounded))
	EventManager.reset()
	_expect(EventManager.restore_state(
			bounded_round_trip, 4242, "world.event.probe")
			and EventManager.get_recent_history(
				EventManager.MAX_HISTORY_ENTRIES + 1).size() ==
				EventManager.MAX_HISTORY_ENTRIES,
			"bounded Chronicle state and archive summary survive save/load")
	var legacy_state := _legacy_v1_state()
	EventManager.reset()
	_expect(EventManager.restore_state(legacy_state, 4242, "world.event.probe")
			and int(EventManager.get_event("event.legacy.probe").get(
				"version", 0)) == EventManager.STATE_VERSION
			and (EventManager.get_quest("quest.legacy.probe").get(
				"stage_records", []) as Array).size() == 1,
		"v1 Event and Quest Instances migrate to the v2 graph schema")
	_expect(str(EventManager.get_quest("quest.legacy.probe").get(
			"definition_ref", "")) == "leyforge.legacy.quest.probe"
			and str(EventManager.get_event("event.legacy.probe").get(
				"phase", "")) == "resolution",
		"migration preserves frozen quest definitions and derives event lifecycle")


func _raid_warning_payload() -> Dictionary:
	return {
		"event_id": "event.probe.raid",
		"transaction_id": "event.probe.raid",
		"definition_ref": "leyforge.core.event.raid",
		"definition_revision": 2,
		"atlas_foundation_ref": "EVT-001",
		"event_family": "raid",
		"event_type": "raid",
		"status": "active",
		"phase": "warning",
		"source_owner": "document16.combat",
		"settlement_ref": "settlement.probe",
		"participant_refs": ["actor.player", "settlement.probe"],
		"evidence_predicates": ["warning_acknowledged"],
		"metadata": {"raid_serial": 1},
		"title": "Probe Raid Warning",
		"summary": "Event probe warning created.",
	}


func _legacy_v1_state() -> Dictionary:
	var event := {
		"record_type": "EventRecord",
		"version": 1,
		"event_id": "event.legacy.probe",
		"event_family": "legacy",
		"event_type": "resolved",
		"status": "resolved",
		"source_owner": "legacy.probe",
		"world_seed": 4242,
		"world_id": "world.event.probe",
		"settlement_ref": "settlement.probe",
		"structure_refs": [],
		"participant_refs": ["settlement.probe"],
		"location": {},
		"time_ref": ProductionKernel.world_time_reference(),
		"source_evidence_refs": [],
		"consequence_refs": [],
		"history_entry_refs": ["history.event.legacy.probe"],
		"metadata": {"legacy_import": true},
		"revision": 1,
		"created_tick": 0,
		"updated_tick": 0,
		"state_hash": "",
	}
	event["state_hash"] = _record_hash(event)
	var quest := {
		"record_type": "QuestRecord",
		"version": 1,
		"quest_id": "quest.legacy.probe",
		"template_id": "leyforge.legacy.quest.probe",
		"status": "completed",
		"owner_scope_ref": "settlement.probe",
		"participant_refs": [],
		"objective_records": [{
			"objective_id": "objective.legacy",
			"kind": "observe_event",
			"status": "completed",
			"required_predicates": [],
			"required_event_families": ["legacy"],
			"completion_event_refs": ["event.legacy.probe"],
			"blocking_reason": "",
		}],
		"required_event_refs": ["event.legacy.probe"],
		"history_entry_refs": [],
		"revision": 1,
		"state_hash": "",
	}
	quest["state_hash"] = _record_hash(quest)
	var history := {
		"record_type": "HistoryEntry",
		"version": 1,
		"history_id": "history.event.legacy.probe",
		"kind": "legacy",
		"title": "Legacy event",
		"summary": "Legacy history migrated.",
		"event_ref": "event.legacy.probe",
		"consequence_refs": [],
		"settlement_ref": "settlement.probe",
		"world_ref": "world.event.probe",
		"time_ref": ProductionKernel.world_time_reference(),
		"tags": ["legacy"],
		"metadata": {"legacy_import": true},
		"state_hash": "",
	}
	history["state_hash"] = _record_hash(history)
	var state := {
		"schema": EventManager.STATE_SCHEMA,
		"version": 1,
		"interface_id": EventManager.INTERFACE_ID,
		"interface_version": "1.0",
		"world_seed": 4242,
		"world_id": "world.event.probe",
		"events": [event],
		"quests": [quest],
		"history": [history],
		"transactions": [],
		"state_hash": "",
	}
	state["state_hash"] = _state_hash(state)
	return state


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
