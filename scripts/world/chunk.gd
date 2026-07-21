class_name Chunk
extends Node3D
## One 16x16x16 section of voxels. Holds block data and builds its own
## mesh + collision from that data, with per-face culling and vertex colors.

const SIZE := 16

# Per-direction face geometry. Each entry: neighbor offset, normal, and the
# four quad corners. NOTE: the quads are listed so that emitting triangles
# (a,c,b) and (a,d,c) yields Godot front faces (CCW) when viewed from outside
# the block -- the raw (a,b,c) order is clockwise from outside.
const FACES := [
	{"dir": Vector3i(1, 0, 0), "n": Vector3(1, 0, 0),
		"q": [Vector3(1, 0, 0), Vector3(1, 1, 0), Vector3(1, 1, 1), Vector3(1, 0, 1)]},
	{"dir": Vector3i(-1, 0, 0), "n": Vector3(-1, 0, 0),
		"q": [Vector3(0, 0, 1), Vector3(0, 1, 1), Vector3(0, 1, 0), Vector3(0, 0, 0)]},
	{"dir": Vector3i(0, 1, 0), "n": Vector3(0, 1, 0),
		"q": [Vector3(0, 1, 0), Vector3(0, 1, 1), Vector3(1, 1, 1), Vector3(1, 1, 0)]},
	{"dir": Vector3i(0, -1, 0), "n": Vector3(0, -1, 0),
		"q": [Vector3(0, 0, 1), Vector3(0, 0, 0), Vector3(1, 0, 0), Vector3(1, 0, 1)]},
	{"dir": Vector3i(0, 0, 1), "n": Vector3(0, 0, 1),
		"q": [Vector3(0, 0, 1), Vector3(1, 0, 1), Vector3(1, 1, 1), Vector3(0, 1, 1)]},
	{"dir": Vector3i(0, 0, -1), "n": Vector3(0, 0, -1),
		"q": [Vector3(0, 0, 0), Vector3(0, 1, 0), Vector3(1, 1, 0), Vector3(1, 0, 0)]},
]

var chunk_pos := Vector3i.ZERO  # position in chunk-grid coordinates
var blocks := PackedInt32Array()

var _world: Node = null
var _mesh_instance: MeshInstance3D
var _body: StaticBody3D
var _collider: CollisionShape3D
var _dirty := true


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
	if _dirty:
		rebuild()


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
	_dirty = true
	if is_inside_tree():
		rebuild()


func is_solid_local(x: int, y: int, z: int) -> bool:
	# Local coords outside this chunk are asked to the world, so faces on
	# chunk borders are culled correctly.
	if x < 0 or y < 0 or z < 0 or x >= SIZE or y >= SIZE or z >= SIZE:
		if _world != null:
			var gp: Vector3i = chunk_pos * SIZE + Vector3i(x, y, z)
			return not BlockRegistry.is_air(_world.get_block_global(gp))
		return false
	return not BlockRegistry.is_air(blocks[index(x, y, z)])


func rebuild() -> void:
	_dirty = false
	if _mesh_instance == null:
		return
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var face_count := 0

	for y in SIZE:
		for z in SIZE:
			for x in SIZE:
				var id := blocks[index(x, y, z)]
				if BlockRegistry.is_air(id):
					continue
				var color: Color = BlockRegistry.get_color(id)
				var v := Vector3(x, y, z)
				for face in FACES:
					var d: Vector3i = face["dir"]
					if is_solid_local(x + d.x, y + d.y, z + d.z):
						continue
					var n: Vector3 = face["n"]
					var q: Array = face["q"]
					st.set_color(color)
					st.set_normal(n)
					# Two triangles with CCW-from-outside winding: a-c-b and a-d-c.
					st.add_vertex(v + q[0])
					st.add_vertex(v + q[2])
					st.add_vertex(v + q[1])
					st.add_vertex(v + q[0])
					st.add_vertex(v + q[3])
					st.add_vertex(v + q[2])
					face_count += 1

	if face_count == 0:
		_mesh_instance.mesh = null
		_collider.shape = null
		return

	var mesh := st.commit()
	_mesh_instance.mesh = mesh
	if _world != null:
		_mesh_instance.material_override = _world.chunk_material

	# Collision from the same triangles.
	var tris: PackedVector3Array = mesh.get_faces()
	if tris.size() > 0:
		var shape := ConcavePolygonShape3D.new()
		shape.set_faces(tris)
		_collider.shape = shape
	else:
		_collider.shape = null
