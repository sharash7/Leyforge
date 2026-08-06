@tool
extends SceneTree
## Generates reviewable golden rig, spatial-map and assembly source records.

const ROOT := "res://content/forge/runtime/set22_23"
const HUMANOID_PATH := (
	"res://content/forge/entities/entity_definition_template_humanoid_standard.tres")
const PIG_PATH := (
	"res://content/forge/entities/entity_definition_template_pig_quadruped.tres")

var _saved := 0
var _failures: Array[String] = []


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(ROOT))
	_generate_entity_runtime(HUMANOID_PATH, "humanoid_standard")
	_generate_entity_runtime(PIG_PATH, "pig_quadruped")
	print("SET22_STAGE2_SPATIAL_SOURCE_GENERATOR %s" % JSON.stringify({
		"ok": _failures.is_empty(),
		"saved": _saved,
		"failures": _failures,
	}))
	quit(0 if _failures.is_empty() else 1)


func _generate_entity_runtime(path: String, key: String) -> void:
	var entity := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE) as ForgeEntityDefinition
	if entity == null or entity.body_plan == null:
		_failures.append("Entity source did not load: %s" % path)
		return
	var rig := _rig_profile(entity, key)
	var spatial_map := _spatial_map(entity, rig, key)
	rig.spatial_map_id = spatial_map.spatial_map_id
	rig.dependency_ids = PackedStringArray([
		entity.entity_definition_id, entity.body_plan.body_plan_id,
	])
	var assembly := ForgeEntityAssemblyProfile.new()
	assembly.assembly_profile_id = "entity.assembly_profile.%s" % key
	assembly.display_name = "%s Runtime Assembly" % entity.display_name
	assembly.entity_definition_id = entity.entity_definition_id
	assembly.rig_profile_id = rig.rig_profile_id
	assembly.spatial_map_id = spatial_map.spatial_map_id
	assembly.default_variant_id = "base"
	assembly.default_lod_level = 0
	assembly.lifecycle = "golden_source_candidate"
	assembly.dependency_ids = PackedStringArray([
		entity.entity_definition_id, rig.rig_profile_id,
		spatial_map.spatial_map_id,
	])
	assembly.aliases = PackedStringArray([
		"entity.assembly_profile.template.%s" % key,
	])
	_save(rig, "%s/rig_profile_%s.tres" % [ROOT, key])
	_save(spatial_map, "%s/spatial_map_%s.tres" % [ROOT, key])
	_save(assembly, "%s/entity_assembly_profile_%s.tres" % [ROOT, key])


