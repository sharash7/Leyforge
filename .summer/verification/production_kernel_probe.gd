extends Node
## Focused G2 foundation probe for shared time, presence, evidence, authority,
## transactions, persistence and final Sets 27-30 owner contracts.

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	ProductionKernel.reset_for_verification()
	_test_time_authority_and_presence()
	_test_evidence_and_transactions()
	_test_commands_events_and_scheduler()
	_test_cross_set_contracts()
	_test_persistence()
	print(JSON.stringify({
		"ok": failures.is_empty(), "checks": checks, "failures": failures,
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_time_authority_and_presence() -> void:
	var permissions: Array[String] = ["world_time.advance", "commit:set27"]
	var authority := ProductionKernel.make_authority_context(
		"authority.local.host", "technical.world", permissions)
	_expect(authority.get("record_type") == "AuthorityContext",
		"authority context has a stable record type")
	_expect(authority.get("owner") == "technical.world",
		"authority context preserves its owner")
	_expect(ProductionKernel.advance_world_time(5, {}).get("error") == "authority_denied",
		"world time rejects missing authority")
	_expect(ProductionKernel.advance_world_time(0, authority).get("error") \
			== "ticks_must_be_positive", "world time rejects a non-positive advance")
	var advanced := ProductionKernel.advance_world_time(1500, authority)
	_expect(bool(advanced.get("ok", false)), "authorised world time advances")
	_expect(int(advanced.get("time", {}).get("world_tick", 0)) == 1500,
		"world time records the authoritative tick")
	_expect(int(advanced.get("time", {}).get("day_index", 0)) == 1,
		"world time derives the calendar day")
	var presence := ProductionKernel.actor_presence_state(
		"person.frontier.probe", "regional", "region.frontier.probe")
	_expect(presence.get("record_type") == "ActorPresenceState",
		"valid actor presence produces a typed record")
	_expect(presence.get("mode") == "regional",
		"actor presence preserves the simulation mode")
	_expect(ProductionKernel.actor_presence_state(
		"person.frontier.probe", "teleported", "region.frontier.probe").is_empty(),
		"actor presence rejects an unknown simulation mode")


func _test_evidence_and_transactions() -> void:
	var hash_a := "a".repeat(64)
	var hash_b := "b".repeat(64)
	var evidence := ProductionKernel.make_evidence_envelope(
		"evidence.trade.probe.001", "set27", "stock_reserved", hash_a,
		"correlation.trade.probe")
	_expect(bool(ProductionKernel.validate_evidence(evidence).get("ok", false)),
		"well-formed cross-set evidence validates")
	var first_commit := ProductionKernel.commit_evidence(evidence)
	_expect(bool(first_commit.get("ok", false)), "evidence commits")
	_expect(not bool(first_commit.get("duplicate", true)),
		"first evidence commit is not a duplicate")
	var repeated_commit := ProductionKernel.commit_evidence(evidence)
	_expect(bool(repeated_commit.get("ok", false)), "identical evidence replay succeeds")
	_expect(bool(repeated_commit.get("duplicate", false)),
		"identical evidence replay is idempotent")
	var conflicting := evidence.duplicate(true)
	conflicting["payload_hash"] = hash_b
	_expect(ProductionKernel.commit_evidence(conflicting).get("error") \
			== "evidence_conflict", "conflicting evidence replay is rejected")
	var bad_hash := evidence.duplicate(true)
	bad_hash["evidence_id"] = "evidence.trade.probe.bad_hash"
	bad_hash["payload_hash"] = "not-a-hash"
	_expect(ProductionKernel.validate_evidence(bad_hash).get("error") \
			== "invalid_payload_hash", "evidence requires a SHA-256 payload hash")
	var missing_owner := evidence.duplicate(true)
	missing_owner["evidence_id"] = "evidence.trade.probe.no_owner"
	missing_owner["source_owner"] = ""
	_expect(ProductionKernel.validate_evidence(missing_owner).get("error") \
			== "missing_source_owner", "evidence requires its authoritative owner")

	var permissions: Array[String] = ["commit:set27"]
	var authority := ProductionKernel.make_authority_context(
		"authority.local.host", "technical.world", permissions)
	var missing_evidence_refs: Array[String] = ["evidence.missing"]
	_expect(ProductionKernel.begin_transaction(
		"transaction.trade.missing", "set27", missing_evidence_refs,
		authority).get("error") == "missing_evidence",
		"transactions reject missing evidence")
	var evidence_refs: Array[String] = ["evidence.trade.probe.001"]
	_expect(ProductionKernel.begin_transaction(
		"transaction.trade.denied", "set27", evidence_refs, {}).get("error") \
			== "authority_denied", "transactions reject missing authority")
	var opened := ProductionKernel.begin_transaction(
		"transaction.trade.probe.001", "set27", evidence_refs, authority)
	_expect(bool(opened.get("ok", false)), "authorised transaction opens")
	_expect(opened.get("transaction", {}).get("state") == "open",
		"new transaction records its open state")
	_expect(ProductionKernel.commit_transaction(
		"transaction.trade.probe.001", "bad").get("error") \
			== "invalid_payload_hash", "transaction commit requires a payload hash")
	var committed := ProductionKernel.commit_transaction(
		"transaction.trade.probe.001", hash_a)
	_expect(bool(committed.get("ok", false)), "transaction commits")
	_expect(not bool(committed.get("duplicate", true)),
		"first transaction commit is not a duplicate")
	var replayed := ProductionKernel.commit_transaction(
		"transaction.trade.probe.001", hash_a)
	_expect(bool(replayed.get("ok", false)), "transaction replay succeeds")
	_expect(bool(replayed.get("duplicate", false)),
		"transaction replay is idempotent")
	_expect(ProductionKernel.commit_transaction(
		"transaction.trade.probe.001", hash_b).get("error") \
			== "transaction_commit_conflict",
		"transaction replay cannot change the committed payload")
	_expect(ProductionKernel.begin_transaction(
		"transaction.trade.probe.001", "set27", evidence_refs,
		authority).get("error") == "transaction_exists",
		"transaction identity cannot be reopened")


func _test_cross_set_contracts() -> void:
	_expect(_valid_contract("TransportMissionRequest", {
		"source_owner": "set27", "request_id": "transport.001",
		"origin_id": "site.a", "destination_id": "site.b",
		"cargo_refs": ["stack.001"], "evidence_id": "evidence.001"}),
		"Set 27 owns transport mission requests")
	_expect(_valid_contract("SocialMovementAuthorisation", {
		"source_owner": "set28", "authorisation_id": "social.move.001",
		"entity_id": "person.001", "allowed": true,
		"evidence_id": "evidence.002"}),
		"Set 28 owns social movement authorisation")
	_expect(_valid_contract("MovementExertionRequest", {
		"source_owner": "set30", "request_id": "exertion.001",
		"entity_id": "person.001", "exertion_units": 5.0,
		"evidence_id": "evidence.003"}),
		"Set 30 owns movement exertion requests")
	_expect(_valid_contract("BiologicalMobilityModifierSnapshot", {
		"source_owner": "set29", "entity_id": "person.001",
		"modifier": 0.75, "valid_at_tick": 1500,
		"evidence_id": "evidence.004"}),
		"Set 29 owns biological mobility decisions")
	_expect(_valid_contract("PhysicalImpactEvent", {
		"source_owner": "set30", "event_id": "impact.001",
		"entity_id": "person.001", "impulse": 12.0,
		"evidence_id": "evidence.005"}),
		"Set 30 physical impacts are inputs to Set 29 consequences")
	_expect(_valid_contract("AquaticMovementProviderHandoff", {
		"source_owner": "set26e", "handoff_id": "aquatic.001",
		"entity_id": "person.001", "medium": "water",
		"evidence_id": "evidence.006"}),
		"Set 26E remains the aquatic movement provider")
	_expect(ProductionKernel.validate_cross_set_contract(
		"TransportMissionRequest", {"source_owner": "set30"}).get("error") \
			== "owner_mismatch", "cross-set contracts reject an incorrect owner")
	_expect(ProductionKernel.validate_cross_set_contract(
		"MovementExertionRequest", {"source_owner": "set30"}).get("error") \
			== "missing_request_id", "cross-set contracts require their payload fields")
	_expect(ProductionKernel.validate_cross_set_contract(
		"InventedJointOwner", {}).get("error") == "unknown_contract",
		"unknown joint-owner contracts are rejected")


func _test_commands_events_and_scheduler() -> void:
	var hash_a := "a".repeat(64)
	var hash_b := "b".repeat(64)
	var evidence_refs: Array[String] = ["evidence.trade.probe.001"]
	var permissions: Array[String] = [
		"world_time.advance", "command:set27", "schedule:set27",
		"scheduler.dispatch",
	]
	var authority := ProductionKernel.make_authority_context(
		"authority.scheduler.host", "technical.world", permissions)
	var command := ProductionKernel.make_command_envelope(
		"command.trade.deliver.001", "set27", "deliver_reserved_stock",
		hash_a, evidence_refs, authority)
	_expect(bool(ProductionKernel.validate_command(command, authority).get("ok", false)),
		"well-formed owner command validates")
	var missing_refs: Array[String] = ["evidence.missing"]
	var missing_evidence := ProductionKernel.make_command_envelope(
		"command.trade.missing", "set27", "deliver_reserved_stock",
		hash_a, missing_refs, authority)
	_expect(ProductionKernel.submit_command(
		missing_evidence, authority).get("error") == "missing_evidence",
		"commands require committed evidence")
	_expect(ProductionKernel.submit_command(command, {}).get("error") \
			== "authority_mismatch", "commands reject a different authority context")
	var first_command := ProductionKernel.submit_command(command, authority)
	_expect(bool(first_command.get("ok", false)), "authorised command is accepted")
	_expect(not bool(first_command.get("duplicate", true)),
		"first command submission is not a duplicate")
	var repeated_command := ProductionKernel.submit_command(command, authority)
	_expect(bool(repeated_command.get("ok", false)), "identical command replay succeeds")
	_expect(bool(repeated_command.get("duplicate", false)),
		"identical command replay is idempotent")
	var conflicting_command := command.duplicate(true)
	conflicting_command["payload_hash"] = hash_b
	_expect(ProductionKernel.submit_command(
		conflicting_command, authority).get("error") == "command_conflict",
		"command identity cannot be reused for a different payload")

	var first_event := ProductionKernel.publish_event(
		"event.trade.delivered.001", "set27", "stock_delivered", hash_a,
		evidence_refs)
	_expect(bool(first_event.get("ok", false)), "owner event publishes")
	_expect(not bool(first_event.get("duplicate", true)),
		"first owner event is not a duplicate")
	_expect(bool(ProductionKernel.publish_event(
		"event.trade.delivered.001", "set27", "stock_delivered", hash_a,
		evidence_refs).get("duplicate", false)), "owner event replay is idempotent")
	_expect(ProductionKernel.publish_event(
		"event.trade.delivered.001", "set27", "stock_delivered", hash_b,
		evidence_refs).get("error") == "event_conflict",
		"owner event identity cannot change payload")
	_expect(ProductionKernel.publish_event(
		"event.trade.missing", "set27", "stock_delivered", hash_a,
		missing_refs).get("error") == "missing_evidence",
		"owner events require committed evidence")

	_expect(ProductionKernel.schedule_command(
		"schedule.trade.missing", "command.missing", "set27", 1510,
		authority).get("error") == "schedule_identity_or_command_invalid",
		"scheduler rejects an unknown command")
	_expect(ProductionKernel.schedule_command(
		"schedule.trade.denied", "command.trade.deliver.001", "set27", 1510,
		{}).get("error") == "authority_denied",
		"scheduler rejects missing authority")
	var scheduled := ProductionKernel.schedule_command(
		"schedule.trade.deliver.001", "command.trade.deliver.001", "set27",
		1510, authority)
	_expect(bool(scheduled.get("ok", false)), "authorised command is scheduled")
	_expect(scheduled.get("scheduled", {}).get("state") == "pending",
		"new scheduled command is pending")
	var early_claim := ProductionKernel.claim_due_commands(1, authority)
	_expect(bool(early_claim.get("ok", false)), "scheduler can poll before due time")
	_expect(early_claim.get("commands", []).is_empty(),
		"scheduler does not dispatch a command early")
	_expect(ProductionKernel.claim_due_commands(0, authority).get("error") \
			== "invalid_claim_limit", "scheduler claim work is bounded")
	_expect(bool(ProductionKernel.advance_world_time(10, authority).get("ok", false)),
		"scheduler authority advances to the due tick")
	var due_claim := ProductionKernel.claim_due_commands(1, authority)
	_expect(bool(due_claim.get("ok", false)), "scheduler claims due work")
	_expect(due_claim.get("commands", []).size() == 1,
		"scheduler returns each due command once")
	_expect(due_claim.get("commands", [])[0].get("state") == "dispatched",
		"claimed schedule records its dispatched state")
	_expect(ProductionKernel.claim_due_commands(
		1, authority).get("commands", []).is_empty(),
		"dispatched schedule is not claimed twice")
	_expect(ProductionKernel.schedule_command(
		"schedule.trade.deliver.001", "command.trade.deliver.001", "set27",
		1510, authority).get("error") == "schedule_exists",
		"schedule identity cannot be reopened")


func _test_persistence() -> void:
	var state := ProductionKernel.serialize_state()
	_expect(int(state.get("version", 0)) == 1, "kernel state is versioned")
	_expect(state.get("evidence", []).size() == 1,
		"kernel serialises committed evidence once")
	_expect(state.get("transactions", []).size() == 1,
		"kernel serialises a committed transaction once")
	_expect(state.get("commands", []).size() == 1,
		"kernel serialises an accepted command once")
	_expect(state.get("events", []).size() == 1,
		"kernel serialises a published event once")
	_expect(state.get("scheduled", []).size() == 1,
		"kernel serialises a scheduled command once")
	ProductionKernel.reset_for_verification()
	_expect(int(ProductionKernel.world_time_reference().get("world_tick", -1)) == 0,
		"kernel reset clears world time")
	_expect(ProductionKernel.restore_state(state), "kernel state restores")
	_expect(int(ProductionKernel.world_time_reference().get("world_tick", 0)) == 1510,
		"restored kernel preserves world time")
	_expect(ProductionKernel.serialize_state().get("evidence", []).size() == 1,
		"restored kernel preserves evidence")
	_expect(ProductionKernel.serialize_state().get("transactions", [])[0].get(
		"state") == "committed", "restored kernel preserves transaction state")
	_expect(ProductionKernel.serialize_state().get("scheduled", [])[0].get(
		"state") == "dispatched", "restored kernel preserves scheduler state")
	var evidence: Dictionary = state.get("evidence", [])[0]
	_expect(bool(ProductionKernel.commit_evidence(evidence).get("duplicate", false)),
		"restored evidence remains idempotent")
	_expect(not ProductionKernel.restore_state({"version": 99}),
		"kernel rejects an unsupported state version")


func _valid_contract(contract_type: String, payload: Dictionary) -> bool:
	return bool(ProductionKernel.validate_cross_set_contract(
		contract_type, payload).get("ok", false))


func _expect(condition: bool, failure: String) -> void:
	checks += 1
	if not condition:
		failures.append(failure)
