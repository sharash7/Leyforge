extends Node3D
## POC entry point: wires the world, player, and HUD together, and
## handles atomic save/load with stable registry identities.
##
## CLI overrides (after "--"): --seed=12345 starts a fresh world with that
## seed; --new-world ignores the existing save.

const SAVE_PATH := "user://leyforge_save.json"
const SAVE_TEMP_PATH := "user://leyforge_save.tmp"
const SAVE_PREVIOUS_PATH := "user://leyforge_save.previous"
const SAVE_BACKUP_PATH := "user://leyforge_save.backup.json"
signal save_status_changed(status: String, message: String)

const SAVE_VERSION := 12

var _save_path := SAVE_PATH
var _save_temp_path := SAVE_TEMP_PATH
var _save_previous_path := SAVE_PREVIOUS_PATH
var _save_backup_path := SAVE_BACKUP_PATH

@onready var world: VoxelWorld = $VoxelWorld
@onready var player: Player = $Player
@onready var hud: Hud = $HUD
@onready var hamlet_runtime: HamletRuntime = $HamletRuntime
@onready var raid_runtime: Node = $RaidRuntime


func _ready() -> void:
	player.world = world
	world.player = player
	hud.player = player
	hud.session = self

	var cli := _parse_cli_args()
	var data: Dictionary = {} if cli.get("fresh", false) else _read_save()
	var seed_value: int = int(cli.get("seed", int(data.get("seed", world.world_seed))))

	world.start(seed_value)
	HamletState.initialize(world.world_seed, world.get_valley_anchors())
	CombatState.initialize(world.world_seed, world.get_valley_anchors())

	if not data.is_empty() \
			and int(data.get("seed", seed_value)) == world.world_seed \
			and world.is_worldgen_manifest_compatible(data.get("worldgen", {})):
		_apply_save(data)
	else:
		if not data.is_empty():
			push_warning("MAIN: save seed or world-generation manifest differs, starting fresh")
		player.global_position = world.find_spawn()
	hamlet_runtime.configure(world, player)
	raid_runtime.configure(world, player)
	hud.raid_runtime = raid_runtime
	print("MAIN: seed=%d player at %s" % [world.world_seed, player.global_position])


func _parse_cli_args() -> Dictionary:
	var out := {}
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--seed="):
			out["seed"] = int(arg.trim_prefix("--seed="))
			out["fresh"] = true
		elif arg == "--new-world":
			out["fresh"] = true
	return out


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		_save_game()


func request_manual_save() -> bool:
	return _save_game()


func _save_game() -> bool:
	save_status_changed.emit("saving", "Saving world...")
	var pos := player.global_position
	var data := {
		"version": SAVE_VERSION,
		"seed": world.world_seed,
		"player_position": [pos.x, pos.y, pos.z],
		"player_yaw": player.rotation.y,
		"player_pitch": player.head.rotation.x,
		"inventory": Inventory.serialize_state(),
		"edits": world.serialize_edits(),
		"block_entities": world.serialize_block_entities(),
		"item_drops": world.serialize_item_drops(),
		"progression": ProgressionState.serialize_state(),
		"magic_player": MagicState.serialize_state(),
		"hamlet": HamletState.serialize_state(),
		"combat": CombatState.serialize_state(),
		"ui": UIState.serialize_state(),
		"worldgen": world.get_worldgen_manifest(),
	}
	if not _write_verified_temp(data):
		push_warning("MAIN: save temp write or validation failed; previous save preserved")
		save_status_changed.emit(
			"failed",
			"Save failed before commit. Your previous save is unchanged; keep this session open and retry.")
		return false
	if not _commit_temp_save():
		push_warning("MAIN: atomic save commit failed; previous save restored")
		save_status_changed.emit(
			"failed",
			"Save commit failed. The previous save was restored; keep this session open and retry.")
		return false
	print("MAIN: saved %d edits to %s" % [data["edits"].size(), _save_path])
	save_status_changed.emit("saved", "World saved safely.")
	return true


