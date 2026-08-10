extends Node
## Multi-world isolation, save-v18, manifest replay, and global-profile probe.

const MainScene := preload("res://main.tscn")
const WorldManifestScript := preload("res://scripts/world/world_manifest.gd")

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var verification_root := "user://verification_stage_a_worlds_%d" % Time.get_ticks_usec()
	_check(
		WorldManager.configure_verification_root(verification_root),
		"verification world root was rejected")
	var first_result := WorldManager.create_world("Isolation One", "same-seed")
	var second_result := WorldManager.create_world("Isolation Two", "same-seed")
	_check(bool(first_result.get("ok", false)), "first world creation failed")
	_check(bool(second_result.get("ok", false)), "second world creation failed")
	if not bool(first_result.get("ok", false)) or not bool(second_result.get("ok", false)):
		_finish()
		return
	var first: Dictionary = first_result["world"]
	var second: Dictionary = second_result["world"]
	_check(first["world_id"] != second["world_id"], "world IDs collided")
	_check(
		int(first["resolved_seed"]) == int(second["resolved_seed"]),
		"same text seed did not resolve identically")

	UIState.set_setting("high_contrast", true)
	UIState.set_setting("quality_profile", "performance")
	_check(WorldManager.save_profile(), "global profile did not save")

	_check(WorldManager.select_world(first), "first world could not be selected")
	var first_session = MainScene.instantiate()
	add_child(first_session)
	await get_tree().process_frame
	_check(
		first_session.world.active_worldgen_version == VoxelWorld.WORLDGEN_VERSION,
		"new world did not use worldgen v4")
	var first_manifest: Dictionary = first_session.world.get_worldgen_manifest()
	_check(
		int(first_manifest.get("version", 0))
			== WorldStructurePlanner.VERSION
			and str(first_manifest.get("starter_mode", ""))
				== WorldStructurePlanner.STARTER_MODE,
		"new world did not persist the regional starter contract")
	var starter_settlement := SettlementManager.get_focused_settlement()
	var linked_camps: Array = starter_settlement.get("linked_camp_ids", [])
	var spawn_volume: Dictionary = first_session.raid_runtime.call(
		"get_camp_spawn_volume_definition")
	_check(
		not linked_camps.is_empty()
			and str(spawn_volume.get("owner_id", "")) == str(linked_camps[0]),
		"regional goblin spawner is not owned by its generated camp site")
	var expected_ecology_seed := ValleyPlan.derive_seed(
		int(first_session.world.valley_plan.sub_seeds["ecology"]),
		"camp_spawner:%s" % str(spawn_volume.get("owner_id", "")))
	_check(
		int(spawn_volume.get("spawn_seed", 0)) == expected_ecology_seed,
		"regional camp spawning did not use the ecology seed channel")
	var spawn: Vector3 = first_session.world.find_spawn()
	var edit_position := Vector3i(
		floori(spawn.x), floori(spawn.y) + 1, floori(spawn.z))
	var edit_id := BlockRegistry.get_id_by_stable_id("construction.cobble.stone")
	_check(
		first_session.world.set_block_global(edit_position, edit_id),
		"first world test edit could not be placed")
	Inventory.set_group_slot("hotbar", 0, {
		"kind": "block", "id": edit_id, "count": 11})
	ProgressionState.record_harvest("natural.log.oak", 3)
	MagicState.unlock_poc_magic("knowledge.magic.basic_rune")
	SocialManager.apply_reputation_event({
		"transaction_id": "world.lifecycle.first.reputation",
		"scope_ref": HamletState.active_village_id,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"delta": 37,
		"source_event_id": "event.world.lifecycle.first",
	})
	HamletState.refresh_social_projection()
	CombatState.phase = "resolved"
	CombatState.outcome = {"result": "probe_first_world"}
	UIState.discover_anchor("rune_ruin")
	_check(first_session.request_manual_save(), "first world save failed")
	var first_paths := WorldManager.active_world_paths()
	_check(FileAccess.file_exists(first_paths["final"]), "first final save is missing")
	var first_inventory := Inventory.serialize_state()
	first_session.queue_free()
	await get_tree().process_frame

	_check(WorldManager.select_world(second), "second world could not be selected")
	var second_session = MainScene.instantiate()
	add_child(second_session)
	await get_tree().process_frame
	var second_paths := WorldManager.active_world_paths()
	_check(
		str(first_paths["final"]) != str(second_paths["final"]),
		"worlds resolved to the same final save path")
	_check(
		Inventory.serialize_state() != first_inventory,
		"inventory leaked into the second world")
	_check(
		ProgressionState.harvested_counts.is_empty(),
		"progression leaked into the second world")
	_check(MagicState.known_spells.is_empty(), "magic leaked into the second world")
	_check(HamletState.reputation_points == 0, "settlement state leaked")
	_check(CombatState.phase == "dormant", "combat state leaked")
	_check(
		not UIState.discovered_anchors.has("rune_ruin"),
		"map knowledge leaked into the second world")
	_check(UIState.setting_bool("high_contrast"), "global setting did not persist")
	_check(
		str(UIState.settings.get("quality_profile", "")) == "performance",
		"global performance profile did not persist")
	ProgressionState.record_harvest("terrain.stone.basic", 9)
	SocialManager.apply_reputation_event({
		"transaction_id": "world.lifecycle.second.reputation",
		"scope_ref": HamletState.active_village_id,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"delta": 2,
		"source_event_id": "event.world.lifecycle.second",
	})
	HamletState.refresh_social_projection()
	_check(second_session.request_manual_save(), "second world save failed")
	_check(FileAccess.file_exists(second_paths["final"]), "second final save is missing")
	second_session.queue_free()
	await get_tree().process_frame

	_check(WorldManager.select_world(first), "first world could not be reselected")
	var replay = MainScene.instantiate()
	add_child(replay)
	await get_tree().process_frame
	_check(
		replay.world.get_worldgen_manifest() == first_manifest,
		"first world plan changed after save/reload")
	_check(
		replay.world.serialize_edits().has(
			"%d,%d,%d" % [edit_position.x, edit_position.y, edit_position.z]),
		"first world edit did not reload")
	_check(
		Inventory.serialize_state() == first_inventory,
		"first world inventory did not reload exactly")
	_check(
		int(ProgressionState.harvested_counts.get("natural.log.oak", 0)) == 3,
		"first world progression did not reload")
	_check(MagicState.is_spell_known("spell.spark_bolt"), "magic did not reload")
	_check(HamletState.reputation_points == 37, "settlement state did not reload")
	_check(
		CombatState.phase == "resolved"
			and str(CombatState.outcome.get("result", "")) == "probe_first_world",
		"combat state did not reload")
	_check(
		UIState.discovered_anchors.has("rune_ruin"),
		"first world map knowledge did not reload")
	_check(UIState.setting_bool("high_contrast"), "global profile changed on reload")
	var save_data: Variant = JSON.parse_string(FileAccess.get_file_as_string(
		WorldManager.active_world_paths()["final"]))
	_check(save_data is Dictionary, "save-v18 file did not parse")
	if save_data is Dictionary:
		_check(int(save_data.get("version", 0)) == 18, "save version is not 18")
		_check(
			not (save_data.get("settlements", {}) as Dictionary).is_empty() \
				and str((save_data.get("social", {}) as Dictionary).get(
					"schema", "")) == "leyforge.social-state" \
				and str((save_data.get("political", {}) as Dictionary).get(
					"schema", "")) == PoliticalManager.STATE_SCHEMA \
				and str((save_data.get("movement", {}) as Dictionary).get(
					"schema", "")) == MovementManager.STATE_SCHEMA,
			"save v18 omitted the settlement, social, political or movement owner")
		_check(
			str(save_data.get("world_id", "")) == str(first["world_id"]),
			"save manifest cannot reconstruct its world ID")
		_check(
			not (save_data.get("ui", {}) as Dictionary).has("settings"),
			"global settings leaked into per-world save state")
		var saved_world_manifest: Dictionary = save_data.get("world_manifest", {})
		_check(not saved_world_manifest.is_empty(),
			"save v18 omitted the persistent world manifest")
		_check(bool(WorldManifestScript.validate(saved_world_manifest).get(
			"ok", false)), "saved world manifest failed validation")
		_check(saved_world_manifest.get("manifest_hash") \
			== first.get("world_manifest_hash"),
			"save changed the world's locked manifest identity")
	replay.queue_free()
	await get_tree().process_frame
	_finish()


func _finish() -> void:
	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}
	print("WORLD_LIFECYCLE_PROBE %s" % JSON.stringify(report))
	WorldManager.clear_active_world()
	WorldManager.clear_verification_root()
	get_tree().quit(0 if failures.is_empty() else 1)
