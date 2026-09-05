class_name SettlementTerrainPlanner
extends RefCounted
## Shared deterministic parcel, route, and work-package planner.
##
## The planner is deliberately read-only. A confirmed project owns the survey
## and its work packages; VoxelWorld remains the only authority that mutates
## blocks and records provenance.

const CLEARANCE_MARGIN := 1
const CLEARANCE_ABOVE := 2
const TERRAIN_APRON := 3
const MAX_AUTOMATIC_CUT_FILL := 6
const MAX_ROUTE_NODES := 8192
const MAX_ROUTE_GRADE := 6
const ROUTE_MARGIN := 24
const PHYSICAL_FOOTPATH_BLOCK_ID := "road.path.dirt"
const TERRAIN_FILL_BLOCK_ID := "construction.cobble.stone"

const VEGETATION_IDS: Array[String] = [
	"natural.log.oak",
	"natural.leaves.oak",
]
const SHOVEL_BLOCKS: Array[String] = [
	"terrain.grass.basic",
	"terrain.dirt.basic",
	"terrain.sand.basic",
	"terrain.gravel.basic",
	"terrain.clay.basic",
	"terrain.snow.basic",
]

var world: VoxelWorld


func configure(p_world: VoxelWorld) -> SettlementTerrainPlanner:
	world = p_world
	return self


