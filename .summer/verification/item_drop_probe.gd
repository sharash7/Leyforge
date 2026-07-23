extends Node

var failures: Array[String] = []
@onready var main: Node3D = $Main


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	if not condition:
		failures.append(message)


func _fill_inventory() -> void:
	var filler := Inventory.make_stack_from_ref({
		"kind": "block",
		"stable_id": "terrain.grass.basic",
		"count": 64,
	})
	for i in Inventory.HOTBAR_SIZE:
		Inventory.hotbar[i] = filler.duplicate(true)
	for i in Inventory.BACKPACK_SIZE:
		Inventory.backpack[i] = filler.duplicate(true)
	Inventory._emit_inventory_changed()


func _run() -> void:
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	_fill_inventory()
	var target := Vector3i(player.global_position.floor()) + Vector3i(2, 0, 0)
	_check(world.set_block_global(target, world.id_dirt),
		"probe could not place a mineable target")
	_check(player._break_block_at(target),
		"full inventory incorrectly prevented a physical mining drop")
	_check(
		BlockRegistry.is_air(world.get_block_global(target))
			and world.active_item_drop_count() == 1,
		"mined block did not become one persistent world item")
	var drop = world._item_drops[0]
	_check(drop._visual != null and drop._visual.get_child_count() > 0,
		"world item did not receive a static 3D visual")

	drop.global_position = player.global_position + Vector3(0.0, 0.5, 0.0)
	drop._age = 1.0
	drop._physics_process(0.01)
	_check(world.active_item_drop_count() == 1,
		"full inventory deleted a nearby world item instead of preserving it")
	Inventory.hotbar[0] = {}
	Inventory._emit_inventory_changed()
	drop._physics_process(0.01)
	var dirt_ref := {
		"kind": "block",
		"stable_id": "terrain.dirt.basic",
		"count": 1,
	}
	_check(
		world.active_item_drop_count() == 0 and Inventory.count_ref(dirt_ref) == 1,
		"nearby world item did not auto-pickup into available inventory space")

	var stick_stack := Inventory.make_stack_from_ref({
		"kind": "item",
		"stable_id": "item.resource.stick",
		"count": 5,
	})
	_check(world.spawn_item_drop(
		stick_stack, player.global_position + Vector3(4.0, 1.0, 0.0)),
		"probe could not create a saved drop")
	var saved := world.serialize_item_drops()
	_check(
		saved.size() == 1
			and str(saved[0].get("stack", {}).get("item_id", "")) == "item.resource.stick",
		"world item save did not use its stable content identity")
	world.restore_item_drops(saved)
	_check(
		world.active_item_drop_count() == 1
			and Inventory.stack_stable_id(world._item_drops[0].stack) == "item.resource.stick",
		"world item did not survive restore")

	var result := {
		"ok": failures.is_empty(),
		"checks": 9,
		"failures": failures,
	}
	print("ITEM_DROP_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
