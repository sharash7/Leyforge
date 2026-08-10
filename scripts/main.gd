extends Node3D
## POC entry point: wires the world, player, and HUD together, and
## handles atomic save/load with stable registry identities.
##
## CLI overrides (after "--"): --seed=12345 starts a fresh world with that
## seed; --new-world ignores the existing save; --stage9-benchmark runs the
## packaged release-candidate traversal capture and exits.

const Stage9BenchmarkScript = preload(
	"res://scripts/release/stage9_packaged_benchmark.gd")
const SaveCoordinatorScript = preload("res://scripts/core/save_coordinator.gd")

const SAVE_PATH := "user://leyforge_save.json"
const SAVE_TEMP_PATH := "user://leyforge_save.tmp"
const SAVE_PREVIOUS_PATH := "user://leyforge_save.previous"
const SAVE_BACKUP_PATH := "user://leyforge_save.backup.json"
signal save_status_changed(status: String, message: String)

const SAVE_VERSION := 18
const SAVE_FORMAT := "leyforge.world.save"
const INTEGRITY_VERSION := 1
const MAX_SAVE_BYTES := 64 * 1024 * 1024

var _save_path := SAVE_PATH
var _save_temp_path := SAVE_TEMP_PATH
var _save_previous_path := SAVE_PREVIOUS_PATH
var _save_backup_path := SAVE_BACKUP_PATH
var _save_health := {
	"status": "not_checked",
	"source": "none",
	"rejected_candidates": [],
}
var _forge_world_presentation_state := ForgeWorldPresentationStateService.new()
var _save_coordinator: SaveCoordinator = SaveCoordinatorScript.new()

@onready var world: VoxelWorld = $VoxelWorld
@onready var player: Player = $Player
@onready var hud: Hud = $HUD
@onready var hamlet_runtime: HamletRuntime = $HamletRuntime
@onready var raid_runtime: Node = $RaidRuntime


