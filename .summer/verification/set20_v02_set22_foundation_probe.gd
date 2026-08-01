extends Node
## Set 20 v0.2 migration plus Set 22K/L Stage 0 foundation gate.

const ENTITY_INVENTORY := (
	"res://content/forge/migration/entity_migration_inventory.json")
const BLUEPRINT_INVENTORY := (
	"res://content/forge/migration/blueprint_migration_inventory.json")
const ARTIFACT_ROOT := "res://.summer/verification/artifacts/set22_stage0"

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	_verify_set20_registry()
	_verify_schema_migration()
	var semantic := _verify_semantic_and_manifest_services()
	_verify_foundation_resources(semantic)
	_verify_stable_id_families()
	_verify_migration_inventories()
	_verify_evidence_artifacts()
	_verify_v17_legacy_restore()
	var payload := {
		"checks": checks,
		"failures": failures,
		"ok": failures.is_empty(),
	}
	print("SET20_V02_SET22_FOUNDATION_PROBE %s" % JSON.stringify(payload))
	get_tree().quit(0 if failures.is_empty() else 1)


func _verify_set20_registry() -> void:
	var report := SettlementContentRegistry.validation_report()
	_check(bool(report.get("loaded", false)), "v0.2 registry did not load")
	_check(bool(report.get("ok", false)), "v0.2 registry validation failed")
	_check((report.get("errors", []) as Array).is_empty(),
		"v0.2 registry retained validation errors")
	var summary: Dictionary = report.get("summary", {})
	var kinds: Dictionary = summary.get("kinds", {})
	var scopes: Dictionary = summary.get("scopes", {})
	var groups: Dictionary = summary.get("delivery_groups", {})
	_check(int(summary.get("definitions", 0)) == 120,
		"definition count changed from 120")
	_check(int(kinds.get("building", 0)) == 103
			and int(kinds.get("project", 0)) == 10
			and int(kinds.get("plan", 0)) == 7,
		"103/10/7 definition kind split drifted")
	_check(int(summary.get("blueprints", 0)) == 120,
		"blueprint fallback count changed from 120")
	_check(int(summary.get("construction_projects", 0)) == 120,
		"construction template count changed from 120")
	_check(int(summary.get("behaviors", 0)) == 120,
		"behavior count changed from 120")
	_check(int(summary.get("plan_specs", 0)) == 13,
		"plan graph count changed from 13")
	_check(int(summary.get("packs", 0)) == 25,
		"pack count changed from 25")
	_check(int(scopes.get("technical_poc", 0)) == 16
			and int(scopes.get("extended_slice", 0)) == 14,
		"protected roster did not split 16/14")
	_check(int(scopes.get("alpha", 0)) == 35
			and int(scopes.get("beta", 0)) == 49
			and int(scopes.get("final", 0)) == 6,
		"post-slice scope counts drifted")
	_check(int(groups.get("core_infrastructure", 0)) == 12,
		"Core Infrastructure group did not contain 12 definitions")
	_check(int(groups.get("raid_extension", 0)) == 4,
		"Raid Extension group did not contain 4 definitions")
	_check(int(groups.get("extended_forest_hamlet", 0)) == 14,
		"Extended Forest Hamlet group did not contain 14 definitions")
	_check(SettlementContentRegistry.canonical_id(
		"building.infrastructure.builder_supply_yard")
		== "building.construction.builder_supply_yard",
		"Builder Supply Yard alias direction is not v0.2 canonical")
	_check(SettlementContentRegistry.has_definition(
		"building.construction.builder_supply_yard"),
		"canonical Builder Supply Yard is missing")
	_check(SettlementContentRegistry.definitions_for_scope(
		"technical_poc").size() == 16,
		"definitions_for_scope did not use the new canonical scope")

	var migrations: Array = report.get("schema_migrations", [])
	_check(migrations.size() == 6, "registry did not report all six data migrations")
	for migration in migrations:
		_check(bool(migration.get("ok", false))
				and int(migration.get("to_version", 0)) == 2,
			"a settlement dataset did not report schema v2")

	for definition in SettlementContentRegistry.all_definitions():
		var definition_id := str(definition.get("id", ""))
		var parts := definition_id.split(".")
		var expected_blueprint_id := "blueprint.leyforge.%s.%s_a" % [
			parts[1], parts[2]]
		var project := SettlementContentRegistry.get_construction_project_for_definition(
			definition_id)
		_check(not project.is_empty(),
			"definition lost project template: %s" % definition_id)
		_check(str(project.get("blueprint_id", "")) == expected_blueprint_id,
			"project did not emit canonical blueprint ID: %s" % definition_id)
		var blueprint := SettlementContentRegistry.get_blueprint(expected_blueprint_id)
		_check(not blueprint.is_empty(),
			"canonical blueprint is missing: %s" % expected_blueprint_id)
		var legacy_aliases: Array = blueprint.get("aliases", [])
		_check(legacy_aliases.size() >= 1
				and SettlementContentRegistry.canonical_id(str(legacy_aliases[0]))
					== expected_blueprint_id,
			"legacy blueprint alias did not resolve: %s" % expected_blueprint_id)
		var fallback: Dictionary = blueprint.get("fallback", {})
		_check(bool(fallback.get("active", false))
				and str(fallback.get("legacy_id", "")) in legacy_aliases,
			"legacy blueprint fallback is not explicit: %s" % expected_blueprint_id)
		var status: Dictionary = blueprint.get("production_status", {})
		_check(str(status.get("document_status", "")) == "draft"
				and str(status.get("runtime_data_status", "")) == "validated"
				and str(status.get("forge_bake_status", "")) == "not_started"
				and str(status.get("shipping_status", "")) == "not_shippable",
			"blueprint production status overclaimed completion: %s" % definition_id)

	var pack_aliases := {
		"pack.occupation.frontier_builders":
			"pack.overlay.occupation.frontier_builders",
		"pack.occupation.arcane_artisans":
			"pack.overlay.occupation.arcane_artisans",
		"pack.diaspora.riverward_exiles":
			"pack.overlay.diaspora.riverward_exiles",
		"pack.history.rebuilt_after_raid":
			"pack.overlay.history.rebuilt_after_raid",
		"pack.realm_access.portal_network":
			"pack.realm.portal_network_access",
	}
	for legacy_id in pack_aliases:
		var canonical_id := str(pack_aliases[legacy_id])
		_check(SettlementContentRegistry.canonical_id(legacy_id) == canonical_id,
			"legacy pack alias did not resolve: %s" % legacy_id)
		_check(not SettlementContentRegistry.get_pack(legacy_id).is_empty(),
			"legacy pack lookup lost compatibility: %s" % legacy_id)
	for legacy_id in [
		"culture_kit.forest_human", "style_kit.forest_human",
		"culture_kit.forest_neutral", "style_kit.forest_neutral",
	]:
		_check(not SettlementContentRegistry.get_pack(legacy_id).is_empty(),
			"legacy culture/style kit did not resolve: %s" % legacy_id)
	var overlay := SettlementContentRegistry.resolve_pack_stack([
		"pack.occupation.frontier_builders",
		"pack.history.rebuilt_after_raid",
	])
	_check((overlay.get("errors", []) as Array).is_empty(),
		"legacy pack stack failed canonical resolution")
	_check("pack.overlay.occupation.frontier_builders" in overlay.get(
		"pack_ids", []) and "pack.overlay.history.rebuilt_after_raid" in overlay.get(
			"pack_ids", []), "pack resolver emitted obsolete v0.1 IDs")


