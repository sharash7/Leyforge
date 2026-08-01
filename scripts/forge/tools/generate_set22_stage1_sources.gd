extends SceneTree
## Deterministically generates Set 22K/L Stage 1 golden editable sources.

const ENTITY_ROOT := "res://content/forge/entities"
const BLUEPRINT_ROOT := "res://content/forge/blueprints"
const MATERIAL_ROOT := "res://content/forge/materials/set22"
const ARTIFACT_ROOT := "res://.summer/verification/artifacts/set22_stage1"
const STANDARD_DENSITY := "density.profile.entity.standard"
const CONTRACT_VERSION := "22-stage1-v1"

var _failed := false


func _initialize() -> void:
	for path in [
		ENTITY_ROOT,
		ENTITY_ROOT.path_join("body_parts"),
		ENTITY_ROOT.path_join("body_plans"),
		ENTITY_ROOT.path_join("density_profiles"),
		BLUEPRINT_ROOT,
		MATERIAL_ROOT,
		ARTIFACT_ROOT,
	]:
		DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(path))
	var density_paths := _generate_density_profiles()
	var material_paths := _generate_material_families()
	var humanoid := _generate_humanoid()
	var pig := _generate_pig()
	var cottage := _generate_cottage()
	if not _failed:
		_write_artifacts(
			density_paths, material_paths, humanoid, pig, cottage)
	print("SET22_STAGE1_SOURCE_GENERATOR %s" % JSON.stringify({
		"ok": not _failed,
		"density_profiles": density_paths.size(),
		"material_families": material_paths.size(),
		"entity_templates": 2,
		"blueprint_templates": 1,
	}))
	quit(1 if _failed else 0)


func _generate_density_profiles() -> PackedStringArray:
	var definitions := [
		["coarse", "Coarse", 16, Vector3i(64, 64, 64),
			PackedStringArray(["colossal", "distant_prototype"])],
		["standard", "Standard", 32, Vector3i(64, 64, 64),
			PackedStringArray(["humanoid", "quadruped", "creature"])],
		["fine", "Fine", 64, Vector3i(48, 48, 48),
			PackedStringArray(["hero_detail", "small_feature"])],
		["colossal_modular", "Colossal Modular", 16,
			Vector3i(64, 64, 64), PackedStringArray(["dragon", "colossal"])],
		["micro_accent", "Micro Accent", 128,
			Vector3i(16, 16, 16), PackedStringArray(["accent"])],
	]
	var paths := PackedStringArray()
	for definition in definitions:
		var profile := ForgeDensityProfile.new()
		profile.density_profile_id = "density.profile.entity.%s" % definition[0]
		profile.display_name = str(definition[1])
		profile.voxels_per_meter = int(definition[2])
		profile.voxel_size_meters = 1.0 / float(profile.voxels_per_meter)
		profile.maximum_part_dimensions = definition[3]
		profile.intended_body_families = definition[4]
		profile.lifecycle = "foundation_validated"
		profile.contract_version = CONTRACT_VERSION
		var path := ENTITY_ROOT.path_join(
			"density_profiles/density_profile_entity_%s.tres" % definition[0])
		_save(profile, path)
		paths.append(path)
	paths.sort()
	return paths