func survey_project_site(
		settlement_id: String,
		project_id: String,
		anchor: Vector3i,
		rotation: int = 0,
		placement_mode: String = "village",
		confirmed_player_overlap: bool = false) -> Dictionary:
	var project := SettlementContentRegistry.get_project(project_id)
	if world == null:
		return _invalid_survey(
			settlement_id, project_id, anchor, rotation, "world_not_configured")
	if project.is_empty():
		return _invalid_survey(
			settlement_id, project_id, anchor, rotation, "unknown_project")
	var blueprint_id := str(project.get("blueprint_id", ""))
	var blueprint := SettlementContentRegistry.get_blueprint(blueprint_id)
	if blueprint.is_empty():
		return _invalid_survey(
			settlement_id, project_id, anchor, rotation, "unknown_blueprint")

	var footprint := _rotated_footprint(blueprint, rotation)
	var surface_heights: Array[int] = []
	var water_cells: Array[Array] = []
	for x in range(footprint.position.x, footprint.end.x):
		for z in range(footprint.position.y, footprint.end.y):
			var gx := anchor.x + x
			var gz := anchor.z + z
			var height := world.surface_height_at(gx, gz)
			surface_heights.append(height)
			if BlockRegistry.is_water(world.get_persisted_block_id(
					Vector3i(gx, height, gz))):
				water_cells.append([gx, height, gz])
	surface_heights.sort()
	var median_height := anchor.y
	if not surface_heights.is_empty():
		median_height = surface_heights[surface_heights.size() / 2]
	var base_elevation := maxi(anchor.y, median_height)
	if not water_cells.is_empty():
		base_elevation = maxi(base_elevation, VoxelWorld.SEA_LEVEL + 1)

	var footprint_cells: Array[Array] = []
	var clearance_cells: Array[Array] = []
	var cut_cells: Array[Array] = []
	var fill_cells: Array[Array] = []
	var vegetation_removal: Array[Array] = []
	var player_collisions: Array[Dictionary] = []
	var protected_collisions: Array[Dictionary] = []
	var expected_drops := {}
	var tool_requirements := {}
	var clearance_tool_requirements := {}
	var clearance_expected_drops := {}
	var maximum_delta := 0
	var bounds := Rect2i(
		footprint.position - Vector2i(CLEARANCE_MARGIN, CLEARANCE_MARGIN),
		footprint.size + Vector2i(CLEARANCE_MARGIN * 2, CLEARANCE_MARGIN * 2))
	var blueprint_bounds: Dictionary = blueprint.get("bounds", {})
	var blueprint_max: Array = blueprint_bounds.get("max", [0, 1, 0])
	var authored_height := maxi(1, int(blueprint_max[1]) + 1)

	for x in range(bounds.position.x, bounds.end.x):
		for z in range(bounds.position.y, bounds.end.y):
			var gx := anchor.x + x
			var gz := anchor.z + z
			var surface := world.surface_height_at(gx, gz)
			maximum_delta = maxi(maximum_delta, absi(surface - base_elevation))
			var inside := footprint.has_point(Vector2i(x, z))
			if inside:
				footprint_cells.append([gx, base_elevation, gz])
			if surface < base_elevation:
				for y in range(surface, base_elevation):
					fill_cells.append([gx, y, gz])
			elif surface > base_elevation:
				for y in range(base_elevation, surface + 1):
					var position := Vector3i(gx, y, gz)
					var block_id := world.get_persisted_block_id(position)
					if BlockRegistry.is_air(block_id) \
							or BlockRegistry.is_water(block_id):
						continue
					_record_clear_cell(
						position, block_id, cut_cells, vegetation_removal,
						tool_requirements, expected_drops)
					_record_collision(
						position, block_id, settlement_id,
						player_collisions, protected_collisions)
			var clear_top := base_elevation + authored_height + CLEARANCE_ABOVE
			for y in range(base_elevation + 1, clear_top + 1):
				var position := Vector3i(gx, y, gz)
				var block_id := world.get_persisted_block_id(position)
				if BlockRegistry.is_air(block_id) \
						or BlockRegistry.is_water(block_id):
					continue
				clearance_cells.append([gx, y, gz])
				_record_harvest_requirements(
					position, block_id, clearance_tool_requirements,
					clearance_expected_drops)
				_record_collision(
					position, block_id, settlement_id,
					player_collisions, protected_collisions)

	var reasons: Array[String] = []
	var guidance: Array[String] = []
	if maximum_delta > MAX_AUTOMATIC_CUT_FILL and placement_mode == "village":
		reasons.append("terrain_cost_exceeds_automatic_limit:%d" % maximum_delta)
		guidance.append("player_clear_or_fill_highlighted_site")
	if not protected_collisions.is_empty():
		reasons.append(
			"protected_structure_collision:%d" % protected_collisions.size())
	if not player_collisions.is_empty() and placement_mode == "village":
		reasons.append("player_edit_collision:%d" % player_collisions.size())
	if not player_collisions.is_empty() \
			and placement_mode == "player" \
			and not confirmed_player_overlap:
		reasons.append(
			"player_overlap_confirmation_required:%d" % player_collisions.size())

	var road_socket := _road_socket(blueprint, anchor, rotation)
	var route_plan := plan_access_route(
		settlement_id,
		_nearest_route_origin(settlement_id, road_socket),
		road_socket)
	if not bool(route_plan.get("valid", false)):
		reasons.append_array(route_plan.get("validation_reasons", []))

	var survey := {
		"record_type": "SiteSurvey",
		"version": 1,
		"settlement_id": settlement_id,
		"project_id": project_id,
		"blueprint_id": blueprint_id,
		"placement_mode": placement_mode,
		"rotation": posmod(rotation, 360),
		"anchor": [anchor.x, base_elevation, anchor.z],
		"footprint": _rect_record(footprint, anchor),
		"clearance_envelope": _rect_record(bounds, anchor),
		"clearance_above": CLEARANCE_ABOVE,
		"terrain_apron": TERRAIN_APRON,
		"base_elevation": base_elevation,
		"maximum_terrain_delta": maximum_delta,
		"footprint_cells": footprint_cells,
		"clearance_cells": _unique_cells(clearance_cells),
		"cut_cells": _unique_cells(cut_cells),
		"fill_cells": _unique_cells(fill_cells),
		"fill_block_id": TERRAIN_FILL_BLOCK_ID,
		"vegetation_removal": _unique_cells(vegetation_removal),
		"water_cells": water_cells,
		"foundation_mode": (
			"raised_supports" if not water_cells.is_empty() else
			"cut_fill_blended"),
		"route_plan": route_plan,
		"collisions": {
			"player": player_collisions,
			"protected": protected_collisions,
		},
		"tool_requirements": tool_requirements,
		"expected_drops": expected_drops,
		"clearance_tool_requirements": clearance_tool_requirements,
		"clearance_expected_drops": clearance_expected_drops,
		"site_preparation": {
			"clear_count": _unique_cells(cut_cells).size()
				+ _unique_cells(vegetation_removal).size(),
			"clearance_count": _unique_cells(clearance_cells).size(),
			"fill_count": _unique_cells(fill_cells).size(),
			"route_count": (route_plan.get("cells", []) as Array).size(),
			"automatic_terrain_limit": MAX_AUTOMATIC_CUT_FILL,
			"player_can_contribute": true,
			"guidance": guidance,
		},
		"requires_overlap_confirmation": (
			not player_collisions.is_empty() and not confirmed_player_overlap),
		"validation_reasons": reasons,
		"validation_result": "valid" if reasons.is_empty() else "invalid",
	}
	survey["plan_hash"] = _stable_hash(survey)
	return survey


