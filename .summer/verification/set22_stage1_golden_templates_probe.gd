extends Node
## Set 22K/L Stage 1 typed body graphs and golden source templates.

const HUMANOID_PATH := (
	"res://content/forge/entities/entity_definition_template_humanoid_standard.tres")
const PIG_PATH := (
	"res://content/forge/entities/entity_definition_template_pig_quadruped.tres")
const COTTAGE_PATH := (
	"res://content/forge/blueprints/blueprint_golden_small_forest_cottage.tres")
const ROLE_SET_PATH := (
	"res://content/forge/blueprints/material_role_set_forest_cottage_golden.tres")
const ARTIFACT_ROOT := "res://.summer/verification/artifacts/set22_stage1"
const DENSITY_PATHS := [
	"res://content/forge/entities/density_profiles/density_profile_entity_coarse.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_colossal_modular.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_fine.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_micro_accent.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_standard.tres",
]
const MATERIAL_PATHS := [
	"res://content/forge/materials/set22/material_dna_entity_bone_horn.tres",
	"res://content/forge/materials/set22/material_dna_entity_chitin_shell.tres",
	"res://content/forge/materials/set22/material_dna_entity_cloth.tres",
	"res://content/forge/materials/set22/material_dna_entity_corruption_void.tres",
	"res://content/forge/materials/set22/material_dna_entity_feathers.tres",
	"res://content/forge/materials/set22/material_dna_entity_hair_fur.tres",
	"res://content/forge/materials/set22/material_dna_entity_hide_leather.tres",
	"res://content/forge/materials/set22/material_dna_entity_mana_crystal_emission.tres",
	"res://content/forge/materials/set22/material_dna_entity_metal.tres",
	"res://content/forge/materials/set22/material_dna_entity_scales.tres",
	"res://content/forge/materials/set22/material_dna_entity_skin_tones.tres",
	"res://content/forge/materials/set22/material_dna_entity_stone_carved_stone.tres",
	"res://content/forge/materials/set22/material_dna_entity_wood_living_wood.tres",
]
const BLUEPRINT_ROLE_IDS := [
	"material_role.foundation_material",
	"material_role.wall_primary",
	"material_role.wall_secondary",
	"material_role.frame_material",
	"material_role.floor_material",
	"material_role.roof_material",
	"material_role.trim_material",
	"material_role.door_material",
	"material_role.window_material",
	"material_role.metal_fittings",
	"material_role.magic_accent",
]

var checks := 0
var failures: Array[String] = []
var _aggregate_hashes: PackedStringArray = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var semantic := _verify_semantic_catalogue()
	var densities := _verify_density_profiles()
	_verify_material_dna()
	var humanoid := _load_entity(HUMANOID_PATH)
	var pig := _load_entity(PIG_PATH)
	_verify_source_index(semantic, densities)
	_verify_entity_template(humanoid, "humanoid", 11, semantic, densities)
	_verify_entity_template(pig, "quadruped", 10, semantic, densities)
	_verify_round_trip(humanoid, "humanoid", semantic, densities)
	_verify_round_trip(pig, "pig", semantic, densities)
	_verify_graph_commands(humanoid, semantic, densities)
	_verify_cottage(semantic)
	_verify_schema_and_id_contracts()
	_verify_artifacts(humanoid, pig)
	_aggregate_hashes.sort()
	var payload := {
		"checks": checks,
		"failures": failures,
		"ok": failures.is_empty(),
		"deterministic_hash": (
			JSON.stringify(Array(_aggregate_hashes)).sha256_text()),
	}
	print("SET22_STAGE1_GOLDEN_TEMPLATES_PROBE %s" % JSON.stringify(payload))
	get_tree().quit(0 if failures.is_empty() else 1)


func _verify_semantic_catalogue() -> ForgeSemanticRegistry:
	var semantic := ForgeSemanticRegistry.new()
	var report := semantic.load_and_validate()
	_check(bool(report.get("ok", false)), "semantic registry did not validate")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"semantic registry retained diagnostics")
	_check(semantic.filtered_list("anatomy_role").size() >= 21,
		"anatomy-role catalogue did not contain 21 Stage 1 roles")
	_check(semantic.filtered_list("material_role").size() == 19,
		"material-role catalogue lost settlement or Stage 1 roles")
	for role_id in BLUEPRINT_ROLE_IDS:
		_check(semantic.has(role_id),
			"documented blueprint material role is missing: %s" % role_id)
	_check(semantic.has("anatomy.role.humanoid.pelvis"),
		"humanoid root anatomy role is missing")
	_check(semantic.has("anatomy.role.quadruped.torso"),
		"quadruped root anatomy role is missing")
	_check(str(semantic.resolve("entrance").get("id", ""))
		== "marker.role.entrance", "legacy entrance role alias stopped resolving")
	return semantic


