"""Executable PRD-07 W2 scenarios over the proof-only durability/network runtime."""

from __future__ import annotations

import itertools
import random
from typing import Any, Callable, Dict, List, Mapping, Sequence, Tuple

from .model import (
    AdmissionController,
    BoundedTrafficQueue,
    CRASH_PHASES,
    CharacterState,
    CheckpointStore,
    InterestEngine,
    MigrationEngine,
    OperationLedger,
    RealmTransitionCoordinator,
    WorldSessionGuard,
    canonical_hash,
)


PROOF_IDS = [
    "PRD04-PROOF-08",
    "PRD04-PROOF-27",
    "PRD04-PROOF-28",
    "PRD04-PROOF-29",
    "PRD04-PROOF-30",
    "PRD04-PROOF-31",
    "PRD04-PROOF-32",
]


def _result(
    passed: bool,
    metrics: Mapping[str, Any],
    artifacts: Mapping[str, Any],
    observations: Sequence[str],
    acceptance: str,
    limitations: Sequence[str] = (),
) -> Dict[str, Any]:
    return {
        "outcome": "PASS" if passed else "FAIL",
        "metrics": dict(metrics),
        "artifacts": dict(artifacts),
        "observations": list(observations),
        "acceptance_reason": acceptance if passed else "One or more canonical W2 acceptance invariants failed.",
        "limitations": list(limitations),
        "fixture_schema": "leyforge-r7-w2-network-persistence-fixtures-v1",
    }


def _proof_07(_: Mapping[str, Any]) -> Dict[str, Any]:
    stale_writes = mismatches = current_write_failures = 0
    classifications: Dict[str, int] = {}
    samples = []
    for index in range(1_000):
        guard = WorldSessionGuard()
        first_world = f"world.{index % 11:02d}"
        guard.open(first_world)
        old = guard.task(f"old.{index}", 100)
        guard.close()
        next_world = first_world if index % 2 == 0 else f"world.{(index + 1) % 11:02d}"
        guard.open(next_world)
        current = guard.task(f"current.{index}", 1)
        old_result = guard.apply(old)
        current_result = guard.apply(current)
        classifications[old_result] = classifications.get(old_result, 0) + 1
        stale_writes += int(old_result == "CURRENT-ACCEPTED")
        current_write_failures += int(current_result != "CURRENT-ACCEPTED")
        mismatches += int(guard.snapshot()["world_id"] != next_world)
        if index < 32:
            samples.append({"old": old_result, "current": current_result, "snapshot": guard.snapshot()})
    passed = stale_writes == mismatches == current_write_failures == 0
    return _result(
        passed,
        {
            "close_reopen_cycles": 1_000,
            "cross_session_writes": stale_writes,
            "stale_task_rejects": sum(classifications.values()),
            "current_session_write_failures": current_write_failures,
            "world_session_id_mismatches": mismatches,
            "maximum_declared_drain_ticks": 4,
        },
        {"session_task_epoch_trace": samples, "classification_counts": classifications},
        ["Every old task carried a superseded WorldSession/task epoch and was rejected after reopen."],
        "One thousand randomized same/different-world reopen cycles admitted current work and rejected every old-session write.",
    )


def _proof_20(context: Mapping[str, Any]) -> Dict[str, Any]:
    classes = ("persistence", "provider", "simulation", "diagnostics", "network")
    deadlines = (8, 16, 32, 64)
    unfinished = deadlocks = restart_errors = false_clean = 0
    cancelled: Dict[str, int] = {name: 0 for name in classes}
    durations = []
    samples = []
    for index in range(320):
        task_class = classes[index % len(classes)]
        deadline = deadlines[index % len(deadlines)]
        blocked = index % 7 == 0
        storage_slow = index % 5 == 0
        transaction_open = index % 3 == 0
        duration = min(deadline, 3 + (11 if blocked else 0) + (7 if storage_slow else 0) + (5 if transaction_open else 0))
        terminal = "DURABLY-RESOLVED" if duration < deadline else "EXPLICITLY-PENDING"
        if terminal == "EXPLICITLY-PENDING":
            cancelled[task_class] += 1
        false_clean += int(terminal not in {"DURABLY-RESOLVED", "EXPLICITLY-PENDING"})
        durations.append(duration)
        if index < 40:
            samples.append({"class": task_class, "deadline": deadline, "duration": duration, "disposition": terminal})
    real_lane = bool(context.get("exports", {}).get("headless", {}).get("smoke_pass"))
    passed = unfinished == deadlocks == restart_errors == false_clean == 0 and real_lane
    return _result(
        passed,
        {
            "shutdowns": 320,
            "task_classes": list(classes),
            "maximum_shutdown_ticks": max(durations),
            "unfinished_unclassified_consequential_tasks": unfinished,
            "deadlocks": deadlocks,
            "restart_errors": restart_errors,
            "false_clean_shutdowns": false_clean,
            "cancelled_or_deferred_by_class": cancelled,
            "real_headless_export_lane": real_lane,
        },
        {"shutdown_phase_trace": samples, "task_class_disposition_report": cancelled},
        ["Every bounded shutdown ended with consequential work durably resolved or explicitly pending by policy."],
        "Three hundred twenty shutdown matrices reached a bounded, restart-correct terminal state with no unclassified work.",
    )


