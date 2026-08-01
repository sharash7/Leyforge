"""Deterministically migrate the six settlement data sets to Set 20 v0.2.

This is a checked-in migration tool rather than a second source of truth.  It
only rewrites the existing machine-readable records, preserves every legacy ID
as an alias, and is safe to run more than once.
"""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[3]
DATA = ROOT / "data" / "settlement"
FILES = {
    "catalogue": DATA / "settlement_catalogue.json",
    "blueprints": DATA / "settlement_blueprints.json",
    "projects": DATA / "settlement_projects.json",
    "behaviors": DATA / "settlement_behaviors.json",
    "packs": DATA / "settlement_packs.json",
    "plans": DATA / "settlement_plans.json",
}

CORE_NUMBERS = {1, 2, 3, 6, 11, 15, 31, 41, 72, 82, 85, 88}
RAID_NUMBERS = {61, 71, 73, 74}
EXTENDED_NUMBERS = {5, 7, 13, 14, 21, 25, 35, 42, 43, 51, 52, 56, 81, 91}
SCOPE_COUNTS = {
    "technical_poc": 16,
    "extended_slice": 14,
    "alpha": 35,
    "beta": 49,
    "final": 6,
}
BUILDER_OLD = "building.infrastructure.builder_supply_yard"
BUILDER_NEW = "building.construction.builder_supply_yard"
PACK_RENAMES = {
    "pack.occupation.frontier_builders":
        "pack.overlay.occupation.frontier_builders",
    "pack.occupation.arcane_artisans":
        "pack.overlay.occupation.arcane_artisans",
    "pack.diaspora.riverward_exiles":
        "pack.overlay.diaspora.riverward_exiles",
    "pack.history.rebuilt_after_raid":
        "pack.overlay.history.rebuilt_after_raid",
    "pack.realm_access.portal_network":
        "pack.realm.portal_network_access",
}
LEGACY_KIT_ALIASES = {
    "pack.foundation.forest_neutral_poc": [
        "culture_kit.forest_neutral",
        "style_kit.forest_neutral",
    ],
    "pack.culture.riverward_frontier": [
        "culture_kit.forest_human",
        "style_kit.forest_human",
    ],
}
RESOLUTION_ORDER = [
    "foundation",
    "blueprint_archetype",
    "culture",
    "region",
    "biome",
    "faction",
    "government",
    "faith",
    "economy",
    "realm",
    "overlay",
    "hybrid",
    "player_style",
]