func _rig_profile(
		entity: ForgeEntityDefinition, key: String) -> ForgeRigProfile:
	var rig := ForgeRigProfile.new()
	rig.rig_profile_id = "entity.rig.profile.%s" % key
	rig.display_name = "%s Semantic Rigid Rig" % entity.display_name
	rig.entity_definition_id = entity.entity_definition_id
	rig.body_plan_id = entity.body_plan.body_plan_id
	rig.lifecycle = "golden_source_candidate"
	rig.aliases = PackedStringArray(["entity.rig.template.%s" % key])
	var bindings: Array[ForgeRigRoleBinding] = []
	var joints: Array[ForgeRigJointDefinition] = []
	var role_by_part := {}
	for part in entity.body_plan.body_parts:
		if part != null:
			role_by_part[part.body_part_id] = part.anatomy_role_id
	for part in entity.body_plan.body_parts:
		if part == null:
			continue
		var binding := ForgeRigRoleBinding.new()
		binding.role_id = part.anatomy_role_id
		binding.body_part_id = part.body_part_id
		binding.parent_role_id = str(role_by_part.get(part.parent_part_id, ""))
		binding.binding_mode = "rigid_part"
		binding.mirror_role_id = _mirror_role(part.anatomy_role_id)
		binding.lod_group = _lod_group(part.anatomy_role_id)
		if part.body_part_id == entity.body_plan.root_part_id:
			rig.root_role_id = part.anatomy_role_id
		else:
			binding.joint_id = "%s.joint.%s" % [
				rig.rig_profile_id,
				ForgeId.safe_filename(part.anatomy_role_id),
			]
			var joint := ForgeRigJointDefinition.new()
			joint.joint_id = binding.joint_id
			joint.parent_role_id = binding.parent_role_id
			joint.child_role_id = binding.role_id
			joint.joint_type = _joint_type(binding.role_id)
			joint.primary_axis = Vector3.RIGHT
			joint.rest_position_meters = part.local_position_meters
			joint.rest_rotation_degrees = part.local_rotation_degrees
			joint.minimum_angles_degrees = _joint_minimum(binding.role_id)
			joint.maximum_angles_degrees = -joint.minimum_angles_degrees
			joint.procedural_hook = _procedural_hook(binding.role_id)
			joint.lifecycle = "golden_source_candidate"
			joints.append(joint)
		bindings.append(binding)
	rig.role_bindings = bindings
	rig.joints = joints
	var all_roles: Array[String] = []
	var core_roles: Array[String] = []
	var reduced_roles: Array[String] = []
	for binding in bindings:
		all_roles.append(binding.role_id)
		if binding.lod_group in ["core", "head"]:
			core_roles.append(binding.role_id)
		if binding.role_id == rig.root_role_id \
				or binding.lod_group in ["core", "head"]:
			reduced_roles.append(binding.role_id)
	rig.rig_lod_levels = [
		{"lod": 0, "active_role_ids": all_roles,
			"solver_policy": "full_semantic", "update_divisor": 1},
		{"lod": 1, "active_role_ids": all_roles,
			"solver_policy": "reduced_contacts", "update_divisor": 2},
		{"lod": 2, "active_role_ids": reduced_roles,
			"solver_policy": "core_rigid_parts", "update_divisor": 4,
			"fallback_role_mappings": _lod_fallbacks(bindings, reduced_roles)},
	]
	rig.motion_profiles = _motion_profiles(key, bindings)
	return rig


func _spatial_map(
		entity: ForgeEntityDefinition, rig: ForgeRigProfile,
		key: String) -> ForgeSpatialMap:
	var spatial_map := ForgeSpatialMap.new()
	spatial_map.spatial_map_id = "spatial.map.entity.%s" % key
	spatial_map.display_name = "%s Semantic Spatial Map" % entity.display_name
	spatial_map.owner_asset_id = entity.entity_definition_id
	spatial_map.lifecycle = "golden_source_candidate"
	spatial_map.aliases = PackedStringArray([
		"spatial.map.template.%s" % key,
	])
	spatial_map.supported_variant_ids = PackedStringArray(["base", "damaged"])
	spatial_map.supported_lod_levels = [0, 1, 2]
	var center_id := "spatial.reference.entity.%s.center" % key
	var center_parent := rig.root_role_id
	var references: Array[ForgeSpatialReference] = []
	references.append(_reference(
		entity.entity_definition_id, center_id, "anchor",
		"anchor.presentation.center", center_parent, Vector3.ZERO, true))
	var specs := _spatial_specs(key)
	for spec in specs:
		var stable_id := "spatial.reference.entity.%s.%s" % [key, spec[0]]
		var reference := _reference(
			entity.entity_definition_id, stable_id, spec[1], spec[2], spec[3],
			spec[4], bool(spec[5]), center_id)
		reference.lod_mappings = [
			{"lod": 1, "quality": "equivalent"},
			{"lod": 2, "quality": "approximate",
				"reference_id": center_id},
		]
		if spec[2] in ["socket.presentation.damage", "socket.vfx.breath_origin"]:
			reference.variant_mappings = [
				{"variant_id": "damaged", "quality": "fallback",
					"reference_id": center_id},
			]
		references.append(reference)
	spatial_map.references = references
	spatial_map.required_role_ids = PackedStringArray(
		_specs_required_roles(specs))
	spatial_map.alias_mappings = _spatial_aliases(key)
	spatial_map.mirror_mappings = _mirror_mappings(key)
	spatial_map.dependency_ids = PackedStringArray([
		entity.entity_definition_id, rig.rig_profile_id,
	])
	return spatial_map


