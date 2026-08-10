class_name ForgePreviewViewport
extends SubViewportContainer

signal zoom_changed(percent: int)

const MIN_ZOOM := 0.25
const MAX_ZOOM := 8.0
const ZOOM_STEP := 1.2
# Forge authoring treats -Z as the presentation front.
const CAMERA_DIRECTION := Vector3(1.8, 2.2, -5.0)
const BUTTON_PAN_PIXELS := 44.0

var _viewport: SubViewport
var _pivot: Node3D
var _presentation_root: Node3D
var _camera: Camera3D
var _dragging := false
var _panning := false
var _last_mouse := Vector2.ZERO
var _yaw := deg_to_rad(30.0)
var _pitch := deg_to_rad(-15.0)
var _zoom := 1.0
var _base_camera_size := 2.0
var _camera_target := Vector3.ZERO
var _camera_distance := 4.5
var _current_bounds := AABB()
var _has_current_bounds := false
var _creator_dependency_cache: Dictionary = {}


func _ready() -> void:
	# The dock owns the controls above this canvas. A smaller vertical minimum
	# lets the preview flex inside compact editor/game hosts without pushing its
	# parent below the window; wider/taller layouts still expand it normally.
	custom_minimum_size = Vector2(220, 180)
	focus_mode = Control.FOCUS_ALL
	mouse_default_cursor_shape = Control.CURSOR_MOVE
	# Let the container, rather than the initial 420 x 420 render target, define
	# the UI minimum. Godot then keeps the render target at the displayed pixel
	# size without feeding that size back into the dock's minimum dimensions.
	stretch = true
	_viewport = SubViewport.new()
	_viewport.size = Vector2i(420, 420)
	_viewport.transparent_bg = false
	_viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(_viewport)
	var world_environment := WorldEnvironment.new()
	var environment := Environment.new()
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color("#111a20")
	environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	environment.ambient_light_color = Color("#b7c8d0")
	environment.ambient_light_energy = 0.65
	world_environment.environment = environment
	_viewport.add_child(world_environment)
	_pivot = Node3D.new()
	_pivot.name = "PreviewPivot"
	_viewport.add_child(_pivot)
	_presentation_root = Node3D.new()
	_presentation_root.name = "Presentation"
	_pivot.add_child(_presentation_root)
	var light := DirectionalLight3D.new()
	light.rotation_degrees = Vector3(-45, -35, 0)
	light.light_energy = 1.15
	_viewport.add_child(light)
	_camera = Camera3D.new()
	_camera.projection = Camera3D.PROJECTION_ORTHOGONAL
	_camera.current = true
	_viewport.add_child(_camera)
	reset_view()
	call_deferred("_refresh_projection_for_viewport_size")


func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED and is_instance_valid(_viewport):
		# A stretched SubViewportContainer owns its child's size. Refresh the
		# projection after Godot has propagated the new container rectangle.
		call_deferred("_refresh_projection_for_viewport_size")


func show_asset(asset: ForgeAssetDefinition) -> void:
	if not is_instance_valid(_presentation_root):
		return
	_clear_presentation()
	if asset == null:
		return
	var palette: ForgePaletteDefinition
	for value in asset.palettes:
		if value is ForgePaletteDefinition:
			palette = value
			break
	var result := {}
	if asset.uses_surface_authoring():
		result = ForgeMeshBaker.bake_textured_surface_cube(
			asset.surface_set, palette)
	elif asset.uses_voxel_authoring():
		result = ForgeMeshBaker.bake(asset.voxel_volume, palette)
	elif not asset.parts.is_empty():
		var combined_bounds := AABB()
		var first := true
		for resource in asset.parts:
			if not resource is ForgePartDefinition \
					or not resource.source_volume is ForgeVoxelVolume:
				continue
			var part: ForgePartDefinition = resource
			var part_result := ForgeMeshBaker.bake(
				part.source_volume, palette)
			if not bool(part_result.get("ok", false)):
				continue
			var part_node := MeshInstance3D.new()
			part_node.name = part.part_key.to_pascal_case()
			part_node.mesh = part_result["mesh"]
			part_node.transform = part.local_transform
			_presentation_root.add_child(part_node)
			var part_bounds: AABB = (
				part.local_transform * part_result["bounds"])
			combined_bounds = part_bounds if first \
				else combined_bounds.merge(part_bounds)
			first = false
		if not first:
			_presentation_root.position = -combined_bounds.get_center()
			_fit_bounds(combined_bounds)
		return
	if bool(result.get("ok", false)):
		var mesh_instance := MeshInstance3D.new()
		mesh_instance.name = "Geometry"
		mesh_instance.mesh = result["mesh"]
		_presentation_root.add_child(mesh_instance)
		var bounds: AABB = result.get("bounds", AABB())
		_presentation_root.position = -bounds.get_center()
		_fit_bounds(bounds)


