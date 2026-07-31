extends SceneTree
## Maintenance utility: refreshes approved Forge products only when their
## manifest no longer matches the canonical source. It never saves source files.


func _initialize() -> void:
	call_deferred("_run")


func _run() -> void:
	ForgeAccessPolicy.test_override = true
	var index := ForgeAssetIndex.new()
	var summary := index.rebuild()
	var refreshed := PackedStringArray()
	var current := PackedStringArray()
	var failures: Array[Dictionary] = []
	for record in index.all_records():
		if str(record.get("source_status", "")) != "approved":
			continue
		var source_id := str(record.get("forge_asset_id", ""))
		var source_path := index.path_for_source_id(source_id)
		var asset_resource := ResourceLoader.load(
			source_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if not asset_resource is ForgeAssetDefinition:
			failures.append({
				"source_id": source_id,
				"error": "Approved source could not be loaded.",
			})
			continue
		var asset: ForgeAssetDefinition = asset_resource
		var manifest_path := (
			"res://generated/forge/manifests/%s.tres"
			% ForgeId.safe_filename(asset.presentation_id))
		var manifest_resource := ResourceLoader.load(
			manifest_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if manifest_resource is ForgeBakeManifest \
				and manifest_resource.approved_status == "approved" \
				and manifest_resource.source_hash == asset.canonical_hash() \
				and manifest_resource.baker_version \
					== ForgeBakeService.BAKER_VERSION:
			current.append(source_id)
			continue
		var contract := _load_contract(asset.presentation_contract_id)
		var result := ForgeBakeService.new().bake(asset, contract, true)
		if bool(result.get("ok", false)):
			refreshed.append(source_id)
		else:
			failures.append({
				"source_id": source_id,
				"error": str(result.get("error", "Bake failed.")),
			})
	ForgeAccessPolicy.clear_test_override()
	var report := {
		"ok": failures.is_empty(),
		"approved_sources": int(
			summary.get("status_counts", {}).get("approved", 0)),
		"refreshed": Array(refreshed),
		"already_current": Array(current),
		"failures": failures,
	}
	print("FORGE_STALE_REBAKE %s" % JSON.stringify(report))
	quit(0 if failures.is_empty() else 1)


func _load_contract(contract_id: String) -> ForgePresentationContract:
	if contract_id.is_empty():
		return null
	var path := "res://content/forge/contracts/%s.tres" % (
		ForgeId.safe_filename(contract_id))
	var resource := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE)
	return resource if resource is ForgePresentationContract else null
