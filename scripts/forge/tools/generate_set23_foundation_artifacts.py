#!/usr/bin/env python3
"""Generate deterministic Set 23 inventories and foundation evidence."""

from __future__ import annotations

import hashlib
import html
import json
import re
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
CONTRACT = "23-foundation-v1"
MIGRATION_PATH = ROOT / "content" / "forge" / "migration" / "presentation_migration_inventory.json"
TARGET_PATH = ROOT / "content" / "forge" / "presentation" / "set23" / "golden_core_targets.json"
ARTIFACT_ROOT = ROOT / ".summer" / "verification" / "artifacts" / "set23_stage0"

EXCLUDED_PARTS = {
    ".git", ".godot", ".local", ".tmp", ".verification", "build",
    "generated", "00_Docs", "docx",
}

PATTERNS = {
    "particle_node": re.compile(r"\b(?:GPU|CPU)Particles3D\b|\bParticlesMaterial\b"),
    "audio_node": re.compile(r"\bAudioStreamPlayer(?:2D|3D)?\b"),
    "direct_audio_media": re.compile(r"\.(?:wav|ogg|mp3)\b", re.IGNORECASE),
    "hardcoded_effect_dispatch": re.compile(
        r"ForgeRuntimeEffects|spawn_effect|play_effect|machine_smoke", re.IGNORECASE
    ),
    "direct_light_node": re.compile(r"\b(?:Omni|Spot|Directional)Light3D\b"),
    "hardcoded_material_response": re.compile(
        r"impact_material|surface_material|material_response", re.IGNORECASE
    ),
    "scene_path_presentation": re.compile(
        r"get_node[^\n]*(?:particle|audio|sound|effect|light)", re.IGNORECASE
    ),
    "caption_or_warning": re.compile(
        r"presentation_caption|critical_warning|caption_key", re.IGNORECASE
    ),
    "stable_presentation_reference": re.compile(r"presentation\.[a-z0-9_.-]+"),
}

VFX_TARGETS = {
    "contact": [
        "vfx.effect.contact.footstep.dirt",
        "vfx.effect.contact.mining.stone",
        "vfx.effect.contact.impact.wood",
        "vfx.effect.contact.spark.metal",
        "vfx.effect.contact.splash.water",
        "vfx.effect.contact.landing.heavy",
    ],
    "machine_lifecycle": [
        "vfx.effect.machine.furnace.smoke_loop",
        "vfx.effect.machine.furnace.ignition_burst",
        "vfx.effect.machine.furnace.blocked_warning",
        "vfx.effect.machine.furnace.damage_sparks",
    ],
    "magic_infrastructure": [
        "vfx.effect.magic.mana_path_pulse",
        "vfx.effect.magic.rune_activation",
        "vfx.effect.magic.ward_idle_boundary",
        "vfx.effect.magic.ward_breach",
    ],
    "weather_volume": [
        "vfx.effect.weather.rain_cells",
        "vfx.effect.weather.rain_roof_contact",
        "vfx.effect.environment.cave_dust_volume",
    ],
    "persistent_surface": [
        "surface.layer.environment.wetness",
        "surface.layer.environment.soot",
        "surface.layer.environment.scorch",
        "surface.layer.environment.corruption",
    ],
    "critical_telegraph": [
        "vfx.effect.creature.goblin_captain.attack_arc",
        "vfx.effect.warning.lethal_area_boundary",
    ],
    "graph_template": [
        "vfx.graph.template.burst",
        "vfx.graph.template.managed_loop",
        "vfx.graph.template.path_pulse",
        "vfx.graph.template.segmented_trail",
        "vfx.graph.template.volume",
        "vfx.graph.template.surface_write",
    ],
}

