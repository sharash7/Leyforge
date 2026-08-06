@tool
extends SceneTree
## Generates deterministic Stage 3 entity, animation, and event fixtures.

const ROOT := "res://content/forge/runtime/set22_23_stage3"
const HUMANOID_PATH := (
	"res://content/forge/entities/entity_definition_template_humanoid_standard.tres")
const PIG_PATH := (
	"res://content/forge/entities/entity_definition_template_pig_quadruped.tres")

var _saved := 0
var _failures: Array[String] = []
var _entities: Dictionary = {}
var _rigs: Dictionary = {}


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(ROOT))
	var humanoid := _load_entity(HUMANOID_PATH)
	var pig := _load_entity(PIG_PATH)
	if humanoid == null or pig == null:
		_finish()
		return
	_entities["humanoid_standard"] = humanoid
	_entities["pig_quadruped"] = pig
	var goblin := _clone_goblin(humanoid)
	var spider := _create_spider()
	var wisp := _create_wisp()
	for key in ["goblin_standard", "spider_standard", "wisp_standard"]:
		_save_entity_sources(_entities[key], key)
	for key in _entities:
		var entity: ForgeEntityDefinition = _entities[key]
		var rig := _create_or_load_rig(entity, key)
		_rigs[key] = rig
		if key in ["goblin_standard", "spider_standard", "wisp_standard"]:
			var spatial_map := _create_spatial_map(entity, rig, key)
			rig.spatial_map_id = spatial_map.spatial_map_id
			rig.dependency_ids = PackedStringArray([
				entity.entity_definition_id, entity.body_plan.body_plan_id,
			])
			_save(rig, "%s/rig_profile_%s.tres" % [ROOT, key])
			_save(spatial_map, "%s/spatial_map_%s.tres" % [ROOT, key])
			_save(_assembly(entity, rig, spatial_map, key),
				"%s/entity_assembly_profile_%s.tres" % [ROOT, key])
	_generate_presentation_contracts()
	_generate_animation_sources()
	_generate_variants(humanoid, pig, goblin, spider, wisp)
	_generate_proxies()
	_generate_equipment()
	_generate_furnace_spatial_map()
	_finish()


func _finish() -> void:
	print("SET22_STAGE3_EVENT_ANIMATION_SOURCE_GENERATOR %s" % JSON.stringify({
		"ok": _failures.is_empty(),
		"saved": _saved,
		"entity_count": _entities.size(),
		"rig_count": _rigs.size(),
		"failures": _failures,
	}))
	quit(0 if _failures.is_empty() else 1)


func _load_entity(path: String) -> ForgeEntityDefinition:
	var entity := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE) as ForgeEntityDefinition
	if entity == null or entity.body_plan == null:
		_failures.append("Entity source did not load: %s" % path)
	return entity


func _clone_goblin(source: ForgeEntityDefinition) -> ForgeEntityDefinition:
	var entity := source.duplicate(true) as ForgeEntityDefinition
	entity.entity_definition_id = "entity.definition.creature.goblin_standard"
	entity.display_name = "Goblin Standard"
	entity.body_family = "goblin_humanoid"
	entity.entity_role_ids = PackedStringArray(["entity_role.goblin"])
	entity.gameplay_definition_ids = PackedStringArray(["entity.goblin"])
	entity.template_id = "template.entity.goblin_standard"
	entity.template_locked = false
	entity.world_dimensions_meters = source.world_dimensions_meters * 0.82
	entity.legacy_fallback = "legacy.procedural_visual.goblin"
	entity.body_plan = source.body_plan.duplicate(true)
	entity.body_plan.body_plan_id = "entity.body_plan.goblin_standard"
	entity.body_plan.display_name = "Goblin Standard Body Plan"
	entity.body_plan.family = "goblin_humanoid"
	entity.body_plan.template_locked = false
	entity.body_plan.world_dimensions_meters = entity.world_dimensions_meters
	var old_root := entity.body_plan.root_part_id
	var id_map := {}
	for part in entity.body_plan.body_parts:
		var suffix := part.body_part_id.get_slice(".",
			part.body_part_id.get_slice_count(".") - 1)
		id_map[part.body_part_id] = "entity.body_part.goblin_standard.%s" % suffix
	for part in entity.body_plan.body_parts:
		part.body_part_id = str(id_map[part.body_part_id])
		part.parent_part_id = str(id_map.get(part.parent_part_id, ""))
		part.local_position_meters *= 0.82
		part.planning_status = "golden_source_candidate"
	entity.body_plan.root_part_id = str(id_map[old_root])
	entity.body_plan.dependency_ids = PackedStringArray([
		"density.profile.entity.standard",
	])
	entity.dependency_ids = PackedStringArray([
		entity.body_plan.body_plan_id, "density.profile.entity.standard",
	])
	_entities["goblin_standard"] = entity
	return entity