func _verify_density_profiles() -> ForgeDensityProfileRegistry:
	var registry := ForgeDensityProfileRegistry.new()
	var report := registry.load_and_validate(PackedStringArray(DENSITY_PATHS))
	_check(bool(report.get("ok", false)), "density profile registry did not validate")
	_check(int(report.get("record_count", 0)) == 5,
		"density registry did not contain five standard profiles")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"density registry retained diagnostics")
	var validator := ForgeFoundationValidationService.new()
	for path in DENSITY_PATHS:
		var profile := load(path) as ForgeDensityProfile
		_check(profile != null, "density profile did not load: %s" % path)
		if profile == null:
			continue
		_check(registry.has(profile.density_profile_id),
			"density profile was not indexed")
		_check(validator.validate_density_profile(profile).is_empty(),
			"valid density profile was rejected")
		_check(not profile.canonical_hash().is_empty(),
			"density profile hash was empty")
		_check(is_equal_approx(profile.voxel_size_meters,
			1.0 / float(profile.voxels_per_meter)),
			"density profile scale drifted")
		_aggregate_hashes.append(profile.canonical_hash())
	var standard := registry.resolve("density.profile.entity.standard")
	_check(standard != null and standard.voxels_per_meter == 32,
		"standard density stopped being 32 voxels per metre")
	_check(registry.filtered_list("humanoid").size() >= 1
		and registry.filtered_list("quadruped").size() >= 1,
		"density profile filtering did not resolve golden families")
	return registry


func _verify_material_dna() -> void:
	var ids := {}
	for path in MATERIAL_PATHS:
		var material := load(path) as ForgeMaterialDefinition
		_check(material != null, "Material DNA source did not load: %s" % path)
		if material == null:
			continue
		_check(ForgeId.is_valid(material.material_id, "material."),
			"Material DNA ID is invalid")
		_check(not ids.has(material.material_id), "Material DNA ID is duplicated")
		ids[material.material_id] = true
		_check(material.applicable_domains == PackedStringArray(["entity"]),
			"Material DNA domain classification drifted")
		_check(material.swatch_hexes.size() == 3,
			"Material DNA family lost its bounded swatches")
		_check(material.lifecycle == "foundation_validated"
			and material.source_status == "validated_runtime_data",
			"Material DNA production status over- or under-claimed")
		_check(not material.canonical_hash().is_empty(),
			"Material DNA hash was empty")
		_aggregate_hashes.append(material.canonical_hash())
	_check(ids.size() == 13, "initial Material DNA library did not contain 13 families")


func _verify_source_index(
		semantic: ForgeSemanticRegistry,
		densities: ForgeDensityProfileRegistry) -> void:
	var index := ForgeAssetIndex.new()
	var report := index.load_and_validate(PackedStringArray([
		"res://content/forge/entities",
		"res://content/forge/blueprints",
		"res://content/forge/materials/set22",
	]), semantic, densities)
	_check(bool(report.get("ok", false)),
		"existing Forge index rejected Stage 1 sources")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"existing Forge index retained Stage 1 diagnostics")
	_check(int(report.get("record_count", 0)) == 45,
		"existing Forge index did not discover 45 Stage 1 sources")
	_check(index.has("entity.definition.template.humanoid_standard"),
		"Forge index did not resolve the humanoid template")
	_check(index.has("entity.definition.template.pig_quadruped"),
		"Forge index did not resolve the pig template")
	_check(index.has("blueprint.leyforge.residential.small_cottage_a"),
		"Forge index did not resolve the cottage template")
	_check(str(index.resolve(
		"blueprint.material_role_set.forest_cottage_golden").get(
			"foundation_kind", "")) == "blueprint_material_role_set",
		"Forge index material-role resolution drifted")
	_check(index.filtered_list("entity_definition").size() == 2,
		"Forge index entity-definition filtering drifted")
	_check(index.filtered_list("material_dna").size() == 13,
		"Forge index Material DNA filtering drifted")
	_check(not index.foundation_path_for(
		"blueprint.leyforge.residential.small_cottage_a").is_empty(),
		"Forge index did not expose the cottage source path")


