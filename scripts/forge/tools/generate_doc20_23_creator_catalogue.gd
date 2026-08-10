@tool
extends SceneTree
## Converts canonical Documents 20/22 inventories into editable Forge sources and
## builds the review ledger/batches. Human approvals deliberately remain open.

const BLUEPRINT_JSON := "res://data/settlement/settlement_blueprints.json"
const BLUEPRINT_INVENTORY := "res://content/forge/migration/blueprint_migration_inventory.json"
const ENTITY_INVENTORY := "res://content/forge/migration/entity_migration_inventory.json"
const BLUEPRINT_ROOT := "res://content/forge/blueprints/user/production"
const ENTITY_ROOT := "res://content/forge/entities/user/production"
const GOVERNANCE_ROOT := "res://content/forge/catalogues"
const EVIDENCE_ROOT := "res://generated/forge/review/doc20_23"

# These Stage 5 resources already own their stable canonical IDs. Reuse them as
# editable Forge sources instead of publishing a second active definition.
const EXISTING_BLUEPRINT_SOURCES := {
	"blueprint.leyforge.residential.small_cottage_a": "res://content/forge/blueprints/blueprint_golden_small_forest_cottage.tres",
	"blueprint.leyforge.transport.stone_road_bridge_set_a": "res://content/forge/runtime/set22_23_stage5/blueprint_bridge.tres",
	"blueprint.module.farm.pen_basic_a": "res://content/forge/runtime/set22_23_stage5/blueprint_farm_pen_module.tres",
	"blueprint.leyforge.worldgen.goblin_camp_a": "res://content/forge/runtime/set22_23_stage5/blueprint_goblin_camp.tres",
	"blueprint.module.road.forest_path_a": "res://content/forge/runtime/set22_23_stage5/blueprint_road_module.tres",
	"blueprint.leyforge.worldgen.rune_ruin_a": "res://content/forge/runtime/set22_23_stage5/blueprint_rune_ruin.tres",
	"blueprint.leyforge.storage.village_warehouse_a": "res://content/forge/runtime/set22_23_stage5/blueprint_warehouse.tres",
	"blueprint.leyforge.safety.wooden_watchtower_a": "res://content/forge/runtime/set22_23_stage5/blueprint_watchtower.tres",
	"blueprint.leyforge.crafting.carpenter_workshop_a": "res://content/forge/runtime/set22_23_stage5/blueprint_workshop.tres",
}

var _ledger: Array[Dictionary] = []
var _batches: Dictionary = {}
var _saved := 0
var _failures: Array[String] = []


func _init() -> void:
	for root in [BLUEPRINT_ROOT, ENTITY_ROOT, GOVERNANCE_ROOT, EVIDENCE_ROOT]:
		DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(root))
	_generate_blueprints()
	_generate_procedural_families()
	_generate_entities()
	_write_governance()
	print("DOC20_23_CREATOR_CATALOGUE %s" % JSON.stringify({"ok": _failures.is_empty(),
		"saved": _saved, "ledger_records": _ledger.size(), "batches": _batches.size(),
		"failures": _failures}))
	quit(0 if _failures.is_empty() else 1)


func _json(path: String) -> Dictionary:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		_failures.append("Cannot open %s" % path)
		return {}
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	if not parsed is Dictionary:
		_failures.append("Invalid JSON %s" % path)
		return {}
	return parsed


func _generate_blueprints() -> void:
	var catalogue: Dictionary = _json(BLUEPRINT_JSON)
	var records: Array = catalogue.get("blueprints", [])
	if records.size() != 120:
		_failures.append("Settlement blueprint count %d expected 120" % records.size())
	for value in records:
		var record: Dictionary = value
		var blueprint := _blueprint_from_record(record)
		var slug := ForgeId.safe_filename(blueprint.blueprint_id)
		var path := str(EXISTING_BLUEPRINT_SOURCES.get(blueprint.blueprint_id,
			"%s/%s.tres" % [BLUEPRINT_ROOT, slug]))
		var source_paths: Array[String] = [path]
		if EXISTING_BLUEPRINT_SOURCES.has(blueprint.blueprint_id):
			_remove_generated_blueprint(blueprint.blueprint_id, slug)
		else:
			_save(blueprint, path)
			source_paths.append_array(_generate_states(blueprint, slug))
		_add_ledger(blueprint.blueprint_id, "structures", _category_from_id(blueprint.blueprint_id),
			source_paths, [], "batch.structures.%s" % _category_from_id(blueprint.blueprint_id),
			[blueprint.legacy_fallback])
	for target in [
		["blueprint.leyforge.worldgen.goblin_camp_a", "Goblin Camp", "worldgen"],
		["blueprint.leyforge.worldgen.rune_ruin_a", "Rune Ruin", "worldgen"],
	]:
		var blueprint := _new_worldgen_blueprint(str(target[0]), str(target[1]))
		var slug := ForgeId.safe_filename(blueprint.blueprint_id)
		var path := str(EXISTING_BLUEPRINT_SOURCES.get(blueprint.blueprint_id,
			"%s/%s.tres" % [BLUEPRINT_ROOT, slug]))
		var source_paths: Array[String] = [path]
		if EXISTING_BLUEPRINT_SOURCES.has(blueprint.blueprint_id):
			_remove_generated_blueprint(blueprint.blueprint_id, slug)
		else:
			_save(blueprint, path)
			source_paths.append_array(_generate_states(blueprint, slug))
		_add_ledger(blueprint.blueprint_id, "structures", str(target[2]), source_paths,
			[], "batch.structures.worldgen",
			[blueprint.legacy_fallback] if not blueprint.legacy_fallback.is_empty() else [])
	_generate_inventory_modules()


