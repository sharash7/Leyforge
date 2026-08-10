class_name WorldStructurePlanner
extends RefCounted
## Deterministic regional structure planner for worldgen v4 and v5.
##
## Structure positions are derived from the world seed, a per-type salt, and
## signed region coordinates. No discovery order, loaded-chunk order, or fixed
## absolute world coordinate participates in placement.

const ValleyPlanScript = preload("res://scripts/world/valley_plan.gd")

const VERSION := 4
const LEGACY_VERSION := 3
const PROFILE_ID := "world.profile.living_frontier_regional"
const LEGACY_REGIONAL_PROFILE_ID := "world.profile.controlled_poc_regional"
const ALGORITHM_ID := "worldgen.regional_random_spread.v2"
const LEGACY_ALGORITHM_ID := "worldgen.regional_random_spread.v1"
const STARTER_MODE := "nearby_discovery"
const RULES_PATH := "res://data/worldgen/structure_placement.json"
const LEGACY_CONTENT_TEMPLATES := {
	"hamlet": "world.structure.hamlet.poc_start",
	"goblin_camp": "world.structure.goblin_camp.poc",
	"rune_ruin": "world.structure.rune_ruin.poc",
	"cave_entrance": "world.structure.cave_entrance.poc",
	"mana_pocket": "world.structure.mana_pocket.poc",
	"resource_field": "world.structure.resource_field.poc",
}
const CHUNK_SIZE := 16
const MAX_STARTER_ATTEMPTS := 256
const SPATIAL_BUCKET_BLOCKS := 128
const SPATIAL_BUCKET_NEIGHBORS := 2

const REQUIRED_ANCHORS: Array[String] = [
	"spawn",
	"base_site",
	"water",
	"hamlet",
	"warehouse",
	"watchtower_site",
	"cave_entrance",
	"rune_ruin",
	"mana_pocket",
	"goblin_camp",
	"raid_approach",
]

const STARTER_BANDS_CHUNKS := {
	"base_site": Vector2i(1, 3),
	"water": Vector2i(2, 6),
	"cave_entrance": Vector2i(4, 10),
	"hamlet": Vector2i(6, 12),
	"rune_ruin": Vector2i(8, 18),
	"mana_pocket": Vector2i(8, 18),
	"goblin_camp": Vector2i(10, 22),
}

const STARTER_FOOTPRINTS := {
	"spawn": Vector2i(18, 18),
	"base_site": Vector2i(22, 22),
	"water": Vector2i(14, 14),
	"hamlet": Vector2i(64, 64),
	"warehouse": Vector2i(12, 10),
	"watchtower_site": Vector2i(12, 12),
	"cave_entrance": Vector2i(16, 18),
	"rune_ruin": Vector2i(18, 18),
	"mana_pocket": Vector2i(12, 12),
	"goblin_camp": Vector2i(24, 22),
	"raid_approach": Vector2i(12, 12),
}

var master_seed := 0
var plan_version := VERSION
var sub_seeds: Dictionary = {}
var anchors: Dictionary = {}
var routes: Array[Dictionary] = []
var river_points: Array[Vector2i] = []
var fallback_used := false
var validation_errors: Array[String] = []
var starter_mode := STARTER_MODE
var placement_rules: Array[Dictionary] = []
var starter_sites: Array[Dictionary] = []
var placement_rule_hash := ""
var site_plan_hash := ""
var _rules_by_type: Dictionary = {}
var _terrain_noise := FastNoiseLite.new()
var _hill_noise := FastNoiseLite.new()
var _temperature_noise := FastNoiseLite.new()
var _moisture_noise := FastNoiseLite.new()
var _hydrology_noise := FastNoiseLite.new()


func generate(seed_value: int, requested_version: int = VERSION) -> void:
	master_seed = seed_value
	plan_version = requested_version
	fallback_used = false
	anchors.clear()
	routes.clear()
	river_points.clear()
	starter_sites.clear()
	_derive_sub_seeds()
	_seed_suitability_fields()
	_load_rules()
	if plan_version not in [LEGACY_VERSION, VERSION]:
		validation_errors = ["unsupported_regional_plan_version:%d" % plan_version]
		return
	_generate_starter_contract()
	validation_errors = validate()
	site_plan_hash = _starter_hash()


static func derive_seed(seed_value: int, channel: String) -> int:
	return ValleyPlanScript.derive_seed(seed_value, "regional.v1:%s" % channel)


func _derive_sub_seeds() -> void:
	for channel in [
		"terrain", "climate", "caves", "resources", "structures",
		"roads", "hydrology", "mana", "ecology", "names", "events",
		"settlements",
	]:
		sub_seeds[channel] = derive_seed(master_seed, channel)


