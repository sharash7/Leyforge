"""FIXTURE-01 semantic identity, coordinate, projection and read-model core."""

from __future__ import annotations

import hashlib
import json
import random
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, Iterable, Mapping, Optional, Sequence, Tuple


NORMALIZATION_VERSION = "prd07-canonical-v1"
SEMANTIC_ID = re.compile(r"^[a-z][a-z0-9_.-]*:[a-z0-9][a-z0-9_.-]*$")


def _canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def _validate_json(value: Any, label: str) -> None:
    try:
        _canonical_json(value)
    except (TypeError, ValueError) as exc:
        raise ValueError("%s must be JSON serializable" % label) from exc


@dataclass(frozen=True, order=True)
class SemanticId:
    """Stable namespaced identity independent of runtime handles and names."""

    value: str

    def __post_init__(self) -> None:
        if not SEMANTIC_ID.fullmatch(self.value):
            raise ValueError("invalid semantic ID: %s" % self.value)

    def __str__(self) -> str:
        return self.value


@dataclass(frozen=True)
class CanonicalCoordinate:
    x: int
    y: int
    z: int
    domain: str = "world"

    def __post_init__(self) -> None:
        if not self.domain:
            raise ValueError("coordinate domain is required")
        if any(isinstance(value, bool) or not isinstance(value, int) for value in (self.x, self.y, self.z)):
            raise ValueError("canonical coordinates must be integers")

    def to_dict(self) -> Dict[str, Any]:
        return {"domain": self.domain, "x": self.x, "y": self.y, "z": self.z}


@dataclass(frozen=True)
class SpatialFrame:
    frame_id: SemanticId
    epoch: int
    origin: CanonicalCoordinate

    def __post_init__(self) -> None:
        if self.epoch < 0:
            raise ValueError("frame epoch cannot be negative")

    def to_active(self, canonical: CanonicalCoordinate) -> Tuple[int, int, int]:
        if canonical.domain != self.origin.domain:
            raise ValueError("coordinate domains do not match")
        return (
            canonical.x - self.origin.x,
            canonical.y - self.origin.y,
            canonical.z - self.origin.z,
        )

    def to_canonical(self, active: Sequence[int]) -> CanonicalCoordinate:
        if len(active) != 3 or any(isinstance(value, bool) or not isinstance(value, int) for value in active):
            raise ValueError("active coordinate must contain three integers")
        return CanonicalCoordinate(
            x=self.origin.x + active[0],
            y=self.origin.y + active[1],
            z=self.origin.z + active[2],
            domain=self.origin.domain,
        )

    def rebased(self, frame_id: SemanticId, origin: CanonicalCoordinate) -> "SpatialFrame":
        return SpatialFrame(frame_id=frame_id, epoch=self.epoch + 1, origin=origin)


@dataclass(frozen=True)
class WorldDefinition:
    world_id: SemanticId
    content_identity: str
    schema_identity: str

    def __post_init__(self) -> None:
        if not self.content_identity or not self.schema_identity:
            raise ValueError("content and schema identities are required")


@dataclass(frozen=True)
class WorldSession:
    session_id: SemanticId
    world_id: SemanticId
    frame: SpatialFrame
    owner_id: SemanticId
    revision: int = 0

    def __post_init__(self) -> None:
        if self.revision < 0:
            raise ValueError("session revision cannot be negative")


@dataclass(frozen=True)
class SemanticObject:
    semantic_id: SemanticId
    kind: str
    coordinate: CanonicalCoordinate
    owner_id: SemanticId
    revision: int
    state: Mapping[str, Any] = field(default_factory=dict)

    def __post_init__(self) -> None:
        if not self.kind:
            raise ValueError("semantic object kind is required")
        if self.revision < 0:
            raise ValueError("object revision cannot be negative")
        _validate_json(self.state, "semantic object state")

    def canonical_record(self) -> Dict[str, Any]:
        return {
            "id": str(self.semantic_id),
            "kind": self.kind,
            "coordinate": self.coordinate.to_dict(),
            "owner_id": str(self.owner_id),
            "revision": self.revision,
            "state": json.loads(_canonical_json(self.state)),
        }


@dataclass(frozen=True)
class RuntimeBindingTable:
    """Regenerable mapping whose numeric IDs are never durable authority."""

    seed: int
    semantic_to_runtime: Mapping[SemanticId, int]

    @classmethod
    def randomized(cls, semantic_ids: Iterable[SemanticId], seed: int) -> "RuntimeBindingTable":
        supplied = list(semantic_ids)
        if len(supplied) != len(set(supplied)):
            raise ValueError("runtime binding input contains duplicate semantic IDs")
        unique = sorted(supplied, key=str)
        runtime_ids = list(range(1, len(unique) + 1))
        random.Random(seed).shuffle(runtime_ids)
        return cls(seed=seed, semantic_to_runtime=dict(zip(unique, runtime_ids)))

    def project(self, semantic_id: SemanticId) -> int:
        try:
            return self.semantic_to_runtime[semantic_id]
        except KeyError as exc:
            raise KeyError("unbound semantic ID: %s" % semantic_id) from exc

    def resolve(self, runtime_id: int) -> SemanticId:
        for semantic_id, candidate in self.semantic_to_runtime.items():
            if candidate == runtime_id:
                return semantic_id
        raise KeyError("unbound runtime ID: %s" % runtime_id)

    def manifest(self) -> Dict[str, Any]:
        return {
            "seed": self.seed,
            "bindings": [
                {"semantic_id": str(key), "runtime_id": self.semantic_to_runtime[key]}
                for key in sorted(self.semantic_to_runtime, key=str)
            ],
        }


