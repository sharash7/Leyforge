extends Node
## SOC-001 probe for Set-28 social ownership, typed Set-07/29/30 boundaries,
## semantic dialogue evidence, companion consent, persistence and Hamlet access.

const SaveCoordinatorScript = preload("res://scripts/core/save_coordinator.gd")

const SEED := 72828
const WORLD_ID := "world.social.probe"
const SETTLEMENT_ID := "settlement.social.probe"
const ADA := "person.social.probe.ada"
const BRAM := "person.social.probe.bram"
const CYRA := "person.social.probe.cyra"

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	_test_profiles_and_typed_refs()
	_test_relationships_memory_and_milestones()
	_test_knowledge_and_route_truth_boundary()
	_test_conversation_evidence()
	_test_companion_and_cross_set_views()
	_test_reputation_and_persistence()
	_test_hamlet_authority_split()
	_test_save_restore_order()
	print("SOCIAL_OWNER_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"profile_count": SocialManager.profile_ids().size(),
		"relationship_count": SocialManager.relationship_ids().size(),
		"belief_count": SocialManager.belief_ids().size(),
		"companion_count": SocialManager.companion_ids().size(),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _fresh_owners(seed_value: int = SEED, world_id: String = WORLD_ID) -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	SocialManager.reset()
	PoliticalManager.reset()
	PeopleManager.initialize(seed_value, world_id)
	BiologyManager.initialize(seed_value, world_id)
	SocialManager.initialize(seed_value, world_id)
	for person_id in [ADA, BRAM, CYRA]:
		_register_person(person_id)
	var reconciled := SocialManager.reconcile_people_owner()
	_expect(bool(reconciled.get("ok", false)),
		"People records reconcile into typed social profiles")


func _register_person(person_id: String) -> void:
	var person := PeopleManager.register_person_projection(SETTLEMENT_ID, {
		"id": person_id,
		"resident_id": person_id,
		"name": person_id.get_file().capitalize(),
		"alive": true,
		"existence_state": "alive",
		"age_days": 8000,
		"age_band": "adult",
		"job_id": "job.probe.social",
		"schedule_state": "social",
	})
	_expect(bool(person.get("ok", false)),
		"persistent person fixture registers before social specialisation")
	var biology := BiologyManager.register_actor_projection(
		person_id, {
			"health": 100.0,
			"max_health": 100.0,
			"needs": {"food": 0.9},
		}, "social_probe", person_id, SETTLEMENT_ID, "persistent")
	_expect(bool(biology.get("ok", false)),
		"biological fixture registers for disclosure and availability contracts")


func _test_profiles_and_typed_refs() -> void:
	_fresh_owners()
	_expect(SocialManager.initialized and SocialManager.world_seed == SEED \
			and SocialManager.world_id == WORLD_ID \
			and not SocialManager.restored_from_state,
		"social owner initializes as fresh world-scoped Set-28 authority")
	_expect(SocialManager.profile_ids() == [
		SocialManager.PLAYER_ACTOR_ID, ADA, BRAM, CYRA,
	], "profiles retain stable person identities plus the local player actor")
	var profile := SocialManager.get_profile(ADA)
	_expect(str(profile.get("record_type", "")) == "SocialProfileState" \
			and str(profile.get("social_profile_id", "")) \
				== SocialManager.social_profile_id(ADA) \
			and int(profile.get("revision", 0)) == 1 \
			and str(profile.get("state_hash", "")).length() == 64,
		"social profile is versioned, revisioned, stably identified and hashed")
	_expect(bool(SocialManager.validate_profile(profile).get("ok", false)),
		"canonical social profile passes owner validation")
	var person := PeopleManager.get_person(ADA)
	var refs: Dictionary = person.get("external_domain_refs", {})
	_expect(str(refs.get("social_profile_ref", "")) \
			== SocialManager.social_profile_id(ADA) \
			and int(refs.get("set28_social_revision", 0)) == 1,
		"PeopleManager stores only the Set-28 external profile reference")
	var duplicate := SocialManager.register_profile(
		ADA, {"knowledge_refs": ["forged"]}, "duplicate", ADA,
		SETTLEMENT_ID, "person")
	_expect(bool(duplicate.get("ok", false)) \
			and bool(duplicate.get("duplicate", false)) \
			and SocialManager.get_profile(ADA).get("knowledge_refs", []).is_empty(),
		"duplicate profile registration cannot overwrite social truth")
	var compatibility := SocialManager.compatibility_person_view(ADA, {
		"health": 73.0,
		"job_id": "job.probe.social",
	})
	_expect(bool(compatibility.get("social_projection", false)) \
			and str(compatibility.get("social_profile_ref", "")) \
				== SocialManager.social_profile_id(ADA) \
			and is_equal_approx(float(compatibility.get("health", 0.0)), 73.0),
		"social compatibility projection preserves fields owned by other domains")
	var summary := BiologyManager.social_biological_summary(ADA)
	_expect(str(summary.get("schema", "")) \
			== "leyforge.xset.social-biological-summary" \
			and str(summary.get("source_owner", "")) == "set29" \
			and bool(summary.get("assignment_survival_availability", false)),
		"XSET-005 supplies typed social-safe biological availability")
	_expect(not (summary.get(
			"socially_relevant_condition_summary", {}) as Dictionary).has(
				"active_injury_count") \
			and str(summary.get("knowledge_visibility_class", "")) \
				== "socially_observable",
		"unprivileged social disclosure omits private biological detail")
	var private_summary := BiologyManager.social_biological_summary(
		ADA, {"observer_id": ADA})
	_expect((private_summary.get(
			"socially_relevant_condition_summary", {}) as Dictionary).has(
				"active_injury_count") \
			and str(private_summary.get("knowledge_visibility_class", "")) \
				== "self_or_authorised",
		"self-authorised disclosure exposes bounded condition counts")


func _test_relationships_memory_and_milestones() -> void:
	var forward_request := {
		"transaction_id": "social.probe.relationship.ada_bram.1",
		"subject_id": ADA,
		"target_id": BRAM,
		"source_event_id": "event.social.probe.shared_rescue",
		"event_family": "shared_rescue",
		"dimension_deltas": {
			"trust": 20.0,
			"affection": 20.0,
			"respect": 18.0,
			"gratitude": 15.0,
			"familiarity": 30.0,
		},
		"significance": "meaningful",
		"emotional_tags": ["relief", "gratitude"],
	}
	var forward := SocialManager.apply_relationship_event(forward_request)
	_expect(bool(forward.get("ok", false)) \
			and str(forward.get("schema", "")) \
				== "leyforge.social-transaction-result" \
			and int(forward.get("result_revision", 0)) == 1,
		"directed relationship impact commits through the social owner")
	var relationship := SocialManager.get_relationship(ADA, BRAM)
	var dimensions: Dictionary = relationship.get("dimensions", {})
	_expect(is_equal_approx(float(dimensions.get("trust", 0.0)), 20.0) \
			and is_equal_approx(float(dimensions.get("familiarity", 0.0)), 30.0) \
			and bool(SocialManager.validate_relationship(
				relationship).get("ok", false)),
		"relationship dimensions use signed/unsigned ranges and validate")
	_expect(SocialManager.get_relationship(BRAM, ADA).is_empty(),
		"relationship edges are sparse and directed rather than mirrored implicitly")
	_expect(SocialManager.social_memory(ADA, {
		"target_id": BRAM,
		"minimum_significance": "meaningful",
	}).size() == 1,
		"meaningful impact retains one provenance-linked social memory")
	var replay := SocialManager.apply_relationship_event(forward_request)
	_expect(bool(replay.get("ok", false)) and bool(replay.get("duplicate", false)) \
			and int(SocialManager.get_relationship(
				ADA, BRAM).get("revision", 0)) == 1,
		"identical relationship retry replays without reapplying deltas")
	var conflict := forward_request.duplicate(true)
	conflict["dimension_deltas"] = {"trust": 1.0}
	_expect(SocialManager.apply_relationship_event(conflict).get("error") \
			== "social_transaction_conflict",
		"changed payload cannot reuse a committed social transaction identity")
	_expect(SocialManager.apply_relationship_event({
		"transaction_id": "social.probe.relationship.fear_loyalty",
		"subject_id": ADA,
		"target_id": CYRA,
		"source_event_id": "event.social.probe.coercion",
		"event_family": "fear_coercion",
		"dimension_deltas": {"fear": 10.0, "loyalty": 10.0},
	}).get("error") == "fear_cannot_create_loyalty",
		"fear or coercion cannot create loyalty without independent evidence")
	_expect(SocialManager.apply_relationship_event({
		"transaction_id": "social.probe.relationship.authority",
		"subject_id": ADA,
		"target_id": CYRA,
		"source_event_id": "event.social.probe.invalid_authority",
		"dimension_deltas": {"trust": 10.0},
		"grant_permission": "warehouse.withdraw",
	}).get("error") == "cross_owner_mutation_forbidden",
		"social command rejects direct political or economic authority mutation")
	_expect(SocialManager.apply_relationship_event({
		"transaction_id": "social.probe.relationship.stale",
		"subject_id": ADA,
		"target_id": BRAM,
		"source_event_id": "event.social.probe.stale",
		"dimension_deltas": {"trust": 1.0},
		"expected_revision": 0,
	}).get("error") == "stale_relationship_revision",
		"stale relationship revisions fail before evidence publication")
	var reverse := SocialManager.apply_relationship_event({
		"transaction_id": "social.probe.relationship.bram_ada.1",
		"subject_id": BRAM,
		"target_id": ADA,
		"source_event_id": "event.social.probe.shared_rescue",
		"event_family": "shared_rescue",
		"dimension_deltas": {
			"trust": 20.0, "affection": 20.0, "familiarity": 30.0,
		},
	})
	_expect(bool(reverse.get("ok", false)),
		"reciprocal relationship state requires its own explicit impact")
	_expect(SocialManager.form_relationship_milestone({
		"transaction_id": "social.probe.milestone.no_consent",
		"subject_id": ADA,
		"target_id": BRAM,
		"milestone_family": "friend",
	}).get("error") == "mutual_acceptance_required",
		"mutual relationship milestones require explicit acceptance")
	var milestone := SocialManager.form_relationship_milestone({
		"transaction_id": "social.probe.milestone.friend",
		"subject_id": ADA,
		"target_id": BRAM,
		"milestone_family": "friend",
		"mutual_acceptance": true,
		"source_event_id": "event.social.probe.friendship_agreed",
	})
	_expect(bool(milestone.get("ok", false)) \
			and SocialManager.relationship_level(ADA, BRAM) == "friend" \
			and SocialManager.relationship_level(BRAM, ADA) == "friend",
		"eligible reciprocal edges form one mutual friendship milestone")


func _test_knowledge_and_route_truth_boundary() -> void:
	var proposition := {
		"predicate": "route.access",
		"subject_ref": "route.probe.north_road",
		"object_ref": "open",
		"truth_owner": "set30.movement",
	}
	var request := {
		"transaction_id": "social.probe.belief.route.1",
		"actor_id": ADA,
		"proposition": proposition,
		"primary_source_id": "observation.probe.route_marker",
		"root_source_id": "observation.probe.route_marker",
		"awareness": "detailed",
		"stance": "accept",
		"confidence": 900,
		"truth_owner": "set30.movement",
	}
	var result := SocialManager.upsert_belief(request)
	_expect(bool(result.get("ok", false)) \
			and int(result.get("result_revision", 0)) == 1,
		"structured proposition and provenance commit as actor belief")
	var belief := SocialManager.get_belief(ADA, proposition)
	_expect(str(belief.get("record_type", "")) == "BeliefRecord" \
			and str(belief.get("truth_owner", "")) == "set30.movement" \
			and str(belief.get("primary_source_id", "")) \
				== "observation.probe.route_marker" \
			and bool(SocialManager.validate_belief(belief).get("ok", false)),
		"belief keeps truth ownership and provenance separate from confidence")
	_expect(SocialManager.belief_state(ADA, proposition) == "accept" \
			and SocialManager.confidence(ADA, proposition) == 900,
		"knowledge queries expose actor stance and confidence")
	_expect(bool(SocialManager.can_assert(
		ADA, proposition, "statement").get("allowed", false)) \
			and not bool(SocialManager.can_assert(
				BRAM, proposition, "statement").get("allowed", true)) \
			and bool(SocialManager.can_assert(
				BRAM, proposition, "question").get("allowed", false)),
		"assertion mode distinguishes known statements from questions or speculation")
	_expect(SocialManager.upsert_belief({
		"transaction_id": "social.probe.belief.no_source",
		"actor_id": ADA,
		"proposition": {"predicate": "route.access", "subject_ref": "route.x"},
	}).get("error") == "belief_identity_or_provenance_required",
		"dialogue text cannot create fact-like belief without provenance")
	var route := SocialManager.route_knowledge_snapshot(
		ADA, "route.probe.north_road")
	_expect(str(route.get("schema", "")) \
			== "leyforge.xset.route-knowledge-snapshot" \
			and int(route.get("belief_or_claim_confidence", 0)) == 900 \
			and int(route.get("knowledge_revision", 0)) == 1,
		"XSET-007 publishes belief about route truth without owning route state")
	var replay := SocialManager.upsert_belief(request)
	_expect(bool(replay.get("duplicate", false)) \
			and int(SocialManager.get_belief(
				ADA, proposition).get("revision", 0)) == 1,
		"belief transaction replay cannot duplicate provenance or revisions")


func _test_conversation_evidence() -> void:
	var begin_request := {
		"transaction_id": "social.probe.conversation.begin.1",
		"session_id": "conversation.social.probe.1",
		"template_id": "dialogue.probe.route_warning",
		"participant_ids": [ADA, BRAM],
		"initiator_id": ADA,
		"primary_addressee_id": BRAM,
		"candidate_choice_ids": ["choice.share_route_warning"],
		"save_policy": "consequential",
	}
	var begin := SocialManager.begin_conversation(begin_request)
	_expect(bool(begin.get("ok", false)) \
			and int(begin.get("result_revision", 0)) == 1 \
			and not str(begin.get("evidence_id", "")).is_empty(),
		"authoritative conversation session begins with semantic evidence")
	var private_view := SocialManager.conversation_view(
		"conversation.social.probe.1", CYRA)
	_expect(not bool(private_view.get("visible", true)) \
			and str(private_view.get("reason_code", "")) == "private_conversation",
		"nonparticipant cannot inspect a private conversation session")
	_expect(SocialManager.begin_conversation({
		"transaction_id": "social.probe.conversation.overlap",
		"session_id": "conversation.social.probe.overlap",
		"participant_ids": [ADA, CYRA],
	}).get("error") == "conversation_unavailable",
		"exclusive participant commitment blocks overlapping conversation")
	var evidence_before := (ProductionKernel.serialize_state().get(
		"evidence", []) as Array).size()
	var invalid := SocialManager.commit_dialogue_choice({
		"transaction_id": "social.probe.conversation.invalid_state",
		"session_id": "conversation.social.probe.1",
		"choice_id": "choice.share_route_warning",
		"chooser_id": ADA,
		"semantic_action_id": "social.share_route_warning",
		"expected_revision": 1,
		"next_state": "teleported",
	})
	var evidence_after := (ProductionKernel.serialize_state().get(
		"evidence", []) as Array).size()
	_expect(invalid.get("error") == "invalid_conversation_state" \
			and evidence_before == evidence_after \
			and int(SocialManager.conversation_view(
				"conversation.social.probe.1", ADA).get(
					"expected_revision", 0)) == 1,
		"invalid conversation state is rejected before evidence or revision mutation")
	var commit_request := {
		"transaction_id": "social.probe.conversation.commit.1",
		"session_id": "conversation.social.probe.1",
		"choice_id": "choice.share_route_warning",
		"chooser_id": ADA,
		"semantic_action_id": "social.share_route_warning",
		"semantic_claims": [{
			"predicate": "route.warning_shared",
			"subject_ref": "route.probe.north_road",
		}],
		"external_command_requests": [{
			"owner": "set30.movement",
			"action": "consider_route_warning",
		}],
		"expected_revision": 1,
		"close_after_commit": true,
		"end_reason": "warning_shared",
	}
	var commit := SocialManager.commit_dialogue_choice(commit_request)
	_expect(bool(commit.get("ok", false)) \
			and int(commit.get("result_revision", 0)) == 2 \
			and (commit.get("external_command_requests", []) as Array).size() == 1,
		"dialogue choice commits semantic claims and returns typed external requests")
	var closed := SocialManager.conversation_view(
		"conversation.social.probe.1", ADA)
	_expect(str(closed.get("state", "")) == "ended" \
			and str(closed.get("end_reason", "")) == "warning_shared",
		"conversation closes through an authoritative revision transition")
	var replay := SocialManager.commit_dialogue_choice(commit_request)
	_expect(bool(replay.get("ok", false)) and bool(replay.get("duplicate", false)),
		"semantic dialogue commit is idempotent")
	var preview := SocialManager.dialogue_preview(ADA, BRAM, {
		"job_id": "job.leader.elder",
		"reputation_band": "stranger",
	})
	_expect(bool(preview.get("available", false)) \
			and str(preview.get("semantic_line_id", "")) \
				== "dialogue.hamlet.elder.introduction",
		"dialogue preview selects semantic line identity rather than writing facts")


func _test_companion_and_cross_set_views() -> void:
	var invalid_request := {
		"transaction_id": "social.probe.companion.invalid_status",
		"companion_id": BRAM,
		"recruiter_scope_id": SocialManager.PLAYER_ACTOR_ID,
		"companion_class_id": "companion.class.voluntary",
		"role_definition_id": "companion.role.scout",
		"consent_evidence_ref": "evidence.probe.bram_consent",
		"social_resolution_ref": "social_resolution.probe.recruitment",
		"initial_status": "teleported",
	}
	var evidence_before := (ProductionKernel.serialize_state().get(
		"evidence", []) as Array).size()
	var invalid := SocialManager.create_companion_agreement(invalid_request)
	var evidence_after := (ProductionKernel.serialize_state().get(
		"evidence", []) as Array).size()
	_expect(invalid.get("error") == "invalid_companion_status" \
			and evidence_before == evidence_after,
		"invalid companion status is rejected before evidence publication")
	var agreement_request := {
		"transaction_id": "social.probe.companion.create.1",
		"agreement_id": "companion_agreement.probe.bram",
		"companion_id": BRAM,
		"recruiter_scope_id": SocialManager.PLAYER_ACTOR_ID,
		"companion_class_id": "companion.class.voluntary",
		"role_definition_id": "companion.role.scout",
		"consent_evidence_ref": "evidence.probe.bram_consent",
		"social_resolution_ref": "social_resolution.probe.recruitment",
		"agreed_travel_scope": "regional",
		"agreed_risk_band": "moderate",
		"permission_states": {"movement.follow": "allowed"},
		"initial_status": "active",
	}
	var created := SocialManager.create_companion_agreement(agreement_request)
	_expect(bool(created.get("ok", false)) \
			and str(created.get("status", "")) == "active",
		"consented companion agreement creates one social overlay on the person")
	var agreement := SocialManager.companion_agreement(BRAM)
	_expect(str(agreement.get("consent_evidence_ref", "")) \
			== "evidence.probe.bram_consent" \
			and not agreement.has("loyalty") \
			and bool(SocialManager.validate_companion_agreement(
				agreement).get("ok", false)),
		"companion agreement stores consent without duplicating relationship loyalty")
	var willingness := SocialManager.assignment_willingness(BRAM, {
		"requires_companion_agreement": true,
		"social_permission_id": "movement.follow",
	})
	_expect(bool(willingness.get("ok", false)) \
			and bool(willingness.get("available", false)) \
			and str(willingness.get("social_profile_ref", "")) \
				== SocialManager.social_profile_id(BRAM),
		"assignment consumes typed willingness without changing task ownership")
	var movement := SocialManager.social_movement_authorisation(BRAM, {
		"context_id": "movement_context.probe.follow",
		"assignment_ref": "assignment.probe.follow",
	})
	_expect(str(movement.get("schema", "")) \
			== "leyforge.xset.social-movement-authorisation" \
			and bool(movement.get("companion_travel_permission", false)) \
			and not movement.has("position"),
		"XSET-006 grants social travel consent without owning movement state")
	var care := SocialManager.social_care_context(BRAM, {
		"caregiver_id": ADA,
		"context_ref": "care.probe.rest",
		"care_intent": "assist_recovery",
	})
	_expect(str(care.get("schema", "")) == "leyforge.xset.social-care-context" \
			and str(care.get("source_owner", "")) == "set28" \
			and not care.has("health_delta"),
		"XSET-005 social care context does not mutate biological quantities")
	var formation := SocialManager.formation_intent({
		"group_id": "group.probe.companions",
		"leader_ref": ADA,
		"member_refs": [ADA, BRAM],
		"formation_style": "follow",
	})
	_expect(bool(formation.get("ok", false)) \
			and str(formation.get("schema", "")) \
				== "leyforge.xset.formation-intent" \
			and not formation.has("resolved_positions"),
		"formation output expresses social intent and leaves resolution to Set 30")
	var transitioned := SocialManager.transition_companion_status({
		"transaction_id": "social.probe.companion.wait.1",
		"companion_id": BRAM,
		"status": "waiting",
		"status_reason": "social.companion.waiting_at_camp",
		"expected_revision": 1,
		"movement_state_ref": "movement_state.probe.waiting",
	})
	_expect(bool(transitioned.get("ok", false)) \
			and str(SocialManager.companion_status(BRAM).get(
				"status", "")) == "waiting" \
			and int(transitioned.get("result_revision", 0)) == 2,
		"companion status changes with expected revision and external movement ref")
	_expect(SocialManager.transition_companion_status({
		"transaction_id": "social.probe.companion.stale",
		"companion_id": BRAM,
		"status": "active",
		"status_reason": "probe",
		"expected_revision": 1,
	}).get("error") == "stale_companion_revision",
		"stale companion transition is rejected")
	_expect(SocialManager.create_companion_agreement({
		"transaction_id": "social.probe.companion.duplicate_membership",
		"companion_id": BRAM,
		"recruiter_scope_id": "actor.other",
		"companion_class_id": "companion.class.voluntary",
		"role_definition_id": "companion.role.guard",
		"consent_evidence_ref": "evidence.probe.second_consent",
		"social_resolution_ref": "social_resolution.probe.second",
	}).get("error") == "companion_membership_already_active",
		"one person cannot acquire duplicate active companion membership")


func _test_reputation_and_persistence() -> void:
	var forbidden := SocialManager.apply_reputation_event({
		"transaction_id": "social.probe.reputation.forbidden",
		"scope_ref": SETTLEMENT_ID,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"delta": 100,
		"source_event_id": "event.probe.fake_trust",
		"political_authority": "settlement.owner",
	})
	_expect(forbidden.get("error") == "cross_owner_mutation_forbidden",
		"social reputation cannot directly grant political authority")
	var reputation_request := {
		"transaction_id": "social.probe.reputation.helpfulness.1",
		"scope_ref": SETTLEMENT_ID,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"dimension": "community_helpfulness",
		"delta": 20,
		"source_event_id": "event.probe.confirmed_delivery",
	}
	var reputation := SocialManager.apply_reputation_event(reputation_request)
	_expect(bool(reputation.get("ok", false)) \
			and is_equal_approx(float(reputation.get("score", 0.0)), 20.0) \
			and str(reputation.get("band", "")) == "trusted_supplier",
		"confirmed external event updates canonical social reputation")
	_expect(bool(SocialManager.apply_reputation_event(
		reputation_request).get("duplicate", false)) \
			and is_equal_approx(float(SocialManager.social_reputation(
				SETTLEMENT_ID, SocialManager.PLAYER_ACTOR_ID).get(
					"score", 0.0)), 20.0),
		"reputation retry replays without applying score twice")
	var social_state := SocialManager.serialize_state()
	var kernel_state := ProductionKernel.serialize_state()
	var lod_before := SocialManager.lod_snapshot(BRAM)
	_expect(str(social_state.get("schema", "")) == "leyforge.social-state" \
			and str(social_state.get("state_hash", "")).length() == 64 \
			and (social_state.get("profiles", []) as Array).size() == 4 \
			and (social_state.get("relationships", []) as Array).size() == 2,
		"social save envelope persists typed partitions and whole-state hash")
	_expect((social_state.get("conversations", []) as Array).size() == 1 \
			and (social_state.get("companion_agreements", []) as Array).size() == 1 \
			and (social_state.get("beliefs", []) as Array).size() == 1,
		"consequential dialogue, agreement and knowledge state are persistent")
	_expect(SocialManager.serialize_state() == social_state,
		"unchanged social owner serializes deterministically")
	var tampered := social_state.duplicate(true)
	tampered["world_id"] = "world.tampered"
	_expect(not SocialManager.restore_state(tampered, SEED, WORLD_ID),
		"tampered social state is rejected without replacing live authority")
	var parsed_social: Variant = JSON.parse_string(JSON.stringify(social_state))
	var parsed_kernel: Variant = JSON.parse_string(JSON.stringify(kernel_state))
	ProductionKernel.reset_for_verification()
	SocialManager.reset()
	_expect(parsed_kernel is Dictionary \
			and ProductionKernel.restore_state(parsed_kernel),
		"shared evidence kernel round-trips before social owner state")
	_expect(parsed_social is Dictionary \
			and SocialManager.restore_state(parsed_social, SEED, WORLD_ID) \
			and SocialManager.restored_from_state,
		"social state survives JSON and restores with seed/world validation")
	var lod_after := SocialManager.lod_snapshot(BRAM)
	_expect(_normalise_json_numbers(lod_after) \
			== _normalise_json_numbers(lod_before),
		"social LOD identity, history, irreversible agreements and state round-trip")
	_expect(bool(SocialManager.apply_reputation_event(
		reputation_request).get("duplicate", false)) \
			and is_equal_approx(float(SocialManager.social_reputation(
				SETTLEMENT_ID, SocialManager.PLAYER_ACTOR_ID).get(
					"score", 0.0)), 20.0),
		"restored transaction journal preserves idempotent reputation replay")
	_expect(not SocialManager.restore_state(parsed_social, SEED + 1, WORLD_ID) \
			and SocialManager.world_seed == SEED,
		"wrong-seed social snapshot is rejected without mutating restored state")


func _test_hamlet_authority_split() -> void:
	var hamlet_seed := SEED + 20
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	SocialManager.reset()
	PoliticalManager.reset()
	StructureManager.reset()
	StructureManager.initialize(hamlet_seed, "world.social.hamlet_probe")
	HamletState.initialized = false
	HamletState.initialize(hamlet_seed, {
		"hamlet": Vector2i(0, 0),
		"warehouse": Vector2i(8, 0),
		"watchtower_site": Vector2i(-8, 0),
		"goblin_camp": Vector2i(120, 0),
		"raid_approach": Vector2i(20, 0),
	})
	_expect(HamletState.initialized \
			and SocialManager.profile_ids(HamletState.active_village_id).size() \
				== HamletState.ROSTER.size(),
		"Hamlet materialisation registers every resident with the social owner")
	var npc_id := HamletState.get_npc_ids()[0]
	var npc := HamletState.get_npc_record(npc_id)
	_expect(str(npc.get("social_profile_ref", "")) \
			== SocialManager.social_profile_id(npc_id) \
			and bool(npc.get("social_projection", false)),
		"focused NPC facade carries canonical social profile reference")
	_expect(not HamletState.permission_enabled("request_delivery") \
			and HamletState.operational_access_points == 0,
		"fresh settlement begins with no operational access grant")
	var social_only := SocialManager.apply_reputation_event({
		"transaction_id": "social.probe.hamlet.social_only",
		"scope_ref": HamletState.active_village_id,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"delta": 100,
		"source_event_id": "event.probe.social_only_trust",
	})
	HamletState.refresh_social_projection()
	_expect(bool(social_only.get("ok", false)) \
			and HamletState.reputation_state == HamletState.REP_ALLY,
		"Hamlet display projects high canonical social reputation")
	_expect(not HamletState.permission_enabled("request_delivery") \
			and not HamletState.permission_enabled("warehouse_withdraw") \
			and HamletState.operational_access_points == 0,
		"social reputation alone grants no settlement operational authority")
	var lod := HamletState.npc_lod_snapshot(npc_id)
	_expect(not ((lod.get("state", {}) as Dictionary).get(
			"social_owner_state", {}) as Dictionary).is_empty() \
			and not ((lod.get("irreversible", {}) as Dictionary).get(
				"social_owner", {}) as Dictionary).is_empty(),
		"NPC LOD snapshot embeds social state and irreversible partitions")

	# A separate fresh settlement proves that the introduction action carries
	# both semantic social evidence and distinct operational-access evidence.
	hamlet_seed += 1
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	SocialManager.reset()
	StructureManager.reset()
	StructureManager.initialize(hamlet_seed, "world.social.introduction_probe")
	HamletState.initialized = false
	HamletState.initialize(hamlet_seed, {
		"hamlet": Vector2i(0, 0),
		"warehouse": Vector2i(8, 0),
		"watchtower_site": Vector2i(-8, 0),
		"goblin_camp": Vector2i(120, 0),
		"raid_approach": Vector2i(20, 0),
	})
	_expect(HamletState.accept_introduction(),
		"accepted introduction commits a semantic conversation and relationship impact")
	_expect(HamletState.reputation_state == HamletState.REP_HELPFUL \
			and HamletState.reputation_points == 1 \
			and is_equal_approx(float(SocialManager.social_reputation(
				HamletState.active_village_id,
				SocialManager.PLAYER_ACTOR_ID).get("score", 0.0)), 1.0),
		"Hamlet reputation facade reads the canonical social score")
	_expect(HamletState.operational_access_points == 1 \
			and HamletState.permission_enabled("request_delivery") \
			and not HamletState.permission_enabled("warehouse_deposit"),
		"same confirmed introduction evidence advances separate bounded access")
	_expect(not HamletState.accept_introduction() \
			and HamletState.operational_access_points == 1,
		"introduction cannot be accepted or rewarded twice")
	var saved_hamlet := HamletState.serialize_state()
	_expect(int(saved_hamlet.get("operational_access_points", 0)) == 1 \
			and (saved_hamlet.get(
				"operational_access_evidence_refs", []) as Array).size() == 1,
		"Hamlet save persists operational evidence separately from social state")


func _test_save_restore_order() -> void:
	var coordinator := SaveCoordinatorScript.new()
	var order := coordinator.restore_order()
	_expect(order.find("people_owner") < order.find("biology_owner") \
			and order.find("biology_owner") < order.find("social_owner") \
			and order.find("social_owner") < order.find("political_owner") \
			and order.find("political_owner") < order.find("movement_owner") \
			and order.find("movement_owner") < order.find("event_owner") \
			and order.find("event_owner") < order.find("settlements"),
		"save coordinator restores specialist owners before settlement views")
	_expect(order.size() == 19,
		"canonical save order includes the additive specialist owner domains")


func _normalise_json_numbers(value: Variant) -> Variant:
	if value is Dictionary:
		var normalised: Dictionary = {}
		for key in (value as Dictionary).keys():
			normalised[key] = _normalise_json_numbers((value as Dictionary)[key])
		return normalised
	if value is Array:
		var normalised: Array = []
		for entry in value as Array:
			normalised.append(_normalise_json_numbers(entry))
		return normalised
	if value is int or value is float:
		return float(value)
	return value


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
