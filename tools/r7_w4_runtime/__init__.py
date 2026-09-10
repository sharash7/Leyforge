"""R7 W4 readiness/admission tooling; deliberately contains no proof executor."""

from .authority import W4_PROOF_IDS
from .readiness import readiness_report

__all__ = ["W4_PROOF_IDS", "readiness_report"]