func _create_spider() -> ForgeEntityDefinition:
	var entity := ForgeEntityDefinition.new()
	entity.entity_definition_id = "entity.definition.creature.spider_standard"
	entity.display_name = "Spider Standard"
	entity.body_family = "arthropod"
	entity.entity_role_ids = PackedStringArray(["entity_role.spider"])
	entity.material_dna_ids = PackedStringArray([
		"material.dna.entity.hide_leather"])
	entity.world_dimensions_meters = Vector3(1.0, 0.55, 1.0)
	entity.gameplay_definition_ids = PackedStringArray(["entity.spider"])
	entity.template_id = "template.entity.spider_standard"
	entity.source_status = "golden_source_candidate"
	entity.lifecycle = "golden_source_candidate"
	entity.legacy_fallback = "legacy.procedural_visual.spider"
	var plan := ForgeBodyPlanDefinition.new()
	plan.body_plan_id = "entity.body_plan.spider_standard"
	plan.display_name = "Spider Standard Body Plan"
	plan.family = "arthropod"
	plan.world_dimensions_meters = entity.world_dimensions_meters
	plan.required_entity_roles = entity.entity_role_ids
	plan.lifecycle = "golden_source_candidate"
	var core := _part("spider_standard", "core", "Core", "",
		"anatomy.role.arthropod.core", Vector3i(12, 8, 14), Vector3.ZERO)
	plan.root_part_id = core.body_part_id
	plan.body_parts.append(core)
	plan.body_parts.append(_part("spider_standard", "head", "Head",
		core.body_part_id, "anatomy.role.arthropod.head", Vector3i(8, 6, 8),
		Vector3(0, 0.02, -0.42)))
	for side in ["left", "right"]:
		for index in range(1, 5):
			var x_sign := -1.0 if side == "left" else 1.0
			var z_offset := -0.34 + float(index - 1) * 0.22
			plan.body_parts.append(_part(
				"spider_standard", "leg_%s_%d" % [side, index],
				"Leg %s %d" % [side.capitalize(), index], core.body_part_id,
				"anatomy.role.arthropod.leg.%s.%d" % [side, index],
				Vector3i(12, 3, 3), Vector3(x_sign * 0.38, -0.04, z_offset), side))
	plan.symmetry_groups = [{
		"group_id": "spider_legs", "axis": "x", "mode": "paired"}]
	plan.contact_sets = [{
		"contact_set_id": "locomotion", "role_ids": [
			"anatomy.role.arthropod.leg.left.1",
			"anatomy.role.arthropod.leg.right.1"]}]
	plan.dependency_ids = PackedStringArray(["density.profile.entity.standard"])
	entity.body_plan = plan
	entity.dependency_ids = PackedStringArray([
		plan.body_plan_id, "density.profile.entity.standard"])
	_entities["spider_standard"] = entity
	return entity


func _create_wisp() -> ForgeEntityDefinition:
	var entity := ForgeEntityDefinition.new()
	entity.entity_definition_id = "entity.definition.creature.wisp_standard"
	entity.display_name = "Wisp Standard"
	entity.body_family = "wisp"
	entity.entity_role_ids = PackedStringArray(["entity_role.wisp"])
	entity.material_dna_ids = PackedStringArray([
		"material.dna.entity.skin_tones"])
	entity.world_dimensions_meters = Vector3(0.45, 0.55, 0.45)
	entity.gameplay_definition_ids = PackedStringArray(["entity.wisp"])
	entity.template_id = "template.entity.wisp_standard"
	entity.source_status = "golden_source_candidate"
	entity.lifecycle = "golden_source_candidate"
	entity.legacy_fallback = "legacy.procedural_visual.wisp"
	var plan := ForgeBodyPlanDefinition.new()
	plan.body_plan_id = "entity.body_plan.wisp_standard"
	plan.display_name = "Wisp Standard Body Plan"
	plan.family = "wisp"
	plan.world_dimensions_meters = entity.world_dimensions_meters
	plan.required_entity_roles = entity.entity_role_ids
	plan.lifecycle = "golden_source_candidate"
	var core := _part("wisp_standard", "core", "Core", "",
		"anatomy.role.wisp.core", Vector3i(10, 12, 10), Vector3.ZERO)
	plan.body_parts = [core]
	plan.root_part_id = core.body_part_id
	plan.dependency_ids = PackedStringArray(["density.profile.entity.standard"])
	entity.body_plan = plan
	entity.dependency_ids = PackedStringArray([
		plan.body_plan_id, "density.profile.entity.standard"])
	_entities["wisp_standard"] = entity
	return entity


func _part(
		family: String, key: String, display_name: String, parent_id: String,
		role_id: String, dimensions: Vector3i, position: Vector3,
		side := "centre") -> ForgeBodyPartDefinition:
	var part := ForgeBodyPartDefinition.new()
	part.body_part_id = "entity.body_part.%s.%s" % [family, key]
	part.display_name = display_name
	part.parent_part_id = parent_id
	part.anatomy_role_id = role_id
	part.voxel_source = _filled_volume(dimensions)
	part.material_dna_id = "material.dna.entity.hide_leather"
	part.local_position_meters = position
	part.side_token = side
	part.rig_role = role_id
	part.planning_status = "golden_source_candidate"
	part.lifecycle = "golden_source_candidate"
	part.dependency_ids = PackedStringArray([
		"density.profile.entity.standard", part.material_dna_id])
	return part