SOUND_TARGETS = {
    "footsteps_material_contact": [
        f"sound.event.footstep.{material}.{intensity}"
        for material in ("dirt", "stone", "wood", "water")
        for intensity in ("light", "heavy")
    ],
    "mining_block_interaction": [
        "sound.event.block.mining.stone",
        "sound.event.block.mining.ore",
        "sound.event.block.mining.wood",
        "sound.event.block.placement",
        "sound.event.block.break",
        "sound.event.block.repair",
    ],
    "machine_lifecycle": [
        "sound.event.machine.furnace.fuel",
        "sound.event.machine.furnace.ignite",
        "sound.event.machine.furnace.work_loop",
        "sound.event.machine.furnace.blocked",
        "sound.event.machine.furnace.damage",
        "sound.event.machine.furnace.output",
        "sound.event.machine.furnace.shutdown",
        "sound.event.machine.furnace.warning",
    ],
    "magic_infrastructure": [
        "sound.event.magic.mana_pickup",
        "sound.event.magic.mana_conduit.loop",
        "sound.event.magic.rune_activation",
        "sound.event.magic.ward_idle",
        "sound.event.magic.ward_warning",
        "sound.event.magic.ward_breach",
    ],
    "creature_raid": [
        "sound.event.creature.goblin.alert",
        "sound.event.creature.goblin.telegraph",
        "sound.event.creature.goblin.attack",
        "sound.event.creature.goblin.hurt",
        "sound.event.raid.goblin.war_horn",
        "sound.event.raid.goblin.critical_warning",
    ],
    "environment": [
        "sound.event.ambience.forest.day",
        "sound.event.ambience.forest.night",
        "sound.event.ambience.cave",
        "sound.event.ambience.river",
        "sound.event.weather.rain.open",
        "sound.event.weather.rain.roof",
    ],
    "ui_accessibility": [
        "sound.event.ui.confirm",
        "sound.event.ui.error",
        "sound.event.ui.critical_warning",
        "sound.event.ui.directional_cue",
    ],
}

PROFILE_TARGETS = [
    "presentation.profile.contact.mining.light",
    "presentation.profile.contact.mining.heavy",
    "presentation.profile.block.placement",
    "presentation.profile.block.break",
    "presentation.profile.block.repair",
    "presentation.profile.locomotion.footstep",
    "presentation.profile.locomotion.hoofstep",
    "presentation.profile.machine.furnace.ignite",
    "presentation.profile.machine.furnace.active",
    "presentation.profile.machine.furnace.blocked",
    "presentation.profile.machine.furnace.damaged",
    "presentation.profile.machine.furnace.shutdown",
    "presentation.profile.magic.mana_conduit.active",
    "presentation.profile.magic.rune.activate",
    "presentation.profile.magic.ward.idle",
    "presentation.profile.magic.ward.breach",
    "presentation.profile.creature.goblin.alert",
    "presentation.profile.creature.goblin.telegraph",
    "presentation.profile.creature.goblin.attack",
    "presentation.profile.environment.rain.exterior",
    "presentation.profile.environment.rain.roof",
    "presentation.profile.ambience.village",
    "presentation.profile.warning.critical.directional",
    "presentation.profile.structure.construction.complete",
]

OTHER_TARGETS = {
    "material_profiles": [
        f"material.presentation.{name}.foundation"
        for name in ("dirt", "stone", "wood", "metal", "water", "flesh", "crystal", "cloth")
    ],
    "spatial_templates": [
        "spatial.reference.template.humanoid.presentation",
        "spatial.reference.template.quadruped.presentation",
        "spatial.reference.template.machine.presentation",
        "spatial.reference.template.structure.acoustic",
        "spatial.reference.template.weapon.trail",
        "spatial.reference.template.runtime.contact",
    ],
    "acoustic_profiles": [
        "acoustic.profile.environment.forest_outdoor",
        "acoustic.profile.environment.cave",
        "acoustic.profile.room.timber_small",
        "acoustic.profile.room.workshop_stone_small",
        "acoustic.profile.portal.door_standard",
        "acoustic.profile.weather.rain_shelter",
    ],
    "accessibility_profiles": [
        "access.profile.warning.critical",
        "access.profile.contact.mining",
        "access.profile.locomotion.footstep",
        "access.profile.machine.blocked",
        "access.profile.magic.ward_breach",
        "access.profile.creature.goblin_telegraph",
    ],
    "budget_profiles": [
        "budget.profile.vfx.contact",
        "budget.profile.presentation.machine",
        "budget.profile.presentation.magic",
        "budget.profile.presentation.weather",
        "budget.profile.presentation.ambience",
        "budget.profile.vfx.combat_critical",
        "budget.profile.presentation.surface_persistent",
        "budget.profile.presentation.village_standard",
    ],
    "test_scenarios": [
        "test.presentation.mining_impact",
        "test.presentation.footsteps",
        "test.presentation.furnace_lifecycle",
        "test.presentation.mana_conduit_ward",
        "test.presentation.rain_shelter",
        "test.presentation.village_ambience",
        "test.presentation.goblin_raid",
        "test.presentation.blueprint_acoustics",
    ],
}

