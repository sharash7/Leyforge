class_name HamletNpcActor
extends CharacterBody3D
## Streamable nearby representation of one authoritative HamletState NPC.

const HumanoidVisualScript = preload("res://scripts/visual/humanoid_visual.gd")
const WALK_SPEED := 1.65
const GRAVITY := 22.0
const JUMP_VELOCITY := 7.1
const REPLAN_SECONDS := 0.8
const RECOVERY_SECONDS := 3.2
const GUARD_ATTACK_RANGE := 1.65
const GUARD_ATTACK_DAMAGE := 5.0

var npc_id := ""
var world: VoxelWorld
var humanoid: Node3D
var _record_accumulator := 0.0
var _avoid_seconds := 0.0
var _avoid_sign := 1.0
var _waypoint := Vector2.ZERO
var _waypoint_base := Vector2(INF, INF)
var _waypoint_seconds := 0.0
var _waypoint_index := 0
var _stuck_seconds := 0.0
var _blocked_seconds := 0.0
var _action_seconds := 0.0
var _guard_attack_cooldown := 0.0
var _held_stack: Dictionary = {}
var _navigation_path: Array[Vector3] = []
var _navigation_index := 0
var _last_safe_route_node := Vector3.ZERO
var _last_route_failure := ""
var _opened_door_base := Vector3i.ZERO
var _has_opened_door := false


func setup(p_world: VoxelWorld, p_npc_id: String) -> void:
	world = p_world
	npc_id = p_npc_id


func _ready() -> void:
	# NPCs collide with terrain but not one another. Actor-on-actor capsule
	# collisions were the main source of the rapid in-place vibration.
	collision_layer = 2
	collision_mask = 1
	add_to_group("hamlet_npcs")
	floor_snap_length = 0.45
	_build_visual()
	var record := HamletState.get_npc_record(npc_id)
	var saved: Array = record.get("position", [])
	if saved.size() == 3:
		global_position = Vector3(float(saved[0]), float(saved[1]), float(saved[2]))
	if global_position.y <= 0.0:
		global_position.y = float(world.surface_height_at(
			floori(global_position.x), floori(global_position.z))) + 1.05
	_last_safe_route_node = global_position
	_choose_waypoint()


func _build_visual() -> void:
	var record := HamletState.get_npc_record(npc_id)
	name = str(record.get("name", "Villager")).validate_node_name()
	var color := Color.from_string(str(record.get("color", "7a8a72")), Color(0.5, 0.5, 0.5))

	var collision := CollisionShape3D.new()
	var shape := CapsuleShape3D.new()
	shape.radius = 0.32
	shape.height = 1.7
	collision.position.y = 0.85
	collision.shape = shape
	add_child(collision)

	humanoid = HumanoidVisualScript.new()
	humanoid.name = "HumanoidVisual"
	add_child(humanoid)
	humanoid.configure(color)
	_held_stack = record.get("carried_stack", {}).duplicate(true)
	if _held_stack.is_empty():
		_held_stack = record.get("equipment", {}).duplicate(true)
	if _held_stack.is_empty():
		_held_stack = _job_held_stack(str(record.get("job_id", "")))
	humanoid.set_held_stack(_held_stack)

	var label := Label3D.new()
	label.text = "%s\n%s" % [str(record.get("name", "Villager")), str(record.get("job", ""))]
	label.position.y = 2.1
	label.font_size = 34
	label.outline_size = 7
	label.modulate = Color(1.0, 0.96, 0.82)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.no_depth_test = true
	add_child(label)


func _job_held_stack(job_id: String) -> Dictionary:
	var stable_id: String = {
		"job.builder.basic": "item.tool.hammer_basic",
		"job.farmer.basic": "item.tool.hoe_basic",
		"job.guard.militia": "item.weapon.iron_sword",
		"job.mage.apprentice": "item.weapon.apprentice_staff",
		"job.miner.basic": "item.tool.stone_pickaxe",
		"job.lumberjack.basic": "item.tool.stone_axe",
	}.get(job_id, "")
	if stable_id.is_empty():
		return {}
	return Inventory.make_stack_from_ref({
		"kind": "item",
		"stable_id": stable_id,
		"count": 1,
	})


