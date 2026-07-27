extends Node
## Deterministic packaged-build traversal/performance capture for Stage 9.

const WARMUP_FRAMES := 180
const CAPTURE_FRAMES := 900
const SEGMENT_FRAMES := 180


func start(session: Node3D) -> void:
	var world: VoxelWorld = session.get_node("VoxelWorld")
	var player: Player = session.get_node("Player")
	UIState.set_setting("quality_profile", "balanced")
	var anchors := world.get_valley_anchors()
	var route: Array[Vector3] = [world.find_spawn()]
	for anchor_id in [
		"hamlet", "base_site", "cave_entrance", "raid_approach",
		"goblin_camp",
	]:
		var anchor: Vector2i = anchors[anchor_id]
		route.append(Vector3(
			anchor.x + 0.5,
			world.surface_height_at(anchor.x, anchor.y) + 4.0,
			anchor.y + 0.5))

	for _frame in WARMUP_FRAMES:
		await get_tree().process_frame
	ReleaseQuality.reset_performance_samples()
	for frame in CAPTURE_FRAMES:
		if frame % SEGMENT_FRAMES == 0:
			var route_index := mini(
				floori(float(frame) / float(SEGMENT_FRAMES)) + 1,
				route.size() - 1)
			player.global_position = route[route_index]
		await get_tree().process_frame
	var snapshot := ReleaseQuality.performance_snapshot()
	ReleaseQuality.write_release_report()
	print("STAGE9_PACKAGED_BENCHMARK ", JSON.stringify({
		"ok": bool(snapshot.get("fallback_30fps_guard_met", false)),
		"profile": snapshot.get("profile", ""),
		"samples": snapshot.get("sample_count", 0),
		"frame_p95_ms": snapshot.get("frame_p95_ms", 0.0),
		"frame_max_ms": snapshot.get("frame_max_ms", 0.0),
		"fps": snapshot.get("fps", 0.0),
		"systems": snapshot.get("systems", {}),
	}))
	ReleaseQuality.mark_clean_shutdown("stage9_packaged_benchmark")
	get_tree().quit(0 if bool(
		snapshot.get("fallback_30fps_guard_met", false)) else 1)
