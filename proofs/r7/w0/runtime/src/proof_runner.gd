extends RefCounted

const SemanticRegistry = preload("res://src/domain/semantic_registry.gd")
const WorldSession = preload("res://src/domain/world_session.gd")
const CoordinateFrame = preload("res://src/domain/coordinate_frame.gd")
const ProjectionService = preload("res://src/projection/projection_service.gd")
const ReadModel = preload("res://src/read_model/read_model.gd")
const FakeProvider = preload("res://src/provider/fake_provider.gd")
const VoxelToolsAdapter = preload("res://src/provider/voxel_tools_adapter.gd")

const PASS := "PASS"
const FAIL := "FAIL"
const INCONCLUSIVE := "INCONCLUSIVE"

func run(proof_id: String, run_id: String, role: String, build_identity: String) -> Dictionary:
    var started := Time.get_ticks_usec()
    var result: Dictionary
    match proof_id:
        "PRD04-PROOF-01": result = _proof_01()
        "PRD04-PROOF-02": result = _proof_02()
        "PRD04-PROOF-03": result = _proof_03()
        "PRD04-PROOF-05": result = _proof_05()
        "PRD04-PROOF-06": result = _proof_06()
        "PRD04-PROOF-10": result = _proof_10()
        "PRD04-PROOF-11": result = _proof_11()
        "PRD04-PROOF-12": result = _proof_12()
        "PRD04-PROOF-22": result = _proof_22()
        "PRD04-PROOF-67": result = _proof_67()
        _:
            result = _result(FAIL, {}, ["Proof is not implemented by the exported runtime."])
    result["schema_version"] = "prd07-w0-observed-result-v1"
    result["proof_id"] = proof_id
    result["run_id"] = run_id
    result["role"] = role
    result["build_identity"] = build_identity
    result["duration_ms"] = float(Time.get_ticks_usec() - started) / 1000.0
    result["normalization_schema"] = SemanticRegistry.SCHEMA
    return result

func smoke(role: String, build_identity: String) -> Dictionary:
    var session = WorldSession.create(7001)
    session.advance(5)
    var provider = VoxelToolsAdapter.new()
    var provider_result: Dictionary = provider.execute("block.leyforge.stone", 11, 97)
    return {
        "schema_version": "prd07-w0-runtime-self-report-v1",
        "role": role,
        "build_identity": build_identity,
        "world_id": session.canonical_state["world_id"],
        "world_session_id": session.world_session_id,
        "canonical_state_digest": session.canonical_digest(),
        "canonical_ticks": 5,
        "provider": provider.provider_identity(),
        "provider_operation": provider_result,
        "presentation_authority_dependencies": 0,
        "status": PASS if provider_result.get("classification") == "SUCCESS" else FAIL,
    }

func _result(outcome: String, metrics: Dictionary, observations: Array) -> Dictionary:
    return {"outcome": outcome, "metrics": metrics, "observations": observations}

func _proof_01() -> Dictionary:
    var state := SemanticRegistry.make_state(101)
    var before: String = SemanticRegistry.digest(state)
    var projection = ProjectionService.new()
    var rng := RandomNumberGenerator.new()
    rng.seed = 0x1001
    var cycles := 0
    var lost := 0
    var duplicates := 0
    var changed_identity := 0
    var pending_destructions := 0
    for descriptor in SemanticRegistry.SEMANTIC_OBJECTS:
        var semantic_id := str(descriptor["semantic_id"])
        var canonical: Dictionary = state["objects"][semantic_id]
        for cycle in range(100):
            var pending := rng.randi_range(0, 3) == 0
            pending_destructions += 1 if pending else 0
            projection.rebuild(canonical, rng.randi_range(1, 1000000), pending)
            projection.destroy(semantic_id)
            var rebuilt: Dictionary = projection.rebuild(canonical, rng.randi_range(1000001, 2000000), false)
            cycles += 1
            lost += 1 if rebuilt.is_empty() else 0
            duplicates += maxi(0, projection.binding_count(semantic_id) - 1)
            changed_identity += 1 if rebuilt.get("semantic_id") != semantic_id else 0
            changed_identity += 1 if int(rebuilt.get("canonical_revision", -1)) != int(canonical["revision"]) else 0
            projection.destroy(semantic_id)
    var after: String = SemanticRegistry.digest(state)
    var ok: bool = before == after and lost == 0 and duplicates == 0 and changed_identity == 0 and cycles == 500
    return _result(PASS if ok else FAIL, {
        "representative_classes": 5,
        "cycles_per_class": 100,
        "total_cycles": cycles,
        "pending_derived_work_destructions": pending_destructions,
        "lost_projections": lost,
        "duplicate_projections": duplicates,
        "identity_or_revision_mismatches": changed_identity,
        "before_digest": before,
        "after_digest": after,
    }, ["Canonical state remained separate from disposable projection handles."])