func _blueprint_from_record(record: Dictionary) -> ForgeBlueprintDefinition:
	var blueprint := ForgeBlueprintDefinition.new()
	blueprint.blueprint_id = str(record.get("id", ""))
	blueprint.display_name = str(record.get("display_name", blueprint.blueprint_id))
	blueprint.definition_ids = PackedStringArray(record.get("definition_ids", []))
	blueprint.lifecycle = "review_ready"
	blueprint.source_status = "review_ready"
	blueprint.visual_approval = "open"
	blueprint.legacy_fallback = str(record.get("fallback", {}).get("legacy_id", ""))
	var bounds: Dictionary = record.get("bounds", {})
	var placement := ForgePlacementProfile.new()
	placement.placement_profile_id = "blueprint.placement_profile.%s" % ForgeId.safe_filename(blueprint.blueprint_id)
	placement.footprint_min = _v3i(bounds.get("min", [0, 0, 0]))
	placement.footprint_max = _v3i(bounds.get("max", [0, 0, 0]))
	var terrain: Dictionary = record.get("terrain_rules", {})
	placement.terrain_mode = str(terrain.get("mode", "minor_levelling"))
	placement.max_slope = int(terrain.get("max_slope", 1))
	# Source socket labels from Document 20 are retained in the source record's
	# markers; only registered semantic sockets belong in the placement contract.
	placement.required_socket_role_ids = PackedStringArray()
	placement.lifecycle = "review_ready"
	blueprint.placement_profile = placement
	var roles := ForgeBlueprintMaterialRoleSet.new()
	roles.material_role_set_id = "blueprint.material_role_set.%s" % ForgeId.safe_filename(blueprint.blueprint_id)
	roles.display_name = "%s Material Roles" % blueprint.display_name
	roles.role_bindings = {}
	for role_id in record.get("palette", {}):
		roles.role_bindings[role_id] = _material_id(str(record.palette[role_id]))
	roles.required_role_ids = PackedStringArray(roles.role_bindings.keys())
	roles.biome_ids = PackedStringArray(["biome.forest"])
	roles.lifecycle = "review_ready"
	# Palette values are gameplay/material identities, not Forge source dependencies.
	roles.dependency_ids = PackedStringArray()
	blueprint.material_role_set = roles
	var previous_stage := ""
	for stage_value in record.get("stages", []):
		var stage: Dictionary = stage_value
		var stage_id := str(stage.get("id", "stage"))
		var delta := ForgeConstructionDelta.new()
		delta.delta_id = "%s.delta.%s" % [blueprint.blueprint_id, stage_id]
		delta.stage_id = stage_id
		if not previous_stage.is_empty(): delta.dependency_stage_ids = PackedStringArray([previous_stage])
		var added: Array[String] = []
		var op_index := 0
		for operation_value in stage.get("operations", []):
			var operation: Dictionary = operation_value
			var element := ForgeBlueprintElement.new()
			element.element_id = "%s.element.%s.%s" % [blueprint.blueprint_id, stage_id,
				str(operation.get("op", "operation")) + "_" + str(op_index)]
			element.element_kind = "block_operation"
			element.stage_id = stage_id
			element.material_role_id = str(operation.get("token", ""))
			element.source_id = str(roles.role_bindings.get(element.material_role_id, ""))
			element.position = _v3i(operation.get("origin", operation.get("position", [0, 0, 0])))
			element.size = _v3i(operation.get("size", [1, int(operation.get("height", 1)), 1]))
			element.metadata = operation.duplicate(true)
			blueprint.elements.append(element)
			added.append(element.element_id)
			op_index += 1
		delta.add_element_ids = PackedStringArray(added)
		blueprint.construction_deltas.append(delta)
		previous_stage = stage_id
	for marker_value in record.get("markers", []):
		var marker: Dictionary = marker_value
		var element := ForgeBlueprintElement.new()
		element.element_id = "%s.%s" % [blueprint.blueprint_id, str(marker.get("id", "marker"))]
		element.element_kind = "semantic_marker"
		element.marker_role_ids = PackedStringArray([
			"marker.role.%s" % str(marker.get("type", "service_point"))])
		element.position = _v3i(marker.get("position", [0, 0, 0]))
		element.metadata = marker.duplicate(true)
		blueprint.elements.append(element)
	blueprint.dependency_ids = PackedStringArray()
	return blueprint


