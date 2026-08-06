extends Node

const PRESENTATION_ROOT := "res://content/forge/presentation/set23/foundation"
const PACK_PATH := (
	"res://content/forge/presentation/set23/pack_presentation_leyforge_foundation.tres")
const INVENTORY_PATH := (
	"res://content/forge/migration/presentation_migration_inventory.json")
const TARGET_PATH := (
	"res://content/forge/presentation/set23/golden_core_targets.json")
const ARTIFACT_ROOT := "res://.summer/verification/artifacts/set23_stage0"
const CONTRACT := "23-foundation-v1"
const EXPECTED_DETERMINISTIC_HASH := (
	"4be60c9e353ec95f37faa936d7f3439e4ae18e7032c5b270f7543bac9fa5d875")
const DENSITY_PATHS := [
	"res://content/forge/entities/density_profiles/density_profile_entity_coarse.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_colossal_modular.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_fine.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_micro_accent.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_standard.tres",
]

const SCHEMA_IDS: PackedStringArray = [
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

const EXPECTED_TARGET_COUNTS := {
	"vfx": 29,
	"sound_events": 44,
	"presentation_profiles": 24,
	"material_profiles": 8,
	"spatial_templates": 6,
	"acoustic_profiles": 6,
	"accessibility_profiles": 6,
	"budget_profiles": 8,
	"test_scenarios": 8,
}

var _checks := 0
var _failures: Array[String] = []
var _hashes: Array[String] = []


func _ready() -> void:
	var semantic := _verify_semantic_registry()
	_verify_schema_and_manifest()
	_verify_source_index_and_round_trips(semantic)
	_verify_pack()
	_verify_migration_inventory()
	_verify_golden_targets()
	_verify_artifacts()
	_verify_negative_diagnostics(semantic)
	_verify_dependency_diagnostics(semantic)
	_hashes.sort()
	var deterministic_hash := ForgeStableRecord.hash_record({"hashes": _hashes})
	_check(deterministic_hash.length() == 64,
		"Set 23 deterministic aggregate hash is not SHA-256")
	if not EXPECTED_DETERMINISTIC_HASH.is_empty():
		_check(deterministic_hash == EXPECTED_DETERMINISTIC_HASH,
			"Set 23 deterministic aggregate hash drifted")
	var report := {
		"ok": _failures.is_empty(),
		"checks": _checks,
		"failures": _failures,
		"deterministic_hash": deterministic_hash,
	}
	print("SET23_FOUNDATION_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if _failures.is_empty() else 1)


func _verify_semantic_registry() -> ForgeSemanticRegistry:
	var semantic := ForgeSemanticRegistry.new()
	var report := semantic.load_and_validate()
	_check(bool(report.get("ok", false)),
		"shared semantic registry rejected Set 23 roles")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"shared semantic registry emitted Set 23 diagnostics")
	var expected_counts := {
		"anchor": 6, "region": 4, "path": 3, "mask": 6,
		"portal": 4, "runtime_anchor": 5, "socket": 18, "zone": 14,
		"capture_profile": 6,
	}
	for family in expected_counts:
		_check(semantic.filtered_list(family).size() == expected_counts[family],
			"Set 23 semantic family count drifted: %s" % family)
	var aliases := {
		"spatial.socket.creature.breath_origin": "socket.vfx.breath_origin",
		"presentation.spatial.machine.furnace.chimney": "socket.vfx.chimney",
		"surface.mask.rune_glow": "mask.surface.rune_glow",
		"acoustic.zone.workshop_interior": "zone.audio.workshop_interior",
		"acoustic.portal.front_door": "portal.audio.front_door",
		"spatial.runtime_anchor.block.mining_impact": (
			"runtime_anchor.block.mining_impact"),
	}
	for alias_id in aliases:
		var canonical_id := str(aliases[alias_id])
		_check(semantic.canonical_id(alias_id) == canonical_id,
			"Set 23 spatial alias resolved in the wrong direction")
		_check(str(semantic.resolve(alias_id).get("id", "")) == canonical_id,
			"Set 23 semantic alias did not resolve its canonical record")
		_check(semantic.canonical_id(canonical_id) == canonical_id,
			"Set 23 semantic canonicalisation is not idempotent")
	for stable_id in [
		"presentation.profile.contact.mining.stone",
		"presentation.binding.block.mining.stone",
		"event.block.mining_impact", "state.machine.active",
		"parameter.machine.heat_ratio", "context.schema.presentation.foundation",
		"vfx.effect.contact.mining.stone", "vfx.family.debris.stone",
		"vfx.graph.template.burst", "vfx.form.debris.stone",
		"sound.event.machine.furnace.work_loop", "sound.family.footstep.boot",
		"sound.source.contact.stone", "surface.layer.environment.wetness",
		"material.presentation.stone.foundation",
		"acoustic.profile.room.workshop", "audio.snapshot.workshop",
		"budget.profile.presentation.foundation",
		"access.profile.warning.ward_breach",
		"test.presentation.mining_impact",
		"pack.presentation.leyforge.foundation",
		"migration.presentation.legacy.smoke",
		"spatial.reference.furnace.chimney", "anchor.presentation.center",
		"socket.vfx.chimney", "region.machine.hot_surface",
		"path.vfx.mana_flow", "mask.surface.rune_glow",
		"zone.audio.workshop_interior", "portal.audio.front_door",
		"runtime_anchor.block.mining_impact",
	]:
		_check(ForgeId.is_valid(stable_id),
			"Set 23 stable-ID syntax failed: %s" % stable_id)
		_check(ForgeId.is_supported_family(stable_id),
			"Set 23 stable-ID family is not registered: %s" % stable_id)
	_check(ForgeId.canonical_id("legacy.one", {
		"legacy.one": "legacy.two", "legacy.two": "event.probe.canonical",
	}) == "event.probe.canonical", "Forge ID alias chains did not canonicalise")
	_check(ForgeId.canonical_id("event.probe.canonical", {})
		== "event.probe.canonical", "Forge ID canonical values changed")
	return semantic


func _verify_schema_and_manifest() -> void:
	var schemas := ForgeSchemaRegistry.new()
	_check(schemas.filtered_list("presentation").size() == SCHEMA_IDS.size(),
		"Presentation schema family count drifted")
	for schema_id in SCHEMA_IDS:
		_check(schemas.has(schema_id),
			"Set 23 schema is not registered: %s" % schema_id)
		var record := schemas.resolve(schema_id)
		_check(int(record.get("version", 0)) == 1,
			"Set 23 schema version drifted: %s" % schema_id)
		_check(str(record.get("domain", "")) == "presentation",
			"Set 23 schema domain drifted: %s" % schema_id)

	var service := ForgeProjectManifestService.new()
	var report := service.load_and_validate()
	_check(bool(report.get("ok", false)),
		"Forge project manifest rejected Set 23 foundation")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"Forge project manifest emitted Set 23 diagnostics")
	_check((report.get("migration_steps", []) as Array).is_empty(),
		"canonical v2 project manifest required an in-memory migration")
	_check(service.manifest.schema_version == 2,
		"Forge project manifest is not schema v2")
	_check(str(service.manifest.feature_contract_versions.get("set20", ""))
		== "20H-v0.2", "Set 20 contract version was rewritten")
	_check(str(service.manifest.feature_contract_versions.get("set22", ""))
		== "22-stage1-v1", "Set 22 contract version was rewritten")
	_check(str(service.manifest.feature_contract_versions.get("set23", ""))
		== CONTRACT, "Set 23 feature contract is missing")
	_check(service.manifest.engine_feature == "4.6",
		"project manifest engine compatibility target drifted")
	_check(service.manifest.generated_product_policy == "replaceable_output",
		"generated products stopped being replaceable outputs")
	_check(service.filtered_list("presentation").size() == SCHEMA_IDS.size(),
		"manifest service did not expose all presentation schemas")
	for schema_id in SCHEMA_IDS:
		_check(service.has(schema_id),
			"manifest service did not expose Set 23 schema: %s" % schema_id)

	var legacy := ForgeProjectManifest.new()
	legacy.schema_version = 1
	legacy.feature_contract_versions = {}
	legacy.engine_feature = ""
	legacy.generated_product_policy = ""
	var migrations := ForgeMigrationService.new()
	var first := migrations.migrate_project_manifest(legacy)
	_check(bool(first.get("ok", false)) and legacy.schema_version == 2,
		"project manifest v1->v2 migration failed")
	_check(first.get("steps", []) == ["project-manifest:1->2"],
		"project manifest migration report drifted")
	_check(str(legacy.feature_contract_versions.get("set23", "")) == CONTRACT,
		"project manifest migration omitted Set 23 contract")
	var migrated_hash := legacy.canonical_hash()
	var second := migrations.migrate_project_manifest(legacy)
	_check(bool(second.get("ok", false))
		and (second.get("steps", []) as Array).is_empty(),
		"project manifest migration is not idempotent")
	_check(legacy.canonical_hash() == migrated_hash,
		"idempotent project manifest migration changed canonical data")
	var future := ForgeProjectManifest.new()
	future.schema_version = 99
	_check(not bool(migrations.migrate_project_manifest(future).get("ok", true)),
		"future project manifest schema did not block")


