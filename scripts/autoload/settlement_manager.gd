extends Node
## Authoritative collection of independent settlement-operation records.
##
## PeopleManager owns persistent people, households, ordinary jobs and broad
## schedules. BiologyManager owns health, stamina, fatigue, nourishment and
## injury truth. SocialManager owns relationships, knowledge, dialogue evidence
## and companion agreements. PoliticalManager owns government, law, territory,
## citizenship, office and permission truth. MovementManager owns mover,
## path, route, journey and arrival truth. HamletState remains the compatibility
## facade for the focused settlement, while this manager projects those owners
## into regional records.
## This manager snapshots the facade before focus changes and restores the
## destination record, keeping legacy gameplay code ID-scoped without sharing
## storage, NPCs, projects, reputation, or simulation state.

signal settlements_changed
signal focused_settlement_changed(settlement_id: String)
signal project_proposals_changed(settlement_id: String)
signal population_changed(settlement_id: String)

const TerrainPlannerScript = preload(
	"res://scripts/settlement/settlement_terrain_planner.gd")

const STATE_VERSION := 2
const SETTLEMENT_PREFIX := "settlement."
const STAGE_ORDER: Array[String] = [
	"camp", "hamlet", "village", "fortified_village", "town", "city",
	"capital", "magical_metropolis",
]
const POPULATION_GATES := {
	"camp": 3,
	"hamlet": 4,
	"village": 8,
	"fortified_village": 12,
	"town": 20,
	"city": 32,
	"capital": 48,
	"magical_metropolis": 64,
}
const MIGRATION_STABLE_DAYS := 2
const MIGRATION_COOLDOWN_DAYS := 3
const GESTATION_DAYS := 14
const HOUSEHOLD_BIRTH_COOLDOWN_DAYS := 30
const ADULT_AGE_DAYS := 60

var initialized := false
var world_seed := 0
var focused_settlement_id := ""
var settlements: Dictionary = {}
var _planner: RefCounted
var _world: VoxelWorld
var _terrain_planner: SettlementTerrainPlanner


func reset() -> void:
	initialized = false
	world_seed = 0
	focused_settlement_id = ""
	settlements.clear()
	_planner = null
	_world = null
	_terrain_planner = null


func bind_world(world: VoxelWorld) -> void:
	_world = world
	_terrain_planner = TerrainPlannerScript.new().configure(world)


func initialize_world(seed_value: int, planner: RefCounted) -> bool:
	reset()
	_ensure_people_owner(seed_value)
	_ensure_biology_owner(seed_value)
	_ensure_social_owner(seed_value)
	_ensure_political_owner(seed_value)
	_ensure_movement_owner(seed_value)
	if planner == null or not planner.has_method("settlement_layout"):
		return false
	world_seed = seed_value
	_planner = planner
	for site in planner.starter_sites:
		if str(site.get("type_id", "")) != "hamlet":
			continue
		var record := materialize_site(site)
		if record.is_empty():
			return false
		focused_settlement_id = str(record["settlement_id"])
		break
	initialized = not focused_settlement_id.is_empty()
	if initialized:
		focus_settlement(focused_settlement_id)
	return initialized


func initialize_sites(
		seed_value: int,
		planner: RefCounted,
		sites: Array[Dictionary]) -> bool:
	reset()
	_ensure_people_owner(seed_value)
	_ensure_biology_owner(seed_value)
	_ensure_social_owner(seed_value)
	_ensure_political_owner(seed_value)
	_ensure_movement_owner(seed_value)
	if planner == null or not planner.has_method("settlement_layout") \
			or sites.is_empty():
		return false
	world_seed = seed_value
	_planner = planner
	HamletState.initialized = false
	CombatState.initialized = false
	for site in sites:
		var record := materialize_site(site)
		if record.is_empty():
			return false
		if focused_settlement_id.is_empty():
			focused_settlement_id = str(record["settlement_id"])
	initialized = not settlements.is_empty()
	if initialized:
		var first_id := focused_settlement_id
		focused_settlement_id = ""
		return focus_settlement(first_id)
	return false


func initialize_legacy(seed_value: int) -> bool:
	reset()
	_ensure_people_owner(seed_value)
	_ensure_biology_owner(seed_value)
	_ensure_social_owner(seed_value)
	_ensure_political_owner(seed_value)
	_ensure_movement_owner(seed_value)
	if not HamletState.initialized or HamletState.world_seed != seed_value:
		return false
	world_seed = seed_value
	var state := HamletState.serialize_state()
	var combat_state := CombatState.serialize_state() \
		if CombatState.initialized else {}
	var settlement_id := str(state.get(
		"village_id", HamletState.VILLAGE_ID))
	var record := _record_from_hamlet_state(
		settlement_id, "site.legacy.forest_hamlet", state, true,
		combat_state)
	record = _sync_people_owner_record(record, false)
	record = _sync_biology_owner_record(record, false)
	record = _sync_social_owner_record(record, false)
	record = _sync_political_owner_record(record, false)
	record = _sync_movement_owner_record(record, false)
	settlements[settlement_id] = record
	focused_settlement_id = settlement_id
	initialized = true
	return true


func materialize_site(site_or_id: Variant) -> Dictionary:
	var site: Dictionary = {}
	if site_or_id is Dictionary:
		site = site_or_id
	elif _planner != null and _planner.has_method("get_site"):
		site = _planner.get_site(str(site_or_id))
	if site.is_empty() or str(site.get("type_id", "")) != "hamlet":
		return {}
	var site_id := str(site.get("site_id", ""))
	var settlement_id := settlement_id_for_site(site_id)
	if settlements.has(settlement_id):
		return settlements[settlement_id].duplicate(true)

	var previous_state: Dictionary = {}
	var previous_combat_state: Dictionary = {}
	var previous_id := focused_settlement_id
	if HamletState.initialized:
		if not previous_id.is_empty() and settlements.has(previous_id):
			_capture_focused_facade()
		previous_state = HamletState.serialize_state()
		if CombatState.initialized:
			previous_combat_state = CombatState.serialize_state()
	var layout: Dictionary = _planner.settlement_layout(site)
	var anchors := {
		"hamlet": Vector2i(layout["hamlet"]),
		"warehouse": Vector2i(layout["warehouse"]),
		"watchtower_site": Vector2i(layout["watchtower_site"]),
	}
	_append_combat_anchors(anchors, site)
	HamletState.initialized = false
	var is_stage_b_camp := int(_planner.get("plan_version")) \
		>= WorldStructurePlanner.VERSION
	HamletState.initialize(
		world_seed,
		anchors,
		settlement_id,
		HamletState.ROSTER_MODE_CAMP
			if is_stage_b_camp else HamletState.ROSTER_MODE_LEGACY)
	var state := HamletState.serialize_state()
	CombatState.initialized = false
	CombatState.initialize(world_seed, anchors, settlement_id)
	var combat_state := CombatState.serialize_state()
	var record := _record_from_hamlet_state(
		settlement_id, site_id, state, bool(site.get("is_starter", false)),
		combat_state)
	record["site"] = _serializable_site(site)
	record["stations"] = {
		"warehouse": _point_array(Vector2i(layout["warehouse"])),
		"watchtower_site": _point_array(Vector2i(layout["watchtower_site"])),
		"request_board": _point_array(Vector2i(layout["request_board"])),
	}
	record["stage"] = (
		"camp" if is_stage_b_camp else
		str((record.get("capability", {}) as Dictionary).get(
			"stage", "hamlet")))
	record["routes"] = _serializable_routes(layout.get("roads", []))
	record["bed_slots"] = _initial_bed_slots(
		settlement_id, layout, is_stage_b_camp)
	record["job_slots"] = _initial_job_slots(
		settlement_id, is_stage_b_camp)
	_assign_initial_job_slots(record["job_slots"])
	state = HamletState.serialize_state()
	record["hamlet_state"] = state
	record["households"] = _initial_households(
		state.get("npc_records", {}))
	record["parcels"] = {}
	record["surveys"] = {}
	record["work_packages"] = {}
	record["pending_survey"] = {}
	record["population_state"] = {
		"stable_days": 0,
		"migration_cooldown_until_day": 0,
		"last_population_day": 0,
		"migration_count": 0,
		"birth_count": 0,
	}
	var camp_site_id := str(anchors.get("goblin_camp_site_id", ""))
	if not camp_site_id.is_empty():
		record["linked_camp_ids"] = [camp_site_id]
	record = _sync_people_owner_record(record, false)
	record = _sync_biology_owner_record(record, false)
	record = _sync_social_owner_record(record, false)
	record = _sync_political_owner_record(record, false)
	record = _sync_movement_owner_record(record, false)
	settlements[settlement_id] = record
	if previous_state.is_empty():
		focused_settlement_id = settlement_id
	else:
		HamletState.initialized = false
		HamletState.restore_state(previous_state, world_seed, previous_id)
		CombatState.initialized = false
		CombatState.restore_state(
			previous_combat_state, world_seed, previous_id)
		focused_settlement_id = previous_id
	settlements_changed.emit()
	return record.duplicate(true)


func settlement_id_for_site(site_id: String) -> String:
	return "%s%s" % [SETTLEMENT_PREFIX, site_id]


func get_settlement(settlement_id: String) -> Dictionary:
	if settlement_id == focused_settlement_id:
		_capture_focused_facade()
	return settlements.get(settlement_id, {}).duplicate(true)


func get_focused_settlement() -> Dictionary:
	return get_settlement(focused_settlement_id)


func focus_settlement(settlement_id: String) -> bool:
	if not settlements.has(settlement_id):
		return false
	_ensure_settlement_lod_subject(settlement_id)
	if not _reconcile_settlement_for_promotion(settlement_id):
		return false
	if settlement_id == focused_settlement_id \
			and HamletState.initialized \
			and HamletState.active_village_id == settlement_id:
		_transition_settlement_lod(settlement_id, "local")
		return true
	var previous_settlement_id := focused_settlement_id
	_capture_focused_facade()
	var record: Dictionary = settlements[settlement_id]
	var state: Dictionary = record.get("hamlet_state", {})
	var combat_state: Dictionary = record.get("combat_state", {})
	HamletState.initialized = false
	if not HamletState.restore_state(state, world_seed, settlement_id):
		return false
	record = _sync_people_owner_record(record, false)
	record = _sync_biology_owner_record(record, false)
	record = _sync_social_owner_record(record, false)
	record = _sync_political_owner_record(record, false)
	record = _sync_movement_owner_record(record, false)
	CombatState.initialized = false
	var expected_combat_owner := (
		"" if _is_legacy_record(record) else settlement_id)
	if not CombatState.restore_state(
			combat_state, world_seed, expected_combat_owner):
		return false
	focused_settlement_id = settlement_id
	if not previous_settlement_id.is_empty() \
			and previous_settlement_id != settlement_id:
		_transition_settlement_lod(previous_settlement_id, "distant")
	_transition_settlement_lod(settlement_id, "local")
	record["last_focus_unix"] = int(Time.get_unix_time_from_system())
	record["simulation_mode"] = "near"
	record["lod_mode"] = "local"
	record["dirty"] = true
	settlements[settlement_id] = record
	focused_settlement_changed.emit(settlement_id)
	return true


func mutate_settlement(
		settlement_id: String,
		mutator: Callable) -> Dictionary:
	if not focus_settlement(settlement_id) or not mutator.is_valid():
		return {"ok": false, "reason": "unknown_settlement"}
	var result: Variant = mutator.call()
	_capture_focused_facade()
	settlements_changed.emit()
	return {
		"ok": true,
		"result": result,
		"settlement": settlements[settlement_id].duplicate(true),
	}


func query_nearby(position: Vector2, radius: float) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var radius_squared := radius * radius
	for settlement_id in settlements:
		var record: Dictionary = settlements[settlement_id]
		var anchor_source: Array = record.get("anchor", [0, 0])
		var anchor := Vector2(
			float(anchor_source[0]), float(anchor_source[1]))
		var distance_squared := position.distance_squared_to(anchor)
		if distance_squared <= radius_squared:
			var copy := record.duplicate(true)
			copy["distance"] = sqrt(distance_squared)
			result.append(copy)
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var distance_a := float(a.get("distance", INF))
		var distance_b := float(b.get("distance", INF))
		if not is_equal_approx(distance_a, distance_b):
			return distance_a < distance_b
		return str(a["settlement_id"]) < str(b["settlement_id"]))
	return result


func materialize_nearby(
		world: VoxelWorld,
		position: Vector2,
		radius: float) -> Array[Dictionary]:
	if world == null or not world.is_regional_worldgen():
		return query_nearby(position, radius)
	var minimum := Vector2i(
		world.chunk_coord(floori(position.x - radius)),
		world.chunk_coord(floori(position.y - radius)))
	var maximum := Vector2i(
		world.chunk_coord(ceili(position.x + radius)),
		world.chunk_coord(ceili(position.y + radius)))
	for site in world.query_world_sites(
			Rect2i(minimum, maximum - minimum + Vector2i.ONE)):
		var site_position := Vector2(site.get("position", Vector2i.ZERO))
		if site_position.distance_to(position) > radius:
			continue
		UIState.discover_site(site)
		if str(site.get("type_id", "")) == "hamlet":
			var record := materialize_site(site)
			var settlement_id := str(record.get("settlement_id", ""))
			if not settlement_id.is_empty() and settlements.has(settlement_id):
				var stored: Dictionary = settlements[settlement_id]
				stored["discovered"] = true
				stored["dirty"] = true
				settlements[settlement_id] = stored
	return query_nearby(position, radius)


func advance_far_simulation(elapsed_minutes: float) -> void:
	if elapsed_minutes <= 0.0:
		return
	_capture_focused_facade()
	refresh_lod_subjects(false)
	var settlement_ids: Array = settlements.keys()
	settlement_ids.sort()
	for settlement_value in settlement_ids:
		var settlement_id := str(settlement_value)
		if settlement_id == focused_settlement_id:
			continue
		if not SimulationLodManager.initialized:
			_simulate_far_without_lod(settlement_id, elapsed_minutes)
			continue
		_ensure_settlement_lod_subject(settlement_id)
		SimulationLodManager.queue_catchup(settlement_id, elapsed_minutes)
		_execute_settlement_catchup_plan(settlement_id, false)


func settlement_lod_snapshot(settlement_id: String) -> Dictionary:
	if settlement_id == focused_settlement_id:
		_capture_focused_facade()
	if not settlements.has(settlement_id):
		return {}
	return _settlement_lod_snapshot_from_record(settlements[settlement_id])


func refresh_lod_subjects(capture_focused: bool = true) -> void:
	if not initialized or not SimulationLodManager.initialized:
		return
	if capture_focused:
		_capture_focused_facade()
	var settlement_ids: Array = settlements.keys()
	settlement_ids.sort()
	for settlement_value in settlement_ids:
		_ensure_settlement_lod_subject(str(settlement_value))


func _ensure_settlement_lod_subject(settlement_id: String) -> bool:
	if not SimulationLodManager.initialized or not settlements.has(settlement_id):
		return false
	var snapshot := _settlement_lod_snapshot_from_record(
		settlements[settlement_id])
	if snapshot.is_empty():
		return false
	if not SimulationLodManager.has_subject(settlement_id):
		var initial_mode := (
			"local" if settlement_id == focused_settlement_id else "distant")
		return bool(SimulationLodManager.register_subject(
			settlement_id, "settlement", settlement_id, settlement_id,
			initial_mode, snapshot).get("ok", false))
	return bool(SimulationLodManager.refresh_subject(
		settlement_id, snapshot, settlement_id).get("ok", false))