func plan_access_route(
		settlement_id: String,
		from_position: Vector3i,
		to_position: Vector3i) -> Dictionary:
	if world == null:
		return _invalid_route(settlement_id, "world_not_configured")
	var start := Vector2i(from_position.x, from_position.z)
	var goal := Vector2i(to_position.x, to_position.z)
	var minimum := Vector2i(
		mini(start.x, goal.x) - ROUTE_MARGIN,
		mini(start.y, goal.y) - ROUTE_MARGIN)
	var maximum := Vector2i(
		maxi(start.x, goal.x) + ROUTE_MARGIN,
		maxi(start.y, goal.y) + ROUTE_MARGIN)
	var open: Array[Vector2i] = [start]
	var open_set := {_point_key(start): true}
	var came_from := {}
	var g_score := {_point_key(start): 0.0}
	var visited := 0
	var found := false
	while not open.is_empty() and visited < MAX_ROUTE_NODES:
		var best_index := 0
		var best_score := INF
		for index in open.size():
			var point := open[index]
			var point_key := _point_key(point)
			var score := float(g_score.get(point_key, INF)) \
				+ float(point.distance_to(goal))
			if score < best_score \
					or (is_equal_approx(score, best_score)
						and point_key < _point_key(open[best_index])):
				best_index = index
				best_score = score
		var current := open[best_index]
		open.remove_at(best_index)
		open_set.erase(_point_key(current))
		visited += 1
		if current == goal:
			found = true
			break
		var current_height := world.surface_height_at(current.x, current.y)
		for offset in [
			Vector2i.RIGHT, Vector2i.DOWN, Vector2i.LEFT, Vector2i.UP,
		]:
			var neighbor: Vector2i = current + offset
			if neighbor.x < minimum.x or neighbor.x > maximum.x \
					or neighbor.y < minimum.y or neighbor.y > maximum.y:
				continue
			var neighbor_height := world.surface_height_at(neighbor.x, neighbor.y)
			var height_delta := absi(neighbor_height - current_height)
			if height_delta > MAX_ROUTE_GRADE:
				continue
			var block_id := world.get_persisted_block_id(Vector3i(
				neighbor.x, neighbor_height, neighbor.y))
			if BlockRegistry.is_water(block_id):
				continue
			var neighbor_key := _point_key(neighbor)
			var tentative := float(g_score[_point_key(current)]) \
				+ 1.0 + float(height_delta) * 0.35
			if tentative >= float(g_score.get(neighbor_key, INF)):
				continue
			came_from[neighbor_key] = current
			g_score[neighbor_key] = tentative
			if not open_set.has(neighbor_key):
				open.append(neighbor)
				open_set[neighbor_key] = true
	if not found:
		return _invalid_route(
			settlement_id, "no_traversable_route_within_grade_limit")

	var reversed: Array[Vector2i] = [goal]
	var cursor := goal
	while cursor != start:
		var cursor_key := _point_key(cursor)
		if not came_from.has(cursor_key):
			return _invalid_route(settlement_id, "route_reconstruction_failed")
		cursor = Vector2i(came_from[cursor_key])
		reversed.append(cursor)
	reversed.reverse()
	var cells: Array[Array] = []
	var maximum_step := 0
	for point in reversed:
		var y := world.surface_height_at(point.x, point.y)
		if not cells.is_empty():
			maximum_step = maxi(maximum_step, absi(y - int(cells.back()[1])))
		cells.append([point.x, y, point.y])
	var route := {
		"record_type": "RoutePlan",
		"version": 1,
		"settlement_id": settlement_id,
		"from": [from_position.x, from_position.y, from_position.z],
		"to": [to_position.x, to_position.y, to_position.z],
		"cells": cells,
		"physical_path": true,
		"surface_block_id": PHYSICAL_FOOTPATH_BLOCK_ID,
		"maximum_step": maximum_step,
		"visited_nodes": visited,
		"valid": true,
		"validation_reasons": [],
	}
	route["plan_hash"] = _stable_hash(route)
	return route


