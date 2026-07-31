class_name MobSpawnVolume
extends StaticBody3D
## Breakable, structure-owned mob spawner with a capped timed local population.
##
## Authored volumes do not replace random ecology spawning. They provide
## stable sources for mobs tied to a camp/dungeon/structure; ambient biome
## candidates remain a separate world-simulation channel.

signal spawner_broken(volume_id: String)

const AmbientGoblinActorScript = preload(
	"res://scripts/world/ambient_goblin_actor.gd")

var volume_id := ""
var owner_id := ""
var mob_family := ""
var spawn_mode := "authored_structure"
var volume_size := Vector3(10.0, 5.0, 10.0)
var active := true
var max_local_mobs := 3
var max_nearby_mobs := 6
var min_spawn_seconds := 6.0
var max_spawn_seconds := 12.0
var spawn_seed := 0

var _world: VoxelWorld
var _player: Player
var _stream_ready := false
var _spawn_seconds := 0.0
var _next_spawn_seconds := 8.0
var _spawn_serial := 0
var _ambient_actors: Dictionary = {}
var _rng := RandomNumberGenerator.new()


func configure(definition: Dictionary) -> void:
	volume_id = str(definition.get("id", "spawn_volume.unknown"))
	owner_id = str(definition.get("owner_id", ""))
	mob_family = str(definition.get("mob_family", ""))
	spawn_mode = str(definition.get("spawn_mode", "authored_structure"))
	spawn_seed = int(definition.get("spawn_seed", absi(volume_id.hash())))
	active = bool(definition.get("active", true))
	max_local_mobs = maxi(0, int(definition.get("max_local_mobs", 3)))
	max_nearby_mobs = maxi(
		max_local_mobs, int(definition.get("max_nearby_mobs", 6)))
	min_spawn_seconds = maxf(
		1.0, float(definition.get("min_spawn_seconds", 6.0)))
	max_spawn_seconds = maxf(
		min_spawn_seconds, float(definition.get("max_spawn_seconds", 12.0)))
	var size_value: Variant = definition.get("size", [10.0, 5.0, 10.0])
	if size_value is Array and size_value.size() >= 3:
		volume_size = Vector3(
			maxf(2.0, float(size_value[0])),
			maxf(2.0, float(size_value[1])),
			maxf(2.0, float(size_value[2])))
	var center: Variant = definition.get("center", [0.0, 0.0, 0.0])
	if center is Array and center.size() >= 3:
		global_position = Vector3(
			float(center[0]), float(center[1]), float(center[2]))
	name = volume_id
	collision_layer = 0
	collision_mask = 0
	_rng.seed = spawn_seed
	_schedule_next_spawn()
	_build_spawner_cube()
	visible = false


func configure_runtime(p_world: VoxelWorld, p_player: Player) -> void:
	_world = p_world
	_player = p_player


func set_stream_ready(value: bool) -> void:
	var next_ready := value and active
	if _stream_ready == next_ready:
		return
	_stream_ready = next_ready
	visible = _stream_ready
	collision_layer = 1 if _stream_ready else 0
	if not _stream_ready:
		_clear_ambient_actors()
		_spawn_seconds = 0.0


func is_stream_ready() -> bool:
	return _stream_ready


func is_mob_spawner() -> bool:
	return true


func get_break_hardness() -> float:
	return 1.6


func break_spawner() -> bool:
	if not active or not _stream_ready:
		return false
	active = false
	_stream_ready = false
	visible = false
	collision_layer = 0
	_clear_ambient_actors()
	spawner_broken.emit(volume_id)
	return true


func interaction_summary() -> String:
	return "Goblin Spawner · %d/%d local · %d/%d nearby" % [
		ambient_actor_count(), max_local_mobs,
		nearby_mob_count(), max_nearby_mobs]


func serialize_definition(spawn_count := 0) -> Dictionary:
	var definition := {
		"id": volume_id,
		"owner_id": owner_id,
		"mob_family": mob_family,
		"spawn_mode": spawn_mode,
		"spawn_seed": spawn_seed,
		"center": [global_position.x, global_position.y, global_position.z],
		"size": [volume_size.x, volume_size.y, volume_size.z],
		"active": active,
		"max_local_mobs": max_local_mobs,
		"max_nearby_mobs": max_nearby_mobs,
		"min_spawn_seconds": min_spawn_seconds,
		"max_spawn_seconds": max_spawn_seconds,
		"ambient_policy": "separate_world_ecology",
	}
	if spawn_count > 0:
		var points: Array = []
		for index in spawn_count:
			var point := spawn_point(index)
			points.append([point.x, point.y, point.z])
		definition["spawn_points"] = points
	return definition


