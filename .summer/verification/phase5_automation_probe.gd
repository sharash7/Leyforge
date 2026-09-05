extends Node

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


func _batch_total(automation: AutomationSystem, stable_id: String) -> int:
	var total := 0
	for batch in automation.batches:
		var stack: Dictionary = batch.get("stack", {})
		if Inventory.stack_stable_id(stack) == stable_id:
			total += int(stack.get("count", 0))
	return total


func _run_steps(
		automation: AutomationSystem, count: int, delta: float, near: Vector3) -> void:
	for _i in count:
		automation.process(delta, near)


func _run() -> void:
	var world: VoxelWorld = load("res://scripts/world/voxel_world.gd").new()
	add_child(world)
	world.start(1337)
	HamletState.initialized = false
	HamletState.initialize(1337, world.get_valley_anchors())
	var social_trust := SocialManager.apply_reputation_event({
		"transaction_id": "phase5.automation.social_trust",
		"scope_ref": HamletState.active_village_id,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"delta": 16,
		"source_event_id": "event.phase5.automation.social_trust",
	})
	HamletState.refresh_social_projection()
	var trust_did_not_grant_import := not HamletState.permission_enabled(
		"automation_import")
	var operational_access := HamletState._commit_operational_access_delta(
		16, "phase5.automation.confirmed_operational_access")
	_check(bool(social_trust.get("ok", false)) \
			and trust_did_not_grant_import \
			and operational_access \
			and HamletState.permission_enabled("automation_import"),
		"automation import did not separate social trust from operational evidence")

	var miner_id := BlockRegistry.get_id_by_stable_id("automation.machine.basic_miner")
	var chute_id := BlockRegistry.get_id_by_stable_id("automation.transport.chute")
	var crank_id := BlockRegistry.get_id_by_stable_id("power.crank.basic")
	var hatch_id := BlockRegistry.get_id_by_stable_id(
		"automation.village.warehouse_input_hatch")
	_check(miner_id == 309 and hatch_id == 310,
		"new Stage 5 block identities did not resolve stably")
	_check(chute_id > 0 and crank_id > 0,
		"authored chute or crank identity is missing")
	for recipe_id in [
		"recipe.workbench.component.gear_copper",
		"recipe.workbench.component.machine_frame_copper",
		"recipe.workbench.component.miner_head_iron",
		"recipe.workbench.block.item_chute_basic",
		"recipe.workbench.block.basic_mechanical_miner",
		"recipe.workbench.block.warehouse_input_hatch",
	]:
		_check(not RecipeRegistry.get_recipe(recipe_id).is_empty(),
			"missing Stage 5 recipe %s" % recipe_id)

	# One chain spans the x=15/16 chunk boundary:
	# ore/miner -> chute -> furnace -> chute -> warehouse hatch.
	var miner := Vector3i(14, 24, 10)
	var crank := miner + Vector3i(0, 0, 1)
	var ore := miner + Vector3i(0, -1, 0)
	var chute_in := miner + Vector3i(1, 0, 0)
	var furnace := miner + Vector3i(2, 0, 0)
	var chute_out := miner + Vector3i(3, 0, 0)
	var hatch := miner + Vector3i(4, 0, 0)
	for position in [miner, crank, ore, chute_in, furnace, chute_out, hatch]:
		world.prepare_player_column(Vector3(position) + Vector3(0.5, 1.0, 0.5))
		world.set_block_global(position, BlockRegistry.AIR)
	_check(world.set_block_global(ore, world.id_iron), "probe could not place finite iron")
	_check(world.set_block_global(miner, miner_id), "probe could not place miner")
	_check(world.set_block_global(crank, crank_id), "probe could not place crank")
	_check(world.set_block_global(chute_in, chute_id), "probe could not place input chute")
	_check(world.set_block_global(furnace, world.id_furnace), "probe could not place furnace")
	_check(world.set_block_global(chute_out, chute_id), "probe could not place output chute")
	_check(world.set_block_global(hatch, hatch_id), "probe could not place hatch")
	world.automation.process(0.25, Vector3(miner))
	_check(world.automation.boundary_connectors.size() >= 1,
		"cross-chunk item connector was not materialised")

	var crank_result := world.automation.perform_action(crank, "")
	_check(bool(crank_result.get("ok", false)),
		"manual crank did not accept a power action")
	_check(world.automation.get_inspection(miner).get("kind", "") == "miner",
		"RMB automation inspection did not expose the miner")
	_check(world.automation.get_inspection(crank).get("kind", "") == "crank",
		"RMB automation inspection did not expose crank power")
	_check(world.automation.perform_action(chute_in, "").get("ok", true) == false,
		"chute configuration did not require the documented wrench")
	_check(world.automation.perform_action(
		chute_in, "item.tool.wrench_basic").get("ok", false),
		"Basic Wrench did not configure chute routing")

	# Furnace buttons are real drag endpoints. A whole valid fuel stack must
	# commit atomically, remain visible in the furnace, and drag back losslessly.
	var hud := Hud.new()
	add_child(hud)
	var test_player := Player.new()
	test_player.world = world
	hud.player = test_player
	hud.craft_mode = "furnace"
	hud.craft_open = true
	hud.station_position = furnace
	_check(hud._furnace_fuel_button.slot_group == "furnace_fuel"
			and hud._furnace_output_button.slot_group == "furnace_output",
		"furnace controls were not configured as drag/drop endpoints")
	var original_hotbar_zero := Inventory.get_group_slot("hotbar", 0).duplicate(true)
	Inventory.set_group_slot("hotbar", 0, _stack("item.resource.coal_chunk", 3), false)
	_check(hud.can_drop_stack("hotbar", 0, "furnace_fuel", 0),
		"furnace fuel endpoint rejected a valid dragged coal stack")
	hud.handle_drop_stack("hotbar", 0, "furnace_fuel", 0)
	_check(Inventory.get_group_slot("hotbar", 0).is_empty()
			and int(world.get_furnace_slot(furnace, "fuel").get("count", 0)) == 3,
		"dragged furnace fuel bounced back or changed quantity")
	_check(not world.furnace_slot_accepts_stack(
			"fuel", _stack("item.resource.raw_iron_ore")),
		"furnace fuel endpoint accepted a non-fuel ingredient")
	hud.handle_drop_stack("furnace_fuel", 0, "hotbar", 0)
	_check(world.get_furnace_slot(furnace, "fuel").is_empty()
			and int(Inventory.get_group_slot("hotbar", 0).get("count", 0)) == 3,
		"fuel drag-back did not conserve the original stack")
	Inventory.set_group_slot("hotbar", 0, original_hotbar_zero, false)
	hud.free()
	test_player.free()

	var coal := _stack("item.resource.coal_chunk", 2)
	_check(world.automation_receive(furnace, coal, "donation", "probe", "fuel.1"),
		"furnace automation port rejected valid fuel")
	_run_steps(world.automation, 40, 0.25, Vector3(miner))
	var furnace_state := world.get_furnace_state(furnace)
	var raw_ref := {
		"kind": "item",
		"stable_id": "item.resource.raw_iron_ore",
		"count": 1,
	}
	var raw_in_furnace := 0
	for stack in furnace_state.get("inputs", []):
		if Inventory.stack_matches_ref(stack, raw_ref):
			raw_in_furnace += int(stack.get("count", 0))
	_check(world.get_persisted_block_id(ore) == BlockRegistry.AIR,
		"miner did not consume its finite source voxel")
	_check(raw_in_furnace == 1 and _batch_total(
		world.automation, "item.resource.raw_iron_ore") == 0,
		"ore was duplicated or lost between deposit, batch, and furnace")

	world._process_furnaces(18.25)
	_check(Inventory.stack_stable_id(
		world.automation_peek_output(furnace)) == "item.material.iron_ingot",
		"automated furnace did not process raw iron")
	_run_steps(world.automation, 30, 0.25, Vector3(miner))
	var ingot_ref := {
		"kind": "item",
		"stable_id": "item.material.iron_ingot",
		"count": 1,
	}
	_check(HamletState.warehouse_count_ref(ingot_ref) == 1,
		"processed iron did not reach the village warehouse")
	_check(HamletState.delivery_ledger.size() == 1,
		"successful automated import was not written to the ledger")

	# Dispatch four more ingots, revoke permission in flight, and verify that
	# the blocked batch owns the exact quantity through save/restore.
	var blocked_output := _stack("item.material.iron_ingot", 4)
	var blocked_state := world._ensure_furnace(furnace)
	blocked_state["output"] = blocked_output
	world._furnaces[world._edit_key(furnace)] = blocked_state
	world.automation.process(0.25, Vector3(miner))
	_check(_batch_total(world.automation, "item.material.iron_ingot") == 4,
		"furnace output was not committed into one conserved item batch")
	HamletState.permissions["automation_import"] = false
	_run_steps(world.automation, 30, 0.25, Vector3(miner))
	_check(_batch_total(world.automation, "item.material.iron_ingot") == 4,
		"permission blockage deleted or duplicated the in-flight batch")
	_check(HamletState.warehouse_count_ref(ingot_ref) == 1,
		"permission-blocked delivery mutated warehouse stock")
	_check(not world.can_remove_block_entity(chute_out),
		"in-flight chute could be removed and orphan its batch")
	var blocked_correlation := str(world.automation.batches[0]["correlation_id"])
	var saved_automation := world.automation.serialize_state()
	_check(saved_automation.get("boundary_connectors", []).size() >= 1,
		"automation save omitted cross-chunk connectors")
	world.automation.restore_state(saved_automation)
	_check(_batch_total(world.automation, "item.material.iron_ingot") == 4,
		"blocked batch did not survive save/restore")

	HamletState.permissions["automation_import"] = true
	_run_steps(world.automation, 8, 2.0, Vector3(500, 500, 500))
	_check(HamletState.warehouse_count_ref(ingot_ref) == 5,
		"far/unloaded summary did not commit the restored delivery exactly once")
	_check(_batch_total(world.automation, "item.material.iron_ingot") == 0,
		"committed far-simulation batch remained duplicated in transit")
	var ledger_size := HamletState.delivery_ledger.size()
	var retry := HamletState.automation_import_stack(
		blocked_output, "donation", "probe", blocked_correlation)
	_check(bool(retry.get("duplicate", false))
			and HamletState.warehouse_count_ref(ingot_ref) == 5
			and HamletState.delivery_ledger.size() == ledger_size,
		"correlation retry duplicated warehouse stock or ledger facts")
	var saved_hamlet := HamletState.serialize_state()
	_check(HamletState.restore_state(saved_hamlet, 1337),
		"hamlet state rejected its automation ledger save")
	var restored_retry := HamletState.automation_import_stack(
		blocked_output, "donation", "probe", blocked_correlation)
	_check(bool(restored_retry.get("duplicate", false))
			and HamletState.warehouse_count_ref(ingot_ref) == 5,
		"committed correlation did not remain idempotent after save/restore")

	# Automatic miners choose the nearest valuable ore, ignoring common blocks.
	# Wrench configuration can then lock the same miner to one exact ore family.
	var selector_miner := Vector3i(40, 46, 40)
	var selector_crank := selector_miner + Vector3i(0, 0, 1)
	var selector_coal := selector_miner + Vector3i(0, -1, 0)
	var selector_iron := selector_miner + Vector3i(0, -2, 0)
	for position in [selector_miner, selector_crank, selector_coal, selector_iron]:
		world.prepare_player_column(Vector3(position) + Vector3(0.5, 1.0, 0.5))
		world.set_block_global(position, BlockRegistry.AIR)
	_check(world.set_block_global(selector_coal, world.id_coal)
			and world.set_block_global(selector_iron, world.id_iron)
			and world.set_block_global(selector_miner, miner_id)
			and world.set_block_global(selector_crank, crank_id),
		"probe could not place configurable miner test blocks")
	world.automation.process(0.25, Vector3(selector_miner))
	_check(world.automation.perform_action(selector_crank, "").get("ok", false),
		"configurable miner crank did not charge")
	_run_steps(world.automation, 26, 0.25, Vector3(selector_miner))
	var selector_key := "%d,%d,%d" % [
		selector_miner.x, selector_miner.y, selector_miner.z]
	var selector_output: Dictionary = world.automation.states.get(
		selector_key, {}).get("output", {})
	_check(world.get_persisted_block_id(selector_coal) == BlockRegistry.AIR
			and world.get_persisted_block_id(selector_iron) == world.id_iron
			and Inventory.stack_stable_id(selector_output) == "item.resource.coal_chunk",
		"automatic miner did not choose the closest valuable ore")
	for _i in 3:
		_check(world.automation.perform_action(
			selector_miner, "item.tool.wrench_basic").get("ok", false),
			"wrench could not cycle the miner target")
	var selector_state: Dictionary = world.automation.states.get(selector_key, {})
	_check(str(selector_state.get("mining_mode", "")) == "ore.iron.basic",
		"miner target cycle did not reach the selected iron setting")
	selector_state["output"] = {}
	world.automation.states[selector_key] = selector_state
	_check(world.set_block_global(selector_coal, world.id_coal),
		"probe could not replace coal beside selected miner")
	_run_steps(world.automation, 26, 0.25, Vector3(selector_miner))
	selector_output = world.automation.states.get(selector_key, {}).get("output", {})
	_check(world.get_persisted_block_id(selector_coal) == world.id_coal
			and world.get_persisted_block_id(selector_iron) == BlockRegistry.AIR
			and Inventory.stack_stable_id(
				selector_output) == "item.resource.raw_iron_ore",
		"selected miner did not ignore closer coal and extract iron")

	# Project-mode imports credit only the current stage, then reserve the exact
	# goods through the existing Stage 4 project transaction.
	var foundation := HamletState.get_project_stage_definition(1)
	for content_ref in foundation["requirements"]:
		var delivery := HamletState.automation_import_stack(
			Inventory.make_stack_from_ref(content_ref),
			"project", "probe.project",
			"project.%s" % str(content_ref["stable_id"]))
		_check(bool(delivery.get("ok", false)),
			"project hatch rejected required %s" % content_ref["stable_id"])
	_check(HamletState.project_is_building(),
		"completed automated stage delivery did not enter builder labour")
	var request_event_linked := false
	for ledger_value in HamletState.delivery_ledger:
		var ledger_entry: Dictionary = ledger_value
		if str(ledger_entry.get("request_id", "")) != str(
				foundation.get("request_id", "")):
			continue
		var event_ref := str(ledger_entry.get("event_ref", ""))
		if not event_ref.is_empty() and EventManager.has_event(event_ref) \
				and not str(ledger_entry.get("history_ref", "")).is_empty():
			request_event_linked = true
			break
	_check(request_event_linked,
		"automated request completion omitted its canonical event/history refs")
	for content_ref in foundation["requirements"]:
		_check(int(HamletState.project.get("reserved", {}).get(
			str(content_ref["stable_id"]), 0)) == int(content_ref["count"]),
			"project reservation was not exact for %s" % content_ref["stable_id"])
	var wrong_project_input := HamletState.can_automation_project_accept(
		_stack("item.material.iron_ingot", 1))
	_check(not wrong_project_input,
		"project mode accepted material outside the active stage")

	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"automation_states": world.automation.states.size(),
		"boundary_connectors": world.automation.boundary_connectors.size(),
		"ledger_entries": HamletState.delivery_ledger.size(),
		"failures": failures,
	}
	print("PHASE5_AUTOMATION_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
