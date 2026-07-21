class_name VoxelWorld
extends Node3D
## Owns all chunks: deterministic seeded terrain generation (biomes, rivers,
## caves, ores, trees), chunk streaming around the player, the player edit
## journal (save/load), and the shared chunk materials.

const CHUNK_SIZE := 16
const WORLD_HEIGHT_CHUNKS := 3
const WORLD_HEIGHT := CHUNK_SIZE * WORLD_HEIGHT_CHUNKS  # 48
const RENDER_RADIUS := 3          # chunks in each horizontal direction (7x7 columns)
const UNLOAD_MARGIN := 1          # extra ring kept before unloading
const SEA_LEVEL := 10
const LOADS_PER_FRAME := 2        # streaming budget
const REBUILDS_PER_FRAME := 4     # mesh rebuild budget (neighbor fixes are deferred)

enum Biome { PLAINS, FOREST, DESERT, COLD }
const BIOME_NAMES := ["Plains", "Forest", "Desert", "Tundra"]

const DIRS6: Array[Vector3i] = [
	Vector3i(1, 0, 0), Vector3i(-1, 0, 0),
	Vector3i(0, 1, 0), Vector3i(0, -1, 0),
	Vector3i(0, 0, 1), Vector3i(0, 0, -1),
]

signal block_changed(global_pos: Vector3i, id: int)

@export var world_seed := 1337

var chunks: Dictionary = {}       # Vector3i -> Chunk
var chunk_material: StandardMaterial3D
var water_material: StandardMaterial3D
var player: Node3D                # assigned by main.gd (drives streaming)
var started := false

# Terrain noise fields (all seeded from world_seed in _seed_noises()).
var _noise := FastNoiseLite.new()        # continents
var _hill_noise := FastNoiseLite.new()   # local relief
var _temp_noise := FastNoiseLite.new()   # biome temperature
var _moist_noise := FastNoiseLite.new()  # biome moisture
var _river_noise := FastNoiseLite.new()  # river channels
var _cave_noise := FastNoiseLite.new()   # 3D caves
var _patch_noise := FastNoiseLite.new()  # seafloor patches
var _ore_coal := FastNoiseLite.new()
var _ore_copper := FastNoiseLite.new()
var _ore_iron := FastNoiseLite.new()
var _ore_mana := FastNoiseLite.new()

# Player edit journal: "x,y,z" -> block id. Reapplied on chunk (re)generation.
var _edits: Dictionary = {}

# Streaming state.
var _last_player_chunk := Vector3i(0, 0, 0)
var _load_queue: Array[Vector3i] = []
var _queued: Dictionary = {}

# Cached registry ids (fallbacks match VoxelRegistry.json numeric ids).
var id_grass := 1
var id_dirt := 2
var id_stone := 3
var id_sand := 4
var id_gravel := 5
var id_clay := 6
var id_water := 7
var id_log := 9
var id_leaves := 10
var id_coal := 17
var id_copper := 18
var id_iron := 19
var id_mana := 20
var id_snow := 54


func _ready() -> void:
	_resolve_ids()
	chunk_material = StandardMaterial3D.new()
	chunk_material.vertex_color_use_as_albedo = true
	chunk_material.roughness = 0.9
	chunk_material.metallic = 0.0

	water_material = StandardMaterial3D.new()
	water_material.vertex_color_use_as_albedo = true
	water_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	water_material.cull_mode = BaseMaterial3D.CULL_DISABLED
	water_material.albedo_color = Color(1, 1, 1, 0.85)
	water_material.roughness = 0.15


func _resolve_ids() -> void:
	id_grass = _id_or("Grass Block", 1)
	id_dirt = _id_or("Dirt Block", 2)
	id_stone = _id_or("Stone Block", 3)
	id_sand = _id_or("Sand Block", 4)
	id_gravel = _id_or("Gravel Block", 5)
	id_clay = _id_or("Clay Block", 6)
	id_water = _id_or("Water Block", 7)
	id_log = _id_or("Oak Log", 9)
	id_leaves = _id_or("Oak Leaves", 10)
	id_coal = _id_or("Coal Ore", 17)
	id_copper = _id_or("Copper Ore", 18)
	id_iron = _id_or("Iron Ore", 19)
	id_mana = _id_or("Mana Crystal Ore", 20)
	id_snow = _id_or("Snow Block", 54)


func _id_or(display_name: String, fallback: int) -> int:
	var found := BlockRegistry.get_id_by_name(display_name)
	return found if found >= 0 else fallback


# ---------- Startup ----------