func _new_worldgen_blueprint(id: String, title: String) -> ForgeBlueprintDefinition:
	var record := {"id": id, "display_name": title, "definition_ids": [],
		"bounds": {"min": [-4, 0, -4], "max": [4, 5, 4]},
		"palette": {"foundation_primary": "construction.brick.stone",
			"wall_primary": "construction.planks.oak", "functional": "light.torch.basic"},
		"terrain_rules": {"mode": "worldgen_fit", "max_slope": 2},
		"stages": [{"id": "foundation", "operations": [{"op": "fill", "origin": [-4, 0, -4],
			"size": [9, 1, 9], "token": "foundation_primary"}]},
			{"id": "activation", "operations": [{"op": "point", "position": [0, 1, 0],
			"token": "functional"}]}],
		"markers": [{"id": "entry", "type": "entrance", "position": [0, 1, -4]},
			{"id": "encounter", "type": "encounter", "position": [0, 1, 0]}],
		"fallback": {"legacy_id": "legacy.%s" % ForgeId.safe_filename(id)}}
	return _blueprint_from_record(record)


func _generate_states(blueprint: ForgeBlueprintDefinition, slug: String) -> Array[String]:
	for obsolete_kind in ["construction", "damaged"]:
		_remove("%s/states/%s_%s.tres" % [BLUEPRINT_ROOT, slug, obsolete_kind])
	var paths: Array[String] = []
	var previous := ""
	for state_kind in ["under_construction", "light_damage", "repaired"]:
		var state := ForgeBlueprintStateDefinition.new()
		state.state_id = "blueprint.state.%s.%s" % [slug, state_kind]
		state.blueprint_id = blueprint.blueprint_id
		state.state_kind = state_kind
		state.parent_state_id = previous
		state.damage_ratio = 0.45 if state_kind == "light_damage" else 0.0
		state.material_role_overrides = {"wall_primary": "material.role.damaged"} if state_kind == "light_damage" else {}
		state.repair_resource_ids = PackedStringArray(["construction.planks.oak"]) if state_kind == "light_damage" else PackedStringArray()
		state.lifecycle = "review_ready"
		state.dependency_ids = PackedStringArray([blueprint.blueprint_id])
		var path := "%s/states/%s_%s.tres" % [BLUEPRINT_ROOT, slug, state_kind]
		_save(state, path)
		paths.append(path)
		previous = state.state_id
	return paths


func _remove_generated_blueprint(id: String, slug: String) -> void:
	_remove("%s/%s.tres" % [BLUEPRINT_ROOT, slug])
	_remove("%s/modules/%s.tres" % [BLUEPRINT_ROOT, slug])
	for state_kind in ["construction", "damaged", "under_construction", "light_damage", "repaired"]:
		_remove("%s/states/%s_%s.tres" % [BLUEPRINT_ROOT, slug, state_kind])


func _generate_inventory_modules() -> void:
	for data in [["farm.pen_basic_a", "Farm and Pen Module", "farm"],
		["road.forest_path_a", "Forest Road Module", "road"]]:
		var module := _module("blueprint.module.%s" % data[0], str(data[1]), str(data[2]), "straight")
		var slug := ForgeId.safe_filename(module.module_id)
		var path := str(EXISTING_BLUEPRINT_SOURCES.get(module.module_id,
			"%s/modules/%s.tres" % [BLUEPRINT_ROOT, slug]))
		if EXISTING_BLUEPRINT_SOURCES.has(module.module_id):
			_remove_generated_blueprint(module.module_id, slug)
		else:
			_save(module, path)
		_add_ledger(module.module_id, "structures", str(data[2]), [path], [],
			"batch.structures.worldgen", ["legacy.%s" % ForgeId.safe_filename(module.module_id)])


