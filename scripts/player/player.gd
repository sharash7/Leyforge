class_name Player
extends CharacterBody3D
## First-person controller: WASD + mouse look + jump, plus voxel
## break/place interaction driven by the Inventory autoload.
## Current POC additions: targeted-block highlight box and basic swimming.

const SPEED := 6.0
const SPRINT_MULT := 1.6
const JUMP_VELOCITY := 8.5
const GRAVITY := 22.0
const SWIM_SPEED := 3.5
const SWIM_UP_SPEED := 4.5
const MOUSE_SENS := 0.0022
const REACH := 6.0
const EMBEDDED_RESCUE_DELAY := 0.2
const MAX_STEP_HEIGHT := 0.55

signal interaction_message(message: String)
signal interaction_requested(kind: String, position: Vector3i, subject_id: String)

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var ray: RayCast3D = $Head/Camera3D/RayCast3D
@onready var highlight: MeshInstance3D = get_node_or_null("../HighlightBox")

var world: VoxelWorld
var controls_locked := false  # true while the crafting UI is open

var _yaw := 0.0
var _pitch := 0.0
var _embedded_seconds := 0.0
var _mining_target := Vector3i(0, -100000, 0)
var _mining_progress := 0.0
var _mining_blocked_message := ""
var _last_mined_drop: Dictionary = {}


func _ready() -> void:
	ray.target_position = Vector3(0, 0, -REACH)
	# Terrain is layer 1 and streamed NPC actors are layer 2. Keep both
	# targetable while NPC bodies ignore one another for stable movement.
	ray.collision_mask = 3
	ray.enabled = true
	floor_snap_length = MAX_STEP_HEIGHT + 0.08
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Keep pointer state in sync with the OS window: releasing focus frees the
# cursor for the editor, clicking back into the game re-captures it. Without
# this, a click outside the window desyncs the mouse and the game looks dead.
func _notification(what: int) -> void:
	match what:
		NOTIFICATION_WM_WINDOW_FOCUS_IN:
			if not controls_locked:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		NOTIFICATION_WM_WINDOW_FOCUS_OUT:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		return
	if controls_locked:
		return
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		_yaw -= event.relative.x * MOUSE_SENS
		_pitch = clampf(_pitch - event.relative.y * MOUSE_SENS, -1.45, 1.45)
		rotation.y = _yaw
		head.rotation.x = _pitch
		return

	if event is InputEventMouseButton and event.pressed:
		# First click after Esc re-captures the mouse instead of acting.
		if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			return

	if event.is_action_pressed("break_block"):
		# Continuous harvesting is advanced in _physics_process while held.
		_mining_target = get_target_block_position()
		_mining_progress = 0.0
	elif event.is_action_pressed("place_block"):
		if not _try_interact():
			_try_place()
	elif event.is_action_pressed("cast_utility"):
		_cast_stone_sense()
	elif event.is_action_pressed("cast_combat"):
		_cast_spark_bolt()


func _cast_stone_sense() -> void:
	if world == null:
		return
	var result := MagicState.begin_cast("spell.stone_sense")
	if not bool(result.get("ok", false)):
		interaction_message.emit(str(result.get("message", "Stone Sense failed.")))
		return
	var targets := world.find_stone_sense_targets(global_position)
	interaction_message.emit(
		"Stone Sense reveals %d nearby ore%s." % [
			targets.size(), "" if targets.size() == 1 else "s"])


func _cast_spark_bolt() -> void:
	if world == null:
		return
	ray.force_raycast_update()
	var target: Object = ray.get_collider() if ray.is_colliding() else null
	var result := MagicState.cast_spark_bolt(target)
	if not bool(result.get("ok", false)):
		interaction_message.emit(str(result.get("message", "Spark Bolt failed.")))
		return
	var impact := ray.get_collision_point() \
		if ray.is_colliding() else camera.global_position \
			+ -camera.global_basis.z * REACH
	var hit := bool(result.get("hit", false))
	world.show_spell_impact(impact, hit)
	interaction_message.emit(
		"Spark Bolt hit for %d shock damage." % int(
			result.get("damage_packet", {}).get("amount", 0.0))
		if hit else "Spark Bolt discharged harmlessly.")


func _physics_process(delta: float) -> void:
	_update_mining(delta)
	var swimming := _is_in_water()

	if swimming:
		# Buoyant drift instead of full gravity; jump paddles upward.
		velocity.y = move_toward(velocity.y, -1.5, 12.0 * delta)
	elif not is_on_floor():
		velocity.y -= GRAVITY * delta

	var move := Vector3.ZERO
	if not controls_locked:
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		move = transform.basis * Vector3(input_dir.x, 0, input_dir.y)
		if Input.is_action_pressed("jump"):
			if swimming:
				velocity.y = SWIM_UP_SPEED
			elif is_on_floor() and Input.is_action_just_pressed("jump"):
				velocity.y = JUMP_VELOCITY

	var speed := SPEED
	if swimming:
		speed = SWIM_SPEED
	elif Input.is_action_pressed("sprint"):
		speed *= SPRINT_MULT
	velocity.x = move.x * speed
	velocity.z = move.z * speed
	var was_on_floor := is_on_floor()
	var horizontal_velocity := Vector3(velocity.x, 0.0, velocity.z)
	var position_before_move := global_position
	move_and_slide()
	_try_step_up(was_on_floor, horizontal_velocity, position_before_move, delta)

	_update_highlight()
	_update_safe_recovery(delta)


