class_name Player
extends CharacterBody3D
## First-person controller: WASD + mouse look + jump, plus voxel
## break/place interaction driven by the Inventory autoload.

const SPEED := 6.0
const SPRINT_MULT := 1.6
const JUMP_VELOCITY := 8.5
const GRAVITY := 22.0
const MOUSE_SENS := 0.0022
const REACH := 6.0

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var ray: RayCast3D = $Head/Camera3D/RayCast3D

var world: VoxelWorld
var controls_locked := false  # true while the crafting UI is open

var _yaw := 0.0
var _pitch := 0.0


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	ray.target_position = Vector3(0, 0, -REACH)
	ray.enabled = true


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
		_try_break()
	elif event.is_action_pressed("place_block"):
		_try_place()


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	var move := Vector3.ZERO
	if not controls_locked:
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		move = transform.basis * Vector3(input_dir.x, 0, input_dir.y)
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

	var speed := SPEED
	if Input.is_action_pressed("sprint"):
		speed *= SPRINT_MULT
	velocity.x = move.x * speed
	velocity.z = move.z * speed
	move_and_slide()

	# Fell out of the world -> respawn on top.
	if global_position.y < -40.0 and world != null:
		global_position = world.find_spawn()
		velocity = Vector3.ZERO


func _try_break() -> void:
	if world == null or not ray.is_colliding():
		return
	var point := ray.get_collision_point()
	var normal := ray.get_collision_normal()
	var gp := Vector3i((point - normal * 0.5).floor())
	var id: int = world.get_block_global(gp)
	if BlockRegistry.is_air(id):
		return
	world.set_block_global(gp, BlockRegistry.AIR)
	Inventory.add_item(id, 1)


func _try_place() -> void:
	if world == null or not ray.is_colliding():
		return
	var stack: Dictionary = Inventory.get_selected_stack()
	if stack.is_empty():
		return
	var block_id := int(stack["id"])
	var point := ray.get_collision_point()
	var normal := ray.get_collision_normal()
	var gp := Vector3i((point + normal * 0.5).floor())
	if not BlockRegistry.is_air(world.get_block_global(gp)):
		return
	if _overlaps_player(gp):
		return
	# Only consume after all checks pass.
	if Inventory.take_selected(1) < 0:
		return
	world.set_block_global(gp, block_id)


func _overlaps_player(gp: Vector3i) -> bool:
	# Player origin is at the feet; body extends ~1.8m up.
	var block_aabb := AABB(Vector3(gp), Vector3.ONE)
	var player_aabb := AABB(global_position + Vector3(-0.36, 0.05, -0.36), Vector3(0.72, 1.8, 0.72))
	return block_aabb.intersects(player_aabb)
