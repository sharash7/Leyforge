class_name ForgeProceduralStructureAssembler
extends RefCounted
## Deterministic, bounded assembly preview for dungeons and continuing structures.

var _validation_cache: Dictionary = {}


func generate(
		module_set: ForgeBlueprintModuleSet,
		modules_by_id: Dictionary,
		rules: ForgeProceduralStructureRuleSet,
		continuation_state: Dictionary = {}) -> Dictionary:
	var diagnostics := _validated_sources(module_set, modules_by_id, rules)
	if _has_blocking_diagnostic(diagnostics):
		return {
			"ok": false,
			"diagnostics": _diagnostic_records(diagnostics),
			"error": "Structure sources failed validation.",
		}
	var rng := RandomNumberGenerator.new()
	rng.seed = int(continuation_state.get("rng_state", rules.seed))
	var placements: Array[Dictionary] = []
	for placement in continuation_state.get("placements", []):
		if placement is Dictionary:
			placements.append(placement.duplicate(true))
	var frontier: Array[Dictionary] = []
	for connector_record in continuation_state.get("frontier", []):
		if connector_record is Dictionary:
			var restored := _restore_frontier_record(connector_record, modules_by_id)
			if not restored.is_empty(): frontier.append(restored)
	var occupied := {}
	for placement in placements:
		var placed_module: Variant = modules_by_id.get(str(placement.get("module_id", "")))
		if placed_module is ForgeBlueprintModuleDefinition:
			_occupy_module(placed_module, _vector3i(placement.get("position", [0, 0, 0])),
				int(placement.get("rotation_quarters", 0)), occupied, rules.collision_policy)
	if placements.is_empty():
		var start_ids: Array = Array(module_set.start_module_ids) \
			if not module_set.start_module_ids.is_empty() else Array(module_set.module_ids)
		var root_id := _choose_weighted(start_ids, module_set, rng)
		if root_id.is_empty():
			return {"ok": false, "error": "Structure set has no usable start module."}
		var root: ForgeBlueprintModuleDefinition = modules_by_id[root_id]
		placements.append(_placement_record(root_id, Vector3i.ZERO, 0, 0, ""))
		_occupy_module(root, Vector3i.ZERO, 0, occupied, rules.collision_policy)
		frontier.append_array(_module_frontier(root, Vector3i.ZERO, 0, 0, ""))
	var module_counts := _module_counts(placements)
	var placed_kinds := _placed_kinds(placements, modules_by_id)
	var attempts := 0
	var attempt_limit := maxi(64, rules.maximum_modules * rules.maximum_open_connectors * 4)
	while placements.size() < rules.maximum_modules \
			and not frontier.is_empty() and attempts < attempt_limit:
		attempts += 1
		var frontier_index := rng.randi_range(0, frontier.size() - 1)
		var target: Dictionary = frontier[frontier_index]
		frontier.remove_at(frontier_index)
		var depth := int(target.get("depth", 0)) + 1
		if depth > rules.maximum_depth:
			continue
		var required_kind := _next_required_kind(rules, placed_kinds, placements.size())
		if not _has_missing_required(rules, placed_kinds) \
				and placements.size() > 1 \
				and rng.randf() < rules.termination_chance:
			continue
		var candidates := _connection_candidates(
			target, module_set, modules_by_id, occupied, rules, module_counts, required_kind)
		if candidates.is_empty():
			continue
		var chosen: Dictionary = _choose_candidate(candidates, module_set, rng)
		var module_id := str(chosen["module_id"])
		var origin: Vector3i = chosen["origin"]
		var rotation := int(chosen["rotation_quarters"])
		var used_connector_id := str(chosen["connector_id"])
		var module: ForgeBlueprintModuleDefinition = modules_by_id[module_id]
		placements.append(_placement_record(
			module_id, origin, rotation, depth, str(target.get("connector_id", "")),
			used_connector_id, str(target.get("owner_placement_id", ""))))
		_occupy_module(module, origin, rotation, occupied, rules.collision_policy)
		module_counts[module_id] = int(module_counts.get(module_id, 0)) + 1
		placed_kinds[module.module_kind] = true
		var new_frontier := _module_frontier(
			module, origin, rotation, depth, used_connector_id)
		for record in new_frontier:
			if frontier.size() >= rules.maximum_open_connectors:
				break
			frontier.append(record)
	var continuation := {
		"schema": "leyforge.forge.procedural-structure-continuation",
		"rule_set_id": rules.rule_set_id,
		"module_set_id": module_set.module_set_id,
		"rng_state": rng.state,
		"placements": placements.duplicate(true),
		"frontier": _serializable_frontier(frontier),
		"checkpoint": {
			"placement_count": placements.size(),
			"interval": rules.continuation_checkpoint_interval,
			"hash": ForgeStableRecord.hash_record({"placements": placements}),
		},
	}
	for required_tag in rules.required_module_tags:
		if not placed_kinds.has(required_tag):
			return {"ok": false, "error": "Required procedural room was not placed: %s" % required_tag,
				"placements": placements, "continuation_state": continuation}
	return {
		"ok": true,
		"placements": placements,
		"open_connectors": frontier,
		"continuation_state": continuation if rules.continuing else {},
		"terminated": frontier.is_empty() or placements.size() >= rules.maximum_modules,
		"attempts": attempts,
		"source_hash": ForgeStableRecord.hash_record({
			"module_set": module_set.to_record(),
			"rules": rules.to_record(),
			"placements": placements,
		}),
		"diagnostics": _diagnostic_records(diagnostics),
	}