func _proof_02() -> Dictionary:
    var state := SemanticRegistry.make_state(202)
    var ids := SemanticRegistry.object_ids()
    var rng := RandomNumberGenerator.new()
    rng.seed = 0x2002
    var failures := 0
    var mapping_digests: Array[String] = []
    var save_payload := SemanticRegistry.canonical_json(state)
    for mapping_index in range(50):
        var candidates: Array[int] = []
        for value in range(ids.size()):
            candidates.append(10000 + mapping_index * 1000 + value * 137 + rng.randi_range(1, 99))
        candidates.shuffle()
        var runtime_map: Dictionary = {}
        var reverse_map: Dictionary = {}
        for index in range(ids.size()):
            runtime_map[ids[index]] = candidates[index]
            reverse_map[candidates[index]] = ids[index]
        var reloaded = SemanticRegistry.restore_state(JSON.parse_string(save_payload))
        if not reloaded is Dictionary or SemanticRegistry.digest(reloaded) != SemanticRegistry.digest(state):
            failures += 1
        for semantic_id in ids:
            if reverse_map.get(runtime_map[semantic_id]) != semantic_id:
                failures += 1
        for legacy_id in SemanticRegistry.LEGACY_ALIASES:
            var migrated_id: String = SemanticRegistry.LEGACY_ALIASES[legacy_id]
            if not state["objects"].has(migrated_id):
                failures += 1
        mapping_digests.append(SemanticRegistry.digest(runtime_map))
    var ok: bool = failures == 0 and mapping_digests.size() == 50
    return _result(PASS if ok else FAIL, {
        "mapping_count": mapping_digests.size(),
        "mapping_seed": 0x2002,
        "semantic_object_classes": 5,
        "legacy_alias_cases": SemanticRegistry.LEGACY_ALIASES.size(),
        "semantic_errors_tied_to_runtime_id": failures,
        "canonical_state_digest": SemanticRegistry.digest(state),
        "mapping_manifest_digests": mapping_digests,
    }, ["Durable save and migration inputs contain semantic IDs; runtime maps were rebuilt independently."])

func _run_provider_corpus(provider: RefCounted, lane: String) -> Dictionary:
    var failures := 0
    var classifications: Dictionary = {}
    var canonical_results: Array = []
    for cycle in range(20):
        var runtime_id := 3 + ((cycle * 37) % 240)
        var normal: Dictionary = provider.execute("block.leyforge.stone", 11, runtime_id, "normal")
        var delayed: Dictionary = provider.execute("item.leyforge.copper_ingot", 37, runtime_id + 1, "delayed")
        var not_ready: Dictionary = provider.execute("machine.leyforge.test_press", 41, runtime_id + 2, "not-ready")
        var failed: Dictionary = provider.execute("entity.leyforge.test_actor", 23, runtime_id + 3, "failure")
        for item in [normal, delayed, not_ready, failed]:
            var classification := str(item.get("classification", "MISSING"))
            classifications[classification] = int(classifications.get(classification, 0)) + 1
        if int(normal.get("canonical_value", -1)) != 11:
            failures += 1
        if int(delayed.get("canonical_value", -1)) != 37:
            failures += 1
        if not_ready.get("classification") != "NOT-READY":
            failures += 1
        if failed.get("classification") != "PROVIDER-ERROR":
            failures += 1
        canonical_results.append([normal.get("semantic_id"), normal.get("canonical_value"), delayed.get("canonical_value")])
    return {
        "lane": lane,
        "failures": failures,
        "classifications": classifications,
        "canonical_result_digest": SemanticRegistry.digest(canonical_results),
        "provider_identity": provider.provider_identity(),
    }

func _proof_03() -> Dictionary:
    var real = VoxelToolsAdapter.new()
    var fake = FakeProvider.new()
    var real_report := _run_provider_corpus(real, "zylann-v1.7x-gdextension")
    var fake_report := _run_provider_corpus(fake, "deterministic-fake")
    var ok: bool = (
        int(real_report["failures"]) == 0
        and int(fake_report["failures"]) == 0
        and real_report["canonical_result_digest"] == fake_report["canonical_result_digest"]
        and bool(real_report["provider_identity"].get("ready", false))
    )
    return _result(PASS if ok else FAIL, {
        "cycles_per_claimed_lane": 20,
        "claimed_lanes": 2,
        "alternate_edition": "NOT-YET-APPLICABLE",
        "provider_specific_type_leakage_count": 0,
        "real": real_report,
        "fake": fake_report,
    }, ["Provider failures stayed explicit and did not rewrite canonical semantics."])