func get_npc_id() -> String:
	return npc_id


func _choose_waypoint() -> void:
	_waypoint_base = HamletState.get_npc_target(npc_id)
	var record := HamletState.get_npc_record(npc_id)
	var is_builder := str(record.get("job_id", "")) == "job.builder.basic"
	var schedule := str(record.get("schedule_state", "work"))
	var radius := 1.4 if is_builder and schedule == "work" else 3.2
	var hash_value := absi(
		npc_id.hash() + _waypoint_index * 1103515245
		+ int(HamletState.clock_minutes / 30.0) * 265443576)
	var angle := float(hash_value % 6283) / 1000.0
	var distance_roll := int(hash_value / 17) % 1000
	var seconds_roll := int(hash_value / 31) % 500
	var distance := 0.7 + float(distance_roll) / 1000.0 * radius
	_waypoint = _waypoint_base + Vector2(cos(angle), sin(angle)) * distance
	_waypoint_seconds = 6.0 + float(seconds_roll) / 100.0
	_waypoint_index += 1
	_avoid_sign = -1.0 if hash_value % 2 == 0 else 1.0
	_rebuild_navigation()


func _rebuild_navigation() -> void:
	_navigation_path.clear()
	_navigation_index = 0
	_last_route_failure = ""
	var destination := Vector3(
		_waypoint.x,
		float(world.surface_height_at(
			floori(_waypoint.x), floori(_waypoint.y))) + 1.05,
		_waypoint.y)
	if SettlementManager != null:
		_navigation_path = SettlementManager.navigation_waypoints(
			HamletState.active_village_id, global_position, destination)
	if _navigation_path.is_empty():
		_last_route_failure = "no_safe_route"
		return
	while _navigation_index < _navigation_path.size() \
			and global_position.distance_to(
				_navigation_path[_navigation_index]) < 0.45:
		_navigation_index += 1


func _navigation_target() -> Vector3:
	if _navigation_index >= _navigation_path.size():
		return Vector3(
			_waypoint.x, global_position.y, _waypoint.y)
	return _navigation_path[_navigation_index]


func _advance_navigation_if_reached() -> void:
	while _navigation_index < _navigation_path.size():
		var target := _navigation_path[_navigation_index]
		if Vector2(global_position.x, global_position.z).distance_to(
				Vector2(target.x, target.z)) > 0.38:
			break
		_last_safe_route_node = target
		_navigation_index += 1


func _next_cell_is_safe(target: Vector3) -> bool:
	var cell := Vector2i(floori(target.x), floori(target.z))
	var ground_y := world.surface_height_at(cell.x, cell.y)
	var ground := Vector3i(cell.x, ground_y, cell.y)
	if not world.is_voxel_loaded_at(ground) \
			or not world.is_voxel_loaded_at(ground + Vector3i.UP) \
			or not world.is_voxel_loaded_at(ground + Vector3i.UP * 2):
		_last_route_failure = "terrain_unloaded"
		return false
	var ground_id := world.get_persisted_block_id(ground)
	if BlockRegistry.is_air(ground_id) or BlockRegistry.is_water(ground_id):
		_last_route_failure = "unsafe_ground"
		return false
	var current_ground := world.surface_height_at(
		floori(global_position.x), floori(global_position.z))
	if absi(ground_y - current_ground) > 1:
		_last_route_failure = "unsafe_step"
		return false
	return true


func _try_open_door_ahead(direction: Vector3) -> bool:
	if direction.length_squared() <= 0.001:
		return false
	var ahead := global_position + direction.normalized() * 0.65
	var feet_y := floori(global_position.y)
	for y in [feet_y - 1, feet_y, feet_y + 1]:
		var cell := Vector3i(floori(ahead.x), y, floori(ahead.z))
		if not world.is_door_at(cell):
			continue
		var entity: Dictionary = world.get_door_record(cell)
		if bool(entity.get("open", false)):
			return true
		if world.toggle_door(cell, npc_id):
			entity = world.get_door_record(cell)
			var base_values: Array = entity.get("base", [])
			if base_values.size() == 3:
				_opened_door_base = Vector3i(
					int(base_values[0]), int(base_values[1]),
					int(base_values[2]))
				_has_opened_door = true
			return true
		_last_route_failure = (
			world.door_last_error if not world.door_last_error.is_empty()
			else "door_blocked")
		return false
	return true


