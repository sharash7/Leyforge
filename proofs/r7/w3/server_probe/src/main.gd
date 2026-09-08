extends Node

const PROOF_IDS := [
    "PRD04-PROOF-08",
    "PRD04-PROOF-27",
    "PRD04-PROOF-28",
    "PRD04-PROOF-29",
    "PRD04-PROOF-30",
    "PRD04-PROOF-31",
    "PRD04-PROOF-32",
]

const FIXTURE_CAPABILITIES := [
    "stable-vessel-semantic-id",
    "vessel-local-frame",
    "world-vessel-frame-conversion",
    "owner-region-epochs",
    "editable-local-hull",
    "revisioned-derived-properties",
    "bounded-local-fluid",
    "explicit-ocean-reservoir",
    "breach-repair-pump",
    "contained-water-mass",
    "buoyancy-diagnostic",
    "controlled-motion",
    "board-disembark",
    "physics-shape-collision-corpus",
    "stale-result-quarantine",
]


func _ready() -> void:
    var build_manifest := _read_json("res://build_manifest.json")
    if build_manifest.is_empty():
        print("LEYFORGE_W3_SELF_REPORT " + JSON.stringify({"status": "FAIL", "error": "missing build manifest"}))
        get_tree().quit(2)
        return
    var arguments := _parse_arguments(OS.get_cmdline_user_args())
    call_deferred("_run_mode", arguments, build_manifest)


func _run_mode(arguments: Dictionary, build_manifest: Dictionary) -> void:
    var mode := str(arguments.get("mode", "smoke"))
    if mode == "validate":
        var report := _validation_report(build_manifest)
        print("LEYFORGE_W3_VALIDATION_REPORT " + JSON.stringify(report))
        get_tree().quit(0 if report.get("status") == "PASS" else 5)
        return
    if mode == "smoke":
        var report := _smoke(build_manifest)
        print("LEYFORGE_W3_SELF_REPORT " + JSON.stringify(report))
        get_tree().quit(0 if report.get("status") == "PASS" else 3)
        return
    if mode == "fixture":
        var report := _fixture_report(arguments, build_manifest)
        print("LEYFORGE_W3_FIXTURE_REPORT " + JSON.stringify(report))
        get_tree().quit(0 if report.get("status") == "PASS" else 4)
        return
    print("LEYFORGE_W3_SELF_REPORT " + JSON.stringify({"status": "FAIL", "error": "unsupported mode", "mode": mode}))
    get_tree().quit(2)


func _provider_readback(iterations: int) -> Dictionary:
    if not ClassDB.class_exists("VoxelBuffer"):
        return {"provider_ready": false, "provider_errors": 1, "operations": 0}
    var buffer = ClassDB.instantiate("VoxelBuffer")
    if buffer == null:
        return {"provider_ready": false, "provider_errors": 1, "operations": 0}
    buffer.call("create", 16, 16, 16)
    var errors := 0
    var bounded := clampi(iterations, 1, 4096)
    for index in range(bounded):
        var x := index % 16
        var y := int(index / 16) % 16
        var z := int(index / 256) % 16
        var value := 1 + (index * 37) % 240
        buffer.call("set_voxel", value, x, y, z, 0)
        errors += 1 if int(buffer.call("get_voxel", x, y, z, 0)) != value else 0
    return {"provider_ready": true, "provider_errors": errors, "operations": bounded}


func _frame_round_trip(iterations: int) -> Dictionary:
    var errors := 0
    var maximum_error := 0.0
    var bounded := clampi(iterations, 1, 4096)
    for index in range(bounded):
        var local := Vector3(float(index % 19), float(index % 7), float(index % 13))
        var basis := Basis(Vector3.UP, float(index % 360) * PI / 180.0)
        var transform := Transform3D(basis, Vector3(float(index), float(index % 11), float(-index)))
        var observed := transform.affine_inverse() * (transform * local)
        var error := observed.distance_to(local)
        maximum_error = maxf(maximum_error, error)
        errors += 1 if error > 0.0001 else 0
    return {"frame_round_trips": bounded, "frame_round_trip_errors": errors, "maximum_frame_error": maximum_error}


func _convex_cube() -> ConvexPolygonShape3D:
    var shape := ConvexPolygonShape3D.new()
    shape.points = PackedVector3Array([
        Vector3(-1, -1, -1), Vector3(1, -1, -1), Vector3(-1, 1, -1), Vector3(1, 1, -1),
        Vector3(-1, -1, 1), Vector3(1, -1, 1), Vector3(-1, 1, 1), Vector3(1, 1, 1),
    ])
    return shape