func _validated_sources(
		module_set: ForgeBlueprintModuleSet, modules_by_id: Dictionary,
		rules: ForgeProceduralStructureRuleSet) -> Array[ForgeDiagnostic]:
	var module_hashes := {}
	for module_id in module_set.module_ids if module_set != null else []:
		var module: Variant = modules_by_id.get(module_id)
		if module is ForgeBlueprintModuleDefinition:
			module_hashes[module_id] = module.canonical_hash()
	var key := ForgeStableRecord.hash_record({
		"module_set": module_set.canonical_hash() if module_set != null else "",
		"modules": module_hashes,
		"rule_contract": {
			"id": rules.rule_set_id, "module_set_id": rules.module_set_id,
			"maximum_modules": rules.maximum_modules, "maximum_depth": rules.maximum_depth,
			"maximum_open_connectors": rules.maximum_open_connectors,
			"termination_chance": rules.termination_chance,
			"collision_policy": rules.collision_policy,
			"maximum_repeats": rules.maximum_repeats_per_module,
			"dead_end_policy": rules.dead_end_policy,
			"checkpoint_interval": rules.continuation_checkpoint_interval,
		},
	})
	if _validation_cache.has(key):
		return _validation_cache[key]
	var validator := ForgeModularStructureValidationService.new()
	var diagnostics := validator.validate_module_set(module_set, modules_by_id)
	diagnostics.append_array(validator.validate_rule_set(rules, module_set))
	for module_id in module_set.module_ids if module_set != null else []:
		var module: Variant = modules_by_id.get(module_id)
		if module is ForgeBlueprintModuleDefinition:
			diagnostics.append_array(validator.validate_module_connectors(module))
	_validation_cache[key] = diagnostics
	return diagnostics


func _connection_candidates(
		target: Dictionary, module_set: ForgeBlueprintModuleSet,
		modules_by_id: Dictionary, occupied: Dictionary,
		rules: ForgeProceduralStructureRuleSet, module_counts: Dictionary,
		required_kind: String) -> Array[Dictionary]:
	var candidates: Array[Dictionary] = []
	var target_connector: ForgeBlueprintConnectorDefinition = target["connector"]
	var target_position: Vector3i = target["world_position"]
	var target_direction: Vector3i = target["world_direction"]
	var module_ids: Array = Array(module_set.module_ids)
	module_ids.sort()
	for module_id_value in module_ids:
		var module_id := str(module_id_value)
		var module: Variant = modules_by_id.get(module_id)
		if not module is ForgeBlueprintModuleDefinition:
			continue
		if int(module_counts.get(module_id, 0)) >= rules.maximum_repeats_per_module:
			continue
		if not required_kind.is_empty() and module.module_kind != required_kind:
			continue
		for connector in module.connectors:
			if connector == null or not target_connector.can_connect_to(connector):
				continue
			for rotation in 4:
				var direction := _rotate_y(connector.direction, rotation)
				if direction != -target_direction:
					continue
				var origin := target_position - _rotate_y(connector.position, rotation)
				if _module_collides(module, origin, rotation, occupied, rules.collision_policy):
					continue
				candidates.append({
					"module_id": module_id,
					"connector_id": connector.connector_id,
					"origin": origin,
					"rotation_quarters": rotation,
				})
	return candidates