func _verify_schema_migration() -> void:
	var fixture := {
		"schema": "leyforge.settlement.projects",
		"schema_version": 1,
		"projects": [{
			"id": "fixture.project.legacy",
			"building_id": "building.infrastructure.builder_supply_yard",
			"blueprint_id": "bp.catalogue.003",
			"pack_ids": [
				"pack.occupation.frontier_builders",
				"culture_kit.forest_human",
				"style_kit.forest_neutral",
			],
		}],
	}
	var first := SettlementContentRegistry.migration_service.migrate_document(
		fixture, "leyforge.settlement.projects")
	_check(bool(first.get("ok", false)), "v1 fixture migration failed")
	_check(int(first.get("from_version", 0)) == 1
			and int(first.get("to_version", 0)) == 2,
		"v1 fixture did not report 1->2")
	var migrated: Dictionary = first.get("data", {})
	var project: Dictionary = (migrated.get("projects", []) as Array)[0]
	_check(str(project.get("building_id", ""))
			== "building.construction.builder_supply_yard",
		"v1 Builder Supply Yard reference was not canonicalised")
	_check(str(project.get("blueprint_id", ""))
			== "blueprint.leyforge.construction.builder_supply_yard_a",
		"v1 bp.* reference was not canonicalised")
	_check(project.get("pack_ids", []) == [
		"pack.overlay.occupation.frontier_builders",
		"pack.culture.riverward_frontier",
		"pack.foundation.forest_neutral_poc",
	], "v1 pack and kit references were not canonicalised losslessly")
	var second := SettlementContentRegistry.migration_service.migrate_document(
		migrated, "leyforge.settlement.projects")
	_check(bool(second.get("ok", false)), "v2 idempotence migration failed")
	_check(str(first.get("output_hash", ""))
			== str(second.get("output_hash", "")),
		"schema migration output hash was not idempotent")
	_check(int(second.get("replacement_count", -1)) == 0,
		"idempotent migration performed extra replacements")
	var canonical_serialised := JSON.stringify(second.get("data", {}))
	_check("building.infrastructure.builder_supply_yard" not in canonical_serialised
			and "bp.catalogue.003" not in canonical_serialised
			and "culture_kit." not in canonical_serialised
			and "style_kit." not in canonical_serialised,
		"v2 serialisation retained obsolete stable IDs")