func _ready() -> void:
	var forge_state_report := _forge_world_presentation_state.load_project_sources()
	if not bool(forge_state_report.get("ok", false)):
		push_warning("MAIN: Forge world presentation sources did not validate; legacy presentation remains active")
	player.world = world
	world.player = player
	hud.player = player
	hud.session = self

	var cli := _parse_cli_args()
	_configure_active_world_paths()
	var data: Dictionary = {} if cli.get("fresh", false) else _read_save()
	if data.is_empty() and not WorldManager.active_world.is_empty() \
			and WorldManager.active_world_has_save_candidates():
		push_error("MAIN: selected world has save candidates but none are recoverable")
		save_status_changed.emit(
			"failed",
			"This world's save candidates are not recoverable. Nothing was overwritten.")
		call_deferred("_return_unrecoverable_world_to_menu")
		return
	var active_request: Dictionary = WorldManager.active_generation_request()
	var seed_value: int = int(cli.get(
		"seed",
		int(data.get(
			"seed",
			active_request.get("resolved_seed", world.world_seed)))))
	var generation_request := active_request.duplicate(true)
	var saved_worldgen: Variant = data.get("worldgen", {})
	if saved_worldgen is Dictionary and not saved_worldgen.is_empty():
		generation_request["worldgen_version"] = int(saved_worldgen.get(
			"worldgen_version", VoxelWorld.LEGACY_WORLDGEN_VERSION))
		generation_request["plan_version"] = int(saved_worldgen.get(
			"version", ValleyPlan.VERSION))

	_reset_world_autoloads()
	world.start(seed_value, generation_request)
	StructureManager.initialize(
		world.world_seed,
		str(WorldManager.active_world.get("world_id", "")))
	SimulationLodManager.initialize(
		world.world_seed,
		str(WorldManager.active_world.get("world_id", "")))
	PeopleManager.initialize(
		world.world_seed,
		str(WorldManager.active_world.get("world_id", "")))
	BiologyManager.initialize(
		world.world_seed,
		str(WorldManager.active_world.get("world_id", "")))
	SocialManager.initialize(
		world.world_seed,
		str(WorldManager.active_world.get("world_id", "")))
	PoliticalManager.initialize(
		world.world_seed,
		str(WorldManager.active_world.get("world_id", "")))
	MovementManager.initialize(
		world.world_seed,
		str(WorldManager.active_world.get("world_id", "")))
	if not WorldManager.active_world.is_empty() \
			and world.is_regional_worldgen():
		var runtime_worldgen_errors := world.validate_worldgen()
		if not runtime_worldgen_errors.is_empty():
			WorldManager.mark_active_world_invalid(runtime_worldgen_errors)
			push_error("MAIN: blocked invalid randomized world seed %d: %s" % [
				seed_value, runtime_worldgen_errors])
			call_deferred("_return_unrecoverable_world_to_menu")
			return
	if world.is_regional_worldgen():
		CombatState.initialize(
			world.world_seed, world.get_valley_anchors(),
			"settlement.starter.pending")
		if not SettlementManager.initialize_world(
				world.world_seed, world.valley_plan):
			push_error("MAIN: could not initialize the regional settlement collection")
			call_deferred("_return_unrecoverable_world_to_menu")
			return
		SettlementManager.bind_world(world)
	else:
		HamletState.initialize(world.world_seed, world.get_valley_anchors())
		CombatState.initialize(world.world_seed, world.get_valley_anchors())
		SettlementManager.initialize_legacy(world.world_seed)
		SettlementManager.bind_world(world)
	SettlementManager.refresh_people_owner()
	SettlementManager.refresh_biology_owner()
	SettlementManager.refresh_social_owner()
	SettlementManager.refresh_political_owner()
	SettlementManager.refresh_movement_owner()
	SettlementManager.refresh_lod_subjects()

	if not data.is_empty() \
			and int(data.get("seed", seed_value)) == world.world_seed \
			and world.is_worldgen_manifest_compatible(data.get("worldgen", {})):
		_apply_save(data)
	else:
		if not data.is_empty():
			push_warning("MAIN: save seed or world-generation manifest differs, starting fresh")
		player.global_position = world.find_spawn()
	var movement_sync := _reconcile_player_movement(true)
	if not bool(movement_sync.get("ok", false)):
		push_warning("MAIN: player movement-owner handoff failed: %s" % movement_sync)
	hamlet_runtime.configure(world, player)
	raid_runtime.configure(world, player)
	hud.raid_runtime = raid_runtime
	ReleaseQuality.attach(self)
	print("MAIN: seed=%d player at %s" % [world.world_seed, player.global_position])
	if bool(cli.get("stage9_benchmark", false)):
		var benchmark := Stage9BenchmarkScript.new()
		add_child(benchmark)
		benchmark.call_deferred("start", self)


func _parse_cli_args() -> Dictionary:
	var out := {}
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--seed="):
			out["seed"] = int(arg.trim_prefix("--seed="))
			out["fresh"] = true
		elif arg == "--new-world":
			out["fresh"] = true
		elif arg == "--stage9-benchmark":
			out["fresh"] = true
			out["stage9_benchmark"] = true
	return out


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		if _save_game():
			ReleaseQuality.mark_clean_shutdown("window_close")


func request_manual_save() -> bool:
	return _save_game()


func request_save_and_return_to_menu() -> bool:
	if not _save_game():
		return false
	get_tree().paused = false
	ReleaseQuality.mark_clean_shutdown("return_to_main_menu")
	WorldManager.clear_active_world()
	get_tree().change_scene_to_file("res://main_menu.tscn")
	return true