func _verify_source_index_and_round_trips(
		semantic: ForgeSemanticRegistry) -> void:
	var densities := ForgeDensityProfileRegistry.new()
	_check(bool(densities.load_and_validate(PackedStringArray(DENSITY_PATHS)).get(
		"ok", false)),
		"density registry failed before Set 23 indexing")
	var index := ForgeAssetIndex.new()
	var report := index.load_and_validate(PackedStringArray([
		"res://content/forge/entities",
		"res://content/forge/blueprints",
		"res://content/forge/materials/set22",
		"res://content/forge/presentation/set23",
	]), semantic, densities)
	_check(bool(report.get("ok", false)),
		"shared Forge index rejected Set 23 sources")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"shared Forge index retained Set 23 diagnostics")
	_check(int(report.get("record_count", 0)) == 68,
		"shared Forge index did not discover 45 Set 22 and 23 Set 23 sources")
	_check(int(report.get("alias_count", 0)) == 1,
		"shared Forge index alias count drifted")
	_check(index.has("presentation.spatial.definition.furnace.chimney"),
		"shared Forge index did not resolve a Set 23 import alias")
	_check(str(index.resolve(
		"presentation.spatial.definition.furnace.chimney").get(
			"stable_id", "")) == "spatial.reference.furnace.chimney",
		"shared Forge index alias resolved in the wrong direction")
	_check(index.has("entity.definition.template.humanoid_standard")
		and index.has("blueprint.leyforge.residential.small_cottage_a"),
		"Set 23 indexing displaced Set 22 sources")

	var presentation_records: Array[Dictionary] = []
	for record in index.filtered_list():
		if str(record.get("contract_version", "")) == CONTRACT:
			presentation_records.append(record)
	_check(presentation_records.size() == 23,
		"Set 23 fixture source count drifted")
	var schema_counts := {}
	DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path("user://set23_foundation_roundtrips"))
	for record in presentation_records:
		var stable_id := str(record.get("stable_id", ""))
		var schema_id := str(record.get("schema", ""))
		schema_counts[schema_id] = int(schema_counts.get(schema_id, 0)) + 1
		_check(ForgeId.is_valid(stable_id) and ForgeId.is_supported_family(stable_id),
			"indexed Set 23 fixture has an invalid stable ID")
		_check(str(record.get("contract_version", "")) == CONTRACT,
			"indexed Set 23 fixture contract version drifted")
		_check(str(record.get("source_status", ""))
			== "validated_foundation_contract"
			or str(record.get("source_status", ""))
			== "legacy_fallback_inventory",
			"indexed Set 23 fixture over- or under-claimed source status")
		_check(str(record.get("lifecycle", "")) in [
			"foundation", "active_fallback"],
			"indexed Set 23 fixture over-claimed production lifecycle")
		var path := index.foundation_path_for(stable_id)
		var resource := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE) \
			as ForgePresentationDefinition
		_check(resource != null,
			"indexed Set 23 fixture did not load as a foundation Resource")
		if resource == null:
			continue
		var diagnostics := ForgeValidationService.new().validate_presentation_source(
			resource, semantic)
		_check(diagnostics.is_empty(),
			"valid Set 23 fixture emitted presentation diagnostics")
		var first_hash := resource.canonical_hash()
		var second_hash := resource.canonical_hash()
		_check(first_hash.length() == 64 and first_hash == second_hash,
			"Set 23 Resource hash was not deterministic")
		var roundtrip_path := "user://set23_foundation_roundtrips/%s.tres" % (
			ForgeId.safe_filename(stable_id))
		_check(ResourceSaver.save(resource, roundtrip_path) == OK,
			"Set 23 Resource did not serialise")
		var loaded := ResourceLoader.load(
			roundtrip_path, "", ResourceLoader.CACHE_MODE_IGNORE) \
			as ForgePresentationDefinition
		_check(loaded != null and loaded.canonical_hash() == first_hash,
			"Set 23 Resource changed hash after round-trip")
		_hashes.append(first_hash)
	for schema_id in SCHEMA_IDS:
		_check(int(schema_counts.get(schema_id, 0)) >= 1,
			"Set 23 schema has no representative source fixture: %s" % schema_id)
	_check(int(schema_counts.get("leyforge.forge.spatial-reference", 0)) == 2,
		"Set 23 spatial schema did not retain authored and runtime-contact fixtures")


