class_name ForgeBakeService
extends RefCounted
## Validates and promotes immutable, content-addressed runtime products.
## The active package pointer is replaced only after all products read back.

signal bake_completed(result: Dictionary)

const GENERATED_ROOT := "res://generated/forge"
const PRODUCT_ROOT := GENERATED_ROOT + "/products"
const PACKAGE_ROOT := GENERATED_ROOT + "/packages"
const MANIFEST_ROOT := GENERATED_ROOT + "/manifests"
const BAKER_VERSION := "forge-pipeline-v7"

var validation_service := ForgeValidationService.new()


func bake(
		asset: ForgeAssetDefinition,
		contract: ForgePresentationContract = null,
		approve := false) -> Dictionary:
	if asset == null:
		return _finish({"ok": false, "error": "No Forge asset is open."})
	if approve and not ForgeAccessPolicy.can_approve():
		return _finish({
			"ok": false,
			"error": "Forge approval is disabled in this build.",
		})
	var diagnostics := validation_service.validate_asset(asset, contract)
	if validation_service.has_blockers(diagnostics):
		return _finish({
			"ok": false,
			"error": "Validation blockers prevent baking.",
			"diagnostics": diagnostics,
		})
	# Approval status is part of the canonical source. Hash the state that will
	# be saved after a successful approval without mutating a failed bake.
	var original_source_status := asset.source_status
	if approve:
		asset.source_status = "approved"
	var source_hash := asset.canonical_hash()
	asset.source_status = original_source_status
	var safe_name := ForgeId.safe_filename(asset.presentation_id)
	var version_key := ("%s|%s" % [
		source_hash, BAKER_VERSION]).sha256_text().substr(0, 16)
	var product_dir := PRODUCT_ROOT.path_join(safe_name).path_join(version_key)
	var directory_error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(product_dir))
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		return _finish({
			"ok": false,
			"error": error_string(directory_error),
			"diagnostics": diagnostics,
		})
	var palette := _primary_palette(asset)
	var geometry := _bake_geometry(asset, palette)
	if not bool(geometry.get("ok", false)):
		return _finish({
			"ok": false,
			"error": str(geometry.get("error", "Geometry bake failed.")),
			"diagnostics": diagnostics,
		})
	var products: Array[Dictionary] = []
	var mesh_path := product_dir.path_join("presentation_mesh.res")
	var mesh_error := ResourceSaver.save(geometry["mesh"], mesh_path)
	if mesh_error != OK or not ResourceLoader.exists(mesh_path):
		return _finish(_write_error(mesh_path, mesh_error, diagnostics))
	products.append(_product_record(mesh_path, "mesh"))

	var material_paths := PackedStringArray()
	if asset.surface_set is ForgeSurfaceSet:
		var surface_result := ForgeSurfaceBaker.bake_images(
			asset.surface_set, palette)
		if not bool(surface_result.get("ok", false)):
			return _finish({
				"ok": false,
				"error": str(surface_result.get("error", "Surface bake failed.")),
				"diagnostics": diagnostics,
			})
		for face in ForgeSurfaceSet.FACE_KEYS:
			var texture_path := product_dir.path_join("%s.png" % face)
			var image: Image = surface_result["images"][face]
			var image_error := image.save_png(
				ProjectSettings.globalize_path(texture_path))
			if image_error != OK:
				return _finish(_write_error(
					texture_path, image_error, diagnostics))
			material_paths.append(texture_path)
			products.append(_product_record(texture_path, "surface"))

	var icon_path := product_dir.path_join("icon.png")
	var icon_error := ForgeIconBaker.bake(asset, palette).save_png(
		ProjectSettings.globalize_path(icon_path))
	if icon_error != OK:
		return _finish(_write_error(icon_path, icon_error, diagnostics))
	products.append(_product_record(icon_path, "icon"))

	var collision_path := ""
	if asset.collision_profile != null:
		collision_path = product_dir.path_join("collision.tres")
		var collision_error := ResourceSaver.save(
			asset.collision_profile, collision_path)
		if collision_error != OK:
			return _finish(_write_error(
				collision_path, collision_error, diagnostics))
		products.append(_product_record(collision_path, "collision"))

	var state_binding_path := ""
	if asset.state_binding != null:
		state_binding_path = product_dir.path_join("state_binding.tres")
		var state_error := ResourceSaver.save(
			asset.state_binding, state_binding_path)
		if state_error != OK:
			return _finish(_write_error(
				state_binding_path, state_error, diagnostics))
		products.append(_product_record(state_binding_path, "state_binding"))

	var animation_path := ""
	var animation_result := ForgeAnimationBaker.bake(asset.animation_set)
	if not bool(animation_result.get("ok", false)):
		return _finish({
			"ok": false,
			"error": "Animation bake failed.",
			"diagnostics": diagnostics,
			"animation_diagnostics": animation_result.get("diagnostics", []),
		})
	var frame_result := _bake_voxel_frames(
		asset.animation_set, palette, product_dir,
		animation_result.get("library"))
	if not bool(frame_result.get("ok", false)):
		return _finish({
			"ok": false,
			"error": "Voxel-frame animation bake failed.",
			"diagnostics": diagnostics,
			"animation_diagnostics": frame_result.get("diagnostics", []),
		})
	products.append_array(frame_result.get("products", []))
	if not animation_result["library"].get_animation_list().is_empty():
		animation_path = product_dir.path_join("animations.tres")
		var animation_error := ResourceSaver.save(
			animation_result["library"], animation_path)
		if animation_error != OK:
			return _finish(_write_error(
				animation_path, animation_error, diagnostics))
		products.append(_product_record(animation_path, "animation_library"))

	var root_scene_path := _save_root_scene(
		asset, geometry, animation_result.get("library"),
		frame_result, product_dir, diagnostics)
	if root_scene_path.is_empty():
		return _finish({
			"ok": false,
			"error": "Runtime scene failed to save.",
			"diagnostics": diagnostics,
		})
	products.append(_product_record(root_scene_path, "scene"))

	var package := _build_package(
		asset, contract, source_hash, geometry, root_scene_path, mesh_path,
		material_paths, collision_path, animation_path, state_binding_path,
		icon_path, palette, frame_result)
	var package_path := PACKAGE_ROOT.path_join("%s.tres" % safe_name)
	var package_result := _atomic_save_resource(package, package_path)
	if not bool(package_result.get("ok", false)):
		return _finish({
			"ok": false,
			"error": str(package_result.get("error", "Package promotion failed.")),
			"diagnostics": diagnostics,
		})
	products.append(_product_record(package_path, "runtime_package"))

	var manifest := ForgeBakeManifest.new()
	manifest.asset_id = asset.forge_asset_id
	manifest.presentation_id = asset.presentation_id
	manifest.source_revision = asset.source_revision
	manifest.source_hash = source_hash
	manifest.engine_version = Engine.get_version_info().get("string", "")
	manifest.baker_version = BAKER_VERSION
	manifest.products = products
	manifest.diagnostics_summary = validation_service.summarize(diagnostics)
	manifest.approved_status = "approved" if approve else "draft"
	var manifest_path := MANIFEST_ROOT.path_join("%s.tres" % safe_name)
	var manifest_result := _atomic_save_resource(manifest, manifest_path)
	if not bool(manifest_result.get("ok", false)):
		return _finish({
			"ok": false,
			"error": str(manifest_result.get(
				"error", "Manifest promotion failed.")),
			"diagnostics": diagnostics,
		})
	if approve:
		asset.source_status = "approved"
	var result := {
		"ok": true,
		"approved": approve,
		"source_hash": source_hash,
		"product_hash": package.product_hash,
		"package_path": package_path,
		"manifest_path": manifest_path,
		"products": products,
		"metrics": geometry.get("metrics", {}),
		"diagnostics": diagnostics,
	}
	return _finish(result)