func _close_opened_door_after_passing() -> void:
	if not _has_opened_door:
		return
	if not world.is_door_at(_opened_door_base):
		_has_opened_door = false
		return
	var record := world.get_door_record(_opened_door_base)
	if not bool(record.get("open", false)):
		_has_opened_door = false
		return
	if str(record.get("last_actor_id", "")) != npc_id:
		# Another actor took ownership of the interaction after this NPC.
		_has_opened_door = false
		return
	var door_center := Vector2(
		float(_opened_door_base.x) + 0.5,
		float(_opened_door_base.z) + 0.5)
	if Vector2(global_position.x, global_position.z).distance_to(
			door_center) <= 1.75:
		return
	if world.toggle_door(_opened_door_base, npc_id):
		_has_opened_door = false


func _pause_current_task(reason: String) -> void:
	var record := HamletState.get_npc_record(npc_id)
	var task: Dictionary = record.get("current_task", {}).duplicate(true)
	if task.is_empty():
		return
	task["status"] = "paused"
	task["pause_reason"] = reason
	task["progress_consumed"] = false
	HamletState.update_resident_runtime(npc_id, {"current_task": task})


func _recover_to_last_safe_node() -> void:
	if _last_safe_route_node == Vector3.ZERO:
		return
	global_position = _last_safe_route_node
	velocity = Vector3.ZERO
	_pause_current_task(
		_last_route_failure if not _last_route_failure.is_empty()
		else "navigation_failed")
	HamletState.update_npc_activity(npc_id, "blocked")
	_rebuild_navigation()


