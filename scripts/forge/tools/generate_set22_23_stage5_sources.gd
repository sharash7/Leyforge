extends SceneTree
## Generates deterministic Set 22/23 Milestone 5 runtime-candidate sources.

const ROOT := "res://content/forge/runtime/set22_23_stage5"
const TARGETS := [
	{"key": "cottage", "id": "blueprint.leyforge.residential.small_cottage_a",
		"name": "Small Forest Cottage", "fallback": "bp.building.cottage_forest_small",
		"size": Vector3i(5, 4, 6), "markers": ["marker.role.entrance",
			"marker.role.household_bed", "marker.role.household_storage",
			"marker.role.heat_light"], "networks": ["network.role.road_access"]},
	{"key": "warehouse", "id": "blueprint.leyforge.storage.village_warehouse_a",
		"name": "Village Warehouse", "fallback": "bp.building.warehouse_village",
		"size": Vector3i(8, 5, 8), "markers": ["marker.role.entrance",
			"marker.role.loading", "marker.role.storage", "marker.role.delivery_socket"],
		"networks": ["network.role.logistics", "network.role.road_access"]},
	{"key": "workshop", "id": "blueprint.leyforge.crafting.carpenter_workshop_a",
		"name": "Carpenter Workshop", "fallback": "bp.building.workshop_carpenter",
		"size": Vector3i(7, 5, 7), "markers": ["marker.role.entrance",
			"marker.role.saw_workstation", "marker.role.tool_storage",
			"marker.role.chimney_or_ventilation"],
		"networks": ["network.role.heat", "network.role.logistics"]},
	{"key": "watchtower", "id": "blueprint.leyforge.safety.wooden_watchtower_a",
		"name": "Wooden Watchtower", "fallback": "bp.building.watchtower_wood",
		"size": Vector3i(5, 9, 5), "markers": ["marker.role.entrance",
			"marker.role.guard_point", "marker.role.signal_point",
			"marker.role.repair_points"], "networks": ["network.role.defence",
			"network.role.road_access"]},
	{"key": "bridge", "id": "blueprint.leyforge.transport.stone_road_bridge_set_a",
		"name": "Stone Road Bridge", "fallback": "bp.project.road_bridge_stone",
		"size": Vector3i(5, 3, 12), "markers": ["marker.role.navigable_approach",
			"marker.role.bridge_supports_landings", "marker.role.road_nodes"],
		"networks": ["network.role.road", "network.role.transport"]},
	{"key": "goblin_camp", "id": "blueprint.leyforge.worldgen.goblin_camp_a",
		"name": "Goblin Camp", "fallback": "legacy.scene.goblin_camp",
		"size": Vector3i(10, 4, 10), "markers": ["marker.role.entrance",
			"marker.role.sleep_spots", "marker.role.assembly_point",
			"marker.role.guard_point"], "networks": ["network.role.road_access"]},
	{"key": "rune_ruin", "id": "blueprint.leyforge.worldgen.rune_ruin_a",
		"name": "Rune Ruin", "fallback": "legacy.scene.rune_ruin",
		"size": Vector3i(8, 5, 8), "markers": ["marker.role.entrance",
			"marker.role.rune_control_point", "marker.role.leyline_anchor",
			"marker.role.portal_frame"], "networks": ["network.role.mana"]},
	{"key": "road_module", "id": "blueprint.module.road.forest_path_a",
		"name": "Forest Road Module", "fallback": "road.path.dirt",
		"size": Vector3i(3, 1, 8), "markers": ["marker.role.road_nodes",
			"marker.role.route_socket"], "networks": ["network.role.road"]},
	{"key": "farm_pen_module", "id": "blueprint.module.farm.pen_basic_a",
		"name": "Farm and Pen Module", "fallback": "legacy.hamlet.pig_pen",
		"size": Vector3i(8, 3, 8), "markers": ["marker.role.animal_stalls",
			"marker.role.feed_water", "marker.role.farm_work_point",
			"marker.role.road_socket"], "networks": ["network.role.water",
			"network.role.logistics"]},
]

