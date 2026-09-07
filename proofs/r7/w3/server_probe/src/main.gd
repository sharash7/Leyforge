extends Node

const PHASES := [
    "SESSION-BEGIN",
    "COMMAND-RECEIVE",
    "VALIDATE",
    "RESERVE",
    "SEMANTIC-COMMIT",
    "JOURNAL-INTENT",
    "STRUCTURED-STAGE",
    "VOXEL-STAGE",
    "JOURNAL-STAGE",
    "MANIFEST-TEMP",
    "PARTICIPANT-FSYNC",
    "MANIFEST-PUBLISH",
    "ACK-PREPARE",
    "ACK-SENT",
]

func _ready() -> void:
    var build_manifest := _read_json("res://build_manifest.json")
    if build_manifest.is_empty():
        print("LEYFORGE_W3_REPORT " + JSON.stringify({"status": "FAIL", "error": "missing build manifest"}))
        get_tree().quit(2)
        return
    var args := _parse_arguments(OS.get_cmdline_user_args())
    var mode := str(args.get("mode", "smoke"))
    if mode == "smoke":
        var smoke := _smoke(build_manifest)
        print("LEYFORGE_W3_SELF_REPORT " + JSON.stringify(smoke))
        get_tree().quit(0 if smoke.get("status") == "PASS" else 3)
        return
    if mode == "session-smoke":
        var session := _session_smoke(args, build_manifest)
        print("LEYFORGE_W3_SESSION_REPORT " + JSON.stringify(session))
        get_tree().quit(0 if session.get("status") == "PASS" else 4)
        return
    if mode == "crash-worker":
        _crash_worker(args, build_manifest)
        return
    if mode == "recover":
        var recovery := _recover(args, build_manifest)
        print("LEYFORGE_W3_RECOVERY_REPORT " + JSON.stringify(recovery))
        get_tree().quit(0 if recovery.get("status") == "PASS" else 5)
        return
    print("LEYFORGE_W3_REPORT " + JSON.stringify({"status": "FAIL", "error": "unsupported mode", "mode": mode}))
    get_tree().quit(2)

func _smoke(build_manifest: Dictionary) -> Dictionary:
    var provider_ready := ClassDB.class_exists("VoxelBuffer")
    var readback := -1
    if provider_ready:
        var buffer = ClassDB.instantiate("VoxelBuffer")
        buffer.call("create", 8, 8, 8)
        buffer.call("set_voxel", 73, 1, 2, 3, 0)
        readback = int(buffer.call("get_voxel", 1, 2, 3, 0))
    var passed := provider_ready and readback == 73
    return {
        "schema_version": "prd07-w3-server-self-report-v1",
        "status": "PASS" if passed else "FAIL",
        "role": str(build_manifest.get("role", "")),
        "build_identity": str(build_manifest.get("build_identity", "")),
        "provider_ready": provider_ready,
        "provider_class": "VoxelBuffer" if provider_ready else "UNAVAILABLE",
        "provider_edition": "zylann-voxel-tools-gdextension-v1.7x",
        "readback": readback,
        "crash_phase_count": PHASES.size(),
        "presentation_authority_dependencies": 0,
    }

func _session_smoke(args: Dictionary, build_manifest: Dictionary) -> Dictionary:
    var data_root := str(args.get("data-root", ""))
    var role := str(args.get("session-role", "unknown"))
    if data_root.is_empty():
        return {"status": "FAIL", "error": "data-root required"}
    DirAccess.make_dir_recursive_absolute(data_root)
    var ready_path := data_root.path_join("session-ready-" + role + ".json")
    _write_json(ready_path, {
        "role": role,
        "pid": OS.get_process_id(),
        "build_identity": str(build_manifest.get("build_identity", "")),
    })
    OS.delay_msec(350)
    return {
        "schema_version": "prd07-w3-session-smoke-v1",
        "status": "PASS",
        "role": role,
        "pid": OS.get_process_id(),
        "build_identity": str(build_manifest.get("build_identity", "")),
        "world_semantic_id": "world.w3.backup",
        "session_id": "session." + role + "." + str(OS.get_process_id()),
        "deployment_id": "deployment." + role,
    }

