@tool
extends SceneTree
## Generates candidate giant-centipede, bird and dragon-scale runtime proofs.

const ROOT := "res://content/forge/runtime/set22_23_stage6"
const MATERIAL := "material.dna.entity.hide_leather"
const DENSITY := "density.profile.entity.standard"

var _saved := 0
var _failures: Array[String] = []


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(ROOT))
	_generate_centipede()
	_generate_bird()
	_generate_dragon()
	print("SET22_STAGE6_ADVANCED_BODY_GENERATOR %s" % JSON.stringify({
		"ok": _failures.is_empty(), "saved": _saved,
		"entity_count": 3, "failures": _failures}))
	quit(0 if _failures.is_empty() else 1)


func _generate_centipede() -> void:
	var specs: Array[Dictionary] = [
		{"key": "core", "role": "anatomy.role.centipede.core", "parent": "",
			"size": Vector3i(10, 6, 12), "position": Vector3.ZERO},
		{"key": "head", "role": "anatomy.role.centipede.head", "parent": "core",
			"size": Vector3i(9, 6, 8), "position": Vector3(0, 0, -0.30)},
	]
	var parent := "core"
	for index in range(1, 7):
		var key := "segment_%03d" % index
		specs.append({"key": key,
			"role": "anatomy.role.centipede.segment.%03d" % index,
			"parent": parent, "size": Vector3i(9, 6, 10),
			"position": Vector3(0, 0, 0.28)})
		parent = key
	specs.append({"key": "tail", "role": "anatomy.role.centipede.tail",
		"parent": parent, "size": Vector3i(7, 4, 8),
		"position": Vector3(0, 0, 0.25)})
	_generate_body("centipede_giant", "Giant Centipede Technical Candidate",
		"segmented_crawler", "entity_role.centipede", Vector3(0.9, 0.45, 2.4),
		specs, ["travel_wave", "burrow"],
		"legacy.procedural_visual.centipede")


func _generate_bird() -> void:
	var specs: Array[Dictionary] = [
		{"key": "core", "role": "anatomy.role.avian.core", "parent": "",
			"size": Vector3i(8, 8, 10), "position": Vector3.ZERO},
		{"key": "head", "role": "anatomy.role.avian.head", "parent": "core",
			"size": Vector3i(6, 6, 6), "position": Vector3(0, 0.12, -0.25)},
		{"key": "beak", "role": "anatomy.role.avian.beak", "parent": "head",
			"size": Vector3i(3, 2, 4), "position": Vector3(0, 0, -0.15)},
		{"key": "wing_left", "role": "anatomy.role.avian.wing.left", "parent": "core",
			"size": Vector3i(12, 2, 8), "position": Vector3(-0.28, 0.03, 0), "side": "left"},
		{"key": "wing_right", "role": "anatomy.role.avian.wing.right", "parent": "core",
			"size": Vector3i(12, 2, 8), "position": Vector3(0.28, 0.03, 0), "side": "right"},
		{"key": "leg_left", "role": "anatomy.role.avian.leg.left", "parent": "core",
			"size": Vector3i(2, 6, 2), "position": Vector3(-0.08, -0.22, 0), "side": "left"},
		{"key": "leg_right", "role": "anatomy.role.avian.leg.right", "parent": "core",
			"size": Vector3i(2, 6, 2), "position": Vector3(0.08, -0.22, 0), "side": "right"},
		{"key": "tail", "role": "anatomy.role.avian.tail", "parent": "core",
			"size": Vector3i(7, 2, 8), "position": Vector3(0, 0, 0.28)},
	]
	_generate_body("bird_small", "Small Bird Technical Candidate", "avian",
		"entity_role.bird", Vector3(0.7, 0.35, 0.55), specs,
		["take_off", "flight", "glide", "landing", "perch"],
		"legacy.procedural_visual.bird")


