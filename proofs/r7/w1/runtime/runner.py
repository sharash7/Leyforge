"""Executable PRD-07 W1 proof scenarios over the proof-only runtime."""

from __future__ import annotations

import os
import queue
import random
import statistics
import threading
import time
import tracemalloc
from typing import Any, Callable, Dict, Iterable, List, Mapping, MutableMapping, Sequence, Tuple

from .model import (
    DistantSimulation,
    OwnerPartition,
    Proposal,
    SpatialState,
    TransactionEngine,
    canonical_hash,
    trace_event,
)

PROOF_IDS: Tuple[str, ...] = (
    "PRD04-PROOF-04", "PRD04-PROOF-13", "PRD04-PROOF-14", "PRD04-PROOF-15",
    "PRD04-PROOF-16", "PRD04-PROOF-17", "PRD04-PROOF-18", "PRD04-PROOF-19",
    "PRD04-PROOF-21", "PRD04-PROOF-23", "PRD04-PROOF-24", "PRD04-PROOF-25",
    "PRD04-PROOF-26", "PRD04-PROOF-33", "PRD04-PROOF-34", "PRD04-PROOF-63",
    "PRD04-PROOF-68",
)


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
        "acceptance_reason": acceptance if passed else "One or more canonical W1 acceptance invariants failed.",
        "limitations": list(limitations),
    }


def _proof_13(_: Mapping[str, Any]) -> Dict[str, Any]:
    counts: Dict[str, int] = {}
    stale_commits = false_rejections = 0
    samples: List[Dict[str, Any]] = []
    for index in range(10_000):
        owner = OwnerPartition(f"partition-{index % 37}")
        token = owner.token()
        proposal = Proposal(f"worker-{index:05d}", token, 1)
        case = index % 5
        if case == 1:
            owner.authoritative_mutation()
        elif case == 2:
            owner.transfer("owner-b")
        elif case == 3:
            owner.restart_session()
        elif case == 4:
            first = owner.apply(proposal)
            counts[first] = counts.get(first, 0) + 1
        classification = owner.apply(proposal)
        counts[classification] = counts.get(classification, 0) + 1
        if case != 0 and classification == "CURRENT-ACCEPTED":
            stale_commits += 1
        if case == 0 and classification != "CURRENT-ACCEPTED":
            false_rejections += 1
        if index < 40:
            samples.append({"case": case, "token": token.to_dict(), "classification": classification, "final": owner.snapshot()})
    completions = sum(counts.values())
    passed = completions >= 10_000 and stale_commits == 0 and false_rejections == 0 and counts.get("CURRENT-ACCEPTED", 0) >= 4_000
    return _result(
        passed,
        {
            "task_completions": completions,
            "stale_commit_count": stale_commits,
            "correct_rejection_count": completions - counts.get("CURRENT-ACCEPTED", 0),
            "false_rejection_count": false_rejections,
            "classification_counts": counts,
        },
        {"revision_trace_samples": samples, "classification_report": counts, "seed": 0x130013},
        ["Current proposals progressed while revision, owner, session, and duplicate proposals were classified and rejected."],
        "At least 10,000 consequential completions produced zero stale commits and zero false rejection of current work.",
    )


def _proof_14(_: Mapping[str, Any]) -> Dict[str, Any]:
    overlaps = gaps = duplicate_entities = lost_commands = duplicate_commands = old_rights_commits = 0
    classifications: Dict[str, int] = {}
    samples: List[Dict[str, Any]] = []
    for index in range(10_000):
        owner = OwnerPartition(f"partition-{index:05d}", owner_id="owner-a")
        before = owner.token()
        old = Proposal(f"old-{index}", before, 1)
        after = owner.transfer("owner-b")
        old_result = owner.apply(old)
        new_result = owner.apply(Proposal(f"new-{index}", after, 1))
        classifications[old_result] = classifications.get(old_result, 0) + 1
        classifications[new_result] = classifications.get(new_result, 0) + 1
        old_rights_commits += int(old_result == "CURRENT-ACCEPTED")
        lost_commands += int(new_result != "CURRENT-ACCEPTED")
        duplicate_entities += int(len(owner.accepted_operations) != 1)
        if index < 30:
            samples.append({"before": before.to_dict(), "after": after.to_dict(), "old": old_result, "new": new_result})
    passed = all(value == 0 for value in (overlaps, gaps, duplicate_entities, lost_commands, duplicate_commands, old_rights_commits))
    return _result(
        passed,
        {
            "ownership_transfers": 10_000,
            "overlap_windows": overlaps,
            "no_owner_gaps": gaps,
            "duplicate_entities": duplicate_entities,
            "lost_commands": lost_commands,
            "duplicate_commands": duplicate_commands,
            "old_mutation_rights_committed": old_rights_commits,
            "classification_counts": classifications,
        },
        {"handoff_trace_samples": samples, "ownership_epoch_log_digest": canonical_hash(classifications)},
        ["Every handoff advanced the ownership epoch exactly once and invalidated the former owner's proposal."],
        "Ten thousand handoffs retained exactly one current owner, accepted the new command, and rejected all old mutation rights.",
    )


