class_name VoxelWorld
extends Node3D
## Owns all chunks: deterministic seeded terrain generation (biomes, rivers,
## caves, ores, trees), chunk streaming around the player, the player edit
## journal (save/load), and the shared chunk materials.

const ValleyPlanScript = preload("res://scripts/world/valley_plan.gd")
const WorldStructurePlannerScript = preload(
	"res://scripts/world/world_structure_planner.gd")
const ChunkMesherScript = preload("res://scripts/world/chunk_mesher.gd")
const WorldItemDropScript = preload("res://scripts/world/world_item_drop.gd")
const AutomationSystemScript = preload("res://scripts/world/automation_system.gd")
const MagicSystemScript = preload("res://scripts/world/magic_system.gd")

const CHUNK_SIZE := 16
const WORLD_HEIGHT_CHUNKS := 3
const WORLD_HEIGHT := CHUNK_SIZE * WORLD_HEIGHT_CHUNKS  # 48
const RENDER_RADIUS := 3          # chunks in each horizontal direction (7x7 columns)
const UNLOAD_MARGIN := 1          # extra ring kept before unloading
const SEA_LEVEL := 10
const LOADS_PER_FRAME := 1        # generation is synchronous and tightly bounded
const REBUILDS_PER_FRAME := 1     # one background mesh job at a time
const MAX_REBUILD_BACKLOG := 12   # generation pauses while meshing catches up
const WORLDGEN_VERSION := 5       # Living-settlement regional generation
const REGIONAL_WORLDGEN_VERSION := 4 # Regional plan-v3 compatibility
const PRIOR_WORLDGEN_VERSION := 3 # Randomized controlled-valley compatibility
const LEGACY_WORLDGEN_VERSION := 2
const SPAWN_SAMPLE_RADIUS := 4    # include the full immediate landing area
const SPAWN_HEIGHT_CLEARANCE := 4 # air gap above its highest terrain column
const LOCAL_RECOVERY_RADIUS := 8  # search around the player before using spawn
const RECOVERY_SPACE_SIZE := 2    # two wide, deep, and high air cells

enum Biome { PLAINS, FOREST, DESERT, COLD }
const BIOME_NAMES := ["Plains", "Forest", "Desert", "Tundra"]

const DIRS6: Array[Vector3i] = [
	Vector3i(1, 0, 0), Vector3i(-1, 0, 0),
	Vector3i(0, 1, 0), Vector3i(0, -1, 0),
	Vector3i(0, 0, 1), Vector3i(0, 0, -1),
]

signal block_changed(global_pos: Vector3i, id: int)
signal item_drop_picked_up(stack: Dictionary)

@export var world_seed := 1337

var chunks: Dictionary = {}       # Vector3i -> Chunk
var chunk_material: Material
var water_material: StandardMaterial3D
var glass_material: StandardMaterial3D
var block_colors := PackedColorArray()
var block_shapes := PackedByteArray()
var block_transparency := PackedByteArray()
var block_item_connectors := PackedByteArray()
var material_layers := PackedInt32Array()
var forge_face_layers := PackedInt32Array()
var forge_mesh_arrays: Dictionary = {}
var player: Node3D                # assigned by main.gd (drives streaming)
var started := false
var valley_plan: RefCounted
var active_worldgen_version := LEGACY_WORLDGEN_VERSION
var render_radius := RENDER_RADIUS
var unload_margin := UNLOAD_MARGIN

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
var _edit_provenance: Dictionary = {}

# Streaming state.
var _last_player_chunk := Vector3i(0, 0, 0)
var _load_queue: Array[Vector3i] = []
var _queued: Dictionary = {}
var _rebuild_queue: Array[Vector3i] = []
var _rebuild_queued: Dictionary = {}
var _anchor_heights: Dictionary = {}
var _height_cache: Dictionary = {}
var _biome_cache: Dictionary = {}
var _tree_height_cache: Dictionary = {}
var _surface_bounds_cache: Dictionary = {}
var _regional_site_cache: Dictionary = {}
var _settlement_layout_cache: Dictionary = {}
var _site_runtime: Array[Dictionary] = []
var _route_runtime: Array[Dictionary] = []
var _river_runtime: Array[Dictionary] = []
var _resource_entries_cache: Array[Dictionary] = []
var _cave_entrance := Vector2.ZERO
var _cave_direction := Vector2.RIGHT
var _cave_lateral_axis := Vector2.DOWN
var _cave_chamber := Vector2.ZERO
var _cave_floor := 0.0
var _cave_bounds := Rect2()
var _resource_bounds := Rect2()
var _mesh_thread: Thread
var _mesh_worker: RefCounted
var _mesh_job_active := false
var _mesh_job_cc := Vector3i.ZERO

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
var id_planks := 11
var id_stone_brick := 31
var id_cobble := 32
var id_oak_beam := 33
var id_oak_stair := 34
var id_oak_slab := 35
var id_oak_door := 36
var id_workbench := 23
var id_furnace := 24
var id_mana_furnace := 25
var id_chest := 26
var id_warehouse := 27
var id_crate := 80
var id_chute := 29
var id_crank := 96
var id_mechanical_miner := 309
var id_warehouse_hatch := 310
var id_torch := 46
var id_blueprint_marker := 114
var id_supply_crate := 116
var id_bed := 68
var id_dirt_path := 72
var id_rune_table := 30
var id_ward_lantern := 46
var id_mana_conduit := 47
var id_mana_battery := 98
var id_portal_frame := 108
var id_corrupted_ground := 109
var id_broken_portal := 139

# Persistent functional-block state. Keys use the same stable position format
# as the edit journal, while stack contents use stable identities on save.
var _furnaces: Dictionary = {}
var _chests: Dictionary = {}
var _double_slabs: Dictionary = {}
var _block_orientations: Dictionary = {}
var _doors: Dictionary = {}
var _door_parts: Dictionary = {}
var door_last_error := ""
var _furnace_accumulator := 0.0
var _item_drops: Array[Node] = []
var _next_drop_serial := 1
var _forge_presentation_root: Node3D
var _forge_world_presentations: Dictionary = {}
var automation: AutomationSystem
var magic


func _ready() -> void:
	_resolve_ids()
	automation = AutomationSystemScript.new()
	automation.setup(self)
	magic = MagicSystemScript.new()
	magic.setup(self)
	_build_block_color_table()
	_build_block_shape_table()
	_build_shared_block_material()
	_forge_presentation_root = Node3D.new()
	_forge_presentation_root.name = "ForgeWorldPresentations"
	add_child(_forge_presentation_root)

	water_material = StandardMaterial3D.new()
	water_material.vertex_color_use_as_albedo = true
	water_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS
	water_material.cull_mode = BaseMaterial3D.CULL_BACK
	water_material.albedo_color = Color(0.82, 0.96, 1.0, 0.76)
	water_material.roughness = 0.15
	glass_material = StandardMaterial3D.new()
	glass_material.vertex_color_use_as_albedo = true
	glass_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS
	glass_material.cull_mode = BaseMaterial3D.CULL_BACK
	glass_material.albedo_color = Color(1.0, 1.0, 1.0, 0.72)
	glass_material.roughness = 0.08


func _build_block_color_table() -> void:
	var maximum_id := 0
	for id in BlockRegistry.get_all_ids():
		maximum_id = maxi(maximum_id, int(id))
	block_colors.resize(maximum_id + 1)
	for id in BlockRegistry.get_all_ids():
		var color := BlockRegistry.get_color(int(id))
		if BlockRegistry.is_transparent(int(id)):
			color.a = 0.34
		block_colors[int(id)] = color


func _build_block_shape_table() -> void:
	block_shapes.resize(block_colors.size())
	block_transparency.resize(block_colors.size())
	block_item_connectors.resize(block_colors.size())
	material_layers.resize(block_colors.size())
	forge_face_layers.resize(block_colors.size() * 6)
	forge_mesh_arrays.clear()
	for id in BlockRegistry.get_all_ids():
		var numeric_id := int(id)
		material_layers[numeric_id] = numeric_id
		for face_index in 6:
			forge_face_layers[numeric_id * 6 + face_index] = numeric_id
		block_transparency[numeric_id] = 1 \
			if BlockRegistry.is_transparent(numeric_id) else 0
		var stable_id := BlockRegistry.get_stable_id(numeric_id)
		block_item_connectors[numeric_id] = 1 if (
			"transport.chute" in stable_id
			or "furnace" in stable_id
			or "chest" in stable_id
			or "crate" in stable_id
			or "warehouse_input_hatch" in stable_id
			or "basic_miner" in stable_id
		) else 0
		match BlockRegistry.get_shape(numeric_id):
			"slab":
				block_shapes[numeric_id] = 1
			"stair":
				block_shapes[numeric_id] = 2
			"furnace":
				block_shapes[numeric_id] = 3
			"chest":
				block_shapes[numeric_id] = 4
			"chute":
				block_shapes[numeric_id] = 5
			"door":
				block_shapes[numeric_id] = 6
			"workbench":
				block_shapes[numeric_id] = 7
			"post":
				block_shapes[numeric_id] = 8
			"forge":
				block_shapes[numeric_id] = 9
				if has_node("/root/ForgeRuntime"):
					var arrays := ForgeRuntime.mesh_arrays(stable_id)
					if not arrays.is_empty():
						forge_mesh_arrays[numeric_id] = {
							"vertices": arrays[Mesh.ARRAY_VERTEX],
							"normals": arrays[Mesh.ARRAY_NORMAL],
							"colors": arrays[Mesh.ARRAY_COLOR],
							"uvs": arrays[Mesh.ARRAY_TEX_UV],
							"indices": arrays[Mesh.ARRAY_INDEX],
						}
			_:
				block_shapes[numeric_id] = 0
		if has_node("/root/ForgeRuntime") \
				and ForgeRuntime.uses_scene_presentation(stable_id):
			block_shapes[numeric_id] = 10


func _build_shared_block_material() -> void:
	## One replaceable 32x32 layer per registered block in a shared array keeps
	## the terrain on one material while adding readable surface variation.
	var images: Array[Image] = []
	for id in block_colors.size():
		var image := Image.create(32, 32, false, Image.FORMAT_RGBA8)
		var stable_id := BlockRegistry.get_stable_id(id)
		for y in 32:
			for x in 32:
				var hash_value := absi(
					(id + 1) * 73856093 ^ (x + 11) * 19349663 ^ (y + 17) * 83492791)
				var value := 0.82 + float(hash_value % 24) / 100.0
				if ("plank" in stable_id or "log" in stable_id or "beam" in stable_id) \
						and (x % 8 == 0 or y % 8 == 0):
					# Voxel faces use axis-local UVs. A balanced timber joint
					# pattern keeps rotated faces coherent rather than making
					# one side look as though its grain was accidentally flipped.
					value *= 0.78
				elif ("brick" in stable_id or "cobble" in stable_id) \
						and (y % 8 == 0 or (x + floori(float(y) / 8.0) * 4) % 16 == 0):
					value *= 0.76
				elif ("sand" in stable_id or "snow" in stable_id) and hash_value % 13 == 0:
					value *= 0.78
				image.set_pixel(x, y, Color(value, value, value, 1.0))
		images.append(image)
	if has_node("/root/ForgeRuntime"):
		for id in BlockRegistry.get_all_ids():
			var numeric_id := int(id)
			var paths := ForgeRuntime.surface_paths(
				BlockRegistry.get_stable_id(numeric_id))
			for face_index in ForgeSurfaceSet.FACE_KEYS.size():
				var face := ForgeSurfaceSet.FACE_KEYS[face_index]
				var path := str(paths.get(face, ""))
				if path.is_empty() or not FileAccess.file_exists(path):
					continue
				var image := Image.load_from_file(
					ProjectSettings.globalize_path(path))
				if image == null or image.is_empty():
					continue
				if image.get_width() != 32 or image.get_height() != 32:
					image.resize(32, 32, Image.INTERPOLATE_NEAREST)
				forge_face_layers[numeric_id * 6 + face_index] = images.size()
				images.append(image)
	var texture_array := Texture2DArray.new()
	var create_error := texture_array.create_from_images(images)
	if create_error != OK:
		push_error("VoxelWorld: could not create shared 32x32 material array")
		var fallback := StandardMaterial3D.new()
		fallback.vertex_color_use_as_albedo = true
		chunk_material = fallback
		return
	var shader := Shader.new()
	shader.code = """
shader_type spatial;
render_mode cull_back;
uniform sampler2DArray material_tiles : filter_nearest, repeat_enable;
void fragment() {
	vec3 detail = texture(material_tiles, vec3(UV, UV2.x)).rgb;
	ALBEDO = COLOR.rgb * detail;
	ROUGHNESS = 0.9;
	METALLIC = 0.0;
}
"""
	var material := ShaderMaterial.new()
	material.shader = shader
	material.set_shader_parameter("material_tiles", texture_array)
	chunk_material = material


func _resolve_ids() -> void:
	id_grass = _id_or("terrain.grass.basic", 1)
	id_dirt = _id_or("terrain.dirt.basic", 2)
	id_stone = _id_or("terrain.stone.basic", 3)
	id_sand = _id_or("terrain.sand.basic", 4)
	id_gravel = _id_or("terrain.gravel.basic", 5)
	id_clay = _id_or("terrain.clay.basic", 6)
	id_water = _id_or("fluid.water.flowing", 7)
	id_log = _id_or("natural.log.oak", 9)
	id_leaves = _id_or("natural.leaves.oak", 10)
	id_coal = _id_or("ore.coal.basic", 17)
	id_copper = _id_or("ore.copper.basic", 18)
	id_iron = _id_or("ore.iron.basic", 19)
	id_mana = _id_or("ore.mana_crystal.basic", 20)
	id_snow = _id_or("terrain.snow.basic", 54)
	id_planks = _id_or("construction.planks.oak", 11)
	id_stone_brick = _id_or("construction.brick.stone", 31)
	id_cobble = _id_or("construction.cobble.stone", 32)
	id_oak_beam = _id_or("construction.beam.oak", 33)
	id_oak_stair = _id_or("construction.stair.oak", 34)
	id_oak_slab = _id_or("construction.slab.oak", 35)
	id_oak_door = _id_or("construction.door.oak", 36)
	id_workbench = _id_or("functional.workbench.basic", 23)
	id_furnace = _id_or("functional.furnace.stone", 24)
	id_mana_furnace = _id_or("magic.furnace.mana", 25)
	id_chest = _id_or("storage.chest.wood", 26)
	id_warehouse = _id_or("village.warehouse.basic", 27)
	id_crate = _id_or("storage.crate.wood", 80)
	id_chute = _id_or("automation.transport.chute", 29)
	id_crank = _id_or("power.crank.basic", 96)
	id_mechanical_miner = _id_or("automation.machine.basic_miner", 309)
	id_warehouse_hatch = _id_or(
		"automation.village.warehouse_input_hatch", 310)
	id_torch = _id_or("light.torch.basic", 46)
	id_blueprint_marker = _id_or("village.blueprint_marker.basic", 114)
	id_supply_crate = _id_or("village.supply_crate.construction", 116)
	id_bed = _id_or("furniture.bed.simple", 68)
	id_dirt_path = _id_or("road.path.dirt", 72)
	id_rune_table = _id_or("magic.rune_table.basic", 30)
	id_ward_lantern = _id_or("magic.ward_lantern.basic", 46)
	id_mana_conduit = _id_or("magic.conduit.mana_basic", 47)
	id_mana_battery = _id_or("magic.battery.mana", 98)
	id_portal_frame = _id_or("magic.portal_frame.ancient", 108)
	id_corrupted_ground = _id_or("magic.corruption.ground", 109)
	id_broken_portal = _id_or("magic.portal.broken", 139)


func _id_or(stable_id: String, fallback: int) -> int:
	var found := BlockRegistry.get_id_by_stable_id(stable_id)
	return found if found >= 0 else fallback


# ---------- Startup ----------

func start(p_seed: int, generation_request: Dictionary = {}) -> void:
	## Called once by main.gd after the seed is known (save or default).
	if started:
		return
	started = true
	world_seed = p_seed
	_height_cache.clear()
	_biome_cache.clear()
	_tree_height_cache.clear()
	_surface_bounds_cache.clear()
	_regional_site_cache.clear()
	_settlement_layout_cache.clear()
	active_worldgen_version = int(generation_request.get(
		"worldgen_version", LEGACY_WORLDGEN_VERSION))
	valley_plan = (
		WorldStructurePlannerScript.new()
		if active_worldgen_version in [
			REGIONAL_WORLDGEN_VERSION, WORLDGEN_VERSION]
		else ValleyPlanScript.new())
	var plan_version := int(generation_request.get(
		"plan_version",
		WorldStructurePlannerScript.VERSION
			if active_worldgen_version == WORLDGEN_VERSION
			else WorldStructurePlannerScript.LEGACY_VERSION
				if active_worldgen_version == REGIONAL_WORLDGEN_VERSION
			else ValleyPlanScript.CURRENT_VERSION
				if active_worldgen_version == PRIOR_WORLDGEN_VERSION
				else ValleyPlanScript.VERSION))
	if active_worldgen_version not in [
			LEGACY_WORLDGEN_VERSION, PRIOR_WORLDGEN_VERSION,
			REGIONAL_WORLDGEN_VERSION, WORLDGEN_VERSION,
	]:
		push_error("VoxelWorld: unsupported worldgen version %d" % active_worldgen_version)
		started = false
		return
	valley_plan.generate(world_seed, plan_version)
	if not valley_plan.validation_errors.is_empty():
		push_error("VoxelWorld: controlled valley plan is invalid: %s" % valley_plan.validation_errors)
		started = false
		return
	_seed_noises()
	_cache_anchor_heights()
	_prepare_plan_runtime()
	# Build only the spawn column synchronously so collision exists immediately.
	# The surrounding area is generated and meshed through the frame budgets.
	var spawn := find_spawn()
	_last_player_chunk = Vector3i(chunk_coord(floori(spawn.x)), 0, chunk_coord(floori(spawn.z)))
	for cy in WORLD_HEIGHT_CHUNKS:
		_generate_chunk(Vector3i(_last_player_chunk.x, cy, _last_player_chunk.z))
	for cy in WORLD_HEIGHT_CHUNKS:
		var cc := Vector3i(_last_player_chunk.x, cy, _last_player_chunk.z)
		chunks[cc].rebuild()
		_rebuild_queue.erase(cc)
		_rebuild_queued.erase(cc)
	_update_streaming(_last_player_chunk)
	print("VoxelWorld: seed %d, plan %s, prepared spawn column" % [
		world_seed, valley_plan.identity()])


func is_regional_worldgen() -> bool:
	return active_worldgen_version in [
		REGIONAL_WORLDGEN_VERSION, WORLDGEN_VERSION]