func _transition_settlement_lod(
		settlement_id: String, target_mode: String) -> bool:
	if not SimulationLodManager.initialized:
		return true
	if not _ensure_settlement_lod_subject(settlement_id):
		return false
	var lod_record := SimulationLodManager.subject_record(settlement_id)
	var before: Dictionary = lod_record.get("snapshot", {})
	var after := before.duplicate(true)
	var state: Dictionary = after.get("state", {})
	state["representation"] = target_mode
	after["state"] = state
	if str(lod_record.get("lod_mode", "")) == target_mode:
		return bool(SimulationLodManager.refresh_subject(
			settlement_id, after, settlement_id).get("ok", false))
	return bool(SimulationLodManager.transition_subject(
		settlement_id, target_mode, before, after, "",
		{"owner_id": settlement_id}).get("ok", false))


func _reconcile_settlement_for_promotion(settlement_id: String) -> bool:
	if not SimulationLodManager.initialized:
		return true
	if not _ensure_settlement_lod_subject(settlement_id):
		return false
	if SimulationLodManager.is_reconciled(settlement_id):
		return true
	_execute_settlement_catchup_plan(settlement_id, true)
	return SimulationLodManager.is_reconciled(settlement_id)


func _execute_settlement_catchup_plan(
		settlement_id: String, include_partial: bool) -> bool:
	var planned := SimulationLodManager.plan_catchup(
		settlement_id, -1, include_partial)
	if not bool(planned.get("ok", false)):
		return str(planned.get("error", "")) in [
			"no_catchup_pending", "catchup_below_cadence",
		]
	var plan: Dictionary = planned.get("plan", {})
	var candidate: Dictionary = settlements[settlement_id].duplicate(true)
	var state: Dictionary = candidate.get("hamlet_state", {}).duplicate(true)
	var ledger: Dictionary = candidate.get("resource_ledger", {}).duplicate(true)
	var transaction_batches: Array[Dictionary] = []
	for step_value in plan.get("steps", []):
		var step_minutes := float(step_value)
		var buildings: Array = []
		for building_value in (state.get(
				"runtime_buildings", {}) as Dictionary).values():
			if building_value is Dictionary:
				buildings.append(building_value)
		var result := SettlementSimulationEngine.simulate(
			buildings, ledger, step_minutes,
			SettlementSimulationEngine.MODE_FAR)
		if not SettlementSimulationEngine.validate_transaction_result(result):
			SimulationLodManager.cancel_catchup(
				str(plan.get("plan_id", "")), settlement_id)
			return false
		ledger = (result.get("ledger", {}) as Dictionary).duplicate(true)
		var rebuilt := {}
		for building_value in result.get("buildings", []):
			if building_value is Dictionary:
				var building: Dictionary = building_value
				rebuilt[str(building.get("instance_id", ""))] = building
		state["runtime_buildings"] = rebuilt
		var total_minutes := float(state.get("clock_minutes", 480.0)) \
			+ step_minutes
		var advanced_days := floori(total_minutes / 1440.0)
		state["clock_minutes"] = fmod(total_minutes, 1440.0)
		state["day"] = maxi(1, int(state.get("day", 1)) + advanced_days)
		transaction_batches.append({
			"minutes": step_minutes,
			"before": result.get("before", {}),
			"transactions": result.get("transactions", []),
			"ledger": ledger.duplicate(true),
		})
	candidate["resource_ledger"] = ledger
	candidate["hamlet_state"] = state
	candidate["simulation_mode"] = "far"
	candidate["lod_mode"] = str(plan.get("lod_mode", "distant"))
	candidate["last_simulation_tick"] = int(
		ProductionKernel.world_time_reference().get("world_tick", 0))
	candidate["last_simulation_unix"] = int(Time.get_unix_time_from_system())
	candidate["dirty"] = true
	var owner_snapshot := _settlement_lod_snapshot_from_record(candidate)
	var committed := SimulationLodManager.commit_catchup(
		str(plan.get("plan_id", "")),
		float(plan.get("planned_minutes", 0.0)),
		owner_snapshot,
		{
			"owner_id": settlement_id,
			"owner_commit_validated": true,
			"transaction_hash": _lod_hash_value(transaction_batches),
		})
	if not bool(committed.get("ok", false)):
		SimulationLodManager.cancel_catchup(
			str(plan.get("plan_id", "")), settlement_id)
		return false
	settlements[settlement_id] = candidate
	return true


func _simulate_far_without_lod(
		settlement_id: String, elapsed_minutes: float) -> void:
	var record: Dictionary = settlements[settlement_id]
	var state: Dictionary = record.get("hamlet_state", {})
	var buildings: Array = []
	for building_value in (state.get(
			"runtime_buildings", {}) as Dictionary).values():
		if building_value is Dictionary:
			buildings.append(building_value)
	var result := SettlementSimulationEngine.simulate(
		buildings, record.get("resource_ledger", {}), elapsed_minutes,
		SettlementSimulationEngine.MODE_FAR)
	if not SettlementSimulationEngine.validate_transaction_result(result):
		return
	record["resource_ledger"] = result.get("ledger", {})
	var rebuilt := {}
	for building_value in result.get("buildings", []):
		if building_value is Dictionary:
			var building: Dictionary = building_value
			rebuilt[str(building.get("instance_id", ""))] = building
	state["runtime_buildings"] = rebuilt
	var total_minutes := float(state.get("clock_minutes", 480.0)) \
		+ elapsed_minutes
	state["day"] = maxi(
		1, int(state.get("day", 1)) + floori(total_minutes / 1440.0))
	state["clock_minutes"] = fmod(total_minutes, 1440.0)
	record["hamlet_state"] = state
	record["simulation_mode"] = "far"
	record["lod_mode"] = "distant"
	record["last_simulation_unix"] = int(Time.get_unix_time_from_system())
	record["dirty"] = true
	settlements[settlement_id] = record


func _settlement_lod_snapshot_from_record(record: Dictionary) -> Dictionary:
	if record.is_empty():
		return {}
	var settlement_id := str(record.get("settlement_id", ""))
	var state: Dictionary = record.get("hamlet_state", {})
	var npc_records: Dictionary = state.get("npc_records", {})
	var resident_quantities := {}
	var resident_history := {}
	var resident_irreversible := {}
	var resident_social_history := {}
	var resident_social_irreversible := {}
	var resident_social_state := {}
	var resident_movement_history := {}
	var resident_movement_irreversible := {}
	var resident_movement_state := {}
	var resident_ids: Array = npc_records.keys()
	resident_ids.sort()
	for resident_value in resident_ids:
		var resident_id := str(resident_value)
		var resident: Dictionary = npc_records[resident_value]
		if BiologyManager.initialized and BiologyManager.has_actor(resident_id):
			resident = BiologyManager.compatibility_actor_view(
				resident_id, resident)
		if SocialManager.initialized and SocialManager.has_profile(resident_id):
			resident = SocialManager.compatibility_person_view(
				resident_id, resident)
		var biological_snapshot: Dictionary = BiologyManager.lod_snapshot(
			resident_id) if BiologyManager.has_actor(resident_id) else {}
		var social_snapshot: Dictionary = SocialManager.lod_snapshot(
			resident_id) if SocialManager.has_profile(resident_id) else {}
		var movement_snapshot: Dictionary = MovementManager.lod_snapshot(
			resident_id) if MovementManager.has_mover(resident_id) else {}
		resident_quantities[resident_id] = {
			"health": float(resident.get("health", 0.0)),
			"max_health": float(resident.get("max_health", 0.0)),
			"biological_owner": (
				biological_snapshot.get("quantities", {}) as Dictionary
			).duplicate(true),
			"needs": (resident.get("needs", {}) as Dictionary).duplicate(true),
			"personal_inventory": (
				resident.get("personal_inventory", []) as Array).duplicate(true),
			"equipment": (
				resident.get("equipment", {}) as Dictionary).duplicate(true),
			"carried_stack": (
				resident.get("carried_stack", {}) as Dictionary).duplicate(true),
		}
		resident_history[resident_id] = (
			resident.get("transaction_history", []) as Array).duplicate(true)
		resident_irreversible[resident_id] = {
			"alive": bool(resident.get("alive", true)),
			"resident_id": str(resident.get("resident_id", resident_id)),
		}
		resident_social_history[resident_id] = (
			social_snapshot.get("history", {}) as Dictionary).duplicate(true)
		resident_social_irreversible[resident_id] = (
			social_snapshot.get("irreversible", {}) as Dictionary).duplicate(true)
		resident_social_state[resident_id] = (
			social_snapshot.get("state", {}) as Dictionary).duplicate(true)
		resident_movement_history[resident_id] = (
			movement_snapshot.get("history", {}) as Dictionary).duplicate(true)
		resident_movement_irreversible[resident_id] = (
			movement_snapshot.get("irreversible", {}) as Dictionary).duplicate(true)
		resident_movement_state[resident_id] = (
			movement_snapshot.get("state", {}) as Dictionary).duplicate(true)
	var completed_projects := {}
	for project_value in (state.get(
			"runtime_projects", {}) as Dictionary).values():
		if project_value is Dictionary:
			var project: Dictionary = project_value
			if bool(project.get("complete", false)):
				completed_projects[str(project.get("instance_id", ""))] = true
	var combat_state: Dictionary = record.get("combat_state", {})
	var political_snapshot: Dictionary = PoliticalManager.lod_snapshot(
		settlement_id) if PoliticalManager.initialized else {}
	return {
		"identity": {
			"record_type": "Settlement",
			"settlement_id": settlement_id,
			"site_id": str(record.get("site_id", "")),
			"world_seed": int(record.get("world_seed", world_seed)),
		},
		"ownership": {
			"owner_id": settlement_id,
			"world_seed": int(record.get("world_seed", world_seed)),
			"political_owner": (
				political_snapshot.get("ownership", {}) as Dictionary).duplicate(true),
			"movement_owner": MovementManager.settlement_movement_summary(
				settlement_id) if MovementManager.initialized else {},
		},
		"quantities": {
			"resource_ledger": (
				record.get("resource_ledger", {}) as Dictionary).duplicate(true),
			"warehouse": (state.get("warehouse", []) as Array).duplicate(true),
			"residents": resident_quantities,
			"population_health_summary": BiologyManager.population_health_summary(
				settlement_id) if BiologyManager.initialized else {},
			"runtime_projects": (
				state.get("runtime_projects", {}) as Dictionary).duplicate(true),
			"runtime_buildings": (
				state.get("runtime_buildings", {}) as Dictionary).duplicate(true),
		},
		"history": {
			"deliveries": (
				state.get("delivery_ledger", []) as Array).duplicate(true),
			"residents": resident_history,
			"social_owner": resident_social_history,
			"political_owner": (
				political_snapshot.get("history", {}) as Dictionary).duplicate(true),
			"movement_owner": resident_movement_history,
			"combat_damage": (
				combat_state.get("damage_records", []) as Array).duplicate(true),
		},
		"irreversible": {
			"residents": resident_irreversible,
			"social_owner": resident_social_irreversible,
			"political_owner": (
				political_snapshot.get("irreversible", {}) as Dictionary).duplicate(true),
			"movement_owner": resident_movement_irreversible,
			"completed_projects": completed_projects,
		},
		"state": {
			"anchor": (record.get("anchor", []) as Array).duplicate(true),
			"clock_minutes": float(state.get("clock_minutes", 480.0)),
			"day": int(state.get("day", 1)),
			"stage": str(record.get("stage", "camp")),
			"capability": (
				record.get("capability", {}) as Dictionary).duplicate(true),
			"social_owner": resident_social_state,
			"social_summary": SocialManager.settlement_social_summary(
				settlement_id) if SocialManager.initialized else {},
			"political_owner": (
				political_snapshot.get("state", {}) as Dictionary).duplicate(true),
			"political_summary": PoliticalManager.settlement_political_summary(
				settlement_id) if PoliticalManager.initialized else {},
			"movement_owner": resident_movement_state,
			"movement_summary": MovementManager.settlement_movement_summary(
				settlement_id) if MovementManager.initialized else {},
			"representation": str(record.get(
				"lod_mode",
				"local" if settlement_id == focused_settlement_id else "distant")),
		},
	}


func serialize_state() -> Dictionary:
	_capture_focused_facade()
	refresh_people_owner()
	refresh_biology_owner()
	refresh_social_owner()
	refresh_political_owner()
	refresh_movement_owner()
	return {
		"version": STATE_VERSION,
		"world_seed": world_seed,
		"focused_settlement_id": focused_settlement_id,
		"settlements": settlements.duplicate(true),
	}


func restore_state(value: Variant, expected_seed: int) -> bool:
	if not (value is Dictionary):
		return false
	var data: Dictionary = value
	var state_version := int(data.get("version", 0))
	if state_version not in [1, STATE_VERSION] \
			or int(data.get("world_seed", -1)) != expected_seed:
		return false
	var restored_value: Variant = data.get("settlements", {})
	if not (restored_value is Dictionary):
		return false
	var restored: Dictionary = restored_value.duplicate(true)
	for settlement_id in restored:
		var record: Variant = restored[settlement_id]
		if not (record is Dictionary) \
				or str(record.get("settlement_id", "")) != str(settlement_id):
			return false
		restored[settlement_id] = _ensure_stage_b_record(
			record, state_version < STATE_VERSION)
	world_seed = expected_seed
	settlements = restored
	_ensure_people_owner(expected_seed)
	_ensure_biology_owner(expected_seed)
	_ensure_social_owner(expected_seed)
	_ensure_political_owner(expected_seed)
	_ensure_movement_owner(expected_seed)
	var settlement_ids: Array = settlements.keys()
	settlement_ids.sort()
	for settlement_value in settlement_ids:
		var settlement_id := str(settlement_value)
		settlements[settlement_id] = _sync_people_owner_record(
			settlements[settlement_id], false)
		settlements[settlement_id] = _sync_biology_owner_record(
			settlements[settlement_id], false)
		settlements[settlement_id] = _sync_social_owner_record(
			settlements[settlement_id], false)
		settlements[settlement_id] = _sync_political_owner_record(
			settlements[settlement_id], false)
		settlements[settlement_id] = _sync_movement_owner_record(
			settlements[settlement_id], false)
	focused_settlement_id = str(data.get("focused_settlement_id", ""))
	if focused_settlement_id.is_empty() or not settlements.has(
			focused_settlement_id):
		var ids: Array = settlements.keys()
		ids.sort()
		focused_settlement_id = str(ids[0]) if not ids.is_empty() else ""
	initialized = not settlements.is_empty()
	if initialized:
		var target_id := focused_settlement_id
		focused_settlement_id = ""
		return focus_settlement(target_id)
	return false


func migrate_v15_hamlet(value: Variant, expected_seed: int) -> bool:
	HamletState.initialized = false
	if not HamletState.restore_state(value, expected_seed):
		return false
	return initialize_legacy(expected_seed)


func _capture_focused_facade() -> void:
	if focused_settlement_id.is_empty() \
			or not settlements.has(focused_settlement_id) \
			or not HamletState.initialized \
			or HamletState.active_village_id != focused_settlement_id:
		return
	var record: Dictionary = settlements[focused_settlement_id]
	record["hamlet_state"] = HamletState.serialize_state()
	if CombatState.initialized \
			and (
				CombatState.target_settlement_id == focused_settlement_id
				or (
					CombatState.target_settlement_id.is_empty()
					and _is_legacy_record(record)
				)
			):
		record["combat_state"] = CombatState.serialize_state()
	record["capability"] = SettlementSimulationEngine.capability_stage(
		HamletState.runtime_buildings.values())
	record["last_simulation_unix"] = int(Time.get_unix_time_from_system())
	record["dirty"] = true
	record = _sync_people_owner_record(record, false)
	record = _sync_biology_owner_record(record, false)
	record = _sync_social_owner_record(record, false)
	record = _sync_political_owner_record(record, false)
	record = _sync_movement_owner_record(record, false)
	settlements[focused_settlement_id] = record
	if PeopleManager.initialized or BiologyManager.initialized \
			or SocialManager.initialized or PoliticalManager.initialized \
			or MovementManager.initialized:
		var projected_state: Dictionary = record.get("hamlet_state", {})
		HamletState.npc_records = (
			projected_state.get("npc_records", HamletState.npc_records) \
			as Dictionary).duplicate(true)