def load(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8-sig") as handle:
        value = json.load(handle)
    if value.get("schema_version") not in (1, 2):
        raise ValueError(f"Unsupported schema version in {path}")
    return value


def save(path: Path, value: dict[str, Any]) -> None:
    with path.open("w", encoding="utf-8", newline="\n") as handle:
        json.dump(value, handle, indent=2, ensure_ascii=False)
        handle.write("\n")


def add_alias(record: dict[str, Any], alias: str) -> None:
    if not alias or alias == record.get("id"):
        return
    aliases = record.setdefault("aliases", [])
    if alias not in aliases:
        aliases.append(alias)
    aliases.sort()


def normalise_aliases(record: dict[str, Any]) -> None:
    canonical = str(record.get("id", ""))
    record["aliases"] = sorted({
        str(alias) for alias in record.get("aliases", [])
        if str(alias) and str(alias) != canonical
    })


def canonical_blueprint_id(definition_id: str) -> str:
    parts = definition_id.split(".")
    if len(parts) != 3:
        raise ValueError(f"Definition ID cannot produce a blueprint ID: {definition_id}")
    return f"blueprint.leyforge.{parts[1]}.{parts[2]}_a"


def production_status(source: str = "legacy_blueprint_fallback") -> dict[str, str]:
    return {
        "document_status": "draft",
        "runtime_data_status": "validated",
        "source_status": source,
        "forge_bake_status": "not_started",
        "visual_status": "unreviewed",
        "shipping_status": "not_shippable",
    }


def deep_replace(value: Any, aliases: dict[str, str]) -> Any:
    if isinstance(value, dict):
        return {
            key: child if key in ("aliases", "legacy_id")
            else deep_replace(child, aliases)
            for key, child in value.items()
        }
    if isinstance(value, list):
        return [deep_replace(child, aliases) for child in value]
    if isinstance(value, str):
        return aliases.get(value, value)
    return value


def pack_type(pack_id: str) -> str:
    parts = pack_id.split(".")
    return parts[1] if len(parts) > 2 else "foundation"


def main() -> None:
    roots = {name: load(path) for name, path in FILES.items()}
    catalogue = roots["catalogue"]
    definitions = catalogue["definitions"]
    assert len(definitions) == 120

    aliases: dict[str, str] = {BUILDER_OLD: BUILDER_NEW}
    for definition in definitions:
        number = int(definition["catalogue_no"])
        if definition["id"] == BUILDER_OLD:
            definition["id"] = BUILDER_NEW
        if number == 3:
            add_alias(definition, BUILDER_OLD)
        normalise_aliases(definition)
        definition["schema_version"] = 2
        if number in CORE_NUMBERS:
            definition["scope"] = "technical_poc"
            definition["delivery_group"] = "core_infrastructure"
        elif number in RAID_NUMBERS:
            definition["scope"] = "technical_poc"
            definition["delivery_group"] = "raid_extension"
        elif number in EXTENDED_NUMBERS:
            definition["scope"] = "extended_slice"
            definition["delivery_group"] = "extended_forest_hamlet"
        else:
            definition.pop("delivery_group", None)
        tags = [
            definition["scope"] if tag == "poc_required" else tag
            for tag in definition.get("tags", [])
        ]
        if definition["scope"] not in tags:
            tags.append(definition["scope"])
        definition["tags"] = list(dict.fromkeys(tags))
        definition["production_status"] = production_status()

    definitions_by_id = {item["id"]: item for item in definitions}
    definitions_by_number = {int(item["catalogue_no"]): item for item in definitions}

    blueprint_aliases: dict[str, str] = {}
    for blueprint in roots["blueprints"]["blueprints"]:
        definition_ids = blueprint.get("definition_ids") or blueprint.get("building_ids")
        if not definition_ids:
            raise ValueError(f"Blueprint has no linked definition: {blueprint.get('id')}")
        linked_id = aliases.get(definition_ids[0], definition_ids[0])
        canonical = canonical_blueprint_id(linked_id)
        old_id = blueprint["id"]
        catalogue_no = int(definitions_by_id[linked_id]["catalogue_no"])
        legacy_id = (
            "bp.building.cottage_forest_small" if catalogue_no == 6
            else "bp.building.watchtower_wood" if catalogue_no == 72
            else f"bp.catalogue.{catalogue_no:03d}"
        )
        blueprint["id"] = canonical
        add_alias(blueprint, old_id)
        add_alias(blueprint, legacy_id)
        normalise_aliases(blueprint)
        blueprint_aliases[old_id] = canonical
        for old_alias in blueprint.get("aliases", []):
            blueprint_aliases[old_alias] = canonical
        blueprint["schema_version"] = 2
        blueprint["status"] = "legacy_fallback"
        blueprint["fallback"] = {
            "active": True,
            "kind": "legacy_blueprint",
            "legacy_id": legacy_id,
        }
        blueprint["production_status"] = production_status()
    if len({item["id"] for item in roots["blueprints"]["blueprints"]}) != 120:
        raise ValueError("Canonical blueprint IDs are not unique")
    aliases.update(blueprint_aliases)

    pack_aliases = dict(PACK_RENAMES)
    aliases.update(pack_aliases)
    for pack in roots["packs"]["packs"]:
        old_id = pack["id"]
        pack["id"] = PACK_RENAMES.get(old_id, old_id)
        if old_id != pack["id"]:
            add_alias(pack, old_id)
        for legacy_id, canonical_id in PACK_RENAMES.items():
            if canonical_id == pack["id"]:
                add_alias(pack, legacy_id)
        for alias in LEGACY_KIT_ALIASES.get(pack["id"], []):
            add_alias(pack, alias)
            aliases[alias] = pack["id"]
        normalise_aliases(pack)
        pack["schema_version"] = 2
        pack["version"] = 2
        pack["type"] = pack_type(pack["id"])
        pack["production_status"] = production_status("runtime_data")

    # Canonicalise every cross-reference only after all namespace maps exist.
    for name, root in tuple(roots.items()):
        roots[name] = deep_replace(root, aliases)

    catalogue = roots["catalogue"]
    definitions = catalogue["definitions"]
    definitions_by_id = {item["id"]: item for item in definitions}
    definitions_by_number = {int(item["catalogue_no"]): item for item in definitions}

    for project in roots["projects"]["projects"]:
        project["schema_version"] = 2
        target = project.get("catalogue_definition_id", project.get("building_id", ""))
        definition = definitions_by_id.get(target)
        if definition:
            project["scope"] = definition["scope"]
            if "delivery_group" in definition:
                project["delivery_group"] = definition["delivery_group"]
            else:
                project.pop("delivery_group", None)
        project["production_status"] = production_status()

    for behavior in roots["behaviors"]["behaviors"]:
        behavior["schema_version"] = 2
        definition = definitions_by_id.get(behavior.get("definition_id", ""))
        if definition:
            behavior["scope"] = definition["scope"]
            if "delivery_group" in definition:
                behavior["delivery_group"] = definition["delivery_group"]
            else:
                behavior.pop("delivery_group", None)
        behavior["production_status"] = production_status("runtime_data")

    for plan in roots["plans"]["plans"]:
        plan["schema_version"] = 2
        definition = definitions_by_id.get(plan.get("id", ""))
        if definition:
            plan["scope"] = definition["scope"]
        plan["production_status"] = production_status("runtime_data")

    for pack in roots["packs"]["packs"]:
        pack["compatibility"]["registry_schema"] = 2
        pack["compatibility"]["catalogue_version"] = "20H-v0.2"

    roots["packs"]["resolution_order"] = RESOLUTION_ORDER
    catalogue["catalogue_version"] = "20H-v0.2"
    catalogue["expected_scope_counts"] = SCOPE_COUNTS
    catalogue["parsed_scope_counts"] = SCOPE_COUNTS.copy()

    for root in roots.values():
        root["schema_version"] = 2
        root["catalogue_version"] = "20H-v0.2"
        root["document_status"] = "draft"
        root["runtime_data_status"] = "validated"

    scope_counts: dict[str, int] = {}
    kind_counts: dict[str, int] = {}
    delivery_counts: dict[str, int] = {}
    for definition in catalogue["definitions"]:
        scope = definition["scope"]
        kind = definition["kind"]
        scope_counts[scope] = scope_counts.get(scope, 0) + 1
        kind_counts[kind] = kind_counts.get(kind, 0) + 1
        group = definition.get("delivery_group")
        if group:
            delivery_counts[group] = delivery_counts.get(group, 0) + 1
    assert scope_counts == SCOPE_COUNTS
    assert kind_counts == {"building": 103, "project": 10, "plan": 7}
    assert delivery_counts == {
        "core_infrastructure": 12,
        "raid_extension": 4,
        "extended_forest_hamlet": 14,
    }
    assert len(roots["blueprints"]["blueprints"]) == 120
    assert len(roots["projects"]["projects"]) == 120
    assert len(roots["behaviors"]["behaviors"]) == 120
    assert len(roots["plans"]["plans"]) == 13
    assert len(roots["packs"]["packs"]) == 25
    assert definitions_by_number[3]["id"] == BUILDER_NEW

    for name, path in FILES.items():
        save(path, roots[name])


if __name__ == "__main__":
    main()