SCHEMA_IDS = [
    "leyforge.forge.presentation-profile",
    "leyforge.forge.presentation-binding",
    "leyforge.forge.presentation-event-contract",
    "leyforge.forge.presentation-state-contract",
    "leyforge.forge.presentation-parameter-contract",
    "leyforge.forge.presentation-context-schema",
    "leyforge.forge.spatial-reference",
    "leyforge.forge.vfx-definition",
    "leyforge.forge.vfx-family",
    "leyforge.forge.vfx-graph",
    "leyforge.forge.vfx-form",
    "leyforge.forge.surface-layer",
    "leyforge.forge.sound-event",
    "leyforge.forge.sound-source",
    "leyforge.forge.audio-family",
    "leyforge.forge.spatial-audio-profile",
    "leyforge.forge.material-response-table",
    "leyforge.forge.acoustic-profile",
    "leyforge.forge.mix-snapshot",
    "leyforge.forge.presentation-budget-profile",
    "leyforge.forge.accessibility-profile",
    "leyforge.forge.presentation-test-scenario",
]


def stable_json(value: object) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False)


def digest(value: object) -> str:
    return hashlib.sha256(stable_json(value).encode("utf-8")).hexdigest()


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )


def scan_files() -> list[Path]:
    roots = [ROOT / "scripts", ROOT / "addons", ROOT / "content"]
    files: list[Path] = []
    for base in roots:
        if not base.exists():
            continue
        for path in base.rglob("*"):
            if not path.is_file() or path.suffix.lower() not in {".gd", ".tscn", ".tres"}:
                continue
            if any(part in EXCLUDED_PARTS for part in path.parts):
                continue
            relative_parts = path.relative_to(ROOT).parts
            if relative_parts[:3] in {
                ("scripts", "forge", "application"),
                ("scripts", "forge", "domain"),
                ("scripts", "forge", "tools"),
            }:
                continue
            if relative_parts[:4] == ("content", "forge", "presentation", "set23"):
                continue
            if path.name.startswith("generate_set23_"):
                continue
            files.append(path)
    files.extend(path for path in ROOT.glob("*.tscn") if path.name != "main.tscn")
    return sorted(set(files))


def classification(category: str, relative_path: str) -> str:
    if category == "stable_presentation_reference":
        return "preserve"
    if category == "hardcoded_material_response":
        return "convert"
    if "forge/runtime/forge_runtime_effects.gd" in relative_path.replace("\\", "/"):
        return "wrap"
    return "wrap"


