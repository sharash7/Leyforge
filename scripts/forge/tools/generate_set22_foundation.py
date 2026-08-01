"""Generate Set 22 Stage 0 semantic, migration and evidence artefacts."""

from __future__ import annotations

import hashlib
import html
import json
import re
from pathlib import Path
from typing import Any, Optional


ROOT = Path(__file__).resolve().parents[3]
SETTLEMENT = ROOT / "data" / "settlement"
SEMANTIC_PATH = ROOT / "data" / "forge" / "semantic_registry.json"
MIGRATION_ROOT = ROOT / "content" / "forge" / "migration"
ARTIFACT_ROOT = ROOT / ".summer" / "verification" / "artifacts" / "set22_stage0"
CONTRACT_VERSION = "22-foundation-v1"


def read_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8-sig") as handle:
        return json.load(handle)


def write_json(path: Path, value: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="\n") as handle:
        json.dump(value, handle, indent=2, ensure_ascii=False, sort_keys=True)
        handle.write("\n")


def stable_hash(value: Any) -> str:
    encoded = json.dumps(
        value, ensure_ascii=False, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


def file_hash(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def slug(value: str) -> str:
    result = re.sub(r"[^a-z0-9]+", "_", value.lower()).strip("_")
    return result or "unnamed"


def role_record(role_id: str, display_name: str,
                aliases: Optional[list[str]] = None,
                dependencies: Optional[list[str]] = None) -> dict[str, Any]:
    return {
        "id": role_id,
        "display_name": display_name,
        "aliases": sorted(set(aliases or [])),
        "dependencies": sorted(set(dependencies or [])),
        "lifecycle": "foundation",
        "contract_version": CONTRACT_VERSION,
    }


def semantic_registry(blueprints: list[dict[str, Any]],
                      behaviors: list[dict[str, Any]],
                      definitions: list[dict[str, Any]]) -> dict[str, Any]:
    raw_families: dict[str, set[str]] = {
        "marker": set(),
        "socket": set(),
        "network": set(),
        "material_role": set(),
    }
    for blueprint in blueprints:
        raw_families["marker"].update(blueprint.get("required_marker_types", []))
        raw_families["marker"].update(
            marker.get("type", "") for marker in blueprint.get("markers", [])
        )
        raw_families["socket"].update(blueprint.get("sockets", []))
        raw_families["material_role"].update(blueprint.get("palette", {}).keys())
    for behavior in behaviors:
        raw_families["network"].update(behavior.get("network_roles", []))
    for definition in definitions:
        raw_families["network"].update(definition.get("utility_requirements", []))
    for values in raw_families.values():
        values.discard("")

    alias_owners: dict[str, int] = {}
    for values in raw_families.values():
        for value in values:
            alias_owners[value] = alias_owners.get(value, 0) + 1

    prefix = {
        "marker": "marker.role.",
        "socket": "socket.role.",
        "network": "network.role.",
        "material_role": "material_role.",
    }
    families: dict[str, list[dict[str, Any]]] = {}
    for family, values in raw_families.items():
        records = []
        for value in sorted(values):
            aliases = [value] if alias_owners[value] == 1 else []
            aliases.append(f"legacy.{family}.{slug(value)}")
            records.append(role_record(
                f"{prefix[family]}{slug(value)}",
                value.replace("_", " ").title(),
                aliases,
            ))
        families[family] = records

    families["zone"] = [
        role_record("zone.role.interior", "Interior"),
        role_record("zone.role.work", "Work Zone"),
        role_record("zone.role.clearance", "Clearance Zone"),
        role_record("zone.role.navigation", "Navigation Zone"),
        role_record("zone.role.placement", "Placement Zone"),
    ]
    entity_roles = [
        "player", "npc", "elder", "builder", "farmer", "guard", "merchant",
        "mage", "miner", "lumberjack", "goblin", "pig", "spider", "wisp",
    ]
    families["entity_role"] = [
        role_record(f"entity_role.{name}", name.replace("_", " ").title())
        for name in entity_roles
    ]
    documented_material_roles = [
        "foundation_material", "wall_primary", "wall_secondary",
        "frame_material", "floor_material", "roof_material",
        "trim_material", "door_material", "window_material",
        "metal_fittings", "magic_accent",
    ]
    material_ids = {record["id"] for record in families["material_role"]}
    for name in documented_material_roles:
        role_id = f"material_role.{name}"
        if role_id not in material_ids:
            families["material_role"].append(role_record(
                role_id, name.replace("_", " ").title()
            ))
    families["material_role"].sort(key=lambda record: record["id"])
    anatomy_roles = [
        "humanoid.pelvis", "humanoid.torso", "humanoid.head",
        "humanoid.arm.left", "humanoid.arm.right",
        "humanoid.hand.left", "humanoid.hand.right",
        "humanoid.leg.left", "humanoid.leg.right",
        "humanoid.foot.left", "humanoid.foot.right",
        "quadruped.torso", "quadruped.head", "quadruped.snout",
        "quadruped.ear.left", "quadruped.ear.right",
        "quadruped.leg.front_left", "quadruped.leg.front_right",
        "quadruped.leg.rear_left", "quadruped.leg.rear_right",
        "quadruped.tail",
    ]
    families["anatomy_role"] = [
        role_record(
            f"anatomy.role.{name}", name.replace(".", " ").title()
        )
        for name in anatomy_roles
    ]
    families["capture_profile"] = [
        role_record("capture.profile.entity.current_state", "Entity Current State"),
        role_record("capture.profile.blueprint.current_state", "Blueprint Current State"),
        role_record("capture.profile.contract.baseline", "Contract Baseline"),
    ]
    return {
        "schema": "leyforge.forge.semantic-registry",
        "schema_version": 1,
        "contract_version": CONTRACT_VERSION,
        "lifecycle": "foundation",
        "families": families,
    }


def migration_record(subject_type: str, target_id: str, display_name: str,
                     priority: str, classification: str, source_paths: list[str],
                     fallback: str, aliases: Optional[list[str]] = None,
                     related_ids: Optional[list[str]] = None) -> dict[str, Any]:
    new_work = classification == "new_work"
    return {
        "schema_version": 2,
        "subject_type": subject_type,
        "target_id": target_id,
        "display_name": display_name,
        "aliases": sorted(set(aliases or [])),
        "lifecycle": "new_work" if new_work else "active_fallback",
        "contract_version": CONTRACT_VERSION,
        "dependency_information": {
            "source_paths": sorted(source_paths),
            "related_ids": sorted(set(related_ids or [])),
        },
        "replacement_strategy": (
            "author_new_source_keep_fallback" if new_work
            else "replace_only_after_approved_equivalence"
        ),
        "fallback": fallback,
        "fallback_active": bool(fallback),
        "removal_gate": (
            "not_applicable_new_work" if not fallback
            else "approved_replacement_contract_tests_visual_review_and_save_compatibility"
        ),
        "review_history": [{
            "event": "stage0_inventory",
            "result": "new_work" if new_work else "legacy_fallback_retained",
            "evidence": "Set 22L Stage 0 current-state audit",
        }],
        "classification": classification,
        "priority": priority,
        "status": "not_started" if new_work else "inventoried",
        "visually_complete": False,
        "shippable": False,
        "forge_baked": False,
    }


def entity_inventory() -> dict[str, Any]:
    humanoid_source = [
        "res://scripts/visual/humanoid_visual.gd",
        "res://scripts/player/player.gd",
    ]
    npc_source = [
        "res://scripts/visual/humanoid_visual.gd",
        "res://scripts/world/hamlet_npc_actor.gd",
        "res://scripts/autoload/hamlet_state.gd",
    ]
    records = [
        migration_record(
            "entity", "entity.definition.player.humanoid", "Player Humanoid",
            "p0", "legacy_fallback_inventory", humanoid_source,
            "legacy.runtime.player_humanoid",
        ),
        migration_record(
            "entity", "entity.definition.npc.humanoid", "NPC Humanoid",
            "p0", "legacy_fallback_inventory", npc_source,
            "legacy.runtime.npc_humanoid",
        ),
    ]
    for profession in [
        "elder", "builder", "farmer", "guard", "merchant", "mage", "miner",
        "lumberjack",
    ]:
        records.append(migration_record(
            "entity", f"entity.definition.profession.{profession}",
            f"{profession.title()} Villager", "p1", "legacy_fallback_inventory",
            npc_source, "legacy.runtime.npc_humanoid",
            related_ids=["entity.definition.npc.humanoid"],
        ))
    records.append(migration_record(
        "entity", "entity.definition.family.goblin", "Goblin Raider Family",
        "p0", "legacy_fallback_inventory", [
            "res://scripts/visual/humanoid_visual.gd",
            "res://scripts/world/goblin_actor.gd",
            "res://scripts/world/ambient_goblin_actor.gd",
        ], "legacy.runtime.goblin_humanoid",
    ))
    for creature in ["pig", "spider", "wisp"]:
        records.append(migration_record(
            "entity", f"entity.definition.creature.{creature}", creature.title(),
            "p1", "new_work", [], "",
        ))
    records.sort(key=lambda record: record["target_id"])
    return {
        "schema": "leyforge.forge.migration-inventory",
        "schema_version": 2,
        "subject_type": "entity",
        "contract_version": CONTRACT_VERSION,
        "record_count": len(records),
        "records": records,
    }


def blueprint_inventory(blueprints: list[dict[str, Any]],
                        definitions_by_id: dict[str, dict[str, Any]]) -> dict[str, Any]:
    target_by_definition = {
        "building.residential.small_cottage": ("cottage", "p0"),
        "building.storage.village_warehouse": ("warehouse", "p0"),
        "building.crafting.carpenter_workshop": ("workshop", "p1"),
        "building.safety.wooden_watchtower": ("watchtower", "p0"),
        "project.transport.stone_road_bridge_set": ("bridge", "p1"),
    }
    records = []
    for blueprint in blueprints:
        definition_id = (blueprint.get("definition_ids")
                         or blueprint.get("building_ids") or [""])[0]
        definition = definitions_by_id.get(definition_id, {})
        target = target_by_definition.get(definition_id)
        fallback = blueprint.get("fallback", {}).get("legacy_id", "")
        record = migration_record(
            "blueprint", blueprint["id"], blueprint.get("display_name", blueprint["id"]),
            target[1] if target else "deferred", "legacy_fallback_inventory",
            ["res://data/settlement/settlement_blueprints.json"], fallback,
            aliases=blueprint.get("aliases", []), related_ids=[definition_id],
        )
        record["catalogue_no"] = int(definition.get("catalogue_no", 0))
        record["set22_target"] = target[0] if target else ""
        records.append(record)

    extra_targets = [
        ("blueprint.leyforge.worldgen.goblin_camp_a", "Goblin Camp", "goblin_camp",
         "legacy.runtime.world_stamp.goblin_camp", ["res://scripts/world/voxel_world.gd"]),
        ("blueprint.leyforge.worldgen.rune_ruin_a", "Rune Ruin", "rune_ruin",
         "legacy.runtime.world_stamp.rune_ruin", ["res://scripts/world/voxel_world.gd"]),
        ("blueprint.module.road.forest_path_a", "Forest Road Module", "road_module",
         "blueprint.leyforge.transport.dirt_path_junction_set_a",
         ["res://data/settlement/settlement_blueprints.json"]),
        ("blueprint.module.farm.pen_basic_a", "Farm and Pen Module", "farm_pen_module",
         "blueprint.leyforge.food.basic_farm_plot_a",
         ["res://data/settlement/settlement_blueprints.json"]),
    ]
    for target_id, display_name, target, fallback, sources in extra_targets:
        record = migration_record(
            "blueprint", target_id, display_name, "p1", "new_work", sources,
            fallback,
        )
        record["catalogue_no"] = 0
        record["set22_target"] = target
        records.append(record)
    records.sort(key=lambda record: record["target_id"])
    return {
        "schema": "leyforge.forge.migration-inventory",
        "schema_version": 2,
        "subject_type": "blueprint",
        "contract_version": CONTRACT_VERSION,
        "record_count": len(records),
        "legacy_settlement_blueprint_count": len(blueprints),
        "records": records,
    }


def capture_sheet(subject: str, inventory: dict[str, Any]) -> dict[str, Any]:
    rows = []
    for record in inventory["records"]:
        rows.append({
            "target_id": record["target_id"],
            "display_name": record["display_name"],
            "classification": record["classification"],
            "priority": record["priority"],
            "fallback": record["fallback"],
            "source_paths": record["dependency_information"]["source_paths"],
            "record_hash": stable_hash(record),
        })
    return {
        "schema": "leyforge.forge.current-state-capture-sheet",
        "schema_version": 1,
        "subject_type": subject,
        "capture_profile_id": f"capture.profile.{subject}.current_state",
        "capture_mode": "deterministic_inventory_contact_sheet",
        "visual_approval": "open",
        "row_count": len(rows),
        "rows": rows,
    }


def write_svg(path: Path, title: str, sheet: dict[str, Any]) -> None:
    row_height = 22
    width = 1440
    height = 54 + row_height * len(sheet["rows"])
    lines = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}">',
        '<rect width="100%" height="100%" fill="#111820"/>',
        f'<text x="18" y="30" fill="#e7f2ef" font-family="monospace" '
        f'font-size="18">{html.escape(title)}</text>',
    ]
    for index, row in enumerate(sheet["rows"]):
        y = 50 + index * row_height
        fill = "#17242c" if index % 2 == 0 else "#142028"
        status = row["classification"]
        status_colour = "#e4bc66" if status == "new_work" else "#78c6a3"
        lines.append(f'<rect x="10" y="{y - 15}" width="1420" height="21" fill="{fill}"/>')
        lines.append(
            f'<text x="18" y="{y}" fill="#d4dce0" font-family="monospace" '
            f'font-size="12">{html.escape(row["target_id"])}</text>'
        )
        lines.append(
            f'<text x="760" y="{y}" fill="{status_colour}" font-family="monospace" '
            f'font-size="12">{html.escape(status)}</text>'
        )
        lines.append(
            f'<text x="930" y="{y}" fill="#9eb0b8" font-family="monospace" '
            f'font-size="12">{html.escape(row["fallback"] or "no legacy fallback")}</text>'
        )
    lines.append("</svg>")
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="\n") as handle:
        handle.write("\n".join(lines) + "\n")


