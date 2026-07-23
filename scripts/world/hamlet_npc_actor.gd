class_name HamletNpcActor
extends CharacterBody3D
## Streamable nearby representation of one authoritative HamletState NPC.

const WALK_SPEED := 1.65
const GRAVITY := 22.0

var npc_id := ""
var world: VoxelWorld
var _record_accumulator := 0.0
var _avoid_seconds := 0.0
var _avoid_sign := 1.0
var _waypoint := Vector2.ZERO
var _waypoint_base := Vector2(INF, INF)
var _waypoint_seconds := 0.0
var _waypoint_index := 0
var _stuck_seconds := 0.0


func setup(p_world: VoxelWorld, p_npc_id: String) -> void:
	world = p_world
	npc_id = p_npc_id


func _ready() -> void:
	# NPCs collide with terrain but not one another. Actor-on-actor capsule
	# collisions were the main source of the rapid in-place vibration.
	collision_layer = 2
	collision_mask = 1
	floor_snap_length = 0.45
	_build_visual()
	var record := HamletState.get_npc_record(npc_id)
	var saved: Array = record.get("position", [])
	if saved.size() == 3:
		global_position = Vector3(float(saved[0]), float(saved[1]), float(saved[2]))
	if global_position.y <= 0.0:
		global_position.y = float(world.surface_height_at(
			floori(global_position.x), floori(global_position.z))) + 1.05
	_choose_waypoint()


func _build_visual() -> void:
	var record := HamletState.get_npc_record(npc_id)
	name = str(record.get("name", "Villager")).validate_node_name()
	var color := Color.from_string(str(record.get("color", "7a8a72")), Color(0.5, 0.5, 0.5))
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.roughness = 0.92

	var collision := CollisionShape3D.new()
	var shape := CapsuleShape3D.new()
	shape.radius = 0.32
	shape.height = 1.7
	collision.position.y = 0.85
	collision.shape = shape
	add_child(collision)

	var body := MeshInstance3D.new()
	var body_mesh := BoxMesh.new()
	body_mesh.size = Vector3(0.62, 1.05, 0.42)
	body_mesh.material = material
	body.mesh = body_mesh
	body.position.y = 0.82
	add_child(body)

	var head := MeshInstance3D.new()
	var head_mesh := BoxMesh.new()
	head_mesh.size = Vector3(0.48, 0.48, 0.48)
	head_mesh.material = material
	head.mesh = head_mesh
	head.position.y = 1.58
	add_child(head)

	var label := Label3D.new()
	label.text = "%s\n%s" % [str(record.get("name", "Villager")), str(record.get("job", ""))]
	label.position.y = 2.1
	label.font_size = 34
	label.outline_size = 7
	label.modulate = Color(1.0, 0.96, 0.82)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.no_depth_test = true
	add_child(label)


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


func _physics_process(delta: float) -> void:
	if world == null:
		return
	var schedule_target := HamletState.get_npc_target(npc_id)
	_waypoint_seconds -= delta
	if schedule_target.distance_to(_waypoint_base) > 0.25 or _waypoint_seconds <= 0.0:
		_choose_waypoint()
	var difference := Vector2(
		_waypoint.x - global_position.x, _waypoint.y - global_position.z)
	var direction := Vector3.ZERO
	var distance_to_target := difference.length()
	if distance_to_target > 0.28:
		var desired := difference.normalized()
		if _avoid_seconds > 0.0:
			_avoid_seconds -= delta
			var side := Vector2(-desired.y, desired.x) * _avoid_sign
			desired = (desired * 0.25 + side * 0.75).normalized()
		direction = Vector3(desired.x, 0.0, desired.y)
		look_at(global_position + direction, Vector3.UP, true)
	var walk_speed := minf(WALK_SPEED, maxf(0.35, distance_to_target * 1.5))
	velocity.x = direction.x * walk_speed
	velocity.z = direction.z * walk_speed
	velocity.y -= GRAVITY * delta
	var before_move := Vector2(global_position.x, global_position.z)
	move_and_slide()
	var hit_wall := false
	for collision_index in get_slide_collision_count():
		var collision := get_slide_collision(collision_index)
		if absf(collision.get_normal().y) < 0.55:
			hit_wall = true
			break
	if hit_wall and distance_to_target > 0.8 and _avoid_seconds <= 0.0:
		_avoid_seconds = 0.75
	if is_on_floor():
		apply_floor_snap()
	var moved := before_move.distance_to(Vector2(global_position.x, global_position.z))
	if direction.length_squared() > 0.01 and moved < 0.004:
		_stuck_seconds += delta
		if _stuck_seconds >= 0.8:
			_stuck_seconds = 0.0
			_choose_waypoint()
			_avoid_seconds = 0.85
	else:
		_stuck_seconds = 0.0

	# Recover actors whose direct local waypoint movement met an unloaded seam.
	var expected_ground := float(world.surface_height_at(
		floori(global_position.x), floori(global_position.z))) + 1.0
	if global_position.y < expected_ground - 3.0:
		global_position.y = expected_ground + 0.05
		velocity = Vector3.ZERO

	_record_accumulator += delta
	if _record_accumulator >= 1.0:
		_record_accumulator = 0.0
		HamletState.update_npc_position(npc_id, global_position)
