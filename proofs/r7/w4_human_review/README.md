# W4 Governed Human Review Package

These records prepare, but do not perform, the human-judgement portions of
PRD04-PROOF-50, PRD04-PROOF-51, and PRD04-PROOF-53. Every shipped form is
`PENDING-HUMAN-REVIEW`, unsigned, allocation-free, and is not proof evidence.

## Common binding and completion law

At the start of a separately authorized future proof run, copy the applicable
pending form into that run's allocated evidence workspace. Bind it to the exact
40-character source revision, 64-character build identity, and every governed
fixture hash used by the observation. Record only a pseudonymous reviewer ID and
auditable role ID; do not collect unrelated personal data.

The reviewer must record an observation and evidence reference for every
criterion, list defects or ambiguity, select `PASS-OBSERVED`, `FAIL-OBSERVED`,
or `INCONCLUSIVE` where the canonical proof requires it, and sign the
attestation with a governed UTC timestamp. Automated output may be evidence for
the reviewer but cannot sign or supply the human judgement.

Run `review_issues` from `tools.r7_w4_repair.human_review` before accepting a
completed record. The validator rejects incomplete identity, criteria,
reviewer, evidence, judgement, and attestation fields.

## Proof 50 — art-production handoff

Use one bound copy per reviewed asset class/source package. Review the editable
source, validation/bake trace, runtime capture, provenance, canonical binding,
manual exceptions, and visible defects. A successful automated launch is not a
human handoff judgement.

## Proof 51 — masked AI/human parity

An adjudicator who is not the masked reviewer creates the pairing and retains
the origin map separately using `proof-51-origin-mapping-pending.json`. The
reviewer sees only `SOURCE-A` and `SOURCE-B`, receives the same task, evidence
shape, and canonical criteria for both, and must not be told which is expected
to be better. The reviewer signs before unmasking. The separate adjudicator then
records that unmasking occurred after attestation and reconciles the comparison;
automation cannot perform either human role.

## Proof 53 — renderer/profile certification

Complete every applicable Forward+, Mobile, and Compatibility lane. Bind each
lane to its exact runtime capture and diagnostics, assess readability,
presentation integrity, and task usability, and record lane defects. Keep
`support_claim` as `NOT-MADE` until the whole canonical lane contract—including
human review—is complete.
