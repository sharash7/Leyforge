class_name Chunk
extends Node3D
## One 16x16x16 section of voxels. Holds block data and builds its own
## mesh + collision with GREEDY MESHING: coplanar same-block faces are
## merged into large rectangles, which cuts vertex counts ~10x versus
## per-block quads and makes rebuilds (and streaming) much cheaper.
##
## Faces are emitted straight into arrays (no SurfaceTool) and collision
## triangles are accumulated during emission (no mesh.get_faces()).

const ChunkMesherScript = preload("res://scripts/world/chunk_mesher.gd")
const SIZE := 16
const NEIGHBOR_OFFSETS: Array[Vector3i] = [
	Vector3i(1, 0, 0), Vector3i(-1, 0, 0),
	Vector3i(0, 1, 0), Vector3i(0, -1, 0),
	Vector3i(0, 0, 1), Vector3i(0, 0, -1),
]

var chunk_pos := Vector3i.ZERO  # position in chunk-grid coordinates
var blocks := PackedInt32Array()

var _world: Node = null
var _mesh_instance: MeshInstance3D
var _body: StaticBody3D
var _collider: CollisionShape3D
var _geometry_ready := false


func _init() -> void:
	blocks.resize(SIZE * SIZE * SIZE)


func setup(world: Node, cpos: Vector3i) -> void:
	_world = world
	chunk_pos = cpos
	position = Vector3(cpos * SIZE)
	name = "Chunk_%d_%d_%d" % [cpos.x, cpos.y, cpos.z]


func _ready() -> void:
	_mesh_instance = MeshInstance3D.new()
	_body = StaticBody3D.new()
	_collider = CollisionShape3D.new()
	_body.add_child(_collider)
	add_child(_mesh_instance)
	add_child(_body)
	# NOTE: no auto-rebuild here. The world queues the first rebuild so
	# initial meshing happens after neighbors exist (border culling).


func index(x: int, y: int, z: int) -> int:
	return (y * SIZE + z) * SIZE + x


func get_block(x: int, y: int, z: int) -> int:
	if x < 0 or y < 0 or z < 0 or x >= SIZE or y >= SIZE or z >= SIZE:
		return BlockRegistry.AIR
	return blocks[index(x, y, z)]


func set_block(x: int, y: int, z: int, id: int) -> void:
	if x < 0 or y < 0 or z < 0 or x >= SIZE or y >= SIZE or z >= SIZE:
		return
	blocks[index(x, y, z)] = id


# ---------- Greedy mesher ----------

func rebuild() -> void:
	if _mesh_instance == null:
		return
	apply_geometry(ChunkMesherScript.build(create_mesh_snapshot()))

func create_mesh_snapshot() -> Dictionary:
	var neighbors := {}
	if _world != null:
		for offset in NEIGHBOR_OFFSETS:
			var neighbor_pos := chunk_pos + offset
			if _world.chunks.has(neighbor_pos):
				neighbors[offset] = _world.chunks[neighbor_pos].blocks.duplicate()
	return {
		"blocks": blocks.duplicate(),
		"neighbors": neighbors,
		"colors": _world.block_colors if _world != null else PackedColorArray(),
		"shapes": _world.block_shapes if _world != null else PackedByteArray(),
		"transparency": _world.block_transparency \
			if _world != null else PackedByteArray(),
		"item_connectors": _world.block_item_connectors \
			if _world != null else PackedByteArray(),
		"orientations": _world.create_chunk_orientation_snapshot(chunk_pos) \
			if _world != null else PackedByteArray(),
		"door_parts": _world.create_chunk_door_part_snapshot(chunk_pos) \
			if _world != null else PackedByteArray(),
		"door_states": _world.create_chunk_door_state_snapshot(chunk_pos) \
			if _world != null else PackedByteArray(),
		"layers": _world.material_layers if _world != null else PackedInt32Array(),
		"forge_face_layers": _world.forge_face_layers \
			if _world != null else PackedInt32Array(),
		"forge_meshes": _world.forge_mesh_arrays \
			if _world != null else {},
		"water_id": _world.id_water if _world != null else 7,
	}


func apply_geometry(geometry: Dictionary) -> void:
	if _mesh_instance == null or geometry.is_empty():
		return
	var ov: PackedVector3Array = geometry["opaque_vertices"]
	var on: PackedVector3Array = geometry["opaque_normals"]
	var oc: PackedColorArray = geometry["opaque_colors"]
	var ouv: PackedVector2Array = geometry["opaque_uvs"]
	var ouv2: PackedVector2Array = geometry["opaque_uv2s"]
	var wv: PackedVector3Array = geometry["water_vertices"]
	var wn: PackedVector3Array = geometry["water_normals"]
	var wc: PackedColorArray = geometry["water_colors"]
	var gv: PackedVector3Array = geometry.get(
		"glass_vertices", PackedVector3Array())
	var gn: PackedVector3Array = geometry.get(
		"glass_normals", PackedVector3Array())
	var gc: PackedColorArray = geometry.get(
		"glass_colors", PackedColorArray())
	var ct: PackedVector3Array = geometry["collision_triangles"]
	# Water and glass need distinct materials/surfaces. Combining them caused
	# the river to inherit glass alpha and double-sided sorting artefacts.
	var mesh := ArrayMesh.new()
	var opaque_surface := -1
	var water_surface := -1
	var glass_surface := -1
	if not ov.is_empty():
		var arrays := []
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = ov
		arrays[Mesh.ARRAY_NORMAL] = on
		arrays[Mesh.ARRAY_COLOR] = oc
		arrays[Mesh.ARRAY_TEX_UV] = ouv
		arrays[Mesh.ARRAY_TEX_UV2] = ouv2
		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		opaque_surface = mesh.get_surface_count() - 1
	if not wv.is_empty():
		var arrays := []
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = wv
		arrays[Mesh.ARRAY_NORMAL] = wn
		arrays[Mesh.ARRAY_COLOR] = wc
		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		water_surface = mesh.get_surface_count() - 1
	if not gv.is_empty():
		var arrays := []
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = gv
		arrays[Mesh.ARRAY_NORMAL] = gn
		arrays[Mesh.ARRAY_COLOR] = gc
		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		glass_surface = mesh.get_surface_count() - 1
	if mesh.get_surface_count() > 0:
		_mesh_instance.mesh = mesh
		if _world != null:
			if opaque_surface >= 0:
				_mesh_instance.set_surface_override_material(
					opaque_surface, _world.chunk_material)
			if water_surface >= 0:
				_mesh_instance.set_surface_override_material(
					water_surface, _world.water_material)
			if glass_surface >= 0:
				_mesh_instance.set_surface_override_material(
					glass_surface, _world.glass_material)
	else:
		_mesh_instance.mesh = null

	if ct.size() > 0:
		var shape := ConcavePolygonShape3D.new()
		shape.set_faces(ct)
		_collider.shape = shape
	else:
		_collider.shape = null
	_geometry_ready = true


func is_geometry_ready() -> bool:
	return _geometry_ready
