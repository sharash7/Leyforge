extends Node
## Owns world selection, world cards, seed resolution, legacy import, and the
## global player profile. Gameplay remains in main.tscn and receives an active
## world descriptor through this autoload.

signal worlds_changed
signal active_world_changed(world_id: String)
signal profile_save_failed(message: String)

const WorldStructurePlannerScript = preload(
	"res://scripts/world/world_structure_planner.gd")

const WORLDS_ROOT := "user://worlds"
const PROFILE_PATH := "user://profile.json"
const PROFILE_TEMP_PATH := "user://profile.tmp"
const PROFILE_BACKUP_PATH := "user://profile.backup.json"
const LEGACY_MARKER_PATH := "user://worlds/.legacy_import_complete"
const METADATA_FILE := "metadata.json"
const METADATA_TEMP_FILE := "metadata.tmp"
const METADATA_BACKUP_FILE := "metadata.backup.json"
const WORLD_FILE := "world.json"
const WORLD_TEMP_FILE := "world.tmp"
const WORLD_PREVIOUS_FILE := "world.previous"
const WORLD_BACKUP_FILE := "world.backup.json"
const WORLD_CARD_VERSION := 1
const PROFILE_VERSION := 1
const CURRENT_SAVE_VERSION := 17
const NEW_WORLDGEN_VERSION := 5
const NEW_PLAN_VERSION := 4
const REGIONAL_WORLDGEN_VERSION := 4
const REGIONAL_PLAN_VERSION := 3
const LEGACY_WORLDGEN_VERSION := 2
const LEGACY_PLAN_VERSION := 1
const LEGACY_PROFILE_ID := "world.profile.controlled_poc_valley"
const PROFILE_ID := "world.profile.controlled_poc_regional"
const LEGACY_PATHS := {
	WORLD_FILE: "user://leyforge_save.json",
	WORLD_TEMP_FILE: "user://leyforge_save.tmp",
	WORLD_PREVIOUS_FILE: "user://leyforge_save.previous",
	WORLD_BACKUP_FILE: "user://leyforge_save.backup.json",
}

var active_world: Dictionary = {}
var _profile_restore_in_progress := false
var _verification_root := ""
var _session_started_msec := 0


func _ready() -> void:
	_ensure_directory(_worlds_root())
	_load_profile()
	UIState.settings_changed.connect(_on_profile_changed)
	UIState.bindings_changed.connect(_on_profile_changed)
	_import_legacy_world_once()


func worlds_root() -> String:
	return _worlds_root()


func configure_verification_root(path: String) -> bool:
	if not path.begins_with("user://verification_") and not path.begins_with(
			"res://.summer/verification/."):
		return false
	if ".." in path:
		return false
	_verification_root = path
	_ensure_directory(_worlds_root())
	return true


func clear_verification_root() -> void:
	_verification_root = ""


func _worlds_root() -> String:
	return _verification_root if not _verification_root.is_empty() else WORLDS_ROOT


func resolve_seed(entry: String) -> Dictionary:
	var original := entry.strip_edges()
	if original.is_empty():
		return {
			"ok": true,
			"original": "",
			"resolved": _unused_random_seed(),
			"kind": "random",
		}
	if original.is_valid_int():
		return {
			"ok": true,
			"original": original,
			"resolved": int(original),
			"kind": "numeric",
		}
	var hash_value := 0x811C9DC5
	for byte in original.to_utf8_buffer():
		hash_value = ((hash_value ^ int(byte)) * 16777619) & 0x7FFFFFFF
	if hash_value <= 0:
		hash_value = 1
	return {
		"ok": true,
		"original": original,
		"resolved": hash_value,
		"kind": "text",
	}


func preview_random_seed() -> int:
	return _unused_random_seed()