func _filled_volume(dimensions: Vector3i) -> ForgeVoxelVolume:
	var volume := ForgeVoxelVolume.new()
	volume.dimensions = dimensions
	volume.density_profile = "density.profile.entity.standard"
	volume.voxel_size_meters = 0.03125
	volume.ensure_storage()
	for index in volume.cells.size():
		volume.cells[index] = 1
	return volume


func _save_entity_sources(entity: ForgeEntityDefinition, key: String) -> void:
	_save(entity.body_plan, "%s/body_plan_%s.tres" % [ROOT, key])
	for part in entity.body_plan.body_parts:
		_save(part, "%s/body_part_%s.tres" % [
			ROOT, ForgeId.safe_filename(part.body_part_id)])
	_save(entity, "%s/entity_definition_%s.tres" % [ROOT, key])


func _create_or_load_rig(
		entity: ForgeEntityDefinition, key: String) -> ForgeRigProfile:
	if key in ["humanoid_standard", "pig_quadruped"]:
		return ResourceLoader.load(
			"res://content/forge/runtime/set22_23/rig_profile_%s.tres" % key,
			"", ResourceLoader.CACHE_MODE_IGNORE) as ForgeRigProfile
	var rig := ForgeRigProfile.new()
	rig.rig_profile_id = "entity.rig.profile.%s" % key
	rig.display_name = "%s Semantic Rig" % entity.display_name
	rig.entity_definition_id = entity.entity_definition_id
	rig.body_plan_id = entity.body_plan.body_plan_id
	rig.lifecycle = "golden_source_candidate"
	rig.aliases = PackedStringArray(["entity.rig.template.%s" % key])
	var role_by_part := {}
	for part in entity.body_plan.body_parts:
		role_by_part[part.body_part_id] = part.anatomy_role_id
	for part in entity.body_plan.body_parts:
		var binding := ForgeRigRoleBinding.new()
		binding.role_id = part.anatomy_role_id
		binding.body_part_id = part.body_part_id
		binding.parent_role_id = str(role_by_part.get(part.parent_part_id, ""))
		binding.binding_mode = "rigid_part"
		binding.lod_group = _lod_group(binding.role_id)
		if part.body_part_id == entity.body_plan.root_part_id:
			rig.root_role_id = binding.role_id
		else:
			binding.joint_id = "%s.joint.%s" % [rig.rig_profile_id,
				ForgeId.safe_filename(binding.role_id)]
			var joint := ForgeRigJointDefinition.new()
			joint.joint_id = binding.joint_id
			joint.parent_role_id = binding.parent_role_id
			joint.child_role_id = binding.role_id
			joint.joint_type = "hinge" if ".leg." in binding.role_id else "ball"
			joint.primary_axis = Vector3.RIGHT
			joint.rest_position_meters = part.local_position_meters
			joint.minimum_angles_degrees = Vector3(-35, -20, -25)
			joint.maximum_angles_degrees = Vector3(35, 20, 25)
			joint.procedural_hook = (
				"contact_assist" if ".leg." in binding.role_id else "look_assist")
			joint.lifecycle = "golden_source_candidate"
			rig.joints.append(joint)
		rig.role_bindings.append(binding)
	rig.rig_lod_levels = [{"lod": 0, "solver_policy": "full_semantic",
		"active_role_ids": _role_ids(rig)}, {"lod": 1,
		"solver_policy": "reduced_contacts", "active_role_ids": _role_ids(rig)},
		{"lod": 2, "solver_policy": "rigid_core",
			"active_role_ids": _role_ids(rig)}]
	rig.motion_profiles = _motion_profiles(rig)
	return rig


func _create_spatial_map(
		entity: ForgeEntityDefinition, rig: ForgeRigProfile,
		key: String) -> ForgeSpatialMap:
	var spatial_map := ForgeSpatialMap.new()
	spatial_map.spatial_map_id = "spatial.map.entity.%s" % key
	spatial_map.display_name = "%s Spatial Map" % entity.display_name
	spatial_map.owner_asset_id = entity.entity_definition_id
	spatial_map.lifecycle = "golden_source_candidate"
	spatial_map.aliases = PackedStringArray(["spatial.map.template.%s" % key])
	spatial_map.supported_variant_ids = PackedStringArray(["base", "damaged"])
	spatial_map.supported_lod_levels = [0, 1, 2]
	var center := _reference(entity.entity_definition_id,
		"spatial.reference.entity.%s.center" % key,
		"anchor", "anchor.presentation.center", rig.root_role_id,
		Vector3.ZERO, true)
	spatial_map.references.append(center)
	var roles := _spatial_specs(key, rig.root_role_id)
	for spec in roles:
		var reference := _reference(entity.entity_definition_id,
			"spatial.reference.entity.%s.%s" % [key, spec[0]],
			spec[1], spec[2], spec[3], spec[4], spec[5], center.stable_id)
		reference.lod_mappings = [{"lod": 1, "quality": "equivalent"},
			{"lod": 2, "quality": "approximate",
				"reference_id": center.stable_id}]
		spatial_map.references.append(reference)
		if bool(spec[5]):
			spatial_map.required_role_ids.append(spec[2])
	spatial_map.required_role_ids.append("anchor.presentation.center")
	spatial_map.alias_mappings = {
		"presentation.spatial.entity.%s.voice" % key: "socket.audio.voice",
		"presentation.spatial.entity.%s.contact" % key:
			"runtime_anchor.movement.foot_contact",
	}
	spatial_map.dependency_ids = PackedStringArray([
		entity.entity_definition_id, rig.rig_profile_id])
	return spatial_map