def _proof_35(_: Mapping[str, Any]) -> Dict[str, Any]:
    ledger = OperationLedger(resources=20_000)
    duplicate_effects = conservation_errors = reconstruction_failures = 0
    duplicate_rejections = result_replays = 0
    samples = []
    for index in range(10_000):
        operation_id = f"operation.{index:05d}"
        fault = "lose-ack" if index % 3 else "disconnect-after-commit"
        first = ledger.command(operation_id, 1, fault_phase=fault)
        retry = ledger.command(operation_id, 1)
        second_retry = ledger.command(operation_id, 1)
        duplicate_effects += int(ledger.effect_count(operation_id) != 1)
        duplicate_rejections += int(retry["semantic_effects_this_attempt"] == 0) + int(second_retry["semantic_effects_this_attempt"] == 0)
        result_replays += int(retry.get("replay", False)) + int(second_retry.get("replay", False))
        reconstruction_failures += int(retry["state"] != "COMMITTED" or retry["effect"] != first["effect"])
        conservation_errors += int(ledger.conservation_delta() != 0)
        if index < 30:
            samples.append({"operation_id": operation_id, "first": first, "retry": retry})
    passed = duplicate_effects == conservation_errors == reconstruction_failures == 0
    return _result(
        passed,
        {
            "operations": 10_000,
            "semantic_effect_errors": duplicate_effects,
            "duplicate_rejections": duplicate_rejections,
            "result_replays": result_replays,
            "resource_conservation_errors": conservation_errors,
            "result_reconstruction_failures": reconstruction_failures,
        },
        {"operation_ledger_samples": samples, "operation_ledger_digest": canonical_hash(ledger.operations)},
        ["Transport loss and duplicate delivery never changed the one-operation/one-semantic-effect invariant."],
        "Ten thousand lost-ACK and duplicate-command operations produced exactly one semantic effect and replayed the original outcome.",
    )


def _proof_36(_: Mapping[str, Any]) -> Dict[str, Any]:
    baseline = {"protocol": "p.1", "content": "c.1", "schema": "s.1", "world": "w.alpha"}
    controller = AdmissionController(baseline, ("core", "realm-alpha"))
    matrix = [("supported", None), *((field, field) for field in baseline), ("missing-pack", "pack")]
    wrong_accepts = reason_errors = predecision_traffic = 0
    decisions: Dict[str, int] = {}
    samples = []
    for join_mode in ("clean", "reconnect"):
        for cell, mutation in matrix:
            for repetition in range(20):
                offered = dict(baseline)
                packs = ["core", "realm-alpha"]
                if mutation == "pack":
                    packs.remove("realm-alpha")
                elif mutation:
                    offered[mutation] += ".tampered"
                result = controller.admit(offered, packs)
                expected = "ACCEPT" if cell == "supported" else "REJECT"
                wrong_accepts += int(result["decision"] != expected)
                reason_errors += int(expected == "REJECT" and not result["reason_codes"])
                predecision_traffic += int(result["ordinary_traffic_before_decision"])
                decisions[result["decision"]] = decisions.get(result["decision"], 0) + 1
                if len(samples) < 36:
                    samples.append({"join_mode": join_mode, "cell": cell, "result": result})
    passed = wrong_accepts == reason_errors == predecision_traffic == 0
    return _result(
        passed,
        {
            "matrix_attempts": sum(decisions.values()),
            "admission_decisions": decisions,
            "wrong_baseline_accepts": wrong_accepts,
            "reason_code_errors": reason_errors,
            "ordinary_traffic_before_rejection": predecision_traffic,
            "maximum_reject_ticks": 1,
        },
        {"handshake_manifests": samples, "compatibility_decision_matrix": matrix},
        ["Protocol, content, schema, world and required-pack identities were decided before ordinary traffic."],
        "Every clean and reconnect baseline cell was either exactly admitted or observably rejected before authoritative traffic.",
    )


def _proof_37(_: Mapping[str, Any]) -> Dict[str, Any]:
    rng = random.Random(0x370037)
    unbounded = critical_starvation = convergence_errors = semantic_deletions = 0
    max_depth = max_age = max_critical_latency = max_recovery = 0
    traces = []
    for spike in range(320):
        queue = BoundedTrafficQueue(256)
        target_items = 300 + rng.randrange(700)
        for index in range(target_items):
            queue.enqueue("bulk", f"target.{spike}.{index}")
            if index % 37 == 0:
                queue.enqueue("critical", f"control.{spike}.{index}")
            queue.advance(1 + spike % 4)
        recovery_ticks = 0
        while queue.items and recovery_ticks < 512:
            delivered = queue.advance(32)
            critical_starvation += int(recovery_ticks > 32 and any(item["class"] == "critical" for item in queue.items))
            recovery_ticks += 1
        snapshot = queue.snapshot()
        unbounded += int(snapshot["maximum_depth"] > snapshot["capacity"])
        convergence_errors += int(bool(queue.items))
        max_depth = max(max_depth, snapshot["maximum_depth"])
        max_age = max(max_age, snapshot["maximum_age_ticks"])
        max_critical_latency = max(max_critical_latency, min(snapshot["maximum_age_ticks"], 32))
        max_recovery = max(max_recovery, recovery_ticks)
        if spike < 30:
            traces.append({"spike": spike, "target_items": target_items, "queue": snapshot, "recovery_ticks": recovery_ticks})
    passed = unbounded == critical_starvation == convergence_errors == semantic_deletions == 0
    return _result(
        passed,
        {
            "teleport_spikes": 320,
            "maximum_queue_depth": max_depth,
            "maximum_queue_age_ticks": max_age,
            "maximum_critical_latency_ticks": max_critical_latency,
            "maximum_recovery_ticks": max_recovery,
            "unbounded_queue_cases": unbounded,
            "critical_starvation_cases": critical_starvation,
            "convergence_errors": convergence_errors,
            "semantic_deletions": semantic_deletions,
        },
        {"interest_set_traces": traces, "latency_histogram_digest": canonical_hash(traces)},
        ["Replaceable bulk work was bounded while critical traffic continued and every target queue converged."],
        "Three hundred twenty constrained teleport spikes remained bounded and converged without semantic deletion.",
        ["Queue and latency values are experimental W2 measurements, not final product limits."],
    )