func _generate_material_families() -> PackedStringArray:
	var definitions := [
		["skin_tones", "Skin Tones", "organic", ["#f1c7a5", "#b97b58", "#6d4030"]],
		["hair_fur", "Hair and Fur", "organic", ["#2c211b", "#765039", "#d8c29f"]],
		["feathers", "Feathers", "organic", ["#e5ddcb", "#71564b", "#26313a"]],
		["hide_leather", "Hide and Leather", "organic", ["#8b5a36", "#4d3125", "#bd8b55"]],
		["bone_horn", "Bone and Horn", "organic", ["#d9d0b8", "#9d8d71", "#51483e"]],
		["chitin_shell", "Chitin and Shell", "organic", ["#2f292c", "#674752", "#9a6b57"]],
		["scales", "Scales", "organic", ["#365f4c", "#6b8758", "#b0a563"]],
		["cloth", "Cloth", "fabric", ["#506b7b", "#9a4b45", "#d5c59e"]],
		["metal", "Iron Steel and Bronze", "metal", ["#687078", "#a7afb3", "#9b673e"]],
		["wood_living_wood", "Wood and Living Wood", "wood", ["#65452f", "#9b7045", "#4b683b"]],
		["stone_carved_stone", "Stone and Carved Stone", "stone", ["#6e7370", "#9a9687", "#474e50"]],
		["mana_crystal_emission", "Mana Crystal and Magical Emission", "magic", ["#66d4ff", "#8c7bff", "#d18dff"]],
		["corruption_void", "Corruption and Void Influence", "magic", ["#261f35", "#5a2766", "#b13e81"]],
	]
	var paths := PackedStringArray()
	for definition in definitions:
		var material := ForgeMaterialDefinition.new()
		material.material_id = "material.dna.entity.%s" % definition[0]
		material.display_name = str(definition[1])
		material.family = str(definition[2])
		material.rendering_class = (
			"emissive" if definition[0] in [
				"mana_crystal_emission", "corruption_void"] else "opaque")
		material.roughness_default = (
			0.48 if definition[2] == "metal" else 0.78)
		material.metallic_default = 0.72 if definition[2] == "metal" else 0.0
		material.emission_default = (
			0.7 if material.rendering_class == "emissive" else 0.0)
		material.overlay_compatibility = PackedStringArray([
			"damage", "wet", "corruption", "warning"])
		material.applicable_domains = PackedStringArray(["entity"])
		material.swatch_hexes = PackedStringArray(definition[3])
		material.source_status = "validated_runtime_data"
		material.lifecycle = "foundation_validated"
		material.contract_version = CONTRACT_VERSION
		var path := MATERIAL_ROOT.path_join(
			"material_dna_entity_%s.tres" % definition[0])
		_save(material, path)
		paths.append(path)
	paths.sort()
	return paths


