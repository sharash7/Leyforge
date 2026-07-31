class_name RaidRuntime
extends Node3D
## Promotes persistent CombatState goblins into nearby local actors and applies
## the raid planner's persistent voxel aftermath.

const GoblinActorScript = preload("res://scripts/world/goblin_actor.gd")
const MobSpawnVolumeScript = preload("res://scripts/world/mob_spawn_volume.gd")

var world: VoxelWorld
var player: Player
var configured := false
var _actors: Dictionary = {}
var _last_phase := ""
var _spawn_columns_prepared := false
var _camp_spawn_volume: Node3D


func configure(p_world: VoxelWorld, p_player: Player) -> void:
	world = p_world
	player = p_player
	configured = world != null and player != null
	if configured:
		if not SettlementManager.focused_settlement_changed.is_connected(
				_on_focused_settlement_changed):
			SettlementManager.focused_settlement_changed.connect(
				_on_focused_settlement_changed)
		_build_spawn_volumes()
		_refresh_phase()


func _build_spawn_volumes() -> void:
	if world == null:
		return
	if _camp_spawn_volume != null and is_instance_valid(_camp_spawn_volume):
		_camp_spawn_volume.queue_free()
	var camp := _combat_anchor("goblin_camp")
	var hamlet := _combat_anchor("hamlet")
	# Place the visible cube at the rear of the camp, not on its supply crate.
	var rear_direction := Vector2(camp - hamlet).normalized()
	var center_2d := Vector2(camp) + rear_direction * 2.5
	var center_x := roundi(center_2d.x)
	var center_z := roundi(center_2d.y)
	var feet_y := float(world.surface_height_at(center_x, center_z)) + 1.05
	var camp_owner_id := str(CombatState.camp_state.get(
		"id", "enemy_camp.goblin.hearthplain"))
	if world.is_regional_worldgen():
		var settlement: Dictionary = SettlementManager.get_focused_settlement()
		var linked_camps: Array = settlement.get("linked_camp_ids", [])
		if not linked_camps.is_empty():
			camp_owner_id = str(linked_camps[0])
	var ecology_seed := (
		int(world.valley_plan.sub_seeds.get("ecology", world.world_seed))
		if world.valley_plan != null else world.world_seed)
	var spawn_seed := ValleyPlan.derive_seed(
		ecology_seed, "camp_spawner:%s" % camp_owner_id)
	_camp_spawn_volume = MobSpawnVolumeScript.new()
	add_child(_camp_spawn_volume)
	_camp_spawn_volume.call("configure", {
		"id": "spawn_volume.%s.goblin_camp" % (
			SettlementManager.focused_settlement_id
			if not SettlementManager.focused_settlement_id.is_empty()
			else "hearthplain"),
		"owner_id": camp_owner_id,
		"spawn_seed": spawn_seed,
		"mob_family": "goblin",
		"spawn_mode": "authored_structure",
		"active": not bool(CombatState.camp_state.get("cleared", false)) \
			and bool(CombatState.camp_state.get("spawner_active", true)),
		"center": [
			float(center_x) + 0.5, feet_y, float(center_z) + 0.5],
		"size": [11.0, 5.0, 11.0],
		"max_local_mobs": 3,
		"max_nearby_mobs": 6,
		"min_spawn_seconds": 6.0,
		"max_spawn_seconds": 12.0,
	})
	_camp_spawn_volume.call("configure_runtime", world, player)
	_camp_spawn_volume.connect(
		"spawner_broken", _on_camp_spawner_broken)
	var definition: Dictionary = _camp_spawn_volume.call(
		"serialize_definition", 4)
	CombatState.register_camp_spawn_volume(definition)
	CombatState.migrate_active_raid_spawn_volume(definition)


func _process(delta: float) -> void:
	if not configured or not CombatState.initialized:
		return
	_refresh_spawn_volume_readiness()
	CombatState.advance(delta)
	_refresh_phase()
	if CombatState.is_assault_active():
		_refresh_actors()
	else:
		_clear_inactive_actors()
	if CombatState.phase == "resolved":
		CombatState.materialize_damage(world)


func _on_focused_settlement_changed(_settlement_id: String) -> void:
	_clear_inactive_actors()
	_last_phase = ""
	_spawn_columns_prepared = false
	_build_spawn_volumes()
	_refresh_phase()


func _combat_anchor(anchor_id: String) -> Vector2i:
	var source: Variant = CombatState.anchors.get(anchor_id, [0, 0])
	if source is Array and source.size() >= 2:
		return Vector2i(int(source[0]), int(source[1]))
	return world.valley_plan.get_anchor(anchor_id) \
		if world != null and world.valley_plan != null else Vector2i.ZERO


func _refresh_phase() -> void:
	if _last_phase == CombatState.phase:
		return
	_last_phase = CombatState.phase
	if _last_phase == "warning":
		_spawn_columns_prepared = false
		_prepare_spawn_columns()
	elif _last_phase == "assault":
		_prepare_spawn_columns()
		_refresh_actors()
	elif _last_phase in ["dormant", "resolved"]:
		_clear_inactive_actors()
		_spawn_columns_prepared = false


func _refresh_actors() -> void:
	if not _spawn_columns_prepared:
		_prepare_spawn_columns()
	for enemy_id in CombatState.get_enemy_ids():
		var record := CombatState.get_enemy_record(enemy_id)
		if not bool(record.get("alive", false)) or bool(record.get("retreated", false)):
			continue
		if not _spawn_record_ready(record):
			continue
		if _actors.has(enemy_id):
			var existing: Variant = _actors.get(enemy_id)
			if is_instance_valid(existing) and not existing.is_queued_for_deletion():
				continue
			_actors.erase(enemy_id)
		var actor: Node3D = GoblinActorScript.new()
		actor.setup(world, player, enemy_id)
		add_child(actor)
		_actors[enemy_id] = actor