func show_runtime_package(gameplay_id: String, instance_count := 1) -> void:
	if not is_instance_valid(_presentation_root):
		return
	_clear_presentation()
	var count := clampi(instance_count, 1, 5)
	var package: ForgeRuntimePackage = ForgeRuntime.package_for(gameplay_id)
	var combined_bounds := AABB()
	var first := true
	for index in count:
		var instance := ForgeRuntime.instantiate_presentation(
			gameplay_id, "forge_world_test")
		if instance == null:
			continue
		instance.position = Vector3(
			float(index) - float(count - 1) * 0.5, 0.0, 0.0)
		_presentation_root.add_child(instance)
		if package != null:
			var bounds := package.bounds
			bounds.position += instance.position
			combined_bounds = bounds if first else combined_bounds.merge(bounds)
			first = false
	if not first:
		_presentation_root.position = -combined_bounds.get_center()
		_fit_bounds(combined_bounds)
	else:
		_fit_bounds(AABB(Vector3(-1, -0.5, -0.5), Vector3(2, 1, 1)))


func show_creator_resource(resource: Resource, open_resources := {}) -> bool:
	if not is_instance_valid(_presentation_root):
		return false
	_clear_presentation()
	if resource == null:
		return false
	var bounds: Array = []
	if resource is ForgeBlueprintDefinition \
			or resource is ForgeBlueprintModuleDefinition \
			or resource is ForgeBlueprintModuleSet \
			or resource is ForgeProceduralStructureRuleSet \
			or resource is ForgeBlueprintStateDefinition:
		_render_structure_resource(resource, open_resources, bounds)
	elif resource is ForgeEntityDefinition \
			or resource is ForgeBodyPlanDefinition \
			or resource is ForgeBodyPartDefinition:
		_render_entity_resource(resource, bounds)
	elif resource is ForgeVfxForm \
			or resource is ForgeVfxGraph \
			or resource is ForgeVfxDefinition:
		_render_vfx_resource(resource, open_resources, bounds)
	if bounds.is_empty():
		return false
	var combined: AABB = bounds[0]
	for index in range(1, bounds.size()):
		combined = combined.merge(bounds[index])
	_presentation_root.position = -combined.get_center()
	_fit_bounds(combined)
	return true


func has_visible_presentation() -> bool:
	return is_instance_valid(_presentation_root) \
		and not _presentation_root.get_children().is_empty()


func visible_presentation_node_count() -> int:
	return _presentation_root.get_child_count() \
		if is_instance_valid(_presentation_root) else 0