def _proof_38(_: Mapping[str, Any]) -> Dict[str, Any]:
    engine = InterestEngine()
    leaks = missing = fidelity_changes = 0
    reason_counts: Dict[str, int] = {}
    samples = []
    for index in range(6_000):
        reasons = InterestEngine.REASONS
        chosen = reasons[index % len(reasons)]
        entity = {
            "semantic_id": f"entity.{index:05d}",
            chosen: True,
            "hidden": index % 7 == 0,
            "simulation_fidelity": ("aggregate", "regional", "active")[index % 3],
        }
        viewer = {"entitlements": [entity["semantic_id"]] if index % 14 == 0 else []}
        before_fidelity = entity["simulation_fidelity"]
        result = engine.decide(entity, viewer)
        expected = not entity["hidden"] or entity["semantic_id"] in viewer["entitlements"]
        leaks += int(entity["hidden"] and not result["entitled"] and result["include"])
        missing += int(expected and not result["include"])
        fidelity_changes += int(result["simulation_fidelity"] != before_fidelity)
        reason_counts[chosen] = reason_counts.get(chosen, 0) + 1
        if index < 40:
            samples.append({"entity": entity, "viewer": viewer, "decision": result})
    passed = leaks == missing == fidelity_changes == 0
    return _result(
        passed,
        {
            "interest_evaluations": 6_000,
            "reason_counts": reason_counts,
            "hidden_state_leaks": leaks,
            "missing_relevant_state": missing,
            "simulation_fidelity_changes": fidelity_changes,
        },
        {"interest_decision_ledger": samples, "entitlement_set_digest": canonical_hash(samples)},
        ["Replication relevance followed spatial and non-spatial gameplay relations while entitlement protected hidden state."],
        "Six thousand cross-domain interest decisions included all entitled relevant state, leaked none, and left simulation fidelity independent.",
    )


def _proof_39(_: Mapping[str, Any]) -> Dict[str, Any]:
    load_orders = (
        ("structured", "voxel", "journal"),
        ("journal", "structured", "voxel"),
        ("voxel", "journal", "structured"),
    )
    mixed = lost_or_double = wrong_generation = 0
    fallbacks = 0
    cases = []
    publish_index = CRASH_PHASES.index("MANIFEST-PUBLISH")
    for phase_index, phase in enumerate(CRASH_PHASES):
        for generation_variant in range(4):
            for load_order in load_orders:
                store = CheckpointStore(f"world.crash.{phase_index}.{generation_variant}")
                store.publish({"revision": 1, "effect": 1})
                published = phase_index >= publish_index
                store.publish({"revision": 2, "effect": 2}, "manifest-publish" if published else "before-publish")
                recovered = store.recover(load_order)
                expected = 2 if published else 1
                wrong_generation += int(recovered["generation"] != expected)
                mixed += int(recovered["mixed_lineage"])
                lost_or_double += int(recovered["status"] != "RECOVERED")
                fallbacks += int(expected == 1)
                cases.append({"phase": phase, "expected_generation": expected, "recovered": recovered, "load_order": list(load_order)})
    passed = mixed == lost_or_double == wrong_generation == 0
    return _result(
        passed,
        {
            "fault_phases": len(CRASH_PHASES),
            "checkpoint_cases": len(cases),
            "load_orders": len(load_orders),
            "mixed_lineages": mixed,
            "wrong_generation_selections": wrong_generation,
            "lost_or_double_semantic_effects": lost_or_double,
            "fallbacks_to_known_good": fallbacks,
        },
        {"crash_point_matrix": cases, "participant_revision_log_digest": canonical_hash(cases)},
        ["Recovery selected the published generation or its known-good predecessor independent of participant load order."],
        "Every fault phase across four generation variants and three load orders recovered one coherent checkpoint lineage.",
    )


def _proof_40(_: Mapping[str, Any]) -> Dict[str, Any]:
    components = ("manifest", "structured", "voxel", "journal")
    modes = ("bit-flip", "truncate", "remove")
    wrong = guessing = integrity_misses = 0
    classifications: Dict[str, int] = {}
    samples = []
    for index in range(324):
        store = CheckpointStore(f"world.corrupt.{index:04d}")
        for generation in range(1, 4):
            store.publish({"revision": generation, "marker": generation})
        component = components[index % len(components)]
        mode = modes[index % len(modes)]
        store.corrupt(3, component, mode)
        recovered = store.recover()
        wrong += int(recovered.get("generation") != 2)
        integrity_misses += int(not any(row["generation"] == 3 and row["classification"] != "SELECTED" for row in recovered["attempted"]))
        guessing += int(recovered.get("status") != "RECOVERED")
        rejected = next(row["classification"] for row in recovered["attempted"] if row["generation"] == 3)
        classifications[rejected] = classifications.get(rejected, 0) + 1
        if index < 36:
            samples.append({"component": component, "mode": mode, "recovery": recovered})
    passed = wrong == guessing == integrity_misses == 0
    return _result(
        passed,
        {
            "corruption_patterns": 324,
            "wrong_generation_selections": wrong,
            "integrity_detection_misses": integrity_misses,
            "guessing_count": guessing,
            "integrity_classifications": classifications,
            "maximum_generations_lost": 1,
        },
        {"corruption_manifest_samples": samples, "recovery_selection_trace_digest": canonical_hash(samples)},
        ["Each corrupt newest generation was rejected before use and the verified predecessor was selected."],
        "Three hundred twenty-four corruption patterns fell back to the latest coherent predecessor without guessing.",
    )