const MODULE_SPECS := [
	["door", "Door Assembly", "asset", Vector3i(1, 2, 1), "material_role.door_material"],
	["window", "Window Assembly", "asset", Vector3i(1, 1, 1), "material_role.window_material"],
	["roof_ridge", "Roof Ridge Set", "block_group", Vector3i(3, 1, 1), "material_role.roof_material"],
	["stairs_rail", "Stair and Railing Set", "block_group", Vector3i(2, 2, 2), "material_role.structural_beam"],
	["bed_cluster", "Bed Household Cluster", "asset", Vector3i(2, 1, 1), "material_role.functional"],
	["workstation", "Workstation Cluster", "asset", Vector3i(2, 1, 1), "material_role.functional"],
	["storage", "Storage Cluster", "asset", Vector3i(2, 2, 1), "material_role.functional"],
	["guard_post", "Guard Post Cluster", "asset", Vector3i(1, 2, 1), "material_role.structural_beam"],
	["wall_gate", "Wall and Gate Segment", "block_group", Vector3i(3, 2, 1), "material_role.wall_primary"],
	["bridge_span", "Bridge Span and Support", "block_group", Vector3i(3, 1, 4), "material_role.foundation_material"],
	["scaffold", "Construction Scaffold", "block_group", Vector3i(2, 3, 1), "material_role.frame_material"],
	["damage_rubble", "Damage Rubble", "block_group", Vector3i(2, 1, 2), "material_role.foundation_material"],
]

var failures: Array[String] = []
var saved := 0


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(ROOT))
	var modules := _generate_modules()
	for spec in TARGETS:
		_generate_target(spec, modules)
	_generate_surface_layers()
	_generate_acoustics()
	print("SET22_23_STAGE5_SOURCE_GENERATOR %s" % JSON.stringify({
		"ok": failures.is_empty(), "failures": failures,
		"saved": saved, "target_count": TARGETS.size()}))
	quit(0 if failures.is_empty() else 1)


func _generate_modules() -> Dictionary:
	var modules := {}
	for spec in MODULE_SPECS:
		var module := ForgeBlueprintModuleDefinition.new()
		module.module_id = "blueprint.module.shared.%s.stage5" % spec[0]
		module.display_name = spec[1]
		module.module_kind = spec[0]
		var element := _element("%s.primary" % spec[0], spec[2],
			Vector3i.ZERO, spec[3], spec[4], "equipment")
		if spec[0] == "damage_rubble":
			element.optional = true
		module.elements = [element]
		modules[spec[0]] = module
		_save(module, "%s/module_%s.tres" % [ROOT, spec[0]])
	return modules


