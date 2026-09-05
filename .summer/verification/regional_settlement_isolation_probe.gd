extends Node
## Proves that two generated v4 hamlets retain independent runtime identities,
## settlement state, raid state, far simulation, and save-v18 owner data.

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var seed_value := 0x416D23
	var planner := WorldStructurePlanner.new()
	planner.generate(seed_value, WorldStructurePlanner.VERSION)
	_check(
		planner.validation_errors.is_empty(),
		"regional planner did not produce a valid starter contract")
	var hamlet_filter: Array[String] = ["hamlet"]
	var candidates := planner.query_sites(
		Rect2i(Vector2i(-128, -128), Vector2i(256, 256)),
		hamlet_filter)
	var selected: Array[Dictionary] = []
	for site in candidates:
		if bool(site.get("is_starter", false)):
			continue
		if selected.is_empty() or Vector2(site["position"]).distance_to(
				Vector2(selected[0]["position"])) >= 32.0 * 16.0:
			selected.append(site)
		if selected.size() == 2:
			break
	_check(selected.size() == 2, "could not find two widely separated hamlets")
	if selected.size() != 2:
		_finish()
		return
	_check(
		SettlementManager.initialize_sites(seed_value, planner, selected),
		"settlement manager could not materialize generated hamlets")
	var settlement_ids: Array = SettlementManager.settlements.keys()
	settlement_ids.sort()
	_check(settlement_ids.size() == 2, "materialization did not create two records")
	if settlement_ids.size() != 2:
		_finish()
		return
	var first_id := str(settlement_ids[0])
	var second_id := str(settlement_ids[1])
	var first_record := SettlementManager.get_settlement(first_id)
	var second_record := SettlementManager.get_settlement(second_id)
	_check(first_id != second_id, "generated settlement IDs collided")
	_check(
		str(first_record.get("site_id", ""))
			!= str(second_record.get("site_id", "")),
		"generated settlements share a site ID")
	_check(
		_records_are_separated(first_record, second_record),
		"generated settlement anchors are not regionally separated")
	_check(PoliticalManager.government_ids(first_id).size() == 1 \
			and PoliticalManager.government_ids(second_id).size() == 1 \
			and PoliticalManager.government_ids(first_id) \
				!= PoliticalManager.government_ids(second_id) \
			and not (first_record.get(
				"movement_owner_refs", {}) as Dictionary).is_empty() \
			and not (second_record.get(
				"movement_owner_refs", {}) as Dictionary).is_empty() \
			and _keys_are_disjoint(
				first_record.get("movement_owner_refs", {}),
				second_record.get("movement_owner_refs", {})),
		"generated settlements did not receive independent political and movement identities")
	_check(
		not (first_record.get("linked_camp_ids", []) as Array).is_empty()
			and not (second_record.get("linked_camp_ids", []) as Array).is_empty(),
		"a generated settlement is missing its independent camp link")

	var first_state: Dictionary = first_record.get("hamlet_state", {})
	var second_state: Dictionary = second_record.get("hamlet_state", {})
	var first_npcs: Dictionary = first_state.get("npc_records", {})
	var second_npcs: Dictionary = second_state.get("npc_records", {})
	_check(
		str(first_state.get("roster_mode", "")) == HamletState.ROSTER_MODE_CAMP
			and str(second_state.get("roster_mode", ""))
				== HamletState.ROSTER_MODE_CAMP,
		"generated settlements did not select the production roster profile")
	_check(
		str((first_state.get("project", {}) as Dictionary).get(
			"definition_id", "")) == HamletState.PRODUCTION_PROJECT_ID
			and str((second_state.get("project", {}) as Dictionary).get(
				"definition_id", "")) == HamletState.PRODUCTION_PROJECT_ID,
		"generated settlements selected the archived watchtower project")
	_check(
		_production_people_are_archive_safe(first_npcs)
			and _production_people_are_archive_safe(second_npcs),
		"generated settlements reused named Forest Hamlet residents")
	_check(
		_production_state_is_archive_safe(first_state)
			and _production_state_is_archive_safe(second_state),
		"generated settlement state contains a retired POC identity")
	_check(
		not first_npcs.is_empty() and not second_npcs.is_empty(),
		"generated settlement NPC records are missing")
	_check(
		_keys_are_disjoint(first_npcs, second_npcs),
		"generated settlement NPC identities leaked across namespaces")
	_check(
		str(first_state.get("active_project_instance_id", ""))
			!= str(second_state.get("active_project_instance_id", "")),
		"generated settlement projects share an instance ID")
	_check(
		str((first_record.get("combat_state", {}) as Dictionary).get(
			"target_settlement_id", "")) == first_id
			and str((second_record.get("combat_state", {}) as Dictionary).get(
				"target_settlement_id", "")) == second_id,
		"raid state is not scoped to its owning settlement")

	_check(
		SettlementManager.focus_settlement(first_id),
		"first settlement could not receive focus")
	SocialManager.apply_reputation_event({
		"transaction_id": "regional.isolation.first.reputation",
		"scope_ref": first_id,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"delta": 73,
		"source_event_id": "event.regional.isolation.first",
	})
	HamletState.refresh_social_projection()
	HamletState.project["stage_progress"] = 0.37
	HamletState.warehouse_add_stack(Inventory.make_stack_from_ref({
		"kind": "block",
		"stable_id": "construction.planks.oak",
		"count": 9,
	}))
	CombatState.phase = "resolved"
	CombatState.outcome = {"id": "first_only"}
	SettlementManager.get_settlement(first_id)
	_check(
		SettlementManager.focus_settlement(second_id),
		"second settlement could not receive focus")
	_check(HamletState.reputation_points == 0, "reputation leaked between settlements")
	_check(
		HamletState.warehouse_count_ref({
			"kind": "block",
			"stable_id": "construction.planks.oak",
			"count": 1,
		}) == 0,
		"warehouse inventory leaked between settlements")
	_check(CombatState.phase == "dormant", "raid phase leaked between settlements")
	_check(
		is_zero_approx(float(HamletState.project.get("stage_progress", 0.0))),
		"project progress leaked between settlements")
	SocialManager.apply_reputation_event({
		"transaction_id": "regional.isolation.second.reputation",
		"scope_ref": second_id,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"delta": 11,
		"source_event_id": "event.regional.isolation.second",
	})
	HamletState.refresh_social_projection()
	var second_clock_before := HamletState.clock_minutes
	SettlementManager.get_settlement(second_id)
	_check(
		SettlementManager.focus_settlement(first_id),
		"first settlement could not be restored after mutation")
	_check(
		HamletState.reputation_points == 73
			and HamletState.warehouse_count_ref({
				"kind": "block",
				"stable_id": "construction.planks.oak",
				"count": 1,
			}) == 9,
		"first settlement mutation did not survive focus switching")
	_check(
		CombatState.phase == "resolved"
			and str(CombatState.outcome.get("id", "")) == "first_only",
		"first settlement raid state did not survive focus switching")
	_check(
		is_equal_approx(
			float(HamletState.project.get("stage_progress", 0.0)), 0.37),
		"first settlement project state did not survive focus switching")

	SettlementManager.advance_far_simulation(90.0)
	var second_after_sim := SettlementManager.get_settlement(second_id)
	var simulated_state: Dictionary = second_after_sim.get("hamlet_state", {})
	_check(
		str(second_after_sim.get("simulation_mode", "")) == "far"
			and not is_equal_approx(
				float(simulated_state.get("clock_minutes", second_clock_before)),
				second_clock_before),
		"distant settlement did not advance through record simulation")

	var serialized := SettlementManager.serialize_state()
	var serialized_social := SocialManager.serialize_state()
	var serialized_political := PoliticalManager.serialize_state()
	var serialized_movement := MovementManager.serialize_state()
	_check(
		(serialized.get("settlements", {}) as Dictionary).size() == 2,
		"settlement collection serialization omitted a materialized settlement")
	SettlementManager.reset()
	SocialManager.reset()
	PoliticalManager.reset()
	MovementManager.reset()
	HamletState.initialized = false
	CombatState.initialized = false
	_check(
		SettlementManager.initialize_world(seed_value, planner),
		"fresh regional settlement collection could not be prepared for reload")
	_check(
		SocialManager.restore_state(serialized_social, seed_value) \
			and PoliticalManager.restore_state(serialized_political, seed_value) \
			and MovementManager.restore_state(serialized_movement, seed_value) \
			and SettlementManager.restore_state(serialized, seed_value),
		"social, political, movement and settlement owners did not restore")
	_check(
		SettlementManager.settlements.size() == 2,
		"settlement collection reload changed its record count")
	_check(
		SettlementManager.focus_settlement(first_id)
			and HamletState.reputation_points == 73
			and CombatState.phase == "resolved",
		"first settlement state changed across collection reload")
	_check(
		SettlementManager.focus_settlement(second_id)
			and HamletState.reputation_points == 11
			and is_equal_approx(
				float(HamletState.clock_minutes),
				float(simulated_state.get("clock_minutes", -1.0))),
		"second settlement state changed across collection reload")
	_check(
		SettlementManager.get_settlement(first_id).get("site", {})
			== first_record.get("site", {}),
		"stable generated site identity changed across reload")
	_verify_legacy_archive_compatibility(seed_value)
	_finish()


