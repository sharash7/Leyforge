extends Node
## BIO-001 probe for the Set-29 biological owner, its typed Set-07/16/30
## boundaries, persistence, and legacy Hamlet/Combat compatibility views.

const SaveCoordinatorScript = preload("res://scripts/core/save_coordinator.gd")

const SEED := 72929
const WORLD_ID := "world.biology.probe"
const SETTLEMENT_ID := "settlement.biology.probe"

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	_test_owner_records_and_queries()
	_test_damage_healing_and_lifecycle_boundary()
	_test_movement_and_impact_interfaces()
	_test_nourishment_population_and_persistence()
	_test_hamlet_integration()
	_test_combat_integration()
	_test_save_restore_order()
	print("BIOLOGICAL_OWNER_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"actor_count": BiologyManager.actor_count(),
		"persistent_count": BiologyManager.actor_count("persistent"),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _fresh_owners(seed_value: int = SEED, world_id: String = WORLD_ID) -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	PeopleManager.initialize(seed_value, world_id)
	BiologyManager.initialize(seed_value, world_id)


func _register_person(person_id: String, settlement_id: String) -> Dictionary:
	return PeopleManager.register_person_projection(settlement_id, {
		"id": person_id,
		"resident_id": person_id,
		"name": person_id.capitalize(),
		"alive": true,
		"age_days": 8000,
		"age_band": "adult",
		"job_id": "job.probe",
		"schedule_state": "work",
	})


func _test_owner_records_and_queries() -> void:
	_fresh_owners()
	var actor_id := "person.biology.probe.ada"
	_expect(bool(_register_person(actor_id, SETTLEMENT_ID).get("ok", false)),
		"people fixture registers before its biological specialist record")
	var registered := BiologyManager.register_actor_projection(
		actor_id, {
			"health": 80.0,
			"max_health": 80.0,
			"max_stamina": 120.0,
			"stamina": 90.0,
			"needs": {"food": 0.75},
		}, "probe", actor_id, SETTLEMENT_ID, "persistent")
	_expect(BiologyManager.initialized and BiologyManager.world_seed == SEED \
			and not BiologyManager.restored_from_state,
		"biological owner initializes as fresh Set-29 authority")
	_expect(bool(registered.get("ok", false)) \
			and not bool(registered.get("duplicate", true)),
		"actor projection is admitted exactly once")
	_expect(BiologyManager.actor_ids() == [actor_id] \
			and BiologyManager.actor_count("persistent") == 1,
		"canonical actor identity is deterministic and persistence scoped")
	var record := BiologyManager.get_record(actor_id)
	_expect(str(record.get("record_type", "")) == "BiologicalActorRecord" \
			and int(record.get("version", 0)) == 1 \
			and str(record.get("state_hash", "")).length() == 64,
		"biological record is versioned, revisioned and hashed")
	_expect(str(record.get("biological_record_id", "")) \
			== BiologyManager.biological_record_id(actor_id) \
			and str(record.get("person_ref", "")) == actor_id \
			and str(record.get("settlement_ref", "")) == SETTLEMENT_ID,
		"biological record retains typed actor, person and settlement links")
	_expect(bool(BiologyManager.validate_record(record, SEED).get("ok", false)),
		"canonical biological record passes owner validation")
	var person := PeopleManager.get_person(actor_id)
	var external_refs: Dictionary = person.get("external_domain_refs", {})
	_expect(str(external_refs.get("biological_record_ref", "")) \
			== BiologyManager.biological_record_id(actor_id) \
			and int(external_refs.get("set29_biology_revision", 0)) == 1,
		"PeopleManager stores only the Set-29 external record reference")
	var duplicate := BiologyManager.register_actor_projection(
		actor_id, {"health": 1.0, "max_health": 2.0}, "duplicate",
		actor_id, SETTLEMENT_ID, "persistent")
	_expect(bool(duplicate.get("ok", false)) \
			and bool(duplicate.get("duplicate", false)) \
			and is_equal_approx(BiologyManager.current_health(actor_id), 80.0),
		"duplicate registration cannot overwrite canonical biological truth")
	_expect(is_equal_approx(BiologyManager.current_health(actor_id), 80.0) \
			and is_equal_approx(BiologyManager.max_health(actor_id), 80.0) \
			and is_equal_approx(BiologyManager.health_percent(actor_id), 1.0) \
			and BiologyManager.health_band(actor_id) == "stable",
		"mandatory health queries resolve canonical quantities and band")
	var health := BiologyManager.health_snapshot(actor_id)
	_expect(str(health.get("schema", "")) == "leyforge.set29.health-snapshot" \
			and int(health.get("source_state_revision", 0)) == 1 \
			and not bool(health.get("critical_condition", true)),
		"health snapshot exposes a typed, revisioned read model")
	var hunger := BiologyManager.hunger_level(actor_id)
	_expect(bool(hunger.get("applicable", false)) \
			and is_equal_approx(float(hunger.get("severity", -1.0)), 25.0) \
			and str(hunger.get("band", "")) == "comfortable",
		"hunger query derives severity from the compatibility food projection")
	var thirst := BiologyManager.thirst_level(actor_id)
	_expect(bool(thirst.get("applicable", false)) \
			and not bool(thirst.get("enabled", true)) \
			and not thirst.has("severity"),
		"disabled thirst remains explicitly non-simulated")
	var temperature := BiologyManager.body_temperature(actor_id)
	_expect(bool(temperature.get("applicable", false)) \
			and str(temperature.get("band", "")) == "comfortable" \
			and is_zero_approx(float(temperature.get("wetness", -1.0))),
		"temperature and wetness query starts from a comfortable baseline")
	var fatigue := BiologyManager.fatigue(actor_id)
	_expect(bool(fatigue.get("applicable", false)) \
			and str(fatigue.get("band", "")) == "rested" \
			and is_zero_approx(float(fatigue.get("value", -1.0))),
		"fatigue query exposes the rested baseline")
	_expect(int(BiologyManager.injury_state(actor_id).get(
			"active_count", -1)) == 0 \
			and int(BiologyManager.disease_state(actor_id).get(
				"active_count", -1)) == 0 \
			and is_zero_approx(float(BiologyManager.poison_level(actor_id).get(
				"danger", -1.0))),
		"injury, disease and poison query families are present and empty")
	_expect(bool(BiologyManager.stamina_modifier(actor_id).get(
			"applicable", false)) \
			and bool(BiologyManager.carry_penalty(actor_id).get(
				"applicable", false)) \
			and bool(BiologyManager.work_capacity_modifier(actor_id).get(
				"applicable", false)),
		"stamina, carrying and work-capacity modifiers are typed owner queries")
	var capability := BiologyManager.biological_capability_summary(actor_id)
	_expect(bool(capability.get("ok", false)) \
			and bool(capability.get("available_for_assignment", false)) \
			and float(capability.get("work_capacity_modifier", 0.0)) > 0.7,
		"healthy actor exposes an available biological capability summary")
	var compatibility := BiologyManager.compatibility_actor_view(actor_id, {
		"health": 1.0, "injured": true, "needs": {"shelter": 1.0},
	})
	_expect(is_equal_approx(float(compatibility.get("health", 0.0)), 80.0) \
			and not bool(compatibility.get("injured", true)) \
			and bool(compatibility.get("biological_projection", false)) \
			and float((compatibility.get("needs", {}) as Dictionary).get(
				"shelter", 0.0)) == 1.0,
		"compatibility view replaces biological fields without erasing other owners")


func _test_damage_healing_and_lifecycle_boundary() -> void:
	var actor_id := "person.biology.probe.ada"
	var damage_request := {
		"transaction_id": "biology.probe.damage.1",
		"actor_id": actor_id,
		"source_actor_ref": "actor.probe.attacker",
		"source_system": "document16.combat",
		"resolved_health_damage": 15.0,
		"damage_tags": ["physical.slash"],
		"trauma_tags": ["cut"],
		"impact_class": "significant",
		"injury_permitted": true,
		"biological_region_id": "region.arm.left",
	}
	var prior_revision := int(BiologyManager.get_record(actor_id).get(
		"revision", 0))
	var result := BiologyManager.apply_resolved_biological_damage(damage_request)
	_expect(bool(result.get("ok", false)) \
			and str(result.get("schema", "")) \
				== "leyforge.biological-transaction-result" \
			and str(result.get("commit_status", "")) == "committed",
		"resolved Set-16 damage commits through the biological command boundary")
	_expect(is_equal_approx(BiologyManager.current_health(actor_id), 65.0) \
			and int(result.get("prior_revision", -1)) == prior_revision \
			and int(result.get("result_revision", 0)) == prior_revision + 1,
		"damage changes health exactly once and advances the owner revision")
	var injury := BiologyManager.injury_state(actor_id)
	_expect(int(injury.get("active_count", 0)) == 1 \
			and str(injury.get("worst_severity", "")) in [
				"minor", "moderate", "severe", "critical"] \
			and str((injury.get("injuries", []) as Array)[0].get(
				"region", "")) == "region.arm.left",
		"biological damage derives a bounded, region-aware injury consequence")
	_expect(str(PeopleManager.get_person(actor_id).get(
			"existence_state", "")) == "alive",
		"Set 29 does not decide death when health changes")
	var revision_after_damage := int(BiologyManager.get_record(actor_id).get(
		"revision", 0))
	var replay := BiologyManager.apply_resolved_biological_damage(damage_request)
	_expect(bool(replay.get("ok", false)) \
			and bool(replay.get("duplicate", false)) \
			and int(BiologyManager.get_record(actor_id).get(
				"revision", 0)) == revision_after_damage,
		"identical damage retry replays without a second mutation")
	var conflict_request := damage_request.duplicate(true)
	conflict_request["resolved_health_damage"] = 2.0
	_expect(BiologyManager.apply_resolved_biological_damage(
		conflict_request).get("error") == "biological_transaction_conflict",
		"reused transaction identity with changed damage is rejected")
	var lethal := BiologyManager.apply_resolved_biological_damage({
		"transaction_id": "biology.probe.damage.lethal",
		"actor_id": actor_id,
		"resolved_health_damage": 500.0,
		"injury_permitted": true,
		"minimum_injury_severity": "severe",
		"impact_class": "extreme",
		"minimum_health": 0.0,
	})
	_expect(bool(lethal.get("ok", false)) \
			and is_zero_approx(BiologyManager.current_health(actor_id)) \
			and bool(BiologyManager.health_snapshot(actor_id).get(
				"critical_condition", false)),
		"health can reach a critical zero state without claiming lifecycle ownership")
	_expect(str(PeopleManager.get_person(actor_id).get(
			"existence_state", "")) == "alive",
		"zero biological health still awaits the external death or downing decision")
	_expect(BiologyManager.submit_biological_healing_request({
		"transaction_id": "biology.probe.heal.denied",
		"actor_id": actor_id,
		"healing_amount": 10.0,
	}).get("error") == "external_revival_authorisation_required",
		"healing from zero requires explicit external lifecycle authority")
	var healed := BiologyManager.submit_biological_healing_request({
		"transaction_id": "biology.probe.heal.authorised",
		"actor_id": actor_id,
		"healing_amount": 20.0,
		"allow_recovery_from_zero": true,
		"external_lifecycle_authority": "probe.combat_respawn",
	})
	_expect(bool(healed.get("ok", false)) \
			and is_equal_approx(BiologyManager.current_health(actor_id), 20.0),
		"authorised recovery restores health through the owner")
	var availability := BiologyManager.assignment_availability(actor_id)
	_expect(bool(availability.get("ok", false)) \
			and str(availability.get("schema", "")) \
				== "leyforge.document07.biological-availability" \
			and availability.has("work_capacity_modifier") \
			and availability.has("recovery_status"),
		"Document 07 receives typed availability rather than reading health fields")


func _test_movement_and_impact_interfaces() -> void:
	var mover_id := "actor.biology.probe.mover"
	_expect(bool(BiologyManager.register_actor_projection(
		mover_id, {
			"health": 100.0, "max_health": 100.0,
			"stamina": 100.0, "max_stamina": 100.0,
		}, "movement_probe", "", SETTLEMENT_ID, "conditional").get(
			"ok", false)),
		"movement fixture receives an independent biological record")
	var estimate_request := {
		"request_id": "movement.probe.estimate",
		"query_mode": "estimate",
		"entity_id": mover_id,
		"movement_action_family": "sprint",
		"movement_mode": "sprint",
		"intensity_band": "moderate",
		"base_stamina_cost": 10.0,
	}
	var revision_before := int(BiologyManager.get_record(mover_id).get(
		"revision", 0))
	var estimate := BiologyManager.apply_movement_exertion_context(
		estimate_request)
	_expect(bool(estimate.get("ok", false)) \
			and str(estimate.get("schema", "")) \
				== "leyforge.xset.movement-exertion-decision" \
			and str(estimate.get("commit_status", "")) == "estimated",
		"Set-30 estimate receives the typed MovementExertionDecision")
	_expect(int(BiologyManager.get_record(mover_id).get(
			"revision", 0)) == revision_before \
			and is_equal_approx(float((BiologyManager.get_record(
				mover_id).get("stamina", {}) as Dictionary).get(
					"current_stamina", 0.0)), 100.0),
		"movement estimate is strictly side-effect free")
	var commit_request := estimate_request.duplicate(true)
	commit_request["request_id"] = "movement.probe.commit"
	commit_request["idempotency_key"] = "movement.probe.commit.once"
	commit_request["query_mode"] = "commit"
	var committed := BiologyManager.apply_movement_exertion_context(
		commit_request)
	_expect(bool(committed.get("ok", false)) \
			and str(committed.get("commit_status", "")) == "committed" \
			and bool(committed.get("allowed_to_begin", false)),
		"movement commit spends allowed biological exertion")
	_expect(is_equal_approx(float((committed.get(
			"stamina_spend_result", {}) as Dictionary).get("spent", 0.0)), 10.0) \
			and is_equal_approx(float((BiologyManager.get_record(
				mover_id).get("stamina", {}) as Dictionary).get(
					"current_stamina", 0.0)), 90.0),
		"committed exertion conserves the exact stamina spend")
	var mover_revision := int(BiologyManager.get_record(mover_id).get(
		"revision", 0))
	var commit_replay := BiologyManager.apply_movement_exertion_context(
		commit_request)
	_expect(bool(commit_replay.get("duplicate", false)) \
			and int(BiologyManager.get_record(mover_id).get(
				"revision", 0)) == mover_revision,
		"movement commit is idempotent under the supplied key")
	var movement_conflict := commit_request.duplicate(true)
	movement_conflict["base_stamina_cost"] = 11.0
	_expect(BiologyManager.apply_movement_exertion_context(
		movement_conflict).get("error") == "biological_transaction_conflict",
		"changed exertion cannot reuse a committed movement key")
	var rejected := BiologyManager.apply_movement_exertion_context({
		"request_id": "movement.probe.rejected",
		"idempotency_key": "movement.probe.rejected.once",
		"query_mode": "commit",
		"entity_id": mover_id,
		"movement_action_family": "sprint",
		"base_stamina_cost": 500.0,
	})
	_expect(bool(rejected.get("ok", false)) \
			and str(rejected.get("commit_status", "")) == "rejected" \
			and "insufficient_stamina" in rejected.get("reason_codes", []),
		"insufficient stamina returns a typed non-mutating rejection")
	_expect(int(BiologyManager.get_record(mover_id).get(
			"revision", 0)) == mover_revision,
		"rejected movement does not mutate biological state")
	var ended := BiologyManager.apply_movement_exertion_context({
		"request_id": "movement.probe.end",
		"idempotency_key": "movement.probe.end.once",
		"query_mode": "end",
		"entity_id": mover_id,
		"movement_action_family": "sprint",
	})
	_expect(bool(ended.get("ok", false)) \
			and str(ended.get("commit_status", "")) == "ended" \
			and int(BiologyManager.get_record(mover_id).get(
				"revision", 0)) == mover_revision,
		"movement end is journaled without inventing a biological mutation")
	var mobility := BiologyManager.biological_mobility_modifier_snapshot(mover_id)
	_expect(bool(mobility.get("ok", false)) \
			and str(mobility.get("schema", "")) \
				== "leyforge.xset.biological-mobility-modifier-snapshot" \
			and mobility.has("max_speed_modifier") \
			and mobility.has("hard_restrictions"),
		"Set 30 can consume the complete typed mobility modifier snapshot")

	var impact_id := "actor.biology.probe.impact"
	_expect(bool(BiologyManager.register_actor_projection(
		impact_id, {"health": 100.0, "max_health": 100.0},
		"impact_probe", "", SETTLEMENT_ID, "conditional").get("ok", false)),
		"physical-impact fixture receives an independent biological record")
	var impact_request := {
		"impact_event_id": "impact.probe.1",
		"entity_id": impact_id,
		"impact_speed_normal": 16.0,
		"landing_quality": "ordinary",
		"external_hit_location_or_region_hint": "region.leg.left",
	}
	var impact := BiologyManager.apply_physical_impact_event(impact_request)
	_expect(bool(impact.get("ok", false)) \
			and str(impact.get("schema", "")) \
				== "leyforge.xset.biological-impact-result" \
			and str(impact.get("impact_event_id", "")) == "impact.probe.1",
		"Set-30 physical evidence returns the typed BiologicalImpactResult")
	_expect(is_equal_approx(float(impact.get("current_health", 0.0)), 89.5) \
			and int(BiologyManager.injury_state(impact_id).get(
				"active_count", 0)) == 1,
		"physical impact derives health and injury without rewriting movement truth")
	_expect(not (impact.get("movement_modifiers", []) as Array).is_empty() \
			and str(impact.get("recovery_state_ref", "")) \
				== BiologyManager.biological_record_id(impact_id),
		"impact result returns movement-facing modifiers and recovery reference")
	var impact_revision := int(BiologyManager.get_record(impact_id).get(
		"revision", 0))
	var impact_replay := BiologyManager.apply_physical_impact_event(impact_request)
	_expect(bool(impact_replay.get("ok", false)) \
			and bool(impact_replay.get("duplicate", false)) \
			and int(BiologyManager.get_record(impact_id).get(
				"revision", 0)) == impact_revision,
		"physical impact retry preserves typed shape and idempotency")
	var impact_conflict := impact_request.duplicate(true)
	impact_conflict["impact_speed_normal"] = 18.0
	_expect(BiologyManager.apply_physical_impact_event(
		impact_conflict).get("error") == "biological_transaction_conflict",
		"changed physical evidence cannot reuse an impact event identity")


func _test_nourishment_population_and_persistence() -> void:
	var eater_id := "actor.biology.probe.eater"
	_expect(bool(BiologyManager.register_actor_projection(
		eater_id, {
			"health": 50.0, "max_health": 50.0,
			"hunger_severity": 50.0,
		}, "nourishment_probe", "", SETTLEMENT_ID, "persistent").get(
			"ok", false)),
		"nourishment fixture receives a persistent biological record")
	var serving_request := {
		"transaction_id": "biology.probe.serving.1",
		"actor_id": eater_id,
		"source_item_ref": "item.food.probe",
		"serving_count": 1,
		"resource_commit_status": "committed",
		"resource_commit_reference": "inventory.probe.1",
		"biological_payload": {
			"satiety_points": 10.0,
			"nutrition_energy_units": 2.0,
			"nutrition_protein_units": 1.0,
			"nutrition_produce_units": 1.0,
		},
	}
	var serving := BiologyManager.apply_consumed_serving(serving_request)
	_expect(bool(serving.get("ok", false)) \
			and is_equal_approx(float(BiologyManager.hunger_level(
				eater_id).get("severity", 0.0)), 40.0) \
			and str(serving.get("resource_commit_reference", "")) \
				== "inventory.probe.1",
		"committed item serving applies its biological payload once")
	var serving_revision := int(BiologyManager.get_record(eater_id).get(
		"revision", 0))
	var serving_replay := BiologyManager.apply_consumed_serving(serving_request)
	_expect(bool(serving_replay.get("duplicate", false)) \
			and int(BiologyManager.get_record(eater_id).get(
				"revision", 0)) == serving_revision,
		"serving retry does not consume biological state twice")
	var serving_conflict := serving_request.duplicate(true)
	serving_conflict["serving_count"] = 2
	_expect(BiologyManager.apply_consumed_serving(
		serving_conflict).get("error") == "biological_transaction_conflict",
		"changed serving cannot reuse its inventory commit identity")
	_expect(BiologyManager.apply_consumed_serving({
		"transaction_id": "biology.probe.serving.uncommitted",
		"actor_id": eater_id,
		"resource_commit_status": "rejected",
		"biological_payload": {"satiety_points": 50.0},
	}).get("error") == "consumption_not_committed" \
			and int(BiologyManager.get_record(eater_id).get(
				"revision", 0)) == serving_revision,
		"uncommitted inventory consumption cannot mutate hunger")
	var pressure := BiologyManager.apply_nourishment_pressure({
		"transaction_id": "biology.probe.hunger.1",
		"actor_id": eater_id,
		"hunger_delta": 20.0,
		"elapsed_hours": 8.0,
	})
	_expect(bool(pressure.get("ok", false)) \
			and is_equal_approx(float(BiologyManager.hunger_level(
				eater_id).get("severity", 0.0)), 60.0),
		"settlement nourishment pressure advances canonical hunger")
	var population := BiologyManager.population_health_summary(SETTLEMENT_ID)
	_expect(str(population.get("schema", "")) \
			== "leyforge.xset.population-health-summary" \
			and int(population.get("coverage_count", 0)) == 4 \
			and population.has("workforce_capacity_modifier") \
			and population.has("medical_demand"),
		"settlement receives a typed population health aggregate")
	var lod := BiologyManager.lod_snapshot(eater_id)
	_expect(str((lod.get("identity", {}) as Dictionary).get(
			"biological_record_id", "")) \
			== BiologyManager.biological_record_id(eater_id) \
			and (lod.get("quantities", {}) as Dictionary).has("actor_core") \
			and (lod.get("irreversible", {}) as Dictionary).has("revision"),
		"Set-29 supplies explicit LOD identity, quantity and irreversible partitions")
	var transient_id := "actor.biology.probe.transient"
	_expect(bool(BiologyManager.register_actor_projection(
		transient_id, {"health": 5.0, "max_health": 5.0},
		"transient_probe", "", "", "transient").get("ok", false)),
		"transient biological actor can be registered for streamed presentation")
	var saved := BiologyManager.serialize_state()
	_expect(str(saved.get("schema", "")) == "leyforge.biological-state" \
			and int(saved.get("version", 0)) == 1 \
			and str(saved.get("state_hash", "")).length() == 64,
		"biological persistence envelope is independently versioned and hashed")
	var saved_actor_ids: Array[String] = []
	for record_value in saved.get("records", []):
		if record_value is Dictionary:
			saved_actor_ids.append(str(record_value.get("actor_id", "")))
	_expect(transient_id not in saved_actor_ids \
			and eater_id in saved_actor_ids \
			and not (saved.get("transaction_journal", []) as Array).is_empty(),
		"save excludes transient actors while retaining persistent state and journal")
	var json_roundtrip: Variant = JSON.parse_string(JSON.stringify(saved))
	BiologyManager.reset()
	_expect(BiologyManager.restore_state(json_roundtrip, SEED, WORLD_ID) \
			and BiologyManager.restored_from_state,
		"JSON roundtrip restores the biological owner as canonical saved state")
	_expect(is_equal_approx(float(BiologyManager.hunger_level(
			eater_id).get("severity", 0.0)), 60.0) \
			and not BiologyManager.has_actor(transient_id),
		"restored quantities survive while transient actors remain absent")
	var restored_replay := BiologyManager.apply_consumed_serving(serving_request)
	_expect(bool(restored_replay.get("duplicate", false)) \
			and is_equal_approx(float(BiologyManager.hunger_level(
				eater_id).get("severity", 0.0)), 60.0),
		"restored transaction journal prevents duplicate serving consumption")
	var tampered := saved.duplicate(true)
	tampered["world_seed"] = SEED + 1
	BiologyManager.reset()
	_expect(not BiologyManager.restore_state(tampered, SEED, WORLD_ID),
		"tampered biological envelope is rejected")
	_expect(not BiologyManager.restore_state(saved, SEED, "world.wrong"),
		"biological state cannot cross a mismatched world identity")
	_expect(BiologyManager.restore_state(saved, SEED, WORLD_ID),
		"valid biological envelope remains restorable after rejected candidates")
	BiologyManager.reset()
	BiologyManager.initialize(SEED + 100, "world.biology.probe.alternate")
	var cross_world_registration := BiologyManager.register_actor_projection(
		eater_id, {"health": 50.0, "max_health": 50.0},
		"nourishment_probe", "", SETTLEMENT_ID, "persistent")
	_expect(bool(cross_world_registration.get("ok", false)) \
			and not bool(cross_world_registration.get("duplicate", true)),
		"same stable actor ID in a different world receives distinct evidence identity")


func _test_hamlet_integration() -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	HamletState.initialized = false
	var anchors := {
		"hamlet": Vector2i(0, 0),
		"warehouse": Vector2i(8, 0),
		"watchtower_site": Vector2i(-8, 0),
		"goblin_camp": Vector2i(120, 0),
		"raid_approach": Vector2i(20, 0),
	}
	HamletState.initialize(SEED + 1, anchors)
	_expect(HamletState.initialized \
			and BiologyManager.actor_count("persistent") \
				== HamletState.ROSTER.size(),
		"Hamlet materialisation hands every resident to the biological owner")
	var npc_id := HamletState.get_npc_ids()[0]
	var npc := HamletState.get_npc_record(npc_id)
	_expect(str(npc.get("biological_record_ref", "")) \
			== BiologyManager.biological_record_id(npc_id) \
			and bool(npc.get("biological_projection", false)),
		"focused NPC facade carries the canonical biological reference")
	var before := BiologyManager.current_health(npc_id)
	var hurt := HamletState.apply_npc_damage(npc_id, 7.0, "probe", false)
	_expect(bool(hurt.get("ok", false)) \
			and is_equal_approx(BiologyManager.current_health(npc_id), before - 7.0) \
			and is_equal_approx(float(HamletState.get_npc_record(
				npc_id).get("health", 0.0)), before - 7.0),
		"Hamlet damage requests Set-29 mutation then refreshes compatibility")
	_expect(str(PeopleManager.get_person(npc_id).get(
			"existence_state", "")) == "alive",
		"nonlethal Hamlet damage leaves lifecycle state with PeopleManager")
	HamletState.npc_records[npc_id]["health"] = 999.0
	HamletState.npc_records[npc_id]["injured"] = false
	HamletState.apply_biology_owner_projection()
	_expect(is_equal_approx(float(HamletState.get_npc_record(
			npc_id).get("health", 0.0)), BiologyManager.current_health(npc_id)) \
			and float(HamletState.get_npc_record(npc_id).get(
				"health", 0.0)) != 999.0,
		"canonical biological state defeats a stale focused facade")
	var lod := HamletState.npc_lod_snapshot(npc_id)
	_expect((lod.get("quantities", {}) as Dictionary).has(
			"biological_owner") \
			and not ((lod.get("quantities", {}) as Dictionary).get(
				"biological_owner", {}) as Dictionary).is_empty(),
		"NPC LOD snapshot embeds the owner-supplied biological partition")
	var lethal := HamletState.apply_npc_damage(npc_id, 500.0, "probe", true)
	_expect(bool(lethal.get("ok", false)) \
			and not bool(lethal.get("alive", true)) \
			and is_zero_approx(BiologyManager.current_health(npc_id)),
		"Hamlet can request lethal health consequence and then decide death")
	_expect(str(PeopleManager.get_person(npc_id).get(
			"existence_state", "")) == "dead",
		"final resident death is recorded by the persistent-person owner")


func _test_combat_integration() -> void:
	ProductionKernel.reset_for_verification()
	PeopleManager.reset()
	BiologyManager.reset()
	CombatState.initialized = false
	var combat_seed := SEED + 2
	var anchors := {
		"hamlet": Vector2i(0, 0),
		"warehouse": Vector2i(8, 0),
		"watchtower_site": Vector2i(-8, 0),
		"goblin_camp": Vector2i(120, 0),
		"raid_approach": Vector2i(20, 0),
	}
	CombatState.initialize(combat_seed, anchors)
	_expect(BiologyManager.has_actor(CombatState.PLAYER_BIOLOGICAL_ACTOR_ID) \
			and is_equal_approx(CombatState.player_health,
				BiologyManager.current_health(
					CombatState.PLAYER_BIOLOGICAL_ACTOR_ID)),
		"Combat initialisation creates one canonical player biological record")
	var player_hit := CombatState.damage_player(
		12.0, "actor.probe.enemy", "combat.probe.player_hit.1")
	_expect(bool(player_hit.get("ok", false)) \
			and is_equal_approx(CombatState.player_health, 88.0) \
			and is_equal_approx(BiologyManager.current_health(
				CombatState.PLAYER_BIOLOGICAL_ACTOR_ID), 88.0),
		"player damage routes resolved Combat consequence through Set 29")
	var player_replay := CombatState.damage_player(
		12.0, "actor.probe.enemy", "combat.probe.player_hit.1")
	_expect(bool(player_replay.get("duplicate", false)) \
			and is_equal_approx(CombatState.player_health, 88.0),
		"Combat player damage honors an external event idempotency key")
	CombatState.recover_player()
	_expect(is_equal_approx(CombatState.player_health, 100.0) \
			and is_equal_approx(BiologyManager.current_health(
				CombatState.PLAYER_BIOLOGICAL_ACTOR_ID), 100.0),
		"Combat respawn authorises zero-safe biological recovery")
	var started := CombatState.begin_raid({
		"tower_stages": 0,
		"ward_active": false,
		"guard_ready": false,
		"food_stocked": false,
		"lighting_ready": false,
	})
	CombatState.advance(CombatState.RAID_WARNING_SECONDS + 0.1)
	_expect(bool(started.get("ok", false)) \
			and CombatState.phase == "assault" \
			and CombatState.get_enemy_ids().size() == 4,
		"raid creates the four Combat-owned enemy identities")
	var enemy_id := CombatState.get_enemy_ids()[0]
	var enemy := CombatState.get_enemy_record(enemy_id)
	var enemy_biology_id := str(enemy.get("biological_actor_id", ""))
	_expect(not enemy_biology_id.is_empty() \
			and BiologyManager.has_actor(enemy_biology_id) \
			and str(BiologyManager.get_record(enemy_biology_id).get(
				"persistence_class", "")) == "conditional",
		"raid enemy health is a conditional canonical biological record")
	var enemy_before := BiologyManager.current_health(enemy_biology_id)
	var enemy_hit := CombatState.damage_enemy(enemy_id, {
		"transaction_id": "combat.probe.enemy_hit.1",
		"source": "actor.player.local",
		"damage_type": "physical.probe",
		"amount": 5.0,
	})
	_expect(bool(enemy_hit.get("ok", false)) \
			and is_equal_approx(BiologyManager.current_health(
				enemy_biology_id), enemy_before - 5.0) \
			and is_equal_approx(float(CombatState.get_enemy_record(
				enemy_id).get("health", 0.0)), enemy_before - 5.0),
		"enemy damage commits biological truth before refreshing Combat view")
	var defeated := CombatState.damage_enemy(enemy_id, {
		"transaction_id": "combat.probe.enemy_hit.lethal",
		"source": "actor.player.local",
		"damage_type": "physical.probe",
		"amount": 500.0,
	})
	_expect(bool(defeated.get("ok", false)) \
			and bool(defeated.get("defeated", false)) \
			and is_zero_approx(BiologyManager.current_health(enemy_biology_id)),
		"Combat decides enemy defeat after Set 29 reports zero health")
	var biological_save := BiologyManager.serialize_state()
	var combat_save := CombatState.serialize_state()
	(combat_save.get("enemy_records", {}) as Dictionary)[enemy_id]["health"] = 999.0
	combat_save["player_health"] = 1.0
	BiologyManager.reset()
	_expect(BiologyManager.restore_state(
		biological_save, combat_seed, ""),
		"combat integration fixture restores canonical biological domain first")
	CombatState.initialized = false
	_expect(CombatState.restore_state(combat_save, combat_seed),
		"Combat compatibility state restores after the biological owner")
	_expect(is_zero_approx(float(CombatState.get_enemy_record(
			enemy_id).get("health", -1.0))) \
			and is_equal_approx(CombatState.player_health,
				BiologyManager.current_health(
					CombatState.PLAYER_BIOLOGICAL_ACTOR_ID)),
		"saved canonical biology defeats stale enemy and player compatibility fields")


func _test_save_restore_order() -> void:
	var coordinator: SaveCoordinator = SaveCoordinatorScript.new()
	var order := coordinator.restore_order()
	_expect(order.size() == 19,
		"save coordinator exposes nineteen ordered restore domains")
	_expect(order.find("biology_owner") == order.find("people_owner") + 1 \
			and order.find("social_owner") == order.find("biology_owner") + 1 \
			and order.find("political_owner") == order.find("social_owner") + 1 \
			and order.find("movement_owner") == order.find("political_owner") + 1 \
			and order.find("event_owner") == order.find("movement_owner") + 1 \
			and order.find("event_owner") < order.find("settlements") \
			and order.find("political_owner") < order.find("combat"),
		"specialist owners restore after people and before dependent projections")
	var copy := coordinator.restore_order()
	copy.clear()
	_expect(coordinator.restore_order().size() == 19,
		"callers cannot mutate canonical restore order")


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
