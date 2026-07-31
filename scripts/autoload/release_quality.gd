extends Node
## Stage 9 release-candidate diagnostics, scalability, and clean-session marker.
##
## This service observes authoritative systems; it never owns gameplay state.
## Reports contain build/runtime facts only and intentionally omit player names,
## free-form text, file-system paths, and other unnecessary personal data.

signal snapshot_updated(snapshot: Dictionary)
signal profile_applied(profile_id: String)

const REPORT_VERSION := 1
const BUILD_STAGE := "post_poc_development"
const SESSION_MARKER_PATH := "user://leyforge_session_marker.json"
const UNCLEAN_REPORT_PATH := "user://leyforge_last_unclean_session.json"
const PERFORMANCE_REPORT_PATH := "user://leyforge_release_report.json"
const MAX_FRAME_SAMPLES := 1800
const PROFILES := {
	"performance": {
		"chunk_radius": 2,
		"npc_actor_range": 76.0,
		"npc_demote_range": 92.0,
		"automation_visual_distance": 32.0,
		"magic_visual_distance": 40.0,
	},
	"balanced": {
		"chunk_radius": 3,
		"npc_actor_range": 92.0,
		"npc_demote_range": 108.0,
		"automation_visual_distance": 46.0,
		"magic_visual_distance": 56.0,
	},
	"quality": {
		"chunk_radius": 4,
		"npc_actor_range": 120.0,
		"npc_demote_range": 140.0,
		"automation_visual_distance": 64.0,
		"magic_visual_distance": 72.0,
	},
}

var last_unclean_session: Dictionary = {}
var _session: Node
var _frame_samples: Array[float] = []
var _session_started_unix := 0
var _session_active := false
var _snapshot_accumulator := 0.0
var _last_window_size := Vector2i.ZERO


func _ready() -> void:
	set_process(false)


func attach(session: Node) -> void:
	_session = session
	var window := get_window()
	if is_instance_valid(window):
		_last_window_size = window.size
	if not _session_active:
		_begin_session()
	if not UIState.settings_changed.is_connected(_on_settings_changed):
		UIState.settings_changed.connect(_on_settings_changed)
	apply_profile(str(UIState.settings.get("quality_profile", "balanced")))
	set_process(true)


func _process(delta: float) -> void:
	if delta > 0.0 and delta < 1.0:
		_frame_samples.append(delta * 1000.0)
		if _frame_samples.size() > MAX_FRAME_SAMPLES:
			_frame_samples.pop_front()
	_snapshot_accumulator += delta
	if _snapshot_accumulator >= 1.0:
		_snapshot_accumulator = 0.0
		snapshot_updated.emit(performance_snapshot())


func _notification(what: int) -> void:
	if what == NOTIFICATION_PREDELETE and _session_active:
		mark_clean_shutdown("engine_shutdown")


func _on_settings_changed() -> void:
	apply_profile(str(UIState.settings.get("quality_profile", "balanced")))


func apply_profile(profile_id: String) -> bool:
	if not PROFILES.has(profile_id):
		return false
	var profile: Dictionary = PROFILES[profile_id]
	if is_instance_valid(_session):
		var world: Node = _session.get("world")
		var hamlet_runtime: Node = _session.get("hamlet_runtime")
		if is_instance_valid(world) and world.has_method("apply_scalability_profile"):
			world.call("apply_scalability_profile", profile)
		if is_instance_valid(hamlet_runtime) \
				and hamlet_runtime.has_method("apply_scalability_profile"):
			hamlet_runtime.call("apply_scalability_profile", profile)
	profile_applied.emit(profile_id)
	return true


func profile_definition(profile_id: String) -> Dictionary:
	return PROFILES.get(profile_id, PROFILES["balanced"]).duplicate(true)


func build_metadata() -> Dictionary:
	var version_info := Engine.get_version_info()
	return {
		"report_version": REPORT_VERSION,
		"build_stage": BUILD_STAGE,
		"project_version": "%s-%s" % [
			str(ProjectSettings.get_setting(
				"application/config/version", "0.10.0")),
			str(ProjectSettings.get_setting(
				"application/config/release_channel", "dev")),
		],
		"godot_version": str(version_info.get("string", "unknown")),
		"save_version": 17,
		"worldgen_version": VoxelWorld.WORLDGEN_VERSION,
		"block_count": BlockRegistry.get_all_ids().size(),
		"item_count": ItemRegistry.get_all_ids().size(),
		"content_sha256": _content_hash(),
	}


func hardware_summary() -> Dictionary:
	var window := get_window()
	if is_instance_valid(window):
		_last_window_size = window.size
	return {
		"os": OS.get_name(),
		"os_version": OS.get_version(),
		"processor": OS.get_processor_name(),
		"logical_processors": OS.get_processor_count(),
		"video_adapter": RenderingServer.get_video_adapter_name(),
		"video_vendor": RenderingServer.get_video_adapter_vendor(),
		"rendering_method": RenderingServer.get_current_rendering_method(),
		"render_width": _last_window_size.x,
		"render_height": _last_window_size.y,
	}


