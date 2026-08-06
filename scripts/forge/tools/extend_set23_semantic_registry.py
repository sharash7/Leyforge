#!/usr/bin/env python3
"""Deterministically extend the shared Forge semantic registry for Set 23."""

from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
REGISTRY = ROOT / "data" / "forge" / "semantic_registry.json"
CONTRACT = "23-foundation-v1"


ROLE_ADDITIONS = {
    "anatomy_role": [
        ("anatomy.role.arthropod.core", "Arthropod Core", []),
        ("anatomy.role.arthropod.head", "Arthropod Head", []),
        ("anatomy.role.arthropod.leg.left.1", "Arthropod Leg Left 1", []),
        ("anatomy.role.arthropod.leg.left.2", "Arthropod Leg Left 2", []),
        ("anatomy.role.arthropod.leg.left.3", "Arthropod Leg Left 3", []),
        ("anatomy.role.arthropod.leg.left.4", "Arthropod Leg Left 4", []),
        ("anatomy.role.arthropod.leg.right.1", "Arthropod Leg Right 1", []),
        ("anatomy.role.arthropod.leg.right.2", "Arthropod Leg Right 2", []),
        ("anatomy.role.arthropod.leg.right.3", "Arthropod Leg Right 3", []),
        ("anatomy.role.arthropod.leg.right.4", "Arthropod Leg Right 4", []),
        ("anatomy.role.wisp.core", "Wisp Core", []),
    ],
    "anchor": [
        ("anchor.presentation.center", "Presentation Centre", ["spatial.anchor.presentation.center"]),
        ("anchor.audio.machine_body", "Machine Body Audio", ["spatial.anchor.machine.body"]),
        ("anchor.vfx.firebox", "Firebox VFX", ["spatial.anchor.machine.firebox"]),
        ("anchor.contact.primary", "Primary Contact", ["spatial.anchor.contact.primary"]),
        ("anchor.presentation.mana_origin", "Mana Origin", ["spatial.anchor.magic.mana_origin"]),
        ("anchor.presentation.warning", "Warning Origin", ["spatial.anchor.presentation.warning"]),
    ],
    "socket": [
        ("socket.presentation.hand.left", "Left Hand Presentation", ["spatial.socket.entity.hand_left"]),
        ("socket.presentation.hand.right", "Right Hand Presentation", ["spatial.socket.entity.hand_right"]),
        ("socket.presentation.foot.left", "Left Foot Presentation", ["spatial.socket.entity.foot_left"]),
        ("socket.presentation.foot.right", "Right Foot Presentation", ["spatial.socket.entity.foot_right"]),
        ("socket.presentation.mouth", "Mouth Presentation", ["spatial.socket.entity.mouth"]),
        ("socket.audio.voice", "Voice Origin", ["spatial.socket.entity.voice"]),
        ("socket.equipment.primary", "Primary Equipment", ["spatial.socket.entity.equipment_primary"]),
        ("socket.presentation.damage", "Damage Presentation", ["spatial.socket.entity.damage"]),
        ("socket.vfx.breath_origin", "Breath Origin", ["spatial.socket.creature.breath_origin"]),
        ("socket.vfx.chimney", "Chimney VFX", ["presentation.spatial.machine.furnace.chimney", "spatial.socket.machine.chimney"]),
    ],
    "region": [
        ("region.machine.hot_surface", "Machine Hot Surface", ["spatial.region.machine.hot_surface"]),
        ("region.machine.damage", "Machine Damage", ["spatial.region.machine.damage"]),
        ("region.presentation.roof_contact", "Roof Contact", ["spatial.region.structure.roof_contact"]),
        ("region.entity.body", "Entity Body", ["spatial.region.entity.body"]),
    ],
    "path": [
        ("path.vfx.mana_flow", "Mana Flow", ["spatial.path.magic.mana_flow"]),
        ("path.vfx.ward_boundary", "Ward Boundary", ["spatial.path.magic.ward_boundary"]),
        ("path.vfx.weapon_trail", "Weapon Trail", ["spatial.path.combat.weapon_trail"]),
    ],
    "mask": [
        ("mask.surface.rune_glow", "Rune Glow", ["surface.mask.rune_glow"]),
        ("mask.surface.chimney_opening", "Chimney Opening", ["surface.mask.machine.chimney_opening"]),
        ("mask.surface.wetness", "Wetness Surface", ["surface.mask.environment.wetness"]),
    ],
    "zone": [
        ("zone.audio.workshop_interior", "Workshop Interior", ["acoustic.zone.workshop_interior"]),
        ("zone.audio.exterior", "Exterior Audio", ["acoustic.zone.exterior"]),
        ("zone.weather.rain", "Rain Weather", ["spatial.zone.weather.rain"]),
        ("zone.weather.shelter", "Weather Shelter", ["spatial.zone.weather.shelter"]),
    ],
    "portal": [
        ("portal.audio.front_door", "Front Door Sound Portal", ["acoustic.portal.front_door"]),
    ],
    "runtime_anchor": [
        ("runtime_anchor.combat.impact", "Combat Impact", ["spatial.runtime_anchor.combat.impact"]),
        ("runtime_anchor.movement.foot_contact", "Foot Contact", ["spatial.runtime_anchor.movement.foot_contact"]),
        ("runtime_anchor.block.mining_impact", "Mining Impact", ["spatial.runtime_anchor.block.mining_impact"]),
        ("runtime_anchor.creature.telegraph", "Creature Telegraph", ["spatial.runtime_anchor.creature.telegraph"]),
        ("runtime_anchor.equipment.release", "Equipment Release", ["spatial.runtime_anchor.equipment.release"]),
    ],
    "capture_profile": [
        ("capture.profile.presentation.current_state", "Presentation Current State", []),
        ("capture.profile.presentation.contract_baseline", "Presentation Contract Baseline", []),
        ("capture.profile.presentation.performance_baseline", "Presentation Performance Baseline", []),
    ],
}


def main() -> None:
    root = json.loads(REGISTRY.read_text(encoding="utf-8"))
    root["feature_contract_versions"] = {
        "set22": root.get("contract_version", "22-foundation-v1"),
        "set23": CONTRACT,
    }
    families = root.setdefault("families", {})
    for family, additions in ROLE_ADDITIONS.items():
        records = families.setdefault(family, [])
        by_id = {record["id"]: record for record in records}
        for role_id, display_name, aliases in additions:
            by_id[role_id] = {
                "aliases": aliases,
                "contract_version": CONTRACT,
                "dependencies": [],
                "display_name": display_name,
                "id": role_id,
                "lifecycle": "foundation",
            }
        families[family] = [by_id[key] for key in sorted(by_id)]
    root["families"] = {key: families[key] for key in sorted(families)}
    REGISTRY.write_text(
        json.dumps(root, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