func _spatial_specs(key: String, root_role: String) -> Array:
	var head_role := root_role
	var foot_left := root_role
	var foot_right := root_role
	if key == "goblin_standard":
		head_role = "anatomy.role.humanoid.head"
		foot_left = "anatomy.role.humanoid.foot.left"
		foot_right = "anatomy.role.humanoid.foot.right"
	elif key == "spider_standard":
		head_role = "anatomy.role.arthropod.head"
		foot_left = "anatomy.role.arthropod.leg.left.1"
		foot_right = "anatomy.role.arthropod.leg.right.1"
	return [
		["voice", "socket", "socket.audio.voice", head_role,
			Vector3.ZERO, true],
		["mouth", "socket", "socket.presentation.mouth", head_role,
			Vector3(0, 0, -0.1), true],
		["foot_left", "socket", "socket.presentation.foot.left", foot_left,
			Vector3.ZERO, key != "wisp_standard"],
		["foot_right", "socket", "socket.presentation.foot.right", foot_right,
			Vector3.ZERO, key != "wisp_standard"],
		["equipment", "socket", "socket.equipment.primary",
			"anatomy.role.humanoid.hand.right" if key == "goblin_standard"
			else root_role, Vector3.ZERO, key == "goblin_standard"],
		["damage", "socket", "socket.presentation.damage", root_role,
			Vector3.ZERO, true],
		["breath", "socket", "socket.vfx.breath_origin", head_role,
			Vector3(0, 0, -0.12), true],
		["contact", "runtime_anchor", "runtime_anchor.movement.foot_contact",
			foot_left, Vector3.ZERO, key != "wisp_standard"],
	]


func _reference(
		owner_id: String, stable_id: String, spatial_type: String,
		role_id: String, parent_role_id: String, position: Vector3,
		required: bool, fallback_id := "") -> ForgeSpatialReference:
	var reference := ForgeSpatialReference.new()
	reference.stable_id = stable_id
	reference.display_name = role_id
	reference.owner_asset_id = owner_id
	reference.spatial_type = spatial_type
	reference.semantic_role_id = role_id
	reference.mapping_mode = (
		"runtime_event_bound" if spatial_type == "runtime_anchor" else "bone_bound")
	reference.coordinate_space = "owner_local"
	reference.local_position = position
	reference.required_status = "required" if required else "optional"
	reference.approximation_policy = "declared_fallback_only"
	reference.fallback_reference_id = fallback_id
	reference.lifecycle = "foundation"
	reference.source_status = "validated_foundation_contract"
	reference.rights_status = "not_applicable"
	reference.extension_fields = {"parent_role_id": parent_role_id,
		"follow_mode": "live_role", "base_mapping_quality": "exact"}
	return reference


func _assembly(
		entity: ForgeEntityDefinition, rig: ForgeRigProfile,
		spatial_map: ForgeSpatialMap, key: String) -> ForgeEntityAssemblyProfile:
	var assembly := ForgeEntityAssemblyProfile.new()
	assembly.assembly_profile_id = "entity.assembly_profile.%s" % key
	assembly.display_name = "%s Runtime Assembly" % entity.display_name
	assembly.entity_definition_id = entity.entity_definition_id
	assembly.rig_profile_id = rig.rig_profile_id
	assembly.spatial_map_id = spatial_map.spatial_map_id
	assembly.lifecycle = "golden_source_candidate"
	assembly.dependency_ids = PackedStringArray([
		entity.entity_definition_id, rig.rig_profile_id, spatial_map.spatial_map_id])
	assembly.aliases = PackedStringArray([
		"entity.assembly_profile.template.%s" % key])
	assembly.legacy_fallback = entity.legacy_fallback
	return assembly


