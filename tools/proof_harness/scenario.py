"""Deterministic scenario, phase and fault-plan contracts."""

from __future__ import annotations

import random
from dataclasses import dataclass, field
from typing import Any, Dict, Mapping, Sequence, Tuple


FAULT_KINDS = frozenset({
    "async-delay",
    "async-reorder",
    "stale-completion",
    "network-impairment",
    "storage-impairment",
    "provider-failure",
    "process-termination",
})


@dataclass(frozen=True)
class FaultAction:
    phase: str
    kind: str
    parameters: Mapping[str, Any] = field(default_factory=dict)

    def __post_init__(self) -> None:
        if not self.phase:
            raise ValueError("fault phase is required")
        if self.kind not in FAULT_KINDS:
            raise ValueError("unsupported fault kind: %s" % self.kind)

    def to_dict(self) -> Dict[str, Any]:
        return {"phase": self.phase, "kind": self.kind, "parameters": dict(self.parameters)}


@dataclass(frozen=True)
class ScenarioSpec:
    scenario_id: str
    seed: int
    configuration: Mapping[str, Any]
    phases: Sequence[str]
    faults: Sequence[FaultAction] = field(default_factory=tuple)
    synthetic_fixture: bool = True

    def __post_init__(self) -> None:
        if not self.scenario_id:
            raise ValueError("scenario identity is required")
        if not self.phases or len(self.phases) != len(set(self.phases)):
            raise ValueError("scenario phases must be nonempty and unique")
        phase_set = set(self.phases)
        if any(fault.phase not in phase_set for fault in self.faults):
            raise ValueError("every fault must target a declared phase")

    def rng(self) -> random.Random:
        return random.Random(self.seed)

    def manifest(self) -> Dict[str, Any]:
        return {
            "scenario_id": self.scenario_id,
            "seed": self.seed,
            "configuration": dict(self.configuration),
            "phases": list(self.phases),
            "faults": [fault.to_dict() for fault in self.faults],
            "synthetic_fixture": self.synthetic_fixture,
        }
