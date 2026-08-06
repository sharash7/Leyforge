@tool
class_name ForgeMigrationService
extends RefCounted
## Explicit schema migration registry. It never changes gameplay IDs.


func migrate_asset(asset: ForgeAssetDefinition) -> Dictionary:
	if asset == null:
		return {"ok": false, "error": "Asset is missing."}
	var from_version := asset.schema_version
	if from_version > ForgeAssetDefinition.CURRENT_SCHEMA_VERSION:
		return {
			"ok": false,
			"error": "Source schema is newer than this Forge.",
			"from_version": from_version,
		}
	var steps: Array[String] = []
	while asset.schema_version < ForgeAssetDefinition.CURRENT_SCHEMA_VERSION:
		match asset.schema_version:
			0:
				_migrate_asset_0_to_1(asset)
				steps.append("asset:0->1")
			_:
				return {
					"ok": false,
					"error": "No registered source migration.",
					"from_version": asset.schema_version,
				}
	return {
		"ok": true,
		"from_version": from_version,
		"to_version": asset.schema_version,
		"steps": steps,
	}


func migrate_project_manifest(manifest: ForgeProjectManifest) -> Dictionary:
	if manifest == null:
		return {"ok": false, "error": "Project manifest is missing."}
	var from_version := manifest.schema_version
	if from_version > 2 or from_version < 1:
		return {
			"ok": false,
			"error": "Project manifest schema is unsupported.",
			"from_version": from_version,
		}
	var steps: Array[String] = []
	if manifest.schema_version == 1:
		if manifest.feature_contract_versions.is_empty():
			manifest.feature_contract_versions = {
				"set22": manifest.contract_version,
				"set23": "23-foundation-v1",
			}
		manifest.engine_feature = "4.6"
		manifest.rendering_method = "gl_compatibility"
		manifest.generated_product_policy = "replaceable_output"
		manifest.schema_version = 2
		steps.append("project-manifest:1->2")
	return {
		"ok": true,
		"from_version": from_version,
		"to_version": manifest.schema_version,
		"steps": steps,
	}


func build_migration_record(
		record: Dictionary, status := "unreviewed") -> ForgeMigrationRecord:
	var migration := ForgeMigrationRecord.new()
	migration.subject_type = str(record.get("subject_type", "gameplay_presentation"))
	migration.target_id = str(record.get(
		"target_id", record.get("presentation_id", record.get("gameplay_id", ""))))
	migration.lifecycle = str(record.get("lifecycle", "active_fallback"))
	migration.contract_version = str(record.get(
		"contract_version", "22-foundation-v1"))
	migration.dependency_information = record.get(
		"dependency_information", {}).duplicate(true)
	migration.replacement_strategy = str(record.get(
		"replacement_strategy", "preserve_fallback"))
	migration.fallback_id = str(record.get("fallback_id", "legacy_runtime"))
	migration.removal_gate = str(record.get(
		"removal_gate", "approved_replacement_and_regression_evidence"))
	migration.review_history = record.get("review_history", []).duplicate(true)
	migration.gameplay_id = str(record.get("gameplay_id", ""))
	migration.presentation_id = str(record.get("presentation_id", ""))
	migration.display_name = str(record.get("display_name", ""))
	migration.family = str(record.get("category", ""))
	migration.current_source = (
		"forge_source"
		if str(record.get("source_status", "")) != "legacy_wrapper"
		else "legacy_runtime")
	migration.classification = (
		"mvp_golden" if migration.current_source == "forge_source"
		else "unreviewed")
	migration.target_forge_mode = str(record.get("authoring_mode", "surface"))
	migration.status = status
	migration.fallback = "legacy_runtime"
	return migration


func _migrate_asset_0_to_1(asset: ForgeAssetDefinition) -> void:
	if asset.presentation_id.is_empty() and not asset.gameplay_links.is_empty():
		asset.presentation_id = ForgeId.presentation_id_for(
			asset.gameplay_links[0])
	if asset.source_pack_id.is_empty():
		asset.source_pack_id = "pack.leyforge.project_visuals"
	asset.schema_version = 1
	asset.bump_revision()