func _verify_semantic_and_manifest_services() -> ForgeSemanticRegistry:
	var semantic := ForgeSemanticRegistry.new()
	var report := semantic.load_and_validate()
	_check(bool(report.get("ok", false)), "semantic registry failed validation")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"semantic registry emitted diagnostics")
	for family in [
		"marker", "zone", "socket", "network", "material_role",
		"entity_role", "capture_profile",
	]:
		_check(not semantic.filtered_list(family).is_empty(),
			"semantic family is empty: %s" % family)
	_check(semantic.has("marker.role.entrance"),
		"canonical entrance marker role is missing")
	_check(str(semantic.resolve("entrance").get("id", ""))
			== "marker.role.entrance",
		"legacy marker alias did not resolve")
	_check(semantic.has("capture.profile.entity.current_state")
			and semantic.has("capture.profile.blueprint.current_state"),
		"foundation capture profiles are missing")

	var manifests := ForgeProjectManifestService.new()
	var manifest_report := manifests.load_and_validate()
	_check(bool(manifest_report.get("ok", false)),
		"Forge project manifest failed validation")
	_check((manifest_report.get("diagnostics", []) as Array).is_empty(),
		"Forge project manifest emitted diagnostics")
	_check(manifests.has("forge.project.leyforge"),
		"manifest service did not index the Leyforge project")
	_check(manifests.has("leyforge.forge.entity-presentation")
			and manifests.has("leyforge.forge.blueprint-definition"),
		"manifest service did not expose registered foundation schemas")
	_check(str(manifests.resolve("leyforge.forge.body-plan").get(
		"domain", "")) == "entity", "schema lookup returned the wrong domain")
	_check(manifests.filtered_list("blueprint").size() == 5,
		"filtered schema lookup did not return four blueprint schemas")
	return semantic