def migration_inventory() -> dict:
    records = []
    for path in scan_files():
        relative = path.relative_to(ROOT).as_posix()
        lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        for category, pattern in PATTERNS.items():
            matched = [index + 1 for index, line in enumerate(lines) if pattern.search(line)]
            if not matched:
                continue
            record_id = hashlib.sha256(f"{category}:{relative}".encode()).hexdigest()[:16]
            treatment = classification(category, relative)
            records.append({
                "contract_version": CONTRACT,
                "current_source": relative,
                "dependency_information": {
                    "match_count": len(matched),
                    "line_numbers": matched,
                    "scan_category": category,
                },
                "fallback": "active_legacy_runtime",
                "fallback_active": True,
                "fallback_id": f"legacy.presentation.{record_id}",
                "lifecycle": "active_fallback",
                "manual_review": "open",
                "removal_gate": "approved_replacement_and_regression_evidence",
                "replacement_strategy": treatment,
                "review_history": [],
                "source_schema_id": "legacy.runtime.presentation",
                "status": "inventoried",
                "subject_type": category,
                "target_id": f"migration.presentation.{category}.{record_id}",
                "target_schema_id": "leyforge.forge.migration-record",
                "transformation_version": 1,
            })
    records.append({
        "contract_version": CONTRACT,
        "current_source": "manual semantic-transform audit",
        "dependency_information": {
            "scope": "unnamed transforms used as presentation origins",
            "automated_scan": "not_sufficient",
        },
        "fallback": "active_legacy_runtime",
        "fallback_active": True,
        "fallback_id": "legacy.presentation.unnamed_transforms",
        "lifecycle": "active_fallback",
        "manual_review": "open",
        "removal_gate": "named_spatial_roles_and_runtime_alignment_evidence",
        "replacement_strategy": "defer",
        "review_history": [],
        "source_schema_id": "legacy.runtime.transform",
        "status": "inventoried_manual_review_open",
        "subject_type": "unnamed_transform",
        "target_id": "migration.presentation.semantic_gap.unnamed_transforms",
        "target_schema_id": "leyforge.forge.spatial-reference",
        "transformation_version": 1,
    })
    records.sort(key=lambda record: record["target_id"])
    category_counts = Counter(record["subject_type"] for record in records)
    for category in PATTERNS:
        category_counts.setdefault(category, 0)
    category_counts.setdefault("unnamed_transform", 1)
    inventory = {
        "schema": "leyforge.forge.presentation-migration-inventory",
        "schema_version": 1,
        "contract_version": CONTRACT,
        "classification_values": ["wrap", "convert", "replace", "defer", "preserve"],
        "removal_count": 0,
        "record_count": len(records),
        "category_counts": dict(sorted(category_counts.items())),
        "coverage_status": {
            **{category: "automated_scan_complete" for category in sorted(PATTERNS)},
            "unnamed_transform": "manual_review_open",
        },
        "scan_scope": [
            "scripts/**/*.gd", "addons/**/*.{gd,tscn,tres}",
            "content/**/*.{gd,tscn,tres}", "root scenes excluding main.tscn",
        ],
        "excluded_scope": sorted(EXCLUDED_PARTS),
        "manual_visual_approval": "open",
        "manual_audio_rights_review": "open",
        "records": records,
    }
    inventory["inventory_hash"] = digest(inventory)
    return inventory


def target_record(stable_id: str, group: str, asset_class: str) -> dict:
    return {
        "stable_id": stable_id,
        "group": group,
        "asset_class": asset_class,
        "contract_version": CONTRACT,
        "lifecycle": "planned_new_work",
        "source_status": "new_work",
        "production_status": "not_started",
        "fallback_status": "legacy_or_safe_default_retained",
        "manual_visual_approval": "open",
        "manual_audio_approval": "open",
        "rights_status": "not_assessed",
    }


def golden_targets() -> dict:
    libraries: dict[str, list[dict]] = {}
    vfx = []
    for group, ids in VFX_TARGETS.items():
        for stable_id in ids:
            asset_class = "vfx_graph" if stable_id.startswith("vfx.graph.") else (
                "surface_layer" if stable_id.startswith("surface.layer.") else "vfx_effect"
            )
            vfx.append(target_record(stable_id, group, asset_class))
    libraries["vfx"] = vfx
    sound = []
    for group, ids in SOUND_TARGETS.items():
        sound.extend(target_record(stable_id, group, "sound_event") for stable_id in ids)
    libraries["sound_events"] = sound
    libraries["presentation_profiles"] = [
        target_record(stable_id, "golden_profile", "presentation_profile")
        for stable_id in PROFILE_TARGETS
    ]
    class_by_library = {
        "material_profiles": "material_profile",
        "spatial_templates": "spatial_template",
        "acoustic_profiles": "acoustic_profile",
        "accessibility_profiles": "accessibility_profile",
        "budget_profiles": "budget_profile",
        "test_scenarios": "test_scenario",
    }
    for library, ids in OTHER_TARGETS.items():
        libraries[library] = [
            target_record(stable_id, "golden_core", class_by_library[library])
            for stable_id in ids
        ]
    counts = {key: len(value) for key, value in libraries.items()}
    result = {
        "schema": "leyforge.forge.presentation-golden-core-targets",
        "schema_version": 1,
        "contract_version": CONTRACT,
        "counts": counts,
        "all_targets_new_work": True,
        "manual_approval": "open",
        "libraries": libraries,
    }
    result["target_hash"] = digest(result)
    return result