func performance_snapshot() -> Dictionary:
	var sorted_samples := _frame_samples.duplicate()
	sorted_samples.sort()
	var p95_ms := 0.0
	var maximum_ms := 0.0
	if not sorted_samples.is_empty():
		var p95_index := clampi(
			ceili(float(sorted_samples.size()) * 0.95) - 1,
			0, sorted_samples.size() - 1)
		p95_ms = float(sorted_samples[p95_index])
		maximum_ms = float(sorted_samples[-1])
	var systems := {}
	if is_instance_valid(_session):
		var world: Node = _session.get("world")
		var hamlet_runtime: Node = _session.get("hamlet_runtime")
		var raid_runtime: Node = _session.get("raid_runtime")
		if is_instance_valid(world) and world.has_method("runtime_counters"):
			systems["world"] = world.call("runtime_counters")
		if is_instance_valid(hamlet_runtime):
			systems["active_villagers"] = hamlet_runtime.call(
				"active_actor_count") if hamlet_runtime.has_method(
					"active_actor_count") else 0
		if is_instance_valid(raid_runtime):
			systems["active_raiders"] = raid_runtime.call(
				"active_actor_count") if raid_runtime.has_method(
					"active_actor_count") else 0
	return {
		"captured_utc": Time.get_datetime_string_from_system(true),
		"profile": str(UIState.settings.get("quality_profile", "balanced")),
		"sample_count": sorted_samples.size(),
		"fps": float(Performance.get_monitor(Performance.TIME_FPS)),
		"frame_p95_ms": p95_ms,
		"frame_max_ms": maximum_ms,
		"process_ms": float(
			Performance.get_monitor(Performance.TIME_PROCESS)) * 1000.0,
		"physics_ms": float(
			Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS)) * 1000.0,
		"static_memory_bytes": int(
			Performance.get_monitor(Performance.MEMORY_STATIC)),
		"node_count": int(
			Performance.get_monitor(Performance.OBJECT_NODE_COUNT)),
		"fallback_30fps_guard_met": sorted_samples.size() >= 60 \
			and p95_ms <= 33.34,
		"target_60fps_guard_met": sorted_samples.size() >= 60 \
			and p95_ms <= 16.67,
		"systems": systems,
	}


func reset_performance_samples() -> void:
	_frame_samples.clear()
	_snapshot_accumulator = 0.0


func release_report() -> Dictionary:
	var save_health := {}
	if is_instance_valid(_session) and _session.has_method("save_health_report"):
		save_health = _session.call("save_health_report")
	return {
		"build": build_metadata(),
		"hardware": hardware_summary(),
		"session": {
			"started_unix": _session_started_unix,
			"unclean_previous_session_detected": not last_unclean_session.is_empty(),
		},
		"save_health": save_health,
		"performance": performance_snapshot(),
	}


func write_release_report(path: String = PERFORMANCE_REPORT_PATH) -> bool:
	return _write_json(path, release_report())


func mark_clean_shutdown(reason: String = "clean") -> void:
	if not _session_active:
		return
	write_release_report()
	var marker_absolute := ProjectSettings.globalize_path(SESSION_MARKER_PATH)
	if FileAccess.file_exists(SESSION_MARKER_PATH):
		DirAccess.remove_absolute(marker_absolute)
	_session_active = false
	set_process(false)
	if not reason.is_empty():
		print("RELEASE_QUALITY: clean session end (%s)" % reason)


func _begin_session() -> void:
	last_unclean_session = _read_json(SESSION_MARKER_PATH)
	if not last_unclean_session.is_empty():
		var report := {
			"detected_utc": Time.get_datetime_string_from_system(true),
			"previous_session": last_unclean_session,
			"message": "The previous process did not record a clean shutdown.",
		}
		_write_json(UNCLEAN_REPORT_PATH, report)
	_session_started_unix = int(Time.get_unix_time_from_system())
	_session_active = true
	_write_json(SESSION_MARKER_PATH, {
		"report_version": REPORT_VERSION,
		"started_unix": _session_started_unix,
		"build": build_metadata(),
	})


func _content_hash() -> String:
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	for path in [BlockRegistry.REGISTRY_PATH]:
		if FileAccess.file_exists(path):
			context.update(FileAccess.get_file_as_bytes(path))
	return context.finish().hex_encode()


func _read_json(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}


func _write_json(path: String, value: Dictionary) -> bool:
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		return false
	file.store_string(JSON.stringify(value, "\t"))
	file.flush()
	var result := file.get_error() == OK
	file.close()
	return result