func _return_unrecoverable_world_to_menu() -> void:
	get_tree().paused = false
	WorldManager.clear_active_world()
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _save_game() -> bool:
	save_status_changed.emit("saving", "Saving world...")
	hamlet_runtime.prepare_for_save()
	# LOD refresh captures the focused facade before reconciling every owner.
	# Refreshing individual owners first can project an older settlement record
	# back over runtime NPC state before that state reaches the save envelope.
	SettlementManager.refresh_lod_subjects()
	var player_movement := player.publish_movement_snapshot(true)
	if not bool(player_movement.get("ok", false)):
		push_warning("MAIN: player movement snapshot blocked save: %s" % player_movement)
		save_status_changed.emit(
			"failed",
			"Player movement state is inconsistent. The previous save remains unchanged.")
		return false
	var political_validation := PoliticalManager.validate_state()
	if not bool(political_validation.get("ok", false)):
		push_warning("MAIN: political owner validation blocked save: %s" %
			political_validation)
		save_status_changed.emit(
			"failed",
			"Political world state is inconsistent. The previous save remains unchanged.")
		return false
	var movement_validation := MovementManager.validate_state()
	if not bool(movement_validation.get("ok", false)):
		push_warning("MAIN: movement owner validation blocked save: %s" %
			movement_validation)
		save_status_changed.emit(
			"failed",
			"Movement world state is inconsistent. The previous save remains unchanged.")
		return false
	var pos := player.global_position
	var data := {
		"version": SAVE_VERSION,
		"seed": world.world_seed,
		"player_position": [pos.x, pos.y, pos.z],
		"player_yaw": player.rotation.y,
		"player_pitch": player.head.rotation.x,
		"inventory": Inventory.serialize_state(),
		"edits": world.serialize_edits(),
		"edit_provenance": world.serialize_edit_provenance(),
		"block_entities": world.serialize_block_entities(),
		"item_drops": world.serialize_item_drops(),
		"progression": ProgressionState.serialize_state(),
		"magic_player": MagicState.serialize_state(),
		"settlements": SettlementManager.serialize_state(),
		"hamlet": HamletState.serialize_state(),
		"combat": CombatState.serialize_state(),
		"production_kernel": ProductionKernel.serialize_state(),
		"structures": StructureManager.serialize_state(),
		"simulation_lod": SimulationLodManager.serialize_state(),
		"people": PeopleManager.serialize_state(),
		"biology": BiologyManager.serialize_state(),
		"social": SocialManager.serialize_state(),
		"political": PoliticalManager.serialize_state(),
		"movement": MovementManager.serialize_state(),
		"registry_state": ProductionCatalogue.serialize_registry_state(),
		"ui": UIState.serialize_world_state(),
		"forge_presentation": _forge_world_presentation_state.serialize_state(),
		"worldgen": world.get_worldgen_manifest(),
		"world_manifest": WorldManager.active_world_manifest(),
		"save_manifest": {
			"format": SAVE_FORMAT,
			"save_version": SAVE_VERSION,
			"written_unix": int(Time.get_unix_time_from_system()),
			"build": ReleaseQuality.build_metadata(),
		},
	}
	if not WorldManager.active_world.is_empty():
		var active := WorldManager.active_world
		data["world_id"] = str(active.get("world_id", ""))
		data["save_manifest"]["world_id"] = str(active.get("world_id", ""))
		data["save_manifest"]["world_name"] = str(active.get("name", "World"))
		data["save_manifest"]["seed_original"] = str(active.get("seed_original", ""))
		data["save_manifest"]["resolved_seed"] = world.world_seed
		data["save_manifest"]["seed_kind"] = str(active.get("seed_kind", ""))
		data["save_manifest"]["created_unix"] = int(active.get("created_unix", 0))
		data["save_manifest"]["playtime_seconds"] = (
			WorldManager.active_playtime_seconds())
	data["save_manifest"]["restore_order"] = _save_coordinator.restore_order()
	data["save_manifest"]["storage_contract"] = (
		_save_coordinator.make_storage_contract(data))
	data = _attach_integrity(data)
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
	_save_health = {
		"status": "healthy",
		"source": "final",
		"rejected_candidates": [],
		"integrity": str(data.get("integrity", {}).get(
			"payload_sha256", "")).left(16),
	}
	if not WorldManager.update_active_world_after_save(
			data["save_manifest"], data["worldgen"], _save_health):
		save_status_changed.emit(
			"failed",
			"The world data was saved, but its world-card metadata could not be updated. Stay in this session and retry.")
		return false
	save_status_changed.emit("saved", "World saved safely.")
	return true