func _choose_candidate(
		candidates: Array[Dictionary], module_set: ForgeBlueprintModuleSet,
		rng: RandomNumberGenerator) -> Dictionary:
	var total := 0.0
	for candidate in candidates:
		total += module_set.weight_for(str(candidate["module_id"]))
	var roll := rng.randf() * total
	for candidate in candidates:
		roll -= module_set.weight_for(str(candidate["module_id"]))
		if roll <= 0.0:
			return candidate
	return candidates.back()


func _choose_weighted(
		module_ids: Array, module_set: ForgeBlueprintModuleSet,
		rng: RandomNumberGenerator) -> String:
	var usable: Array[String] = []
	for module_id_value in module_ids:
		var module_id := str(module_id_value)
		if module_id in module_set.module_ids and module_set.weight_for(module_id) > 0.0:
			usable.append(module_id)
	usable.sort()
	if usable.is_empty():
		return ""
	var total := 0.0
	for module_id in usable:
		total += module_set.weight_for(module_id)
	var roll := rng.randf() * total
	for module_id in usable:
		roll -= module_set.weight_for(module_id)
		if roll <= 0.0:
			return module_id
	return usable.back()


func _module_frontier(
		module: ForgeBlueprintModuleDefinition, origin: Vector3i,
		rotation: int, depth: int, excluded_connector_id: String) -> Array[Dictionary]:
	var frontier: Array[Dictionary] = []
	for connector in module.connectors:
		if connector == null or connector.connector_id == excluded_connector_id:
			continue
		frontier.append({
			"module_id": module.module_id,
			"connector_id": connector.connector_id,
			"connector": connector,
			"world_position": origin + _rotate_y(connector.position, rotation),
			"world_direction": _rotate_y(connector.direction, rotation),
			"depth": depth,
			"owner_placement_id": _placement_id(module.module_id, origin, depth),
		})
	return frontier


func _placement_record(
		module_id: String, position: Vector3i, rotation: int,
		depth: int, connected_from: String, connector_id := "",
		connected_from_placement := "") -> Dictionary:
	return {
		"placement_id": _placement_id(module_id, position, depth),
		"module_id": module_id,
		"position": [position.x, position.y, position.z],
		"rotation_quarters": rotation,
		"depth": depth,
		"connected_from": connected_from,
		"connector_id": connector_id,
		"connected_from_placement": connected_from_placement,
	}


func _placement_id(module_id: String, position: Vector3i, depth: int) -> String:
	return "placement.%s.%d.%d.%d.%d" % [
		ForgeId.safe_filename(module_id), position.x, position.y, position.z, depth]


func _rotate_y(value: Vector3i, quarters: int) -> Vector3i:
	match posmod(quarters, 4):
		1:
			return Vector3i(-value.z, value.y, value.x)
		2:
			return Vector3i(-value.x, value.y, -value.z)
		3:
			return Vector3i(value.z, value.y, -value.x)
		_:
			return value


func _position_key(value: Vector3i) -> String:
	return "%d,%d,%d" % [value.x, value.y, value.z]


func _module_counts(placements: Array[Dictionary]) -> Dictionary:
	var result := {}
	for placement in placements:
		var module_id := str(placement.get("module_id", ""))
		result[module_id] = int(result.get(module_id, 0)) + 1
	return result


func _placed_kinds(placements: Array[Dictionary], modules_by_id: Dictionary) -> Dictionary:
	var result := {}
	for placement in placements:
		var module: Variant = modules_by_id.get(str(placement.get("module_id", "")))
		if module is ForgeBlueprintModuleDefinition: result[module.module_kind] = true
	return result