func _generate_humanoid() -> ForgeEntityDefinition:
	var plan := ForgeBodyPlanDefinition.new()
	plan.body_plan_id = "entity.body_plan.template.humanoid_standard"
	plan.display_name = "Golden Standard Humanoid Body Plan"
	plan.family = "humanoid"
	plan.density_profile_id = STANDARD_DENSITY
	plan.world_dimensions_meters = Vector3(0.72, 1.75, 0.5)
	plan.required_entity_roles = PackedStringArray([
		"entity_role.player", "entity_role.npc"])
	plan.symmetry_groups = [
		{"id": "symmetry.humanoid.arms", "part_suffixes": ["arm", "hand"]},
		{"id": "symmetry.humanoid.legs", "part_suffixes": ["leg", "foot"]},
	]
	plan.contact_sets = [{
		"id": "contact_set.ground_walk",
		"part_roles": [
			"anatomy.role.humanoid.foot.left",
			"anatomy.role.humanoid.foot.right"],
	}]
	plan.extension_points = PackedStringArray([
		"head_variants", "hair", "clothing_layers", "equipment", "extra_arms"])
	plan.template_locked = true
	plan.lifecycle = "golden_source_candidate"
	var prefix := "entity.body_part.template.humanoid_standard"
	var parts: Array[ForgeBodyPartDefinition] = []
	parts.append(_part(prefix, "pelvis", "Pelvis", "",
		"anatomy.role.humanoid.pelvis", Vector3i(10, 6, 6),
		Vector3(-0.15625, 0.78, -0.09375), "cloth", "rounded"))
	parts.append(_part(prefix, "torso", "Torso", "%s.pelvis" % prefix,
		"anatomy.role.humanoid.torso", Vector3i(12, 18, 6),
		Vector3(-0.03125, 0.1875, 0.0), "cloth", "rounded"))
	parts.append(_part(prefix, "head", "Head", "%s.torso" % prefix,
		"anatomy.role.humanoid.head", Vector3i(10, 8, 10),
		Vector3(0.03125, 0.5, -0.0625), "skin_tones", "ellipsoid"))
	parts.append(_part(prefix, "arm_left", "Left Arm", "%s.torso" % prefix,
		"anatomy.role.humanoid.arm.left", Vector3i(5, 18, 5),
		Vector3(-0.15625, 0.25, 0.015625), "skin_tones", "rounded", "left"))
	parts.append(_part(prefix, "arm_right", "Right Arm", "%s.torso" % prefix,
		"anatomy.role.humanoid.arm.right", Vector3i(5, 18, 5),
		Vector3(0.375, 0.25, 0.015625), "skin_tones", "rounded", "right"))
	parts.append(_part(prefix, "hand_left", "Left Hand", "%s.arm_left" % prefix,
		"anatomy.role.humanoid.hand.left", Vector3i(5, 5, 5),
		Vector3(0.0, -0.125, 0.0), "skin_tones", "ellipsoid", "left"))
	parts.append(_part(prefix, "hand_right", "Right Hand", "%s.arm_right" % prefix,
		"anatomy.role.humanoid.hand.right", Vector3i(5, 5, 5),
		Vector3(0.0, -0.125, 0.0), "skin_tones", "ellipsoid", "right"))
	parts.append(_part(prefix, "leg_left", "Left Leg", "%s.pelvis" % prefix,
		"anatomy.role.humanoid.leg.left", Vector3i(5, 18, 5),
		Vector3(0.0, -0.5625, 0.0), "cloth", "rounded", "left"))
	parts.append(_part(prefix, "leg_right", "Right Leg", "%s.pelvis" % prefix,
		"anatomy.role.humanoid.leg.right", Vector3i(5, 18, 5),
		Vector3(0.15625, -0.5625, 0.0), "cloth", "rounded", "right"))
	parts.append(_part(prefix, "foot_left", "Left Foot", "%s.leg_left" % prefix,
		"anatomy.role.humanoid.foot.left", Vector3i(5, 7, 9),
		Vector3(0.0, -0.1875, -0.125), "hide_leather", "rounded", "left"))
	parts.append(_part(prefix, "foot_right", "Right Foot", "%s.leg_right" % prefix,
		"anatomy.role.humanoid.foot.right", Vector3i(5, 7, 9),
		Vector3(0.0, -0.1875, -0.125), "hide_leather", "rounded", "right"))
	plan.body_parts = parts
	plan.root_part_id = "%s.pelvis" % prefix
	for part in parts:
		_save(part, ENTITY_ROOT.path_join(
			"body_parts/%s.tres" % ForgeId.safe_filename(part.body_part_id)))
	_save(plan, ENTITY_ROOT.path_join(
		"body_plans/body_plan_template_humanoid_standard.tres"))
	var entity := ForgeEntityDefinition.new()
	entity.entity_definition_id = "entity.definition.template.humanoid_standard"
	entity.display_name = "Golden Standard Humanoid"
	entity.body_family = "humanoid"
	entity.body_plan = plan
	entity.density_profile_id = STANDARD_DENSITY
	entity.material_dna_ids = PackedStringArray([
		"material.dna.entity.skin_tones", "material.dna.entity.hair_fur",
		"material.dna.entity.cloth", "material.dna.entity.hide_leather"])
	entity.entity_role_ids = PackedStringArray([
		"entity_role.player", "entity_role.npc"])
	entity.world_dimensions_meters = plan.world_dimensions_meters
	entity.extension_points = plan.extension_points
	entity.template_id = "template.entity.humanoid.standard"
	entity.template_locked = true
	entity.source_status = "validated_editable_source"
	entity.visual_approval = "open"
	entity.lifecycle = "golden_source_candidate"
	entity.contract_version = CONTRACT_VERSION
	_save(entity, ENTITY_ROOT.path_join(
		"entity_definition_template_humanoid_standard.tres"))
	return entity