func refresh_people_owner() -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "settlements_not_initialized"}
	_ensure_people_owner(world_seed)
	var ids: Array = settlements.keys()
	ids.sort()
	var failures: Array[Dictionary] = []
	for settlement_value in ids:
		var settlement_id := str(settlement_value)
		var before: Dictionary = settlements[settlement_id]
		var synced := _sync_people_owner_record(before, false)
		if bool(synced.get("people_owner_sync_failed", false)):
			failures.append({
				"settlement_id": settlement_id,
				"error": synced.get("people_owner_error", "unknown"),
			})
		else:
			if BiologyManager.initialized:
				synced = _sync_biology_owner_record(synced, false)
			settlements[settlement_id] = synced
	if not focused_settlement_id.is_empty() \
			and settlements.has(focused_settlement_id) \
			and HamletState.initialized:
		var state: Dictionary = settlements[focused_settlement_id].get(
			"hamlet_state", {})
		HamletState.npc_records = (
			state.get("npc_records", HamletState.npc_records) \
			as Dictionary).duplicate(true)
	return {
		"ok": failures.is_empty(),
		"settlement_count": ids.size(),
		"person_count": PeopleManager.person_count(),
		"failures": failures,
	}


func refresh_biology_owner() -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "settlements_not_initialized"}
	_ensure_biology_owner(world_seed)
	var ids: Array = settlements.keys()
	ids.sort()
	var failures: Array[Dictionary] = []
	for settlement_value in ids:
		var settlement_id := str(settlement_value)
		var synced := _sync_biology_owner_record(
			settlements[settlement_id], false)
		if bool(synced.get("biology_owner_sync_failed", false)):
			failures.append({
				"settlement_id": settlement_id,
				"error": synced.get("biology_owner_error", "unknown"),
			})
		else:
			settlements[settlement_id] = synced
	if not focused_settlement_id.is_empty() \
			and settlements.has(focused_settlement_id) \
			and HamletState.initialized:
		var state: Dictionary = settlements[focused_settlement_id].get(
			"hamlet_state", {})
		HamletState.npc_records = (
			state.get("npc_records", HamletState.npc_records) \
			as Dictionary).duplicate(true)
	return {
		"ok": failures.is_empty(),
		"settlement_count": ids.size(),
		"biological_record_count": BiologyManager.actor_count("persistent"),
		"failures": failures,
	}


func refresh_social_owner() -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "settlements_not_initialized"}
	_ensure_social_owner(world_seed)
	var ids: Array = settlements.keys()
	ids.sort()
	var failures: Array[Dictionary] = []
	for settlement_value in ids:
		var settlement_id := str(settlement_value)
		var synced := _sync_social_owner_record(
			settlements[settlement_id], false)
		if bool(synced.get("social_owner_sync_failed", false)):
			failures.append({
				"settlement_id": settlement_id,
				"error": synced.get("social_owner_error", "unknown"),
			})
		else:
			settlements[settlement_id] = synced
	if not focused_settlement_id.is_empty() \
			and settlements.has(focused_settlement_id) \
			and HamletState.initialized:
		var state: Dictionary = settlements[focused_settlement_id].get(
			"hamlet_state", {})
		HamletState.npc_records = (
			state.get("npc_records", HamletState.npc_records) \
			as Dictionary).duplicate(true)
		HamletState.refresh_social_projection()
	return {
		"ok": failures.is_empty(),
		"settlement_count": ids.size(),
		"social_profile_count": SocialManager.profile_ids().size(),
		"failures": failures,
	}


func refresh_political_owner() -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "settlements_not_initialized"}
	_ensure_political_owner(world_seed)
	var ids: Array = settlements.keys()
	ids.sort()
	var failures: Array[Dictionary] = []
	for settlement_value in ids:
		var settlement_id := str(settlement_value)
		var synced := _sync_political_owner_record(
			settlements[settlement_id], false)
		if bool(synced.get("political_owner_sync_failed", false)):
			failures.append({
				"settlement_id": settlement_id,
				"error": synced.get("political_owner_error", "unknown"),
			})
		else:
			settlements[settlement_id] = synced
	if not focused_settlement_id.is_empty() \
			and settlements.has(focused_settlement_id) \
			and HamletState.initialized:
		HamletState.refresh_political_projection()
	return {
		"ok": failures.is_empty(),
		"settlement_count": ids.size(),
		"government_count": PoliticalManager.government_ids().size(),
		"failures": failures,
	}


func refresh_movement_owner() -> Dictionary:
	if not initialized:
		return {"ok": false, "error": "settlements_not_initialized"}
	_ensure_movement_owner(world_seed)
	var ids: Array = settlements.keys()
	ids.sort()
	var failures: Array[Dictionary] = []
	for settlement_value in ids:
		var settlement_id := str(settlement_value)
		var synced := _sync_movement_owner_record(
			settlements[settlement_id], false)
		if bool(synced.get("movement_owner_sync_failed", false)):
			failures.append({
				"settlement_id": settlement_id,
				"error": synced.get("movement_owner_error", "unknown"),
			})
		else:
			settlements[settlement_id] = synced
	if not focused_settlement_id.is_empty() \
			and settlements.has(focused_settlement_id) \
			and HamletState.initialized:
		HamletState.refresh_movement_projection()
	return {
		"ok": failures.is_empty(),
		"settlement_count": ids.size(),
		"mover_count": MovementManager.mover_ids().size(),
		"failures": failures,
	}


func _sync_people_owner_record(
		record_value: Dictionary,
		allow_existing_updates: bool) -> Dictionary:
	var record := record_value.duplicate(true)
	var settlement_id := str(record.get("settlement_id", ""))
	var state: Dictionary = record.get("hamlet_state", {}).duplicate(true)
	var residents: Dictionary = state.get("npc_records", {})
	var households: Dictionary = record.get("households", {})
	var job_slots: Dictionary = record.get("job_slots", {})
	var result := PeopleManager.reconcile_settlement_projection(
		settlement_id,
		residents,
		households,
		job_slots,
		"settlement_manager",
		allow_existing_updates)
	if not bool(result.get("ok", false)):
		record["people_owner_sync_failed"] = true
		record["people_owner_error"] = str(result.get("error", "unknown"))
		push_warning("SettlementManager: people-owner sync failed: %s" % result)
		return record
	state["npc_records"] = (
		result.get("resident_records", residents) as Dictionary).duplicate(true)
	record["hamlet_state"] = state
	record["households"] = (
		result.get("households", households) as Dictionary).duplicate(true)
	record["job_slots"] = (
		result.get("job_slots", job_slots) as Dictionary).duplicate(true)
	record.erase("people_owner_sync_failed")
	record.erase("people_owner_error")
	return record


func _sync_biology_owner_record(
		record_value: Dictionary,
		allow_existing_updates: bool) -> Dictionary:
	var record := record_value.duplicate(true)
	var settlement_id := str(record.get("settlement_id", ""))
	var state: Dictionary = record.get("hamlet_state", {}).duplicate(true)
	var residents: Dictionary = state.get("npc_records", {})
	var result := BiologyManager.reconcile_settlement_projection(
		settlement_id, residents, allow_existing_updates)
	if not bool(result.get("ok", false)):
		record["biology_owner_sync_failed"] = true
		record["biology_owner_error"] = str(result.get("error", "unknown"))
		push_warning(
			"SettlementManager: biological-owner sync failed: %s" % result)
		return record
	state["npc_records"] = (
		result.get("resident_records", residents) as Dictionary).duplicate(true)
	record["hamlet_state"] = state
	record["population_health_summary"] = (
		result.get("population_health_summary", {}) as Dictionary).duplicate(true)
	record.erase("biology_owner_sync_failed")
	record.erase("biology_owner_error")
	return record


func _sync_social_owner_record(
		record_value: Dictionary,
		allow_existing_updates: bool) -> Dictionary:
	var record := record_value.duplicate(true)
	var settlement_id := str(record.get("settlement_id", ""))
	var state: Dictionary = record.get("hamlet_state", {}).duplicate(true)
	var residents: Dictionary = state.get("npc_records", {})
	var result := SocialManager.reconcile_settlement_projection(
		settlement_id, residents, allow_existing_updates)
	if not bool(result.get("ok", false)):
		record["social_owner_sync_failed"] = true
		record["social_owner_error"] = str(result.get("error", "unknown"))
		push_warning("SettlementManager: social-owner sync failed: %s" % result)
		return record
	state["npc_records"] = (
		result.get("resident_records", residents) as Dictionary).duplicate(true)
	record["hamlet_state"] = state
	record["social_summary"] = (
		result.get("social_summary", {}) as Dictionary).duplicate(true)
	record.erase("social_owner_sync_failed")
	record.erase("social_owner_error")
	return record


func _sync_political_owner_record(
		record_value: Dictionary,
		allow_existing_updates: bool) -> Dictionary:
	var record := record_value.duplicate(true)
	var settlement_id := str(record.get("settlement_id", ""))
	var state: Dictionary = record.get("hamlet_state", {}).duplicate(true)
	var projection := state.duplicate(true)
	projection["site_id"] = str(record.get("site_id", ""))
	projection["government_profile_ref"] = str(record.get(
		"government_profile_ref", "government.communal_council"))
	projection["governing_faction_archetype_ref"] = str(record.get(
		"governing_faction_archetype_ref", "faction.local_council"))
	var result := PoliticalManager.reconcile_settlement_projection(
		settlement_id, projection, allow_existing_updates)
	if not bool(result.get("ok", false)):
		record["political_owner_sync_failed"] = true
		record["political_owner_error"] = str(result.get("error", "unknown"))
		push_warning("SettlementManager: political-owner sync failed: %s" % result)
		return record
	record["political_summary"] = (
		result.get("political_summary", {}) as Dictionary).duplicate(true)
	record["political_owner_refs"] = {
		"government_id": str(result.get("government_id", "")),
	}
	record.erase("political_owner_sync_failed")
	record.erase("political_owner_error")
	return record


func _sync_movement_owner_record(
		record_value: Dictionary,
		allow_existing_updates: bool) -> Dictionary:
	var record := record_value.duplicate(true)
	var settlement_id := str(record.get("settlement_id", ""))
	var route_result := _publish_movement_routes(record)
	if not bool(route_result.get("ok", false)):
		record["movement_owner_sync_failed"] = true
		record["movement_owner_error"] = str(route_result.get("error", "unknown"))
		return record
	var state: Dictionary = record.get("hamlet_state", {}).duplicate(true)
	var residents: Dictionary = state.get("npc_records", {}).duplicate(true)
	var refs := {}
	var resident_ids: Array = residents.keys()
	resident_ids.sort()
	for resident_value in resident_ids:
		var resident_id := str(resident_value)
		var resident: Dictionary = residents[resident_value]
		var position_value: Variant = resident.get("position", [])
		var position: Array = position_value.duplicate(true) \
			if position_value is Array else []
		if position.size() != 3:
			var home: Array = resident.get("home", [])
			position = [float(home[0]) + 0.5, 0.0, float(home[1]) + 0.5] \
				if home.size() >= 2 else [0.0, 0.0, 0.0]
		var result := MovementManager.register_mover({
			"transaction_id": "movement.settlement.register.%s" % resident_id,
			"entity_ref": resident_id,
			"mover_profile_ref": "mover_profile.humanoid.npc",
			"position": position,
			"movement_mode": "Ground",
			"movement_state": str(resident.get("activity", "Idle")).capitalize(),
			"lod_state": "local" if settlement_id == focused_settlement_id \
				else "distant",
			"semantic_location": {
				"kind": "settlement",
				"ref": settlement_id,
				"settlement_ref": settlement_id,
				"position": position,
			},
		})
		if not bool(result.get("ok", false)):
			record["movement_owner_sync_failed"] = true
			record["movement_owner_error"] = str(result.get("error", "unknown"))
			push_warning("SettlementManager: movement-owner sync failed: %s" % result)
			return record
		if allow_existing_updates and not MovementManager.restored_from_state:
			MovementManager.commit_physical_snapshot({
				"entity_ref": resident_id,
				"position": position,
				"movement_mode": "Ground",
				"movement_state": str(resident.get("activity", "Idle")).capitalize(),
				"semantic_location": {
					"kind": "settlement",
					"ref": settlement_id,
					"settlement_ref": settlement_id,
					"position": position,
				},
			})
		var mover := MovementManager.mover_record(resident_id)
		resident["position"] = (mover.get("position", position) as Array).duplicate(true)
		resident["movement_record_ref"] = str(mover.get("movement_record_ref", ""))
		resident["movement_revision"] = int(mover.get("movement_revision", 0))
		residents[resident_id] = resident
		refs[resident_id] = str(mover.get("movement_record_ref", ""))
	state["npc_records"] = residents
	record["hamlet_state"] = state
	record["movement_summary"] = MovementManager.settlement_movement_summary(
		settlement_id)
	record["movement_owner_refs"] = refs
	record.erase("movement_owner_sync_failed")
	record.erase("movement_owner_error")
	return record


func _publish_movement_routes(record: Dictionary) -> Dictionary:
	var settlement_id := str(record.get("settlement_id", ""))
	for route_value in record.get("routes", []):
		if not (route_value is Dictionary):
			continue
		var route: Dictionary = route_value
		var route_id := str(route.get("route_id", route.get("id", "")))
		if route_id.is_empty():
			continue
		var valid := bool(route.get("valid", false))
		var result := MovementManager.record_route_observation({
			"transaction_id": "movement.settlement_route.%s.%s" % [
				route_id, _lod_hash_value(route).substr(0, 16)],
			"route_segment_id": route_id,
			"source_owner": "document19.settlement_infrastructure",
			"source_revision": maxi(1, int(route.get("revision", 1))),
			"route_class": str(route.get("route_class", "settlement_access")),
			"surface": str(route.get("surface", "dirt")),
			"quality": str(route.get("quality", "ordinary")),
			"width": maxf(1.0, float(route.get("width", 1.0))),
			"vertical_clearance": maxf(2.0, float(route.get(
				"vertical_clearance", 2.0))),
			"grade": float(route.get("grade", 0.0)),
			"supported_transport_classes": ["humanoid"],
			"condition": "passable" if valid else str(route.get(
				"failure", "route_validation_failed")),
			"closure": not valid,
			"capacity_band": "single_lane",
			"settlement_ref": settlement_id,
		})
		if not bool(result.get("ok", false)):
			push_warning("SettlementManager: route-truth handoff failed: %s" % result)
			return result
	return {"ok": true}


func _ensure_people_owner(seed_value: int) -> void:
	if PeopleManager.initialized and PeopleManager.world_seed == seed_value:
		return
	PeopleManager.initialize(
		seed_value,
		str(WorldManager.active_world.get("world_id", "")))


func _ensure_biology_owner(seed_value: int) -> void:
	if BiologyManager.initialized and BiologyManager.world_seed == seed_value:
		return
	BiologyManager.initialize(
		seed_value,
		str(WorldManager.active_world.get("world_id", "")))


func _ensure_social_owner(seed_value: int) -> void:
	if SocialManager.initialized and SocialManager.world_seed == seed_value:
		return
	SocialManager.initialize(
		seed_value,
		str(WorldManager.active_world.get("world_id", "")))


func _ensure_political_owner(seed_value: int) -> void:
	if PoliticalManager.initialized and PoliticalManager.world_seed == seed_value:
		return
	PoliticalManager.initialize(
		seed_value,
		str(WorldManager.active_world.get("world_id", "")))


