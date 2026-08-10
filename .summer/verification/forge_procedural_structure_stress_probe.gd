extends Node
## Aggregate 10,000-seed acceptance for finite and continuing structure sets.

const FAMILIES := ["forest_road", "mine_tunnel", "cave_nest", "goblin_den", "rune_vault"]
const SEEDS_PER_FAMILY := 2000

var checks := 0
var failures: Array[String] = []
var generated_count := 0
var all_loaded := true
var all_generated := true
var all_bounded := true
var all_required := true
var all_non_overlapping := true
var all_connectors_match := true
var all_repetition_bounded := true
var all_deterministic := true
var all_continuations := true
var all_reconstructed := true
var all_terminated_safely := true


func _ready() -> void:
	for family_index in FAMILIES.size():
		_run_family(str(FAMILIES[family_index]), family_index)
	_expect(all_loaded, "all five procedural source families load")
	_expect(generated_count == FAMILIES.size() * SEEDS_PER_FAMILY,
		"aggregate generation covers exactly 10,000 seeds")
	_expect(all_generated, "all seeds assemble successfully")
	_expect(all_bounded, "all generations respect module, depth and attempt bounds")
	_expect(all_required, "all generations contain mandatory progression rooms")
	_expect(all_non_overlapping, "no generated module interiors overlap")
	_expect(all_connectors_match, "every placed module joins matching connection points")
	_expect(all_repetition_bounded, "module repetition limits are enforced")
	_expect(all_deterministic, "sampled seeds replay with identical hashes")
	_expect(all_continuations, "continuation checkpoints preserve and extend placements")
	_expect(all_reconstructed, "saved products reload and reconstruct continuation state")
	_expect(all_terminated_safely, "generation terminates or checkpoints within bounded attempts")
	print("FORGE_PROCEDURAL_STRUCTURE_STRESS_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(), "checks": checks, "seeds": generated_count,
		"families": FAMILIES.size(), "failures": failures}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _run_family(family: String, family_index: int) -> void:
	var set_path := "res://content/forge/blueprints/user/production/sets/%s.tres" % \
		ForgeId.safe_filename("blueprint.module_set.%s" % family)
	var rules_path := "res://content/forge/blueprints/user/production/rules/%s.tres" % \
		ForgeId.safe_filename("blueprint.ruleset.%s" % family)
	var module_set: ForgeBlueprintModuleSet = ResourceLoader.load(
		set_path, "", ResourceLoader.CACHE_MODE_IGNORE)
	var source_rules: ForgeProceduralStructureRuleSet = ResourceLoader.load(
		rules_path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if module_set == null or source_rules == null:
		all_loaded = false
		return
	var modules := {}
	for module_id in module_set.module_ids:
		var path := "res://content/forge/blueprints/user/production/modules/%s.tres" % \
			ForgeId.safe_filename(module_id)
		var module: ForgeBlueprintModuleDefinition = ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if module == null: all_loaded = false
		else: modules[module.module_id] = module
	if modules.size() != module_set.module_ids.size(): return
	var assembler := ForgeProceduralStructureAssembler.new()
	for seed_index in SEEDS_PER_FAMILY:
		var rules: ForgeProceduralStructureRuleSet = source_rules.duplicate(true)
		rules.seed = 1 + family_index * SEEDS_PER_FAMILY + seed_index
		rules.maximum_modules = 8
		rules.maximum_depth = 8
		var result := assembler.generate(module_set, modules, rules)
		generated_count += 1
		if not bool(result.get("ok", false)):
			all_generated = false
			continue
		var placements: Array = result.get("placements", [])
		all_bounded = all_bounded and placements.size() <= rules.maximum_modules \
			and _maximum_depth(placements) <= rules.maximum_depth \
			and int(result.get("attempts", 0)) <= maxi(64,
				rules.maximum_modules * rules.maximum_open_connectors * 4)
		all_required = all_required and _has_required(placements, modules, rules)
		all_non_overlapping = all_non_overlapping and not _has_interior_overlap(placements, modules)
		all_connectors_match = all_connectors_match and _connectors_match(placements, modules)
		all_repetition_bounded = all_repetition_bounded and _repetition_ok(placements, rules)
		all_terminated_safely = all_terminated_safely and (
			bool(result.get("terminated", false))
			or not (result.get("continuation_state", {}) as Dictionary).is_empty())
		if seed_index < 4:
			var replay := assembler.generate(module_set, modules, rules)
			all_deterministic = all_deterministic and bool(replay.get("ok", false)) \
				and str(replay.get("source_hash", "")) == str(result.get("source_hash", ""))
	if all_loaded:
		_test_continuation(family, family_index, module_set, modules, source_rules, assembler)


func _test_continuation(family: String, family_index: int,
		module_set: ForgeBlueprintModuleSet, modules: Dictionary,
		source_rules: ForgeProceduralStructureRuleSet,
		assembler: ForgeProceduralStructureAssembler) -> void:
	var initial_rules: ForgeProceduralStructureRuleSet = source_rules.duplicate(true)
	initial_rules.seed = 900001 + family_index
	initial_rules.maximum_modules = 8
	var initial := assembler.generate(module_set, modules, initial_rules)
	if not bool(initial.get("ok", false)):
		all_continuations = false
		all_reconstructed = false
		return
	var extended_rules: ForgeProceduralStructureRuleSet = source_rules.duplicate(true)
	extended_rules.seed = initial_rules.seed
	extended_rules.maximum_modules = 16
	var continued := assembler.generate(
		module_set, modules, extended_rules, initial.get("continuation_state", {}))
	all_continuations = all_continuations and bool(continued.get("ok", false)) \
		and _is_prefix(initial.get("placements", []), continued.get("placements", [])) \
		and Array(continued.get("placements", [])).size() >= Array(initial.get("placements", [])).size()
	var product := ForgeProceduralStructureProduct.new()
	product.product_id = "runtime.blueprint.procedural.stress_%s" % family
	product.rule_set_id = initial_rules.rule_set_id
	product.module_set_id = module_set.module_set_id
	product.source_hash = str(initial.get("source_hash", ""))
	product.placements.assign(initial.get("placements", []))
	product.open_connectors.assign(initial.get("open_connectors", []))
	product.continuation_state = initial.get("continuation_state", {})
	var save_path := "user://forge_procedural_stress/%s.tres" % family
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(save_path.get_base_dir()))
	var saved := ResourceSaver.save(product, save_path) == OK
	var loaded: ForgeProceduralStructureProduct = ResourceLoader.load(
		save_path, "", ResourceLoader.CACHE_MODE_IGNORE) if saved else null
	var reconstructed := assembler.generate(module_set, modules, extended_rules,
		loaded.continuation_state if loaded != null else {})
	all_reconstructed = all_reconstructed and loaded != null \
		and bool(reconstructed.get("ok", false)) \
		and _is_prefix(initial.get("placements", []), reconstructed.get("placements", []))