func _reference(
		owner_id: String, stable_id: String, spatial_type: String,
		role_id: String, parent_role_id: String, local_position: Vector3,
		required: bool, fallback_id := "") -> ForgeSpatialReference:
	var reference := ForgeSpatialReference.new()
	reference.stable_id = stable_id
	reference.display_name = role_id
	reference.owner_asset_id = owner_id
	reference.spatial_type = spatial_type
	reference.semantic_role_id = role_id
	reference.mapping_mode = (
		"runtime_event_bound" if spatial_type == "runtime_anchor"
		else "bone_bound")
	reference.coordinate_space = "owner_local"
	reference.local_position = local_position
	reference.required_status = "required" if required else "optional"
	reference.approximation_policy = "declared_fallback_only"
	reference.fallback_reference_id = fallback_id
	reference.lifecycle = "foundation"
	reference.source_status = "validated_foundation_contract"
	reference.rights_status = "not_applicable"
	reference.extension_fields = {
		"parent_role_id": parent_role_id,
		"follow_mode": "live_role" if spatial_type != "runtime_anchor"
			else "event_snapshot",
		"base_mapping_quality": "exact",
	}
	return reference


func _spatial_specs(key: String) -> Array:
	if key == "humanoid_standard":
		return [
			["mouth", "socket", "socket.presentation.mouth",
				"anatomy.role.humanoid.head", Vector3(0, 0.08, -0.12), true],
			["voice", "socket", "socket.audio.voice",
				"anatomy.role.humanoid.head", Vector3(0, 0.1, -0.08), true],
			["hand_left", "socket", "socket.presentation.hand.left",
				"anatomy.role.humanoid.hand.left", Vector3.ZERO, true],
			["hand_right", "socket", "socket.presentation.hand.right",
				"anatomy.role.humanoid.hand.right", Vector3.ZERO, true],
			["foot_left", "socket", "socket.presentation.foot.left",
				"anatomy.role.humanoid.foot.left", Vector3(0, -0.08, 0), true],
			["foot_right", "socket", "socket.presentation.foot.right",
				"anatomy.role.humanoid.foot.right", Vector3(0, -0.08, 0), true],
			["equipment_primary", "socket", "socket.equipment.primary",
				"anatomy.role.humanoid.hand.right", Vector3.ZERO, true],
			["damage", "socket", "socket.presentation.damage",
				"anatomy.role.humanoid.torso", Vector3.ZERO, true],
			["breath", "socket", "socket.vfx.breath_origin",
				"anatomy.role.humanoid.head", Vector3(0, 0.06, -0.15), false],
			["contact", "runtime_anchor", "runtime_anchor.movement.foot_contact",
				"anatomy.role.humanoid.foot.left", Vector3.ZERO, true],
		]
	return [
		["mouth", "socket", "socket.presentation.mouth",
			"anatomy.role.quadruped.snout", Vector3(0, 0, -0.12), true],
		["voice", "socket", "socket.audio.voice",
			"anatomy.role.quadruped.head", Vector3(0, 0.05, -0.08), true],
		["foot_left", "socket", "socket.presentation.foot.left",
			"anatomy.role.quadruped.leg.front_left", Vector3(0, -0.12, 0), true],
		["foot_right", "socket", "socket.presentation.foot.right",
			"anatomy.role.quadruped.leg.front_right", Vector3(0, -0.12, 0), true],
		["equipment_primary", "socket", "socket.equipment.primary",
			"anatomy.role.quadruped.torso", Vector3(0, 0.2, 0), false],
		["damage", "socket", "socket.presentation.damage",
			"anatomy.role.quadruped.torso", Vector3.ZERO, true],
		["breath", "socket", "socket.vfx.breath_origin",
			"anatomy.role.quadruped.snout", Vector3(0, 0, -0.16), true],
		["contact", "runtime_anchor", "runtime_anchor.movement.foot_contact",
			"anatomy.role.quadruped.leg.front_left", Vector3.ZERO, true],
	]


func _specs_required_roles(specs: Array) -> Array[String]:
	var result: Array[String] = ["anchor.presentation.center"]
	for spec in specs:
		if bool(spec[5]):
			result.append(str(spec[2]))
	return result


func _spatial_aliases(key: String) -> Dictionary:
	var aliases := {
		"presentation.spatial.entity.%s.mouth" % key:
			"socket.presentation.mouth",
		"presentation.spatial.entity.%s.voice" % key:
			"socket.audio.voice",
		"presentation.spatial.entity.%s.contact" % key:
			"runtime_anchor.movement.foot_contact",
	}
	if key == "humanoid_standard":
		aliases["socket.hand.primary.0"] = "socket.presentation.hand.right"
	return aliases