func _generate_target(spec: Dictionary, modules: Dictionary) -> void:
	if spec.key == "cottage":
		var existing := ResourceLoader.load(
			"res://content/forge/blueprints/blueprint_golden_small_forest_cottage.tres",
			"", ResourceLoader.CACHE_MODE_IGNORE) as ForgeBlueprintDefinition
		if existing == null:
			failures.append("canonical cottage source is missing")
			return
		_generate_states(spec, existing)
		return
	var role_set := ForgeBlueprintMaterialRoleSet.new()
	role_set.material_role_set_id = "blueprint.material_role_set.%s.stage5" % spec.key
	role_set.role_bindings = {
		"material_role.foundation_material": "material.mvp.stone",
		"material_role.floor_material": "material.mvp.wood",
		"material_role.wall_primary": "material.mvp.wood",
		"material_role.wall_secondary": "material.mvp.stone",
		"material_role.frame_material": "material.mvp.wood",
		"material_role.roof_material": "material.mvp.wood",
		"material_role.door_material": "material.mvp.wood",
		"material_role.window_material": "material.mvp.glass",
		"material_role.structural_beam": "material.mvp.wood",
		"material_role.functional": "material.mvp.iron",
	}
	role_set.required_role_ids = PackedStringArray(role_set.role_bindings.keys())
	role_set.lifecycle = "runtime_candidate"
	var placement := ForgePlacementProfile.new()
	placement.placement_profile_id = "blueprint.placement_profile.%s.stage5" % spec.key
	placement.allowed_zone_role_ids = PackedStringArray(["zone.role.placement"])
	placement.required_socket_role_ids = PackedStringArray(["socket.role.road_access"]) \
		if spec.key not in ["rune_ruin", "bridge", "road_module"] else PackedStringArray()
	placement.required_network_role_ids = PackedStringArray()
	placement.footprint_min = Vector3i.ZERO
	placement.footprint_max = spec.size - Vector3i.ONE
	placement.max_slope = 2 if spec.key in ["bridge", "road_module"] else 1
	placement.terrain_mode = "bridge_supports" if spec.key == "bridge" \
		else "terrain_following" if spec.key == "road_module" else "minor_levelling"
	placement.lifecycle = "runtime_candidate"
	var blueprint := ForgeBlueprintDefinition.new()
	blueprint.blueprint_id = spec.id
	blueprint.display_name = spec.name
	blueprint.definition_ids = PackedStringArray()
	blueprint.material_role_set = role_set
	blueprint.placement_profile = placement
	blueprint.capture_profile_id = "capture.profile.blueprint.current_state"
	blueprint.lifecycle = "runtime_candidate"
	blueprint.source_status = "validated_runtime_candidate"
	blueprint.visual_approval = "open"
	blueprint.contract_version = "22-stage5-v1"
	blueprint.legacy_fallback = spec.fallback
	blueprint.extension_points = PackedStringArray([
		"construction", "damage_repair", "acoustics", "worldgen"])
	var size: Vector3i = spec.size
	blueprint.elements = [
		_element("volume.foundation", "block_group", Vector3i.ZERO,
			Vector3i(size.x, 1, size.z), "material_role.foundation_material", "foundation"),
		_element("volume.floor", "block_group", Vector3i(0, 1, 0),
			Vector3i(size.x, 1, size.z), "material_role.floor_material", "shell"),
		_element("volume.wall.north", "block_group", Vector3i(0, 2, 0),
			Vector3i(size.x, maxi(1, size.y - 2), 1), "material_role.wall_primary", "shell"),
		_element("volume.wall.south", "block_group", Vector3i(0, 2, size.z - 1),
			Vector3i(size.x, maxi(1, size.y - 2), 1), "material_role.wall_secondary", "shell"),
		_element("volume.roof", "block_group", Vector3i(0, size.y - 1, 0),
			Vector3i(size.x, 1, size.z), "material_role.roof_material", "roof"),
	]
	var module_keys := _modules_for_target(spec.key)
	var module_index := 0
	for module_key in module_keys:
		var module: ForgeBlueprintModuleDefinition = modules[module_key]
		var placement_element := _element("module.%s.%02d" % [module_key, module_index], "module",
			Vector3i(1 + module_index % maxi(1, size.x - 2), 1,
				1 + int(module_index / maxi(1, size.x - 2)) % maxi(1, size.z - 2)),
			Vector3i.ONE, "", "equipment")
		placement_element.module_id = module.module_id
		blueprint.elements.append(placement_element)
		if module.module_id not in blueprint.module_ids:
			blueprint.module_ids.append(module.module_id)
		module_index += 1
	var damage_module: ForgeBlueprintModuleDefinition = modules.damage_rubble
	var damage_element := _element("module.damage_rubble", "module",
		Vector3i(maxi(0, size.x - 3), 1, maxi(0, size.z - 3)),
		Vector3i.ONE, "", "complete")
	damage_element.module_id = damage_module.module_id
	damage_element.optional = true
	blueprint.elements.append(damage_element)
	blueprint.module_ids.append(damage_module.module_id)
	var marker_index := 0
	for role_value in spec.markers:
		var marker := _element("marker.%02d" % marker_index, "marker",
			Vector3i(marker_index % maxi(1, size.x), 1,
				marker_index % maxi(1, size.z)), Vector3i.ONE, "", "interior")
		marker.marker_role_ids = PackedStringArray([role_value])
		blueprint.elements.append(marker)
		marker_index += 1
	for network_value in spec.networks:
		var network := _element("network.%s" % str(network_value).get_slice(".", 2),
			"marker", Vector3i.ZERO, Vector3i.ONE, "", "equipment")
		network.network_role_ids = PackedStringArray([network_value])
		blueprint.elements.append(network)
	blueprint.construction_deltas = _construction_deltas(blueprint.elements)
	blueprint.dependency_ids = blueprint.module_ids.duplicate()
	_save(blueprint, "%s/blueprint_%s.tres" % [ROOT, spec.key])
	_generate_states(spec, blueprint)