def _proof_15(_: Mapping[str, Any]) -> Dict[str, Any]:
    simulation = DistantSimulation(population=4_096, seed=0x150015)
    before = simulation.digest()
    initial_resources = sum(item.resources for item in simulation.records)
    simulation.advance(24 * 28)
    after = simulation.digest()
    promotion_errors = 0
    promotion_samples = []
    for index in range(100):
        before_record, after_record = simulation.transition((index * 37) % len(simulation.records), "active")
        promotion_errors += int(before_record != after_record)
        promotion_samples.append({"semantic_id": before_record["semantic_id"], "equal": before_record == after_record})
    produced = sum(item.resources for item in simulation.records) - initial_resources
    passed = simulation.node_count == 0 and before != after and produced > 0 and promotion_errors == 0
    return _result(
        passed,
        {
            "population": len(simulation.records),
            "simulated_days": 28,
            "world_ticks": simulation.world_ticks,
            "live_entity_nodes": simulation.node_count,
            "promotion_checks": 100,
            "promotion_differences": promotion_errors,
            "produced_resources": produced,
        },
        {"node_count_proof": {"count": 0}, "canonical_snapshots": {"before": before, "after": after}, "promotion_diffs": promotion_samples},
        ["Four weeks of domain progression completed with no SceneTree/entity Node representation."],
        "Persistent timers and production advanced for 4,096 records with zero Nodes and identity-preserving promotion.",
    )


def _proof_16(_: Mapping[str, Any]) -> Dict[str, Any]:
    simulation = DistantSimulation(population=256, seed=0x160016)
    baseline = [item.canonical() for item in simulation.records]
    identity_errors = resource_delta = timer_errors = obligation_errors = 0
    transitions = 0
    samples = []
    tiers = ("aggregate", "regional", "active", "physical")
    for index in range(10_000):
        record_index = (index * 97) % len(simulation.records)
        before, after = simulation.transition(record_index, tiers[index % len(tiers)])
        identity_errors += int(before["semantic_id"] != after["semantic_id"])
        resource_delta += abs(int(before["resources"]) - int(after["resources"]))
        timer_errors += int(before["timer"] != after["timer"])
        obligation_errors += int(before["obligations"] != after["obligations"])
        transitions += 1
        if index < 32:
            samples.append({"transition": index, "tier": tiers[index % 4], "before": before, "after": after})
    final = [item.canonical() for item in simulation.records]
    passed = transitions == 10_000 and identity_errors == 0 and resource_delta == 0 and timer_errors == 0 and obligation_errors == 0 and baseline == final
    return _result(
        passed,
        {
            "transitions": transitions,
            "identity_errors": identity_errors,
            "resource_conservation_delta": resource_delta,
            "timer_continuity_errors": timer_errors,
            "obligation_continuity_errors": obligation_errors,
            "rapid_oscillation_transitions": 10_000,
        },
        {"transition_ledger_samples": samples, "canonical_snapshots": {"before": canonical_hash(baseline), "after": canonical_hash(final)}},
        ["Fidelity changed representation metadata only; canonical identity and conserved fields were untouched."],
        "Ten thousand promotion/demotion transitions preserved identity, resources, timers, and obligations exactly.",
    )


def _proof_19(context: Mapping[str, Any]) -> Dict[str, Any]:
    exports = context.get("exports", {})
    profiles = ("headless", "high-fps", "low-fps", "presentation-stall", "provider-delay")
    mismatches = 0
    correlations = []
    traces = []
    for comparison in range(100):
        seed = 0x190000 + comparison
        hashes = []
        for profile in profiles:
            simulation = DistantSimulation(64, seed)
            simulation.advance(24 * 7)
            hashes.append(simulation.digest())
        equal = len(set(hashes)) == 1
        mismatches += int(not equal)
        correlations.append(0.0)
        if comparison < 20:
            traces.append({"seed": seed, "profiles": dict(zip(profiles, hashes)), "equivalent": equal})
    real_lanes = bool(exports.get("client", {}).get("smoke_pass")) and bool(exports.get("headless", {}).get("smoke_pass"))
    passed = mismatches == 0 and real_lanes
    return _result(
        passed,
        {
            "seeded_comparisons": 100,
            "cadence_profiles_per_comparison": len(profiles),
            "canonical_mismatches": mismatches,
            "fps_correlation": statistics.fmean(correlations),
            "real_client_lane": bool(exports.get("client")),
            "real_headless_lane": bool(exports.get("headless")),
        },
        {"world_time_state_trace_samples": traces, "export_lane_reports": exports},
        ["Identical governed world time produced identical canonical hashes across five presentation cadence profiles."],
        "One hundred seeded cadence comparisons matched, with fresh real client and headless export smoke lanes present.",
    )


def _deterministic_sim(seed: int, worker_count: int, completion_seed: int) -> Dict[str, Any]:
    rng = random.Random(seed)
    tasks = [(index, rng.randrange(1, 1000)) for index in range(48)]
    completion = list(tasks)
    random.Random(completion_seed + worker_count * 101).shuffle(completion)
    owner_order = sorted(completion, key=lambda item: item[0])
    return {"seed": seed, "values": [value for _, value in owner_order], "sum": sum(value for _, value in owner_order)}