func _ensure_movement_owner(seed_value: int) -> void:
	if MovementManager.initialized and MovementManager.world_seed == seed_value:
		return
	MovementManager.initialize(
		seed_value,
		str(WorldManager.active_world.get("world_id", "")))


func _is_legacy_record(record: Dictionary) -> bool:
	return str(record.get("site_id", "")).begins_with("site.legacy.")


func _record_from_hamlet_state(
		settlement_id: String,
		site_id: String,
		state: Dictionary,
		is_starter: bool,
		combat_state: Dictionary = {}) -> Dictionary:
	var anchors: Dictionary = state.get("anchors", {})
	var anchor_source: Array = anchors.get("hamlet", [0, 0])
	return {
		"settlement_id": settlement_id,
		"site_id": site_id,
		"world_seed": world_seed,
		"anchor": [int(anchor_source[0]), int(anchor_source[1])],
		"is_starter": is_starter,
		"discovered": is_starter,
		"materialized": true,
		"dirty": true,
		"simulation_mode": "near" if is_starter else "far",
		"last_simulation_unix": int(Time.get_unix_time_from_system()),
		"last_focus_unix": 0,
		"linked_camp_ids": [],
		"resource_ledger": {},
		"hamlet_state": state.duplicate(true),
		"combat_state": combat_state.duplicate(true),
		"capability": SettlementSimulationEngine.capability_stage(
			(state.get("runtime_buildings", {}) as Dictionary).values()),
		"site": {},
		"stage": str((SettlementSimulationEngine.capability_stage(
			(state.get("runtime_buildings", {}) as Dictionary).values())
			as Dictionary).get("stage", "hamlet")),
		"routes": [],
		"bed_slots": {},
		"job_slots": {},
		"households": {},
		"parcels": {},
		"surveys": {},
		"work_packages": {},
		"pending_survey": {},
		"population_state": {
			"stable_days": 0,
			"migration_cooldown_until_day": 0,
			"last_population_day": 0,
			"migration_count": 0,
			"birth_count": 0,
		},
	}


func _append_combat_anchors(anchors: Dictionary, hamlet_site: Dictionary) -> void:
	if _planner == null:
		return
	if bool(hamlet_site.get("is_starter", false)):
		anchors["goblin_camp"] = _planner.get_anchor("goblin_camp")
		anchors["raid_approach"] = _planner.get_anchor("raid_approach")
		for starter in _planner.starter_sites:
			if str(starter.get("type_id", "")) == "goblin_camp":
				anchors["goblin_camp_site_id"] = str(starter["site_id"])
				break
		return
	var hamlet := Vector2i(anchors["hamlet"])
	var hamlet_chunk := Vector2i(
		floori(float(hamlet.x) / 16.0),
		floori(float(hamlet.y) / 16.0))
	var camp_filter: Array[String] = ["goblin_camp"]
	var camps: Array[Dictionary] = _planner.query_sites(
		Rect2i(hamlet_chunk - Vector2i(24, 24), Vector2i(49, 49)),
		camp_filter)
	var best: Dictionary = {}
	var best_distance := INF
	for camp in camps:
		var distance := Vector2(hamlet).distance_to(Vector2(camp["position"]))
		if distance < 6.0 * 16.0 or distance > 24.0 * 16.0:
			continue
		if distance < best_distance:
			best = camp
			best_distance = distance
	if best.is_empty():
		return
	var camp_position := Vector2i(best["position"])
	anchors["goblin_camp"] = camp_position
	anchors["goblin_camp_site_id"] = str(best["site_id"])
	var approach := Vector2(hamlet).lerp(Vector2(camp_position), 0.58)
	anchors["raid_approach"] = Vector2i(
		roundi(approach.x), roundi(approach.y))


func _serializable_site(site: Dictionary) -> Dictionary:
	var copy := site.duplicate(true)
	for key in ["origin_chunk", "position", "footprint", "region"]:
		if copy.get(key) is Vector2i:
			var point: Vector2i = copy[key]
			copy[key] = [point.x, point.y]
	return copy


func focused_station(kind: String) -> Vector2i:
	if focused_settlement_id.is_empty() \
			or not settlements.has(focused_settlement_id):
		return Vector2i.ZERO
	var stations: Dictionary = settlements[focused_settlement_id].get(
		"stations", {})
	var source: Variant = stations.get(kind, [])
	if source is Array and source.size() >= 2:
		return Vector2i(int(source[0]), int(source[1]))
	if kind == "warehouse":
		return HamletState.warehouse_anchor
	if kind == "watchtower_site":
		return HamletState.watchtower_anchor
	return HamletState.hamlet_anchor + Vector2i(3, 0)


func _point_array(point: Vector2i) -> Array[int]:
	return [point.x, point.y]


# ---------- Stage B terrain, projects, routes, and population ----------

func survey_project_site(
		settlement_id: String,
		project_id: String,
		anchor: Vector3i,
		rotation: int = 0,
		placement_mode: String = "village",
		confirmed_player_overlap: bool = false) -> Dictionary:
	if _terrain_planner == null:
		return {
			"validation_result": "invalid",
			"validation_reasons": ["terrain_planner_not_bound"],
		}
	return _terrain_planner.survey_project_site(
		settlement_id, project_id, anchor, rotation, placement_mode,
		confirmed_player_overlap)


func plan_access_route(
		settlement_id: String,
		from_position: Vector3i,
		to_position: Vector3i) -> Dictionary:
	if _terrain_planner == null:
		return {
			"valid": false,
			"cells": [],
			"validation_reasons": ["terrain_planner_not_bound"],
		}
	return _terrain_planner.plan_access_route(
		settlement_id, from_position, to_position)


func get_project_proposals(settlement_id: String) -> Array[Dictionary]:
	if not settlements.has(settlement_id):
		return []
	var record := get_settlement(settlement_id)
	var current_stage := str(record.get("stage", "camp"))
	var current_index := maxi(0, STAGE_ORDER.find(current_stage))
	var next_index := mini(STAGE_ORDER.size() - 1, current_index + 1)
	var report := get_population_report(settlement_id)
	var proposals: Array[Dictionary] = []
	var project_ids: Array = SettlementContentRegistry.construction_projects.keys()
	project_ids.sort()
	for project_value in project_ids:
		var project_id := str(project_value)
		var project := SettlementContentRegistry.get_project(project_id)
		var minimum_stage := str(project.get("min_stage", "camp"))
		var minimum_index := STAGE_ORDER.find(minimum_stage)
		var blockers: Array[String] = []
		if minimum_index < 0:
			blockers.append("unknown_minimum_stage:%s" % minimum_stage)
		elif minimum_index > next_index:
			blockers.append("requires_stage:%s" % minimum_stage)
		var building_id := str(project.get("building_id", ""))
		var duplicate_active := false
		for runtime_value in (
				(record.get("hamlet_state", {}) as Dictionary).get(
					"runtime_projects", {}) as Dictionary).values():
			if runtime_value is Dictionary \
					and str(runtime_value.get("definition_id", "")) == project_id \
					and not bool(runtime_value.get("cancelled", false)):
				duplicate_active = true
				break
		if duplicate_active:
			blockers.append("already_active")
		var need_score := _proposal_need_score(
			str(project.get("primary_need", "")), report)
		var priority := (
			1000 if minimum_index == next_index else
			700 if minimum_index == current_index else 300)
		priority += need_score
		if "housing" in building_id or "cottage" in building_id:
			priority += int(report.get("housing_pressure", 0)) * 80
		if "road" in building_id or "bridge" in building_id:
			priority += int(report.get("route_failures", 0)) * 90
		proposals.append({
			"kind": "project",
			"id": project_id,
			"display_name": str(project.get("display_name", project_id)),
			"building_id": building_id,
			"minimum_stage": minimum_stage,
			"eligible": blockers.is_empty(),
			"blockers": blockers,
			"priority": priority,
			"placement_modes": ["village", "player"],
			"rotation_options": [0, 90, 180, 270],
		})
	var plan_ids: Array = SettlementContentRegistry.plan_specs.keys()
	plan_ids.sort()
	for plan_value in plan_ids:
		var plan_id := str(plan_value)
		var plan := SettlementContentRegistry.get_plan(plan_id)
		var minimum_stage := str(plan.get("min_stage", "village"))
		var blockers: Array[String] = []
		if STAGE_ORDER.find(minimum_stage) > next_index:
			blockers.append("requires_stage:%s" % minimum_stage)
		proposals.append({
			"kind": "plan",
			"id": plan_id,
			"display_name": str(plan.get("display_name", plan_id)),
			"minimum_stage": minimum_stage,
			"eligible": blockers.is_empty(),
			"blockers": blockers,
			"priority": 500 if blockers.is_empty() else 100,
		})
	proposals.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a.get("priority", 0)) != int(b.get("priority", 0)):
			return int(a.get("priority", 0)) > int(b.get("priority", 0))
		return str(a.get("id", "")) < str(b.get("id", "")))
	return proposals


func begin_project(
		settlement_id: String,
		project_id: String,
		placement_mode: Variant = "village") -> Dictionary:
	if not settlements.has(settlement_id):
		return {"ok": false, "reason": "unknown_settlement"}
	var project := SettlementContentRegistry.get_project(project_id)
	if project.is_empty():
		return {"ok": false, "reason": "unknown_project"}
	var mode := "village"
	var rotation := 0
	var requested_position := Vector3i.ZERO
	var has_requested_position := false
	var confirmed_player_overlap := false
	if placement_mode is Dictionary:
		mode = str(placement_mode.get("mode", "village"))
		rotation = posmod(int(placement_mode.get("rotation", 0)), 360)
		confirmed_player_overlap = bool(placement_mode.get(
			"confirmed_player_overlap", false))
		var values: Variant = placement_mode.get("position", [])
		if values is Array and values.size() >= 3:
			requested_position = Vector3i(
				int(values[0]), int(values[1]), int(values[2]))
			has_requested_position = true
	else:
		mode = str(placement_mode)
	if mode not in ["village", "player"]:
		return {"ok": false, "reason": "invalid_placement_mode"}
	var record: Dictionary = settlements[settlement_id]
	var anchor_source: Array = record.get("anchor", [0, 0])
	var anchor_2d := Vector2i(
		int(anchor_source[0]), int(anchor_source[1]))
	if not has_requested_position:
		var digest := ValleyPlan.derive_seed(
			world_seed, "%s:%s:%d" % [
				settlement_id, project_id,
				(record.get("surveys", {}) as Dictionary).size()])
		var angle := float(digest % 6283) / 1000.0
		var distance := 18.0 + float(int(digest / 17) % 22)
		var point := Vector2(anchor_2d) + Vector2(
			cos(angle), sin(angle)) * distance
		var gx := roundi(point.x)
		var gz := roundi(point.y)
		requested_position = Vector3i(
			gx,
			_world.surface_height_at(gx, gz) if _world != null else 0,
			gz)
	var survey := survey_project_site(
		settlement_id, project_id, requested_position, rotation, mode,
		confirmed_player_overlap)
	record["pending_survey"] = survey.duplicate(true)
	record["dirty"] = true
	settlements[settlement_id] = record
	settlements_changed.emit()
	return {
		"ok": str(survey.get("validation_result", "invalid")) == "valid",
		"reason": (
			"" if str(survey.get("validation_result", "invalid")) == "valid"
			else "site_validation_failed"),
		"survey": survey,
	}


func confirm_project_site(
		settlement_id: String,
		survey: Dictionary) -> Dictionary:
	if not settlements.has(settlement_id) \
			or str(survey.get("settlement_id", "")) != settlement_id:
		return {"ok": false, "reason": "unknown_settlement"}
	if str(survey.get("validation_result", "invalid")) != "valid":
		return {
			"ok": false,
			"reason": "invalid_survey",
			"blockers": survey.get("validation_reasons", []),
		}
	if bool(survey.get("requires_overlap_confirmation", false)):
		return {"ok": false, "reason": "player_overlap_confirmation_required"}
	if not focus_settlement(settlement_id):
		return {"ok": false, "reason": "focus_failed"}
	var project_id := str(survey.get("project_id", ""))
	var plan_hash := str(survey.get("plan_hash", ""))
	var anchor: Array = survey.get("anchor", [])
	if project_id.is_empty() or plan_hash.is_empty() or anchor.size() < 3:
		return {"ok": false, "reason": "incomplete_survey"}
	var instance_id := "%s.project.%s.%s" % [
		settlement_id,
		project_id.get_file().validate_node_name(),
		plan_hash.left(12),
	]
	var create_result := HamletState.create_project_instance(
		project_id, instance_id, [int(anchor[0]), int(anchor[2])])
	if not bool(create_result.get("ok", false)):
		return create_result
	HamletState.activate_project_instance(instance_id)
	var packages := _terrain_planner.compile_work_packages(survey)
	var project_record: Dictionary = HamletState.runtime_projects[instance_id]
	project_record["rotation"] = int(survey.get("rotation", 0))
	project_record["site_survey_hash"] = plan_hash
	project_record["work_package_ids"] = packages.map(
		func(package: Dictionary) -> String:
			return str(package.get("package_id", "")))
	project_record["work_package_index"] = 0
	project_record["placement_mode"] = str(
		survey.get("placement_mode", "village"))
	HamletState.runtime_projects[instance_id] = project_record
	HamletState.project = project_record
	var record: Dictionary = settlements[settlement_id]
	(record["surveys"] as Dictionary)[plan_hash] = survey.duplicate(true)
	for package in packages:
		(record["work_packages"] as Dictionary)[
			str(package["package_id"])] = package.duplicate(true)
	(record["parcels"] as Dictionary)[plan_hash] = {
		"claim_id": plan_hash,
		"settlement_id": settlement_id,
		"project_instance_id": instance_id,
		"footprint": survey.get("footprint", {}).duplicate(true),
		"status": "claimed",
	}
	record["pending_survey"] = {}
	record["hamlet_state"] = HamletState.serialize_state()
	record["dirty"] = true
	settlements[settlement_id] = record
	project_proposals_changed.emit(settlement_id)
	settlements_changed.emit()
	return {
		"ok": true,
		"project_instance_id": instance_id,
		"survey_hash": plan_hash,
		"work_packages": packages,
	}


