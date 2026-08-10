extends Node
## Read-only runtime package resolver. Authoring services are never autoloaded.

signal packages_reloaded(summary: Dictionary)
signal package_changed(presentation_id: String)

const PACKAGE_ROOT := "res://generated/forge/packages"

var packages: Dictionary = {}
var gameplay_to_presentation: Dictionary = {}
var registry_bridge := ForgeRegistryBridge.new()
var creator_registry := ForgeCreatorRuntimeRegistry.new()


func _ready() -> void:
	reload_packages()


func reload_packages() -> Dictionary:
	packages.clear()
	gameplay_to_presentation.clear()
	for record in registry_bridge.all_gameplay_records():
		gameplay_to_presentation[str(record["gameplay_id"])] = str(
			record["presentation_id"])
	_scan_packages(PACKAGE_ROOT)
	var creator_summary := creator_registry.reload()
	var summary := {
		"package_count": packages.size(),
		"gameplay_link_count": gameplay_to_presentation.size(),
		"creator_active_count": int(creator_summary.get("active_count", 0)),
		"creator_stale_count": int(creator_summary.get("stale_count", 0)),
	}
	packages_reloaded.emit(summary)
	return summary


func resolve_creator(source_id: String) -> Dictionary:
	return creator_registry.resolve(source_id)


func creator_product_for(source_id: String, index := 0) -> Resource:
	return creator_registry.product_for(source_id, index)


func resolve(
		gameplay_id: String, representation := "world",
		context: Dictionary = {}) -> Dictionary:
	var presentation_id := str(gameplay_to_presentation.get(
		gameplay_id, ForgeId.presentation_id_for(gameplay_id)))
	var package: ForgeRuntimePackage = packages.get(presentation_id)
	if package == null:
		return {
			"ok": false,
			"gameplay_id": gameplay_id,
			"presentation_id": presentation_id,
			"representation": representation,
			"context": context.duplicate(true),
			"fallback": "legacy_runtime",
		}
	return {
		"ok": true,
		"gameplay_id": gameplay_id,
		"presentation_id": presentation_id,
		"representation": representation,
		"context": context.duplicate(true),
		"package": package,
		"fallback": "",
		"provenance": {
			"layer": "project",
			"source_id": package.presentation_id,
			"product_hash": package.product_hash,
		},
	}


func instantiate_presentation(
		gameplay_id: String, representation := "world",
		context: Dictionary = {}) -> Node3D:
	var resolution := resolve(gameplay_id, representation, context)
	if not bool(resolution.get("ok", false)):
		return null
	var package: ForgeRuntimePackage = resolution["package"]
	if not package.root_scene_path.is_empty() \
			and ResourceLoader.exists(package.root_scene_path):
		var scene := ResourceLoader.load(package.root_scene_path)
		if scene is PackedScene:
			var instance: Node3D = scene.instantiate()
			_apply_accessibility(instance, package)
			ForgeRuntimeEffects.attach(instance, package)
			return instance
	if not package.mesh_path.is_empty() and ResourceLoader.exists(package.mesh_path):
		var mesh := ResourceLoader.load(package.mesh_path)
		if mesh is Mesh:
			var root := Node3D.new()
			root.name = "ForgePresentation"
			var mesh_instance := MeshInstance3D.new()
			mesh_instance.name = "StaticGeometry"
			mesh_instance.mesh = mesh
			root.add_child(mesh_instance)
			return root
	return null