func validate_new_world_seed(seed_value: int) -> Dictionary:
	var plan := WorldStructurePlannerScript.new()
	plan.generate(seed_value, NEW_PLAN_VERSION)
	var errors: Array[String] = plan.validation_errors.duplicate()
	if plan.fallback_used:
		errors.push_front("fallback_layout_used")
	return {
		"ok": errors.is_empty(),
		"seed": seed_value,
		"plan_id": plan.identity(),
		"worldgen_version": NEW_WORLDGEN_VERSION,
		"plan_version": NEW_PLAN_VERSION,
		"fallback_used": plan.fallback_used,
		"errors": errors,
		"anchors": plan.anchors.duplicate(true),
		"starter_mode": plan.starter_mode,
		"site_plan_hash": plan.site_plan_hash,
		"placement_rule_hash": plan.placement_rule_hash,
		"regional_config_id": str(plan.save_manifest().get("config_id", "")),
	}


func create_world(world_name: String, seed_entry: String,
		random_preview_seed: int = 0) -> Dictionary:
	var cleaned_name := world_name.strip_edges()
	if cleaned_name.is_empty():
		return {"ok": false, "errors": ["world_name_required"]}
	if cleaned_name.length() > 64:
		return {"ok": false, "errors": ["world_name_too_long"]}
	var seed_result := resolve_seed(seed_entry)
	if str(seed_result["kind"]) == "random" and random_preview_seed > 0:
		seed_result["resolved"] = random_preview_seed
	var seed_value := int(seed_result["resolved"])
	var validation := validate_new_world_seed(seed_value)
	if not bool(validation["ok"]):
		return {
			"ok": false,
			"seed_original": seed_result["original"],
			"resolved_seed": seed_value,
			"errors": validation["errors"],
		}
	var world_id := _new_world_id(seed_value)
	var now := int(Time.get_unix_time_from_system())
	var metadata := {
		"metadata_version": WORLD_CARD_VERSION,
		"world_id": world_id,
		"name": cleaned_name,
		"seed_original": seed_result["original"],
		"resolved_seed": seed_value,
		"seed_kind": seed_result["kind"],
		"created_unix": now,
		"last_played_unix": 0,
		"playtime_seconds": 0,
		"save_version": CURRENT_SAVE_VERSION,
		"worldgen_version": NEW_WORLDGEN_VERSION,
		"plan_version": NEW_PLAN_VERSION,
		"profile_id": PROFILE_ID,
		"plan_id": validation["plan_id"],
		"starter_mode": validation["starter_mode"],
		"site_plan_hash": validation["site_plan_hash"],
		"placement_rule_hash": validation["placement_rule_hash"],
		"regional_config_id": validation["regional_config_id"],
		"validation_result": "valid",
		"validation_errors": [],
		"save_health": "new_world",
		"legacy_import": false,
	}
	_ensure_directory(world_directory(world_id))
	if not _write_metadata(metadata):
		return {"ok": false, "errors": ["metadata_write_failed"]}
	select_world(metadata)
	worlds_changed.emit()
	return {"ok": true, "world": metadata.duplicate(true)}


func select_world(world: Dictionary) -> bool:
	var world_id := str(world.get("world_id", ""))
	if world_id.is_empty() or not is_world_playable(world):
		return false
	active_world = world.duplicate(true)
	_session_started_msec = Time.get_ticks_msec()
	active_world_changed.emit(world_id)
	return true


func select_world_by_id(world_id: String) -> bool:
	for world in list_worlds():
		if str(world.get("world_id", "")) == world_id:
			return select_world(world)
	return false


func clear_active_world() -> void:
	active_world.clear()
	_session_started_msec = 0
	active_world_changed.emit("")


func continue_world() -> Dictionary:
	for world in list_worlds():
		if is_world_playable(world):
			return world
	return {}