func start(p_seed: int) -> void:
	## Called once by main.gd after the seed is known (save or default).
	if started:
		return
	started = true
	world_seed = p_seed
	_seed_noises()
	# Generate the initial area synchronously so frame 1 has ground.
	for dx in range(-RENDER_RADIUS, RENDER_RADIUS + 1):
		for dz in range(-RENDER_RADIUS, RENDER_RADIUS + 1):
			for cy in WORLD_HEIGHT_CHUNKS:
				_generate_chunk(Vector3i(dx, cy, dz), false)
	# Single border-consistent rebuild pass now that all neighbors exist.
	for key in chunks:
		chunks[key].rebuild()
	print("VoxelWorld: seed %d, generated %d chunks" % [world_seed, chunks.size()])


func _seed_noises() -> void:
	_noise.seed = world_seed
	_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	_noise.frequency = 0.008
	_noise.fractal_octaves = 4

	_hill_noise.seed = world_seed + 1
	_hill_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	_hill_noise.frequency = 0.035
	_hill_noise.fractal_octaves = 3

	_temp_noise.seed = world_seed + 2
	_temp_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_temp_noise.frequency = 0.006

	_moist_noise.seed = world_seed + 3
	_moist_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_moist_noise.frequency = 0.007

	_river_noise.seed = world_seed + 4
	_river_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_river_noise.frequency = 0.008

	_cave_noise.seed = world_seed + 5
	_cave_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_cave_noise.frequency = 0.08
	_cave_noise.fractal_octaves = 2

	_patch_noise.seed = world_seed + 10
	_patch_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_patch_noise.frequency = 0.06

	for i in 4:
		var ore: FastNoiseLite = [_ore_coal, _ore_copper, _ore_iron, _ore_mana][i]
		ore.seed = world_seed + 6 + i
		ore.noise_type = FastNoiseLite.TYPE_SIMPLEX
		ore.frequency = 0.12


# ---------- Streaming ----------

func _process(_delta: float) -> void:
	if not started:
		return
	if player != null:
		var pc := Vector3i(
			chunk_coord(floori(player.global_position.x)), 0,
			chunk_coord(floori(player.global_position.z)))
		if pc != _last_player_chunk:
			_last_player_chunk = pc
			_update_streaming(pc)
	var budget := LOADS_PER_FRAME
	while budget > 0 and not _load_queue.is_empty():
		var cc: Vector3i = _load_queue.pop_front()
		_queued.erase(cc)
		if chunks.has(cc):
			continue
		if _column_distance(cc, _last_player_chunk) > RENDER_RADIUS:
			continue  # player moved on before we got here
		_generate_chunk(cc, true)
		budget -= 1


func _update_streaming(pc: Vector3i) -> void:
	# Queue missing chunks, nearest first.
	var wanted: Array[Vector3i] = []
	for dx in range(-RENDER_RADIUS, RENDER_RADIUS + 1):
		for dz in range(-RENDER_RADIUS, RENDER_RADIUS + 1):
			for cy in WORLD_HEIGHT_CHUNKS:
				var cc := Vector3i(pc.x + dx, cy, pc.z + dz)
				if not chunks.has(cc) and not _queued.has(cc):
					wanted.append(cc)
	wanted.sort_custom(func(a: Vector3i, b: Vector3i) -> bool:
		return _column_distance(a, pc) < _column_distance(b, pc))
	for cc in wanted:
		_load_queue.append(cc)
		_queued[cc] = true
	# Unload chunks beyond radius + margin.
	var to_remove: Array[Vector3i] = []
	for key in chunks:
		if _column_distance(key, pc) > RENDER_RADIUS + UNLOAD_MARGIN:
			to_remove.append(key)
	for key in to_remove:
		chunks[key].queue_free()
		chunks.erase(key)


func _column_distance(a: Vector3i, b: Vector3i) -> int:
	return maxi(absi(a.x - b.x), absi(a.z - b.z))


func _generate_chunk(cc: Vector3i, with_neighbors: bool) -> void:
	var chunk := Chunk.new()
	chunk.setup(self, cc)
	chunks[cc] = chunk
	add_child(chunk)
	_fill_chunk(chunk)
	if with_neighbors:
		chunk.rebuild()
		# Rebuild loaded neighbors so shared border faces cull correctly.
		for off in DIRS6:
			var nb := cc + off
			if chunks.has(nb):
				chunks[nb].rebuild()


# ---------- Terrain generation (pure functions of seed + coordinates) ----------