func _verify_pack() -> void:
	var pack := ResourceLoader.load(
		PACK_PATH, "", ResourceLoader.CACHE_MODE_IGNORE) \
		as ForgeContentPackManifest
	_check(pack != null, "Set 23 foundation content-pack manifest did not load")
	if pack == null:
		return
	_check(pack.schema_version == 2,
		"Set 23 foundation content pack changed schema")
	_check(pack.pack_id == "pack.presentation.leyforge.foundation",
		"Set 23 foundation content-pack ID drifted")
	_check(pack.contract_version == CONTRACT,
		"Set 23 foundation content-pack contract drifted")
	_check(pack.lifecycle == "foundation" and not pack.enabled_by_default,
		"Set 23 foundation content pack claimed runtime activation")
	_check(pack.override_policy == "declared_only",
		"Set 23 foundation content pack can bypass declared overrides")
	_check(pack.asset_ids.size() == 23,
		"Set 23 foundation content pack omitted schema fixtures")
	_check(pack.presentation_asset_ids.size() == 139,
		"Set 23 foundation content pack omitted Golden Core targets")
	_check(pack.provided_schema_ids.size() == SCHEMA_IDS.size(),
		"Set 23 foundation content pack omitted presentation schemas")
	_check(str(pack.required_contract_versions.get("set22", ""))
		== "22-stage1-v1", "Set 23 pack lost its Set 22 dependency contract")
	_check(str(pack.required_contract_versions.get("set23", "")) == CONTRACT,
		"Set 23 pack lost its own contract version")
	_check(ForgeValidationService.new().validate_presentation_pack_source(
		pack).is_empty(), "Set 23 foundation content pack did not validate")
	var contract := ForgePresentationContract.new()
	_check(contract.has_method("to_record")
		and contract.get("required_parts") != null,
		"existing asset Presentation Contract meaning was replaced")


