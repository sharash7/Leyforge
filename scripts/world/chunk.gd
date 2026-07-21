class_name Chunk
extends Node3D
## One 16x16x16 section of voxels. Holds block data and builds its own
## mesh + collision with GREEDY MESHING: coplanar same-block faces are
## merged into large rectangles, which cuts vertex counts ~10x versus
## per-block quads and makes rebuilds (and streaming) much cheaper.
##
## Faces are emitted straight into arrays (no SurfaceTool) and collision
## triangles are accumulated during emission (no mesh.get_faces()).

const SIZE := 16

var chunk_pos := Vector3i.ZERO  # position in chunk-grid coordinates
var blocks := PackedInt32Array()

var _world: Node = null
var _mesh_instance: MeshInstance3D
var _body: StaticBody3D
var _collider: CollisionShape3D


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
	if is_inside_tree():
		rebuild()


func _get_global(x: int, y: int, z: int) -> int:
	# Block id at local coords, crossing into neighbor chunks via the world.
	if x < 0 or y < 0 or z < 0 or x >= SIZE or y >= SIZE or z >= SIZE:
		if _world != null:
			return _world.get_block_global(chunk_pos * SIZE + Vector3i(x, y, z))
		return BlockRegistry.AIR
	return blocks[index(x, y, z)]


# ---------- Greedy mesher ----------

func rebuild() -> void:
	if _mesh_instance == null:
		return
	var ov := PackedVector3Array()  # opaque vertices (visual)
	var on := PackedVector3Array()  # opaque normals
	var oc := PackedColorArray()    # opaque colors
	var wv := PackedVector3Array()  # water vertices
	var wn := PackedVector3Array()
	var wc := PackedColorArray()
	var ct := PackedVector3Array()  # collision triangles (opaque only)

	var mask := PackedInt32Array()
	mask.resize(SIZE * SIZE)

	# Sweep each axis in both directions. For axis a, the in-slice axes are
	# u = (a+1)%3 and v = (a+2)%2 (so U x V == +A for every axis, which makes
	# the winding rule uniform: sign +1 -> W2, sign -1 -> W1).
	for a in 3:
		var u := (a + 1) % 3
		var v := (a + 2) % 3
		for s in [-1, 1]:
			_sweep_axis(a, u, v, s, mask, ov, on, oc, wv, wn, wc, ct)

	# Assemble the mesh: surface 0 opaque, surface 1 transparent water.
	var mesh := ArrayMesh.new()
	if not ov.is_empty():
		var arrays := []
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = ov
		arrays[Mesh.ARRAY_NORMAL] = on
		arrays[Mesh.ARRAY_COLOR] = oc
		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	if not wv.is_empty():
		var arrays := []
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = wv
		arrays[Mesh.ARRAY_NORMAL] = wn
		arrays[Mesh.ARRAY_COLOR] = wc
		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	if mesh.get_surface_count() > 0:
		_mesh_instance.mesh = mesh
		if _world != null:
			_mesh_instance.set_surface_override_material(0, _world.chunk_material)
			if mesh.get_surface_count() > 1:
				_mesh_instance.set_surface_override_material(1, _world.water_material)
	else:
		_mesh_instance.mesh = null

	if ct.size() > 0:
		var shape := ConcavePolygonShape3D.new()
		shape.set_faces(ct)
		_collider.shape = shape
	else:
		_collider.shape = null


func _face_visible(id: int, nid: int, is_water: bool) -> bool:
	if is_water:
		# Water only draws faces against air: the top surface. Faces against
		# solid blocks are hidden anyway (and z-fought the terrain skin).
		return BlockRegistry.is_air(nid)
	# Opaque faces are hidden by opaque neighbors only, so the terrain skin
	# under water is still drawn (visible through the transparent surface).
	return BlockRegistry.is_air(nid) or BlockRegistry.is_water(nid)


func _sweep_axis(a: int, u: int, v: int, s: int, mask: PackedInt32Array,
		ov: PackedVector3Array, on: PackedVector3Array, oc: PackedColorArray,
		wv: PackedVector3Array, wn: PackedVector3Array, wc: PackedColorArray,
		ct: PackedVector3Array) -> void:
	var pos := Vector3i.ZERO
	var npos := Vector3i.ZERO
	for slice in SIZE:
		# Build the visibility mask for this slice: block id where the
		# s-facing side is exposed, 0 where hidden.
		pos[a] = slice
		npos[a] = slice + s
		for iv in SIZE:
			pos[v] = iv
			npos[v] = iv
			for iu in SIZE:
				pos[u] = iu
				npos[u] = iu
				var id := blocks[index(pos.x, pos.y, pos.z)]
				if BlockRegistry.is_air(id):
					mask[iu + iv * SIZE] = 0
					continue
				var is_water: bool = BlockRegistry.is_water(id)
				var nid := _get_global(npos.x, npos.y, npos.z)
				mask[iu + iv * SIZE] = id if _face_visible(id, nid, is_water) else 0
		# Greedily merge the mask into rectangles.
		for iv in SIZE:
			var iu := 0
			while iu < SIZE:
				var id0 := mask[iu + iv * SIZE]
				if id0 == 0:
					iu += 1
					continue
				var w := 1
				while iu + w < SIZE and mask[iu + w + iv * SIZE] == id0:
					w += 1
				var h := 1
				var growing := true
				while iv + h < SIZE and growing:
					for k in w:
						if mask[iu + k + (iv + h) * SIZE] != id0:
							growing = false
							break
					if growing:
						h += 1
				for dv in h:
					for du in w:
						mask[iu + du + (iv + dv) * SIZE] = 0
				_emit_quad(a, u, v, s, slice, iu, iv, w, h, id0, ov, on, oc, wv, wn, wc, ct)
				iu += w


func _emit_quad(a: int, u: int, v: int, s: int, slice: int, iu: int, iv: int,
		w: int, h: int, id: int,
		ov: PackedVector3Array, on: PackedVector3Array, oc: PackedColorArray,
		wv: PackedVector3Array, wn: PackedVector3Array, wc: PackedColorArray,
		ct: PackedVector3Array) -> void:
	var base := Vector3.ZERO
	base[a] = float(slice + (1 if s > 0 else 0))
	base[u] = float(iu)
	base[v] = float(iv)
	var du := Vector3.ZERO
	du[u] = float(w)
	var dv := Vector3.ZERO
	dv[v] = float(h)
	var c00 := base
	var c10 := base + du
	var c11 := base + du + dv
	var c01 := base + dv
	var n := Vector3.ZERO
	n[a] = float(s)
	var color: Color = BlockRegistry.get_color(id)

	var verts := wv if BlockRegistry.is_water(id) else ov
	var norms := wn if BlockRegistry.is_water(id) else on
	var cols := wc if BlockRegistry.is_water(id) else oc
	# s>0: winding (c00,c10,c11)/(c00,c11,c01); s<0: mirrored.
	if s > 0:
		verts.append_array([c00, c10, c11, c00, c11, c01])
	else:
		verts.append_array([c00, c11, c10, c00, c01, c11])
	for i in 6:
		norms.append(n)
		cols.append(color)
	if not BlockRegistry.is_water(id):
		if s > 0:
			ct.append_array([c00, c10, c11, c00, c11, c01])
		else:
			ct.append_array([c00, c11, c10, c00, c01, c11])