func compile_work_packages(survey: Dictionary) -> Array[Dictionary]:
	if str(survey.get("validation_result", "invalid")) != "valid":
		return []
	var project := SettlementContentRegistry.get_project(str(
		survey.get("project_id", "")))
	if project.is_empty():
		return []
	var project_id := str(project.get("id", survey.get("project_id", "")))
	var settlement_id := str(survey.get("settlement_id", ""))
	var packages: Array[Dictionary] = []
	var route_plan: Dictionary = survey.get("route_plan", {})
	var route_cells: Array = route_plan.get("cells", [])
	var path_block_id := str(route_plan.get(
		"surface_block_id", PHYSICAL_FOOTPATH_BLOCK_ID))
	var route_package := _work_package(
		settlement_id, project_id, "route", 0,
		"Build physical footpath to building entrance", route_cells,
		{path_block_id: maxi(1, route_cells.size())})
	route_package["physical_path"] = true
	route_package["surface_block_id"] = path_block_id
	route_package["path_amount"] = maxi(1, route_cells.size())
	route_package["connects_existing_route"] = not route_cells.is_empty()
	route_package["phase"] = "site_preparation"
	route_package["phase_label"] = "Site Preparation"
	route_package["substage"] = "footpath"
	packages.append(route_package)
	packages.append(_site_prep_package(
		settlement_id, project_id, "vegetation", 1,
		"Clear vegetation", survey.get("vegetation_removal", []),
		{}, survey.get("tool_requirements", {}), "clearing"))
	packages.append(_site_prep_package(
		settlement_id, project_id, "terrain", 2,
		"Excavate and cut terrain", survey.get("cut_cells", []),
		{}, survey.get("tool_requirements", {}), "clearing"))
	packages.append(_site_prep_package(
		settlement_id, project_id, "clearance", 3,
		"Clear above-footprint obstructions", survey.get("clearance_cells", []),
		{}, survey.get("clearance_tool_requirements", {}), "clearance"))
	var fill_block_id := str(survey.get("fill_block_id", TERRAIN_FILL_BLOCK_ID))
	var fill_count := (survey.get("fill_cells", []) as Array).size()
	var fill_requirements := {}
	if fill_count > 0:
		fill_requirements[fill_block_id] = fill_count
	var fill_package: Dictionary = _site_prep_package(
		settlement_id, project_id, "fill", 4,
		"Fill and level support gaps", survey.get("fill_cells", []),
		fill_requirements, {}, "fill")
	fill_package["fill_block_id"] = fill_block_id
	fill_package["fill_amount"] = fill_count
	packages.append(fill_package)
	for stage_value in project.get("stages", []):
		var stage: Dictionary = stage_value
		var blueprint_package := _work_package(
			settlement_id, project_id, "blueprint_stage",
			packages.size(),
			str(stage.get("display_name", stage.get("id", "Build"))),
			[], _requirement_counts(stage.get("requirements", [])), {},
			str(stage.get("id", "")))
		blueprint_package["phase"] = "construction"
		blueprint_package["phase_label"] = "Construction"
		packages.append(blueprint_package)
	var activation_package := _work_package(
		settlement_id, project_id, "activation",
		packages.size(), "Validate access, doors, markers, housing, "
			+ "utilities, and activation", [], {})
	activation_package["phase"] = "activation"
	activation_package["phase_label"] = "Activation"
	packages.append(activation_package)
	for index in packages.size():
		packages[index]["package_index"] = index
		packages[index]["package_id"] = "%s.work.%02d.%s" % [
			str(survey.get("plan_hash", "")).left(16),
			index,
			str(packages[index]["kind"]),
		]
	return packages


func _site_prep_package(
		settlement_id: String,
		project_id: String,
		kind: String,
		order: int,
		display_name: String,
		cells: Array,
		requirements: Dictionary,
		tool_requirements: Dictionary,
		substage: String) -> Dictionary:
	var package := _work_package(
		settlement_id, project_id, kind, order, display_name,
		cells, requirements, tool_requirements)
	package["phase"] = "site_preparation"
	package["phase_label"] = "Site Preparation"
	package["substage"] = substage
	return package


