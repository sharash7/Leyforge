class_name ValleyPlan
extends RefCounted
## Deterministic, engine-native planning layer for the Controlled POC Valley.
## It contains only stable metadata: X/Z anchors, routes, and named sub-seeds.
## VoxelWorld turns that metadata into terrain and visible placeholder sites.

const VERSION := 1
const CURRENT_VERSION := 2
const PROFILE_ID := "world.profile.controlled_poc_valley"
const VALLEY_RADIUS := 176
const STRUCTURE_DISTANCE_RULES: Array[Dictionary] = [
	{"a": "spawn", "b": "hamlet", "min": 35.0, "max": 90.0},
	{"a": "hamlet", "b": "water", "min": 12.0, "max": 48.0},
	{"a": "hamlet", "b": "cave_entrance", "min": 50.0, "max": 115.0},
	{"a": "hamlet", "b": "rune_ruin", "min": 40.0, "max": 105.0},
	{"a": "hamlet", "b": "goblin_camp", "min": 95.0, "max": 165.0},
	{"a": "hamlet", "b": "raid_approach", "min": 42.0, "max": 100.0},
	{"a": "goblin_camp", "b": "raid_approach", "min": 35.0, "max": 90.0},
	{"a": "goblin_camp", "b": "rune_ruin", "min": 60.0, "max": 230.0},
	{"a": "goblin_camp", "b": "base_site", "min": 80.0, "max": 230.0},
	{"a": "cave_entrance", "b": "mana_pocket", "min": 10.0, "max": 42.0},
	{"a": "spawn", "b": "base_site", "min": 12.0, "max": 58.0},
]

const REQUIRED_ANCHORS: Array[String] = [
	"spawn",
	"hamlet",
	"water",
	"cave_entrance",
	"mana_pocket",
	"rune_ruin",
	"goblin_camp",
	"raid_approach",
	"base_site",
	"warehouse",
	"watchtower_site",
]

var master_seed := 0
var plan_version := VERSION
var sub_seeds: Dictionary = {}
var anchors: Dictionary = {}      # stable anchor id -> Vector2i
var routes: Array[Dictionary] = []
var river_points: Array[Vector2i] = []
var fallback_used := false
var validation_errors: Array[String] = []


func generate(seed_value: int, requested_version: int = VERSION) -> void:
	master_seed = seed_value
	plan_version = requested_version
	_derive_sub_seeds()
	if plan_version == CURRENT_VERSION:
		_generate_v2_candidate()
	else:
		plan_version = VERSION
		_generate_candidate()
	validation_errors = validate()
	if not validation_errors.is_empty():
		fallback_used = true
		_generate_fallback()
		validation_errors = validate()


static func derive_seed(seed_value: int, channel: String) -> int:
	## Versioned FNV-1a-style derivation; independent channels do not reroll each
	## other when a later world-generation system changes.
	var value := (seed_value ^ 0x45D9F3B) & 0x7FFFFFFF
	for byte in channel.to_utf8_buffer():
		value = ((value ^ int(byte)) * 16777619) & 0x7FFFFFFF
	return value


func _derive_sub_seeds() -> void:
	for channel in [
		"terrain", "climate", "caves", "resources", "structures",
		"roads", "mana", "ecology", "names", "events",
	]:
		sub_seeds[channel] = derive_seed(master_seed, channel)


