extends Node
## Canonical Set-29 owner for persistent biological and survival state.
##
## Combat, movement, settlements, items and actor scenes supply resolved facts
## or capability payloads through commands. They may retain read-only
## compatibility projections, but this service is the only mutable owner of
## Health, Stamina, Fatigue, nourishment, exposure and persistent injury state.

signal biology_changed
signal actor_changed(actor_id: String)
signal population_changed(population_ref: String)

const STATE_SCHEMA := "leyforge.biological-state"
const STATE_VERSION := 1
const RECORD_TYPE := "BiologicalActorRecord"
const INTERFACE_ID := "leyforge.system.interface.survival"
const INTERFACE_VERSION := "1.0"
const TRANSACTION_RESULT_SCHEMA := "leyforge.biological-transaction-result"
const EVIDENCE_OWNER := "set29.biology"
const PLAYER_ACTOR_ID := "actor.player.local"
const MAX_EVIDENCE_REFS := 128
const MAX_TRANSACTION_JOURNAL := 256
const MAX_FOOD_LEDGER := 24
const MAX_INJURIES := 6

const VALID_PERSISTENCE_CLASSES: Array[String] = [
	"persistent", "conditional", "transient",
]
const VALID_QUERY_MODES: Array[String] = [
	"estimate", "begin", "continue", "commit", "end",
]
const VALID_INJURY_SEVERITIES: Array[String] = [
	"minor", "moderate", "severe", "critical",
]
const INJURY_SEVERITY_RANK := {
	"none": 0,
	"minor": 1,
	"moderate": 2,
	"severe": 3,
	"critical": 4,
}

var initialized := false
var restored_from_state := false
var world_seed := 0
var world_id := ""
var _records: Dictionary = {}
var _transactions: Dictionary = {}
var _transaction_order: Array[String] = []


func reset() -> void:
	initialized = false
	restored_from_state = false
	world_seed = 0
	world_id = ""
	_records.clear()
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


func actor_ids(persistence_class: String = "") -> Array[String]:
	var result: Array[String] = []
	for actor_value in _records.keys():
		var actor_id := str(actor_value)
		if persistence_class.is_empty() or str(
				(_records[actor_id] as Dictionary).get(
					"persistence_class", "persistent")) == persistence_class:
			result.append(actor_id)
	result.sort()
	return result


func actor_count(persistence_class: String = "") -> int:
	return actor_ids(persistence_class).size()


func has_actor(actor_id: String) -> bool:
	return _records.has(actor_id)


func biological_record_id(actor_id: String) -> String:
	return "biological_record.%s" % actor_id if not actor_id.is_empty() else ""


func get_record(actor_id: String) -> Dictionary:
	return (_records.get(actor_id, {}) as Dictionary).duplicate(true)