func _prepare_spawn_columns() -> void:
	if world == null or _spawn_columns_prepared:
		return
	var all_ready := true
	for enemy_id in CombatState.get_enemy_ids():
		var record := CombatState.get_enemy_record(enemy_id)
		var saved: Array = record.get("position", [])
		if saved.size() < 3:
			all_ready = false
			continue
		var spawn_x := floori(float(saved[0]))
		var spawn_z := floori(float(saved[2]))
		var spawn_y_cell := world.surface_height_at(spawn_x, spawn_z) + 1
		var feet := Vector3i(spawn_x, spawn_y_cell, spawn_z)
		if not world.is_spawn_surface_ready_at(feet):
			all_ready = false
			continue
		var spawn_y := float(spawn_y_cell) + 0.05
		var spawn_position := Vector3(
			float(saved[0]), spawn_y, float(saved[2]))
		CombatState.update_enemy_position(str(enemy_id), spawn_position)
		if not _spawn_record_ready(
				CombatState.get_enemy_record(str(enemy_id))):
			all_ready = false
	_spawn_columns_prepared = all_ready


func _spawn_record_ready(record: Dictionary) -> bool:
	if world == null:
		return false
	var saved: Array = record.get("position", [])
	if saved.size() < 3 or float(saved[1]) <= 0.0:
		return false
	var feet := Vector3i(
		floori(float(saved[0])), floori(float(saved[1])),
		floori(float(saved[2])))
	return world.is_spawn_surface_ready_at(feet)


func _refresh_spawn_volume_readiness() -> void:
	if world == null or _camp_spawn_volume == null \
			or not is_instance_valid(_camp_spawn_volume):
		return
	var definition := get_camp_spawn_volume_definition()
	var center: Array = definition.get("center", [])
	if center.size() < 3:
		_camp_spawn_volume.call("set_stream_ready", false)
		return
	var x := floori(float(center[0]))
	var z := floori(float(center[2]))
	var feet_y := world.surface_height_at(x, z) + 1
	var ready := world.is_spawn_surface_ready_at(Vector3i(x, feet_y, z))
	_camp_spawn_volume.call("set_stream_ready", ready)


func _on_camp_spawner_broken(_volume_id: String) -> void:
	CombatState.disable_camp_spawner()


func _clear_inactive_actors() -> void:
	for enemy_id in _actors.keys():
		# Read into an untyped Variant first. A queued goblin can be freed by the
		# scene tree between frames; assigning that stale Object directly to a
		# typed Node3D is itself a runtime error in Godot.
		var actor_value: Variant = _actors.get(enemy_id)
		if not is_instance_valid(actor_value):
			_actors.erase(enemy_id)
			continue
		var record := CombatState.get_enemy_record(str(enemy_id))
		if CombatState.phase != "assault" \
				or not bool(record.get("alive", false)):
			# Remove the authoritative reference before queuing deletion so a
			# second phase refresh in the same frame cannot see the stale actor.
			_actors.erase(enemy_id)
			if not actor_value.is_queued_for_deletion():
				actor_value.queue_free()


func preparation_snapshot() -> Dictionary:
	if world == null:
		return {}
	var tower_stages := HamletState.PROJECT_STAGES.size() \
		if bool(HamletState.project.get("complete", false)) \
		else maxi(0, int(HamletState.project.get("stage_index", 1)) - 1)
	var hamlet := _combat_anchor("hamlet")
	var ward := world.ward_coverage_at(Vector3(
		float(hamlet.x) + 0.5,
		float(world.surface_height_at(hamlet.x, hamlet.y)) + 1.0,
		float(hamlet.y) + 0.5))
	var food_refs := [
		{"kind": "item", "stable_id": "item.food.wild_berries", "count": 1},
		{"kind": "item", "stable_id": "item.food.bread", "count": 1},
		{"kind": "item", "stable_id": "item.food.cooked_meat", "count": 1},
	]
	var food_count := 0
	for content_ref in food_refs:
		food_count += HamletState.warehouse_count_ref(content_ref)
	var guard := HamletState.get_npc_record(
		HamletState.get_npc_id_for_job("job.guard.militia"))
	var camp := _combat_anchor("goblin_camp")
	var camp_distance := Vector2(camp).distance_to(Vector2(hamlet))
	return {
		"tower_stages": tower_stages,
		"ward_active": bool(ward.get("warded", false)),
		"guard_ready": bool(guard.get("alive", true)) \
			and not bool(guard.get("injured", false)),
		"food_stocked": food_count >= 8,
		"lighting_ready": tower_stages >= 4,
		"raid_source_anchor": [camp.x, camp.y],
		"raid_source_distance": camp_distance,
		"raid_spawn_volume": get_camp_spawn_volume_definition(),
	}


func begin_raid() -> Dictionary:
	return CombatState.begin_raid(preparation_snapshot())


func get_camp_spawn_volume_definition() -> Dictionary:
	if _camp_spawn_volume == null or not is_instance_valid(_camp_spawn_volume):
		return {}
	return _camp_spawn_volume.call("serialize_definition", 4)


func repair_next_damage() -> Dictionary:
	return CombatState.repair_next_damage(world)


func active_actor_count() -> int:
	return _actors.size()