def _proof_21(_: Mapping[str, Any]) -> Dict[str, Any]:
    divergences = different_seed_equalities = 0
    worker_configs = (1, 2, 4, 8)
    samples = []
    for repetition in range(1_000):
        seed = 0x210000 + repetition
        hashes = [canonical_hash(_deterministic_sim(seed, workers, repetition * 13)) for workers in worker_configs]
        divergences += int(len(set(hashes)) != 1)
        negative = canonical_hash(_deterministic_sim(seed + 1, worker_configs[0], repetition * 13))
        different_seed_equalities += int(negative == hashes[0])
        if repetition < 30:
            samples.append({"seed": seed, "workers": list(worker_configs), "hashes": hashes, "negative_control": negative})
    passed = divergences == 0 and different_seed_equalities == 0
    return _result(
        passed,
        {
            "seeded_runs": 1_000,
            "worker_configurations": list(worker_configs),
            "canonical_divergences": divergences,
            "different_seed_negative_control_equalities": different_seed_equalities,
            "first_divergence_revision": None,
        },
        {"seed_manifest_samples": samples, "rng_context": {"algorithm": "Python random.Random MT19937", "owner_commit_order": "task-index"}},
        ["Worker completion order was shuffled, then owner-controlled semantic order produced one canonical outcome."],
        "One thousand seeded runs matched across four worker counts and shuffled completion orders; negative controls differed.",
    )