func _render_structure_resource(
		resource: Resource, open_resources: Dictionary, bounds: Array) -> void:
	if resource is ForgeBlueprintDefinition:
		_render_blueprint(resource, Vector3.ZERO, Color.WHITE, [], bounds)
		return
	if resource is ForgeBlueprintModuleDefinition:
		_render_module(resource, Vector3.ZERO, Color.WHITE, [], bounds)
		if bounds.is_empty():
			bounds.append(_append_box(Vector3.ZERO, Vector3(4, 2.5, 4),
				Color("#4F7486"), "EmptyModuleEnvelope", true))
		return
	if resource is ForgeBlueprintStateDefinition:
		var blueprint := _resolve_creator_resource(resource.blueprint_id, open_resources)
		var damage_tint := Color("#D78572").lerp(Color.WHITE,
			1.0 - clampf(resource.damage_ratio, 0.0, 1.0))
		if blueprint is ForgeBlueprintDefinition:
			_render_blueprint(blueprint, Vector3.ZERO, damage_tint,
				Array(resource.remove_element_ids), bounds)
		else:
			bounds.append(_append_box(Vector3.ZERO, Vector3(4, 3, 4),
				damage_tint, "StateEnvelope", true))
		return
	if resource is ForgeBlueprintModuleSet:
		for index in resource.module_ids.size():
			var module := _resolve_creator_resource(resource.module_ids[index], open_resources)
			var offset := Vector3(float(index % 3) * 5.0, 0.0,
				float(index / 3) * 5.0)
			if module is ForgeBlueprintModuleDefinition:
				_render_module(module, offset, Color.WHITE, [], bounds)
			else:
				bounds.append(_append_box(offset, Vector3(4, 2.5, 4),
					_preview_color(str(resource.module_ids[index])),
					"Module_%d" % index, true))
		return
	if resource is ForgeProceduralStructureRuleSet:
		var module_set := _resolve_creator_resource(resource.module_set_id, open_resources)
		var modules := {}
		if module_set is ForgeBlueprintModuleSet:
			for module_id in module_set.module_ids:
				var module := _resolve_creator_resource(str(module_id), open_resources)
				if module is ForgeBlueprintModuleDefinition:
					modules[module.module_id] = module
			var generated := ForgeProceduralStructureAssembler.new().generate(
				module_set, modules, resource)
			if bool(generated.get("ok", false)):
				for placement in generated.get("placements", []):
					var offset := _variant_vector3(placement.get("position", Vector3.ZERO))
					var module: Variant = modules.get(str(placement.get("module_id", "")))
					if module is ForgeBlueprintModuleDefinition:
						_render_module(module, offset, Color.WHITE, [], bounds)
					else:
						bounds.append(_append_box(offset, Vector3(4, 2.5, 4),
							_preview_color(str(placement.get("module_id", "module"))),
							"GeneratedModule", true))
		if bounds.is_empty():
			bounds.append(_append_box(Vector3.ZERO, Vector3(4, 2.5, 4),
				Color("#526D7A"), "RulesEnvelope", true))


func _render_blueprint(
		blueprint: ForgeBlueprintDefinition, offset: Vector3, tint: Color,
		removed_ids: Array, bounds: Array) -> void:
	if blueprint.physical_authoring_mode == "voxel_grid" \
			and blueprint.structure_voxel_source != null:
		_render_structure_voxels(
			blueprint.structure_voxel_source, offset, tint, bounds)
		_render_blueprint_elements(_semantic_structure_elements(
			blueprint.elements), offset, tint, removed_ids, bounds)
	else:
		_render_blueprint_elements(blueprint.elements, offset, tint, removed_ids, bounds)
	if not bounds.is_empty() or blueprint.placement_profile == null:
		return
	var profile := blueprint.placement_profile
	var footprint_min := Vector3(profile.footprint_min)
	var footprint_size := Vector3(profile.footprint_max - profile.footprint_min + Vector3i.ONE)
	footprint_size = footprint_size.max(Vector3.ONE)
	bounds.append(_append_box(offset + footprint_min, footprint_size,
		Color("#587A87"), "BlueprintFootprint", true))


func _render_module(
		module: ForgeBlueprintModuleDefinition, offset: Vector3, tint: Color,
		removed_ids: Array, bounds: Array) -> void:
	if module.physical_authoring_mode == "voxel_grid" \
			and module.structure_voxel_source != null:
		_render_structure_voxels(module.structure_voxel_source, offset, tint, bounds)
		_render_blueprint_elements(_semantic_structure_elements(
			module.elements), offset, tint, removed_ids, bounds)
	else:
		_render_blueprint_elements(module.elements, offset, tint, removed_ids, bounds)