func prepare_player_column(world_position: Vector3) -> void:
	## Ensures a loaded/saved player has collision before normal streaming resumes.
	if not started:
		return
	var pc := Vector3i(
		chunk_coord(floori(world_position.x)), 0,
		chunk_coord(floori(world_position.z)))
	_last_player_chunk = pc
	for cy in WORLD_HEIGHT_CHUNKS:
		var cc := Vector3i(pc.x, cy, pc.z)
		if not chunks.has(cc):
			_generate_chunk(cc)
	for cy in WORLD_HEIGHT_CHUNKS:
		var cc := Vector3i(pc.x, cy, pc.z)
		chunks[cc].rebuild()
		_rebuild_queue.erase(cc)
		_rebuild_queued.erase(cc)
	_update_streaming(pc)


func _seed_noises() -> void:
	_noise.seed = int(valley_plan.sub_seeds["terrain"])
	_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	_noise.frequency = 0.008
	_noise.fractal_octaves = 4

	_hill_noise.seed = ValleyPlanScript.derive_seed(world_seed, "terrain.hills")
	_hill_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	_hill_noise.frequency = 0.035
	_hill_noise.fractal_octaves = 3

	_temp_noise.seed = int(valley_plan.sub_seeds["climate"])
	_temp_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_temp_noise.frequency = 0.006

	_moist_noise.seed = ValleyPlanScript.derive_seed(world_seed, "climate.moisture")
	_moist_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_moist_noise.frequency = 0.007

	_river_noise.seed = ValleyPlanScript.derive_seed(world_seed, "terrain.minor_rivers")
	_river_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_river_noise.frequency = 0.008

	_cave_noise.seed = int(valley_plan.sub_seeds["caves"])
	_cave_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_cave_noise.frequency = 0.08
	_cave_noise.fractal_octaves = 2

	_patch_noise.seed = ValleyPlanScript.derive_seed(world_seed, "terrain.floor_patches")
	_patch_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_patch_noise.frequency = 0.06

	for i in 4:
		var ore: FastNoiseLite = [_ore_coal, _ore_copper, _ore_iron, _ore_mana][i]
		ore.seed = ValleyPlanScript.derive_seed(world_seed, "resources.ore.%d" % i)
		ore.noise_type = FastNoiseLite.TYPE_SIMPLEX
		ore.frequency = 0.12


# ---------- Streaming ----------

func _process(_delta: float) -> void:
	if not started:
		return
	if automation != null:
		automation.process(
			_delta,
			player.global_position if player != null else Vector3.ZERO)
	if magic != null:
		magic.process(
			_delta,
			player.global_position if player != null else Vector3.ZERO)
	_furnace_accumulator += _delta
	if _furnace_accumulator >= 0.25:
		_process_furnaces(_furnace_accumulator)
		_furnace_accumulator = 0.0
	var committed_mesh := _poll_rebuild_job()
	if player != null:
		var pc := Vector3i(
			chunk_coord(floori(player.global_position.x)), 0,
			chunk_coord(floori(player.global_position.z)))
		if pc != _last_player_chunk:
			_last_player_chunk = pc
			_update_streaming(pc)
	var budget := LOADS_PER_FRAME if not committed_mesh \
		and _rebuild_queue.size() < MAX_REBUILD_BACKLOG else 0
	while budget > 0 and not _load_queue.is_empty():
		var cc: Vector3i = _load_queue.pop_front()
		_queued.erase(cc)
		if chunks.has(cc):
			continue
		if _column_distance(cc, _last_player_chunk) > render_radius:
			continue  # player moved on before we got here
		_generate_chunk(cc)
		budget -= 1
	_start_rebuild_job()


func _drain_rebuild_queue(max_rebuilds: int) -> int:
	## Synchronous helper retained for startup, deterministic probes, and tools.
	## Runtime streaming uses _start_rebuild_job() so geometry builds off-thread.
	var rebuilt := 0
	while rebuilt < max_rebuilds and not _rebuild_queue.is_empty():
		var cc: Vector3i = _rebuild_queue.pop_front()
		_rebuild_queued.erase(cc)
		if not chunks.has(cc):
			continue
		chunks[cc].rebuild()
		rebuilt += 1
	return rebuilt


func _start_rebuild_job() -> void:
	if _mesh_job_active:
		return
	while not _rebuild_queue.is_empty():
		var cc: Vector3i = _rebuild_queue.pop_front()
		_rebuild_queued.erase(cc)
		if not chunks.has(cc):
			continue
		var snapshot: Dictionary = chunks[cc].create_mesh_snapshot()
		_mesh_worker = ChunkMesherScript.new()
		_mesh_thread = Thread.new()
		_mesh_job_cc = cc
		var error := _mesh_thread.start(Callable(_mesh_worker, "run").bind(snapshot))
		if error != OK:
			push_error("VoxelWorld: failed to start mesh worker for %s" % cc)
			request_chunk_rebuild(cc)
			_mesh_thread = null
			_mesh_worker = null
			return
		_mesh_job_active = true
		return


func _poll_rebuild_job() -> bool:
	if not _mesh_job_active or _mesh_thread == null or _mesh_thread.is_alive():
		return false
	var result: Variant = _mesh_thread.wait_to_finish()
	if result is Dictionary and chunks.has(_mesh_job_cc):
		chunks[_mesh_job_cc].apply_geometry(result)
	elif not (result is Dictionary):
		push_error("VoxelWorld: mesh worker returned invalid geometry for %s" % _mesh_job_cc)
	_mesh_job_active = false
	_mesh_thread = null
	_mesh_worker = null
	return true


func _exit_tree() -> void:
	if _mesh_job_active and _mesh_thread != null and _mesh_thread.is_started():
		_mesh_thread.wait_to_finish()
	_mesh_job_active = false


func _update_streaming(pc: Vector3i) -> void:
	# Queue missing chunks, nearest first.
	var wanted: Array[Vector3i] = []
	for dx in range(-render_radius, render_radius + 1):
		for dz in range(-render_radius, render_radius + 1):
			for cy in WORLD_HEIGHT_CHUNKS:
				var cc := Vector3i(pc.x + dx, cy, pc.z + dz)
				if not chunks.has(cc) and not _queued.has(cc):
					wanted.append(cc)
	wanted.sort_custom(func(a: Vector3i, b: Vector3i) -> bool:
		return _chunk_priority(a, pc) < _chunk_priority(b, pc))
	for cc in wanted:
		_load_queue.append(cc)
		_queued[cc] = true
	# Unload chunks beyond radius + margin.
	var to_remove: Array[Vector3i] = []
	for key in chunks:
		if _column_distance(key, pc) > render_radius + unload_margin:
			to_remove.append(key)
	for key in to_remove:
		_remove_forge_presentations_in_chunk(key)
		chunks[key].queue_free()
		chunks.erase(key)
		_rebuild_queue.erase(key)
		_rebuild_queued.erase(key)
	# Retained neighbors need their formerly culled boundary faces restored.
	for key in to_remove:
		for off in DIRS6:
			request_chunk_rebuild(key + off)


func _column_distance(a: Vector3i, b: Vector3i) -> int:
	return maxi(absi(a.x - b.x), absi(a.z - b.z))


func _chunk_priority(a: Vector3i, center: Vector3i) -> int:
	return _column_distance(a, center) * WORLD_HEIGHT_CHUNKS + absi(a.y - 1)


func _generate_chunk(cc: Vector3i) -> void:
	var chunk := Chunk.new()
	chunk.setup(self, cc)
	chunks[cc] = chunk
	add_child(chunk)
	_fill_chunk(chunk)
	_sync_chunk_forge_presentations(chunk)
	request_chunk_rebuild(cc)
	# Shared borders change when either side appears.
	for off in DIRS6:
		request_chunk_rebuild(cc + off)


func request_chunk_rebuild(cc: Vector3i) -> void:
	if not chunks.has(cc) or _rebuild_queued.has(cc):
		return
	_rebuild_queue.append(cc)
	_rebuild_queued[cc] = true


func apply_scalability_profile(profile: Dictionary) -> void:
	var requested_radius := clampi(
		int(profile.get("chunk_radius", RENDER_RADIUS)), 2, 4)
	if requested_radius == render_radius:
		if automation != null:
			automation.apply_scalability_profile(profile)
		if magic != null:
			magic.apply_scalability_profile(profile)
		return
	render_radius = requested_radius
	if started:
		_update_streaming(_last_player_chunk)
	if automation != null:
		automation.apply_scalability_profile(profile)
	if magic != null:
		magic.apply_scalability_profile(profile)


func runtime_counters() -> Dictionary:
	return {
		"loaded_chunks": chunks.size(),
		"queued_chunks": _load_queue.size(),
		"rebuild_backlog": _rebuild_queue.size(),
		"mesh_job_active": _mesh_job_active,
		"render_radius": render_radius,
		"edited_voxels": _edits.size(),
		"item_drops": active_item_drop_count(),
		"automation": automation.runtime_counters() \
			if automation != null else {},
		"magic": magic.runtime_counters() if magic != null else {},
	}


# ---------- Terrain generation (pure functions of seed + coordinates) ----------

func _biome_at(gx: int, gz: int) -> int:
	var key := Vector2i(gx, gz)
	if _biome_cache.has(key):
		return int(_biome_cache[key])
	var result := Biome.PLAINS
	if valley_plan != null and not is_regional_worldgen():
		var point := Vector2(gx, gz)
		if point.distance_to(Vector2(valley_plan.get_anchor("spawn"))) <= 34.0:
			_biome_cache[key] = Biome.PLAINS
			return Biome.PLAINS
		elif point.distance_to(Vector2(valley_plan.get_anchor("base_site"))) <= 22.0:
			_biome_cache[key] = Biome.PLAINS
			return Biome.PLAINS
		var hamlet_distance := point.distance_to(Vector2(valley_plan.get_anchor("hamlet")))
		if hamlet_distance <= 18.0:
			_biome_cache[key] = Biome.PLAINS
			return Biome.PLAINS
		elif hamlet_distance <= 66.0:
			_biome_cache[key] = Biome.FOREST
			return Biome.FOREST
	var t := _temp_noise.get_noise_2d(float(gx), float(gz))
	var m := _moist_noise.get_noise_2d(float(gx), float(gz))
	if t < -0.35:
		result = Biome.COLD
	elif t > 0.3 and m < -0.1:
		result = Biome.DESERT
	elif m > 0.2:
		result = Biome.FOREST
	_biome_cache[key] = result
	return result


func biome_name_at(x: float, z: float) -> String:
	if valley_plan != null and not is_regional_worldgen():
		var point := Vector2(x, z)
		if point.distance_to(Vector2(valley_plan.get_anchor("cave_entrance"))) <= 20.0:
			return "Shallow Stone Cave Approach"
		if point.distance_to(Vector2(valley_plan.get_anchor("spawn"))) <= 34.0 \
				or point.distance_to(Vector2(valley_plan.get_anchor("base_site"))) <= 22.0:
			return "Hearthplain Meadow"
		if point.distance_to(Vector2(valley_plan.get_anchor("hamlet"))) <= 66.0:
			return "Riverwood Forest Edge"
	return BIOME_NAMES[_biome_at(floori(x), floori(z))]


func _raw_height_at(gx: int, gz: int) -> float:
	var c := _noise.get_noise_2d(float(gx), float(gz))
	var h := 16.0 + c * 9.0 + _hill_noise.get_noise_2d(float(gx), float(gz)) * 3.5
	if _biome_at(gx, gz) == Biome.COLD:
		h += maxf(0.0, c) * 12.0  # tundra mountains
	# Rivers: meandering channels pulled below sea level.
	var r := absf(_river_noise.get_noise_2d(float(gx), float(gz)))
	if r < 0.10:
		var t := 1.0 - r / 0.10
		h = lerpf(h, float(SEA_LEVEL - 5), t * t * 0.95)
	return h


func _cache_anchor_heights() -> void:
	_anchor_heights.clear()
	for anchor_id in valley_plan.anchors:
		var point: Vector2i = valley_plan.get_anchor(anchor_id)
		var raw := _raw_height_at(point.x, point.y)
		_anchor_heights[anchor_id] = clampf(raw, float(SEA_LEVEL + 3), 26.0)
	_anchor_heights["water"] = float(SEA_LEVEL - 3)


func _prepare_plan_runtime() -> void:
	_site_runtime.clear()
	_route_runtime.clear()
	_river_runtime.clear()
	var cave_point := Vector2(valley_plan.get_anchor("cave_entrance"))
	var hamlet_point := Vector2(valley_plan.get_anchor("hamlet"))
	_cave_entrance = cave_point
	_cave_direction = (cave_point - hamlet_point).normalized()
	_cave_lateral_axis = Vector2(-_cave_direction.y, _cave_direction.x)
	_cave_chamber = cave_point + _cave_direction * 26.0
	_cave_floor = maxf(float(SEA_LEVEL + 1), _anchor_height("cave_entrance") - 3.0)
	var cave_min := Vector2(
		minf(_cave_entrance.x, _cave_chamber.x) - 12.0,
		minf(_cave_entrance.y, _cave_chamber.y) - 12.0)
	var cave_max := Vector2(
		maxf(_cave_entrance.x, _cave_chamber.x) + 12.0,
		maxf(_cave_entrance.y, _cave_chamber.y) + 12.0)
	_cave_bounds = Rect2(cave_min, cave_max - cave_min)

	for anchor_id in ["spawn", "hamlet", "base_site", "rune_ruin", "goblin_camp", "mana_pocket"]:
		_site_runtime.append({
			"id": anchor_id,
			"point": Vector2(valley_plan.get_anchor(anchor_id)),
			"radius": _site_radius(anchor_id),
			"height": _anchor_height(anchor_id),
		})
	for route in valley_plan.routes:
		var from_id := str(route["from"])
		var to_id := str(route["to"])
		var a := Vector2(valley_plan.get_anchor(from_id))
		var b := Vector2(valley_plan.get_anchor(to_id))
		var ab := b - a
		_route_runtime.append({
			"route": route,
			"a": a,
			"ab": ab,
			"length_squared": ab.length_squared(),
			"width": float(route["width"]),
			"from_height": _route_endpoint_height(from_id),
			"to_height": _route_endpoint_height(to_id),
		})
	for i in valley_plan.river_points.size() - 1:
		var a := Vector2(valley_plan.river_points[i])
		var b := Vector2(valley_plan.river_points[i + 1])
		var ab := b - a
		_river_runtime.append({
			"a": a,
			"ab": ab,
			"length_squared": ab.length_squared(),
		})
	_resource_entries_cache = _build_guaranteed_resource_entries()
	var mana := Vector2(valley_plan.get_anchor("mana_pocket"))
	var resource_min := mana - Vector2(5.0, 5.0)
	var resource_max := mana + Vector2(5.0, 5.0)
	for entry in _resource_entries_cache:
		var center: Vector3 = entry["p"]
		resource_min.x = minf(resource_min.x, center.x - 4.0)
		resource_min.y = minf(resource_min.y, center.z - 4.0)
		resource_max.x = maxf(resource_max.x, center.x + 4.0)
		resource_max.y = maxf(resource_max.y, center.z + 4.0)
	_resource_bounds = Rect2(resource_min, resource_max - resource_min)


func _anchor_height(anchor_id: String) -> float:
	return float(_anchor_heights.get(anchor_id, SEA_LEVEL + 4))


func _height_at(gx: int, gz: int) -> int:
	var cache_key := Vector2i(gx, gz)
	if _height_cache.has(cache_key):
		return int(_height_cache[cache_key])
	var h := _raw_height_at(gx, gz)
	if valley_plan == null:
		var legacy_height := clampi(int(h), 3, WORLD_HEIGHT - 4)
		_height_cache[cache_key] = legacy_height
		return legacy_height
	var point := Vector2(gx, gz)
	if is_regional_worldgen():
		var regional_height := _regional_height_at(point, h)
		var resolved_regional := clampi(
			roundi(regional_height), 3, WORLD_HEIGHT - 4)
		_height_cache[cache_key] = resolved_regional
		return resolved_regional

	# A soft highland rim makes the required sites read as one navigable valley.
	var valley_center := Vector2(valley_plan.get_anchor("hamlet"))
	var rim_start := float(ValleyPlanScript.VALLEY_RADIUS) * 0.72
	var rim_t := clampf((point.distance_to(valley_center) - rim_start) / 52.0, 0.0, 1.0)
	h += rim_t * rim_t * 12.0

	# Critical sites receive buildable terrain pads; their detailed structure
	# records remain anchors until the later village/structure stages.
	for site in _site_runtime:
		var radius := float(site["radius"])
		var distance := point.distance_to(site["point"])
		if distance <= radius + 5.0:
			var influence := 1.0 - smoothstep(radius, radius + 5.0, distance)
			h = lerpf(h, float(site["height"]), influence)

	# Smooth route grades between their endpoint pads, then skin them as paths.
	for runtime_route in _route_runtime:
		var a: Vector2 = runtime_route["a"]
		var ab: Vector2 = runtime_route["ab"]
		var length_squared := float(runtime_route["length_squared"])
		var route_t := clampf((point - a).dot(ab) / length_squared, 0.0, 1.0)
		var distance := point.distance_to(a + ab * route_t)
		var width := float(runtime_route["width"])
		if distance <= width + 3.0:
			var desired := lerpf(
				float(runtime_route["from_height"]),
				float(runtime_route["to_height"]),
				route_t)
			var influence := 1.0 - smoothstep(width, width + 3.0, distance)
			h = lerpf(h, desired, influence * 0.9)

	# The cave approach descends to an exposed arch; the tunnel continues into a
	# raised shoulder so its entrance cannot be erased by an unlucky terrain seed.
	var cave_relative := point - _cave_entrance
	var cave_along := cave_relative.dot(_cave_direction)
	var cave_lateral := absf(cave_relative.dot(_cave_lateral_axis))
	if cave_along >= -16.0 and cave_along < 0.0 and cave_lateral <= 7.0:
		var approach_t := (cave_along + 16.0) / 16.0
		var lateral_t := 1.0 - smoothstep(3.0, 7.0, cave_lateral)
		h = lerpf(h, _cave_floor + 1.0, approach_t * lateral_t)
	elif cave_along >= 0.0 and cave_along <= 30.0 and cave_lateral <= 11.0:
		var shoulder := _anchor_height("cave_entrance") + 5.0 - cave_lateral * 0.18
		h = maxf(h, shoulder)

	# The planned river is the guaranteed water relationship. Noise rivers remain
	# secondary landscape variation outside this corridor.
	var river_distance := _river_distance(point)
	if river_distance <= 10.0:
		var river_t := 1.0 - smoothstep(4.5, 10.0, river_distance)
		h = lerpf(h, float(SEA_LEVEL - 3), river_t)
	var resolved_height := clampi(roundi(h), 3, WORLD_HEIGHT - 4)
	_height_cache[cache_key] = resolved_height
	return resolved_height