func _verify_foundation_resources(semantic: ForgeSemanticRegistry) -> void:
	var body_plan := ForgeBodyPlanDefinition.new()
	body_plan.body_plan_id = "entity.body_plan.humanoid.standard"
	body_plan.display_name = "Standard Humanoid"
	body_plan.root_part_id = "entity.body_part.humanoid.torso"
	body_plan.parts = [{
		"id": "entity.body_part.humanoid.torso",
		"parent_id": "",
		"role": "torso",
	}]
	body_plan.required_entity_roles = PackedStringArray(["entity_role.npc"])

	var entity := ForgeEntityPresentation.new()
	entity.entity_presentation_id = "presentation.entity.npc.humanoid"
	entity.entity_definition_id = "entity.definition.npc.humanoid"
	entity.body_plan_id = body_plan.body_plan_id
	entity.body_part_ids = PackedStringArray([
		"entity.body_part.humanoid.torso"])
	entity.rig_id = "entity.rig.humanoid.standard"
	entity.animation_set_id = "entity.animation_set.humanoid.foundation"
	entity.contract_id = "entity.contract.humanoid.standard"
	entity.equipment_profile_id = "entity.equipment_profile.humanoid.standard"
	entity.capture_profile_id = "capture.profile.entity.current_state"
	entity.legacy_fallback = "legacy.runtime.npc_humanoid"

	var placement := ForgePlacementProfile.new()
	placement.placement_profile_id = (
		"blueprint.placement_profile.settlement.foundation")
	placement.allowed_zone_role_ids = PackedStringArray(["zone.role.placement"])
	placement.required_socket_role_ids = PackedStringArray([
		"socket.role.road_access"])
	placement.footprint_min = Vector3i(-1, 0, -1)
	placement.footprint_max = Vector3i(1, 3, 1)
	placement.max_slope = 1

	var element := ForgeBlueprintElement.new()
	element.element_id = "element.foundation.entry"
	element.module_id = "blueprint.module.settlement.foundation"
	element.material_role_id = "material_role.foundation_primary"
	element.marker_role_ids = PackedStringArray(["marker.role.entrance"])
	element.socket_role_ids = PackedStringArray(["socket.role.road_access"])
	element.network_role_ids = PackedStringArray(["network.role.road_access"])
	element.stage_id = "foundation"

	var delta := ForgeConstructionDelta.new()
	delta.delta_id = "construction_delta.foundation"
	delta.stage_id = "foundation"
	delta.add_element_ids = PackedStringArray([element.element_id])

	var blueprint := ForgeBlueprintDefinition.new()
	blueprint.blueprint_id = "blueprint.leyforge.probe.foundation_a"
	blueprint.display_name = "Foundation Probe"
	blueprint.definition_ids = PackedStringArray([
		"building.residential.small_cottage"])
	blueprint.module_ids = PackedStringArray([element.module_id])
	blueprint.elements = [element]
	blueprint.construction_deltas = [delta]
	blueprint.placement_profile = placement
	blueprint.capture_profile_id = "capture.profile.blueprint.current_state"
	blueprint.legacy_fallback = "bp.building.cottage_forest_small"

	var validator := ForgeFoundationValidationService.new()
	_check(validator.validate_entity(entity, semantic).is_empty(),
		"valid entity foundation Resource was rejected")
	_check(validator.validate_body_plan(body_plan, semantic).is_empty(),
		"valid body-plan foundation Resource was rejected")
	_check(validator.validate_blueprint(blueprint, semantic).is_empty(),
		"valid blueprint foundation Resource was rejected")
	var existing_api := ForgeValidationService.new()
	_check(existing_api.validate_entity_source(entity, semantic).is_empty(),
		"existing validation service did not expose entity validation")
	_check(existing_api.validate_blueprint_source(blueprint, semantic).is_empty(),
		"existing validation service did not expose blueprint validation")

	for resource in [body_plan, entity, placement, element, delta, blueprint]:
		var first_hash := str(resource.call("canonical_hash"))
		var second_hash := str(resource.call("canonical_hash"))
		_check(not first_hash.is_empty() and first_hash == second_hash,
			"foundation Resource hash was not deterministic")
		var path := "user://%s.tres" % ForgeId.safe_filename(
			str(resource.get_class()) + first_hash.left(8))
		var save_error := ResourceSaver.save(resource, path)
		_check(save_error == OK, "foundation Resource did not serialise")
		var loaded := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(loaded != null and loaded.has_method("canonical_hash")
				and str(loaded.call("canonical_hash")) == first_hash,
			"foundation Resource changed hash after round-trip")

	var empty_module := ForgeBlueprintDefinition.new()
	empty_module.blueprint_id = "blueprint.leyforge.probe.empty_module_a"
	empty_module.module_ids = PackedStringArray(["blueprint.module.probe.empty"])
	var empty_diagnostics := validator.validate_blueprint(empty_module, semantic)
	_check(_has_diagnostic(empty_diagnostics, "EFB-BP-001"),
		"empty Blueprint module did not emit EFB-BP-001")

	var invalid_element := ForgeBlueprintElement.new()
	invalid_element.element_id = "element.invalid"
	invalid_element.child_blueprint_id = empty_module.blueprint_id
	invalid_element.marker_role_ids = PackedStringArray([
		"marker.role.not_registered"])
	empty_module.elements = [invalid_element]
	var invalid_diagnostics := validator.validate_blueprint(empty_module, semantic)
	_check(_has_diagnostic(invalid_diagnostics, "EFB-BP-010"),
		"blueprint self-cycle did not emit EFB-BP-010")
	_check(_has_diagnostic(invalid_diagnostics, "EFB-BP-MARKER-001"),
		"invalid marker did not emit EFB-BP-MARKER-001")
	_check(_has_diagnostic(validator.validate_contract_change({
		"target_id": blueprint.blueprint_id,
	}), "EFB-CONTRACT-010"),
		"unclassified contract change did not emit EFB-CONTRACT-010")

	var migration := ForgeMigrationRecord.new()
	migration.subject_type = "blueprint"
	migration.target_id = blueprint.blueprint_id
	migration.fallback_id = blueprint.legacy_fallback
	_check(validator.validate_migration_record(migration).is_empty(),
		"complete migration record failed foundation validation")
	migration.replacement_strategy = ""
	_check(_has_diagnostic(validator.validate_migration_record(migration),
		"EFB-CONTRACT-010"),
		"unclassified migration record did not emit EFB-CONTRACT-010")


