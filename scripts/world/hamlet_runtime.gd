class_name HamletRuntime
extends Node3D
## Promotes persistent NPC records into nearby actors and demotes them back to
## record-only simulation outside the hamlet's local range.

const NpcActorScript = preload("res://scripts/world/hamlet_npc_actor.gd")
const ACTOR_RANGE := 92.0
const DEMOTE_RANGE := 108.0
const BUILD_INTERVAL := 0.32
const BUILDER_WORK_RADIUS := 7.5
# Historical probes and legacy-world integrations use this stable POC ID.
# Regional settlements resolve their namespaced builder through HamletState.
const BUILDER_ID := "npc.poc.forest_hamlet.builder_talia"

var world: VoxelWorld
var player: Player
var configured := false
var actor_range := ACTOR_RANGE
var demote_range := DEMOTE_RANGE
var _actors: Dictionary = {}
var _visual_stage := -1
var _build_accumulator := 0.0
var _settlement_scan_accumulator := 0.0


func configure(p_world: VoxelWorld, p_player: Player) -> void:
	world = p_world
	player = p_player
	configured = world != null and player != null
	if configured:
		_refresh_actor_lod()


func apply_scalability_profile(profile: Dictionary) -> void:
	actor_range = clampf(
		float(profile.get("npc_actor_range", ACTOR_RANGE)), 64.0, 160.0)
	demote_range = maxf(
		actor_range + 12.0,
		float(profile.get("npc_demote_range", DEMOTE_RANGE)))
	if configured:
		_refresh_actor_lod()


func _process(delta: float) -> void:
	if not configured or not HamletState.initialized:
		return
	SimulationLodManager.advance_runtime_minutes(
		delta * HamletState.MINUTES_PER_REAL_SECOND)
	_settlement_scan_accumulator += delta
	if _settlement_scan_accumulator >= 1.0:
		_settlement_scan_accumulator = 0.0
		_refresh_settlement_focus()
	HamletState.advance_time(delta)
	SettlementManager.advance_far_simulation(
		delta * HamletState.MINUTES_PER_REAL_SECOND)
	_refresh_actor_lod()
	_sync_completed_project_stages()
	_advance_builder_construction(delta)


func _sync_completed_project_stages() -> void:
	if _actors.is_empty():
		return
	var completed_stages := HamletState.PROJECT_STAGES.size() \
		if bool(HamletState.project.get("complete", false)) \
		else maxi(0, int(HamletState.project.get("stage_index", 1)) - 1)
	if completed_stages == _visual_stage:
		return
	if world.apply_project_blueprint_stages(
			str(HamletState.project.get(
				"definition_id", HamletState.DEFAULT_PROJECT_ID)),
			completed_stages,
			_project_world_anchor()):
		_visual_stage = completed_stages


func _advance_builder_construction(delta: float) -> void:
	var builder_id := HamletState.get_npc_id_for_job("job.builder.basic")
	if builder_id.is_empty() \
			or not HamletState.project_is_building() \
			or not _actors.has(builder_id):
		_build_accumulator = 0.0
		return
	var actor: HamletNpcActor = _actors[builder_id]
	if not is_instance_valid(actor):
		return
	var builder_record := HamletState.get_npc_record(builder_id)
	if str(builder_record.get("schedule_state", "")) != "work":
		_build_accumulator = 0.0
		return
	var work: Array = builder_record.get("work", [])
	if work.size() < 2:
		return
	var work_target := Vector2(float(work[0]) + 0.5, float(work[1]) + 0.5)
	var builder_position := Vector2(actor.global_position.x, actor.global_position.z)
	if builder_position.distance_to(work_target) > BUILDER_WORK_RADIUS:
		_build_accumulator = 0.0
		return
	var stage_index := int(HamletState.project.get("stage_index", 1))
	var project_id := str(HamletState.project.get(
		"definition_id", HamletState.DEFAULT_PROJECT_ID))
	var anchor := _project_world_anchor()
	var placements := world.get_project_stage_placements(
		project_id, stage_index, anchor)
	if placements.is_empty():
		return
	HamletState.set_project_stage_total(placements.size())
	var placement_index := int(HamletState.project.get("placed_blocks", 0))
	if placement_index >= placements.size():
		return
	_build_accumulator += delta
	if _build_accumulator < BUILD_INTERVAL:
		return
	_build_accumulator = 0.0
	actor.play_action("build", 0.55)
	var project_definition := SettlementContentRegistry.get_project(project_id)
	var stage_definition := HamletState.get_project_stage_definition(stage_index)
	if world.place_blueprint_stage_cell(
			str(project_definition.get("blueprint_id", "")),
			str(stage_definition.get("id", "")),
			anchor,
			placement_index):
		HamletState.record_project_block_placed(placements.size())