func list_worlds() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	_ensure_directory(_worlds_root())
	var root := DirAccess.open(_worlds_root())
	if root == null:
		return result
	root.list_dir_begin()
	var entry := root.get_next()
	while not entry.is_empty():
		if root.current_is_dir() and not entry.begins_with("."):
			var metadata := _read_metadata(entry)
			if metadata.is_empty():
				metadata = _reconstruct_metadata(entry)
			if not metadata.is_empty():
				metadata["save_health"] = _inspect_save_health(entry, metadata)
				result.append(metadata)
		entry = root.get_next()
	root.list_dir_end()
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var a_last := int(a.get("last_played_unix", 0))
		var b_last := int(b.get("last_played_unix", 0))
		if a_last == b_last:
			return int(a.get("created_unix", 0)) > int(b.get("created_unix", 0))
		return a_last > b_last)
	return result


func is_world_playable(world: Dictionary) -> bool:
	if str(world.get("validation_result", "valid")) != "valid":
		return false
	var health := str(world.get("save_health", "new_world"))
	if health in ["unrecoverable", "incompatible"]:
		return false
	var save_version := int(world.get("save_version", CURRENT_SAVE_VERSION))
	return save_version >= 2 and save_version <= CURRENT_SAVE_VERSION


func active_world_paths() -> Dictionary:
	if active_world.is_empty():
		return {}
	var directory := world_directory(str(active_world["world_id"]))
	return {
		"directory": directory,
		"final": directory.path_join(WORLD_FILE),
		"temporary": directory.path_join(WORLD_TEMP_FILE),
		"previous": directory.path_join(WORLD_PREVIOUS_FILE),
		"backup": directory.path_join(WORLD_BACKUP_FILE),
		"metadata": directory.path_join(METADATA_FILE),
	}


func active_world_has_save_candidates() -> bool:
	for path in active_world_paths().values():
		if str(path).get_file() in [
			WORLD_FILE, WORLD_TEMP_FILE, WORLD_PREVIOUS_FILE, WORLD_BACKUP_FILE,
		] and FileAccess.file_exists(str(path)):
			return true
	return false


func active_generation_request() -> Dictionary:
	if active_world.is_empty():
		return {}
	return {
		"world_id": active_world.get("world_id", ""),
		"name": active_world.get("name", ""),
		"seed_original": active_world.get("seed_original", ""),
		"resolved_seed": int(active_world.get("resolved_seed", 0)),
		"worldgen_version": int(active_world.get(
			"worldgen_version", LEGACY_WORLDGEN_VERSION)),
		"plan_version": int(active_world.get(
			"plan_version", LEGACY_PLAN_VERSION)),
		"profile_id": str(active_world.get("profile_id", PROFILE_ID)),
		"plan_id": str(active_world.get("plan_id", "")),
		"starter_mode": str(active_world.get("starter_mode", "")),
		"site_plan_hash": str(active_world.get("site_plan_hash", "")),
		"placement_rule_hash": str(active_world.get(
			"placement_rule_hash", "")),
		"regional_config_id": str(active_world.get(
			"regional_config_id", "")),
	}


func active_playtime_seconds() -> int:
	if active_world.is_empty():
		return 0
	var elapsed := 0
	if _session_started_msec > 0:
		elapsed = maxi(0, int(
			(Time.get_ticks_msec() - _session_started_msec) / 1000))
	return int(active_world.get("playtime_seconds", 0)) + elapsed