func _configure_active_world_paths() -> void:
	var paths := WorldManager.active_world_paths()
	if paths.is_empty():
		return
	_save_path = str(paths["final"])
	_save_temp_path = str(paths["temporary"])
	_save_previous_path = str(paths["previous"])
	_save_backup_path = str(paths["backup"])


func _reset_world_autoloads() -> void:
	## Autoloads outlive scene changes. Clear every world-owned domain before a
	## selected world is generated so same-seed worlds cannot leak state.
	Inventory.reset()
	ProgressionState.reset()
	MagicState.reset()
	HamletState.initialized = false
	HamletState.active_village_id = HamletState.VILLAGE_ID
	SettlementManager.reset()
	CombatState.initialized = false
	ProductionKernel.reset_for_verification()
	StructureManager.reset()
	SimulationLodManager.reset()
	PeopleManager.reset()
	BiologyManager.reset()
	SocialManager.reset()
	PoliticalManager.reset()
	MovementManager.reset()
	UIState.reset_world_state()
	_forge_world_presentation_state.reset()
	_forge_world_presentation_state.load_project_sources()


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
	if not validate_save_integrity(verified):
		var stored_hash := str(verified.get("integrity", {}).get(
			"payload_sha256", ""))
		var verified_payload := verified.duplicate(true)
		verified_payload.erase("integrity")
		var calculated_hash := _sha256_text(_canonical_json(verified_payload))
		push_warning("MAIN: save temp integrity verification failed (%s != %s)" % [
			stored_hash.left(12), calculated_hash.left(12)])
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
	var rejected: Array[String] = []
	var found_candidate := false
	var candidate_paths := {
		"final": _save_path,
		"previous": _save_previous_path,
		"backup": _save_backup_path,
		"temporary": _save_temp_path,
	}
	for role in _save_coordinator.recovery_candidate_roles():
		var path := str(candidate_paths.get(role, ""))
		if path.is_empty():
			continue
		if not FileAccess.file_exists(path):
			continue
		found_candidate = true
		var data := _read_save_file(path)
		if data.is_empty():
			rejected.append(_save_source_label(path))
			continue
		var migrated := _migrate_save(data)
		if not migrated.is_empty():
			var source := _save_source_label(path)
			_save_health = {
				"status": "healthy" if path == _save_path else "recovered",
				"source": source,
				"rejected_candidates": rejected.duplicate(),
				"integrity": str(migrated.get("integrity", {}).get(
					"payload_sha256", "")).left(16),
				"migration": _save_coordinator.last_report(),
			}
			if path != _save_path:
				push_warning("MAIN: recovered save state from %s" % path)
			return migrated
		rejected.append(_save_source_label(path))
	_save_health = {
		"status": "unrecoverable" if found_candidate else "new_world",
		"source": "none",
		"rejected_candidates": rejected,
	}
	return {}


