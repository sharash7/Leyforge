class_name WorldItemDrop
extends CharacterBody3D
## Persistent physical representation of a mined stack. Drops settle against
## voxel collision, remain in the world when inventory is full, and transfer
## automatically when the player enters the pickup radius.

const GRAVITY := 18.0
const PICKUP_RADIUS := 1.65
const PICKUP_DELAY := 0.35

var world: VoxelWorld
var drop_id := ""
var stack: Dictionary = {}
var _age := 0.0
var _visual: Node3D


func setup(p_world: VoxelWorld, p_drop_id: String, p_stack: Dictionary) -> void:
	world = p_world
	drop_id = p_drop_id
	stack = Inventory._normalise_stack(p_stack)


func _ready() -> void:
	collision_layer = 4
	collision_mask = 1
	floor_snap_length = 0.18
	var collision := CollisionShape3D.new()
	var shape := SphereShape3D.new()
	shape.radius = 0.20
	collision.shape = shape
	add_child(collision)
	_visual = Node3D.new()
	add_child(_visual)
	_build_visual()


func _build_visual() -> void:
	var material := StandardMaterial3D.new()
	material.albedo_color = Inventory.stack_color(stack).lightened(0.12)
	material.roughness = 0.82
	if Inventory.stack_kind(stack) == "block":
		var block := MeshInstance3D.new()
		var mesh := BoxMesh.new()
		mesh.size = Vector3(0.38, 0.38, 0.38)
		mesh.material = material
		block.mesh = mesh
		_visual.add_child(block)
		return
	if ItemRegistry.is_tool(int(stack.get("id", -1))):
		var handle := MeshInstance3D.new()
		var handle_mesh := BoxMesh.new()
		handle_mesh.size = Vector3(0.09, 0.45, 0.09)
		handle_mesh.material = material
		handle.mesh = handle_mesh
		handle.rotation.z = -0.55
		_visual.add_child(handle)
		var head := MeshInstance3D.new()
		var head_mesh := BoxMesh.new()
		head_mesh.size = Vector3(0.38, 0.12, 0.12)
		head_mesh.material = material
		head.mesh = head_mesh
		head.position = Vector3(0.08, 0.16, 0.0)
		head.rotation.z = -0.25
		_visual.add_child(head)
		return
	var item := MeshInstance3D.new()
	var item_mesh := SphereMesh.new()
	item_mesh.radius = 0.22
	item_mesh.height = 0.36
	item_mesh.radial_segments = 8
	item_mesh.rings = 4
	item_mesh.material = material
	item.mesh = item_mesh
	item.scale = Vector3(0.8, 1.0, 0.42)
	_visual.add_child(item)


func _physics_process(delta: float) -> void:
	if world == null or stack.is_empty():
		return
	_age += delta
	_visual.rotation.y += delta * 1.8
	var voxel_position := Vector3i(global_position.floor())
	if not world.is_voxel_loaded_at(voxel_position):
		velocity = Vector3.ZERO
		return
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	else:
		velocity.x = move_toward(velocity.x, 0.0, delta * 4.0)
		velocity.z = move_toward(velocity.z, 0.0, delta * 4.0)
	move_and_slide()
	if is_on_floor():
		apply_floor_snap()
	if global_position.y < -8.0:
		global_position.y = float(world.surface_height_at(
			floori(global_position.x), floori(global_position.z))) + 1.2
		velocity = Vector3.ZERO
	if _age >= PICKUP_DELAY and world.player != null \
			and global_position.distance_squared_to(world.player.global_position) \
				<= PICKUP_RADIUS * PICKUP_RADIUS:
		_try_auto_pickup()


func _try_auto_pickup() -> void:
	var original_count := int(stack.get("count", 0))
	var leftover := Inventory.add_stack(stack)
	var remaining := int(leftover.get("count", 0))
	var accepted := original_count - remaining
	if accepted <= 0:
		return
	var picked_up := stack.duplicate(true)
	picked_up["count"] = accepted
	stack = leftover
	world.notify_item_drop_pickup(self, picked_up)
	if stack.is_empty():
		queue_free()


func serialize_state() -> Dictionary:
	return {
		"id": drop_id,
		"stack": Inventory.serialize_stack(stack),
		"position": [global_position.x, global_position.y, global_position.z],
		"velocity": [velocity.x, velocity.y, velocity.z],
		"age": _age,
	}