func _try_step_up(was_on_floor: bool, horizontal_velocity: Vector3,
		position_before_move: Vector3, delta: float) -> void:
	if not was_on_floor or horizontal_velocity.length_squared() < 0.01:
		return
	var expected_distance := horizontal_velocity.length() * delta
	var moved := Vector2(
		global_position.x - position_before_move.x,
		global_position.z - position_before_move.z).length()
	if moved >= expected_distance * 0.75:
		return
	var blocked_position := global_position
	if test_move(global_transform, Vector3.UP * MAX_STEP_HEIGHT):
		return
	global_position += Vector3.UP * MAX_STEP_HEIGHT
	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z
	velocity.y = 0.0
	move_and_slide()
	apply_floor_snap()
	var stepped := Vector2(
		global_position.x - blocked_position.x,
		global_position.z - blocked_position.z).length()
	if stepped < expected_distance * 0.25:
		global_position = blocked_position


func _update_mining(delta: float) -> void:
	if controls_locked or not Input.is_action_pressed("break_block") \
			or world == null or not ray.is_colliding():
		_reset_mining()
		return
	var target := get_target_block_position()
	if target != _mining_target:
		_mining_target = target
		_mining_progress = 0.0
	var id := world.get_block_global(target)
	if BlockRegistry.is_air(id) or BlockRegistry.is_water(id):
		_reset_mining()
		return
	var profile := BlockRegistry.get_harvest_profile(id)
	var tool_profile := _selected_tool_profile()
	var required_level := int(profile.get("level", 0))
	if required_level > 0 and (
			str(tool_profile.get("class", "")) != str(profile.get("tool", ""))
			or int(tool_profile.get("level", -1)) < required_level):
		var message := "Requires a %s level %d tool" % [
			str(profile.get("tool", "matching")).capitalize(), required_level]
		if message != _mining_blocked_message:
			_mining_blocked_message = message
			interaction_message.emit(message)
		_mining_progress = 0.0
		return
	_mining_blocked_message = ""
	var speed := 0.75
	if not tool_profile.is_empty() \
			and str(tool_profile.get("class", "")) == str(profile.get("tool", "")):
		speed = float(tool_profile.get("speed", speed))
	_mining_progress += speed * delta
	if _mining_progress >= float(profile.get("hardness", 1.0)):
		if not _break_block_at(target):
			interaction_message.emit("This block cannot be removed while it stores items")
			_reset_mining()
			return
		interaction_message.emit("Dropped %s for pickup" % Inventory.stack_name(
			_last_mined_drop))
		_mining_progress = 0.0
		_mining_target = get_target_block_position()


func _reset_mining() -> void:
	_mining_target = Vector3i(0, -100000, 0)
	_mining_progress = 0.0
	_mining_blocked_message = ""


func _update_safe_recovery(delta: float) -> void:
	if world == null:
		return
	var below_world := global_position.y < -8.0
	var embedded := not world.is_player_space_clear(global_position)
	if not below_world and not embedded:
		_embedded_seconds = 0.0
		return
	_embedded_seconds += delta
	if not below_world and _embedded_seconds < EMBEDDED_RESCUE_DELAY:
		return
	var recovery := world.find_nearest_safe_player_position(global_position)
	world.prepare_player_column(recovery)
	global_position = world.resolve_safe_player_position(recovery)
	velocity = Vector3.ZERO
	_embedded_seconds = 0.0


func _is_in_water() -> bool:
	if world == null:
		return false
	# Feet-level check is enough for buoyancy-style swimming.
	var gp := Vector3i((global_position + Vector3(0, 0.4, 0)).floor())
	return BlockRegistry.is_water(world.get_block_global(gp))


func _update_highlight() -> void:
	if highlight == null:
		return
	if world != null and ray.is_colliding():
		var point := ray.get_collision_point()
		var normal := ray.get_collision_normal()
		var gp := Vector3i((point - normal * 0.5).floor())
		if not BlockRegistry.is_air(world.get_block_global(gp)):
			highlight.global_position = Vector3(gp) + Vector3(0.5, 0.5, 0.5)
			highlight.visible = true
			return
	highlight.visible = false


func _try_break() -> void:
	if world == null or not ray.is_colliding():
		return
	var point := ray.get_collision_point()
	var normal := ray.get_collision_normal()
	var gp := Vector3i((point - normal * 0.5).floor())
	_break_block_at(gp)


func get_target_block_position() -> Vector3i:
	if world == null or not ray.is_colliding():
		return Vector3i(0, -100000, 0)
	var point := ray.get_collision_point()
	var normal := ray.get_collision_normal()
	return Vector3i((point - normal * 0.5).floor())