func _load_entity(path: String) -> ForgeEntityDefinition:
	var entity := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE) as ForgeEntityDefinition
	_check(entity != null, "golden entity source did not load: %s" % path)
	return entity


func _verify_entity_template(
		entity: ForgeEntityDefinition, expected_family: String,
		expected_parts: int, semantic: ForgeSemanticRegistry,
		densities: ForgeDensityProfileRegistry) -> void:
	if entity == null:
		return
	var validator := ForgeValidationService.new()
	var diagnostics := validator.validate_entity_definition_source(
		entity, semantic, densities)
	_check(diagnostics.is_empty(),
		"golden %s entity did not validate" % expected_family)
	_check(entity.body_family == expected_family,
		"golden entity body family drifted")
	_check(entity.template_locked and entity.body_plan.template_locked,
		"golden source is not protected from direct graph mutation")
	_check(entity.lifecycle == "golden_source_candidate"
		and entity.visual_approval == "open",
		"golden source candidate claimed visual approval")
	_check(entity.source_status == "validated_editable_source",
		"golden entity editable source status drifted")
	_check(entity.body_plan.body_parts.size() == expected_parts,
		"golden %s part count drifted" % expected_family)
	_check(entity.body_plan.parts.is_empty(),
		"golden entity used the Stage 0 dictionary compatibility field")
	_check(entity.body_plan.find_body_part(entity.body_plan.root_part_id) != null,
		"golden body graph root did not resolve")
	_check(entity.density_profile_id == "density.profile.entity.standard",
		"golden entity stopped using standard density")
	var part_ids := {}
	var occupied := 0
	for part in entity.body_plan.body_parts:
		_check(part != null, "golden body graph contains an empty part")
		if part == null:
			continue
		_check(not part_ids.has(part.body_part_id),
			"golden body graph contains duplicate part IDs")
		part_ids[part.body_part_id] = true
		_check(part.voxel_source != null and part.voxel_source.occupied_count() > 0,
			"golden body part contains no editable voxels")
		_check(part.voxel_source.density_profile == part.density_profile_id,
			"golden body part density declaration drifted")
		_check(semantic.has(part.anatomy_role_id),
			"golden body part anatomy role did not resolve")
		_check(ForgeId.is_valid(part.material_dna_id, "material."),
			"golden body part Material DNA ID is invalid")
		_check(validator.validate_body_part_source(
			part, entity.body_plan, semantic, densities).is_empty(),
			"golden typed body part did not validate")
		occupied += part.voxel_source.occupied_count()
	_check(part_ids.size() == expected_parts,
		"golden body graph unique part count drifted")
	_check(occupied > 1000, "golden entity voxel source is unexpectedly sparse")
	var manifest := ForgeEntityPreviewManifestService.new().build(entity)
	_check(not manifest.is_empty(), "golden entity preview manifest was empty")
	_check(int(manifest.get("part_count", 0)) == expected_parts,
		"preview manifest part count drifted")
	_check(int(manifest.get("occupied_voxel_count", 0)) == occupied,
		"preview manifest occupied-voxel count drifted")
	_check(str(manifest.get("preview_hash", "")).length() == 64,
		"preview manifest hash was not a SHA-256 digest")
	_check(str(manifest.get("source_hash", "")) == entity.canonical_hash(),
		"preview manifest did not bind the canonical entity source")
	_aggregate_hashes.append(str(manifest.get("preview_hash", "")))


func _verify_round_trip(
		entity: ForgeEntityDefinition, label: String,
		semantic: ForgeSemanticRegistry,
		densities: ForgeDensityProfileRegistry) -> void:
	if entity == null:
		return
	var source_hash := entity.canonical_hash()
	var preview_hash := ForgeEntityPreviewManifestService.new().preview_hash(entity)
	var path := "user://set22_stage1_%s_roundtrip.tres" % label
	var save_error := ResourceSaver.save(entity, path)
	_check(save_error == OK, "golden %s entity did not save" % label)
	var loaded := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE) as ForgeEntityDefinition
	_check(loaded != null, "golden %s entity did not reload" % label)
	if loaded == null:
		return
	_check(loaded.canonical_hash() == source_hash,
		"golden %s canonical hash changed after reload" % label)
	_check(ForgeEntityPreviewManifestService.new().preview_hash(loaded)
		== preview_hash,
		"golden %s preview manifest changed after reload" % label)
	_check(ForgeValidationService.new().validate_entity_definition_source(
		loaded, semantic, densities).is_empty(),
		"reloaded golden %s entity did not validate" % label)
	_check(loaded.body_plan.body_parts.size() == entity.body_plan.body_parts.size(),
		"golden %s body graph changed after reload" % label)