func _render_structure_voxels(
		source: ForgeStructureVoxelSource, offset: Vector3, tint: Color,
		bounds: Array) -> void:
	for cell in source.active_cells():
		var color := _preview_color(cell.block_id) * tint
		bounds.append(_append_box(offset + Vector3(cell.position), Vector3.ONE,
			color, "StructureCell_%s" % ForgeId.safe_filename(cell.cell_id)))


func _semantic_structure_elements(elements: Array[ForgeBlueprintElement]) \
		-> Array[ForgeBlueprintElement]:
	var result: Array[ForgeBlueprintElement] = []
	for element in elements:
		if element == null:
			continue
		if not element.module_id.is_empty() or element.source_id.is_empty() \
				or element.element_kind in [
					"module", "marker", "semantic_marker", "socket",
					"network", "child_blueprint"]:
			result.append(element)
	return result


func _render_blueprint_elements(
		elements: Array, offset: Vector3, tint: Color,
		removed_ids: Array, bounds: Array) -> void:
	for value in elements:
		if not value is ForgeBlueprintElement or value.element_id in removed_ids:
			continue
		var element := value as ForgeBlueprintElement
		var position := offset + Vector3(element.position)
		if element.element_kind == "semantic_marker":
			bounds.append(_append_box(position + Vector3(0.35, 0.35, 0.35),
				Vector3(0.3, 0.3, 0.3), Color("#55D6C2"),
				"Marker_%s" % ForgeId.safe_filename(element.element_id), false, true))
			continue
		var size := Vector3(element.size.max(Vector3i.ONE))
		var color := _preview_color(
			element.material_role_id if not element.material_role_id.is_empty() else element.source_id)
		color *= tint
		var operation := str(element.metadata.get("op", ""))
		if operation == "perimeter" and size.x > 2.0 and size.z > 2.0:
			bounds.append(_append_box(position, Vector3(size.x, size.y, 1.0),
				color, "PerimeterNorth"))
			bounds.append(_append_box(position + Vector3(0, 0, size.z - 1.0),
				Vector3(size.x, size.y, 1.0), color, "PerimeterSouth"))
			bounds.append(_append_box(position + Vector3(0, 0, 1.0),
				Vector3(1.0, size.y, size.z - 2.0), color, "PerimeterWest"))
			bounds.append(_append_box(position + Vector3(size.x - 1.0, 0, 1.0),
				Vector3(1.0, size.y, size.z - 2.0), color, "PerimeterEast"))
		else:
			bounds.append(_append_box(position, size, color,
				"Element_%s" % ForgeId.safe_filename(element.element_id)))


func _render_entity_resource(resource: Resource, bounds: Array) -> void:
	var plan: ForgeBodyPlanDefinition
	var fallback_size := Vector3.ONE
	if resource is ForgeEntityDefinition:
		plan = resource.body_plan
		fallback_size = resource.world_dimensions_meters.max(Vector3(0.25, 0.25, 0.25))
	elif resource is ForgeBodyPlanDefinition:
		plan = resource
		fallback_size = resource.world_dimensions_meters.max(Vector3(0.25, 0.25, 0.25))
	elif resource is ForgeBodyPartDefinition:
		var part_plan := ForgeBodyPlanDefinition.new()
		part_plan.root_part_id = resource.body_part_id
		part_plan.body_parts = [resource]
		plan = part_plan
	if plan == null:
		return
	var world_positions := {}
	var pending: Array = plan.body_parts.duplicate()
	var passes := 0
	while not pending.is_empty() and passes <= plan.body_parts.size():
		passes += 1
		var progressed := false
		for value in pending.duplicate():
			if not value is ForgeBodyPartDefinition:
				pending.erase(value)
				continue
			var part := value as ForgeBodyPartDefinition
			if not part.parent_part_id.is_empty() and not world_positions.has(part.parent_part_id):
				continue
			var position: Vector3 = world_positions.get(part.parent_part_id, Vector3.ZERO) \
				+ part.local_position_meters
			world_positions[part.body_part_id] = position
			if part.voxel_source != null and part.voxel_source.occupied_count() > 0:
				var baked := ForgeMeshBaker.bake(part.voxel_source, null)
				if bool(baked.get("ok", false)):
					var mesh_node := MeshInstance3D.new()
					mesh_node.name = "BodyPart_%s" % ForgeId.safe_filename(part.body_part_id)
					mesh_node.mesh = baked.get("mesh") as Mesh
					mesh_node.position = position
					mesh_node.rotation_degrees = part.local_rotation_degrees
					mesh_node.scale = part.local_scale
					_presentation_root.add_child(mesh_node)
					var part_bounds: AABB = baked.get("bounds", AABB())
					part_bounds.position += position
					part_bounds.size *= part.local_scale.abs()
					bounds.append(part_bounds)
			pending.erase(part)
			progressed = true
		if not progressed:
			break
	if bounds.is_empty():
		bounds.append(_append_box(Vector3.ZERO, fallback_size,
			Color("#7E9CAA"), "EntityEnvelope", true))