func _generate_candidate() -> void:
	anchors.clear()
	routes.clear()
	river_points.clear()
	var rng := RandomNumberGenerator.new()
	rng.seed = int(sub_seeds["structures"])
	var angle := rng.randf_range(-PI, PI)
	var forward := Vector2(cos(angle), sin(angle))
	var right := Vector2(-forward.y, forward.x)
	var center := Vector2(rng.randi_range(-8, 8), rng.randi_range(-8, 8))

	_set_anchor("hamlet", center + forward * 22.0)
	_set_anchor("spawn", center - forward * 42.0 + right * rng.randf_range(-8.0, 8.0))
	_set_anchor("water", center + right * 25.0 + forward * 12.0)
	_set_anchor("cave_entrance", center + forward * 73.0 + right * 31.0)
	_set_anchor("mana_pocket", center + forward * 83.0 + right * 48.0)
	_set_anchor("rune_ruin", center - forward * 20.0 + right * 62.0)
	_set_anchor("goblin_camp", center + forward * 127.0 - right * 30.0)
	_set_anchor("raid_approach", center + forward * 72.0 - right * 13.0)
	_set_anchor("base_site", center - forward * 19.0 - right * 28.0)
	_set_anchor("warehouse", Vector2(anchors["hamlet"]) + right * 5.0)
	_set_anchor("watchtower_site", Vector2(anchors["hamlet"]) + forward * 17.0 - right * 4.0)

	var water := Vector2(anchors["water"])
	var river_rng := RandomNumberGenerator.new()
	river_rng.seed = int(sub_seeds["terrain"])
	river_points = [
		_round_vec2i(water - right * 190.0 + forward * river_rng.randf_range(-18.0, 18.0)),
		_round_vec2i(water - right * 72.0 - forward * river_rng.randf_range(8.0, 22.0)),
		Vector2i(anchors["water"]),
		_round_vec2i(water + right * 76.0 + forward * river_rng.randf_range(8.0, 22.0)),
		_round_vec2i(water + right * 190.0 + forward * river_rng.randf_range(-18.0, 18.0)),
	]
	_build_routes()


func _generate_v2_candidate() -> void:
	## ValleyPlan v2 varies both bearing and distance while retaining the POC's
	## authored progression relationships. A bounded deterministic retry loop
	## makes invalid plans reportable instead of changing the seed stream.
	fallback_used = false
	var rng := RandomNumberGenerator.new()
	rng.seed = int(sub_seeds["structures"]) ^ 0x29A35F1
	for _attempt in 128:
		anchors.clear()
		routes.clear()
		river_points.clear()
		var center := Vector2(
			rng.randf_range(-10.0, 10.0),
			rng.randf_range(-10.0, 10.0))
		var valley_angle := rng.randf_range(-PI, PI)
		var forward := Vector2.from_angle(valley_angle)
		var right := Vector2(-forward.y, forward.x)
		_set_anchor("hamlet", center)
		_set_anchor("spawn", center + _polar(
			valley_angle + PI + rng.randf_range(-0.55, 0.55),
			rng.randf_range(42.0, 82.0)))
		_set_anchor("water", center + _polar(
			valley_angle + rng.randf_range(0.75, 1.35),
			rng.randf_range(17.0, 43.0)))
		_set_anchor("cave_entrance", center + _polar(
			valley_angle + rng.randf_range(-0.48, 0.58),
			rng.randf_range(58.0, 108.0)))
		var cave := Vector2(anchors["cave_entrance"])
		_set_anchor("mana_pocket", cave + _polar(
			valley_angle + rng.randf_range(0.65, 1.45),
			rng.randf_range(13.0, 36.0)))
		_set_anchor("rune_ruin", center + _polar(
			valley_angle + rng.randf_range(1.15, 2.45),
			rng.randf_range(48.0, 98.0)))
		_set_anchor("goblin_camp", center + _polar(
			valley_angle + rng.randf_range(-0.65, 0.30),
			rng.randf_range(112.0, 158.0)))
		var camp := Vector2(anchors["goblin_camp"])
		var raid_t := rng.randf_range(0.42, 0.68)
		_set_anchor("raid_approach", center.lerp(camp, raid_t) + right * rng.randf_range(-12.0, 12.0))
		var spawn := Vector2(anchors["spawn"])
		_set_anchor("base_site", spawn + _polar(
			valley_angle + rng.randf_range(-1.25, 1.25),
			rng.randf_range(16.0, 50.0)))
		_set_anchor("warehouse", center + right * rng.randf_range(5.0, 8.0))
		_set_anchor("watchtower_site", center + forward * rng.randf_range(16.0, 22.0) - right * rng.randf_range(2.0, 7.0))

		var water := Vector2(anchors["water"])
		var river_angle := valley_angle + rng.randf_range(1.15, 1.95)
		var river_axis := Vector2.from_angle(river_angle)
		var river_normal := Vector2(-river_axis.y, river_axis.x)
		river_points = [
			_round_vec2i(water - river_axis * 195.0 + river_normal * rng.randf_range(-18.0, 18.0)),
			_round_vec2i(water - river_axis * 76.0 + river_normal * rng.randf_range(-14.0, 14.0)),
			Vector2i(anchors["water"]),
			_round_vec2i(water + river_axis * 76.0 + river_normal * rng.randf_range(-14.0, 14.0)),
			_round_vec2i(water + river_axis * 195.0 + river_normal * rng.randf_range(-18.0, 18.0)),
		]
		_build_routes()
		if validate().is_empty() and _v2_separation_errors().is_empty():
			return


