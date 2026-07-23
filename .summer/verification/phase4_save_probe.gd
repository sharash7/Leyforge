extends Node

var failures: Array[String] = []
var checks := 0
@onready var main: Node3D = $Main


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var hud: Hud = main.get_node("HUD")
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
	main._save_game()

	var saved: Dictionary = main._read_save()
	_check(int(saved.get("version", 0)) == 10, "atomic save did not write save version 10")
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

	HamletState.initialized = false
	HamletState.initialize(world.world_seed, world.get_valley_anchors())
	world.restore_item_drops([])
	MagicState.reset()
	CombatState.reset_raid()
	_check(HamletState.reputation_state == HamletState.REP_STRANGER,
		"probe reset did not create a fresh hamlet")
	main._apply_save(saved)
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
	var rowan_position: Array = HamletState.get_npc_record(rowan_id).get("position", [])
	_check(rowan_position.size() == 3 and is_equal_approx(float(rowan_position[0]), 12.5),
		"NPC runtime position did not survive the full main save/apply path")
	hud._open_mode("request_board", world.get_hamlet_station_position("request_board"))
	hud._refresh_all()
	_check(hud._request_buttons.size() == HamletState.request_order.size()
			and hud._request_area.visible,
		"request-board UI did not materialise every authoritative request")
	hud.interaction_subject_id = rowan_id
	hud._open_mode("npc", Vector3i.ZERO)
	hud._refresh_all()
	_check(hud._dialogue_area.visible and not hud._dialogue_text.text.is_empty(),
		"NPC dialogue UI did not resolve the persistent NPC record")
	hud._set_craft_open(false)
	var migrated_v9: Dictionary = main._migrate_save({
		"version": 9,
		"seed": world.world_seed,
		"worldgen": world.get_worldgen_manifest(),
	})
	_check(
		int(migrated_v9.get("version", 0)) == 10
			and migrated_v9.get("combat", {}) is Dictionary,
		"version-9 saves did not migrate to the combat save contract")
	var migrated_v8: Dictionary = main._migrate_save({
		"version": 8,
		"seed": world.world_seed,
		"worldgen": world.get_worldgen_manifest(),
	})
	_check(
		int(migrated_v8.get("version", 0)) == 10
			and migrated_v8.get("magic_player", {}) is Dictionary,
		"version-8 saves did not migrate to the magic save contract")
	var migrated_v7: Dictionary = main._migrate_save({
		"version": 7,
		"seed": world.world_seed,
		"worldgen": world.get_worldgen_manifest(),
	})
	_check(
		int(migrated_v7.get("version", 0)) == 10
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
		"version": saved.get("version", 0),
		"failures": failures,
	}
	print("PHASE4_SAVE_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
