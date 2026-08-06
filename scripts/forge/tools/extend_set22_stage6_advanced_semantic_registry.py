#!/usr/bin/env python3
"""Deterministically register Set 22 advanced-body semantic roles."""

from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
REGISTRY = ROOT / "data" / "forge" / "semantic_registry.json"
CONTRACT = "22-stage6-candidate-v1"


ROLES = {
    "entity_role": [
        ("entity_role.bird", "Bird"),
        ("entity_role.centipede", "Giant Centipede"),
        ("entity_role.dragon", "Dragon Technical Test"),
    ],
    "anatomy_role": [
        ("anatomy.role.avian.core", "Avian Core"),
        ("anatomy.role.avian.head", "Avian Head"),
        ("anatomy.role.avian.beak", "Avian Beak"),
        ("anatomy.role.avian.wing.left", "Avian Wing Left"),
        ("anatomy.role.avian.wing.right", "Avian Wing Right"),
        ("anatomy.role.avian.leg.left", "Avian Leg Left"),
        ("anatomy.role.avian.leg.right", "Avian Leg Right"),
        ("anatomy.role.avian.tail", "Avian Tail"),
        ("anatomy.role.centipede.core", "Centipede Core"),
        ("anatomy.role.centipede.head", "Centipede Head"),
        ("anatomy.role.centipede.segment.001", "Centipede Segment 001"),
        ("anatomy.role.centipede.segment.002", "Centipede Segment 002"),
        ("anatomy.role.centipede.segment.003", "Centipede Segment 003"),
        ("anatomy.role.centipede.segment.004", "Centipede Segment 004"),
        ("anatomy.role.centipede.segment.005", "Centipede Segment 005"),
        ("anatomy.role.centipede.segment.006", "Centipede Segment 006"),
        ("anatomy.role.centipede.tail", "Centipede Tail"),
        ("anatomy.role.dragon.torso", "Dragon Torso"),
        ("anatomy.role.dragon.head", "Dragon Head"),
        ("anatomy.role.dragon.neck.01", "Dragon Neck 01"),
        ("anatomy.role.dragon.neck.02", "Dragon Neck 02"),
        ("anatomy.role.dragon.wing.left", "Dragon Wing Left"),
        ("anatomy.role.dragon.wing.right", "Dragon Wing Right"),
        ("anatomy.role.dragon.leg.front_left", "Dragon Leg Front Left"),
        ("anatomy.role.dragon.leg.front_right", "Dragon Leg Front Right"),
        ("anatomy.role.dragon.leg.rear_left", "Dragon Leg Rear Left"),
        ("anatomy.role.dragon.leg.rear_right", "Dragon Leg Rear Right"),
        ("anatomy.role.dragon.tail.01", "Dragon Tail 01"),
        ("anatomy.role.dragon.tail.02", "Dragon Tail 02"),
    ],
}


def main() -> None:
    root = json.loads(REGISTRY.read_text(encoding="utf-8"))
    families = root.setdefault("families", {})
    for family, additions in ROLES.items():
        records = families.setdefault(family, [])
        by_id = {record["id"]: record for record in records}
        for role_id, display_name in additions:
            by_id.setdefault(role_id, {
                "aliases": [],
                "contract_version": CONTRACT,
                "dependencies": [],
                "display_name": display_name,
                "id": role_id,
                "lifecycle": "runtime_candidate",
            })
        families[family] = [by_id[key] for key in sorted(by_id)]
    root.setdefault("feature_contract_versions", {})[
        "set22_stage6_advanced_bodies"
    ] = CONTRACT
    root["families"] = {key: families[key] for key in sorted(families)}
    REGISTRY.write_text(
        json.dumps(root, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
