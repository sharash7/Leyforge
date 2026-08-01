class_name ForgeBodyGraphService
extends RefCounted
## Typed graph edits routed through the shared Forge command history.


func add_part(
		body_plan: ForgeBodyPlanDefinition, part: ForgeBodyPartDefinition,
		commands: ForgeCommandService) -> bool:
	if not _editable(body_plan, commands) or part == null \
			or body_plan.find_body_part(part.body_part_id) != null:
		return false
	if not part.parent_part_id.is_empty() \
			and body_plan.find_body_part(part.parent_part_id) == null:
		return false
	return commands.execute(
		"Add body part %s" % part.display_name,
		func() -> void: body_plan.body_parts.append(part),
		func() -> void: body_plan.body_parts.erase(part))


func remove_part(
		body_plan: ForgeBodyPlanDefinition, part_id: String,
		commands: ForgeCommandService) -> bool:
	if not _editable(body_plan, commands) or part_id == body_plan.root_part_id:
		return false
	var part := body_plan.find_body_part(part_id)
	if part == null or not children_of(body_plan, part_id).is_empty():
		return false
	var index := body_plan.body_parts.find(part)
	return commands.execute(
		"Remove body part %s" % part.display_name,
		func() -> void: body_plan.body_parts.erase(part),
		func() -> void: body_plan.body_parts.insert(index, part))


func reparent_part(
		body_plan: ForgeBodyPlanDefinition, part_id: String,
		new_parent_id: String, commands: ForgeCommandService) -> bool:
	if not _editable(body_plan, commands) or part_id == body_plan.root_part_id:
		return false
	var part := body_plan.find_body_part(part_id)
	if part == null or body_plan.find_body_part(new_parent_id) == null \
			or _is_descendant(body_plan, new_parent_id, part_id):
		return false
	var previous_parent := part.parent_part_id
	if previous_parent == new_parent_id:
		return false
	return commands.execute(
		"Reparent body part %s" % part.display_name,
		func() -> void: part.parent_part_id = new_parent_id,
		func() -> void: part.parent_part_id = previous_parent)


func children_of(
		body_plan: ForgeBodyPlanDefinition, part_id: String) \
		-> Array[ForgeBodyPartDefinition]:
	var result: Array[ForgeBodyPartDefinition] = []
	if body_plan == null:
		return result
	for part in body_plan.body_parts:
		if part != null and part.parent_part_id == part_id:
			result.append(part)
	result.sort_custom(func(a: ForgeBodyPartDefinition,
			b: ForgeBodyPartDefinition) -> bool:
		return a.body_part_id < b.body_part_id)
	return result


func _is_descendant(
		body_plan: ForgeBodyPlanDefinition, candidate_id: String,
		ancestor_id: String) -> bool:
	var cursor := body_plan.find_body_part(candidate_id)
	var visited := {}
	while cursor != null and not cursor.parent_part_id.is_empty():
		if cursor.parent_part_id == ancestor_id:
			return true
		if visited.has(cursor.parent_part_id):
			return true
		visited[cursor.parent_part_id] = true
		cursor = body_plan.find_body_part(cursor.parent_part_id)
	return false


func _editable(
		body_plan: ForgeBodyPlanDefinition,
		commands: ForgeCommandService) -> bool:
	return body_plan != null and commands != null and not body_plan.template_locked