func _verify_stable_id_families() -> void:
	var family_ids := [
		"entity.definition.npc.humanoid",
		"entity.body_plan.humanoid.standard",
		"entity.body_part.humanoid.torso",
		"entity.rig.humanoid.standard",
		"entity.animation_set.humanoid.foundation",
		"entity.customisation.humanoid.foundation",
		"entity.equipment_profile.humanoid.standard",
		"entity.contract.humanoid.standard",
		"blueprint.leyforge.residential.small_cottage_a",
		"blueprint.module.road.forest_path_a",
		"blueprint.material_role_set.forest_neutral",
		"blueprint.construction_profile.settlement.standard",
		"blueprint.placement_profile.settlement.foundation",
		"marker.role.entrance",
		"socket.role.road_access",
		"network.role.road_access",
		"capture.profile.entity.current_state",
	]
	for stable_id in family_ids:
		_check(ForgeId.is_valid(stable_id),
			"Set 22 stable ID syntax failed: %s" % stable_id)
		_check(ForgeId.is_supported_family(stable_id),
			"Set 22 stable ID family is not registered: %s" % stable_id)


func _verify_migration_inventories() -> void:
	var entities := _load_json(ENTITY_INVENTORY)
	var blueprints := _load_json(BLUEPRINT_INVENTORY)
	_check(int(entities.get("schema_version", 0)) == 2,
		"entity inventory schema is not v2")
	_check(int(entities.get("record_count", 0)) == 14,
		"entity P0/P1 inventory is incomplete")
	_check(int(blueprints.get("schema_version", 0)) == 2,
		"blueprint inventory schema is not v2")
	_check(int(blueprints.get("record_count", 0)) == 124,
		"blueprint migration inventory count drifted")
	_check(int(blueprints.get("legacy_settlement_blueprint_count", 0)) == 120,
		"blueprint inventory did not retain all 120 settlement fallbacks")

	var entity_records: Array = entities.get("records", [])
	var entity_by_id := {}
	var active_entity_fallbacks := 0
	for record in entity_records:
		entity_by_id[str(record.get("target_id", ""))] = record
		if bool(record.get("fallback_active", false)):
			active_entity_fallbacks += 1
		_check(_migration_record_complete(record),
			"entity migration record omitted a foundation field")
	_check(active_entity_fallbacks == 11,
		"current player/NPC/goblin fallbacks were not all retained")
	for target_id in [
		"entity.definition.player.humanoid",
		"entity.definition.npc.humanoid",
		"entity.definition.profession.elder",
		"entity.definition.profession.builder",
		"entity.definition.profession.farmer",
		"entity.definition.profession.guard",
		"entity.definition.profession.merchant",
		"entity.definition.profession.mage",
		"entity.definition.profession.miner",
		"entity.definition.profession.lumberjack",
		"entity.definition.family.goblin",
		"entity.definition.creature.pig",
		"entity.definition.creature.spider",
		"entity.definition.creature.wisp",
	]:
		_check(entity_by_id.has(target_id),
			"P0/P1 entity target is missing: %s" % target_id)
	for target_id in [
		"entity.definition.creature.pig",
		"entity.definition.creature.spider",
		"entity.definition.creature.wisp",
	]:
		var record: Dictionary = entity_by_id.get(target_id, {})
		_check(str(record.get("classification", "")) == "new_work"
				and not bool(record.get("fallback_active", true)),
			"absent entity target was misclassified as migrated: %s" % target_id)

	var blueprint_records: Array = blueprints.get("records", [])
	var blueprint_targets := {}
	var settlement_fallbacks := 0
	for record in blueprint_records:
		_check(_migration_record_complete(record),
			"blueprint migration record omitted a foundation field")
		if int(record.get("catalogue_no", 0)) > 0:
			settlement_fallbacks += 1
			_check(bool(record.get("fallback_active", false)),
				"settlement blueprint fallback was deactivated")
		var target := str(record.get("set22_target", ""))
		if not target.is_empty():
			blueprint_targets[target] = record
	_check(settlement_fallbacks == 120,
		"not all settlement blueprint fallbacks were inventoried")
	for target in [
		"cottage", "warehouse", "workshop", "watchtower", "bridge",
		"goblin_camp", "rune_ruin", "road_module", "farm_pen_module",
	]:
		_check(blueprint_targets.has(target),
			"P0/P1 blueprint target is missing: %s" % target)
	for target in ["goblin_camp", "rune_ruin", "road_module", "farm_pen_module"]:
		_check(str((blueprint_targets.get(target, {}) as Dictionary).get(
			"classification", "")) == "new_work",
			"absent blueprint target was misclassified as migrated: %s" % target)