func _polar(angle: float, distance: float) -> Vector2:
	return Vector2.from_angle(angle) * distance


func _generate_fallback() -> void:
	anchors = {
		"spawn": Vector2i(-48, -20),
		"hamlet": Vector2i(16, 0),
		"water": Vector2i(18, 27),
		"cave_entrance": Vector2i(76, 36),
		"mana_pocket": Vector2i(88, 54),
		"rune_ruin": Vector2i(-22, 64),
		"goblin_camp": Vector2i(138, -34),
		"raid_approach": Vector2i(82, -16),
		"base_site": Vector2i(-18, -37),
		"warehouse": Vector2i(16, 5),
		"watchtower_site": Vector2i(33, -3),
	}
	river_points = [
		Vector2i(-176, 43), Vector2i(-62, 18), Vector2i(18, 27),
		Vector2i(82, 43), Vector2i(176, 20),
	]
	_build_routes()


func _build_routes() -> void:
	routes = [
		_route("trail.spawn_hamlet", "spawn", "hamlet", 2.0, "trail"),
		_route("road.hamlet_water", "hamlet", "water", 2.5, "road"),
		_route("trail.hamlet_cave", "hamlet", "cave_entrance", 2.0, "trail"),
		_route("trail.hamlet_ruin", "hamlet", "rune_ruin", 1.5, "trail"),
		_route("road.raid_approach", "hamlet", "raid_approach", 2.5, "raid_route"),
		_route("trail.camp_approach", "raid_approach", "goblin_camp", 2.0, "raid_route"),
		_route("trail.cave_mana", "cave_entrance", "mana_pocket", 1.25, "trail"),
		_route("trail.spawn_base", "spawn", "base_site", 1.5, "trail"),
		_route("road.hamlet_warehouse", "hamlet", "warehouse", 2.0, "road"),
		_route("road.hamlet_watchtower", "hamlet", "watchtower_site", 2.0, "road"),
	]


func _route(id: String, from_id: String, to_id: String, width: float, kind: String) -> Dictionary:
	return {"id": id, "from": from_id, "to": to_id, "width": width, "kind": kind}


func _set_anchor(id: String, value: Vector2) -> void:
	anchors[id] = _round_vec2i(value)


func _round_vec2i(value: Vector2) -> Vector2i:
	return Vector2i(roundi(value.x), roundi(value.y))


func validate() -> Array[String]:
	var errors: Array[String] = []
	for anchor_id in REQUIRED_ANCHORS:
		if not anchors.has(anchor_id):
			errors.append("missing_anchor:%s" % anchor_id)
	if not errors.is_empty():
		return errors
	for anchor_id in anchors:
		if Vector2(anchors[anchor_id]).length() > VALLEY_RADIUS:
			errors.append("anchor_outside_valley:%s" % anchor_id)
	for rule in STRUCTURE_DISTANCE_RULES:
		_check_distance(
			errors, str(rule["a"]), str(rule["b"]),
			float(rule["min"]), float(rule["max"]))

	var route_ids := {}
	for route in routes:
		var route_id := str(route.get("id", ""))
		if route_id.is_empty() or route_ids.has(route_id):
			errors.append("invalid_route_id:%s" % route_id)
		route_ids[route_id] = true
		if not anchors.has(route.get("from", "")) or not anchors.has(route.get("to", "")):
			errors.append("route_missing_endpoint:%s" % route_id)
	if river_points.size() < 3:
		errors.append("river_has_too_few_points")
	elif _distance_to_polyline(Vector2(anchors["water"]), river_points) > 2.0:
		errors.append("water_anchor_not_on_river")
	var graph := relation_graph()
	var visited := {"spawn": true}
	var frontier: Array[String] = ["spawn"]
	while not frontier.is_empty():
		var current: String = frontier.pop_front()
		for neighbor: String in graph.get(current, []):
			if not visited.has(neighbor):
				visited[neighbor] = true
				frontier.append(neighbor)
	for anchor_id in REQUIRED_ANCHORS:
		if not visited.has(anchor_id):
			errors.append("anchor_not_connected:%s" % anchor_id)
	if plan_version == CURRENT_VERSION:
		errors.append_array(_v2_separation_errors())
	return errors