func configure_verification_save_paths(prefix: String) -> bool:
	## Headless save probes must never rotate a player's manual save. This is
	## intentionally callable only before a probe's explicit save transaction.
	var permitted := prefix.begins_with("user://verification_") \
		or prefix.begins_with("res://.summer/verification/.")
	if not permitted or ".." in prefix:
		return false
	_save_path = "%s.json" % prefix
	_save_temp_path = "%s.tmp" % prefix
	_save_previous_path = "%s.previous" % prefix
	_save_backup_path = "%s.backup.json" % prefix
	return true


func cleanup_verification_save_paths() -> void:
	if not _save_path.begins_with("res://.summer/verification/."):
		return
	for path in [
		_save_path, _save_temp_path, _save_previous_path, _save_backup_path,
	]:
		var absolute := ProjectSettings.globalize_path(path)
		if FileAccess.file_exists(path):
			DirAccess.remove_absolute(absolute)
	_save_path = SAVE_PATH
	_save_temp_path = SAVE_TEMP_PATH
	_save_previous_path = SAVE_PREVIOUS_PATH
	_save_backup_path = SAVE_BACKUP_PATH


func _write_verified_temp(data: Dictionary) -> bool:
	var f := FileAccess.open(_save_temp_path, FileAccess.WRITE)
	if f == null:
		push_warning("MAIN: could not open save temp path (%s)" % error_string(
			FileAccess.get_open_error()))
		return false
	var encoded := JSON.stringify(data)
	if encoded.is_empty():
		push_warning("MAIN: save state could not be encoded as JSON")
		f.close()
		return false
	f.store_string(encoded)
	f.flush()
	var write_error := f.get_error()
	f.close()
	if write_error != OK:
		push_warning("MAIN: save temp flush failed (%s)" % error_string(write_error))
		return false
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(_save_temp_path))
	if not (parsed is Dictionary):
		push_warning("MAIN: save temp did not parse back to a dictionary")
		return false
	var verified: Dictionary = parsed
	if int(verified.get("version", 0)) != SAVE_VERSION:
		push_warning("MAIN: save temp version verification failed")
		return false
	return true


func _commit_temp_save() -> bool:
	var final_path := ProjectSettings.globalize_path(_save_path)
	var temp_path := ProjectSettings.globalize_path(_save_temp_path)
	var previous_path := ProjectSettings.globalize_path(_save_previous_path)
	var backup_path := ProjectSettings.globalize_path(_save_backup_path)

	# previous is a transaction scratch file. Preserve it when final is absent:
	# that state means an earlier commit was interrupted after rotating final.
	var moved_previous := FileAccess.file_exists(_save_previous_path)
	if FileAccess.file_exists(_save_path):
		if moved_previous:
			if DirAccess.remove_absolute(previous_path) != OK:
				return false
		if DirAccess.rename_absolute(final_path, previous_path) != OK:
			return false
		moved_previous = true
	if DirAccess.rename_absolute(temp_path, final_path) != OK:
		if moved_previous:
			DirAccess.rename_absolute(previous_path, final_path)
		return false

	# Only rotate the backup after a verified new final save is in place.
	if moved_previous:
		if FileAccess.file_exists(_save_backup_path):
			DirAccess.remove_absolute(backup_path)
		if DirAccess.rename_absolute(previous_path, backup_path) != OK:
			push_warning("MAIN: new save committed, but previous save remains at %s" % _save_previous_path)
	return true


func _read_save() -> Dictionary:
	for path in [
		_save_path, _save_previous_path, _save_backup_path, _save_temp_path,
	]:
		var data := _read_save_file(path)
		if data.is_empty():
			continue
		var migrated := _migrate_save(data)
		if not migrated.is_empty():
			if path != _save_path:
				push_warning("MAIN: recovered save state from %s" % path)
			return migrated
	return {}


