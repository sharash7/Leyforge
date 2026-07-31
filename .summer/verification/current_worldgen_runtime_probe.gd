extends Node
## Representative full VoxelWorld construction and validation across edge,
## numeric, and text-derived seeds.

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var seeds: Array[int] = [
		-2147483648, -1, 0, 1, 2147483647,
		int(WorldManager.resolve_seed("Leyforge")["resolved"]),
		int(WorldManager.resolve_seed("Forest Hamlet")["resolved"]),
		int(WorldManager.resolve_seed("forest hamlet")["resolved"]),
	]
	var manifests := {}
	for seed_value in seeds:
		var world := VoxelWorld.new()
		world.set_process(false)
		add_child(world)
		world.start(seed_value, {
			"worldgen_version": VoxelWorld.WORLDGEN_VERSION,
			"plan_version": WorldStructurePlanner.VERSION,
		})
		var errors := world.validate_worldgen()
		_check(world.started, "seed %d did not start" % seed_value)
		_check(errors.is_empty(), "seed %d runtime invalid: %s" % [
			seed_value, errors])
		_check(
			not world.valley_plan.fallback_used,
			"seed %d runtime used fallback" % seed_value)
		var manifest := world.get_worldgen_manifest()
		_check(
			int(manifest.get("worldgen_version", 0))
				== VoxelWorld.WORLDGEN_VERSION
				and int(manifest.get("version", 0))
				== WorldStructurePlanner.VERSION
				and str(manifest.get("starter_mode", ""))
				== WorldStructurePlanner.STARTER_MODE,
			"seed %d runtime manifest versions differ" % seed_value)
		_check(
			not world.query_world_sites(
				Rect2i(Vector2i(-32, -32), Vector2i(64, 64))).is_empty(),
			"seed %d returned no regional sites" % seed_value)
		manifests[seed_value] = manifest
		world.queue_free()
		await get_tree().process_frame

	for seed_value in seeds:
		var replay := VoxelWorld.new()
		replay.set_process(false)
		add_child(replay)
		replay.start(seed_value, {
			"worldgen_version": VoxelWorld.WORLDGEN_VERSION,
			"plan_version": WorldStructurePlanner.VERSION,
		})
		_check(
			replay.get_worldgen_manifest() == manifests[seed_value],
			"seed %d changed after full runtime rebuild" % seed_value)
		replay.queue_free()
		await get_tree().process_frame

	var border_seed := 0x5A17
	var border_world := VoxelWorld.new()
	border_world.set_process(false)
	add_child(border_world)
	border_world.start(border_seed, {
		"worldgen_version": VoxelWorld.WORLDGEN_VERSION,
		"plan_version": WorldStructurePlanner.VERSION,
	})
	var ruin_filter: Array[String] = ["rune_ruin"]
	var ruin_sites := border_world.query_world_sites(
		Rect2i(Vector2i(-48, -48), Vector2i(96, 96)), ruin_filter)
	var border_site: Dictionary = {}
	for site in ruin_sites:
		if not bool(site.get("is_starter", false)):
			border_site = site
			break
	_check(
		not border_site.is_empty(),
		"could not locate a regional structure for the chunk-border test")
	var forward_snapshot := {}
	if not border_site.is_empty():
		forward_snapshot = _structure_snapshot(
			border_world, border_site, false)
	border_world.queue_free()
	await get_tree().process_frame

	var reverse_world := VoxelWorld.new()
	reverse_world.set_process(false)
	add_child(reverse_world)
	reverse_world.start(border_seed, {
		"worldgen_version": VoxelWorld.WORLDGEN_VERSION,
		"plan_version": WorldStructurePlanner.VERSION,
	})
	var reverse_snapshot := (
		_structure_snapshot(reverse_world, border_site, true)
		if not border_site.is_empty() else {})
	_check(
		not forward_snapshot.is_empty()
			and forward_snapshot.get("signature", "")
				== reverse_snapshot.get("signature", ""),
		"structure spanning chunk borders changed with generation order")
	_check(
		int(forward_snapshot.get("template_blocks", 0)) > 0
			and int(forward_snapshot.get("template_blocks", 0))
				== int(reverse_snapshot.get("template_blocks", -1)),
		"chunk-border structure template did not stamp exactly once")
	reverse_world.queue_free()
	await get_tree().process_frame

	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"runtime_worlds": seeds.size(),
		"failures": failures,
	}
	print("CURRENT_WORLDGEN_RUNTIME_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if failures.is_empty() else 1)


func _structure_snapshot(
		world: VoxelWorld,
		site: Dictionary,
		reverse_order: bool) -> Dictionary:
	var position := Vector2i(site["position"])
	var footprint := Vector2i(site["footprint"])
	var half := Vector2i(
		ceili(float(footprint.x) * 0.5),
		ceili(float(footprint.y) * 0.5))
	var minimum := position - half
	var maximum := position + half
	var chunks: Array[Vector2i] = []
	for cz in range(
			world.chunk_coord(minimum.y),
			world.chunk_coord(maximum.y) + 1):
		for cx in range(
				world.chunk_coord(minimum.x),
				world.chunk_coord(maximum.x) + 1):
			chunks.append(Vector2i(cx, cz))
	chunks.sort_custom(func(a: Vector2i, b: Vector2i) -> bool:
		return a.y < b.y or (a.y == b.y and a.x < b.x))
	if reverse_order:
		chunks.reverse()
	for chunk in chunks:
		world.prepare_player_column(Vector3(
			chunk.x * VoxelWorld.CHUNK_SIZE + VoxelWorld.CHUNK_SIZE / 2,
			20.0,
			chunk.y * VoxelWorld.CHUNK_SIZE + VoxelWorld.CHUNK_SIZE / 2))
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	var template_id := BlockRegistry.get_id_by_stable_id(
		"construction.brick.stone")
	var template_blocks := 0
	for z in range(minimum.y, maximum.y + 1):
		for x in range(minimum.x, maximum.x + 1):
			for y in VoxelWorld.WORLD_HEIGHT:
				var block_id := world.get_block_global(Vector3i(x, y, z))
				if block_id == template_id:
					template_blocks += 1
				context.update(PackedByteArray([
					block_id & 0xFF,
					(block_id >> 8) & 0xFF,
				]))
	return {
		"signature": context.finish().hex_encode(),
		"template_blocks": template_blocks,
	}
