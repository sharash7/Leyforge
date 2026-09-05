extends Node

const ChunkMesherScript = preload("res://scripts/world/chunk_mesher.gd")
const ItemModelFactoryScript = preload("res://scripts/visual/item_model_factory.gd")
const HumanoidVisualScript = preload("res://scripts/visual/humanoid_visual.gd")

var failures: Array[String] = []
var checks := 0


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _stack(stable_id: String, kind := "item") -> Dictionary:
	return Inventory.make_stack_from_ref({
		"kind": kind,
		"stable_id": stable_id,
		"count": 1,
	})


func _index(x: int, y: int, z: int) -> int:
	return (y * 16 + z) * 16 + x


func _mesh_snapshot(block_id: int, shape_id: int, transparent := false) -> Dictionary:
	var blocks := PackedInt32Array()
	blocks.resize(16 * 16 * 16)
	blocks[_index(8, 8, 8)] = block_id
	var colors := PackedColorArray()
	colors.resize(block_id + 1)
	colors[block_id] = Color(0.35, 0.62, 0.72, 0.36 if transparent else 1.0)
	var shapes := PackedByteArray()
	shapes.resize(block_id + 1)
	shapes[block_id] = shape_id
	var transparency := PackedByteArray()
	transparency.resize(block_id + 1)
	transparency[block_id] = 1 if transparent else 0
	var connectors := PackedByteArray()
	connectors.resize(block_id + 1)
	var orientations := PackedByteArray()
	orientations.resize(blocks.size())
	var door_parts := PackedByteArray()
	door_parts.resize(blocks.size())
	var layers := PackedInt32Array()
	layers.resize(block_id + 1)
	layers[block_id] = block_id
	return {
		"blocks": blocks,
		"neighbors": {},
		"colors": colors,
		"shapes": shapes,
		"transparency": transparency,
		"item_connectors": connectors,
		"orientations": orientations,
		"door_parts": door_parts,
		"layers": layers,
		"water_id": 7,
	}


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	var main: Node3D = load("res://main.tscn").instantiate()
	add_child(main)
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	var hud: Hud = main.get_node("HUD")
	var raid_runtime: RaidRuntime = main.get_node("RaidRuntime")

	# Water and glass retain separate depth-sorted materials and geometry.
	var glass_id := BlockRegistry.get_id_by_stable_id("construction.window.glass")
	var glass_geometry := ChunkMesherScript.build(
		_mesh_snapshot(glass_id, 0, true))
	var water_geometry := ChunkMesherScript.build(
		_mesh_snapshot(world.id_water, 0, false))
	_check(glass_geometry["glass_vertices"].size() == 36
			and glass_geometry["water_vertices"].is_empty()
			and glass_geometry["collision_triangles"].size() == 36,
		"glass was not isolated on its collision-enabled material surface")
	_check(water_geometry["water_vertices"].size() == 36
			and water_geometry["glass_vertices"].is_empty()
			and water_geometry["collision_triangles"].is_empty(),
		"water was not isolated on its collision-free material surface")
	_check(Player.is_replaceable_placement_block(BlockRegistry.AIR)
			and Player.is_replaceable_placement_block(world.id_water)
			and not Player.is_replaceable_placement_block(
				BlockRegistry.get_id_by_stable_id("terrain.dirt.basic")),
		"player placement does not treat water as a replaceable voxel")
	var water_test_x := floori(player.global_position.x) + 6
	var water_test_z := floori(player.global_position.z)
	var water_test_surface := world.surface_height_at(water_test_x, water_test_z)
	world.prepare_player_column(Vector3(
		water_test_x, water_test_surface + 3, water_test_z))
	var saved_ray_transform := player.ray.transform
	player.ray.global_position = Vector3(
		water_test_x + 0.5, water_test_surface + 3.0, water_test_z + 0.5)
	player.ray.global_rotation = Vector3(-PI * 0.5, 0.0, 0.0)
	player.ray.target_position = Vector3(0.0, 0.0, -Player.REACH)
	await get_tree().physics_frame
	player.ray.force_raycast_update()
	var dry_ray_point := player.ray.get_collision_point()
	var dry_ray_normal := player.ray.get_collision_normal()
	var water_test_cell := Vector3i(
		(dry_ray_point + dry_ray_normal * 0.5).floor())
	var previous_water_test_id := world.get_block_global(water_test_cell)
	world.set_block_global(water_test_cell, world.id_water)
	await get_tree().physics_frame
	player.ray.force_raycast_update()
	var water_ray_point := player.ray.get_collision_point() \
		if player.ray.is_colliding() else Vector3.ZERO
	var water_ray_normal := player.ray.get_collision_normal() \
		if player.ray.is_colliding() else Vector3.ZERO
	var water_ray_target := Vector3i(
		(water_ray_point + water_ray_normal * 0.5).floor())
	var saved_slot := Inventory.selected_slot
	var water_test_slot := Inventory.HOTBAR_SIZE - 1
	var saved_water_test_stack := Inventory.get_group_slot(
		"hotbar", water_test_slot).duplicate(true)
	var water_placement_stack := _stack("construction.cobble.stone", "block")
	water_placement_stack["count"] = 2
	Inventory.set_group_slot("hotbar", water_test_slot, water_placement_stack)
	Inventory.select_slot(water_test_slot)
	player._update_highlight()
	var highlighted_water := player.highlight.visible \
		and player.highlight.global_position.is_equal_approx(
			Vector3(water_test_cell) + Vector3(0.5, 0.5, 0.5))
	player._try_place()
	_check(player.ray.is_colliding() and highlighted_water
			and BlockRegistry.get_stable_id(
				world.get_block_global(water_test_cell)) \
				== "construction.cobble.stone"
			and int(Inventory.get_selected_stack().get("count", 0)) == 1,
		("player could not target and place a conserved block into water: "
			+ "colliding=%s target=%s expected=%s highlight=%s/%s "
			+ "block=%s count=%d") % [
			player.ray.is_colliding(), water_ray_target, water_test_cell,
			highlighted_water, player.highlight.global_position,
			BlockRegistry.get_stable_id(
				world.get_block_global(water_test_cell)),
			int(Inventory.get_selected_stack().get("count", 0)),
		])
	world.set_block_global(water_test_cell, previous_water_test_id)
	Inventory.set_group_slot("hotbar", water_test_slot, saved_water_test_stack)
	Inventory.select_slot(saved_slot)
	player.ray.transform = saved_ray_transform
	_check(world.water_material.cull_mode == BaseMaterial3D.CULL_BACK
			and world.water_material.transparency \
				== BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS,
		"water material did not use stable depth-prepass/back-face rendering")

	# Player and NPCs share one complete articulated body. The camera sits on
	# the forward eye pivot, culls only the head, and sees the connected torso,
	# shoulder-anchored arms, legs, and real held-item hand.
	player.restore_view(0.0, -0.40)
	player._update_player_visuals(0.0)
	var owner_humanoid: Node3D = player._world_humanoid
	var complete_world_body: bool = owner_humanoid != null \
		and owner_humanoid._body_parts.size() == 3
	for part in owner_humanoid._body_parts:
		complete_world_body = complete_world_body \
			and part.layers == 1 and part.visible
	var complete_world_head := true
	for part in owner_humanoid._head_parts:
		complete_world_head = complete_world_head and part.layers == 2 \
			and part.get_parent() == owner_humanoid.head_anchor
	var rig_connected: bool = \
		owner_humanoid.left_arm.get_parent() == owner_humanoid \
		and owner_humanoid.right_arm.get_parent() == owner_humanoid \
		and owner_humanoid.held_anchor.get_parent() == owner_humanoid.right_arm \
		and player._head_mount == owner_humanoid.head_anchor \
		and player.head.get_parent() == owner_humanoid.head_anchor \
		and player.camera.get_parent() == player.head \
		and player.head.position.is_equal_approx(Vector3.ZERO) \
		and is_equal_approx(owner_humanoid.left_arm.position.x, -0.33) \
		and is_equal_approx(owner_humanoid.right_arm.position.x, 0.33) \
		and is_equal_approx(owner_humanoid.head_anchor.position.z, -0.18) \
		and (player.camera.cull_mask & 1) != 0 \
		and (player.camera.cull_mask & 2) == 0
	player.restore_view(0.0, 0.25)
	player._update_player_visuals(0.0)
	for part in owner_humanoid._body_parts:
		complete_world_body = complete_world_body and part.visible
	_check(complete_world_body and complete_world_head and rig_connected,
		"player eye pivot, connected body, or shoulder anchors disconnected")
	var t_pose_rig := HumanoidVisualScript.new()
	add_child(t_pose_rig)
	t_pose_rig.configure(Color(0.3, 0.4, 0.5))
	t_pose_rig.set_held_stack(_stack("item.tool.stone_axe"))
	t_pose_rig.set_reference_t_pose()
	var canonical_tools_valid := true
	var canonical_tool_count := 0
	var expected_item_basis := Basis.from_euler(
		ItemModelFactoryScript.HELD_ITEM_ROTATION).orthonormalized()
	for item_id in ItemRegistry.get_all_ids():
		var item_definition := ItemRegistry.get_definition(int(item_id))
		var stable_item_id := str(item_definition.get("stable_id", ""))
		if not stable_item_id.begins_with("item.tool.") \
				and not stable_item_id.begins_with("item.weapon."):
			continue
		canonical_tool_count += 1
		var tool_stack := _stack(stable_item_id)
		var tool_model := ItemModelFactoryScript.build(tool_stack)
		ItemModelFactoryScript.apply_hold_transform(
			tool_model, tool_stack, "humanoid")
		var tool_bottom: Vector3 = tool_model.get_meta(
			"canonical_hold_bottom", Vector3.ZERO)
		canonical_tools_valid = canonical_tools_valid \
			and is_equal_approx(
				tool_bottom.y,
				ItemModelFactoryScript.CANONICAL_TOOL_BOTTOM_Y) \
			and tool_model.get_meta("canonical_up_axis", Vector3.ZERO) \
				== Vector3.UP \
			and tool_model.get_meta("canonical_forward_axis", Vector3.ZERO) \
				== Vector3.FORWARD \
			and tool_model.basis.orthonormalized().is_equal_approx(
				expected_item_basis) \
			and (tool_model.transform * tool_bottom).length() <= 0.001
		tool_model.free()
	var t_pose_bottom: Vector3 = t_pose_rig._held_model.get_meta(
		"canonical_hold_bottom", Vector3.ZERO)
	_check(is_equal_approx(t_pose_rig.right_arm.rotation.z, PI * 0.5)
			and is_equal_approx(t_pose_rig.held_anchor.rotation.z, -PI * 0.5)
			and canonical_tool_count >= 8
			and canonical_tools_valid
			and (t_pose_rig._held_model.transform * t_pose_bottom).length() \
				<= 0.001,
		"tools did not share the requested X90/reversed-Y bottom-centred grip")
	t_pose_rig.queue_free()
	var block_stack := _stack("functional.furnace.stone", "block")
	var block_model := ItemModelFactoryScript.build(block_stack)
	ItemModelFactoryScript.apply_hold_transform(
		block_model, block_stack, "owner_humanoid")
	_check(block_model.scale.x <= 0.43
			and absf(block_model.position.x) <= 0.11,
		"owner-rig held block remained oversized or outside the hand grip")
	ItemModelFactoryScript.apply_hold_transform(
		block_model, block_stack, "first_person")
	_check(
		block_model.scale.x >= 0.50 and block_model.position.z <= -0.18
			and block_model.get_child_count() > 0,
		"first-person held block remained hidden inside the player's hand")
	block_model.free()
	var resource_stack := _stack("item.resource.stick")
	var resource_model := ItemModelFactoryScript.build(resource_stack)
	ItemModelFactoryScript.apply_hold_transform(
		resource_model, resource_stack, "first_person")
	_check(
		resource_model.position.z <= -0.12
			and resource_model.get_child_count() > 0,
		"first-person held resource remained hidden inside the player's hand")
	resource_model.free()

	# Villagers do not promote onto missing collision columns.
	var npc_id := HamletState.get_npc_ids()[0]
	var npc_record := HamletState.get_npc_record(npc_id)
	var saved_position: Array = npc_record.get("position", [])
	var npc_gp := Vector3i(
		floori(float(saved_position[0])), floori(float(saved_position[1])),
		floori(float(saved_position[2])))
	var npc_cc := Vector3i(
		world.chunk_coord(npc_gp.x), world.chunk_coord(npc_gp.y),
		world.chunk_coord(npc_gp.z))
	# A direct loaded-state assertion documents the gate; promotion itself is
	# covered by the updated Stage 7 roster probe after columns are prepared.
	_check(world.is_voxel_loaded_at(npc_gp) == world.chunks.has(npc_cc),
		"villager chunk-ready gate disagreed with actual streamed chunk state")

	# Doors are one inventory object assembled from two oriented voxel cells.
	var test_x := floori(player.global_position.x) + 3
	var test_z := floori(player.global_position.z)
	var test_y := world.surface_height_at(test_x, test_z) + 1
	var door_base := Vector3i(test_x, test_y, test_z)
	world.prepare_player_column(Vector3(door_base) + Vector3(0.5, 1.0, 0.5))
	world.set_block_global(door_base, BlockRegistry.AIR)
	world.set_block_global(door_base + Vector3i.UP, BlockRegistry.AIR)
	var door_id := BlockRegistry.get_id_by_stable_id("construction.door.oak")
	_check(world.place_door(door_base, door_id, 3)
			and world.get_block_global(door_base) == door_id
			and world.get_block_global(door_base + Vector3i.UP) == door_id,
		"door did not place as a two-voxel object")
	_check(world.get_door_record(door_base + Vector3i.UP).get("base", []) \
				== [door_base.x, door_base.y, door_base.z]
			and world.get_block_orientation(door_base) == 3,
		"upper door half did not resolve to the saved oriented base")
	var saved_entities := world.serialize_block_entities()
	world._doors.clear()
	world._door_parts.clear()
	world._block_orientations.clear()
	world.apply_block_entities(saved_entities)
	_check(world.is_door_at(door_base)
			and world.is_door_at(door_base + Vector3i.UP)
			and world.get_block_orientation(door_base) == 3,
		"door halves or orientation did not survive block-entity restore")
	world.remove_door(door_base)

	# Persistent orientation and multi-input chute topology feed the mesher.
	var stair_id := BlockRegistry.get_id_by_stable_id("construction.stair.oak")
	world.set_block_global(door_base, stair_id)
	world.set_block_orientation(door_base, 2)
	_check(world.get_block_orientation(door_base) == 2,
		"directional block orientation did not persist in the world")
	world.set_block_global(door_base, BlockRegistry.AIR)
	var chute_id := BlockRegistry.get_id_by_stable_id("automation.transport.chute")
	var chute_snapshot := _mesh_snapshot(chute_id, 5, false)
	chute_snapshot["item_connectors"][chute_id] = 1
	for offset in [
		Vector3i(0, 0, -1), Vector3i(1, 0, 0), Vector3i(0, 0, 1),
	]:
		chute_snapshot["blocks"][_index(
			8 + offset.x, 8 + offset.y, 8 + offset.z)] = chute_id
	var connection_mask := ChunkMesherScript.chute_connection_mask(
		chute_snapshot, 8, 8, 8, 0)
	var junction_vertices := PackedVector3Array()
	ChunkMesherScript._emit_connected_chute(
		chute_snapshot, Vector3(8, 8, 8), chute_id, 0,
		junction_vertices, PackedVector3Array(), PackedColorArray(),
		PackedVector2Array(), PackedVector2Array(), PackedVector3Array())
	_check(connection_mask == 7 and junction_vertices.size() == 396,
		"T chute did not retain all inputs and close its unconnected outer wall")

	# Ability assignments are explicit, visual, and saved independently from
	# the item hotbar.
	MagicState.reset()
	MagicState.unlock_poc_magic("probe")
	MagicState.assign_ability(0, "spell.spark_bolt")
	MagicState.assign_ability(3, "spell.stone_sense")
	MagicState.select_ability_slot(6)
	MagicState.set_action_bar_active(true)
	var saved_magic := MagicState.serialize_state()
	MagicState.reset()
	MagicState.restore_state(saved_magic)
	_check(MagicState.get_ability_slot(0) == "spell.spark_bolt"
			and MagicState.get_ability_slot(3) == "spell.stone_sense"
			and MagicState.selected_ability_slot == 6
			and MagicState.action_bar_active,
		"nine-slot skill bar selection or assignments did not survive restore")
	_check(hud._ability_hud_buttons.size() == MagicState.ABILITY_SLOT_COUNT
			and hud._mana_pips != null and hud._health_hearts != null
			and hud._item_hotbar_bar != null
			and hud._ability_hotbar_bar != null,
		"switchable skill bar, mana pips, or heart HUD was not built")
	MagicState.select_ability_slot(0)
	var mana_before_lmb := MagicState.mana
	var primary_skill_event := InputEventAction.new()
	primary_skill_event.action = "break_block"
	primary_skill_event.pressed = true
	player._unhandled_input(primary_skill_event)
	_check(MagicState.mana < mana_before_lmb
			and int(MagicState.cast_counts.get("spell.spark_bolt", 0)) == 1
			and player.held_visual_identity().is_empty(),
		"active skill bar did not route LMB to its selected skill")

	# Registry presentation explicitly records the 32x32 contract and the
	# door's assembled 32x64 exception.
	var door_profile := BlockRegistry.get_visual_profile(door_id)
	var pickaxe_id := ItemRegistry.get_id_by_stable_id("item.tool.stone_pickaxe")
	var pickaxe_profile := ItemRegistry.get_visual_profile(pickaxe_id)
	_check(door_profile.get("source_pixels", []) == [32, 32]
			and door_profile.get("assembled_pixels", []) == [32, 64],
		"door visual profile did not declare 32x32 cells assembled to 32x64")
	_check(pickaxe_profile.get("source_pixels", []) == [32, 32]
			and pickaxe_profile.get("model_kind", "") == "pickaxe",
		"tool HUD/held visual profile did not share the 32x32 pickaxe identity")

	# The raid is sourced from the deterministic stamped camp. Reproduce the
	# exact actor-lifecycle path that previously assigned a freed instance.
	CombatState.reset_raid()
	var begun := raid_runtime.begin_raid()
	var spawn_volume := raid_runtime.get_camp_spawn_volume_definition()
	var camp_anchor: Vector2i = world.valley_plan.get_anchor("goblin_camp")
	var hamlet_anchor: Vector2i = world.valley_plan.get_anchor("hamlet")
	_check(bool(begun.get("ok", false))
			and float(CombatState.camp_state.get("distance_to_hamlet", 0.0)) \
				>= 95.0,
		"raid did not validate and originate from the real goblin camp")
	_check(str(spawn_volume.get("spawn_mode", "")) == "authored_structure"
			and str(spawn_volume.get("mob_family", "")) == "goblin"
			and spawn_volume.get("spawn_points", []).size() == 4
			and Vector2(
				float(spawn_volume.get("center", [0.0, 0.0, 0.0])[0]),
				float(spawn_volume.get("center", [0.0, 0.0, 0.0])[2])
			).distance_to(Vector2(camp_anchor)) <= 4.5,
		"goblin camp did not own a four-point authored spawn volume")
	var volume_center_value: Array = spawn_volume.get("center", [])
	var initial_center_feet := Vector3i(
		floori(float(volume_center_value[0])),
		world.surface_height_at(
			floori(float(volume_center_value[0])),
			floori(float(volume_center_value[2]))) + 1,
		floori(float(volume_center_value[2])))
	raid_runtime._refresh_spawn_volume_readiness()
	var initial_surface_ready := world.is_spawn_surface_ready_at(
		initial_center_feet)
	_check(
		bool(raid_runtime._camp_spawn_volume.call("is_stream_ready"))
				== initial_surface_ready
			and raid_runtime._camp_spawn_volume.visible
				== initial_surface_ready
			and raid_runtime._camp_spawn_volume.collision_layer
				== (1 if initial_surface_ready else 0),
		"camp spawner visibility/collision did not follow committed chunk readiness")
	world.prepare_player_column(Vector3(
		float(volume_center_value[0]), float(volume_center_value[1]),
		float(volume_center_value[2])))
	for point_value in spawn_volume.get("spawn_points", []):
		var point: Array = point_value
		world.prepare_player_column(Vector3(
			float(point[0]), float(point[1]), float(point[2])))
	raid_runtime._refresh_spawn_volume_readiness()
	_check(bool(raid_runtime._camp_spawn_volume.call("is_stream_ready"))
			and raid_runtime._camp_spawn_volume.visible
			and raid_runtime._camp_spawn_volume.collision_layer == 1,
		"camp spawner appeared before render/collision readiness or stayed inert")
	var previous_player_position := player.global_position
	var previous_player_yaw := player._yaw
	var previous_player_pitch := player._pitch
	var spawner_center: Vector3 = raid_runtime._camp_spawn_volume.global_position
	player.global_position = spawner_center + Vector3(0.0, 0.0, 3.0)
	player.velocity = Vector3.ZERO
	player.restore_view(0.0, -0.64)
	await get_tree().physics_frame
	player.ray.force_raycast_update()
	player._update_highlight()
	_check(player.ray.is_colliding()
			and player.ray.get_collider() == raid_runtime._camp_spawn_volume
			and player.highlight.visible,
		"player targeting ray/highlight did not detect the loaded camp spawner")
	player.global_position = previous_player_position
	player.velocity = Vector3.ZERO
	player.restore_view(previous_player_yaw, previous_player_pitch)
	CombatState.advance(CombatState.RAID_WARNING_SECONDS + 0.1)
	raid_runtime._refresh_phase()
	raid_runtime._refresh_actors()
	_check(raid_runtime.active_actor_count() == 4,
		"camp-sourced assault did not promote four local goblins")
	var enemy_ids := CombatState.get_enemy_ids()
	var first_actor: Variant = raid_runtime._actors.get(enemy_ids[0])
	_check(player.primary_action_is_combat_target(first_actor),
		"LMB context did not recognise a goblin as an attack target")
	var source_facts_valid := true
	var spawn_cells_ready := true
	var spawn_positions_inside_camp_volume := true
	var volume_center := Vector2(
		float(spawn_volume.get("center", [0.0, 0.0, 0.0])[0]),
		float(spawn_volume.get("center", [0.0, 0.0, 0.0])[2]))
	var volume_size := Vector2(
		float(spawn_volume.get("size", [0.0, 0.0, 0.0])[0]),
		float(spawn_volume.get("size", [0.0, 0.0, 0.0])[2]))
	for enemy_id in enemy_ids:
		var record := CombatState.get_enemy_record(enemy_id)
		var enemy_position: Array = record.get("position", [])
		var enemy_gp := Vector3i(
			floori(float(enemy_position[0])), floori(float(enemy_position[1])),
			floori(float(enemy_position[2])))
		source_facts_valid = source_facts_valid \
			and str(record.get("source_camp_id", "")).begins_with("enemy_camp.") \
			and str(record.get("spawn_origin", "")) == "authored_volume" \
			and str(record.get("spawn_volume_id", "")) \
				== str(spawn_volume.get("id", "")) \
			and record.get("staging_anchor", []).size() == 2 \
			and float(record.get("spawn_distance", 0.0)) >= 90.0
		var enemy_xz := Vector2(
			float(enemy_position[0]), float(enemy_position[2]))
		spawn_positions_inside_camp_volume = \
			spawn_positions_inside_camp_volume \
			and absf(enemy_xz.x - volume_center.x) <= volume_size.x * 0.5 \
			and absf(enemy_xz.y - volume_center.y) <= volume_size.y * 0.5 \
			and enemy_xz.distance_to(Vector2(camp_anchor)) <= 9.0 \
			and enemy_xz.distance_to(Vector2(hamlet_anchor)) >= 90.0
		spawn_cells_ready = spawn_cells_ready \
			and world.is_voxel_loaded_at(enemy_gp) \
			and world.is_voxel_loaded_at(enemy_gp + Vector3i.DOWN)
	_check(source_facts_valid and spawn_cells_ready
			and spawn_positions_inside_camp_volume,
		"goblins were not created inside their camp-owned, chunk-ready volume")
	for _attempt in 6:
		raid_runtime._camp_spawn_volume.set("_next_spawn_seconds", 0.0)
		raid_runtime._camp_spawn_volume.call("_process", 0.1)
	_check(int(raid_runtime._camp_spawn_volume.call("ambient_actor_count")) == 2
			and int(raid_runtime._camp_spawn_volume.call("nearby_mob_count")) == 6,
		"timed spawner exceeded its three-local/six-nearby population caps")
	if is_instance_valid(first_actor):
		CombatState.damage_enemy(enemy_ids[0], {
			"source": "probe",
			"damage_type": "physical.test",
			"amount": 999.0,
		})
		first_actor.queue_free()
	await get_tree().process_frame
	await get_tree().process_frame
	raid_runtime._clear_inactive_actors()
	_check(not raid_runtime._actors.has(enemy_ids[0]),
		"raid runtime retained a freed goblin reference")
	CombatState.phase = "resolved"
	raid_runtime._clear_inactive_actors()
	_check(raid_runtime.active_actor_count() == 0,
		"raid runtime did not clear remaining actors after assault")
	world.prepare_player_column(Vector3(
		float(volume_center_value[0]), float(volume_center_value[1]),
		float(volume_center_value[2])))
	raid_runtime._refresh_spawn_volume_readiness()
	var spawner_broken := bool(
		raid_runtime._camp_spawn_volume.call("break_spawner"))
	_check(spawner_broken
			and raid_runtime._camp_spawn_volume.collision_layer == 0
			and not bool(CombatState.camp_state.get("spawner_active", true))
			and bool(CombatState.camp_state.get("cleared", false)),
		"raycastable camp spawner did not break/disable camp: %s/%d/%s/%s" % [
			spawner_broken,
			raid_runtime._camp_spawn_volume.collision_layer,
			CombatState.camp_state.get("spawner_active", true),
			CombatState.camp_state.get("cleared", false),
		])

	var spacing_valid: bool = world.valley_plan.validation_errors.is_empty() \
		and world.valley_plan.structure_distance_rules().size() >= 10
	_check(spacing_valid,
		"structure and enemy-source distance rules failed valley validation")

	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"camp_distance": CombatState.camp_state.get("distance_to_hamlet", 0.0),
		"chute_mask": connection_mask,
		"ability_slots": MagicState.ability_slots,
	}
	print("PHASE7_STABILIZATION_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