func update_active_world_after_save(save_manifest: Dictionary,
		worldgen_manifest: Dictionary, health: Dictionary) -> bool:
	if active_world.is_empty():
		return true
	var elapsed_seconds := 0
	if _session_started_msec > 0:
		elapsed_seconds = maxi(0, int(
			(Time.get_ticks_msec() - _session_started_msec) / 1000))
	_session_started_msec = Time.get_ticks_msec()
	active_world["last_played_unix"] = int(Time.get_unix_time_from_system())
	active_world["playtime_seconds"] = int(
		active_world.get("playtime_seconds", 0)) + elapsed_seconds
	active_world["save_version"] = int(save_manifest.get(
		"save_version", CURRENT_SAVE_VERSION))
	active_world["resolved_seed"] = int(save_manifest.get(
		"resolved_seed", active_world.get("resolved_seed", 0)))
	active_world["worldgen_version"] = int(worldgen_manifest.get(
		"worldgen_version", active_world.get(
			"worldgen_version", NEW_WORLDGEN_VERSION)))
	active_world["plan_version"] = int(worldgen_manifest.get(
		"version", active_world.get("plan_version", NEW_PLAN_VERSION)))
	active_world["plan_id"] = str(worldgen_manifest.get(
		"plan_id", active_world.get("plan_id", "")))
	active_world["profile_id"] = str(worldgen_manifest.get(
		"profile_id", active_world.get("profile_id", PROFILE_ID)))
	active_world["starter_mode"] = str(worldgen_manifest.get(
		"starter_mode", active_world.get("starter_mode", "")))
	active_world["site_plan_hash"] = str(worldgen_manifest.get(
		"site_plan_hash", active_world.get("site_plan_hash", "")))
	active_world["placement_rule_hash"] = str(worldgen_manifest.get(
		"placement_rule_hash", active_world.get("placement_rule_hash", "")))
	active_world["regional_config_id"] = str(worldgen_manifest.get(
		"config_id", active_world.get("regional_config_id", "")))
	active_world["save_health"] = str(health.get("status", "healthy"))
	active_world["validation_result"] = "valid"
	var ok := _write_metadata(active_world)
	if ok:
		worlds_changed.emit()
	return ok


func mark_active_world_invalid(errors: Array[String]) -> void:
	if active_world.is_empty():
		return
	active_world["validation_result"] = "invalid"
	active_world["validation_errors"] = errors.duplicate()
	active_world["save_health"] = "incompatible"
	_write_metadata(active_world)
	worlds_changed.emit()


func world_directory(world_id: String) -> String:
	return _worlds_root().path_join(world_id)


func save_profile() -> bool:
	var data := {
		"version": PROFILE_VERSION,
		"written_unix": int(Time.get_unix_time_from_system()),
		"profile": UIState.serialize_profile_state(),
	}
	_ensure_directory(PROFILE_PATH.get_base_dir())
	if not _write_json(PROFILE_TEMP_PATH, data):
		profile_save_failed.emit("Could not write the profile temporary file.")
		return false
	var final_absolute := ProjectSettings.globalize_path(PROFILE_PATH)
	var temp_absolute := ProjectSettings.globalize_path(PROFILE_TEMP_PATH)
	var backup_absolute := ProjectSettings.globalize_path(PROFILE_BACKUP_PATH)
	if FileAccess.file_exists(PROFILE_BACKUP_PATH):
		DirAccess.remove_absolute(backup_absolute)
	if FileAccess.file_exists(PROFILE_PATH):
		if DirAccess.rename_absolute(final_absolute, backup_absolute) != OK:
			profile_save_failed.emit("Could not rotate the previous profile.")
			return false
	if DirAccess.rename_absolute(temp_absolute, final_absolute) != OK:
		if FileAccess.file_exists(PROFILE_BACKUP_PATH):
			DirAccess.rename_absolute(backup_absolute, final_absolute)
		profile_save_failed.emit("Could not commit the profile.")
		return false
	return true


func _load_profile() -> void:
	_profile_restore_in_progress = true
	var data := _read_json(PROFILE_PATH)
	if data.is_empty():
		data = _read_json(PROFILE_BACKUP_PATH)
	var profile: Variant = data.get("profile", {})
	if profile is Dictionary and not profile.is_empty():
		UIState.restore_profile_state(profile)
	_profile_restore_in_progress = false


func _on_profile_changed() -> void:
	if not _profile_restore_in_progress:
		save_profile()