func get_population_report(settlement_id: String) -> Dictionary:
	if not settlements.has(settlement_id):
		return {"ok": false, "reason": "unknown_settlement"}
	var record := get_settlement(settlement_id)
	var state: Dictionary = record.get("hamlet_state", {})
	var residents: Dictionary = state.get("npc_records", {})
	var bed_slots: Dictionary = record.get("bed_slots", {})
	var job_slots: Dictionary = record.get("job_slots", {})
	var adults := 0
	var children := 0
	var available_adults := 0
	var biologically_unavailable_adults := 0
	var socially_unavailable_adults := 0
	var displaced := 0
	var assigned_beds := {}
	var assigned_jobs := {}
	for resident_value in residents.values():
		if not (resident_value is Dictionary) \
				or not bool(resident_value.get("alive", true)):
			continue
		var age_band := str(resident_value.get("age_band", "adult"))
		if age_band == "adult":
			adults += 1
			var resident_id := str(resident_value.get(
				"resident_id", resident_value.get("id", "")))
			var availability: Dictionary = (
				BiologyManager.assignment_availability(resident_id)
				if BiologyManager.initialized \
					and BiologyManager.has_actor(resident_id)
				else {"ok": true, "available": true})
			var social_willingness: Dictionary = (
				SocialManager.assignment_willingness(resident_id, {
					"task_type": "settlement_population_availability",
				}) if SocialManager.initialized \
					and SocialManager.has_profile(resident_id) \
				else {"ok": true, "available": true})
			if bool(availability.get("available", true)) \
					and bool(social_willingness.get("available", true)):
				available_adults += 1
			if not bool(availability.get("available", true)):
				biologically_unavailable_adults += 1
			if not bool(social_willingness.get("available", true)):
				socially_unavailable_adults += 1
		else:
			children += 1
		var bed_id := str(resident_value.get("bed_id", ""))
		if not bed_id.is_empty():
			assigned_beds[bed_id] = true
		var job_id := str(resident_value.get("job_assignment_id", ""))
		if not job_id.is_empty():
			assigned_jobs[job_id] = true
		var bed: Dictionary = bed_slots.get(bed_id, {})
		if bed.is_empty() or not bool(bed.get("reachable", false)) \
				or not bool(bed.get("safe", false)) \
				or bool(resident_value.get("displaced", false)):
			displaced += 1
	var valid_beds := 0
	var permanent_beds := 0
	for bed_value in bed_slots.values():
		if bed_value is Dictionary \
				and bool(bed_value.get("reachable", false)) \
				and bool(bed_value.get("safe", false)):
			valid_beds += 1
			if bool(bed_value.get("permanent", false)):
				permanent_beds += 1
	var valid_jobs := 0
	for job_value in job_slots.values():
		if job_value is Dictionary \
				and bool(job_value.get("reachable", false)) \
				and bool(job_value.get("active", false)):
			valid_jobs += 1
	var population := adults + children
	var current_stage := str(record.get("stage", "camp"))
	var next_stage := _next_stage(current_stage)
	var capability: Dictionary = record.get("capability", {})
	var missing_capability: Array = (
		(capability.get("missing_by_stage", {}) as Dictionary).get(
			next_stage, []) as Array).duplicate()
	var promotion_blockers: Array[String] = []
	if population < int(POPULATION_GATES[next_stage]):
		promotion_blockers.append("population:%d/%d" % [
			population, int(POPULATION_GATES[next_stage])])
	if valid_beds < population + 1:
		promotion_blockers.append("housing_reserve:%d/%d" % [
			valid_beds, population + 1])
	if valid_jobs < adults:
		promotion_blockers.append("adult_jobs:%d/%d" % [valid_jobs, adults])
	if displaced > 0:
		promotion_blockers.append("displaced_residents:%d" % displaced)
	for missing_id in missing_capability:
		promotion_blockers.append("capability:%s" % str(missing_id))
	return {
		"ok": true,
		"settlement_id": settlement_id,
		"stage": current_stage,
		"next_stage": next_stage,
		"population": population,
		"adults": adults,
		"children": children,
		"available_adults": available_adults,
		"biologically_unavailable_adults": biologically_unavailable_adults,
		"socially_unavailable_adults": socially_unavailable_adults,
		"population_health_summary": (
			record.get("population_health_summary", {}) as Dictionary
		).duplicate(true),
		"displaced": displaced,
		"valid_beds": valid_beds,
		"permanent_beds": permanent_beds,
		"occupied_beds": assigned_beds.size(),
		"spare_beds": maxi(0, valid_beds - assigned_beds.size()),
		"valid_adult_jobs": valid_jobs,
		"occupied_jobs": assigned_jobs.size(),
		"spare_jobs": maxi(0, valid_jobs - assigned_jobs.size()),
		"housing_pressure": maxi(0, population + 1 - valid_beds),
		"route_failures": _route_failure_count(record),
		"population_gate": int(POPULATION_GATES[current_stage]),
		"next_population_gate": int(POPULATION_GATES[next_stage]),
		"missing_capability": missing_capability,
		"promotion_eligible": promotion_blockers.is_empty(),
		"promotion_blockers": promotion_blockers,
	}


func evaluate_population_day(
		settlement_id: String,
		forced_action: String = "") -> Dictionary:
	if not settlements.has(settlement_id):
		return {"ok": false, "reason": "unknown_settlement"}
	if not focus_settlement(settlement_id):
		return {"ok": false, "reason": "focus_failed"}
	var record: Dictionary = settlements[settlement_id]
	var population_state: Dictionary = record.get("population_state", {})
	var current_day := HamletState.day
	if forced_action.is_empty() \
			and int(population_state.get("last_population_day", 0)) >= current_day:
		return {"ok": false, "reason": "already_evaluated_today"}
	var report := get_population_report(settlement_id)
	var stable := (
		int(report.get("displaced", 0)) == 0
		and int(report.get("spare_beds", 0)) > 0
		and int(report.get("spare_jobs", 0)) > 0
		and _resident_needs_are_stable())
	population_state["stable_days"] = (
		int(population_state.get("stable_days", 0)) + 1 if stable else 0)
	population_state["last_population_day"] = current_day
	var age_result := _advance_child_age(settlement_id, 1)
	var action := forced_action
	if action.is_empty() and _has_due_birth(record):
		action = "birth_due"
	elif action.is_empty() and _should_form_household(record, report):
		action = "form_household"
	elif action.is_empty() and _should_start_gestation(record, report):
		action = "birth_start"
	if action.is_empty() \
			and stable \
			and int(population_state.get("stable_days", 0)) \
				>= MIGRATION_STABLE_DAYS \
			and current_day >= int(population_state.get(
				"migration_cooldown_until_day", 0)):
		action = "migration"
	var result := {"ok": true, "action": "none"}
	match action:
		"migration":
			result = _add_migrant(settlement_id, record, report)
			if bool(result.get("ok", false)):
				population_state["migration_count"] = int(
					population_state.get("migration_count", 0)) + 1
				population_state["migration_cooldown_until_day"] = (
					current_day + MIGRATION_COOLDOWN_DAYS)
				population_state["stable_days"] = 0
		"form_household":
			result = _form_household(settlement_id, record)
		"birth":
			result = _begin_or_complete_birth(settlement_id, record, true)
		"birth_due":
			result = _begin_or_complete_birth(settlement_id, record, false)
		"birth_start":
			result = _begin_or_complete_birth(settlement_id, record, false)
		"age":
			result = _advance_child_age(settlement_id, ADULT_AGE_DAYS)
	if str(result.get("action", "")) == "none" \
			and bool(age_result.get("ok", false)):
		result = age_result
	record = settlements.get(settlement_id, record)
	record["population_state"] = population_state
	record["hamlet_state"] = HamletState.serialize_state()
	record["dirty"] = true
	settlements[settlement_id] = record
	population_changed.emit(settlement_id)
	settlements_changed.emit()
	return result


func promote_stage_if_eligible(settlement_id: String) -> Dictionary:
	var report := get_population_report(settlement_id)
	if not bool(report.get("ok", false)):
		return report
	if not bool(report.get("promotion_eligible", false)):
		return {
			"ok": false,
			"reason": "promotion_blocked",
			"blockers": report.get("promotion_blockers", []),
		}
	var record: Dictionary = settlements[settlement_id]
	record["stage"] = str(report["next_stage"])
	record["dirty"] = true
	settlements[settlement_id] = record
	project_proposals_changed.emit(settlement_id)
	settlements_changed.emit()
	return {"ok": true, "stage": record["stage"]}


func navigation_waypoints(
		settlement_id: String,
		from_position: Vector3,
		to_position: Vector3) -> Array[Vector3]:
	if _terrain_planner == null:
		return [to_position]
	var record := get_settlement(settlement_id)
	var route_cells := _route_graph_cells(record)
	var from_cell := Vector2i(
		floori(from_position.x), floori(from_position.z))
	var to_cell := Vector2i(floori(to_position.x), floori(to_position.z))
	var cells: Array[Array] = []
	if route_cells.is_empty() or from_cell.distance_to(to_cell) < 10.0:
		var direct_plan := _terrain_planner.plan_access_route(
			settlement_id,
			Vector3i(from_cell.x, floori(from_position.y), from_cell.y),
			Vector3i(to_cell.x, floori(to_position.y), to_cell.y))
		if not bool(direct_plan.get("valid", false)):
			return []
		cells.assign(direct_plan.get("cells", []))
	else:
		var entry := _nearest_graph_cell(route_cells, from_cell)
		var exit := _nearest_graph_cell(route_cells, to_cell)
		var approach := _terrain_planner.plan_access_route(
			settlement_id,
			Vector3i(from_cell.x, floori(from_position.y), from_cell.y),
			Vector3i(
				entry.x,
				_world.surface_height_at(entry.x, entry.y),
				entry.y))
		var departure := _terrain_planner.plan_access_route(
			settlement_id,
			Vector3i(
				exit.x,
				_world.surface_height_at(exit.x, exit.y),
				exit.y),
			Vector3i(to_cell.x, floori(to_position.y), to_cell.y))
		var route_path := _route_graph_path(route_cells, entry, exit)
		if not bool(approach.get("valid", false)) \
				or not bool(departure.get("valid", false)) \
				or route_path.is_empty():
			return []
		cells.assign(approach.get("cells", []))
		for route_cell in route_path:
			var ground := _world.surface_height_at(route_cell.x, route_cell.y)
			cells.append([route_cell.x, ground, route_cell.y])
		for value in departure.get("cells", []):
			cells.append(value)
	var result: Array[Vector3] = []
	var previous := Vector2i(2147483647, 2147483647)
	for value in cells:
		var cell: Array = value
		var point := Vector2i(int(cell[0]), int(cell[2]))
		if point == previous:
			continue
		previous = point
		result.append(Vector3(
			float(cell[0]) + 0.5, float(cell[1]) + 1.05,
			float(cell[2]) + 0.5))
	return result


func _route_graph_cells(record: Dictionary) -> Dictionary:
	var graph := {}
	for route_value in record.get("routes", []):
		if not (route_value is Dictionary) \
				or not bool(route_value.get("valid", false)):
			continue
		var route: Dictionary = route_value
		var previous := Vector2i(2147483647, 2147483647)
		for cell_value in route.get("cells", []):
			if not (cell_value is Array) or cell_value.size() < 3:
				continue
			var cell := Vector2i(int(cell_value[0]), int(cell_value[2]))
			var key := "%d:%d" % [cell.x, cell.y]
			if not graph.has(key):
				graph[key] = {"cell": cell, "neighbors": {}}
			if previous.x != 2147483647:
				var previous_key := "%d:%d" % [previous.x, previous.y]
				if not graph.has(previous_key):
					graph[previous_key] = {
						"cell": previous, "neighbors": {},
					}
				graph[key]["neighbors"][previous_key] = true
				graph[previous_key]["neighbors"][key] = true
			previous = cell
	return graph


func _nearest_graph_cell(graph: Dictionary, point: Vector2i) -> Vector2i:
	var nearest := point
	var nearest_distance := INF
	for value in graph.values():
		var cell: Vector2i = value.get("cell", point)
		var distance := point.distance_squared_to(cell)
		if distance < nearest_distance:
			nearest = cell
			nearest_distance = distance
	return nearest


func _route_graph_path(
		graph: Dictionary,
		start: Vector2i,
		goal: Vector2i) -> Array[Vector2i]:
	var start_key := "%d:%d" % [start.x, start.y]
	var goal_key := "%d:%d" % [goal.x, goal.y]
	if not graph.has(start_key) or not graph.has(goal_key):
		return []
	var queue: Array[String] = [start_key]
	var parents := {start_key: ""}
	while not queue.is_empty():
		var key: String = queue.pop_front()
		if key == goal_key:
			break
		var neighbors: Array = graph[key]["neighbors"].keys()
		neighbors.sort()
		for neighbor_value in neighbors:
			var neighbor := str(neighbor_value)
			if parents.has(neighbor):
				continue
			parents[neighbor] = key
			queue.append(neighbor)
	if not parents.has(goal_key):
		return []
	var reversed: Array[Vector2i] = []
	var cursor := goal_key
	while not cursor.is_empty():
		reversed.append(graph[cursor]["cell"])
		cursor = str(parents.get(cursor, ""))
	reversed.reverse()
	return reversed


func assign_resident_task(
		settlement_id: String,
		resident_id: String,
		task: Dictionary) -> Dictionary:
	if not focus_settlement(settlement_id) \
			or HamletState.get_npc_record(resident_id).is_empty():
		return {"ok": false, "reason": "unknown_resident"}
	if BiologyManager.initialized and BiologyManager.has_actor(resident_id):
		var availability := BiologyManager.assignment_availability(resident_id)
		if not bool(availability.get("available", false)):
			return {
				"ok": false,
				"reason": "biological_assignment_unavailable",
				"biological_availability": availability,
			}
	if SocialManager.initialized and SocialManager.has_profile(resident_id):
		var willingness := SocialManager.assignment_willingness(resident_id, task)
		if not bool(willingness.get("ok", false)) \
				or not bool(willingness.get("available", false)):
			return {
				"ok": false,
				"reason": "social_assignment_unavailable",
				"social_willingness": willingness,
			}
	var record := task.duplicate(true)
	record["record_type"] = "NpcTask"
	record["version"] = 1
	record["task_id"] = str(record.get(
		"task_id", "%s.task.%08x" % [
			resident_id,
			ValleyPlan.derive_seed(world_seed, JSON.stringify(task)),
		]))
	record["status"] = str(record.get("status", "reserved"))
	record["pause_reason"] = ""
	HamletState.update_resident_runtime(resident_id, {
		"current_task": record,
		"source_storage_id": str(record.get("source_storage_id", "")),
		"destination": record.get("destination", []),
	})
	_capture_focused_facade()
	return {"ok": true, "task": record}