def write_artifacts(inventory: dict, targets: dict) -> None:
    ARTIFACT_ROOT.mkdir(parents=True, exist_ok=True)
    project_text = (ROOT / "project.godot").read_text(encoding="utf-8")
    feature_match = re.search(r'config/features=PackedStringArray\("([^"]+)"', project_text)
    renderer_match = re.search(r'rendering_method="([^"]+)"', project_text)
    toolchain = {
        "schema": "leyforge.verification.set23.toolchain-baseline",
        "contract_version": CONTRACT,
        "project_godot_feature": feature_match.group(1) if feature_match else "unknown",
        "project_renderer": renderer_match.group(1) if renderer_match else "Forward Plus",
        "verification_renderer": "gl_compatibility",
        "verification_runner": "res://.local/Godot_v4.8-dev-a9c94-shutdown-fixed/godot.windows.editor.x86_64.console.exe",
        "verification_runner_reason": "repository-approved shutdown-fixed runner",
        "engine_upgrade_status": "not_requested",
        "source_runtime_split": {
            "canonical_source": "res://content/forge/presentation/set23",
            "generated_products": "res://generated/forge",
            "generated_product_policy": "replaceable_output",
        },
        "export_package_status": "not_started",
        "main_scene_change": "forbidden_for_milestone",
    }
    toolchain["baseline_hash"] = digest(toolchain)
    write_json(ARTIFACT_ROOT / "toolchain_baseline.json", toolchain)

    contract = {
        "schema": "leyforge.verification.set23.contract-baseline",
        "contract_version": CONTRACT,
        "historical_contract_versions_preserved": ["20H-v0.2", "22-foundation-v1", "22-stage1-v1"],
        "schema_ids": SCHEMA_IDS,
        "canonical_definition_namespaces": [
            "presentation.profile", "presentation.binding", "event", "state",
            "parameter", "context.schema", "vfx", "sound", "surface.layer",
            "material.presentation", "acoustic", "audio.snapshot",
            "budget.profile", "access.profile", "test.presentation",
            "pack.presentation",
        ],
        "canonical_spatial_role_namespaces": [
            "anchor", "socket", "region", "path", "mask", "zone",
            "portal.audio", "runtime_anchor",
        ],
        "runtime_status": "not_started",
        "vfx_simulation_status": "not_started",
        "audio_mixing_status": "not_started",
        "production_ui_status": "not_started",
        "manual_approval": "open",
    }
    contract["baseline_hash"] = digest(contract)
    write_json(ARTIFACT_ROOT / "contract_baseline.json", contract)

    fallback_records = [
        record for record in inventory["records"] if record["fallback_active"]
    ]
    fallback = {
        "schema": "leyforge.verification.set23.legacy-fallback-register",
        "contract_version": CONTRACT,
        "record_count": len(fallback_records),
        "removal_count": 0,
        "records": fallback_records,
    }
    fallback["register_hash"] = digest(fallback)
    write_json(ARTIFACT_ROOT / "legacy_fallback_register.json", fallback)

    dependency = {
        "schema": "leyforge.verification.set23.dependency-snapshot",
        "contract_version": CONTRACT,
        "fixture_root": "res://content/forge/presentation/set23/foundation",
        "registered_schema_count": len(SCHEMA_IDS),
        "fixture_resource_count": 23,
        "required_dependency_policy": "all_required_ids_resolve_through_shared_index_or_semantic_registry",
        "cycle_policy": "REG-004_error",
        "runtime_dependency_status": "foundation_only",
    }
    dependency["snapshot_hash"] = digest(dependency)
    write_json(ARTIFACT_ROOT / "dependency_snapshot.json", dependency)

    performance = {
        "schema": "leyforge.verification.set23.presentation-performance-baseline",
        "contract_version": CONTRACT,
        "measurement_status": "foundation_static_baseline",
        "runtime_cpu_measurement": "open",
        "runtime_gpu_measurement": "open",
        "audio_voice_measurement": "open",
        "set23_runtime_implementation": "not_started",
        "static_inventory_category_counts": inventory["category_counts"],
        "required_future_counters": [
            "active_logical_instances", "particles", "voices", "lights",
            "surface_records", "resolver_time", "pool_misses",
        ],
    }
    performance["baseline_hash"] = digest(performance)
    write_json(ARTIFACT_ROOT / "performance_baseline.json", performance)

    golden = {
        "schema": "leyforge.verification.set23.golden-core-baseline",
        "contract_version": CONTRACT,
        "counts": targets["counts"],
        "target_hash": targets["target_hash"],
        "production_status": "not_started",
        "manual_visual_approval": "open",
        "manual_listening_approval": "open",
        "rights_review": "open",
    }
    golden["baseline_hash"] = digest(golden)
    write_json(ARTIFACT_ROOT / "golden_core_baseline.json", golden)

    capture = {
        "schema": "leyforge.verification.set23.current-state-capture-sheet",
        "contract_version": CONTRACT,
        "inventory_record_count": inventory["record_count"],
        "category_counts": inventory["category_counts"],
        "golden_target_counts": targets["counts"],
        "legacy_fallbacks_active": len(fallback_records),
        "runtime_replacements": 0,
        "manual_capture_review": "open",
    }
    capture["capture_hash"] = digest(capture)
    write_json(ARTIFACT_ROOT / "presentation_current_state_capture_sheet.json", capture)
    rows = "".join(
        f'<text x="32" y="{116 + index * 24}" class="row">{html.escape(key)}: {value}</text>'
        for index, (key, value) in enumerate(sorted(inventory["category_counts"].items()))
    )
    height = 160 + 24 * len(inventory["category_counts"])
    svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="960" height="{height}" viewBox="0 0 960 {height}">
