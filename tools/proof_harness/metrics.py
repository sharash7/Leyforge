"""Explicitly diagnostic metrics; samples never become domain authority."""

from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple


@dataclass(frozen=True)
class MetricSample:
    metric_id: str
    unit: str
    value: float
    phase: str

    def __post_init__(self) -> None:
        if not self.metric_id or not self.unit or not self.phase:
            raise ValueError("metric identity, unit and phase are required")

    def to_dict(self) -> Dict[str, object]:
        return {
            "metric_id": self.metric_id,
            "unit": self.unit,
            "value": self.value,
            "phase": self.phase,
        }


class MetricsCollector:
    def __init__(self) -> None:
        self._samples: List[MetricSample] = []

    def record(self, metric_id: str, unit: str, value: float, phase: str) -> MetricSample:
        sample = MetricSample(metric_id=metric_id, unit=unit, value=float(value), phase=phase)
        self._samples.append(sample)
        return sample

    @property
    def samples(self) -> Tuple[MetricSample, ...]:
        return tuple(self._samples)

    def summary(self, metric_id: str) -> Optional[Dict[str, float]]:
        values = [sample.value for sample in self._samples if sample.metric_id == metric_id]
        if not values:
            return None
        ordered = sorted(values)
        return {
            "count": float(len(values)),
            "min": ordered[0],
            "max": ordered[-1],
            "mean": sum(values) / len(values),
        }