func _generate_pig() -> ForgeEntityDefinition:
	var plan := ForgeBodyPlanDefinition.new()
	plan.body_plan_id = "entity.body_plan.template.pig_quadruped"
	plan.display_name = "Golden Pig Quadruped Body Plan"
	plan.family = "quadruped"
	plan.density_profile_id = STANDARD_DENSITY
	plan.world_dimensions_meters = Vector3(0.55, 0.8, 1.1)
	plan.required_entity_roles = PackedStringArray(["entity_role.pig"])
	plan.symmetry_groups = [
		{"id": "symmetry.pig.legs", "mode": "bilateral_pairs"},
		{"id": "symmetry.pig.ears", "mode": "bilateral"},
	]
	plan.contact_sets = [{
		"id": "contact_set.ground_walk",
		"part_roles": [
			"anatomy.role.quadruped.leg.front_left",
			"anatomy.role.quadruped.leg.front_right",
			"anatomy.role.quadruped.leg.rear_left",
			"anatomy.role.quadruped.leg.rear_right"],
	}]
	plan.extension_points = PackedStringArray([
		"breed_proportions", "ear_variants", "tusks", "saddle_socket"])
	plan.template_locked = true
	plan.lifecycle = "golden_source_candidate"
	var prefix := "entity.body_part.template.pig_quadruped"
	var parts: Array[ForgeBodyPartDefinition] = []
	parts.append(_part(prefix, "torso", "Torso", "",
		"anatomy.role.quadruped.torso", Vector3i(14, 12, 24),
		Vector3(-0.21875, 0.38, -0.375), "hide_leather", "ellipsoid"))
	parts.append(_part(prefix, "head", "Head", "%s.torso" % prefix,
		"anatomy.role.quadruped.head", Vector3i(11, 10, 11),
		Vector3(0.046875, 0.015625, -0.25), "hide_leather", "ellipsoid"))
	parts.append(_part(prefix, "snout", "Snout", "%s.head" % prefix,
		"anatomy.role.quadruped.snout", Vector3i(8, 6, 8),
		Vector3(0.046875, -0.015625, -0.15625), "skin_tones", "rounded"))
	parts.append(_part(prefix, "ear_left", "Left Ear", "%s.head" % prefix,
		"anatomy.role.quadruped.ear.left", Vector3i(4, 7, 3),
		Vector3(-0.03125, 0.25, 0.09375), "hide_leather", "ellipsoid", "left"))
	parts.append(_part(prefix, "ear_right", "Right Ear", "%s.head" % prefix,
		"anatomy.role.quadruped.ear.right", Vector3i(4, 7, 3),
		Vector3(0.21875, 0.25, 0.09375), "hide_leather", "ellipsoid", "right"))
	var leg_specs := [
		["leg_front_left", "Front Left Leg", "front_left", Vector3(-0.015625, -0.28125, -0.1875)],
		["leg_front_right", "Front Right Leg", "front_right", Vector3(0.296875, -0.28125, -0.1875)],
		["leg_rear_left", "Rear Left Leg", "rear_left", Vector3(-0.015625, -0.28125, 0.5)],
		["leg_rear_right", "Rear Right Leg", "rear_right", Vector3(0.296875, -0.28125, 0.5)],
	]
	for spec in leg_specs:
		parts.append(_part(prefix, spec[0], spec[1], "%s.torso" % prefix,
			"anatomy.role.quadruped.leg.%s" % spec[2], Vector3i(5, 10, 5),
			spec[3], "hide_leather", "rounded", spec[2]))
	parts.append(_part(prefix, "tail", "Tail", "%s.torso" % prefix,
		"anatomy.role.quadruped.tail", Vector3i(4, 4, 10),
		Vector3(0.140625, 0.1875, 0.6875), "hide_leather", "rounded"))
	plan.body_parts = parts
	plan.root_part_id = "%s.torso" % prefix
	for part in parts:
		_save(part, ENTITY_ROOT.path_join(
			"body_parts/%s.tres" % ForgeId.safe_filename(part.body_part_id)))
	_save(plan, ENTITY_ROOT.path_join(
		"body_plans/body_plan_template_pig_quadruped.tres"))
	var entity := ForgeEntityDefinition.new()
	entity.entity_definition_id = "entity.definition.template.pig_quadruped"
	entity.display_name = "Golden Pig Quadruped"
	entity.body_family = "quadruped"
	entity.body_plan = plan
	entity.density_profile_id = STANDARD_DENSITY
	entity.material_dna_ids = PackedStringArray([
		"material.dna.entity.hide_leather", "material.dna.entity.skin_tones"])
	entity.entity_role_ids = PackedStringArray(["entity_role.pig"])
	entity.world_dimensions_meters = plan.world_dimensions_meters
	entity.gameplay_definition_ids = PackedStringArray([
		"entity.definition.creature.pig"])
	entity.extension_points = plan.extension_points
	entity.template_id = "template.entity.quadruped.pig"
	entity.template_locked = true
	entity.source_status = "validated_editable_source"
	entity.visual_approval = "open"
	entity.lifecycle = "golden_source_candidate"
	entity.contract_version = CONTRACT_VERSION
	_save(entity, ENTITY_ROOT.path_join(
		"entity_definition_template_pig_quadruped.tres"))
	return entity


