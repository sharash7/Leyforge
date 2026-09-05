extends Node
## POL-001 probe for Document-13 government, law, territory, membership,
## political authority, Set-27/28 boundaries, persistence and Hamlet migration.

const SaveCoordinatorScript = preload("res://scripts/core/save_coordinator.gd")

const SEED := 71313
const WORLD_ID := "world.political.probe"
const SETTLEMENT_A := "settlement.political.probe.a"
const SETTLEMENT_B := "settlement.political.probe.b"
const ADA := "person.political.probe.ada"
const BRAM := "person.political.probe.bram"
const CYRA := "person.political.probe.cyra"

var checks := 0
var failures: Array[String] = []
var government_a := ""
var government_b := ""
var jurisdiction_a := ""
var jurisdiction_b := ""
var faction_a := ""


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	_test_foundation_and_identity_separation()
	_test_authority_and_social_boundary()
	_test_law_membership_and_disclosure()
	_test_territory_recognition_and_treaty()
	_test_cross_set_views_lod_and_persistence()
	_test_hamlet_permission_projection()
	_test_save_restore_order()
	print("POLITICAL_OWNER_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"government_count": PoliticalManager.government_ids().size(),
		"faction_count": PoliticalManager.faction_ids().size(),
		"law_count": PoliticalManager.law_ids().size(),
		"claim_count": PoliticalManager.territory_claim_ids().size(),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _fresh_owners() -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	SocialManager.reset()
	PoliticalManager.reset()
	PeopleManager.initialize(SEED, WORLD_ID)
	BiologyManager.initialize(SEED, WORLD_ID)
	SocialManager.initialize(SEED, WORLD_ID)
	PoliticalManager.initialize(SEED, WORLD_ID)
	for person_id in [ADA, BRAM, CYRA]:
		var person := PeopleManager.register_person_projection(SETTLEMENT_A, {
			"id": person_id,
			"resident_id": person_id,
			"name": person_id.get_file().capitalize(),
			"alive": true,
			"existence_state": "alive",
			"age_days": 8000,
			"age_band": "adult",
			"job_id": "job.probe.political",
			"schedule_state": "political",
		})
		_expect(bool(person.get("ok", false)),
			"persistent person fixture registers outside political ownership")
		var biology := BiologyManager.register_actor_projection(
			person_id, {"health": 100.0, "max_health": 100.0},
			"political_probe", person_id, SETTLEMENT_A, "persistent")
		_expect(bool(biology.get("ok", false)),
			"biological fixture remains a separate specialist record")
	var social := SocialManager.reconcile_people_owner()
	_expect(bool(social.get("ok", false)),
		"social fixture remains a separate specialist owner")
	var result_a := PoliticalManager.ensure_settlement_government({
		"transaction_id": "political.probe.ensure.a",
		"settlement_ref": SETTLEMENT_A,
		"resident_refs": [ADA, BRAM, CYRA],
		"executive_holder_ref": ADA,
		"profile_ref": "government.communal_council",
		"faction_archetype_ref": "faction.local_council",
		"generation_evidence": "probe.settlement.a",
	})
	_expect(bool(result_a.get("ok", false)),
		"first settlement government commits through canonical political owner")
	government_a = str(result_a.get("government_id", ""))
	jurisdiction_a = str(result_a.get("jurisdiction_id", ""))
	faction_a = str(result_a.get("faction_id", ""))
	var result_b := PoliticalManager.ensure_settlement_government({
		"transaction_id": "political.probe.ensure.b",
		"settlement_ref": SETTLEMENT_B,
		"resident_refs": [BRAM],
		"executive_holder_ref": BRAM,
		"profile_ref": "government.civic_republic",
		"faction_archetype_ref": "faction.crisis_coalition",
		"generation_evidence": "probe.settlement.b",
	})
	_expect(bool(result_b.get("ok", false)),
		"second polity can coexist without merging settlement or government identity")
	government_b = str(result_b.get("government_id", ""))
	jurisdiction_b = str(result_b.get("jurisdiction_id", ""))


func _test_foundation_and_identity_separation() -> void:
	_fresh_owners()
	_expect(PoliticalManager.initialized and PoliticalManager.world_seed == SEED \
			and PoliticalManager.world_id == WORLD_ID \
			and not PoliticalManager.restored_from_state,
		"political owner initializes as fresh world-scoped Document-13 authority")
	_expect(PoliticalManager.GOVERNMENT_PROFILE_IDS.size() == 14 \
			and PoliticalManager.FACTION_ARCHETYPE_IDS.size() == 24,
		"owner references the complete 24E government and faction foundation rosters")
	_expect(PoliticalManager.GOVERNMENT_PROFILE_IDS.duplicate().all(
		func(value: String) -> bool:
			return PoliticalManager.GOVERNMENT_PROFILE_IDS.count(value) == 1),
		"government foundation references contain no duplicate editable definitions")
	var government := PoliticalManager.get_government(government_a)
	var faction := PoliticalManager.get_faction(faction_a)
	_expect(str(government.get("record_type", "")) == "GovernmentInstanceRecord" \
			and str(government.get("profile_ref", "")) \
				== "government.communal_council" \
			and str(government.get("state_hash", "")).length() == 64,
		"government instance is stably identified, profile-referenced and hashed")
	_expect(str(faction.get("record_type", "")) == "PoliticalFactionRecord" \
			and str(faction.get("archetype_ref", "")) == "faction.local_council" \
			and str(faction.get("faction_id", "")) != government_a,
		"governing faction remains an organisation distinct from formal government")
	_expect(PoliticalManager.government_ids(SETTLEMENT_A) == [government_a] \
			and PoliticalManager.government_ids(SETTLEMENT_B) == [government_b],
		"one government may be queried by governed settlement without owning settlement operation")
	var jurisdiction := PoliticalManager.get_jurisdiction(jurisdiction_a)
	_expect(str(jurisdiction.get("jurisdiction_type", "")) == "settlement" \
			and SETTLEMENT_A in (jurisdiction.get("spatial_refs", []) as Array),
		"jurisdiction explicitly references political scope instead of inferring nearest rule")
	var offices := PoliticalManager.office_ids(government_a)
	var office := PoliticalManager.get_office(offices.front())
	_expect((office.get("holder_refs", []) as Array) == [ADA] \
			and bool(office.get("single_holder", false)) \
			and str(office.get("status", "")) == "active",
		"political office owns the appointment while PeopleManager retains the person")
	_expect(PeopleManager.has_person(ADA) \
			and not government.has("trust") and not faction.has("trust") \
			and not government.has("inventory") and not government.has("tax_rate"),
		"political records do not duplicate person, social or economic truth")
	_expect(PoliticalManager.membership_ids(ADA).size() == 1 \
			and str(PoliticalManager.get_membership(
				PoliticalManager.membership_ids(ADA).front()).get(
					"membership_type", "")) == "resident",
		"residence is a political membership edge rather than ancestry or loyalty")


func _test_authority_and_social_boundary() -> void:
	var ada_law := PoliticalManager.permission_query({
		"actor_ref": ADA,
		"capability_id": "political.enact_law",
		"government_ref": government_a,
		"jurisdiction_ref": jurisdiction_a,
	})
	var cyra_law := PoliticalManager.permission_query({
		"actor_ref": CYRA,
		"capability_id": "political.enact_law",
		"government_ref": government_a,
		"jurisdiction_ref": jurisdiction_a,
	})
	_expect(bool(ada_law.get("allowed", false)) \
			and str(ada_law.get("reason_code", "")) \
				== "CIV-AUTH-000.permission_granted",
		"office capability grants an explainable political permission")
	_expect(not bool(cyra_law.get("allowed", false)) \
			and (cyra_law.get("authority_source_refs", []) as Array).is_empty(),
		"residence alone does not grant office authority")
	var social_event := SocialManager.apply_relationship_event({
		"transaction_id": "political.probe.social.trust",
		"subject_id": ADA,
		"target_id": CYRA,
		"source_event_id": "event.political.probe.social",
		"event_family": "political_probe",
		"dimension_deltas": {"trust": 100.0, "loyalty": 100.0},
	})
	_expect(bool(social_event.get("ok", false)) \
			and is_equal_approx(float(SocialManager.trust(ADA, CYRA).get(
				"value", 0.0)), 100.0),
		"Set 28 can record strong trust and loyalty independently")
	var still_denied := PoliticalManager.permission_query({
		"actor_ref": CYRA,
		"capability_id": "political.enact_law",
		"government_ref": government_a,
		"jurisdiction_ref": jurisdiction_a,
	})
	_expect(not bool(still_denied.get("allowed", false)),
		"maximum social trust and loyalty cannot invent political authority")
	var before_access := PoliticalManager.permission_query({
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"capability_id": "settlement.warehouse.deposit",
		"government_ref": government_a,
		"jurisdiction_ref": jurisdiction_a,
		"subject_ref": SETTLEMENT_A,
	})
	_expect(not bool(before_access.get("allowed", false)),
		"player begins without an implicit warehouse capability")
	var reconcile := PoliticalManager.reconcile_operational_access({
		"settlement_ref": SETTLEMENT_A,
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"access_points": 16,
		"project_complete": false,
		"evidence_refs": ["evidence.probe.delivery.confirmed"],
	})
	_expect(bool(reconcile.get("ok", false)) \
			and "settlement.warehouse.deposit" in (
				reconcile.get("capability_ids", []) as Array) \
			and "settlement.warehouse.withdraw" not in (
				reconcile.get("capability_ids", []) as Array),
		"confirmed operational evidence becomes bounded political capability grants")
	var deposit := PoliticalManager.permission_query({
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"capability_id": "settlement.warehouse.deposit",
		"government_ref": government_a,
		"jurisdiction_ref": jurisdiction_a,
		"subject_ref": SETTLEMENT_A,
	})
	var withdraw := PoliticalManager.permission_query({
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"capability_id": "settlement.warehouse.withdraw",
		"government_ref": government_a,
		"jurisdiction_ref": jurisdiction_a,
		"subject_ref": SETTLEMENT_A,
	})
	_expect(bool(deposit.get("allowed", false)) \
			and str((deposit.get("authority_source_refs", []) as Array).front()) \
				.begins_with("authority_grant.operational."),
		"permission query cites the canonical operational grant")
	_expect(not bool(withdraw.get("allowed", false)),
		"bounded grant does not confer a higher capability")
	var duplicate := PoliticalManager.reconcile_operational_access({
		"settlement_ref": SETTLEMENT_A,
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"access_points": 16,
		"project_complete": false,
		"evidence_refs": ["evidence.probe.delivery.confirmed"],
	})
	_expect(bool(duplicate.get("ok", false)) and bool(duplicate.get("duplicate", false)),
		"operational authority reconciliation is idempotent")


func _test_law_membership_and_disclosure() -> void:
	var unauthorized := PoliticalManager.activate_law({
		"transaction_id": "political.probe.law.unauthorized",
		"definition_ref": "law_definition.warehouse_control",
		"jurisdiction_ref": jurisdiction_a,
		"authorizer_ref": CYRA,
		"permission_effects": {},
	})
	_expect(not bool(unauthorized.get("ok", false)) \
			and str(unauthorized.get("error", "")).contains("law_enactment_denied"),
		"active law cannot be committed by an unauthorised resident")
	var law_id := "law.political.probe.warehouse"
	var enacted := PoliticalManager.activate_law({
		"transaction_id": "political.probe.law.enact",
		"law_instance_id": law_id,
		"definition_ref": "law_definition.warehouse_control",
		"jurisdiction_ref": jurisdiction_a,
		"authorizer_ref": ADA,
		"permission_effects": {
			"settlement.warehouse.deposit": {"mode": "deny"},
		},
		"legal_classifications": ["legal_classification.restricted_storage"],
	})
	_expect(bool(enacted.get("ok", false)) \
			and bool(PoliticalManager.validate_law(
				PoliticalManager.get_law(law_id)).get("ok", false)),
		"authorised officeholder commits a hashed active law instance")
	var law_denial := PoliticalManager.permission_query({
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"capability_id": "settlement.warehouse.deposit",
		"government_ref": government_a,
		"jurisdiction_ref": jurisdiction_a,
		"subject_ref": SETTLEMENT_A,
	})
	_expect(not bool(law_denial.get("allowed", false)) \
			and str(law_denial.get("reason_code", "")) == "CIV-LAW-001.explicit_denial" \
			and law_id in (law_denial.get("law_refs", []) as Array),
		"jurisdictional law denial overrides a capability grant with reason evidence")
	var amended := PoliticalManager.activate_law({
		"transaction_id": "political.probe.law.amend",
		"law_instance_id": law_id,
		"definition_ref": "law_definition.warehouse_control",
		"jurisdiction_ref": jurisdiction_a,
		"authorizer_ref": ADA,
		"permission_effects": {
			"settlement.warehouse.deposit": {"mode": "deny"},
		},
		"exempt_actor_refs": [SocialManager.PLAYER_ACTOR_ID],
	})
	_expect(bool(amended.get("ok", false)) \
			and int(PoliticalManager.get_law(law_id).get("revision", 0)) == 2,
		"law amendment retains stable instance identity and advances revision")
	var exempted := PoliticalManager.permission_query({
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"capability_id": "settlement.warehouse.deposit",
		"government_ref": government_a,
		"jurisdiction_ref": jurisdiction_a,
		"subject_ref": SETTLEMENT_A,
	})
	_expect(bool(exempted.get("allowed", false)),
		"explicit legal exemption reveals the existing authority grant again")
	var citizenship := PoliticalManager.commit_membership({
		"transaction_id": "political.probe.citizenship.cyra",
		"actor_ref": CYRA,
		"organisation_ref": government_a,
		"membership_type": "citizen",
		"public_visibility": "public",
		"legal_status_refs": ["legal_status.citizen"],
		"authorizer_ref": ADA,
		"jurisdiction_ref": jurisdiction_a,
	})
	_expect(bool(citizenship.get("ok", false)),
		"authorised citizenship decision creates a separate membership edge")
	var status := PoliticalManager.political_status_view(CYRA, CYRA)
	_expect("legal_status.citizen" in (status.get("legal_status_refs", []) as Array) \
			and (status.get("memberships", []) as Array).size() == 2,
		"status view can show residence and citizenship without changing culture")
	var hidden := PoliticalManager.commit_membership({
		"transaction_id": "political.probe.hidden_membership.cyra",
		"actor_ref": CYRA,
		"organisation_ref": faction_a,
		"membership_type": "infiltrator",
		"public_visibility": "hidden",
		"authorizer_ref": ADA,
		"jurisdiction_ref": jurisdiction_a,
	})
	_expect(bool(hidden.get("ok", false)),
		"formal secret faction membership can be committed without social belief fields")
	var public_view := PoliticalManager.political_status_view(CYRA, BRAM)
	var self_view := PoliticalManager.political_status_view(CYRA, CYRA)
	_expect(bool(public_view.get("classified_data_withheld", false)) \
			and (self_view.get("memberships", []) as Array).size() \
				== (public_view.get("memberships", []) as Array).size() + 1,
		"knowledge-aware projection withholds hidden political truth from ordinary viewers")


func _test_territory_recognition_and_treaty() -> void:
	var region_ref := "region.political.probe.borderland"
	var claim_a := PoliticalManager.register_territory_claim({
		"transaction_id": "political.probe.claim.a",
		"claimant_ref": government_a,
		"spatial_ref": region_ref,
		"claim_type": "sovereignty",
		"effective_control_band": "limited",
		"legal_basis_refs": ["charter.probe.a"],
		"authorizer_ref": ADA,
		"jurisdiction_ref": jurisdiction_a,
	})
	_expect(bool(claim_a.get("ok", false)),
		"authorised government commits a territory claim")
	var claim_b := PoliticalManager.register_territory_claim({
		"transaction_id": "political.probe.claim.b",
		"claimant_ref": government_b,
		"spatial_ref": region_ref,
		"claim_type": "frontier",
		"effective_control_band": "nominal",
		"status": "disputed",
		"disputed_by_refs": [government_a],
		"authorizer_ref": BRAM,
		"jurisdiction_ref": jurisdiction_b,
	})
	_expect(bool(claim_b.get("ok", false)) \
			and str(claim_a.get("claim_id", "")) != str(claim_b.get("claim_id", "")),
		"overlapping political claims coexist instead of nearest-settlement overwrite")
	var truth := PoliticalManager.territory_truth(region_ref)
	_expect((truth.get("claims", []) as Array).size() == 2 \
			and not bool(truth.get("physical_traversability_owned", true)),
		"territory truth separates claim/effective control from physical movement")
	var social_belief := SocialManager.upsert_belief({
		"transaction_id": "political.probe.false.border.belief",
		"actor_id": CYRA,
		"proposition": {
			"predicate": "political.territory.sole_owner",
			"subject_ref": region_ref,
			"object_ref": government_b,
			"truth_owner": PoliticalManager.EVIDENCE_OWNER,
		},
		"awareness": "informed",
		"stance": "accept",
		"confidence": 1000,
		"source_id": "rumour.probe.border",
		"evidence_refs": ["rumour.probe.border"],
	})
	_expect(bool(social_belief.get("ok", false)) \
			and (PoliticalManager.territory_truth(region_ref).get(
				"claims", []) as Array).size() == 2,
		"actor belief about a border cannot rewrite authoritative political truth")
	var war := PoliticalManager.set_political_relationship({
		"transaction_id": "political.probe.relationship.war",
		"actor_a_ref": government_a,
		"actor_b_ref": government_b,
		"government_ref": government_a,
		"authorizer_ref": ADA,
		"jurisdiction_ref": jurisdiction_a,
		"recognition_state": "hostile_but_recognised",
		"formal_state": "war",
	})
	_expect(bool(war.get("ok", false)) \
			and not PoliticalManager.get_political_relationship(
				str(war.get("relationship_id", ""))).has("trust"),
		"formal war/recognition state persists without Set-28 relationship dimensions")
	var unauthorized_treaty := PoliticalManager.commit_treaty({
		"transaction_id": "political.probe.treaty.unauthorized",
		"treaty_type": "truce",
		"signatory_refs": [government_a, government_b],
		"authorised_signer_refs": {government_a: ADA, government_b: CYRA},
		"formal_state": "truce",
	})
	_expect(not bool(unauthorized_treaty.get("ok", false)) \
			and str(unauthorized_treaty.get("error", "")).contains(
				"unauthorised_signer"),
		"treaty commit rejects a socially plausible but politically unauthorised signer")
	var treaty := PoliticalManager.commit_treaty({
		"transaction_id": "political.probe.treaty.truce",
		"treaty_type": "truce",
		"signatory_refs": [government_a, government_b],
		"authorised_signer_refs": {government_a: ADA, government_b: BRAM},
		"formal_state": "truce",
		"recognition_state": "recognised",
		"economic_policy_refs": ["economic_policy.probe.trade_term"],
		"movement_policy_refs": ["movement_policy.probe.border_access"],
	})
	_expect(bool(treaty.get("ok", false)),
		"authorised signers commit the formal treaty after negotiation boundary")
	var relationship := PoliticalManager.get_political_relationship(
		str(war.get("relationship_id", "")))
	_expect(str(relationship.get("formal_state", "")) == "truce" \
			and str(treaty.get("treaty_id", "")) in (
				relationship.get("active_treaty_refs", []) as Array),
		"treaty commit updates objective political relationship state")


func _test_cross_set_views_lod_and_persistence() -> void:
	var fiscal := PoliticalManager.fiscal_authority_snapshot(
		ADA, government_a, jurisdiction_a)
	_expect(bool((fiscal.get("decisions", {}) as Dictionary).get(
			"can_authorise_taxation", {}).get("allowed", false)) \
			and not bool(fiscal.get("economic_values_owned", true)),
		"Set-27 interface exposes lawful fiscal authority without tax or treasury amounts")
	var summary := PoliticalManager.settlement_political_summary(SETTLEMENT_A)
	_expect((summary.get("government_refs", []) as Array) == [government_a] \
			and int(summary.get("office_count", 0)) == 1 \
			and int(summary.get("active_law_count", 0)) == 1,
		"settlement projection summarises political state without owning settlement operation")
	var lod := PoliticalManager.lod_snapshot(SETTLEMENT_A)
	_expect(str((lod.get("identity", {}) as Dictionary).get(
			"record_type", "")) == "PoliticalSettlementProjection" \
			and not (lod.get("history", {}) as Dictionary).is_empty() \
			and not (lod.get("irreversible", {}) as Dictionary).is_empty() \
			and not (lod.get("state", {}) as Dictionary).is_empty(),
		"political owner supplies history, irreversible and current LOD partitions")
	var validation := PoliticalManager.validate_state()
	_expect(bool(validation.get("ok", false)) \
			and int((validation.get("record_counts", {}) as Dictionary).get(
				"governments", 0)) == 2,
		"referential validation accepts the complete political graph")
	var saved := PoliticalManager.serialize_state()
	_expect(str(saved.get("schema", "")) == PoliticalManager.STATE_SCHEMA \
			and str(saved.get("state_hash", "")).length() == 64 \
			and (saved.get("transaction_journal", []) as Array).size() >= 10,
		"political state persists typed records, hash and idempotent journal")
	var json_roundtrip: Variant = JSON.parse_string(JSON.stringify(saved))
	_expect(json_roundtrip is Dictionary,
		"political save envelope survives actual JSON representation")
	PoliticalManager.reset()
	var restored := PoliticalManager.restore_state(
		json_roundtrip, SEED, WORLD_ID)
	_expect(restored and PoliticalManager.restored_from_state \
			and PoliticalManager.government_ids().size() == 2 \
			and PoliticalManager.treaty_ids().size() == 1,
		"JSON-restored political graph preserves governments and treaty state")
	var restored_saved := PoliticalManager.serialize_state()
	_expect(_normalise_json_numbers(restored_saved) \
			== _normalise_json_numbers(json_roundtrip),
		"political owner round-trips without rerolling or rewriting canonical truth")
	var replay := PoliticalManager.commit_treaty({
		"transaction_id": "political.probe.treaty.truce",
		"treaty_type": "truce",
		"signatory_refs": [government_a, government_b],
		"authorised_signer_refs": {government_a: ADA, government_b: BRAM},
		"formal_state": "truce",
		"recognition_state": "recognised",
		"economic_policy_refs": ["economic_policy.probe.trade_term"],
		"movement_policy_refs": ["movement_policy.probe.border_access"],
	})
	_expect(bool(replay.get("ok", false)) and bool(replay.get("duplicate", false)),
		"restored transaction journal preserves political command idempotency")
	var corrupt: Dictionary = json_roundtrip.duplicate(true)
	corrupt["state_hash"] = "0".repeat(64)
	PoliticalManager.reset()
	_expect(not PoliticalManager.restore_state(corrupt, SEED, WORLD_ID),
		"political owner rejects corrupted save hash")


func _test_hamlet_permission_projection() -> void:
	var hamlet_seed := 713131
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	SocialManager.reset()
	PoliticalManager.reset()
	StructureManager.reset()
	StructureManager.initialize(hamlet_seed, "world.political.hamlet")
	HamletState.initialized = false
	HamletState.initialize(hamlet_seed, {
		"hamlet": Vector2i(0, 0),
		"warehouse": Vector2i(8, 0),
		"watchtower_site": Vector2i(-8, 0),
	})
	var hamlet_government := PoliticalManager.government_for_settlement(
		HamletState.active_village_id)
	_expect(not hamlet_government.is_empty() \
			and PoliticalManager.office_ids(str(hamlet_government.get(
				"government_id", ""))).size() == 1,
		"Hamlet compatibility facade reconciles a canonical local government and office")
	var elder_id := str(HamletState.ROSTER[0].get("id", ""))
	var elder_office := PoliticalManager.get_office(
		PoliticalManager.office_ids(str(hamlet_government.get(
			"government_id", ""))).front())
	_expect(elder_id in (elder_office.get("holder_refs", []) as Array),
		"legacy elder role migrates to explicit office authority without moving person ownership")
	var trust_only := SocialManager.apply_relationship_event({
		"transaction_id": "political.hamlet.social_only",
		"subject_id": elder_id,
		"target_id": SocialManager.PLAYER_ACTOR_ID,
		"source_event_id": "event.political.hamlet.social_only",
		"event_family": "probe_social_only",
		"dimension_deltas": {"trust": 100.0, "loyalty": 100.0},
	})
	HamletState.refresh_social_projection()
	_expect(bool(trust_only.get("ok", false)) \
			and not HamletState.permission_enabled("request_delivery"),
		"Hamlet facade confirms social reputation alone cannot grant operational authority")
	_expect(HamletState.accept_introduction(),
		"confirmed introduction supplies separate operational evidence")
	_expect(HamletState.permission_enabled("request_delivery") \
			and not HamletState.permission_enabled("warehouse_deposit"),
		"Hamlet permission projection reads the bounded PoliticalManager grant")
	var government_ref := str(hamlet_government.get("government_id", ""))
	var jurisdiction_ref := str((hamlet_government.get(
		"jurisdiction_refs", []) as Array).front())
	var decision := PoliticalManager.permission_query({
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"capability_id": "settlement.request_delivery",
		"government_ref": government_ref,
		"jurisdiction_ref": jurisdiction_ref,
		"subject_ref": HamletState.active_village_id,
	})
	_expect(bool(decision.get("allowed", false)) \
			and not (decision.get("authority_source_refs", []) as Array).is_empty(),
		"canonical query proves the facade is a projection rather than permission owner")
	var hamlet_save := HamletState.serialize_state()
	var political_save := PoliticalManager.serialize_state()
	_expect(int(hamlet_save.get("operational_access_points", 0)) == 1 \
			and not (political_save.get("authority_grants", []) as Array).is_empty(),
		"save keeps operational evidence in compatibility state and capability truth in political state")


func _test_save_restore_order() -> void:
	var coordinator := SaveCoordinatorScript.new()
	var order := coordinator.restore_order()
	_expect(order.find("people_owner") < order.find("biology_owner") \
			and order.find("biology_owner") < order.find("social_owner") \
			and order.find("social_owner") < order.find("political_owner") \
			and order.find("political_owner") < order.find("movement_owner") \
			and order.find("movement_owner") < order.find("event_owner") \
			and order.find("event_owner") < order.find("settlements"),
		"save coordinator restores specialist inputs and movement truth before settlement views")
	_expect(order.size() == 19,
		"canonical save order includes additive political and movement owner domains")


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
