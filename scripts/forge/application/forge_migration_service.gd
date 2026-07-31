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


func build_migration_record(
		record: Dictionary, status := "unreviewed") -> ForgeMigrationRecord:
	var migration := ForgeMigrationRecord.new()
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