func _verify_graph_commands(
		source: ForgeEntityDefinition, semantic: ForgeSemanticRegistry,
		densities: ForgeDensityProfileRegistry) -> void:
	if source == null:
		return
	var original_hash := source.canonical_hash()
	var templates := ForgeTemplateService.new()
	var clone := templates.duplicate_entity(
		source, "entity.definition.probe.humanoid_clone",
		"entity.body_plan.probe.humanoid_clone")
	_check(clone != null, "humanoid template did not duplicate")
	if clone == null:
		return
	_check(not clone.template_locked and not clone.body_plan.template_locked,
		"duplicated humanoid remained locked")
	_check(clone.template_id.is_empty() and clone.lifecycle == "draft",
		"duplicated humanoid retained golden-template authority")
	_check(clone.body_plan.body_parts.size() == source.body_plan.body_parts.size(),
		"duplicated humanoid lost body parts")
	_check(clone.body_plan.root_part_id.begins_with(
		"entity.body_part.probe.humanoid_clone."),
		"duplicated humanoid root ID was not remapped")
	var all_remapped := true
	for part in clone.body_plan.body_parts:
		all_remapped = all_remapped and part.body_part_id.begins_with(
			"entity.body_part.probe.humanoid_clone.")
		if not part.parent_part_id.is_empty():
			all_remapped = all_remapped and clone.body_plan.find_body_part(
				part.parent_part_id) != null
	_check(all_remapped, "duplicated humanoid part graph required manual ID repair")
	_check(source.canonical_hash() == original_hash,
		"template duplication mutated the locked golden source")
	_check(ForgeValidationService.new().validate_entity_definition_source(
		clone, semantic, densities).is_empty(),
		"duplicated humanoid required manual validation repair")
	var commands := ForgeCommandService.new()
	var graph := ForgeBodyGraphService.new()
	var accent := ForgeBodyPartDefinition.new()
	accent.body_part_id = "entity.body_part.probe.humanoid_clone.hat_accent"
	accent.display_name = "Hat Accent"
	accent.parent_part_id = clone.body_plan.find_body_part(
		"entity.body_part.probe.humanoid_clone.head").body_part_id
	accent.anatomy_role_id = "anatomy.role.humanoid.head"
	accent.density_profile_id = "density.profile.entity.standard"
	accent.material_dna_id = "material.dna.entity.cloth"
	accent.voxel_source = ForgeVoxelVolume.new()
	accent.voxel_source.dimensions = Vector3i(4, 4, 4)
	accent.voxel_source.density_profile = accent.density_profile_id
	accent.voxel_source.voxel_size_meters = 1.0 / 32.0
	accent.voxel_source.set_cell(Vector3i(1, 1, 1), 0)
	var before_count := clone.body_plan.body_parts.size()
	_check(graph.add_part(clone.body_plan, accent, commands),
		"typed graph add command failed")
	_check(clone.body_plan.body_parts.size() == before_count + 1,
		"typed graph add did not mutate the clone")
	_check(commands.undo(), "typed graph add did not enter shared undo history")
	_check(clone.body_plan.body_parts.size() == before_count,
		"typed graph add did not undo")
	_check(commands.redo(), "typed graph add did not redo")
	_check(clone.body_plan.find_body_part(accent.body_part_id) != null,
		"typed graph add redo did not restore the part")
	_check(graph.remove_part(clone.body_plan, accent.body_part_id, commands),
		"typed graph leaf removal failed")
	_check(clone.body_plan.find_body_part(accent.body_part_id) == null,
		"typed graph leaf removal did not remove the part")
	var hand_id := "entity.body_part.probe.humanoid_clone.hand_left"
	var torso_id := "entity.body_part.probe.humanoid_clone.torso"
	var hand := clone.body_plan.find_body_part(hand_id)
	var previous_parent := hand.parent_part_id
	_check(graph.reparent_part(clone.body_plan, hand_id, torso_id, commands),
		"typed graph reparent command failed")
	_check(hand.parent_part_id == torso_id, "typed graph reparent did not apply")
	_check(commands.undo(), "typed graph reparent did not undo")
	_check(hand.parent_part_id == previous_parent,
		"typed graph reparent undo did not restore the parent")
	_check(not graph.reparent_part(clone.body_plan,
		clone.body_plan.root_part_id, torso_id, commands),
		"typed graph allowed its root to be reparented")
	_check(not graph.reparent_part(clone.body_plan, torso_id,
		"entity.body_part.probe.humanoid_clone.head", commands),
		"typed graph allowed a parent-child cycle")
	var cycle_plan := clone.body_plan.duplicate(true) as ForgeBodyPlanDefinition
	cycle_plan.find_body_part(torso_id).parent_part_id = (
		"entity.body_part.probe.humanoid_clone.head")
	_check(_has_diagnostic(
		ForgeFoundationValidationService.new().validate_body_plan(
			cycle_plan, semantic, densities), "EFB-BODY-010"),
		"body graph cycle did not emit EFB-BODY-010")