func _verify_migration_inventory() -> void:
	var inventory := _json(INVENTORY_PATH)
	_check(str(inventory.get("schema", ""))
		== "leyforge.forge.presentation-migration-inventory",
		"presentation migration inventory schema drifted")
	_check(int(inventory.get("schema_version", 0)) == 1,
		"presentation migration inventory version drifted")
	_check(str(inventory.get("contract_version", "")) == CONTRACT,
		"presentation migration inventory contract drifted")
	_check(int(inventory.get("record_count", 0))
		== (inventory.get("records", []) as Array).size(),
		"presentation migration inventory count is inconsistent")
	_check(int(inventory.get("record_count", 0)) > 0,
		"presentation migration inventory is empty")
	_check(int(inventory.get("removal_count", -1)) == 0,
		"presentation foundation removed legacy content")
	var coverage: Dictionary = inventory.get("coverage_status", {})
	for category in [
		"particle_node", "audio_node", "direct_audio_media", "direct_light_node",
		"hardcoded_effect_dispatch", "hardcoded_material_response",
		"scene_path_presentation", "caption_or_warning",
		"stable_presentation_reference", "unnamed_transform",
	]:
		_check(coverage.has(category),
			"presentation migration coverage omitted: %s" % category)
	_check(str(coverage.get("unnamed_transform", "")) == "manual_review_open",
		"unnamed transform audit was falsely closed")
	var ids := {}
	for record in inventory.get("records", []):
		var target_id := str(record.get("target_id", ""))
		_check(not target_id.is_empty() and not ids.has(target_id),
			"presentation migration target ID is empty or duplicated")
		ids[target_id] = true
		for field in [
			"subject_type", "target_id", "lifecycle", "contract_version",
			"dependency_information", "replacement_strategy", "fallback",
			"fallback_id", "removal_gate", "review_history", "source_schema_id",
			"target_schema_id", "transformation_version", "status",
		]:
			_check(record.has(field),
				"presentation migration record omitted field: %s" % field)
		_check(str(record.get("replacement_strategy", "")) in [
			"wrap", "convert", "replace", "defer", "preserve"],
			"presentation migration classification is invalid")
		_check(bool(record.get("fallback_active", false)),
			"presentation migration disabled its legacy fallback")
		_check(str(record.get("contract_version", "")) == CONTRACT,
			"presentation migration record contract drifted")
		_check(str(record.get("manual_review", "")) == "open",
			"presentation migration record falsely closed manual review")
	_check(str(inventory.get("manual_visual_approval", "")) == "open",
		"presentation inventory falsely closed visual approval")
	_check(str(inventory.get("manual_audio_rights_review", "")) == "open",
		"presentation inventory falsely closed audio rights review")
	_check(_embedded_hash_matches(inventory, "inventory_hash"),
		"presentation migration inventory hash is not deterministic")
	_hashes.append(str(inventory.get("inventory_hash", "")))