func _work_package(
		settlement_id: String,
		project_id: String,
		kind: String,
		order: int,
		display_name: String,
		cells: Array,
		requirements: Dictionary,
		tool_requirements: Dictionary = {},
		stage_id: String = "") -> Dictionary:
	return {
		"record_type": "WorkPackage",
		"version": 1,
		"package_id": "",
		"package_index": order,
		"settlement_id": settlement_id,
		"project_id": project_id,
		"kind": kind,
		"stage_id": stage_id,
		"display_name": display_name,
		"cells": cells.duplicate(true),
		"requirements": requirements.duplicate(true),
		"tool_requirements": tool_requirements.duplicate(true),
		"status": "pending",
		"progress": 0,
		"reserved": {},
		"transactions": [],
	}


func _record_clear_cell(
		position: Vector3i,
		block_id: int,
		cut_cells: Array[Array],
		vegetation_removal: Array[Array],
		tool_requirements: Dictionary,
		expected_drops: Dictionary) -> void:
	var stable_id := BlockRegistry.get_stable_id(block_id)
	var cell := [position.x, position.y, position.z]
	if stable_id in VEGETATION_IDS:
		vegetation_removal.append(cell)
	else:
		cut_cells.append(cell)
	_record_harvest_requirements(
		position, block_id, tool_requirements, expected_drops)


func _record_harvest_requirements(
		position: Vector3i,
		block_id: int,
		tool_requirements: Dictionary,
		expected_drops: Dictionary) -> void:
	var stable_id := BlockRegistry.get_stable_id(block_id)
	var profile := BlockRegistry.get_harvest_profile(block_id)
	var tool_class := str(profile.get("tool", ""))
	if stable_id in SHOVEL_BLOCKS:
		tool_class = "shovel"
	if stable_id == "natural.leaves.oak":
		tool_class = "axe"
	if not tool_class.is_empty():
		tool_requirements[tool_class] = maxi(
			int(tool_requirements.get(tool_class, 0)),
			int(profile.get("level", 0)))
	var drop_id := str(profile.get("drop_id", stable_id))
	if not drop_id.is_empty():
		expected_drops[drop_id] = int(expected_drops.get(drop_id, 0)) \
			+ maxi(1, int(profile.get("drop_count", 1)))


func _record_collision(
		position: Vector3i,
		block_id: int,
		settlement_id: String,
		player_collisions: Array[Dictionary],
		protected_collisions: Array[Dictionary]) -> void:
	var provenance := world.get_edit_provenance(position)
	var owner_type := str(provenance.get("source_type", ""))
	var collision := {
		"position": [position.x, position.y, position.z],
		"stable_id": BlockRegistry.get_stable_id(block_id),
		"settlement_id": settlement_id,
		"provenance": provenance,
	}
	if owner_type == "player":
		player_collisions.append(collision)
	elif owner_type in [
		"generated_structure", "project", "repair",
	]:
		# Same-settlement work is still protected unless a future explicit
		# upgrade/replacement project names that claim as its target.
		protected_collisions.append(collision)


func _road_socket(
		blueprint: Dictionary,
		anchor: Vector3i,
		rotation: int) -> Vector3i:
	for marker_value in blueprint.get("markers", []):
		var marker: Dictionary = marker_value
		var marker_type := str(marker.get(
			"type", marker.get("marker_type", "")))
		if "entrance" not in marker_type and "road" not in marker_type:
			continue
		var source: Array = marker.get(
			"position", marker.get("local_position", []))
		if source.size() < 3:
			continue
		var rotated := _rotate_local(
			Vector2i(int(source[0]), int(source[2])), rotation)
		return Vector3i(
			anchor.x + rotated.x, anchor.y + int(source[1]),
			anchor.z + rotated.y)
	var footprint := _rotated_footprint(blueprint, rotation)
	return Vector3i(
		anchor.x + footprint.position.x + footprint.size.x / 2,
		anchor.y,
		anchor.z + footprint.end.y)