func _biome_at(gx: int, gz: int) -> int:
	var t := _temp_noise.get_noise_2d(float(gx), float(gz))
	var m := _moist_noise.get_noise_2d(float(gx), float(gz))
	if t < -0.35:
		return Biome.COLD
	if t > 0.3 and m < -0.1:
		return Biome.DESERT
	if m > 0.2:
		return Biome.FOREST
	return Biome.PLAINS


func biome_name_at(x: float, z: float) -> String:
	return BIOME_NAMES[_biome_at(floori(x), floori(z))]


func _height_at(gx: int, gz: int) -> int:
	var c := _noise.get_noise_2d(float(gx), float(gz))
	var h := 16.0 + c * 9.0 + _hill_noise.get_noise_2d(float(gx), float(gz)) * 3.5
	if _biome_at(gx, gz) == Biome.COLD:
		h += maxf(0.0, c) * 12.0  # tundra mountains
	# Rivers: meandering channels pulled below sea level.
	var r := absf(_river_noise.get_noise_2d(float(gx), float(gz)))
	if r < 0.10:
		var t := 1.0 - r / 0.10
		h = lerpf(h, float(SEA_LEVEL - 5), t * t * 0.95)
	return clampi(int(h), 3, WORLD_HEIGHT - 4)


func _fill_chunk(chunk: Chunk) -> void:
	var base: Vector3i = chunk.chunk_pos * CHUNK_SIZE
	for z in CHUNK_SIZE:
		for x in CHUNK_SIZE:
			var gx := base.x + x
			var gz := base.z + z
			var h := _height_at(gx, gz)
			var biome := _biome_at(gx, gz)
			for y in CHUNK_SIZE:
				var gy := base.y + y
				var id := _block_at(gx, gy, gz, h, biome)
				if id != BlockRegistry.AIR:
					chunk.blocks[chunk.index(x, y, z)] = id
	_stamp_trees(chunk)
	_apply_journal_to_chunk(chunk)


func _block_at(gx: int, gy: int, gz: int, h: int, biome: int) -> int:
	# Above terrain: water up to sea level, air otherwise.
	if gy >= h:
		return id_water if gy < SEA_LEVEL else BlockRegistry.AIR
	# Caves: carved only inside the stone body, never breaching the surface skin.
	if gy >= 3 and gy <= h - 4:
		if _cave_noise.get_noise_3d(float(gx), float(gy), float(gz)) > 0.6:
			return BlockRegistry.AIR
	var depth := h - 1 - gy  # 0 = surface block
	if depth == 0:
		return _surface_block(biome, h, gx, gz)
	if depth <= 3:
		return _filler_block(biome, h)
	# Stone body with ore veins.
	if gy <= 36 and _ore_coal.get_noise_3d(float(gx), float(gy), float(gz)) > 0.70:
		return id_coal
	if gy <= 24 and _ore_copper.get_noise_3d(float(gx), float(gy), float(gz)) > 0.72:
		return id_copper
	if gy <= 16 and _ore_iron.get_noise_3d(float(gx), float(gy), float(gz)) > 0.74:
		return id_iron
	if gy <= 8 and _ore_mana.get_noise_3d(float(gx), float(gy), float(gz)) > 0.80:
		return id_mana
	return id_stone


func _surface_block(biome: int, h: int, gx: int, gz: int) -> int:
	if h < SEA_LEVEL:
		# Underwater floor: clay/sand/gravel patches.
		var p := _patch_noise.get_noise_2d(float(gx), float(gz))
		if p < -0.25:
			return id_clay
		if p < 0.3:
			return id_sand
		return id_gravel
	match biome:
		Biome.DESERT:
			return id_sand
		Biome.COLD:
			if h >= 30:
				return id_stone
			if h >= 24:
				return id_snow
			return id_grass
		_:
			return id_grass


func _filler_block(biome: int, h: int) -> int:
	if biome == Biome.DESERT or h < SEA_LEVEL:
		return id_sand
	return id_dirt


# ---------- Trees (deterministic per-column, streaming-safe) ----------

func _hash2(x: int, z: int) -> int:
	var n := x * 374761393 + z * 668265263 + world_seed * 2246822519
	n = (n ^ (n >> 13)) * 1274126177
	return absi(n ^ (n >> 16)) % 100000


func _trunk_height_at(gx: int, gz: int) -> int:
	## Returns trunk height (0 = no tree here). Pure function of seed + coords.
	var biome := _biome_at(gx, gz)
	if biome != Biome.FOREST and biome != Biome.PLAINS:
		return 0
	if _height_at(gx, gz) <= SEA_LEVEL + 1:
		return 0
	var threshold := 1600 if biome == Biome.FOREST else 250  # 1.6% / 0.25%
	if _hash2(gx, gz) >= threshold:
		return 0
	return 4 + _hash2(gx + 7919, gz - 104729) % 3