func advance_project_work(
		settlement_id: String,
		project_instance_id: String,
		resident_id: String,
		force_position: bool = false) -> Dictionary:
	## Advances exactly one conserved task transition or one visible voxel.
	## It never consumes progress when terrain, access, stock, inventory, or
	## equipment validation fails.
	if _world == null or not focus_settlement(settlement_id):
		return {"ok": false, "reason": "settlement_or_world_unavailable"}
	if not HamletState.runtime_projects.has(project_instance_id):
		return {"ok": false, "reason": "unknown_project"}
	if HamletState.get_npc_record(resident_id).is_empty():
		return {"ok": false, "reason": "unknown_resident"}
	if BiologyManager.initialized and BiologyManager.has_actor(resident_id):
		var availability := BiologyManager.assignment_availability(resident_id)
		if not bool(availability.get("available", false)):
			return {
				"ok": false,
				"reason": "biological_assignment_unavailable",
				"progress_consumed": false,
				"biological_availability": availability,
			}
	if SocialManager.initialized and SocialManager.has_profile(resident_id):
		var willingness := SocialManager.assignment_willingness(resident_id, {
			"task_type": "settlement_project_work",
			"project_instance_id": project_instance_id,
		})
		if not bool(willingness.get("ok", false)) \
				or not bool(willingness.get("available", false)):
			return {
				"ok": false,
				"reason": "social_assignment_unavailable",
				"progress_consumed": false,
				"social_willingness": willingness,
			}
	if not HamletState.activate_project_instance(project_instance_id):
		return {"ok": false, "reason": "project_activation_failed"}
	var project: Dictionary = HamletState.runtime_projects[project_instance_id]
	var package_ids: Array = project.get("work_package_ids", [])
	var package_index := int(project.get("work_package_index", 0))
	if package_index >= package_ids.size():
		return {"ok": true, "complete": true}
	var record: Dictionary = settlements[settlement_id]
	var package_id := str(package_ids[package_index])
	var packages: Dictionary = record.get("work_packages", {})
	if not packages.has(package_id):
		return {"ok": false, "reason": "missing_work_package"}
	var package: Dictionary = packages[package_id]
	var survey: Dictionary = (record.get("surveys", {}) as Dictionary).get(
		str(project.get("site_survey_hash", "")), {})
	var resident := HamletState.get_npc_record(resident_id)
	var task: Dictionary = resident.get("current_task", {}).duplicate(true)

	if str(package.get("status", "pending")) == "pending":
		var preparation := _prepare_work_package(
			settlement_id, package, resident_id)
		if not bool(preparation.get("ok", false)):
			package["status"] = "paused"
			package["pause_reason"] = str(preparation.get("reason", "blocked"))
			packages[package_id] = package
			record["work_packages"] = packages
			settlements[settlement_id] = record
			return preparation
		package["status"] = "traveling"
		package["pause_reason"] = ""
		task = {
			"record_type": "NpcTask",
			"version": 1,
			"task_id": "%s.%s" % [resident_id, package_id],
			"kind": "construction",
			"package_id": package_id,
			"project_instance_id": project_instance_id,
			"phase": "collect",
			"status": "traveling",
			"source_storage_id": "%s.storage.builder_yard" % settlement_id,
			"destination": [
				HamletState.warehouse_anchor.x,
				_world.surface_height_at(
					HamletState.warehouse_anchor.x,
					HamletState.warehouse_anchor.y),
				HamletState.warehouse_anchor.y,
			],
			"progress_consumed": false,
		}
		HamletState.update_resident_runtime(resident_id, {
			"current_task": task,
			"source_storage_id": task["source_storage_id"],
			"destination": task["destination"],
		})
		packages[package_id] = package
		record["work_packages"] = packages
		_store_focused_record(settlement_id, record)
		return {"ok": true, "status": "traveling_to_storage"}

	if str(package.get("status", "")) == "paused":
		package["status"] = "pending"
		package["pause_reason"] = ""
		packages[package_id] = package
		record["work_packages"] = packages
		_store_focused_record(settlement_id, record)
		return {"ok": true, "status": "rechecking_blocker"}

	if str(task.get("phase", "")) == "collect":
		if not force_position and not _resident_near(
				resident, HamletState.warehouse_anchor, 2.4):
			return {"ok": true, "status": "traveling_to_storage"}
		var withdrawal := _withdraw_package_requirements(package, resident_id)
		if not bool(withdrawal.get("ok", false)):
			return _pause_package(
				settlement_id, record, packages, package_id, package,
				resident_id, str(withdrawal.get("reason", "storage_changed")))
		task["phase"] = "work"
		task["status"] = "traveling"
		task["destination"] = _package_destination(package, survey)
		HamletState.update_resident_runtime(resident_id, {
			"current_task": task,
			"destination": task["destination"],
		})
		package["status"] = "traveling"
		packages[package_id] = package
		record["work_packages"] = packages
		_store_focused_record(settlement_id, record)
		return {"ok": true, "status": "traveling_to_site"}

	var destination: Array = _package_destination(package, survey)
	if not force_position and not _resident_near_array(resident, destination, 2.8):
		return {"ok": true, "status": "traveling_to_site"}
	var step_result := _perform_package_step(
		settlement_id, project_instance_id, package, survey, resident_id)
	if not bool(step_result.get("ok", false)):
		return _pause_package(
			settlement_id, record, packages, package_id, package,
			resident_id, str(step_result.get("reason", "work_blocked")))
	package = step_result.get("package", package)
	if bool(step_result.get("package_complete", false)):
		package["status"] = "complete"
		project = HamletState.runtime_projects.get(
			project_instance_id, project).duplicate(true)
		project["work_package_index"] = package_index + 1
		HamletState.runtime_projects[project_instance_id] = project
		HamletState.project = project
		task["status"] = "complete"
		task["phase"] = "deposit"
		task["destination"] = [
			HamletState.warehouse_anchor.x,
			_world.surface_height_at(
				HamletState.warehouse_anchor.x,
				HamletState.warehouse_anchor.y),
			HamletState.warehouse_anchor.y,
		]
		HamletState.update_resident_runtime(resident_id, {
			"current_task": task,
			"destination": task["destination"],
		})
	else:
		package["status"] = "active"
		task["status"] = "active"
		task["progress_consumed"] = true
		HamletState.update_resident_runtime(resident_id, {
			"current_task": task,
		})
	packages[package_id] = package
	record["work_packages"] = packages
	_store_focused_record(settlement_id, record)
	return step_result


func _prepare_work_package(
		settlement_id: String,
		package: Dictionary,
		resident_id: String) -> Dictionary:
	for cell_value in package.get("cells", []):
		if not (cell_value is Array) or cell_value.size() < 3:
			continue
		var cell := Vector3i(
			int(cell_value[0]), int(cell_value[1]), int(cell_value[2]))
		if not _world.is_voxel_loaded_at(cell):
			return {"ok": false, "reason": "terrain_unloaded"}
	var tool_check := _ensure_resident_tool(
		resident_id, package.get("tool_requirements", {}))
	if not bool(tool_check.get("ok", false)):
		return tool_check
	return {"ok": true, "settlement_id": settlement_id}


func _ensure_resident_tool(
		resident_id: String,
		requirements: Dictionary) -> Dictionary:
	if requirements.is_empty():
		return {"ok": true}
	var resident := HamletState.get_npc_record(resident_id)
	for stack_value in [
		resident.get("equipment", {}),
		resident.get("carried_stack", {}),
	]:
		if not (stack_value is Dictionary) or stack_value.is_empty():
			continue
		var stack: Dictionary = stack_value
		if str(stack.get("kind", "")) != "item":
			continue
		var profile := ItemRegistry.get_tool_profile(int(stack.get("id", -1)))
		var tool_class := str(profile.get("class", ""))
		if requirements.has(tool_class) \
				and int(profile.get("level", -1)) >= int(
					requirements[tool_class]) \
				and int((stack.get("instance", {}) as Dictionary).get(
					"durability", 1)) > 0:
			return {"ok": true}
	for slot_value in HamletState.warehouse_slots:
		if not (slot_value is Dictionary) or slot_value.is_empty() \
				or str(slot_value.get("kind", "")) != "item":
			continue
		var profile := ItemRegistry.get_tool_profile(
			int(slot_value.get("id", -1)))
		var tool_class := str(profile.get("class", ""))
		if requirements.has(tool_class) \
				and int(profile.get("level", -1)) >= int(
					requirements[tool_class]):
			return {"ok": true, "available_at_storage": true}
	return {
		"ok": false,
		"reason": "required_tool_missing_or_under_levelled",
		"requirements": requirements.duplicate(true),
	}


func _withdraw_package_requirements(
		package: Dictionary,
		resident_id: String) -> Dictionary:
	var requirements: Dictionary = package.get("requirements", {})
	var before := HamletState.warehouse_slots.duplicate(true)
	var transactions: Array = package.get("transactions", [])
	var tool_result := _equip_required_tool_from_warehouse(
		resident_id, package.get("tool_requirements", {}))
	if not bool(tool_result.get("ok", false)):
		return tool_result
	if str(package.get("kind", "")) == "blueprint_stage":
		if bool(HamletState.project.get("awaiting_supplies", true)):
			HamletState._try_reserve_current_stage()
		if bool(HamletState.project.get("awaiting_supplies", true)):
			return {"ok": false, "reason": "stage_supplies_not_reserved"}
		transactions.append({
			"event": "withdraw_project_reservation",
			"resident_id": resident_id,
			"source": "%s.storage.builder_yard" % (
				HamletState.active_village_id),
			"requirements": requirements.duplicate(true),
			"conserved": true,
		})
		package["reserved"] = requirements.duplicate(true)
		package["transactions"] = transactions
		return {"ok": true}
	for stable_value in requirements:
		var stable_id := str(stable_value)
		var count := maxi(0, int(requirements[stable_value]))
		if count <= 0:
			continue
		var kind := (
			"item" if ItemRegistry.get_id_by_stable_id(stable_id) >= 0
			else "block")
		var content_ref := {
			"kind": kind, "stable_id": stable_id, "count": count,
		}
		if not HamletState.warehouse_remove_ref(content_ref, count):
			HamletState.warehouse_slots = before
			return {
				"ok": false,
				"reason": "storage_changed_or_missing:%s:%d" % [
					stable_id, count],
			}
		transactions.append({
			"event": "withdraw",
			"resident_id": resident_id,
			"source": "%s.storage.builder_yard" % (
				HamletState.active_village_id),
			"content_ref": content_ref,
			"conserved": true,
		})
	package["reserved"] = requirements.duplicate(true)
	package["transactions"] = transactions
	return {"ok": true}


func _equip_required_tool_from_warehouse(
		resident_id: String,
		requirements: Dictionary) -> Dictionary:
	if requirements.is_empty():
		return {"ok": true}
	var resident := HamletState.get_npc_record(resident_id)
	var current: Dictionary = resident.get("equipment", {})
	if not current.is_empty() and str(current.get("kind", "")) == "item":
		var current_profile := ItemRegistry.get_tool_profile(
			int(current.get("id", -1)))
		var current_class := str(current_profile.get("class", ""))
		if requirements.has(current_class) \
				and int(current_profile.get("level", -1)) >= int(
					requirements[current_class]):
			return {"ok": true}
	for slot_index in HamletState.warehouse_slots.size():
		var stack: Dictionary = HamletState.warehouse_slots[slot_index]
		if stack.is_empty() or str(stack.get("kind", "")) != "item":
			continue
		var profile := ItemRegistry.get_tool_profile(
			int(stack.get("id", -1)))
		var tool_class := str(profile.get("class", ""))
		if not requirements.has(tool_class) \
				or int(profile.get("level", -1)) < int(
					requirements[tool_class]):
			continue
		var equipment := stack.duplicate(true)
		equipment["count"] = 1
		HamletState.warehouse_slots[slot_index] = {}
		HamletState.update_resident_runtime(resident_id, {
			"equipment": equipment,
		})
		return {"ok": true, "withdrawn": true}
	return {
		"ok": false,
		"reason": "required_tool_missing_or_under_levelled",
		"requirements": requirements.duplicate(true),
	}


func _perform_package_step(
		settlement_id: String,
		project_instance_id: String,
		package: Dictionary,
		survey: Dictionary,
		resident_id: String) -> Dictionary:
	var kind := str(package.get("kind", ""))
	var progress := int(package.get("progress", 0))
	var cells: Array = package.get("cells", [])
	var claim_id := str(survey.get("plan_hash", ""))
	if kind in ["route", "vegetation", "terrain"]:
		if progress >= cells.size():
			return {
				"ok": true, "package": package, "package_complete": true,
			}
		var values: Array = cells[progress]
		var cell := Vector3i(int(values[0]), int(values[1]), int(values[2]))
		if not _world.is_voxel_loaded_at(cell):
			return {"ok": false, "reason": "terrain_unloaded"}
		if kind == "route":
			var path_id := BlockRegistry.get_id_by_stable_id("road.path.dirt")
			if path_id <= 0:
				path_id = BlockRegistry.get_id_by_stable_id(
					"terrain.dirt.basic")
			if not _world.set_block_with_provenance(
					cell, path_id, project_instance_id, "project",
					settlement_id, claim_id):
				return {"ok": false, "reason": "route_write_failed"}
		else:
			var fill_keys := {}
			for fill_value in survey.get("fill_cells", []):
				fill_keys["%d:%d:%d" % [
					int(fill_value[0]), int(fill_value[1]),
					int(fill_value[2])]] = true
			var key := "%d:%d:%d" % [cell.x, cell.y, cell.z]
			if fill_keys.has(key):
				var fill_id := BlockRegistry.get_id_by_stable_id(
					"construction.cobble.stone")
				if not _world.set_block_with_provenance(
						cell, fill_id, project_instance_id, "project",
						settlement_id, claim_id):
					return {"ok": false, "reason": "foundation_fill_failed"}
			else:
				var block_id := _world.get_persisted_block_id(cell)
				var harvested := _collect_excavation_drop(
					resident_id, block_id, cell, project_instance_id)
				if not bool(harvested.get("ok", false)):
					return harvested
				if _world.is_door_at(cell):
					_world.remove_door(cell)
				elif not _world.set_block_with_provenance(
						cell, BlockRegistry.AIR, project_instance_id,
						"project", settlement_id, claim_id):
					return {"ok": false, "reason": "excavation_write_failed"}
		progress += 1
	elif kind == "blueprint_stage":
		if bool(HamletState.project.get("awaiting_supplies", true)):
			HamletState._try_reserve_current_stage()
		if bool(HamletState.project.get("awaiting_supplies", true)):
			return {"ok": false, "reason": "stage_supplies_not_reserved"}
		var project := SettlementContentRegistry.get_project(str(
			package.get("project_id", "")))
		var anchor_values: Array = survey.get("anchor", [])
		var anchor := Vector3i(
			int(anchor_values[0]), int(anchor_values[1]),
			int(anchor_values[2]))
		var placements := _world.get_blueprint_stage_placements(
			str(project.get("blueprint_id", "")),
			str(package.get("stage_id", "")), anchor, {},
			int(survey.get("rotation", 0)))
		HamletState.set_project_stage_total(placements.size())
		if progress >= placements.size():
			return {
				"ok": true, "package": package, "package_complete": true,
			}
		if not _world.place_blueprint_stage_cell(
				str(project.get("blueprint_id", "")),
				str(package.get("stage_id", "")), anchor, progress, {},
				int(survey.get("rotation", 0)), settlement_id, claim_id):
			return {"ok": false, "reason": "blueprint_cell_blocked"}
		if not HamletState.record_project_block_placed(placements.size()):
			return {"ok": false, "reason": "project_progress_rejected"}
		progress += 1
	elif kind == "activation":
		if not bool(HamletState.runtime_projects.get(
				project_instance_id, {}).get("complete", false)):
			return {"ok": false, "reason": "authored_stages_incomplete"}
		if not bool((survey.get("route_plan", {}) as Dictionary).get(
				"valid", false)) \
				or _route_failure_count(settlements[settlement_id]) > 0:
			return {"ok": false, "reason": "route_validation_failed"}
		_register_completed_building_capacity(
			settlement_id, project_instance_id, survey)
		progress = 1
	else:
		return {"ok": false, "reason": "unknown_work_package"}
	package["progress"] = progress
	var complete := (
		progress >= maxi(1, cells.size())
		if kind in ["route", "vegetation", "terrain"]
		else kind == "activation")
	if kind == "blueprint_stage":
		var project_definition := SettlementContentRegistry.get_project(str(
			package.get("project_id", "")))
		var anchor_values: Array = survey.get("anchor", [])
		var placement_total := _world.get_blueprint_stage_placements(
			str(project_definition.get("blueprint_id", "")),
			str(package.get("stage_id", "")),
			Vector3i(
				int(anchor_values[0]), int(anchor_values[1]),
				int(anchor_values[2])),
			{}, int(survey.get("rotation", 0))).size()
		complete = progress >= placement_total
	return {
		"ok": true,
		"package": package,
		"package_complete": complete,
		"progress_consumed": true,
		"voxel_progress": progress,
	}


func _collect_excavation_drop(
		resident_id: String,
		block_id: int,
		cell: Vector3i,
		project_instance_id: String) -> Dictionary:
	if BlockRegistry.is_air(block_id) or BlockRegistry.is_water(block_id):
		return {"ok": true}
	var profile := BlockRegistry.get_harvest_profile(block_id)
	var tool_check := _ensure_resident_tool(
		resident_id,
		{str(profile.get("tool", "")): int(profile.get("level", 0))}
			if not str(profile.get("tool", "")).is_empty() else {})
	if not bool(tool_check.get("ok", false)):
		return tool_check
	var resident := HamletState.get_npc_record(resident_id)
	var equipment: Dictionary = resident.get("equipment", {}).duplicate(true)
	var instance: Dictionary = equipment.get("instance", {}).duplicate(true)
	if not instance.is_empty():
		instance["durability"] = maxi(
			0, int(instance.get("durability", 1)) - 1)
		equipment["instance"] = instance
	var drop_ref := {
		"kind": str(profile.get("drop_kind", "block")),
		"stable_id": str(profile.get(
			"drop_id", BlockRegistry.get_stable_id(block_id))),
		"count": maxi(1, int(profile.get("drop_count", 1))),
	}
	var carried := Inventory.make_stack_from_ref(drop_ref)
	var history: Array = resident.get("transaction_history", []).duplicate(true)
	history.append({
		"event": "excavation_drop_collected",
		"project_instance_id": project_instance_id,
		"position": [cell.x, cell.y, cell.z],
		"content_ref": drop_ref,
		"conserved": true,
	})
	HamletState.update_resident_runtime(resident_id, {
		"equipment": equipment,
		"carried_stack": carried,
		"transaction_history": history,
	})
	return {"ok": true, "drop": drop_ref}


