class_name RaidRuntime
extends Node3D
## Promotes persistent CombatState goblins into nearby local actors and applies
## the raid planner's persistent voxel aftermath.

const GoblinActorScript = preload("res://scripts/world/goblin_actor.gd")

var world: VoxelWorld
var player: Player
var configured := false
var _actors: Dictionary = {}
var _last_phase := ""


func configure(p_world: VoxelWorld, p_player: Player) -> void:
	world = p_world
	player = p_player
	configured = world != null and player != null
	if configured:
		_refresh_phase()


func _process(delta: float) -> void:
	if not configured or not CombatState.initialized:
		return
	CombatState.advance(delta)
	_refresh_phase()
	if CombatState.is_assault_active():
		_refresh_actors()
	else:
		_clear_inactive_actors()
	if CombatState.phase == "resolved":
		CombatState.materialize_damage(world)


func _refresh_phase() -> void:
	if _last_phase == CombatState.phase:
		return
	_last_phase = CombatState.phase
	if _last_phase == "assault":
		_refresh_actors()
	elif _last_phase in ["dormant", "resolved"]:
		_clear_inactive_actors()


func _refresh_actors() -> void:
	for enemy_id in CombatState.get_enemy_ids():
		var record := CombatState.get_enemy_record(enemy_id)
		if not bool(record.get("alive", false)) or bool(record.get("retreated", false)):
			continue
		if _actors.has(enemy_id) and is_instance_valid(_actors[enemy_id]):
			continue
		var actor: Node3D = GoblinActorScript.new()
		actor.setup(world, player, enemy_id)
		add_child(actor)
		_actors[enemy_id] = actor


func _clear_inactive_actors() -> void:
	for enemy_id in _actors.keys():
		var actor: Node3D = _actors[enemy_id]
		if not is_instance_valid(actor):
			_actors.erase(enemy_id)
			continue
		var record := CombatState.get_enemy_record(str(enemy_id))
		if CombatState.phase != "assault" \
				or not bool(record.get("alive", false)):
			actor.queue_free()
			_actors.erase(enemy_id)


func preparation_snapshot() -> Dictionary:
	if world == null:
		return {}
	var tower_stages := HamletState.PROJECT_STAGES.size() \
		if bool(HamletState.project.get("complete", false)) \
		else maxi(0, int(HamletState.project.get("stage_index", 1)) - 1)
	var hamlet: Vector2i = world.valley_plan.get_anchor("hamlet")
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
		"npc.poc.forest_hamlet.guard_elric")
	return {
		"tower_stages": tower_stages,
		"ward_active": bool(ward.get("warded", false)),
		"guard_ready": bool(guard.get("alive", true)) \
			and not bool(guard.get("injured", false)),
		"food_stocked": food_count >= 8,
		"lighting_ready": tower_stages >= 4,
	}


func begin_raid() -> Dictionary:
	return CombatState.begin_raid(preparation_snapshot())


func repair_next_damage() -> Dictionary:
	return CombatState.repair_next_damage(world)


func active_actor_count() -> int:
	return _actors.size()