func spawn_point(index: int) -> Vector3:
	var samples := [
		Vector2(-0.34, -0.22), Vector2(0.34, -0.22),
		Vector2(-0.28, 0.30), Vector2(0.28, 0.30),
		Vector2(-0.44, 0.04), Vector2(0.44, 0.04),
		Vector2(0.0, -0.42), Vector2(0.0, 0.42),
	]
	var sample: Vector2 = samples[index % samples.size()]
	var ring := 1.0 + float(index / samples.size()) * 0.28
	return Vector3(
		global_position.x + sample.x * volume_size.x * ring,
		global_position.y,
		global_position.z + sample.y * volume_size.z * ring)


func contains_world_xz(position: Vector3) -> bool:
	var half := Vector2(volume_size.x, volume_size.z) * 0.5
	return absf(position.x - global_position.x) <= half.x \
		and absf(position.z - global_position.z) <= half.y


func ambient_actor_count() -> int:
	_cleanup_ambient_actors()
	return _ambient_actors.size()


func nearby_mob_count() -> int:
	var count := 0
	for node in get_tree().get_nodes_in_group("goblin_mobs"):
		if node is Node3D and is_instance_valid(node) \
				and contains_world_xz(node.global_position):
			count += 1
	return count


func _process(delta: float) -> void:
	if not active or not _stream_ready or _world == null:
		return
	_cleanup_ambient_actors()
	_spawn_seconds += delta
	if _spawn_seconds < _next_spawn_seconds:
		return
	_spawn_seconds = 0.0
	_schedule_next_spawn()
	if _ambient_actors.size() >= max_local_mobs \
			or nearby_mob_count() >= max_nearby_mobs:
		return
	_spawn_ambient_mob()


func _spawn_ambient_mob() -> void:
	for attempt in 8:
		var index := _spawn_serial + attempt
		var point := spawn_point(index)
		var x := floori(point.x)
		var z := floori(point.z)
		var feet_y := _world.surface_height_at(x, z) + 1
		var feet := Vector3i(x, feet_y, z)
		if not _world.is_spawn_surface_ready_at(feet):
			continue
		_spawn_serial = index + 1
		var actor_id := "%s.ambient.%d" % [volume_id, _spawn_serial]
		var actor: Node3D = AmbientGoblinActorScript.new()
		get_parent().add_child(actor)
		actor.call(
			"setup_ambient", _world, _player, actor_id,
			Vector3(float(x) + 0.5, float(feet_y) + 0.05, float(z) + 0.5),
			global_position, minf(volume_size.x, volume_size.z) * 0.42)
		_ambient_actors[actor_id] = actor
		return


func _cleanup_ambient_actors() -> void:
	for actor_id in _ambient_actors.keys():
		if not is_instance_valid(_ambient_actors[actor_id]) \
				or _ambient_actors[actor_id].is_queued_for_deletion():
			_ambient_actors.erase(actor_id)


func _clear_ambient_actors() -> void:
	for actor in _ambient_actors.values():
		if is_instance_valid(actor) and not actor.is_queued_for_deletion():
			actor.queue_free()
	_ambient_actors.clear()


func _schedule_next_spawn() -> void:
	_next_spawn_seconds = _rng.randf_range(
		min_spawn_seconds, max_spawn_seconds)


func _build_spawner_cube() -> void:
	for child in get_children():
		child.queue_free()
	var cage_color := Color(0.12, 0.13, 0.15)
	var core_color := Color(0.28, 0.82, 0.20)
	var marker_y := -0.50
	for x in [-0.46, 0.46]:
		for z in [-0.46, 0.46]:
			_add_box(
				Vector3(0.07, 1.0, 0.07),
				Vector3(x, marker_y, z), cage_color)
	for y in [-0.96, -0.04]:
		for z in [-0.46, 0.46]:
			_add_box(
				Vector3(1.0, 0.07, 0.07),
				Vector3(0.0, y, z), cage_color)
		for x in [-0.46, 0.46]:
			_add_box(
				Vector3(0.07, 0.07, 1.0),
				Vector3(x, y, 0.0), cage_color)
	var core := _add_box(
		Vector3(0.42, 0.42, 0.42),
		Vector3(0.0, marker_y, 0.0), core_color)
	var core_material := core.mesh.material as StandardMaterial3D
	core_material.emission_enabled = true
	core_material.emission = core_color
	core_material.emission_energy_multiplier = 1.8
	var collider := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = Vector3.ONE
	collider.position.y = marker_y
	collider.shape = shape
	add_child(collider)


func _add_box(
		size: Vector3, position: Vector3,
		color: Color) -> MeshInstance3D:
	var instance := MeshInstance3D.new()
	var mesh := BoxMesh.new()
	var material := StandardMaterial3D.new()
	mesh.size = size
	material.albedo_color = color
	material.roughness = 0.72
	mesh.material = material
	instance.mesh = mesh
	instance.position = position
	instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	add_child(instance)
	return instance