func _read_save_file(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_warning("MAIN: could not open save candidate %s" % path)
		return {}
	var length := file.get_length()
	if length <= 0 or length > MAX_SAVE_BYTES:
		push_warning("MAIN: rejected save candidate with invalid size at %s" % path)
		file.close()
		return {}
	var encoded := file.get_as_text()
	file.close()
	var parsed: Variant = JSON.parse_string(encoded)
	if not (parsed is Dictionary):
		push_warning("MAIN: invalid save JSON at %s" % path)
		return {}
	var data: Dictionary = parsed
	if not _validate_save_shape(data):
		push_warning("MAIN: invalid save structure at %s" % path)
		return {}
	if int(data.get("version", 0)) >= 13 \
			and not _validate_integrity_record(data):
		push_warning("MAIN: save integrity mismatch at %s" % path)
		return {}
	return data


func _migrate_save(data: Dictionary) -> Dictionary:
	var version := int(data.get("version", 0))
	if version >= 13 and not _validate_integrity_record(data):
		push_warning("MAIN: rejected legacy save with invalid integrity record")
		return {}
	var prepared := _save_coordinator.prepare_for_load(
		data, _save_coordinator_context())
	if not bool(prepared.get("ok", false)):
		var rejection_detail: Variant = prepared.get(
			"storage", prepared.get("registry", {}))
		push_warning("MAIN: save coordinator rejected v%d state: %s %s" % [
			version, prepared.get("error", "unknown_error"),
			JSON.stringify(rejection_detail)])
		return {}
	var migrated: Dictionary = prepared.get("data", {})
	if version == SAVE_VERSION:
		return migrated
	return _attach_integrity(migrated)


func _save_coordinator_context() -> Dictionary:
	return {
		"seed_default": world.world_seed,
		"world_id": str(WorldManager.active_world.get("world_id", "")),
		"world_name": str(WorldManager.active_world.get("name", "Legacy World")),
		"seed_original": str(WorldManager.active_world.get(
			"seed_original", world.world_seed)),
		"world_manifest": WorldManager.active_world_manifest(),
		"build": ReleaseQuality.build_metadata(),
		"written_unix": int(Time.get_unix_time_from_system()),
		"current_pack_ids": ProductionCatalogue.pack_order(),
		"current_catalogue_hash": ProductionCatalogue.catalogue_hash(),
		"current_registry_state": ProductionCatalogue.serialize_registry_state(),
	}


func save_health_report() -> Dictionary:
	return _save_health.duplicate(true)


func validate_save_integrity(data: Dictionary) -> bool:
	if int(data.get("version", 0)) != SAVE_VERSION:
		return false
	return _validate_integrity_record(data)


func _validate_integrity_record(data: Dictionary) -> bool:
	var integrity: Variant = data.get("integrity", {})
	if not (integrity is Dictionary):
		return false
	if int(integrity.get("version", 0)) != INTEGRITY_VERSION \
			or str(integrity.get("algorithm", "")) != "sha256":
		return false
	var expected := str(integrity.get("payload_sha256", ""))
	if expected.length() != 64:
		return false
	var payload := data.duplicate(true)
	payload.erase("integrity")
	return expected == _sha256_text(_canonical_json(payload))


func _attach_integrity(data: Dictionary) -> Dictionary:
	var result := data.duplicate(true)
	result.erase("integrity")
	# Hash the same JSON-normalised value that will be read from disk. This
	# removes Variant distinctions (such as int versus whole float) that JSON
	# does not preserve.
	var normalised: Variant = JSON.parse_string(JSON.stringify(result))
	if normalised is Dictionary:
		result = normalised
	result["integrity"] = {
		"version": INTEGRITY_VERSION,
		"algorithm": "sha256",
		"payload_sha256": _sha256_text(_canonical_json(result)),
	}
	return result


func _validate_save_shape(data: Dictionary) -> bool:
	var version := int(data.get("version", 0))
	if version < 2 or version > SAVE_VERSION:
		return false
	for dictionary_key in [
		"inventory", "edits", "block_entities", "progression", "magic_player",
		"edit_provenance", "settlements", "hamlet", "combat", "ui", "worldgen",
		"world_manifest", "forge_presentation", "production_kernel", "structures",
		"simulation_lod", "people", "biology", "social", "political", "movement",
		"registry_state",
	]:
		if data.has(dictionary_key) and not (data[dictionary_key] is Dictionary):
			return false
	for array_key in ["player_position", "item_drops"]:
		if data.has(array_key) and not (data[array_key] is Array):
			return false
	if data.has("player_position") \
			and (data["player_position"] as Array).size() not in [0, 3]:
		return false
	if data.has("item_drops") and (data["item_drops"] as Array).size() > 10000:
		return false
	if data.has("edits") and (data["edits"] as Dictionary).size() > 2000000:
		return false
	return true


func _canonical_json(value: Variant) -> String:
	if value is Dictionary:
		var dictionary: Dictionary = value
		var keys: Array = dictionary.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str(a) < str(b))
		var entries: Array[String] = []
		for key in keys:
			entries.append("%s:%s" % [
				JSON.stringify(str(key)),
				_canonical_json(dictionary[key]),
			])
		return "{%s}" % ",".join(entries)
	if value is Array:
		var entries: Array[String] = []
		for entry in value:
			entries.append(_canonical_json(entry))
		return "[%s]" % ",".join(entries)
	if value is int or value is float:
		# JSON normalises all numbers through its numeric representation. Hash
		# integers and equivalent whole floats identically across write/read.
		return String.num(float(value), 15)
	return JSON.stringify(value)