func deposit_resident_outputs(
		settlement_id: String,
		resident_id: String,
		force_position: bool = false) -> Dictionary:
	if not focus_settlement(settlement_id):
		return {"ok": false, "reason": "unknown_settlement"}
	var resident := HamletState.get_npc_record(resident_id)
	var carried: Dictionary = resident.get("carried_stack", {})
	if carried.is_empty():
		return {"ok": true, "deposited": false}
	if not force_position and not _resident_near(
			resident, HamletState.warehouse_anchor, 2.4):
		return {"ok": true, "status": "traveling_to_storage"}
	var leftover := HamletState.warehouse_add_stack(carried)
	if not leftover.is_empty():
		return {"ok": false, "reason": "inventory_full"}
	var history: Array = resident.get("transaction_history", []).duplicate(true)
	history.append({
		"event": "excavation_drop_deposited",
		"destination": "%s.storage.builder_yard" % settlement_id,
		"stack": carried.duplicate(true),
		"conserved": true,
	})
	HamletState.update_resident_runtime(resident_id, {
		"carried_stack": {},
		"transaction_history": history,
	})
	_capture_focused_facade()
	return {"ok": true, "deposited": true}


func cancel_project(
		settlement_id: String,
		project_instance_id: String) -> Dictionary:
	if not focus_settlement(settlement_id):
		return {"ok": false, "reason": "unknown_settlement"}
	var project: Dictionary = HamletState.runtime_projects.get(
		project_instance_id, {})
	if project.is_empty():
		return {"ok": false, "reason": "unknown_project"}
	var result := HamletState.cancel_project_instance(project_instance_id)
	if not bool(result.get("ok", false)):
		return result
	var record: Dictionary = settlements[settlement_id]
	var packages: Dictionary = record.get("work_packages", {})
	for package_id in project.get("work_package_ids", []):
		var package: Dictionary = packages.get(str(package_id), {})
		if package.is_empty() or str(package.get("status", "")) == "complete":
			continue
		var returnable: Dictionary = (
			{} if str(package.get("kind", "")) == "blueprint_stage"
			else package.get("reserved", {}))
		for stable_value in returnable:
			var stable_id := str(stable_value)
			var count := maxi(0, int(package["reserved"][stable_value]))
			if count <= 0:
				continue
			var kind := (
				"item" if ItemRegistry.get_id_by_stable_id(stable_id) >= 0
				else "block")
			HamletState.warehouse_add_stack(Inventory.make_stack_from_ref({
				"kind": kind, "stable_id": stable_id, "count": count,
			}))
		package["reserved"] = {}
		package["status"] = "cancelled"
		packages[str(package_id)] = package
	var claim_id := str(project.get("site_survey_hash", ""))
	var reverted := _world.revert_provenance_claim(claim_id) \
		if _world != null else {}
	if (record.get("parcels", {}) as Dictionary).has(claim_id):
		record["parcels"][claim_id]["status"] = "released"
	record["work_packages"] = packages
	record["hamlet_state"] = HamletState.serialize_state()
	record["dirty"] = true
	settlements[settlement_id] = record
	project_proposals_changed.emit(settlement_id)
	settlements_changed.emit()
	return {
		"ok": true,
		"project_instance_id": project_instance_id,
		"reverted": reverted,
	}


func _register_completed_building_capacity(
		settlement_id: String,
		project_instance_id: String,
		survey: Dictionary) -> void:
	var record: Dictionary = settlements[settlement_id]
	var project: Dictionary = HamletState.runtime_projects.get(
		project_instance_id, {})
	var blueprint := SettlementContentRegistry.get_blueprint(str(
		project.get("blueprint_id", "")))
	var anchor_values: Array = survey.get("anchor", [])
	if blueprint.is_empty() or anchor_values.size() < 3:
		return
	var anchor := Vector3i(
		int(anchor_values[0]), int(anchor_values[1]), int(anchor_values[2]))
	var rotation := int(survey.get("rotation", 0))
	var beds: Dictionary = record.get("bed_slots", {})
	var jobs: Dictionary = record.get("job_slots", {})
	for marker_value in blueprint.get("markers", []):
		var marker: Dictionary = marker_value
		var marker_type := str(marker.get("type", "")).to_lower()
		var local: Array = marker.get("position", [])
		if local.size() < 3:
			continue
		var rotated := _rotate_local_marker(
			Vector2i(int(local[0]), int(local[2])), rotation)
		var position := anchor + Vector3i(
			rotated.x, int(local[1]), rotated.y)
		var marker_id := str(marker.get("id", marker_type))
		if "bed" in marker_type:
			var bed_id := "%s.bed.%s" % [
				project_instance_id, marker_id]
			beds[bed_id] = {
				"record_type": "BedAssignment",
				"bed_id": bed_id,
				"residence_id": "building_instance.%s" % (
					project_instance_id.trim_prefix("project_instance.")),
				"position": [position.x, position.y, position.z],
				"reachable": true,
				"safe": true,
				"marker_valid": true,
				"permanent": true,
				"source_marker_id": marker_id,
			}
		elif "job" in marker_type or "work" in marker_type \
				or "staff" in marker_type:
			var assignment_id := "%s.job_slot.%s" % [
				project_instance_id, marker_id]
			jobs[assignment_id] = {
				"record_type": "JobAssignment",
				"job_assignment_id": assignment_id,
				"role": str(marker.get(
					"canonical_job_role", "job.generalist.settlement")),
				"position": [position.x, position.y, position.z],
				"adult_only": true,
				"reachable": true,
				"active": true,
				"marker_valid": true,
				"source_marker_id": marker_id,
			}
	var routes: Array = record.get("routes", [])
	var route: Dictionary = survey.get("route_plan", {}).duplicate(true)
	if bool(route.get("valid", false)):
		route["route_id"] = "%s.access" % project_instance_id
		routes.append(route)
	record["routes"] = routes
	record["bed_slots"] = beds
	record["job_slots"] = jobs
	record["capability"] = SettlementSimulationEngine.capability_stage(
		HamletState.runtime_buildings.values())
	record["hamlet_state"] = HamletState.serialize_state()
	record["dirty"] = true
	settlements[settlement_id] = record
	project_proposals_changed.emit(settlement_id)
	population_changed.emit(settlement_id)


func _rotate_local_marker(point: Vector2i, rotation: int) -> Vector2i:
	match posmod(roundi(float(rotation) / 90.0), 4):
		1:
			return Vector2i(-point.y, point.x)
		2:
			return Vector2i(-point.x, -point.y)
		3:
			return Vector2i(point.y, -point.x)
	return point


func _pause_package(
		settlement_id: String,
		record: Dictionary,
		packages: Dictionary,
		package_id: String,
		package: Dictionary,
		resident_id: String,
		reason: String) -> Dictionary:
	package["status"] = "paused"
	package["pause_reason"] = reason
	packages[package_id] = package
	record["work_packages"] = packages
	var resident := HamletState.get_npc_record(resident_id)
	var task: Dictionary = resident.get("current_task", {}).duplicate(true)
	task["status"] = "paused"
	task["pause_reason"] = reason
	task["progress_consumed"] = false
	HamletState.update_resident_runtime(resident_id, {"current_task": task})
	_store_focused_record(settlement_id, record)
	return {"ok": false, "reason": reason, "progress_consumed": false}


func _package_destination(
		package: Dictionary,
		survey: Dictionary) -> Array:
	var progress := int(package.get("progress", 0))
	var cells: Array = package.get("cells", [])
	if not cells.is_empty():
		return cells[mini(progress, cells.size() - 1)].duplicate()
	return survey.get("anchor", []).duplicate()


func _resident_near(
		resident: Dictionary,
		point: Vector2i,
		radius: float) -> bool:
	var position: Array = resident.get("position", [])
	if position.size() < 3:
		return false
	return Vector2(float(position[0]), float(position[2])).distance_to(
		Vector2(point)) <= radius


func _resident_near_array(
		resident: Dictionary,
		point: Array,
		radius: float) -> bool:
	if point.size() < 3:
		return false
	return _resident_near(
		resident, Vector2i(int(point[0]), int(point[2])), radius)


func _store_focused_record(
		settlement_id: String,
		record: Dictionary) -> void:
	record["hamlet_state"] = HamletState.serialize_state()
	record["dirty"] = true
	settlements[settlement_id] = record
	settlements_changed.emit()


func _initial_bed_slots(
		settlement_id: String,
		layout: Dictionary,
		is_camp: bool) -> Dictionary:
	var result := {}
	var residence_count := 2 if is_camp else 4
	for residence_index in residence_count:
		var residence_id := "%s.residence.%s.%d" % [
			settlement_id, "tent" if is_camp else "legacy", residence_index]
		for bed_index in 2:
			var bed_id := "%s.bed.%d" % [residence_id, bed_index]
			result[bed_id] = {
				"bed_id": bed_id,
				"residence_id": residence_id,
				"reachable": true,
				"safe": true,
				"marker_valid": true,
				"permanent": not is_camp,
				"position": _bed_position(layout, residence_index, bed_index),
			}
	return result


func _bed_position(
		layout: Dictionary,
		residence_index: int,
		bed_index: int) -> Array:
	var tents: Array = layout.get("tents", [])
	if residence_index < tents.size():
		var point := Vector2i(tents[residence_index])
		return [point.x + bed_index, 0, point.y]
	var hamlet := Vector2i(layout.get("hamlet", Vector2i.ZERO))
	return [hamlet.x + residence_index * 2 + bed_index, 0, hamlet.y]


func _initial_job_slots(settlement_id: String, is_camp: bool) -> Dictionary:
	var result := {}
	var count := 4 if is_camp else 8
	for index in count:
		var job_id := "%s.job_slot.%02d" % [settlement_id, index]
		result[job_id] = {
			"job_assignment_id": job_id,
			"role": (
				["leadership", "building", "food", "hauling"][index]
				if is_camp else "legacy"),
			"adult_only": true,
			"reachable": true,
			"active": true,
			"marker_valid": true,
		}
	return result


func _assign_initial_job_slots(job_slots: Dictionary) -> void:
	var resident_ids := HamletState.get_npc_ids()
	var slot_ids: Array = job_slots.keys()
	slot_ids.sort()
	for index in mini(resident_ids.size(), slot_ids.size()):
		var resident_id := resident_ids[index]
		var assignment_id := str(slot_ids[index])
		HamletState.update_resident_runtime(resident_id, {
			"job_assignment_id": assignment_id,
		})


func _initial_households(resident_value: Variant) -> Dictionary:
	var result := {}
	if not (resident_value is Dictionary):
		return result
	for resident_variant in resident_value.values():
		if not (resident_variant is Dictionary):
			continue
		var household_id := str(resident_variant.get("household_id", ""))
		if household_id.is_empty():
			continue
		if not result.has(household_id):
			result[household_id] = {
				"record_type": "Household",
				"version": 1,
				"household_id": household_id,
				"resident_ids": [],
				"partnership_ids": [],
				"gestation_due_day": 0,
				"birth_cooldown_until_day": 0,
			}
		(result[household_id]["resident_ids"] as Array).append(
			str(resident_variant.get("id", "")))
	return result


func _serializable_routes(values: Array) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for value in values:
		if not (value is Dictionary):
			continue
		var route: Dictionary = value
		var from_point := Vector2i(route.get("from", Vector2i.ZERO))
		var to_point := Vector2i(route.get("to", Vector2i.ZERO))
		var delta := Vector2(to_point - from_point)
		var steps := maxi(1, ceili(maxf(absf(delta.x), absf(delta.y))))
		var cells: Array[Array] = []
		for step in range(steps + 1):
			var point := Vector2(from_point).lerp(
				Vector2(to_point), float(step) / float(steps))
			cells.append([roundi(point.x), 0, roundi(point.y)])
		result.append({
			"record_type": "RoutePlan",
			"version": 1,
			"route_id": str(route.get("road_id", route.get("id", ""))),
			"cells": cells,
			"valid": true,
			"maximum_step": 1,
			"validation_reasons": [],
		})
	return result


func _ensure_stage_b_record(
		record_value: Dictionary,
		is_migration: bool) -> Dictionary:
	var record := record_value.duplicate(true)
	var state: Dictionary = record.get("hamlet_state", {})
	var residents: Dictionary = state.get("npc_records", {})
	record["stage"] = str(record.get(
		"stage", (record.get("capability", {}) as Dictionary).get(
			"stage", "hamlet")))
	record["routes"] = record.get("routes", []).duplicate(true)
	record["bed_slots"] = record.get("bed_slots", {}).duplicate(true)
	record["job_slots"] = record.get("job_slots", {}).duplicate(true)
	record["households"] = record.get(
		"households", _initial_households(residents)).duplicate(true)
	record["parcels"] = record.get("parcels", {}).duplicate(true)
	record["surveys"] = record.get("surveys", {}).duplicate(true)
	record["work_packages"] = record.get(
		"work_packages", {}).duplicate(true)
	record["pending_survey"] = record.get(
		"pending_survey", {}).duplicate(true)
	record["population_state"] = record.get("population_state", {
		"stable_days": 0,
		"migration_cooldown_until_day": 0,
		"last_population_day": 0,
		"migration_count": 0,
		"birth_count": 0,
	}).duplicate(true)
	if is_migration and (record["bed_slots"] as Dictionary).is_empty():
		var index := 0
		for resident_id_value in residents:
			var resident_id := str(resident_id_value)
			var residence_id := "%s.residence.legacy.%d" % [
				record["settlement_id"], floori(float(index) / 2.0)]
			var bed_id := "%s.bed.%d" % [residence_id, index % 2]
			(record["bed_slots"] as Dictionary)[bed_id] = {
				"bed_id": bed_id,
				"residence_id": residence_id,
				"reachable": true,
				"safe": true,
				"marker_valid": true,
				"legacy_derived": true,
				"permanent": true,
			}
			if residents[resident_id_value] is Dictionary:
				residents[resident_id_value]["residence_id"] = residence_id
				residents[resident_id_value]["bed_id"] = bed_id
			index += 1
		var reserve_id := "%s.residence.legacy.reserve.bed.0" % (
			record["settlement_id"])
		(record["bed_slots"] as Dictionary)[reserve_id] = {
			"bed_id": reserve_id,
			"residence_id": "%s.residence.legacy.reserve" % (
				record["settlement_id"]),
			"reachable": true,
			"safe": true,
			"marker_valid": true,
			"legacy_derived": true,
			"permanent": true,
		}
	if is_migration and (record["job_slots"] as Dictionary).is_empty():
		var index := 0
		for resident_id_value in residents:
			var assignment_id := "%s.job_slot.legacy.%02d" % [
				record["settlement_id"], index]
			(record["job_slots"] as Dictionary)[assignment_id] = {
				"job_assignment_id": assignment_id,
				"role": str((residents[resident_id_value] as Dictionary).get(
					"job_id", "legacy")),
				"adult_only": true,
				"reachable": true,
				"active": true,
				"marker_valid": true,
				"legacy_derived": true,
			}
			(residents[resident_id_value] as Dictionary)[
				"job_assignment_id"] = assignment_id
			index += 1
	state["npc_records"] = residents
	record["hamlet_state"] = state
	return record