<style>.title{{font:700 28px sans-serif;fill:#f4ead5}}.meta{{font:16px monospace;fill:#b8c8b0}}.row{{font:15px monospace;fill:#e4d7bd}}</style>
<rect width="960" height="{height}" fill="#17211d"/>
<text x="32" y="44" class="title">Set 23 Presentation Forge Current-State Capture</text>
<text x="32" y="76" class="meta">contract {CONTRACT} | runtime replacements 0 | manual review open</text>
<text x="32" y="100" class="meta">inventory {inventory['record_count']} | active fallbacks {len(fallback_records)}</text>
{rows}
</svg>\n'''
    (ARTIFACT_ROOT / "presentation_current_state_capture_sheet.svg").write_text(svg, encoding="utf-8")


def main() -> None:
    inventory = migration_inventory()
    targets = golden_targets()
    assert sum(len(values) for values in VFX_TARGETS.values()) == 29
    assert sum(len(values) for values in SOUND_TARGETS.values()) == 44
    assert len(PROFILE_TARGETS) == 24
    assert {key: len(value) for key, value in OTHER_TARGETS.items()} == {
        "material_profiles": 8,
        "spatial_templates": 6,
        "acoustic_profiles": 6,
        "accessibility_profiles": 6,
        "budget_profiles": 8,
        "test_scenarios": 8,
    }
    write_json(MIGRATION_PATH, inventory)
    write_json(TARGET_PATH, targets)
    write_artifacts(inventory, targets)
    print(json.dumps({
        "ok": True,
        "inventory_records": inventory["record_count"],
        "inventory_hash": inventory["inventory_hash"],
        "golden_target_hash": targets["target_hash"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
