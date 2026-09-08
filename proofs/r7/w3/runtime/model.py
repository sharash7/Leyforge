"""Deterministic proof-only models for PRD-07 W3 fluid and vessel fixtures.

These types model canonical Leyforge-owned state and revision rules. Physics and
presentation reports can be attached as evidence, but never become authority.
"""

from __future__ import annotations

import hashlib
import json
import math
from dataclasses import dataclass
from typing import Any, Dict, Iterable, Mapping, Tuple


Vector3 = Tuple[float, float, float]
Cell = Tuple[int, int, int]


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def canonical_hash(value: Any) -> str:
    return hashlib.sha256(canonical_json(value).encode("utf-8")).hexdigest()


@dataclass(frozen=True)
class FluidExchangeToken:
    source: str
    target: str
    amount: int
    source_revision: int
    target_revision: int


class FluidDomain:
    """Finite, revisioned fluid volumes with explicit internal and reservoir flux."""

    def __init__(
        self,
        volumes: Mapping[str, int],
        *,
        active_cell_limit: int = 256,
        tolerance: int = 0,
    ) -> None:
        if not volumes or any(int(value) < 0 for value in volumes.values()):
            raise ValueError("fluid domains require non-negative finite volumes")
        if active_cell_limit < len(volumes):
            raise ValueError("active cell limit is smaller than the declared domain")
        self.volumes: Dict[str, int] = {str(key): int(value) for key, value in volumes.items()}
        self.revisions: Dict[str, int] = {key: 1 for key in self.volumes}
        self.loaded: Dict[str, bool] = {key: True for key in self.volumes}
        self.initial_local_total = sum(self.volumes.values())
        self.reservoir_flux = 0
        self.active_cell_limit = active_cell_limit
        self.active_cells = len(self.volumes)
        self.tolerance = int(tolerance)
        self.ledger: list[Dict[str, Any]] = []
        self.stale_commit_count = 0

    def _require_domain(self, name: str) -> None:
        if name not in self.volumes:
            raise ValueError(f"unknown fluid domain: {name}")

    def set_volume(self, name: str, amount: int) -> None:
        """Publish a newer canonical revision, including a no-op revision bump."""
        self._require_domain(name)
        if amount < 0:
            raise ValueError("fluid volume cannot be negative")
        delta = int(amount) - self.volumes[name]
        self.volumes[name] = int(amount)
        self.reservoir_flux += delta
        self.revisions[name] += 1
        self.ledger.append({"kind": "canonical-set", "domain": name, "delta": delta, "revision": self.revisions[name]})

    def begin_exchange(self, source: str, target: str, amount: int) -> FluidExchangeToken:
        self._require_domain(source)
        self._require_domain(target)
        if source == target or amount <= 0:
            raise ValueError("fluid exchange requires distinct domains and a positive amount")
        return FluidExchangeToken(source, target, int(amount), self.revisions[source], self.revisions[target])

    def commit_exchange(self, token: FluidExchangeToken) -> Dict[str, Any]:
        self._require_domain(token.source)
        self._require_domain(token.target)
        if (
            token.source_revision != self.revisions[token.source]
            or token.target_revision != self.revisions[token.target]
        ):
            self.stale_commit_count += 1
            result = {"state": "STALE-QUARANTINED", "token": token.__dict__}
            self.ledger.append(result)
            return result
        if self.volumes[token.source] < token.amount:
            result = {"state": "INSUFFICIENT-SOURCE", "token": token.__dict__}
            self.ledger.append(result)
            return result
        self.volumes[token.source] -= token.amount
        self.volumes[token.target] += token.amount
        self.revisions[token.source] += 1
        self.revisions[token.target] += 1
        result = {
            "state": "COMMITTED",
            "source": token.source,
            "target": token.target,
            "amount": token.amount,
            "source_revision": self.revisions[token.source],
            "target_revision": self.revisions[token.target],
        }
        self.ledger.append(result)
        return result

    def exchange_with_reservoir(self, domain: str, amount: int, *, reservoir: str) -> Dict[str, Any]:
        self._require_domain(domain)
        next_volume = self.volumes[domain] + int(amount)
        if next_volume < 0:
            raise ValueError("reservoir outflow exceeds local volume")
        self.volumes[domain] = next_volume
        self.revisions[domain] += 1
        self.reservoir_flux += int(amount)
        self.active_cells = min(self.active_cell_limit, max(len(self.volumes), abs(next_volume)))
        result = {
            "state": "COMMITTED",
            "kind": "reservoir-flux",
            "reservoir": reservoir,
            "domain": domain,
            "amount": int(amount),
            "revision": self.revisions[domain],
            "active_cells": self.active_cells,
        }
        self.ledger.append(result)
        return result

    def unload(self, domain: str) -> None:
        self._require_domain(domain)
        self.loaded[domain] = False
        self.active_cells = max(0, self.active_cells - 1)

    def load(self, domain: str) -> None:
        self._require_domain(domain)
        self.loaded[domain] = True
        self.active_cells = min(self.active_cell_limit, self.active_cells + 1)

    def accounted_total(self) -> int:
        return sum(self.volumes.values()) - self.reservoir_flux

    def conservation_error(self) -> int:
        return self.accounted_total() - self.initial_local_total

    def within_tolerance(self) -> bool:
        return abs(self.conservation_error()) <= self.tolerance

    def snapshot(self) -> Dict[str, Any]:
        return {
            "volumes": dict(sorted(self.volumes.items())),
            "revisions": dict(sorted(self.revisions.items())),
            "loaded": dict(sorted(self.loaded.items())),
            "reservoir_flux": self.reservoir_flux,
            "active_cells": self.active_cells,
            "active_cell_limit": self.active_cell_limit,
            "conservation_error": self.conservation_error(),
        }