func _write_metadata(metadata: Dictionary) -> bool:
	var world_id := str(metadata.get("world_id", ""))
	if world_id.is_empty():
		return false
	var directory := world_directory(world_id)
	_ensure_directory(directory)
	var temp := directory.path_join(METADATA_TEMP_FILE)
	var final := directory.path_join(METADATA_FILE)
	var backup := directory.path_join(METADATA_BACKUP_FILE)
	if not _write_json(temp, metadata):
		return false
	if FileAccess.file_exists(backup):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(backup))
	if FileAccess.file_exists(final):
		if DirAccess.rename_absolute(
				ProjectSettings.globalize_path(final),
				ProjectSettings.globalize_path(backup)) != OK:
			return false
	if DirAccess.rename_absolute(
			ProjectSettings.globalize_path(temp),
			ProjectSettings.globalize_path(final)) != OK:
		if FileAccess.file_exists(backup):
			DirAccess.rename_absolute(
				ProjectSettings.globalize_path(backup),
				ProjectSettings.globalize_path(final))
		return false
	return true


func _read_metadata(world_id: String) -> Dictionary:
	var directory := world_directory(world_id)
	var metadata := _read_json(directory.path_join(METADATA_FILE))
	if metadata.is_empty():
		metadata = _read_json(directory.path_join(METADATA_BACKUP_FILE))
	if str(metadata.get("world_id", "")) != world_id:
		return {}
	return metadata


func _reconstruct_metadata(world_id: String) -> Dictionary:
	var directory := world_directory(world_id)
	for filename in [WORLD_FILE, WORLD_PREVIOUS_FILE, WORLD_BACKUP_FILE, WORLD_TEMP_FILE]:
		var save := _read_json(directory.path_join(filename))
		if save.is_empty():
			continue
		var save_version := int(save.get("version", 0))
		if save_version < 2 or save_version > CURRENT_SAVE_VERSION:
			continue
		if save_version >= 13 and not _validate_integrity_record(save):
			continue
		var manifest: Dictionary = save.get("save_manifest", {})
		var worldgen: Dictionary = save.get("worldgen", {})
		var recovered_id := str(manifest.get("world_id", world_id))
		if recovered_id != world_id:
			continue
		return {
			"metadata_version": WORLD_CARD_VERSION,
			"world_id": world_id,
			"name": str(manifest.get("world_name", "Recovered World")),
			"seed_original": str(manifest.get("seed_original", save.get("seed", ""))),
			"resolved_seed": int(manifest.get(
				"resolved_seed", save.get("seed", 0))),
			"seed_kind": str(manifest.get("seed_kind", "recovered")),
			"created_unix": int(manifest.get("created_unix", 0)),
			"last_played_unix": int(manifest.get("written_unix", 0)),
			"playtime_seconds": int(manifest.get("playtime_seconds", 0)),
			"save_version": int(save.get("version", 0)),
			"worldgen_version": int(worldgen.get("worldgen_version", 2)),
			"plan_version": int(worldgen.get("version", 1)),
			"profile_id": str(worldgen.get(
				"profile_id", LEGACY_PROFILE_ID)),
			"plan_id": str(worldgen.get("plan_id", "")),
			"starter_mode": str(worldgen.get("starter_mode", "")),
			"site_plan_hash": str(worldgen.get("site_plan_hash", "")),
			"placement_rule_hash": str(worldgen.get(
				"placement_rule_hash", "")),
			"regional_config_id": str(worldgen.get("config_id", "")),
			"validation_result": "valid",
			"validation_errors": [],
			"save_health": "recovered",
			"legacy_import": bool(manifest.get("legacy_import", false)),
		}
	return {}