func _regional_height_at(point: Vector2, raw_height: float) -> float:
	var h := raw_height
	var water := Vector2(valley_plan.get_anchor("water"))
	var water_distance := point.distance_to(water)
	if water_distance <= 10.0:
		var water_influence := 1.0 - smoothstep(6.0, 10.0, water_distance)
		h = lerpf(h, float(SEA_LEVEL - 3), water_influence)

	for site in _regional_sites_near_point(point):
		var type_id := str(site.get("type_id", ""))
		if type_id == "water":
			continue
		var site_point := Vector2(site["position"])
		var radius := _site_radius(type_id)
		var distance := point.distance_to(site_point)
		if distance > radius + 5.0:
			continue
		var target := clampf(
			_raw_height_at(roundi(site_point.x), roundi(site_point.y)),
			float(SEA_LEVEL + 3), 26.0)
		var influence := 1.0 - smoothstep(radius, radius + 5.0, distance)
		h = lerpf(h, target, influence)
		if type_id == "hamlet":
			var layout := _regional_settlement_layout(site)
			for child_id in ["warehouse", "watchtower_site"]:
				var child_point := Vector2(layout[child_id])
				var child_radius := _site_radius(child_id)
				var child_distance := point.distance_to(child_point)
				if child_distance > child_radius + 4.0:
					continue
				var child_target := clampf(
					_raw_height_at(
						roundi(child_point.x), roundi(child_point.y)),
					float(SEA_LEVEL + 3), 26.0)
				var child_influence := 1.0 - smoothstep(
					child_radius, child_radius + 4.0, child_distance)
				h = lerpf(h, child_target, child_influence)

	for runtime_route in _route_runtime:
		var a: Vector2 = runtime_route["a"]
		var ab: Vector2 = runtime_route["ab"]
		var length_squared := float(runtime_route["length_squared"])
		if length_squared <= 0.0001:
			continue
		var route_t := clampf(
			(point - a).dot(ab) / length_squared, 0.0, 1.0)
		var distance := point.distance_to(a + ab * route_t)
		var width := float(runtime_route["width"])
		if distance <= width + 3.0:
			var desired := lerpf(
				float(runtime_route["from_height"]),
				float(runtime_route["to_height"]),
				route_t)
			var influence := 1.0 - smoothstep(
				width, width + 3.0, distance)
			h = lerpf(h, desired, influence * 0.9)

	# The starter cave receives a guaranteed open approach. All regional cave
	# entrances still sit above the world-wide 3D cave field.
	var cave_relative := point - _cave_entrance
	var cave_along := cave_relative.dot(_cave_direction)
	var cave_lateral := absf(cave_relative.dot(_cave_lateral_axis))
	if cave_along >= -16.0 and cave_along < 0.0 and cave_lateral <= 7.0:
		var approach_t := (cave_along + 16.0) / 16.0
		var lateral_t := 1.0 - smoothstep(3.0, 7.0, cave_lateral)
		h = lerpf(h, _cave_floor + 1.0, approach_t * lateral_t)
	elif cave_along >= 0.0 and cave_along <= 30.0 and cave_lateral <= 11.0:
		var shoulder := _anchor_height("cave_entrance") + 5.0 \
			- cave_lateral * 0.18
		h = maxf(h, shoulder)
	return h


func _regional_sites_near_point(point: Vector2) -> Array[Dictionary]:
	if not is_regional_worldgen() \
			or not valley_plan.has_method("query_sites"):
		return []
	var chunk := Vector2i(
		chunk_coord(floori(point.x)), chunk_coord(floori(point.y)))
	if _regional_site_cache.has(chunk):
		return _regional_site_cache[chunk]
	var sites: Array[Dictionary] = valley_plan.query_sites(
		Rect2i(chunk - Vector2i(2, 2), Vector2i(5, 5)))
	_regional_site_cache[chunk] = sites
	return sites


func _regional_settlement_layout(site: Dictionary) -> Dictionary:
	var site_id := str(site.get("site_id", ""))
	if _settlement_layout_cache.has(site_id):
		return _settlement_layout_cache[site_id]
	var layout: Dictionary = valley_plan.settlement_layout(site)
	_settlement_layout_cache[site_id] = layout
	return layout


func _site_radius(anchor_id: String) -> float:
	return float({
		"spawn": 12.0,
		"hamlet": 18.0,
		"base_site": 11.0,
		"rune_ruin": 9.0,
		"goblin_camp": 12.0,
		"mana_pocket": 5.0,
		"cave_entrance": 8.0,
		"resource_field": 7.0,
		"warehouse": 7.0,
		"watchtower_site": 7.0,
	}.get(anchor_id, 6.0))


func _route_endpoint_height(anchor_id: String) -> float:
	if anchor_id == "water":
		return float(SEA_LEVEL + 1)
	if anchor_id == "cave_entrance":
		return _cave_floor_height() + 1.0
	return _anchor_height(anchor_id)


func _cave_floor_height() -> float:
	if _cave_floor > 0.0:
		return _cave_floor
	return maxf(float(SEA_LEVEL + 1), _anchor_height("cave_entrance") - 3.0)


func _cave_frame(point: Vector2) -> Dictionary:
	var relative := point - _cave_entrance
	return {
		"along": relative.dot(_cave_direction),
		"lateral": absf(relative.dot(_cave_lateral_axis)),
		"direction": _cave_direction,
		"lateral_axis": _cave_lateral_axis,
	}


func _segment_projection(point: Vector2, a: Vector2, b: Vector2) -> Dictionary:
	var ab := b - a
	var length_squared := ab.length_squared()
	if length_squared <= 0.0001:
		return {"distance": point.distance_to(a), "t": 0.0}
	var t := clampf((point - a).dot(ab) / length_squared, 0.0, 1.0)
	return {"distance": point.distance_to(a + ab * t), "t": t}


func _distance_to_polyline(point: Vector2, points: Array[Vector2i]) -> float:
	if valley_plan != null and points == valley_plan.river_points and not _river_runtime.is_empty():
		return _river_distance(point)
	var best := INF
	for i in points.size() - 1:
		best = minf(best, float(_segment_projection(
			point, Vector2(points[i]), Vector2(points[i + 1]))["distance"]))
	return best


func _river_distance(point: Vector2) -> float:
	var best := INF
	for segment in _river_runtime:
		var a: Vector2 = segment["a"]
		var ab: Vector2 = segment["ab"]
		var length_squared := float(segment["length_squared"])
		var t := clampf((point - a).dot(ab) / length_squared, 0.0, 1.0)
		best = minf(best, point.distance_to(a + ab * t))
	return best


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
	_stamp_valley_sites(chunk)
	_apply_journal_to_chunk(chunk)


func _block_at(gx: int, gy: int, gz: int, h: int, biome: int) -> int:
	var cave_override := _planned_cave_override(gx, gy, gz)
	if cave_override >= BlockRegistry.AIR:
		return cave_override
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
	var guaranteed_ore := _guaranteed_resource_at(gx, gy, gz)
	if guaranteed_ore > BlockRegistry.AIR:
		return guaranteed_ore
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
	var route := _route_at(Vector2(gx, gz))
	if not route.is_empty():
		return id_cobble if str(route["kind"]) in ["road", "raid_route"] else id_gravel
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


func _route_at(point: Vector2, extra_width: float = 0.0) -> Dictionary:
	if valley_plan == null:
		return {}
	for runtime_route in _route_runtime:
		var a: Vector2 = runtime_route["a"]
		var ab: Vector2 = runtime_route["ab"]
		var length_squared := float(runtime_route["length_squared"])
		var t := clampf((point - a).dot(ab) / length_squared, 0.0, 1.0)
		var distance := point.distance_to(a + ab * t)
		if distance <= float(runtime_route["width"]) + extra_width:
			return runtime_route["route"]
	return {}


func _planned_cave_override(gx: int, gy: int, gz: int) -> int:
	if valley_plan == null:
		return -1
	if is_regional_worldgen():
		return _regional_cave_override(gx, gy, gz)
	var point_2d := Vector2(gx, gz)
	if not _cave_bounds.has_point(point_2d):
		return -1
	var relative := point_2d - _cave_entrance
	var along := relative.dot(_cave_direction)
	var lateral := absf(relative.dot(_cave_lateral_axis))
	var floor_y := floori(_cave_floor - maxf(0.0, along) * 0.06)
	if along >= 0.0 and along <= 30.0 and lateral <= 3.2:
		var arch_height := 4 - floori(lateral * 0.45)
		if gy >= floor_y and gy <= floor_y + arch_height:
			return BlockRegistry.AIR
		if gy == floor_y - 1:
			return id_stone
	# A chamber at the end guarantees the tunnel opens into usable cave space.
	var dx := float(gx) - _cave_chamber.x
	var dz := float(gz) - _cave_chamber.y
	var dy := float(gy) - (_cave_floor + 1.0)
	if dx * dx / 42.0 + dz * dz / 42.0 + dy * dy / 15.0 <= 1.0:
		return BlockRegistry.AIR
	return -1


func _regional_cave_override(gx: int, gy: int, gz: int) -> int:
	var point := Vector2(gx, gz)
	for site in _regional_sites_near_point(point):
		if str(site.get("type_id", "")) != "cave_entrance":
			continue
		var entrance := Vector2(site["position"])
		var direction := Vector2.RIGHT.rotated(
			deg_to_rad(float(site.get("rotation", 0))))
		var lateral_axis := Vector2(-direction.y, direction.x)
		var relative := point - entrance
		var along := relative.dot(direction)
		var lateral := absf(relative.dot(lateral_axis))
		var floor_y := _regional_cave_floor(site) - floori(
			maxf(0.0, along) * 0.05)
		if along >= 0.0 and along <= 22.0 and lateral <= 3.2:
			var arch_height := 4 - floori(lateral * 0.45)
			if gy >= floor_y and gy <= floor_y + arch_height:
				return BlockRegistry.AIR
			if gy == floor_y - 1:
				return id_stone
		var chamber := entrance + direction * 22.0
		var dx := float(gx) - chamber.x
		var dz := float(gz) - chamber.y
		var dy := float(gy) - (float(floor_y) + 1.0)
		if dx * dx / 36.0 + dz * dz / 36.0 + dy * dy / 14.0 <= 1.0:
			return BlockRegistry.AIR
	return -1


func _regional_cave_floor(site: Dictionary) -> int:
	var point := Vector2i(site.get("position", Vector2i.ZERO))
	return floori(maxf(
		float(SEA_LEVEL + 1),
		_raw_height_at(point.x, point.y) - 3.0))


func _guaranteed_resource_at(gx: int, gy: int, gz: int) -> int:
	if valley_plan == null:
		return -1
	if not _resource_bounds.has_point(Vector2(gx, gz)):
		return -1
	var point := Vector3(gx, gy, gz)
	for entry in _resource_entries_cache:
		if point.distance_squared_to(entry["p"]) <= float(entry["r2"]):
			return int(entry["id"])
	var mana: Vector2i = valley_plan.get_anchor("mana_pocket")
	var mana_center := Vector3(mana.x, _anchor_height("mana_pocket") - 4.0, mana.y)
	if point.distance_squared_to(mana_center) <= 8.0:
		return id_mana
	return -1


func _guaranteed_resource_entries() -> Array[Dictionary]:
	if not _resource_entries_cache.is_empty():
		return _resource_entries_cache
	return _build_guaranteed_resource_entries()


func _build_guaranteed_resource_entries() -> Array[Dictionary]:
	if valley_plan == null:
		return []
	var cave_floor := _cave_floor_height()
	return [
		{"p": Vector3(_cave_entrance.x + _cave_direction.x * 18.0 + _cave_lateral_axis.x * 4.0, cave_floor + 1.0, _cave_entrance.y + _cave_direction.y * 18.0 + _cave_lateral_axis.y * 4.0), "id": id_coal, "r2": 5.0},
		{"p": Vector3(_cave_entrance.x + _cave_direction.x * 23.0 - _cave_lateral_axis.x * 7.0, cave_floor - 1.0, _cave_entrance.y + _cave_direction.y * 23.0 - _cave_lateral_axis.y * 7.0), "id": id_copper, "r2": 6.0},
		{"p": Vector3(_cave_entrance.x + _cave_direction.x * 29.0 + _cave_lateral_axis.x * 5.0, cave_floor - 3.0, _cave_entrance.y + _cave_direction.y * 29.0 + _cave_lateral_axis.y * 5.0), "id": id_iron, "r2": 6.0},
	]


# ---------- Trees (deterministic per-column, streaming-safe) ----------

func _hash2(x: int, z: int) -> int:
	var n := x * 374761393 + z * 668265263 + world_seed * 2246822519
	n = (n ^ (n >> 13)) * 1274126177
	return absi(n ^ (n >> 16)) % 100000


func _trunk_height_at(gx: int, gz: int) -> int:
	## Returns trunk height (0 = no tree here). Pure function of seed + coords.
	var cache_key := Vector2i(gx, gz)
	if _tree_height_cache.has(cache_key):
		return int(_tree_height_cache[cache_key])
	if _plan_clears_tree(Vector2(gx, gz)):
		_tree_height_cache[cache_key] = 0
		return 0
	var biome := _biome_at(gx, gz)
	if biome != Biome.FOREST and biome != Biome.PLAINS:
		_tree_height_cache[cache_key] = 0
		return 0
	if _height_at(gx, gz) <= SEA_LEVEL + 1:
		_tree_height_cache[cache_key] = 0
		return 0
	var threshold := 1600 if biome == Biome.FOREST else 250  # 1.6% / 0.25%
	if _hash2(gx, gz) >= threshold:
		_tree_height_cache[cache_key] = 0
		return 0
	var height := 4 + _hash2(gx + 7919, gz - 104729) % 3
	_tree_height_cache[cache_key] = height
	return height


func _stamp_trees(chunk: Chunk) -> void:
	var base: Vector3i = chunk.chunk_pos * CHUNK_SIZE
	var bounds := _surface_bounds_for_column(chunk.chunk_pos.x, chunk.chunk_pos.z)
	if base.y > bounds.y + 7 or base.y + CHUNK_SIZE - 1 < bounds.x:
		return
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


func _surface_bounds_for_column(cx: int, cz: int) -> Vector2i:
	var cache_key := Vector2i(cx, cz)
	if _surface_bounds_cache.has(cache_key):
		return Vector2i(_surface_bounds_cache[cache_key])
	var minimum := WORLD_HEIGHT
	var maximum := 0
	var base_x := cx * CHUNK_SIZE
	var base_z := cz * CHUNK_SIZE
	for lx in range(-2, CHUNK_SIZE + 2):
		for lz in range(-2, CHUNK_SIZE + 2):
			var height := _height_at(base_x + lx, base_z + lz)
			minimum = mini(minimum, height)
			maximum = maxi(maximum, height)
	var bounds := Vector2i(minimum, maximum)
	_surface_bounds_cache[cache_key] = bounds
	return bounds


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


# ---------- Controlled-valley structure anchors ----------

func _plan_clears_tree(point: Vector2) -> bool:
	if valley_plan == null:
		return false
	if not _route_at(point, 2.0).is_empty():
		return true
	if is_regional_worldgen():
		for site in _regional_sites_near_point(point):
			var type_id := str(site.get("type_id", ""))
			if type_id == "resource_field":
				continue
			if point.distance_to(Vector2(site["position"])) \
					<= _site_radius(type_id) + 3.0:
				return true
			if type_id == "hamlet":
				var layout := _regional_settlement_layout(site)
				for child_id in ["warehouse", "watchtower_site"]:
					if point.distance_to(Vector2(layout[child_id])) \
							<= _site_radius(child_id) + 3.0:
						return true
		return false
	if _river_distance(point) <= 11.0:
		return true
	for anchor_id in ["spawn", "hamlet", "base_site", "rune_ruin", "goblin_camp", "mana_pocket", "cave_entrance"]:
		if point.distance_to(Vector2(valley_plan.get_anchor(anchor_id))) <= _site_radius(anchor_id) + 3.0:
			return true
	return false


func _stamp_valley_sites(chunk: Chunk) -> void:
	if valley_plan == null:
		return
	if is_regional_worldgen():
		_stamp_regional_sites(chunk)
		return
	var base: Vector3i = chunk.chunk_pos * CHUNK_SIZE
	var write := func(gx: int, gy: int, gz: int, id: int) -> void:
		var lx := gx - base.x
		var ly := gy - base.y
		var lz := gz - base.z
		if lx < 0 or ly < 0 or lz < 0 or lx >= CHUNK_SIZE or ly >= CHUNK_SIZE or lz >= CHUNK_SIZE:
			return
		chunk.blocks[chunk.index(lx, ly, lz)] = id
	_stamp_hamlet(write)
	_stamp_watchtower_site(write)
	_stamp_base_site(write)
	_stamp_rune_ruin(write)
	_stamp_goblin_camp(write)
	_stamp_cave_entrance(write)
	_stamp_mana_clue(write)


func _stamp_regional_sites(chunk: Chunk) -> void:
	var base: Vector3i = chunk.chunk_pos * CHUNK_SIZE
	var write := func(gx: int, gy: int, gz: int, id: int) -> void:
		var lx := gx - base.x
		var ly := gy - base.y
		var lz := gz - base.z
		if lx < 0 or ly < 0 or lz < 0 \
				or lx >= CHUNK_SIZE or ly >= CHUNK_SIZE or lz >= CHUNK_SIZE:
			return
		chunk.blocks[chunk.index(lx, ly, lz)] = id
	var sites: Array[Dictionary] = valley_plan.query_sites(Rect2i(
		Vector2i(chunk.chunk_pos.x, chunk.chunk_pos.z), Vector2i.ONE))
	for site in sites:
		var type_id := str(site.get("type_id", ""))
		var position := Vector2i(site.get("position", Vector2i.ZERO))
		match type_id:
			"hamlet":
				var layout := _regional_settlement_layout(site)
				if active_worldgen_version == WORLDGEN_VERSION \
						and str(layout.get("initial_stage", "")) == "camp":
					_stamp_stage_b_camp(write, layout)
				else:
					_stamp_hamlet(write, layout)
					_stamp_watchtower_site(
						write, Vector2i(layout["watchtower_site"]))
			"base_site":
				_stamp_base_site(write, position)
			"rune_ruin":
				_stamp_rune_ruin(write, position, str(site["site_id"]))
			"goblin_camp":
				_stamp_goblin_camp(write, position)
			"cave_entrance":
				_stamp_cave_entrance(write, position, site)
			"mana_pocket":
				_stamp_mana_clue(write, position)
			"resource_field":
				_stamp_resource_field(write, site)