func _verify_golden_targets() -> void:
	var targets := _json(TARGET_PATH)
	_check(str(targets.get("schema", ""))
		== "leyforge.forge.presentation-golden-core-targets",
		"Golden Core target schema drifted")
	_check(str(targets.get("contract_version", "")) == CONTRACT,
		"Golden Core target contract drifted")
	_check(bool(targets.get("all_targets_new_work", false)),
		"Golden Core baseline falsely claims migrated content")
	_check(str(targets.get("manual_approval", "")) == "open",
		"Golden Core baseline falsely closed manual approval")
	var libraries: Dictionary = targets.get("libraries", {})
	var all_ids := {}
	var total := 0
	for library in EXPECTED_TARGET_COUNTS:
		var records: Array = libraries.get(library, [])
		_check(records.size() == int(EXPECTED_TARGET_COUNTS[library]),
			"Golden Core library target count drifted: %s" % library)
		_check(int(targets.get("counts", {}).get(library, -1))
			== int(EXPECTED_TARGET_COUNTS[library]),
			"Golden Core summary count drifted: %s" % library)
		for record in records:
			var stable_id := str(record.get("stable_id", ""))
			_check(ForgeId.is_valid(stable_id)
				and ForgeId.is_supported_family(stable_id),
				"Golden Core target stable ID is invalid")
			_check(not all_ids.has(stable_id),
				"Golden Core target stable ID is duplicated")
			all_ids[stable_id] = true
			_check(str(record.get("lifecycle", "")) == "planned_new_work"
				and str(record.get("source_status", "")) == "new_work"
				and str(record.get("production_status", "")) == "not_started",
				"Golden Core target was falsely labelled as produced")
			_check(str(record.get("manual_visual_approval", "")) == "open"
				and str(record.get("manual_audio_approval", "")) == "open",
				"Golden Core target falsely closed specialist approval")
			_check(str(record.get("rights_status", "")) == "not_assessed",
				"Golden Core target falsely claimed source rights")
			total += 1
	_check(total == 139 and all_ids.size() == 139,
		"Golden Core total target count drifted")
	_check(_embedded_hash_matches(targets, "target_hash"),
		"Golden Core target hash is not deterministic")
	_hashes.append(str(targets.get("target_hash", "")))