func _seed_suitability_fields() -> void:
	_terrain_noise.seed = int(sub_seeds["terrain"])
	_terrain_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	_terrain_noise.frequency = 0.008
	_terrain_noise.fractal_octaves = 4
	_hill_noise.seed = ValleyPlanScript.derive_seed(
		master_seed, "terrain.hills")
	_hill_noise.noise_type = FastNoiseLite.TYPE_PERLIN
	_hill_noise.frequency = 0.035
	_hill_noise.fractal_octaves = 3
	_temperature_noise.seed = int(sub_seeds["climate"])
	_temperature_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_temperature_noise.frequency = 0.006
	_moisture_noise.seed = ValleyPlanScript.derive_seed(
		master_seed, "climate.moisture")
	_moisture_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_moisture_noise.frequency = 0.007
	_hydrology_noise.seed = ValleyPlanScript.derive_seed(
		master_seed, "terrain.minor_rivers")
	_hydrology_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	_hydrology_noise.frequency = 0.008


func _load_rules() -> void:
	placement_rules.clear()
	_rules_by_type.clear()
	var file := FileAccess.open(RULES_PATH, FileAccess.READ)
	if file == null:
		placement_rule_hash = "missing"
		return
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	if not (parsed is Dictionary):
		placement_rule_hash = "invalid"
		return
	for value in parsed.get("rules", []):
		if not (value is Dictionary):
			continue
		var rule: Dictionary = value.duplicate(true)
		var type_id := str(rule.get("type_id", ""))
		# Plan v3 hashes are immutable save identity. Reconstruct its archived
		# content-template aliases in memory while plan v4 reads only production
		# Living Frontier identities from the canonical rules file.
		if plan_version == LEGACY_VERSION and LEGACY_CONTENT_TEMPLATES.has(type_id):
			rule["content_template"] = LEGACY_CONTENT_TEMPLATES[type_id]
		var spacing := int(rule.get("spacing_chunks", 0))
		var separation := int(rule.get("separation_chunks", 0))
		if type_id.is_empty() \
				or str(rule.get("salt", "")).is_empty() \
				or spacing <= separation \
				or separation < 1 \
				or not (rule.get("allowed_biomes", null) is Array) \
				or not (rule.get("terrain", null) is Dictionary) \
				or not (rule.get("footprint_blocks", null) is Array) \
				or not (rule.get("exclusions", null) is Array) \
				or (rule.get("variants", []) as Array).is_empty() \
				or str(rule.get("content_template", "")).is_empty():
			continue
		placement_rules.append(rule)
		_rules_by_type[type_id] = rule
	placement_rules.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var priority_a := int(a.get("priority", 0))
		var priority_b := int(b.get("priority", 0))
		if priority_a != priority_b:
			return priority_a > priority_b
		return str(a.get("type_id", "")) < str(b.get("type_id", "")))
	placement_rule_hash = "%08x" % derive_seed(
		0x51A7E, JSON.stringify(placement_rules))


func _generate_starter_contract() -> void:
	var spawn_rng := _rng_for("starter.spawn")
	var spawn_chunk := Vector2i(
		spawn_rng.randi_range(-8, 8),
		spawn_rng.randi_range(-8, 8))
	anchors["spawn"] = _chunk_center(spawn_chunk)
	var placed: Array[Dictionary] = [
		_starter_site("spawn", Vector2i(anchors["spawn"]), "", 0, "safe_clearing"),
	]
	for type_id in [
		"base_site", "water", "cave_entrance", "hamlet",
		"rune_ruin", "mana_pocket", "goblin_camp",
	]:
		var band: Vector2i = STARTER_BANDS_CHUNKS[type_id]
		var site := _sample_starter_site(
			type_id, band.x, band.y, placed)
		if site.is_empty():
			continue
		placed.append(site)
		anchors[type_id] = Vector2i(site["position"])

	if anchors.has("hamlet"):
		_generate_hamlet_children(placed)
	if anchors.has("hamlet") and anchors.has("goblin_camp"):
		_generate_raid_approach(placed)
	starter_sites = placed
	_build_local_routes()


func _sample_starter_site(
		type_id: String,
		minimum_chunks: int,
		maximum_chunks: int,
		placed: Array[Dictionary]) -> Dictionary:
	var rng := _rng_for("starter.site:%s" % type_id)
	var spawn := Vector2(anchors["spawn"])
	for _attempt in MAX_STARTER_ATTEMPTS:
		var angle := rng.randf_range(-PI, PI)
		var distance_chunks := rng.randf_range(
			float(minimum_chunks), float(maximum_chunks))
		var position := Vector2i(
			roundi(spawn.x + cos(angle) * distance_chunks * CHUNK_SIZE),
			roundi(spawn.y + sin(angle) * distance_chunks * CHUNK_SIZE))
		var variant := _variant_for(type_id, position)
		var rotation := int(rng.randi_range(0, 3)) * 90
		var site := _starter_site(type_id, position, "", rotation, variant)
		if _overlaps_any(site, placed, 4.0):
			continue
		if type_id == "goblin_camp" and anchors.has("hamlet"):
			if Vector2(position).distance_to(Vector2(anchors["hamlet"])) \
					< 6.0 * CHUNK_SIZE:
				continue
		return site
	return {}