func _generate_procedural_families() -> void:
	var families := {"forest_road": "road", "mine_tunnel": "tunnel", "cave_nest": "cave",
		"goblin_den": "goblin", "rune_vault": "rune"}
	var roles := ["entrance", "straight", "turn", "junction", "encounter", "utility_puzzle", "reward_secret", "terminal_exit"]
	for family in families:
		var module_ids: Array[String] = []
		for role in roles:
			var module := _module("blueprint.module.%s.%s" % [family, role],
				"%s %s" % [str(family).capitalize(), str(role).capitalize()], str(families[family]), str(role))
			var path := "%s/modules/%s.tres" % [BLUEPRINT_ROOT, ForgeId.safe_filename(module.module_id)]
			_save(module, path)
			module_ids.append(module.module_id)
		var set := ForgeBlueprintModuleSet.new()
		set.module_set_id = "blueprint.module_set.%s" % family
		set.display_name = "%s Structure Set" % str(family).capitalize()
		set.module_ids = PackedStringArray(module_ids)
		set.start_module_ids = PackedStringArray([module_ids[0]])
		set.end_module_ids = PackedStringArray([module_ids[-1]])
		set.module_weights = {}
		for module_id in module_ids: set.module_weights[module_id] = 1.0
		set.required_tags = PackedStringArray([str(families[family])])
		set.continuation_policy = "continuing"
		set.source_status = "review_ready"
		set.lifecycle = "review_ready"
		set.dependency_ids = PackedStringArray(module_ids)
		var set_path := "%s/sets/%s.tres" % [BLUEPRINT_ROOT, ForgeId.safe_filename(set.module_set_id)]
		_save(set, set_path)
		var rules := ForgeProceduralStructureRuleSet.new()
		rules.rule_set_id = "blueprint.ruleset.%s" % family
		rules.display_name = "%s Finite and Continuing Rules" % str(family).capitalize()
		rules.module_set_id = set.module_set_id
		rules.maximum_modules = 128
		rules.maximum_depth = 48
		rules.maximum_open_connectors = 24
		rules.termination_chance = 0.18
		rules.allow_loops = family not in ["forest_road"]
		rules.continuing = true
		rules.seed = abs(hash(family)) + 1
		rules.collision_policy = "occupied_bounds_and_clearance"
		rules.required_module_tags = PackedStringArray(["entrance", "encounter", "terminal_exit"])
		rules.maximum_repeats_per_module = 24
		rules.minimum_modules_before_encounter = 2
		rules.minimum_modules_before_terminal = 4
		rules.dead_end_policy = "terminate_with_cap"
		rules.continuation_checkpoint_interval = 8
		rules.source_status = "review_ready"
		rules.lifecycle = "review_ready"
		rules.dependency_ids = PackedStringArray([set.module_set_id])
		var rules_path := "%s/rules/%s.tres" % [BLUEPRINT_ROOT, ForgeId.safe_filename(rules.rule_set_id)]
		_save(rules, rules_path)
		_add_ledger(set.module_set_id, "structures", "procedural_%s" % family,
			[set_path, rules_path], Array(set.dependency_ids), "batch.structures.procedural", [])


func _module(id: String, title: String, family_tag: String, role: String) -> ForgeBlueprintModuleDefinition:
	var module := ForgeBlueprintModuleDefinition.new()
	module.module_id = id
	module.display_name = title
	module.module_kind = role
	module.lifecycle = "review_ready"
	var floor := ForgeBlueprintElement.new()
	floor.element_id = "%s.floor" % id
	floor.element_kind = "block_operation"
	floor.material_role_id = "foundation_primary"
	floor.source_id = "construction.brick.stone" if family_tag in ["rune", "cave"] else "road.path.dirt"
	floor.position = Vector3i(-2, 0, -2)
	floor.size = Vector3i(5, 1, 5)
	floor.metadata = {"operation": "fill", "role": role, "family": family_tag,
		"terrain_policy": "carve_and_fit" if family_tag in ["tunnel", "cave"] else "surface_fit"}
	module.elements = [floor]
	var connector_count := 4 if role == "junction" else (1 if role == "terminal_exit" else 2)
	var directions := [Vector3i.BACK, Vector3i.FORWARD, Vector3i.LEFT, Vector3i.RIGHT]
	for index in connector_count:
		var connector := ForgeBlueprintConnectorDefinition.new()
		connector.connector_id = "blueprint.connector.%s.%s" % [ForgeId.safe_filename(id),
			["north", "south", "west", "east"][index]]
		connector.display_name = "%s %s connection" % [family_tag.capitalize(), role.capitalize()]
		connector.owner_module_id = id
		connector.position = [Vector3i(0, 1, -2), Vector3i(0, 1, 2), Vector3i(-2, 1, 0), Vector3i(2, 1, 0)][index]
		connector.direction = directions[index]
		connector.socket_role_id = "socket.role.structure.%s" % family_tag
		connector.connection_tags = PackedStringArray([family_tag, role])
		connector.compatibility_group = "structure.%s" % family_tag
		connector.opening_size = Vector3i(3, 3, 1)
		connector.clearance = Vector3i(3, 3, 2)
		connector.elevation_delta = 0
		connector.navigation_mode = "walk"
		connector.terrain_policy = "carve" if family_tag in ["tunnel", "cave"] else "surface_fit"
		connector.allowed_rotations = PackedInt32Array([0, 1, 2, 3])
		connector.source_status = "review_ready"
		connector.lifecycle = "review_ready"
		module.connectors.append(connector)
	module.aliases = PackedStringArray(["module.production.%s" % ForgeId.safe_filename(id)])
	module.dependency_ids = PackedStringArray()
	return module