func _mirror_mappings(key: String) -> Array[Dictionary]:
	if key != "humanoid_standard":
		return []
	return [{
		"target_role_id": "socket.presentation.hand.mirror_preview",
		"source_role_id": "socket.presentation.hand.left",
		"axis": "x",
		"orientation_flips": true,
	}]


func _mirror_role(role_id: String) -> String:
	if role_id.ends_with(".left"):
		return role_id.trim_suffix(".left") + ".right"
	if role_id.ends_with(".right"):
		return role_id.trim_suffix(".right") + ".left"
	if role_id.ends_with("_left"):
		return role_id.trim_suffix("_left") + "_right"
	if role_id.ends_with("_right"):
		return role_id.trim_suffix("_right") + "_left"
	return ""


func _lod_group(role_id: String) -> String:
	if role_id.ends_with(".pelvis") or role_id.ends_with(".torso"):
		return "core"
	if role_id.ends_with(".head") or role_id.ends_with(".snout"):
		return "head"
	if ".leg." in role_id or ".arm." in role_id \
			or ".hand." in role_id or ".foot." in role_id:
		return "limb"
	return "secondary"


func _joint_type(role_id: String) -> String:
	if ".leg." in role_id or ".arm." in role_id or ".foot." in role_id:
		return "hinge"
	if role_id.ends_with(".head") or role_id.ends_with(".tail") \
			or ".ear." in role_id:
		return "ball"
	return "fixed"


func _joint_minimum(role_id: String) -> Vector3:
	if ".leg." in role_id or ".arm." in role_id:
		return Vector3(-45, -15, -20)
	if role_id.ends_with(".head"):
		return Vector3(-25, -45, -20)
	if role_id.ends_with(".tail"):
		return Vector3(-30, -35, -35)
	return Vector3(-12, -12, -12)


func _procedural_hook(role_id: String) -> String:
	if ".foot." in role_id or ".leg." in role_id:
		return "contact_assist"
	if role_id.ends_with(".head"):
		return "look_assist"
	return ""


func _lod_fallbacks(
		bindings: Array[ForgeRigRoleBinding], active_roles: Array[String]) \
		-> Dictionary:
	var result := {}
	for binding in bindings:
		if binding.role_id in active_roles:
			continue
		var fallback := binding.parent_role_id
		while not fallback.is_empty() and fallback not in active_roles:
			var parent_binding: ForgeRigRoleBinding = null
			for candidate in bindings:
				if candidate.role_id == fallback:
					parent_binding = candidate
					break
			fallback = parent_binding.parent_role_id if parent_binding != null else ""
		if not fallback.is_empty():
			result[binding.role_id] = fallback
	return result


func _motion_profiles(
		key: String, bindings: Array[ForgeRigRoleBinding]) -> Dictionary:
	var idle_swings := {}
	var walk_swings := {}
	for binding in bindings:
		var role_id := binding.role_id
		if role_id.ends_with(".head"):
			idle_swings[role_id] = {
				"axis": "y", "amplitude_degrees": 1.5, "phase": 0.0}
		if ".arm." in role_id:
			walk_swings[role_id] = {
				"axis": "x", "amplitude_degrees": 28.0,
				"phase": PI if role_id.ends_with(".left") else 0.0}
		elif ".leg." in role_id:
			var left_or_rear := role_id.ends_with(".left") \
					or role_id.ends_with("front_left") \
					or role_id.ends_with("rear_right")
			walk_swings[role_id] = {
				"axis": "x",
				"amplitude_degrees": 30.0 if key == "humanoid_standard" else 20.0,
				"phase": PI if left_or_rear else 0.0}
	return {
		"idle": {"frequency_hz": 0.45, "root_bob_meters": 0.004,
			"role_swings": idle_swings},
		"walk": {"frequency_hz": 1.7, "root_bob_meters": 0.012,
			"role_swings": walk_swings},
	}


func _save(resource: Resource, path: String) -> void:
	var error := ResourceSaver.save(resource, path)
	if error == OK:
		_saved += 1
	else:
		_failures.append("Failed to save %s: %s" % [path, error_string(error)])