func _generate_hamlet_children(placed: Array[Dictionary]) -> void:
	var hamlet := Vector2i(anchors["hamlet"])
	var rng := _rng_for("starter.hamlet.layout")
	var directions: Array[Vector2i] = [
		Vector2i.RIGHT, Vector2i.DOWN, Vector2i.LEFT, Vector2i.UP,
	]
	var hamlet_rotation := 0
	for site in placed:
		if str(site.get("type_id", "")) == "hamlet":
			hamlet_rotation = int(site.get("rotation", 0))
			break
	var forward: Vector2i = directions[
		posmod(hamlet_rotation / 90, directions.size())]
	var right := Vector2i(-forward.y, forward.x)
	var warehouse := hamlet + right * rng.randi_range(8, 12) \
		+ forward * rng.randi_range(-3, 3)
	var watchtower := hamlet - right * rng.randi_range(11, 16) \
		+ forward * rng.randi_range(10, 16)
	anchors["warehouse"] = warehouse
	anchors["watchtower_site"] = watchtower
	placed.append(_starter_site(
		"warehouse", warehouse, _site_id(
			"hamlet", _starter_region("hamlet", hamlet)), 0, "starter"))
	placed.append(_starter_site(
		"watchtower_site", watchtower, _site_id(
			"hamlet", _starter_region("hamlet", hamlet)), 0, "project_plot"))


func _generate_raid_approach(placed: Array[Dictionary]) -> void:
	var hamlet := Vector2(anchors["hamlet"])
	var camp := Vector2(anchors["goblin_camp"])
	var rng := _rng_for("starter.raid_approach")
	var direction := (camp - hamlet).normalized()
	var right := Vector2(-direction.y, direction.x)
	var position := hamlet.lerp(camp, rng.randf_range(0.42, 0.68)) \
		+ right * rng.randf_range(-12.0, 12.0)
	var resolved := Vector2i(roundi(position.x), roundi(position.y))
	anchors["raid_approach"] = resolved
	placed.append(_starter_site(
		"raid_approach", resolved, _site_id(
			"goblin_camp", _starter_region(
				"goblin_camp", Vector2i(anchors["goblin_camp"]))),
			0, "runtime_route"))


func _build_local_routes() -> void:
	routes.clear()
	if anchors.has("hamlet") and anchors.has("warehouse"):
		routes.append(_route(
			"road.hamlet_warehouse", "hamlet", "warehouse", 2.0, "road"))
	if anchors.has("hamlet") and anchors.has("watchtower_site"):
		routes.append(_route(
			"road.hamlet_watchtower", "hamlet", "watchtower_site", 1.75, "road"))
	if anchors.has("spawn") and anchors.has("base_site"):
		routes.append(_route(
			"trail.spawn_base", "spawn", "base_site", 1.25, "trail"))
	if anchors.has("hamlet") and anchors.has("raid_approach"):
		routes.append(_route(
			"road.raid_approach", "hamlet", "raid_approach", 2.0, "raid_route"))
	if anchors.has("raid_approach") and anchors.has("goblin_camp"):
		routes.append(_route(
			"trail.camp_approach", "raid_approach", "goblin_camp", 1.5, "raid_route"))


func _route(
		id: String, from_id: String, to_id: String,
		width: float, kind: String) -> Dictionary:
	return {
		"id": id,
		"from": from_id,
		"to": to_id,
		"width": width,
		"kind": kind,
	}


func _starter_site(
		type_id: String,
		position: Vector2i,
		parent_site_id: String,
		rotation: int,
		variant: String) -> Dictionary:
	var footprint := Vector2i(STARTER_FOOTPRINTS.get(
		type_id, Vector2i(12, 12)))
	var owning_region := _starter_region(type_id, position)
	return {
		"site_id": _site_id(type_id, owning_region),
		"type_id": type_id,
		"origin_chunk": _world_to_chunk(position),
		"position": position,
		"rotation": rotation,
		"variant_id": variant,
		"footprint": footprint,
		"parent_site_id": parent_site_id,
		"validation_result": "valid",
		"is_starter": true,
		"region": owning_region,
	}