func _render_vfx_resource(
		resource: Resource, open_resources: Dictionary, bounds: Array) -> void:
	if resource is ForgeVfxForm:
		_render_vfx_form(resource, Vector3.ZERO, bounds)
		return
	if resource is ForgeVfxGraph:
		var node_count := maxi(1, resource.nodes.size())
		for index in node_count:
			var position := Vector3((float(index) - float(node_count - 1) * 0.5) * 0.7,
				sin(float(index) * 0.9) * 0.25, 0.0)
			bounds.append(_append_box(position, Vector3(0.42, 0.42, 0.42),
				_preview_color(str(resource.nodes[index].get("type", "node")))
				if index < resource.nodes.size() else Color("#8D62CF"),
				"GraphNode_%d" % index, false, true))
			if index > 0:
				bounds.append(_append_box(position - Vector3(0.27, 0.04, -0.04),
					Vector3(0.25, 0.08, 0.08), Color("#75C9D2"),
					"GraphEdge_%d" % index, false, true))
		return
	if resource is ForgeVfxDefinition:
		var form_offset := 0.0
		for form_id in resource.form_ids:
			var form := _resolve_creator_resource(str(form_id), open_resources)
			if form is ForgeVfxForm:
				_render_vfx_form(form, Vector3(form_offset, 0, 0), bounds)
				form_offset += 0.5
		if bounds.is_empty():
			for index in clampi(resource.maximum_instances, 1, 8):
				var position := Vector3(cos(float(index) * 2.4),
					float(index) * 0.18, sin(float(index) * 2.4)) * 0.45
				bounds.append(_append_box(position, Vector3(0.16, 0.16, 0.16),
					Color("#C35CE7"), "EffectParticle_%d" % index, false, true))


func _render_vfx_form(form: ForgeVfxForm, offset: Vector3, bounds: Array) -> void:
	var cell_size := maxf(form.voxel_size_meters, 0.01)
	for index in form.cell_records.size():
		var record: Dictionary = form.cell_records[index]
		var cell := _variant_vector3(record.get("position", Vector3.ZERO))
		var palette_index := int(record.get("palette_index", 0))
		bounds.append(_append_box(offset + (cell - form.pivot) * cell_size,
			Vector3.ONE * cell_size, _preview_color("vfx_%d" % palette_index),
			"VfxCell_%d" % index, false, true))
	if form.cell_records.is_empty():
		bounds.append(_append_box(offset, Vector3.ONE * cell_size,
			Color("#C35CE7"), "EmptyVfxForm", true, true))


func _append_box(
		position: Vector3, requested_size: Vector3, color: Color, node_name: String,
		transparent := false, emissive := false) -> AABB:
	var size := requested_size.abs().max(Vector3(0.02, 0.02, 0.02))
	var mesh := BoxMesh.new()
	mesh.size = size
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(color.r, color.g, color.b,
		0.42 if transparent else maxf(color.a, 0.82))
	material.roughness = 0.72
	if transparent:
		material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	if emissive:
		material.emission_enabled = true
		material.emission = color
		material.emission_energy_multiplier = 1.35
	mesh.material = material
	var node := MeshInstance3D.new()
	node.name = "%s_%d" % [node_name, _presentation_root.get_child_count()]
	node.mesh = mesh
	node.position = position + size * 0.5
	_presentation_root.add_child(node)
	return AABB(position, size)