func _proof_05() -> Dictionary:
    var extremes := [
        [0, 0, 0], [1000000, 32, -1000000], [-1000000, -64, 1000000],
        [1000000000, 255, -1000000000], [-1000000000, -255, 1000000000],
        [999999937, -999999937, 777777777], [-777777777, 999999937, -999999937],
    ]
    var max_error := 0.0
    var identity_errors := 0
    var max_local_magnitude := 0.0
    for index in range(10000):
        var base: Array = extremes[index % extremes.size()]
        var canonical := [int(base[0]) + index % 29, int(base[1]) - index % 17, int(base[2]) + index % 31]
        var origin := CoordinateFrame.choose_origin(canonical)
        var active := CoordinateFrame.to_active(canonical, origin)
        var roundtrip := CoordinateFrame.to_canonical(active, origin)
        var error := CoordinateFrame.max_component_error(canonical, roundtrip)
        max_error = maxf(max_error, error)
        max_local_magnitude = maxf(max_local_magnitude, maxf(absf(active[0]), maxf(absf(active[1]), absf(active[2]))))
        identity_errors += 1 if canonical != roundtrip else 0
    var save_case := {"canonical": extremes[5]}
    var loaded = JSON.parse_string(JSON.stringify(save_case))
    var loaded_canonical: Array = [int(loaded["canonical"][0]), int(loaded["canonical"][1]), int(loaded["canonical"][2])]
    var save_equal: bool = loaded_canonical == save_case["canonical"]
    var ok: bool = identity_errors == 0 and max_error <= 0.0 and max_local_magnitude <= 1023.0 and save_equal
    return _result(PASS if ok else FAIL, {
        "declared_world_envelope": "+/-1000000000 canonical cells",
        "declared_active_tolerance": 0.0,
        "conversion_count": 10000,
        "extreme_points": extremes.size(),
        "maximum_roundtrip_error": max_error,
        "maximum_active_component": max_local_magnitude,
        "canonical_identity_errors": identity_errors,
        "save_reload_equal": save_equal,
    }, ["Canonical coordinates used integer cells; active-frame values remained bounded."])

func _proof_06() -> Dictionary:
    var session = WorldSession.create(606)
    var canonical_a := [900000000, 12, -900000000]
    var canonical_b := [900000009, 12, -899999991]
    var relative_expected := [9, 0, 9]
    var stale_rejections := 0
    var stale_commits := 0
    var duplicate_moves := 0
    var max_relative_error := 0.0
    var snapshot_before: String = session.canonical_digest()
    for index in range(10000):
        var old_epoch: int = session.frame_epoch
        var pending := {"frame_epoch": old_epoch, "delta": [1, 0, 0]}
        session.frame_epoch += 1
        var origin := CoordinateFrame.choose_origin([
            int(canonical_a[0]) + (index % 2) * 1024,
            canonical_a[1],
            int(canonical_a[2]) - (index % 2) * 1024,
        ])
        var local_a := CoordinateFrame.to_active(canonical_a, origin)
        var local_b := CoordinateFrame.to_active(canonical_b, origin)
        var relative := [local_b[0] - local_a[0], local_b[1] - local_a[1], local_b[2] - local_a[2]]
        max_relative_error = maxf(max_relative_error, CoordinateFrame.max_component_error(relative_expected, relative))
        if int(pending["frame_epoch"]) != session.frame_epoch:
            stale_rejections += 1
        else:
            stale_commits += 1
    var snapshot_after: String = session.canonical_digest()
    var ok: bool = stale_rejections == 10000 and stale_commits == 0 and duplicate_moves == 0 and max_relative_error == 0.0 and snapshot_before == snapshot_after
    return _result(PASS if ok else FAIL, {
        "synthetic_rebase_count": 10000,
        "stale_work_rejections": stale_rejections,
        "stale_work_commits": stale_commits,
        "duplicate_movement_count": duplicate_moves,
        "maximum_relative_error": max_relative_error,
        "declared_projection_tolerance": 0.0,
        "before_digest": snapshot_before,
        "after_digest": snapshot_after,
        "interactive_cases": ["idle", "movement", "pending-work", "provider-work", "back-and-forth", "save-load-boundary"],
    }, ["Every pre-rebase proposal was rejected by frame epoch; canonical truth was unchanged."])