func _generate_dragon() -> void:
	var specs: Array[Dictionary] = [
		{"key": "torso", "role": "anatomy.role.dragon.torso", "parent": "",
			"size": Vector3i(16, 12, 20), "position": Vector3.ZERO},
		{"key": "neck_01", "role": "anatomy.role.dragon.neck.01", "parent": "torso",
			"size": Vector3i(9, 9, 11), "position": Vector3(0, 0.12, -0.48)},
		{"key": "neck_02", "role": "anatomy.role.dragon.neck.02", "parent": "neck_01",
			"size": Vector3i(8, 8, 10), "position": Vector3(0, 0.08, -0.32)},
		{"key": "head", "role": "anatomy.role.dragon.head", "parent": "neck_02",
			"size": Vector3i(11, 9, 13), "position": Vector3(0, 0.02, -0.35)},
		{"key": "wing_left", "role": "anatomy.role.dragon.wing.left", "parent": "torso",
			"size": Vector3i(24, 3, 18), "position": Vector3(-0.62, 0.18, 0), "side": "left"},
		{"key": "wing_right", "role": "anatomy.role.dragon.wing.right", "parent": "torso",
			"size": Vector3i(24, 3, 18), "position": Vector3(0.62, 0.18, 0), "side": "right"},
		{"key": "leg_front_left", "role": "anatomy.role.dragon.leg.front_left", "parent": "torso",
			"size": Vector3i(5, 14, 5), "position": Vector3(-0.32, -0.40, -0.28), "side": "left"},
		{"key": "leg_front_right", "role": "anatomy.role.dragon.leg.front_right", "parent": "torso",
			"size": Vector3i(5, 14, 5), "position": Vector3(0.32, -0.40, -0.28), "side": "right"},
		{"key": "leg_rear_left", "role": "anatomy.role.dragon.leg.rear_left", "parent": "torso",
			"size": Vector3i(6, 15, 6), "position": Vector3(-0.36, -0.42, 0.34), "side": "left"},
		{"key": "leg_rear_right", "role": "anatomy.role.dragon.leg.rear_right", "parent": "torso",
			"size": Vector3i(6, 15, 6), "position": Vector3(0.36, -0.42, 0.34), "side": "right"},
		{"key": "tail_01", "role": "anatomy.role.dragon.tail.01", "parent": "torso",
			"size": Vector3i(10, 8, 16), "position": Vector3(0, 0, 0.52)},
		{"key": "tail_02", "role": "anatomy.role.dragon.tail.02", "parent": "tail_01",
			"size": Vector3i(7, 6, 16), "position": Vector3(0, 0, 0.42)},
	]
	_generate_body("dragon_scale_test", "Dragon Scale Technical Candidate", "dragon",
		"entity_role.dragon", Vector3(8.0, 4.5, 10.0), specs,
		["ground_heavy", "take_off", "flight", "breath_charge", "landing"],
		"legacy.procedural_visual.dragon_test")


func _generate_body(
		key: String, display_name: String, family: String, entity_role: String,
		dimensions: Vector3, specs: Array[Dictionary], extra_actions: Array,
		legacy_fallback: String) -> void:
	var entity := ForgeEntityDefinition.new()
	entity.entity_definition_id = "entity.definition.creature.%s" % key
	entity.display_name = display_name
	entity.body_family = family
	entity.entity_role_ids = PackedStringArray([entity_role])
	entity.material_dna_ids = PackedStringArray([MATERIAL])
	entity.world_dimensions_meters = dimensions
	entity.gameplay_definition_ids = PackedStringArray(["entity.%s" % key])
	entity.template_id = "template.entity.%s" % key
	entity.source_status = "golden_source_candidate"
	entity.lifecycle = "runtime_candidate"
	entity.visual_approval = "open"
	entity.legacy_fallback = legacy_fallback
	var plan := ForgeBodyPlanDefinition.new()
	plan.body_plan_id = "entity.body_plan.%s" % key
	plan.display_name = "%s Body Plan" % display_name
	plan.family = family
	plan.world_dimensions_meters = dimensions
	plan.required_entity_roles = entity.entity_role_ids
	plan.lifecycle = "runtime_candidate"
	plan.dependency_ids = PackedStringArray([DENSITY])
	var parts_by_key := {}
	for spec in specs:
		var parent_key := str(spec.get("parent", ""))
		var parent_id := str(parts_by_key.get(parent_key, ""))
		var part := _part(key, str(spec.key), str(spec.role), parent_id,
			spec.size, spec.position, str(spec.get("side", "centre")))
		parts_by_key[spec.key] = part.body_part_id
		plan.body_parts.append(part)
		if parent_key.is_empty():
			plan.root_part_id = part.body_part_id
	plan.contact_sets = [{"contact_set_id": "locomotion",
		"role_ids": _contact_roles(key)}]
	plan.extension_points = PackedStringArray([
		"repeat_segments" if family == "segmented_crawler" else "wing_variants"])
	entity.body_plan = plan
	entity.dependency_ids = PackedStringArray([plan.body_plan_id, DENSITY])
	for part in plan.body_parts:
		_save(part, "%s/body_part_%s.tres" % [ROOT,
			ForgeId.safe_filename(part.body_part_id)])
	_save(plan, "%s/body_plan_%s.tres" % [ROOT, key])
	_save(entity, "%s/entity_definition_%s.tres" % [ROOT, key])
	var rig := _rig(entity, key, extra_actions)
	var spatial_map := _spatial_map(entity, rig, key)
	rig.spatial_map_id = spatial_map.spatial_map_id
	_save(rig, "%s/rig_profile_%s.tres" % [ROOT, key])
	_save(spatial_map, "%s/spatial_map_%s.tres" % [ROOT, key])
	_save(_assembly(entity, rig, spatial_map, key),
		"%s/entity_assembly_profile_%s.tres" % [ROOT, key])
	_save(_animation_library(rig, key, extra_actions),
		"%s/animation_library_%s.tres" % [ROOT, key])


