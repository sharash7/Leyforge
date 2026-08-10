class_name ForgeAuthoringTypeRegistry
extends RefCounted
## Registry/factory for editable source types across all four Forge studios.

const RECORDS: Array[Dictionary] = [
	{"type_id": "structure.blueprint", "domain": "structures", "display_name": "Building / Structure", "resource_class": "ForgeBlueprintDefinition", "schema_id": "leyforge.forge.blueprint-definition", "id_prefix": "blueprint.leyforge.", "id_property": "blueprint_id", "source_root": "res://content/forge/blueprints/user", "capabilities": ["elements", "materials", "placement", "states", "preview", "bake"]},
	{"type_id": "structure.module", "domain": "structures", "display_name": "Room / Structure Module", "resource_class": "ForgeBlueprintModuleDefinition", "schema_id": "leyforge.forge.blueprint-module-definition", "id_prefix": "blueprint.module.", "id_property": "module_id", "source_root": "res://content/forge/blueprints/user/modules", "status_property": "", "capabilities": ["elements", "connectors", "preview"]},
	{"type_id": "structure.module_set", "domain": "structures", "display_name": "Room / Structure Set", "resource_class": "ForgeBlueprintModuleSet", "schema_id": "leyforge.forge.blueprint-module-set", "id_prefix": "blueprint.module_set.", "id_property": "module_set_id", "source_root": "res://content/forge/blueprints/user/sets", "capabilities": ["modules", "weights", "starts", "ends", "preview"]},
	{"type_id": "structure.rule_set", "domain": "structures", "display_name": "Procedural Generation Rules", "resource_class": "ForgeProceduralStructureRuleSet", "schema_id": "leyforge.forge.procedural-structure-rule-set", "id_prefix": "blueprint.ruleset.", "id_property": "rule_set_id", "source_root": "res://content/forge/blueprints/user/rules", "capabilities": ["bounds", "seed", "continuation", "preview", "bake"]},
	{"type_id": "structure.state", "domain": "structures", "display_name": "Building State / Damage Variant", "resource_class": "ForgeBlueprintStateDefinition", "schema_id": "leyforge.forge.blueprint-state-definition", "id_prefix": "blueprint.state.", "id_property": "state_id", "display_property": "", "source_root": "res://content/forge/blueprints/user/states", "status_property": "", "capabilities": ["construction", "damage", "occupation", "repair", "preview", "bake"]},
	{"type_id": "character.entity", "domain": "characters", "display_name": "Character / Creature", "resource_class": "ForgeEntityDefinition", "schema_id": "leyforge.forge.entity-definition", "id_prefix": "entity.definition.", "id_property": "entity_definition_id", "source_root": "res://content/forge/entities/user", "capabilities": ["body", "materials", "roles", "preview", "bake"]},
	{"type_id": "character.body_plan", "domain": "characters", "display_name": "Body Plan", "resource_class": "ForgeBodyPlanDefinition", "schema_id": "leyforge.forge.body-plan", "id_prefix": "entity.body_plan.", "id_property": "body_plan_id", "source_root": "res://content/forge/entities/user/body_plans", "status_property": "", "capabilities": ["parts", "symmetry", "contacts", "preview"]},
	{"type_id": "character.body_part", "domain": "characters", "display_name": "Body Part", "resource_class": "ForgeBodyPartDefinition", "schema_id": "leyforge.forge.body-part", "id_prefix": "entity.body_part.", "id_property": "body_part_id", "source_root": "res://content/forge/entities/user/body_parts", "status_property": "", "capabilities": ["voxel", "pivot", "sockets", "preview"]},
	{"type_id": "character.rig", "domain": "characters", "display_name": "Rig", "resource_class": "ForgeRigProfile", "schema_id": "leyforge.forge.rig-profile", "id_prefix": "entity.rig.", "id_property": "rig_profile_id", "source_root": "res://content/forge/entities/user/rigs", "capabilities": ["roles", "joints", "sockets", "preview"]},
	{"type_id": "character.animation_library", "domain": "characters", "display_name": "Animation Library", "resource_class": "ForgeEntityAnimationLibrary", "schema_id": "leyforge.forge.entity-animation-library", "id_prefix": "entity.animation_set.", "id_property": "animation_library_id", "source_root": "res://content/forge/entities/user/animations", "capabilities": ["timeline", "tracks", "events", "preview"]},
	{"type_id": "character.variant", "domain": "characters", "display_name": "Character Variant", "resource_class": "ForgeEntityVariantProfile", "schema_id": "leyforge.forge.entity-variant-profile", "id_prefix": "entity.variant.", "id_property": "variant_profile_id", "source_root": "res://content/forge/entities/user/variants", "capabilities": ["materials", "equipment", "proportions", "preview"]},
	{"type_id": "character.equipment", "domain": "characters", "display_name": "Equipment Fit", "resource_class": "ForgeEquipmentFitProfile", "schema_id": "leyforge.forge.equipment-fit-profile", "id_prefix": "entity.equipment_profile.", "id_property": "equipment_profile_id", "source_root": "res://content/forge/entities/user/equipment", "status_property": "", "capabilities": ["socket", "transform", "preview"]},
	{"type_id": "vfx.graph", "domain": "vfx", "display_name": "VFX Graph", "resource_class": "ForgeVfxGraph", "schema_id": "leyforge.forge.vfx-graph", "id_prefix": "vfx.graph.", "id_property": "stable_id", "source_root": "res://content/forge/presentation/set23/user/vfx", "capabilities": ["nodes", "parameters", "timeline", "preview", "bake"]},
	{"type_id": "vfx.form", "domain": "vfx", "display_name": "Voxel VFX Form", "resource_class": "ForgeVfxForm", "schema_id": "leyforge.forge.vfx-form", "id_prefix": "vfx.form.", "id_property": "stable_id", "source_root": "res://content/forge/presentation/set23/user/vfx", "capabilities": ["voxel", "palette", "pivot", "preview"]},
	{"type_id": "vfx.effect", "domain": "vfx", "display_name": "VFX Effect", "resource_class": "ForgeVfxDefinition", "schema_id": "leyforge.forge.vfx-definition", "id_prefix": "vfx.effect.", "id_property": "stable_id", "source_root": "res://content/forge/presentation/set23/user/vfx", "capabilities": ["graph", "forms", "lod", "accessibility", "preview", "bake"]},
	{"type_id": "audio.synth_patch", "domain": "audio", "display_name": "Synth Instrument / Sound", "resource_class": "ForgeSynthPatchDefinition", "schema_id": "leyforge.forge.synth-patch", "id_prefix": "sound.source.synth.", "id_property": "stable_id", "source_root": "res://content/forge/presentation/set23/user/audio", "capabilities": ["keyboard", "oscillators", "envelope", "filter", "modulation", "preview", "bake"]},
	{"type_id": "audio.source", "domain": "audio", "display_name": "Recorded Sound Source", "resource_class": "ForgeSoundSource", "schema_id": "leyforge.forge.sound-source", "id_prefix": "sound.source.", "id_property": "stable_id", "source_root": "res://content/forge/presentation/set23/user/audio", "capabilities": ["import", "trim", "normalize", "preview", "bake"]},
	{"type_id": "audio.event", "domain": "audio", "display_name": "Sound Event", "resource_class": "ForgeSoundEvent", "schema_id": "leyforge.forge.sound-event", "id_prefix": "sound.event.", "id_property": "stable_id", "source_root": "res://content/forge/presentation/set23/user/audio", "capabilities": ["layers", "variation", "loop", "spatial", "caption", "preview", "bake"]},
	{"type_id": "audio.spatial_profile", "domain": "audio", "display_name": "Spatial Audio Profile", "resource_class": "ForgeSpatialAudioProfile", "schema_id": "leyforge.forge.spatial-audio-profile", "id_prefix": "sound.spatial.", "id_property": "stable_id", "source_root": "res://content/forge/presentation/set23/user/audio", "capabilities": ["distance", "occlusion", "reverb", "preview"]},
]