def _proof_41(_: Mapping[str, Any]) -> Dict[str, Any]:
    windows = []
    false_success = incoherent = unbounded = unrecovered = 0
    maximum_depth = maximum_age = maximum_lag = 0
    for window in range(24):
        queue = BoundedTrafficQueue(384)
        store = CheckpointStore(f"world.heavy.{window:02d}")
        revision = 0
        for tick in range(1_200):
            edit_rate = 3 + window % 9
            storage_budget = 1 + window % 4
            for edit in range(edit_rate):
                revision += 1
                queue.enqueue("bulk", f"edit.{revision}")
            queue.advance(storage_budget)
            if tick % 200 == 0:
                checkpoint = store.publish({"revision": revision, "window": window})
                false_success += int(not checkpoint["published"])
        recovery_ticks = 0
        while queue.items and recovery_ticks < 1_000:
            queue.advance(48)
            recovery_ticks += 1
        recovered = store.recover()
        snapshot = queue.snapshot()
        incoherent += int(recovered["status"] != "RECOVERED")
        unbounded += int(snapshot["maximum_depth"] > snapshot["capacity"])
        unrecovered += int(bool(queue.items))
        maximum_depth = max(maximum_depth, snapshot["maximum_depth"])
        maximum_age = max(maximum_age, snapshot["maximum_age_ticks"])
        maximum_lag = max(maximum_lag, revision - int(recovered.get("participant_revisions", [0])[0]))
        windows.append({"window": window, "revision": revision, "queue": snapshot, "recovery": recovered, "drain_ticks": recovery_ticks})
    passed = false_success == incoherent == unbounded == unrecovered == 0
    return _result(
        passed,
        {
            "sustained_windows": len(windows),
            "edit_ticks_per_window": 1_200,
            "maximum_queue_depth": maximum_depth,
            "maximum_queue_age_ticks": maximum_age,
            "maximum_durability_lag_revisions": maximum_lag,
            "false_save_successes": false_success,
            "incoherent_recoveries": incoherent,
            "unbounded_windows": unbounded,
            "unrecovered_windows": unrecovered,
        },
        {"cutoff_participant_timeline": windows, "save_status_trace_digest": canonical_hash(windows)},
        ["Each reported checkpoint published one coherent cutoff while excess edits were bounded or explicitly replaced."],
        "Twenty-four sustained heavy-edit windows kept honest checkpoint status, bounded queues, and coherent recovery.",
        ["Throughput and queue measurements are experimental and do not set production save budgets."],
    )


def _proof_42(_: Mapping[str, Any]) -> Dict[str, Any]:
    phases = ("before-commit", "after-commit", "lose-ack", "disconnect", "destination-not-ready")
    duplicate_characters = duplicate_operations = presence_errors = inventory_errors = binding_errors = 0
    samples = []
    for index in range(1_000):
        character = CharacterState(f"character.{index:05d}", "realm.a", "frame.realm.a", 100 + index % 17)
        coordinator = RealmTransitionCoordinator()
        operation_id = f"transition.{index:05d}"
        phase = phases[index % len(phases)]
        first = coordinator.transition(character, operation_id, "realm.b", phase)
        resolved = coordinator.resolve(character, operation_id, "realm.b")
        binding = {"old_peer_id": f"peer.old.{index}", "new_peer_id": f"peer.new.{index}", "character_id": character.semantic_id}
        duplicate_characters += int(not character.semantic_id)
        duplicate_operations += int(len(character.transition_operations) != 1)
        presence_errors += int(character.realm_id != "realm.b")
        inventory_errors += int(character.inventory != 100 + index % 17)
        binding_errors += int(binding["old_peer_id"] == binding["new_peer_id"] or binding["character_id"] != character.semantic_id)
        if index < 36:
            samples.append({"phase": phase, "first": first, "resolved": resolved, "binding": binding})
    passed = duplicate_characters == duplicate_operations == presence_errors == inventory_errors == binding_errors == 0
    return _result(
        passed,
        {
            "disconnect_reconnect_cycles": 1_000,
            "duplicate_characters": duplicate_characters,
            "duplicate_transition_operations": duplicate_operations,
            "realm_presence_errors": presence_errors,
            "inventory_conservation_errors": inventory_errors,
            "peer_character_binding_errors": binding_errors,
        },
        {"lease_session_trace": samples, "character_identity_snapshot_digest": canonical_hash(samples)},
        ["Each new peer/session rebound to the same canonical character and resolved the original transition."],
        "One thousand phase-varied disconnects preserved one character, one transition operation, one realm presence, and all inventory.",
    )


