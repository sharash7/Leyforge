"""Deterministic structured diagnostic events for proof-harness operations."""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Dict, Iterable, List, Mapping, Optional, Tuple


SEVERITIES = frozenset({"TRACE", "DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"})


@dataclass(frozen=True)
class DiagnosticEvent:
    """One machine-classifiable event with stable ownership and correlation."""

    event_id: str
    severity: str
    subsystem: str
    message: str
    correlation_id: str
    context: Mapping[str, Any] = field(default_factory=dict)
    causal_id: Optional[str] = None

    def __post_init__(self) -> None:
        if not self.event_id or not self.event_id.startswith("W0-"):
            raise ValueError("event_id must use the stable W0-* namespace")
        if self.severity not in SEVERITIES:
            raise ValueError("unsupported diagnostic severity: %s" % self.severity)
        if not self.subsystem or not self.correlation_id:
            raise ValueError("subsystem and correlation_id are required")

    def to_dict(self) -> Dict[str, Any]:
        result = {
            "event_id": self.event_id,
            "severity": self.severity,
            "subsystem": self.subsystem,
            "message": self.message,
            "correlation_id": self.correlation_id,
            "context": dict(self.context),
        }
        if self.causal_id is not None:
            result["causal_id"] = self.causal_id
        return result


class DiagnosticCollector:
    """Append-only in-memory event collector; it never owns domain state."""

    def __init__(self, correlation_id: str) -> None:
        if not correlation_id:
            raise ValueError("correlation_id is required")
        self.correlation_id = correlation_id
        self._events: List[DiagnosticEvent] = []

    def emit(
        self,
        event_id: str,
        severity: str,
        subsystem: str,
        message: str,
        context: Optional[Mapping[str, Any]] = None,
        causal_id: Optional[str] = None,
    ) -> DiagnosticEvent:
        event = DiagnosticEvent(
            event_id=event_id,
            severity=severity,
            subsystem=subsystem,
            message=message,
            correlation_id=self.correlation_id,
            context=dict(context or {}),
            causal_id=causal_id,
        )
        self._events.append(event)
        return event

    @property
    def events(self) -> Tuple[DiagnosticEvent, ...]:
        return tuple(self._events)

    def extend(self, events: Iterable[DiagnosticEvent]) -> None:
        for event in events:
            if event.correlation_id != self.correlation_id:
                raise ValueError("cannot mix diagnostic correlation identities")
            self._events.append(event)

    def to_records(self) -> List[Dict[str, Any]]:
        return [event.to_dict() for event in self._events]