func _project_world_anchor() -> Vector3i:
	var position: Array = HamletState.project.get("position", [])
	var x := HamletState.watchtower_anchor.x
	var z := HamletState.watchtower_anchor.y
	if position.size() >= 2:
		x = int(position[0])
		z = int(position[1])
	return Vector3i(x, world.surface_height_at(x, z), z)


func _refresh_actor_lod() -> void:
	var hamlet := Vector3(
		float(HamletState.hamlet_anchor.x) + 0.5,
		player.global_position.y,
		float(HamletState.hamlet_anchor.y) + 0.5)
	var distance := player.global_position.distance_to(hamlet)
	if distance <= actor_range:
		for npc_id in HamletState.get_npc_ids():
			var record := HamletState.get_npc_record(npc_id)
			if _actors.has(npc_id) or not bool(record.get("alive", true)):
				continue
			var saved: Array = record.get("position", [])
			if saved.size() < 3:
				continue
			if float(saved[1]) <= 0.0:
				var surface_y := world.surface_height_at(
					floori(float(saved[0])), floori(float(saved[2])))
				saved[1] = float(surface_y) + 1.05
				HamletState.update_npc_position(
					npc_id,
					Vector3(float(saved[0]), float(saved[1]), float(saved[2])))
			var spawn_gp := Vector3i(
				floori(float(saved[0])),
				clampi(floori(float(saved[1])), 0, VoxelWorld.WORLD_HEIGHT - 1),
				floori(float(saved[2])))
			# Wait for normal player-centred streaming to prepare both the
			# villager's feet and ground. This avoids a visible fall through an
			# empty, not-yet-generated column.
			if not world.is_voxel_loaded_at(spawn_gp) \
					or not world.is_voxel_loaded_at(
						Vector3i(spawn_gp.x, maxi(0, spawn_gp.y - 1), spawn_gp.z)):
				continue
			if not _transition_npc_lod(npc_id, "local", "actor"):
				continue
			var actor: HamletNpcActor = NpcActorScript.new()
			actor.setup(world, npc_id)
			add_child(actor)
			_actors[npc_id] = actor
	elif distance >= demote_range:
		_clear_actors(true)


func _refresh_settlement_focus() -> void:
	if world == null or player == null \
			or not world.is_regional_worldgen():
		return
	var nearby := SettlementManager.materialize_nearby(
		world,
		Vector2(player.global_position.x, player.global_position.z),
		actor_range)
	if nearby.is_empty():
		return
	var nearest_id := str(nearby[0].get("settlement_id", ""))
	if nearest_id.is_empty() \
			or nearest_id == SettlementManager.focused_settlement_id:
		return
	focus_settlement(nearest_id)


func focus_settlement(settlement_id: String) -> bool:
	## Switches the compatibility facade and its promoted actors as one
	## transaction. Development scenes and explicit travel controls use this
	## instead of leaving actors from the previous settlement attached.
	if settlement_id.is_empty():
		return false
	if settlement_id == SettlementManager.focused_settlement_id:
		if configured:
			_refresh_actor_lod()
		return true
	if not _clear_actors(true):
		return false
	if not SettlementManager.focus_settlement(settlement_id):
		return false
	_visual_stage = -1
	_build_accumulator = 0.0
	if configured:
		_refresh_actor_lod()
	return true


func refresh_focused_settlement() -> void:
	_clear_actors(false)
	_visual_stage = -1
	_build_accumulator = 0.0
	if configured:
		_refresh_actor_lod()