var _by_type: Dictionary = {}


func _init() -> void:
	for record in RECORDS:
		var descriptor := ForgeAuthoringTypeDescriptor.from_record(record)
		_by_type[descriptor.type_id] = descriptor


func resolve(type_id: String) -> ForgeAuthoringTypeDescriptor:
	return _by_type.get(type_id)


func for_resource(resource: Resource) -> ForgeAuthoringTypeDescriptor:
	if resource is ForgeBlueprintDefinition: return resolve("structure.blueprint")
	if resource is ForgeBlueprintModuleDefinition: return resolve("structure.module")
	if resource is ForgeBlueprintModuleSet: return resolve("structure.module_set")
	if resource is ForgeProceduralStructureRuleSet: return resolve("structure.rule_set")
	if resource is ForgeBlueprintStateDefinition: return resolve("structure.state")
	if resource is ForgeEntityDefinition: return resolve("character.entity")
	if resource is ForgeBodyPlanDefinition: return resolve("character.body_plan")
	if resource is ForgeBodyPartDefinition: return resolve("character.body_part")
	if resource is ForgeRigProfile: return resolve("character.rig")
	if resource is ForgeEntityAnimationLibrary: return resolve("character.animation_library")
	if resource is ForgeEntityVariantProfile: return resolve("character.variant")
	if resource is ForgeEquipmentFitProfile: return resolve("character.equipment")
	if resource is ForgeVfxGraph: return resolve("vfx.graph")
	if resource is ForgeVfxForm: return resolve("vfx.form")
	if resource is ForgeVfxDefinition: return resolve("vfx.effect")
	if resource is ForgeSynthPatchDefinition: return resolve("audio.synth_patch")
	if resource is ForgeSoundSource: return resolve("audio.source")
	if resource is ForgeSoundEvent: return resolve("audio.event")
	if resource is ForgeSpatialAudioProfile: return resolve("audio.spatial_profile")
	return null