func _generate_entities() -> void:
	var inventory := _json(ENTITY_INVENTORY)
	var family_plans := {}
	for family in ["humanoid", "goblin", "quadruped", "arachnid", "incorporeal"]:
		family_plans[family] = _body_plan(family)
	for value in inventory.get("records", []):
		var record: Dictionary = value
		var id := str(record.get("target_id", ""))
		var family := _entity_family(id)
		var entity := ForgeEntityDefinition.new()
		entity.entity_definition_id = id
		entity.display_name = str(record.get("display_name", id))
		entity.body_family = family
		entity.body_plan = family_plans[family]
		entity.world_dimensions_meters = _entity_size(family)
		entity.gameplay_definition_ids = PackedStringArray([id.replace("entity.definition.", "gameplay.entity.")])
		entity.entity_role_ids = PackedStringArray([_entity_role(id)])
		entity.material_dna_ids = PackedStringArray(["material.dna.entity.skin_tones"])
		entity.extension_points = PackedStringArray(["rig", "animation", "variant", "equipment", "lod_proxy", "collision"])
		entity.source_status = "review_ready"
		entity.lifecycle = "review_ready"
		entity.visual_approval = "open"
		entity.legacy_fallback = str(record.get("active_legacy_fallback", "legacy.%s" % ForgeId.safe_filename(id)))
		entity.dependency_ids = PackedStringArray([entity.body_plan.body_plan_id])
		var slug := ForgeId.safe_filename(id)
		var path := "%s/%s.tres" % [ENTITY_ROOT, slug]
		_save(entity, path)
		var rig_path := _rig_for_entity(entity, slug)
		var animation_path := _animation_for_entity(entity, slug)
		var variant_path := _variant_for_entity(entity, slug)
		var extra_paths := [path, rig_path, animation_path, variant_path]
		if family in ["humanoid", "goblin"]: extra_paths.append(_equipment_for_entity(entity, slug))
		_add_ledger(id, "characters", _category_from_id(id), extra_paths,
			Array(entity.dependency_ids), "batch.characters.%s" % family, [entity.legacy_fallback])
	if int(inventory.get("record_count", 0)) != 14:
		_failures.append("Entity inventory count expected 14")


func _body_plan(family: String) -> ForgeBodyPlanDefinition:
	var definitions := {
		"humanoid": ["torso", "head", "arm_left", "arm_right", "leg_left", "leg_right"],
		"goblin": ["torso", "head", "arm_left", "arm_right", "leg_left", "leg_right"],
		"quadruped": ["torso", "head", "leg_front_left", "leg_front_right", "leg_back_left", "leg_back_right"],
		"arachnid": ["abdomen", "head", "leg_1_left", "leg_1_right", "leg_2_left", "leg_2_right", "leg_3_left", "leg_3_right", "leg_4_left", "leg_4_right"],
		"incorporeal": ["core"],
	}
	var plan := ForgeBodyPlanDefinition.new()
	if family == "goblin":
		_remove("%s/body_parts/entity_body_part_production_goblin_ear_left.tres" % ENTITY_ROOT)
		_remove("%s/body_parts/entity_body_part_production_goblin_ear_right.tres" % ENTITY_ROOT)
	if family == "incorporeal":
		_remove("%s/body_parts/entity_body_part_production_incorporeal_halo.tres" % ENTITY_ROOT)
		_remove("%s/body_parts/entity_body_part_production_incorporeal_trail.tres" % ENTITY_ROOT)
	plan.body_plan_id = "entity.body_plan.production.%s" % family
	plan.display_name = "%s Shared Body Plan" % family.capitalize()
	plan.family = family
	plan.world_dimensions_meters = _entity_size(family)
	var parts: Array[ForgeBodyPartDefinition] = []
	for index in definitions[family].size():
		var name := str(definitions[family][index])
		var part := ForgeBodyPartDefinition.new()
		part.body_part_id = "entity.body_part.production.%s.%s" % [family, name]
		part.display_name = name.capitalize()
		part.parent_part_id = "" if index == 0 else "entity.body_part.production.%s.%s" % [family, definitions[family][0]]
		part.anatomy_role_id = _anatomy_role(family, name)
		part.rig_role = "rig.role.%s" % name
		part.side_token = "left" if name.ends_with("left") else ("right" if name.ends_with("right") else "centre")
		part.voxel_source = _box_volume(_part_dimensions(name, family))
		part.material_dna_id = "material.dna.entity.skin_tones"
		part.pivot_id = "pivot.%s.%s" % [family, name]
		part.socket_role_ids = PackedStringArray(["socket.equipment.primary"]) if name in ["torso", "core"] else PackedStringArray()
		part.contact_marker_ids = PackedStringArray(["contact.%s" % name]) if "leg" in name else PackedStringArray()
		part.planning_status = "review_ready"
		part.lifecycle = "review_ready"
		part.dependency_ids = PackedStringArray(["density.profile.entity.standard", part.material_dna_id])
		var path := "%s/body_parts/%s.tres" % [ENTITY_ROOT, ForgeId.safe_filename(part.body_part_id)]
		_save(part, path)
		parts.append(part)
	plan.root_part_id = parts[0].body_part_id
	plan.body_parts = parts
	plan.required_entity_roles = PackedStringArray(parts.map(func(part): return part.anatomy_role_id))
	plan.symmetry_groups = [{"id": "left_right", "axis": "x", "roles": Array(plan.required_entity_roles)}]
	plan.contact_sets = [{"id": "ground", "markers": parts.reduce(func(a, part): a.append_array(Array(part.contact_marker_ids)); return a, [])}]
	plan.lifecycle = "review_ready"
	plan.dependency_ids = PackedStringArray(parts.map(func(part): return part.body_part_id))
	_save(plan, "%s/body_plans/%s.tres" % [ENTITY_ROOT, ForgeId.safe_filename(plan.body_plan_id)])
	return plan