func _generate_cottage() -> ForgeBlueprintDefinition:
	var role_set := ForgeBlueprintMaterialRoleSet.new()
	role_set.material_role_set_id = "blueprint.material_role_set.forest_cottage_golden"
	role_set.display_name = "Forest Cottage Golden Material Roles"
	role_set.role_bindings = {
		"material_role.foundation_material": "material.mvp.stone",
		"material_role.wall_primary": "material.mvp.wood",
		"material_role.wall_secondary": "material.mvp.wood",
		"material_role.frame_material": "material.mvp.wood",
		"material_role.floor_material": "material.mvp.wood",
		"material_role.roof_material": "material.mvp.wood",
		"material_role.trim_material": "material.mvp.wood",
		"material_role.door_material": "material.mvp.wood",
		"material_role.window_material": "material.mvp.glass",
		"material_role.metal_fittings": "material.mvp.iron",
		"material_role.magic_accent": "material.mvp.mana",
	}
	role_set.required_role_ids = PackedStringArray(role_set.role_bindings.keys())
	role_set.required_role_ids.sort()
	role_set.culture_ids = PackedStringArray(["culture.forest_human"])
	role_set.biome_ids = PackedStringArray(["biome.temperate_forest"])
	role_set.lifecycle = "foundation_validated"
	role_set.dependency_ids = PackedStringArray([
		"material.mvp.stone", "material.mvp.wood", "material.mvp.glass",
		"material.mvp.iron", "material.mvp.mana"])
	_save(role_set, BLUEPRINT_ROOT.path_join(
		"material_role_set_forest_cottage_golden.tres"))
	var placement := ForgePlacementProfile.new()
	placement.placement_profile_id = (
		"blueprint.placement_profile.forest_cottage_golden")
	placement.allowed_zone_role_ids = PackedStringArray([
		"zone.role.placement", "zone.role.interior"])
	placement.required_socket_role_ids = PackedStringArray([
		"socket.role.road_access"])
	placement.footprint_min = Vector3i(-2, 0, -3)
	placement.footprint_max = Vector3i(2, 4, 2)
	placement.max_slope = 1
	placement.lifecycle = "foundation_validated"
	var blueprint := ForgeBlueprintDefinition.new()
	blueprint.blueprint_id = "blueprint.leyforge.residential.small_cottage_a"
	blueprint.display_name = "Golden Small Forest Cottage"
	blueprint.definition_ids = PackedStringArray([
		"building.residential.small_cottage"])
	blueprint.elements = [
		_element("block_group.foundation_main", "block_group",
			"material_role.foundation_material", Vector3i(-2, 0, -2), Vector3i(5, 1, 5), "foundation"),
		_element("block_group.floor_main", "block_group",
			"material_role.floor_material", Vector3i(-2, 1, -2), Vector3i(5, 1, 5), "shell"),
		_element("block_group.wall_front", "block_group",
			"material_role.wall_primary", Vector3i(-2, 1, -2), Vector3i(5, 2, 1), "shell"),
		_element("block_group.wall_back", "block_group",
			"material_role.wall_primary", Vector3i(-2, 1, 2), Vector3i(5, 2, 1), "shell"),
		_element("block_group.wall_left", "block_group",
			"material_role.wall_secondary", Vector3i(-2, 1, -1), Vector3i(1, 2, 3), "shell"),
		_element("block_group.wall_right", "block_group",
			"material_role.wall_secondary", Vector3i(2, 1, -1), Vector3i(1, 2, 3), "shell"),
		_element("block_group.frame", "block_group",
			"material_role.frame_material", Vector3i(-2, 1, -2), Vector3i(5, 3, 5), "frame"),
		_element("block_group.roof", "block_group",
			"material_role.roof_material", Vector3i(-2, 3, -2), Vector3i(5, 2, 5), "roof"),
		_element("asset.front_door", "asset",
			"material_role.door_material", Vector3i(0, 1, -2), Vector3i(1, 2, 1), "shell"),
		_element("asset.window_east", "asset",
			"material_role.window_material", Vector3i(2, 2, 0), Vector3i.ONE, "shell"),
		_marker("marker.entrance.primary", "marker.role.entrance", Vector3i(0, 1, -2)),
		_marker("marker.bed.01", "marker.role.household_bed", Vector3i(-1, 1, 1)),
		_marker("marker.bed.02", "marker.role.household_bed", Vector3i(0, 1, 1)),
		_marker("marker.storage.primary", "marker.role.household_storage", Vector3i(1, 1, 1)),
		_marker("marker.heat.primary", "marker.role.heat_light", Vector3i(1, 2, 1)),
		_marker("marker.road.primary", "marker.role.road_socket", Vector3i(0, 0, -3)),
	]
	blueprint.placement_profile = placement
	blueprint.material_role_set = role_set
	blueprint.capture_profile_id = "capture.profile.blueprint.current_state"
	blueprint.lifecycle = "golden_source_candidate"
	blueprint.template_id = "template.building.small_house"
	blueprint.template_locked = true
	blueprint.extension_points = PackedStringArray([
		"culture_palette", "room_module", "roof_variant", "hearth_variant"])
	blueprint.source_status = "validated_editable_source"
	blueprint.visual_approval = "open"
	blueprint.contract_version = CONTRACT_VERSION
	blueprint.dependency_ids = PackedStringArray([
		role_set.material_role_set_id, placement.placement_profile_id])
	blueprint.legacy_fallback = "bp.building.cottage_forest_small"
	_save(blueprint, BLUEPRINT_ROOT.path_join(
		"blueprint_golden_small_forest_cottage.tres"))
	return blueprint