func _bake_geometry(
		asset: ForgeAssetDefinition,
		palette: ForgePaletteDefinition) -> Dictionary:
	if asset.surface_set is ForgeSurfaceSet:
		return ForgeMeshBaker.bake_surface_cube(asset.surface_set, palette)
	if asset.voxel_volume is ForgeVoxelVolume:
		return ForgeMeshBaker.bake(asset.voxel_volume, palette)
	var baked_parts: Array[Dictionary] = []
	var combined_bounds := AABB()
	var first := true
	var first_result := {}
	for part_resource in asset.parts:
		if part_resource is ForgePartDefinition:
			var part: ForgePartDefinition = part_resource
			if part.source_volume is ForgeVoxelVolume:
				var part_result := ForgeMeshBaker.bake(
					part.source_volume, palette)
				if not bool(part_result.get("ok", false)):
					continue
				if first:
					first_result = part_result
					combined_bounds = part.local_transform * part_result["bounds"]
					first = false
				else:
					combined_bounds = combined_bounds.merge(
						part.local_transform * part_result["bounds"])
				baked_parts.append({
					"part_key": part.part_key,
					"parent_part_key": part.parent_part_key,
					"local_transform": part.local_transform,
					"pivot_transform": part.pivot_transform,
					"animated": part.animated,
					"visibility_group": part.visibility_group,
					"mesh": part_result["mesh"],
					"bounds": part_result["bounds"],
				})
	if not baked_parts.is_empty():
		first_result["parts"] = baked_parts
		first_result["bounds"] = combined_bounds
		first_result["metrics"]["part_count"] = baked_parts.size()
		return first_result
	return {"ok": false, "error": "No bakeable geometry source is present."}