func _v2_separation_errors() -> Array[String]:
	var errors: Array[String] = []
	# Only independent structure footprints are compared. Hamlet services are
	# intentionally close to the hamlet anchor and validated by their authored
	# offsets instead.
	var footprints := {
		"spawn": 7.0,
		"base_site": 8.0,
		"water": 5.0,
		"cave_entrance": 7.0,
		"mana_pocket": 5.0,
		"rune_ruin": 8.0,
		"goblin_camp": 11.0,
		"raid_approach": 7.0,
		"watchtower_site": 6.0,
	}
	var ids: Array = footprints.keys()
	for i in ids.size():
		for j in range(i + 1, ids.size()):
			var a := str(ids[i])
			var b := str(ids[j])
			if not anchors.has(a) or not anchors.has(b):
				continue
			var minimum := float(footprints[a]) + float(footprints[b]) + 2.0
			var distance := Vector2(anchors[a]).distance_to(Vector2(anchors[b]))
			if distance < minimum:
				errors.append("structure_overlap:%s:%s:%.1f" % [a, b, distance])
	for anchor_id in ["spawn", "hamlet", "base_site", "goblin_camp", "rune_ruin"]:
		if not anchors.has(anchor_id) or river_points.size() < 2:
			continue
		var river_distance := _distance_to_polyline(
			Vector2(anchors[anchor_id]), river_points)
		if river_distance < 15.0:
			errors.append("critical_site_near_river:%s:%.1f" % [
				anchor_id, river_distance])
	return errors


func _check_distance(errors: Array[String], a: String, b: String, minimum: float, maximum: float) -> void:
	var distance := Vector2(anchors[a]).distance_to(Vector2(anchors[b]))
	if distance < minimum or distance > maximum:
		errors.append("distance:%s:%s:%.1f" % [a, b, distance])


func get_anchor(id: String) -> Vector2i:
	return Vector2i(anchors.get(id, Vector2i.ZERO))


func structure_distance_rules() -> Array[Dictionary]:
	return STRUCTURE_DISTANCE_RULES.duplicate(true)


func get_route_points(route: Dictionary) -> Array[Vector2i]:
	var points: Array[Vector2i] = [
		get_anchor(str(route["from"])),
		get_anchor(str(route["to"])),
	]
	return points


func relation_graph() -> Dictionary:
	var graph := {}
	for anchor_id in anchors:
		graph[anchor_id] = []
	for route in routes:
		graph[route["from"]].append(route["to"])
		graph[route["to"]].append(route["from"])
	return graph


func identity() -> String:
	var parts: Array[String] = [PROFILE_ID, "v%d" % plan_version, str(master_seed)]
	var anchor_ids: Array = anchors.keys()
	anchor_ids.sort()
	for anchor_id in anchor_ids:
		var p: Vector2i = anchors[anchor_id]
		parts.append("%s:%d:%d" % [anchor_id, p.x, p.y])
	for route in routes:
		parts.append("%s:%s:%s" % [route["id"], route["from"], route["to"]])
	var digest := derive_seed(master_seed, "|".join(parts))
	return "%s:v%d:%08x" % [PROFILE_ID, plan_version, digest]


func save_manifest() -> Dictionary:
	return {
		"profile_id": PROFILE_ID,
		"version": plan_version,
		"plan_id": identity(),
		"sub_seeds": sub_seeds.duplicate(),
		"fallback_used": fallback_used,
	}


func nearest_anchor(position: Vector2) -> Dictionary:
	var nearest_id := ""
	var nearest_distance := INF
	for anchor_id in anchors:
		var distance := position.distance_to(Vector2(anchors[anchor_id]))
		if distance < nearest_distance:
			nearest_id = anchor_id
			nearest_distance = distance
	return {"id": nearest_id, "distance": nearest_distance}


static func _distance_to_polyline(point: Vector2, points: Array[Vector2i]) -> float:
	var best := INF
	for i in points.size() - 1:
		best = minf(best, _distance_to_segment(point, Vector2(points[i]), Vector2(points[i + 1])))
	return best


static func _distance_to_segment(point: Vector2, a: Vector2, b: Vector2) -> float:
	var ab := b - a
	var length_squared := ab.length_squared()
	if length_squared <= 0.0001:
		return point.distance_to(a)
	var t := clampf((point - a).dot(ab) / length_squared, 0.0, 1.0)
	return point.distance_to(a + ab * t)
