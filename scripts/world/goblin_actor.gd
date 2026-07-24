class_name GoblinActor
extends CharacterBody3D
## Local Stage 7 representation of one authoritative CombatState enemy.

const HumanoidVisualScript = preload("res://scripts/visual/humanoid_visual.gd")
const WALK_SPEED := 2.15
const GRAVITY := 22.0
const ATTACK_RANGE := 1.55

var world: VoxelWorld
var player: Player
var enemy_id := ""
var humanoid: Node3D
var _attack_cooldown := 0.0
var _record_accumulator := 0.0


func setup(p_world: VoxelWorld, p_player: Player, p_enemy_id: String) -> void:
	world = p_world
	player = p_player
	enemy_id = p_enemy_id


func _ready() -> void:
	add_to_group("raid_enemies")
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
	var record := CombatState.get_enemy_record(enemy_id)
	var role := str(record.get("role", "raider"))
	var clothing: Color = {
		"raider": Color(0.38, 0.25, 0.12),
		"brute": Color(0.28, 0.20, 0.12),
		"captain": Color(0.48, 0.12, 0.10),
	}.get(role, Color(0.38, 0.25, 0.12))
	humanoid = HumanoidVisualScript.new()
	add_child(humanoid)
	humanoid.configure(
		clothing, Color(0.32, 0.55, 0.18), Color(0.16, 0.18, 0.12))
	humanoid.scale = Vector3.ONE * (1.12 if role == "brute" else 1.0)
	var weapon_id: String = "item.weapon.stone_spear" \
		if role == "brute" else "item.weapon.iron_sword"
	humanoid.set_held_stack(Inventory.make_stack_from_ref({
		"kind": "item",
		"stable_id": weapon_id,
		"count": 1,
	}))
	var label := Label3D.new()
	label.text = str(record.get("name", "Goblin"))
	label.position.y = 2.15 if role == "brute" else 2.02
	label.font_size = 28
	label.outline_size = 6
	label.modulate = Color(1.0, 0.62, 0.50)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.no_depth_test = true
	add_child(label)
	var saved: Array = record.get("position", [])
	if saved.size() >= 3:
		global_position = Vector3(float(saved[0]), float(saved[1]), float(saved[2]))
	if global_position.y <= 0.0 and world != null:
		global_position.y = float(world.surface_height_at(
			floori(global_position.x), floori(global_position.z))) + 1.0


func _physics_process(delta: float) -> void:
	var record := CombatState.get_enemy_record(enemy_id)
	if record.is_empty() or not bool(record.get("alive", false)) \
			or bool(record.get("retreated", false)):
		queue_free()
		return
	if not CombatState.is_assault_active() or world == null:
		if humanoid != null:
			humanoid.update_pose(delta, 0.0)
		return
	_attack_cooldown = maxf(0.0, _attack_cooldown - delta)
	var target_position := _target_position()
	var difference := target_position - global_position
	var horizontal := Vector2(difference.x, difference.z)
	var direction := Vector3.ZERO
	if horizontal.length() > ATTACK_RANGE * 0.72:
		var desired := horizontal.normalized()
		direction = Vector3(desired.x, 0.0, desired.y)
		look_at(global_position + direction, Vector3.UP)
	var role := str(record.get("role", "raider"))
	var speed := WALK_SPEED * (0.72 if role == "brute" else 1.0)
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= GRAVITY * delta
	move_and_slide()
	if is_on_floor():
		apply_floor_snap()
	var expected_ground := float(world.surface_height_at(
		floori(global_position.x), floori(global_position.z))) + 1.0
	if global_position.y < expected_ground - 3.0:
		global_position.y = expected_ground + 0.05
		velocity = Vector3.ZERO
	if humanoid != null:
		humanoid.update_pose(delta, Vector2(velocity.x, velocity.z).length())
	if horizontal.length() <= ATTACK_RANGE and _attack_cooldown <= 0.0:
		_attack_cooldown = 1.05 if role == "brute" else 0.82
		humanoid.play_action("attack", 0.34)
		_perform_attack(record)
	_record_accumulator += delta
	if _record_accumulator >= 0.5:
		_record_accumulator = 0.0
		CombatState.update_enemy_position(enemy_id, global_position)


func _target_position() -> Vector3:
	if player != null and global_position.distance_to(player.global_position) <= 12.0:
		return player.global_position
	var hamlet: Vector2i = world.valley_plan.get_anchor("hamlet")
	return Vector3(
		float(hamlet.x) + 4.5,
		float(world.surface_height_at(hamlet.x + 4, hamlet.y)) + 1.0,
		float(hamlet.y) + 0.5)


func _perform_attack(record: Dictionary) -> void:
	var amount := float(record.get("damage", 4.0))
	if player != null and global_position.distance_to(player.global_position) <= ATTACK_RANGE + 0.4:
		player.apply_combat_damage({
			"source": enemy_id,
			"damage_type": "physical.goblin",
			"amount": amount,
		})
		return
	var guard := _nearest_guard()
	if guard != null and global_position.distance_to(guard.global_position) <= ATTACK_RANGE + 0.4:
		HamletState.apply_npc_damage(
			guard.get_npc_id(), amount, enemy_id,
			bool(CombatState.settings.get("npc_death", false)))


func _nearest_guard() -> Node3D:
	var nearest: Node3D
	var distance := INF
	for node in get_tree().get_nodes_in_group("hamlet_npcs"):
		if not (node is HamletNpcActor):
			continue
		var record := HamletState.get_npc_record(node.get_npc_id())
		if str(record.get("job_id", "")) != "job.guard.militia":
			continue
		var candidate := global_position.distance_squared_to(node.global_position)
		if candidate < distance:
			distance = candidate
			nearest = node
	return nearest


func apply_combat_damage(packet: Dictionary) -> Dictionary:
	if humanoid != null:
		humanoid.play_action("hurt", 0.25)
	return CombatState.damage_enemy(enemy_id, packet)


func apply_magic_damage(packet: Dictionary) -> Dictionary:
	var magic_packet := packet.duplicate(true)
	magic_packet["source"] = "player.magic"
	return apply_combat_damage(magic_packet)


func is_combat_alive() -> bool:
	return bool(CombatState.get_enemy_record(enemy_id).get("alive", false))