func _stamp_stage_b_camp(write: Callable, layout: Dictionary) -> void:
	var center := Vector2i(layout.get("campfire", layout["hamlet"]))
	# Every authored camp road is stamped at the current surface. The regional
	# terrain pass has already blended these corridors, so consecutive cells
	# remain traversable without a hard rectangular cut.
	for road in layout.get("roads", []):
		_stamp_settlement_road(write, road)
	var center_ground := _height_at(center.x, center.y)
	for offset in [
		Vector2i.ZERO, Vector2i.RIGHT, Vector2i.LEFT,
		Vector2i.UP, Vector2i.DOWN,
	]:
		write.call(
			center.x + offset.x, center_ground,
			center.y + offset.y, id_cobble)
	write.call(center.x, center_ground + 1, center.y, id_torch)

	var tents: Array = layout.get("tents", [])
	for tent_index in tents.size():
		var tent := Vector2i(tents[tent_index])
		var ground := _safe_structure_base(tent, 2)
		_stamp_blended_structure_pad(write, tent, Vector2i(2, 2), ground)
		for dx in range(-2, 3):
			for dz in range(-2, 3):
				write.call(tent.x + dx, ground, tent.y + dz, id_planks)
				for dy in range(1, 5):
					write.call(
						tent.x + dx, ground + dy,
						tent.y + dz, BlockRegistry.AIR)
		for corner in [
			Vector2i(-2, -2), Vector2i(2, -2),
			Vector2i(-2, 2), Vector2i(2, 2),
		]:
			for dy in range(1, 3):
				write.call(
					tent.x + corner.x, ground + dy,
					tent.y + corner.y, id_log)
		for roof_y in range(3, 5):
			var radius := 2 if roof_y == 3 else 1
			for dx in range(-radius, radius + 1):
				for dz in range(-radius, radius + 1):
					if absi(dx) == radius or absi(dz) == radius:
						write.call(
							tent.x + dx, ground + roof_y,
							tent.y + dz, id_leaves)
		write.call(
			tent.x - 1, ground + 1, tent.y,
			id_bed)
		write.call(
			tent.x + 1, ground + 1, tent.y,
			id_bed)

	var yard := Vector2i(layout.get("supply_yard", layout["warehouse"]))
	var yard_ground := _safe_structure_base(yard, 3)
	_stamp_blended_structure_pad(
		write, yard, Vector2i(3, 2), yard_ground, 2)
	for dx in range(-3, 4):
		for dz in range(-2, 3):
			write.call(yard.x + dx, yard_ground, yard.y + dz, id_dirt_path)
	write.call(yard.x - 1, yard_ground + 1, yard.y, id_crate)
	write.call(yard.x + 1, yard_ground + 1, yard.y, id_supply_crate)
	var board := Vector2i(layout["request_board"])
	write.call(
		board.x, _height_at(board.x, board.y), board.y,
		id_blueprint_marker)


func _safe_structure_base(center: Vector2i, radius: int) -> int:
	var dry_heights: Array[int] = []
	var water_height := -100000
	for dx in range(-radius, radius + 1):
		for dz in range(-radius, radius + 1):
			var gx := center.x + dx
			var gz := center.y + dz
			var height := _height_at(gx, gz)
			var block_id := get_persisted_block_id(Vector3i(gx, height, gz))
			if BlockRegistry.is_water(block_id):
				water_height = maxi(water_height, height)
			else:
				dry_heights.append(height)
	dry_heights.sort()
	var base := (
		_height_at(center.x, center.y)
		if dry_heights.is_empty()
		else dry_heights[dry_heights.size() / 2])
	if water_height > -100000:
		base = maxi(base, water_height + 1)
	return base


func _stamp_blended_structure_pad(
		write: Callable,
		center: Vector2i,
		half_size: Vector2i,
		base_elevation: int,
		apron: int = 3) -> void:
	for dx in range(-half_size.x - apron, half_size.x + apron + 1):
		for dz in range(-half_size.y - apron, half_size.y + apron + 1):
			var outside_x := maxi(0, absi(dx) - half_size.x)
			var outside_z := maxi(0, absi(dz) - half_size.y)
			var distance := maxi(outside_x, outside_z)
			if distance > apron:
				continue
			var gx := center.x + dx
			var gz := center.y + dz
			var surface := _height_at(gx, gz)
			var influence := apron - distance + 1
			var target := clampi(
				base_elevation,
				surface - influence,
				surface + influence)
			if distance == 0:
				target = base_elevation
			if surface < target:
				for y in range(surface + 1, target + 1):
					write.call(gx, y, gz, id_dirt)
			elif surface > target:
				for y in range(target + 1, surface + 1):
					write.call(gx, y, gz, BlockRegistry.AIR)
			if distance == 0:
				# Reserve a dry logical volume around walls and over the roof.
				for y in range(target + 1, target + 7):
					write.call(gx, y, gz, BlockRegistry.AIR)


func _stamp_hamlet(write: Callable, layout: Dictionary = {}) -> void:
	var hamlet: Vector2i = (
		Vector2i(layout["hamlet"])
		if not layout.is_empty()
		else valley_plan.get_anchor("hamlet"))
	var ground := _height_at(hamlet.x, hamlet.y)
	var rotation := int(layout.get("rotation", 0))
	var forward := Vector2i(roundi(cos(deg_to_rad(float(rotation)))),
		roundi(sin(deg_to_rad(float(rotation)))))
	var right := Vector2i(-forward.y, forward.x)
	var variant := str(layout.get("variant_id", "crossroads"))
	for step in range(-8, 9):
		var main_point := hamlet + forward * step
		write.call(main_point.x, ground - 1, main_point.y, id_cobble)
		write.call(
			main_point.x + right.x, ground - 1,
			main_point.y + right.y, id_cobble)
		if variant in ["crossroads", "fork", "ring"] and absi(step) <= 5:
			var cross_point := hamlet + right * step
			write.call(cross_point.x, ground - 1, cross_point.y, id_cobble)
			write.call(
				cross_point.x + forward.x, ground - 1,
				cross_point.y + forward.y, id_cobble)
	if variant == "ring":
		for dx in range(-6, 7):
			for dz in range(-6, 7):
				if maxi(absi(dx), absi(dz)) == 6:
					write.call(
						hamlet.x + dx, ground - 1, hamlet.y + dz, id_gravel)
	if not layout.is_empty():
		for road in layout.get("roads", []):
			_stamp_settlement_road(write, road)
	var warehouse: Vector2i = (
		Vector2i(layout["warehouse"])
		if not layout.is_empty()
		else valley_plan.get_anchor("warehouse"))
	var warehouse_ground := (
		_height_at(warehouse.x, warehouse.y)
		if not layout.is_empty() else ground)
	for dx in range(-3, 4):
		for dz in range(-2, 3):
			write.call(
				warehouse.x + dx, warehouse_ground,
				warehouse.y + dz, id_planks)
			if absi(dx) == 3 or absi(dz) == 2:
				write.call(
					warehouse.x + dx, warehouse_ground + 1,
					warehouse.y + dz, id_oak_beam)
	for dx in [-3, 3]:
		for dz in [-2, 2]:
			for dy in range(1, 4):
				write.call(
					warehouse.x + dx, warehouse_ground + dy,
					warehouse.y + dz, id_log)
	write.call(
		warehouse.x, warehouse_ground + 1, warehouse.y, id_warehouse)
	# The registry has a general blueprint marker but no dedicated board voxel.
	# This exact authored marker is interpreted as the hamlet request board;
	# watchtower/base blueprint markers remain ordinary project markers.
	var board: Vector2i = (
		Vector2i(layout["request_board"])
		if not layout.is_empty()
		else hamlet + Vector2i(3, 0))
	write.call(
		board.x,
		_height_at(board.x, board.y) if not layout.is_empty() else ground,
		board.y,
		id_blueprint_marker)

	# Four compact residence/work plots make the settlement readable without
	# spawning the future Document 20 catalogue.
	var plot_positions: Array[Vector2i] = []
	if not layout.is_empty():
		for plot_record in layout.get("plots", []):
			plot_positions.append(Vector2i(plot_record["position"]))
	else:
		for plot_offset: Vector2i in [
			forward * 7 + right * 6,
			forward * 7 - right * 6,
			-forward * 6 + right * 6,
			-forward * 6 - right * 6,
		]:
			plot_positions.append(hamlet + plot_offset)
	for plot in plot_positions:
		var plot_ground := _height_at(plot.x, plot.y)
		for dx in range(-2, 3):
			for dz in range(-2, 3):
				write.call(plot.x + dx, plot_ground, plot.y + dz, id_planks)
		for corner in [
			Vector2i(-2, -2), Vector2i(2, -2),
			Vector2i(-2, 2), Vector2i(2, 2),
		]:
			write.call(
				plot.x + corner.x, plot_ground + 1,
				plot.y + corner.y, id_log)


func _stamp_settlement_road(write: Callable, road: Dictionary) -> void:
	var from_point := Vector2(road.get("from", Vector2i.ZERO))
	var to_point := Vector2(road.get("to", Vector2i.ZERO))
	var delta := to_point - from_point
	var steps := maxi(1, ceili(maxf(absf(delta.x), absf(delta.y))))
	var width := clampi(int(road.get("width", 1)), 1, 2)
	var previous_ground := -100000
	for step in range(steps + 1):
		var point := from_point.lerp(to_point, float(step) / float(steps))
		var center := Vector2i(roundi(point.x), roundi(point.y))
		var surface := _height_at(center.x, center.y)
		var ground := surface
		if previous_ground > -100000:
			ground = clampi(surface, previous_ground - 1, previous_ground + 1)
		previous_ground = ground
		for lateral in range(-width + 1, width):
			var offset := (
				Vector2i(0, lateral)
				if absf(delta.x) >= absf(delta.y)
				else Vector2i(lateral, 0))
			var gx := center.x + offset.x
			var gz := center.y + offset.y
			var column_surface := _height_at(gx, gz)
			if column_surface < ground:
				for y in range(column_surface + 1, ground + 1):
					write.call(gx, y, gz, id_dirt)
			elif column_surface > ground:
				for y in range(ground + 1, column_surface + 1):
					write.call(gx, y, gz, BlockRegistry.AIR)
			write.call(gx, ground, gz, id_gravel)
			write.call(gx, ground + 1, gz, BlockRegistry.AIR)
			write.call(gx, ground + 2, gz, BlockRegistry.AIR)


func _stamp_watchtower_site(
		write: Callable, site_override: Vector2i = Vector2i.ZERO) -> void:
	var site: Vector2i = (
		site_override
		if site_override != Vector2i.ZERO
		else valley_plan.get_anchor("watchtower_site"))
	var ground := _height_at(site.x, site.y)
	for dx in range(-2, 3):
		for dz in range(-2, 3):
			if absi(dx) == 2 or absi(dz) == 2:
				write.call(site.x + dx, ground, site.y + dz, id_cobble)
	for dx in [-2, 2]:
		for dz in [-2, 2]:
			write.call(site.x + dx, ground + 1, site.y + dz, id_blueprint_marker)


func _stamp_base_site(
		write: Callable, site_override: Vector2i = Vector2i.ZERO) -> void:
	var site: Vector2i = (
		site_override
		if site_override != Vector2i.ZERO
		else valley_plan.get_anchor("base_site"))
	var ground := _height_at(site.x, site.y)
	for dx in range(-5, 6):
		for dz in range(-5, 6):
			if (absi(dx) == 5 or absi(dz) == 5) and (dx + dz) % 3 == 0:
				write.call(site.x + dx, ground, site.y + dz, id_blueprint_marker)
	# The controlled valley provides public starter stations. This resolves the
	# authored furnace-core/plank bootstrap loops while still requiring the
	# player to gather every recipe input for their own stations.
	write.call(site.x - 2, ground, site.y, id_workbench)
	write.call(site.x + 2, ground, site.y, id_furnace)


func _stamp_rune_ruin(
		write: Callable,
		site_override: Vector2i = Vector2i.ZERO,
		variant_seed: String = "") -> void:
	var site: Vector2i = (
		site_override
		if site_override != Vector2i.ZERO
		else valley_plan.get_anchor("rune_ruin"))
	var ground := _height_at(site.x, site.y)
	var ruin_seed: int = int(valley_plan.master_seed)
	if not variant_seed.is_empty():
		ruin_seed = ValleyPlanScript.derive_seed(world_seed, variant_seed)
	for offset in [Vector2i(-3, -3), Vector2i(3, -3), Vector2i(-3, 3), Vector2i(3, 3)]:
		var height: int = 2 + ((absi(offset.x + offset.y) + ruin_seed) & 1)
		for dy in height:
			write.call(site.x + offset.x, ground + dy, site.y + offset.y, id_stone_brick)
	write.call(site.x, ground, site.y, id_mana)
	# Stage 6 teaser objects are deliberately inert: the frame yields the first
	# rune note, while the broken block and corrupted patch communicate the
	# documented portal/forbidden-magic boundary without opening a dimension.
	for dy in range(0, 3):
		write.call(site.x - 2, ground + dy, site.y, id_portal_frame)
		write.call(site.x + 2, ground + dy, site.y, id_portal_frame)
	for dx in range(-2, 3):
		write.call(site.x + dx, ground + 3, site.y, id_portal_frame)
	write.call(site.x, ground + 1, site.y, id_broken_portal)
	write.call(site.x - 1, ground, site.y + 1, id_corrupted_ground)
	write.call(site.x + 1, ground, site.y + 1, id_corrupted_ground)


func _stamp_goblin_camp(
		write: Callable, site_override: Vector2i = Vector2i.ZERO) -> void:
	var site: Vector2i = (
		site_override
		if site_override != Vector2i.ZERO
		else valley_plan.get_anchor("goblin_camp"))
	var ground := _height_at(site.x, site.y)
	for offset in [Vector2i(-5, -4), Vector2i(5, -4), Vector2i(-5, 4), Vector2i(5, 4)]:
		for dy in range(0, 4):
			write.call(site.x + offset.x, ground + dy, site.y + offset.y, id_log)
	for offset in [Vector2i(-1, 0), Vector2i(1, 0), Vector2i(0, -1), Vector2i(0, 1)]:
		write.call(site.x + offset.x, ground, site.y + offset.y, id_cobble)
	write.call(site.x, ground, site.y, id_supply_crate)


func _stamp_cave_entrance(
		write: Callable,
		site_override: Vector2i = Vector2i.ZERO,
		site_record: Dictionary = {}) -> void:
	var site: Vector2i = (
		site_override
		if site_override != Vector2i.ZERO
		else valley_plan.get_anchor("cave_entrance"))
	var floor_y := (
		_regional_cave_floor(site_record)
		if not site_record.is_empty()
		else floori(_cave_floor_height()))
	var lateral := _cave_lateral_axis
	if not site_record.is_empty():
		var direction := Vector2.RIGHT.rotated(
			deg_to_rad(float(site_record.get("rotation", 0))))
		lateral = Vector2(-direction.y, direction.x)
	for side in [-1.0, 1.0]:
		var post: Vector2 = Vector2(site) + lateral * 4.0 * side
		for dy in range(0, 5):
			write.call(roundi(post.x), floor_y + dy, roundi(post.y), id_stone_brick)
	for step in range(-3, 4):
		var lintel := Vector2(site) + lateral * float(step)
		write.call(roundi(lintel.x), floor_y + 5, roundi(lintel.y), id_stone_brick)


func _stamp_mana_clue(
		write: Callable, site_override: Vector2i = Vector2i.ZERO) -> void:
	var site: Vector2i = (
		site_override
		if site_override != Vector2i.ZERO
		else valley_plan.get_anchor("mana_pocket"))
	var ground := _height_at(site.x, site.y)
	write.call(site.x, ground, site.y, id_mana)
	write.call(site.x + 1, ground, site.y, id_mana)
	write.call(site.x, ground + 1, site.y, id_mana)


func _stamp_resource_field(write: Callable, site: Dictionary) -> void:
	var center := Vector2i(site.get("position", Vector2i.ZERO))
	var ground := _height_at(center.x, center.y)
	var variant := str(site.get("variant_id", "mixed"))
	var ore_ids: Array = {
		"coal": [id_coal],
		"copper": [id_copper],
		"iron": [id_iron],
		"mixed": [id_coal, id_copper, id_iron],
	}.get(variant, [id_coal])
	var rng := RandomNumberGenerator.new()
	rng.seed = ValleyPlanScript.derive_seed(
		world_seed, str(site.get("site_id", "")))
	for _index in 18:
		var dx := rng.randi_range(-6, 6)
		var dz := rng.randi_range(-6, 6)
		var depth := rng.randi_range(4, 10)
		var ore_id: int = ore_ids[rng.randi_range(0, ore_ids.size() - 1)]
		write.call(center.x + dx, ground - depth, center.y + dz, ore_id)


# ---------- Global block access ----------

func chunk_coord(v: int) -> int:
	return int(floor(float(v) / float(CHUNK_SIZE)))


func get_block_global(gp: Vector3i) -> int:
	var cc := Vector3i(chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z))
	if not chunks.has(cc):
		return BlockRegistry.AIR
	var local := gp - cc * CHUNK_SIZE
	return chunks[cc].get_block(local.x, local.y, local.z)


func set_block_global(gp: Vector3i, id: int) -> bool:
	if id != BlockRegistry.AIR and not BlockRegistry.has_block(id):
		push_warning("VoxelWorld: rejected unknown block id %d" % id)
		return false
	var cc := Vector3i(chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z))
	if not chunks.has(cc):
		return false
	var previous_id := get_block_global(gp)
	if (previous_id in [id_furnace, id_mana_furnace, id_chest, id_crate] \
			or (automation != null and automation.is_automation_block(previous_id))
			or (magic != null and magic.is_magic_block(previous_id))) \
			and id != previous_id and not can_remove_block_entity(gp):
		return false
	var edit_key := _edit_key(gp)
	_edits[edit_key] = id  # journal first so streaming/save stays lossless
	if not _edit_provenance.has(edit_key):
		_edit_provenance[edit_key] = {
			"record_type": "EditProvenance",
			"version": 1,
			"source_type": "legacy_edit",
			"source_id": "legacy.runtime",
			"settlement_id": "",
			"claim_id": "",
		}
	if previous_id != id:
		_block_orientations.erase(_edit_key(gp))
	var local := gp - cc * CHUNK_SIZE
	chunks[cc].set_block(local.x, local.y, local.z, id)
	_sync_forge_presentation_at(gp, id)
	if previous_id in [id_furnace, id_mana_furnace] \
			and id not in [id_furnace, id_mana_furnace]:
		_furnaces.erase(_edit_key(gp))
	if previous_id == id_chest and id != id_chest:
		_chests.erase(_edit_key(gp))
	if previous_id == id_crate and id != id_crate:
		_chests.erase(_edit_key(gp))
	if automation != null and automation.is_automation_block(previous_id) \
			and id != previous_id:
		automation.unregister_block(gp)
	if magic != null and magic.is_magic_block(previous_id) and id != previous_id:
		magic.unregister_block(gp)
	if id in [id_furnace, id_mana_furnace]:
		_ensure_furnace(gp)
	elif id in [id_chest, id_crate]:
		_ensure_chest(gp)
	if automation != null:
		if automation.is_automation_block(id):
			automation.register_block(gp, id)
		automation.notify_topology_changed()
	if magic != null:
		if magic.is_magic_block(id):
			magic.register_block(gp, id)
		magic.notify_topology_changed()
	if id == BlockRegistry.AIR or id != id_planks:
		_double_slabs.erase(_edit_key(gp))
	request_chunk_rebuild(cc)
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
		request_chunk_rebuild(ncc)
	block_changed.emit(gp, id)
	return true