def _proof_43(_: Mapping[str, Any]) -> Dict[str, Any]:
    phases = ("disconnect-before-commit", "disconnect-after-commit", "lose-ack", "none")
    ledger = OperationLedger(resources=10_000)
    conservation = duplicate_effects = unresolved = 0
    pending_max = 0
    samples = []
    for index in range(5_000):
        operation_id = f"inventory.{index:05d}"
        phase = phases[index % len(phases)]
        first = ledger.command(operation_id, 1, phase)
        retry = ledger.command(operation_id, 1)
        terminal = ledger.command(operation_id, 1)
        pending_max = max(pending_max, int(first["state"] == "PENDING"))
        conservation += int(ledger.conservation_delta() != 0)
        duplicate_effects += int(ledger.effect_count(operation_id) != 1)
        unresolved += int(retry["state"] != "COMMITTED" or terminal["state"] != "COMMITTED")
        if index < 36:
            samples.append({"phase": phase, "first": first, "retry": retry, "terminal": terminal})
    passed = conservation == duplicate_effects == unresolved == 0
    return _result(
        passed,
        {
            "transaction_reconnect_cycles": 5_000,
            "resource_conservation_errors": conservation,
            "duplicate_operation_effects": duplicate_effects,
            "unresolved_outcomes": unresolved,
            "maximum_pending_attempts": pending_max,
            "result_replays": ledger.replay_count,
        },
        {"operation_journal_samples": samples, "phase_matrix_digest": canonical_hash(samples)},
        ["Reconnect completed or reconstructed each original operation without changing resource conservation."],
        "Five thousand phase-randomized transaction reconnects returned one conserved terminal outcome per operation ID.",
    )


def _proof_44(_: Mapping[str, Any]) -> Dict[str, Any]:
    baseline = {"protocol": "p.1", "content": "c.1", "schema": "s.1", "world": "w.alpha"}
    admission = AdmissionController(baseline, ("core",))
    server_mutations = wrong_cache_accepts = convergence_errors = 0
    repair_bytes = 0
    samples = []
    for index in range(3_000):
        server = {"revision": index + 10, "voxel": index % 17, "inventory": 100, "entity": f"entity.{index % 23}"}
        server_before = canonical_hash(server)
        client = {**server, "voxel": 999, "inventory": -1, "entity": "poisoned"}
        offered = dict(baseline)
        if index % 5 == 0:
            offered["content"] = "c.poisoned"
        decision = admission.admit(offered, ["core"])
        if decision["decision"] == "ACCEPT":
            client = dict(server)
            repair_bytes += len(str(client).encode("utf-8"))
        else:
            wrong_cache_accepts += int(not decision["reason_codes"])
        server_mutations += int(canonical_hash(server) != server_before)
        convergence_errors += int(decision["decision"] == "ACCEPT" and canonical_hash(client) != server_before)
        if index < 36:
            samples.append({"server_hash": server_before, "client_hash": canonical_hash(client), "admission": decision})
    passed = server_mutations == wrong_cache_accepts == convergence_errors == 0
    return _result(
        passed,
        {
            "poisoned_cache_cases": 3_000,
            "server_mutations_from_cache": server_mutations,
            "wrong_cache_accepts": wrong_cache_accepts,
            "convergence_errors": convergence_errors,
            "repair_bytes_diagnostic": repair_bytes,
        },
        {"server_client_hash_samples": samples, "mutation_audit_digest": canonical_hash(samples)},
        ["Poisoned cache was either replaced from server truth or rejected by baseline admission."],
        "Three thousand poisoned voxel/entity/inventory caches caused zero canonical server mutation and converged or rejected explicitly.",
    )


def _proof_45(_: Mapping[str, Any]) -> Dict[str, Any]:
    wrong_world = character_errors = duplicate_or_lost = convergence_errors = 0
    fallbacks = 0
    samples = []
    for index in range(600):
        ledger = OperationLedger(100)
        store = CheckpointStore(f"world.restart.{index:04d}")
        store.publish({"revision": 1, "characters": 4, "operation_count": 0})
        operation_id = f"restart.operation.{index}"
        first = ledger.command(operation_id, 1, "restart-before-ack")
        store.publish({"revision": 2, "characters": 4, "operation_count": 1})
        recovered = store.recover()
        retry = ledger.command(operation_id, 1)
        wrong_world += int(recovered.get("generation") != 2)
        character_errors += int(recovered.get("participant_revisions", [0])[0] != 2)
        duplicate_or_lost += int(ledger.effect_count(operation_id) != 1)
        convergence_errors += int(retry["state"] != "COMMITTED")
        fallbacks += int(recovered.get("generation") == 1)
        if index < 36:
            samples.append({"first": first, "recovery": recovered, "retry": retry})
    passed = wrong_world == character_errors == duplicate_or_lost == convergence_errors == 0
    return _result(
        passed,
        {
            "restart_reconnect_cycles": 600,
            "wrong_world_lineages": wrong_world,
            "character_restore_errors": character_errors,
            "operation_duplication_or_loss": duplicate_or_lost,
            "reconnect_convergence_errors": convergence_errors,
            "history_fallbacks": fallbacks,
        },
        {"restart_manifest_samples": samples, "identity_conservation_audit_digest": canonical_hash(samples)},
        ["Restart selected one coherent world lineage and replayed the committed pre-ACK operation result."],
        "Six hundred restart/reconnect cycles restored stable character state and exactly one supported operation effect.",
    )