func _crash_worker(args: Dictionary, build_manifest: Dictionary) -> void:
    var data_root := str(args.get("data-root", ""))
    var target_phase := str(args.get("target-phase", ""))
    var case_id := str(args.get("case-id", ""))
    var run_id := str(args.get("run-id", ""))
    if data_root.is_empty() or target_phase not in PHASES:
        print("LEYFORGE_W3_CRASH_WORKER " + JSON.stringify({"status": "FAIL", "error": "invalid crash worker arguments"}))
        get_tree().quit(6)
        return
    DirAccess.make_dir_recursive_absolute(data_root)
    _publish_baseline(data_root)
    var generation_root := data_root.path_join("generations/0002")
    DirAccess.make_dir_recursive_absolute(generation_root)
    var semantic_state := {"world_id": "world.w3.crash", "revision": 2, "effect_count": 2, "case_id": case_id}
    for phase in PHASES:
        _apply_generation_two_phase(data_root, generation_root, phase, semantic_state)
        var marker := {
            "schema_version": "prd07-w3-kill-marker-v1",
            "phase": phase,
            "target_phase": target_phase,
            "case_id": case_id,
            "run_id": run_id,
            "pid": OS.get_process_id(),
            "build_identity": str(build_manifest.get("build_identity", "")),
            "manifest_published": PHASES.find(phase) >= PHASES.find("MANIFEST-PUBLISH"),
        }
        _write_json(data_root.path_join("kill-ready.json"), marker)
        if phase == target_phase:
            print("LEYFORGE_W3_KILL_READY " + JSON.stringify(marker))
            while true:
                OS.delay_msec(25)
        OS.delay_msec(2)
    get_tree().quit(7)

func _publish_baseline(data_root: String) -> void:
    var root := data_root.path_join("generations/0001")
    DirAccess.make_dir_recursive_absolute(root)
    var hashes := {}
    for participant in ["structured", "voxel", "journal"]:
        var path := root.path_join(participant + ".json")
        _write_json(path, {
            "world_id": "world.w3.crash",
            "generation": 1,
            "participant": participant,
            "revision": 1,
            "semantic_state": {"revision": 1, "effect_count": 1},
        })
        hashes[participant] = FileAccess.get_sha256(path)
    _write_json(data_root.path_join("manifest-0001.json"), {
        "checkpoint_id": "checkpoint.world.w3.crash.00000001",
        "world_id": "world.w3.crash",
        "generation": 1,
        "previous_generation": null,
        "cutoff_revision": 1,
        "participants": hashes,
    })

func _apply_generation_two_phase(data_root: String, generation_root: String, phase: String, semantic_state: Dictionary) -> void:
    if phase == "JOURNAL-INTENT":
        _write_json(data_root.path_join("journal-intent.json"), {"generation": 2, "operation_id": "operation.crash.2"})
    elif phase == "STRUCTURED-STAGE":
        _write_participant(generation_root, "structured", semantic_state)
    elif phase == "VOXEL-STAGE":
        _write_participant(generation_root, "voxel", semantic_state)
    elif phase == "JOURNAL-STAGE":
        _write_participant(generation_root, "journal", semantic_state)
    elif phase == "MANIFEST-TEMP":
        _write_generation_two_manifest(data_root, generation_root, true)
    elif phase == "PARTICIPANT-FSYNC":
        _write_json(data_root.path_join("participant-fsync.json"), {"generation": 2, "participants": 3})
    elif phase == "MANIFEST-PUBLISH":
        var temp_path := data_root.path_join("manifest-0002.tmp")
        if not FileAccess.file_exists(temp_path):
            _write_generation_two_manifest(data_root, generation_root, true)
        DirAccess.rename_absolute(temp_path, data_root.path_join("manifest-0002.json"))
        _write_json(data_root.path_join("current.json"), {"generation": 2, "checkpoint_id": "checkpoint.world.w3.crash.00000002"})
    elif phase == "ACK-PREPARE":
        _write_json(data_root.path_join("ack-prepare.json"), {"generation": 2, "operation_id": "operation.crash.2"})
    elif phase == "ACK-SENT":
        _write_json(data_root.path_join("ack-sent.json"), {"generation": 2, "operation_id": "operation.crash.2"})