func _verify_cottage(semantic: ForgeSemanticRegistry) -> void:
	var cottage := ResourceLoader.load(
		COTTAGE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE) \
		as ForgeBlueprintDefinition
	_check(cottage != null, "golden cottage source did not load")
	if cottage == null:
		return
	var diagnostics := ForgeValidationService.new().validate_blueprint_source(
		cottage, semantic)
	_check(diagnostics.is_empty(), "golden cottage source did not validate")
	_check(cottage.blueprint_id
		== "blueprint.leyforge.residential.small_cottage_a",
		"golden cottage did not use the canonical settlement blueprint ID")
	_check(cottage.legacy_fallback == "bp.building.cottage_forest_small",
		"golden cottage did not retain its active legacy fallback")
	_check(cottage.template_locked
		and cottage.template_id == "template.building.small_house",
		"golden cottage was not protected as the documented template")
	_check(cottage.lifecycle == "golden_source_candidate"
		and cottage.visual_approval == "open",
		"golden cottage over-claimed visual approval")
	_check(cottage.construction_deltas.is_empty(),
		"Stage 1 cottage implemented later construction-delta production")
	_check(cottage.elements.size() == 16,
		"golden cottage physical and semantic element count drifted")
	var marker_count := 0
	var element_ids := {}
	for element in cottage.elements:
		_check(element != null, "golden cottage contains an empty element")
		if element == null:
			continue
		_check(not element_ids.has(element.element_id),
			"golden cottage contains a duplicate stable element ID")
		element_ids[element.element_id] = true
		if element.element_kind == "marker":
			marker_count += 1
			_check(element.marker_role_ids.size() == 1
				and semantic.has(element.marker_role_ids[0]),
				"golden cottage marker did not resolve")
		elif not element.material_role_id.is_empty():
			_check(semantic.has(element.material_role_id),
				"golden cottage material role did not resolve")
	_check(marker_count == 6, "golden cottage did not retain six functional markers")
	var role_set := ResourceLoader.load(
		ROLE_SET_PATH, "", ResourceLoader.CACHE_MODE_IGNORE) \
		as ForgeBlueprintMaterialRoleSet
	_check(role_set != null, "golden cottage material role set did not load")
	if role_set != null:
		_check(role_set.required_role_ids.size() == 11
			and role_set.role_bindings.size() == 11,
			"golden cottage did not bind all 11 documented roles")
		_check(ForgeFoundationValidationService.new().validate_material_role_set(
			role_set, semantic).is_empty(),
			"golden cottage material role set did not validate")
		for role_id in BLUEPRINT_ROLE_IDS:
			_check(role_set.role_bindings.has(role_id),
				"golden cottage omitted material role: %s" % role_id)
			_check(ForgeId.is_valid(str(role_set.role_bindings.get(role_id, "")),
				"material."), "golden cottage material binding ID is invalid")
	_check(cottage.placement_profile != null
		and cottage.placement_profile.footprint_min == Vector3i(-2, 0, -3)
		and cottage.placement_profile.footprint_max == Vector3i(2, 4, 2),
		"golden cottage placement bounds drifted")
	var source_hash := cottage.canonical_hash()
	var path := "user://set22_stage1_cottage_roundtrip.tres"
	_check(ResourceSaver.save(cottage, path) == OK,
		"golden cottage did not save")
	var loaded := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE) as ForgeBlueprintDefinition
	_check(loaded != null and loaded.canonical_hash() == source_hash,
		"golden cottage hash changed after reload")
	var clone := ForgeTemplateService.new().duplicate_blueprint(
		cottage, "blueprint.leyforge.probe.cottage_clone_a")
	_check(clone != null, "golden cottage did not duplicate")
	if clone != null:
		_check(not clone.template_locked and clone.template_id.is_empty(),
			"duplicated cottage retained golden-template authority")
		_check(clone.legacy_fallback.is_empty() and clone.lifecycle == "draft",
			"duplicated cottage retained migration or approval state")
		_check(ForgeValidationService.new().validate_blueprint_source(
			clone, semantic).is_empty(),
			"duplicated cottage required manual validation repair")
		clone.elements[0].position += Vector3i.ONE
		_check(cottage.elements[0].position != clone.elements[0].position,
			"duplicated cottage shared mutable element Resources")
	_check(cottage.canonical_hash() == source_hash,
		"cottage duplication mutated the locked golden source")
	_aggregate_hashes.append(source_hash)