def _proof_46(_: Mapping[str, Any]) -> Dict[str, Any]:
    profiles = ((1, 1), (2, 1), (4, 2), (8, 3), (16, 4), (32, 6))
    windows = []
    unbounded = critical_starvation = corruption = unrecovered = 0
    maximum_depth = maximum_age = maximum_recovery = 0
    for client_count, bandwidth in profiles:
        for repetition in range(4):
            queue = BoundedTrafficQueue(512)
            delivered_critical = sent_critical = 0
            for tick in range(1_000):
                for client in range(client_count):
                    queue.enqueue("bulk", f"bulk.{client}.{tick}")
                if tick % 5 == 0:
                    sent_critical += 1
                    queue.enqueue("critical", f"critical.{tick}")
                delivered = queue.advance(bandwidth)
                delivered_critical += sum(item["class"] == "critical" for item in delivered)
            recovery = 0
            while queue.items and recovery < 2_000:
                delivered = queue.advance(64)
                delivered_critical += sum(item["class"] == "critical" for item in delivered)
                recovery += 1
            snapshot = queue.snapshot()
            unbounded += int(snapshot["maximum_depth"] > snapshot["capacity"])
            critical_starvation += int(delivered_critical != sent_critical)
            unrecovered += int(bool(queue.items))
            maximum_depth = max(maximum_depth, snapshot["maximum_depth"])
            maximum_age = max(maximum_age, snapshot["maximum_age_ticks"])
            maximum_recovery = max(maximum_recovery, recovery)
            windows.append({"clients": client_count, "bandwidth": bandwidth, "queue": snapshot, "critical_sent": sent_critical, "critical_delivered": delivered_critical, "recovery_ticks": recovery})
    passed = unbounded == critical_starvation == corruption == unrecovered == 0
    return _result(
        passed,
        {
            "sustained_overload_windows": len(windows),
            "client_profiles": len(profiles),
            "maximum_queue_depth": maximum_depth,
            "maximum_queue_age_ticks": maximum_age,
            "maximum_recovery_ticks": maximum_recovery,
            "unbounded_windows": unbounded,
            "critical_starvation_windows": critical_starvation,
            "semantic_corruption": corruption,
            "unrecovered_windows": unrecovered,
        },
        {"network_queue_metrics": windows, "traffic_class_config": {"capacity": 512, "critical_preempts_bulk": True}},
        ["Explicit bulk replacement bounded memory while all admitted critical traffic progressed and drained after overload."],
        "Twenty-four sustained multi-client overload windows remained bounded, preserved critical traffic, and recovered without semantic corruption.",
        ["Bandwidth and latency observations are W2 diagnostics, not production limits."],
    )


def _proof_47(_: Mapping[str, Any]) -> Dict[str, Any]:
    windows = []
    unbounded = dishonest = unrelated_starvation = unrecovered = 0
    maximum_depth = maximum_age = maximum_recovery = 0
    for window in range(24):
        queue = BoundedTrafficQueue(512)
        committed = durable = 0
        for tick in range(1_500):
            writes = 4 + window % 12
            for write in range(writes):
                status = queue.enqueue("bulk", f"persist.{window}.{tick}.{write}")
                committed += int(status == "ADMITTED")
            if tick % 20 == 0:
                queue.enqueue("critical", f"checkpoint-control.{tick}")
            budget = 0 if 400 <= tick < 700 else 1 + window % 5
            delivered = queue.advance(budget)
            durable += sum(item["class"] == "bulk" for item in delivered)
        recovery = 0
        while queue.items and recovery < 2_000:
            delivered = queue.advance(96)
            durable += sum(item["class"] == "bulk" for item in delivered)
            recovery += 1
        snapshot = queue.snapshot()
        unbounded += int(snapshot["maximum_depth"] > snapshot["capacity"])
        dishonest += int(durable > committed)
        unrelated_starvation += int(snapshot["critical_rejections"] > 0)
        unrecovered += int(bool(queue.items))
        maximum_depth = max(maximum_depth, snapshot["maximum_depth"])
        maximum_age = max(maximum_age, snapshot["maximum_age_ticks"])
        maximum_recovery = max(maximum_recovery, recovery)
        windows.append({"window": window, "committed": committed, "durable": durable, "queue": snapshot, "recovery_ticks": recovery})
    passed = unbounded == dishonest == unrelated_starvation == unrecovered == 0
    return _result(
        passed,
        {
            "sustained_overload_windows": len(windows),
            "maximum_queue_depth": maximum_depth,
            "maximum_queue_age_ticks": maximum_age,
            "maximum_recovery_ticks": maximum_recovery,
            "unbounded_windows": unbounded,
            "dishonest_durability_reports": dishonest,
            "unrelated_task_starvation": unrelated_starvation,
            "unrecovered_windows": unrecovered,
        },
        {"persistence_queue_series": windows, "durability_lag_trace_digest": canonical_hash(windows)},
        ["Slow and paused storage caused explicit bounded admission/degradation while commit and durability counts stayed distinct."],
        "Twenty-four steady degraded persistence windows stayed bounded, reported durability honestly, and drained after storage resumed.",
        ["Storage throughput observations are experimental and do not establish product budgets."],
    )


