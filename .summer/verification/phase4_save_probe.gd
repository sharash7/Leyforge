extends Node

var failures: Array[String] = []
var checks := 0
var migration_checks := 0
@onready var main: Node3D = $Main


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _migration_check(condition: bool, message: String) -> void:
	migration_checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var hud: Hud = main.get_node("HUD")
	_check(main.configure_verification_save_paths(
		"res://.summer/verification/.phase4_save_probe_state"),
		"save probe could not isolate itself from the player's manual save")
	hud._open_mode("hand", Vector3i.ZERO)
	hud._refresh_all()
	_check(hud._crafting_area.visible and hud._craft_grid.columns == 2,
		"hand-crafting UI did not open as a 2x2 grid")
	hud._set_craft_open(false)
	hud._open_mode("workbench", Vector3i.ZERO)
	hud._refresh_all()
	_check(hud._crafting_area.visible and hud._craft_grid.columns == 3,
		"workbench UI did not open as a 3x3 grid")
	hud._set_craft_open(false)
	MagicState.unlock_poc_magic("probe.save")
	MagicState.mana = 42.0
	CombatState.begin_raid({
		"tower_stages": 2,
		"ward_active": false,
		"guard_ready": true,
		"food_stocked": false,
		"lighting_ready": false,
	})
	CombatState.advance(CombatState.RAID_WARNING_SECONDS + 0.1)
	var saved_enemy_id := CombatState.get_enemy_ids()[0]
	CombatState.damage_enemy(saved_enemy_id, {
		"source": "save.probe",
		"amount": 3.0,
	})
	var saved_enemy_biology_id := str(CombatState.get_enemy_record(
		saved_enemy_id).get("biological_actor_id", ""))
	HamletState.accept_introduction()
	var masonry_ref := {
		"kind": "item",
		"stable_id": "item.material.stone_brick",
		"count": 7,
	}
	HamletState.warehouse_add_stack(Inventory.make_stack_from_ref(masonry_ref))
	var rowan_id := "npc.poc.forest_hamlet.elder_rowan"
	HamletState.update_npc_position(rowan_id, Vector3(12.5, 14.0, -8.5))
	HamletState.project["stage"] = "frame"
	HamletState.project["stage_index"] = 2
	HamletState.project["awaiting_supplies"] = true
	HamletState.project["stage_progress"] = 0.0
	var drop_stack := Inventory.make_stack_from_ref({
		"kind": "item",
		"stable_id": "item.resource.stick",
		"count": 3,
	})
	_check(
		world.spawn_item_drop(drop_stack, main.get_node("Player").global_position + Vector3(4, 1, 0)),
		"save probe could not create a persistent item drop")
	UIState.set_setting("high_contrast", true)
	UIState.set_setting("tutorial_mode", "guided")
	UIState.discover_anchor("rune_ruin")
	UIState.set_custom_pin(Vector2(19.0, -27.0))
	main._save_game()

	var saved: Dictionary = main._read_save()
	_check(int(saved.get("version", 0)) == 18, "atomic save did not write save version 18")
	_check(main.validate_save_integrity(saved),
		"atomic save omitted or failed its Stage 9 payload integrity record")
	_check(saved.get("hamlet", {}) is Dictionary and not saved.get("hamlet", {}).is_empty(),
		"atomic save omitted authoritative hamlet state")
	_check(saved.get("item_drops", []) is Array and saved.get("item_drops", []).size() == 1,
		"atomic save omitted the physical item drop")
	_check(saved.get("magic_player", {}) is Dictionary
			and not saved.get("magic_player", {}).is_empty(),
		"atomic save omitted persistent personal magic")
	_check(saved.get("combat", {}) is Dictionary
			and not saved.get("combat", {}).is_empty(),
		"atomic save omitted persistent combat and raid state")
	var saved_biology: Dictionary = saved.get("biology", {})
	var saved_biology_ids: Array[String] = []
	for biological_value in saved_biology.get("records", []):
		if biological_value is Dictionary:
			saved_biology_ids.append(str(biological_value.get("actor_id", "")))
	_check(str(saved_biology.get("schema", "")) \
			== "leyforge.biological-state" \
			and str(saved_biology.get("state_hash", "")).length() == 64 \
			and CombatState.PLAYER_BIOLOGICAL_ACTOR_ID in saved_biology_ids \
			and saved_enemy_biology_id in saved_biology_ids,
		"save v18 omitted canonical player or raid biological state")
	var saved_biology_hash := str(saved_biology.get("state_hash", ""))
	var saved_political: Dictionary = saved.get("political", {})
	var saved_political_hash := str(saved_political.get("state_hash", ""))
	_check(str(saved_political.get("schema", "")) \
			== PoliticalManager.STATE_SCHEMA \
			and saved_political_hash.length() == 64 \
			and not (saved_political.get("governments", []) as Array).is_empty(),
		"save v18 omitted canonical political government and permission state")
	var saved_movement: Dictionary = saved.get("movement", {})
	var saved_movement_hash := str(saved_movement.get("state_hash", ""))
	var saved_mover_ids: Array[String] = []
	for mover_value in saved_movement.get("movers", []):
		if mover_value is Dictionary:
			saved_mover_ids.append(str(mover_value.get(
				"entity_or_transport_ref", "")))
	_check(str(saved_movement.get("schema", "")) \
			== MovementManager.STATE_SCHEMA \
			and saved_movement_hash.length() == 64 \
			and CombatState.PLAYER_BIOLOGICAL_ACTOR_ID in saved_mover_ids \
			and rowan_id in saved_mover_ids,
		"save v18 omitted canonical player or resident movement state")
	var saved_events: Dictionary = saved.get("events", {})
	var saved_events_hash := str(saved_events.get("state_hash", ""))
	var saved_event_ids: Array[String] = []
	for event_value in saved_events.get("events", []):
		if event_value is Dictionary:
			saved_event_ids.append(str(event_value.get("event_id", "")))
	_check(str(saved_events.get("schema", "")) \
			== EventManager.STATE_SCHEMA \
			and saved_events_hash.length() == 64 \
			and not saved_event_ids.is_empty(),
		"save v18 omitted canonical EVT-001 event state")
	_check(saved.get("ui", {}) is Dictionary
			and not saved.get("ui", {}).is_empty()
			and not (saved.get("ui", {}) as Dictionary).has("settings"),
		"save v18 omitted world UI state or copied global profile settings into it")
	var saved_structures: Dictionary = saved.get("structures", {})
	var saved_structure_records: Array = saved_structures.get("structures", [])
	_check(str(saved_structures.get("schema", "")) \
			== "leyforge.structure-state" \
			and saved_structure_records.size() >= 1 \
			and bool(StructureManager.validate_structure_record(
				saved_structure_records[0], world.world_seed).get("ok", false)),
		"save v18 omitted or invalidated persistent StructureInstance state")
	var saved_structure_hash := str(saved_structure_records[0].get(
		"state_hash", ""))
	var saved_kernel_evidence: Array = saved.get(
		"production_kernel", {}).get("evidence", [])
	_check(not saved_kernel_evidence.is_empty() \
			and not (saved_structure_records[0].get(
				"evidence_refs", []) as Array).is_empty(),
		"save v18 omitted structure evidence from the shared kernel")
	var saved_lod: Dictionary = saved.get("simulation_lod", {})
	_check(str(saved_lod.get("schema", "")) \
			== "leyforge.simulation-lod-state" \
			and str(saved_lod.get("state_hash", "")).length() == 64 \
			and not (saved_lod.get("subjects", []) as Array).is_empty(),
		"save v18 omitted persistent time, presence or LOD owner projections")
	var v17_fixture := saved.duplicate(true)
	v17_fixture["version"] = 17
	v17_fixture.erase("structures")
	v17_fixture.erase("production_kernel")
	v17_fixture.erase("simulation_lod")
	v17_fixture.erase("registry_state")
	v17_fixture.erase("biology")
	v17_fixture.erase("events")
	v17_fixture.erase("movement")
	v17_fixture["inventory"] = {
		"hotbar": [{"item_id": "item.resource.log_oak", "count": 13}],
		"backpack": [],
		"craft_grid": [],
		"selected_slot": 0,
	}
	v17_fixture.erase("integrity")
	v17_fixture = main._attach_integrity(v17_fixture)
	var migrated_v17: Dictionary = main._migrate_save(v17_fixture)
	main._apply_save(migrated_v17)
	var migrated_inventory := Inventory.serialize_state()
	_migration_check(
		int(migrated_v17.get("version", 0)) == 18
			and int(migrated_v17.get("save_manifest", {}).get(
				"migrated_from", 0)) == 17
			and Inventory.count_ref({
				"kind": "block", "stable_id": "natural.log.oak",
			}) == 13
			and str(migrated_inventory["hotbar"][0].get(
				"block_id", "")) == "natural.log.oak"
			and not migrated_inventory["hotbar"][0].has("item_id"),
		"version-17 proxy Item stack did not migrate losslessly to a Block projection")
	_migration_check(not StructureManager.find_structure_for_anchor(
		HamletState.active_village_id, "warehouse").is_empty() \
			and not (ProductionKernel.serialize_state().get(
				"evidence", []) as Array).is_empty() \
			and SimulationLodManager.has_subject(
				SettlementManager.focused_settlement_id) \
			and not PoliticalManager.government_for_settlement(
				HamletState.active_village_id).is_empty() \
			and MovementManager.has_mover(rowan_id) \
			and MovementManager.has_mover(CombatState.PLAYER_BIOLOGICAL_ACTOR_ID),
		"version-17 save did not reconstruct derivable structure, political, movement and LOD ownership")
	_migration_check(BiologyManager.has_actor(
			CombatState.PLAYER_BIOLOGICAL_ACTOR_ID) \
			and BiologyManager.has_actor(saved_enemy_biology_id) \
			and is_equal_approx(BiologyManager.current_health(
				saved_enemy_biology_id), float(CombatState.get_enemy_record(
					saved_enemy_id).get("health", -1.0))),
		"version-17 save did not reconstruct biological compatibility ownership")
	_migration_check(not EventManager.event_ids().is_empty()
			and not EventManager.get_recent_history(8).is_empty(),
		"version-17 save did not reconstruct EVT-001 authority from legacy combat history")

	HamletState.initialized = false
	SocialManager.reset()
	PoliticalManager.reset()
	MovementManager.reset()
	HamletState.initialize(world.world_seed, world.get_valley_anchors())
	world.restore_item_drops([])
	MagicState.reset()
	CombatState.reset_raid()
	UIState.reset_world_state()
	_check(HamletState.reputation_state == HamletState.REP_STRANGER,
		"probe reset did not create a fresh hamlet")
	main._apply_save(saved)
	_check(str(BiologyManager.serialize_state().get("state_hash", "")) \
			== saved_biology_hash \
			and str(PoliticalManager.serialize_state().get("state_hash", "")) \
				== saved_political_hash \
			and is_equal_approx(BiologyManager.current_health(
				saved_enemy_biology_id), float(CombatState.get_enemy_record(
					saved_enemy_id).get("health", -1.0))),
		"biological or political owner state did not survive the full save/apply path")
	_check(str(MovementManager.serialize_state().get("state_hash", "")) \
			== saved_movement_hash \
			and MovementManager.has_mover(rowan_id),
		"movement owner state did not survive the full save/apply path")
	_check(str(EventManager.serialize_state().get("state_hash", "")) \
			== saved_events_hash \
			and not EventManager.get_recent_history(8).is_empty(),
		"event owner state did not survive the full save/apply path")
	_check(StructureManager.structure_count() == saved_structure_records.size() \
			and str(StructureManager.get_structure(
				str(saved_structure_records[0].get("instance_id", ""))).get(
					"state_hash", "")) == saved_structure_hash,
		"StructureInstance owner state did not survive the full save/apply path")
	_check(SimulationLodManager.has_subject(
			SettlementManager.focused_settlement_id) \
			and str(SimulationLodManager.subject_record(
				SettlementManager.focused_settlement_id).get(
					"lod_mode", "")) == "local",
		"simulation presence did not survive and reconcile through full save/apply")
	_check(HamletState.reputation_state == HamletState.REP_HELPFUL,
		"reputation did not survive the full main save/apply path")
	_check(HamletState.warehouse_count_ref(masonry_ref) == 7,
		"warehouse contents did not survive the full main save/apply path")
	_check(str(HamletState.project.get("stage", "")) == "frame",
		"project stage did not survive the full main save/apply path")
	_check(world.active_item_drop_count() == 1,
		"physical item drop did not survive the full main save/apply path")
	_check(MagicState.is_spell_known("spell.stone_sense")
			and is_equal_approx(MagicState.mana, 42.0),
		"personal mana and spell knowledge did not survive the main save/apply path")
	_check(CombatState.phase == "assault"
			and float(CombatState.get_enemy_record(saved_enemy_id).get("health", 0.0)) \
				== float(CombatState.get_enemy_record(saved_enemy_id).get(
					"max_health", 0.0)) - 3.0,
		"raid phase or authoritative enemy health did not survive save/apply")
	_check(UIState.setting_bool("high_contrast")
			and str(UIState.settings.get("tutorial_mode", "")) == "guided"
			and UIState.discovered_anchors.has("rune_ruin")
			and UIState.has_custom_pin
			and UIState.custom_pin.is_equal_approx(Vector2(19.0, -27.0)),
		"global profile or world learning/map state changed during save/apply")
	var rowan_position: Array = HamletState.get_npc_record(rowan_id).get("position", [])
	_check(rowan_position.size() == 3 and is_equal_approx(float(rowan_position[0]), 12.5),
		"NPC runtime position did not survive the full main save/apply path")
	var v13_fixture: Dictionary = saved.duplicate(true)
	v13_fixture["version"] = 13
	v13_fixture.erase("structures")
	v13_fixture.erase("production_kernel")
	v13_fixture.erase("simulation_lod")
	v13_fixture.erase("registry_state")
	v13_fixture.erase("integrity")
	v13_fixture.erase("save_manifest")
	var v13_hamlet: Dictionary = v13_fixture.get("hamlet", {}).duplicate(true)
	v13_hamlet["version"] = 2
	v13_hamlet.erase("runtime_projects")
	v13_hamlet.erase("runtime_buildings")
	v13_hamlet.erase("runtime_plans")
	v13_hamlet.erase("active_project_instance_id")
	var v13_project: Dictionary = v13_hamlet.get("project", {}).duplicate(true)
	v13_project["id"] = "project.watchtower.basic"
	v13_project["schema_version"] = 2
	for generic_key in [
		"instance_id", "definition_id", "building_definition_id",
		"blueprint_id", "owner_id", "history",
	]:
		v13_project.erase(generic_key)
	v13_hamlet["project"] = v13_project
	v13_fixture["hamlet"] = v13_hamlet
	v13_fixture = main._attach_integrity(v13_fixture)
	var migrated_v13: Dictionary = main._migrate_save(v13_fixture)
	_migration_check(int(migrated_v13.get("version", 0)) == 18
			and int(migrated_v13.get("save_manifest", {}).get(
				"migrated_from", 0)) == 13,
		"version-13 save did not migrate to version 18")
	main._apply_save(migrated_v13)
	_migration_check(str(HamletState.project.get("definition_id", ""))
			== "project.build.wooden_watchtower"
			and str(HamletState.project.get("stage", "")) == "frame"
			and HamletState.warehouse_count_ref(masonry_ref) == 7,
		"version-13 migration changed watchtower progress or warehouse stock")
	_migration_check(not StructureManager.find_structure_for_anchor(
		HamletState.active_village_id, "warehouse").is_empty(),
		"version-13 migration did not reconstruct generated structure ownership")
	var migrated_rowan: Array = HamletState.get_npc_record(
		rowan_id).get("position", [])
	_migration_check(migrated_rowan.size() == 3
			and is_equal_approx(float(migrated_rowan[0]), 12.5)
			and CombatState.phase == "assault",
		"version-13 migration changed NPC or raid state")
	hud._open_mode("request_board", world.get_hamlet_station_position("request_board"))
	hud._refresh_all()
	_check(hud._request_buttons.size() == HamletState.request_order.size()
			and hud._request_area.visible
			and hud._request_filter_buttons.size() == 4
			and hud._request_filter_buttons.has(HamletState.REQUEST_ACTIVE),
		"request-board UI did not materialise every authoritative request")
	_check(hud._request_buttons.values().filter(
		func(button: Button) -> bool: return button.visible).size()
			== HamletState.get_requests(HamletState.REQUEST_ACTIVE).size(),
		"request-board Active filter still displayed archived requests")
	hud.interaction_subject_id = rowan_id
	hud._open_mode("npc", Vector3i.ZERO)
	hud._refresh_all()
	_check(hud._dialogue_area.visible and not hud._dialogue_text.text.is_empty(),
		"NPC dialogue UI did not resolve the persistent NPC record")
	hud._set_craft_open(false)
	var migrated_v10: Dictionary = main._migrate_save({
		"version": 10,
		"seed": world.world_seed,
		"worldgen": world.get_worldgen_manifest(),
	})
	_check(
		int(migrated_v10.get("version", 0)) == 18
			and migrated_v10.get("combat", {}) is Dictionary,
		"version-10 saves did not migrate to the Stage 8 save contract")
	var migrated_v9: Dictionary = main._migrate_save({
		"version": 9,
		"seed": world.world_seed,
		"worldgen": world.get_worldgen_manifest(),
	})
	_check(
		int(migrated_v9.get("version", 0)) == 18
			and migrated_v9.get("combat", {}) is Dictionary,
		"version-9 saves did not migrate to the combat save contract")
	var migrated_v8: Dictionary = main._migrate_save({
		"version": 8,
		"seed": world.world_seed,
		"worldgen": world.get_worldgen_manifest(),
	})
	_check(
		int(migrated_v8.get("version", 0)) == 18
			and migrated_v8.get("magic_player", {}) is Dictionary,
		"version-8 saves did not migrate to the magic save contract")
	var migrated_v7: Dictionary = main._migrate_save({
		"version": 7,
		"seed": world.world_seed,
		"worldgen": world.get_worldgen_manifest(),
	})
	_check(
		int(migrated_v7.get("version", 0)) == 18
			and migrated_v7.get("item_drops", []) is Array
			and migrated_v7.get("block_entities", {}) is Dictionary,
		"version-7 saves did not migrate to the automation save contract")
	var legacy_hamlet: Dictionary = HamletState.serialize_state()
	legacy_hamlet["version"] = 1
	var legacy_project: Dictionary = legacy_hamlet["project"]
	legacy_project.erase("schema_version")
	legacy_project["complete"] = true
	legacy_project["stage"] = "complete"
	legacy_project["stage_progress"] = 0.0
	legacy_hamlet["project"] = legacy_project
	_check(
		HamletState.restore_state(legacy_hamlet, world.world_seed)
			and bool(HamletState.project.get("complete", false))
			and float(HamletState.project.get("stage_progress", 0.0)) == 1.0,
		"legacy completed tower did not migrate from zero to 100 percent")

	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"migration_checks": migration_checks,
		"version": saved.get("version", 0),
		"failures": failures,
	}
	main.cleanup_verification_save_paths()
	print("PHASE4_SAVE_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