func query_sites(
		chunk_rect: Rect2i,
		type_filter: Array[String] = []) -> Array[Dictionary]:
	if placement_rules.is_empty() or chunk_rect.size.x <= 0 or chunk_rect.size.y <= 0:
		return []
	var candidates: Array[Dictionary] = []
	for site in starter_sites:
		candidates.append(site.duplicate(true))
	var query_margin := 2
	for rule in placement_rules:
		var type_id := str(rule["type_id"])
		var spacing := int(rule["spacing_chunks"])
		var min_chunk := chunk_rect.position - Vector2i(
			spacing * query_margin, spacing * query_margin)
		var max_chunk := chunk_rect.position + chunk_rect.size - Vector2i.ONE \
			+ Vector2i(spacing * query_margin, spacing * query_margin)
		var min_region := Vector2i(
			_floor_div(min_chunk.x, spacing),
			_floor_div(min_chunk.y, spacing))
		var max_region := Vector2i(
			_floor_div(max_chunk.x, spacing),
			_floor_div(max_chunk.y, spacing))
		for rz in range(min_region.y, max_region.y + 1):
			for rx in range(min_region.x, max_region.x + 1):
				var candidate := _regional_candidate(
					rule, Vector2i(rx, rz))
				if not candidate.is_empty():
					candidates.append(candidate)
	candidates.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var priority_a := _priority_for(str(a.get("type_id", "")))
		var priority_b := _priority_for(str(b.get("type_id", "")))
		if bool(a.get("is_starter", false)) != bool(b.get("is_starter", false)):
			return bool(a.get("is_starter", false))
		if priority_a != priority_b:
			return priority_a > priority_b
		return str(a.get("site_id", "")) < str(b.get("site_id", "")))
	var accepted: Array[Dictionary] = []
	var accepted_by_bucket := {}
	for candidate in candidates:
		var nearby := _nearby_sites(candidate, accepted_by_bucket)
		if _overlaps_any(candidate, nearby, 4.0) \
				or _violates_hard_spacing(candidate, nearby):
			continue
		accepted.append(candidate)
		var bucket_key := _site_bucket_key(candidate)
		if not accepted_by_bucket.has(bucket_key):
			accepted_by_bucket[bucket_key] = []
		(accepted_by_bucket[bucket_key] as Array).append(candidate)
	var result: Array[Dictionary] = []
	for site in accepted:
		if not type_filter.is_empty() and str(site["type_id"]) not in type_filter:
			continue
		if _site_intersects_chunk_rect(site, chunk_rect):
			result.append(site.duplicate(true))
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a["site_id"]) < str(b["site_id"]))
	return result


func _nearby_sites(
		site: Dictionary,
		accepted_by_bucket: Dictionary) -> Array[Dictionary]:
	var position := Vector2i(site["position"])
	var bucket := Vector2i(
		_floor_div(position.x, SPATIAL_BUCKET_BLOCKS),
		_floor_div(position.y, SPATIAL_BUCKET_BLOCKS))
	var result: Array[Dictionary] = []
	for dz in range(-SPATIAL_BUCKET_NEIGHBORS, SPATIAL_BUCKET_NEIGHBORS + 1):
		for dx in range(-SPATIAL_BUCKET_NEIGHBORS, SPATIAL_BUCKET_NEIGHBORS + 1):
			var key := "%d:%d" % [bucket.x + dx, bucket.y + dz]
			for candidate in accepted_by_bucket.get(key, []):
				result.append(candidate)
	return result


func _site_bucket_key(site: Dictionary) -> String:
	var position := Vector2i(site["position"])
	return "%d:%d" % [
		_floor_div(position.x, SPATIAL_BUCKET_BLOCKS),
		_floor_div(position.y, SPATIAL_BUCKET_BLOCKS),
	]


func _violates_hard_spacing(
		site: Dictionary,
		others: Array[Dictionary]) -> bool:
	var type_id := str(site.get("type_id", ""))
	if not _rules_by_type.has(type_id):
		return false
	var separation := float(
		_rules_by_type[type_id].get("separation_chunks", 1) * CHUNK_SIZE)
	for other in others:
		if str(other.get("type_id", "")) != type_id:
			continue
		if Vector2(site["position"]).distance_to(
				Vector2(other["position"])) < separation:
			return true
	return false


