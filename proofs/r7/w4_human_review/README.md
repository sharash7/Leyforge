# W4 Governed Human Review Package

These records prepare, but do not perform, the human-judgement portions of
PRD04-PROOF-50, PRD04-PROOF-51, and PRD04-PROOF-53. Every shipped form is
`PENDING-HUMAN-REVIEW`, unsigned, allocation-free, and is not proof evidence.

## Common binding and completion law

For a separately authorized future proof run, the execution route reads only
the exact governed file named for the entered proof in this directory. Bind it
to the exact 40-character source revision, build identity, artifact hash,
canonical fixture identities, and captured execution environment. A file's
presence or `COMPLETE` label is never sufficient. Record only a pseudonymous
reviewer ID and auditable role ID; do not collect unrelated personal data.

The reviewer must record an observation and evidence reference for every
criterion, list defects or ambiguity, select `PASS-OBSERVED`, `FAIL-OBSERVED`,
or `INCONCLUSIVE` where the canonical proof requires it, and sign the
attestation with a governed UTC timestamp. Automated output may be evidence for
the reviewer but cannot sign or supply the human judgement.

Run `review_issues` from `tools.r7_w4_repair.human_review` before accepting a
completed record. Execution then independently revalidates the record, all
referenced files and hashes, and its source/build/fixture/environment binding.
The validator rejects incomplete identity, proof-specific coverage, criteria,
reviewer, evidence, judgement derivation, and attestation fields.

Synthetic validator fixtures must use `SYNTHETIC-VALIDATOR-TEST` and
`SYNTHETIC-TEST-ONLY`. They may test the completion law outside this directory,
but production ingestion always rejects them. Automation and Codex may not use
the production-human purpose or impersonate either human role.

## Owner-facing presentation route

Do not open either source-only `presentation_probe` directory as the review
application. The FIXTURE-08 readiness project only emits a non-executing
self-report, while the execution probe is source material for an exact exported
artifact. Opening either project in an editor does not establish a source,
build, artifact, environment, evidence, or review-lifecycle binding.

For a separately authorized future review, first build the exact published
source with the pinned Godot driver and export template. Prepare a presentation
context with `tools.r7_w4_repair.review_presentation.build_context`; this binds
the exact source revision, probe-source identity, build identity, artifact hash,
fixture identities, captured environment, renderer argument, and every evidence
file and hash. Run its non-interactive `preflight` command in an isolated
profile before presenting anything to the reviewer. The route refuses missing,
changed, unmasked, pre-answered, or execution-shaped material.

After publication, exact-SHA CI, a successful exact-build preflight, lawful
future proof binding, and fresh human-review authorization, the `present`
command opens the bound artifact and supplies the context. It displays the
canonical prompts and lets the reviewer enter responses without editing these
JSON files. The application can save only an unsigned
`DRAFT-UNSIGNED-NOT-PROOF-EVIDENCE` file at the expressly supplied output path;
it never edits these governed forms, derives an overall judgement, signs an
attestation, creates proof evidence, or allocates identity. A later governed
human-controlled completion step must still bind references, derive the
canonical result, attest it, and, for proof 51, complete separate adjudication.

The failed 2026-09-13 source-project load is a review-environment precondition
defect only. It supplies no human observation or partial judgement, and all
forms in this directory remain pending and unsigned.

## Proof 50 — art-production handoff

Complete every exact required asset-class row and its bound source identities.
For every class, review the editable source, validation/bake trace, runtime
capture, provenance, canonical binding, manual exceptions, and visible defects.
A successful automated launch is not a human handoff judgement.

## Proof 51 — masked AI/human parity

An adjudicator who is not the masked reviewer creates the pairing and retains
the origin map separately using `proof-51-origin-mapping-pending.json`. The
reviewer sees only `SOURCE-A` and `SOURCE-B`, receives the same task, evidence
shape, and canonical criteria for both, and must not be told which is expected
to be better. The reviewer signs before unmasking. The separate adjudicator then
records an independently signed exact origin map, proves that unmasking occurred
after reviewer attestation, and reconciles every paired task. Automation cannot
perform either human role.

## Proof 53 — renderer/profile certification

Complete every required Forward+, Mobile, and Compatibility lane. Bind each lane
to its exact renderer argument, runtime capture, diagnostics, build and captured
environment; assess readability, presentation integrity, and task usability;
and record lane defects. Each lane must explicitly state whether support is
claimed, claimed with an approved fallback, rejected, or undetermined. The
overall judgement is derived from those lane dispositions and judgements.