func _sha256_text(value: String) -> String:
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(value.to_utf8_buffer())
	return context.finish().hex_encode()


func _save_source_label(path: String) -> String:
	if path == _save_path:
		return "final"
	if path == _save_previous_path:
		return "previous"
	if path == _save_backup_path:
		return "backup"
	if path == _save_temp_path:
		return "temporary"
	return "unknown"


func _apply_save(data: Dictionary) -> void:
	## Restore shared evidence before owner state. Legacy saves without the
	## StructureInstance and simulation-LOD domains deliberately rebuild only
	## derivable records, then reconcile saved owner projections below.
	var production_kernel_data: Variant = data.get("production_kernel", {})
	if production_kernel_data is Dictionary \
			and not production_kernel_data.is_empty():
		if not ProductionKernel.restore_state(production_kernel_data):
			push_warning("MAIN: rejected incompatible production-kernel state")
	else:
		ProductionKernel.reset_for_verification()
	var structures_data: Variant = data.get("structures", {})
	var reseed_structure_base: bool = not (
		structures_data is Dictionary and not structures_data.is_empty())
	if not reseed_structure_base:
		if not StructureManager.restore_state(
				structures_data,
				world.world_seed,
				str(WorldManager.active_world.get("world_id", ""))):
			push_warning(
				"MAIN: rejected incompatible structure owner state; rebuilding derivable base")
			reseed_structure_base = true
	if reseed_structure_base:
		StructureManager.reset()
		StructureManager.initialize(
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
	var simulation_lod_data: Variant = data.get("simulation_lod", {})
	var restored_simulation_lod := false
	if simulation_lod_data is Dictionary \
			and not simulation_lod_data.is_empty():
		restored_simulation_lod = SimulationLodManager.restore_state(
			simulation_lod_data,
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
		if not restored_simulation_lod:
			push_warning(
				"MAIN: rejected incompatible simulation-LOD state; rebuilding owner projections")
	if not restored_simulation_lod:
		SimulationLodManager.reset()
		SimulationLodManager.initialize(
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
	var people_data: Variant = data.get("people", {})
	var restored_people := false
	if people_data is Dictionary and not people_data.is_empty():
		restored_people = PeopleManager.restore_state(
			people_data,
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
		if not restored_people:
			push_warning(
				"MAIN: rejected incompatible people-owner state; rebuilding compatibility projections")
	if not restored_people:
		PeopleManager.reset()
		PeopleManager.initialize(
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
	var biology_data: Variant = data.get("biology", {})
	var restored_biology := false
	if biology_data is Dictionary and not biology_data.is_empty():
		restored_biology = BiologyManager.restore_state(
			biology_data,
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
		if not restored_biology:
			push_warning(
				"MAIN: rejected incompatible biological state; rebuilding compatibility projections")
	if not restored_biology:
		BiologyManager.reset()
		BiologyManager.initialize(
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
	var social_data: Variant = data.get("social", {})
	var restored_social := false
	if social_data is Dictionary and not social_data.is_empty():
		restored_social = SocialManager.restore_state(
			social_data,
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
		if not restored_social:
			push_warning(
				"MAIN: rejected incompatible social state; rebuilding compatibility projections")
	if not restored_social:
		SocialManager.reset()
		SocialManager.initialize(
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
	var political_data: Variant = data.get("political", {})
	var restored_political := false
	if political_data is Dictionary and not political_data.is_empty():
		restored_political = PoliticalManager.restore_state(
			political_data,
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
		if not restored_political:
			push_warning(
				"MAIN: rejected incompatible political state; rebuilding compatibility projections")
	if not restored_political:
		PoliticalManager.reset()
		PoliticalManager.initialize(
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
	var movement_data: Variant = data.get("movement", {})
	var restored_movement := false
	if movement_data is Dictionary and not movement_data.is_empty():
		restored_movement = MovementManager.restore_state(
			movement_data,
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
		if not restored_movement:
			push_warning(
				"MAIN: rejected incompatible movement state; rebuilding compatibility projections")
	if not restored_movement:
		MovementManager.reset()
		MovementManager.initialize(
			world.world_seed,
			str(WorldManager.active_world.get("world_id", "")))
	world.apply_edits(data.get("edits", {}))
	world.apply_edit_provenance(data.get("edit_provenance", {}))
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
	var settlements_data: Variant = data.get("settlements", {})
	var restored_settlements := false
	if settlements_data is Dictionary and not settlements_data.is_empty():
		restored_settlements = SettlementManager.restore_state(
			settlements_data, world.world_seed)
		if not restored_settlements:
			push_warning(
				"MAIN: rejected incompatible settlement collection; using fresh regional state")
	if not restored_settlements:
		var hamlet_data: Variant = data.get("hamlet", {})
		if hamlet_data is Dictionary and not hamlet_data.is_empty():
			if not HamletState.restore_state(hamlet_data, world.world_seed):
				push_warning(
					"MAIN: rejected incompatible hamlet state; using fresh valley state")
			else:
				SettlementManager.initialize_legacy(world.world_seed)
	SettlementManager.refresh_people_owner()
	SettlementManager.refresh_biology_owner()
	SettlementManager.refresh_social_owner()
	SettlementManager.refresh_political_owner()
	SettlementManager.refresh_movement_owner()
	var combat_data: Variant = data.get("combat", {})
	if combat_data is Dictionary and not combat_data.is_empty():
		if not CombatState.restore_state(combat_data, world.world_seed):
			push_warning("MAIN: rejected incompatible combat state; using a fresh raid state")
	SettlementManager.refresh_lod_subjects()
	if reseed_structure_base:
		HamletState.ensure_seeded_structure_owner()
	var ui_data: Variant = data.get("ui", {})
	if ui_data is Dictionary and not ui_data.is_empty():
		UIState.restore_world_state(ui_data)
	var forge_presentation_data: Variant = data.get("forge_presentation", {})
	if forge_presentation_data is Dictionary:
		if not _forge_world_presentation_state.restore_state(forge_presentation_data):
			push_warning("MAIN: rejected incompatible optional Forge presentation state")
	var p: Array = data.get("player_position", [])
	if p.size() == 3:
		var requested_position := Vector3(p[0], p[1], p[2])
		world.prepare_player_column(requested_position)
		var safe_position := world.resolve_safe_player_position(requested_position)
		if not safe_position.is_equal_approx(requested_position):
			push_warning("MAIN: repaired unsafe saved player position %s -> %s" % [
				requested_position, safe_position])
		player.global_position = safe_position
	else:
		player.global_position = world.find_spawn()
	world.restore_item_drops(data.get("item_drops", []))
	if data.has("player_yaw"):
		player.restore_view(float(data["player_yaw"]), float(data.get("player_pitch", 0.0)))
	var movement_result := _reconcile_player_movement(true)
	if not bool(movement_result.get("ok", false)):
		push_warning("MAIN: player movement restore handoff failed: %s" % movement_result)


func _reconcile_player_movement(force_safe: bool) -> Dictionary:
	var entity_ref := BiologyManager.PLAYER_ACTOR_ID
	if MovementManager.has_mover(entity_ref):
		var record := MovementManager.mover_record(entity_ref)
		var saved_position: Array = record.get("position", [])
		if saved_position.size() == 3:
			var canonical_position := Vector3(
				float(saved_position[0]),
				float(saved_position[1]),
				float(saved_position[2]))
			if canonical_position.is_equal_approx(player.global_position):
				return {"ok": true, "duplicate": true}
	return player.publish_movement_snapshot(force_safe)


func forge_world_presentation_state() -> ForgeWorldPresentationStateService:
	return _forge_world_presentation_state