func _verify_evidence_artifacts() -> void:
	var names := [
		"entity_current_state_capture_sheet.json",
		"blueprint_current_state_capture_sheet.json",
		"entity_current_state_capture_sheet.svg",
		"blueprint_current_state_capture_sheet.svg",
		"dependency_snapshot.json",
		"contract_baseline.json",
		"legacy_fallback_register.json",
	]
	for name in names:
		var path := "%s/%s" % [ARTIFACT_ROOT, name]
		_check(FileAccess.file_exists(path)
				and not FileAccess.get_file_as_string(path).is_empty(),
			"Stage 0 evidence artifact is missing or empty: %s" % name)
	var entity_sheet := _load_json(
		"%s/entity_current_state_capture_sheet.json" % ARTIFACT_ROOT)
	var blueprint_sheet := _load_json(
		"%s/blueprint_current_state_capture_sheet.json" % ARTIFACT_ROOT)
	_check(int(entity_sheet.get("row_count", 0)) == 14,
		"entity capture sheet is incomplete")
	_check(int(blueprint_sheet.get("row_count", 0)) == 124,
		"blueprint capture sheet is incomplete")
	_check(str(entity_sheet.get("visual_approval", "")) == "open"
			and str(blueprint_sheet.get("visual_approval", "")) == "open",
		"capture evidence incorrectly closed manual visual approval")
	var dependencies := _load_json("%s/dependency_snapshot.json" % ARTIFACT_ROOT)
	var all_present := true
	for dependency in dependencies.get("dependencies", []):
		if not bool(dependency.get("exists", false)) \
				or str(dependency.get("sha256", "")).is_empty():
			all_present = false
	_check(all_present, "dependency snapshot contains a missing source")
	var baseline := _load_json("%s/contract_baseline.json" % ARTIFACT_ROOT)
	_check(int(baseline.get("save_version", 0)) == 17
			and int(baseline.get("settlement_schema_version", 0)) == 2,
		"contract baseline changed the save or settlement schema version")
	_check(str(baseline.get("manual_visual_approval", "")) == "open",
		"contract baseline incorrectly claims visual approval")
	var fallbacks := _load_json(
		"%s/legacy_fallback_register.json" % ARTIFACT_ROOT)
	_check(int(fallbacks.get("record_count", 0)) >= 131,
		"legacy fallback register is incomplete")