func _part(
		family: String, key: String, role_id: String, parent_id: String,
		dimensions: Vector3i, position: Vector3, side: String) -> ForgeBodyPartDefinition:
	var part := ForgeBodyPartDefinition.new()
	part.body_part_id = "entity.body_part.%s.%s" % [family, key]
	part.display_name = key.capitalize()
	part.parent_part_id = parent_id
	part.anatomy_role_id = role_id
	part.voxel_source = _filled_volume(dimensions)
	part.material_dna_id = MATERIAL
	part.local_position_meters = position
	part.side_token = side
	part.rig_role = role_id
	part.planning_status = "golden_source_candidate"
	part.lifecycle = "runtime_candidate"
	part.dependency_ids = PackedStringArray([DENSITY, MATERIAL])
	return part


func _filled_volume(dimensions: Vector3i) -> ForgeVoxelVolume:
	var volume := ForgeVoxelVolume.new()
	volume.dimensions = dimensions
	volume.density_profile = DENSITY
	volume.voxel_size_meters = 0.03125
	volume.ensure_storage()
	for index in volume.cells.size():
		volume.cells[index] = 1
	return volume


func _rig(
		entity: ForgeEntityDefinition, key: String,
		extra_actions: Array) -> ForgeRigProfile:
	var rig := ForgeRigProfile.new()
	rig.rig_profile_id = "entity.rig.profile.%s" % key
	rig.display_name = "%s Semantic Rig" % entity.display_name
	rig.entity_definition_id = entity.entity_definition_id
	rig.body_plan_id = entity.body_plan.body_plan_id
	rig.lifecycle = "runtime_candidate"
	rig.source_status = "golden_source_candidate"
	rig.aliases = PackedStringArray(["entity.rig.template.%s" % key])
	rig.legacy_fallback = entity.legacy_fallback
	var role_by_part := {}
	for part in entity.body_plan.body_parts:
		role_by_part[part.body_part_id] = part.anatomy_role_id
	for part in entity.body_plan.body_parts:
		var binding := ForgeRigRoleBinding.new()
		binding.role_id = part.anatomy_role_id
		binding.body_part_id = part.body_part_id
		binding.parent_role_id = str(role_by_part.get(part.parent_part_id, ""))
		binding.binding_mode = "rigid_part"
		binding.lod_group = "core" if part.body_part_id == entity.body_plan.root_part_id \
			else "appendage"
		if part.body_part_id == entity.body_plan.root_part_id:
			rig.root_role_id = binding.role_id
		else:
			binding.joint_id = "%s.joint.%s" % [rig.rig_profile_id,
				ForgeId.safe_filename(binding.role_id)]
			var joint := ForgeRigJointDefinition.new()
			joint.joint_id = binding.joint_id
			joint.parent_role_id = binding.parent_role_id
			joint.child_role_id = binding.role_id
			joint.joint_type = "chain" if ".segment." in binding.role_id \
				or ".neck." in binding.role_id or ".tail." in binding.role_id \
				else "hinge" if ".wing." in binding.role_id or ".leg." in binding.role_id \
				else "ball"
			joint.rest_position_meters = part.local_position_meters
			joint.minimum_angles_degrees = Vector3(-35, -30, -30)
			joint.maximum_angles_degrees = Vector3(35, 30, 30)
			joint.procedural_hook = "travel_wave" if entity.body_family == "segmented_crawler" \
				else "flight_control" if entity.body_family in ["avian", "dragon"] \
				else ""
			joint.lifecycle = "runtime_candidate"
			rig.joints.append(joint)
		rig.role_bindings.append(binding)
	var role_ids := PackedStringArray()
	for binding in rig.role_bindings:
		role_ids.append(binding.role_id)
	rig.rig_lod_levels = [{"lod": 0, "solver_policy": "full_semantic",
		"active_role_ids": role_ids},
		{"lod": 1, "solver_policy": "reduced_chains", "active_role_ids": role_ids},
		{"lod": 2, "solver_policy": "rigid_core",
			"active_role_ids": PackedStringArray([rig.root_role_id])}]
	rig.motion_profiles = {"idle": {"speed": 0.0, "amplitude": 0.02},
		"walk": {"speed": 1.0, "amplitude": 0.12}}
	for action in extra_actions:
		rig.motion_profiles[str(action)] = {"speed": 1.0,
			"amplitude": 0.18, "candidate": true}
	rig.dependency_ids = PackedStringArray([
		entity.entity_definition_id, entity.body_plan.body_plan_id])
	return rig


