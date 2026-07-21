class_name VoxelWorld
extends Node3D
## Owns all chunks: terrain generation, global block get/set,
## and the shared vertex-color material.

const CHUNK_SIZE := 16
const WORLD_RADIUS := 3      # chunks in each horizontal direction (7x7 columns)
const WORLD_HEIGHT_CHUNKS := 3  # 48 blocks tall

signal block_changed(global_pos: Vector3i, id: int)

var chunks: Dictionary = {}  # Vector3i -> Chunk
var chunk_material: StandardMaterial3D

var _noise := FastNoiseLite.new()
var _tree_noise := FastNoiseLite.new()

# Cached registry ids (fallbacks if names differ).
var id_grass := 1
var id_dirt := 2
var id_stone := 3
var id_sand := 4
var id_log := 9
var id_leaves := 10


func _ready() -> void:
	_resolve_ids()
	chunk_material = StandardMaterial3D.new()
	chunk_material.vertex_color_use_as_albedo = true
	chunk_material.roughness = 0.9
	chunk_material.metallic = 0.0

	_noise.seed = 1337
	_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	_noise.frequency = 0.02
	_noise.fractal_octaves = 4

	_tree_noise.seed = 9001
	_tree_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_tree_noise.frequency = 0.35

	_generate_world()


func _resolve_ids() -> void:
	id_grass = _id_or("Grass", 1)
	id_dirt = _id_or("Dirt", 2)
	id_stone = _id_or("Stone", 3)
	id_sand = _id_or("Sand", 4)
	id_log = _id_or("Oak Log", 9)
	id_leaves = _id_or("Oak Leaves", 10)


func _id_or(display_name: String, fallback: int) -> int:
	var found := BlockRegistry.get_id_by_name(display_name)
	return found if found >= 0 else fallback


func _generate_world() -> void:
	for cx in range(-WORLD_RADIUS, WORLD_RADIUS + 1):
		for cz in range(-WORLD_RADIUS, WORLD_RADIUS + 1):
			for cy in WORLD_HEIGHT_CHUNKS:
				var chunk := Chunk.new()
				chunk.setup(self, Vector3i(cx, cy, cz))
				add_child(chunk)
				chunks[Vector3i(cx, cy, cz)] = chunk
				_fill_terrain(chunk)

	# Trees on the surface, then a single mesh build pass per chunk.
	_plant_trees()
	for key in chunks:
		chunks[key].rebuild()


func _fill_terrain(chunk: Chunk) -> void:
	var base := chunk.chunk_pos * CHUNK_SIZE
	for z in CHUNK_SIZE:
		for x in CHUNK_SIZE:
			var gx := base.x + x
			var gz := base.z + z
			var h := _height_at(gx, gz)
			for y in CHUNK_SIZE:
				var gy := base.y + y
				var id := BlockRegistry.AIR
				if gy < h - 4:
					id = id_stone
				elif gy < h - 1:
					id = id_dirt
				elif gy == h - 1:
					id = id_grass if h > 4 else id_sand
				if id != BlockRegistry.AIR:
					chunk.blocks[chunk.index(x, y, z)] = id


func _height_at(gx: int, gz: int) -> int:
	var n := _noise.get_noise_2d(float(gx), float(gz))
	return int(12.0 + n * 10.0)


func _plant_trees() -> void:
	var span := WORLD_RADIUS * CHUNK_SIZE
	for gx in range(-span + 2, span - 2):
		for gz in range(-span + 2, span - 2):
			if _tree_noise.get_noise_2d(float(gx), float(gz)) < 0.62:
				continue
			# Deterministic sparse placement: hash-ish check on coordinates.
			if (abs(gx * 73856093) ^ abs(gz * 19349663)) % 23 != 0:
				continue
			var h := _height_at(gx, gz)
			if h < 6:
				continue
			_grow_tree(gx, h, gz)


func _grow_tree(gx: int, gy: int, gz: int) -> void:
	var trunk_h: int = 4 + ((absi(gx) + absi(gz)) % 3)
	for i in trunk_h:
		_set_block_silent(Vector3i(gx, gy + i, gz), id_log)
	var crown_base: int = gy + trunk_h - 2
	for dy in range(0, 3):
		var radius := 2 if dy < 2 else 1
		for dx in range(-radius, radius + 1):
			for dz in range(-radius, radius + 1):
				if dx == 0 and dz == 0 and dy < 2:
					continue
				if abs(dx) == radius and abs(dz) == radius and dy < 2:
					continue  # round off corners
				var p := Vector3i(gx + dx, crown_base + dy, gz + dz)
				if BlockRegistry.is_air(get_block_global(p)):
					_set_block_silent(p, id_leaves)
	_set_block_silent(Vector3i(gx, crown_base + 3, gz), id_leaves)


# ---------- Global block access ----------

func chunk_coord(v: int) -> int:
	return int(floor(float(v) / float(CHUNK_SIZE)))


func get_block_global(gp: Vector3i) -> int:
	var cc := Vector3i(chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z))
	if not chunks.has(cc):
		return BlockRegistry.AIR
	var local := gp - cc * CHUNK_SIZE
	return chunks[cc].get_block(local.x, local.y, local.z)


func set_block_global(gp: Vector3i, id: int) -> void:
	var cc := Vector3i(chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z))
	if not chunks.has(cc):
		return
	var local := gp - cc * CHUNK_SIZE
	chunks[cc].set_block(local.x, local.y, local.z)
	# Rebuild border neighbors so their culled faces update.
	var neighbors: Array[Vector3i] = []
	if local.x == 0:
		neighbors.append(cc + Vector3i(-1, 0, 0))
	if local.x == CHUNK_SIZE - 1:
		neighbors.append(cc + Vector3i(1, 0, 0))
	if local.y == 0:
		neighbors.append(cc + Vector3i(0, -1, 0))
	if local.y == CHUNK_SIZE - 1:
		neighbors.append(cc + Vector3i(0, 1, 0))
	if local.z == 0:
		neighbors.append(cc + Vector3i(0, 0, -1))
	if local.z == CHUNK_SIZE - 1:
		neighbors.append(cc + Vector3i(0, 0, 1))
	for ncc in neighbors:
		if chunks.has(ncc):
			chunks[ncc].rebuild()
	block_changed.emit(gp, id)


func _set_block_silent(gp: Vector3i, id: int) -> void:
	## Writes block data without rebuilding (used during generation).
	var cc := Vector3i(chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z))
	if not chunks.has(cc):
		return
	var local := gp - cc * CHUNK_SIZE
	var chunk: Chunk = chunks[cc]
	chunk.blocks[chunk.index(local.x, local.y, local.z)] = id


func find_spawn() -> Vector3:
	var h := _height_at(0, 0)
	return Vector3(0.5, float(h) + 2.0, 0.5)