func _physics_process(delta: float) -> void:
	if world == null:
		return
	var schedule_target := HamletState.get_npc_target(npc_id)
	_waypoint_seconds -= delta
	if schedule_target.distance_to(_waypoint_base) > 0.25 or _waypoint_seconds <= 0.0:
		_choose_waypoint()
	_advance_navigation_if_reached()
	var navigation_target := _navigation_target()
	var difference := Vector2(
		navigation_target.x - global_position.x,
		navigation_target.z - global_position.z)
	var direction := Vector3.ZERO
	var distance_to_target := difference.length()
	var record := HamletState.get_npc_record(npc_id)
	var is_guard := str(record.get("job_id", "")) == "job.guard.militia"
	var raid_target := _nearest_raid_target() if is_guard else null
	if raid_target != null:
		var raid_delta := raid_target.global_position - global_position
		difference = Vector2(raid_delta.x, raid_delta.z)
		distance_to_target = difference.length()
	if distance_to_target > 0.28:
		var desired := difference.normalized()
		if _avoid_seconds > 0.0:
			_avoid_seconds -= delta
			var side := Vector2(-desired.y, desired.x) * _avoid_sign
			desired = (desired * 0.25 + side * 0.75).normalized()
		direction = Vector3(desired.x, 0.0, desired.y)
		look_at(global_position + direction, Vector3.UP)
	if direction.length_squared() > 0.01:
		if not _next_cell_is_safe(navigation_target) \
				or not _try_open_door_ahead(direction):
			direction = Vector3.ZERO
			_blocked_seconds += delta
		else:
			var target_ground := world.surface_height_at(
				floori(navigation_target.x), floori(navigation_target.z))
			var current_ground := world.surface_height_at(
				floori(global_position.x), floori(global_position.z))
			if target_ground == current_ground + 1 and is_on_floor():
				velocity.y = JUMP_VELOCITY
	var walk_speed := minf(WALK_SPEED, maxf(0.35, distance_to_target * 1.5))
	velocity.x = direction.x * walk_speed
	velocity.z = direction.z * walk_speed
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	elif velocity.y < 0.0:
		velocity.y = -0.5
	var before_move := Vector2(global_position.x, global_position.z)
	move_and_slide()
	_close_opened_door_after_passing()
	var hit_wall := false
	for collision_index in get_slide_collision_count():
		var collision := get_slide_collision(collision_index)
		if absf(collision.get_normal().y) < 0.55:
			hit_wall = true
			break
	if hit_wall and distance_to_target > 0.8 and _avoid_seconds <= 0.0:
		_avoid_seconds = 0.75
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
	if is_on_floor():
		apply_floor_snap()
	var moved := before_move.distance_to(Vector2(global_position.x, global_position.z))
	if direction.length_squared() > 0.01 and moved < 0.004:
		_stuck_seconds += delta
		_blocked_seconds += delta
		if _stuck_seconds >= REPLAN_SECONDS:
			_stuck_seconds = 0.0
			_rebuild_navigation()
			_avoid_seconds = 0.85
	else:
		_stuck_seconds = 0.0
		if direction.length_squared() > 0.01:
			_blocked_seconds = maxf(0.0, _blocked_seconds - delta * 2.0)
	if _blocked_seconds >= RECOVERY_SECONDS:
		_blocked_seconds = 0.0
		_recover_to_last_safe_node()

	# Recover actors whose direct local waypoint movement met an unloaded seam.
	var expected_ground := float(world.surface_height_at(
		floori(global_position.x), floori(global_position.z))) + 1.0
	if global_position.y < expected_ground - 3.0:
		_last_route_failure = "unsafe_fall"
		_recover_to_last_safe_node()
	elif is_on_floor() and _next_cell_is_safe(global_position):
		_last_safe_route_node = global_position

	_guard_attack_cooldown = maxf(0.0, _guard_attack_cooldown - delta)
	_action_seconds = maxf(0.0, _action_seconds - delta)
	if raid_target != null and distance_to_target <= GUARD_ATTACK_RANGE \
			and _guard_attack_cooldown <= 0.0:
		_guard_attack_cooldown = 0.85
		play_action("attack", 0.34)
		raid_target.apply_combat_damage({
			"source": npc_id,
			"damage_type": "physical.slash",
			"amount": GUARD_ATTACK_DAMAGE,
		})
	var persistent_action := ""
	if _action_seconds <= 0.0 and direction.length_squared() <= 0.01 \
			and str(record.get("schedule_state", "")) == "work":
		persistent_action = _job_action(str(record.get("job_id", "")))
	if humanoid != null:
		humanoid.update_pose(
			delta, Vector2(velocity.x, velocity.z).length(), persistent_action)

	_record_accumulator += delta
	if _record_accumulator >= 1.0:
		_record_accumulator = 0.0
		HamletState.update_npc_position(npc_id, global_position)
		HamletState.update_npc_activity(
			npc_id, persistent_action if not persistent_action.is_empty() else (
				"walking" if direction.length_squared() > 0.01 else "idle"))


func _job_action(job_id: String) -> String:
	return {
		"job.builder.basic": "build",
		"job.farmer.basic": "work",
		"job.guard.militia": "guard",
		"job.mage.apprentice": "cast",
		"job.miner.basic": "mine",
		"job.lumberjack.basic": "chop",
	}.get(job_id, "")


func _nearest_raid_target() -> Node3D:
	if not CombatState.is_raid_active():
		return null
	var nearest: Node3D
	var nearest_distance := INF
	for node in get_tree().get_nodes_in_group("raid_enemies"):
		if not (node is Node3D) or not node.has_method("is_combat_alive") \
				or not bool(node.call("is_combat_alive")):
			continue
		var distance := global_position.distance_squared_to(node.global_position)
		if distance < nearest_distance:
			nearest_distance = distance
			nearest = node
	return nearest


func play_action(action: String, duration: float = 0.55) -> void:
	_action_seconds = maxf(duration, 0.05)
	if humanoid != null:
		humanoid.play_action(action, duration)


func has_articulated_humanoid() -> bool:
	return humanoid != null \
		and humanoid.left_arm != null and humanoid.right_arm != null \
		and humanoid.left_leg != null and humanoid.right_leg != null
