extends Node
## Default 256-seed deterministic planner gate. Override with
## --worldgen-seeds=10000 for the extended acceptance suite.

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var requested_count := 256
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--worldgen-seeds="):
			requested_count = clampi(
				int(arg.trim_prefix("--worldgen-seeds=")), 1, 100000)
	var layout_signatures := {}
	var spawn_distances := {}
	var quadrants := {}
	var observed_types := {}
	var representative_seeds: Array[int] = [
		-2147483648, -1, 0, 1, 2147483647,
		int(WorldManager.resolve_seed("Leyforge")["resolved"]),
		int(WorldManager.resolve_seed("leyforge")["resolved"]),
	]
	_check(
		int(WorldManager.resolve_seed("-42")["resolved"]) == -42,
		"signed numeric seed was not preserved")
	_check(
		int(WorldManager.resolve_seed("Leyforge")["resolved"])
			!= int(WorldManager.resolve_seed("leyforge")["resolved"]),
		"text seeds are not case-sensitive")
	_check(
		int(WorldManager.resolve_seed("  Leyforge  ")["resolved"])
			== int(WorldManager.resolve_seed("Leyforge")["resolved"]),
		"text seed whitespace was not trimmed")

	for index in requested_count:
		var seed_value := (
			representative_seeds[index]
			if index < representative_seeds.size()
			else ValleyPlan.derive_seed(index, "stage_a.seed_suite"))
		var first := WorldStructurePlanner.new()
		first.generate(seed_value, WorldStructurePlanner.VERSION)
		var second := WorldStructurePlanner.new()
		second.generate(seed_value, WorldStructurePlanner.VERSION)
		_check(not first.fallback_used, "seed %d used fallback" % seed_value)
		_check(first.validation_errors.is_empty(), "seed %d invalid: %s" % [
			seed_value, first.validation_errors])
		_check(
			first.identity() == second.identity(),
			"seed %d changed plan identity" % seed_value)
		_check(
			first.anchors == second.anchors and first.routes == second.routes
				and first.starter_sites == second.starter_sites,
			"seed %d changed deterministic plan contents" % seed_value)
		_check(
			bool(first.validate_starter_contract().get("ok", false)),
			"seed %d starter contract is invalid" % seed_value)
		var query_rect := Rect2i(Vector2i(-16, -16), Vector2i(32, 32))
		var first_sites := first.query_sites(query_rect)
		var second_sites := second.query_sites(query_rect)
		_check(
			_site_signature(first_sites) == _site_signature(second_sites),
			"seed %d regional query changed contents" % seed_value)
		var left_rect := Rect2i(query_rect.position, Vector2i(
			query_rect.size.x / 2, query_rect.size.y))
		var right_rect := Rect2i(
			query_rect.position + Vector2i(query_rect.size.x / 2, 0),
			Vector2i(query_rect.size.x - left_rect.size.x, query_rect.size.y))
		_check(
			_site_signature(first_sites)
				== _site_signature(_merge_sites([
					first.query_sites(right_rect),
					first.query_sites(left_rect),
				])),
			"seed %d changed sites when chunks were queried in reverse order"
				% seed_value)
		_check(
			_site_ids_are_unique(first_sites),
			"seed %d produced duplicate site IDs" % seed_value)
		_check(
			_site_lookup_roundtrips(first, first_sites),
			"seed %d could not reconstruct a site from its stable ID" % seed_value)
		_check(
			_regional_sites_are_suitable(first, first_sites),
			"seed %d accepted an invalid biome or terrain candidate" % seed_value)
		_check(
			_hard_spacing_is_valid(first, first_sites),
			"seed %d violated hard structure spacing" % seed_value)
		_check(
			_footprints_do_not_overlap(first_sites),
			"seed %d produced overlapping regional footprints" % seed_value)
		_check(
			not first.query_sites(Rect2i(
				Vector2i(-48, -48), Vector2i(8, 8))).is_empty(),
			"seed %d produced no negative-region sites" % seed_value)
		var relative_parts: Array[String] = []
		var hamlet: Vector2i = first.get_anchor("hamlet")
		for anchor_id in WorldStructurePlanner.REQUIRED_ANCHORS:
			var relative := first.get_anchor(anchor_id) - hamlet
			relative_parts.append("%s:%d:%d" % [
				anchor_id, relative.x, relative.y])
		layout_signatures["|".join(relative_parts)] = true
		var spawn_distance := roundi(Vector2(first.get_anchor(
			"spawn")).distance_to(Vector2(hamlet)))
		spawn_distances[spawn_distance] = true
		var delta := hamlet - first.get_anchor("spawn")
		quadrants["%d:%d" % [signi(delta.x), signi(delta.y)]] = true
		for site in first_sites:
			observed_types[str(site.get("type_id", ""))] = true

	_check(
		layout_signatures.size() >= floori(float(requested_count) * 0.99),
		"layout diversity too low: %d unique geometries" % layout_signatures.size())
	_check(
		spawn_distances.size() >= mini(16, requested_count / 4),
		"anchor distance diversity too low: %d spawn distances" % spawn_distances.size())
	_check(
		quadrants.has("1:1") and quadrants.has("1:-1")
			and quadrants.has("-1:1") and quadrants.has("-1:-1"),
		"starter hamlets did not cover all quadrants")
	_check(
		observed_types.size() >= 6,
		"not every regional structure type was observed")
	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"seeds": requested_count,
		"unique_layouts": layout_signatures.size(),
		"unique_spawn_distances": spawn_distances.size(),
		"failures": failures,
	}
	print("CURRENT_WORLDGEN_FAST_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if failures.is_empty() else 1)


func _site_signature(sites: Array[Dictionary]) -> String:
	var parts: Array[String] = []
	for site in sites:
		var point := Vector2i(site["position"])
		parts.append("%s:%s:%d:%d:%d:%s" % [
			site["site_id"], site["type_id"], point.x, point.y,
			int(site.get("rotation", 0)), site.get("variant_id", ""),
		])
	parts.sort()
	return "|".join(parts)


func _merge_sites(groups: Array) -> Array[Dictionary]:
	var by_id := {}
	for group in groups:
		for site in group:
			by_id[str(site.get("site_id", ""))] = site
	var merged: Array[Dictionary] = []
	for site in by_id.values():
		merged.append(site)
	return merged


func _site_ids_are_unique(sites: Array[Dictionary]) -> bool:
	var ids := {}
	for site in sites:
		var site_id := str(site.get("site_id", ""))
		if site_id.is_empty() or ids.has(site_id):
			return false
		ids[site_id] = true
	return true


func _site_lookup_roundtrips(
		planner: WorldStructurePlanner,
		sites: Array[Dictionary]) -> bool:
	for site in sites:
		if bool(site.get("is_starter", false)):
			continue
		if planner.get_site(str(site.get("site_id", ""))) != site:
			return false
	return true


func _regional_sites_are_suitable(
		planner: WorldStructurePlanner,
		sites: Array[Dictionary]) -> bool:
	var rules := {}
	for rule in planner.placement_rules:
		rules[str(rule["type_id"])] = rule
	for site in sites:
		if bool(site.get("is_starter", false)):
			continue
		var type_id := str(site.get("type_id", ""))
		if not rules.has(type_id) \
				or not planner._candidate_is_suitable(
					rules[type_id], Vector2i(site["position"])):
			return false
	return true


func _hard_spacing_is_valid(
		planner: WorldStructurePlanner,
		sites: Array[Dictionary]) -> bool:
	var minimum_by_type := {}
	for rule in planner.placement_rules:
		minimum_by_type[str(rule["type_id"])] = (
			int(rule["separation_chunks"]) * WorldStructurePlanner.CHUNK_SIZE)
	for i in sites.size():
		var a: Dictionary = sites[i]
		var type_id := str(a["type_id"])
		if not minimum_by_type.has(type_id):
			continue
		for j in range(i + 1, sites.size()):
			var b: Dictionary = sites[j]
			if str(b["type_id"]) != type_id:
				continue
			if Vector2(a["position"]).distance_to(Vector2(b["position"])) \
					< float(minimum_by_type[type_id]):
				return false
	return true


func _footprints_do_not_overlap(sites: Array[Dictionary]) -> bool:
	for i in sites.size():
		var a: Dictionary = sites[i]
		for j in range(i + 1, sites.size()):
			var b: Dictionary = sites[j]
			var radius_a := Vector2(a["footprint"]).length() * 0.5
			var radius_b := Vector2(b["footprint"]).length() * 0.5
			var minimum := maxf(radius_a, radius_b) + 3.9
			if Vector2(a["position"]).distance_to(Vector2(b["position"])) \
					< minimum:
				return false
	return true