func _inspect_save_health(world_id: String, metadata: Dictionary) -> String:
	var directory := world_directory(world_id)
	var candidates := 0
	var incompatible := false
	for filename in [WORLD_FILE, WORLD_PREVIOUS_FILE, WORLD_BACKUP_FILE, WORLD_TEMP_FILE]:
		var path := directory.path_join(filename)
		if not FileAccess.file_exists(path):
			continue
		candidates += 1
		var data := _read_json(path)
		var version := int(data.get("version", 0))
		if version < 2 or version > CURRENT_SAVE_VERSION:
			incompatible = true
			continue
		var worldgen: Variant = data.get("worldgen", {})
		if worldgen is Dictionary and not worldgen.is_empty():
			var worldgen_version := int(worldgen.get("worldgen_version", -1))
			var plan_version := int(worldgen.get("version", -1))
			var profile_id := str(worldgen.get(
				"profile_id", LEGACY_PROFILE_ID))
			var supported := (
				worldgen_version == 2
					and plan_version == 1
					and profile_id == LEGACY_PROFILE_ID
			) or (
				worldgen_version == 3
					and plan_version == 2
					and profile_id == LEGACY_PROFILE_ID
			) or (
				worldgen_version == REGIONAL_WORLDGEN_VERSION
					and plan_version == REGIONAL_PLAN_VERSION
					and profile_id == PROFILE_ID
			) or (
				worldgen_version == NEW_WORLDGEN_VERSION
					and plan_version == NEW_PLAN_VERSION
					and profile_id == PROFILE_ID
			)
			if not supported:
				incompatible = true
				continue
		if version >= 13 and not _validate_integrity_record(data):
			continue
		if version >= 2:
			return "healthy" if filename == WORLD_FILE else "recovered"
	if candidates == 0 and str(metadata.get("save_health", "")) == "new_world":
		return "new_world"
	return "incompatible" if incompatible else "unrecoverable"


func _import_legacy_world_once() -> void:
	var marker := _legacy_marker_path()
	if FileAccess.file_exists(marker):
		return
	var found := false
	var import_succeeded := true
	for source in LEGACY_PATHS.values():
		if FileAccess.file_exists(str(source)):
			found = true
			break
	if found:
		var world_id := "legacy-world"
		var suffix := 2
		while DirAccess.dir_exists_absolute(ProjectSettings.globalize_path(
				world_directory(world_id))):
			world_id = "legacy-world-%d" % suffix
			suffix += 1
		var directory := world_directory(world_id)
		_ensure_directory(directory)
		for destination in LEGACY_PATHS:
			var source := str(LEGACY_PATHS[destination])
			if FileAccess.file_exists(source):
				import_succeeded = _copy_file(
					source, directory.path_join(str(destination))) \
					and import_succeeded
		if not FileAccess.file_exists(PROFILE_PATH):
			var legacy_save := _read_legacy_profile_source()
			var legacy_ui: Variant = legacy_save.get("ui", {})
			if legacy_ui is Dictionary and not legacy_ui.is_empty():
				_profile_restore_in_progress = true
				UIState.restore_profile_state(legacy_ui)
				_profile_restore_in_progress = false
				save_profile()
		var reconstructed := _reconstruct_metadata(world_id)
		var seed_value := int(reconstructed.get("resolved_seed", 1337))
		var legacy_plan := ValleyPlan.new()
		legacy_plan.generate(seed_value, LEGACY_PLAN_VERSION)
		var now := int(Time.get_unix_time_from_system())
		var metadata := {
			"metadata_version": WORLD_CARD_VERSION,
			"world_id": world_id,
			"name": "Legacy World",
			"seed_original": str(seed_value),
			"resolved_seed": seed_value,
			"seed_kind": "legacy",
			"created_unix": int(reconstructed.get("created_unix", now)),
			"last_played_unix": int(reconstructed.get("last_played_unix", 0)),
			"playtime_seconds": int(reconstructed.get("playtime_seconds", 0)),
			"save_version": int(reconstructed.get("save_version", 14)),
			"worldgen_version": int(reconstructed.get(
				"worldgen_version", LEGACY_WORLDGEN_VERSION)),
			"plan_version": int(reconstructed.get(
				"plan_version", LEGACY_PLAN_VERSION)),
			"profile_id": LEGACY_PROFILE_ID,
			"plan_id": str(reconstructed.get("plan_id", legacy_plan.identity())),
			"validation_result": "valid",
			"validation_errors": [],
			"save_health": _inspect_save_health(world_id, {"save_health": "recovered"}),
			"legacy_import": true,
		}
		import_succeeded = _write_metadata(metadata) and import_succeeded
		if import_succeeded:
			worlds_changed.emit()
	if import_succeeded:
		_write_text(marker, "Legacy import checked at %d" % int(Time.get_unix_time_from_system()))


