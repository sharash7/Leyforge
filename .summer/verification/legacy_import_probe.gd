extends Node
## First-launch single-save copy import and legacy generator preservation.

const MainScene := preload("res://main.tscn")

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	WorldManager.clear_active_world()
	var root := "user://verification_legacy_import_%d" % Time.get_ticks_usec()
	_check(
		WorldManager.configure_verification_root(root),
		"legacy import verification root was rejected")
	var plan := ValleyPlan.new()
	plan.generate(1337, ValleyPlan.VERSION)
	var worldgen := plan.save_manifest()
	worldgen["worldgen_version"] = VoxelWorld.LEGACY_WORLDGEN_VERSION
	var legacy := {
		"version": 14,
		"seed": 1337,
		"player_position": [],
		"inventory": {},
		"edits": {},
		"block_entities": {},
		"item_drops": [],
		"progression": {},
		"magic_player": {},
		"hamlet": {},
		"combat": {},
		"ui": {},
		"worldgen": worldgen,
		"save_manifest": {
			"format": "leyforge.poc.save",
			"save_version": 14,
			"written_unix": 1700000000,
		},
	}
	legacy = _attach_integrity(legacy)
	var encoded := JSON.stringify(legacy)
	_check(
		_write_text("user://leyforge_save.json", encoded),
		"legacy final fixture could not be written")
	_check(
		_write_text("user://leyforge_save.backup.json", encoded),
		"legacy backup fixture could not be written")
	WorldManager._import_legacy_world_once()
	var worlds := WorldManager.list_worlds()
	_check(worlds.size() == 1, "legacy import did not create exactly one card")
	if worlds.is_empty():
		_finish()
		return
	var card: Dictionary = worlds[0]
	_check(
		str(card.get("name", "")) == "Legacy World"
			and bool(card.get("legacy_import", false)),
		"legacy card identity is incorrect")
	_check(
		int(card.get("worldgen_version", 0)) == 2
			and int(card.get("plan_version", 0)) == 1,
		"legacy card changed generator versions")
	var directory := WorldManager.world_directory(str(card["world_id"]))
	_check(
		FileAccess.file_exists(directory.path_join(WorldManager.WORLD_FILE)),
		"legacy final was not copied")
	_check(
		FileAccess.file_exists(directory.path_join(WorldManager.WORLD_BACKUP_FILE)),
		"legacy backup was not copied")
	_check(
		FileAccess.get_file_as_string("user://leyforge_save.json") == encoded
			and FileAccess.get_file_as_string(
				"user://leyforge_save.backup.json") == encoded,
		"legacy source candidates were moved or modified")
	_check(WorldManager.select_world(card), "legacy card could not be selected")
	var session = MainScene.instantiate()
	add_child(session)
	await get_tree().process_frame
	_check(
		session.world.active_worldgen_version == 2
			and session.world.valley_plan.plan_version == 1
			and session.player.global_position.y > 0.0,
		"legacy world changed generator or did not receive a safe spawn")
	_check(session.request_manual_save(), "migrated legacy world could not save")
	var imported: Variant = JSON.parse_string(FileAccess.get_file_as_string(
		WorldManager.active_world_paths()["final"]))
	_check(
		imported is Dictionary and int(imported.get("version", 0)) == 18,
		"imported world did not advance to save v17")
	var original: Variant = JSON.parse_string(FileAccess.get_file_as_string(
		"user://leyforge_save.json"))
	_check(
		original is Dictionary and int(original.get("version", 0)) == 14,
		"successful world save modified the original legacy source")
	session.queue_free()
	await get_tree().process_frame
	_finish()


func _attach_integrity(data: Dictionary) -> Dictionary:
	var result := data.duplicate(true)
	result.erase("integrity")
	var normalised: Variant = JSON.parse_string(JSON.stringify(result))
	if normalised is Dictionary:
		result = normalised
	result["integrity"] = {
		"version": 1,
		"algorithm": "sha256",
		"payload_sha256": WorldManager._sha256_text(
			WorldManager._canonical_json(result)),
	}
	return result


func _write_text(path: String, value: String) -> bool:
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		return false
	file.store_string(value)
	file.flush()
	var ok := file.get_error() == OK
	file.close()
	return ok


func _finish() -> void:
	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}
	print("LEGACY_IMPORT_PROBE %s" % JSON.stringify(report))
	WorldManager.clear_active_world()
	WorldManager.clear_verification_root()
	get_tree().quit(0 if failures.is_empty() else 1)