func _rig_for_entity(entity: ForgeEntityDefinition, slug: String) -> String:
	var rig := ForgeRigProfile.new()
	rig.rig_profile_id = "entity.rig.production.%s" % slug
	rig.display_name = "%s Rig" % entity.display_name
	rig.entity_definition_id = entity.entity_definition_id
	rig.body_plan_id = entity.body_plan.body_plan_id
	rig.root_role_id = entity.body_plan.body_parts[0].anatomy_role_id
	for index in entity.body_plan.body_parts.size():
		var part := entity.body_plan.body_parts[index]
		var binding := ForgeRigRoleBinding.new()
		binding.role_id = part.anatomy_role_id
		binding.body_part_id = part.body_part_id
		binding.parent_role_id = "" if index == 0 else rig.root_role_id
		binding.joint_id = "" if index == 0 else "%s.joint.%s" % [rig.rig_profile_id, ForgeId.safe_filename(part.body_part_id)]
		rig.role_bindings.append(binding)
		if index > 0:
			var joint := ForgeRigJointDefinition.new()
			joint.joint_id = binding.joint_id
			joint.parent_role_id = rig.root_role_id
			joint.child_role_id = binding.role_id
			joint.joint_type = "ball"
			joint.minimum_angles_degrees = Vector3(-45, -30, -45)
			joint.maximum_angles_degrees = Vector3(45, 30, 45)
			joint.lifecycle = "review_ready"
			rig.joints.append(joint)
	rig.rig_lod_levels = [{"lod": 0, "roles": Array(entity.body_plan.required_entity_roles)},
		{"lod": 1, "roles": [rig.root_role_id]}, {"lod": 2, "roles": [rig.root_role_id]}]
	rig.motion_profiles = {"idle": {"blend_seconds": 0.2}, "walk": {"blend_seconds": 0.12}}
	rig.lifecycle = "review_ready"
	rig.source_status = "review_ready"
	rig.dependency_ids = PackedStringArray([entity.entity_definition_id, entity.body_plan.body_plan_id])
	var path := "%s/rigs/%s.tres" % [ENTITY_ROOT, ForgeId.safe_filename(rig.rig_profile_id)]
	_save(rig, path)
	return path