func _generate_states(spec: Dictionary, blueprint: ForgeBlueprintDefinition) -> void:
	var damage := ForgeBlueprintStateDefinition.new()
	damage.state_id = "blueprint.state.%s.light_damage" % spec.key
	damage.blueprint_id = blueprint.blueprint_id
	damage.state_kind = "light_damage"
	damage.remove_element_ids = PackedStringArray([
		"block_group.roof" if spec.key == "cottage" else "volume.roof"])
	damage.add_element_ids = PackedStringArray([
		"module.damage_rubble/damage_rubble.primary"])
	damage.material_role_overrides = {
		"material_role.wall_primary": "material.mvp.stone"}
	damage.surface_layer_ids = PackedStringArray(["surface.layer.scorch.stage5"])
	damage.repair_resource_ids = PackedStringArray(["material.mvp.wood"])
	damage.damage_ratio = 0.35
	damage.dependency_ids = PackedStringArray([blueprint.blueprint_id,
		"surface.layer.scorch.stage5"])
	_save(damage, "%s/state_%s_light_damage.tres" % [ROOT, spec.key])
	var repaired := ForgeBlueprintStateDefinition.new()
	repaired.state_id = "blueprint.state.%s.repaired" % spec.key
	repaired.blueprint_id = blueprint.blueprint_id
	repaired.state_kind = "repaired"
	repaired.parent_state_id = damage.state_id
	repaired.material_role_overrides = {
		"material_role.wall_secondary": "material.mvp.wood"}
	repaired.surface_layer_ids = PackedStringArray(["surface.layer.repair_patch.stage5"])
	repaired.repair_resource_ids = PackedStringArray(["material.mvp.wood",
		"material.mvp.stone"])
	repaired.dependency_ids = PackedStringArray([blueprint.blueprint_id,
		damage.state_id, "surface.layer.repair_patch.stage5"])
	_save(repaired, "%s/state_%s_repaired.tres" % [ROOT, spec.key])
	var altered := ForgeBlueprintStateDefinition.new()
	altered.state_id = "blueprint.state.%s.%s" % [spec.key,
		"corrupted" if spec.key == "rune_ruin" else "occupied"]
	altered.blueprint_id = blueprint.blueprint_id
	altered.state_kind = "corrupted" if spec.key == "rune_ruin" else "occupied"
	altered.surface_layer_ids = PackedStringArray([
		"surface.layer.corruption.stage5" if spec.key == "rune_ruin" \
		else "surface.layer.soot.stage5"])
	altered.dependency_ids = PackedStringArray([blueprint.blueprint_id,
		altered.surface_layer_ids[0]])
	_save(altered, "%s/state_%s_altered.tres" % [ROOT, spec.key])