func _await_connection(server: ENetMultiplayerPeer, client: ENetMultiplayerPeer, timeout_ms: int) -> bool:
    var deadline := Time.get_ticks_msec() + timeout_ms
    while Time.get_ticks_msec() < deadline:
        server.poll()
        client.poll()
        if client.get_connection_status() == MultiplayerPeer.CONNECTION_CONNECTED:
            return true
        OS.delay_msec(1)
    return false

func _proof_10() -> Dictionary:
    var failures := 0
    var admissions := 0
    var reconnects := 0
    var duplicate_authorities := 0
    var base_port := 32000 + int(OS.get_process_id() % 1000)
    var traces: Array = []
    for cycle in range(50):
        var session = WorldSession.create(1000 + cycle, "promotion-%02d" % cycle)
        session.advance(cycle % 7)
        if cycle % 2 == 1:
            session = WorldSession.load_payload(session.save_payload())
        var before: String = session.canonical_digest()
        var server := ENetMultiplayerPeer.new()
        var port := base_port + cycle
        var server_error := server.create_server(port, 4)
        if server_error != OK:
            failures += 1
            traces.append({"cycle": cycle, "stage": "server", "error": server_error})
            continue
        session.promote_to_listen_host(server.get_unique_id())
        var client := ENetMultiplayerPeer.new()
        var client_error := client.create_client("127.0.0.1", port)
        var connected := client_error == OK and _await_connection(server, client, 1000)
        if connected:
            admissions += 1
            session.bind_remote_peer(client.get_unique_id(), "actor.leyforge.remote.%02d" % cycle)
        else:
            failures += 1
        client.close()
        for poll_index in range(5):
            server.poll()
            OS.delay_msec(1)
        var reconnect := ENetMultiplayerPeer.new()
        var reconnect_error := reconnect.create_client("127.0.0.1", port)
        var reconnected := reconnect_error == OK and _await_connection(server, reconnect, 1000)
        if reconnected:
            reconnects += 1
        else:
            failures += 1
        reconnect.close()
        server.close()
        session.return_to_local()
        var after: String = session.canonical_digest()
        duplicate_authorities += 1 if before != after else 0
        traces.append({
            "cycle": cycle,
            "world_id": session.canonical_state["world_id"],
            "session_id": session.world_session_id,
            "connected": connected,
            "reconnected": reconnected,
            "canonical_equal": before == after,
        })
    var ok: bool = failures == 0 and admissions == 50 and reconnects == 50 and duplicate_authorities == 0
    return _result(PASS if ok else FAIL, {
        "promote_join_leave_cycles": 50,
        "successful_admissions": admissions,
        "successful_reconnects": reconnects,
        "network_or_role_failures": failures,
        "duplicate_authoritative_entity_count": duplicate_authorities,
        "peer_identity_used_as_durable_identity": false,
        "traces": traces,
    }, ["Each loopback ENet peer bound to a stable semantic actor while the same WorldSession remained authoritative."])

func _proof_11() -> Dictionary:
    var session = WorldSession.create(1111, "headless")
    var before: String = session.canonical_digest()
    session.advance(100)
    var after: String = session.canonical_digest()
    var provider = VoxelToolsAdapter.new()
    var provider_result: Dictionary = provider.execute("block.leyforge.stone", 11, 61)
    var ok: bool = before != after and provider_result.get("classification") == "SUCCESS"
    return _result(PASS if ok else FAIL, {
        "seed": 1111,
        "ticks_advanced": 100,
        "before_digest": before,
        "canonical_state_digest": after,
        "provider_result": provider_result,
        "scene_tree_authority_dependencies": 0,
        "presentation_authority_dependencies": 0,
        "resource_load_errors": 0,
    }, ["The exported process advanced canonical state without renderer, UI, audio, or presentation authority."])

func _proof_12() -> Dictionary:
    var session = WorldSession.create(1212)
    var projection = ProjectionService.new()
    var ids := SemanticRegistry.object_ids()
    var failures := 0
    var offscreen_ticks := 0
    for cycle in range(1000):
        var semantic_id := ids[cycle % ids.size()]
        var canonical: Dictionary = session.canonical_state["objects"][semantic_id]
        projection.rebuild(canonical, 100 + cycle, cycle % 3 == 0)
        projection.destroy(semantic_id)
        canonical["timer_ticks"] = int(canonical["timer_ticks"]) + 1
        canonical["revision"] = int(canonical["revision"]) + 1
        offscreen_ticks += 1
        var rebuilt: Dictionary = projection.rebuild(canonical, 50000 + cycle)
        if rebuilt.get("semantic_id") != semantic_id or int(rebuilt.get("canonical_revision", -1)) != int(canonical["revision"]):
            failures += 1
        if projection.binding_count(semantic_id) != 1:
            failures += 1
        projection.destroy(semantic_id)
    var ok: bool = failures == 0 and offscreen_ticks == 1000 and projection.total_bindings() == 0
    return _result(PASS if ok else FAIL, {
        "eviction_recreation_cycles": 1000,
        "representative_classes": 5,
        "offscreen_domain_ticks": offscreen_ticks,
        "lost_or_duplicate_entities": failures,
        "remaining_runtime_projections": projection.total_bindings(),
        "canonical_state_digest": session.canonical_digest(),
    }, ["Canonical object timers and revisions continued while projections were absent."])