func _build_package(
		asset: ForgeAssetDefinition, contract: ForgePresentationContract,
		source_hash: String, geometry: Dictionary, root_scene_path: String,
		mesh_path: String, material_paths: PackedStringArray,
		collision_path: String, animation_path: String,
		state_binding_path: String, icon_path: String,
		palette: ForgePaletteDefinition,
		frame_result: Dictionary) -> ForgeRuntimePackage:
	var package := ForgeRuntimePackage.new()
	package.presentation_id = asset.presentation_id
	package.contract_version = contract.compatibility_version \
		if contract != null else 1
	package.root_scene_path = root_scene_path
	package.mesh_path = mesh_path
	package.material_paths = material_paths
	package.collision_path = collision_path
	package.animation_library_path = animation_path
	package.state_binding_path = state_binding_path
	package.icon_path = icon_path
	package.bounds = geometry.get("bounds", AABB())
	package.socket_map = _socket_map(asset)
	package.lod_profile = asset.representation_profiles.get("lod", {
		"near": "full", "mid": "static", "far": "iconic",
	}).duplicate(true)
	for variant_resource in asset.variant_sets:
		if variant_resource is ForgeVariantSet:
			package.variant_compatibility.append(
				variant_resource.variant_set_id)
	package.runtime_metadata = {
		"gameplay_links": Array(asset.gameplay_links),
		"asset_kind": asset.asset_kind,
		"authoring_profile": asset.authoring_profile,
		"face_colors": (
			ForgeSurfaceBaker.runtime_face_colors(
				asset.surface_set, palette)
			if asset.surface_set is ForgeSurfaceSet else {}),
		"connection_rules": (
			asset.surface_set.connected_texture_rules.duplicate(true)
			if asset.surface_set is ForgeSurfaceSet else {}),
		"representation_profiles":
			asset.representation_profiles.duplicate(true),
		"footprint": (
			asset.footprint_profile.to_record()
			if asset.footprint_profile is ForgeFootprintProfile else {}),
		"voxel_frame_clips":
			frame_result.get("runtime_metadata", {}).duplicate(true),
		"runtime_remeshing": false,
		"metrics": geometry.get("metrics", {}).duplicate(true),
		"source_revision": asset.source_revision,
	}
	package.product_hash = JSON.stringify({
		"source_hash": source_hash,
		"package": package.to_record(),
	}).sha256_text()
	return package


