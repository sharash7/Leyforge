extends Node

const ChunkMesherScript = preload("res://scripts/world/chunk_mesher.gd")
const ItemModelFactoryScript = preload("res://scripts/visual/item_model_factory.gd")

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _stack(stable_id: String, count: int = 1, kind: String = "item") -> Dictionary:
	return Inventory.make_stack_from_ref({
		"kind": kind,
		"stable_id": stable_id,
		"count": count,
	})


func _clear_inventory() -> void:
	Inventory.hotbar = Inventory._empty_slots(Inventory.HOTBAR_SIZE)
	Inventory.backpack = Inventory._empty_slots(Inventory.BACKPACK_SIZE)
	Inventory.craft_grid = Inventory._empty_slots(Inventory.CRAFT_SIZE)
	Inventory.craft_output = {}
	Inventory.selected_slot = 0
	Inventory._update_craft_output()
	Inventory._emit_inventory_changed()


func _mesh_snapshot(block_id: int, shape_id: int, transparent: bool) -> Dictionary:
	var blocks := PackedInt32Array()
	blocks.resize(16 * 16 * 16)
	blocks[0] = block_id
	var colors := PackedColorArray()
	colors.resize(block_id + 1)
	colors[block_id] = Color(0.55, 0.42, 0.28, 0.34 if transparent else 1.0)
	var shapes := PackedByteArray()
	shapes.resize(block_id + 1)
	shapes[block_id] = shape_id
	var transparency := PackedByteArray()
	transparency.resize(block_id + 1)
	transparency[block_id] = 1 if transparent else 0
	var layers := PackedInt32Array()
	layers.resize(block_id + 1)
	layers[block_id] = block_id
	return {
		"blocks": blocks,
		"neighbors": {},
		"colors": colors,
		"shapes": shapes,
		"transparency": transparency,
		"layers": layers,
		"water_id": 7,
	}