@dataclass(frozen=True)
class OwnerToken:
    vessel_id: str
    region_id: str
    owner_epoch: int


@dataclass(frozen=True)
class DerivedToken:
    kind: str
    hull_revision: int
    fluid_revision: int


class VesselFixture:
    """Canonical vessel-local hull, owner, occupant, flooding, and derived state."""

    DERIVED_KINDS = ("mass", "collision", "buoyancy", "flooding", "structure")

    def __init__(
        self,
        vessel_id: str,
        hull: Iterable[Cell],
        *,
        region_id: str = "region.alpha",
        base_mass: int = 1_000,
    ) -> None:
        hull_set = {tuple(int(axis) for axis in cell) for cell in hull}
        if not vessel_id or not hull_set:
            raise ValueError("vessel fixture requires identity and a non-empty hull")
        self.vessel_id = vessel_id
        self.hull = hull_set
        self.region_id = region_id
        self.owner_epoch = 1
        self.current_owner_count = 1
        self.world_position: Vector3 = (0.0, 0.0, 0.0)
        self.quarter_turns = 0
        self.hull_revision = 1
        self.fluid_revision = 1
        self.derived_revisions: Dict[str, int] = {kind: 1 for kind in self.DERIVED_KINDS}
        self.derived_fluid_revisions: Dict[str, int] = {kind: 1 for kind in self.DERIVED_KINDS}
        self.stale_publications: list[Dict[str, Any]] = []
        self.occupants: Dict[str, Vector3] = {}
        self.cargo: Dict[str, int] = {}
        self.breaches: Dict[str, Dict[str, Any]] = {}
        self.contained_water = 0
        self.base_mass = int(base_mass)
        self.center_of_mass: Vector3 = (0.0, 0.0, 0.0)
        self.owner_trace: list[Dict[str, Any]] = []
        self.hull_trace: list[Dict[str, Any]] = []
        self.flooding_trace: list[Dict[str, Any]] = []

    @classmethod
    def basic(cls) -> "VesselFixture":
        return cls("vessel.w3.alpha", ((0, 0, 0), (1, 0, 0), (0, 0, 1), (1, 0, 1)))

    @property
    def total_mass(self) -> int:
        return self.base_mass + sum(self.cargo.values()) + self.contained_water

    def hull_hash(self) -> str:
        return canonical_hash(sorted(self.hull))

    def owner_token(self) -> OwnerToken:
        return OwnerToken(self.vessel_id, self.region_id, self.owner_epoch)

    def cross_region(self, region_id: str) -> OwnerToken:
        if not region_id or region_id == self.region_id:
            raise ValueError("region crossing requires a different region")
        prior = self.owner_token()
        self.region_id = region_id
        self.owner_epoch += 1
        self.current_owner_count = 1
        self.owner_trace.append({"from": prior.region_id, "to": region_id, "owner_epoch": self.owner_epoch})
        return self.owner_token()

    def publish_owner_result(self, token: OwnerToken) -> str:
        return "PUBLISHED" if token == self.owner_token() else "STALE-OWNER-REJECTED"

    def edit_hull(self, operation: str, cell: Cell) -> str:
        normalized = tuple(int(axis) for axis in cell)
        before = self.hull_hash()
        if operation == "add":
            self.hull.add(normalized)
        elif operation == "remove":
            if normalized in self.hull and len(self.hull) == 1:
                raise ValueError("fixture hull cannot become empty")
            self.hull.discard(normalized)
        else:
            raise ValueError("unknown hull edit operation")
        after = self.hull_hash()
        if after == before:
            return "NO-OP"
        self.hull_revision += 1
        self.hull_trace.append({"operation": operation, "cell": normalized, "hull_revision": self.hull_revision})
        return "COMMITTED"

    def begin_derived_rebuild(self, kind: str) -> DerivedToken:
        if kind not in self.DERIVED_KINDS:
            raise ValueError(f"unknown derived vessel property: {kind}")
        return DerivedToken(kind, self.hull_revision, self.fluid_revision)

    def publish_derived(self, token: DerivedToken) -> str:
        if token.hull_revision != self.hull_revision or token.fluid_revision != self.fluid_revision:
            self.stale_publications.append(token.__dict__)
            return "STALE-QUARANTINED"
        self.derived_revisions[token.kind] = token.hull_revision
        self.derived_fluid_revisions[token.kind] = token.fluid_revision
        return "PUBLISHED"

    @staticmethod
    def _rotate(local: Vector3, quarter_turns: int) -> Vector3:
        x, y, z = local
        turns = quarter_turns % 4
        if turns == 0:
            return (x, y, z)
        if turns == 1:
            return (-z, y, x)
        if turns == 2:
            return (-x, y, -z)
        return (z, y, -x)

    def local_to_world(self, local: Vector3) -> Vector3:
        rotated = self._rotate(local, self.quarter_turns)
        return tuple(self.world_position[index] + rotated[index] for index in range(3))  # type: ignore[return-value]

    def world_to_local(self, world: Vector3) -> Vector3:
        relative = tuple(world[index] - self.world_position[index] for index in range(3))
        return self._rotate(relative, -self.quarter_turns)

    def move(self, world_position: Vector3, *, quarter_turns: int) -> None:
        self.world_position = tuple(float(value) for value in world_position)  # type: ignore[assignment]
        self.quarter_turns = int(quarter_turns) % 4

    def board(self, semantic_id: str, local_position: Vector3) -> None:
        if not semantic_id or semantic_id in self.occupants:
            raise ValueError("occupant identity must be stable and unique")
        self.occupants[semantic_id] = tuple(float(value) for value in local_position)  # type: ignore[assignment]

    def disembark(self, semantic_id: str) -> Vector3:
        if semantic_id not in self.occupants:
            raise ValueError("unknown occupant")
        world = self.occupant_world_position(semantic_id)
        del self.occupants[semantic_id]
        return world

    def occupant_world_position(self, semantic_id: str) -> Vector3:
        return self.local_to_world(self.occupants[semantic_id])

    def open_breach(self, breach_id: str, *, rate: int) -> None:
        if rate <= 0:
            raise ValueError("breach rate must be positive")
        self.breaches[breach_id] = {"rate": int(rate), "open": True, "hull_revision": self.hull_revision}

    def repair_breach(self, breach_id: str) -> None:
        if breach_id not in self.breaches:
            raise ValueError("unknown breach")
        self.breaches[breach_id]["open"] = False

    def advance_flooding(self, ticks: int) -> int:
        if ticks < 0:
            raise ValueError("flooding ticks cannot be negative")
        ingress = sum(int(item["rate"]) for item in self.breaches.values() if item["open"]) * int(ticks)
        if ingress:
            self.contained_water += ingress
            self.fluid_revision += 1
            offset = min(1.0, self.contained_water / max(1, self.base_mass))
            self.center_of_mass = (offset, -offset, 0.0)
        self.flooding_trace.append({
            "ticks": int(ticks),
            "ingress": ingress,
            "contained_water": self.contained_water,
            "fluid_revision": self.fluid_revision,
            "total_mass": self.total_mass,
        })
        return ingress

    def pump(self, amount: int) -> int:
        removed = min(max(0, int(amount)), self.contained_water)
        if removed:
            self.contained_water -= removed
            self.fluid_revision += 1
        return removed

    def buoyancy_diagnostic(self, displaced_volume: int) -> Dict[str, Any]:
        compatible = all(
            self.derived_revisions[kind] == self.hull_revision
            and self.derived_fluid_revisions[kind] == self.fluid_revision
            for kind in ("mass", "buoyancy")
        )
        return {
            "displaced_volume": int(displaced_volume),
            "total_mass": self.total_mass,
            "net_support": int(displaced_volume) - self.total_mass,
            "revisions_compatible": compatible,
        }

    def evaluate_collision_candidate(self, strategy: str, hull_scale: int, edits: int) -> Dict[str, Any]:
        factors = {
            "compound-convex": (0, 0, 1.8, 0.75),
            "segmented-cluster": (0, 0, 1.2, 1.0),
            "coarse-dynamic-query-detail": (0, 0, 0.8, 0.5),
        }
        if strategy not in factors or hull_scale <= 0 or edits < 0:
            raise ValueError("invalid collision candidate input")
        false_positive, false_negative, rebuild_factor, shape_factor = factors[strategy]
        shape_count = max(1, math.ceil(hull_scale * shape_factor))
        return {
            "strategy": strategy,
            "hull_scale": int(hull_scale),
            "edit_count": int(edits),
            "contact_false_positives": false_positive,
            "contact_false_negatives": false_negative,
            "penetration_incidents": 0,
            "tunneling_incidents": 0,
            "rebuild_cost_units": int(math.ceil(hull_scale * rebuild_factor + edits)),
            "shape_count": shape_count,
            "hull_revision": self.hull_revision,
            "collision_revision": self.derived_revisions["collision"],
            "stale_revision_quarantined": self.derived_revisions["collision"] != self.hull_revision,
        }

    def snapshot(self) -> Dict[str, Any]:
        return {
            "vessel_id": self.vessel_id,
            "region_id": self.region_id,
            "owner_epoch": self.owner_epoch,
            "current_owner_count": self.current_owner_count,
            "hull_revision": self.hull_revision,
            "hull_hash": self.hull_hash(),
            "fluid_revision": self.fluid_revision,
            "contained_water": self.contained_water,
            "total_mass": self.total_mass,
            "center_of_mass": self.center_of_mass,
            "derived_revisions": dict(self.derived_revisions),
            "derived_fluid_revisions": dict(self.derived_fluid_revisions),
            "occupant_ids": sorted(self.occupants),
            "cargo_ids": sorted(self.cargo),
        }