func _resolve_creator_resource(source_id: String, open_resources: Dictionary) -> Resource:
	if source_id.is_empty():
		return null
	var open_resource: Variant = open_resources.get(source_id)
	if open_resource is Resource:
		return open_resource
	var cached: Variant = _creator_dependency_cache.get(source_id)
	if cached is Resource:
		return cached
	var safe_name := ForgeId.safe_filename(source_id)
	for root in ["res://content/forge/blueprints", "res://content/forge/entities",
			"res://content/forge/presentation/set23"]:
		var path := _find_creator_resource_path(root, safe_name)
		if path.is_empty():
			continue
		var loaded := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if loaded is Resource:
			_creator_dependency_cache[source_id] = loaded
			return loaded
	return null


func _find_creator_resource_path(root: String, safe_name: String) -> String:
	var directory := DirAccess.open(root)
	if directory == null:
		return ""
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if not entry.begins_with("."):
			var path := root.path_join(entry)
			if directory.current_is_dir():
				var nested := _find_creator_resource_path(path, safe_name)
				if not nested.is_empty():
					directory.list_dir_end()
					return nested
			elif entry.get_basename() == safe_name \
					and (entry.ends_with(".tres") or entry.ends_with(".res")):
				directory.list_dir_end()
				return path
		entry = directory.get_next()
	directory.list_dir_end()
	return ""


func _variant_vector3(value: Variant) -> Vector3:
	if value is Vector3:
		return value
	if value is Vector3i:
		return Vector3(value)
	if value is Array and value.size() >= 3:
		return Vector3(float(value[0]), float(value[1]), float(value[2]))
	return Vector3.ZERO


func _preview_color(key: String) -> Color:
	var lowered := key.to_lower()
	if "stone" in lowered or "foundation" in lowered:
		return Color("#73808A")
	if "wood" in lowered or "beam" in lowered or "wall" in lowered:
		return Color("#A7774F")
	if "roof" in lowered:
		return Color("#6D8C68")
	var hue := float(abs(hash(key)) % 360) / 360.0
	return Color.from_hsv(hue, 0.48, 0.88)


func zoom_in() -> void:
	_set_zoom(_zoom * ZOOM_STEP)


func zoom_out() -> void:
	_set_zoom(_zoom / ZOOM_STEP)


func reset_view() -> void:
	_yaw = deg_to_rad(30.0)
	_pitch = deg_to_rad(-15.0)
	_zoom = 1.0
	_camera_target = Vector3.ZERO
	if _has_current_bounds:
		_recalculate_fit_size()
	_apply_orbit()
	_update_camera()
	_apply_zoom()


func get_zoom_percent() -> int:
	return roundi(_zoom * 100.0)


func pan_left() -> void:
	_pan_by(Vector2(BUTTON_PAN_PIXELS, 0.0))


func pan_right() -> void:
	_pan_by(Vector2(-BUTTON_PAN_PIXELS, 0.0))


func pan_up() -> void:
	_pan_by(Vector2(0.0, BUTTON_PAN_PIXELS))


func pan_down() -> void:
	_pan_by(Vector2(0.0, -BUTTON_PAN_PIXELS))


func _clear_presentation() -> void:
	for child in _presentation_root.get_children():
		_presentation_root.remove_child(child)
		child.queue_free()
	_presentation_root.position = Vector3.ZERO
	_has_current_bounds = false


func _refresh_projection_for_viewport_size() -> void:
	if not is_instance_valid(_viewport):
		return
	if _has_current_bounds:
		_recalculate_fit_size()
		_apply_zoom()


