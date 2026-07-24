class_name AmbientGoblinActor
extends CharacterBody3D
## Lightweight local goblin created by a loaded, active MobSpawnVolume.

const HumanoidVisualScript = preload("res://scripts/visual/humanoid_visual.gd")
const WALK_SPEED := 1.55
const GRAVITY := 22.0
const ATTACK_RANGE := 1.5

var world: VoxelWorld
var player: Player
var actor_id := ""
var home := Vector3.ZERO
var roam_radius := 4.0
var health := 18.0
var humanoid: Node3D
var _target := Vector3.ZERO
var _retarget_seconds := 0.0
var _attack_seconds := 0.0
var _rng := RandomNumberGenerator.new()


func setup_ambient(
		p_world: VoxelWorld, p_player: Player, p_actor_id: String,
		spawn_position: Vector3, home_position: Vector3,
		p_roam_radius: float) -> void:
	world = p_world
	player = p_player
	actor_id = p_actor_id
	home = home_position
	roam_radius = maxf(2.0, p_roam_radius)
	global_position = spawn_position
	_rng.seed = absi(actor_id.hash())
	_choose_target()


func _ready() -> void:
	add_to_group("ambient_mobs")
	add_to_group("goblin_mobs")
	collision_layer = 2
	collision_mask = 1
	floor_snap_length = 0.42
	var collision := CollisionShape3D.new()
	var shape := CapsuleShape3D.new()
	shape.radius = 0.32
	shape.height = 1.62
	collision.position.y = 0.81
	collision.shape = shape
	add_child(collision)
	humanoid = HumanoidVisualScript.new()
	add_child(humanoid)
	humanoid.configure(
		Color(0.34, 0.23, 0.12),
		Color(0.32, 0.55, 0.18), Color(0.16, 0.18, 0.12))
	humanoid.set_held_stack(Inventory.make_stack_from_ref({
		"kind": "item",
		"stable_id": "item.weapon.iron_sword",
		"count": 1,
	}))
	var label := Label3D.new()
	label.text = "Camp Goblin"
	label.position.y = 2.02
	label.font_size = 25
	label.outline_size = 6
	label.modulate = Color(0.92, 0.68, 0.48)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.no_depth_test = true
	add_child(label)


func _physics_process(delta: float) -> void:
	if world == null:
		return
	_attack_seconds = maxf(0.0, _attack_seconds - delta)
	_retarget_seconds -= delta
	var destination := _target
	if player != null and global_position.distance_to(player.global_position) <= 8.0:
		destination = player.global_position
	elif _retarget_seconds <= 0.0:
		_choose_target()
		destination = _target
	var horizontal := Vector2(
		destination.x - global_position.x,
		destination.z - global_position.z)
	var direction := Vector3.ZERO
	if horizontal.length() > 0.7:
		var desired := horizontal.normalized()
		direction = Vector3(desired.x, 0.0, desired.y)
		var next := global_position + direction * 0.8
		var next_y := world.surface_height_at(
			floori(next.x), floori(next.z)) + 1
		if world.is_spawn_surface_ready_at(Vector3i(
				floori(next.x), next_y, floori(next.z))):
			look_at(global_position + direction, Vector3.UP)
		else:
			direction = Vector3.ZERO
			_retarget_seconds = 0.0
	velocity.x = direction.x * WALK_SPEED
	velocity.z = direction.z * WALK_SPEED
	velocity.y -= GRAVITY * delta
	move_and_slide()
	if is_on_floor():
		apply_floor_snap()
	if humanoid != null:
		humanoid.update_pose(delta, Vector2(velocity.x, velocity.z).length())
	if player != null \
			and global_position.distance_to(player.global_position) <= ATTACK_RANGE \
			and _attack_seconds <= 0.0:
		_attack_seconds = 1.0
		humanoid.play_action("attack", 0.34)
		player.apply_combat_damage({
			"source": actor_id,
			"damage_type": "physical.goblin",
			"amount": 3.0,
		})


func _choose_target() -> void:
	var angle := _rng.randf_range(-PI, PI)
	var distance := _rng.randf_range(1.0, roam_radius)
	_target = home + Vector3(cos(angle) * distance, 0.0, sin(angle) * distance)
	_retarget_seconds = _rng.randf_range(3.0, 7.0)


func apply_combat_damage(packet: Dictionary) -> Dictionary:
	var amount := maxf(0.0, float(packet.get("amount", 0.0)))
	health = maxf(0.0, health - amount)
	if humanoid != null:
		humanoid.play_action("hurt", 0.25)
	if health <= 0.0:
		queue_free()
	return {"ok": true, "health": health, "defeated": health <= 0.0}


func apply_magic_damage(packet: Dictionary) -> Dictionary:
	return apply_combat_damage(packet)


func is_combat_alive() -> bool:
	return health > 0.0