func _part(
		prefix: String, suffix: String, display_name: String, parent_id: String,
		anatomy_role_id: String, dimensions: Vector3i, local_position: Vector3,
		material_suffix: String, shape: String, side := "centre") \
		-> ForgeBodyPartDefinition:
	var part := ForgeBodyPartDefinition.new()
	part.body_part_id = "%s.%s" % [prefix, suffix]
	part.display_name = display_name
	part.parent_part_id = parent_id
	part.anatomy_role_id = anatomy_role_id
	part.voxel_source = _volume(dimensions, shape)
	part.density_profile_id = STANDARD_DENSITY
	part.material_dna_id = "material.dna.entity.%s" % material_suffix
	part.local_position_meters = local_position
	part.side_token = side
	part.region_ids = PackedStringArray([
		"region.%s" % suffix.trim_suffix("_left").trim_suffix("_right")])
	part.lifecycle = "golden_source_candidate"
	part.dependency_ids = PackedStringArray([
		part.density_profile_id, part.material_dna_id])
	return part


func _volume(dimensions: Vector3i, shape: String) -> ForgeVoxelVolume:
	var volume := ForgeVoxelVolume.new()
	volume.dimensions = dimensions
	volume.density_profile = STANDARD_DENSITY
	volume.voxel_size_meters = 1.0 / 32.0
	volume.ensure_storage()
	for z in dimensions.z:
		for y in dimensions.y:
			for x in dimensions.x:
				var nx := (float(x) + 0.5) / float(dimensions.x) * 2.0 - 1.0
				var ny := (float(y) + 0.5) / float(dimensions.y) * 2.0 - 1.0
				var nz := (float(z) + 0.5) / float(dimensions.z) * 2.0 - 1.0
				var occupied := true
				if shape == "ellipsoid":
					occupied = nx * nx + ny * ny + nz * nz <= 1.0
				elif shape == "rounded":
					occupied = (
						absf(nx) <= 0.86 and absf(ny) <= 0.9 and absf(nz) <= 0.86) \
						or nx * nx + ny * ny + nz * nz <= 1.0
				if occupied:
					volume.set_cell(Vector3i(x, y, z), 0)
	return volume