func _regional_candidate(rule: Dictionary, region: Vector2i) -> Dictionary:
	var type_id := str(rule["type_id"])
	var spacing := int(rule["spacing_chunks"])
	var separation := int(rule["separation_chunks"])
	var spread := spacing - separation
	var rng := _rng_for("site:%s:%d:%d" % [rule["salt"], region.x, region.y])
	var footprint_source: Array = rule.get("footprint_blocks", [12, 12])
	var footprint := Vector2i(
		int(footprint_source[0]), int(footprint_source[1]))
	var variants: Array = rule.get("variants", ["default"])
	for _attempt in 4:
		var chunk := region * spacing + Vector2i(
			rng.randi_range(0, spread - 1),
			rng.randi_range(0, spread - 1))
		var position := _chunk_center(chunk)
		if not _candidate_is_suitable(rule, position):
			continue
		var variant := str(variants[
			rng.randi_range(0, variants.size() - 1)])
		return {
			"site_id": "site.%s.%08x.%d.%d" % [
				type_id,
				derive_seed(master_seed, "site_id:%s:%d:%d" % [
					type_id, region.x, region.y]),
				region.x,
				region.y,
			],
			"type_id": type_id,
			"origin_chunk": chunk,
			"position": position,
			"rotation": int(rng.randi_range(0, 3)) * 90,
			"variant_id": variant,
			"footprint": footprint,
			"parent_site_id": "",
			"validation_result": "valid",
			"is_starter": false,
			"region": region,
		}
	return {}


func _candidate_is_suitable(rule: Dictionary, position: Vector2i) -> bool:
	var allowed: Array = rule.get("allowed_biomes", [])
	if not allowed.is_empty() and _biome_name_at(position) not in allowed:
		return false
	var terrain: Dictionary = rule.get("terrain", {})
	var center_height := _unmodified_height_at(position.x, position.y)
	if bool(terrain.get("dry", false)) and center_height <= 11.0:
		return false
	var minimum := center_height
	var maximum := center_height
	for offset in [
		Vector2i(-4, 0), Vector2i(4, 0),
		Vector2i(0, -4), Vector2i(0, 4),
	]:
		var height := _unmodified_height_at(
			position.x + offset.x, position.y + offset.y)
		minimum = minf(minimum, height)
		maximum = maxf(maximum, height)
	return maximum - minimum <= float(terrain.get("maximum_slope", 12))


func _biome_name_at(position: Vector2i) -> String:
	var temperature := _temperature_noise.get_noise_2d(
		float(position.x), float(position.y))
	var moisture := _moisture_noise.get_noise_2d(
		float(position.x), float(position.y))
	if temperature < -0.35:
		return "cold"
	if temperature > 0.3 and moisture < -0.1:
		return "desert"
	if moisture > 0.2:
		return "forest"
	return "plains"


func _unmodified_height_at(x: int, z: int) -> float:
	var continent := _terrain_noise.get_noise_2d(float(x), float(z))
	var height := 16.0 + continent * 9.0 \
		+ _hill_noise.get_noise_2d(float(x), float(z)) * 3.5
	if _biome_name_at(Vector2i(x, z)) == "cold":
		height += maxf(0.0, continent) * 12.0
	var river := absf(_hydrology_noise.get_noise_2d(float(x), float(z)))
	if river < 0.10:
		var river_weight := 1.0 - river / 0.10
		height = lerpf(height, 5.0, river_weight * river_weight * 0.95)
	return height


func get_site(site_id: String) -> Dictionary:
	for site in starter_sites:
		if str(site.get("site_id", "")) == site_id:
			return site.duplicate(true)
	var parts := site_id.split(".")
	if parts.size() != 5 or parts[0] != "site":
		return {}
	var type_id := str(parts[1])
	if not _rules_by_type.has(type_id):
		return {}
	var region := Vector2i(int(parts[3]), int(parts[4]))
	var candidate := _regional_candidate(_rules_by_type[type_id], region)
	if str(candidate.get("site_id", "")) != site_id:
		return {}
	return candidate


func validate_starter_contract(seed_value: int = master_seed) -> Dictionary:
	if seed_value != master_seed or anchors.is_empty():
		generate(seed_value, VERSION)
	var errors := validate()
	return {
		"ok": errors.is_empty(),
		"seed": master_seed,
		"starter_mode": starter_mode,
		"plan_id": identity(),
		"site_plan_hash": site_plan_hash,
		"placement_rule_hash": placement_rule_hash,
		"errors": errors,
		"failure_reasons": errors.duplicate(),
		"anchors": anchors.duplicate(true),
		"routes": routes.duplicate(true),
		"sites": starter_sites.duplicate(true),
		"manifest": save_manifest(),
	}