func set_block_with_provenance(
		gp: Vector3i,
		id: int,
		source_id: String,
		source_type: String = "project",
		settlement_id: String = "",
		claim_id: String = "") -> bool:
	if source_type not in [
		"generated_terrain", "generated_structure", "player", "project",
		"repair", "lab", "legacy_edit",
	]:
		push_warning(
			"VoxelWorld: rejected unknown edit provenance %s" % source_type)
		return false
	if source_id.is_empty():
		return false
	var previous_id := get_persisted_block_id(gp)
	var previous_provenance := get_edit_provenance(gp)
	var existing: Dictionary = _edit_provenance.get(_edit_key(gp), {})
	if not set_block_global(gp, id):
		return false
	if str(existing.get("claim_id", "")) == claim_id \
			and not claim_id.is_empty() \
			and existing.has("previous_stable_id"):
		previous_id = BlockRegistry.resolve_serialized_id(
			existing.get("previous_stable_id", ""))
		previous_provenance = existing.get(
			"previous_provenance", previous_provenance).duplicate(true)
	_edit_provenance[_edit_key(gp)] = {
		"record_type": "EditProvenance",
		"version": 1,
		"source_type": source_type,
		"source_id": source_id,
		"settlement_id": settlement_id,
		"claim_id": claim_id,
		"previous_stable_id": BlockRegistry.get_stable_id(previous_id),
		"previous_provenance": previous_provenance.duplicate(true),
	}
	return true


func revert_provenance_claim(claim_id: String) -> Dictionary:
	if claim_id.is_empty():
		return {"ok": false, "reason": "empty_claim_id"}
	var keys: Array[String] = []
	for key_value in _edit_provenance:
		var key := str(key_value)
		if str((_edit_provenance[key] as Dictionary).get(
				"claim_id", "")) == claim_id:
			keys.append(key)
	keys.sort()
	var restored := 0
	for key in keys:
		var position := _key_to_pos(key)
		var provenance: Dictionary = _edit_provenance[key]
		if is_door_at(position):
			remove_door(position)
		var previous_id := BlockRegistry.resolve_serialized_id(
			provenance.get("previous_stable_id", ""))
		if previous_id < BlockRegistry.AIR:
			previous_id = BlockRegistry.AIR
		if not set_block_global(position, previous_id):
			continue
		var previous: Dictionary = provenance.get(
			"previous_provenance", {}).duplicate(true)
		if previous.is_empty():
			previous = {
				"record_type": "EditProvenance",
				"version": 1,
				"source_type": "generated_terrain",
				"source_id": "worldgen.v%d" % active_worldgen_version,
				"settlement_id": "",
				"claim_id": "",
			}
		_edit_provenance[key] = previous
		restored += 1
	return {"ok": true, "restored": restored, "claim_id": claim_id}


func get_edit_provenance(gp: Vector3i) -> Dictionary:
	var key := _edit_key(gp)
	if _edit_provenance.has(key):
		return (_edit_provenance[key] as Dictionary).duplicate(true)
	if is_regional_worldgen() and valley_plan != null:
		var chunk := Vector2i(chunk_coord(gp.x), chunk_coord(gp.z))
		for site in valley_plan.query_sites(
				Rect2i(chunk - Vector2i.ONE, Vector2i(3, 3))):
			var position := Vector2i(site.get("position", Vector2i.ZERO))
			var footprint := Vector2i(site.get("footprint", Vector2i(1, 1)))
			var bounds := Rect2i(
				position - footprint / 2, footprint)
			if bounds.has_point(Vector2i(gp.x, gp.z)):
				var height := _height_at(gp.x, gp.z)
				var generated_terrain_id := _block_at(
					gp.x, gp.y, gp.z, height, _biome_at(gp.x, gp.z))
				var current_id := (
					get_block_global(gp)
					if _is_voxel_loaded(gp) else generated_terrain_id)
				if current_id == generated_terrain_id:
					continue
				return {
					"record_type": "EditProvenance",
					"version": 1,
					"source_type": "generated_structure",
					"source_id": str(site.get("site_id", "")),
					"settlement_id": str(site.get(
						"parent_site_id", "")),
					"claim_id": str(site.get("site_id", "")),
				}
	return {
		"record_type": "EditProvenance",
		"version": 1,
		"source_type": "generated_terrain",
		"source_id": "worldgen.v%d" % active_worldgen_version,
		"settlement_id": "",
		"claim_id": "",
	}


func serialize_edit_provenance() -> Dictionary:
	return _edit_provenance.duplicate(true)


func apply_edit_provenance(value: Variant) -> void:
	_edit_provenance.clear()
	if not (value is Dictionary):
		return
	for key_value in value:
		var key := str(key_value)
		var record: Variant = value[key_value]
		if not (record is Dictionary):
			continue
		var source_type := str(record.get("source_type", ""))
		if source_type not in [
			"generated_terrain", "generated_structure", "player", "project",
			"repair", "lab", "legacy_edit",
		]:
			continue
		_edit_provenance[key] = record.duplicate(true)


func get_block_orientation(gp: Vector3i) -> int:
	return posmod(int(_block_orientations.get(_edit_key(gp), 0)), 4)


func set_block_orientation(gp: Vector3i, facing: int) -> bool:
	if BlockRegistry.is_air(get_persisted_block_id(gp)):
		return false
	_block_orientations[_edit_key(gp)] = posmod(facing, 4)
	_update_forge_presentation_orientation(gp)
	var cc := Vector3i(chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z))
	request_chunk_rebuild(cc)
	# Chute arms can change in adjacent chunks when an endpoint rotates/appears.
	for offset in DIRS6:
		var neighbor := gp + offset
		request_chunk_rebuild(Vector3i(
			chunk_coord(neighbor.x), chunk_coord(neighbor.y),
			chunk_coord(neighbor.z)))
	return true


func _sync_chunk_forge_presentations(chunk: Chunk) -> void:
	if chunk == null:
		return
	var base := chunk.chunk_pos * CHUNK_SIZE
	for y in CHUNK_SIZE:
		for z in CHUNK_SIZE:
			for x in CHUNK_SIZE:
				var id := chunk.blocks[chunk.index(x, y, z)]
				if _uses_forge_scene_presentation(id):
					_sync_forge_presentation_at(
						base + Vector3i(x, y, z), id)


func _sync_forge_presentation_at(gp: Vector3i, id: int) -> void:
	var key := _edit_key(gp)
	var existing: Dictionary = _forge_world_presentations.get(key, {})
	if not _uses_forge_scene_presentation(id):
		_remove_forge_presentation(key)
		return
	var stable_id := BlockRegistry.get_stable_id(id)
	if not existing.is_empty() \
			and str(existing.get("stable_id", "")) == stable_id:
		_update_forge_presentation_orientation(gp)
		return
	_remove_forge_presentation(key)
	if _forge_presentation_root == null \
			or not is_instance_valid(_forge_presentation_root):
		return
	var package: ForgeRuntimePackage = ForgeRuntime.package_for(stable_id)
	var presentation := ForgeRuntime.instantiate_presentation(
		stable_id, "world", {"position": gp})
	if package == null or presentation == null:
		return
	var anchor := Node3D.new()
	anchor.name = "Forge_%s_%s" % [
		ForgeId.safe_filename(stable_id),
		key.replace(",", "_"),
	]
	anchor.position = Vector3(gp) + Vector3(0.5, 0.0, 0.5)
	anchor.rotation.y = -float(get_block_orientation(gp)) * PI * 0.5
	_forge_presentation_root.add_child(anchor)
	anchor.add_child(presentation)
	var centre := package.bounds.get_center()
	presentation.position = Vector3(
		-centre.x, -package.bounds.position.y, -centre.z)
	var adapter := presentation.get_node_or_null("StateAdapter")
	var entry := {
		"anchor": anchor,
		"presentation": presentation,
		"adapter": adapter,
		"stable_id": stable_id,
		"chunk": Vector3i(
			chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z)),
		"last_snapshot": {},
	}
	_forge_world_presentations[key] = entry
	_apply_forge_presentation_snapshot(key, {
		"processing": false,
		"blocked": false,
		"damaged": 0.0,
	})


func _uses_forge_scene_presentation(id: int) -> bool:
	return id >= 0 and id < block_shapes.size() \
		and int(block_shapes[id]) == 10


func _remove_forge_presentation(key: String) -> void:
	var entry: Dictionary = _forge_world_presentations.get(key, {})
	if entry.is_empty():
		return
	var anchor: Node3D = entry.get("anchor")
	if anchor != null and is_instance_valid(anchor):
		anchor.queue_free()
	_forge_world_presentations.erase(key)


func _remove_forge_presentations_in_chunk(cc: Vector3i) -> void:
	var remove_keys: Array[String] = []
	for key_value in _forge_world_presentations:
		var key := str(key_value)
		var entry: Dictionary = _forge_world_presentations[key]
		if entry.get("chunk", Vector3i.ZERO) == cc:
			remove_keys.append(key)
	for key in remove_keys:
		_remove_forge_presentation(key)


func _update_forge_presentation_orientation(gp: Vector3i) -> void:
	var entry: Dictionary = _forge_world_presentations.get(
		_edit_key(gp), {})
	var anchor: Node3D = entry.get("anchor")
	if anchor != null and is_instance_valid(anchor):
		anchor.rotation.y = -float(get_block_orientation(gp)) * PI * 0.5


func _apply_forge_presentation_snapshot(
		key: String, snapshot: Dictionary) -> void:
	var entry: Dictionary = _forge_world_presentations.get(key, {})
	if entry.is_empty() or entry.get("last_snapshot", {}) == snapshot:
		return
	var adapter: ForgeStateAdapter = entry.get("adapter")
	if adapter != null and is_instance_valid(adapter):
		adapter.apply_snapshot(snapshot)
	entry["last_snapshot"] = snapshot.duplicate(true)
	_forge_world_presentations[key] = entry


func _refresh_forge_furnace_presentations() -> void:
	for key_value in _forge_world_presentations.keys():
		var key := str(key_value)
		var entry: Dictionary = _forge_world_presentations[key]
		if str(entry.get("stable_id", "")) != "functional.furnace.stone":
			continue
		var state: Dictionary = _furnaces.get(key, {})
		if state.is_empty():
			_apply_forge_presentation_snapshot(key, {
				"processing": false,
				"blocked": false,
				"damaged": 0.0,
			})
			continue
		var gp := _key_to_pos(key)
		var recipe := RecipeRegistry.match_furnace_recipe(
			state.get("inputs", []), furnace_station_at(gp))
		var blocked := false
		if not recipe.is_empty():
			var output := Inventory.make_stack_from_ref(recipe["output"])
			blocked = not _station_output_accepts(
				state.get("output", {}), output)
		var processing := (
			not recipe.is_empty()
			and not blocked
			and not str(state.get("recipe_id", "")).is_empty()
			and (
				float(state.get("burn_remaining", 0.0)) > 0.0
				or float(state.get("mana_spent", 0.0)) > 0.0
				or float(state.get("progress", 0.0)) > 0.0
			)
		)
		_apply_forge_presentation_snapshot(key, {
			"processing": processing,
			"blocked": blocked,
			"damaged": float(state.get("damaged", 0.0)),
		})


func create_chunk_orientation_snapshot(cpos: Vector3i) -> PackedByteArray:
	var values := PackedByteArray()
	values.resize(CHUNK_SIZE * CHUNK_SIZE * CHUNK_SIZE)
	var base := cpos * CHUNK_SIZE
	for y in CHUNK_SIZE:
		for z in CHUNK_SIZE:
			for x in CHUNK_SIZE:
				var gp := base + Vector3i(x, y, z)
				values[(y * CHUNK_SIZE + z) * CHUNK_SIZE + x] = \
					get_block_orientation(gp)
	return values


func create_chunk_door_part_snapshot(cpos: Vector3i) -> PackedByteArray:
	var values := PackedByteArray()
	values.resize(CHUNK_SIZE * CHUNK_SIZE * CHUNK_SIZE)
	var base := cpos * CHUNK_SIZE
	for y in CHUNK_SIZE:
		for z in CHUNK_SIZE:
			for x in CHUNK_SIZE:
				var gp := base + Vector3i(x, y, z)
				var part: Dictionary = _door_parts.get(_edit_key(gp), {})
				values[(y * CHUNK_SIZE + z) * CHUNK_SIZE + x] = int(
					part.get("part", 0))
	return values


func create_chunk_door_state_snapshot(cpos: Vector3i) -> PackedByteArray:
	var values := PackedByteArray()
	values.resize(CHUNK_SIZE * CHUNK_SIZE * CHUNK_SIZE)
	var base := cpos * CHUNK_SIZE
	for y in CHUNK_SIZE:
		for z in CHUNK_SIZE:
			for x in CHUNK_SIZE:
				var gp := base + Vector3i(x, y, z)
				var record := get_door_record(gp)
				values[(y * CHUNK_SIZE + z) * CHUNK_SIZE + x] = (
					(1 if bool(record.get("open", false)) else 0)
					| (posmod(int(record.get("hinge", 0)), 2) << 1))
	return values


func is_door_id(block_id: int) -> bool:
	return BlockRegistry.get_shape(block_id) == "door"


func is_door_at(gp: Vector3i) -> bool:
	return _door_parts.has(_edit_key(gp))


func get_door_record(gp: Vector3i) -> Dictionary:
	var part: Dictionary = _door_parts.get(_edit_key(gp), {})
	if part.is_empty():
		return {}
	return _doors.get(str(part.get("base_key", "")), {}).duplicate(true)


func place_door(
		base: Vector3i,
		block_id: int,
		facing: int,
		hinge: int = -1,
		source_id: String = "player.door",
		source_type: String = "player",
		settlement_id: String = "",
		claim_id: String = "") -> bool:
	if not is_door_id(block_id):
		return false
	var upper := base + Vector3i.UP
	if not is_voxel_loaded_at(base) or not is_voxel_loaded_at(upper) \
			or not BlockRegistry.is_air(get_block_global(base)) \
			or not BlockRegistry.is_air(get_block_global(upper)):
		return false
	if not set_block_with_provenance(
			base, block_id, source_id, source_type, settlement_id, claim_id):
		return false
	if not set_block_with_provenance(
			upper, block_id, source_id, source_type, settlement_id, claim_id):
		set_block_global(base, BlockRegistry.AIR)
		return false
	if hinge < 0:
		hinge = absi(
			base.x * 73856093 ^ base.y * 19349663 ^ base.z * 83492791) % 2
	var base_key := _edit_key(base)
	var record := {
		"record_type": "DoorState",
		"version": 1,
		"base": [base.x, base.y, base.z],
		"block_id": block_id,
		"stable_id": BlockRegistry.get_stable_id(block_id),
		"facing": posmod(facing, 4),
		"hinge": posmod(hinge, 2),
		"open": false,
		"last_actor_id": "",
	}
	_doors[base_key] = record
	_door_parts[_edit_key(base)] = {"base_key": base_key, "part": 1}
	_door_parts[_edit_key(upper)] = {"base_key": base_key, "part": 2}
	set_block_orientation(base, facing)
	set_block_orientation(upper, facing)
	return true


func toggle_door(position: Vector3i, actor_id: String = "") -> bool:
	door_last_error = ""
	var part: Dictionary = _door_parts.get(_edit_key(position), {})
	if part.is_empty():
		door_last_error = "No door is present."
		return false
	var base_key := str(part.get("base_key", ""))
	var record: Dictionary = _doors.get(base_key, {})
	if record.is_empty():
		door_last_error = "The door state is missing."
		return false
	var opening := not bool(record.get("open", false))
	if opening:
		var base_values: Array = record.get("base", [])
		var base := Vector3i(
			int(base_values[0]), int(base_values[1]), int(base_values[2]))
		var facing := int(record.get("facing", 0))
		var forward: Array[Vector3i] = [
			Vector3i(0, 0, -1), Vector3i(1, 0, 0),
			Vector3i(0, 0, 1), Vector3i(-1, 0, 0),
		]
		var side := forward[posmod(
			facing + (1 if int(record.get("hinge", 0)) == 0 else -1), 4)]
		for swing_cell in [base + side, base + side + Vector3i.UP]:
			var swing_id := get_persisted_block_id(swing_cell)
			if not BlockRegistry.is_air(swing_id) \
					and not BlockRegistry.is_water(swing_id) \
					and not is_door_at(swing_cell):
				door_last_error = "The door cannot open; its swing is blocked."
				return false
	record["open"] = opening
	record["last_actor_id"] = actor_id
	_doors[base_key] = record
	var base_values: Array = record.get("base", [])
	var base := Vector3i(
		int(base_values[0]), int(base_values[1]), int(base_values[2]))
	request_chunk_rebuild(Vector3i(
		chunk_coord(base.x), chunk_coord(base.y), chunk_coord(base.z)))
	var upper := base + Vector3i.UP
	request_chunk_rebuild(Vector3i(
		chunk_coord(upper.x), chunk_coord(upper.y), chunk_coord(upper.z)))
	return true


func remove_door(gp: Vector3i) -> Dictionary:
	var record := get_door_record(gp)
	if record.is_empty():
		return {}
	var saved := record.duplicate(true)
	var values: Array = record.get("base", [])
	var base := Vector3i(int(values[0]), int(values[1]), int(values[2]))
	var upper := base + Vector3i.UP
	var base_key := _edit_key(base)
	_doors.erase(base_key)
	_door_parts.erase(_edit_key(base))
	_door_parts.erase(_edit_key(upper))
	set_block_global(base, BlockRegistry.AIR)
	set_block_global(upper, BlockRegistry.AIR)
	return saved


func restore_door(record: Dictionary) -> bool:
	var values: Array = record.get("base", [])
	if values.size() != 3:
		return false
	var base := Vector3i(int(values[0]), int(values[1]), int(values[2]))
	var block_id := BlockRegistry.resolve_serialized_id(
		record.get("stable_id", record.get("block_id", -1)))
	if not place_door(
			base, block_id, int(record.get("facing", 0)),
			int(record.get("hinge", -1)),
			"save.restore.door", "legacy_edit"):
		return false
	var base_key := _edit_key(base)
	var restored: Dictionary = _doors[base_key]
	restored["open"] = bool(record.get("open", false))
	restored["last_actor_id"] = str(record.get("last_actor_id", ""))
	_doors[base_key] = restored
	return true