func _generate_animation_sources() -> void:
	for key in _entities:
		var rig: ForgeRigProfile = _rigs[key]
		var foot_profile_id := ""
		if key != "wisp_standard":
			var foot := _foot_profile(key, rig)
			foot_profile_id = foot.foot_placement_profile_id
			_save(foot, "%s/foot_placement_%s.tres" % [ROOT, key])
		var retarget := ForgeRetargetMap.new()
		retarget.retarget_map_id = "entity.retarget_map.%s.self" % key
		retarget.display_name = "%s Exact Retarget" % _entities[key].display_name
		retarget.source_rig_profile_id = rig.rig_profile_id
		retarget.target_rig_profile_id = rig.rig_profile_id
		retarget.compatibility_level = "exact"
		retarget.role_mappings = _identity_role_map(rig)
		retarget.lifecycle = "golden_source_candidate"
		retarget.dependency_ids = PackedStringArray([rig.rig_profile_id])
		retarget.aliases = PackedStringArray([
			"entity.retarget_map.template.%s" % key])
		_save(retarget, "%s/retarget_map_%s.tres" % [ROOT, key])
		var library := ForgeEntityAnimationLibrary.new()
		library.animation_library_id = "entity.animation_set.%s.stage3" % key
		library.display_name = "%s Semantic Animation Library" % _entities[key].display_name
		library.rig_profile_id = rig.rig_profile_id
		library.rig_family = _entities[key].body_family
		library.clips = _clips_for(key, rig)
		library.retarget_map_ids = PackedStringArray([retarget.retarget_map_id])
		library.foot_placement_profile_id = foot_profile_id
		library.animation_lod_levels = [{"lod": 0, "marker_policy": "all"},
			{"lod": 1, "marker_policy": "critical_contacts"},
			{"lod": 2, "marker_policy": "state_only"}]
		library.lifecycle = "golden_source_candidate"
		var dependencies := [rig.rig_profile_id, retarget.retarget_map_id]
		if not foot_profile_id.is_empty():
			dependencies.append(foot_profile_id)
		for event_id in _event_dependencies(library.clips):
			dependencies.append(event_id)
		library.dependency_ids = PackedStringArray(dependencies)
		library.aliases = PackedStringArray([
			"entity.animation_set.template.%s" % key])
		library.legacy_fallback = _entities[key].legacy_fallback
		_save(library, "%s/animation_library_%s.tres" % [ROOT, key])


func _clips_for(key: String, rig: ForgeRigProfile) -> Array[ForgeEntityAnimationClip]:
	var clips: Array[ForgeEntityAnimationClip] = []
	clips.append(_clip(key, "idle", 1.6, true, [], []))
	var contact_roles := _foot_roles(key)
	var walk_markers: Array[ForgeAnimationEventMarker] = []
	for index in contact_roles.size():
		walk_markers.append(_marker(
			"foot_%d" % index, "event.movement.foot_contact",
			0.25 + float(index) * 0.5, "runtime_anchor.movement.foot_contact",
			"foot_contact"))
	var walk_tracks: Array[Dictionary] = []
	for index in contact_roles.size():
		walk_tracks.append(_swing_track(contact_roles[index],
			PI if index % 2 == 0 else 0.0, 24.0))
	clips.append(_clip(key, "walk", 0.8, true, walk_tracks, walk_markers))
	if key in ["humanoid_standard", "goblin_standard"]:
		var hand_role := "anatomy.role.humanoid.hand.right"
		clips.append(_clip(key, "mine", 1.0, false,
			[_swing_track(hand_role, 0.0, 55.0)], [
				_marker("equipment_release", "event.animation.equipment_release",
					0.45, "runtime_anchor.equipment.release", "release"),
				_marker("mining_impact", "event.block.mining_impact", 0.65,
					"runtime_anchor.block.mining_impact", "impact"),
			]))
	if key in ["pig_quadruped", "goblin_standard", "spider_standard", "wisp_standard"]:
		clips.append(_clip(key, "telegraph", 0.9, false, [], [
			_marker("creature_telegraph", "event.creature.telegraph", 0.4,
				"runtime_anchor.creature.telegraph", "telegraph")]))
	return clips


func _clip(
		key: String, action: String, duration: float, looping: bool,
		tracks: Array[Dictionary],
		markers: Array[ForgeAnimationEventMarker]) -> ForgeEntityAnimationClip:
	var clip := ForgeEntityAnimationClip.new()
	clip.clip_id = "entity.animation.clip.%s.%s" % [key, action]
	clip.display_name = "%s %s" % [key.capitalize(), action.capitalize()]
	clip.semantic_action = action
	clip.duration_seconds = duration
	clip.looping = looping
	clip.role_tracks = tracks
	clip.event_markers = markers
	clip.lifecycle = "golden_source_candidate"
	return clip


func _marker(
		key: String, event_id: String, time: float, spatial_role: String,
		contact_kind: String) -> ForgeAnimationEventMarker:
	var marker := ForgeAnimationEventMarker.new()
	marker.marker_id = "animation.marker.%s.%s" % [
		ForgeId.safe_filename(event_id), key]
	marker.event_contract_id = event_id
	marker.normalized_time = time
	marker.spatial_role_id = spatial_role
	marker.contact_kind = contact_kind
	marker.required = true
	return marker


func _swing_track(role_id: String, phase: float, amplitude: float) -> Dictionary:
	return {"role_id": role_id, "interpolation": "linear", "keys": [
		{"time": 0.0, "rotation_degrees": Vector3(amplitude * sin(phase), 0, 0)},
		{"time": 0.5, "rotation_degrees": Vector3(-amplitude * sin(phase + PI * 0.5), 0, 0)},
		{"time": 1.0, "rotation_degrees": Vector3(amplitude * sin(phase), 0, 0)},
	]}