func _verify_artifacts() -> void:
	var artifact_names := [
		"contract_baseline.json", "dependency_snapshot.json",
		"golden_core_baseline.json", "legacy_fallback_register.json",
		"performance_baseline.json",
		"presentation_current_state_capture_sheet.json",
		"presentation_current_state_capture_sheet.svg",
		"toolchain_baseline.json",
	]
	for name in artifact_names:
		var path := ARTIFACT_ROOT.path_join(name)
		_check(FileAccess.file_exists(path)
			and FileAccess.get_file_as_bytes(path).size() > 100,
			"Set 23 verification artifact is missing or empty: %s" % name)
	var contract := _json(ARTIFACT_ROOT.path_join("contract_baseline.json"))
	_check(str(contract.get("runtime_status", "")) == "not_started"
		and str(contract.get("vfx_simulation_status", "")) == "not_started"
		and str(contract.get("audio_mixing_status", "")) == "not_started",
		"Set 23 contract baseline claimed later runtime work")
	_check(str(contract.get("manual_approval", "")) == "open",
		"Set 23 contract baseline closed manual approval")
	var toolchain := _json(ARTIFACT_ROOT.path_join("toolchain_baseline.json"))
	_check(str(toolchain.get("project_godot_feature", "")) == "4.6",
		"Set 23 toolchain baseline changed project compatibility")
	_check(str(toolchain.get("engine_upgrade_status", "")) == "not_requested",
		"Set 23 toolchain baseline claimed an engine upgrade")
	_check(str(toolchain.get("export_package_status", "")) == "not_started",
		"Set 23 toolchain baseline claimed export/package work")
	_check(str(toolchain.get("main_scene_change", ""))
		== "forbidden_for_milestone", "Set 23 baseline allowed main scene changes")
	var performance := _json(ARTIFACT_ROOT.path_join("performance_baseline.json"))
	_check(str(performance.get("set23_runtime_implementation", ""))
		== "not_started", "Set 23 performance baseline claimed runtime work")
	_check(str(performance.get("runtime_cpu_measurement", "")) == "open"
		and str(performance.get("runtime_gpu_measurement", "")) == "open"
		and str(performance.get("audio_voice_measurement", "")) == "open",
		"Set 23 performance baseline fabricated runtime measurements")
	var golden := _json(ARTIFACT_ROOT.path_join("golden_core_baseline.json"))
	_check(str(golden.get("production_status", "")) == "not_started",
		"Set 23 Golden Core artifact claimed production completion")
	_check(str(golden.get("rights_review", "")) == "open",
		"Set 23 Golden Core artifact claimed legal clearance")
	var fallback := _json(ARTIFACT_ROOT.path_join("legacy_fallback_register.json"))
	_check(int(fallback.get("record_count", 0))
		== (fallback.get("records", []) as Array).size(),
		"Set 23 legacy fallback register count is inconsistent")
	_check(int(fallback.get("removal_count", -1)) == 0,
		"Set 23 fallback register removed legacy presentation")
	var capture := _json(
		ARTIFACT_ROOT.path_join("presentation_current_state_capture_sheet.json"))
	_check(int(capture.get("runtime_replacements", -1)) == 0,
		"Set 23 current-state capture claimed runtime replacements")
	_check(str(capture.get("manual_capture_review", "")) == "open",
		"Set 23 current-state capture falsely closed manual review")
	for value in [contract, toolchain, performance, golden, fallback, capture]:
		for key in [
			"baseline_hash", "register_hash", "capture_hash",
		]:
			if value.has(key):
				_check(_embedded_hash_matches(value, key),
					"Set 23 artifact embedded hash drifted: %s" % key)
				_hashes.append(str(value.get(key, "")))