func _production_people_are_archive_safe(records: Dictionary) -> bool:
	for resident_id in records:
		var record: Dictionary = records[resident_id]
		if ".poc." in str(resident_id):
			return false
		if str(record.get("name", "")) in [
				"Elder Rowan", "Talia Stonehand", "Bram Reed"]:
			return false
	return true


func _production_state_is_archive_safe(state: Dictionary) -> bool:
	var encoded := JSON.stringify(state)
	for retired_identity in [
		"village.poc.forest_hamlet",
		"npc.poc.forest_hamlet",
		"project_instance.forest_hamlet.watchtower",
		"project.build.wooden_watchtower",
		"Forest Watchtower",
		"Elder Rowan",
		"Talia Stonehand",
		"Bram Reed",
	]:
		if retired_identity in encoded:
			return false
	return true


func _verify_legacy_archive_compatibility(seed_value: int) -> void:
	var anchors := {
		"hamlet": Vector2i.ZERO,
		"warehouse": Vector2i(5, 0),
		"watchtower_site": Vector2i(12, 0),
		"goblin_camp": Vector2i(120, 0),
		"raid_approach": Vector2i(20, 0),
	}
	HamletState.initialized = false
	HamletState.initialize(
		seed_value, anchors, HamletState.VILLAGE_ID,
		HamletState.ROSTER_MODE_LEGACY)
	_check(HamletState.get_npc_record(
		"npc.poc.forest_hamlet.builder_talia").get("name", "")
			== "Talia Stonehand"
			and str(HamletState.project.get("definition_id", ""))
				== HamletState.DEFAULT_PROJECT_ID,
		"archived Forest Hamlet identities are no longer reconstructable")
	var legacy_state := HamletState.serialize_state()
	_check("project.build.wooden_watchtower" in JSON.stringify(legacy_state),
		"archived watchtower fixture did not serialize its compatibility identity")
	HamletState.initialized = false
	_check(HamletState.restore_state(
		legacy_state, seed_value, HamletState.VILLAGE_ID),
		"archived Forest Hamlet state no longer restores")
	_check(HamletState.get_npc_record(
		"npc.poc.forest_hamlet.elder_rowan").get("name", "")
			== "Elder Rowan"
			and str(HamletState.project.get("definition_id", ""))
				== HamletState.DEFAULT_PROJECT_ID,
		"archived Forest Hamlet identity changed during restore")


func _records_are_separated(first: Dictionary, second: Dictionary) -> bool:
	var first_anchor: Array = first.get("anchor", [0, 0])
	var second_anchor: Array = second.get("anchor", [0, 0])
	return Vector2(
		float(first_anchor[0]), float(first_anchor[1])).distance_to(Vector2(
			float(second_anchor[0]), float(second_anchor[1]))) >= 32.0 * 16.0


func _keys_are_disjoint(first: Dictionary, second: Dictionary) -> bool:
	for key in first:
		if second.has(key):
			return false
	return true


func _finish() -> void:
	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}
	print("REGIONAL_SETTLEMENT_ISOLATION_PROBE %s" % JSON.stringify(report))
	SettlementManager.reset()
	SocialManager.reset()
	PoliticalManager.reset()
	HamletState.initialized = false
	CombatState.initialized = false
	get_tree().quit(0 if failures.is_empty() else 1)
