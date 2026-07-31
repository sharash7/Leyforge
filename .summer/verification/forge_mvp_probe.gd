extends Node
## Documents 21A-21F Voxel Asset Forge MVP regression contract.

const ChunkMesherScript = preload("res://scripts/world/chunk_mesher.gd")
const ForgeHostScene = preload("res://forge_runtime_host.tscn")

const GOLDEN_GAMEPLAY_IDS := [
	"terrain.grass.basic",
	"construction.brick.stone",
	"automation.transport.chute",
	"functional.furnace.stone",
	"item.tool.crude_pickaxe",
	"magic.conduit.mana_basic",
	"automation.crusher.basic",
]

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	ForgeAccessPolicy.test_override = true
	_test_access_and_identity()
	_test_asset_index_and_sources()
	_test_domain_and_bakers()
	_test_connections_overrides_and_dependencies()
	await _test_runtime_packages_and_consumers()
	await _test_workspace_and_persistence()
	_test_migration_register()
	ForgeAccessPolicy.clear_test_override()
	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}
	print("FORGE_MVP_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_access_and_identity() -> void:
	_check(
		ProjectSettings.get_setting("application/run/main_scene", "") \
			== "res://main_menu.tscn",
		"main menu is not the default startup scene")
	_check(
		ForgeAccessPolicy.is_development_enabled(),
		"development access policy rejected the Forge")
	ForgeAccessPolicy.test_override = false
	_check(
		not ForgeAccessPolicy.is_development_enabled(),
		"release access policy exposed the Forge")
	ForgeAccessPolicy.test_override = true
	var bridge := ForgeRegistryBridge.new()
	var records := bridge.all_gameplay_records()
	_check(records.size() == 312, "Forge bridge did not index 312 registry records")
	var block_count := 0
	var item_count := 0
	var stable_ids := {}
	for record in records:
		if str(record.get("kind", "")) == "block":
			block_count += 1
		elif str(record.get("kind", "")) == "item":
			item_count += 1
		var stable_id := str(record.get("gameplay_id", ""))
		_check(not stable_ids.has(stable_id), "Forge bridge duplicated %s" % stable_id)
		stable_ids[stable_id] = true
	_check(block_count == 143, "Forge changed the 143-block registry boundary")
	_check(item_count == 169, "Forge changed the 169-item registry boundary")
	_check(
		WorldManager.CURRENT_SAVE_VERSION == 17,
		"Forge unexpectedly changed save schema v17")
	_check(
		bridge.record_for("automation.transport.chute").get(
			"authoring_mode", "") == "voxel",
		"chute was not routed to voxel authoring")
	_check(
		bridge.record_for("functional.furnace.stone").get(
			"authoring_mode", "") == "compound",
		"furnace was not routed to compound authoring")
	_check(
		bridge.record_for("terrain.grass.basic").get(
			"authoring_mode", "") == "surface",
		"grass was not routed to surface authoring")
	var door_record := bridge.record_for("construction.door.oak")
	var door_draft := ForgeDocumentService.new().create_from_registry(
		door_record)
	_check(
		door_draft.authoring_profile == "voxel.standard.door_1x2" \
			and door_draft.footprint_profile.occupied_cells \
				== [Vector3i.ZERO, Vector3i.UP],
		"new door drafts do not reserve both world-height cells")
	_check(
		is_equal_approx(float(
			door_draft.collision_profile.boxes[0]["maximum"][1]), 2.0),
		"new door collision does not cover its two-block height")
	var invalid_door: ForgeAssetDefinition = door_draft.duplicate(true)
	invalid_door.footprint_profile = (
		invalid_door.footprint_profile.duplicate(true))
	invalid_door.footprint_profile.occupied_cells.assign([Vector3i.ZERO])
	_check(
		_has_diagnostic_code(
			ForgeValidationService.new().validate_asset(invalid_door),
			"FORGE-FOOT-004"),
		"validation did not reject a one-cell-tall door footprint")


func _test_asset_index_and_sources() -> void:
	var index := ForgeAssetIndex.new()
	var summary := index.rebuild()
	_check(int(summary["asset_count"]) == 312, "asset index lost registry coverage")
	_check(
		int(summary["status_counts"].get("approved", 0)) == 7,
		"asset index did not find seven approved MVP sources")
	_check(
		int(summary["status_counts"].get("legacy_wrapper", 0)) == 305,
		"legacy wrapper count no longer preserves unmigrated presentations")
	_check(
		summary["diagnostics"].is_empty(),
		"asset index reported duplicate or invalid source IDs")
	var validation := ForgeValidationService.new()
	for gameplay_id in GOLDEN_GAMEPLAY_IDS:
		var source_id := ForgeId.source_id_for(gameplay_id)
		var path := index.path_for_source_id(source_id)
		_check(not path.is_empty(), "golden source path missing for %s" % gameplay_id)
		var asset := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(
			asset is ForgeAssetDefinition,
			"golden source is not a ForgeAssetDefinition: %s" % gameplay_id)
		if not asset is ForgeAssetDefinition:
			continue
		_check(asset.source_status == "approved", "golden source is not approved")
		_check(
			asset.gameplay_links == PackedStringArray([gameplay_id]),
			"golden source changed its stable gameplay link")
		_check(
			asset.presentation_id == ForgeId.presentation_id_for(gameplay_id),
			"golden source changed its presentation identity")
		var contract := _load_contract(asset.presentation_contract_id)
		var diagnostics := validation.validate_asset(asset, contract)
		_check(
			not validation.has_blockers(diagnostics),
			"golden source has validation blockers: %s" % gameplay_id)
		_check(
			not asset.canonical_hash().is_empty(),
			"golden source has no canonical hash")
		var manifest_path := (
			"res://generated/forge/manifests/%s.tres"
			% ForgeId.safe_filename(asset.presentation_id))
		var manifest_resource := ResourceLoader.load(
			manifest_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		var manifest_valid: bool = (
			manifest_resource is ForgeBakeManifest
			and manifest_resource.approved_status == "approved")
		_check(
			manifest_valid,
			"golden source has no approved bake manifest: %s" % gameplay_id)
		var source_in_sync := false
		var products_valid := false
		if manifest_resource is ForgeBakeManifest:
			var manifest: ForgeBakeManifest = manifest_resource
			source_in_sync = manifest.source_hash == asset.canonical_hash()
			products_valid = not manifest.products.is_empty()
			for product in manifest.products:
				var product_path := str(product.get("path", ""))
				var expected_hash := str(product.get("hash", ""))
				products_valid = products_valid \
					and FileAccess.file_exists(product_path) \
					and not expected_hash.is_empty() \
					and FileAccess.get_sha256(product_path) == expected_hash
		_check(
			source_in_sync,
			"golden source has unbaked edits: %s" % gameplay_id)
		_check(
			products_valid,
			"golden bake manifest product integrity failed: %s" % gameplay_id)
	var furnace_path := index.path_for_source_id(
		"forge_asset.functional.furnace.stone")
	var furnace: ForgeAssetDefinition = ResourceLoader.load(
		furnace_path, "", ResourceLoader.CACHE_MODE_IGNORE)
	var furnace_contract := _load_contract(
		furnace.presentation_contract_id)
	var missing_socket: ForgeAssetDefinition = furnace.duplicate(true)
	var retained_sockets: Array[Resource] = []
	for socket in missing_socket.sockets:
		if socket is ForgeSocketDefinition and socket.socket_key != "smoke":
			retained_sockets.append(socket)
	missing_socket.sockets = retained_sockets
	_check(
		_has_diagnostic_code(
			validation.validate_asset(missing_socket, furnace_contract),
			"FORGE-CONTRACT-002"),
		"validation did not catch a missing required socket")
	var wrong_footprint: ForgeAssetDefinition = furnace.duplicate(true)
	wrong_footprint.footprint_profile = (
		wrong_footprint.footprint_profile.duplicate(true))
	wrong_footprint.footprint_profile.footprint_profile_id = (
		"footprint.presentation.invalid")
	_check(
		_has_diagnostic_code(
			validation.validate_asset(wrong_footprint, furnace_contract),
			"FORGE-CONTRACT-010"),
		"validation did not block a contract footprint mismatch")
	var work_cycle: Dictionary = furnace.animation_set.get_clip("work_cycle")
	var gear_keys: Array = work_cycle.get("tracks", [])[0].get("keys", []) \
		if not work_cycle.get("tracks", []).is_empty() else []
	_check(
		gear_keys.size() == 5 \
			and float(gear_keys[1]["value"][2]) > 0.7 \
			and is_equal_approx(float(gear_keys[4]["value"][3]), -1.0),
		"furnace gear source does not describe a continuous full Z rotation")


func _test_domain_and_bakers() -> void:
	var palette := ForgePaletteDefinition.new()
	palette.ensure_default_entries()
	var volume := ForgeVoxelVolume.new()
	volume.dimensions = Vector3i(2, 1, 1)
	volume.voxel_size_meters = 0.5
	volume.ensure_storage()
	volume.set_cell(Vector3i(0, 0, 0), 0)
	volume.set_cell(Vector3i(1, 0, 0), 0)
	var first := ForgeMeshBaker.bake(volume, palette)
	var second := ForgeMeshBaker.bake(volume, palette)
	_check(bool(first.get("ok", false)), "two-cell mesh bake failed")
	_check(
		int(first["metrics"]["exposed_faces"]) == 10,
		"mesh baker did not remove the shared hidden face")
	_check(
		first["mesh"].surface_get_arrays(0)[Mesh.ARRAY_VERTEX] \
			== second["mesh"].surface_get_arrays(0)[Mesh.ARRAY_VERTEX],
		"mesh bake was not deterministic")
	_check(
		first["bounds"].is_equal_approx(
			AABB(Vector3.ZERO, Vector3(1.0, 0.5, 0.5))),
		"voxel density did not preserve metre scale")

	var surface := ForgeSurfaceSet.new()
	surface.ensure_faces()
	surface.fill_face("top", 1)
	var images := ForgeSurfaceBaker.bake_images(surface, palette)
	_check(bool(images.get("ok", false)), "surface bake failed")
	_check(images["images"].size() == 6, "surface bake did not emit six faces")
	_check(
		images["images"]["top"].get_pixel(0, 0).is_equal_approx(
			palette.color_for(1)),
		"surface bake did not preserve palette indices")
	var textured_cube := ForgeMeshBaker.bake_textured_surface_cube(
		surface, palette)
	_check(
		bool(textured_cube.get("ok", false)),
		"textured surface preview bake failed")
	var textured_mesh: ArrayMesh = textured_cube.get("mesh")
	_check(
		textured_mesh != null and textured_mesh.get_surface_count() == 6,
		"textured surface preview did not preserve six independent faces")
	var has_nearest_textures := textured_mesh != null
	if textured_mesh != null:
		for face_index in textured_mesh.get_surface_count():
			var material := textured_mesh.surface_get_material(face_index)
			has_nearest_textures = has_nearest_textures \
				and material is StandardMaterial3D \
				and material.albedo_texture is ImageTexture \
				and material.texture_filter \
					== BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_check(
		has_nearest_textures,
		"textured surface preview lost nearest-neighbour face textures")
	_check(
		_mesh_uses_godot_front_winding(first["mesh"]) \
			and _mesh_uses_godot_front_winding(textured_mesh),
		"Forge mesh triangles expose their inside faces instead of the outside")
	var transform_surface := ForgeSurfaceSet.new()
	transform_surface.width = 2
	transform_surface.height = 2
	transform_surface.ensure_faces()
	var face_pattern := PackedByteArray([1, 2, 3, 4])
	transform_surface.set_face_pixels("north", face_pattern)
	transform_surface.copy_face("north", "south")
	transform_surface.set_pixel("north", 0, 0, 9)
	_check(
		transform_surface.face_pixels_copy("south") == face_pattern,
		"surface face copy did not preserve an independent clipboard value")
	_check(
		transform_surface.transformed_pixels(
			face_pattern, "mirror_horizontal") \
				== PackedByteArray([2, 1, 4, 3]),
		"surface horizontal mirror mapped pixels incorrectly")
	_check(
		transform_surface.transformed_pixels(
			face_pattern, "mirror_vertical") \
				== PackedByteArray([3, 4, 1, 2]),
		"surface vertical mirror mapped pixels incorrectly")
	_check(
		transform_surface.transformed_pixels(
			face_pattern, "rotate_cw") \
				== PackedByteArray([3, 1, 4, 2]),
		"surface clockwise rotation mapped pixels incorrectly")
	_check(
		transform_surface.transformed_pixels(
			face_pattern, "rotate_180") \
				== PackedByteArray([4, 3, 2, 1]),
		"surface 180-degree rotation mapped pixels incorrectly")
	_check(
		transform_surface.transformed_pixels(
			face_pattern, "rotate_ccw") \
				== PackedByteArray([2, 4, 1, 3]),
		"surface counter-clockwise rotation mapped pixels incorrectly")
	var pixel_canvas := ForgePixelCanvas.new()
	pixel_canvas.configure(surface, palette)
	pixel_canvas.tool_mode = ForgePixelCanvas.TOOL_SQUARE
	pixel_canvas.brush_size = 1
	_check(
		pixel_canvas.tool_cells_at(Vector2i(4, 4)).size() == 9,
		"surface square tool did not apply its selected radius")
	pixel_canvas.tool_mode = ForgePixelCanvas.TOOL_FILL
	_check(
		pixel_canvas.tool_cells_at(Vector2i.ZERO).size() == 1024,
		"surface fill bucket did not find the connected face region")
	var pixel_stroke := {"cells": [], "value": -1}
	pixel_canvas.pixel_batch_edit_requested.connect(
		func(_face: String, cells: Array, value: int) -> void:
			pixel_stroke["cells"] = cells.duplicate()
			pixel_stroke["value"] = value)
	pixel_canvas.tool_mode = ForgePixelCanvas.TOOL_PENCIL
	pixel_canvas._stroke_button = MOUSE_BUTTON_RIGHT
	pixel_canvas._apply_tool_between(Vector2i.ZERO, Vector2i(4, 0))
	_check(
		pixel_stroke["cells"].size() == 5 \
			and int(pixel_stroke["value"]) == 0,
		"surface right-drag did not continuously erase its stroke")
	var slice_volume := ForgeVoxelVolume.new()
	slice_volume.dimensions = Vector3i(5, 5, 1)
	slice_volume.ensure_storage()
	var voxel_canvas := ForgeVoxelSliceCanvas.new()
	voxel_canvas.configure(slice_volume, palette)
	voxel_canvas.tool_mode = ForgeVoxelSliceCanvas.TOOL_CIRCLE
	voxel_canvas.brush_size = 1
	_check(
		voxel_canvas.tool_cells_at(Vector2i(2, 2)).size() == 5,
		"voxel circle tool did not apply its selected radius")
	voxel_canvas.tool_mode = ForgeVoxelSliceCanvas.TOOL_FILL
	_check(
		voxel_canvas.tool_cells_at(Vector2i.ZERO).size() == 25,
		"voxel fill bucket did not find the connected slice region")
	var voxel_stroke := {"cells": [], "value": 0}
	voxel_canvas.voxel_batch_edit_requested.connect(
		func(cells: Array, value: int) -> void:
			voxel_stroke["cells"] = cells.duplicate()
			voxel_stroke["value"] = value)
	voxel_canvas.tool_mode = ForgeVoxelSliceCanvas.TOOL_PENCIL
	voxel_canvas._stroke_button = MOUSE_BUTTON_RIGHT
	voxel_canvas._apply_tool_between(Vector2i.ZERO, Vector2i(4, 0))
	_check(
		voxel_stroke["cells"].size() == 5 \
			and int(voxel_stroke["value"]) == -1,
		"voxel right-drag did not continuously erase its stroke")
	pixel_canvas.free()
	voxel_canvas.free()
	var icon_asset := ForgeAssetDefinition.new()
	icon_asset.forge_asset_id = "forge_asset.test.icon"
	icon_asset.presentation_id = "presentation.test.icon"
	icon_asset.surface_set = surface
	icon_asset.palettes = [palette]
	var icon_a := ForgeIconBaker.bake(icon_asset, palette)
	var icon_b := ForgeIconBaker.bake(icon_asset, palette)
	_check(
		icon_a.get_data() == icon_b.get_data(),
		"headless icon bake was not deterministic")
	var frame_a := ForgeVoxelVolume.new()
	frame_a.dimensions = Vector3i(2, 2, 2)
	frame_a.ensure_storage()
	frame_a.set_cell(Vector3i.ZERO, 0)
	var frame_b: ForgeVoxelVolume = frame_a.duplicate(true)
	frame_b.set_cell(Vector3i.ONE, 0)
	var frame_clip := ForgeVoxelFrameClip.new()
	frame_clip.clip_id = "test_frames"
	frame_clip.frames = [frame_a, frame_b]
	frame_clip.frame_durations = PackedFloat32Array([0.1, 0.2])
	frame_clip.reduced_motion_frame = 1
	var frame_result := ForgeVoxelFrameBaker.bake(frame_clip, palette)
	_check(bool(frame_result["ok"]), "voxel-frame source bake failed")
	_check(
		int(frame_result["frame_count"]) == 2,
		"voxel-frame bake did not precompute every frame")
	_check(
		is_equal_approx(float(frame_result["total_duration"]), 0.3),
		"voxel-frame bake lost per-frame durations")

	var performance := ForgePerformanceBudget.new()
	_check(
		performance.evaluate(
			icon_asset, {"triangles": 12}).is_empty(),
		"normal surface asset exceeded performance budget")
	_check(
		not performance.evaluate(
			icon_asset, {"triangles": 50000}).is_empty(),
		"performance budget did not report an excessive mesh")

	var migration_asset := ForgeAssetDefinition.new()
	migration_asset.schema_version = 0
	migration_asset.forge_asset_id = "forge_asset.test.migration"
	migration_asset.gameplay_links = PackedStringArray(["test.migration"])
	var migration := ForgeMigrationService.new().migrate_asset(migration_asset)
	_check(bool(migration["ok"]), "registered source migration failed")
	_check(
		migration_asset.schema_version == 1,
		"source migration did not reach schema v1")
	_check(
		migration_asset.presentation_id == "presentation.test.migration",
		"source migration changed the stable identity mapping")


func _test_connections_overrides_and_dependencies() -> void:
	var connectors := {
		Vector3i(1, 1, 0): true,
		Vector3i(-1, 0, 0): true,
	}
	var profile := ForgeConnectionResolver.resolve(
		Vector3i.ZERO, 1,
		func(position: Vector3i) -> bool:
			return bool(connectors.get(position, false)))
	_check(
		(int(profile["mask"]) & ForgeConnectionResolver.EAST) != 0,
		"connection resolver missed the raised east neighbor")
	_check(
		int(profile["slopes"].get(1, 0)) == 1,
		"connection resolver did not record the one-step rise")
	_check(
		str(profile["shape"]) == "slope",
		"connection resolver did not classify the straight incline")
	_check(
		ForgeConnectionResolver.item_connection_offsets().size() == 14,
		"automation connection offsets omitted slope or vertical candidates")

	var base := {"mesh": "base", "material": "stone", "settings": {"a": 1}}
	var project := ForgeOverrideDefinition.new()
	project.override_id = "override.test.project"
	project.source_layer = "project"
	project.field_operations = {
		"material": {"op": "replace", "value": "oak"},
		"settings": {"op": "merge", "value": {"b": 2}},
	}
	var resolved := ForgeOverrideResolver.new().resolve(base, [project])
	_check(bool(resolved["ok"]), "valid project override did not resolve")
	_check(
		resolved["record"]["material"] == "oak",
		"replace override did not apply")
	_check(
		resolved["record"]["settings"] == {"a": 1, "b": 2},
		"stable-key merge override did not apply")
	_check(
		resolved["provenance"]["material"]["source_id"] \
			== "override.test.project",
		"resolved field lost override provenance")
	var conflict := ForgeOverrideDefinition.new()
	conflict.override_id = "override.test.conflict"
	conflict.source_layer = "project"
	conflict.field_operations = {"material": "pine"}
	var conflicted := ForgeOverrideResolver.new().resolve(
		base, [project, conflict], base)
	_check(not bool(conflicted["ok"]), "equal-priority conflict was not detected")
	_check(
		not conflicted["diagnostics"].is_empty(),
		"override conflict had no actionable diagnostic")
	_check(
		ForgeOverrideResolver.new().revert_field(project, "material"),
		"field-level override revert failed")
	_check(
		not project.field_operations.has("material"),
		"field-level revert did not restore inheritance")

	var variants := ForgeVariantSet.new()
	variants.variant_set_id = "variantset.test.wood"
	variants.seed_salt = "stable"
	variants.entries = [
		{"variant_id": "oak", "weight": 3.0},
		{"variant_id": "pine", "weight": 1.0},
	]
	var selector := ForgeOverrideResolver.new()
	_check(
		selector.select_variant(variants, "world:10,20") \
			== selector.select_variant(variants, "world:10,20"),
		"variant selection was not deterministic")

	var graph := ForgeDependencyGraph.new()
	var graph_summary := graph.rebuild([
		{"forge_asset_id": "forge_asset.a",
			"dependency_ids": ["forge_asset.b"]},
		{"forge_asset_id": "forge_asset.b",
			"dependency_ids": ["forge_asset.c"]},
		{"forge_asset_id": "forge_asset.c", "dependency_ids": []},
	])
	_check(int(graph_summary["edge_count"]) == 2, "dependency edges were lost")
	_check(graph_summary["cycles"].is_empty(), "acyclic dependency graph found a cycle")
	_check(
		graph.invalidation_closure(
			PackedStringArray(["forge_asset.c"])).size() == 3,
		"dependency invalidation was not transitive")


func _test_runtime_packages_and_consumers() -> void:
	var runtime_summary := ForgeRuntime.reload_packages()
	_check(
		int(runtime_summary["package_count"]) == 7,
		"runtime did not load seven approved packages")
	for gameplay_id in GOLDEN_GAMEPLAY_IDS:
		_check(
			ForgeRuntime.has_package_for(gameplay_id),
			"runtime package missing for %s" % gameplay_id)
		var package := ForgeRuntime.package_for(gameplay_id)
		_check(package != null, "runtime package lookup returned null")
		if package == null:
			continue
		_check(
			not package.product_hash.is_empty(),
			"runtime package has no product hash")
		_check(
			ResourceLoader.exists(package.root_scene_path),
			"runtime root scene is missing")
		_check(
			ResourceLoader.exists(package.mesh_path),
			"runtime mesh is missing")
		_check(
			FileAccess.file_exists(package.icon_path),
			"runtime icon is missing")

	var grass_paths := ForgeRuntime.surface_paths("terrain.grass.basic")
	_check(grass_paths.size() == 6, "grass package lost six face textures")
	_check(
		ForgeRuntime.average_surface_color("terrain.grass.basic") is Color,
		"grass package has no runtime surface colour")
	_check(
		not ForgeRuntime.mesh_arrays("magic.conduit.mana_basic").is_empty(),
		"unique conduit mesh arrays are unavailable to the chunk renderer")
	_check(
		ForgeRuntime.uses_scene_presentation("functional.furnace.stone"),
		"compound furnace package was not selected for world presentation")

	var original_reduced_motion := UIState.setting_bool("reduced_motion")
	UIState.set_setting("reduced_motion", false)
	var furnace_package := ForgeRuntime.package_for(
		"functional.furnace.stone")
	_check(furnace_package != null, "furnace runtime package is missing")
	var frame_metadata: Dictionary = (
		furnace_package.runtime_metadata.get("voxel_frame_clips", {})
		if furnace_package != null else {})
	_check(
		frame_metadata.has("magical_flame"),
		"furnace package lost voxel-frame metadata")
	if frame_metadata.has("magical_flame"):
		var magical_flame: Dictionary = frame_metadata["magical_flame"]
		_check(
			magical_flame.get("frame_paths", []).size() == 3,
			"furnace package did not retain three pre-baked frame meshes")
		_check(
			not bool(magical_flame.get("runtime_remeshing", true)),
			"furnace package permits runtime frame remeshing")
		_check(
			ResourceLoader.exists(str(
				magical_flame.get("reduced_motion_mesh", ""))),
			"furnace reduced-motion frame product is missing")
	if furnace_package != null:
		_check(
			str(furnace_package.runtime_metadata.get(
				"footprint", {}).get("footprint_profile_id", "")) \
				== "footprint.presentation.functional.furnace.stone",
			"runtime package lost its placement footprint")
	var furnace := ForgeRuntime.instantiate_presentation(
		"functional.furnace.stone")
	_check(furnace != null, "furnace runtime scene did not instantiate")
	if furnace != null:
		_check(furnace.has_node("Body"), "furnace runtime scene lost body part")
		_check(furnace.has_node("Gear"), "furnace runtime scene lost gear part")
		_check(furnace.has_node("Flame"), "furnace runtime scene lost flame part")
		_check(
			furnace.has_node("AnimationPlayer"),
			"furnace runtime scene lost baked animations")
		_check(
			furnace.has_node("VoxelFramePlayer"),
			"furnace runtime scene lost voxel-frame playback")
		_check(
			furnace.has_node("FrameGeometry"),
			"furnace runtime scene lost pre-baked frame geometry")
		var gear: Node3D = furnace.get_node("Gear")
		var gear_geometry: MeshInstance3D = furnace.get_node(
			"Gear/Geometry")
		var authored_gear_transform := gear.transform \
			* gear_geometry.transform
		_check(
			not gear.position.is_equal_approx(
				authored_gear_transform.origin) \
				and authored_gear_transform.origin.is_equal_approx(
					Vector3(0.25, 0.48, -0.02)),
			"furnace gear was not baked around its own centre pivot")
		var frame_geometry: MeshInstance3D = furnace.get_node(
			"FrameGeometry")
		_check(
			frame_geometry.position.is_equal_approx(
				Vector3(0.34, 0.18, -0.03)),
			"furnace flame frames are not centred on the authored flame part")
		_check(
			furnace.has_node("BlockedMarker") \
			and furnace.has_node("DamageOverlay"),
			"furnace runtime scene lost critical visual markers")
		_check(
			furnace.has_node("StateAdapter"),
			"furnace runtime scene lost state adapter")
		_check(
			furnace.has_node("RuntimeEffects") \
			and not furnace.get_node("Flame").visible,
			"furnace runtime effects host or inactive flame default is missing")
		var adapter: ForgeStateAdapter = furnace.get_node("StateAdapter")
		var snapshot := {"processing": true, "blocked": false, "damaged": 0.0}
		var before := snapshot.duplicate(true)
		var actions := adapter.apply_snapshot(snapshot)
		_check(actions.size() == 7, "processing state did not resolve seven visual actions")
		_check(snapshot == before, "presentation adapter mutated gameplay state")
		var flame_geometry := furnace.get_node_or_null("Flame/Geometry")
		_check(
			flame_geometry is MeshInstance3D \
			and is_equal_approx(
				flame_geometry.material_override.emission_energy_multiplier,
				2.2),
			"processing state did not apply material heat")
		_check(
			furnace.get_node("FrameGeometry").visible,
			"processing state did not expose voxel-frame geometry")
		var smoke_particles := furnace.get_node_or_null(
			"Smoke/FurnaceSmokeParticles")
		var activity_light := furnace.get_node_or_null(
			"Smoke/ForgeActivityLight")
		_check(
			smoke_particles is GPUParticles3D \
			and smoke_particles.emitting \
			and activity_light is OmniLight3D \
			and activity_light.light_energy > 0.0,
			"processing state did not start furnace smoke and fire light")
		var frame_player: AnimationPlayer = furnace.get_node(
			"VoxelFramePlayer")
		_check(
			frame_player.has_animation("magical_flame"),
			"voxel-frame animation was not baked into AnimationPlayer")
		var frame_animation := frame_player.get_animation("magical_flame")
		_check(
			frame_animation.get_track_count() == 1 \
			and frame_animation.track_get_interpolation_type(0) \
				== Animation.INTERPOLATION_NEAREST,
			"voxel-frame playback is not a nearest pre-baked mesh track")
		var audio_requests := {"count": 0}
		adapter.audio_cue_requested.connect(
			func(_cue: String, _socket: String) -> void:
				audio_requests["count"] = int(audio_requests["count"]) + 1)
		adapter.apply_snapshot(
			{"processing": false, "blocked": true, "damaged": 0.0})
		_check(
			int(audio_requests["count"]) == 1,
			"blocked audio cue binding did not fire")
		_check(
			furnace.get_node("BlockedMarker").visible,
			"blocked state did not show its non-audio marker")
		var inactive_actions := adapter.apply_snapshot({
			"processing": false, "blocked": false, "damaged": 0.0})
		_check(
			inactive_actions.is_empty(),
			"inactive state did not settle to the default presentation")
		_check(
			not furnace.get_node("Flame").visible \
			and smoke_particles is GPUParticles3D \
			and not smoke_particles.emitting \
			and activity_light is OmniLight3D \
			and is_zero_approx(activity_light.light_energy),
			"inactive furnace did not stop its flame, smoke, and light")
		var damaged_actions := adapter.apply_snapshot({
			"processing": false, "blocked": false, "damaged": 0.75})
		_check(
			damaged_actions.size() == 1 \
			and furnace.get_node("DamageOverlay").visible,
			"damaged state did not show its condition layer")
		furnace.queue_free()
		await get_tree().process_frame

	UIState.set_setting("reduced_motion", true)
	var reduced_furnace := ForgeRuntime.instantiate_presentation(
		"functional.furnace.stone")
	_check(
		reduced_furnace != null \
			and bool(reduced_furnace.get_meta(
				"forge_reduced_motion", false)),
		"reduced-motion runtime policy was not applied")
	if reduced_furnace != null:
		var reduced_adapter: ForgeStateAdapter = reduced_furnace.get_node(
			"StateAdapter")
		reduced_adapter.apply_snapshot(
			{"processing": true, "blocked": false, "damaged": 0.0})
		var reduced_player: AnimationPlayer = reduced_furnace.get_node(
			"VoxelFramePlayer")
		_check(
			not reduced_player.is_playing(),
			"reduced motion did not freeze voxel-frame playback")
		_check(
			reduced_player.speed_scale < 1.0,
			"reduced motion did not lower transform animation speed")
		reduced_furnace.queue_free()
		await get_tree().process_frame
	UIState.set_setting("reduced_motion", original_reduced_motion)

	var item_id := ItemRegistry.get_id_by_stable_id("item.tool.crude_pickaxe")
	var stack := {"kind": "item", "id": item_id, "count": 1}
	var model := ItemModelFactory.build(stack)
	_check(
		bool(model.get_meta("forge_presentation", false)),
		"item model factory did not consume the Forge package")
	ItemModelFactory.apply_hold_transform(model, stack, "owner_humanoid")
	_check(
		model.basis.orthonormalized().is_equal_approx(
			Basis.from_euler(
				ItemModelFactory.HELD_ITEM_ROTATION).orthonormalized()),
		"Forge item bypassed the canonical humanoid grip contract")
	var owner_scale := model.scale.x
	ItemModelFactory.apply_hold_transform(model, stack, "first_person")
	_check(
		model.scale.x < owner_scale \
			and model.position.z < -0.05,
		"first-person Forge tool was not reduced and moved clear of the camera")
	model.queue_free()
	var icon := StackIconRenderer.new().get_icon(stack)
	_check(icon != null, "inventory renderer did not load Forge icon")
	_check(
		icon.get_width() == 56 and icon.get_height() == 56,
		"Forge inventory icon did not use the HUD size")

	var world := VoxelWorld.new()
	add_child(world)
	await get_tree().process_frame
	var preview := ForgePreviewViewport.new()
	add_child(preview)
	await get_tree().process_frame
	var preview_bounds := AABB(Vector3.ZERO, Vector3(8.0, 4.0, 2.0))
	preview._fit_bounds(preview_bounds)
	var preview_radius := preview_bounds.size.length() * 0.5
	_check(
		preview._camera_distance > preview_radius \
			and preview._camera.near \
				< preview._camera_distance - preview_radius,
		"preview fit left the camera inside or clipping the model bounds")
	_check(
		preview._base_camera_size \
			>= preview_bounds.size.length() * 1.44,
		"100 percent preview is not a padded whole-asset fit")
	preview._viewport.size = Vector2i(260, 520)
	preview._recalculate_fit_size()
	_check(
		preview._base_camera_size \
			>= preview_bounds.size.length() * 2.8,
		"portrait live preview did not compensate for its narrow aspect")
	var pan_origin: Vector3 = preview._camera_target
	preview.pan_right()
	var panned_target: Vector3 = preview._camera_target
	_check(
		not panned_target.is_equal_approx(pan_origin),
		"preview pan controls did not move the focus target")
	preview.zoom_in()
	_check(
		preview._camera_target.is_equal_approx(panned_target),
		"preview zoom changed the model focus target")
	preview.reset_view()
	_check(
		preview._camera_target.is_equal_approx(Vector3.ZERO),
		"preview reset did not centre the model")
	preview.queue_free()
	var conduit_id := BlockRegistry.get_id_by_stable_id(
		"magic.conduit.mana_basic")
	_check(
		int(world.block_shapes[conduit_id]) == 9,
		"VoxelWorld did not select Forge custom geometry")
	_check(
		world.forge_mesh_arrays.has(conduit_id),
		"VoxelWorld did not snapshot custom mesh arrays")
	var conduit_snapshot := _empty_chunk_snapshot(world)
	conduit_snapshot["blocks"][_chunk_index(8, 8, 8)] = conduit_id
	var conduit_geometry := ChunkMesherScript.build(conduit_snapshot)
	_check(
		not conduit_geometry["opaque_vertices"].is_empty(),
		"chunk mesher emitted no Forge conduit geometry")
	_check(
		not conduit_geometry["collision_triangles"].is_empty(),
		"chunk mesher emitted no Forge conduit collision")

	var grass_id := BlockRegistry.get_id_by_stable_id("terrain.grass.basic")
	var grass_snapshot := _empty_chunk_snapshot(world)
	grass_snapshot["blocks"][_chunk_index(8, 8, 8)] = grass_id
	var grass_geometry := ChunkMesherScript.build(grass_snapshot)
	var face_layers := {}
	for uv2 in grass_geometry["opaque_uv2s"]:
		face_layers[int(uv2.x)] = true
	_check(
		face_layers.size() >= 4,
		"chunk renderer did not select authored grass face textures")
	_check(
		ChunkMesherScript._face_uv(
			Vector3(1.0, 0.25, 0.75), 0, 1).is_equal_approx(
				Vector2(0.75, -0.25))
		and ChunkMesherScript._face_uv(
			Vector3(0.25, 1.0, 0.75), 1, 1).is_equal_approx(
				Vector2(-0.75, -0.25))
		and ChunkMesherScript._face_uv(
			Vector3(0.25, 0.25, 0.0), 2, -1).is_equal_approx(
				Vector2(0.25, -0.25)),
		"world face UVs no longer match the Forge cube orientation convention")

	var furnace_id := BlockRegistry.get_id_by_stable_id(
		"functional.furnace.stone")
	_check(
		int(world.block_shapes[furnace_id]) == 10,
		"VoxelWorld did not replace legacy furnace geometry with its Forge scene")
	var furnace_snapshot := _empty_chunk_snapshot(world)
	furnace_snapshot["blocks"][_chunk_index(8, 8, 8)] = furnace_id
	var furnace_geometry := ChunkMesherScript.build(furnace_snapshot)
	_check(
		furnace_geometry["opaque_vertices"].is_empty() \
			and not furnace_geometry["collision_triangles"].is_empty(),
		"scene-presented furnace did not retain collision-only chunk geometry")

	var chunk := Chunk.new()
	chunk.setup(world, Vector3i.ZERO)
	world.chunks[Vector3i.ZERO] = chunk
	world.add_child(chunk)
	await get_tree().process_frame
	var furnace_position := Vector3i(8, 8, 8)
	var placed_furnace := world.set_block_global(
		furnace_position, furnace_id)
	var furnace_key := world._edit_key(furnace_position)
	_check(
		placed_furnace \
			and world._forge_world_presentations.has(furnace_key),
		"placed furnace did not create a Forge world presentation")
	var world_entry: Dictionary = world._forge_world_presentations.get(
		furnace_key, {})
	var world_presentation: Node3D = world_entry.get("presentation")
	_check(
		world_presentation != null \
			and world_presentation.has_node("Body") \
			and world_presentation.has_node("StateAdapter"),
		"placed furnace retained the legacy shell instead of the Forge model")
	var raw_iron := Inventory.make_stack_from_ref({
		"kind": "item",
		"stable_id": "item.resource.raw_iron_ore",
		"count": 1,
	})
	var coal := Inventory.make_stack_from_ref({
		"kind": "item",
		"stable_id": "item.resource.coal_chunk",
		"count": 1,
	})
	var loaded_furnace := (
		world.set_furnace_slot(furnace_position, "input", 0, raw_iron)
		and world.set_furnace_slot(furnace_position, "fuel", 0, coal)
	)
	world._process_furnaces(0.25)
	world_entry = world._forge_world_presentations.get(furnace_key, {})
	var world_adapter: ForgeStateAdapter = world_entry.get("adapter")
	var world_smoke := world_presentation.get_node_or_null(
		"Smoke/FurnaceSmokeParticles")
	_check(
		loaded_furnace and world_adapter != null \
			and bool(world_adapter.last_snapshot.get("processing", false)),
		"authoritative furnace processing state did not reach the Forge adapter")
	_check(
		world_smoke is GPUParticles3D and world_smoke.emitting,
		"working world furnace did not emit Forge smoke particles")
	world.set_furnace_slot(furnace_position, "input", 0, {})
	world._process_furnaces(0.25)
	_check(
		not bool(world_adapter.last_snapshot.get("processing", true)) \
			and world_smoke is GPUParticles3D \
			and not world_smoke.emitting,
		"stopped world furnace left Forge activity effects running")

	var chute_id := BlockRegistry.get_id_by_stable_id(
		"automation.transport.chute")
	var slope_snapshot := _empty_chunk_snapshot(world)
	slope_snapshot["blocks"][_chunk_index(8, 8, 8)] = chute_id
	slope_snapshot["blocks"][_chunk_index(9, 9, 8)] = chute_id
	var chute_profile := ChunkMesherScript.chute_connection_profile(
		slope_snapshot, 8, 8, 8, 1)
	_check(
		int(chute_profile["slopes"].get(1, 0)) == 1,
		"chunk chute profile missed a raised adjacent connector")
	var slope_geometry := ChunkMesherScript.build(slope_snapshot)
	var maximum_y := -INF
	for vertex in slope_geometry["opaque_vertices"]:
		maximum_y = maxf(maximum_y, vertex.y)
	_check(maximum_y > 9.0, "chunk chute did not emit raised slope geometry")
	world.queue_free()
	await get_tree().process_frame


func _test_workspace_and_persistence() -> void:
	var editor_main_screen := Control.new()
	editor_main_screen.size = Vector2(1920, 860)
	add_child(editor_main_screen)
	var editor_workspace := Control.new()
	editor_main_screen.add_child(editor_workspace)
	ForgeEditorHostLayout.fill(editor_workspace)
	await get_tree().process_frame
	_check(
		editor_workspace.size.is_equal_approx(editor_main_screen.size) \
			and is_equal_approx(editor_workspace.anchor_right, 1.0) \
			and is_equal_approx(editor_workspace.anchor_bottom, 1.0),
		"Summer Engine Forge host did not fill the editor main screen")
	editor_workspace.offset_bottom = -300.0
	ForgeEditorHostLayout.fill(editor_workspace)
	_check(
		is_zero_approx(editor_workspace.offset_left) \
			and is_zero_approx(editor_workspace.offset_top) \
			and is_zero_approx(editor_workspace.offset_right) \
			and is_zero_approx(editor_workspace.offset_bottom),
		"Summer Engine resize repair did not clear the blocking host offsets")
	editor_main_screen.queue_free()
	await get_tree().process_frame
	var host := ForgeHostScene.instantiate()
	add_child(host)
	await get_tree().process_frame
	var workspace: ForgeWorkspace = host.get_node("ForgeWorkspace")
	_check(workspace != null, "runtime host has no shared Forge workspace")
	var navigation_scroll := workspace.find_child(
		"ForgeNavigationScroll", true, false)
	var page_scroll := workspace.find_child("ForgePageScroll", true, false)
	var preview_scroll := workspace.find_child(
		"ForgePreviewScroll", true, false)
	_check(
		navigation_scroll is ScrollContainer \
			and page_scroll is ScrollContainer \
			and preview_scroll is ScrollContainer,
		"Forge navigation, pages, and live-preview column are not scrollable")
	_check(
		ForgeSectionGuides.page_titles().size() == 16,
		"Forge guide does not cover every authoring section")
	_check(
		workspace.asset_index.summary()["asset_count"] == 312,
		"runtime workspace did not index the complete registry")
	var grass_record := workspace.asset_index.record_for_source_id(
		"forge_asset.terrain.grass.basic")
	workspace._open_record(grass_record)
	await get_tree().process_frame
	_check(
		workspace.current_asset != null,
		"runtime workspace could not open an approved source")
	_check(
		workspace.current_asset.forge_asset_id \
			== "forge_asset.terrain.grass.basic",
		"runtime workspace opened the wrong source")
	workspace._show_surface_editor()
	await get_tree().process_frame
	_check(
		workspace._surface_canvas != null,
		"runtime workspace has no 32 x 32 surface canvas")
	_check(
		workspace._page.find_child("SectionGuide", false, false) != null,
		"surface editor did not expose its maintained step-by-step guide")
	var grass_preview := workspace._preview._presentation_root.get_child(0) \
		if workspace._preview._presentation_root.get_child_count() > 0 else null
	_check(
		grass_preview is MeshInstance3D \
			and grass_preview.mesh.get_surface_count() == 6,
		"live surface preview does not render all six authored textures")
	_check(
		workspace._preview._camera.projection \
			== Camera3D.PROJECTION_ORTHOGONAL,
		"live preview inspection camera is not orthographic")
	var original_camera_size := workspace._preview._camera.size
	workspace._preview.zoom_in()
	_check(
		workspace._preview._camera.size < original_camera_size,
		"live preview zoom-in control did not move closer")
	workspace._preview._orbit_by(Vector2(40, 25))
	_check(
		absf(workspace._preview._pivot.rotation.z) < 0.001,
		"live preview orbit introduced roll distortion")
	workspace._preview.reset_view()
	_check(
		workspace._preview.get_zoom_percent() == 100,
		"live preview reset did not restore 100 percent zoom")
	workspace._show_palette_material_editor()
	await get_tree().process_frame
	_check(
		"Palette Roles" in workspace._page_title.text,
		"runtime workspace lost palette and Material DNA authoring")
	workspace._show_collision_placement_editor()
	await get_tree().process_frame
	_check(
		"Collision" in workspace._page_title.text,
		"runtime workspace lost collision and footprint authoring")
	_check(
		workspace._page_scroll.get_v_scroll_bar().max_value \
			> workspace._page_scroll.size.y,
		"long Forge tab content does not overflow into a vertical scrollbar")
	var pickaxe_record := workspace.asset_index.record_for_source_id(
		"forge_asset.item.tool.crude_pickaxe")
	workspace._open_record(pickaxe_record)
	await get_tree().process_frame
	workspace._show_item_preview()
	await get_tree().process_frame
	_check(
		"Item, Held, Drop" in workspace._page_title.text,
		"runtime workspace lost held/drop/icon preview")
	var furnace_record := workspace.asset_index.record_for_source_id(
		"forge_asset.functional.furnace.stone")
	workspace._open_record(furnace_record)
	await get_tree().process_frame
	workspace._show_animation_editor()
	await get_tree().process_frame
	_check(
		"Animation" in workspace._page_title.text,
		"runtime workspace lost timeline and state simulator")
	_check(
		workspace.current_asset.animation_set.voxel_frame_clips.size() == 1,
		"runtime workspace did not expose the voxel-frame clip")
	workspace._show_override_editor()
	await get_tree().process_frame
	_check(
		"Provenance" in workspace._page_title.text,
		"runtime workspace lost override compare and provenance")
	workspace._show_world_test_preview()
	await get_tree().process_frame
	workspace._preview.show_runtime_package(
		"functional.furnace.stone", 3)
	_check(
		workspace._preview._presentation_root.get_child_count() == 3,
		"runtime workspace could not preview a machine line")
	workspace._show_blueprint_handoff()
	await get_tree().process_frame
	_check(
		"Blueprint Designer Handoff" in workspace._page_title.text,
		"runtime workspace lost Blueprint handoff")
	workspace._show_migration_register()
	await get_tree().process_frame
	_check(
		"Migration Register" in workspace._page_title.text,
		"runtime workspace lost migration readiness screen")
	workspace._preview._clear_presentation()
	workspace._clear_page("Closing Forge probe")
	await get_tree().process_frame
	await get_tree().process_frame
	host.queue_free()
	await get_tree().process_frame
	await get_tree().process_frame

	var documents := ForgeDocumentService.new()
	var asset := ForgeAssetDefinition.new()
	asset.forge_asset_id = "forge_asset.test.atomic"
	asset.presentation_id = "presentation.test.atomic"
	asset.display_name = "Atomic Persistence Test"
	asset.gameplay_links = PackedStringArray(["test.atomic"])
	var surface := ForgeSurfaceSet.new()
	surface.ensure_faces()
	asset.surface_set = surface
	var palette := ForgePaletteDefinition.new()
	palette.ensure_default_entries()
	asset.palettes = [palette]
	var collision := ForgeCollisionProfile.new()
	collision.boxes = [{
		"minimum": [0.0, 0.0, 0.0], "maximum": [1.0, 1.0, 1.0]}]
	asset.collision_profile = collision
	var target := "user://forge_mvp_probe/atomic.tres"
	var first_save := documents.save_draft(asset, target)
	_check(bool(first_save["ok"]), "atomic source first save failed")
	asset.display_name = "Atomic Persistence Test 2"
	var second_save := documents.save_draft(asset, target)
	_check(bool(second_save["ok"]), "atomic source second save failed")
	_check(
		FileAccess.file_exists("user://forge_mvp_probe/atomic.previous.bak"),
		"atomic source save did not retain previous revision")
	var reopened := documents.open_path(target)
	_check(
		reopened != null and reopened.display_name.ends_with("2"),
		"atomic source read-back did not preserve the promoted revision")
	var autosave := ForgeAutosaveService.new().autosave(asset)
	_check(bool(autosave["ok"]), "Forge autosave failed")
	_check(
		not ForgeAutosaveService.new().recovery_candidates().is_empty(),
		"Forge autosave was not discoverable for recovery")
	ForgeAutosaveService.new().discard(str(autosave["path"]))
	var command_value := {"value": 0}
	var commands := ForgeCommandService.new()
	_check(commands.execute(
		"Set value",
		func() -> void: command_value["value"] = 1,
		func() -> void: command_value["value"] = 0),
		"Forge command could not enter undo history")
	_check(
		int(command_value["value"]) == 1 and commands.undo(),
		"Forge undo did not revert the command")
	_check(
		int(command_value["value"]) == 0 and commands.redo(),
		"Forge redo did not replay the command")
	_check(
		int(command_value["value"]) == 1,
		"Forge redo produced the wrong value")
	_remove_user_file(target)
	_remove_user_file("user://forge_mvp_probe/atomic.previous.bak")


func _test_migration_register() -> void:
	var path := "res://content/forge/migration/registry_migration_register.json"
	_check(FileAccess.file_exists(path), "migration register is missing")
	var payload: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	_check(payload is Dictionary, "migration register is not valid JSON")
	if not payload is Dictionary:
		return
	_check(
		not bool(payload.get("bulk_migration_started", true)),
		"migration register incorrectly started bulk 21G work")
	var records: Array = payload.get("records", [])
	_check(records.size() == 312, "migration register does not cover 312 entries")
	var approved := 0
	var gameplay_ids := {}
	for record in records:
		var gameplay_id := str(record.get("gameplay_id", ""))
		gameplay_ids[gameplay_id] = true
		if str(record.get("status", "")) == "approved":
			approved += 1
		_check(
			str(record.get("fallback", "")) == "legacy_runtime",
			"migration record lost safe legacy fallback")
	_check(approved == 7, "migration register did not isolate seven MVP goldens")
	_check(
		gameplay_ids.size() == 312,
		"migration register duplicated a stable gameplay identity")
	var pack_path := (
		"res://content/forge/packs/pack_leyforge_project_visuals.tres")
	var pack := ResourceLoader.load(pack_path)
	_check(pack is ForgeContentPackManifest, "project visual pack manifest is missing")
	if pack is ForgeContentPackManifest:
		_check(pack.asset_ids.size() == 7, "project visual pack lost MVP assets")
		_check(pack.priority == 100, "project visual pack priority changed")


func _load_contract(contract_id: String) -> ForgePresentationContract:
	var path := "res://content/forge/contracts/%s.tres" % (
		ForgeId.safe_filename(contract_id))
	var resource := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE)
	return resource if resource is ForgePresentationContract else null


func _empty_chunk_snapshot(world: VoxelWorld) -> Dictionary:
	var blocks := PackedInt32Array()
	blocks.resize(16 * 16 * 16)
	var orientations := PackedByteArray()
	orientations.resize(blocks.size())
	return {
		"blocks": blocks,
		"neighbors": {},
		"colors": world.block_colors,
		"shapes": world.block_shapes,
		"transparency": world.block_transparency,
		"item_connectors": world.block_item_connectors,
		"orientations": orientations,
		"door_parts": PackedByteArray(),
		"door_states": PackedByteArray(),
		"layers": world.material_layers,
		"forge_face_layers": world.forge_face_layers,
		"forge_meshes": world.forge_mesh_arrays,
		"water_id": world.id_water,
	}


func _chunk_index(x: int, y: int, z: int) -> int:
	return (y * 16 + z) * 16 + x


func _mesh_uses_godot_front_winding(mesh: ArrayMesh) -> bool:
	if mesh == null:
		return false
	for surface_index in mesh.get_surface_count():
		var arrays := mesh.surface_get_arrays(surface_index)
		var vertices: PackedVector3Array = arrays[Mesh.ARRAY_VERTEX]
		var normals: PackedVector3Array = arrays[Mesh.ARRAY_NORMAL]
		var indices: PackedInt32Array = arrays[Mesh.ARRAY_INDEX]
		for triangle_index in range(0, indices.size(), 3):
			var a := int(indices[triangle_index])
			var b := int(indices[triangle_index + 1])
			var c := int(indices[triangle_index + 2])
			var geometric_normal := (
				vertices[b] - vertices[a]).cross(vertices[c] - vertices[a])
			if geometric_normal.dot(normals[a]) >= -0.000001:
				return false
	return true


func _remove_user_file(path: String) -> void:
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))


func _has_diagnostic_code(
		diagnostics: Array[ForgeDiagnostic], code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic.code == code:
			return true
	return false