func _maximum_depth(placements: Array) -> int:
	var result := 0
	for placement in placements: result = maxi(result, int(placement.get("depth", 0)))
	return result


func _has_required(placements: Array, modules: Dictionary,
		rules: ForgeProceduralStructureRuleSet) -> bool:
	var kinds := {}
	for placement in placements:
		var module: Variant = modules.get(str(placement.get("module_id", "")))
		if module is ForgeBlueprintModuleDefinition: kinds[module.module_kind] = true
	for required in rules.required_module_tags:
		if not kinds.has(required): return false
	return true


func _has_interior_overlap(placements: Array, modules: Dictionary) -> bool:
	var occupied := {}
	for placement in placements:
		var module: ForgeBlueprintModuleDefinition = modules.get(str(placement.get("module_id", "")))
		if module == null: return true
		var origin := _v3i(placement.get("position", [0, 0, 0]))
		var rotation := int(placement.get("rotation_quarters", 0))
		for element in module.elements:
			if element == null: continue
			for z in element.size.z:
				for y in element.size.y:
					for x in element.size.x:
						if element.size.x > 2 and x in [0, element.size.x - 1]: continue
						if element.size.z > 2 and z in [0, element.size.z - 1]: continue
						var cell := origin + _rotate_y(element.position + Vector3i(x, y, z), rotation)
						var key := "%d,%d,%d" % [cell.x, cell.y, cell.z]
						if occupied.has(key): return true
						occupied[key] = true
	return false


func _connectors_match(placements: Array, modules: Dictionary) -> bool:
	for index in range(1, placements.size()):
		var placement: Dictionary = placements[index]
		var connector_id := str(placement.get("connector_id", ""))
		var parent_connector_id := str(placement.get("connected_from", ""))
		var parent_placement_id := str(placement.get("connected_from_placement", ""))
		var own := _world_connector(placement, connector_id, modules)
		var parent := {}
		for parent_index in index:
			if str(placements[parent_index].get("placement_id", "")) == parent_placement_id:
				parent = _world_connector(placements[parent_index], parent_connector_id, modules)
				break
		if own.is_empty() or parent.is_empty() \
				or own.position != parent.position or own.direction != -parent.direction:
			return false
	return true


func _world_connector(placement: Dictionary, connector_id: String,
		modules: Dictionary) -> Dictionary:
	var module: ForgeBlueprintModuleDefinition = modules.get(str(placement.get("module_id", "")))
	if module == null: return {}
	var origin := _v3i(placement.get("position", [0, 0, 0]))
	var rotation := int(placement.get("rotation_quarters", 0))
	for connector in module.connectors:
		if connector != null and connector.connector_id == connector_id:
			return {"position": origin + _rotate_y(connector.position, rotation),
				"direction": _rotate_y(connector.direction, rotation)}
	return {}


func _repetition_ok(placements: Array, rules: ForgeProceduralStructureRuleSet) -> bool:
	var counts := {}
	for placement in placements:
		var id := str(placement.get("module_id", ""))
		counts[id] = int(counts.get(id, 0)) + 1
		if int(counts[id]) > rules.maximum_repeats_per_module: return false
	return true


func _is_prefix(prefix: Array, values: Array) -> bool:
	if values.size() < prefix.size(): return false
	for index in prefix.size():
		if prefix[index] != values[index]: return false
	return true


func _v3i(value: Variant) -> Vector3i:
	if value is Vector3i: return value
	if value is Array and value.size() >= 3: return Vector3i(int(value[0]), int(value[1]), int(value[2]))
	return Vector3i.ZERO


func _rotate_y(value: Vector3i, quarters: int) -> Vector3i:
	match posmod(quarters, 4):
		1: return Vector3i(-value.z, value.y, value.x)
		2: return Vector3i(-value.x, value.y, -value.z)
		3: return Vector3i(value.z, value.y, -value.x)
	return value


func _expect(condition: bool, label: String) -> void:
	checks += 1
	if not condition: failures.append(label)