func validate() -> Array[String]:
	var errors: Array[String] = []
	if placement_rules.size() != 6:
		errors.append("placement_rules_invalid:%d" % placement_rules.size())
	for anchor_id in REQUIRED_ANCHORS:
		if not anchors.has(anchor_id):
			errors.append("missing_anchor:%s" % anchor_id)
	if not errors.is_empty():
		return errors
	for site in starter_sites:
		for field in [
			"site_id", "type_id", "origin_chunk", "position", "rotation",
			"variant_id", "footprint", "parent_site_id",
			"validation_result", "region",
		]:
			if not site.has(field):
				errors.append("starter_site_missing_field:%s:%s" % [
					site.get("type_id", "unknown"), field])
	for route in routes:
		if not anchors.has(str(route.get("from", ""))) \
				or not anchors.has(str(route.get("to", ""))):
			errors.append("route_endpoint_missing:%s" % route.get("id", "unknown"))
	var spawn := Vector2(anchors["spawn"])
	for type_id in STARTER_BANDS_CHUNKS:
		var band: Vector2i = STARTER_BANDS_CHUNKS[type_id]
		var distance_chunks := spawn.distance_to(
			Vector2(anchors[type_id])) / float(CHUNK_SIZE)
		if distance_chunks < float(band.x) - 0.1 \
				or distance_chunks > float(band.y) + 0.1:
			errors.append("starter_distance:%s:%.2f" % [
				type_id, distance_chunks])
	var camp_distance := Vector2(anchors["goblin_camp"]).distance_to(
		Vector2(anchors["hamlet"])) / float(CHUNK_SIZE)
	if camp_distance < 6.0:
		errors.append("camp_inside_settlement_safe_radius:%.2f" % camp_distance)
	for i in starter_sites.size():
		var a: Dictionary = starter_sites[i]
		if str(a["type_id"]) in ["warehouse", "watchtower_site", "raid_approach"]:
			continue
		for j in range(i + 1, starter_sites.size()):
			var b: Dictionary = starter_sites[j]
			if str(b["type_id"]) in ["warehouse", "watchtower_site", "raid_approach"]:
				continue
			if _sites_overlap(a, b, 4.0):
				errors.append("starter_overlap:%s:%s" % [
					a["type_id"], b["type_id"]])
	return errors


func get_anchor(id: String) -> Vector2i:
	return Vector2i(anchors.get(id, Vector2i.ZERO))


func structure_distance_rules() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for type_id in STARTER_BANDS_CHUNKS:
		var band: Vector2i = STARTER_BANDS_CHUNKS[type_id]
		out.append({
			"a": "spawn",
			"b": type_id,
			"min": float(band.x * CHUNK_SIZE),
			"max": float(band.y * CHUNK_SIZE),
		})
	return out


func get_route_points(route: Dictionary) -> Array[Vector2i]:
	return [
		get_anchor(str(route["from"])),
		get_anchor(str(route["to"])),
	]


func relation_graph() -> Dictionary:
	var graph := {}
	for anchor_id in anchors:
		graph[anchor_id] = []
	for route in routes:
		graph[route["from"]].append(route["to"])
		graph[route["to"]].append(route["from"])
	return graph


func identity() -> String:
	# plan_version, rather than the current constant, is critical here: a
	# worldgen-v4/plan-v3 save must retain its original identity forever.
	return "%s:v%d:%s" % [_profile_id(), plan_version, _starter_hash()]


func _profile_id() -> String:
	return LEGACY_REGIONAL_PROFILE_ID if plan_version == LEGACY_VERSION else PROFILE_ID