func _element(
		id: String, kind: String, material_role_id: String,
		position: Vector3i, size: Vector3i, stage_id: String) \
		-> ForgeBlueprintElement:
	var element := ForgeBlueprintElement.new()
	element.element_id = id
	element.element_kind = kind
	element.material_role_id = material_role_id
	element.position = position
	element.size = size
	element.stage_id = stage_id
	element.metadata = {"authoring_resolution": "world_block_grid"}
	return element


func _marker(
		id: String, marker_role_id: String,
		position: Vector3i) -> ForgeBlueprintElement:
	var element := ForgeBlueprintElement.new()
	element.element_id = id
	element.element_kind = "marker"
	element.marker_role_ids = PackedStringArray([marker_role_id])
	element.position = position
	element.metadata = {"semantic_only": true}
	return element


func _write_artifacts(
		density_paths: PackedStringArray, material_paths: PackedStringArray,
		humanoid: ForgeEntityDefinition, pig: ForgeEntityDefinition,
		cottage: ForgeBlueprintDefinition) -> void:
	var preview_service := ForgeEntityPreviewManifestService.new()
	var humanoid_manifest := preview_service.build(humanoid)
	var pig_manifest := preview_service.build(pig)
	var source_baseline := {
		"schema": "leyforge.forge.stage1-source-baseline",
		"schema_version": 1,
		"contract_version": CONTRACT_VERSION,
		"manual_visual_approval": "open",
		"runtime_factory_status": "not_started",
		"rigging_status": "not_started",
		"entity_templates": [
			{"id": humanoid.entity_definition_id,
				"source_hash": humanoid.canonical_hash(),
				"preview_manifest": humanoid_manifest},
			{"id": pig.entity_definition_id,
				"source_hash": pig.canonical_hash(),
				"preview_manifest": pig_manifest},
		],
		"blueprint_templates": [{
			"id": cottage.blueprint_id,
			"source_hash": cottage.canonical_hash(),
			"legacy_fallback": cottage.legacy_fallback,
			"manual_visual_approval": cottage.visual_approval,
		}],
	}
	_write_json(ARTIFACT_ROOT.path_join("source_baseline.json"), source_baseline)
	var library_records: Array[Dictionary] = []
	for path in density_paths:
		var profile := load(path) as ForgeDensityProfile
		library_records.append({
			"id": profile.density_profile_id,
			"kind": "density_profile",
			"hash": profile.canonical_hash(),
		})
	for path in material_paths:
		var material := load(path) as ForgeMaterialDefinition
		library_records.append({
			"id": material.material_id,
			"kind": "material_dna",
			"hash": material.canonical_hash(),
		})
	library_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("id", "")) < str(b.get("id", "")))
	_write_json(ARTIFACT_ROOT.path_join("material_density_library.json"), {
		"schema": "leyforge.forge.stage1-library-baseline",
		"schema_version": 1,
		"record_count": library_records.size(),
		"records": library_records,
	})
	_write_contact_sheet(
		ARTIFACT_ROOT.path_join("entity_template_preview_contact_sheet.svg"),
		[humanoid_manifest, pig_manifest])