func all(domain := "") -> Array[ForgeAuthoringTypeDescriptor]:
	var values: Array[ForgeAuthoringTypeDescriptor] = []
	for descriptor in _by_type.values():
		if domain.is_empty() or descriptor.domain == domain:
			values.append(descriptor)
	values.sort_custom(func(a: ForgeAuthoringTypeDescriptor,
			b: ForgeAuthoringTypeDescriptor) -> bool:
		return a.type_id < b.type_id)
	return values


func create(type_id: String, slug: String, title: String) -> Resource:
	var descriptor := resolve(type_id)
	if descriptor == null:
		return null
	var resource := _instantiate(type_id)
	if resource == null:
		return null
	var safe_slug := _safe_slug(slug if not slug.is_empty() else title)
	resource.set(descriptor.id_property, "%s%s" % [descriptor.id_prefix, safe_slug])
	if not descriptor.display_property.is_empty() \
			and descriptor.display_property != descriptor.id_property:
		resource.set(descriptor.display_property,
			title.strip_edges() if not title.strip_edges().is_empty() else safe_slug.capitalize())
	_apply_defaults(type_id, resource, safe_slug)
	return resource


func assign_new_identity(
		resource: Resource, type_id: String, slug: String, title: String) -> bool:
	var descriptor := resolve(type_id)
	if descriptor == null or resource == null:
		return false
	resource.set(descriptor.id_property, "%s%s" % [descriptor.id_prefix, _safe_slug(slug)])
	if not descriptor.display_property.is_empty() \
			and descriptor.display_property != descriptor.id_property:
		resource.set(descriptor.display_property, title.strip_edges())
	if not descriptor.status_property.is_empty():
		resource.set(descriptor.status_property, "draft")
	if not descriptor.lifecycle_property.is_empty():
		resource.set(descriptor.lifecycle_property, "draft")
	return true


func _instantiate(type_id: String) -> Resource:
	match type_id:
		"structure.blueprint": return ForgeBlueprintDefinition.new()
		"structure.module": return ForgeBlueprintModuleDefinition.new()
		"structure.module_set": return ForgeBlueprintModuleSet.new()
		"structure.rule_set": return ForgeProceduralStructureRuleSet.new()
		"structure.state": return ForgeBlueprintStateDefinition.new()
		"character.entity": return ForgeEntityDefinition.new()
		"character.body_plan": return ForgeBodyPlanDefinition.new()
		"character.body_part": return ForgeBodyPartDefinition.new()
		"character.rig": return ForgeRigProfile.new()
		"character.animation_library": return ForgeEntityAnimationLibrary.new()
		"character.variant": return ForgeEntityVariantProfile.new()
		"character.equipment": return ForgeEquipmentFitProfile.new()
		"vfx.graph": return ForgeVfxGraph.new()
		"vfx.form": return ForgeVfxForm.new()
		"vfx.effect": return ForgeVfxDefinition.new()
		"audio.synth_patch": return ForgeSynthPatchDefinition.new()
		"audio.source": return ForgeSoundSource.new()
		"audio.event": return ForgeSoundEvent.new()
		"audio.spatial_profile": return ForgeSpatialAudioProfile.new()
	return null