func _verify_negative_diagnostics(semantic: ForgeSemanticRegistry) -> void:
	var validator := ForgeValidationService.new()
	var event := ForgePresentationEventContract.new()
	event.stable_id = "event.probe.invalid"
	event.owner_system = "probe"
	event.payload_fields = {"broken": {}}
	event.schema_version = 99
	var event_diagnostics := validator.validate_presentation_source(event, semantic)
	_check(_has_diagnostic(event_diagnostics, "REG-001"),
		"unsupported presentation schema did not emit REG-001")
	_check(_has_diagnostic(event_diagnostics, "EVT-002"),
		"malformed event payload did not emit EVT-002")

	var binding := ForgePresentationBinding.new()
	binding.stable_id = "presentation.binding.probe.invalid"
	binding.owner_id = "probe.owner"
	binding.profile_id = "presentation.profile.probe"
	binding.event_contract_id = "event.probe.invalid"
	var binding_diagnostics := validator.validate_presentation_source(
		binding, semantic)
	_check(_has_diagnostic(binding_diagnostics, "SPT-001"),
		"binding without a spatial role did not emit SPT-001")

	var path := ForgeSpatialReference.new()
	path.stable_id = "spatial.reference.probe.invalid_path"
	path.owner_asset_id = "probe.owner"
	path.spatial_type = "path"
	path.semantic_role_id = "path.vfx.not_registered"
	path.point_records = [{"position": [0, 0, 0]}]
	var spatial_diagnostics := validator.validate_presentation_source(path, semantic)
	_check(_has_diagnostic(spatial_diagnostics, "SPT-001"),
		"invalid spatial path did not emit SPT-001")

	var graph := ForgeVfxGraph.new()
	graph.stable_id = "vfx.graph.probe.cycle"
	graph.nodes = [{"id": "a"}, {"id": "b"}]
	graph.edges = [{"from": "a", "to": "b"}, {"from": "b", "to": "a"}]
	var graph_diagnostics := validator.validate_presentation_source(graph, semantic)
	_check(_has_diagnostic(graph_diagnostics, "VFX-002"),
		"cyclic VFX graph did not emit VFX-002")

	var form := ForgeVfxForm.new()
	form.stable_id = "vfx.form.probe.invalid"
	form.maximum_cells = 0
	_check(_has_diagnostic(validator.validate_presentation_source(form, semantic),
		"VFX-001"), "invalid voxel VFX form did not emit VFX-001")

	var surface := ForgeSurfaceLayer.new()
	surface.stable_id = "surface.layer.probe.unbounded"
	surface.persistence_policy = "persistent"
	_check(_has_diagnostic(validator.validate_presentation_source(
		surface, semantic), "VFX-004"),
		"unbounded persistent surface did not emit VFX-004")

	var sound := ForgeSoundEvent.new()
	sound.stable_id = "sound.event.probe.invalid"
	sound.loop_policy = "unbounded"
	sound.maximum_voices = 0
	sound.critical_cue = true
	var sound_diagnostics := validator.validate_presentation_source(sound, semantic)
	_check(_has_diagnostic(sound_diagnostics, "SND-001"),
		"invalid Sound Event did not emit SND-001")
	_check(_has_diagnostic(sound_diagnostics, "SND-003"),
		"critical Sound Event without caption did not emit SND-003")

	var source := ForgeSoundSource.new()
	source.stable_id = "sound.source.probe.unlicensed"
	source.lifecycle = "golden_source_candidate"
	source.rights_status = "not_assessed"
	var source_diagnostics := validator.validate_presentation_source(source, semantic)
	_check(_has_diagnostic(source_diagnostics, "SRC-001"),
		"missing sound source did not emit SRC-001")
	_check(_has_diagnostic(source_diagnostics, "LIC-001"),
		"unlicensed golden sound source did not emit LIC-001")

	var accessibility := ForgeAccessibilityProfile.new()
	accessibility.stable_id = "access.profile.probe.invalid"
	accessibility.critical_event_ids = PackedStringArray(["event.probe.critical"])
	_check(_has_diagnostic(validator.validate_presentation_source(
		accessibility, semantic), "ACC-001"),
		"critical accessibility gap did not emit ACC-001")

	var budget := ForgePresentationBudgetProfile.new()
	budget.stable_id = "budget.profile.probe.invalid"
	var budget_diagnostics := validator.validate_presentation_source(
		budget, semantic)
	_check(_has_diagnostic(budget_diagnostics, "BUD-001"),
		"missing presentation limits did not emit BUD-001")
	_check(_has_diagnostic(budget_diagnostics, "BUD-002"),
		"missing budget fallback did not emit BUD-002")

	var mix := ForgeMixSnapshot.new()
	mix.stable_id = "audio.snapshot.probe.invalid"
	mix.protected_bus_ids = PackedStringArray(["audio.bus.critical"])
	mix.bus_targets_db = {"audio.bus.critical": -80.0}
	_check(_has_diagnostic(validator.validate_presentation_source(mix, semantic),
		"ACU-002"), "critical mix masking did not emit ACU-002")

	var material := ForgeMaterialResponseTable.new()
	material.stable_id = "material.presentation.probe.invalid"
	_check(_has_diagnostic(validator.validate_presentation_source(
		material, semantic), "REG-003"),
		"material response without fallback did not emit REG-003")

	var scenario := ForgePresentationTestScenario.new()
	scenario.stable_id = "test.presentation.probe.invalid"
	_check(_has_diagnostic(validator.validate_presentation_source(
		scenario, semantic), "TST-001"),
		"empty presentation scenario did not emit TST-001")

	var pack := ForgeContentPackManifest.new()
	pack.pack_id = "pack.presentation.probe.invalid"
	pack.contract_version = CONTRACT
	pack.dependencies = PackedStringArray([pack.pack_id])
	pack.override_policy = "unrestricted"
	pack.provided_schema_ids = PackedStringArray(["leyforge.forge.missing"])
	var pack_diagnostics := validator.validate_presentation_pack_source(pack)
	_check(_has_diagnostic(pack_diagnostics, "PAK-001"),
		"invalid pack dependency did not emit PAK-001")
	_check(_has_diagnostic(pack_diagnostics, "PAK-002"),
		"unsafe pack override did not emit PAK-002")
	_check(_has_diagnostic(pack_diagnostics, "PAK-003"),
		"missing pack schema did not emit PAK-003")

	var migration := ForgeMigrationRecord.new()
	migration.subject_type = "presentation"
	migration.target_id = "migration.presentation.probe.invalid"
	migration.replacement_strategy = "wrap"
	migration.lifecycle = "active_fallback"
	migration.fallback = ""
	migration.fallback_id = ""
	migration.status = "blocked"
	migration.blocked_reason = "probe"
	var migration_diagnostics := validator.validate_presentation_migration_source(
		migration)
	_check(_has_diagnostic(migration_diagnostics, "MIG-001"),
		"migration without fallback did not emit MIG-001")
	_check(_has_diagnostic(migration_diagnostics, "MIG-002"),
		"blocked migration did not emit MIG-002")
	_check(validator.has_blockers(source_diagnostics)
		and validator.has_blockers(pack_diagnostics)
		and validator.has_blockers(migration_diagnostics),
		"new blocker severities did not block validation")
	var summary := validator.summarize(accessibility_diagnostics(accessibility, semantic))
	_check(int(summary.get("critical_release_blocker", 0)) == 1,
		"critical release blocker was omitted from diagnostic summary")