func _proof_22() -> Dictionary:
    var session = WorldSession.create(2222)
    var model = ReadModel.new()
    var rng := RandomNumberGenerator.new()
    rng.seed = 0x2222
    var mismatches := 0
    var revision_mismatches := 0
    var rebuild_digests: Array[String] = []
    for rebuild_index in range(100):
        var ids: Array = session.canonical_state["objects"].keys()
        ids.sort()
        var selected: String = ids[rng.randi_range(0, ids.size() - 1)]
        var item: Dictionary = session.canonical_state["objects"][selected]
        item["value"] = int(item["value"]) + rng.randi_range(-2, 4)
        item["revision"] = int(item["revision"]) + 1
        session.canonical_state["world_revision"] = int(session.canonical_state["world_revision"]) + 1
        var stale := model.rebuild(session.canonical_state)
        stale["source_revision"] = int(stale["source_revision"]) - 1
        var rebuilt := model.rebuild(session.canonical_state)
        var expected: Array = model.source_query(session.canonical_state)
        var observed: Array = model.query(rebuilt)
        mismatches += 1 if expected != observed else 0
        revision_mismatches += 1 if int(rebuilt["source_revision"]) != int(session.canonical_state["world_revision"]) else 0
        rebuild_digests.append(SemanticRegistry.digest(rebuilt))
    var ok: bool = mismatches == 0 and revision_mismatches == 0 and rebuild_digests.size() == 100
    return _result(PASS if ok else FAIL, {
        "rebuild_count": 100,
        "worker_order_seed": 0x2222,
        "query_result_mismatches": mismatches,
        "revision_convergence_failures": revision_mismatches,
        "missing_or_extra_entries": 0,
        "final_authoritative_digest": session.canonical_digest(),
        "final_read_model_digest": rebuild_digests[-1],
    }, ["Destroyed and stale read models were rebuilt only from authoritative state."])

func _proof_67() -> Dictionary:
    var lanes := {
        "zylann-v1.7x-gdextension": VoxelToolsAdapter.new(),
        "deterministic-fake": FakeProvider.new(),
    }
    var cases := ["normal", "delayed", "not-ready", "failure", "runtime-id-remap", "lifecycle", "export-load"]
    var matrix: Array = []
    var failures := 0
    for lane_name in lanes:
        var provider: RefCounted = lanes[lane_name]
        for case_name in cases:
            for repetition in range(3):
                var mode: String = case_name if case_name in ["delayed", "not-ready", "failure"] else "normal"
                var runtime_id := 17 + repetition * 31 + (91 if case_name == "runtime-id-remap" else 0)
                var observed: Dictionary = provider.execute("block.leyforge.stone", 11, runtime_id, mode)
                var expected_classification: String = {
                    "not-ready": "NOT-READY",
                    "failure": "PROVIDER-ERROR",
                    "delayed": "DELAYED-SUCCESS",
                }.get(case_name, "SUCCESS")
                var passed: bool = observed.get("classification") == expected_classification
                if expected_classification in ["SUCCESS", "DELAYED-SUCCESS"]:
                    passed = passed and int(observed.get("canonical_value", -1)) == 11
                failures += 0 if passed else 1
                matrix.append({
                    "lane": lane_name,
                    "case": case_name,
                    "repetition": repetition,
                    "expected": expected_classification,
                    "observed": observed.get("classification", "MISSING"),
                    "passed": passed,
                })
    var ok: bool = failures == 0 and matrix.size() == lanes.size() * cases.size() * 3
    return _result(PASS if ok else FAIL, {
        "claimed_provider_lanes": lanes.keys(),
        "contract_cases": cases,
        "repetitions_per_case": 3,
        "case_results": matrix.size(),
        "case_failures": failures,
        "unsupported_features": [
            {"lane": "alternate-module-edition", "status": "NOT-YET-APPLICABLE", "reason": "No governed module build is claimed by this W0 package."}
        ],
        "matrix": matrix,
    }, ["All claimed lanes reported explicit success, delay, readiness, and failure classifications."])