func _construction_deltas(elements: Array[ForgeBlueprintElement]) \
		-> Array[ForgeConstructionDelta]:
	var result: Array[ForgeConstructionDelta] = []
	for stage_id in ["site", "foundation", "frame", "shell", "roof",
			"interior", "equipment", "complete"]:
		var delta := ForgeConstructionDelta.new()
		delta.delta_id = "delta.%s" % stage_id
		delta.stage_id = stage_id
		var adds: Array[String] = []
		for element in elements:
			if element.stage_id == stage_id and not element.optional:
				adds.append(element.element_id)
		delta.add_element_ids = PackedStringArray(adds)
		if not result.is_empty():
			delta.dependency_stage_ids = PackedStringArray([result[-1].stage_id])
		result.append(delta)
	return result


func _generate_surface_layers() -> void:
	for spec in [
		["soot", "mask.surface.soot", 0.0, 48, "accumulate_clamped"],
		["scorch", "mask.surface.scorch", 0.0, 32, "replace_weaker"],
		["corruption", "mask.surface.corruption", 0.0, 24, "accumulate_clamped"],
		["repair_patch", "mask.surface.scorch", 7200.0, 32, "replace_weaker"],
	]:
		var layer := ForgeSurfaceLayer.new()
		_common_presentation(layer, "surface.layer.%s.stage5" % spec[0],
			"%s Surface Layer" % str(spec[0]).capitalize())
		layer.layer_kind = spec[0]
		layer.surface_mask_role_id = spec[1]
		layer.persistence_policy = "persistent"
		layer.expiry_seconds = spec[2]
		layer.maximum_records_per_chunk = spec[3]
		layer.merge_policy = spec[4]
		layer.save_policy = "v17_optional_record"
		_save(layer, "%s/surface_layer_%s.tres" % [ROOT, spec[0]])


func _generate_acoustics() -> void:
	var specs := {
		"cottage": ["zone.audio.cottage_interior", "sound.event.golden.rain_shelter.stage4"],
		"warehouse": ["zone.audio.warehouse_interior", "sound.event.golden.village_ambience.stage4"],
		"workshop": ["zone.audio.workshop_interior", "sound.event.golden.furnace_lifecycle.stage4"],
		"watchtower": ["zone.audio.watchtower_interior", "sound.event.golden.rain_shelter.stage4"],
		"goblin_camp": ["zone.audio.goblin_camp", "sound.event.golden.goblin_raid.stage4"],
		"rune_ruin": ["zone.audio.rune_ruin", "sound.event.golden.mana_conduit.stage4"],
	}
	for key in specs:
		var target := _target(key)
		var value: Array = specs[key]
		var size: Vector3i = target.size
		var graph := ForgeAcousticZoneGraph.new()
		_common_presentation(graph, "acoustic.zone_graph.%s.stage5" % key,
			"%s Acoustic Zone Graph" % str(key).capitalize())
		graph.owner_blueprint_id = target.id
		graph.exterior_zone_id = "acoustic.zone.exterior"
		graph.zones = [{"zone_id": "acoustic.zone.%s.interior" % key,
			"zone_role_id": value[0], "minimum": [0, 0, 0],
			"maximum": [size.x, size.y, size.z], "exterior_bleed": 0.22,
			"profile_id": "acoustic.profile.%s.stage5" % key}]
		graph.portals = [{"portal_id": "acoustic.portal.%s.front_door" % key,
			"portal_role_id": "portal.audio.front_door",
			"from_zone_id": "acoustic.zone.%s.interior" % key,
			"to_zone_id": graph.exterior_zone_id, "openness": 0.0,
			"transmission": 0.78, "bidirectional": true}]
		if key == "workshop":
			graph.portals.append({"portal_id": "acoustic.portal.workshop.chimney",
				"portal_role_id": "portal.audio.chimney",
				"from_zone_id": "acoustic.zone.workshop.interior",
				"to_zone_id": graph.exterior_zone_id, "openness": 1.0,
				"transmission": 0.58, "bidirectional": true})
		graph.dependency_ids = PackedStringArray([target.id])
		_save(graph, "%s/acoustic_graph_%s.tres" % [ROOT, key])
		var profile := ForgeAcousticProfile.new()
		_common_presentation(profile, "acoustic.profile.%s.stage5" % key,
			"%s Acoustic Profile" % str(key).capitalize())
		profile.acoustic_kind = "zone"
		profile.zone_role_ids = PackedStringArray([value[0]])
		profile.portal_role_ids = PackedStringArray(["portal.audio.front_door"])
		profile.reverb_profile_id = "audio.snapshot.indoor_small.foundation"
		profile.transmission = 0.72
		profile.occlusion = 0.28
		profile.fallback_profile_id = "acoustic.profile.room.workshop.foundation"
		profile.dependency_ids = PackedStringArray([target.id])
		_save(profile, "%s/acoustic_profile_%s.tres" % [ROOT, key])
		var plan := ForgeAmbiencePlan.new()
		_common_presentation(plan, "acoustic.ambience.%s.stage5" % key,
			"%s Ambience Plan" % str(key).capitalize())
		plan.owner_blueprint_id = target.id
		plan.acoustic_graph_id = graph.stable_id
		plan.maximum_active_components = 4
		plan.components = [
			{"component_id": "bed", "sound_event_id": value[1],
				"priority": 20, "required_state": "occupied"},
			{"component_id": "weather", "sound_event_id":
				"sound.event.golden.rain_shelter.stage4", "priority": 30,
				"required_state": "raining"},
		]
		plan.dependency_ids = PackedStringArray([graph.stable_id, value[1],
			"sound.event.golden.rain_shelter.stage4"])
		_save(plan, "%s/ambience_plan_%s.tres" % [ROOT, key])