func _animation_for_entity(entity: ForgeEntityDefinition, slug: String) -> String:
	var library := ForgeEntityAnimationLibrary.new()
	library.animation_library_id = "entity.animation_set.production.%s" % slug
	library.display_name = "%s Animation Library" % entity.display_name
	library.rig_profile_id = "entity.rig.production.%s" % slug
	library.rig_family = entity.body_family
	for action in ["idle", "walk", "interact", "hurt"]:
		var clip := ForgeEntityAnimationClip.new()
		clip.clip_id = "%s.%s" % [library.animation_library_id, action]
		clip.display_name = action.capitalize()
		clip.semantic_action = action
		clip.duration_seconds = 1.2 if action == "idle" else 0.7
		clip.looping = action in ["idle", "walk"]
		clip.role_tracks = [{"role_id": entity.body_plan.body_parts[0].anatomy_role_id,
			"keys": [{"time": 0.0, "rotation": [0, 0, 0]}, {"time": 0.5, "rotation": [0, 2, 0]}, {"time": 1.0, "rotation": [0, 0, 0]}]}]
		if action == "walk":
			var marker := ForgeAnimationEventMarker.new()
			marker.marker_id = "%s.contact" % clip.clip_id
			marker.event_contract_id = "event.entity.movement_contact"
			marker.normalized_time = 0.5
			marker.spatial_role_id = "runtime_anchor.block.mining_impact"
			marker.contact_kind = "footstep"
			clip.event_markers = [marker]
		clip.lifecycle = "review_ready"
		library.clips.append(clip)
	library.animation_lod_levels = [{"lod": 0, "clips": ["idle", "walk", "interact", "hurt"]},
		{"lod": 1, "clips": ["idle", "walk"]}]
	library.lifecycle = "review_ready"
	library.source_status = "review_ready"
	library.dependency_ids = PackedStringArray([library.rig_profile_id])
	var path := "%s/animations/%s.tres" % [ENTITY_ROOT, ForgeId.safe_filename(library.animation_library_id)]
	_save(library, path)
	return path


func _variant_for_entity(entity: ForgeEntityDefinition, slug: String) -> String:
	var variant := ForgeEntityVariantProfile.new()
	variant.variant_profile_id = "entity.variant.production.%s" % slug
	variant.display_name = "%s Deterministic Variants" % entity.display_name
	variant.entity_definition_id = entity.entity_definition_id
	variant.entity_role_ids = entity.entity_role_ids
	variant.material_variant_ids = PackedStringArray(["material.variant.natural", "material.variant.weathered", "material.variant.regional"])
	variant.seed_channels = PackedStringArray(["body", "materials", "equipment", "markings"])
	variant.lifecycle = "review_ready"
	variant.source_status = "review_ready"
	variant.dependency_ids = PackedStringArray([entity.entity_definition_id])
	var path := "%s/variants/%s.tres" % [ENTITY_ROOT, ForgeId.safe_filename(variant.variant_profile_id)]
	_save(variant, path)
	return path


func _equipment_for_entity(entity: ForgeEntityDefinition, slug: String) -> String:
	var profile := ForgeEquipmentFitProfile.new()
	profile.equipment_profile_id = "entity.equipment_profile.production.%s.primary" % slug
	profile.display_name = "%s Primary Equipment Fit" % entity.display_name
	profile.equipment_asset_id = "forge_asset.item.tool.crude_pickaxe"
	profile.compatible_rig_profile_ids = PackedStringArray(["entity.rig.production.%s" % slug])
	profile.socket_role_id = "socket.equipment.primary"
	profile.lifecycle = "review_ready"
	profile.dependency_ids = PackedStringArray([profile.compatible_rig_profile_ids[0]])
	var path := "%s/equipment/%s.tres" % [ENTITY_ROOT, ForgeId.safe_filename(profile.equipment_profile_id)]
	_save(profile, path)
	return path


func _box_volume(dimensions: Vector3i) -> ForgeVoxelVolume:
	var volume := ForgeVoxelVolume.new()
	volume.dimensions = dimensions
	volume.density_profile = "density.profile.entity.standard"
	volume.voxel_size_meters = 1.0 / 32.0
	volume.ensure_storage()
	for z in dimensions.z:
		for y in dimensions.y:
			for x in dimensions.x: volume.set_cell(Vector3i(x, y, z), 0)
	return volume


func _part_dimensions(name: String, family: String) -> Vector3i:
	if "leg" in name or "arm" in name: return Vector3i(3, 8, 3)
	if "ear" in name: return Vector3i(3, 3, 1)
	if name in ["head"]: return Vector3i(6, 6, 6)
	if name in ["halo", "trail"]: return Vector3i(5, 5, 2)
	return Vector3i(8, 9, 6) if family != "incorporeal" else Vector3i(6, 6, 6)


func _anatomy_role(family: String, part_name: String) -> String:
	var semantic_family := "humanoid" if family == "goblin" else family
	var semantic_name := part_name
	if semantic_family == "humanoid":
		semantic_name = part_name.replace("arm_", "arm.").replace("leg_", "leg.")
	elif semantic_family == "quadruped":
		semantic_name = part_name.replace("leg_front_", "leg.front_") \
			.replace("leg_back_", "leg.rear_")
	elif semantic_family == "arachnid":
		semantic_family = "arthropod"
		if part_name == "abdomen":
			semantic_name = "core"
		elif part_name.begins_with("leg_"):
			var pieces := part_name.split("_")
			semantic_name = "leg.%s.%s" % [pieces[2], pieces[1]]
	elif semantic_family == "incorporeal":
		semantic_family = "wisp"
	return "anatomy.role.%s.%s" % [semantic_family, semantic_name]