func _foot_profile(key: String, rig: ForgeRigProfile) -> ForgeFootPlacementProfile:
	var profile := ForgeFootPlacementProfile.new()
	profile.foot_placement_profile_id = "entity.foot_placement.%s" % key
	profile.display_name = "%s Foot Placement" % _entities[key].display_name
	profile.rig_profile_id = rig.rig_profile_id
	profile.contact_role_ids = PackedStringArray(_foot_roles(key))
	profile.lifecycle = "golden_source_candidate"
	profile.dependency_ids = PackedStringArray([rig.rig_profile_id])
	return profile


func _foot_roles(key: String) -> Array[String]:
	if key in ["humanoid_standard", "goblin_standard"]:
		return ["anatomy.role.humanoid.foot.left",
			"anatomy.role.humanoid.foot.right"]
	if key == "pig_quadruped":
		return ["anatomy.role.quadruped.leg.front_left",
			"anatomy.role.quadruped.leg.front_right"]
	if key == "spider_standard":
		return ["anatomy.role.arthropod.leg.left.1",
			"anatomy.role.arthropod.leg.right.1"]
	return []


func _event_dependencies(clips: Array[ForgeEntityAnimationClip]) -> Array[String]:
	var result: Array[String] = []
	for clip in clips:
		for marker in clip.event_markers:
			if marker.event_contract_id not in result:
				result.append(marker.event_contract_id)
	return result


func _identity_role_map(rig: ForgeRigProfile) -> Dictionary:
	var result := {}
	for binding in rig.role_bindings:
		result[binding.role_id] = binding.role_id
	return result


func _generate_variants(
		humanoid: ForgeEntityDefinition, pig: ForgeEntityDefinition,
		goblin: ForgeEntityDefinition, spider: ForgeEntityDefinition,
		wisp: ForgeEntityDefinition) -> void:
	var specs := [
		["player.base", "Player", humanoid, ["entity_role.player"], true],
		["profession.builder", "Builder", humanoid, ["entity_role.builder"], false],
		["profession.farmer", "Farmer", humanoid, ["entity_role.farmer"], false],
		["profession.guard", "Guard", humanoid, ["entity_role.guard"], false],
		["profession.lumberjack", "Lumberjack", humanoid, ["entity_role.lumberjack"], false],
		["profession.mage", "Mage", humanoid, ["entity_role.mage"], false],
		["profession.merchant", "Merchant", humanoid, ["entity_role.merchant"], false],
		["profession.miner", "Miner", humanoid, ["entity_role.miner"], true],
		["profession.elder", "Elder", humanoid, ["entity_role.elder"], false],
		["pig.base", "Pig", pig, ["entity_role.pig"], false],
		["spider.base", "Spider", spider, ["entity_role.spider"], false],
		["goblin.scout", "Goblin Scout", goblin, ["entity_role.goblin"], false],
		["goblin.raider", "Goblin Raider", goblin, ["entity_role.goblin"], false],
		["goblin.shaman", "Goblin Shaman", goblin, ["entity_role.goblin"], false],
		["wisp.base", "Wisp", wisp, ["entity_role.wisp"], false],
	]
	for spec in specs:
		var profile := ForgeEntityVariantProfile.new()
		profile.variant_profile_id = "entity.variant.%s" % spec[0]
		profile.display_name = spec[1]
		profile.entity_definition_id = spec[2].entity_definition_id
		profile.entity_role_ids = PackedStringArray(spec[3])
		profile.material_variant_ids = spec[2].material_dna_ids
		profile.equipment_profile_ids = PackedStringArray(
			["entity.equipment_profile.crude_pickaxe.stage3"] if spec[4] else [])
		profile.proportion_scale = Vector3.ONE
		profile.lifecycle = "golden_source_candidate"
		profile.dependency_ids = PackedStringArray([
			profile.entity_definition_id] + Array(profile.equipment_profile_ids))
		profile.legacy_fallback = spec[2].legacy_fallback
		_save(profile, "%s/variant_%s.tres" % [ROOT,
			ForgeId.safe_filename(profile.variant_profile_id)])


func _generate_proxies() -> void:
	for key in _entities:
		var entity: ForgeEntityDefinition = _entities[key]
		var profile := ForgeGameplayProxyProfile.new()
		profile.gameplay_proxy_profile_id = "entity.gameplay_proxy.%s" % key
		profile.display_name = "%s Presentation Proxy" % entity.display_name
		profile.entity_definition_id = entity.entity_definition_id
		profile.collision_shape = "sphere" if key == "wisp_standard" else "capsule"
		profile.collision_size_meters = entity.world_dimensions_meters
		profile.region_proxies = [{"role_id": "region.entity.body",
			"local_position": Vector3.ZERO, "authority": "readback_only"}]
		profile.interaction_role_ids = PackedStringArray([
			"region.entity.body"])
		profile.compatibility_review = "open"
		profile.lifecycle = "golden_source_candidate"
		profile.dependency_ids = PackedStringArray([entity.entity_definition_id])
		_save(profile, "%s/gameplay_proxy_%s.tres" % [ROOT, key])


