# R7 PRD-07 proof harness

`tools/proof_harness/` is development-only infrastructure for governed proof execution. It implements the reusable W0 contracts selected by PRD-07 sections 121–124 and 164–165 without creating a game runtime or claiming that a proof has run.

## Boundary

The package owns harness orchestration contracts, synthetic fixtures, exact manifests, external-process control, structured diagnostics, read-only architecture lint, run-state enforcement and evidence-pack validation. It owns no canonical game state. It does not import archived POC code, activate Godot/Zylann, create `project.godot`, or authorize gameplay.

Synthetic fixtures validate the harness itself and are always ineligible for `PRD07-EVID-*`. A real smoke lane becomes evidence-eligible only after all of these are true:

- its proof is READY under the W0 prerequisite manifest;
- the run is an actual governed execution with a newly allocated `PRD07-RUN-*` identity;
- the client or headless/dedicated artifact is a real export whose bytes match its manifest;
- exact source, dependency, provider, role, profile, precision, platform, content and schema identities are present;
- the runtime self-report matches the composite build identity; and
- a complete retained evidence pack validates.

## Public surfaces

- `build.py`: non-destructive clean export control into an absent or empty output directory.
- `identity.py`: FIXTURE-01 semantic/world/session/frame identity, runtime binding, projection, read-model and save/reload controls.
- `manifests.py`: FIXTURE-09 build/dependency/artifact identity and integrity.
- `process.py`: shell-free external process and smoke-lane execution.
- `scenario.py`: deterministic seed/config/phase/fault plans.
- `diagnostics.py` and `metrics.py`: structured diagnostic capture.
- `architecture.py`: machine-readable, read-only dependency lint.
- `state.py`: PRD-07 state-machine enforcement.
- `evidence.py`: append-only evidence-pack validation and retention.
- `readiness.py`: current W0 prerequisite disposition.

Use `python -m tools.proof_harness self-check` for a bootstrap contract check. This command allocates no proof-run or proof-evidence IDs and writes no evidence pack.