func save_manifest() -> Dictionary:
	var algorithm_id := (
		ALGORITHM_ID if plan_version == VERSION else LEGACY_ALGORITHM_ID)
	return {
		"profile_id": _profile_id(),
		"version": plan_version,
		"algorithm_id": algorithm_id,
		"config_id": "%s:%s:%s" % [
			algorithm_id, starter_mode, placement_rule_hash],
		"starter_mode": starter_mode,
		"plan_id": identity(),
		"site_plan_hash": site_plan_hash,
		"placement_rule_hash": placement_rule_hash,
		"sub_seeds": sub_seeds.duplicate(),
		"fallback_used": false,
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


func settlement_sites_in_chunk_rect(chunk_rect: Rect2i) -> Array[Dictionary]:
	var filter: Array[String] = ["hamlet"]
	return query_sites(chunk_rect, filter)


func settlement_layout(site: Dictionary) -> Dictionary:
	if str(site.get("type_id", "")) != "hamlet":
		return {}
	var hamlet := Vector2i(site.get("position", Vector2i.ZERO))
	var directions: Array[Vector2i] = [
		Vector2i.RIGHT, Vector2i.DOWN, Vector2i.LEFT, Vector2i.UP,
	]
	var forward: Vector2i = directions[
		posmod(int(site.get("rotation", 0)) / 90, 4)]
	var right := Vector2i(-forward.y, forward.x)
	if plan_version == VERSION:
		return _compose_camp_layout(site, hamlet, forward, right)
	if bool(site.get("is_starter", false)):
		return _compose_settlement_layout(
			site,
			hamlet,
			get_anchor("warehouse"),
			get_anchor("watchtower_site"),
			hamlet + forward * 3,
			forward,
			right)
	var rng := _rng_for("settlement.layout:%s" % str(site["site_id"]))
	return _compose_settlement_layout(
		site,
		hamlet,
		hamlet + right * rng.randi_range(8, 12)
			+ forward * rng.randi_range(-3, 3),
		hamlet - right * rng.randi_range(11, 16)
			+ forward * rng.randi_range(10, 16),
		hamlet + forward * 3,
		forward,
		right)


func _compose_camp_layout(
		site: Dictionary,
		center: Vector2i,
		forward: Vector2i,
		right: Vector2i) -> Dictionary:
	## Stage B settlements begin as compact three-person camps. The generated
	## site remains type "hamlet" for spacing/save compatibility, but no later
	## catalogue building is stamped here.
	var rng := _rng_for("settlement.camp_layout:%s" % str(site["site_id"]))
	var handedness := -1 if rng.randi() % 2 == 0 else 1
	var tent_a := center + forward * 5 + right * (4 * handedness)
	var tent_b := center - forward * 4 - right * (4 * handedness)
	var supply_yard := center - forward * 6 + right * (2 * handedness)
	var request_board := center + forward * 2
	var future_watchtower := center + forward * rng.randi_range(13, 17) \
		- right * handedness * rng.randi_range(8, 12)
	var roads: Array[Dictionary] = [
		_layout_road(site, "tent_a", center, tent_a, 1),
		_layout_road(site, "tent_b", center, tent_b, 1),
		_layout_road(site, "supply_yard", center, supply_yard, 1),
		_layout_road(site, "request_board", center, request_board, 1),
		_layout_road(site, "future_watchtower", center, future_watchtower, 1),
	]
	var plots: Array[Dictionary] = [
		{
			"plot_id": "%s.plot.tent_a" % site["site_id"],
			"role": "housing",
			"position": tent_a,
			"footprint": Vector2i(5, 5),
			"bed_capacity": 2,
		},
		{
			"plot_id": "%s.plot.tent_b" % site["site_id"],
			"role": "housing",
			"position": tent_b,
			"footprint": Vector2i(5, 5),
			"bed_capacity": 2,
		},
		{
			"plot_id": "%s.plot.builder_yard" % site["site_id"],
			"role": "work",
			"position": supply_yard,
			"footprint": Vector2i(7, 6),
			"job_capacity": 4,
		},
	]
	return {
		"settlement_id": "settlement.%s" % site["site_id"],
		"initial_stage": "camp",
		"hamlet": center,
		"campfire": center,
		"warehouse": supply_yard,
		"supply_yard": supply_yard,
		"watchtower_site": future_watchtower,
		"request_board": request_board,
		"tents": [tent_a, tent_b],
		"plots": plots,
		"roads": roads,
		"variant_id": "camp_%s" % str(site.get("variant_id", "spine")),
		"rotation": int(site.get("rotation", 0)),
	}


func _compose_settlement_layout(
		site: Dictionary,
		hamlet: Vector2i,
		warehouse: Vector2i,
		watchtower: Vector2i,
		request_board: Vector2i,
		forward: Vector2i,
		right: Vector2i) -> Dictionary:
	var plots: Array[Dictionary] = []
	var plot_specs := [
		["residence_a", "residence", forward * 7 + right * 6],
		["residence_b", "residence", forward * 7 - right * 6],
		["work_a", "work", -forward * 6 + right * 6],
		["work_b", "work", -forward * 6 - right * 6],
	]
	for spec in plot_specs:
		plots.append({
			"plot_id": "%s.plot.%s" % [site["site_id"], spec[0]],
			"role": spec[1],
			"position": hamlet + Vector2i(spec[2]),
			"footprint": Vector2i(7, 7),
		})
	var roads: Array[Dictionary] = [
		_layout_road(site, "warehouse", hamlet, warehouse, 2),
		_layout_road(site, "watchtower", hamlet, watchtower, 2),
		_layout_road(site, "request_board", hamlet, request_board, 1),
	]
	for plot in plots:
		roads.append(_layout_road(
			site, str(plot["role"]) + "." + str(plot["plot_id"]).get_file(),
			hamlet, Vector2i(plot["position"]), 1))
	return {
		"settlement_id": "settlement.%s" % site["site_id"],
		"hamlet": hamlet,
		"warehouse": warehouse,
		"watchtower_site": watchtower,
		"request_board": request_board,
		"plots": plots,
		"roads": roads,
		"variant_id": str(site.get("variant_id", "spine")),
		"rotation": int(site.get("rotation", 0)),
	}


func _layout_road(
		site: Dictionary,
		suffix: String,
		from_point: Vector2i,
		to_point: Vector2i,
		width: int) -> Dictionary:
	return {
		"road_id": "%s.road.%s" % [site["site_id"], suffix],
		"from": from_point,
		"to": to_point,
		"width": width,
		"validation_result": "valid",
	}


func _variant_for(type_id: String, position: Vector2i) -> String:
	if not _rules_by_type.has(type_id):
		return "starter"
	var variants: Array = _rules_by_type[type_id].get("variants", ["starter"])
	var rng := _rng_for("starter.variant:%s:%d:%d" % [
		type_id, position.x, position.y])
	return str(variants[rng.randi_range(0, variants.size() - 1)])


func _priority_for(type_id: String) -> int:
	if type_id in ["spawn", "base_site", "water", "warehouse",
			"watchtower_site", "raid_approach"]:
		return 1000
	return int((_rules_by_type.get(type_id, {}) as Dictionary).get(
		"priority", 0))


func _site_id(type_id: String, region: Vector2i) -> String:
	var digest := derive_seed(master_seed, "starter_site:%s:%d:%d" % [
		type_id, region.x, region.y])
	return "site.%s.starter.%08x" % [type_id, digest]


func _starter_region(type_id: String, position: Vector2i) -> Vector2i:
	var chunk := _world_to_chunk(position)
	var rule: Dictionary = _rules_by_type.get(type_id, {})
	var spacing := int(rule.get("spacing_chunks", 1))
	return Vector2i(
		_floor_div(chunk.x, maxi(1, spacing)),
		_floor_div(chunk.y, maxi(1, spacing)))


func _starter_hash() -> String:
	var parts: Array[String] = [
		str(master_seed), placement_rule_hash, starter_mode,
	]
	var ids: Array = anchors.keys()
	ids.sort()
	for anchor_id in ids:
		var point := Vector2i(anchors[anchor_id])
		parts.append("%s:%d:%d" % [anchor_id, point.x, point.y])
	var sites := starter_sites.duplicate(true)
	sites.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a["site_id"]) < str(b["site_id"]))
	for site in sites:
		var point := Vector2i(site["position"])
		var region := Vector2i(site["region"])
		parts.append("site:%s:%s:%d:%d:%d:%d:%d:%s:%s" % [
			site["site_id"], site["type_id"], region.x, region.y,
			point.x, point.y, int(site["rotation"]),
			site["variant_id"], site["parent_site_id"],
		])
	for route in routes:
		parts.append("route:%s:%s:%s:%s" % [
			route["id"], route["from"], route["to"], route["kind"]])
	return "%08x" % derive_seed(master_seed, "|".join(parts))


