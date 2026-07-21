extends Node3D
## Stage 2 entry point: wires the world, player, and HUD together, and
## handles save/load, versioned (v2 = world seed + edit journal + state).
##
## CLI overrides (after "--"): --seed=12345 starts a fresh world with that
## seed; --new-world ignores the existing save.

const SAVE_PATH := "user://leyforge_save.json"
const SAVE_VERSION := 2

@onready var world: VoxelWorld = $VoxelWorld
@onready var player: Player = $Player
@onready var hud: Hud = $HUD


func _ready() -> void:
	player.world = world
	world.player = player
	hud.player = player

	var cli := _parse_cli_args()
	var data: Dictionary = {} if cli.get("fresh", false) else _read_save()
	var seed_value: int = int(cli.get("seed", int(data.get("seed", world.world_seed))))

	world.start(seed_value)

	if not data.is_empty() and int(data.get("seed", seed_value)) == world.world_seed:
		_apply_save(data)
	else:
		if not data.is_empty():
			push_warning("MAIN: save seed differs from world seed, starting fresh")
		player.global_position = world.find_spawn()
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


func _save_game() -> void:
	var pos := player.global_position
	var data := {
		"version": SAVE_VERSION,
		"seed": world.world_seed,
		"player_position": [pos.x, pos.y, pos.z],
		"player_yaw": player.rotation.y,
		"hotbar": Inventory.hotbar,
		"selected_slot": Inventory.selected_slot,
		"edits": world.serialize_edits(),
	}
	var f := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if f == null:
		push_warning("MAIN: could not open save file for writing")
		return
	f.store_string(JSON.stringify(data))
	f.close()
	print("MAIN: saved %d edits to %s" % [data["edits"].size(), SAVE_PATH])


func _read_save() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		return {}
	var f := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if f == null:
		return {}
	var parsed: Variant = JSON.parse_string(f.get_as_text())
	f.close()
	if not parsed is Dictionary:
		return {}
	var data: Dictionary = parsed
	if int(data.get("version", 0)) != SAVE_VERSION:
		push_warning("MAIN: save version mismatch (v%d vs v%d), starting fresh" % [
			int(data.get("version", 0)), SAVE_VERSION])
		return {}
	return data


func _apply_save(data: Dictionary) -> void:
	world.apply_edits(data.get("edits", {}))
	var hotbar: Array = data.get("hotbar", [])
	if hotbar.size() == Inventory.HOTBAR_SIZE:
		Inventory.hotbar.assign(hotbar)
		Inventory.hotbar_changed.emit()
	Inventory.selected_slot = int(data.get("selected_slot", 0))
	var p: Array = data.get("player_position", [])
	if p.size() == 3:
		player.global_position = Vector3(p[0], p[1], p[2])
	if data.has("player_yaw"):
		player.restore_view(float(data["player_yaw"]))
