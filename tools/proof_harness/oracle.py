"""Canonical-state and invariant comparison helpers."""

from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, Mapping, Sequence, Tuple

from .identity import SemanticFixture


@dataclass(frozen=True)
class OracleResult:
    passed: bool
    invariant_id: str
    expected: Any
    observed: Any

    def to_dict(self) -> Dict[str, Any]:
        return {
            "passed": self.passed,
            "invariant_id": self.invariant_id,
            "expected": self.expected,
            "observed": self.observed,
        }


def compare_canonical_hashes(before: SemanticFixture, after: SemanticFixture) -> OracleResult:
    expected = before.canonical_hash()
    observed = after.canonical_hash()
    return OracleResult(
        passed=expected == observed,
        invariant_id="W0-INVARIANT-CANONICAL-HASH",
        expected=expected,
        observed=observed,
    )


def compare_result_sets(
    expected: Sequence[Mapping[str, Any]], observed: Sequence[Mapping[str, Any]]
) -> OracleResult:
    expected_rows: Tuple[Dict[str, Any], ...] = tuple(dict(row) for row in expected)
    observed_rows: Tuple[Dict[str, Any], ...] = tuple(dict(row) for row in observed)
    return OracleResult(
        passed=expected_rows == observed_rows,
        invariant_id="W0-INVARIANT-READ-MODEL",
        expected=expected_rows,
        observed=observed_rows,
    )
