class_name ForgeTemplateService
extends RefCounted
## Clone-safe entry point for protected golden Entity/Blueprint sources.


func duplicate_entity(
		source: ForgeEntityDefinition, new_entity_id: String,
		new_body_plan_id: String) -> ForgeEntityDefinition:
	if source == null or source.body_plan == null \
			or not ForgeId.is_valid(new_entity_id, "entity.definition.") \
			or not ForgeId.is_valid(new_body_plan_id, "entity.body_plan."):
		return null
	var clone := source.duplicate(false) as ForgeEntityDefinition
	var plan := source.body_plan.duplicate(false) as ForgeBodyPlanDefinition
	var part_prefix := "entity.body_part.%s" % new_body_plan_id.trim_prefix(
		"entity.body_plan.")
	var id_map := {}
	var cloned_parts: Array[ForgeBodyPartDefinition] = []
	for source_part in source.body_plan.body_parts:
		if source_part == null:
			continue
		var suffix := source_part.body_part_id.get_slice(
			".", source_part.body_part_id.get_slice_count(".") - 1)
		var cloned_part := source_part.duplicate(false) as ForgeBodyPartDefinition
		cloned_part.voxel_source = (
			source_part.voxel_source.duplicate(true)
			if source_part.voxel_source != null else null)
		cloned_part.body_part_id = "%s.%s" % [part_prefix, suffix]
		id_map[source_part.body_part_id] = cloned_part.body_part_id
		cloned_parts.append(cloned_part)
	for part in cloned_parts:
		part.parent_part_id = str(id_map.get(
			part.parent_part_id, part.parent_part_id))
	plan.body_plan_id = new_body_plan_id
	plan.root_part_id = str(id_map.get(
		source.body_plan.root_part_id, source.body_plan.root_part_id))
	plan.body_parts = cloned_parts
	plan.template_locked = false
	plan.lifecycle = "draft"
	clone.entity_definition_id = new_entity_id
	clone.body_plan = plan
	clone.template_id = ""
	clone.template_locked = false
	clone.source_status = "draft"
	clone.visual_approval = "open"
	clone.lifecycle = "draft"
	clone.legacy_fallback = ""
	return clone


func duplicate_blueprint(
		source: ForgeBlueprintDefinition,
		new_blueprint_id: String) -> ForgeBlueprintDefinition:
	if source == null \
			or not ForgeId.is_valid(new_blueprint_id, "blueprint."):
		return null
	var clone := source.duplicate(false) as ForgeBlueprintDefinition
	var elements: Array[ForgeBlueprintElement] = []
	for element in source.elements:
		if element != null:
			elements.append(element.duplicate(true) as ForgeBlueprintElement)
	clone.elements = elements
	if source.placement_profile != null:
		clone.placement_profile = source.placement_profile.duplicate(
			true) as ForgePlacementProfile
		clone.placement_profile.placement_profile_id = (
			"blueprint.placement_profile.%s" % ForgeId.safe_filename(
				new_blueprint_id.trim_prefix("blueprint.")))
	if source.material_role_set != null:
		clone.material_role_set = source.material_role_set.duplicate(
			true) as ForgeBlueprintMaterialRoleSet
	clone.blueprint_id = new_blueprint_id
	clone.template_id = ""
	clone.template_locked = false
	clone.source_status = "draft"
	clone.visual_approval = "open"
	clone.lifecycle = "draft"
	clone.legacy_fallback = ""
	return clone