func _verify_v17_legacy_restore() -> void:
	_check(WorldManager.CURRENT_SAVE_VERSION == 17,
		"Set 20/22 foundation changed save version 17")
	var seed := 220022
	var anchors := {
		"hamlet": [0, 0],
		"warehouse": [4, 4],
		"watchtower_site": [8, 8],
	}
	HamletState.initialize(seed, anchors)
	var legacy_state := HamletState.serialize_state()
	legacy_state["project"]["definition_id"] = "project.watchtower.basic"
	legacy_state["project"]["id"] = "project.watchtower.basic"
	legacy_state["project"]["blueprint_id"] = "bp.building.watchtower_wood"
	legacy_state["runtime_projects"]["legacy.project"] = {
		"id": "project.watchtower.basic",
		"definition_id": "project.watchtower.basic",
		"building_definition_id": "building.safety.wooden_watchtower",
		"blueprint_id": "bp.building.watchtower_wood",
	}
	legacy_state["runtime_buildings"]["legacy.builder_yard"] = {
		"definition_id": "building.infrastructure.builder_supply_yard",
		"blueprint_id": "bp.catalogue.003",
		"condition": 1.0,
	}
	var world_fixture := {
		"version": 17,
		"hamlet_state": legacy_state,
	}
	_check(int(world_fixture.get("version", 0)) == 17,
		"v17 restore fixture was malformed")
	_check(HamletState.restore_state(
		world_fixture["hamlet_state"], seed, HamletState.VILLAGE_ID),
		"v17 world with legacy settlement IDs did not restore")
	var canonical := HamletState.serialize_state()
	_check(str(canonical.get("project", {}).get("definition_id", ""))
			== "project.build.wooden_watchtower",
		"restored project ID was not canonical")
	_check(str(canonical.get("project", {}).get("blueprint_id", ""))
			== "blueprint.leyforge.safety.wooden_watchtower_a",
		"restored project blueprint ID was not canonical")
	var restored_project: Dictionary = canonical.get(
		"runtime_projects", {}).get("legacy.project", {})
	_check(str(restored_project.get("definition_id", ""))
			== "project.build.wooden_watchtower"
			and str(restored_project.get("blueprint_id", ""))
				== "blueprint.leyforge.safety.wooden_watchtower_a",
		"runtime project did not canonicalise legacy IDs")
	var restored_building: Dictionary = canonical.get(
		"runtime_buildings", {}).get("legacy.builder_yard", {})
	_check(str(restored_building.get("definition_id", ""))
			== "building.construction.builder_supply_yard"
			and str(restored_building.get("blueprint_id", ""))
				== "blueprint.leyforge.construction.builder_supply_yard_a",
		"runtime building did not canonicalise legacy IDs")
	var serialized := JSON.stringify(canonical)
	_check("building.infrastructure.builder_supply_yard" not in serialized
			and "bp.building.watchtower_wood" not in serialized
			and "bp.catalogue.003" not in serialized,
		"restored v17 state re-serialised obsolete IDs")


func _migration_record_complete(record: Dictionary) -> bool:
	for key in [
		"subject_type", "target_id", "lifecycle", "contract_version",
		"dependency_information", "replacement_strategy", "fallback",
		"removal_gate", "review_history",
	]:
		if not record.has(key):
			return false
	return true


func _has_diagnostic(diagnostics: Array, code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic is ForgeDiagnostic and diagnostic.code == code:
			return true
	return false


func _load_json(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}