func _apply_defaults(type_id: String, resource: Resource, slug: String) -> void:
	if resource is ForgeEntityDefinition:
		var body_plan := _new_body_plan(slug, resource.display_name)
		resource.body_plan = body_plan
		resource.body_family = body_plan.family
	elif resource is ForgeBodyPlanDefinition:
		var seeded := _new_body_plan(slug, resource.display_name)
		resource.root_part_id = seeded.root_part_id
		resource.body_parts = seeded.body_parts
	elif resource is ForgeBodyPartDefinition:
		_seed_body_part(resource)
	elif resource is ForgeBlueprintModuleDefinition:
		resource.schema_version = 2
		resource.physical_authoring_mode = "voxel_grid"
		resource.structure_voxel_source = ForgeStructureVoxelSource.new()
		resource.structure_voxel_source.ensure_defaults()
		var connectors: Array[ForgeBlueprintConnectorDefinition] = [
			_new_connector(resource.module_id, slug, "entrance", Vector3i.ZERO, Vector3i.BACK),
			_new_connector(resource.module_id, slug, "exit", Vector3i(0, 0, 4), Vector3i.FORWARD),
		]
		resource.connectors = connectors
	elif resource is ForgeBlueprintDefinition:
		resource.schema_version = 2
		resource.physical_authoring_mode = "voxel_grid"
		resource.structure_voxel_source = ForgeStructureVoxelSource.new()
		resource.structure_voxel_source.ensure_defaults()
		var placement := ForgePlacementProfile.new()
		placement.placement_profile_id = "blueprint.placement_profile.%s" % slug
		resource.placement_profile = placement
		var roles := ForgeBlueprintMaterialRoleSet.new()
		roles.material_role_set_id = "blueprint.material_role_set.%s" % slug
		roles.display_name = "%s Material Roles" % resource.display_name
		resource.material_role_set = roles
	elif resource is ForgeBlueprintModuleSet:
		resource.continuation_policy = "finite"
	elif resource is ForgeProceduralStructureRuleSet:
		resource.seed = abs(hash(slug)) + 1
	elif resource is ForgeVfxGraph:
		var nodes: Array[Dictionary] = [
			{"id": "emit", "type": "emitter", "parameters": {"count": 8}}]
		resource.nodes = nodes
	elif resource is ForgeVfxForm:
		var cells: Array[Dictionary] = [
			{"position": [0, 0, 0], "palette_index": 0}]
		resource.cell_records = cells
	elif resource is ForgeSynthPatchDefinition:
		resource.preview_midi_note = 60
		resource.provenance = {"origin": "audio_forge_synth", "file_upload_required": false}


func _new_body_plan(slug: String, title: String) -> ForgeBodyPlanDefinition:
	var plan := ForgeBodyPlanDefinition.new()
	plan.body_plan_id = "entity.body_plan.%s" % slug
	plan.display_name = "%s Body Plan" % title
	var root := ForgeBodyPartDefinition.new()
	root.body_part_id = "entity.body_part.%s.root" % slug
	root.display_name = "Root"
	_seed_body_part(root)
	plan.root_part_id = root.body_part_id
	plan.body_parts = [root]
	return plan


func _seed_body_part(part: ForgeBodyPartDefinition) -> void:
	var volume := ForgeVoxelVolume.new()
	volume.dimensions = Vector3i(8, 8, 8)
	volume.density_profile = part.density_profile_id
	volume.voxel_size_meters = 0.125
	volume.ensure_storage()
	volume.set_cell(Vector3i(3, 3, 3), 0)
	part.voxel_source = volume


func _new_connector(
		module_id: String, slug: String, suffix: String,
		position: Vector3i, direction: Vector3i) -> ForgeBlueprintConnectorDefinition:
	var connector := ForgeBlueprintConnectorDefinition.new()
	connector.connector_id = "blueprint.connector.%s.%s" % [slug, suffix]
	connector.display_name = suffix.capitalize()
	connector.owner_module_id = module_id
	connector.position = position
	connector.direction = direction
	return connector


func _safe_slug(value: String) -> String:
	var slug := value.strip_edges().to_lower()
	for character in [" ", "/", "\\", ":", "."]:
		slug = slug.replace(character, "_")
	var filtered := ""
	for character in slug:
		if character >= "a" and character <= "z" \
				or character >= "0" and character <= "9" \
				or character in ["_", "-"]:
			filtered += character
	while "__" in filtered:
		filtered = filtered.replace("__", "_")
	return filtered.trim_prefix("_").trim_suffix("_") if not filtered.is_empty() else "new_source"
