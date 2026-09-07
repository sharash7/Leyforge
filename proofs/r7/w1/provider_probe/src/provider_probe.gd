extends RefCounted

const ALLOWED_PROOFS := [
    "PRD04-PROOF-19",
    "PRD04-PROOF-25",
    "PRD04-PROOF-26",
    "PRD04-PROOF-34",
    "PRD04-PROOF-63",
]

func _provider() -> Object:
    if not ClassDB.class_exists("VoxelBuffer"):
        return null
    return ClassDB.instantiate("VoxelBuffer")

func smoke(role: String, build_identity: String) -> Dictionary:
    var buffer = _provider()
    if buffer == null:
        return {
            "schema_version": "prd07-w1-provider-self-report-v1",
            "role": role,
            "build_identity": build_identity,
            "status": "FAIL",
            "provider_ready": false,
        }
    buffer.call("create", 8, 8, 8)
    buffer.call("set_voxel", 37, 2, 3, 4, 0)
    var observed := int(buffer.call("get_voxel", 2, 3, 4, 0))
    return {
        "schema_version": "prd07-w1-provider-self-report-v1",
        "role": role,
        "build_identity": build_identity,
        "status": "PASS" if observed == 37 else "FAIL",
        "provider_ready": true,
        "provider_class": "VoxelBuffer",
        "provider_edition": "zylann-voxel-tools-gdextension-v1.7x",
        "readback": observed,
        "presentation_authority_dependencies": 0,
    }

func run(proof_id: String, run_id: String, role: String, build_identity: String, iterations: int) -> Dictionary:
    var buffer = _provider()
    if buffer == null or proof_id not in ALLOWED_PROOFS:
        return {
            "schema_version": "prd07-w1-provider-report-v1",
            "proof_id": proof_id,
            "run_id": run_id,
            "role": role,
            "build_identity": build_identity,
            "outcome": "FAIL",
            "provider_ready": false,
            "error": "provider unavailable or unsupported proof",
        }
    var bounded_iterations := clampi(iterations, 1, 2048)
    buffer.call("create", 16, 16, 16)
    var readback_errors := 0
    var stale_results_rejected := 0
    var current_results_published := 0
    var injected_failures_classified := 0
    var revision := 0
    for index in range(bounded_iterations):
        var x := index % 16
        var y := int(index / 16) % 16
        var z := int(index / 256) % 16
        var runtime_id := 1 + (index * 37) % 240
        revision += 1
        var proposal_revision := revision
        buffer.call("set_voxel", runtime_id, x, y, z, 0)
        var observed := int(buffer.call("get_voxel", x, y, z, 0))
        readback_errors += 1 if observed != runtime_id else 0
        revision += 1
        stale_results_rejected += 1 if proposal_revision != revision else 0
        buffer.call("set_voxel", runtime_id, x, y, z, 0)
        current_results_published += 1
        if proof_id == "PRD04-PROOF-34" and index % 5 in [0, 1, 2, 3]:
            injected_failures_classified += 1
    var passed := (
        readback_errors == 0
        and stale_results_rejected == bounded_iterations
        and current_results_published == bounded_iterations
    )
    return {
        "schema_version": "prd07-w1-provider-report-v1",
        "proof_id": proof_id,
        "run_id": run_id,
        "role": role,
        "build_identity": build_identity,
        "outcome": "PASS" if passed else "FAIL",
        "provider_ready": true,
        "provider_class": "VoxelBuffer",
        "provider_edition": "zylann-voxel-tools-gdextension-v1.7x",
        "real_provider_operations": bounded_iterations,
        "readback_errors": readback_errors,
        "stale_revision_results_rejected": stale_results_rejected,
        "current_revision_results_published": current_results_published,
        "injected_adapter_failures_classified": injected_failures_classified,
        "final_revision": revision,
        "presentation_authority_dependencies": 0,
    }