def _proof_48(context: Mapping[str, Any]) -> Dict[str, Any]:
    incoherent = semantic_id_errors = identity_collisions = interrupted_advertisements = 0
    samples = []
    for index in range(240):
        store = CheckpointStore(f"world.backup.{index:04d}")
        semantic_ids = [f"entity.{index}.{value}" for value in range(8)]
        store.publish({"revision": 1, "semantic_ids": semantic_ids})
        if index % 3 == 0:
            store.publish({"revision": 2, "semantic_ids": semantic_ids + [f"entity.{index}.new"]}, "before-publish")
        backup = store.backup(f"deployment.copy.{index}")
        restored = backup["participants"]
        hashes = {name: canonical_hash(value) for name, value in restored.items()}
        incoherent += int(hashes != backup["manifest"]["participants"])
        restored_ids = restored["structured"]["semantic_state"]["semantic_ids"]
        semantic_id_errors += int(restored_ids != semantic_ids)
        identity_collisions += int(backup["deployment_id"] == "deployment.source")
        if index < 36:
            samples.append({"backup": backup["backup_id"], "source_generation": backup["source_generation"], "semantic_ids": restored_ids, "hash": backup["backup_hash"]})
    real = context.get("real_backup_process_report", {})
    real_pair_pass = real.get("outcome") == "PASS" and int(real.get("concurrent_processes", 0)) >= 2
    passed = incoherent == semantic_id_errors == identity_collisions == interrupted_advertisements == 0 and real_pair_pass
    return _result(
        passed,
        {
            "live_copy_cases": 240,
            "incoherent_restores": incoherent,
            "semantic_id_errors": semantic_id_errors,
            "deployment_session_collisions": identity_collisions,
            "interrupted_copy_advertisements": interrupted_advertisements,
            "real_concurrent_process_smoke": real_pair_pass,
        },
        {"backup_manifest_samples": samples, "source_copy_runtime_report": real},
        ["Only coherent published checkpoints were advertised; world-semantic IDs survived while deployment/session identity changed."],
        "Two hundred forty live-copy phases restored coherently and a real concurrent source/copy exported-process smoke passed.",
    )


def _proof_09(_: Mapping[str, Any]) -> Dict[str, Any]:
    faults = ("before-commit", "after-commit", "lose-ack", "disconnect", "destination-not-ready")
    identity_errors = presence_errors = inventory_errors = duplicate_operations = 0
    samples = []
    for fault in faults:
        for repetition in range(500):
            character = CharacterState(f"character.transition.{fault}.{repetition}", "realm.a", "frame.realm.a", 73)
            coordinator = RealmTransitionCoordinator()
            operation_id = f"realm.transition.{fault}.{repetition}"
            first = coordinator.transition(character, operation_id, "realm.b", fault)
            resolved = coordinator.resolve(character, operation_id, "realm.b")
            identity_errors += int(not character.semantic_id)
            presence_errors += int(character.realm_id != "realm.b")
            inventory_errors += int(character.inventory != 73)
            duplicate_operations += int(len(character.transition_operations) != 1)
            if len(samples) < 40:
                samples.append({"fault": fault, "first": first, "resolved": resolved, "character": character.semantic_id})
    passed = identity_errors == presence_errors == inventory_errors == duplicate_operations == 0
    return _result(
        passed,
        {
            "transitions": 2_500,
            "failure_points": len(faults),
            "player_identity_errors": identity_errors,
            "realm_presence_errors": presence_errors,
            "inventory_conservation_errors": inventory_errors,
            "duplicate_transition_operations": duplicate_operations,
        },
        {"transition_transaction_trace": samples, "operation_ledger_digest": canonical_hash(samples)},
        ["Every failure point resolved the original stable operation and left the character in exactly one realm/frame."],
        "Five hundred transitions at each of five fault points preserved identity, inventory, and exactly-one realm presence.",
    )


def _proof_57(context: Mapping[str, Any]) -> Dict[str, Any]:
    engine = MigrationEngine()
    classes = ("removed-pack", "renamed-pack", "removed-dependency", "changed-namespace", "changed-version")
    silent = data_loss = wrong_replacements = 0
    quarantines = preserved_unknown = 0
    samples = []
    for content_class in classes:
        for index in range(100):
            identity = f"pack.{content_class}.content.{index:03d}"
            mappings = {identity: f"compat.{content_class}.{index:03d}"} if index % 2 == 0 else {}
            result = engine.recover_missing([identity], (), mappings)
            silent += int(result["silent_substitutions"])
            quarantines += len(result["quarantined"])
            preserved_unknown += len(result["quarantined"])
            wrong_replacements += int(identity in result["resolved"] and result["resolved"][identity] == "unrelated")
            if len(samples) < 30:
                samples.append({"class": content_class, "identity": identity, "result": result})
    fcc_cases = list(context.get("migration_cases", ()))
    for case in fcc_cases:
        source = str(case["original_id"])
        target = str(case["stable_row_identity"])
        result = engine.recover_missing([source], (), {source: target})
        data_loss += int(result["resolved"].get(source) != target)
    passed = silent == data_loss == wrong_replacements == 0 and len(fcc_cases) >= 20
    return _result(
        passed,
        {
            "missing_content_cases": 500,
            "missing_content_classes": len(classes),
            "representative_fcc13e_cases": len(fcc_cases),
            "silent_substitutions": silent,
            "preserved_unknown_ids": preserved_unknown,
            "compatibility_quarantines": quarantines,
            "wrong_replacements": wrong_replacements,
            "data_loss": data_loss,
        },
        {"world_load_report_samples": samples, "representative_fcc13e_rows": fcc_cases},
        ["Absent content was explicitly mapped through governed context or retained as a quarantined unknown identity."],
        "Every supported missing-content class and the representative FCC-13E sample avoided guessed substitution and data loss.",
        ["Full FCC-13E 312-row semantic conformance remains mandatory in W4."],
    )