func _save_root_scene(
		asset: ForgeAssetDefinition, geometry_result: Dictionary,
		library: AnimationLibrary, frame_result: Dictionary,
		product_dir: String,
		_diagnostics: Array[ForgeDiagnostic]) -> String:
	var root := Node3D.new()
	root.name = "ForgePresentation"
	var baked_parts: Array = geometry_result.get("parts", [])
	if baked_parts.is_empty():
		var geometry := MeshInstance3D.new()
		geometry.name = "StaticGeometry"
		geometry.mesh = geometry_result["mesh"]
		root.add_child(geometry)
		geometry.owner = root
	else:
		var part_nodes := {}
		for part_record in baked_parts:
			var pivot := Node3D.new()
			pivot.name = str(part_record["part_key"]).to_pascal_case()
			var runtime_pivot: Transform3D = part_record["pivot_transform"]
			if bool(part_record.get("animated", false)) \
					and runtime_pivot.is_equal_approx(Transform3D.IDENTITY):
				var part_bounds: AABB = part_record["bounds"]
				runtime_pivot = Transform3D(
					Basis.IDENTITY, part_bounds.get_center())
			pivot.transform = part_record["local_transform"] * runtime_pivot
			pivot.visible = str(part_record.get(
				"visibility_group", "")).is_empty()
			pivot.set_meta("forge_part_key", part_record["part_key"])
			var parent_key := str(part_record.get("parent_part_key", ""))
			var parent: Node = part_nodes.get(parent_key, root)
			parent.add_child(pivot)
			pivot.owner = root
			part_nodes[str(part_record["part_key"])] = pivot
			var part_mesh := MeshInstance3D.new()
			part_mesh.name = "Geometry"
			part_mesh.mesh = part_record["mesh"]
			part_mesh.transform = runtime_pivot.affine_inverse()
			part_mesh.material_override = (
				part_record["mesh"].surface_get_material(0).duplicate()
				if part_record["mesh"].get_surface_count() > 0
				and part_record["mesh"].surface_get_material(0) != null
				else null)
			if str(part_record["part_key"]) == "flame" \
					and part_mesh.material_override is BaseMaterial3D:
				var flame_material: BaseMaterial3D = part_mesh.material_override
				flame_material.emission_enabled = true
				flame_material.emission = Color("#f08a2a")
				flame_material.emission_energy_multiplier = 0.6
			pivot.add_child(part_mesh)
			part_mesh.owner = root
	var first_frame_mesh: Mesh = frame_result.get("first_mesh")
	if first_frame_mesh != null:
		var frame_geometry := MeshInstance3D.new()
		frame_geometry.name = "FrameGeometry"
		frame_geometry.mesh = first_frame_mesh
		frame_geometry.transform = _voxel_frame_transform(asset)
		frame_geometry.visible = false
		root.add_child(frame_geometry)
		frame_geometry.owner = root
	if library != null and not library.get_animation_list().is_empty():
		var player := AnimationPlayer.new()
		player.name = "AnimationPlayer"
		player.add_animation_library("", library)
		root.add_child(player)
		player.owner = root
		if first_frame_mesh != null:
			var frame_player := AnimationPlayer.new()
			frame_player.name = "VoxelFramePlayer"
			frame_player.add_animation_library("", library)
			root.add_child(frame_player)
			frame_player.owner = root
	for socket_resource in asset.sockets:
		if not socket_resource is ForgeSocketDefinition:
			continue
		var socket: ForgeSocketDefinition = socket_resource
		var marker := Marker3D.new()
		marker.name = socket.socket_key.to_pascal_case()
		marker.transform = socket.local_transform
		marker.set_meta("forge_socket_key", socket.socket_key)
		marker.set_meta("forge_socket_type", socket.socket_type)
		root.add_child(marker)
		marker.owner = root
	_add_state_markers(root, asset)
	if asset.state_binding != null:
		var adapter := ForgeStateAdapter.new()
		adapter.name = "StateAdapter"
		adapter.state_binding = asset.state_binding
		root.add_child(adapter)
		adapter.owner = root
	var packed := PackedScene.new()
	var pack_error := packed.pack(root)
	root.free()
	if pack_error != OK:
		return ""
	var path := product_dir.path_join("presentation.tscn")
	return path if ResourceSaver.save(packed, path) == OK else ""


func _voxel_frame_transform(asset: ForgeAssetDefinition) -> Transform3D:
	var fallback := Transform3D.IDENTITY
	for resource in asset.parts:
		if not resource is ForgePartDefinition:
			continue
		var part: ForgePartDefinition = resource
		if not part.visibility_group.is_empty():
			fallback = part.local_transform \
				* part.pivot_transform.affine_inverse()
		if part.part_key == "flame":
			return part.local_transform \
				* part.pivot_transform.affine_inverse()
	return fallback