func _add_migrant(
		settlement_id: String,
		record: Dictionary,
		report: Dictionary) -> Dictionary:
	if int(report.get("spare_beds", 0)) <= 0:
		return {"ok": false, "reason": "no_spare_bed"}
	if int(report.get("spare_jobs", 0)) <= 0:
		return {"ok": false, "reason": "no_suitable_job"}
	var resident_index := int(report.get("population", 0))
	var resident_id := "%s.npc.migrant_%03d" % [
		settlement_id, resident_index]
	var bed_id := _first_free_bed(record)
	var job_id := _first_free_job(record)
	var anchor: Array = record.get("anchor", [0, 0])
	var name_suffix := ValleyPlan.derive_seed(
		world_seed, resident_id) % 997
	var resident := {
		"id": resident_id,
		"resident_id": resident_id,
		"name": "Mira Wayfarer %03d" % name_suffix,
		"job_id": "job.generalist.migrant",
		"job": "Settlement Generalist",
		"color": "7d8b65",
		"position": [
			float(anchor[0]) + 0.5, 0.0, float(anchor[1]) + 0.5],
		"home": [int(anchor[0]), int(anchor[1])],
		"work": [int(anchor[0]), int(anchor[1])],
		"schedule_state": "work",
		"alive": true,
		"health": 30.0,
		"max_health": 30.0,
		"injured": false,
		"injury": "",
		"activity": "arriving",
		"need_profile": "need.profile.standard_resident",
		"needs": {
			"food": 0.8, "shelter": 1.0, "safety": 0.75,
			"morale": 0.72, "work_access": 1.0,
		},
		"age_days": 7800 + int(name_suffix),
		"age_band": "adult",
		"residence_id": str(
			(record.get("bed_slots", {}) as Dictionary).get(
				bed_id, {}).get("residence_id", "")),
		"bed_id": bed_id,
		"job_assignment_id": job_id,
		"household_id": "%s.household.migrant_%03d" % [
			settlement_id, resident_index],
		"displaced": false,
		"personal_inventory": [],
		"equipment": {},
		"current_task": {},
		"carried_stack": {},
		"source_storage_id": "",
		"destination": [],
		"transaction_history": [{
			"day": HamletState.day,
			"event": "migrated",
			"settlement_id": settlement_id,
		}],
	}
	if not HamletState.add_resident(resident):
		return {"ok": false, "reason": "resident_create_failed"}
	var households: Dictionary = record.get("households", {})
	households[resident["household_id"]] = {
		"record_type": "Household",
		"version": 1,
		"household_id": resident["household_id"],
		"resident_ids": [resident_id],
		"partnership_ids": [],
		"gestation_due_day": 0,
		"birth_cooldown_until_day": 0,
	}
	record["households"] = households
	settlements[settlement_id] = record
	return {"ok": true, "action": "migration", "resident_id": resident_id}


func _form_household(
		settlement_id: String,
		record: Dictionary) -> Dictionary:
	var partnered := {}
	for household_value in (
			record.get("households", {}) as Dictionary).values():
		if not (household_value is Dictionary):
			continue
		for resident_value in household_value.get("partnership_ids", []):
			partnered[str(resident_value)] = true
	var adults: Array[String] = []
	for npc_id in HamletState.get_npc_ids():
		var resident := HamletState.get_npc_record(npc_id)
		var bed: Dictionary = (record.get("bed_slots", {}) as Dictionary).get(
			str(resident.get("bed_id", "")), {})
		if str(resident.get("age_band", "adult")) == "adult" \
				and not partnered.has(npc_id) \
				and bool(bed.get("permanent", false)):
			adults.append(npc_id)
	if adults.size() < 2:
		return {"ok": false, "reason": "not_enough_adults"}
	adults.sort()
	var household_id := "%s.household.partnership.%03d" % [
		settlement_id, (record.get("households", {}) as Dictionary).size()]
	var households: Dictionary = record.get("households", {})
	# A persistent person belongs to one operational household. Remove stale
	# compatibility memberships before creating the replacement household.
	for existing_household_value in households.keys():
		var existing_household_id := str(existing_household_value)
		var existing_household: Dictionary = households[existing_household_value]
		for resident_id in [adults[0], adults[1]]:
			(existing_household.get("resident_ids", []) as Array).erase(resident_id)
			(existing_household.get("partnership_ids", []) as Array).erase(
				resident_id)
		households[existing_household_id] = existing_household
	households[household_id] = {
		"record_type": "Household",
		"version": 1,
		"household_id": household_id,
		"resident_ids": [adults[0], adults[1]],
		"partnership_ids": [adults[0], adults[1]],
		"gestation_due_day": 0,
		"birth_cooldown_until_day": 0,
	}
	for resident_id in [adults[0], adults[1]]:
		HamletState.update_resident_runtime(
			resident_id, {"household_id": household_id})
	record["households"] = households
	settlements[settlement_id] = record
	return {"ok": true, "action": "form_household", "household_id": household_id}


func _begin_or_complete_birth(
		settlement_id: String,
		record: Dictionary,
		accelerated: bool) -> Dictionary:
	var households: Dictionary = record.get("households", {})
	var ids: Array = households.keys()
	ids.sort()
	for household_value in ids:
		var household_id := str(household_value)
		var household: Dictionary = households[household_value]
		if (household.get("partnership_ids", []) as Array).size() < 2:
			continue
		if HamletState.day < int(household.get(
				"birth_cooldown_until_day", 0)):
			continue
		var due_day := int(household.get("gestation_due_day", 0))
		if due_day <= 0:
			if not _resident_needs_are_stable():
				return {"ok": false, "reason": "core_needs_unstable"}
			household["gestation_due_day"] = (
				HamletState.day + (0 if accelerated else GESTATION_DAYS))
			households[household_id] = household
			if not accelerated:
				record["households"] = households
				settlements[settlement_id] = record
				return {"ok": true, "action": "gestation_started"}
		elif not accelerated and HamletState.day < due_day:
			continue
		var report := get_population_report(settlement_id)
		if not _resident_needs_are_stable():
			return {"ok": false, "reason": "core_needs_unstable"}
		if int(report.get("valid_adult_jobs", 0)) < int(
				report.get("adults", 0)):
			return {"ok": false, "reason": "projected_job_capacity"}
		var child_index := int(report.get("population", 0))
		var child_id := "%s.npc.child_%03d" % [
			settlement_id, child_index]
		var bed_id := _first_free_bed(record, true)
		if bed_id.is_empty():
			return {"ok": false, "reason": "no_permanent_child_bed"}
		var anchor: Array = record.get("anchor", [0, 0])
		var child := {
			"id": child_id,
			"resident_id": child_id,
			"name": "Child %03d" % (
				ValleyPlan.derive_seed(world_seed, child_id) % 997),
			"job_id": "",
			"job": "Child",
			"color": "91a57c",
			"position": [
				float(anchor[0]) + 0.5, 0.0, float(anchor[1]) + 0.5],
			"home": [int(anchor[0]), int(anchor[1])],
			"work": [int(anchor[0]), int(anchor[1])],
			"schedule_state": "home",
			"alive": true,
			"health": 20.0,
			"max_health": 20.0,
			"injured": false,
			"injury": "",
			"activity": "newborn",
			"need_profile": "need.profile.child",
			"needs": {
				"food": 0.9, "shelter": 1.0, "safety": 0.9,
				"morale": 0.9, "work_access": 0.0,
			},
			"age_days": 0,
			"age_band": "newborn",
			"residence_id": str(
				(record.get("bed_slots", {}) as Dictionary).get(
					bed_id, {}).get("residence_id", "")),
			"bed_id": bed_id,
			"job_assignment_id": "",
			"household_id": household_id,
			"displaced": false,
			"personal_inventory": [],
			"equipment": {},
			"current_task": {
				"record_type": "NpcTask",
				"task_id": "%s.schedule.child" % child_id,
				"status": "scheduled",
				"schedule": ["home", "safety", "play", "education"],
			},
			"carried_stack": {},
			"source_storage_id": "",
			"destination": [],
			"transaction_history": [],
		}
		if not HamletState.add_resident(child):
			return {"ok": false, "reason": "child_create_failed"}
		(household["resident_ids"] as Array).append(child_id)
		household["gestation_due_day"] = 0
		household["birth_cooldown_until_day"] = (
			HamletState.day + HOUSEHOLD_BIRTH_COOLDOWN_DAYS)
		households[household_id] = household
		record["households"] = households
		var population_state: Dictionary = record.get("population_state", {})
		population_state["birth_count"] = int(
			population_state.get("birth_count", 0)) + 1
		record["population_state"] = population_state
		settlements[settlement_id] = record
		return {"ok": true, "action": "birth", "resident_id": child_id}
	return {"ok": false, "reason": "no_eligible_household"}


func _advance_child_age(
		settlement_id: String,
		days: int) -> Dictionary:
	var changed: Array[String] = []
	for resident_id in HamletState.get_npc_ids():
		var resident := HamletState.get_npc_record(resident_id)
		if str(resident.get("age_band", "adult")) == "adult":
			continue
		var age_days := maxi(0, int(resident.get("age_days", 0)) + days)
		var band := (
			"adult" if age_days >= ADULT_AGE_DAYS else
			"adolescent" if age_days >= 45 else
			"child" if age_days >= 14 else
			"newborn")
		var changes := {"age_days": age_days, "age_band": band}
		if band == "adult":
			changes["job"] = "Unassigned Adult"
			changes["schedule_state"] = "work"
		HamletState.update_resident_runtime(resident_id, changes)
		changed.append(resident_id)
	return {
		"ok": not changed.is_empty(),
		"action": "age",
		"settlement_id": settlement_id,
		"resident_ids": changed,
	}


func _first_free_bed(
		record: Dictionary,
		permanent_only: bool = false) -> String:
	var used := {}
	for resident_value in (
			(record.get("hamlet_state", {}) as Dictionary).get(
				"npc_records", {}) as Dictionary).values():
		if resident_value is Dictionary:
			used[str(resident_value.get("bed_id", ""))] = true
	var ids: Array = (record.get("bed_slots", {}) as Dictionary).keys()
	ids.sort()
	for id_value in ids:
		var bed_id := str(id_value)
		var bed: Dictionary = record["bed_slots"][id_value]
		if not used.has(bed_id) \
				and bool(bed.get("reachable", false)) \
				and bool(bed.get("safe", false)) \
				and (not permanent_only or bool(bed.get("permanent", false))):
			return bed_id
	return ""


func _resident_needs_are_stable() -> bool:
	for resident_id in HamletState.get_npc_ids():
		var resident := HamletState.get_npc_record(resident_id)
		if not bool(resident.get("alive", true)):
			continue
		if BiologyManager.initialized and BiologyManager.has_actor(resident_id):
			var availability := BiologyManager.assignment_availability(resident_id)
			if not bool(availability.get("available", false)):
				return false
		if SocialManager.initialized and SocialManager.has_profile(resident_id):
			var willingness := SocialManager.assignment_willingness(resident_id, {
				"task_type": "settlement_needs_stability",
			})
			if not bool(willingness.get("ok", false)) \
					or not bool(willingness.get("available", false)):
				return false
		var needs: Dictionary = resident.get("needs", {})
		if float(needs.get("food", 0.0)) < 0.55 \
				or float(needs.get("shelter", 0.0)) < 0.65 \
				or float(needs.get("safety", 0.0)) < 0.6 \
				or float(needs.get("morale", 0.0)) < 0.55:
			return false
	return true


func _has_due_birth(record: Dictionary) -> bool:
	for household_value in (
			record.get("households", {}) as Dictionary).values():
		if household_value is Dictionary:
			var due_day := int(household_value.get("gestation_due_day", 0))
			if due_day > 0 and HamletState.day >= due_day:
				return true
	return false


func _should_form_household(
		record: Dictionary,
		report: Dictionary) -> bool:
	if int(report.get("permanent_beds", 0)) < 2 \
			or not _resident_needs_are_stable():
		return false
	var partnered := {}
	for household_value in (
			record.get("households", {}) as Dictionary).values():
		if household_value is Dictionary:
			for resident_value in household_value.get("partnership_ids", []):
				partnered[str(resident_value)] = true
	var eligible := 0
	for resident_id in HamletState.get_npc_ids():
		var resident := HamletState.get_npc_record(resident_id)
		var bed: Dictionary = (record.get("bed_slots", {}) as Dictionary).get(
			str(resident.get("bed_id", "")), {})
		if str(resident.get("age_band", "adult")) == "adult" \
				and not partnered.has(resident_id) \
				and bool(bed.get("permanent", false)):
			eligible += 1
	return eligible >= 2


func _should_start_gestation(
		record: Dictionary,
		report: Dictionary) -> bool:
	if int(report.get("spare_beds", 0)) <= 0 \
			or not _resident_needs_are_stable():
		return false
	for household_value in (
			record.get("households", {}) as Dictionary).values():
		if not (household_value is Dictionary):
			continue
		if (household_value.get("partnership_ids", []) as Array).size() < 2:
			continue
		if int(household_value.get("gestation_due_day", 0)) > 0:
			continue
		if HamletState.day < int(household_value.get(
				"birth_cooldown_until_day", 0)):
			continue
		if not _first_free_bed(record, true).is_empty():
			return true
	return false


func _first_free_job(record: Dictionary) -> String:
	var used := {}
	for resident_value in (
			(record.get("hamlet_state", {}) as Dictionary).get(
				"npc_records", {}) as Dictionary).values():
		if resident_value is Dictionary:
			used[str(resident_value.get("job_assignment_id", ""))] = true
	var ids: Array = (record.get("job_slots", {}) as Dictionary).keys()
	ids.sort()
	for id_value in ids:
		var assignment_id := str(id_value)
		var job: Dictionary = record["job_slots"][id_value]
		if not used.has(assignment_id) \
				and bool(job.get("reachable", false)) \
				and bool(job.get("active", false)):
			return assignment_id
	return ""


func _next_stage(stage: String) -> String:
	var index := STAGE_ORDER.find(stage)
	if index < 0:
		return "hamlet"
	return STAGE_ORDER[mini(index + 1, STAGE_ORDER.size() - 1)]


func _route_failure_count(record: Dictionary) -> int:
	var failures := 0
	for route_value in record.get("routes", []):
		if route_value is Dictionary and not bool(route_value.get("valid", false)):
			failures += 1
	return failures


func _proposal_need_score(need_id: String, report: Dictionary) -> int:
	if need_id.is_empty():
		return 0
	if need_id in ["housing", "shelter"]:
		return int(report.get("housing_pressure", 0)) * 100
	if need_id in ["jobs", "prosperity"]:
		return maxi(0, int(report.get("adults", 0))
			- int(report.get("valid_adult_jobs", 0))) * 80
	if need_id in ["access", "transport"]:
		return int(report.get("route_failures", 0)) * 90
	return 20


func _lod_hash_value(value: Variant) -> String:
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(_lod_canonical_json(value).to_utf8_buffer())
	return context.finish().hex_encode()


func _lod_canonical_json(value: Variant) -> String:
	if value is Dictionary:
		var dictionary: Dictionary = value
		var keys: Array = dictionary.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str(a) < str(b))
		var entries: Array[String] = []
		for key in keys:
			entries.append("%s:%s" % [
				JSON.stringify(str(key)),
				_lod_canonical_json(dictionary[key]),
			])
		return "{%s}" % ",".join(entries)
	if value is Array:
		var entries: Array[String] = []
		for entry in value:
			entries.append(_lod_canonical_json(entry))
		return "[%s]" % ",".join(entries)
	if value is int or value is float:
		return String.num(float(value), 15)
	return JSON.stringify(value)