def main() -> None:
    catalogue = read_json(SETTLEMENT / "settlement_catalogue.json")
    blueprint_root = read_json(SETTLEMENT / "settlement_blueprints.json")
    behavior_root = read_json(SETTLEMENT / "settlement_behaviors.json")
    definitions = catalogue["definitions"]
    blueprints = blueprint_root["blueprints"]
    semantics = semantic_registry(blueprints, behavior_root["behaviors"], definitions)
    entities = entity_inventory()
    blueprint_records = blueprint_inventory(
        blueprints, {record["id"]: record for record in definitions}
    )

    write_json(SEMANTIC_PATH, semantics)
    write_json(MIGRATION_ROOT / "entity_migration_inventory.json", entities)
    write_json(MIGRATION_ROOT / "blueprint_migration_inventory.json", blueprint_records)

    entity_sheet = capture_sheet("entity", entities)
    blueprint_sheet = capture_sheet("blueprint", blueprint_records)
    write_json(ARTIFACT_ROOT / "entity_current_state_capture_sheet.json", entity_sheet)
    write_json(ARTIFACT_ROOT / "blueprint_current_state_capture_sheet.json", blueprint_sheet)
    write_svg(ARTIFACT_ROOT / "entity_current_state_capture_sheet.svg",
              "Set 22 Stage 0 - Entity Current State", entity_sheet)
    write_svg(ARTIFACT_ROOT / "blueprint_current_state_capture_sheet.svg",
              "Set 22 Stage 0 - Blueprint Current State", blueprint_sheet)

    source_paths = sorted({
        path for inventory in (entities, blueprint_records)
        for record in inventory["records"]
        for path in record["dependency_information"]["source_paths"]
    })
    dependency_rows = []
    for resource_path in source_paths:
        local = ROOT / resource_path.removeprefix("res://")
        dependency_rows.append({
            "path": resource_path,
            "exists": local.is_file(),
            "sha256": file_hash(local) if local.is_file() else "",
        })
    write_json(ARTIFACT_ROOT / "dependency_snapshot.json", {
        "schema": "leyforge.forge.dependency-snapshot",
        "schema_version": 1,
        "contract_version": CONTRACT_VERSION,
        "dependencies": dependency_rows,
    })

    write_json(ARTIFACT_ROOT / "contract_baseline.json", {
        "schema": "leyforge.forge.contract-baseline",
        "schema_version": 1,
        "contract_version": CONTRACT_VERSION,
        "settlement_schema_version": 2,
        "settlement_catalogue_version": "20H-v0.2",
        "save_version": 17,
        "supported_domains": ["entity", "blueprint", "shared"],
        "semantic_registry_hash": stable_hash(semantics),
        "entity_inventory_hash": stable_hash(entities),
        "blueprint_inventory_hash": stable_hash(blueprint_records),
        "manual_visual_approval": "open",
    })

    fallback_records = [
        {
            "subject_type": inventory["subject_type"],
            "target_id": record["target_id"],
            "fallback": record["fallback"],
            "lifecycle": record["lifecycle"],
            "removal_gate": record["removal_gate"],
        }
        for inventory in (entities, blueprint_records)
        for record in inventory["records"] if record["fallback"]
    ]
    fallback_records.sort(key=lambda record: (record["subject_type"], record["target_id"]))
    write_json(ARTIFACT_ROOT / "legacy_fallback_register.json", {
        "schema": "leyforge.forge.legacy-fallback-register",
        "schema_version": 1,
        "contract_version": CONTRACT_VERSION,
        "removal_policy": "remove_nothing_without_explicit_gate_evidence",
        "record_count": len(fallback_records),
        "records": fallback_records,
    })


if __name__ == "__main__":
    main()