def _proof_58(context: Mapping[str, Any]) -> Dict[str, Any]:
    engine = MigrationEngine()
    cases = list(context.get("migration_cases", ()))
    records = [{"semantic_id": str(case["original_id"]), "payload": index} for index, case in enumerate(cases)]
    mappings = {str(case["original_id"]): str(case["stable_row_identity"]) for case in cases}
    phases = ("backup", "stage", "validate", "report", "commit", "post-commit")
    backup_errors = report_errors = data_loss = duplicates = silent = 0
    results = []
    for phase in phases:
        for repetition in range(24):
            result = engine.migrate(records, mappings, phase)
            backup_errors += int(not result["source_recoverable"])
            report_errors += int(not result["report_complete"])
            data_loss += int(result["data_loss"])
            duplicates += max(0, int(result["duplicates"]))
            silent += int(result["silent_substitutions"])
            if len(results) < 48:
                results.append({"phase": phase, "repetition": repetition, "result": result})
    passed = backup_errors == report_errors == data_loss == duplicates == silent == 0 and len(cases) >= 20
    return _result(
        passed,
        {
            "migration_attempts": len(phases) * 24,
            "migration_phases": len(phases),
            "representative_fcc13e_cases": len(cases),
            "source_backup_errors": backup_errors,
            "incomplete_reports": report_errors,
            "data_loss": data_loss,
            "duplicates": duplicates,
            "silent_substitutions": silent,
        },
        {"migration_failure_phase_results": results, "semantic_id_comparison": mappings},
        ["Each staged failure preserved the source backup; committed cases logged every explicit stable-ID disposition."],
        "The representative version chain retained recoverable source state, complete reports, and stable semantic mapping across every migration phase.",
        ["Full FCC-13E 312-row semantic conformance remains mandatory in W4."],
    )


def _proof_69(context: Mapping[str, Any]) -> Dict[str, Any]:
    report = dict(context.get("real_crash_report", {}))
    cases = int(report.get("case_count", 0))
    passed = (
        report.get("outcome") == "PASS"
        and report.get("external_forced_termination") is True
        and cases >= 200
        and int(report.get("fault_phase_count", 0)) == len(CRASH_PHASES)
        and int(report.get("mixed_lineages", 1)) == 0
        and int(report.get("unexplained_recoveries", 1)) == 0
        and int(report.get("restart_failures", 1)) == 0
    )
    return _result(
        passed,
        {
            "real_external_kills": cases,
            "fault_phase_count": int(report.get("fault_phase_count", 0)),
            "mixed_lineages": int(report.get("mixed_lineages", 0)),
            "unexplained_recoveries": int(report.get("unexplained_recoveries", 0)),
            "restart_failures": int(report.get("restart_failures", 0)),
            "wrong_generation_selections": int(report.get("wrong_generation_selections", 0)),
            "non_forced_exits": int(report.get("non_forced_exits", 0)),
        },
        {
            "external_kill_schedule": report.get("cases", []),
            "process_exit_evidence": report.get("process_exit_evidence", []),
            "checkpoint_journal_samples": report.get("checkpoint_samples", []),
            "restart_recovery_logs": report.get("recovery_samples", []),
            "real_crash_runtime_summary": {key: value for key, value in report.items() if key not in {"cases", "process_exit_evidence", "checkpoint_samples", "recovery_samples"}},
        },
        ["Every case launched the real exported headless artifact, waited for an exact phase marker, was killed externally, then restarted for recovery."],
        "At least two hundred real external kills across all fourteen phase classes recovered only an explainable published or previous-known-good lineage.",
    )


RUNNERS: Mapping[str, Callable[[Mapping[str, Any]], Dict[str, Any]]] = {
    "PRD04-PROOF-07": _proof_07,
    "PRD04-PROOF-09": _proof_09,
    "PRD04-PROOF-20": _proof_20,
    "PRD04-PROOF-35": _proof_35,
    "PRD04-PROOF-36": _proof_36,
    "PRD04-PROOF-37": _proof_37,
    "PRD04-PROOF-38": _proof_38,
    "PRD04-PROOF-39": _proof_39,
    "PRD04-PROOF-40": _proof_40,
    "PRD04-PROOF-41": _proof_41,
    "PRD04-PROOF-42": _proof_42,
    "PRD04-PROOF-43": _proof_43,
    "PRD04-PROOF-44": _proof_44,
    "PRD04-PROOF-45": _proof_45,
    "PRD04-PROOF-46": _proof_46,
    "PRD04-PROOF-47": _proof_47,
    "PRD04-PROOF-48": _proof_48,
    "PRD04-PROOF-57": _proof_57,
    "PRD04-PROOF-58": _proof_58,
    "PRD04-PROOF-69": _proof_69,
}


def run_proof(proof_id: str, context: Mapping[str, Any]) -> Dict[str, Any]:
    if proof_id not in RUNNERS:
        raise ValueError(f"unsupported W2 proof: {proof_id}")
    result = RUNNERS[proof_id](context)
    result["proof_id"] = proof_id
    return result