func _generate_equipment() -> void:
	var profile := ForgeEquipmentFitProfile.new()
	profile.equipment_profile_id = "entity.equipment_profile.crude_pickaxe.stage3"
	profile.display_name = "Crude Pickaxe Semantic Fit"
	profile.equipment_asset_id = "item.tool.pickaxe_crude"
	profile.compatible_rig_profile_ids = PackedStringArray([
		_rigs.humanoid_standard.rig_profile_id,
		_rigs.goblin_standard.rig_profile_id,
	])
	profile.socket_role_id = "socket.equipment.primary"
	profile.local_rotation_degrees = Vector3(0, 0, -25)
	profile.release_spatial_role_id = "runtime_anchor.equipment.release"
	profile.fallback_socket_role_id = "anchor.presentation.center"
	profile.lifecycle = "golden_source_candidate"
	profile.dependency_ids = PackedStringArray([
		_rigs.humanoid_standard.rig_profile_id,
		_rigs.goblin_standard.rig_profile_id,
	])
	profile.legacy_fallback = "legacy.held_item.pickaxe_crude"
	_save(profile, "%s/equipment_fit_crude_pickaxe.tres" % ROOT)


func _generate_presentation_contracts() -> void:
	var event_specs := [
		["event.movement.foot_contact", "Foot Contact", "movement",
			"runtime_anchor.movement.foot_contact"],
		["event.animation.equipment_release", "Equipment Release", "animation",
			"runtime_anchor.equipment.release"],
		["event.creature.telegraph", "Creature Telegraph", "combat",
			"runtime_anchor.creature.telegraph"],
	]
	for spec in event_specs:
		var event := ForgePresentationEventContract.new()
		event.stable_id = spec[0]
		event.display_name = spec[1]
		event.owner_system = spec[2]
		event.payload_fields = _standard_payload_fields()
		event.required_context_fields = PackedStringArray([
			"position", "target_material", "intensity"])
		event.allowed_outputs = PackedStringArray(["vfx", "audio"])
		event.lifecycle = "golden_source_candidate"
		event.source_status = "validated_runtime_source"
		event.rights_status = "not_applicable"
		event.dependency_ids = PackedStringArray([
			"context.schema.presentation.foundation"])
		_save(event, "%s/%s.tres" % [ROOT, ForgeId.safe_filename(event.stable_id)])
		var profile := _presentation_profile(spec[0], spec[1], spec[3])
		_save(profile, "%s/%s.tres" % [ROOT, ForgeId.safe_filename(profile.stable_id)])
		var binding := _presentation_binding(spec[0], profile.stable_id, spec[3],
			"*", "%s Binding" % spec[1])
		_save(binding, "%s/%s.tres" % [ROOT, ForgeId.safe_filename(binding.stable_id)])
	var mining_binding := _presentation_binding(
		"event.block.mining_impact",
		"presentation.profile.contact.mining.stone.foundation",
		"runtime_anchor.block.mining_impact",
		"entity.definition.template.humanoid_standard", "Entity Mining Binding")
	mining_binding.stable_id = "presentation.binding.entity.mining.stage3"
	mining_binding.conditions = {"target_material": "stone"}
	mining_binding.dependency_ids = PackedStringArray([
		"event.block.mining_impact",
		"presentation.profile.contact.mining.stone.foundation",
		"runtime_anchor.block.mining_impact"])
	_save(mining_binding, "%s/presentation_binding_entity_mining_stage3.tres" % ROOT)
	var furnace_profile := _presentation_profile(
		"state.machine.furnace.foundation", "Furnace Runtime",
		"anchor.presentation.center")
	furnace_profile.stable_id = "presentation.profile.machine.furnace.stage3"
	furnace_profile.channels = PackedStringArray(["persistent_state"])
	_save(furnace_profile, "%s/presentation_profile_machine_furnace_stage3.tres" % ROOT)
	var furnace_binding := _presentation_binding(
		"", furnace_profile.stable_id, "anchor.presentation.center",
		"block.machine.furnace", "Furnace State Binding")
	furnace_binding.stable_id = "presentation.binding.machine.furnace.stage3"
	furnace_binding.event_contract_id = ""
	furnace_binding.state_contract_id = "state.machine.furnace.foundation"
	furnace_binding.channel = "persistent_state"
	furnace_binding.dependency_ids = PackedStringArray([
		"state.machine.furnace.foundation", furnace_profile.stable_id,
		"anchor.presentation.center"])
	_save(furnace_binding, "%s/presentation_binding_machine_furnace_stage3.tres" % ROOT)