func _run() -> void:
	_clear_inventory()
	var main: Node3D = load("res://main.tscn").instantiate()
	add_child(main)
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	var hamlet_runtime: HamletRuntime = main.get_node("HamletRuntime")
	var raid_runtime: Node = main.get_node("RaidRuntime")
	# Main may restore a real manual-test save; isolate this probe after the
	# scene has initialized so held-item assertions remain deterministic.
	_clear_inventory()

	_check(player.has_articulated_humanoid(),
		"player did not build the shared articulated humanoid")
	_check(player.held_visual_identity().is_empty(),
		"empty selected slot did not expose the bare first-person arm state")
	Inventory.set_group_slot(
		"hotbar", 0, _stack("item.tool.stone_pickaxe"), true)
	Inventory.select_slot(0)
	_check(player.held_visual_identity() == "item.tool.stone_pickaxe",
		"selected pickaxe did not update the first-person held model")
	var held_pickaxe := ItemModelFactoryScript.build(
		_stack("item.tool.stone_pickaxe"))
	add_child(held_pickaxe)
	_check(held_pickaxe.get_child_count() >= 3,
		"pickaxe model did not contain a handle and readable tool head")
	var held_furnace := ItemModelFactoryScript.build(
		_stack("functional.furnace.stone", 1, "block"))
	add_child(held_furnace)
	_check(held_furnace.get_child_count() >= 2,
		"held furnace model did not contain its shell and firebox")

	for npc_id in HamletState.get_npc_ids():
		var npc_record := HamletState.get_npc_record(npc_id)
		var saved_position: Array = npc_record.get("position", [])
		if saved_position.size() == 3:
			world.prepare_player_column(Vector3(
				float(saved_position[0]), float(saved_position[1]),
				float(saved_position[2])))
	hamlet_runtime._refresh_actor_lod()
	_check(hamlet_runtime.active_actor_count() == HamletState.ROSTER.size(),
		"nearby Hamlet did not promote the full villager roster")
	var articulated_npcs := 0
	var held_npcs := 0
	for actor_value in hamlet_runtime._actors.values():
		var actor: Node = actor_value
		if actor.has_method("has_articulated_humanoid") \
				and bool(actor.call("has_articulated_humanoid")):
			articulated_npcs += 1
		if actor.humanoid != null and actor.humanoid.has_held_model():
			held_npcs += 1
	_check(articulated_npcs == HamletState.ROSTER.size(),
		"one or more villagers lacked articulated arms or legs")
	_check(held_npcs >= 6,
		"job villagers did not display their authored held tools/weapons")

	var shape_expectations := {
		"functional.furnace.stone": "furnace",
		"magic.furnace.mana": "furnace",
		"storage.chest.wood": "chest",
		"storage.crate.wood": "chest",
		"automation.transport.chute": "chute",
		"construction.door.oak": "door",
		"functional.workbench.basic": "workbench",
	}
	for stable_id in shape_expectations:
		var block_id := BlockRegistry.get_id_by_stable_id(stable_id)
		_check(
			block_id > 0 and BlockRegistry.get_shape(block_id) \
				== str(shape_expectations[stable_id]),
			"functional model shape did not resolve: %s" % stable_id)
	var glass_id := BlockRegistry.get_id_by_stable_id("construction.window.glass")
	_check(glass_id > 0 and BlockRegistry.is_transparent(glass_id)
			and world.block_transparency[glass_id] == 1
			and world.block_colors[glass_id].a < 0.5,
		"glass did not register as a translucent block")
	var glass_geometry := ChunkMesherScript.build(
		_mesh_snapshot(glass_id, 0, true))
	_check(glass_geometry["glass_vertices"].size() == 36
			and glass_geometry["water_vertices"].is_empty()
			and glass_geometry["opaque_vertices"].is_empty()
			and glass_geometry["collision_triangles"].size() == 36,
		"glass did not render transparently while retaining collision")
	var furnace_id := BlockRegistry.get_id_by_stable_id("functional.furnace.stone")
	var furnace_geometry := ChunkMesherScript.build(
		_mesh_snapshot(furnace_id, 3, false))
	_check(furnace_geometry["opaque_vertices"].size() > 36
			and furnace_geometry["collision_triangles"].size() >= 36,
		"authored furnace silhouette did not produce compound visible geometry")

	var hamlet_baseline := HamletState.serialize_state()
	var matrices := [
		[
			{
				"tower_stages": 4,
				"ward_active": true,
				"guard_ready": true,
				"food_stocked": true,
				"lighting_ready": true,
			},
			"prepared_victory",
		],
		[
			{
				"tower_stages": 3,
				"ward_active": false,
				"guard_ready": true,
				"food_stocked": true,
				"lighting_ready": false,
			},
			"costly_victory",
		],
		[
			{
				"tower_stages": 0,
				"ward_active": false,
				"guard_ready": false,
				"food_stocked": false,
				"lighting_ready": false,
			},
			"village_defeat",
		],
	]
	for matrix in matrices:
		HamletState.restore_state(hamlet_baseline, world.world_seed)
		CombatState.reset_raid()
		var started := CombatState.begin_raid(matrix[0])
		_check(bool(started.get("ok", false)) and CombatState.phase == "warning",
			"raid planner did not enter its warning phase")
		CombatState.advance(CombatState.RAID_WARNING_SECONDS + 0.1)
		_check(CombatState.phase == "assault"
				and CombatState.enemy_records.size() == 4,
			"raid warning did not promote the four-profile assault")
		var resolved := CombatState.resolve_raid()
		_check(str(resolved.get("id", "")) == str(matrix[1]),
			"preparation matrix produced the wrong graded outcome: %s" % matrix[1])

	HamletState.restore_state(hamlet_baseline, world.world_seed)
	CombatState.reset_raid()
	CombatState.begin_raid({
		"tower_stages": 0,
		"ward_active": false,
		"guard_ready": false,
		"food_stocked": false,
		"lighting_ready": false,
	})
	CombatState.advance(CombatState.RAID_WARNING_SECONDS + 0.1)
	# Runtime raids no longer force-load a remote camp. The probe explicitly
	# prepares its authored volume before asserting local actor promotion.
	var camp_volume: Dictionary = raid_runtime.get_camp_spawn_volume_definition()
	var camp_center: Array = camp_volume.get("center", [])
	world.prepare_player_column(Vector3(
		float(camp_center[0]), float(camp_center[1]), float(camp_center[2])))
	for point_value in camp_volume.get("spawn_points", []):
		var point: Array = point_value
		world.prepare_player_column(Vector3(
			float(point[0]), float(point[1]), float(point[2])))
	raid_runtime._process(0.0)
	_check(raid_runtime.active_actor_count() == 4,
		"raid runtime did not promote all persistent goblin actors")
	var enemy_id := CombatState.get_enemy_ids()[0]
	var enemy_before := float(
		CombatState.get_enemy_record(enemy_id).get("health", 0.0))
	var enemy_actor: Node = raid_runtime._actors[enemy_id]
	var hit: Dictionary = enemy_actor.apply_combat_damage({
		"source": "probe",
		"damage_type": "physical.test",
		"amount": 5.0,
	})
	_check(bool(hit.get("ok", false))
			and float(CombatState.get_enemy_record(enemy_id).get("health", 0.0)) \
				== enemy_before - 5.0,
		"local goblin damage did not commit to authoritative combat state")
	CombatState.resolve_raid()
	CombatState.materialize_damage(world)
	var materialized := 0
	for damage_value in CombatState.damage_records:
		var damage: Dictionary = damage_value
		if not damage.get("position", []).is_empty():
			materialized += 1
	_check(materialized >= 3 and CombatState.unresolved_damage_count() >= 3,
		"poor raid outcome did not create persistent visible warehouse damage")
	var beams_before := Inventory.count_ref({
		"kind": "block",
		"stable_id": "construction.beam.oak",
		"count": 1,
	})
	Inventory.add_stack(_stack("construction.beam.oak", 2, "block"))
	var repair := CombatState.repair_next_damage(world)
	_check(bool(repair.get("ok", false))
			and Inventory.count_ref({
				"kind": "block",
				"stable_id": "construction.beam.oak",
				"count": 1,
			}) == beams_before + 1,
		"raid repair did not consume exactly one Oak Beam")
	var canonical_event_refs: Dictionary = {}
	var event_link_errors: Array[String] = []
	var latest_raid_start := 0
	for index in range(CombatState.event_history.size() - 1, -1, -1):
		if str(CombatState.event_history[index].get("kind", "")) == "warning":
			latest_raid_start = index
			break
	for index in range(latest_raid_start, CombatState.event_history.size()):
		var event_entry: Dictionary = CombatState.event_history[index]
		var event_ref := str(event_entry.get("event_ref", ""))
		if not event_ref.is_empty():
			canonical_event_refs[event_ref] = true
		var event_error := str(event_entry.get("event_error", ""))
		if not event_error.is_empty():
			event_link_errors.append(event_error)
	_check(canonical_event_refs.size() == 1 and event_link_errors.is_empty(),
		"one raid did not retain one successfully linked canonical Event Instance")
	var canonical_raid_ref := ""
	for index in range(CombatState.event_history.size() - 1, latest_raid_start - 1, -1):
		if str(CombatState.event_history[index].get("kind", "")) == "resolved":
			canonical_raid_ref = str(CombatState.event_history[index].get(
				"event_ref", ""))
			break
	var canonical_raid := EventManager.get_event(canonical_raid_ref)
	_check(str(canonical_raid.get("phase", "")) == "resolution"
			and str(canonical_raid.get("status", "")) == "resolved"
			and (canonical_raid.get("consequence_refs", []) as Array).size() >= 2,
		"raid resolution did not retain its damage and repair consequence links")
	var saved_combat := CombatState.serialize_state()
	var remaining_repairs := CombatState.unresolved_damage_count()
	CombatState.reset_raid()
	_check(CombatState.restore_state(saved_combat, world.world_seed)
			and CombatState.phase == "resolved"
			and CombatState.unresolved_damage_count() == remaining_repairs,
		"combat phase, aftermath, or partial repair state failed restore")

	var player_health_before := CombatState.player_health
	var player_hit := player.apply_combat_damage({
		"source": "probe.goblin",
		"amount": 7.0,
	})
	_check(bool(player_hit.get("ok", false))
			and CombatState.player_health == player_health_before - 7.0,
		"player damage did not update persistent health")

	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"npc_models": articulated_npcs,
		"held_npc_items": held_npcs,
		"outcome_history": CombatState.event_history.size(),
		"remaining_repairs": CombatState.unresolved_damage_count(),
		"failures": failures,
	}
	print("PHASE7_COMBAT_VISUAL_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
