# R7 W4 proof-only fixtures

This tree expands PRD-07 `FIXTURE-07` and `FIXTURE-08` for the W4 readiness/admission boundary. It is development-only test infrastructure. It does not define gameplay, activate production dependencies, create a production runtime, execute a PRD-04 proof, or allocate a PRD-07 RUN/EVID identity.

`fixture-07` contains governed editable source packages, trust/scale hostility inputs, missing-pack/upgrade inputs and the generated full FCC-13E expected ledger. `fixture-08` contains deterministic presentation, settings, accessibility, renderer and MAP-00 scenario inputs. `presentation_probe` is a minimal proof-only Godot readiness surface; its readiness mode reports fixture capability only and explicitly reports that proof execution has not started.

Every future identity in the readiness artifact is a non-durable `PREVIEW-NOT-ALLOCATED`. There is intentionally no W4 execution command in `tools.r7_w4_runtime`.