func _apply_accessibility(
		root: Node3D, package: ForgeRuntimePackage) -> void:
	if root == null or not UIState.setting_bool("reduced_motion"):
		return
	root.set_meta("forge_reduced_motion", true)
	var players: Array[AnimationPlayer] = []
	for player_path in ["AnimationPlayer", "VoxelFramePlayer"]:
		var player := root.get_node_or_null(player_path)
		if player is AnimationPlayer:
			player.speed_scale = 0.4
			players.append(player)
	var static_clips := PackedStringArray()
	var frame_clips: Dictionary = package.runtime_metadata.get(
		"voxel_frame_clips", {})
	for clip_id in frame_clips:
		var frame_record: Dictionary = frame_clips[clip_id]
		var fallback_path := str(frame_record.get(
			"reduced_motion_mesh", ""))
		if fallback_path.is_empty() or not ResourceLoader.exists(fallback_path):
			continue
		var mesh := ResourceLoader.load(fallback_path)
		var frame_geometry := root.get_node_or_null("FrameGeometry")
		if frame_geometry is MeshInstance3D and mesh is Mesh:
			frame_geometry.mesh = mesh
			static_clips.append(str(clip_id))
	for player in players:
		player.set_meta("forge_reduced_motion_static_clips", static_clips)


func has_package_for(gameplay_id: String) -> bool:
	return bool(resolve(gameplay_id).get("ok", false))


func package_for(gameplay_id: String) -> ForgeRuntimePackage:
	var resolution := resolve(gameplay_id)
	return resolution.get("package") \
		if bool(resolution.get("ok", false)) else null


func average_surface_color(gameplay_id: String) -> Variant:
	var package := package_for(gameplay_id)
	if package == null:
		return null
	var face_colors: Dictionary = package.runtime_metadata.get(
		"face_colors", {})
	if face_colors.is_empty():
		return null
	var values: Array = face_colors.values()
	var sum := Color(0, 0, 0, 0)
	var count := 0
	for value in values:
		if value is Array and value.size() >= 3:
			sum += Color(
				float(value[0]), float(value[1]), float(value[2]),
				float(value[3]) if value.size() > 3 else 1.0)
			count += 1
	return sum / float(count) if count > 0 else null


func surface_paths(gameplay_id: String) -> Dictionary:
	var package := package_for(gameplay_id)
	var result := {}
	if package == null:
		return result
	for path in package.material_paths:
		var face := path.get_file().get_basename()
		if face in ForgeSurfaceSet.FACE_KEYS:
			result[face] = path
	return result


func mesh_arrays(gameplay_id: String) -> Array:
	var package := package_for(gameplay_id)
	if package == null or package.mesh_path.is_empty() \
			or not ResourceLoader.exists(package.mesh_path):
		return []
	var mesh := ResourceLoader.load(package.mesh_path)
	if not mesh is ArrayMesh or mesh.get_surface_count() == 0:
		return []
	return mesh.surface_get_arrays(0)


func uses_custom_chunk_geometry(gameplay_id: String) -> bool:
	var package := package_for(gameplay_id)
	if package == null:
		return false
	return str(package.runtime_metadata.get("asset_kind", "")) \
		== "unique_voxel_block" \
		and "chute" not in gameplay_id


func uses_scene_presentation(gameplay_id: String) -> bool:
	var package := package_for(gameplay_id)
	if package == null:
		return false
	return str(package.runtime_metadata.get("asset_kind", "")) \
		== "compound_machine" \
		and not package.root_scene_path.is_empty() \
		and ResourceLoader.exists(package.root_scene_path)


func _scan_packages(path: String) -> void:
	var directory := DirAccess.open(path)
	if directory == null:
		return
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if entry.begins_with("."):
			entry = directory.get_next()
			continue
		var child := path.path_join(entry)
		if directory.current_is_dir():
			_scan_packages(child)
		elif (entry.ends_with(".tres") or entry.ends_with(".res")) \
				and not entry.ends_with(".previous.tres") \
				and ".tmp." not in entry:
			var resource := ResourceLoader.load(
				child, "", ResourceLoader.CACHE_MODE_IGNORE)
			if resource is ForgeRuntimePackage:
				var package: ForgeRuntimePackage = resource
				packages[package.presentation_id] = package
		entry = directory.get_next()
	directory.list_dir_end()