func _clear_actors(save_positions: bool) -> bool:
	var all_demoted := true
	for npc_id in _actors.keys():
		var actor: HamletNpcActor = _actors[npc_id]
		if not is_instance_valid(actor):
			continue
		if save_positions and HamletState.npc_records.has(str(npc_id)):
			HamletState.update_npc_position(str(npc_id), actor.global_position)
		if not _transition_npc_lod(str(npc_id), "distant", "record"):
			all_demoted = false
			continue
		actor.queue_free()
		_actors.erase(npc_id)
	return all_demoted


func prepare_for_save() -> void:
	## Save the promoted actor positions and owner snapshots without changing
	## their representation or freeing nodes from the running scene.
	for npc_id in _actors.keys():
		var actor: HamletNpcActor = _actors[npc_id]
		if not is_instance_valid(actor):
			continue
		HamletState.update_npc_position(str(npc_id), actor.global_position)
		_refresh_npc_lod_snapshot(str(npc_id), "actor")


func _transition_npc_lod(
		npc_id: String, target_mode: String, representation: String) -> bool:
	if not SimulationLodManager.initialized:
		return true
	var snapshot := HamletState.npc_lod_snapshot(npc_id)
	if snapshot.is_empty():
		return false
	var state: Dictionary = snapshot.get("state", {})
	var current_representation := (
		"actor" if _actors.has(npc_id) else "record")
	state["representation"] = current_representation
	snapshot["state"] = state
	var owner_id := HamletState.active_village_id
	if not SimulationLodManager.has_subject(npc_id):
		var initial_mode := "distant" if target_mode == "local" else "local"
		var registered := SimulationLodManager.register_subject(
			npc_id, "resident", owner_id, owner_id, initial_mode, snapshot)
		if not bool(registered.get("ok", false)):
			return false
	else:
		var refreshed := SimulationLodManager.refresh_subject(
			npc_id, snapshot, owner_id)
		if not bool(refreshed.get("ok", false)):
			return false
	var before: Dictionary = SimulationLodManager.subject_record(
		npc_id).get("snapshot", {})
	var after := before.duplicate(true)
	var after_state: Dictionary = after.get("state", {})
	after_state["representation"] = representation
	after["state"] = after_state
	var current_mode := str(SimulationLodManager.subject_record(
		npc_id).get("lod_mode", ""))
	if current_mode == target_mode:
		var refreshed := bool(SimulationLodManager.refresh_subject(
			npc_id, after, owner_id).get("ok", false))
		return refreshed and _transition_movement_lod(npc_id, target_mode)
	var transitioned := SimulationLodManager.transition_subject(
		npc_id, target_mode, before, after, "", {"owner_id": owner_id})
	return bool(transitioned.get("ok", false)) \
		and _transition_movement_lod(npc_id, target_mode)


func _transition_movement_lod(npc_id: String, target_mode: String) -> bool:
	if not MovementManager.initialized or not MovementManager.has_mover(npc_id):
		return true
	var movement_lod := "local" if target_mode == "local" else "distant"
	var result := MovementManager.transition_lod(npc_id, movement_lod, {
		"transition_id": "simulation_lod.%s.%s" % [npc_id, target_mode],
		"transition_reason": "hamlet_actor_streaming",
	})
	return bool(result.get("ok", false))


func _refresh_npc_lod_snapshot(npc_id: String, representation: String) -> bool:
	if not SimulationLodManager.initialized:
		return true
	var snapshot := HamletState.npc_lod_snapshot(npc_id)
	if snapshot.is_empty():
		return false
	var state: Dictionary = snapshot.get("state", {})
	state["representation"] = representation
	snapshot["state"] = state
	var owner_id := HamletState.active_village_id
	if not SimulationLodManager.has_subject(npc_id):
		return bool(SimulationLodManager.register_subject(
			npc_id, "resident", owner_id, owner_id,
			"local" if representation == "actor" else "distant",
			snapshot).get("ok", false))
	return bool(SimulationLodManager.refresh_subject(
		npc_id, snapshot, owner_id).get("ok", false))


func active_actor_count() -> int:
	return _actors.size()