# ---------- Persistent physical item drops ----------

func spawn_item_drop(value: Dictionary, world_position: Vector3,
		impulse := Vector3.ZERO, restored_id := "") -> bool:
	var stack := Inventory._normalise_stack(value)
	if stack.is_empty():
		return false
	var drop_id := restored_id
	if drop_id.is_empty():
		drop_id = "drop.%d" % _next_drop_serial
		_next_drop_serial += 1
	var drop := WorldItemDropScript.new()
	drop.setup(self, drop_id, stack)
	drop.position = world_position
	drop.velocity = impulse
	add_child(drop)
	_item_drops.append(drop)
	return true


func notify_item_drop_pickup(drop: Node, picked_up: Dictionary) -> void:
	item_drop_picked_up.emit(picked_up.duplicate(true))
	if player != null and player.has_method("notify_item_pickup"):
		player.notify_item_pickup(picked_up)
	if is_instance_valid(drop) and drop.stack.is_empty():
		_item_drops.erase(drop)


func active_item_drop_count() -> int:
	var count := 0
	for drop in _item_drops:
		if is_instance_valid(drop) and not drop.is_queued_for_deletion() \
				and not drop.stack.is_empty():
			count += 1
	return count


func serialize_item_drops() -> Array:
	var saved: Array = []
	for drop in _item_drops:
		if not is_instance_valid(drop) or drop.is_queued_for_deletion() \
				or drop.stack.is_empty():
			continue
		saved.append(drop.serialize_state())
	return saved


func restore_item_drops(value: Variant) -> void:
	for drop in _item_drops:
		if is_instance_valid(drop):
			drop.queue_free()
	_item_drops.clear()
	_next_drop_serial = 1
	if not (value is Array):
		return
	for raw_value in value:
		if not (raw_value is Dictionary):
			continue
		var raw: Dictionary = raw_value
		var stack := Inventory.deserialize_stack(raw.get("stack", {}))
		var saved_position: Variant = raw.get("position", [])
		if stack.is_empty() or not (saved_position is Array) \
				or saved_position.size() != 3:
			continue
		var position := Vector3(
			float(saved_position[0]), float(saved_position[1]), float(saved_position[2]))
		var saved_velocity: Variant = raw.get("velocity", [])
		var impulse := Vector3.ZERO
		if saved_velocity is Array and saved_velocity.size() == 3:
			impulse = Vector3(
				float(saved_velocity[0]), float(saved_velocity[1]), float(saved_velocity[2]))
		if spawn_item_drop(stack, position, impulse, str(raw.get("id", ""))):
			var drop = _item_drops.back()
			drop._age = maxf(0.0, float(raw.get("age", 0.0)))
			_next_drop_serial += 1


func is_voxel_loaded_at(global_position: Vector3i) -> bool:
	return _is_voxel_loaded(global_position)


func is_chunk_render_ready_at(global_position: Vector3i) -> bool:
	if not _is_voxel_loaded(global_position):
		return false
	var cc := Vector3i(
		chunk_coord(global_position.x),
		chunk_coord(global_position.y),
		chunk_coord(global_position.z))
	var chunk: Variant = chunks.get(cc)
	return is_instance_valid(chunk) and chunk.is_geometry_ready()


func is_spawn_surface_ready_at(feet: Vector3i) -> bool:
	## Actors and non-voxel markers must not appear on generated data before its
	## visible mesh and collision have been committed.
	return is_voxel_loaded_at(feet) \
		and is_voxel_loaded_at(feet + Vector3i.UP) \
		and is_voxel_loaded_at(feet + Vector3i.DOWN) \
		and is_chunk_render_ready_at(feet) \
		and is_chunk_render_ready_at(feet + Vector3i.DOWN)


# ---------- Stage 3 functional blocks ----------

func station_type_at(gp: Vector3i) -> String:
	var id := get_block_global(gp)
	if id == id_workbench:
		return "workbench"
	if id == id_furnace:
		return "furnace"
	if id == id_mana_furnace:
		return "mana_furnace"
	if id == id_rune_table:
		return "rune_table"
	if id in [id_chest, id_crate]:
		return "chest"
	if automation != null and automation.is_automation_block(id):
		return "automation"
	if magic != null and magic.is_magic_inspection_block(id):
		magic.ensure_block(gp, id)
		return "magic"
	if id == id_warehouse and gp == get_hamlet_station_position("warehouse"):
		return "warehouse"
	if id == id_blueprint_marker and gp == get_hamlet_station_position("request_board"):
		return "request_board"
	return ""


func _new_furnace_state() -> Dictionary:
	return {
		"inputs": [{}, {}, {}],
		"fuel": {},
		"output": {},
		"progress": 0.0,
		"burn_remaining": 0.0,
		"mana_spent": 0.0,
		"recipe_id": "",
	}


func _ensure_furnace(gp: Vector3i) -> Dictionary:
	var key := _edit_key(gp)
	if not _furnaces.has(key):
		_furnaces[key] = _new_furnace_state()
	return _furnaces[key]


func get_furnace_state(gp: Vector3i) -> Dictionary:
	if not _is_furnace_id(get_block_global(gp)):
		return {}
	return _ensure_furnace(gp).duplicate(true)


func _is_furnace_id(block_id: int) -> bool:
	return block_id in [id_furnace, id_mana_furnace]


func furnace_station_at(gp: Vector3i) -> String:
	return "mana_furnace" \
		if get_persisted_block_id(gp) == id_mana_furnace else "furnace"


func get_furnace_slot(gp: Vector3i, target: String, index: int = 0) -> Dictionary:
	var state := get_furnace_state(gp)
	if state.is_empty():
		return {}
	if target == "fuel":
		return state["fuel"]
	if target == "output":
		return state["output"]
	if target == "input" and index >= 0 and index < state["inputs"].size():
		return state["inputs"][index]
	return {}


func furnace_slot_accepts_stack(
		target: String, stack: Dictionary,
		station: String = "furnace") -> bool:
	var normal: Dictionary = Inventory._normalise_stack(stack)
	if normal.is_empty():
		return true
	if int(normal.get("count", 0)) > Inventory.stack_max_count(normal):
		return false
	if target == "fuel":
		return station == "furnace" and _fuel_seconds(normal) > 0.0
	if target == "input":
		return RecipeRegistry.is_furnace_ingredient(normal, station)
	# Output is writable only by the HUD's conserved move/rollback transaction.
	return target == "output"


func set_furnace_slot(
		gp: Vector3i, target: String, index: int, stack: Dictionary) -> bool:
	if get_block_global(gp) != id_furnace \
			and get_block_global(gp) != id_mana_furnace:
		return false
	var station := furnace_station_at(gp)
	if not furnace_slot_accepts_stack(target, stack, station):
		return false
	var state := _ensure_furnace(gp)
	var normal: Dictionary = Inventory._normalise_stack(stack)
	if target == "fuel":
		state["fuel"] = normal
	elif target == "output":
		state["output"] = normal
	elif target == "input" and index >= 0 and index < state["inputs"].size():
		var other_inputs: Array = state["inputs"].duplicate(true)
		other_inputs[index] = {}
		if not normal.is_empty() and not RecipeRegistry.furnace_inputs_compatible(
				other_inputs, normal, station):
			return false
		state["inputs"][index] = normal
		# Changing an ingredient invalidates partial progress; the next furnace
		# tick resolves the recipe from the new authoritative slot contents.
		state["progress"] = 0.0
		state["mana_spent"] = 0.0
		state["recipe_id"] = ""
	else:
		return false
	_furnaces[_edit_key(gp)] = state
	return true


func can_remove_block_entity(gp: Vector3i) -> bool:
	var key := _edit_key(gp)
	if _chests.has(key):
		for stack in _chests[key]:
			if not stack.is_empty():
				return false
	if automation != null and not automation.can_remove(gp):
		return false
	if magic != null and not magic.can_remove(gp):
		return false
	if not _furnaces.has(key):
		return true
	var state: Dictionary = _furnaces[key]
	if not state.get("fuel", {}).is_empty() or not state.get("output", {}).is_empty():
		return false
	for stack in state.get("inputs", []):
		if not stack.is_empty():
			return false
	return true


func make_double_slab(gp: Vector3i) -> bool:
	if get_block_global(gp) != id_oak_slab:
		return false
	if not set_block_global(gp, id_planks):
		return false
	_double_slabs[_edit_key(gp)] = true
	return true


func get_custom_drop(gp: Vector3i) -> Dictionary:
	if _double_slabs.has(_edit_key(gp)):
		return {
			"kind": "block",
			"stable_id": "construction.slab.oak",
			"count": 2,
		}
	return {}


func _ensure_chest(gp: Vector3i) -> Array:
	var key := _edit_key(gp)
	if not _chests.has(key):
		var slots: Array = []
		slots.resize(27)
		for i in 27:
			slots[i] = {}
		_chests[key] = slots
	return _chests[key]


func get_chest_state(gp: Vector3i) -> Array:
	if get_block_global(gp) not in [id_chest, id_crate]:
		return []
	return _ensure_chest(gp).duplicate(true)


func get_chest_slot(gp: Vector3i, index: int) -> Dictionary:
	var slots := _ensure_chest(gp)
	return slots[index] if index >= 0 and index < slots.size() else {}


func set_chest_slot(gp: Vector3i, index: int, stack: Dictionary) -> bool:
	if get_block_global(gp) not in [id_chest, id_crate]:
		return false
	var slots := _ensure_chest(gp)
	if index < 0 or index >= slots.size():
		return false
	slots[index] = stack.duplicate(true)
	_chests[_edit_key(gp)] = slots
	return true


func furnace_insert_selected(gp: Vector3i, target: String) -> bool:
	if not _is_furnace_id(get_block_global(gp)):
		return false
	var station := furnace_station_at(gp)
	var selected := Inventory.get_selected_stack()
	if selected.is_empty():
		return false
	if target == "fuel" and (
			station != "furnace" or _fuel_seconds(selected) <= 0.0):
		return false
	if target == "input" \
			and not RecipeRegistry.is_furnace_ingredient(selected, station):
		return false
	var state := _ensure_furnace(gp)
	var taken := Inventory.take_selected_stack(1)
	if taken.is_empty():
		return false
	if target == "fuel":
		var fuel: Dictionary = state["fuel"]
		if not fuel.is_empty() and not Inventory.stack_matches_ref(fuel, {
			"kind": Inventory.stack_kind(taken),
			"stable_id": Inventory.stack_stable_id(taken),
		}):
			Inventory.add_stack(taken)
			return false
		if not fuel.is_empty() and int(fuel.get("count", 0)) >= Inventory.stack_max_count(fuel):
			Inventory.add_stack(taken)
			return false
		if fuel.is_empty():
			state["fuel"] = taken
		else:
			fuel["count"] = int(fuel["count"]) + 1
			state["fuel"] = fuel
	else:
		var inputs: Array = state["inputs"]
		if not RecipeRegistry.furnace_inputs_compatible(
				inputs, taken, station):
			Inventory.add_stack(taken)
			return false
		var destination := -1
		for i in inputs.size():
			if Inventory.stack_matches_ref(inputs[i], {
				"kind": Inventory.stack_kind(taken),
				"stable_id": Inventory.stack_stable_id(taken),
			}) and int(inputs[i].get("count", 0)) < Inventory.stack_max_count(inputs[i]):
				destination = i
				break
			if destination < 0 and inputs[i].is_empty():
				destination = i
		if destination < 0:
			Inventory.add_stack(taken)
			return false
		if inputs[destination].is_empty():
			inputs[destination] = taken
		else:
			inputs[destination]["count"] = int(inputs[destination]["count"]) + 1
		state["inputs"] = inputs
	_furnaces[_edit_key(gp)] = state
	return true


func furnace_take_slot(gp: Vector3i, target: String, index: int = 0) -> bool:
	if not _is_furnace_id(get_block_global(gp)):
		return false
	var state := _ensure_furnace(gp)
	var stack := {}
	if target == "output":
		stack = state["output"]
	elif target == "fuel":
		stack = state["fuel"]
	else:
		var inputs: Array = state["inputs"]
		if index < 0 or index >= inputs.size():
			return false
		stack = inputs[index]
	if stack.is_empty() or not Inventory.can_add_stack(stack):
		return false
	if not Inventory.add_stack(stack).is_empty():
		return false
	if target == "output":
		state["output"] = {}
	elif target == "fuel":
		state["fuel"] = {}
	else:
		state["inputs"][index] = {}
	state["progress"] = 0.0
	state["mana_spent"] = 0.0
	state["recipe_id"] = ""
	_furnaces[_edit_key(gp)] = state
	return true


func _fuel_seconds(stack: Dictionary) -> float:
	var stable_id := Inventory.stack_stable_id(stack)
	return float({
		"item.resource.coal_chunk": 80.0,
		"item.resource.log_oak": 15.0,
		"item.material.plank_oak": 5.0,
	}.get(stable_id, 0.0))


func _process_furnaces(delta: float) -> void:
	for key in _furnaces.keys():
		var state: Dictionary = _furnaces[key]
		var gp := _key_to_pos(str(key))
		var station := furnace_station_at(gp)
		var recipe := RecipeRegistry.match_furnace_recipe(
			state["inputs"], station)
		if recipe.is_empty():
			state["progress"] = 0.0
			state["mana_spent"] = 0.0
			state["recipe_id"] = ""
			if station == "mana_furnace" and magic != null:
				magic.report_consumer_fault(gp, "invalid_input")
			_furnaces[key] = state
			continue
		if str(state.get("recipe_id", "")) not in ["", str(recipe["id"])]:
			state["progress"] = 0.0
			state["mana_spent"] = 0.0
		var output := Inventory.make_stack_from_ref(recipe["output"])
		if not _station_output_accepts(state["output"], output):
			if station == "mana_furnace" and magic != null:
				magic.report_consumer_fault(gp, "output_blocked")
			continue
		if station == "mana_furnace":
			var mana_cost := float(recipe.get("mana_cost", 0.0))
			var duration := maxf(0.001, float(recipe.get("seconds", 0.0)))
			var mana_remaining := maxf(
				0.0, mana_cost - float(state.get("mana_spent", 0.0)))
			var mana_step := minf(
				mana_remaining, mana_cost / duration * delta)
			if magic == null or not magic.consume_mana(gp, mana_step):
				if magic != null:
					magic.report_consumer_fault(gp, "no_mana")
				state["recipe_id"] = str(recipe["id"])
				_furnaces[key] = state
				continue
			state["mana_spent"] = float(state.get("mana_spent", 0.0)) + mana_step
			magic.report_consumer_fault(gp, "")
		else:
			if float(state["burn_remaining"]) <= 0.0:
				var fuel: Dictionary = state["fuel"]
				if fuel.is_empty():
					continue
				state["burn_remaining"] = _fuel_seconds(fuel)
				if float(state["burn_remaining"]) <= 0.0:
					continue
				fuel["count"] = int(fuel["count"]) - 1
				state["fuel"] = {} if int(fuel["count"]) <= 0 else fuel
			state["burn_remaining"] = maxf(
				0.0, float(state["burn_remaining"]) - delta)
		state["recipe_id"] = str(recipe["id"])
		state["progress"] = float(state["progress"]) + delta
		if float(state["progress"]) >= float(recipe["seconds"]):
			if station == "mana_furnace":
				var final_mana := maxf(
					0.0,
					float(recipe.get("mana_cost", 0.0))
						- float(state.get("mana_spent", 0.0)))
				if magic == null or not magic.consume_mana(gp, final_mana):
					if magic != null:
						magic.report_consumer_fault(gp, "no_mana")
					_furnaces[key] = state
					continue
			_consume_furnace_inputs(state["inputs"], recipe["inputs"])
			if state["output"].is_empty():
				state["output"] = output
			else:
				state["output"]["count"] = int(state["output"]["count"]) + int(output["count"])
			state["progress"] = 0.0
			state["mana_spent"] = 0.0
			ProgressionState.record_refine(
				str(recipe["id"]), str(recipe["output"]["stable_id"]),
				int(recipe["output"].get("count", 1)))
		_furnaces[key] = state
	_refresh_forge_furnace_presentations()


func _station_output_accepts(current: Dictionary, incoming: Dictionary) -> bool:
	if current.is_empty():
		return true
	return Inventory.stack_kind(current) == Inventory.stack_kind(incoming) \
		and int(current.get("id", -1)) == int(incoming.get("id", -2)) \
		and int(current.get("count", 0)) + int(incoming.get("count", 0)) \
			<= Inventory.stack_max_count(current)


func _consume_furnace_inputs(inputs: Array, required: Array) -> void:
	for content_ref in required:
		var remaining := int(content_ref["count"])
		for i in inputs.size():
			if remaining <= 0:
				break
			var stack: Dictionary = inputs[i]
			if not Inventory.stack_matches_ref(stack, content_ref):
				continue
			var move := mini(remaining, int(stack["count"]))
			stack["count"] = int(stack["count"]) - move
			remaining -= move
			inputs[i] = {} if int(stack["count"]) <= 0 else stack


func serialize_block_entities() -> Dictionary:
	var out := {}
	for key in _furnaces:
		var state: Dictionary = _furnaces[key]
		var saved_inputs: Array = []
		for stack in state["inputs"]:
			saved_inputs.append(Inventory.serialize_stack(stack))
		out[key] = {
			"type": "furnace",
			"inputs": saved_inputs,
			"fuel": Inventory.serialize_stack(state["fuel"]),
			"output": Inventory.serialize_stack(state["output"]),
			"progress": float(state["progress"]),
			"burn_remaining": float(state["burn_remaining"]),
			"mana_spent": float(state.get("mana_spent", 0.0)),
			"recipe_id": str(state["recipe_id"]),
		}
	for key in _chests:
		var saved_slots: Array = []
		for stack in _chests[key]:
			saved_slots.append(Inventory.serialize_stack(stack))
		out[key] = {
			"type": "chest",
			"slots": saved_slots,
		}
	for key in _double_slabs:
		out[key] = {"type": "double_slab"}
	out["__orientations__"] = _block_orientations.duplicate()
	var saved_doors: Array[Dictionary] = []
	for key in _doors:
		var record: Dictionary = _doors[key].duplicate(true)
		record["stable_id"] = BlockRegistry.get_stable_id(
			int(record.get("block_id", id_oak_door)))
		record.erase("block_id")
		saved_doors.append(record)
	out["__doors__"] = saved_doors
	if automation != null:
		out["__automation__"] = automation.serialize_state()
	if magic != null:
		out["__magic__"] = magic.serialize_state()
	return out