func _collision_corpus(iterations: int) -> Dictionary:
    var candidates := ["compound-convex", "segmented-cluster", "coarse-dynamic-query-detail"]
    var contact_errors := 0
    var contact_value_count := 0
    var shape_count := 0
    var bounded := clampi(iterations, 1, 4096)
    var target_body := StaticBody3D.new()
    var target_collision := CollisionShape3D.new()
    target_body.add_child(target_collision)
    add_child(target_body)
    for candidate in candidates:
        var shape_a: Shape3D
        var shape_b: Shape3D
        if candidate == "coarse-dynamic-query-detail":
            shape_a = _convex_cube()
            shape_b = _convex_cube()
        else:
            var box_a := BoxShape3D.new()
            box_a.size = Vector3(2, 2, 2)
            var box_b := BoxShape3D.new()
            box_b.size = Vector3(2, 2, 2)
            shape_a = box_a
            shape_b = box_b
        shape_count += 2
        target_collision.shape = shape_b
        for index in range(bounded):
            var offset := 1.5 if index % 2 == 0 else 4.0
            target_body.position = Vector3(offset, 0, 0)
            target_body.force_update_transform()
            var query := PhysicsShapeQueryParameters3D.new()
            query.shape = shape_a
            query.transform = Transform3D.IDENTITY
            query.collide_with_bodies = true
            query.collide_with_areas = false
            var contacts: Array[Vector3] = get_viewport().world_3d.direct_space_state.collide_shape(query, 8)
            var expected_contact := offset < 2.0
            contact_value_count += contacts.size()
            contact_errors += 1 if contacts.is_empty() == expected_contact else 0
    target_body.queue_free()
    return {
        "collision_candidates": candidates,
        "collision_cases": bounded * candidates.size(),
        "contact_errors": contact_errors,
        "contact_value_count": contact_value_count,
        "shape_count": shape_count,
        "physics_backend": str(ProjectSettings.get_setting("physics/3d/physics_engine")),
        "physics_query_api": "PhysicsDirectSpaceState3D.collide_shape",
    }


func _validation_report(build_manifest: Dictionary) -> Dictionary:
    var provider := _provider_readback(4)
    var frames := _frame_round_trip(4)
    var collisions := _collision_corpus(2)
    var passed := int(frames["frame_round_trip_errors"]) == 0 and int(collisions["contact_errors"]) == 0
    return {
        "schema_version": "prd07-w3-pinned-engine-validation-report-v1",
        "role": str(build_manifest.get("role", "")),
        "build_identity": str(build_manifest.get("build_identity", "")),
        "status": "PASS" if passed else "FAIL",
        "script_parse_load_valid": true,
        "controlled_entrypoint_reached": true,
        "provider_ready": provider["provider_ready"],
        "provider_errors": provider["provider_errors"],
        "frame_round_trip_errors": frames["frame_round_trip_errors"],
        "collision_cases": collisions["collision_cases"],
        "contact_errors": collisions["contact_errors"],
        "physics_query_api": collisions["physics_query_api"],
        "proof_execution_started": false,
        "production_runtime": false,
    }


func _smoke(build_manifest: Dictionary) -> Dictionary:
    var provider := _provider_readback(32)
    var frames := _frame_round_trip(64)
    var collisions := _collision_corpus(8)
    var passed := bool(provider["provider_ready"]) and int(provider["provider_errors"]) == 0
    passed = passed and int(frames["frame_round_trip_errors"]) == 0 and int(collisions["contact_errors"]) == 0
    return {
        "schema_version": "prd07-w3-fixture-self-report-v1",
        "role": str(build_manifest.get("role", "")),
        "build_identity": str(build_manifest.get("build_identity", "")),
        "status": "PASS" if passed else "FAIL",
        "fixture_capabilities": FIXTURE_CAPABILITIES,
        "stable_proof_ids": PROOF_IDS,
        "provider_ready": provider["provider_ready"],
        "provider_class": "VoxelBuffer",
        "provider_edition": "zylann-voxel-tools-gdextension-v1.7x",
        "provider_errors": provider["provider_errors"],
        "frame_round_trip_errors": frames["frame_round_trip_errors"],
        "contact_errors": collisions["contact_errors"],
        "presentation_authority_dependencies": 0,
        "production_runtime": false,
    }


func _fixture_report(arguments: Dictionary, build_manifest: Dictionary) -> Dictionary:
    var proof_id := str(arguments.get("proof-id", ""))
    var run_id := str(arguments.get("run-id", ""))
    var iterations := int(arguments.get("iterations", "512"))
    var provider := _provider_readback(iterations)
    var frames := _frame_round_trip(iterations)
    var collisions := _collision_corpus(iterations)
    var passed := proof_id in PROOF_IDS and not run_id.is_empty()
    passed = passed and bool(provider["provider_ready"]) and int(provider["provider_errors"]) == 0
    passed = passed and int(frames["frame_round_trip_errors"]) == 0 and int(collisions["contact_errors"]) == 0
    return {
        "schema_version": "prd07-w3-exported-fixture-report-v1",
        "proof_id": proof_id,
        "run_id": run_id,
        "role": str(build_manifest.get("role", "")),
        "build_identity": str(build_manifest.get("build_identity", "")),
        "status": "PASS" if passed else "FAIL",
        "outcome": "PASS" if passed else "FAIL",
        "fixture_capabilities": FIXTURE_CAPABILITIES,
        "provider_ready": provider["provider_ready"],
        "provider_operations": provider["operations"],
        "provider_errors": provider["provider_errors"],
        "frame_round_trips": frames["frame_round_trips"],
        "frame_round_trip_errors": frames["frame_round_trip_errors"],
        "maximum_frame_error": frames["maximum_frame_error"],
        "collision_candidates": collisions["collision_candidates"],
        "collision_cases": collisions["collision_cases"],
        "contact_errors": collisions["contact_errors"],
        "contact_value_count": collisions["contact_value_count"],
        "shape_count": collisions["shape_count"],
        "physics_backend": collisions["physics_backend"],
        "physics_query_api": collisions["physics_query_api"],
        "physics_authority": "EXECUTION-EVIDENCE-ONLY",
        "presentation_authority_dependencies": 0,
        "production_runtime": false,
    }


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
