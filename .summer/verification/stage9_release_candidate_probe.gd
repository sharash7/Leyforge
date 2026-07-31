extends Node
## Stage 9 hardening gate: integrity/recovery, migration, scalability,
## diagnostics, accessibility/localisation readiness, and NPC LOD soak.

const SAVE_PREFIX := "res://.summer/verification/.stage9_release_state"
const REPORT_PATH := "res://.summer/verification/.stage9_release_report.json"

var failures: Array[String] = []
var checks := 0
@onready var main: Node3D = $Main


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	var hud: Hud = main.get_node("HUD")
	var hamlet_runtime: HamletRuntime = main.get_node("HamletRuntime")
	_check(main.configure_verification_save_paths(SAVE_PREFIX),
		"Stage 9 save fixtures were not isolated from player data")

	var build := ReleaseQuality.build_metadata()
	_check(str(build.get("build_stage", "")) == "post_poc_development"
			and str(build.get("project_version", "")) == "0.10.0-dev",
		"active development build metadata is missing or stale")
	_check(int(build.get("save_version", 0)) == 17
			and int(build.get("block_count", 0)) == 143
			and int(build.get("item_count", 0)) == 169,
		"build metadata omitted the locked save or registry baseline")
	_check(str(build.get("content_sha256", "")).length() == 64,
		"release metadata omitted its content hash")
	_check(FileAccess.get_file_as_bytes(BlockRegistry.REGISTRY_PATH)
			== FileAccess.get_file_as_bytes(
				"res://.summer/00_Docs/VoxelRegistry.json"),
		"packaged runtime registry drifted from the design registry source")

	# Two valid generations establish a recoverable backup. A parseable mutation
	# of the final save must fail its hash and fall back to the previous state.
	MagicState.mana = 11.0
	_check(main._save_game(), "first integrity fixture save failed")
	var first: Dictionary = main._read_save()
	_check(main.validate_save_integrity(first),
		"fresh version-17 save failed its own integrity check")
	MagicState.mana = 22.0
	_check(main._save_game(), "second integrity fixture save failed")
	var second: Dictionary = main._read_save()
	_check(main.validate_save_integrity(second)
			and is_equal_approx(float(second.get(
				"magic_player", {}).get("mana", 0.0)), 22.0),
		"latest integrity fixture did not preserve its authoritative payload")

	var final_path := "%s.json" % SAVE_PREFIX
	var corrupt: Variant = JSON.parse_string(
		FileAccess.get_file_as_string(final_path))
	if corrupt is Dictionary:
		corrupt["seed"] = int(corrupt.get("seed", 0)) + 1
		var file := FileAccess.open(final_path, FileAccess.WRITE)
		if file != null:
			file.store_string(JSON.stringify(corrupt))
			file.close()
	var recovered: Dictionary = main._read_save()
	var health: Dictionary = main.save_health_report()
	_check(is_equal_approx(float(recovered.get(
			"magic_player", {}).get("mana", 0.0)), 11.0),
		"corrupted final save did not recover the prior authoritative payload")
	_check(str(health.get("status", "")) == "recovered"
			and str(health.get("source", "")) == "backup"
			and "final" in health.get("rejected_candidates", []),
		"save health report did not identify integrity rejection and backup recovery")

	var v12_fixture: Dictionary = recovered.duplicate(true)
	v12_fixture["version"] = 12
	v12_fixture.erase("integrity")
	v12_fixture.erase("save_manifest")
	var migrated: Dictionary = main._migrate_save(v12_fixture)
	_check(int(migrated.get("version", 0)) == 17
			and int(migrated.get("save_manifest", {}).get(
				"migrated_from", 0)) == 12,
		"representative Stage 8 save did not migrate to version 17")
	_check(main.validate_save_integrity(migrated),
		"migrated representative save did not receive a valid integrity record")
	var oversized := {"version": 17, "item_drops": []}
	oversized["item_drops"].resize(10001)
	_check(not main._validate_save_shape(oversized),
		"bounded save validation accepted an excessive item-drop list")

	# Profiles change view/actor budgets only; authoritative simulation cadence
	# and transaction state remain unchanged.
	_check(UIState.set_setting("quality_profile", "performance"),
		"performance scalability profile was rejected")
	await get_tree().process_frame
	_check(world.render_radius == 2
			and is_equal_approx(hamlet_runtime.actor_range, 76.0)
			and is_equal_approx(world.automation.visual_distance, 32.0)
			and is_equal_approx(world.magic.visual_distance, 40.0),
		"performance profile did not apply its declared subsystem budgets")
	_check(UIState.set_setting("quality_profile", "quality"),
		"quality scalability profile was rejected")
	await get_tree().process_frame
	_check(world.render_radius == 4
			and is_equal_approx(hamlet_runtime.actor_range, 120.0)
			and is_equal_approx(world.automation.visual_distance, 64.0)
			and is_equal_approx(world.magic.visual_distance, 72.0),
		"quality profile did not apply its declared subsystem budgets")
	UIState.set_setting("quality_profile", "balanced")

	var counters := world.runtime_counters()
	_check(counters.has("loaded_chunks") and counters.has("rebuild_backlog")
			and counters.get("automation", {}) is Dictionary
			and counters.get("magic", {}) is Dictionary,
		"performance dashboard omitted required subsystem counters")
	_check(int(counters.get("rebuild_backlog", 0)) <= VoxelWorld.MAX_REBUILD_BACKLOG,
		"streaming rebuild backlog exceeded its declared hard limit")

	# Repeated promotion/demotion must preserve the eight stable NPC records.
	var identity_before: Array[String] = HamletState.get_npc_ids()
	for npc_id in identity_before:
		var record := HamletState.get_npc_record(npc_id)
		var saved_position: Array = record.get("position", [])
		if saved_position.size() == 3:
			world.prepare_player_column(Vector3(
				float(saved_position[0]), float(saved_position[1]),
				float(saved_position[2])))
	var near_position := Vector3(
		HamletState.hamlet_anchor.x, player.global_position.y,
		HamletState.hamlet_anchor.y)
	for _cycle in 4:
		player.global_position = near_position
		for npc_id in identity_before:
			var cycle_record := HamletState.get_npc_record(npc_id)
			var cycle_position: Array = cycle_record.get("position", [])
			if cycle_position.size() == 3:
				world.prepare_player_column(Vector3(
					float(cycle_position[0]), float(cycle_position[1]),
					float(cycle_position[2])))
		hamlet_runtime._refresh_actor_lod()
		_check(hamlet_runtime.active_actor_count() == 8,
			"NPC LOD soak failed to promote the complete named roster")
		player.global_position = near_position + Vector3(500.0, 0.0, 500.0)
		hamlet_runtime._refresh_actor_lod()
		_check(hamlet_runtime.active_actor_count() == 0,
			"NPC LOD soak failed to demote actors to persistent records")
		await get_tree().process_frame
	_check(HamletState.get_npc_ids() == identity_before,
		"NPC LOD soak changed stable identities")

	# Accessibility and localisation readiness are release gates even though the
	# POC ships English-only content.
	UIState.set_setting("ui_scale", 1.5)
	UIState.set_setting("high_contrast", true)
	UIState.set_setting("reduced_motion", true)
	TranslationServer.set_locale("en")
	hud._open_mode("settings", Vector3i.ZERO)
	hud._refresh_all()
	await get_tree().process_frame
	_check(is_equal_approx(get_window().content_scale_factor, 1.5)
			and hud._settings_scroll.visible
			and hud._settings_scroll.get_v_scroll_bar() != null,
		"150-percent UI scale did not retain a scrollable settings path")
	_check(hud._guide_instruction.autowrap_mode
			== TextServer.AUTOWRAP_WORD_SMART
			and hud._village_project.autowrap_mode
			== TextServer.AUTOWRAP_WORD_SMART
			and hud._raid_details.autowrap_mode
			== TextServer.AUTOWRAP_WORD_SMART,
		"expanded/localised text paths are not configured to reflow")
	var focus_owner := get_viewport().gui_get_focus_owner()
	_check(focus_owner != null and focus_owner.is_visible_in_tree(),
		"scaled settings screen lost keyboard/controller focus")
	UIState.set_setting("ui_scale", 1.0)
	UIState.set_setting("high_contrast", false)
	hud._set_craft_open(false)

	player.global_position = world.find_spawn()
	world.prepare_player_column(player.global_position)
	for _warmup_frame in 90:
		await get_tree().process_frame
	ReleaseQuality.reset_performance_samples()
	for _frame in 120:
		await get_tree().process_frame
	var snapshot := ReleaseQuality.performance_snapshot()
	_check(int(snapshot.get("sample_count", 0)) >= 60
			and float(snapshot.get("frame_p95_ms", 0.0)) > 0.0,
		"release profiler did not collect a bounded frame sample")
	_check(snapshot.get("systems", {}) is Dictionary
			and not snapshot.has("hardware"),
		"release profiler mixed hardware identity into per-frame system counters")
	_check(ReleaseQuality.write_release_report(REPORT_PATH),
		"release report could not be written")
	var report: Variant = JSON.parse_string(
		FileAccess.get_file_as_string(REPORT_PATH))
	_check(report is Dictionary
			and report.get("build", {}) is Dictionary
			and report.get("hardware", {}) is Dictionary
			and report.get("save_health", {}) is Dictionary,
		"release report omitted build, hardware, or save-health evidence")

	ReleaseQuality.mark_clean_shutdown("stage9_probe_prepare_unclean_fixture")
	_check(not FileAccess.file_exists(ReleaseQuality.SESSION_MARKER_PATH),
		"clean Stage 9 shutdown left a false crash marker")
	var marker := FileAccess.open(
		ReleaseQuality.SESSION_MARKER_PATH, FileAccess.WRITE)
	if marker != null:
		marker.store_string(JSON.stringify({
			"report_version": 1,
			"started_unix": 123456,
			"build": {"build_stage": "stage9_release_candidate"},
		}))
		marker.close()
	ReleaseQuality.attach(main)
	_check(int(ReleaseQuality.last_unclean_session.get(
			"started_unix", 0)) == 123456,
		"next launch did not detect the unclean-session marker")
	_check(FileAccess.file_exists(ReleaseQuality.UNCLEAN_REPORT_PATH),
		"unclean-session detection did not produce a privacy-bounded report")
	ReleaseQuality.mark_clean_shutdown("stage9_probe")

	main.cleanup_verification_save_paths()
	if FileAccess.file_exists(REPORT_PATH):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(REPORT_PATH))
	if FileAccess.file_exists(ReleaseQuality.UNCLEAN_REPORT_PATH):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(
			ReleaseQuality.UNCLEAN_REPORT_PATH))
	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"save_version": 17,
		"content_sha256": str(build.get("content_sha256", "")).left(16),
		"frame_p95_ms": snapshot.get("frame_p95_ms", 0.0),
	}
	print("STAGE9_RELEASE_CANDIDATE_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