@dataclass(frozen=True)
class Projection:
    semantic_id: SemanticId
    runtime_id: int
    source_revision: int


class ProjectionStore:
    """Disposable runtime projections over separately owned semantic objects."""

    def __init__(self, objects: Mapping[SemanticId, SemanticObject], bindings: RuntimeBindingTable) -> None:
        self._objects = objects
        self._bindings = bindings
        self._projections: Dict[SemanticId, Projection] = {}

    def create(self, semantic_id: SemanticId) -> Projection:
        source = self._objects[semantic_id]
        projection = Projection(
            semantic_id=semantic_id,
            runtime_id=self._bindings.project(semantic_id),
            source_revision=source.revision,
        )
        self._projections[semantic_id] = projection
        return projection

    def destroy(self, semantic_id: SemanticId) -> None:
        self._projections.pop(semantic_id, None)

    def evict_all(self) -> None:
        self._projections.clear()

    def active(self) -> Tuple[Projection, ...]:
        return tuple(self._projections[key] for key in sorted(self._projections, key=str))


class ReadModel:
    """Disposable query projection rebuildable from canonical objects."""

    def __init__(self) -> None:
        self._records: Dict[str, Dict[str, Any]] = {}

    def clear(self) -> None:
        self._records.clear()

    def rebuild(self, objects: Mapping[SemanticId, SemanticObject]) -> None:
        self._records = {
            str(key): value.canonical_record()
            for key, value in sorted(objects.items(), key=lambda item: str(item[0]))
        }

    def query(self, kind: Optional[str] = None) -> Tuple[Dict[str, Any], ...]:
        records = [self._records[key] for key in sorted(self._records)]
        if kind is not None:
            records = [record for record in records if record["kind"] == kind]
        return tuple(records)

    def digest(self) -> str:
        return hashlib.sha256(_canonical_json(self.query()).encode("utf-8")).hexdigest()


@dataclass(frozen=True)
class SemanticFixture:
    definition: WorldDefinition
    session: WorldSession
    objects: Mapping[SemanticId, SemanticObject]
    seed: int
    configuration: Mapping[str, Any] = field(default_factory=dict)

    def __post_init__(self) -> None:
        if self.session.world_id != self.definition.world_id:
            raise ValueError("WorldSession must bind the fixture WorldDefinition")
        if len(self.objects) != len(set(self.objects)):
            raise ValueError("duplicate semantic object identity")
        for key, value in self.objects.items():
            if key != value.semantic_id:
                raise ValueError("object map key does not match semantic identity")
        _validate_json(self.configuration, "fixture configuration")

    def canonical_snapshot(self) -> Dict[str, Any]:
        return {
            "normalization_version": NORMALIZATION_VERSION,
            "world": {
                "world_id": str(self.definition.world_id),
                "content_identity": self.definition.content_identity,
                "schema_identity": self.definition.schema_identity,
            },
            "objects": [
                self.objects[key].canonical_record()
                for key in sorted(self.objects, key=str)
            ],
        }

    def canonical_hash(self) -> str:
        return hashlib.sha256(_canonical_json(self.canonical_snapshot()).encode("utf-8")).hexdigest()

    def save_record(self) -> Dict[str, Any]:
        return {
            "fixture_schema": "prd07-fixture-01-v1",
            "seed": self.seed,
            "configuration": json.loads(_canonical_json(self.configuration)),
            "canonical": self.canonical_snapshot(),
            "last_frame": {
                "frame_id": str(self.session.frame.frame_id),
                "epoch": self.session.frame.epoch,
                "origin": self.session.frame.origin.to_dict(),
            },
        }

    def save(self, path: Path) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(self.save_record(), indent=2, sort_keys=True) + "\n", encoding="utf-8")

    @classmethod
    def load(cls, path: Path, session_id: SemanticId, owner_id: SemanticId) -> "SemanticFixture":
        data = json.loads(path.read_text(encoding="utf-8"))
        if data.get("fixture_schema") != "prd07-fixture-01-v1":
            raise ValueError("unsupported fixture schema")
        canonical = data["canonical"]
        if canonical.get("normalization_version") != NORMALIZATION_VERSION:
            raise ValueError("unsupported canonical normalization version")
        world = canonical["world"]
        definition = WorldDefinition(
            world_id=SemanticId(world["world_id"]),
            content_identity=world["content_identity"],
            schema_identity=world["schema_identity"],
        )
        frame_data = data["last_frame"]
        origin = frame_data["origin"]
        frame = SpatialFrame(
            frame_id=SemanticId(frame_data["frame_id"]),
            epoch=int(frame_data["epoch"]),
            origin=CanonicalCoordinate(origin["x"], origin["y"], origin["z"], origin["domain"]),
        )
        objects: Dict[SemanticId, SemanticObject] = {}
        for record in canonical["objects"]:
            coordinate = record["coordinate"]
            semantic_id = SemanticId(record["id"])
            objects[semantic_id] = SemanticObject(
                semantic_id=semantic_id,
                kind=record["kind"],
                coordinate=CanonicalCoordinate(
                    coordinate["x"], coordinate["y"], coordinate["z"], coordinate["domain"]
                ),
                owner_id=SemanticId(record["owner_id"]),
                revision=int(record["revision"]),
                state=record["state"],
            )
        session = WorldSession(
            session_id=session_id,
            world_id=definition.world_id,
            frame=frame,
            owner_id=owner_id,
            revision=0,
        )
        return cls(
            definition=definition,
            session=session,
            objects=objects,
            seed=int(data["seed"]),
            configuration=data.get("configuration", {}),
        )