func _write_contact_sheet(path: String, manifests: Array) -> void:
	var lines := PackedStringArray([
		"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"960\" height=\"520\" viewBox=\"0 0 960 520\">",
		"<rect width=\"960\" height=\"520\" fill=\"#10181d\"/>",
		"<text x=\"32\" y=\"42\" fill=\"#e8f1e9\" font-family=\"monospace\" font-size=\"24\">Set 22 Stage 1 deterministic source previews</text>",
	])
	var panel_index := 0
	for manifest in manifests:
		var origin_x := 60.0 + float(panel_index) * 450.0
		lines.append("<rect x=\"%s\" y=\"70\" width=\"400\" height=\"400\" rx=\"12\" fill=\"#17262d\" stroke=\"#49646d\"/>" % origin_x)
		lines.append("<text x=\"%s\" y=\"100\" fill=\"#d7e8dc\" font-family=\"monospace\" font-size=\"16\">%s</text>" % [origin_x + 18.0, str(manifest.get("entity_definition_id", ""))])
		var bounds_min: Vector3 = manifest.get("bounds_min_meters", Vector3.ZERO)
		var bounds_max: Vector3 = manifest.get("bounds_max_meters", Vector3.ONE)
		var width := maxf(0.01, bounds_max.x - bounds_min.x)
		var height := maxf(0.01, bounds_max.y - bounds_min.y)
		var scale := minf(300.0 / width, 300.0 / height)
		for part_record in manifest.get("parts", []):
			var position: Vector3 = part_record.get("world_position_meters", Vector3.ZERO)
			var size: Vector3 = part_record.get("physical_size_meters", Vector3.ZERO)
			var x := origin_x + 200.0 + (position.x - bounds_min.x - width * 0.5) * scale
			var y := 430.0 - (position.y - bounds_min.y + size.y) * scale
			lines.append("<rect x=\"%.2f\" y=\"%.2f\" width=\"%.2f\" height=\"%.2f\" fill=\"#77a68d\" fill-opacity=\"0.78\" stroke=\"#d7e8dc\" stroke-width=\"1\"/>" % [x, y, maxf(2.0, size.x * scale), maxf(2.0, size.y * scale)])
		lines.append("<text x=\"%s\" y=\"490\" fill=\"#9fb7ad\" font-family=\"monospace\" font-size=\"13\">hash %s</text>" % [origin_x + 18.0, str(manifest.get("preview_hash", "")).substr(0, 16)])
		panel_index += 1
	lines.append("</svg>")
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		_failed = true
		push_error("Could not write Stage 1 contact sheet: %s" % path)
		return
	file.store_string("\n".join(lines) + "\n")


func _write_json(path: String, value: Dictionary) -> void:
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		_failed = true
		push_error("Could not write Stage 1 artifact: %s" % path)
		return
	file.store_string(JSON.stringify(
		ForgeStableRecord.normalise(value), "  ", false) + "\n")


func _save(resource: Resource, path: String) -> void:
	var error := ResourceSaver.save(resource, path)
	if error != OK:
		_failed = true
		push_error("Could not save %s: %s" % [path, error_string(error)])
