extends Node
## Stage B contract: v5 camps, v17 records, safe parcels, construction work,
## directional placement, logical doors, population, and catalogue rotation.

const SitePreviewScript = preload(
	"res://scripts/world/settlement_site_preview.gd")

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	_check(VoxelWorld.WORLDGEN_VERSION == 5, "new worlds are not worldgen v5")
	_check(
		WorldStructurePlanner.VERSION == 4,
		"new regional plans are not version 4")
	_check(
		WorldManager.CURRENT_SAVE_VERSION == 18,
		"runtime save version is not v17")
	_check(
		WorldManager.NEW_WORLDGEN_VERSION == 5
			and WorldManager.NEW_PLAN_VERSION == 4,
		"WorldManager does not create v5/plan-v4 worlds")
	_check(
		VoxelWorld.REGIONAL_WORLDGEN_VERSION == 4
			and VoxelWorld.PRIOR_WORLDGEN_VERSION == 3
			and VoxelWorld.LEGACY_WORLDGEN_VERSION == 2,
		"legacy v3/v4 worldgen branches were not retained")

	for stable_id in [
		"item.tool.shovel_crude",
		"item.tool.shovel_stone",
		"item.tool.shovel_iron",
	]:
		var item_id := ItemRegistry.get_id_by_stable_id(stable_id)
		var profile := ItemRegistry.get_tool_profile(item_id)
		_check(
			item_id >= 0 and str(profile.get("class", "")) == "shovel",
			"%s is not a canonical shovel" % stable_id)
	_check(
		int(ItemRegistry.get_tool_profile(ItemRegistry.get_id_by_stable_id(
			"item.tool.shovel_crude")).get("level", -1)) == 0
			and int(ItemRegistry.get_tool_profile(ItemRegistry.get_id_by_stable_id(
				"item.tool.shovel_stone")).get("level", -1)) == 1
			and int(ItemRegistry.get_tool_profile(ItemRegistry.get_id_by_stable_id(
				"item.tool.shovel_iron")).get("level", -1)) == 2,
		"shovel tiers do not progress crude/stone/iron")
	_check(
		str(BlockRegistry.get_harvest_profile(
			BlockRegistry.get_id_by_stable_id("terrain.dirt.basic")).get(
				"tool", "")) == "shovel"
			and str(BlockRegistry.get_harvest_profile(
				BlockRegistry.get_id_by_stable_id("natural.log.oak")).get(
					"tool", "")) == "axe",
		"excavation tool classes are not shared by terrain and vegetation")

	var seed_value := 0x57A6E
	var planner := WorldStructurePlanner.new()
	planner.generate(seed_value, WorldStructurePlanner.VERSION)
	var starter_hamlet := _starter_hamlet(planner)
	_check(not starter_hamlet.is_empty(), "v5 plan has no starter settlement")
	var layout := planner.settlement_layout(starter_hamlet)
	_check(
		str(layout.get("initial_stage", "")) == "camp",
		"v5 settlement does not begin at Camp")
	_check(
		(layout.get("tents", []) as Array).size() == 2,
		"v5 Camp does not contain two tents")
	_check(
		(layout.get("roads", []) as Array).size() >= 5,
		"Camp fixtures are not connected to the initial route graph")
	var bed_capacity := 0
	var job_capacity := 0
	for plot_value in layout.get("plots", []):
		var plot: Dictionary = plot_value
		bed_capacity += int(plot.get("bed_capacity", 0))
		job_capacity += int(plot.get("job_capacity", 0))
	_check(bed_capacity == 4, "Camp does not provide exactly four initial beds")
	_check(job_capacity == 4, "Camp does not provide four generalist job slots")

	var legacy_planner := WorldStructurePlanner.new()
	legacy_planner.generate(seed_value, WorldStructurePlanner.LEGACY_VERSION)
	_check(
		int(legacy_planner.save_manifest().get("version", 0)) == 3
			and int(planner.save_manifest().get("version", 0)) == 4,
		"plan-v3 and plan-v4 manifests are not separately preserved")
	_check(
		legacy_planner.identity() != planner.identity(),
		"legacy and Stage B plan identities collide")
	var valley_v1 := ValleyPlan.new()
	valley_v1.generate(1337, ValleyPlan.VERSION)
	_check(
		valley_v1.identity()
			== "world.profile.controlled_poc_valley:v1:782cffcb",
		"worldgen-v2/plan-v1 fixture hash changed")
	var valley_v2_a := ValleyPlan.new()
	var valley_v2_b := ValleyPlan.new()
	valley_v2_a.generate(23063, ValleyPlan.CURRENT_VERSION)
	valley_v2_b.generate(23063, ValleyPlan.CURRENT_VERSION)
	_check(
		valley_v2_a.identity() == valley_v2_b.identity()
			and valley_v2_a.identity().begins_with(
				"world.profile.controlled_poc_valley:v2:"),
		"worldgen-v3/plan-v2 fixture is not stable")
	var regional_v3_fixture := WorldStructurePlanner.new()
	regional_v3_fixture.generate(23063, WorldStructurePlanner.LEGACY_VERSION)
	_check(
		regional_v3_fixture.identity()
			== "world.profile.controlled_poc_regional:v3:36715de5",
		"worldgen-v4/plan-v3 fixture hash changed")

	SettlementManager.reset()
	_check(
		SettlementManager.initialize_sites(
			seed_value, planner, [starter_hamlet]),
		"SettlementManager could not initialize a v5 Camp")
	var settlement_id := SettlementManager.focused_settlement_id
	var settlement := SettlementManager.get_settlement(settlement_id)
	_check(str(settlement.get("stage", "")) == "camp", "runtime stage is not Camp")
	_check(
		HamletState.get_npc_ids().size() == 3,
		"Camp did not create exactly three adult generalists")
	_check(
		HamletState.get_npc_ids().all(func(resident_id: String) -> bool:
			var resident := HamletState.get_npc_record(resident_id)
			return (
				str(resident.get("age_band", "")) == "adult"
				and not str(resident.get("residence_id", "")).is_empty()
				and not str(resident.get("bed_id", "")).is_empty()
				and not str(resident.get(
					"job_assignment_id", "")).is_empty()
				and resident.get("personal_inventory", []) is Array
				and resident.get("transaction_history", []) is Array)),
		"founders lack resident, bed, job, inventory, or transaction records")
	var population := SettlementManager.get_population_report(settlement_id)
	_check(
		int(population.get("population", 0)) == 3
			and int(population.get("valid_beds", 0)) == 4
			and int(population.get("valid_adult_jobs", 0)) == 4,
		"Camp population report does not conserve people/beds/jobs")
	_check(
		int(population.get("permanent_beds", -1)) == 0,
		"temporary tents were incorrectly treated as permanent family housing")
	_check(
		int(population.get("permanent_housing_pressure", -1)) == 4,
		"Camp did not report permanent housing for every resident plus a reserve")
	var proposals := SettlementManager.get_project_proposals(settlement_id)
	_check(
		proposals.size()
			== SettlementContentRegistry.construction_projects.size()
				+ SettlementContentRegistry.plan_specs.size(),
		"proposal interface does not list all 120 projects and 13 plans")
	_check(
		proposals.any(func(value: Dictionary) -> bool:
			return (
				str(value.get("id", ""))
					== "project.build.wooden_watchtower"))
			and proposals.any(func(value: Dictionary) -> bool:
				return (
					str(value.get("id", ""))
						== "project.build.small_cottage")),
		"watchtower completion path or permanent housing proposal is missing")
	var recommended := SettlementManager.get_recommended_project(settlement_id)
	_check(str(recommended.get("primary_need", "")) == "housing",
		"needs planner did not prioritise permanent housing at the Camp")
	var migration := SettlementManager.evaluate_population_day(
		settlement_id, "migration")
	_check(
		bool(migration.get("ok", false))
			and HamletState.get_npc_ids().size() == 4,
		"forced migration did not consume the spare Camp bed and job")
	_check(
		SettlementManager.POPULATION_GATES == {
			"camp": 3,
			"hamlet": 4,
			"village": 8,
			"fortified_village": 12,
			"town": 20,
			"city": 32,
			"capital": 48,
			"magical_metropolis": 64,
		},
		"population gates drifted from the Stage B contract")
	var collection := SettlementManager.serialize_state()
	_check(
		int(collection.get("version", 0)) == 2
			and collection.get("settlements", {}) is Dictionary,
		"settlement collection omitted Stage B runtime records")

	var player := Player.new()
	for expected in [
		[0.0, 2],
		[-PI * 0.5, 3],
		[-PI, 0],
		[-PI * 1.5, 1],
	]:
		player.set("_yaw", float(expected[0]))
		_check(
			int(player.call("_placement_facing")) == int(expected[1]),
			"placement facing did not apply 180-degree world-Y yaw")
	player.free()
	_check(
		HamletNpcActor.JUMP_VELOCITY > 0.0
			and HamletNpcActor.RECOVERY_SECONDS
				> HamletNpcActor.REPLAN_SECONDS
			and HamletNpcActor.MAX_SAFE_DROP == 2,
		"NPC shared navigation lacks jump or persistent stuck recovery")

	var world := VoxelWorld.new()
	world.set_process(false)
	add_child(world)
	world.start(seed_value, {
		"worldgen_version": VoxelWorld.WORLDGEN_VERSION,
		"plan_version": WorldStructurePlanner.VERSION,
	})
	SettlementManager.bind_world(world)
	var camp_anchor_values: Array = settlement.get("anchor", [])
	var camp_anchor := Vector2i(
		int(camp_anchor_values[0]), int(camp_anchor_values[1]))
	var test_point := camp_anchor + Vector2i(22, 18)
	world.prepare_player_column(Vector3(
		test_point.x,
		world.surface_height_at(test_point.x, test_point.y) + 2.0,
		test_point.y))
	var ground := world.surface_height_at(test_point.x, test_point.y)
	for dx in range(-5, 6):
		for dz in range(-5, 6):
			var column := Vector2i(test_point.x + dx, test_point.y + dz)
			var surface := world.surface_height_at(column.x, column.y)
			for y in range(surface + 1, ground + 1):
				world.set_block_with_provenance(
					Vector3i(column.x, y, column.y),
					BlockRegistry.get_id_by_stable_id("terrain.dirt.basic"),
					"probe.site", "lab", settlement_id, "probe.site")
			for y in range(ground + 1, maxi(surface, ground) + 7):
				world.set_block_with_provenance(
					Vector3i(column.x, y, column.y), BlockRegistry.AIR,
					"probe.site", "lab", settlement_id, "probe.site")
	var survey := SettlementManager.survey_project_site(
		settlement_id, "project.build.small_cottage",
		Vector3i(test_point.x, ground, test_point.y), 90, "player", true)
	_check(
		str(survey.get("validation_result", "")) == "valid",
		"flat cottage survey failed: %s" % [
			str(survey.get("validation_reasons", []))])
	_check(
		not str(survey.get("plan_hash", "")).is_empty()
			and int(survey.get("clearance_above", 0)) == 2
			and int(survey.get("terrain_apron", 0)) == 3,
		"survey omitted its deterministic clearance/apron contract")
	_check(
		survey.has("cut_cells") and survey.has("fill_cells")
			and survey.has("tool_requirements")
			and survey.has("expected_drops")
			and survey.has("collisions"),
		"survey omitted terrain, tool, drop, or collision records")
	var route: Dictionary = survey.get("route_plan", {})
	_check(
		bool(route.get("valid", false))
			and int(route.get("maximum_step", 99)) <= 1
			and bool(route.get("physical_path", false))
			and str(route.get("surface_block_id", "")) == "road.path.dirt",
		"survey route is disconnected, abstract, or exceeds one-block grade")
	var confirmation := SettlementManager.confirm_project_site(
		settlement_id, survey)
	_check(
		bool(confirmation.get("ok", false)),
		"valid survey could not create an ID-scoped project")
	var package_kinds: Array[String] = []
	for package_value in confirmation.get("work_packages", []):
		package_kinds.append(str(package_value.get("kind", "")))
	_check(
		package_kinds.slice(0, 3) == ["route", "vegetation", "terrain"]
			and package_kinds[-1] == "activation"
			and "blueprint_stage" in package_kinds,
		"construction work-package order is incomplete")
	var visual_survey := survey.duplicate(true)
	visual_survey["plan_hash"] = "%s.visual" % str(survey.get("plan_hash", ""))
	visual_survey["cut_cells"] = [[test_point.x, ground + 1, test_point.y]]
	visual_survey["fill_cells"] = [[test_point.x + 1, ground, test_point.y]]
	var site_preview: SettlementSitePreview = SitePreviewScript.new()
	add_child(site_preview)
	_check(site_preview.apply_survey(visual_survey),
		"site survey could not create its in-world explanation overlay")
	var preview_snapshot := site_preview.visual_snapshot()
	_check(
		int(preview_snapshot.get("clear_cells", 0)) >= 1
			and int(preview_snapshot.get("fill_cells", 0)) >= 1
			and int(preview_snapshot.get("route_cells", 0)) >= 1
			and int(preview_snapshot.get("footprint_cells", 0)) >= 1,
		"site overlay omitted clear, fill, route, or footprint markers")
	var clear_marker: MultiMeshInstance3D = site_preview.get_node(
		"ClearTerrain")
	var clear_material: StandardMaterial3D = clear_marker.multimesh.mesh.material
	_check(clear_material.albedo_color.a <= 0.20
			and not clear_material.no_depth_test,
		"site overlay remained opaque or visible through overlapping terrain")
	site_preview.queue_free()

	var route_package: Dictionary = confirmation.get("work_packages", [])[0]
	var route_cells: Array = route_package.get("cells", [])
	_check(bool(route_package.get("physical_path", false))
			and bool(route_package.get("connects_existing_route", false))
			and str(route_package.get("surface_block_id", "")) \
				== "road.path.dirt"
			and str(route_package.get("display_name", "")) \
				== "Build physical footpath to building entrance",
		"access work package is not an explicit physical footpath stage")
	var worker_route_values: Array = route_cells.front()
	var worker_route_cell := Vector3i(
		int(worker_route_values[0]), int(worker_route_values[1]),
		int(worker_route_values[2]))
	world.prepare_player_column(Vector3(worker_route_cell) + Vector3.UP * 2.0)
	var route_step := SettlementManager._perform_package_step(
		settlement_id,
		str(confirmation.get("project_instance_id", "")),
		route_package, survey, "")
	_check(bool(route_step.get("ok", false))
			and BlockRegistry.get_stable_id(
				world.get_persisted_block_id(worker_route_cell)) \
				== "road.path.dirt",
		"footpath stage did not place a physical path block in the world")
	var player_route_values: Array = route_cells.back()
	var player_route_cell := Vector3i(
		int(player_route_values[0]), int(player_route_values[1]),
		int(player_route_values[2]))
	world.prepare_player_column(Vector3(player_route_cell) + Vector3.UP * 2.0)
	var path_id := BlockRegistry.get_id_by_stable_id("road.path.dirt")
	_check(world.set_block_with_provenance(
			player_route_cell, path_id, "player.place", "player"),
		"player could not commit a physical access-path contribution")
	var player_contribution := SettlementManager.record_player_project_edit(
		settlement_id, player_route_cell)
	_check(
		bool(player_contribution.get("ok", false))
			and bool(player_contribution.get("recorded", false)),
		"physical player edit did not count toward site preparation")

	var door_horizontal := Vector2i(
		world.chunk_coord(test_point.x) * VoxelWorld.CHUNK_SIZE + 8,
		world.chunk_coord(test_point.y) * VoxelWorld.CHUNK_SIZE + 8)
	world.prepare_player_column(Vector3(
		door_horizontal.x,
		world.surface_height_at(door_horizontal.x, door_horizontal.y) + 2.0,
		door_horizontal.y))
	var door_ground := world.surface_height_at(
		door_horizontal.x, door_horizontal.y)
	var door_base := Vector3i(
		door_horizontal.x, door_ground + 1, door_horizontal.y)
	for dx in range(-1, 2):
		for dz in range(-1, 2):
			for dy in range(0, 3):
				world.set_block_with_provenance(
					door_base + Vector3i(dx, dy, dz), BlockRegistry.AIR,
					"probe.door.clear", "lab", settlement_id,
					"probe.door.clear")
	var door_id := BlockRegistry.get_id_by_stable_id("construction.door.oak")
	_check(
		world.place_door(
			door_base, door_id, 0, 0, "probe.door", "lab",
			settlement_id, "probe.door"),
		("logical two-block door could not be placed: id=%d shape=%s "
			+ "loaded=%s/%s blocks=%d/%d") % [
				door_id,
				BlockRegistry.get_shape(door_id),
				world.is_voxel_loaded_at(door_base),
				world.is_voxel_loaded_at(door_base + Vector3i.UP),
				world.get_persisted_block_id(door_base),
				world.get_persisted_block_id(door_base + Vector3i.UP),
			])
	_check(
		world.is_door_at(door_base)
			and world.is_door_at(door_base + Vector3i.UP)
			and int(world.get_door_record(door_base).get("hinge", -1)) == 0,
		"door halves do not share facing/hinge state")
	_check(
		world.toggle_door(door_base, "probe.actor")
			and bool(world.get_door_record(door_base).get("open", false))
			and str(world.get_door_record(door_base).get(
				"last_actor_id", "")) == "probe.actor",
		"door did not open for an actor")
	_check(
		world.toggle_door(door_base + Vector3i.UP, "probe.actor")
			and not bool(world.get_door_record(door_base).get("open", true)),
		"right-clicking the upper door half did not close the same door")
	_check(
		(world.serialize_block_entities().get("__doors__", []) as Array).size()
			>= 1,
		"door facing/hinge/open state is not serializable")

	var provenance_cell := door_base + Vector3i(3, 0, 0)
	var previous_id := world.get_persisted_block_id(provenance_cell)
	var cobble_id := BlockRegistry.get_id_by_stable_id(
		"construction.cobble.stone")
	_check(
		world.set_block_with_provenance(
			provenance_cell, cobble_id, "probe.claim", "project",
			settlement_id, "probe.claim")
			and str(world.get_edit_provenance(provenance_cell).get(
				"source_type", "")) == "project",
		"project voxel edit provenance was not recorded: loaded=%s prior=%d"
			% [
				world.is_voxel_loaded_at(provenance_cell),
				previous_id,
			])
	var reverted := world.revert_provenance_claim("probe.claim")
	_check(
		bool(reverted.get("ok", false))
			and world.get_persisted_block_id(provenance_cell) == previous_id,
		"project claim could not restore its previous voxel")

	var rotation_failures: Array[String] = []
	var project_ids: Array = (
		SettlementContentRegistry.construction_projects.keys())
	project_ids.sort()
	for project_value in project_ids:
		var project_id := str(project_value)
		var project := SettlementContentRegistry.get_project(project_id)
		var stages: Array = project.get("stages", [])
		for rotation in [0, 90, 180, 270]:
			var occupied := {}
			var valid := not stages.is_empty()
			for stage_value in stages:
				var placements := world.get_project_stage_placements(
					project_id, int(stage_value.get("index", 0)),
					Vector3i.ZERO, {}, rotation)
				valid = valid and not placements.is_empty()
				for placement in placements:
					var position: Vector3i = placement["position"]
					var key := "%d:%d:%d" % [
						position.x, position.y, position.z]
					occupied[key] = true
					if world.is_door_id(int(placement["block_id"])):
						var upper := position + Vector3i.UP
						var upper_key := "%d:%d:%d" % [
							upper.x, upper.y, upper.z]
						if occupied.has(upper_key):
							valid = false
			_check(
				valid,
				"%s failed authored expansion at rotation %d" % [
					project_id, rotation])
			if not valid:
				rotation_failures.append("%s:%d" % [project_id, rotation])
	_check(
		project_ids.size() == 120 and rotation_failures.is_empty(),
		"all 120 projects did not pass four-rotation expansion")
	_check(
		SettlementContentRegistry.plan_specs.size() == 13,
		"all 13 plan graphs are not present")
	_check(
		VillageProgressionQuestGuide.STEPS.size() >= 30,
		"lab quest does not cover the complete Stage B progression")
	_check(
		FileAccess.file_exists(
			"res://development/village_progression_lab.tscn"),
		"isolated village progression lab scene is missing")

	var before_housing_handoff := SettlementManager.get_population_report(
		settlement_id)
	var primitive_project_id := ""
	for project_id_value in HamletState.runtime_projects:
		if str((HamletState.runtime_projects[project_id_value] as Dictionary).get(
				"definition_id", "")) == HamletState.PRODUCTION_PROJECT_ID:
			primitive_project_id = str(project_id_value)
			break
	_check(not primitive_project_id.is_empty()
			and HamletState.activate_project_instance(primitive_project_id),
		"initial primitive hut project was unavailable for completion handoff")
	var completed_project := HamletState.project.duplicate(true)
	completed_project["stage"] = "complete"
	completed_project["complete"] = true
	completed_project["awaiting_supplies"] = false
	HamletState.project = completed_project
	var completed_project_id := str(completed_project.get("instance_id", ""))
	HamletState.runtime_projects[completed_project_id] = completed_project
	HamletState._activate_project_building()
	var project_position: Array = completed_project.get("position", [])
	var completion_anchor := Vector3i(
		int(project_position[0]),
		world.surface_height_at(
			int(project_position[0]), int(project_position[1])),
		int(project_position[1]))
	var handoff := SettlementManager.register_completed_project(
		settlement_id, completed_project_id, completion_anchor)
	var housed_population := SettlementManager.get_population_report(settlement_id)
	var permanently_housed := HamletState.get_npc_ids().filter(
		func(resident_id: String) -> bool:
			var resident := HamletState.get_npc_record(resident_id)
			var bed: Dictionary = SettlementManager.get_settlement(
				settlement_id).get("bed_slots", {}).get(
					str(resident.get("bed_id", "")), {})
			return bool(bed.get("permanent", false))).size()
	_check(bool(handoff.get("ok", false))
			and int(housed_population.get("permanent_beds", 0))
				== int(before_housing_handoff.get("permanent_beds", 0)) + 3
			and permanently_housed
				== mini(3, int(housed_population.get("population", 0))),
		"completed primitive hut did not register and assign its three homes")
	var remaining_housing_pressure := maxi(0,
		int(housed_population.get("population", 0)) + 1
			- int(housed_population.get("permanent_beds", 0)))
	var next_recommendation := SettlementManager.get_recommended_project(
		settlement_id)
	_check(int(housed_population.get("permanent_housing_pressure", -1))
			== remaining_housing_pressure
			and not next_recommendation.is_empty()
			and (remaining_housing_pressure > 0
				and str(next_recommendation.get("primary_need", "")) == "housing"
				or remaining_housing_pressure == 0
				and str(next_recommendation.get("primary_need", "")) != "housing"),
		"planner did not advance from housing to the next unmet village need")

	world.queue_free()
	await get_tree().process_frame
	SettlementManager.reset()
	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"projects": project_ids.size(),
		"rotations": 4,
	}
	print("STAGEB_LIVING_SETTLEMENT_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if failures.is_empty() else 1)


func _starter_hamlet(planner: WorldStructurePlanner) -> Dictionary:
	for site_value in planner.starter_sites:
		var site: Dictionary = site_value
		if str(site.get("type_id", "")) == "hamlet":
			return site.duplicate(true)
	return {}