func apply_block_entities(value: Variant) -> void:
	_furnaces.clear()
	_chests.clear()
	_double_slabs.clear()
	_block_orientations.clear()
	_doors.clear()
	_door_parts.clear()
	if not (value is Dictionary):
		if automation != null:
			automation.restore_state({})
		if magic != null:
			magic.restore_state({})
		return
	var entities: Dictionary = value
	var automation_value: Variant = entities.get("__automation__", {})
	var magic_value: Variant = entities.get("__magic__", {})
	var orientation_value: Variant = entities.get("__orientations__", {})
	if orientation_value is Dictionary:
		for key in orientation_value:
			_block_orientations[str(key)] = posmod(
				int(orientation_value[key]), 4)
	var door_value: Variant = entities.get("__doors__", [])
	if door_value is Array:
		for raw_door in door_value:
			if not (raw_door is Dictionary):
				continue
			var record: Dictionary = raw_door.duplicate(true)
			var values: Array = record.get("base", [])
			var block_id := BlockRegistry.resolve_serialized_id(
				record.get("stable_id", ""))
			if values.size() != 3 or not is_door_id(block_id):
				continue
			var base := Vector3i(int(values[0]), int(values[1]), int(values[2]))
			var base_key := _edit_key(base)
			record["block_id"] = block_id
			record["record_type"] = "DoorState"
			record["version"] = 1
			record["facing"] = posmod(int(record.get("facing", 0)), 4)
			record["hinge"] = posmod(int(record.get(
				"hinge",
				absi(base.x * 73856093 ^ base.y * 19349663 \
					^ base.z * 83492791) % 2)), 2)
			record["open"] = bool(record.get("open", false))
			record["last_actor_id"] = str(record.get("last_actor_id", ""))
			_doors[base_key] = record
			_door_parts[base_key] = {"base_key": base_key, "part": 1}
			_door_parts[_edit_key(base + Vector3i.UP)] = {
				"base_key": base_key, "part": 2}
	for key in entities:
		if str(key) in [
			"__automation__", "__magic__", "__orientations__", "__doors__",
		]:
			continue
		var saved: Variant = entities[key]
		if not (saved is Dictionary):
			continue
		var entity_type := str(saved.get("type", ""))
		if entity_type == "double_slab":
			_double_slabs[str(key)] = true
			continue
		if entity_type == "chest":
			var slots: Array = []
			slots.resize(27)
			for i in 27:
				slots[i] = {}
			var saved_slots: Variant = saved.get("slots", [])
			if saved_slots is Array:
				for i in mini(saved_slots.size(), slots.size()):
					slots[i] = Inventory.deserialize_stack(saved_slots[i])
			_chests[str(key)] = slots
			continue
		if entity_type != "furnace":
			continue
		var state := _new_furnace_state()
		var saved_inputs: Variant = saved.get("inputs", [])
		if saved_inputs is Array:
			for i in mini(saved_inputs.size(), state["inputs"].size()):
				state["inputs"][i] = Inventory.deserialize_stack(saved_inputs[i])
		state["fuel"] = Inventory.deserialize_stack(saved.get("fuel", {}))
		state["output"] = Inventory.deserialize_stack(saved.get("output", {}))
		state["progress"] = maxf(0.0, float(saved.get("progress", 0.0)))
		state["burn_remaining"] = maxf(0.0, float(saved.get("burn_remaining", 0.0)))
		state["mana_spent"] = maxf(0.0, float(saved.get("mana_spent", 0.0)))
		state["recipe_id"] = str(saved.get("recipe_id", ""))
		_furnaces[str(key)] = state
	if automation != null:
		automation.restore_state(automation_value)
	if magic != null:
		magic.restore_state(magic_value)


# ---------- Stage 5 automation endpoints and conserved transactions ----------

func get_persisted_block_id(gp: Vector3i) -> int:
	var key := _edit_key(gp)
	if _edits.has(key):
		return int(_edits[key])
	if _is_voxel_loaded(gp):
		return get_block_global(gp)
	if gp.y < 0 or gp.y >= WORLD_HEIGHT:
		return BlockRegistry.AIR
	var height := _height_at(gp.x, gp.z)
	return _block_at(gp.x, gp.y, gp.z, height, _biome_at(gp.x, gp.z))


func get_edited_automation_blocks() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	if automation == null:
		return out
	for key in _edits:
		var block_id := int(_edits[key])
		if automation.is_automation_block(block_id):
			out.append({
				"position": _key_to_pos(str(key)),
				"id": block_id,
			})
	return out


func get_edited_magic_blocks() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	if magic == null:
		return out
	for key in _edits:
		var block_id := int(_edits[key])
		if magic.is_magic_block(block_id):
			out.append({
				"position": _key_to_pos(str(key)),
				"id": block_id,
			})
	return out


func find_automation_resource(
		origin: Vector3i, resource_id: int, radius: int) -> Vector3i:
	var resource_ids: Array[int] = [resource_id]
	var found := find_nearest_automation_resource(origin, resource_ids, radius)
	return Vector3i(found.get("position", Vector3i.ZERO))


func find_nearest_automation_resource(
		origin: Vector3i, resource_ids: Array[int], radius: int) -> Dictionary:
	if resource_ids.is_empty() or radius < 0:
		return {}
	var accepted := {}
	for resource_id in resource_ids:
		if resource_id > BlockRegistry.AIR:
			accepted[resource_id] = true
	if accepted.is_empty():
		return {}
	var best := Vector3i.ZERO
	var best_id := -1
	var best_distance := INF
	for dy in range(-radius, radius + 1):
		for dx in range(-radius, radius + 1):
			for dz in range(-radius, radius + 1):
				var distance_squared := dx * dx + dy * dy + dz * dz
				if distance_squared > radius * radius:
					continue
				var candidate := origin + Vector3i(dx, dy, dz)
				var candidate_id := get_persisted_block_id(candidate)
				if not accepted.has(candidate_id):
					continue
				if float(distance_squared) < best_distance:
					best = candidate
					best_id = candidate_id
					best_distance = float(distance_squared)
	return {} if best_id < 0 else {
		"position": best,
		"block_id": best_id,
		"distance_squared": best_distance,
	}


func automation_resource_matches(gp: Vector3i, resource_id: int) -> bool:
	return get_persisted_block_id(gp) == resource_id


func consume_automation_resource(gp: Vector3i, resource_id: int) -> bool:
	if not automation_resource_matches(gp, resource_id):
		return false
	if _is_voxel_loaded(gp):
		return set_block_global(gp, BlockRegistry.AIR)
	_edits[_edit_key(gp)] = BlockRegistry.AIR
	block_changed.emit(gp, BlockRegistry.AIR)
	return true


func restore_automation_resource(gp: Vector3i, resource_id: int) -> bool:
	if get_persisted_block_id(gp) != BlockRegistry.AIR:
		return false
	if _is_voxel_loaded(gp):
		return set_block_global(gp, resource_id)
	_edits[_edit_key(gp)] = resource_id
	block_changed.emit(gp, resource_id)
	return true


func get_automation_endpoint_positions() -> Array[Vector3i]:
	var positions: Array[Vector3i] = []
	var seen := {}
	for key in _furnaces:
		var position := _key_to_pos(str(key))
		if _is_furnace_id(get_persisted_block_id(position)):
			positions.append(position)
			seen[str(key)] = true
	for key in _chests:
		if seen.has(str(key)):
			continue
		var position := _key_to_pos(str(key))
		if get_persisted_block_id(position) in [id_chest, id_crate]:
			positions.append(position)
	return positions


func is_automation_endpoint(gp: Vector3i) -> bool:
	var id := get_persisted_block_id(gp)
	return id in [
		id_furnace, id_mana_furnace, id_chest, id_crate, id_warehouse_hatch,
	]


func automation_endpoint_kind(gp: Vector3i) -> String:
	var id := get_persisted_block_id(gp)
	if id in [id_furnace, id_mana_furnace]:
		return "furnace"
	if id in [id_chest, id_crate]:
		return "crate"
	if id == id_warehouse_hatch:
		return "warehouse_hatch"
	return ""


func automation_endpoint_capacity(
		gp: Vector3i, value: Dictionary, mode: String = "donation") -> int:
	var incoming := Inventory._normalise_stack(value)
	if incoming.is_empty():
		return 0
	match automation_endpoint_kind(gp):
		"furnace":
			return _furnace_automation_capacity(gp, incoming)
		"crate":
			return _slot_storage_capacity(_ensure_chest(gp), incoming)
		"warehouse_hatch":
			if not HamletState.permission_enabled("automation_import"):
				return 0
			if mode == "project" and not HamletState.can_automation_project_accept(incoming):
				return 0
			return HamletState.warehouse_capacity_for(incoming)
	return 0


func automation_endpoint_capacity_with_pending(
		gp: Vector3i, value: Dictionary, mode: String,
		pending: Array) -> int:
	var incoming := Inventory._normalise_stack(value)
	if incoming.is_empty():
		return 0
	if automation_endpoint_kind(gp) == "furnace":
		var simulated: Dictionary = _ensure_furnace(gp).duplicate(true)
		for pending_value in pending:
			var reserved := Inventory._normalise_stack(pending_value)
			if reserved.is_empty() \
					or not _furnace_automation_insert_state(gp, simulated, reserved):
				return 0
		return _furnace_automation_capacity_for_state(gp, simulated, incoming)
	if automation_endpoint_kind(gp) == "crate":
		var slots := _ensure_chest(gp).duplicate(true)
		for pending_value in pending:
			var reserved := Inventory._normalise_stack(pending_value)
			if not reserved.is_empty() and not _insert_into_slots(slots, reserved):
				return 0
		return _slot_storage_capacity(slots, incoming)
	var capacity := automation_endpoint_capacity(gp, incoming, mode)
	for pending_value in pending:
		var reserved := Inventory._normalise_stack(pending_value)
		if Inventory._can_merge(reserved, incoming):
			capacity -= int(reserved.get("count", 0))
	return maxi(0, capacity)


func automation_endpoint_prefers_stack(gp: Vector3i, value: Dictionary) -> bool:
	if automation_endpoint_kind(gp) != "furnace":
		return false
	var incoming := Inventory._normalise_stack(value)
	if incoming.is_empty():
		return false
	var station := furnace_station_at(gp)
	if station == "furnace" and _fuel_seconds(incoming) > 0.0:
		return true
	return RecipeRegistry.is_furnace_ingredient(incoming, station)


func automation_receive(gp: Vector3i, value: Dictionary, mode: String,
		source: String, correlation_id: String) -> bool:
	var incoming := Inventory._normalise_stack(value)
	if incoming.is_empty():
		return false
	if automation_endpoint_capacity(gp, incoming, mode) < int(incoming["count"]):
		return false
	match automation_endpoint_kind(gp):
		"furnace":
			return _furnace_automation_insert(gp, incoming)
		"crate":
			return _slot_storage_insert(gp, incoming)
		"warehouse_hatch":
			return bool(HamletState.automation_import_stack(
				incoming, mode, source, correlation_id).get("ok", false))
	return false


func automation_endpoint_fault(
		gp: Vector3i, value: Dictionary, mode: String) -> String:
	var kind := automation_endpoint_kind(gp)
	if kind.is_empty():
		return "missing_destination"
	if kind == "warehouse_hatch" \
			and not HamletState.permission_enabled("automation_import"):
		return "permission_blocked"
	if kind == "warehouse_hatch" and mode == "project" \
			and not HamletState.can_automation_project_accept(value):
		return "invalid_input"
	if kind == "furnace" and _furnace_automation_capacity(gp, value) <= 0:
		var station := furnace_station_at(gp)
		return "invalid_input" \
			if not RecipeRegistry.is_furnace_ingredient(value, station) \
				and (station != "furnace" or _fuel_seconds(value) <= 0.0) \
			else "full_storage"
	return "full_storage"


func automation_peek_output(gp: Vector3i) -> Dictionary:
	if automation_endpoint_kind(gp) != "furnace":
		return {}
	return _ensure_furnace(gp).get("output", {}).duplicate(true)


func automation_take_output(gp: Vector3i, count: int) -> Dictionary:
	if automation_endpoint_kind(gp) != "furnace" or count <= 0:
		return {}
	var key := _edit_key(gp)
	var state := _ensure_furnace(gp)
	var output: Dictionary = state.get("output", {})
	if output.is_empty():
		return {}
	var move := mini(count, int(output.get("count", 0)))
	var moved := output.duplicate(true)
	moved["count"] = move
	output["count"] = int(output["count"]) - move
	state["output"] = {} if int(output["count"]) <= 0 else output
	_furnaces[key] = state
	return moved


func _furnace_automation_capacity(gp: Vector3i, incoming: Dictionary) -> int:
	return _furnace_automation_capacity_for_state(
		gp, _ensure_furnace(gp), incoming)


func _furnace_automation_capacity_for_state(
		gp: Vector3i, state: Dictionary, incoming: Dictionary) -> int:
	var station := furnace_station_at(gp)
	if station == "furnace" and _fuel_seconds(incoming) > 0.0:
		var fuel: Dictionary = state["fuel"]
		if fuel.is_empty():
			return Inventory.stack_max_count(incoming)
		if Inventory._can_merge(fuel, incoming):
			return maxi(0, Inventory.stack_max_count(fuel) - int(fuel["count"]))
		return 0
	if not RecipeRegistry.is_furnace_ingredient(incoming, station) \
			or not RecipeRegistry.furnace_inputs_compatible(
				state["inputs"], incoming, station):
		return 0
	return _slot_storage_capacity(state["inputs"], incoming)


func _furnace_automation_insert(gp: Vector3i, incoming: Dictionary) -> bool:
	var key := _edit_key(gp)
	var state := _ensure_furnace(gp)
	if not _furnace_automation_insert_state(gp, state, incoming):
		return false
	_furnaces[key] = state
	return true


func _furnace_automation_insert_state(
		gp: Vector3i, state: Dictionary, incoming: Dictionary) -> bool:
	if _furnace_automation_capacity_for_state(gp, state, incoming) \
			< int(incoming.get("count", 0)):
		return false
	var station := furnace_station_at(gp)
	if station == "furnace" and _fuel_seconds(incoming) > 0.0:
		var fuel: Dictionary = state["fuel"]
		if fuel.is_empty():
			state["fuel"] = incoming.duplicate(true)
		elif Inventory._can_merge(fuel, incoming):
			fuel["count"] = int(fuel["count"]) + int(incoming["count"])
			state["fuel"] = fuel
		else:
			return false
	else:
		var slots: Array = state["inputs"]
		if not _insert_into_slots(slots, incoming):
			return false
		state["inputs"] = slots
	return true


func _slot_storage_capacity(slots: Array, incoming: Dictionary) -> int:
	var capacity := 0
	for current in slots:
		if current.is_empty():
			capacity += Inventory.stack_max_count(incoming)
		elif Inventory._can_merge(current, incoming):
			capacity += maxi(
				0, Inventory.stack_max_count(current) - int(current["count"]))
	return capacity


func _insert_into_slots(slots: Array, value: Dictionary) -> bool:
	var incoming := value.duplicate(true)
	var remaining := int(incoming["count"])
	if _slot_storage_capacity(slots, incoming) < remaining:
		return false
	for i in slots.size():
		var current: Dictionary = slots[i]
		if not Inventory._can_merge(current, incoming):
			continue
		var move := mini(
			Inventory.stack_max_count(current) - int(current["count"]), remaining)
		if move <= 0:
			continue
		current["count"] = int(current["count"]) + move
		slots[i] = current
		remaining -= move
		if remaining <= 0:
			return true
	for i in slots.size():
		if remaining <= 0:
			break
		if not slots[i].is_empty():
			continue
		var placed := incoming.duplicate(true)
		var move := mini(Inventory.stack_max_count(placed), remaining)
		placed["count"] = move
		slots[i] = placed
		remaining -= move
	return remaining == 0


func _slot_storage_insert(gp: Vector3i, incoming: Dictionary) -> bool:
	var slots := _ensure_chest(gp)
	if not _insert_into_slots(slots, incoming):
		return false
	_chests[_edit_key(gp)] = slots
	return true


func get_automation_inspection(gp: Vector3i) -> Dictionary:
	return automation.get_inspection(gp) if automation != null else {}


func perform_automation_action(gp: Vector3i) -> Dictionary:
	if automation == null:
		return {"ok": false, "message": "Automation is unavailable."}
	var selected := Inventory.get_selected_stack()
	var selected_stable_id := Inventory.stack_stable_id(selected)
	return automation.perform_action(gp, selected_stable_id)


# ---------- Stage 6 magic infrastructure and spell queries ----------

func get_magic_inspection(gp: Vector3i) -> Dictionary:
	return magic.get_inspection(gp) if magic != null else {}


func get_magic_state(gp: Vector3i) -> Dictionary:
	return magic.get_state(gp) if magic != null else {}


func perform_magic_action(gp: Vector3i) -> Dictionary:
	if magic == null:
		return {"ok": false, "message": "Magic infrastructure is unavailable."}
	return magic.perform_action(gp)


func find_stone_sense_targets(
		origin: Vector3, radius: int = 10,
		max_targets: int = 24) -> Array[Vector3i]:
	var centre := Vector3i(origin.floor())
	var candidates: Array[Dictionary] = []
	var sensed_ids := {
		id_coal: true,
		id_copper: true,
		id_iron: true,
		id_mana: true,
	}
	for dy in range(-radius, radius + 1):
		for dx in range(-radius, radius + 1):
			for dz in range(-radius, radius + 1):
				var distance_squared := dx * dx + dy * dy + dz * dz
				if distance_squared > radius * radius:
					continue
				var target := centre + Vector3i(dx, dy, dz)
				if not sensed_ids.has(get_persisted_block_id(target)):
					continue
				candidates.append({
					"position": target,
					"distance_squared": distance_squared,
				})
	candidates.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["distance_squared"]) < int(b["distance_squared"]))
	var targets: Array[Vector3i] = []
	for candidate in candidates:
		if targets.size() >= max_targets:
			break
		targets.append(Vector3i(candidate["position"]))
	if magic != null:
		magic.show_stone_sense(targets)
	return targets


func show_spell_impact(position: Vector3, hit: bool) -> void:
	if magic != null:
		magic.show_spell_impact(position, hit)


func ward_coverage_at(position: Vector3) -> Dictionary:
	return magic.ward_coverage_at(position) if magic != null else {
		"warded": false,
		"active_wards": 0,
		"defence_bonus": 0,
		"nearest_distance": -1.0,
	}


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
	var out := {}
	for key in _edits:
		var stable_id := BlockRegistry.get_stable_id(int(_edits[key]))
		if stable_id.is_empty():
			push_warning("VoxelWorld: skipped unknown block edit while saving")
			continue
		out[key] = stable_id
	return out