func _presentation_profile(
		contract_id: String, display_name: String,
		spatial_role_id: String) -> ForgePresentationProfile:
	var profile := ForgePresentationProfile.new()
	profile.stable_id = "presentation.profile.%s.stage3" % ForgeId.safe_filename(
		contract_id.trim_prefix("event.").trim_prefix("state."))
	profile.display_name = "%s Stage 3 Profile" % display_name
	profile.allowed_contract_ids = PackedStringArray([contract_id])
	profile.required_context_fields = PackedStringArray([
		"position", "target_material", "intensity"])
	profile.component_ids = {
		"audio": "sound.event.contact.mining.stone.foundation",
		"vfx": "vfx.effect.contact.mining.stone.foundation",
	}
	profile.spatial_role_ids = PackedStringArray([spatial_role_id])
	profile.channels = PackedStringArray(["temporary_event"])
	profile.budget_profile_id = "budget.profile.presentation.foundation"
	profile.accessibility_profile_id = "access.profile.presentation.foundation"
	profile.lifecycle = "golden_source_candidate"
	profile.source_status = "validated_runtime_source"
	profile.rights_status = "not_applicable"
	profile.dependency_ids = PackedStringArray([
		"sound.event.contact.mining.stone.foundation",
		"vfx.effect.contact.mining.stone.foundation",
		"budget.profile.presentation.foundation",
		"access.profile.presentation.foundation"])
	profile.fallback_ids = PackedStringArray(["legacy.runtime.fallback.presentation"])
	return profile


func _presentation_binding(
		event_id: String, profile_id: String, spatial_role_id: String,
		owner_id: String, display_name: String) -> ForgePresentationBinding:
	var binding := ForgePresentationBinding.new()
	binding.stable_id = "presentation.binding.%s.stage3" % ForgeId.safe_filename(
		event_id.trim_prefix("event."))
	binding.display_name = display_name
	binding.owner_id = owner_id
	binding.event_contract_id = event_id
	binding.profile_id = profile_id
	binding.spatial_role_id = spatial_role_id
	binding.parameter_mappings = [{"source": "intensity", "target": "intensity",
		"input_min": 0.0, "input_max": 1.0, "output_min": 0.0,
		"output_max": 1.0, "policy": "clamp", "quantisation_steps": 256}]
	binding.priority = 100
	binding.lifecycle = "golden_source_candidate"
	binding.source_status = "validated_runtime_source"
	binding.rights_status = "not_applicable"
	binding.dependency_ids = PackedStringArray([
		event_id, profile_id, spatial_role_id])
	return binding


func _standard_payload_fields() -> Dictionary:
	return {
		"position": {"type": "vector3", "required": true},
		"normal": {"type": "vector3", "required": true},
		"target_material": {"type": "string", "required": true},
		"intensity": {"type": "float", "required": true,
			"min": 0.0, "max": 1.0},
	}


func _generate_furnace_spatial_map() -> void:
	var spatial_map := ForgeSpatialMap.new()
	spatial_map.spatial_map_id = "spatial.map.machine.furnace.stage3"
	spatial_map.display_name = "Furnace Stage 3 Spatial Map"
	spatial_map.owner_asset_id = "block.machine.furnace"
	spatial_map.lifecycle = "golden_source_candidate"
	spatial_map.aliases = PackedStringArray(["spatial.map.legacy.furnace"])
	spatial_map.references = [_reference(
		spatial_map.owner_asset_id, "spatial.reference.machine.furnace.center.stage3",
		"anchor", "anchor.presentation.center", "", Vector3.ZERO, true)]
	spatial_map.required_role_ids = PackedStringArray(["anchor.presentation.center"])
	_save(spatial_map, "%s/spatial_map_machine_furnace_stage3.tres" % ROOT)


func _role_ids(rig: ForgeRigProfile) -> Array[String]:
	var result: Array[String] = []
	for binding in rig.role_bindings:
		result.append(binding.role_id)
	return result


func _lod_group(role_id: String) -> String:
	if role_id.ends_with(".core") or role_id.ends_with(".pelvis") \
			or role_id.ends_with(".torso"):
		return "core"
	if role_id.ends_with(".head"):
		return "head"
	if ".leg." in role_id or ".arm." in role_id or ".foot." in role_id:
		return "limb"
	return "secondary"


func _motion_profiles(rig: ForgeRigProfile) -> Dictionary:
	var walk_swings := {}
	for binding in rig.role_bindings:
		if ".leg." in binding.role_id or ".arm." in binding.role_id:
			walk_swings[binding.role_id] = {"axis": "x",
				"amplitude_degrees": 24.0,
				"phase": PI if ".left" in binding.role_id else 0.0}
	return {"idle": {"frequency_hz": 0.5, "root_bob_meters": 0.004,
		"role_swings": {}}, "walk": {"frequency_hz": 1.7,
		"root_bob_meters": 0.012, "role_swings": walk_swings},
		"mine": {"frequency_hz": 1.0, "root_bob_meters": 0.0,
			"role_swings": {}}, "telegraph": {"frequency_hz": 1.0,
			"root_bob_meters": 0.01, "role_swings": {}}}


func _save(resource: Resource, path: String) -> void:
	var error := ResourceSaver.save(resource, path)
	if error == OK:
		_saved += 1
	else:
		_failures.append("Failed to save %s: %s" % [path, error_string(error)])