func _modules_for_target(key: String) -> Array[String]:
	match key:
		"cottage": return ["door", "window", "roof_ridge", "bed_cluster", "storage"]
		"warehouse": return ["door", "window", "storage", "storage", "scaffold"]
		"workshop": return ["door", "window", "workstation", "storage", "scaffold"]
		"watchtower": return ["door", "stairs_rail", "guard_post", "roof_ridge", "scaffold"]
		"bridge": return ["bridge_span", "bridge_span", "stairs_rail", "scaffold"]
		"goblin_camp": return ["wall_gate", "guard_post", "storage", "scaffold"]
		"rune_ruin": return ["wall_gate", "stairs_rail", "workstation", "scaffold"]
		"road_module": return ["bridge_span", "scaffold"]
		"farm_pen_module": return ["wall_gate", "storage", "workstation", "scaffold"]
	return []


func _element(id: String, kind: String, position: Vector3i, size: Vector3i,
		material_role_id: String, stage_id: String) -> ForgeBlueprintElement:
	var element := ForgeBlueprintElement.new()
	element.element_id = id
	element.element_kind = kind
	element.position = position
	element.size = size
	element.material_role_id = material_role_id
	element.stage_id = stage_id
	return element


func _common_presentation(definition: ForgePresentationDefinition,
		stable_id: String, display_name: String) -> void:
	definition.stable_id = stable_id
	definition.display_name = display_name
	definition.contract_version = "23-foundation-v1"
	definition.lifecycle = "golden_source_candidate"
	definition.source_status = "validated_runtime_candidate"
	definition.rights_status = "not_applicable_generated_data"
	definition.provenance = {"generator": "generate_set22_23_stage5_sources.gd",
		"visual_approval": "open", "listening_approval": "open"}


func _target(key: String) -> Dictionary:
	for spec in TARGETS:
		if spec.key == key:
			return spec
	return {}


func _save(resource: Resource, path: String) -> void:
	var error := ResourceSaver.save(resource, path)
	if error != OK:
		failures.append("%s:%s" % [path, error_string(error)])
	else:
		saved += 1