func _add_state_markers(
		root: Node3D, asset: ForgeAssetDefinition) -> void:
	if not asset.state_binding is ForgeStateBindingDefinition:
		return
	var marker_names := {}
	for binding in asset.state_binding.bindings:
		for action in binding.get("actions", []):
			if str(action.get("type", "")) != "visibility":
				continue
			var target := str(action.get("target", ""))
			if target.is_empty() or "/" in target \
					or root.get_node_or_null(NodePath(target)) != null:
				continue
			marker_names[target] = true
	for marker_name in marker_names:
		var marker := Label3D.new()
		marker.name = str(marker_name)
		marker.text = (
			"BLOCKED" if "Blocked" in str(marker_name) else "DAMAGED")
		marker.font_size = 42
		marker.modulate = (
			Color("#ffb347") if "Blocked" in str(marker_name)
			else Color("#d94b4b"))
		marker.outline_size = 8
		marker.no_depth_test = true
		marker.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		marker.position = Vector3(0.5, 1.08, 0.0)
		marker.visible = false
		root.add_child(marker)
		marker.owner = root


func _bake_voxel_frames(
		source: ForgeAnimationSet, palette: ForgePaletteDefinition,
		product_dir: String, library: AnimationLibrary) -> Dictionary:
	var products: Array[Dictionary] = []
	var runtime_metadata := {}
	var diagnostics: Array[Dictionary] = []
	var first_mesh: Mesh
	if source == null:
		return {
			"ok": true,
			"products": products,
			"runtime_metadata": runtime_metadata,
			"diagnostics": diagnostics,
			"first_mesh": first_mesh,
		}
	for resource in source.voxel_frame_clips:
		if not resource is ForgeVoxelFrameClip:
			continue
		var clip: ForgeVoxelFrameClip = resource
		var baked := ForgeVoxelFrameBaker.bake(clip, palette)
		diagnostics.append_array(baked.get("diagnostics", []))
		if not bool(baked.get("ok", false)):
			return {
				"ok": false,
				"products": products,
				"runtime_metadata": runtime_metadata,
				"diagnostics": diagnostics,
				"first_mesh": first_mesh,
			}
		if library.has_animation(clip.clip_id):
			diagnostics.append({
				"code": "FORGE-FRAME-005",
				"severity": "error",
				"message": "Voxel-frame clip ID collides with another clip.",
			})
			return {
				"ok": false,
				"products": products,
				"runtime_metadata": runtime_metadata,
				"diagnostics": diagnostics,
				"first_mesh": first_mesh,
			}
		var frame_directory := product_dir.path_join(
			"frames_%s" % ForgeId.safe_filename(clip.clip_id))
		var make_error := DirAccess.make_dir_recursive_absolute(
			ProjectSettings.globalize_path(frame_directory))
		if make_error not in [OK, ERR_ALREADY_EXISTS]:
			diagnostics.append({
				"code": "FORGE-FRAME-006",
				"severity": "error",
				"message": error_string(make_error),
			})
			return {
				"ok": false,
				"products": products,
				"runtime_metadata": runtime_metadata,
				"diagnostics": diagnostics,
				"first_mesh": first_mesh,
			}
		var animation := Animation.new()
		animation.length = float(baked["total_duration"])
		animation.loop_mode = (
			Animation.LOOP_LINEAR if bool(baked["loop"])
			else Animation.LOOP_NONE)
		var mesh_track := animation.add_track(Animation.TYPE_VALUE)
		animation.track_set_path(mesh_track, NodePath("FrameGeometry:mesh"))
		animation.track_set_interpolation_type(
			mesh_track, Animation.INTERPOLATION_NEAREST)
		var elapsed := 0.0
		var frame_paths := PackedStringArray()
		for frame_record in baked["frames"]:
			var frame_index := int(frame_record["index"])
			var frame_path := frame_directory.path_join(
				"frame_%03d.res" % frame_index)
			var frame_error := ResourceSaver.save(
				frame_record["mesh"], frame_path)
			if frame_error != OK or not ResourceLoader.exists(frame_path):
				diagnostics.append({
					"code": "FORGE-FRAME-006",
					"severity": "error",
					"message": "Could not save pre-baked frame %d." % frame_index,
				})
				return {
					"ok": false,
					"products": products,
					"runtime_metadata": runtime_metadata,
					"diagnostics": diagnostics,
					"first_mesh": first_mesh,
				}
			var frame_mesh := ResourceLoader.load(
				frame_path, "", ResourceLoader.CACHE_MODE_IGNORE)
			frame_paths.append(frame_path)
			products.append(_product_record(frame_path, "voxel_frame_mesh"))
			animation.track_insert_key(mesh_track, elapsed, frame_mesh)
			elapsed += float(frame_record["duration"])
			if first_mesh == null and frame_mesh is Mesh:
				first_mesh = frame_mesh
		library.add_animation(clip.clip_id, animation)
		var fallback_index := int(baked["reduced_motion_frame"])
		runtime_metadata[clip.clip_id] = {
			"frame_paths": Array(frame_paths),
			"frame_durations": Array(clip.frame_durations),
			"loop": clip.loop,
			"onion_skin_authored": clip.onion_skin_enabled,
			"reduced_motion_frame": fallback_index,
			"reduced_motion_mesh": (
				frame_paths[fallback_index]
				if fallback_index < frame_paths.size() else ""),
			"lod_policy": baked["lod_policy"],
			"runtime_remeshing": false,
		}
	return {
		"ok": true,
		"products": products,
		"runtime_metadata": runtime_metadata,
		"diagnostics": diagnostics,
		"first_mesh": first_mesh,
	}