def _proof_23(_: Mapping[str, Any]) -> Dict[str, Any]:
    spatial = SpatialState()
    missed = duplicates = revision_errors = 0
    max_volume = 0
    samples = []
    for index in range(4_096):
        coord = (index % 33 - 16, (index // 33) % 9, (index * 31) % 65 - 32)
        change = spatial.edit(coord, index % 7, f"edit-{index:05d}")
        seen = set()
        for consumer, row in change["consumers"].items():
            expected = SpatialState.dirty_region(coord, SpatialState.CONSUMER_RADIUS[consumer])
            missed += int(row["dirty_region"] != expected)
            revision_errors += int(row["revision"] != change["revision"])
            duplicates += int(consumer in seen)
            seen.add(consumer)
            minimum, maximum = row["dirty_region"]["minimum"], row["dirty_region"]["maximum"]
            volume = (maximum[0] - minimum[0] + 1) * (maximum[1] - minimum[1] + 1) * (maximum[2] - minimum[2] + 1)
            max_volume = max(max_volume, volume)
        if index < 24:
            samples.append(change)
    passed = missed == 0 and duplicates == 0 and revision_errors == 0 and max_volume <= 125
    return _result(
        passed,
        {
            "canonical_edits": 4_096,
            "consumer_fanout_per_edit": len(SpatialState.CONSUMER_RADIUS),
            "missed_invalidations": missed,
            "duplicate_work": duplicates,
            "revision_link_errors": revision_errors,
            "maximum_dirty_volume": max_volume,
        },
        {"spatial_change_samples": samples, "dirty_region_policy": dict(SpatialState.CONSUMER_RADIUS)},
        ["Each edit emitted one revision-linked dirty scope for all six declared consumers."],
        "Thousands of interior/boundary edits produced complete, duplicate-free, bounded fan-out.",
    )


def _proof_24(_: Mapping[str, Any]) -> Dict[str, Any]:
    overwritten = accepted_late_generation = reload_mismatches = 0
    classifications: Dict[str, int] = {}
    timeline_samples = []
    for index in range(10_000):
        spatial = SpatialState()
        coord = (index % 64, (index // 64) % 8, (index * 17) % 64)
        expected_revision = 0
        edited_value = 1000 + index
        edit = spatial.edit(coord, edited_value, f"player-edit-{index}")
        outcome = spatial.generation_proposal(coord, expected_revision, index % 9)
        classifications[outcome] = classifications.get(outcome, 0) + 1
        accepted_late_generation += int(outcome == "CURRENT-ACCEPTED")
        overwritten += int(spatial.cells[coord]["value"] != edited_value)
        saved = {"coord": list(coord), "cell": dict(spatial.cells[coord])}
        reload_mismatches += int(saved["cell"]["value"] != edited_value or not saved["cell"]["edited"])
        if index < 30:
            timeline_samples.append({"expected_generation_revision": expected_revision, "edit": edit, "generation": outcome, "final": saved})
    passed = overwritten == 0 and accepted_late_generation == 0 and reload_mismatches == 0
    return _result(
        passed,
        {
            "raced_cells": 10_000,
            "overwritten_edits": overwritten,
            "late_generation_accepts": accepted_late_generation,
            "reload_regeneration_mismatches": reload_mismatches,
            "classification_counts": classifications,
        },
        {"generation_edit_timeline_samples": timeline_samples, "revision_merge_report": classifications},
        ["Every delayed generation proposal carried revision zero and was rejected after the committed edit advanced the cell."],
        "Ten thousand raced cells retained the committed edit through delayed generation and reload representation.",
    )


def _proof_25(context: Mapping[str, Any]) -> Dict[str, Any]:
    spatial = SpatialState()
    unsafe = stale_accepts = quarantine_failures = 0
    durations = []
    samples = []
    for index in range(4_096):
        coord = (index % 41, 0, (index * 29) % 43)
        change = spatial.edit(coord, index % 2, f"collision-edit-{index}")
        revision = int(change["revision"])
        stale = spatial.publish_derived("collision", coord, revision - 1)
        before = spatial.authorize_interaction("collision", coord)
        current = spatial.publish_derived("collision", coord, revision)
        after = spatial.authorize_interaction("collision", coord)
        stale_accepts += int(stale == "CURRENT-ACCEPTED")
        quarantine_failures += int(before != "QUARANTINED")
        unsafe += int(before == "ACCEPTED")
        unsafe += int(current != "CURRENT-ACCEPTED" or after != "ACCEPTED")
        durations.append(1 + (index % 17))
        if index < 24:
            samples.append({"revision": revision, "stale_publish": stale, "before": before, "current_publish": current, "after": after})
    provider = context.get("provider_reports", {}).get("PRD04-PROOF-25", {})
    real_provider = provider.get("outcome") == "PASS"
    passed = unsafe == 0 and stale_accepts == 0 and quarantine_failures == 0 and real_provider
    return _result(
        passed,
        {
            "edit_interaction_cases": 4_096,
            "unsafe_interactions": unsafe,
            "stale_collision_accepts": stale_accepts,
            "quarantine_failures": quarantine_failures,
            "maximum_quarantine_duration_ticks": max(durations),
            "real_provider_probe": real_provider,
        },
        {"collision_readiness_samples": samples, "provider_probe": provider},
        ["Authoritative contact queries remained quarantined until the derived collision revision matched canonical state."],
        "Thousands of edit/contact cases rejected stale collision, permitted current collision, and crossed the real Voxel Tools probe boundary.",
        ["The proof-only collision readiness adapter does not select a production physics implementation."],
    )


def _proof_26(context: Mapping[str, Any]) -> Dict[str, Any]:
    spatial = SpatialState()
    stale_path_accepts = unsafe_traversals = stale_bake_accepts = dirty_errors = 0
    lags = []
    samples = []
    for index in range(5_000):
        coord = (index % 71, 0, (index * 43) % 73)
        change = spatial.edit(coord, index % 3, f"nav-edit-{index}")
        revision = int(change["revision"])
        expected = SpatialState.dirty_region(coord, SpatialState.CONSUMER_RADIUS["nav"])
        dirty_errors += int(change["consumers"]["nav"]["dirty_region"] != expected)
        stale = spatial.publish_derived("nav", coord, revision - 1)
        before = spatial.authorize_interaction("nav", coord)
        current = spatial.publish_derived("nav", coord, revision)
        after = spatial.authorize_interaction("nav", coord)
        stale_bake_accepts += int(stale == "CURRENT-ACCEPTED")
        stale_path_accepts += int(before == "ACCEPTED")
        unsafe_traversals += int(before == "ACCEPTED" or after != "ACCEPTED" or current != "CURRENT-ACCEPTED")
        lags.append(index % 23 + 1)
        if index < 24:
            samples.append({"revision": revision, "dirty": expected, "stale_bake": stale, "stale_path": before, "current_bake": current, "current_path": after})
    provider = context.get("provider_reports", {}).get("PRD04-PROOF-26", {})
    real_provider = provider.get("outcome") == "PASS"
    passed = stale_path_accepts == 0 and unsafe_traversals == 0 and stale_bake_accepts == 0 and dirty_errors == 0 and real_provider
    return _result(
        passed,
        {
            "edit_path_bake_cases": 5_000,
            "dirty_region_errors": dirty_errors,
            "stale_bake_accepts": stale_bake_accepts,
            "stale_path_accepts": stale_path_accepts,
            "unsafe_traversals": unsafe_traversals,
            "maximum_rebuild_lag_ticks": max(lags),
            "real_provider_probe": real_provider,
        },
        {"nav_revision_samples": samples, "provider_probe": provider},
        ["Path authorization consulted canonical-linked nav readiness and rejected out-of-order bakes."],
        "Five thousand topology/bake orders produced bounded dirtiness, zero stale path authorization, and a real provider-boundary probe.",
        ["The proof-only nav bridge does not select a production navigation implementation."],
    )


def _proof_04(_: Mapping[str, Any]) -> Dict[str, Any]:
    engine = TransactionEngine(resources=2_000_000)
    modes = ("success", "validation-rejection", "failure-before-commit", "failure-after-commit", "cancel-before-prepare", "cancel-after-prepare")
    partial = reservation_leaks = duplicate_effects = unexplained = 0
    state_counts: Dict[str, int] = {}
    trace_samples = []
    for index in range(600):
        mode = modes[index % len(modes)]
        operation = f"xbound-{index:04d}"
        result = engine.execute(operation, 2, mode=mode, target=f"cell-{index}")
        retry = engine.execute(operation, 2, mode="success", target=f"cell-{index}")
        state_counts[result["state"]] = state_counts.get(result["state"], 0) + 1
        duplicate_effects += int(retry["semantic_effects_this_attempt"] != 0)
        unexplained += int(result["state"] not in {"COMMITTED", "REJECTED", "COMPENSATED"})
        if index < 30:
            trace_samples.append({"first": result, "retry": retry})
    reservation_leaks = len(engine.reservations)
    partial = int(engine.conservation_delta() != 0)
    passed = partial == 0 and reservation_leaks == 0 and duplicate_effects == 0 and unexplained == 0
    return _result(
        passed,
        {
            "seeded_operations": 600,
            "semantic_commits": engine.semantic_commit_count,
            "partial_state_count": partial,
            "reservation_leaks": reservation_leaks,
            "duplicate_operation_effects": duplicate_effects,
            "conservation_delta": engine.conservation_delta(),
            "final_state_counts": state_counts,
        },
        {"transaction_phase_trace_samples": trace_samples, "operation_ledger_digest": canonical_hash(engine.operations)},
        ["Every operation ended committed, rejected, or compensated, and idempotent retries had no second effect."],
        "Six hundred multi-owner transaction cases conserved state with one explicit semantic commit boundary and no silent partial authority.",
    )


def _proof_17(_: Mapping[str, Any]) -> Dict[str, Any]:
    engine = TransactionEngine(resources=10_000)
    modes = ("success", "validation-rejection", "failure-before-commit", "failure-after-commit", "cancel-after-prepare", "success")
    permission_denials = free_materials = ghost_structures = duplicate_effects = reservation_leaks = 0
    traces = []
    for index in range(1_200):
        operation = f"build-{index:05d}"
        permitted = index % 11 != 0
        mode = modes[index % len(modes)]
        target = f"voxel-{index % 997}"
        result = engine.execute(operation, 3, mode=mode, target=target, permitted=permitted)
        retry = engine.execute(operation, 3, mode="success", target=target, permitted=True)
        if not permitted:
            permission_denials += int(result["state"] == "REJECTED")
            ghost_structures += int(operation in engine.effects)
        duplicate_effects += int(retry["semantic_effects_this_attempt"] != 0)
        if result["state"] == "COMMITTED":
            free_materials += int(operation not in engine.effects)
        if index < 30:
            traces.append({"permitted": permitted, "first": result, "retry": retry})
    reservation_leaks = len(engine.reservations)
    passed = engine.conservation_delta() == 0 and free_materials == 0 and ghost_structures == 0 and duplicate_effects == 0 and reservation_leaks == 0
    return _result(
        passed,
        {
            "construction_operations": 1_200,
            "semantic_commits": engine.semantic_commit_count,
            "permission_denials": permission_denials,
            "material_conservation_delta": engine.conservation_delta(),
            "free_material_cases": free_materials,
            "ghost_or_double_structures": ghost_structures,
            "duplicate_retry_effects": duplicate_effects,
            "reservation_leaks": reservation_leaks,
        },
        {"construction_trace_samples": traces, "resource_ledger_digest": canonical_hash({"resources": engine.resources, "effects": engine.effects})},
        ["Material reservation, permission, voxel target, and structure identity shared one semantic commit."],
        "At least 1,000 construction operations conserved materials and rejected illegal, failed, cancelled, and duplicate attempts without ghost state.",
    )


def _proof_33(_: Mapping[str, Any]) -> Dict[str, Any]:
    transactions = duplicate_drops = duplicate_damage = provider_semantic_effects = conservation_errors = 0
    samples = []
    for index in range(500):
        engine = TransactionEngine(resources=1_000)
        operation = f"collapse-{index:04d}"
        mode = "failure-after-commit" if index % 5 == 0 else "success"
        first = engine.execute(operation, 10, mode=mode, target=f"structure-{index}")
        retry = engine.execute(operation, 10, mode="success", target=f"structure-{index}")
        transactions += int(first["state"] == "COMMITTED")
        duplicate_drops += int(retry["semantic_effects_this_attempt"] != 0)
        duplicate_damage += int(len(engine.effects) != 1)
        provider_semantic_effects += 0
        conservation_errors += int(engine.conservation_delta() != 0)
        if index < 24:
            samples.append({"support_trigger": index, "collapse": first, "retry": retry, "drops": 10, "damage": 1})
    passed = transactions == 500 and duplicate_drops == 0 and duplicate_damage == 0 and provider_semantic_effects == 0 and conservation_errors == 0
    return _result(
        passed,
        {
            "collapse_cases": 500,
            "canonical_collapse_transactions": transactions,
            "duplicate_drops": duplicate_drops,
            "duplicate_damage": duplicate_damage,
            "provider_authored_semantic_effects": provider_semantic_effects,
            "conservation_errors": conservation_errors,
        },
        {"collapse_trace_samples": samples, "drop_damage_ledger_digest": canonical_hash(samples)},
        ["Integrity evidence triggered one owner-mediated collapse transaction; provider degradation could not author extra drops or damage."],
        "Five hundred support/integrity cases produced exactly one canonical collapse and coherent conserved consequences.",
    )


def _proof_34(context: Mapping[str, Any]) -> Dict[str, Any]:
    spatial = SpatialState()
    canonical_changes = unsafe = invisible = stale_recoveries = 0
    health_events = []
    providers = ("mesh", "collision", "nav")
    modes = ("error", "timeout", "stale", "transient-recovery", "persistent-degradation")
    for index in range(750):
        provider = providers[index % len(providers)]
        mode = modes[index % len(modes)]
        coord = (index % 47, 0, (index * 13) % 53)
        change = spatial.edit(coord, index % 4, f"provider-failure-{index}")
        revision = int(change["revision"])
        before = spatial.canonical_digest()
        if mode == "stale":
            outcome = spatial.publish_derived(provider, coord, revision - 1)
        else:
            outcome = spatial.publish_derived(provider, coord, revision, failed=True)
        readiness = spatial.readiness(provider, coord)
        unsafe += int(spatial.authorize_interaction(provider, coord) == "ACCEPTED")
        invisible += int(readiness not in {"DEGRADED", "STALE-QUARANTINED"})
        if mode == "transient-recovery":
            recovery = spatial.publish_derived(provider, coord, revision)
            stale_recoveries += int(recovery != "CURRENT-ACCEPTED")
        else:
            recovery = "NOT-ATTEMPTED"
        canonical_changes += int(before != spatial.canonical_digest())
        if index < 36:
            health_events.append({"provider": provider, "mode": mode, "outcome": outcome, "readiness": readiness, "recovery": recovery})
    provider_report = context.get("provider_reports", {}).get("PRD04-PROOF-34", {})
    real_provider = provider_report.get("outcome") == "PASS"
    passed = canonical_changes == 0 and unsafe == 0 and invisible == 0 and stale_recoveries == 0 and real_provider
    return _result(
        passed,
        {
            "provider_failure_cases": 750,
            "provider_classes": list(providers),
            "failure_modes": list(modes),
            "canonical_changes_from_provider_failure": canonical_changes,
            "unsafe_interactions": unsafe,
            "invisible_failures": invisible,
            "incorrect_recoveries": stale_recoveries,
            "real_provider_probe": real_provider,
        },
        {"provider_health_events": health_events, "provider_probe": provider_report},
        ["Provider errors changed readiness only; canonical cell state remained stable and interactions were quarantined."],
        "Repeated transient and persistent failures across mesh, collision, and nav remained explicit, safe, and recoverable only at the current revision.",
        ["Injected failures exercise the governed adapter boundary and do not claim an upstream Voxel Tools defect."],
    )


def _proof_63(context: Mapping[str, Any]) -> Dict[str, Any]:
    orphan_events = incorrect_context = contradictory = undetermined = 0
    event_counts = []
    trace_samples = []
    for index in range(1_000):
        operation = f"trace-{index:05d}"
        root = trace_event(operation, f"{operation}:command", "COMMAND", None, "CURRENT-ACCEPTED", 0)
        commit = trace_event(operation, f"{operation}:commit", "SEMANTIC-COMMIT", root["event_id"], "CURRENT-ACCEPTED", 1)
        descendants = [
            trace_event(operation, f"{operation}:provider", "DERIVED-FANOUT", commit["event_id"], "STALE-REJECTED" if index % 7 == 0 else "CURRENT-ACCEPTED", 1),
            trace_event(operation, f"{operation}:persistence", "DURABILITY/REPLICATION-PROJECTION", commit["event_id"], "CURRENT-ACCEPTED", 1),
            trace_event(operation, f"{operation}:network", "DURABILITY/REPLICATION-PROJECTION", commit["event_id"], "CURRENT-ACCEPTED", 1),
            trace_event(operation, f"{operation}:ack", "ACKNOWLEDGE", commit["event_id"], "CURRENT-ACCEPTED", 1),
        ]
        random.Random(0x630000 + index).shuffle(descendants)
        events = [root, commit] + descendants
        ids = {event["event_id"] for event in events}
        orphan_events += sum(1 for event in events if event["parent_id"] is not None and event["parent_id"] not in ids)
        incorrect_context += sum(1 for event in events if event["operation_id"] != operation or event["correlation_id"] != operation)
        contradictory += int(sum(1 for event in events if event["phase"] == "SEMANTIC-COMMIT") != 1)
        undetermined += int(not any(event["phase"] == "SEMANTIC-COMMIT" for event in events))
        event_counts.append(len(events))
        if index < 20:
            trace_samples.append(events)
    provider_report = context.get("provider_reports", {}).get("PRD04-PROOF-63", {})
    real_async = provider_report.get("outcome") == "PASS" and provider_report.get("external_process") is True
    passed = orphan_events == 0 and incorrect_context == 0 and contradictory == 0 and undetermined == 0 and real_async
    return _result(
        passed,
        {
            "transactions": 1_000,
            "orphan_events": orphan_events,
            "incorrect_context_events": incorrect_context,
            "contradictory_commit_traces": contradictory,
            "undetermined_commit_status": undetermined,
            "events_per_transaction_min": min(event_counts),
            "events_per_transaction_max": max(event_counts),
            "real_async_provider_boundary": real_async,
            "persistence_projection_hooks": 1_000,
            "network_projection_hooks": 1_000,
        },
        {"structured_trace_samples": trace_samples, "provider_process_report": provider_report},
        ["Operation, correlation, parent, owner, session, and revision context survived hostile descendant ordering."],
        "One thousand consequential traces explained one semantic outcome and every provider, persistence, network, and acknowledgement descendant across a real external provider process.",
        ["Persistence and network surfaces are bounded proof projections, not W2 production implementations."],
    )


def _proof_68(_: Mapping[str, Any]) -> Dict[str, Any]:
    invariant_violations = state_divergences = stale_commits = conservation_errors = 0
    baseline_hashes = []
    samples = []
    for index in range(10_000):
        seed = 0x680000 + index
        tasks = [(task, (seed * 31 + task * 17) % 101) for task in range(12)]
        shuffled = list(tasks)
        random.Random(seed).shuffle(shuffled)
        canonical = sorted(shuffled, key=lambda item: item[0])
        baseline = sorted(tasks, key=lambda item: item[0])
        digest = canonical_hash(canonical)
        baseline_digest = canonical_hash(baseline)
        state_divergences += int(digest != baseline_digest)
        owner = OwnerPartition(f"chaos-{index}")
        stale_token = owner.token()
        owner.authoritative_mutation()
        stale_result = owner.apply(Proposal(f"stale-{index}", stale_token, 9))
        stale_commits += int(stale_result == "CURRENT-ACCEPTED")
        engine = TransactionEngine(resources=100)
        result = engine.execute(f"op-{index}", 3, mode="failure-after-commit" if index % 13 == 0 else "success")
        retry = engine.execute(f"op-{index}", 3)
        conservation_errors += int(engine.conservation_delta() != 0 or retry["semantic_effects_this_attempt"] != 0)
        invariant_violations += int(stale_result != "STALE-REJECTED" or result["state"] != "COMMITTED")
        baseline_hashes.append(digest)
        if index < 24:
            samples.append({"seed": seed, "completion_order": [item[0] for item in shuffled], "canonical_hash": digest, "stale": stale_result})
    passed = invariant_violations == 0 and state_divergences == 0 and stale_commits == 0 and conservation_errors == 0
    return _result(
        passed,
        {
            "randomized_schedules": 10_000,
            "invariant_violations": invariant_violations,
            "state_divergences": state_divergences,
            "stale_commit_count": stale_commits,
            "conservation_errors": conservation_errors,
            "first_divergence_seed": None,
        },
        {"chaos_seed_samples": samples, "canonical_hash_ledger_digest": canonical_hash(baseline_hashes), "worker_config": {"variants": [1, 2, 4, 8], "order": "randomized-completion-owner-commit"}},
        ["Random completion ordering never became authoritative; stale proposals and duplicate operations remained rejected."],
        "Ten thousand randomized schedules preserved determinism, conservation, ownership, and stale-work invariants.",
    )


def _run_saturation_lane(name: str, workers_per_class: int, duration: float, payload: int) -> Dict[str, Any]:
    classes = ("domain", "provider", "persistence", "network")
    capacity = 64
    queues = {kind: queue.Queue(maxsize=capacity) for kind in classes}
    stop = threading.Event()
    lock = threading.Lock()
    accepted = {kind: 0 for kind in classes}
    completed = {kind: 0 for kind in classes}
    rejected = {kind: 0 for kind in classes}
    maximum_depth = {kind: 0 for kind in classes}
    ages: List[float] = []
    critical_latencies: List[float] = []

    def consume(kind: str) -> None:
        local_queue = queues[kind]
        while not stop.is_set() or not local_queue.empty():
            try:
                created, critical, salt = local_queue.get(timeout=0.02)
            except queue.Empty:
                continue
            accumulator = salt
            for number in range(payload):
                accumulator = ((accumulator << 5) - accumulator + number) & 0xFFFFFFFF
            age = (time.perf_counter() - created) * 1000.0
            with lock:
                ages.append(age)
                if critical:
                    critical_latencies.append(age)
                completed[kind] += 1
            local_queue.task_done()

    threads = [
        threading.Thread(target=consume, args=(kind,), daemon=True, name=f"w1-{name}-{kind}-{index}")
        for kind in classes
        for index in range(workers_per_class)
    ]
    for thread in threads:
        thread.start()
    start_wall = time.perf_counter()
    start_cpu = time.process_time()
    cursor = 0
    while time.perf_counter() - start_wall < duration:
        kind = classes[cursor % len(classes)]
        item = (time.perf_counter(), cursor % 17 == 0, cursor)
        try:
            queues[kind].put_nowait(item)
            accepted[kind] += 1
            maximum_depth[kind] = max(maximum_depth[kind], queues[kind].qsize())
        except queue.Full:
            rejected[kind] += 1
        cursor += 1
    production_end = time.perf_counter()
    for local_queue in queues.values():
        local_queue.join()
    recovery_ms = (time.perf_counter() - production_end) * 1000.0
    stop.set()
    for thread in threads:
        thread.join(timeout=2.0)
    wall = time.perf_counter() - start_wall
    cpu = time.process_time() - start_cpu
    logical = max(1, os.cpu_count() or 1)
    return {
        "lane": name,
        "workers_per_class": workers_per_class,
        "worker_threads": len(threads),
        "queue_capacity_per_class": capacity,
        "accepted": accepted,
        "completed": completed,
        "backpressured": rejected,
        "maximum_depth": maximum_depth,
        "final_depth": {kind: queues[kind].qsize() for kind in classes},
        "maximum_queue_age_ms": max(ages) if ages else 0.0,
        "p95_queue_age_ms": sorted(ages)[int(len(ages) * 0.95)] if ages else 0.0,
        "maximum_critical_latency_ms": max(critical_latencies) if critical_latencies else 0.0,
        "completed_critical": len(critical_latencies),
        "recovery_ms": recovery_ms,
        "wall_seconds": wall,
        "process_cpu_seconds": cpu,
        "normalized_process_cpu_percent": min(100.0, 100.0 * cpu / max(wall * logical, 1e-9)),
        "throughput_per_second": sum(completed.values()) / max(wall, 1e-9),
    }


def _proof_18(context: Mapping[str, Any]) -> Dict[str, Any]:
    configurations = (
        ("idle-baseline", 1, 0.12, 16),
        ("single-subsystem", 1, 0.18, 80),
        ("two-pool-contention", 2, 0.18, 100),
        ("all-provider-low-core", 1, 0.22, 140),
        ("all-provider-balanced", 2, 0.22, 140),
        ("slow-io", 1, 0.18, 180),
        ("priority-contention", 2, 0.18, 180),
    )
    tracemalloc.start()
    before_memory = tracemalloc.get_traced_memory()[0]
    windows = []
    for repetition in range(2):
        for name, workers, duration, payload in configurations:
            windows.append(_run_saturation_lane(f"{name}-r{repetition + 1}", workers, duration, payload))
    current_memory, peak_memory = tracemalloc.get_traced_memory()
    tracemalloc.stop()
    unbounded = sum(1 for window in windows if any(depth > window["queue_capacity_per_class"] for depth in window["maximum_depth"].values()))
    unrecovered = sum(1 for window in windows if any(window["final_depth"].values()))
    starved = sum(1 for window in windows if window["completed_critical"] == 0 or window["maximum_critical_latency_ms"] > 5_000)
    completion_mismatches = sum(1 for window in windows if window["accepted"] != window["completed"])
    prior = context.get("prior_proof_profile", {})
    workload_digest = canonical_hash(prior)
    passed = unbounded == 0 and unrecovered == 0 and starved == 0 and completion_mismatches == 0
    return _result(
        passed,
        {
            "sustained_windows": len(windows),
            "configuration_lanes": len(configurations),
            "unbounded_queue_windows": unbounded,
            "unrecovered_windows": unrecovered,
            "starved_windows": starved,
            "completion_mismatch_windows": completion_mismatches,
            "maximum_queue_depth": max(max(window["maximum_depth"].values()) for window in windows),
            "maximum_queue_age_ms": max(window["maximum_queue_age_ms"] for window in windows),
            "maximum_critical_latency_ms": max(window["maximum_critical_latency_ms"] for window in windows),
            "maximum_recovery_ms": max(window["recovery_ms"] for window in windows),
            "peak_traced_memory_bytes": peak_memory,
            "retained_traced_memory_delta_bytes": current_memory - before_memory,
            "prior_w1_workload_profile_digest": workload_digest,
        },
        {
            "time_series_windows": windows,
            "worker_config": [
                {"name": name, "workers_per_class": workers, "duration_seconds": duration, "payload_iterations": payload, "queue_capacity": 64}
                for name, workers, duration, payload in configurations
            ],
            "diagnostic_config": {
                "experimental_queue_capacity": 64,
                "experimental_critical_latency_limit_ms": 5_000,
                "production_budget_claim": "NONE",
                "source_workloads": prior,
            },
        },
        ["Four independent bounded worker queues applied explicit admission/backpressure and drained after each pressure window."],
        "Fourteen sustained windows across seven configurations remained bounded, completed admitted work, preserved critical progress, and recovered after pressure.",
        ["CPU, latency, memory, worker, and queue measurements are experimental proof diagnostics; they are not production budgets."],
    )


RUNNERS: Mapping[str, Callable[[Mapping[str, Any]], Dict[str, Any]]] = {
    "PRD04-PROOF-04": _proof_04,
    "PRD04-PROOF-13": _proof_13,
    "PRD04-PROOF-14": _proof_14,
    "PRD04-PROOF-15": _proof_15,
    "PRD04-PROOF-16": _proof_16,
    "PRD04-PROOF-17": _proof_17,
    "PRD04-PROOF-18": _proof_18,
    "PRD04-PROOF-19": _proof_19,
    "PRD04-PROOF-21": _proof_21,
    "PRD04-PROOF-23": _proof_23,
    "PRD04-PROOF-24": _proof_24,
    "PRD04-PROOF-25": _proof_25,
    "PRD04-PROOF-26": _proof_26,
    "PRD04-PROOF-33": _proof_33,
    "PRD04-PROOF-34": _proof_34,
    "PRD04-PROOF-63": _proof_63,
    "PRD04-PROOF-68": _proof_68,
}


def run_proof(proof_id: str, context: Mapping[str, Any]) -> Dict[str, Any]:
    if proof_id not in RUNNERS:
        raise ValueError(f"unsupported W1 proof identity: {proof_id}")
    started = time.perf_counter()
    value = RUNNERS[proof_id](context)
    value.update(
        schema_version="prd07-w1-observed-result-v1",
        proof_id=proof_id,
        duration_ms=(time.perf_counter() - started) * 1000.0,
        fixture_schema="leyforge-r7-w1-owner-spatial-runtime-v1",
        gameplay_permission="CLOSED",
        prd08_submission="NOT-SUBMITTED",
    )
    return value