func accessibility_diagnostics(
		profile: ForgeAccessibilityProfile,
		semantic: ForgeSemanticRegistry) -> Array[ForgeDiagnostic]:
	return ForgeValidationService.new().validate_presentation_source(
		profile, semantic)


func _verify_dependency_diagnostics(semantic: ForgeSemanticRegistry) -> void:
	var root := "user://set23_dependency_probe"
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(root))
	var missing := ForgePresentationProfile.new()
	missing.stable_id = "presentation.profile.probe.missing_dependency"
	missing.component_ids = {"vfx": "vfx.effect.probe.missing"}
	missing.dependency_ids = PackedStringArray(["vfx.effect.probe.missing"])
	ResourceSaver.save(missing, root.path_join("missing.tres"))

	var cycle_a := ForgeVfxFamily.new()
	cycle_a.stable_id = "vfx.family.probe.cycle_a"
	cycle_a.default_graph_id = "vfx.graph.probe.placeholder"
	cycle_a.fallback_effect_id = "vfx.effect.probe.placeholder"
	cycle_a.dependency_ids = PackedStringArray(["vfx.family.probe.cycle_b"])
	ResourceSaver.save(cycle_a, root.path_join("cycle_a.tres"))
	var cycle_b := ForgeVfxFamily.new()
	cycle_b.stable_id = "vfx.family.probe.cycle_b"
	cycle_b.default_graph_id = "vfx.graph.probe.placeholder"
	cycle_b.fallback_effect_id = "vfx.effect.probe.placeholder"
	cycle_b.dependency_ids = PackedStringArray([cycle_a.stable_id])
	ResourceSaver.save(cycle_b, root.path_join("cycle_b.tres"))

	for suffix in ["a", "b"]:
		var duplicate := ForgePresentationProfile.new()
		duplicate.stable_id = "presentation.profile.probe.duplicate"
		duplicate.component_ids = {"vfx": "vfx.effect.probe.placeholder"}
		ResourceSaver.save(duplicate, root.path_join("duplicate_%s.tres" % suffix))

	var index := ForgeAssetIndex.new()
	var report := index.load_and_validate(PackedStringArray([root]), semantic)
	var diagnostics: Array = report.get("diagnostics", [])
	_check(not bool(report.get("ok", true)),
		"invalid presentation dependency fixture passed validation")
	_check(_has_record_diagnostic(diagnostics, "REG-001"),
		"missing or duplicate presentation ID did not emit REG-001")
	_check(_has_record_diagnostic(diagnostics, "REG-004"),
		"presentation dependency cycle did not emit REG-004")


func _has_diagnostic(
		diagnostics: Array[ForgeDiagnostic], code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic.code == code:
			return true
	return false


func _has_record_diagnostic(diagnostics: Array, code: String) -> bool:
	for diagnostic in diagnostics:
		if str(diagnostic.get("code", "")) == code:
			return true
	return false


func _embedded_hash_matches(record: Dictionary, key: String) -> bool:
	var expected := str(record.get(key, ""))
	var source := record.duplicate(true)
	source.erase(key)
	return expected.length() == 64 \
		and ForgeStableRecord.hash_json_record(source) == expected


func _json(path: String) -> Dictionary:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}


func _check(condition: bool, message: String) -> void:
	_checks += 1
	if not condition:
		_failures.append(message)