func _rng_for(channel: String) -> RandomNumberGenerator:
	var rng := RandomNumberGenerator.new()
	rng.seed = derive_seed(master_seed, channel)
	return rng


func _chunk_center(chunk: Vector2i) -> Vector2i:
	return chunk * CHUNK_SIZE + Vector2i(CHUNK_SIZE / 2, CHUNK_SIZE / 2)


func _world_to_chunk(position: Vector2i) -> Vector2i:
	return Vector2i(
		_floor_div(position.x, CHUNK_SIZE),
		_floor_div(position.y, CHUNK_SIZE))


func _floor_div(value: int, divisor: int) -> int:
	return floori(float(value) / float(divisor))


func _site_intersects_chunk_rect(site: Dictionary, chunk_rect: Rect2i) -> bool:
	var position := Vector2i(site["position"])
	var footprint := Vector2i(site["footprint"])
	var half := Vector2(
		float(footprint.x) * 0.5, float(footprint.y) * 0.5)
	var minimum := _world_to_chunk(Vector2i(
		floori(float(position.x) - half.x),
		floori(float(position.y) - half.y)))
	var maximum := _world_to_chunk(Vector2i(
		ceili(float(position.x) + half.x),
		ceili(float(position.y) + half.y)))
	var site_rect := Rect2i(minimum, maximum - minimum + Vector2i.ONE)
	return site_rect.intersects(chunk_rect)


func _overlaps_any(
		site: Dictionary,
		others: Array[Dictionary],
		padding: float) -> bool:
	for other in others:
		if str(site.get("site_id", "")) == str(other.get("site_id", "")):
			return true
		if _sites_overlap(site, other, padding):
			return true
	return false


func _sites_overlap(a: Dictionary, b: Dictionary, padding: float) -> bool:
	var point_a := Vector2(a["position"])
	var point_b := Vector2(b["position"])
	var footprint_a := Vector2(a["footprint"])
	var footprint_b := Vector2(b["footprint"])
	var minimum := maxf(
		footprint_a.length() * 0.5,
		footprint_b.length() * 0.5) + padding
	return point_a.distance_to(point_b) < minimum