func _fit_bounds(bounds: AABB) -> void:
	_current_bounds = bounds
	_has_current_bounds = true
	var radius := maxf(bounds.size.length() * 0.5, 0.25)
	_camera_distance = maxf(3.5, radius * 3.2)
	_camera_target = Vector3.ZERO
	_camera.near = maxf(0.01, _camera_distance - radius * 1.75)
	_camera.far = _camera_distance + radius * 4.0
	_zoom = 1.0
	_recalculate_fit_size()
	_update_camera()
	_apply_zoom()


func _recalculate_fit_size() -> void:
	if not _has_current_bounds:
		return
	# A padded bounding sphere stays framed at every orbit angle. Portrait
	# previews need extra vertical camera size because orthographic `size`
	# describes the vertical span.
	var fit_span := maxf(_current_bounds.size.length() * 1.45, 0.5)
	var aspect := 1.0
	if is_instance_valid(_viewport) and _viewport.size.y > 0:
		aspect = float(_viewport.size.x) / float(_viewport.size.y)
	_base_camera_size = clampf(
		fit_span / maxf(0.35, minf(1.0, aspect)), 0.5, 40.0)


func _set_zoom(value: float) -> void:
	_zoom = clampf(value, MIN_ZOOM, MAX_ZOOM)
	_apply_zoom()


func _apply_zoom() -> void:
	if is_instance_valid(_camera):
		_camera.size = _base_camera_size / _zoom
	zoom_changed.emit(get_zoom_percent())


func _pan_by(delta: Vector2) -> void:
	if not is_instance_valid(_camera) or not is_instance_valid(_viewport):
		return
	var viewport_height := maxf(1.0, float(_viewport.size.y))
	var world_per_pixel := _camera.size / viewport_height
	var basis := _camera.global_transform.basis
	_camera_target += (
		-basis.x * delta.x + basis.y * delta.y) * world_per_pixel
	_update_camera()


func _update_camera() -> void:
	if not is_instance_valid(_camera):
		return
	var direction := CAMERA_DIRECTION.normalized()
	var camera_position := _camera_target + direction * _camera_distance
	_camera.look_at_from_position(camera_position, _camera_target)


func _orbit_by(delta: Vector2) -> void:
	_yaw -= delta.x * 0.01
	_pitch = clampf(
		_pitch - delta.y * 0.01,
		deg_to_rad(-85.0), deg_to_rad(85.0))
	_apply_orbit()


func _apply_orbit() -> void:
	if is_instance_valid(_pivot):
		_pivot.rotation = Vector3(_pitch, _yaw, 0.0)


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_panning = event.pressed and event.shift_pressed
			_dragging = event.pressed and not event.shift_pressed
			_last_mouse = event.position
			if event.pressed:
				grab_focus()
			accept_event()
		elif event.button_index in [MOUSE_BUTTON_MIDDLE, MOUSE_BUTTON_RIGHT]:
			_panning = event.pressed
			_dragging = false
			_last_mouse = event.position
			if event.pressed:
				grab_focus()
			accept_event()
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_in()
			accept_event()
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_out()
			accept_event()
	elif event is InputEventMouseMotion and (_dragging or _panning):
		var delta: Vector2 = event.position - _last_mouse
		_last_mouse = event.position
		if _panning:
			_pan_by(delta)
		else:
			_orbit_by(delta)
		accept_event()
	elif event is InputEventPanGesture:
		_set_zoom(_zoom * pow(ZOOM_STEP, -event.delta.y))
		accept_event()
	elif event is InputEventKey and event.pressed and not event.echo:
		if event.keycode in [KEY_EQUAL, KEY_PLUS, KEY_KP_ADD]:
			zoom_in()
			accept_event()
		elif event.keycode in [KEY_MINUS, KEY_KP_SUBTRACT]:
			zoom_out()
			accept_event()
		elif event.keycode == KEY_0:
			reset_view()
			accept_event()
		elif event.keycode == KEY_LEFT:
			pan_left()
			accept_event()
		elif event.keycode == KEY_RIGHT:
			pan_right()
			accept_event()
		elif event.keycode == KEY_UP:
			pan_up()
			accept_event()
		elif event.keycode == KEY_DOWN:
			pan_down()
			accept_event()