func _break_block_at(gp: Vector3i) -> bool:
	## Transactional core kept separate from ray targeting for deterministic tests.
	_last_mined_drop = {}
	var id: int = world.get_block_global(gp)
	if BlockRegistry.is_air(id):
		return false
	var profile := BlockRegistry.get_harvest_profile(id)
	var tool_profile := _selected_tool_profile()
	var required_level := int(profile.get("level", 0))
	if required_level > 0 and (
			str(tool_profile.get("class", "")) != str(profile.get("tool", ""))
			or int(tool_profile.get("level", -1)) < required_level):
		return false
	var custom_drop := world.get_custom_drop(gp)
	var drop := Inventory.make_stack_from_ref(custom_drop) \
		if not custom_drop.is_empty() else _drop_stack(profile)
	if drop.is_empty():
		return false
	if not world.can_remove_block_entity(gp):
		return false
	if not world.set_block_global(gp, BlockRegistry.AIR):
		return false
	var hash_value := absi(gp.x * 73856093 ^ gp.y * 19349663 ^ gp.z * 83492791)
	var angle := float(hash_value % 6283) / 1000.0
	var impulse := Vector3(cos(angle) * 1.1, 2.2, sin(angle) * 1.1)
	var drop_position := Vector3(gp) + Vector3(0.5, 0.55, 0.5)
	if not world.spawn_item_drop(drop, drop_position, impulse):
		world.set_block_global(gp, id)
		push_error("Player: mining drop spawn failed; block transaction rolled back")
		return false
	if not tool_profile.is_empty() \
			and str(tool_profile.get("class", "")) == str(profile.get("tool", "")):
		Inventory.damage_selected_tool()
	ProgressionState.record_harvest(Inventory.stack_stable_id(drop), int(drop["count"]))
	_last_mined_drop = drop.duplicate(true)
	return true


func notify_item_pickup(stack: Dictionary) -> void:
	if stack.is_empty():
		return
	interaction_message.emit("Picked up %d x %s" % [
		int(stack.get("count", 0)), Inventory.stack_name(stack)])


func _try_interact() -> bool:
	if world == null or not ray.is_colliding():
		return false
	var collider := ray.get_collider()
	if collider != null and collider.has_method("get_npc_id"):
		interaction_requested.emit("npc", Vector3i.ZERO, str(collider.get_npc_id()))
		return true
	var target := get_target_block_position()
	var station := world.station_type_at(target)
	if station.is_empty():
		return false
	interaction_requested.emit(station, target, "")
	return true


func _drop_stack(profile: Dictionary) -> Dictionary:
	var content_ref := {
		"kind": str(profile.get("drop_kind", "block")),
		"stable_id": str(profile.get("drop_id", "")),
		"count": int(profile.get("drop_count", 1)),
	}
	return Inventory.make_stack_from_ref(content_ref)


func _selected_tool_profile() -> Dictionary:
	var stack := Inventory.get_selected_stack()
	if stack.is_empty() or Inventory.stack_kind(stack) != "item":
		return {}
	return ItemRegistry.get_tool_profile(int(stack.get("id", -1)))


func _try_place() -> void:
	if world == null or not ray.is_colliding():
		return
	var stack: Dictionary = Inventory.get_selected_stack()
	if stack.is_empty():
		return
	var block_id := int(stack["id"]) if Inventory.stack_kind(stack) == "block" \
		else ItemRegistry.get_place_block_id(int(stack["id"]))
	if block_id <= BlockRegistry.AIR:
		return
	var point := ray.get_collision_point()
	var normal := ray.get_collision_normal()
	var target_gp := Vector3i((point - normal * 0.5).floor())
	if block_id == world.id_oak_slab and normal.y > 0.5 \
			and world.get_block_global(target_gp) == world.id_oak_slab:
		if not world.make_double_slab(target_gp):
			return
		var slab_taken := Inventory.take_selected_stack(1)
		if slab_taken.is_empty():
			world.set_block_global(target_gp, world.id_oak_slab)
			push_error("Player: double slab transaction rolled back")
		return
		return
	var gp := Vector3i((point + normal * 0.5).floor())
	if not BlockRegistry.is_air(world.get_block_global(gp)):
		return
	if _overlaps_player(gp):
		return
	# Commit the world edit first, then consume; roll back on an unexpected
	# inventory failure so placement cannot lose or duplicate resources.
	if not world.set_block_global(gp, block_id):
		return
	var taken := Inventory.take_selected_stack(1)
	if taken.is_empty():
		world.set_block_global(gp, BlockRegistry.AIR)
		push_error("Player: placement transaction rolled back")


func restore_view(yaw: float, pitch: float = 0.0) -> void:
	_yaw = yaw
	_pitch = clampf(pitch, -1.45, 1.45)
	rotation.y = _yaw
	head.rotation.x = _pitch


func _overlaps_player(gp: Vector3i) -> bool:
	# Player origin is at the feet; body extends ~1.8m up.
	var block_aabb := AABB(Vector3(gp), Vector3.ONE)
	var player_aabb := AABB(global_position + Vector3(-0.36, 0.05, -0.36), Vector3(0.72, 1.8, 0.72))
	return block_aabb.intersects(player_aabb)