func _socket_map(asset: ForgeAssetDefinition) -> Dictionary:
	var result := {}
	for socket_resource in asset.sockets:
		if socket_resource is ForgeSocketDefinition:
			var socket: ForgeSocketDefinition = socket_resource
			result[socket.socket_key] = socket.to_record()
	return result


func _primary_palette(asset: ForgeAssetDefinition) -> ForgePaletteDefinition:
	for palette_resource in asset.palettes:
		if palette_resource is ForgePaletteDefinition:
			return palette_resource
	var palette := ForgePaletteDefinition.new()
	palette.palette_id = "palette.fallback"
	palette.ensure_default_entries()
	return palette


func _atomic_save_resource(resource: Resource, target: String) -> Dictionary:
	var directory_error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(target.get_base_dir()))
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(directory_error)}
	var temporary := "%s.tmp.tres" % target.trim_suffix(".tres")
	var previous := "%s.previous.bak" % target.trim_suffix(".tres")
	var save_error := ResourceSaver.save(resource, temporary)
	if save_error != OK:
		return {"ok": false, "error": error_string(save_error)}
	var verified := ResourceLoader.load(
		temporary, "", ResourceLoader.CACHE_MODE_IGNORE)
	if verified == null:
		_remove_file(temporary)
		return {"ok": false, "error": "Generated resource failed read-back."}
	_remove_file(previous)
	if FileAccess.file_exists(target):
		var rotate_error := DirAccess.rename_absolute(
			ProjectSettings.globalize_path(target),
			ProjectSettings.globalize_path(previous))
		if rotate_error != OK:
			_remove_file(temporary)
			return {"ok": false, "error": error_string(rotate_error)}
	var promote_error := DirAccess.rename_absolute(
		ProjectSettings.globalize_path(temporary),
		ProjectSettings.globalize_path(target))
	if promote_error != OK:
		if FileAccess.file_exists(previous):
			DirAccess.rename_absolute(
				ProjectSettings.globalize_path(previous),
				ProjectSettings.globalize_path(target))
		_remove_file(temporary)
		return {"ok": false, "error": error_string(promote_error)}
	return {"ok": true, "path": target, "previous": previous}


func _product_record(path: String, product_type: String) -> Dictionary:
	return {
		"path": path,
		"type": product_type,
		"hash": _file_hash(path),
	}


func _file_hash(path: String) -> String:
	return FileAccess.get_sha256(path) if FileAccess.file_exists(path) else ""


func _write_error(
		path: String, error: Error,
		diagnostics: Array[ForgeDiagnostic]) -> Dictionary:
	return {
		"ok": false,
		"error": "Could not write %s: %s" % [path, error_string(error)],
		"diagnostics": diagnostics,
	}


func _remove_file(path: String) -> void:
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))


func _finish(result: Dictionary) -> Dictionary:
	bake_completed.emit(result)
	return result