func _verify_schema_and_id_contracts() -> void:
	var schemas := ForgeSchemaRegistry.new()
	for schema_id in [
		"leyforge.forge.entity-definition",
		"leyforge.forge.body-part",
		"leyforge.forge.density-profile",
		"leyforge.forge.blueprint-material-role-set",
	]:
		_check(schemas.has(schema_id), "Stage 1 schema is not registered: %s" % schema_id)
	_check(schemas.filtered_list("entity").size() == 5,
		"entity schema family count drifted")
	_check(schemas.filtered_list("blueprint").size() == 5,
		"blueprint schema family count drifted")
	for stable_id in [
		"density.profile.entity.standard",
		"anatomy.role.humanoid.pelvis",
		"template.entity.humanoid.standard",
		"template.building.small_house",
	]:
		_check(ForgeId.is_valid(stable_id) and ForgeId.is_supported_family(stable_id),
			"Stage 1 stable-ID family did not validate: %s" % stable_id)


func _verify_artifacts(
		humanoid: ForgeEntityDefinition, pig: ForgeEntityDefinition) -> void:
	for name in [
		"source_baseline.json",
		"material_density_library.json",
		"entity_template_preview_contact_sheet.svg",
	]:
		var path := ARTIFACT_ROOT.path_join(name)
		_check(FileAccess.file_exists(path)
			and FileAccess.get_file_as_bytes(path).size() > 100,
			"Stage 1 artifact is missing or empty: %s" % name)
	var baseline := _json(ARTIFACT_ROOT.path_join("source_baseline.json"))
	_check(str(baseline.get("manual_visual_approval", "")) == "open",
		"Stage 1 source baseline closed manual visual approval")
	_check(str(baseline.get("runtime_factory_status", "")) == "not_started"
		and str(baseline.get("rigging_status", "")) == "not_started",
		"Stage 1 source baseline claimed later runtime or rig work")
	_check((baseline.get("entity_templates", []) as Array).size() == 2
		and (baseline.get("blueprint_templates", []) as Array).size() == 1,
		"Stage 1 source baseline template count drifted")
	var by_id := {}
	for record in baseline.get("entity_templates", []):
		by_id[str(record.get("id", ""))] = record
	for entity in [humanoid, pig]:
		if entity == null:
			continue
		var record: Dictionary = by_id.get(entity.entity_definition_id, {})
		_check(not record.is_empty(), "golden entity is missing from source baseline")
		_check(str(record.get("source_hash", "")) == entity.canonical_hash(),
			"golden entity source baseline hash drifted")
		_check(str(record.get("preview_manifest", {}).get("preview_hash", ""))
			== ForgeEntityPreviewManifestService.new().preview_hash(entity),
			"golden entity preview baseline hash drifted")
	var library := _json(
		ARTIFACT_ROOT.path_join("material_density_library.json"))
	_check(int(library.get("record_count", 0)) == 18,
		"Stage 1 material/density artifact count drifted")
	_check((library.get("records", []) as Array).size() == 18,
		"Stage 1 material/density artifact omitted records")


func _has_diagnostic(
		diagnostics: Array[ForgeDiagnostic], code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic.code == code:
			return true
	return false


func _json(path: String) -> Dictionary:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}
