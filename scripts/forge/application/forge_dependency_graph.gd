@tool
class_name ForgeDependencyGraph
extends RefCounted
## Derived invalidation graph. Canonical dependency IDs stay in source assets.

var dependencies: Dictionary = {}
var dependents: Dictionary = {}


func rebuild(records: Array[Dictionary]) -> Dictionary:
	dependencies.clear()
	dependents.clear()
	for record in records:
		var source_id := str(record.get(
			"source_id", record.get(
				"stable_id", record.get("forge_asset_id", ""))))
		if source_id.is_empty():
			continue
		var values: Array[String] = []
		for value in record.get("dependency_ids", []):
			values.append(str(value))
		dependencies[source_id] = values
		for dependency_id in values:
			if not dependents.has(dependency_id):
				dependents[dependency_id] = []
			dependents[dependency_id].append(source_id)
	return {
		"node_count": dependencies.size(),
		"edge_count": _edge_count(),
		"cycles": detect_cycles(),
	}


func invalidation_closure(changed_ids: PackedStringArray) -> PackedStringArray:
	var affected := {}
	var queue: Array[String] = []
	for id in changed_ids:
		affected[id] = true
		queue.append(id)
	while not queue.is_empty():
		var current: String = queue.pop_front()
		for dependent in dependents.get(current, []):
			if affected.has(dependent):
				continue
			affected[dependent] = true
			queue.append(dependent)
	var result := PackedStringArray()
	for id in affected:
		result.append(str(id))
	result.sort()
	return result


func detect_cycles() -> Array[PackedStringArray]:
	var cycles: Array[PackedStringArray] = []
	var visiting := {}
	var visited := {}
	var stack: Array[String] = []
	for id in dependencies:
		_visit(str(id), visiting, visited, stack, cycles)
	return cycles


func _visit(
		id: String, visiting: Dictionary, visited: Dictionary,
		stack: Array[String], cycles: Array[PackedStringArray]) -> void:
	if visited.has(id):
		return
	if visiting.has(id):
		var start := stack.find(id)
		if start >= 0:
			var cycle := PackedStringArray(stack.slice(start))
			cycle.append(id)
			cycles.append(cycle)
		return
	visiting[id] = true
	stack.append(id)
	for dependency_id in dependencies.get(id, []):
		if dependencies.has(dependency_id):
			_visit(dependency_id, visiting, visited, stack, cycles)
	stack.pop_back()
	visiting.erase(id)
	visited[id] = true


func _edge_count() -> int:
	var count := 0
	for values in dependencies.values():
		count += values.size()
	return count
