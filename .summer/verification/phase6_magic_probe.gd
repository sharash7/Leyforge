extends Node

class DamageTarget:
	extends Node
	var packets: Array[Dictionary] = []

	func apply_magic_damage(packet: Dictionary) -> void:
		packets.append(packet.duplicate(true))


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


func _prepare(world: VoxelWorld, positions: Array[Vector3i]) -> void:
	for position in positions:
		world.prepare_player_column(
			Vector3(position) + Vector3(0.5, 1.0, 0.5))
		world.set_block_global(position, BlockRegistry.AIR)


func _run() -> void:
	_clear_inventory()
	ProgressionState.reset()
	MagicState.reset()

	var magic_ids := {
		"magic.furnace.mana": 25,
		"magic.rune_table.basic": 30,
		"magic.ward_lantern.basic": 46,
		"magic.conduit.mana_basic": 47,
		"magic.battery.mana": 98,
		"magic.portal_frame.ancient": 108,
	}
	for stable_id in magic_ids:
		_check(
			BlockRegistry.get_id_by_stable_id(stable_id) == int(magic_ids[stable_id]),
			"magic block identity did not resolve: %s" % stable_id)
	for recipe_id in [
		"recipe.furnace.magic.mana_shard",
		"recipe.furnace.magic.mana_dust",
		"recipe.rune_table.rune.basic",
		"recipe.rune_table.core.ward_basic",
		"recipe.workbench.block.mana_furnace",
		"recipe.workbench.block.mana_battery",
		"recipe.workbench.block.mana_conduit",
		"recipe.workbench.block.ward_lantern",
		"recipe.mana_furnace.ingot.iron",
	]:
		_check(not RecipeRegistry.get_recipe(recipe_id).is_empty(),
			"missing Stage 6 recipe %s" % recipe_id)

	_check(not ProgressionState.has_basic_magic_knowledge()
			and not MagicState.is_spell_known("spell.stone_sense"),
		"fresh progression started with basic magic unlocked")
	MagicState.unlock_poc_magic("npc.village_mage.forest")
	_check(ProgressionState.has_basic_magic_knowledge()
			and ProgressionState.is_recipe_known("recipe.rune_table.rune.basic"),
		"mage teaching did not unlock Rune Table knowledge")
	_check(MagicState.is_spell_known("spell.stone_sense")
			and MagicState.is_spell_known("spell.spark_bolt"),
		"mage teaching did not unlock both POC spells")

	var target := DamageTarget.new()
	add_child(target)
	var mana_before := MagicState.mana
	var bolt := MagicState.cast_spark_bolt(target)
	_check(bool(bolt.get("ok", false)) and bool(bolt.get("hit", false))
			and target.packets.size() == 1
			and float(target.packets[0].get("amount", 0.0)) == 8.0,
		"Spark Bolt did not deliver its shared shock-damage packet")
	_check(MagicState.mana == mana_before - 18.0,
		"Spark Bolt did not consume its exact personal mana cost")
	_check(str(MagicState.cast_spark_bolt(target).get("fault", "")) == "cooldown",
		"Spark Bolt cooldown did not reject immediate recasting")
	var saved_player_magic := MagicState.serialize_state()
	MagicState.reset()
	MagicState.restore_state(saved_player_magic)
	_check(MagicState.is_spell_known("spell.spark_bolt")
			and MagicState.cooldown_remaining("spell.spark_bolt") > 0.0
			and MagicState.mana == mana_before - 18.0,
		"personal mana, known spells, or cooldown did not restore")

	var world: VoxelWorld = load("res://scripts/world/voxel_world.gd").new()
	add_child(world)
	world.start(1337)
	var battery := Vector3i(14, 40, 0)
	var conduit_a := Vector3i(15, 40, 0)
	var conduit_b := Vector3i(16, 40, 0)
	var ward := Vector3i(17, 40, 0)
	var mana_furnace := Vector3i(16, 40, 1)
	var isolated_ward := Vector3i(24, 40, 0)
	var portal := Vector3i(26, 40, 0)
	_prepare(world, [
		battery, conduit_a, conduit_b, ward, mana_furnace,
		isolated_ward, portal,
	])
	_check(world.set_block_global(battery, world.id_mana_battery)
			and world.set_block_global(conduit_a, world.id_mana_conduit)
			and world.set_block_global(conduit_b, world.id_mana_conduit)
			and world.set_block_global(ward, world.id_ward_lantern)
			and world.set_block_global(mana_furnace, world.id_mana_furnace)
			and world.set_block_global(isolated_ward, world.id_ward_lantern)
			and world.set_block_global(portal, world.id_portal_frame),
		"probe could not place Stage 6 infrastructure")
	world.magic.process(0.25, Vector3(battery))
	_check(world.magic.boundary_connectors.size() == 1,
		"cross-chunk mana conduit did not produce one stable connector")
	_check(str(world.get_magic_state(isolated_ward).get("fault", "")) == "unlinked",
		"isolated ward did not report the readable conduit fault")
	_check(str(world.get_magic_state(ward).get("fault", "")) == "no_mana",
		"linked ward with an empty battery did not report no mana")

	_clear_inventory()
	Inventory.set_group_slot(
		"hotbar", 0, _stack("item.resource.raw_mana_crystal"), false)
	var charge := world.perform_magic_action(battery)
	_check(bool(charge.get("ok", false))
			and Inventory.get_group_slot("hotbar", 0).is_empty()
			and is_equal_approx(
				float(world.get_magic_state(battery).get("mana", 0.0)), 64.0),
		"battery charging did not conserve one Raw Mana Crystal into 64 mana")
	world.magic.process(0.25, Vector3(battery))
	var coverage := world.ward_coverage_at(Vector3(ward) + Vector3.ONE * 0.5)
	_check(bool(coverage.get("warded", false))
			and int(coverage.get("defence_bonus", 0)) == 20,
		"powered ward did not expose its village-defence coverage")

	var raw_iron := _stack("item.resource.raw_iron_ore")
	_check(world.automation_receive(
			mana_furnace, raw_iron, "donation", "phase6", "mana.iron"),
		"mana furnace rejected an automated iron input")
	var battery_before_furnace := float(
		world.get_magic_state(battery).get("mana", 0.0))
	world._process_furnaces(11.25)
	var mana_output := world.automation_peek_output(mana_furnace)
	var battery_after_furnace := float(
		world.get_magic_state(battery).get("mana", 0.0))
	_check(Inventory.stack_stable_id(mana_output) == "item.material.iron_ingot",
		"mana furnace did not refine iron from network power")
	_check(is_equal_approx(
			battery_before_furnace - battery_after_furnace, 12.0),
		"mana furnace did not consume its exact 12-mana recipe cost")

	var sense_ore := Vector3i(12, 38, 2)
	_prepare(world, [sense_ore])
	_check(world.set_block_global(sense_ore, world.id_mana),
		"probe could not place a Stone Sense target")
	var sensed := world.find_stone_sense_targets(
		Vector3(14.0, 40.0, 0.0), 5, 24)
	_check(sensed.has(sense_ore),
		"Stone Sense did not reveal a nearby Mana Crystal Ore block")

	_clear_inventory()
	var note_result := world.perform_magic_action(portal)
	_check(bool(note_result.get("ok", false))
			and Inventory.count_ref({
				"kind": "item",
				"stable_id": "item.knowledge.basic_rune_note",
				"count": 1,
			}) == 1,
		"dormant portal teaser did not yield the one conserved Rune Note")
	_check(not bool(world.perform_magic_action(portal).get("ok", true))
			and Inventory.count_ref({
				"kind": "item",
				"stable_id": "item.knowledge.basic_rune_note",
				"count": 1,
			}) == 1,
		"portal teaser duplicated its one-time Rune Note")

	# Three simultaneous product families share one chute graph. Pending
	# reservations must allocate coal to fuel and exactly one ore family to
	# processing; the incompatible ore routes onward to the crate.
	var miner_iron := Vector3i(32, 40, 0)
	var miner_coal := Vector3i(32, 40, 2)
	var miner_copper := Vector3i(32, 40, 4)
	var route_furnace := Vector3i(34, 40, 1)
	var route_crate := Vector3i(34, 40, 3)
	var route_positions: Array[Vector3i] = [
		miner_iron, miner_coal, miner_copper, route_furnace, route_crate,
	]
	for z in range(0, 5):
		route_positions.append(Vector3i(33, 40, z))
	_prepare(world, route_positions)
	for miner in [miner_iron, miner_coal, miner_copper]:
		_check(world.set_block_global(miner, world.id_mechanical_miner),
			"probe could not place routing miner")
	for z in range(0, 5):
		_check(world.set_block_global(
			Vector3i(33, 40, z), world.id_chute),
			"probe could not place routing chute")
	_check(world.set_block_global(route_furnace, world.id_furnace)
			and world.set_block_global(route_crate, world.id_crate),
		"probe could not place routing endpoints")
	world.automation.process(0.25, Vector3(miner_iron))
	var iron_route := world.automation._find_route(
		miner_iron, _stack("item.resource.raw_iron_ore"), 1)
	world.automation._create_batch(
		_stack("item.resource.raw_iron_ore"), iron_route)
	var coal_route := world.automation._find_route(
		miner_coal, _stack("item.resource.coal_chunk"), 1)
	world.automation._create_batch(
		_stack("item.resource.coal_chunk"), coal_route)
	var copper_route := world.automation._find_route(
		miner_copper, _stack("item.resource.raw_copper_ore"), 1)
	_check(Vector3i(iron_route.get("path", [Vector3i.ZERO])[-1]) == route_furnace,
		"first ore did not reserve the furnace processing lane")
	_check(Vector3i(coal_route.get("path", [Vector3i.ZERO])[-1]) == route_furnace,
		"coal did not reserve the separate furnace fuel lane")
	_check(Vector3i(copper_route.get("path", [Vector3i.ZERO])[-1]) == route_crate,
		"incompatible second ore did not pass through to downstream storage")

	var saved_entities := world.serialize_block_entities()
	var saved_edits := world.serialize_edits()
	var world_restored: VoxelWorld = load(
		"res://scripts/world/voxel_world.gd").new()
	add_child(world_restored)
	world_restored.start(1337)
	for position in [battery, conduit_a, conduit_b, ward, mana_furnace, portal]:
		world_restored.prepare_player_column(
			Vector3(position) + Vector3(0.5, 1.0, 0.5))
	world_restored.apply_edits(saved_edits)
	world_restored.apply_block_entities(saved_entities)
	world_restored.magic.process(0.25, Vector3(1000, 1000, 1000))
	_check(float(world_restored.get_magic_state(battery).get("mana", 0.0)) > 0.0
			and bool(world_restored.get_magic_state(portal).get("note_claimed", false))
			and bool(world_restored.ward_coverage_at(
				Vector3(ward) + Vector3.ONE * 0.5).get("warded", false)),
		"magic identity, mana, ward state, or ruin history failed save/far-LOD restore")

	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"magic_states": world.magic.states.size(),
		"mana_connectors": world.magic.boundary_connectors.size(),
		"failures": failures,
	}
	print("PHASE6_MAGIC_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
