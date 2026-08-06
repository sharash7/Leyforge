import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
PATH = ROOT / "data" / "forge" / "semantic_registry.json"


ADDITIONS = {
    "mask": [
        ("mask.surface.corruption", "Corruption Surface Mask"),
        ("mask.surface.scorch", "Scorch Surface Mask"),
        ("mask.surface.soot", "Soot Surface Mask"),
    ],
    "portal": [
        ("portal.audio.chimney", "Audio Chimney Portal"),
        ("portal.audio.gate", "Audio Gate Portal"),
        ("portal.audio.window", "Audio Window Portal"),
    ],
    "zone": [
        ("zone.audio.cottage_interior", "Cottage Interior Audio Zone"),
        ("zone.audio.goblin_camp", "Goblin Camp Audio Zone"),
        ("zone.audio.rune_ruin", "Rune Ruin Audio Zone"),
        ("zone.audio.warehouse_interior", "Warehouse Interior Audio Zone"),
        ("zone.audio.watchtower_interior", "Watchtower Interior Audio Zone"),
    ],
}


def main() -> None:
    data = json.loads(PATH.read_text(encoding="utf-8"))
    families = data.setdefault("families", {})
    for family, records in ADDITIONS.items():
        target = families.setdefault(family, [])
        known = {record["id"] for record in target}
        for stable_id, display_name in records:
            if stable_id in known:
                continue
            target.append({
                "aliases": [],
                "contract_version": "23-acoustic-runtime-v1",
                "dependencies": [],
                "display_name": display_name,
                "id": stable_id,
                "lifecycle": "runtime_candidate",
            })
        target.sort(key=lambda record: record["id"])
    PATH.write_text(
        json.dumps(data, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    main()