func _spatial_map(
		entity: ForgeEntityDefinition, rig: ForgeRigProfile,
		key: String) -> ForgeSpatialMap:
	var spatial_map := ForgeSpatialMap.new()
	spatial_map.spatial_map_id = "spatial.map.entity.%s" % key
	spatial_map.display_name = "%s Spatial Map" % entity.display_name
	spatial_map.owner_asset_id = entity.entity_definition_id
	spatial_map.lifecycle = "runtime_candidate"
	spatial_map.source_status = "golden_source_candidate"
	spatial_map.aliases = PackedStringArray(["spatial.map.template.%s" % key])
	spatial_map.supported_variant_ids = PackedStringArray(["base", "damaged"])
	spatial_map.supported_lod_levels = [0, 1, 2]
	var center := _reference(entity.entity_definition_id,
		"spatial.reference.entity.%s.center" % key, "anchor",
		"anchor.presentation.center", Vector3.ZERO, "", true)
	spatial_map.references.append(center)
	var head_role := _head_role(key)
	var specs := [
		["voice", "socket", "socket.audio.voice", Vector3.ZERO, head_role],
		["mouth", "socket", "socket.presentation.mouth", Vector3(0, 0, -0.2), head_role],
		["damage", "socket", "socket.presentation.damage", Vector3.ZERO, rig.root_role_id],
		["breath", "socket", "socket.vfx.breath_origin", Vector3(0, 0, -0.25), head_role],
		["contact", "runtime_anchor", "runtime_anchor.movement.foot_contact",
			Vector3.ZERO, rig.root_role_id],
	]
	for spec in specs:
		var reference := _reference(entity.entity_definition_id,
			"spatial.reference.entity.%s.%s" % [key, spec[0]],
			spec[1], spec[2], spec[3], center.stable_id, true)
		reference.extension_fields["parent_role_id"] = spec[4]
		reference.lod_mappings = [{"lod": 1, "quality": "equivalent"},
			{"lod": 2, "quality": "approximate", "reference_id": center.stable_id}]
		spatial_map.references.append(reference)
		spatial_map.required_role_ids.append(spec[2])
	spatial_map.required_role_ids.append("anchor.presentation.center")
	spatial_map.alias_mappings = {
		"presentation.spatial.entity.%s.voice" % key: "socket.audio.voice",
		"presentation.spatial.entity.%s.contact" % key:
			"runtime_anchor.movement.foot_contact"}
	spatial_map.dependency_ids = PackedStringArray([
		entity.entity_definition_id, rig.rig_profile_id])
	spatial_map.legacy_fallback = entity.legacy_fallback
	return spatial_map