func _entity_role(id: String) -> String:
	if ".player." in id:
		return "entity_role.player"
	if ".npc." in id:
		return "entity_role.npc"
	return "entity_role.%s" % str(id.split(".")[-1])


func _material_id(source_id: String) -> String:
	var lowered := source_id.to_lower()
	if "glass" in lowered:
		return "material.mvp.glass"
	if "iron" in lowered or "metal" in lowered or "copper" in lowered:
		return "material.mvp.iron"
	if "stone" in lowered or "brick" in lowered or "cobble" in lowered \
			or "dirt" in lowered or "path" in lowered:
		return "material.mvp.stone"
	return "material.mvp.wood"


func _entity_family(id: String) -> String:
	if "goblin" in id: return "goblin"
	if id.ends_with(".pig"): return "quadruped"
	if id.ends_with(".spider"): return "arachnid"
	if id.ends_with(".wisp"): return "incorporeal"
	return "humanoid"


func _entity_size(family: String) -> Vector3:
	match family:
		"goblin": return Vector3(0.7, 1.25, 0.55)
		"quadruped": return Vector3(1.1, 0.75, 1.5)
		"arachnid": return Vector3(1.4, 0.45, 1.4)
		"incorporeal": return Vector3(0.65, 0.8, 0.65)
	return Vector3(0.75, 1.8, 0.55)


func _write_governance() -> void:
	var ledger := {"schema": "leyforge.forge.coverage-ledger", "schema_version": 1,
		"scope": "documents_20_23_production", "status": "review_ready",
		"approval_policy": "explicit_human_batch_approval", "records": _ledger}
	_write_json("%s/doc20_23_coverage_ledger.json" % GOVERNANCE_ROOT, ledger)
	for batch_id in _batches:
		var record: Dictionary = _batches[batch_id]
		var batch := ForgeApprovalBatchManifest.new()
		batch.batch_id = batch_id
		batch.display_name = str(record.display_name)
		batch.studio = str(record.studio)
		batch.category = str(record.category)
		batch.target_ids = PackedStringArray(record.target_ids)
		batch.evidence_paths = PackedStringArray(["%s/%s.json" % [EVIDENCE_ROOT, ForgeId.safe_filename(batch_id)]])
		batch.status = "review_ready"
		_save(batch, "%s/approval_batches/%s.tres" % [GOVERNANCE_ROOT, ForgeId.safe_filename(batch_id)])
		_write_json("%s/%s.json" % [EVIDENCE_ROOT, ForgeId.safe_filename(batch_id)],
			{"batch_id": batch_id, "status": "review_ready", "automated_validation": "pending_gate",
				"human_review": "open", "target_ids": record.target_ids,
				"instructions": "Review visual contact sheets or audio auditions in Forge, then approve or request changes."})


func _add_ledger(target_id: String, studio: String, category: String,
		source_paths: Array, dependencies: Array, batch_id: String, fallbacks: Array) -> void:
	var evidence := "%s/%s.json" % [EVIDENCE_ROOT, ForgeId.safe_filename(batch_id)]
	_ledger.append({"target_id": target_id, "studio": studio, "category": category,
		"source_paths": source_paths, "dependency_ids": dependencies,
		"runtime_product_paths": [], "bake_receipt_paths": [],
		"evidence_paths": [evidence], "approval_batch_id": batch_id,
		"fallback_ids": fallbacks, "status": "review_ready", "human_approval": "open"})
	if not _batches.has(batch_id):
		_batches[batch_id] = {"display_name": batch_id.replace("batch.", "").capitalize(),
			"studio": studio, "category": category, "target_ids": []}
	(_batches[batch_id].target_ids as Array).append(target_id)


func _category_from_id(id: String) -> String:
	var parts := id.split(".")
	return str(parts[2] if parts.size() > 2 else "shared")


func _v3i(value: Variant) -> Vector3i:
	var array: Array = value
	return Vector3i(int(array[0]), int(array[1]), int(array[2])) if array.size() >= 3 else Vector3i.ZERO


func _save(resource: Resource, path: String) -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(path.get_base_dir()))
	var error := ResourceSaver.save(resource, path)
	if error == OK: _saved += 1
	else: _failures.append("%s=%s" % [path, error_string(error)])


func _remove(path: String) -> void:
	var absolute := ProjectSettings.globalize_path(path)
	if FileAccess.file_exists(absolute):
		var error := DirAccess.remove_absolute(absolute)
		if error != OK:
			_failures.append("Cannot remove generated duplicate %s=%s" % [path, error_string(error)])


func _write_json(path: String, value: Dictionary) -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(path.get_base_dir()))
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		_failures.append("Cannot write %s" % path)
		return
	file.store_string(JSON.stringify(value, "  ", false) + "\n")
	_saved += 1