func _next_required_kind(
		rules: ForgeProceduralStructureRuleSet, placed_kinds: Dictionary,
		placement_count: int) -> String:
	for required_tag in rules.required_module_tags:
		if placed_kinds.has(required_tag): continue
		if required_tag == "encounter" and placement_count < rules.minimum_modules_before_encounter:
			return ""
		if required_tag == "terminal_exit" and placement_count < rules.minimum_modules_before_terminal:
			return ""
		return required_tag
	return ""


func _has_missing_required(
		rules: ForgeProceduralStructureRuleSet, placed_kinds: Dictionary) -> bool:
	for required_tag in rules.required_module_tags:
		if not placed_kinds.has(required_tag): return true
	return false


func _module_collides(
		module: ForgeBlueprintModuleDefinition, origin: Vector3i, rotation: int,
		occupied: Dictionary, policy: String) -> bool:
	if policy == "none": return false
	if policy == "module_origin": return occupied.has(_position_key(origin))
	for cell in _module_cells(module, origin, rotation):
		if occupied.has(_position_key(cell)): return true
	return false


func _occupy_module(
		module: ForgeBlueprintModuleDefinition, origin: Vector3i, rotation: int,
		occupied: Dictionary, policy: String) -> void:
	if policy == "none": return
	if policy == "module_origin":
		occupied[_position_key(origin)] = true
		return
	for cell in _module_cells(module, origin, rotation):
		occupied[_position_key(cell)] = true


func _module_cells(
		module: ForgeBlueprintModuleDefinition, origin: Vector3i,
		rotation: int) -> Array[Vector3i]:
	var cells: Array[Vector3i] = []
	for element in module.elements:
		if element == null: continue
		for z in element.size.z:
			for y in element.size.y:
				for x in element.size.x:
					# Connector seams may share their outermost voxel row; occupied
					# interiors may never overlap.
					if element.size.x > 2 and x in [0, element.size.x - 1]: continue
					if element.size.z > 2 and z in [0, element.size.z - 1]: continue
					var local := element.position + Vector3i(x, y, z)
					cells.append(origin + _rotate_y(local, rotation))
	return cells


func _serializable_frontier(frontier: Array[Dictionary]) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for record in frontier:
		var position := _vector3i(record.get("world_position", Vector3i.ZERO))
		var direction := _vector3i(record.get("world_direction", Vector3i.ZERO))
		result.append({
			"module_id": str(record.get("module_id", "")),
			"connector_id": str(record.get("connector_id", "")),
			"world_position": [position.x, position.y, position.z],
			"world_direction": [direction.x, direction.y, direction.z],
			"depth": int(record.get("depth", 0)),
			"owner_placement_id": str(record.get("owner_placement_id", "")),
		})
	return result


func _restore_frontier_record(record: Dictionary, modules_by_id: Dictionary) -> Dictionary:
	var module: Variant = modules_by_id.get(str(record.get("module_id", "")))
	if not module is ForgeBlueprintModuleDefinition: return {}
	for connector in module.connectors:
		if connector != null and connector.connector_id == str(record.get("connector_id", "")):
			var restored := record.duplicate(true)
			restored["connector"] = connector
			restored["world_position"] = _vector3i(record.get("world_position", [0, 0, 0]))
			restored["world_direction"] = _vector3i(record.get("world_direction", [0, 0, 0]))
			return restored
	return {}


func _vector3i(value: Variant) -> Vector3i:
	if value is Vector3i:
		return value
	if value is Array and value.size() >= 3:
		return Vector3i(int(value[0]), int(value[1]), int(value[2]))
	return Vector3i.ZERO


func _has_blocking_diagnostic(diagnostics: Array[ForgeDiagnostic]) -> bool:
	for diagnostic in diagnostics:
		if diagnostic.severity in [
				ForgeDiagnostic.ERROR, ForgeDiagnostic.CRITICAL,
				ForgeDiagnostic.BLOCKER, ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER]:
			return true
	return false


func _diagnostic_records(diagnostics: Array[ForgeDiagnostic]) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for diagnostic in diagnostics:
		records.append(diagnostic.to_record())
	return records