func _read_save_file(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if not (parsed is Dictionary):
		push_warning("MAIN: invalid save JSON at %s" % path)
		return {}
	var data: Dictionary = parsed
	return data


func _migrate_save(data: Dictionary) -> Dictionary:
	var version := int(data.get("version", 0))
	if version == SAVE_VERSION:
		return data
	if version in [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]:
		# v2 used raw numeric block ids; v3 introduced stable content identities;
		# v4 added the Controlled POC Valley manifest. All upgrade in place to the
		# unified item/progression/functional-block/automation state on the next
		# save. v7 already has physical world drops and needs no structural
		# rewrite beyond the version marker. v8 adds automation; v9 adds
		# player magic and magic-network state under existing block entities.
		# v10 adds authoritative combat/raid state. v11 adds saved abilities,
		# block orientation, assembled two-cell doors, and camp-source state.
		# v12 adds persistent Stage 8 UI, learning, map, accessibility, and
		# remappable-input state.
		var legacy_inventory: Dictionary
		if version == 2:
			legacy_inventory = {
				"hotbar": data.get("hotbar", []),
				"craft_grid": [],
				"selected_slot": int(data.get("selected_slot", 0)),
			}
		else:
			var stored_inventory: Variant = data.get("inventory", {})
			legacy_inventory = stored_inventory if stored_inventory is Dictionary else {}
		return {
			"version": SAVE_VERSION,
			"seed": int(data.get("seed", world.world_seed)),
			"player_position": data.get("player_position", []),
			"player_yaw": float(data.get("player_yaw", 0.0)),
			"player_pitch": float(data.get("player_pitch", 0.0)),
			"inventory": legacy_inventory,
			"edits": data.get("edits", {}),
			"block_entities": data.get("block_entities", {}),
			"item_drops": data.get("item_drops", []),
			"progression": data.get("progression", {}),
			"magic_player": data.get("magic_player", {}),
			"hamlet": data.get("hamlet", {}),
			"combat": data.get("combat", {}),
			"ui": data.get("ui", {}),
			"worldgen": data.get("worldgen", {}) if version >= 4 else {},
		}
	push_warning("MAIN: unsupported save version v%d" % version)
	return {}


func _apply_save(data: Dictionary) -> void:
	world.apply_edits(data.get("edits", {}))
	world.apply_block_entities(data.get("block_entities", {}))
	var inventory_data: Variant = data.get("inventory", {})
	if inventory_data is Dictionary:
		Inventory.restore_state(inventory_data)
	var progression_data: Variant = data.get("progression", {})
	if progression_data is Dictionary and not progression_data.is_empty():
		ProgressionState.restore_state(progression_data)
	var magic_player_data: Variant = data.get("magic_player", {})
	if magic_player_data is Dictionary and not magic_player_data.is_empty():
		MagicState.restore_state(magic_player_data)
	else:
		MagicState.reset()
	var hamlet_data: Variant = data.get("hamlet", {})
	if hamlet_data is Dictionary and not hamlet_data.is_empty():
		if not HamletState.restore_state(hamlet_data, world.world_seed):
			push_warning("MAIN: rejected incompatible hamlet state; using fresh valley state")
	var combat_data: Variant = data.get("combat", {})
	if combat_data is Dictionary and not combat_data.is_empty():
		if not CombatState.restore_state(combat_data, world.world_seed):
			push_warning("MAIN: rejected incompatible combat state; using a fresh raid state")
	var ui_data: Variant = data.get("ui", {})
	if ui_data is Dictionary and not ui_data.is_empty():
		UIState.restore_state(ui_data)
	var p: Array = data.get("player_position", [])
	if p.size() == 3:
		var requested_position := Vector3(p[0], p[1], p[2])
		world.prepare_player_column(requested_position)
		var safe_position := world.resolve_safe_player_position(requested_position)
		if not safe_position.is_equal_approx(requested_position):
			push_warning("MAIN: repaired unsafe saved player position %s -> %s" % [
				requested_position, safe_position])
		player.global_position = safe_position
	world.restore_item_drops(data.get("item_drops", []))
	if data.has("player_yaw"):
		player.restore_view(float(data["player_yaw"]), float(data.get("player_pitch", 0.0)))