func _reference(
		owner_id: String, stable_id: String, spatial_type: String,
		role_id: String, position: Vector3, fallback_id: String,
		required: bool) -> ForgeSpatialReference:
	var reference := ForgeSpatialReference.new()
	reference.stable_id = stable_id
	reference.display_name = role_id
	reference.owner_asset_id = owner_id
	reference.spatial_type = spatial_type
	reference.semantic_role_id = role_id
	reference.mapping_mode = "runtime_event_bound" \
		if spatial_type == "runtime_anchor" else "bone_bound"
	reference.local_position = position
	reference.required_status = "required" if required else "optional"
	reference.fallback_reference_id = fallback_id
	reference.lifecycle = "golden_source_candidate"
	reference.source_status = "golden_source_candidate"
	reference.rights_status = "not_applicable"
	reference.extension_fields = {"follow_mode": "live_role",
		"base_mapping_quality": "exact"}
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
	assembly.lifecycle = "runtime_candidate"
	assembly.source_status = "golden_source_candidate"
	assembly.dependency_ids = PackedStringArray([
		entity.entity_definition_id, rig.rig_profile_id, spatial_map.spatial_map_id])
	assembly.aliases = PackedStringArray([
		"entity.assembly_profile.template.%s" % key])
	assembly.legacy_fallback = entity.legacy_fallback
	return assembly


func _animation_library(
		rig: ForgeRigProfile, key: String,
		extra_actions: Array) -> ForgeEntityAnimationLibrary:
	var library := ForgeEntityAnimationLibrary.new()
	library.animation_library_id = "entity.animation_set.%s.stage6" % key
	library.display_name = "%s Candidate Animation Library" % key.capitalize()
	library.rig_profile_id = rig.rig_profile_id
	library.rig_family = key
	library.lifecycle = "runtime_candidate"
	library.source_status = "golden_source_candidate"
	library.aliases = PackedStringArray([
		"entity.animation_set.template.%s" % key])
	library.legacy_fallback = "legacy.animation.%s" % key
	var actions: Array = ["idle", "walk"] + extra_actions
	for action_value in actions:
		var action := str(action_value)
		var clip := ForgeEntityAnimationClip.new()
		clip.clip_id = "clip.entity.%s.%s.stage6" % [key, action]
		clip.display_name = "%s %s" % [key.capitalize(), action.capitalize()]
		clip.semantic_action = action
		clip.duration_seconds = 1.0 if action == "idle" else 1.4
		clip.looping = action not in ["take_off", "landing", "breath_charge"]
		var amplitude := 3.0 if action in ["walk", "travel_wave", "ground_heavy"] \
			else 12.0 if action in ["flight", "take_off"] else 1.0
		clip.role_tracks = [{"role_id": rig.root_role_id,
			"keys": [{"time": 0.0, "rotation_degrees": Vector3.ZERO},
				{"time": 0.5, "rotation_degrees": Vector3(0, amplitude, 0)},
				{"time": 1.0, "rotation_degrees": Vector3.ZERO}]}]
		if action in ["walk", "travel_wave", "ground_heavy", "landing"]:
			var marker := ForgeAnimationEventMarker.new()
			marker.marker_id = "marker.%s.%s.contact" % [key, action]
			marker.event_contract_id = "event.movement.foot_contact"
			marker.normalized_time = 0.5
			marker.spatial_role_id = "runtime_anchor.movement.foot_contact"
			marker.contact_kind = "locomotion"
			clip.event_markers.append(marker)
		clip.lifecycle = "runtime_candidate"
		library.clips.append(clip)
	library.animation_lod_levels = [{"lod": 0, "sampling": "full"},
		{"lod": 1, "sampling": "reduced"},
		{"lod": 2, "sampling": "key_events_only"}]
	library.dependency_ids = PackedStringArray([rig.rig_profile_id])
	return library


func _contact_roles(key: String) -> Array[String]:
	if key == "bird_small":
		return ["anatomy.role.avian.leg.left", "anatomy.role.avian.leg.right"]
	if key == "dragon_scale_test":
		return ["anatomy.role.dragon.leg.front_left",
			"anatomy.role.dragon.leg.front_right",
			"anatomy.role.dragon.leg.rear_left",
			"anatomy.role.dragon.leg.rear_right"]
	return ["anatomy.role.centipede.segment.001",
		"anatomy.role.centipede.segment.006"]


func _head_role(key: String) -> String:
	if key == "bird_small":
		return "anatomy.role.avian.head"
	if key == "dragon_scale_test":
		return "anatomy.role.dragon.head"
	return "anatomy.role.centipede.head"


func _save(resource: Resource, path: String) -> void:
	var error := ResourceSaver.save(resource, path)
	if error == OK:
		_saved += 1
	else:
		_failures.append("%s=%s" % [path, error_string(error)])