func _read_legacy_profile_source() -> Dictionary:
	for destination in [
		WORLD_FILE, WORLD_PREVIOUS_FILE, WORLD_BACKUP_FILE, WORLD_TEMP_FILE,
	]:
		var data := _read_json(str(LEGACY_PATHS[destination]))
		if data.is_empty():
			continue
		var version := int(data.get("version", 0))
		if version < 2 or version > CURRENT_SAVE_VERSION:
			continue
		if version >= 13 and not _validate_integrity_record(data):
			continue
		return data
	return {}


func _legacy_marker_path() -> String:
	return _worlds_root().path_join(".legacy_import_complete")


func _unused_random_seed() -> int:
	var used := {}
	for world in list_worlds():
		used[int(world.get("resolved_seed", 0))] = true
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	for _attempt in 256:
		var candidate := rng.randi_range(1, 0x7FFFFFFF)
		if not used.has(candidate):
			return candidate
	# Time-based deterministic escape hatch if the platform RNG is unavailable.
	var fallback := maxi(1, int(Time.get_ticks_usec() & 0x7FFFFFFF))
	while used.has(fallback):
		fallback = (fallback + 1) & 0x7FFFFFFF
		if fallback == 0:
			fallback = 1
	return fallback


func _new_world_id(seed_value: int) -> String:
	var base := "world-%d-%08x" % [
		int(Time.get_unix_time_from_system()),
		ValleyPlan.derive_seed(seed_value, str(Time.get_ticks_usec())),
	]
	var candidate := base
	var suffix := 2
	while DirAccess.dir_exists_absolute(ProjectSettings.globalize_path(
			world_directory(candidate))):
		candidate = "%s-%d" % [base, suffix]
		suffix += 1
	return candidate


func _ensure_directory(path: String) -> bool:
	var absolute := ProjectSettings.globalize_path(path)
	return DirAccess.make_dir_recursive_absolute(absolute) in [OK, ERR_ALREADY_EXISTS]


func _read_json(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		return {}
	if file.get_length() <= 0 or file.get_length() > 64 * 1024 * 1024:
		file.close()
		return {}
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	file.close()
	return parsed if parsed is Dictionary else {}


func _write_json(path: String, data: Dictionary) -> bool:
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		return false
	file.store_string(JSON.stringify(data))
	file.flush()
	var result := file.get_error() == OK
	file.close()
	return result


func _validate_integrity_record(data: Dictionary) -> bool:
	var integrity: Variant = data.get("integrity", {})
	if not (integrity is Dictionary):
		return false
	if int(integrity.get("version", 0)) != 1 \
			or str(integrity.get("algorithm", "")) != "sha256":
		return false
	var expected := str(integrity.get("payload_sha256", ""))
	if expected.length() != 64:
		return false
	var payload := data.duplicate(true)
	payload.erase("integrity")
	return expected == _sha256_text(_canonical_json(payload))


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
		return String.num(float(value), 15)
	return JSON.stringify(value)


func _sha256_text(value: String) -> String:
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(value.to_utf8_buffer())
	return context.finish().hex_encode()


func _write_text(path: String, value: String) -> bool:
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		return false
	file.store_string(value)
	file.flush()
	var result := file.get_error() == OK
	file.close()
	return result


func _copy_file(source: String, destination: String) -> bool:
	var input := FileAccess.open(source, FileAccess.READ)
	if input == null:
		return false
	var bytes := input.get_buffer(input.get_length())
	input.close()
	var output := FileAccess.open(destination, FileAccess.WRITE)
	if output == null:
		return false
	output.store_buffer(bytes)
	output.flush()
	var result := output.get_error() == OK
	output.close()
	return result