func _nearest_route_origin(
		settlement_id: String,
		target: Vector3i) -> Vector3i:
	var record := SettlementManager.get_settlement(settlement_id) \
		if SettlementManager != null else {}
	var best := Vector3i(
		int((record.get("anchor", [target.x, target.z]) as Array)[0]),
		target.y,
		int((record.get("anchor", [target.x, target.z]) as Array)[1]))
	var best_distance := Vector2(best.x, best.z).distance_squared_to(
		Vector2(target.x, target.z))
	for route_value in record.get("routes", []):
		var route: Dictionary = route_value
		for cell_value in route.get("cells", []):
			var cell: Array = cell_value
			if cell.size() < 3:
				continue
			var point := Vector3i(int(cell[0]), int(cell[1]), int(cell[2]))
			var distance := Vector2(point.x, point.z).distance_squared_to(
				Vector2(target.x, target.z))
			if distance < best_distance:
				best = point
				best_distance = distance
	return best


func _rotated_footprint(blueprint: Dictionary, rotation: int) -> Rect2i:
	var bounds: Dictionary = blueprint.get("bounds", {})
	var minimum: Array = bounds.get("min", [0, 0, 0])
	var maximum: Array = bounds.get("max", [0, 0, 0])
	var points: Array[Vector2i] = []
	for point in [
		Vector2i(int(minimum[0]), int(minimum[2])),
		Vector2i(int(maximum[0]), int(minimum[2])),
		Vector2i(int(minimum[0]), int(maximum[2])),
		Vector2i(int(maximum[0]), int(maximum[2])),
	]:
		points.append(_rotate_local(point, rotation))
	var min_point := points[0]
	var max_point := points[0]
	for point in points:
		min_point.x = mini(min_point.x, point.x)
		min_point.y = mini(min_point.y, point.y)
		max_point.x = maxi(max_point.x, point.x)
		max_point.y = maxi(max_point.y, point.y)
	return Rect2i(min_point, max_point - min_point + Vector2i.ONE)


func _rotate_local(point: Vector2i, rotation: int) -> Vector2i:
	match posmod(roundi(float(rotation) / 90.0), 4):
		1:
			return Vector2i(-point.y, point.x)
		2:
			return Vector2i(-point.x, -point.y)
		3:
			return Vector2i(point.y, -point.x)
	return point


func _rect_record(rect: Rect2i, anchor: Vector3i) -> Dictionary:
	return {
		"position": [
			anchor.x + rect.position.x,
			anchor.z + rect.position.y,
		],
		"size": [rect.size.x, rect.size.y],
	}


func _requirement_counts(values: Array) -> Dictionary:
	var result := {}
	for value in values:
		if value is Dictionary:
			var stable_id := str(value.get("stable_id", ""))
			if not stable_id.is_empty():
				result[stable_id] = int(result.get(stable_id, 0)) \
					+ maxi(0, int(value.get("count", 0)))
	return result


func _unique_cells(values: Array) -> Array[Array]:
	var seen := {}
	var result: Array[Array] = []
	for value in values:
		if not (value is Array) or value.size() < 3:
			continue
		var key := "%d,%d,%d" % [
			int(value[0]), int(value[1]), int(value[2])]
		if seen.has(key):
			continue
		seen[key] = true
		result.append([int(value[0]), int(value[1]), int(value[2])])
	result.sort_custom(func(a: Array, b: Array) -> bool:
		if int(a[1]) != int(b[1]):
			return int(a[1]) < int(b[1])
		if int(a[2]) != int(b[2]):
			return int(a[2]) < int(b[2])
		return int(a[0]) < int(b[0]))
	return result


func _point_key(point: Vector2i) -> String:
	return "%d,%d" % [point.x, point.y]


func _stable_hash(value: Dictionary) -> String:
	var copy := value.duplicate(true)
	copy.erase("plan_hash")
	return JSON.stringify(copy, "", true).sha256_text()


func _invalid_survey(
		settlement_id: String,
		project_id: String,
		anchor: Vector3i,
		rotation: int,
		reason: String) -> Dictionary:
	var result := {
		"record_type": "SiteSurvey",
		"version": 1,
		"settlement_id": settlement_id,
		"project_id": project_id,
		"anchor": [anchor.x, anchor.y, anchor.z],
		"rotation": rotation,
		"validation_result": "invalid",
		"validation_reasons": [reason],
	}
	result["plan_hash"] = _stable_hash(result)
	return result


func _invalid_route(settlement_id: String, reason: String) -> Dictionary:
	var result := {
		"record_type": "RoutePlan",
		"version": 1,
		"settlement_id": settlement_id,
		"cells": [],
		"maximum_step": 0,
		"valid": false,
		"validation_reasons": [reason],
	}
	result["plan_hash"] = _stable_hash(result)
	return result