func _stamp_trees(chunk: Chunk) -> void:
	var base: Vector3i = chunk.chunk_pos * CHUNK_SIZE
	# Scan a 2-block margin: trunks outside the chunk can drop canopy inside it.
	for lx in range(-2, CHUNK_SIZE + 2):
		for lz in range(-2, CHUNK_SIZE + 2):
			var gx := base.x + lx
			var gz := base.z + lz
			var trunk := _trunk_height_at(gx, gz)
			if trunk == 0:
				continue
			var ground := _height_at(gx, gz)
			_stamp_tree(chunk, gx, ground, gz, trunk)


func _stamp_tree(chunk: Chunk, gx: int, gy: int, gz: int, trunk: int) -> void:
	var base: Vector3i = chunk.chunk_pos * CHUNK_SIZE
	var write := func(x: int, y: int, z: int, id: int, only_air: bool) -> void:
		var lx := x - base.x
		var ly := y - base.y
		var lz := z - base.z
		if lx < 0 or ly < 0 or lz < 0 or lx >= CHUNK_SIZE or ly >= CHUNK_SIZE or lz >= CHUNK_SIZE:
			return
		var i := chunk.index(lx, ly, lz)
		if only_air and chunk.blocks[i] != BlockRegistry.AIR:
			return
		chunk.blocks[i] = id
	# Trunk.
	for i in trunk:
		write.call(gx, gy + i, gz, id_log, false)
	# Canopy.
	var crown_base := gy + trunk - 2
	for dy in range(0, 3):
		var radius := 2 if dy < 2 else 1
		for dx in range(-radius, radius + 1):
			for dz in range(-radius, radius + 1):
				if dx == 0 and dz == 0 and dy < 2:
					continue
				if abs(dx) == radius and abs(dz) == radius and dy < 2:
					continue  # round off corners
				write.call(gx + dx, crown_base + dy, gz + dz, id_leaves, true)
	write.call(gx, crown_base + 3, gz, id_leaves, true)


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
	_edits[_edit_key(gp)] = id  # journal first so streaming/save stays lossless
	var local := gp - cc * CHUNK_SIZE
	chunks[cc].set_block(local.x, local.y, local.z, id)
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


# ---------- Edit journal (save/load) ----------

func _edit_key(gp: Vector3i) -> String:
	return "%d,%d,%d" % [gp.x, gp.y, gp.z]


func _key_to_pos(key: String) -> Vector3i:
	var parts := key.split(",")
	return Vector3i(int(parts[0]), int(parts[1]), int(parts[2]))


func _apply_journal_to_chunk(chunk: Chunk) -> void:
	if _edits.is_empty():
		return
	var base: Vector3i = chunk.chunk_pos * CHUNK_SIZE
	for key in _edits:
		var gp := _key_to_pos(key)
		if gp.x < base.x or gp.x >= base.x + CHUNK_SIZE:
			continue
		if gp.y < base.y or gp.y >= base.y + CHUNK_SIZE:
			continue
		if gp.z < base.z or gp.z >= base.z + CHUNK_SIZE:
			continue
		chunk.blocks[chunk.index(gp.x - base.x, gp.y - base.y, gp.z - base.z)] = int(_edits[key])


func serialize_edits() -> Dictionary:
	return _edits.duplicate()


func apply_edits(edits: Dictionary) -> void:
	for key in edits:
		_edits[key] = int(edits[key])
	if edits.is_empty():
		return
	# Apply to already-loaded chunks, then rebuild once.
	for key in edits:
		var gp := _key_to_pos(key)
		var cc := Vector3i(chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z))
		if chunks.has(cc):
			var local := gp - cc * CHUNK_SIZE
			chunks[cc].blocks[chunks[cc].index(local.x, local.y, local.z)] = int(edits[key])
	for cc in chunks:
		chunks[cc].rebuild()


# ---------- Spawn ----------

func find_spawn() -> Vector3:
	# Spiral out from origin for dry land.
	for r in range(0, 96, 4):
		for a in range(0, 360, 45):
			var gx := int(float(r) * cos(deg_to_rad(float(a))))
			var gz := int(float(r) * sin(deg_to_rad(float(a))))
			var h := _height_at(gx, gz)
			if h > SEA_LEVEL + 1:
				return Vector3(float(gx) + 0.5, float(h) + 2.0, float(gz) + 0.5)
	return Vector3(0.5, float(WORLD_HEIGHT) - 2.0, 0.5)