func apply_edits(edits: Dictionary) -> void:
	for key in edits:
		var id := BlockRegistry.resolve_serialized_id(edits[key])
		if id < BlockRegistry.AIR:
			push_warning("VoxelWorld: ignored unknown saved block id %s" % str(edits[key]))
			continue
		_edits[key] = id
		if not _edit_provenance.has(str(key)):
			_edit_provenance[str(key)] = {
				"record_type": "EditProvenance",
				"version": 1,
				"source_type": "legacy_edit",
				"source_id": "save.migrated_edit",
				"settlement_id": "",
				"claim_id": "",
			}
	if automation != null:
		automation.notify_topology_changed()
	if edits.is_empty():
		return
	# Apply to already-loaded chunks, then enqueue one bounded rebuild each.
	for key in _edits:
		var gp := _key_to_pos(key)
		var cc := Vector3i(chunk_coord(gp.x), chunk_coord(gp.y), chunk_coord(gp.z))
		if chunks.has(cc):
			var local := gp - cc * CHUNK_SIZE
			chunks[cc].blocks[chunks[cc].index(local.x, local.y, local.z)] = int(_edits[key])
			_sync_forge_presentation_at(gp, int(_edits[key]))
			request_chunk_rebuild(cc)
			for off in DIRS6:
				request_chunk_rebuild(cc + off)


# ---------- World-generation manifest and validation ----------

func get_worldgen_manifest() -> Dictionary:
	if valley_plan == null:
		return {}
	var manifest: Dictionary = valley_plan.save_manifest()
	manifest["worldgen_version"] = active_worldgen_version
	return manifest


func is_worldgen_manifest_compatible(value: Variant) -> bool:
	# Empty manifests are legacy Stage 1 saves; the next successful save upgrades
	# them. Versioned Stage 2 saves must resolve to the exact deterministic plan.
	if not (value is Dictionary) or value.is_empty():
		return true
	var saved: Dictionary = value
	var current := get_worldgen_manifest()
	return int(saved.get("worldgen_version", -1)) == active_worldgen_version \
		and str(saved.get("profile_id", "")) == str(
			current.get("profile_id", "")) \
		and int(saved.get("version", -1)) == int(current.get("version", -2)) \
		and str(saved.get("plan_id", "")) == str(current.get("plan_id", ""))


func validate_worldgen() -> Array[String]:
	var errors: Array[String] = []
	if valley_plan == null:
		return ["valley_plan_not_built"]
	errors.append_array(valley_plan.validate())
	if is_regional_worldgen() and valley_plan.fallback_used:
		errors.append("fallback_layout_used")
	var spawn: Vector2i = valley_plan.get_anchor("spawn")
	if _height_at(spawn.x, spawn.y) <= SEA_LEVEL + 1:
		errors.append("spawn_is_not_dry")
	var spawn_position := find_spawn()
	if spawn_position.y < float(_highest_spawn_surface() + SPAWN_HEIGHT_CLEARANCE):
		errors.append("spawn_is_below_landing_area_clearance")
	var water: Vector2i = valley_plan.get_anchor("water")
	if _height_at(water.x, water.y) >= SEA_LEVEL:
		errors.append("guaranteed_water_is_not_carved")
	for anchor_id in ["spawn", "hamlet", "base_site", "goblin_camp"]:
		var anchor: Vector2i = valley_plan.get_anchor(anchor_id)
		var minimum := WORLD_HEIGHT
		var maximum := 0
		for offset in [Vector2i(-4, 0), Vector2i(4, 0), Vector2i(0, -4), Vector2i(0, 4), Vector2i.ZERO]:
			var height := _height_at(anchor.x + offset.x, anchor.y + offset.y)
			minimum = mini(minimum, height)
			maximum = maxi(maximum, height)
		if maximum - minimum > 2:
			errors.append("site_not_buildable:%s:%d" % [anchor_id, maximum - minimum])
	var cave: Vector2i = valley_plan.get_anchor("cave_entrance")
	var cave_floor := (
		_regional_cave_floor({
			"position": cave,
			"rotation": _starter_site_rotation("cave_entrance"),
		})
		if is_regional_worldgen()
		else floori(_cave_floor_height()))
	if _planned_cave_override(
			cave.x, cave_floor + 2, cave.y) != BlockRegistry.AIR:
		errors.append("cave_entrance_not_open")
	for entry in _guaranteed_resource_entries():
		if not _resource_entry_generates(entry):
			errors.append("missing_guaranteed_resource:%d" % int(entry["id"]))
	return errors


func _resource_entry_generates(entry: Dictionary) -> bool:
	var center: Vector3 = entry["p"]
	var expected_id := int(entry["id"])
	for dx in range(-3, 4):
		for dy in range(-3, 4):
			for dz in range(-3, 4):
				var gx := roundi(center.x) + dx
				var gy := roundi(center.y) + dy
				var gz := roundi(center.z) + dz
				var height := _height_at(gx, gz)
				if _block_at(gx, gy, gz, height, _biome_at(gx, gz)) == expected_id:
					return true
	return false


func nearest_valley_anchor(world_position: Vector3) -> Dictionary:
	if valley_plan == null:
		return {}
	return valley_plan.nearest_anchor(Vector2(world_position.x, world_position.z))


func get_valley_anchors() -> Dictionary:
	## Stable world-space X/Z anchors for persistent systems. Callers receive a
	## copy so village state cannot mutate the deterministic worldgen plan.
	return valley_plan.anchors.duplicate(true) if valley_plan != null else {}


func query_world_sites(
		chunk_rect: Rect2i,
		type_filter: Array[String] = []) -> Array[Dictionary]:
	if not is_regional_worldgen() \
			or valley_plan == null \
			or not valley_plan.has_method("query_sites"):
		return []
	return valley_plan.query_sites(chunk_rect, type_filter)


func get_world_site(site_id: String) -> Dictionary:
	if not is_regional_worldgen() \
			or valley_plan == null \
			or not valley_plan.has_method("get_site"):
		return {}
	return valley_plan.get_site(site_id)


func _starter_site_rotation(type_id: String) -> int:
	if not is_regional_worldgen():
		return 0
	for site in valley_plan.starter_sites:
		if str(site.get("type_id", "")) == type_id:
			return int(site.get("rotation", 0))
	return 0


func surface_height_at(gx: int, gz: int) -> int:
	return _height_at(gx, gz)


func get_hamlet_station_position(kind: String) -> Vector3i:
	if valley_plan == null:
		return Vector3i(0, -100000, 0)
	var hamlet: Vector2i = (
		HamletState.hamlet_anchor
		if HamletState.initialized and HamletState.world_seed == world_seed
		else valley_plan.get_anchor("hamlet"))
	var ground := _height_at(hamlet.x, hamlet.y)
	if kind == "warehouse":
		var warehouse: Vector2i = (
			HamletState.warehouse_anchor
			if HamletState.initialized and HamletState.world_seed == world_seed
			else valley_plan.get_anchor("warehouse"))
		return Vector3i(
			warehouse.x, _height_at(warehouse.x, warehouse.y) + 1,
			warehouse.y)
	if kind == "request_board":
		var board := (
			SettlementManager.focused_station("request_board")
			if is_regional_worldgen()
			else hamlet + Vector2i(3, 0))
		return Vector3i(
			board.x, _height_at(board.x, board.y), board.y)
	return Vector3i(0, -100000, 0)


func get_blueprint_stage_placements(
		blueprint_id: String,
		stage_id: String,
		anchor: Vector3i,
		palette_override: Dictionary = {},
		rotation: int = 0) -> Array[Dictionary]:
	## Resolves an immutable blueprint stage into stable world-space writes.
	## The registry guarantees deterministic local ordering; converting stable
	## block IDs here keeps numeric runtime IDs out of settlement content data.
	var placements: Array[Dictionary] = []
	var cells := SettlementContentRegistry.expand_blueprint_stage(
		blueprint_id, stage_id, palette_override)
	for cell in cells:
		var local_value: Array = cell.get("local_position", [])
		if local_value.size() != 3:
			continue
		var stable_id := str(cell.get("stable_id", ""))
		var block_id := BlockRegistry.get_id_by_stable_id(stable_id)
		if block_id <= 0:
			push_error(
				"VoxelWorld: blueprint %s references unknown block %s"
				% [blueprint_id, stable_id])
			return []
		var rotated := _rotate_blueprint_local(
			Vector2i(int(local_value[0]), int(local_value[2])), rotation)
		placements.append({
			"position": anchor + Vector3i(
				rotated.x, int(local_value[1]), rotated.y),
			"block_id": block_id,
			"stable_id": stable_id,
			"token": str(cell.get("token", "")),
			"rotation": posmod(rotation, 360),
			"facing": posmod(roundi(float(rotation) / 90.0), 4),
		})
	return placements


func get_project_stage_placements(
		project_id: String,
		stage_index: int,
		anchor: Vector3i,
		palette_override: Dictionary = {},
		rotation: int = 0) -> Array[Dictionary]:
	var project_definition := SettlementContentRegistry.get_project(project_id)
	if project_definition.is_empty() or stage_index <= 0:
		return []
	var stage: Dictionary = {}
	for stage_value in project_definition.get("stages", []):
		if int((stage_value as Dictionary).get("index", 0)) == stage_index:
			stage = stage_value
			break
	if stage.is_empty():
		return []
	return get_blueprint_stage_placements(
		str(project_definition.get("blueprint_id", "")),
		str(stage.get("id", "")),
		anchor,
		palette_override,
		rotation)


func place_blueprint_stage_cell(
		blueprint_id: String,
		stage_id: String,
		anchor: Vector3i,
		placement_index: int,
		palette_override: Dictionary = {},
		rotation: int = 0,
		settlement_id: String = "",
		claim_id: String = "") -> bool:
	var placements := get_blueprint_stage_placements(
		blueprint_id, stage_id, anchor, palette_override, rotation)
	if placement_index < 0 or placement_index >= placements.size():
		return false
	var placement: Dictionary = placements[placement_index]
	var position: Vector3i = placement["position"]
	var target_id := int(placement["block_id"])
	if is_door_id(target_id):
		var upper := position + Vector3i.UP
		for other in placements:
			if Vector3i(other["position"]) == upper:
				push_warning(
					"VoxelWorld: blueprint door upper cell conflicts with authored placement")
				return false
		if is_door_at(position):
			return true
		return place_door(
			position, target_id, int(placement.get("facing", 0)), -1,
			"project.blueprint.%s" % blueprint_id, "project",
			settlement_id, claim_id)
	if get_block_global(position) == target_id:
		return true
	return set_block_with_provenance(
		position, target_id, "project.blueprint.%s" % blueprint_id,
		"project", settlement_id, claim_id)


func apply_project_blueprint_stages(
		project_id: String,
		completed_stages: int,
		anchor: Vector3i,
		palette_override: Dictionary = {},
		rotation: int = 0,
		settlement_id: String = "",
		claim_id: String = "") -> bool:
	## Cumulative, idempotent catch-up for near/far simulation and save loads.
	if completed_stages <= 0:
		return true
	var project_definition := SettlementContentRegistry.get_project(project_id)
	if project_definition.is_empty():
		return false
	var all_loaded := true
	var stages: Array = project_definition.get("stages", [])
	for index in range(1, mini(completed_stages, stages.size()) + 1):
		for placement in get_project_stage_placements(
				project_id, index, anchor, palette_override, rotation):
			var position: Vector3i = placement["position"]
			var target_id := int(placement["block_id"])
			if is_door_id(target_id):
				if is_door_at(position):
					continue
				if not place_door(
					position, target_id, int(placement.get("facing", 0)), -1,
					"project.blueprint.%s" % project_id, "project",
					settlement_id, claim_id):
					all_loaded = false
				continue
			if get_block_global(position) == target_id:
				continue
			if not set_block_with_provenance(
					position, target_id,
					"project.blueprint.%s" % project_id, "project",
					settlement_id, claim_id):
				all_loaded = false
	return all_loaded


func _rotate_blueprint_local(point: Vector2i, rotation: int) -> Vector2i:
	match posmod(roundi(float(rotation) / 90.0), 4):
		1:
			return Vector2i(-point.y, point.x)
		2:
			return Vector2i(-point.x, -point.y)
		3:
			return Vector2i(point.y, -point.x)
	return point


func _watchtower_blueprint_anchor() -> Vector3i:
	if valley_plan == null:
		return Vector3i(0, -100000, 0)
	var site: Vector2i = (
		HamletState.watchtower_anchor
		if HamletState.initialized and HamletState.world_seed == world_seed
		else valley_plan.get_anchor("watchtower_site"))
	return Vector3i(site.x, _height_at(site.x, site.y), site.y)


func get_watchtower_stage_placements(stage_index: int) -> Array[Dictionary]:
	## Version-13 compatibility wrapper. New callers use generic project IDs.
	if valley_plan == null or stage_index <= 0:
		return []
	return get_project_stage_placements(
		"project.build.wooden_watchtower",
		stage_index,
		_watchtower_blueprint_anchor())


func place_watchtower_stage_block(stage_index: int, placement_index: int) -> bool:
	## Version-13 compatibility wrapper.
	var project_definition := SettlementContentRegistry.get_project(
		"project.build.wooden_watchtower")
	var stages: Array = project_definition.get("stages", [])
	if stage_index <= 0 or stage_index > stages.size():
		return false
	var stage: Dictionary = stages[stage_index - 1]
	return place_blueprint_stage_cell(
		str(project_definition.get("blueprint_id", "")),
		str(stage.get("id", "")),
		_watchtower_blueprint_anchor(),
		placement_index)


func apply_watchtower_project_stage(stage_index: int) -> bool:
	## Version-13 compatibility wrapper used by the existing runtime scene.
	if valley_plan == null:
		return stage_index <= 0
	return apply_project_blueprint_stages(
		"project.build.wooden_watchtower",
		stage_index,
		_watchtower_blueprint_anchor())


func resolve_safe_player_position(requested: Vector3) -> Vector3:
	## Keeps valid cave/interior saves intact, but repairs positions embedded in
	## terrain or below the generated world into the closest loaded 2x2x2 air
	## space. Spawn is only the final fallback when no local landing exists.
	if requested.y >= 1.0 and is_player_space_clear(requested):
		return requested
	return find_nearest_safe_player_position(requested)


func is_player_space_clear(position: Vector3) -> bool:
	## Tests every voxel touched by the player's capsule-sized body bounds.
	var minimum := Vector3i(
		floori(position.x - 0.34),
		floori(position.y + 0.05),
		floori(position.z - 0.34))
	var maximum := Vector3i(
		floori(position.x + 0.34),
		floori(position.y + 1.75),
		floori(position.z + 0.34))
	for gx in range(minimum.x, maximum.x + 1):
		for gy in range(minimum.y, maximum.y + 1):
			for gz in range(minimum.z, maximum.z + 1):
				var id := get_block_global(Vector3i(gx, gy, gz))
				if not BlockRegistry.is_air(id) and not BlockRegistry.is_water(id):
					return false
	return true


func find_nearest_safe_player_position(origin: Vector3) -> Vector3:
	## Recovery targets are flat 2x2 floors with a 2x2x2 volume of actual air.
	## The exhaustive search is intentionally only used during recovery/load.
	var origin_cell := Vector3i(floori(origin.x), 0, floori(origin.z))
	var best_position := Vector3.ZERO
	var best_distance_squared := INF
	var found := false
	for dx in range(-LOCAL_RECOVERY_RADIUS, LOCAL_RECOVERY_RADIUS + 1):
		for dz in range(-LOCAL_RECOVERY_RADIUS, LOCAL_RECOVERY_RADIUS + 1):
			for feet_y in range(1, WORLD_HEIGHT - RECOVERY_SPACE_SIZE + 1):
				var base := Vector3i(origin_cell.x + dx, feet_y, origin_cell.z + dz)
				if not _is_safe_recovery_space(base):
					continue
				var candidate := Vector3(
					float(base.x) + float(RECOVERY_SPACE_SIZE) * 0.5,
					float(base.y) + 0.05,
					float(base.z) + float(RECOVERY_SPACE_SIZE) * 0.5)
				var distance_squared := candidate.distance_squared_to(origin)
				if distance_squared < best_distance_squared:
					best_distance_squared = distance_squared
					best_position = candidate
					found = true
	return best_position if found else find_spawn()


func _is_safe_recovery_space(base: Vector3i) -> bool:
	for dx in RECOVERY_SPACE_SIZE:
		for dz in RECOVERY_SPACE_SIZE:
			var ground := base + Vector3i(dx, -1, dz)
			if not _is_voxel_loaded(ground):
				return false
			var ground_id := get_block_global(ground)
			if BlockRegistry.is_air(ground_id) or BlockRegistry.is_water(ground_id):
				return false
			for dy in RECOVERY_SPACE_SIZE:
				var air_cell := base + Vector3i(dx, dy, dz)
				if not _is_voxel_loaded(air_cell) \
						or not BlockRegistry.is_air(get_block_global(air_cell)):
					return false
	return true


func _is_voxel_loaded(global_position: Vector3i) -> bool:
	if global_position.y < 0 or global_position.y >= WORLD_HEIGHT:
		return false
	var cc := Vector3i(
		chunk_coord(global_position.x),
		chunk_coord(global_position.y),
		chunk_coord(global_position.z))
	return chunks.has(cc)


# ---------- Spawn ----------

func find_spawn() -> Vector3:
	if valley_plan != null:
		var planned: Vector2i = valley_plan.get_anchor("spawn")
		var highest_surface := _highest_spawn_surface()
		return Vector3(
			float(planned.x) + 0.5,
			float(highest_surface + SPAWN_HEIGHT_CLEARANCE),
			float(planned.y) + 0.5)
	# Legacy fallback for callers that ask before a valley plan exists.
	for r in range(0, 96, 4):
		for a in range(0, 360, 45):
			var gx := int(float(r) * cos(deg_to_rad(float(a))))
			var gz := int(float(r) * sin(deg_to_rad(float(a))))
			var h := _height_at(gx, gz)
			if h > SEA_LEVEL + 1:
				return Vector3(float(gx) + 0.5, float(h) + 2.0, float(gz) + 0.5)
	return Vector3(0.5, float(WORLD_HEIGHT) - 2.0, 0.5)


func _highest_spawn_surface() -> int:
	if valley_plan == null:
		return 0
	var planned: Vector2i = valley_plan.get_anchor("spawn")
	var highest := 0
	for dx in range(-SPAWN_SAMPLE_RADIUS, SPAWN_SAMPLE_RADIUS + 1):
		for dz in range(-SPAWN_SAMPLE_RADIUS, SPAWN_SAMPLE_RADIUS + 1):
			highest = maxi(highest, _height_at(planned.x + dx, planned.y + dz))
	return highest