func register_actor_projection(
		actor_id: String,
		projection: Dictionary,
		source_kind: String = "compatibility",
		person_ref: String = "",
		settlement_ref: String = "",
		persistence_class: String = "persistent") -> Dictionary:
	_ensure_initialized(projection)
	if actor_id.is_empty():
		return {"ok": false, "error": "BIO-ID-001"}
	if persistence_class not in VALID_PERSISTENCE_CLASSES:
		return {"ok": false, "error": "invalid_persistence_class"}
	if _records.has(actor_id):
		var existing: Dictionary = _records[actor_id]
		if not person_ref.is_empty() \
				and str(existing.get("person_ref", "")) not in ["", person_ref]:
			return {"ok": false, "error": "biological_identity_conflict"}
		return {
			"ok": true,
			"duplicate": true,
			"record": existing.duplicate(true),
			"view": compatibility_actor_view(actor_id, projection),
		}
	var evidence_id := "evidence.biological.register.%s" % _world_scoped_token(
		actor_id)
	var payload := {
		"actor_id": actor_id,
		"biological_record_id": biological_record_id(actor_id),
		"person_ref": person_ref,
		"settlement_ref": settlement_ref,
		"source_kind": source_kind,
		"persistence_class": persistence_class,
		"world_seed": world_seed,
		"world_id": world_id,
	}
	var evidence := _commit_evidence(
		evidence_id, "biological_actor_registered", payload, actor_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var record := _new_record(
		actor_id, projection, source_kind, person_ref, settlement_ref,
		persistence_class, evidence_id)
	var validation := validate_record(record)
	if not bool(validation.get("ok", false)):
		return validation
	_records[actor_id] = record
	_publish_person_ref(record, "biology.register.%s" % _stable_token(actor_id))
	actor_changed.emit(actor_id)
	biology_changed.emit()
	if not settlement_ref.is_empty():
		population_changed.emit(settlement_ref)
	return {
		"ok": true,
		"duplicate": false,
		"evidence_id": evidence_id,
		"record": record.duplicate(true),
		"view": compatibility_actor_view(actor_id, projection),
	}


func reset_actor_for_spawn(
		actor_id: String,
		projection: Dictionary,
		transaction_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return register_actor_projection(
			actor_id, projection, str(projection.get("source_kind", "spawn")),
			str(projection.get("person_ref", "")),
			str(projection.get("settlement_ref", "")),
			str(projection.get("persistence_class", "conditional")))
	if transaction_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var request := {
		"transaction_id": transaction_id,
		"actor_id": actor_id,
		"projection": projection,
		"command": "reset_actor_for_spawn",
	}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var before: Dictionary = _records[actor_id]
	var candidate := before.duplicate(true)
	var maximum := maxf(1.0, float(projection.get(
		"max_health", projection.get("max_health_resolved", 100.0))))
	var core: Dictionary = candidate.get("actor_core", {}).duplicate(true)
	core["max_health_resolved"] = maximum
	core["current_health"] = clampf(float(projection.get(
		"health", projection.get("current_health", maximum))), 0.0, maximum)
	core["last_health_damage_time"] = {}
	core["recovery_eligible"] = true
	core["recovery_suppression_reasons"] = []
	candidate["actor_core"] = core
	var stamina: Dictionary = candidate.get("stamina", {}).duplicate(true)
	var max_stamina := maxf(1.0, float(projection.get(
		"max_stamina", stamina.get("max_stamina_resolved", 100.0))))
	stamina["max_stamina_resolved"] = max_stamina
	stamina["current_stamina"] = clampf(float(projection.get(
		"stamina", max_stamina)), 0.0, max_stamina)
	stamina["regen_delay_until"] = 0
	stamina["depletion_state"] = "available"
	candidate["stamina"] = stamina
	candidate["fatigue"] = _default_fatigue_state(float(
		projection.get("fatigue", 0.0)))
	candidate["injuries"] = []
	candidate["physical_injury_state"] = _default_physical_injury_state(actor_id)
	return _commit_candidate(
		actor_id, before, candidate, request, transaction_id,
		"biological_actor_spawn_reset", {
			"reason_code": "spawn_reset",
			"biological_outcome_references": [biological_record_id(actor_id)],
		})


func release_transient_actor(actor_id: String) -> bool:
	if not _records.has(actor_id) or str(
			(_records[actor_id] as Dictionary).get("persistence_class", "")) \
			!= "transient":
		return false
	_records.erase(actor_id)
	actor_changed.emit(actor_id)
	biology_changed.emit()
	return true


func reconcile_settlement_projection(
		settlement_ref: String,
		resident_value: Variant,
		allow_existing_updates: bool = false) -> Dictionary:
	if settlement_ref.is_empty() or not (resident_value is Dictionary):
		return {"ok": false, "error": "invalid_biological_projection"}
	var residents: Dictionary = resident_value
	var projected := residents.duplicate(true)
	var ids: Array = residents.keys()
	ids.sort_custom(func(a: Variant, b: Variant) -> bool:
		return str(a) < str(b))
	for actor_value in ids:
		var actor_id := str(actor_value)
		if not (residents[actor_value] is Dictionary):
			return {"ok": false, "error": "invalid_actor_projection"}
		var projection: Dictionary = residents[actor_value]
		var person_ref := actor_id if PeopleManager.has_person(actor_id) else str(
			projection.get("person_id", ""))
		if not _records.has(actor_id):
			var registered := register_actor_projection(
				actor_id, projection, "settlement_projection", person_ref,
				settlement_ref, "persistent")
			if not bool(registered.get("ok", false)):
				return registered
		elif allow_existing_updates and not restored_from_state:
			var existing_revision := int((_records[actor_id] as Dictionary).get(
				"revision", 0))
			var migrated := migrate_legacy_projection(
				actor_id, projection,
				"biology.legacy_projection.%s.revision_%d" % [
					_stable_token(actor_id), existing_revision])
			if not bool(migrated.get("ok", false)):
				return migrated
		projected[actor_id] = compatibility_actor_view(actor_id, projection)
	return {
		"ok": true,
		"resident_records": projected,
		"record_count": ids.size(),
		"population_health_summary": population_health_summary(settlement_ref),
	}


func reconcile_people_owner() -> Dictionary:
	if not PeopleManager.initialized:
		return {"ok": false, "error": "people_owner_not_initialized"}
	var registered := 0
	var failures: Array[Dictionary] = []
	for person_id in PeopleManager.person_ids():
		if _records.has(person_id):
			_publish_person_ref(
				_records[person_id], "biology.ref.refresh.%s" % _stable_token(person_id))
			continue
		var person := PeopleManager.get_person(person_id)
		var result := register_actor_projection(
			person_id, {
				"health": 100.0,
				"max_health": 100.0,
				"needs": {"food": 0.8},
			}, "persistent_person", person_id,
			str(person.get("settlement_id", "")), "persistent")
		if bool(result.get("ok", false)):
			registered += 1
		else:
			failures.append({"person_id": person_id, "error": result.get(
				"error", "unknown")})
	return {
		"ok": failures.is_empty(),
		"registered": registered,
		"record_count": actor_count("persistent"),
		"failures": failures,
	}


func migrate_legacy_projection(
		actor_id: String,
		projection: Dictionary,
		transaction_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return register_actor_projection(actor_id, projection)
	var request := {
		"transaction_id": transaction_id,
		"actor_id": actor_id,
		"legacy_projection_hash": _hash_value(projection),
		"command": "migrate_legacy_projection",
	}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var before: Dictionary = _records[actor_id]
	var before_core: Dictionary = before.get("actor_core", {})
	var projected_maximum := maxf(1.0, float(projection.get(
		"max_health", before_core.get("max_health_resolved", 100.0))))
	var projected_health := clampf(float(projection.get(
		"health", before_core.get("current_health", projected_maximum))),
		0.0, projected_maximum)
	var needs_value: Variant = projection.get("needs", {})
	var projected_food_matches := true
	if needs_value is Dictionary and needs_value.has("food"):
		var before_hunger := float((before.get(
			"nourishment", {}) as Dictionary).get("hunger_severity", 0.0))
		var projected_hunger := clampf(
			(1.0 - float(needs_value.get("food", 0.8))) * 100.0,
			0.0, 100.0)
		projected_food_matches = is_equal_approx(
			before_hunger, projected_hunger)
	var projected_injury_matches := true
	if projection.has("injured"):
		projected_injury_matches = bool(projection.get("injured", false)) \
			== not (before.get("injuries", []) as Array).is_empty()
	if is_equal_approx(float(before_core.get(
			"max_health_resolved", 0.0)), projected_maximum) \
			and is_equal_approx(float(before_core.get(
				"current_health", 0.0)), projected_health) \
			and projected_food_matches and projected_injury_matches:
		return {
			"ok": true,
			"duplicate": true,
			"commit_status": "no_change",
			"actor_id": actor_id,
			"result_revision": int(before.get("revision", 0)),
			"record": before.duplicate(true),
		}
	var candidate := before.duplicate(true)
	var core: Dictionary = candidate.get("actor_core", {}).duplicate(true)
	var maximum := maxf(1.0, float(projection.get(
		"max_health", core.get("max_health_resolved", 100.0))))
	core["max_health_resolved"] = maximum
	core["current_health"] = clampf(float(projection.get(
		"health", core.get("current_health", maximum))), 0.0, maximum)
	candidate["actor_core"] = core
	var needs: Dictionary = projection.get("needs", {}) \
		if projection.get("needs", {}) is Dictionary else {}
	if needs.has("food"):
		var nourishment: Dictionary = candidate.get("nourishment", {}).duplicate(true)
		nourishment["hunger_severity"] = clampf(
			(1.0 - float(needs.get("food", 0.8))) * 100.0, 0.0, 100.0)
		candidate["nourishment"] = nourishment
	if projection.has("injured"):
		if bool(projection.get("injured", false)) \
				and (candidate.get("injuries", []) as Array).is_empty():
			var injury := _legacy_injury(actor_id, str(projection.get(
				"injury", "Legacy injury")), transaction_id)
			candidate["injuries"] = [injury]
		elif not bool(projection.get("injured", false)):
			candidate["injuries"] = []
			candidate["physical_injury_state"] = (
				_default_physical_injury_state(actor_id))
	return _commit_candidate(
		actor_id, before, candidate, request, transaction_id,
		"legacy_biological_projection_migrated", {
			"reason_code": "legacy_projection_migrated",
			"biological_outcome_references": [biological_record_id(actor_id)],
		})


func compatibility_actor_view(
		actor_id: String, compatibility: Dictionary = {}) -> Dictionary:
	var result := compatibility.duplicate(true)
	if not _records.has(actor_id):
		return result
	var record: Dictionary = _records[actor_id]
	var core: Dictionary = record.get("actor_core", {})
	var injury := injury_state(actor_id)
	var nourishment := hunger_level(actor_id)
	result["health"] = float(core.get("current_health", 0.0))
	result["max_health"] = float(core.get("max_health_resolved", 1.0))
	result["injured"] = int(injury.get("active_count", 0)) > 0
	result["injury"] = str(injury.get("display_summary", ""))
	var needs: Dictionary = result.get("needs", {}).duplicate(true) \
		if result.get("needs", {}) is Dictionary else {}
	needs["food"] = clampf(
		1.0 - float(nourishment.get("severity", 0.0)) / 100.0, 0.0, 1.0)
	result["needs"] = needs
	result["biological_record_ref"] = str(record.get(
		"biological_record_id", ""))
	result["authoritative_biological_record_type"] = RECORD_TYPE
	result["authoritative_biological_revision"] = int(record.get("revision", 0))
	result["authoritative_biological_state_hash"] = str(record.get(
		"state_hash", ""))
	result["biological_projection"] = true
	return result


func current_health(actor_id: String) -> float:
	return float((_records.get(actor_id, {}) as Dictionary).get(
		"actor_core", {}).get("current_health", 0.0))


func max_health(actor_id: String) -> float:
	return float((_records.get(actor_id, {}) as Dictionary).get(
		"actor_core", {}).get("max_health_resolved", 0.0))


func health_percent(actor_id: String) -> float:
	var maximum := max_health(actor_id)
	return clampf(current_health(actor_id) / maximum, 0.0, 1.0) \
		if maximum > 0.0 else 0.0


func health_band(actor_id: String) -> String:
	return str((_records.get(actor_id, {}) as Dictionary).get(
		"actor_core", {}).get("health_band", "unknown"))


func health_snapshot(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {}
	var record: Dictionary = _records[actor_id]
	var core: Dictionary = record.get("actor_core", {})
	return {
		"schema": "leyforge.set29.health-snapshot",
		"interface_id": INTERFACE_ID,
		"interface_version": INTERFACE_VERSION,
		"actor_id": actor_id,
		"current_health": float(core.get("current_health", 0.0)),
		"max_health": float(core.get("max_health_resolved", 0.0)),
		"health_percent": health_percent(actor_id),
		"health_band": str(core.get("health_band", "unknown")),
		"critical_condition": bool(core.get("critical_condition", false)),
		"stabilised": bool(core.get("stabilised", false)),
		"recovery_possible": bool(core.get("recovery_possible", false)),
		"source_state_revision": int(record.get("revision", 0)),
		"world_time": _world_time(),
	}


func hunger_level(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"applicable": false, "reason": "unknown_actor"}
	var record: Dictionary = _records[actor_id]
	var state: Dictionary = record.get("nourishment", {})
	return {
		"applicable": true,
		"severity": float(state.get("hunger_severity", 0.0)),
		"band": str(state.get("hunger_band", "sated")),
		"trend": str(state.get("hunger_trend", "stable")),
		"starvation_debt": float(state.get("starvation_debt_hours", 0.0)),
		"source_state_revision": int(record.get("revision", 0)),
	}


func thirst_level(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"applicable": false, "enabled": false, "reason": "unknown_actor"}
	var record: Dictionary = _records[actor_id]
	var state: Dictionary = record.get("hydration", {})
	var enabled := bool(state.get("thirst_enabled", false))
	var result := {
		"applicable": true,
		"enabled": enabled,
		"source_state_revision": int(record.get("revision", 0)),
	}
	if enabled:
		result["severity"] = float(state.get("thirst_severity", 0.0))
		result["band"] = str(state.get("thirst_band", "hydrated"))
		result["trend"] = str(state.get("thirst_trend", "stable"))
	return result


func body_temperature(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"applicable": false, "reason": "unknown_actor"}
	var record: Dictionary = _records[actor_id]
	var state: Dictionary = record.get("environment", {})
	return {
		"applicable": true,
		"thermal_load": float(state.get("thermal_load", 0.0)),
		"band": str(state.get("thermal_band", "comfortable")),
		"trend": str(state.get("thermal_trend", "stable")),
		"wetness": float(state.get("wetness", 0.0)),
		"cause_refs": (state.get("principal_cause_refs", []) as Array).duplicate(),
		"source_state_revision": int(record.get("revision", 0)),
	}


func fatigue(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"applicable": false, "reason": "unknown_actor"}
	var record: Dictionary = _records[actor_id]
	var state: Dictionary = record.get("fatigue", {})
	return {
		"applicable": true,
		"value": float(state.get("fatigue_value", 0.0)),
		"band": str(state.get("fatigue_band", "rested")),
		"trend": str(state.get("trend", "stable")),
		"source_state_revision": int(record.get("revision", 0)),
	}


func injury_state(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"applicable": false, "active_count": 0, "injuries": []}
	var record: Dictionary = _records[actor_id]
	var injuries: Array = record.get("injuries", [])
	var physical: Dictionary = record.get("physical_injury_state", {})
	var summaries: Array[Dictionary] = []
	var worst := "none"
	var display_summary := ""
	for injury_value in injuries:
		if not (injury_value is Dictionary):
			continue
		var injury: Dictionary = injury_value
		if str(injury.get("phase", "")) == "healed":
			continue
		var severity := str(injury.get("severity", "minor"))
		if int(INJURY_SEVERITY_RANK.get(severity, 0)) \
				> int(INJURY_SEVERITY_RANK.get(worst, 0)):
			worst = severity
			display_summary = "%s %s" % [
				severity.capitalize(), str(injury.get(
					"display_name", "injury"))]
		summaries.append({
			"injury_instance_id": str(injury.get("injury_instance_id", "")),
			"definition_id": str(injury.get("definition_id", "")),
			"region": str(injury.get("biological_region_id", "")),
			"severity": severity,
			"phase": str(injury.get("phase", "")),
			"bleeding_class": str(injury.get("bleed_class", "none")),
			"recovery_progress": float(injury.get("recovery_progress", 0.0)),
		})
	return {
		"applicable": true,
		"active_count": summaries.size(),
		"worst_severity": worst,
		"display_summary": display_summary,
		"injuries": summaries,
		"bleeding_class": str(physical.get("bleeding_class", "none")),
		"blood_loss": float(physical.get("blood_loss", 0.0)),
		"pain_load": float(physical.get("pain_load", 0.0)),
		"mobility_function": float(physical.get("mobility_function", 1.0)),
		"manual_function": float(physical.get("manual_function", 1.0)),
		"critical_condition": bool(physical.get("critical_condition", false)),
		"care_urgency": str(physical.get("care_urgency", "none")),
		"source_state_revision": int(record.get("revision", 0)),
	}


func disease_state(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"applicable": false, "active_count": 0, "conditions": []}
	var record: Dictionary = _records[actor_id]
	var conditions: Array = record.get("disease_instances", [])
	return {
		"applicable": true,
		"active_count": conditions.size(),
		"conditions": conditions.duplicate(true),
		"knowledge_filtered": true,
		"source_state_revision": int(record.get("revision", 0)),
	}


func poison_level(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"applicable": false, "danger": 0.0, "active_refs": []}
	var record: Dictionary = _records[actor_id]
	var poisons: Array = record.get("poison_instances", [])
	var danger := 0.0
	var refs: Array[String] = []
	for poison_value in poisons:
		if poison_value is Dictionary:
			danger = maxf(danger, float(poison_value.get("danger", 0.0)))
			refs.append(str(poison_value.get("instance_id", "")))
	return {
		"applicable": true,
		"danger": clampf(danger, 0.0, 100.0),
		"band": _danger_band(danger),
		"active_refs": refs,
		"source_state_revision": int(record.get("revision", 0)),
	}


func stamina_modifier(actor_id: String) -> Dictionary:
	return _modifier_query(actor_id, "stamina_modifier", 1.0)


func carry_penalty(actor_id: String) -> Dictionary:
	return _modifier_query(actor_id, "carry_penalty", 0.0)


func work_capacity_modifier(actor_id: String) -> Dictionary:
	return _modifier_query(actor_id, "work_capacity_modifier", 1.0)


func biological_capability_summary(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	var record: Dictionary = _records[actor_id]
	var bundle: Dictionary = record.get("modifier_bundle", {})
	var core: Dictionary = record.get("actor_core", {})
	return {
		"ok": true,
		"schema": "leyforge.set29.biological-capability-summary",
		"interface_id": INTERFACE_ID,
		"interface_version": INTERFACE_VERSION,
		"actor_id": actor_id,
		"available_for_assignment": bool(bundle.get(
			"available_for_assignment", false)),
		"work_capacity_modifier": float(bundle.get(
			"work_capacity_modifier", 0.0)),
		"stamina_modifier": float(bundle.get("stamina_modifier", 1.0)),
		"stamina_drain_modifier": float(bundle.get(
			"stamina_drain_modifier", 1.0)),
		"recovery_modifier": float(bundle.get("recovery_modifier", 1.0)),
		"mobility_function": float(bundle.get("mobility_function", 1.0)),
		"carry_penalty": float(bundle.get("carry_penalty", 0.0)),
		"critical_condition": bool(core.get("critical_condition", false)),
		"care_need": str(bundle.get("care_need", "none")),
		"reason_codes": (bundle.get("reason_codes", []) as Array).duplicate(),
		"source_state_revision": int(record.get("revision", 0)),
		"effective_world_time": _world_time(),
	}


func social_biological_summary(
		actor_id: String,
		disclosure_context: Dictionary = {}) -> Dictionary:
	## XSET-005 exposes only social-safe capability and care information. Set 28
	## may react to this snapshot but never mutates the biological record.
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	var record: Dictionary = _records[actor_id]
	var core: Dictionary = record.get("actor_core", {})
	var bundle: Dictionary = record.get("modifier_bundle", {})
	var physical: Dictionary = record.get("physical_injury_state", {})
	var observer_id := str(disclosure_context.get("observer_id", ""))
	var private_details_allowed := bool(disclosure_context.get(
		"allow_private_details", false)) or observer_id == actor_id
	var critical_alert_allowed := bool(disclosure_context.get(
		"allow_critical_alert", false)) or private_details_allowed
	var critical := bool(core.get("critical_condition", false))
	var condition_summary := {
		"health_band": str(core.get("health_band", "unknown")),
		"mobility_band": _mobility_band(float(bundle.get(
			"mobility_function", 1.0))),
		"care_need": str(bundle.get("care_need", "none")),
		"visibly_injured": not (record.get("injuries", []) as Array).is_empty(),
		"visible_distress": critical or float(bundle.get(
			"work_capacity_modifier", 1.0)) < 0.35,
	}
	if private_details_allowed:
		condition_summary["active_injury_count"] = (
			record.get("injuries", []) as Array).size()
		condition_summary["disease_condition_count"] = (
			record.get("disease_instances", []) as Array).size()
		condition_summary["toxin_condition_count"] = (
			record.get("poison_instances", []) as Array).size()
	var care_need := str(bundle.get("care_need", "none"))
	var treatment_urgency := "critical" if critical else care_need
	return {
		"ok": true,
		"schema": "leyforge.xset.social-biological-summary",
		"version": "1.1",
		"source_owner": "set29",
		"entity_ref": actor_id,
		"recovery_status": _recovery_status(actor_id),
		"care_need": care_need,
		"treatment_urgency": treatment_urgency,
		"assignment_survival_availability": bool(bundle.get(
			"available_for_assignment", false)),
		"conversation_available": not critical,
		"socially_relevant_condition_summary": condition_summary,
		"critical_alert_if_disclosure_allowed": critical \
			if critical_alert_allowed else false,
		"carry_penalty_compatibility_value": float(bundle.get(
			"carry_penalty", 0.0)),
		"knowledge_visibility_class": "self_or_authorised" \
			if private_details_allowed else "socially_observable",
		"reason_codes": (bundle.get("reason_codes", []) as Array).duplicate(),
		"world_time": _world_time(),
		"source_revision": int(record.get("revision", 0)),
	}


func assignment_availability(actor_id: String) -> Dictionary:
	var summary := biological_capability_summary(actor_id)
	if not bool(summary.get("ok", false)):
		return summary
	return {
		"ok": true,
		"schema": "leyforge.document07.biological-availability",
		"person_ref": actor_id,
		"available": bool(summary.get("available_for_assignment", false)),
		"work_capacity_modifier": float(summary.get(
			"work_capacity_modifier", 0.0)),
		"recovery_status": _recovery_status(actor_id),
		"care_need": str(summary.get("care_need", "none")),
		"critical_condition": bool(summary.get("critical_condition", false)),
		"movement_modifier_ref": biological_record_id(actor_id),
		"reason_codes": (summary.get("reason_codes", []) as Array).duplicate(),
		"source_revision": int(summary.get("source_state_revision", 0)),
		"world_time": _world_time(),
	}


func biological_mobility_modifier_snapshot(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	var record: Dictionary = _records[actor_id]
	var bundle: Dictionary = record.get("modifier_bundle", {})
	var restrictions: Array = bundle.get("hard_restrictions", [])
	return {
		"ok": true,
		"schema": "leyforge.xset.biological-mobility-modifier-snapshot",
		"entity_id": actor_id,
		"stamina_modifier": float(bundle.get("stamina_modifier", 1.0)),
		"carry_penalty": float(bundle.get("carry_penalty", 0.0)),
		"fatigue_movement_modifier": float(bundle.get(
			"fatigue_movement_modifier", 1.0)),
		"injury_mobility_function": float(bundle.get(
			"mobility_function", 1.0)),
		"injury_movement_modifiers": (
			bundle.get("injury_movement_modifiers", []) as Array).duplicate(true),
		"thermal_movement_modifier": float(bundle.get(
			"thermal_movement_modifier", 1.0)),
		"disease_or_toxin_movement_modifiers": (
			bundle.get("disease_or_toxin_movement_modifiers", []) \
				as Array).duplicate(true),
		"max_speed_modifier": float(bundle.get("movement_modifier", 1.0)),
		"acceleration_modifier": float(bundle.get("movement_modifier", 1.0)),
		"jump_modifier": float(bundle.get("jump_modifier", 1.0)),
		"sprint_allowed": "no_sprint" not in restrictions,
		"crouch_allowed": "no_crouch" not in restrictions,
		"crawl_allowed": "no_crawl" not in restrictions,
		"hard_restrictions": restrictions.duplicate(),
		"reason_codes": (bundle.get("reason_codes", []) as Array).duplicate(),
		"source_state_revision": int(record.get("revision", 0)),
		"effective_world_time": _world_time(),
	}


func population_health_summary(population_ref: String) -> Dictionary:
	var matching: Array[String] = []
	for actor_id in actor_ids():
		if str((_records[actor_id] as Dictionary).get(
				"settlement_ref", "")) == population_ref:
			matching.append(actor_id)
	var capacity_total := 0.0
	var hunger_total := 0.0
	var injured_count := 0
	var disease_count := 0
	var poison_count := 0
	var medical_demand := 0
	var protected: Array[String] = []
	var profile_counts := {}
	var max_revision := 0
	for actor_id in matching:
		var record: Dictionary = _records[actor_id]
		var bundle: Dictionary = record.get("modifier_bundle", {})
		capacity_total += float(bundle.get("work_capacity_modifier", 1.0))
		hunger_total += float((record.get("nourishment", {}) as Dictionary).get(
			"hunger_severity", 0.0))
		if not (record.get("injuries", []) as Array).is_empty():
			injured_count += 1
			medical_demand += 1
		if not (record.get("disease_instances", []) as Array).is_empty():
			disease_count += 1
			medical_demand += 1
		if not (record.get("poison_instances", []) as Array).is_empty():
			poison_count += 1
			medical_demand += 1
		if bool((record.get("actor_core", {}) as Dictionary).get(
				"critical_condition", false)):
			protected.append(actor_id)
		var profile_ref := str(record.get("profile_ref", "profile.biological.default"))
		profile_counts[profile_ref] = int(profile_counts.get(profile_ref, 0)) + 1
		max_revision = maxi(max_revision, int(record.get("revision", 0)))
	var profile_coverage: Array[Dictionary] = []
	var profiles: Array = profile_counts.keys()
	profiles.sort()
	for profile_value in profiles:
		profile_coverage.append({
			"profile_ref": str(profile_value),
			"count": int(profile_counts[profile_value]),
		})
	var count := matching.size()
	var injury_fraction := float(injured_count) / float(count) if count > 0 else 0.0
	return {
		"schema": "leyforge.xset.population-health-summary",
		"summary_id": "population_health.%s" % population_ref,
		"population_or_household_ref": population_ref,
		"coverage_count": count,
		"profile_coverage": profile_coverage,
		"food_requirement_or_demand": _stable_interface_number(
			hunger_total / float(count) if count > 0 else 0.0),
		"hydration_requirement_if_enabled": 0.0,
		"medical_demand": medical_demand,
		"treatment_backlog": medical_demand,
		"workforce_capacity_modifier": _stable_interface_number(
			capacity_total / float(count) if count > 0 else 1.0),
		"injury_downtime_band": _burden_band(injury_fraction),
		"disease_or_outbreak_burden": disease_count,
		"poison_or_toxin_burden": poison_count,
		"protected_named_case_refs": protected,
		"world_time": _world_time(),
		"source_revision": max_revision,
	}


func apply_resolved_biological_damage(request: Dictionary) -> Dictionary:
	var transaction_id := _request_transaction_id(request)
	var actor_id := str(request.get(
		"actor_id", request.get("entity_id", request.get("target_ref", ""))))
	if transaction_id.is_empty() or actor_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	var before: Dictionary = _records[actor_id]
	if request.has("expected_prior_revision") \
			and int(request.get("expected_prior_revision", -1)) \
			!= int(before.get("revision", 0)):
		return {"ok": false, "error": "biological_revision_conflict"}
	var amount := maxf(0.0, float(request.get(
		"resolved_health_damage", request.get(
			"final_damage_amount", request.get("amount", 0.0)))))
	var candidate := before.duplicate(true)
	var core: Dictionary = candidate.get("actor_core", {}).duplicate(true)
	var previous := float(core.get("current_health", 0.0))
	var maximum := maxf(1.0, float(core.get("max_health_resolved", 1.0)))
	var floor_value := clampf(float(request.get("minimum_health", 0.0)), 0.0, maximum)
	core["current_health"] = maxf(floor_value, previous - amount)
	if amount > 0.0:
		core["last_health_damage_time"] = _world_time()
		core["recovery_eligible"] = false
		core["recovery_suppression_reasons"] = ["recent_damage"]
		core["last_damage_source_ref"] = str(request.get(
			"source_actor_ref", request.get("source", "unknown")))
		core["last_damage_event_ref"] = transaction_id
	candidate["actor_core"] = core
	var injury_changes: Array[Dictionary] = []
	if bool(request.get("injury_permitted", false)) \
			or not str(request.get("minimum_injury_severity", "")).is_empty():
		injury_changes = _apply_trauma_to_candidate(
			candidate, request, transaction_id)
	var result_fields := {
		"reason_code": "applied",
		"current_health": float(core.get("current_health", 0.0)),
		"max_health": maximum,
		"health_delta": float(core.get("current_health", 0.0)) - previous,
		"injury_state_changes": injury_changes,
		"resource_commit_reference": str(request.get(
			"resource_commit_reference", request.get("permission_result_ref", ""))),
	}
	return _commit_candidate(
		actor_id, before, candidate, request, transaction_id,
		"resolved_biological_damage_applied", result_fields)


func apply_resolved_biological_trauma(request: Dictionary) -> Dictionary:
	var adapted := request.duplicate(true)
	adapted["resolved_health_damage"] = float(request.get(
		"resolved_health_damage", 0.0))
	adapted["injury_permitted"] = true
	return apply_resolved_biological_damage(adapted)


func submit_biological_healing_request(request: Dictionary) -> Dictionary:
	var transaction_id := _request_transaction_id(request)
	var actor_id := str(request.get("actor_id", request.get("target_ref", "")))
	if transaction_id.is_empty() or actor_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	var before: Dictionary = _records[actor_id]
	var candidate := before.duplicate(true)
	var core: Dictionary = candidate.get("actor_core", {}).duplicate(true)
	var previous := float(core.get("current_health", 0.0))
	if previous <= 0.0 and not bool(request.get(
			"allow_recovery_from_zero", false)):
		return {"ok": false, "error": "external_revival_authorisation_required"}
	var maximum := maxf(1.0, float(core.get("max_health_resolved", 1.0)))
	var ceiling := clampf(float(request.get("allowed_ceiling", maximum)), 0.0, maximum)
	var amount := maxf(0.0, float(request.get(
		"healing_amount", request.get("amount", 0.0))))
	core["current_health"] = minf(ceiling, previous + amount)
	core["recovery_eligible"] = float(core["current_health"]) > 0.0
	core["recovery_suppression_reasons"] = []
	candidate["actor_core"] = core
	return _commit_candidate(
		actor_id, before, candidate, request, transaction_id,
		"biological_healing_applied", {
			"reason_code": "healing_applied",
			"current_health": float(core["current_health"]),
			"max_health": maximum,
			"health_delta": float(core["current_health"]) - previous,
			"resource_commit_reference": str(request.get(
				"resource_commit_reference", "")),
		})


func apply_consumed_serving(request: Dictionary) -> Dictionary:
	var transaction_id := _request_transaction_id(request)
	var actor_id := str(request.get("actor_id", ""))
	if transaction_id.is_empty() or actor_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	var commit_status := str(request.get(
		"resource_commit_status", request.get("inventory_commit_status", "committed")))
	if commit_status != "committed":
		return {"ok": false, "error": "consumption_not_committed"}
	var payload: Dictionary = request.get("biological_payload", {}) \
		if request.get("biological_payload", {}) is Dictionary else {}
	var before: Dictionary = _records[actor_id]
	var candidate := before.duplicate(true)
	var nourishment: Dictionary = candidate.get("nourishment", {}).duplicate(true)
	var previous_hunger := float(nourishment.get("hunger_severity", 0.0))
	var servings := maxf(0.0, float(request.get("serving_count", 1.0)))
	var satiety := maxf(0.0, float(payload.get("satiety_points", 0.0))) * servings
	nourishment["hunger_severity"] = maxf(0.0, previous_hunger - satiety)
	nourishment["hunger_trend"] = "falling" if satiety > 0.0 else "stable"
	var energy := maxf(0.0, float(payload.get("nutrition_energy_units", 0.0)))
	var protein := maxf(0.0, float(payload.get("nutrition_protein_units", 0.0)))
	var produce := maxf(0.0, float(payload.get("nutrition_produce_units", 0.0)))
	nourishment["energy_satisfaction"] = clampf(
		float(nourishment.get("energy_satisfaction", 70.0)) * 0.9 + energy * 10.0,
		0.0, 100.0)
	nourishment["protein_satisfaction"] = clampf(
		float(nourishment.get("protein_satisfaction", 70.0)) * 0.9 + protein * 10.0,
		0.0, 100.0)
	nourishment["produce_satisfaction"] = clampf(
		float(nourishment.get("produce_satisfaction", 70.0)) * 0.9 + produce * 10.0,
		0.0, 100.0)
	nourishment["nutrition_score"] = (
		float(nourishment["energy_satisfaction"])
		+ float(nourishment["protein_satisfaction"])
		+ float(nourishment["produce_satisfaction"])) / 3.0
	var ledger: Array = nourishment.get("recent_food_ledger", [])
	ledger.append({
		"transaction_id": transaction_id,
		"source_definition_id": str(payload.get(
			"source_definition_id", request.get("source_item_ref", ""))),
		"serving_count": servings,
		"satiety_points": satiety,
		"nutrition": [energy, protein, produce],
		"world_time": _world_time(),
	})
	while ledger.size() > MAX_FOOD_LEDGER:
		ledger.pop_front()
	nourishment["recent_food_ledger"] = ledger
	nourishment["last_consumption_time"] = _world_time()
	nourishment["last_transaction_id"] = transaction_id
	candidate["nourishment"] = nourishment
	var hydration: Dictionary = candidate.get("hydration", {}).duplicate(true)
	if bool(hydration.get("thirst_enabled", false)):
		hydration["thirst_severity"] = maxf(
			0.0, float(hydration.get("thirst_severity", 0.0))
			- maxf(0.0, float(payload.get("hydration_points", 0.0))) * servings)
		candidate["hydration"] = hydration
	return _commit_candidate(
		actor_id, before, candidate, request, transaction_id,
		"consumed_serving_applied", {
			"reason_code": "serving_consumed",
			"hunger_before": previous_hunger,
			"hunger_after": float(nourishment["hunger_severity"]),
			"resource_commit_reference": str(request.get(
				"resource_commit_reference", request.get("source_item_ref", ""))),
		})


func apply_nourishment_pressure(request: Dictionary) -> Dictionary:
	var transaction_id := _request_transaction_id(request)
	var actor_id := str(request.get("actor_id", ""))
	if transaction_id.is_empty() or actor_id.is_empty():
		return {"ok": false, "error": "transaction_identity_required"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	var before: Dictionary = _records[actor_id]
	var candidate := before.duplicate(true)
	var nourishment: Dictionary = candidate.get("nourishment", {}).duplicate(true)
	var previous := float(nourishment.get("hunger_severity", 0.0))
	var delta := float(request.get("hunger_delta", 0.0))
	nourishment["hunger_severity"] = clampf(previous + delta, 0.0, 100.0)
	nourishment["hunger_trend"] = "rising" if delta > 0.0 else \
		"falling" if delta < 0.0 else "stable"
	if float(nourishment["hunger_severity"]) >= 100.0:
		nourishment["starvation_debt_hours"] = maxf(
			0.0, float(nourishment.get("starvation_debt_hours", 0.0))
			+ maxf(0.0, float(request.get("elapsed_hours", 0.0))))
	candidate["nourishment"] = nourishment
	return _commit_candidate(
		actor_id, before, candidate, request, transaction_id,
		"nourishment_pressure_applied", {
			"reason_code": "nourishment_pressure_applied",
			"hunger_before": previous,
			"hunger_after": float(nourishment["hunger_severity"]),
		})


func try_spend_stamina(request: Dictionary) -> Dictionary:
	var adapted := request.duplicate(true)
	adapted["query_mode"] = "commit"
	adapted["movement_action_family"] = str(request.get(
		"action_family", request.get("movement_action_family", "external_action")))
	adapted["base_stamina_cost"] = float(request.get(
		"base_stamina_cost", request.get("amount", 0.0)))
	if not adapted.has("request_id"):
		adapted["request_id"] = _request_transaction_id(request)
	return apply_movement_exertion_context(adapted)


func apply_movement_exertion_context(request: Dictionary) -> Dictionary:
	var request_id := str(request.get("request_id", ""))
	var transaction_id := str(request.get("idempotency_key", request_id))
	var query_mode := str(request.get("query_mode", "estimate"))
	var actor_id := str(request.get("entity_id", request.get("actor_id", "")))
	if request_id.is_empty() or actor_id.is_empty() \
			or query_mode not in VALID_QUERY_MODES:
		return {"ok": false, "error": "invalid_movement_exertion_request"}
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	if query_mode != "estimate":
		var replay := _transaction_replay(transaction_id, request)
		if not replay.is_empty():
			return replay
	var record: Dictionary = _records[actor_id]
	var bundle: Dictionary = record.get("modifier_bundle", {})
	var stamina: Dictionary = record.get("stamina", {})
	var current := float(stamina.get("current_stamina", 0.0))
	var maximum := maxf(1.0, float(stamina.get("max_stamina_resolved", 1.0)))
	var restrictions: Array = bundle.get("hard_restrictions", [])
	var cost := _exertion_cost(request, bundle)
	var action_blocked := _movement_action_blocked(request, restrictions)
	var enough := current + 0.0001 >= cost
	var allowed := not action_blocked and enough
	var reasons: Array[String] = []
	if action_blocked:
		reasons.append("biological_movement_restriction")
	if not enough:
		reasons.append("insufficient_stamina")
	var decision := _movement_decision(
		request_id, query_mode, record, current, maximum, cost,
		allowed, restrictions, reasons)
	if query_mode == "estimate":
		decision["commit_status"] = "estimated"
		return decision
	if query_mode == "end":
		decision["commit_status"] = "ended"
		return _commit_nonmutating_transaction(
			actor_id, request, transaction_id,
			"movement_exertion_ended", decision)
	if not allowed:
		decision["commit_status"] = "rejected"
		return _commit_nonmutating_transaction(
			actor_id, request, transaction_id,
			"movement_exertion_rejected", decision)
	var before := record
	var candidate := before.duplicate(true)
	var next_stamina: Dictionary = candidate.get("stamina", {}).duplicate(true)
	next_stamina["current_stamina"] = maxf(0.0, current - cost)
	next_stamina["last_committed_cost_transaction_id"] = transaction_id
	next_stamina["regen_delay_until"] = int(_world_time().get("world_tick", 0)) + (
		2 if float(next_stamina["current_stamina"]) <= 0.0 else 1)
	next_stamina["depletion_state"] = (
		"depleted" if float(next_stamina["current_stamina"]) <= 0.0
		else "low" if float(next_stamina["current_stamina"]) / maximum <= 0.25
		else "available")
	candidate["stamina"] = next_stamina
	var next_fatigue: Dictionary = candidate.get("fatigue", {}).duplicate(true)
	var intensity := _intensity_value(str(request.get("intensity_band", "moderate")))
	var fatigue_delta := cost / maximum * 3.0 + intensity * 0.12
	next_fatigue["fatigue_value"] = clampf(
		float(next_fatigue.get("fatigue_value", 0.0)) + fatigue_delta,
		0.0, 100.0)
	next_fatigue["trend"] = "rising"
	next_fatigue["last_evaluated_simulation_time"] = _world_time()
	candidate["fatigue"] = next_fatigue
	candidate["exertion"] = {
		"value": clampf(intensity * 20.0, 0.0, 100.0),
		"band": str(request.get("intensity_band", "moderate")),
		"movement_action_id": str(request.get("movement_action_id", "")),
		"request_id": request_id,
		"last_update_time": _world_time(),
	}
	decision["commit_status"] = "committed"
	decision["stamina_spend_result"] = {
		"spent": cost,
		"before": current,
		"after": float(next_stamina["current_stamina"]),
	}
	return _commit_candidate(
		actor_id, before, candidate, request, transaction_id,
		"movement_exertion_committed", decision)


func apply_physical_impact_event(request: Dictionary) -> Dictionary:
	var impact_event_id := str(request.get("impact_event_id", ""))
	var actor_id := str(request.get("entity_id", request.get("actor_id", "")))
	if impact_event_id.is_empty() or actor_id.is_empty():
		return {"ok": false, "error": "invalid_physical_impact_event"}
	if not _records.has(actor_id):
		return {"ok": false, "error": "unknown_actor"}
	var normal_speed := maxf(0.0, float(request.get("impact_speed_normal", 0.0)))
	var landing_quality := str(request.get("landing_quality", "ordinary"))
	var quality_mult: float = float({
		"controlled": 0.45,
		"good": 0.7,
		"ordinary": 1.0,
		"poor": 1.25,
		"uncontrolled": 1.5,
	}.get(landing_quality, 1.0))
	var effective_speed := normal_speed * float(quality_mult)
	var damage := 0.0
	var impact_class := "trivial"
	if effective_speed >= 22.0:
		damage = (effective_speed - 10.0) * 2.0
		impact_class = "extreme"
	elif effective_speed >= 16.0:
		damage = (effective_speed - 9.0) * 1.5
		impact_class = "heavy"
	elif effective_speed >= 11.0:
		damage = (effective_speed - 8.0) * 1.1
		impact_class = "significant"
	elif effective_speed >= 8.0:
		damage = (effective_speed - 7.0) * 0.6
		impact_class = "light"
	var damage_request := request.duplicate(true)
	damage_request["transaction_id"] = impact_event_id
	damage_request["actor_id"] = actor_id
	damage_request["resolved_health_damage"] = damage
	damage_request["injury_permitted"] = impact_class in [
		"significant", "heavy", "extreme"]
	damage_request["impact_class"] = impact_class
	damage_request["trauma_tags"] = ["impact", "fall"]
	damage_request["damage_tags"] = ["physical.impact"]
	damage_request["biological_region_id"] = str(request.get(
		"external_hit_location_or_region_hint", "region.lower_body"))
	var result := apply_resolved_biological_damage(damage_request)
	if not bool(result.get("ok", false)):
		return result
	var snapshot := biological_mobility_modifier_snapshot(actor_id)
	return {
		"ok": true,
		"schema": "leyforge.xset.biological-impact-result",
		"biological_result_id": "biological_result.%s" % impact_event_id,
		"impact_event_id": impact_event_id,
		"commit_status": str(result.get("commit_status", "committed")),
		"duplicate": bool(result.get("duplicate", false)),
		"health_consequence_ref": str(result.get("evidence_id", "")),
		"current_health": float(result.get("current_health", 0.0)),
		"injury_state_changes": (
			result.get("injury_state_changes", []) as Array).duplicate(true),
		"critical_or_incapacitation_state": bool(result.get(
			"critical_condition", false)),
		"movement_restrictions": (
			snapshot.get("hard_restrictions", []) as Array).duplicate(),
		"movement_modifiers": [snapshot],
		"recovery_state_ref": biological_record_id(actor_id),
		"reason_codes": (result.get("reason_codes", []) as Array).duplicate(),
		"source_state_revision": int(result.get("result_revision", 0)),
		"world_time": result.get("authoritative_time", _world_time()),
	}


func serialize_state() -> Dictionary:
	var records: Array[Dictionary] = []
	for actor_id in actor_ids():
		var record: Dictionary = _records[actor_id]
		if str(record.get("persistence_class", "persistent")) == "transient":
			continue
		records.append(record.duplicate(true))
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
		"records": records,
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
			or str(data.get("state_hash", "")) != _state_hash(data) \
			or not (data.get("records", []) is Array) \
			or not (data.get("transaction_journal", []) is Array):
		return false
	var saved_world_id := str(data.get("world_id", ""))
	if not expected_world_id.is_empty() and not saved_world_id.is_empty() \
			and saved_world_id != expected_world_id:
		return false
	var restored_records := {}
	for record_value in data.get("records", []):
		if not (record_value is Dictionary):
			return false
		var record: Dictionary = record_value.duplicate(true)
		if not bool(validate_record(record, expected_seed).get("ok", false)):
			return false
		var actor_id := str(record.get("actor_id", ""))
		if restored_records.has(actor_id):
			return false
		restored_records[actor_id] = record
	var restored_transactions := {}
	var restored_order: Array[String] = []
	for entry_value in data.get("transaction_journal", []):
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
	world_id = expected_world_id if not expected_world_id.is_empty() \
		else saved_world_id
	_records = restored_records
	_transactions = restored_transactions
	_transaction_order = restored_order
	for actor_id in actor_ids():
		_publish_person_ref(
			_records[actor_id], "biology.restore_ref.%s" % _stable_token(actor_id))
	biology_changed.emit()
	return true


func validate_record(
		record: Dictionary, expected_seed: int = -1) -> Dictionary:
	if str(record.get("record_type", "")) != RECORD_TYPE \
			or int(record.get("version", 0)) != STATE_VERSION:
		return {"ok": false, "error": "unsupported_biological_record"}
	for field in ["actor_id", "biological_record_id", "profile_ref", "state_hash"]:
		if str(record.get(field, "")).is_empty():
			return {"ok": false, "error": "missing_%s" % field}
	if expected_seed >= 0 and int(record.get("world_seed", -1)) != expected_seed:
		return {"ok": false, "error": "world_seed_mismatch"}
	if str(record.get("persistence_class", "")) \
			not in VALID_PERSISTENCE_CLASSES:
		return {"ok": false, "error": "invalid_persistence_class"}
	for dictionary_field in [
		"actor_core", "stamina", "fatigue", "nourishment", "hydration",
		"environment", "sleep", "physical_injury_state", "profile_state",
		"scheduler_state", "modifier_bundle",
	]:
		if not (record.get(dictionary_field, {}) is Dictionary):
			return {"ok": false, "error": "invalid_%s" % dictionary_field}
	for array_field in [
		"injuries", "disease_instances", "poison_instances", "treatment_plans",
		"evidence_refs", "transaction_refs",
	]:
		if not (record.get(array_field, []) is Array):
			return {"ok": false, "error": "invalid_%s" % array_field}
	var core: Dictionary = record.get("actor_core", {})
	var maximum := float(core.get("max_health_resolved", 0.0))
	var current := float(core.get("current_health", -1.0))
	if maximum <= 0.0 or current < 0.0 or current > maximum:
		return {"ok": false, "error": "invalid_health_state"}
	var stamina: Dictionary = record.get("stamina", {})
	var max_stamina := float(stamina.get("max_stamina_resolved", 0.0))
	var current_stamina := float(stamina.get("current_stamina", -1.0))
	if max_stamina <= 0.0 or current_stamina < 0.0 \
			or current_stamina > max_stamina:
		return {"ok": false, "error": "invalid_stamina_state"}
	if (record.get("injuries", []) as Array).size() > MAX_INJURIES:
		return {"ok": false, "error": "injury_readability_cap_exceeded"}
	if int(record.get("revision", 0)) < 1:
		return {"ok": false, "error": "invalid_biological_revision"}
	if str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "biological_hash_mismatch"}
	return {"ok": true}


func lod_snapshot(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {}
	var record: Dictionary = _records[actor_id]
	return {
		"identity": {
			"record_type": RECORD_TYPE,
			"biological_record_id": str(record.get("biological_record_id", "")),
			"actor_id": actor_id,
			"person_ref": str(record.get("person_ref", "")),
			"profile_ref": str(record.get("profile_ref", "")),
		},
		"ownership": {
			"owner": EVIDENCE_OWNER,
			"settlement_ref": str(record.get("settlement_ref", "")),
		},
		"quantities": {
			"actor_core": (record.get("actor_core", {}) as Dictionary).duplicate(true),
			"stamina": (record.get("stamina", {}) as Dictionary).duplicate(true),
			"fatigue": (record.get("fatigue", {}) as Dictionary).duplicate(true),
			"nourishment": (
				record.get("nourishment", {}) as Dictionary).duplicate(true),
			"physical_injury_state": (
				record.get("physical_injury_state", {}) as Dictionary).duplicate(true),
		},
		"history": {
			"injuries": (record.get("injuries", []) as Array).duplicate(true),
			"evidence_refs": (record.get("evidence_refs", []) as Array).duplicate(),
			"transaction_refs": (
				record.get("transaction_refs", []) as Array).duplicate(),
		},
		"irreversible": {
			"biological_record_id": str(record.get("biological_record_id", "")),
			"revision": int(record.get("revision", 0)),
		},
		"state": {
			"modifier_bundle": (
				record.get("modifier_bundle", {}) as Dictionary).duplicate(true),
			"representation": "biological_record",
			"state_hash": str(record.get("state_hash", "")),
		},
	}


func _new_record(
		actor_id: String,
		projection: Dictionary,
		source_kind: String,
		person_ref: String,
		settlement_ref: String,
		persistence_class: String,
		evidence_id: String) -> Dictionary:
	var maximum := maxf(1.0, float(projection.get(
		"max_health", projection.get("max_health_resolved", 100.0))))
	var current := clampf(float(projection.get(
		"health", projection.get("current_health", maximum))), 0.0, maximum)
	var max_stamina := maxf(1.0, float(projection.get(
		"max_stamina", projection.get("max_stamina_resolved", 100.0))))
	var needs: Dictionary = projection.get("needs", {}) \
		if projection.get("needs", {}) is Dictionary else {}
	var hunger := float(projection.get(
		"hunger_severity",
		(1.0 - float(needs.get("food", 0.8))) * 100.0))
	var injuries: Array[Dictionary] = []
	if bool(projection.get("injured", false)):
		injuries.append(_legacy_injury(actor_id, str(projection.get(
			"injury", "Legacy injury")), "registration"))
	var now := _world_time()
	var record := {
		"record_type": RECORD_TYPE,
		"version": STATE_VERSION,
		"interface_id": INTERFACE_ID,
		"interface_version": INTERFACE_VERSION,
		"biological_record_id": biological_record_id(actor_id),
		"actor_id": actor_id,
		"person_ref": person_ref,
		"settlement_ref": settlement_ref,
		"profile_ref": str(projection.get(
			"biological_profile_ref", "profile.biological.compatibility")),
		"world_seed": world_seed,
		"world_id": world_id,
		"source_kind": source_kind,
		"persistence_class": persistence_class,
		"actor_core": {
			"current_health": current,
			"max_health_resolved": maximum,
			"health_band": "stable",
			"last_health_damage_time": {},
			"last_damage_source_ref": "",
			"last_damage_event_ref": "",
			"recovery_eligible": current > 0.0,
			"recovery_suppression_reasons": [],
			"critical_condition": current <= 0.0,
			"stabilised": injuries.is_empty() and current > 0.0,
			"recovery_possible": current > 0.0,
			"biological_revision": 1,
		},
		"stamina": {
			"current_stamina": clampf(float(projection.get(
				"stamina", projection.get("current_stamina", max_stamina))),
				0.0, max_stamina),
			"max_stamina_resolved": max_stamina,
			"regen_delay_until": 0,
			"depletion_state": "available",
			"stamina_modifier_bundle": {},
			"last_committed_cost_transaction_id": "",
		},
		"fatigue": _default_fatigue_state(float(projection.get("fatigue", 0.0))),
		"exertion": {
			"value": 0.0,
			"band": "resting",
			"movement_action_id": "",
			"request_id": "",
			"last_update_time": now,
		},
		"nourishment": {
			"hunger_severity": clampf(hunger, 0.0, 100.0),
			"hunger_band": "comfortable",
			"hunger_trend": "stable",
			"starvation_debt_hours": 0.0,
			"nutrition_score": 75.0,
			"nutrition_band": "adequate",
			"energy_satisfaction": 75.0,
			"protein_satisfaction": 75.0,
			"produce_satisfaction": 75.0,
			"variety_score": 50.0,
			"recent_food_ledger": [],
			"last_consumption_time": {},
			"last_update_time": now,
			"last_transaction_id": "",
		},
		"hydration": {
			"thirst_enabled": bool(projection.get("thirst_enabled", false)),
			"thirst_severity": clampf(float(projection.get(
				"thirst_severity", 0.0)), 0.0, 100.0),
			"thirst_band": "hydrated",
			"thirst_trend": "stable",
			"dehydration_debt_hours": 0.0,
			"last_update_time": now,
		},
		"environment": {
			"thermal_load": 0.0,
			"thermal_band": "comfortable",
			"thermal_trend": "stable",
			"wetness": 0.0,
			"wetness_band": "dry",
			"drying_state": "stable",
			"principal_cause_refs": [],
			"protection_snapshot_revision": 0,
		},
		"sleep": {
			"sleep_pressure": clampf(float(projection.get(
				"sleep_pressure", 0.0)), 0.0, 100.0),
			"awake_duration_hours": 0.0,
			"active_state": "awake",
			"rest_site_ref": "",
			"sleep_quality_snapshot": {},
			"last_sleep_interval": {},
		},
		"injuries": injuries,
		"physical_injury_state": _default_physical_injury_state(actor_id),
		"disease_instances": [],
		"disease_resistance_memory": {},
		"poison_instances": [],
		"treatment_plans": [],
		"profile_state": {
			"base_profile_ref": str(projection.get(
				"biological_profile_ref", "profile.biological.compatibility")),
			"persistent_overlay_refs": [],
			"profile_revision": 1,
		},
		"scheduler_state": {
			"last_biological_simulation_time": now,
			"next_scheduled_milestones": [],
			"reconciliation_state": "current",
		},
		"modifier_bundle": {},
		"revision": 1,
		"created_tick": int(now.get("world_tick", 0)),
		"updated_tick": int(now.get("world_tick", 0)),
		"evidence_refs": [evidence_id],
		"transaction_refs": [],
		"state_hash": "",
	}
	_refresh_derived(record)
	record["state_hash"] = _record_hash(record)
	return record


func _default_fatigue_state(value: float) -> Dictionary:
	return {
		"fatigue_value": clampf(value, 0.0, 100.0),
		"fatigue_band": _fatigue_band(value),
		"trend": "stable",
		"accumulation_sources": [],
		"recovery_sources": [],
		"long_duration_modifiers": [],
		"last_evaluated_simulation_time": _world_time(),
	}


func _default_physical_injury_state(actor_id: String) -> Dictionary:
	return {
		"actor_id": actor_id,
		"active_injury_ids": [],
		"regional_trauma": {},
		"blood_loss": 0.0,
		"bleeding_class": "none",
		"pain_load": 0.0,
		"manual_function": 1.0,
		"mobility_function": 1.0,
		"head_function": 1.0,
		"core_function": 1.0,
		"critical_condition": false,
		"care_urgency": "none",
	}


func _legacy_injury(actor_id: String, label: String, source_id: String) -> Dictionary:
	var severity := "severe" if "severe" in label.to_lower() else "moderate"
	return _injury_record(
		actor_id, "injury.trauma.contusion", "region.general", severity,
		"legacy", source_id, label)


func _injury_record(
		actor_id: String,
		definition_id: String,
		region_id: String,
		severity: String,
		impact_class: String,
		source_event_id: String,
		display_name: String = "") -> Dictionary:
	var token := _stable_token({
		"actor_id": actor_id,
		"definition_id": definition_id,
		"region_id": region_id,
		"source_event_id": source_event_id,
	})
	var rank := int(INJURY_SEVERITY_RANK.get(severity, 1))
	var open_wound := definition_id in [
		"injury.wound.laceration", "injury.wound.puncture"]
	var bleed := "none"
	if open_wound:
		bleed = ["none", "seep", "light", "heavy", "critical"][rank]
	var now := _world_time()
	return {
		"injury_instance_id": "injury_instance.%s" % token,
		"definition_id": definition_id,
		"display_name": display_name if not display_name.is_empty() \
			else definition_id.get_slice(".", definition_id.get_slice_count(".") - 1) \
				.replace("_", " "),
		"actor_id": actor_id,
		"biological_region_id": region_id,
		"severity": severity,
		"phase": "acute",
		"regional_trauma_at_creation": _trauma_for_impact(impact_class),
		"wound_open_state": "open" if open_wound else "closed",
		"bleed_class": bleed,
		"pain_contribution": [0.0, 8.0, 20.0, 42.0, 72.0][rank],
		"recovery_progress": 0.0,
		"recovery_ceiling": 100.0 if rank <= 2 else 70.0,
		"stabilised": rank <= 1 and not open_wound,
		"immobilised": false,
		"treatment_flags": [],
		"contamination_state": {},
		"treatment_history_refs": [],
		"complication_state": {},
		"last_trauma_time": now,
		"last_treatment_time": {},
		"last_recovery_update": now,
		"source_event_id": source_event_id,
		"created_simulation_time": now,
		"updated_simulation_time": now,
	}


func _apply_trauma_to_candidate(
		candidate: Dictionary,
		request: Dictionary,
		source_event_id: String) -> Array[Dictionary]:
	var actor_id := str(candidate.get("actor_id", ""))
	var impact_class := str(request.get("impact_class", _impact_class_for_damage(
		float(request.get("resolved_health_damage", request.get("amount", 0.0))))))
	var region_id := str(request.get(
		"biological_region_id", request.get("hit_region_ref", "region.general")))
	if region_id.is_empty():
		region_id = "region.general"
	var physical: Dictionary = candidate.get(
		"physical_injury_state", {}).duplicate(true)
	var trauma_map: Dictionary = physical.get("regional_trauma", {}).duplicate(true)
	var trauma := clampf(float(trauma_map.get(region_id, 0.0))
		+ _trauma_for_impact(impact_class), 0.0, 100.0)
	trauma_map[region_id] = trauma
	physical["regional_trauma"] = trauma_map
	candidate["physical_injury_state"] = physical
	var requested_minimum := str(request.get("minimum_injury_severity", ""))
	var severity := _severity_for_trauma(trauma)
	if requested_minimum in VALID_INJURY_SEVERITIES \
			and int(INJURY_SEVERITY_RANK[requested_minimum]) \
			> int(INJURY_SEVERITY_RANK.get(severity, 0)):
		severity = requested_minimum
	if severity == "none":
		return []
	var definition_id := _injury_definition_for(request)
	var injuries: Array = candidate.get("injuries", [])
	for index in injuries.size():
		if not (injuries[index] is Dictionary):
			continue
		var existing: Dictionary = injuries[index]
		if str(existing.get("definition_id", "")) != definition_id \
				or str(existing.get("biological_region_id", "")) != region_id \
				or str(existing.get("phase", "")) == "healed":
			continue
		var existing_severity := str(existing.get("severity", "minor"))
		if int(INJURY_SEVERITY_RANK.get(severity, 0)) \
				> int(INJURY_SEVERITY_RANK.get(existing_severity, 0)):
			existing["severity"] = severity
			existing["phase"] = "acute"
			existing["recovery_progress"] = maxf(
				0.0, float(existing.get("recovery_progress", 0.0)) - 20.0)
			existing["updated_simulation_time"] = _world_time()
			injuries[index] = existing
			candidate["injuries"] = injuries
			return [{
				"change": "severity_increased",
				"injury_instance_id": str(existing.get("injury_instance_id", "")),
				"severity": severity,
			}]
		return []
	var injury := _injury_record(
		actor_id, definition_id, region_id, severity, impact_class,
		source_event_id)
	if injuries.size() >= MAX_INJURIES:
		var replace_index := _least_severe_injury_index(injuries)
		if replace_index >= 0 and int(INJURY_SEVERITY_RANK.get(severity, 0)) \
				> int(INJURY_SEVERITY_RANK.get(str(
					(injuries[replace_index] as Dictionary).get(
						"severity", "minor")), 0)):
			injuries[replace_index] = injury
		else:
			return []
	else:
		injuries.append(injury)
	candidate["injuries"] = injuries
	return [{
		"change": "created",
		"injury_instance_id": str(injury.get("injury_instance_id", "")),
		"definition_id": definition_id,
		"region": region_id,
		"severity": severity,
	}]


func _commit_candidate(
		actor_id: String,
		before: Dictionary,
		candidate: Dictionary,
		request: Dictionary,
		transaction_id: String,
		event_type: String,
		result_fields: Dictionary) -> Dictionary:
	var prior_revision := int(before.get("revision", 0))
	candidate["revision"] = prior_revision + 1
	candidate["updated_tick"] = int(_world_time().get("world_tick", 0))
	var transaction_refs: Array = candidate.get("transaction_refs", [])
	if transaction_id not in transaction_refs:
		transaction_refs.append(transaction_id)
	while transaction_refs.size() > MAX_TRANSACTION_JOURNAL:
		transaction_refs.pop_front()
	candidate["transaction_refs"] = transaction_refs
	_refresh_derived(candidate)
	var evidence_id := "evidence.biological.transaction.%s" % (
		_world_scoped_token(transaction_id))
	var payload_hash := _hash_value(request)
	var evidence := _commit_evidence(
		evidence_id, event_type, {
			"transaction_id": transaction_id,
			"actor_id": actor_id,
			"prior_revision": prior_revision,
			"result_revision": int(candidate.get("revision", 0)),
			"request_hash": payload_hash,
			"result_semantic_hash": _record_semantic_hash(candidate),
		}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	if bool(evidence.get("duplicate", false)) \
			and not _transactions.has(transaction_id):
		return {"ok": false, "error": "biological_journal_missing"}
	var refs: Array = candidate.get("evidence_refs", [])
	if evidence_id not in refs:
		refs.append(evidence_id)
	while refs.size() > MAX_EVIDENCE_REFS:
		refs.pop_front()
	candidate["evidence_refs"] = refs
	candidate["state_hash"] = _record_hash(candidate)
	var core: Dictionary = candidate.get("actor_core", {})
	var result := {
		"ok": true,
		"schema": TRANSACTION_RESULT_SCHEMA,
		"transaction_id": transaction_id,
		"commit_status": "committed",
		"duplicate": false,
		"reason_code": str(result_fields.get("reason_code", "committed")),
		"reason_codes": (
			result_fields.get("reason_codes", []) as Array).duplicate(),
		"prior_revision": prior_revision,
		"result_revision": int(candidate.get("revision", 0)),
		"resource_commit_reference": str(result_fields.get(
			"resource_commit_reference", "")),
		"biological_outcome_references": (
			result_fields.get("biological_outcome_references", [
				biological_record_id(actor_id)]) as Array).duplicate(),
		"authoritative_time": _world_time(),
		"evidence_id": evidence_id,
		"current_health": float(core.get("current_health", 0.0)),
		"max_health": float(core.get("max_health_resolved", 0.0)),
		"health_band": str(core.get("health_band", "unknown")),
		"critical_condition": bool(core.get("critical_condition", false)),
		"stabilised": bool(core.get("stabilised", false)),
		"recovery_possible": bool(core.get("recovery_possible", false)),
	}
	result.merge(result_fields, true)
	_records[actor_id] = candidate
	_store_transaction(transaction_id, actor_id, payload_hash, result)
	_publish_person_ref(candidate, transaction_id)
	actor_changed.emit(actor_id)
	biology_changed.emit()
	var settlement_ref := str(candidate.get("settlement_ref", ""))
	if not settlement_ref.is_empty():
		population_changed.emit(settlement_ref)
	return result.duplicate(true)


func _commit_nonmutating_transaction(
		actor_id: String,
		request: Dictionary,
		transaction_id: String,
		event_type: String,
		result_fields: Dictionary) -> Dictionary:
	var record: Dictionary = _records[actor_id]
	var payload_hash := _hash_value(request)
	var evidence_id := "evidence.biological.transaction.%s" % (
		_world_scoped_token(transaction_id))
	var evidence := _commit_evidence(evidence_id, event_type, {
		"transaction_id": transaction_id,
		"actor_id": actor_id,
		"source_revision": int(record.get("revision", 0)),
		"request_hash": payload_hash,
	}, transaction_id)
	if not bool(evidence.get("ok", false)):
		return evidence
	var result := result_fields.duplicate(true)
	result["ok"] = true
	result["schema"] = str(result.get("schema", TRANSACTION_RESULT_SCHEMA))
	result["transaction_id"] = transaction_id
	result["duplicate"] = false
	result["prior_revision"] = int(record.get("revision", 0))
	result["result_revision"] = int(record.get("revision", 0))
	result["authoritative_time"] = _world_time()
	result["evidence_id"] = evidence_id
	_store_transaction(transaction_id, actor_id, payload_hash, result)
	return result


func _store_transaction(
		transaction_id: String,
		actor_id: String,
		payload_hash: String,
		result: Dictionary) -> void:
	_transactions[transaction_id] = {
		"transaction_id": transaction_id,
		"actor_id": actor_id,
		"payload_hash": payload_hash,
		"status": "committed",
		"result_revision": int(result.get("result_revision", 0)),
		"authoritative_time": _world_time(),
		"result": result.duplicate(true),
	}
	if transaction_id not in _transaction_order:
		_transaction_order.append(transaction_id)
	while _transaction_order.size() > MAX_TRANSACTION_JOURNAL:
		var expired: String = _transaction_order.pop_front()
		_transactions.erase(expired)


func _transaction_replay(
		transaction_id: String, request: Dictionary) -> Dictionary:
	if transaction_id.is_empty() or not _transactions.has(transaction_id):
		return {}
	var entry: Dictionary = _transactions[transaction_id]
	if str(entry.get("payload_hash", "")) != _hash_value(request):
		return {
			"ok": false,
			"error": "biological_transaction_conflict",
			"transaction_id": transaction_id,
		}
	var result: Dictionary = entry.get("result", {}).duplicate(true)
	result["duplicate"] = true
	return result


func _refresh_derived(record: Dictionary) -> void:
	var core: Dictionary = record.get("actor_core", {}).duplicate(true)
	var maximum := maxf(1.0, float(core.get("max_health_resolved", 1.0)))
	var current := clampf(float(core.get("current_health", maximum)), 0.0, maximum)
	core["current_health"] = current
	core["health_band"] = _health_band(current / maximum)
	var injuries: Array = record.get("injuries", [])
	var physical := _derive_physical_injury_state(str(record.get("actor_id", "")), injuries)
	record["physical_injury_state"] = physical
	var critical := current <= 0.0 or bool(physical.get("critical_condition", false))
	core["critical_condition"] = critical
	core["stabilised"] = current > 0.0 \
		and (injuries.is_empty() or _all_injuries_stabilised(injuries))
	core["recovery_possible"] = current > 0.0 \
		and float(physical.get("blood_loss", 0.0)) < 80.0
	core["biological_revision"] = int(record.get("revision", 1))
	record["actor_core"] = core
	var fatigue_state: Dictionary = record.get("fatigue", {}).duplicate(true)
	var fatigue_value := clampf(float(fatigue_state.get(
		"fatigue_value", 0.0)), 0.0, 100.0)
	fatigue_state["fatigue_value"] = fatigue_value
	fatigue_state["fatigue_band"] = _fatigue_band(fatigue_value)
	record["fatigue"] = fatigue_state
	var nourishment: Dictionary = record.get("nourishment", {}).duplicate(true)
	var hunger := clampf(float(nourishment.get("hunger_severity", 0.0)), 0.0, 100.0)
	nourishment["hunger_severity"] = hunger
	nourishment["hunger_band"] = _hunger_band(hunger)
	nourishment["nutrition_band"] = _nutrition_band(float(
		nourishment.get("nutrition_score", 75.0)))
	record["nourishment"] = nourishment
	var hydration: Dictionary = record.get("hydration", {}).duplicate(true)
	if bool(hydration.get("thirst_enabled", false)):
		var thirst := clampf(float(hydration.get("thirst_severity", 0.0)), 0.0, 100.0)
		hydration["thirst_severity"] = thirst
		hydration["thirst_band"] = _thirst_band(thirst)
	record["hydration"] = hydration
	var health_mult: float = float({
		"stable": 1.0,
		"hurt": 0.95,
		"wounded": 0.8,
		"critical": 0.5,
		"depleted": 0.0,
	}.get(str(core.get("health_band", "stable")), 1.0))
	var fatigue_mult := _fatigue_modifier(fatigue_value)
	var hunger_mult := _hunger_modifier(hunger)
	var injury_mult := float(physical.get("mobility_function", 1.0))
	var environment: Dictionary = record.get("environment", {})
	var thermal_load := absf(float(environment.get("thermal_load", 0.0)))
	var thermal_mult := clampf(1.0 - thermal_load / 250.0, 0.55, 1.0)
	var disease_mult := 0.9 if not (
		record.get("disease_instances", []) as Array).is_empty() else 1.0
	var poison_mult := 0.85 if not (
		record.get("poison_instances", []) as Array).is_empty() else 1.0
	var movement_mult := clampf(
		float(health_mult) * fatigue_mult * hunger_mult * injury_mult
		* thermal_mult * disease_mult * poison_mult, 0.0, 1.0)
	var work_mult := clampf(
		float(health_mult) * fatigue_mult * hunger_mult
		* _injury_work_modifier(physical) * disease_mult * poison_mult,
		0.0, 1.0)
	var restrictions: Array[String] = []
	var reason_codes: Array[String] = []
	if current <= 0.0:
		restrictions.append_array(["no_sprint", "no_jump", "no_climb"])
		reason_codes.append("health_depleted")
	elif str(core.get("health_band", "")) == "critical":
		restrictions.append("no_sprint")
		reason_codes.append("critical_health")
	if injury_mult <= 0.5:
		if "no_sprint" not in restrictions:
			restrictions.append("no_sprint")
		restrictions.append("no_jump")
		reason_codes.append("severe_mobility_injury")
	if fatigue_value >= 95.0:
		if "no_sprint" not in restrictions:
			restrictions.append("no_sprint")
		reason_codes.append("critical_fatigue")
	if hunger >= 81.0:
		reason_codes.append("severe_hunger")
	var care_need := str(physical.get("care_urgency", "none"))
	if critical:
		care_need = "emergency"
	var bundle := {
		"schema": "leyforge.set29.biological-modifier-bundle",
		"stamina_modifier": clampf(
			fatigue_mult * hunger_mult * injury_mult * thermal_mult
			* disease_mult * poison_mult, 0.15, 1.25),
		"stamina_drain_modifier": clampf(
			1.0 / maxf(0.5, fatigue_mult * hunger_mult * injury_mult),
			0.5, 2.0),
		"recovery_modifier": clampf(
			fatigue_mult * hunger_mult * thermal_mult * disease_mult
			* poison_mult, 0.0, 1.5),
		"fatigue_movement_modifier": fatigue_mult,
		"mobility_function": injury_mult,
		"thermal_movement_modifier": thermal_mult,
		"movement_modifier": movement_mult,
		"jump_modifier": minf(movement_mult, injury_mult),
		"carry_penalty": clampf(1.0 - injury_mult, 0.0, 1.0),
		"work_capacity_modifier": work_mult,
		"available_for_assignment": work_mult >= 0.35 and not critical,
		"care_need": care_need,
		"hard_restrictions": restrictions,
		"reason_codes": reason_codes,
		"injury_movement_modifiers": [],
		"disease_or_toxin_movement_modifiers": [],
		"source_state_revision": int(record.get("revision", 1)),
		"effective_world_time": _world_time(),
	}
	for injury_value in injuries:
		if injury_value is Dictionary:
			bundle["injury_movement_modifiers"].append({
				"injury_instance_id": str(injury_value.get(
					"injury_instance_id", "")),
				"region": str(injury_value.get("biological_region_id", "")),
				"severity": str(injury_value.get("severity", "minor")),
			})
	for condition_value in (
		(record.get("disease_instances", []) as Array)
		+ (record.get("poison_instances", []) as Array)):
		if condition_value is Dictionary:
			bundle["disease_or_toxin_movement_modifiers"].append(
				condition_value.duplicate(true))
	record["modifier_bundle"] = bundle
	var stamina: Dictionary = record.get("stamina", {}).duplicate(true)
	stamina["stamina_modifier_bundle"] = bundle.duplicate(true)
	var max_stamina := maxf(1.0, float(stamina.get("max_stamina_resolved", 1.0)))
	var current_stamina := clampf(float(stamina.get(
		"current_stamina", max_stamina)), 0.0, max_stamina)
	stamina["current_stamina"] = current_stamina
	stamina["depletion_state"] = (
		"depleted" if current_stamina <= 0.0
		else "low" if current_stamina / max_stamina <= 0.25
		else "available")
	record["stamina"] = stamina


func _derive_physical_injury_state(
		actor_id: String, injuries: Array) -> Dictionary:
	var state := _default_physical_injury_state(actor_id)
	var ids: Array[String] = []
	var pain_values: Array[float] = []
	var mobility := 1.0
	var manual := 1.0
	var head := 1.0
	var core := 1.0
	var worst_bleed_rank := 0
	var care_rank := 0
	for injury_value in injuries:
		if not (injury_value is Dictionary):
			continue
		var injury: Dictionary = injury_value
		if str(injury.get("phase", "")) == "healed":
			continue
		ids.append(str(injury.get("injury_instance_id", "")))
		pain_values.append(float(injury.get("pain_contribution", 0.0)))
		var severity := str(injury.get("severity", "minor"))
		var rank := int(INJURY_SEVERITY_RANK.get(severity, 1))
		care_rank = maxi(care_rank, rank)
		var function_mult: float = float(
			[1.0, 0.95, 0.82, 0.58, 0.30][rank])
		var region := str(injury.get("biological_region_id", ""))
		if "leg" in region or "lower" in region or region == "region.general":
			mobility = minf(mobility, function_mult)
		if "arm" in region or "hand" in region or region == "region.general":
			manual = minf(manual, function_mult)
		if "head" in region:
			head = minf(head, function_mult)
		if "torso" in region or "core" in region:
			core = minf(core, function_mult)
		worst_bleed_rank = maxi(worst_bleed_rank, {
			"none": 0, "seep": 1, "light": 2, "heavy": 3, "critical": 4,
		}.get(str(injury.get("bleed_class", "none")), 0))
	pain_values.sort()
	pain_values.reverse()
	var pain := 0.0
	for index in mini(3, pain_values.size()):
		pain += pain_values[index] * [1.0, 0.5, 0.25][index]
	state["active_injury_ids"] = ids
	state["pain_load"] = clampf(pain, 0.0, 100.0)
	state["manual_function"] = manual
	state["mobility_function"] = mobility
	state["head_function"] = head
	state["core_function"] = core
	state["bleeding_class"] = [
		"none", "seep", "light", "heavy", "critical"][worst_bleed_rank]
	state["blood_loss"] = [0.0, 2.0, 8.0, 24.0, 50.0][worst_bleed_rank]
	state["critical_condition"] = care_rank >= 4 or worst_bleed_rank >= 4
	state["care_urgency"] = [
		"none", "routine", "priority", "urgent", "emergency"][care_rank]
	return state


func _movement_decision(
		request_id: String,
		query_mode: String,
		record: Dictionary,
		current: float,
		maximum: float,
		cost: float,
		allowed: bool,
		restrictions: Array,
		reasons: Array[String]) -> Dictionary:
	var bundle: Dictionary = record.get("modifier_bundle", {})
	return {
		"ok": true,
		"schema": "leyforge.xset.movement-exertion-decision",
		"request_id": request_id,
		"query_mode": query_mode,
		"commit_status": "evaluated",
		"allowed_to_begin": allowed,
		"allowed_to_continue": allowed,
		"stamina_spend_result": {
			"requested": cost,
			"available": current,
			"maximum": maximum,
			"spent": 0.0,
		},
		"stamina_availability_band": _stamina_availability_band(
			current, maximum),
		"movement_exertion_modifier": float(bundle.get(
			"stamina_drain_modifier", 1.0)),
		"recovery_modifier": float(bundle.get("recovery_modifier", 1.0)),
		"estimated_rest_frequency_band": _rest_frequency_band(
			current, maximum, float((record.get("fatigue", {}) as Dictionary).get(
				"fatigue_value", 0.0))),
		"hard_movement_restrictions": restrictions.duplicate(),
		"reason_codes": reasons.duplicate(),
		"source_state_revision": int(record.get("revision", 0)),
		"world_time": _world_time(),
	}


func _exertion_cost(request: Dictionary, bundle: Dictionary) -> float:
	if request.has("base_stamina_cost"):
		return maxf(0.0, float(request.get("base_stamina_cost", 0.0))) \
			* float(bundle.get("stamina_drain_modifier", 1.0))
	var intensity := str(request.get("intensity_band", "moderate"))
	var base: float = float({
		"resting": 0.0,
		"light": 3.0,
		"moderate": 7.0,
		"strenuous": 13.0,
		"heavy": 18.0,
		"extreme": 24.0,
	}.get(intensity, 7.0))
	var duration := maxf(0.0, float(request.get("elapsed_duration", 1.0)))
	var duration_scale := clampf(duration, 0.25, 5.0)
	return float(base) * duration_scale \
		* float(bundle.get("stamina_drain_modifier", 1.0))


func _movement_action_blocked(request: Dictionary, restrictions: Array) -> bool:
	var mode := str(request.get("movement_mode", ""))
	var family := str(request.get("movement_action_family", ""))
	if "sprint" in mode or "sprint" in family:
		return "no_sprint" in restrictions
	if "jump" in mode or "jump" in family:
		return "no_jump" in restrictions
	if "climb" in mode or "climb" in family:
		return "no_climb" in restrictions
	if "crawl" in mode or "crawl" in family:
		return "no_crawl" in restrictions
	return false


func _modifier_query(actor_id: String, field: String, fallback: float) -> Dictionary:
	if not _records.has(actor_id):
		return {"applicable": false, "value": fallback, "reason": "unknown_actor"}
	var record: Dictionary = _records[actor_id]
	var bundle: Dictionary = record.get("modifier_bundle", {})
	return {
		"applicable": true,
		"value": float(bundle.get(field, fallback)),
		"reason_codes": (bundle.get("reason_codes", []) as Array).duplicate(),
		"source_state_revision": int(record.get("revision", 0)),
		"effective_world_time": _world_time(),
	}


func _mobility_band(value: float) -> String:
	if value <= 0.0:
		return "immobile"
	if value < 0.35:
		return "severely_limited"
	if value < 0.7:
		return "limited"
	if value < 0.95:
		return "mildly_limited"
	return "unrestricted"


func _recovery_status(actor_id: String) -> Dictionary:
	if not _records.has(actor_id):
		return {"state": "unknown"}
	var core: Dictionary = (_records[actor_id] as Dictionary).get("actor_core", {})
	return {
		"state": "eligible" if bool(core.get("recovery_eligible", false)) \
			else "suppressed",
		"recovery_possible": bool(core.get("recovery_possible", false)),
		"stabilised": bool(core.get("stabilised", false)),
		"suppression_reasons": (
			core.get("recovery_suppression_reasons", []) as Array).duplicate(),
	}


func _publish_person_ref(record: Dictionary, mutation_id: String) -> void:
	var person_ref := str(record.get("person_ref", ""))
	if person_ref.is_empty() or not PeopleManager.initialized \
			or not PeopleManager.has_person(person_ref):
		return
	var result := PeopleManager.set_external_domain_ref(
		person_ref, "set29_biology", str(record.get(
			"biological_record_id", "")), int(record.get("revision", 0)),
		mutation_id)
	if not bool(result.get("ok", false)):
		push_warning("BiologyManager: person reference handoff failed: %s" % result)


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


func _request_transaction_id(request: Dictionary) -> String:
	for field in [
		"transaction_id", "event_id", "packet_id", "impact_event_id",
		"request_id", "result_id",
	]:
		var value := str(request.get(field, ""))
		if not value.is_empty():
			return value
	return ""


func _injury_definition_for(request: Dictionary) -> String:
	var tags: Array[String] = []
	for field in ["trauma_tags", "damage_tags", "surface_tags"]:
		for value in request.get(field, []):
			tags.append(str(value).to_lower())
	var joined := " ".join(tags)
	if "slash" in joined or "sharp" in joined or "chop" in joined:
		return "injury.wound.laceration"
	if "pierce" in joined or "projectile" in joined or "bite" in joined:
		return "injury.wound.puncture"
	if "burn" in joined or "fire" in joined or "heat" in joined:
		return "injury.thermal.burn"
	if "frost" in joined or "cold" in joined:
		return "injury.thermal.frost"
	if "crush" in joined or "collapse" in joined:
		return "injury.trauma.crush"
	if "head" in joined:
		return "injury.trauma.head"
	return "injury.trauma.contusion"


func _impact_class_for_damage(amount: float) -> String:
	if amount >= 35.0:
		return "extreme"
	if amount >= 20.0:
		return "heavy"
	if amount >= 8.0:
		return "significant"
	if amount > 0.0:
		return "light"
	return "trivial"


func _trauma_for_impact(impact_class: String) -> float:
	return float({
		"trivial": 2.0,
		"light": 8.0,
		"significant": 20.0,
		"heavy": 36.0,
		"extreme": 62.0,
	}.get(impact_class.to_lower(), 0.0))


func _severity_for_trauma(trauma: float) -> String:
	if trauma >= 90.0:
		return "critical"
	if trauma >= 70.0:
		return "severe"
	if trauma >= 45.0:
		return "moderate"
	if trauma >= 20.0:
		return "minor"
	return "none"


func _least_severe_injury_index(injuries: Array) -> int:
	var selected := -1
	var selected_rank := 999
	for index in injuries.size():
		if not (injuries[index] is Dictionary):
			continue
		var rank := int(INJURY_SEVERITY_RANK.get(str(
			(injuries[index] as Dictionary).get("severity", "minor")), 1))
		if rank < selected_rank:
			selected = index
			selected_rank = rank
	return selected


func _all_injuries_stabilised(injuries: Array) -> bool:
	for injury_value in injuries:
		if injury_value is Dictionary \
				and str(injury_value.get("phase", "")) != "healed" \
				and not bool(injury_value.get("stabilised", false)):
			return false
	return true


func _health_band(fraction: float) -> String:
	if fraction <= 0.0:
		return "depleted"
	if fraction <= 0.25:
		return "critical"
	if fraction <= 0.50:
		return "wounded"
	if fraction <= 0.75:
		return "hurt"
	return "stable"


func _fatigue_band(value: float) -> String:
	if value >= 95.0:
		return "critical"
	if value >= 80.0:
		return "exhausted"
	if value >= 60.0:
		return "very_fatigued"
	if value >= 40.0:
		return "fatigued"
	if value >= 20.0:
		return "strained"
	return "rested"


func _hunger_band(value: float) -> String:
	if value >= 100.0:
		return "starving"
	if value >= 81.0:
		return "severe_hunger"
	if value >= 61.0:
		return "very_hungry"
	if value >= 41.0:
		return "hungry"
	if value >= 21.0:
		return "comfortable"
	return "sated"


func _thirst_band(value: float) -> String:
	if value >= 100.0:
		return "dehydrated"
	if value >= 81.0:
		return "severe_thirst"
	if value >= 61.0:
		return "very_thirsty"
	if value >= 41.0:
		return "thirsty"
	if value >= 21.0:
		return "comfortable"
	return "hydrated"


func _nutrition_band(value: float) -> String:
	if value >= 80.0:
		return "well_nourished"
	if value >= 55.0:
		return "adequate"
	if value >= 30.0:
		return "limited"
	return "poor"


func _danger_band(value: float) -> String:
	if value >= 80.0:
		return "critical"
	if value >= 50.0:
		return "severe"
	if value >= 20.0:
		return "moderate"
	if value > 0.0:
		return "minor"
	return "none"


func _burden_band(fraction: float) -> String:
	if fraction >= 0.5:
		return "severe"
	if fraction >= 0.25:
		return "high"
	if fraction > 0.0:
		return "limited"
	return "none"


func _stable_interface_number(value: float) -> float:
	# Cross-owner summaries are persisted inside heterogeneous LOD snapshots.
	# Match the owner hash precision so harmless binary arithmetic tails cannot
	# change after Godot's JSON writer emits and reloads the same semantic value.
	return float(String.num(value, 12))


func _fatigue_modifier(value: float) -> float:
	if value >= 95.0:
		return 0.55
	if value >= 80.0:
		return 0.68
	if value >= 60.0:
		return 0.78
	if value >= 40.0:
		return 0.88
	if value >= 20.0:
		return 0.95
	return 1.0


func _hunger_modifier(value: float) -> float:
	if value >= 100.0:
		return 0.55
	if value >= 81.0:
		return 0.7
	if value >= 61.0:
		return 0.85
	if value >= 41.0:
		return 0.95
	return 1.0


func _injury_work_modifier(physical: Dictionary) -> float:
	return minf(minf(
		float(physical.get("manual_function", 1.0)),
		float(physical.get("mobility_function", 1.0))), minf(
		float(physical.get("head_function", 1.0)),
		float(physical.get("core_function", 1.0))))


func _intensity_value(value: String) -> float:
	return float({
		"resting": 0.0,
		"light": 1.0,
		"moderate": 2.0,
		"strenuous": 3.0,
		"heavy": 4.0,
		"extreme": 5.0,
	}.get(value, 2.0))


func _stamina_availability_band(current: float, maximum: float) -> String:
	if current <= 0.0:
		return "depleted"
	var fraction := current / maxf(1.0, maximum)
	if fraction <= 0.25:
		return "low"
	if fraction <= 0.6:
		return "available"
	return "strong"


func _rest_frequency_band(current: float, maximum: float, fatigue_value: float) -> String:
	var fraction := current / maxf(1.0, maximum)
	if fatigue_value >= 80.0 or fraction <= 0.2:
		return "frequent"
	if fatigue_value >= 40.0 or fraction <= 0.5:
		return "regular"
	return "low"


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
	if value is PackedFloat32Array or value is PackedFloat64Array \
			or value is PackedInt32Array or value is PackedInt64Array:
		return Array(value)
	return value


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
		# Godot's JSON writer intentionally rounds binary floats. Keep hashes at
		# a tighter semantic precision than gameplay needs while remaining stable
		# across the actual JSON save/load boundary.
		return String.num(float(value), 12)
	return JSON.stringify(value)