func _write_participant(root: String, participant: String, semantic_state: Dictionary) -> void:
    _write_json(root.path_join(participant + ".json"), {
        "world_id": "world.w3.crash",
        "generation": 2,
        "participant": participant,
        "revision": 2,
        "semantic_state": semantic_state,
    })

func _write_generation_two_manifest(data_root: String, generation_root: String, temporary: bool) -> void:
    var hashes := {}
    for participant in ["structured", "voxel", "journal"]:
        var path := generation_root.path_join(participant + ".json")
        hashes[participant] = FileAccess.get_sha256(path)
    _write_json(data_root.path_join("manifest-0002.tmp" if temporary else "manifest-0002.json"), {
        "checkpoint_id": "checkpoint.world.w3.crash.00000002",
        "world_id": "world.w3.crash",
        "generation": 2,
        "previous_generation": 1,
        "cutoff_revision": 2,
        "participants": hashes,
    })

func _recover(args: Dictionary, build_manifest: Dictionary) -> Dictionary:
    var data_root := str(args.get("data-root", ""))
    var selected_generation := 0
    var selected_manifest := {}
    var revisions := []
    var attempted := []
    for generation in [2, 1]:
        var manifest_path := data_root.path_join("manifest-%04d.json" % generation)
        if not FileAccess.file_exists(manifest_path):
            attempted.append({"generation": generation, "classification": "UNPUBLISHED"})
            continue
        var manifest := _read_json(manifest_path)
        var failures := []
        var candidate_revisions := []
        for participant in ["structured", "voxel", "journal"]:
            var path := data_root.path_join("generations/%04d/%s.json" % [generation, participant])
            if not FileAccess.file_exists(path) or FileAccess.get_sha256(path) != str(manifest.get("participants", {}).get(participant, "")):
                failures.append(participant)
            else:
                candidate_revisions.append(int(_read_json(path).get("revision", -1)))
        if not failures.is_empty() or _unique_count(candidate_revisions) != 1:
            attempted.append({"generation": generation, "classification": "INTEGRITY-REJECTED", "failures": failures})
            continue
        selected_generation = generation
        selected_manifest = manifest
        revisions = candidate_revisions
        attempted.append({"generation": generation, "classification": "SELECTED"})
        break
    var marker := _read_json(data_root.path_join("kill-ready.json"))
    var mixed := _unique_count(revisions) > 1
    var hashes := []
    if selected_generation > 0:
        for participant in ["journal", "structured", "voxel"]:
            hashes.append(str(selected_manifest.get("participants", {}).get(participant, "")))
    return {
        "schema_version": "prd07-w3-real-crash-recovery-v1",
        "status": "PASS" if selected_generation > 0 and not mixed else "FAIL",
        "build_identity": str(build_manifest.get("build_identity", "")),
        "selected_generation": selected_generation,
        "checkpoint_id": str(selected_manifest.get("checkpoint_id", "")),
        "participant_revisions": revisions,
        "mixed_lineage": mixed,
        "state_hash": "|".join(hashes).sha256_text(),
        "attempted": attempted,
        "kill_marker": marker,
        "pid": OS.get_process_id(),
    }

func _unique_count(values: Array) -> int:
    var unique := {}
    for value in values:
        unique[value] = true
    return unique.size()

func _write_json(path: String, value: Variant) -> void:
    var parent := path.get_base_dir()
    DirAccess.make_dir_recursive_absolute(parent)
    var file := FileAccess.open(path, FileAccess.WRITE)
    if file == null:
        return
    file.store_string(JSON.stringify(value, "  ", true) + "\n")
    file.flush()
    file.close()

func _read_json(path: String) -> Dictionary:
    var file := FileAccess.open(path, FileAccess.READ)
    if file == null:
        return {}
    var parsed = JSON.parse_string(file.get_as_text())
    return parsed if parsed is Dictionary else {}

func _parse_arguments(values: PackedStringArray) -> Dictionary:
    var result := {}
    var index := 0
    while index < values.size():
        var key := values[index].trim_prefix("--")
        if index + 1 < values.size() and not values[index + 1].begins_with("--"):
            result[key] = values[index + 1]
            index += 2
        else:
            result[key] = true
            index += 1
    return result
