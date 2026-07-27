class_name AutomationSystem
extends RefCounted
## Stage 5 mechanical automation runtime.
##
## Authoritative quantities live in machine buffers, transport batches, furnace
## inventories, crates, or the hamlet warehouse. The small moving cubes are
## views only and never own items. This lets the same transactions run while
## chunks are visible, distant, unloaded, saved, or restored.

signal changed

const VERSION := 1
const NEAR_DISTANCE := 40.0
const VISUAL_DISTANCE := 46.0
const NEAR_STEP := 0.25
const FAR_STEP := 2.0
const MAX_STEPS_PER_FRAME := 8
const MAX_OFFLINE_CATCHUP := 600.0
const MINER_CYCLE_SECONDS := 6.0
const MINER_BUFFER_SIZE := 64
const MINER_SCAN_RADIUS := 7
const CRANK_CAPACITY := 120.0
const CRANK_ACTION_POWER := 45.0
const BATCH_SIZE := 8
const BATCH_SPEED := 1.5
const MINER_MODES: Array[String] = [
	"automatic",
	"ore.coal.basic",
	"ore.copper.basic",
	"ore.iron.basic",
	"ore.mana_crystal.basic",
]
const MINER_OUTPUTS := {
	"ore.coal.basic": "item.resource.coal_chunk",
	"ore.copper.basic": "item.resource.raw_copper_ore",
	"ore.iron.basic": "item.resource.raw_iron_ore",
	"ore.mana_crystal.basic": "item.resource.raw_mana_crystal",
}

const DIRS6: Array[Vector3i] = [
	Vector3i(1, 0, 0), Vector3i(-1, 0, 0),
	Vector3i(0, 1, 0), Vector3i(0, -1, 0),
	Vector3i(0, 0, 1), Vector3i(0, 0, -1),
]

const BLOCK_KINDS := {
	"automation.machine.basic_miner": "miner",
	"automation.transport.chute": "chute",
	"power.crank.basic": "crank",
	"automation.village.warehouse_input_hatch": "warehouse_hatch",
}

var world: Node
var states: Dictionary = {} # stable position key -> runtime machine/node state
var batches: Array[Dictionary] = []
var boundary_connectors: Array[Dictionary] = []
var visual_distance := VISUAL_DISTANCE

var _graph: Dictionary = {}
var _topology_dirty := true
var _accumulator := 0.0
var _pending_catchup := 0.0
var _next_batch_serial := 1
var _tick_serial := 0
var _visuals: Dictionary = {}


func setup(world_ref: Node) -> void:
	world = world_ref


func apply_scalability_profile(profile: Dictionary) -> void:
	visual_distance = clampf(
		float(profile.get("automation_visual_distance", VISUAL_DISTANCE)),
		24.0, 80.0)


func runtime_counters() -> Dictionary:
	return {
		"machines": states.size(),
		"batches": batches.size(),
		"boundary_connectors": boundary_connectors.size(),
		"visible_batches": _visuals.size(),
		"pending_catchup_seconds": _pending_catchup,
		"visual_distance": visual_distance,
	}


func notify_topology_changed() -> void:
	_topology_dirty = true


func is_automation_block(block_id: int) -> bool:
	return BLOCK_KINDS.has(BlockRegistry.get_stable_id(block_id))


func register_block(gp: Vector3i, block_id: int) -> void:
	var stable_id := BlockRegistry.get_stable_id(block_id)
	if not BLOCK_KINDS.has(stable_id):
		return
	var key := _key(gp)
	if states.has(key):
		return
	var kind := str(BLOCK_KINDS[stable_id])
	var state := {
		"position": gp,
		"definition_id": stable_id,
		"kind": kind,
		"network_id": "",
		"status": "idle",
		"fault": "",
		"last_simulation_time": Time.get_unix_time_from_system(),
	}
	match kind:
		"miner":
			state["output"] = {}
			state["progress"] = 0.0
			state["deposit_target"] = []
			state["scan_cooldown"] = 0.0
			state["mining_mode"] = "automatic"
		"crank":
			state["power"] = 0.0
		"chute":
			state["route_policy"] = "automatic"
		"warehouse_hatch":
			state["delivery_mode"] = "donation"
	states[key] = state
	_topology_dirty = true
	changed.emit()


func unregister_block(gp: Vector3i) -> void:
	var key := _key(gp)
	if not states.has(key):
		return
	states.erase(key)
	_topology_dirty = true
	changed.emit()


func can_remove(gp: Vector3i) -> bool:
	var key := _key(gp)
	if states.has(key):
		var state: Dictionary = states[key]
		if not state.get("output", {}).is_empty():
			return false
	for batch in batches:
		if _batch_uses_position(batch, gp):
			return false
	return true


func process(delta: float, player_position: Vector3) -> void:
	if world == null or delta <= 0.0:
		return
	_reconcile_edited_blocks()
	if _topology_dirty:
		_rebuild_topology()
	var near := _has_nearby_node(player_position)
	var step := NEAR_STEP if near else FAR_STEP
	_accumulator += delta + minf(_pending_catchup, FAR_STEP * 2.0)
	_pending_catchup = maxf(0.0, _pending_catchup - FAR_STEP * 2.0)
	var steps := 0
	while _accumulator >= step and steps < MAX_STEPS_PER_FRAME:
		_simulate_step(step)
		_accumulator -= step
		steps += 1
	_sync_visuals(player_position)


func _simulate_step(delta: float) -> void:
	_tick_serial += 1
	for key in states.keys():
		var state: Dictionary = states[key]
		if str(state.get("kind", "")) == "miner":
			_process_miner(key, state, delta)
	_dispatch_outputs()
	_process_batches(delta)


func _process_miner(key: String, state: Dictionary, delta: float) -> void:
	var output: Dictionary = state.get("output", {})
	if not output.is_empty() and int(output.get("count", 0)) >= MINER_BUFFER_SIZE:
		_set_machine_status(state, "blocked", "output_blocked")
		states[key] = state
		return

	state["scan_cooldown"] = maxf(0.0, float(state.get("scan_cooldown", 0.0)) - delta)
	var mining_mode := str(state.get("mining_mode", "automatic"))
	if not MINER_MODES.has(mining_mode):
		mining_mode = "automatic"
		state["mining_mode"] = mining_mode
	var saved_target: Variant = state.get("deposit_target", [])
	var has_target: bool = saved_target is Array and saved_target.size() == 3
	var target: Vector3i = _array_to_pos(saved_target) if has_target else Vector3i.ZERO
	var target_block_id: int = (
		world.get_persisted_block_id(target) if has_target else -1)
	if has_target and not _miner_mode_accepts_block(mining_mode, target_block_id):
		has_target = false
		target_block_id = -1
	if not has_target:
		if float(state["scan_cooldown"]) <= 0.0:
			var resource_ids := _miner_resource_ids(mining_mode)
			var found: Dictionary = world.find_nearest_automation_resource(
				Vector3i(state["position"]), resource_ids, MINER_SCAN_RADIUS)
			if not found.is_empty():
				target = Vector3i(found["position"])
				target_block_id = int(found["block_id"])
				has_target = true
			state["scan_cooldown"] = 3.0
		state["deposit_target"] = _pos_to_array(target) if has_target else []
	if not has_target:
		state["progress"] = 0.0
		_set_machine_status(state, "idle", "no_deposit")
		states[key] = state
		return

	var crank_key := _powered_crank_key(Vector3i(state["position"]))
	if crank_key.is_empty():
		_set_machine_status(state, "idle", "no_power")
		states[key] = state
		return
	var crank: Dictionary = states[crank_key]
	var powered_seconds := minf(delta, float(crank.get("power", 0.0)))
	if powered_seconds <= 0.0:
		_set_machine_status(state, "idle", "no_power")
		states[key] = state
		return
	crank["power"] = maxf(0.0, float(crank["power"]) - powered_seconds)
	crank["status"] = "supplying"
	crank["fault"] = ""
	crank["last_simulation_time"] = Time.get_unix_time_from_system()
	states[crank_key] = crank
	state["progress"] = float(state.get("progress", 0.0)) + powered_seconds
	_set_machine_status(state, "active", "")

	if float(state["progress"]) >= MINER_CYCLE_SECONDS:
		# Commit the deposit removal and buffer insertion as one reversible
		# operation. The world edit is restored if the output cannot be formed.
		if world.consume_automation_resource(target, target_block_id):
			var produced := Inventory.make_stack_from_ref({
				"kind": "item",
				"stable_id": MINER_OUTPUTS.get(
					BlockRegistry.get_stable_id(target_block_id), ""),
				"count": 1,
			})
			if produced.is_empty() or not _merge_machine_output(state, produced):
				world.restore_automation_resource(target, target_block_id)
				_set_machine_status(state, "blocked", "output_blocked")
			else:
				state["deposit_target"] = []
				state["scan_cooldown"] = 0.0
				state["progress"] = maxf(
					0.0, float(state["progress"]) - MINER_CYCLE_SECONDS)
		else:
			state["deposit_target"] = []
			state["progress"] = 0.0
			_set_machine_status(state, "idle", "no_deposit")
	state["last_simulation_time"] = Time.get_unix_time_from_system()
	states[key] = state


func _miner_resource_ids(mining_mode: String) -> Array[int]:
	var resource_ids: Array[int] = []
	if mining_mode == "automatic":
		for stable_id in MINER_OUTPUTS:
			var block_id := BlockRegistry.get_id_by_stable_id(str(stable_id))
			if block_id > BlockRegistry.AIR:
				resource_ids.append(block_id)
		return resource_ids
	var selected_id := BlockRegistry.get_id_by_stable_id(mining_mode)
	if selected_id > BlockRegistry.AIR and MINER_OUTPUTS.has(mining_mode):
		resource_ids.append(selected_id)
	return resource_ids


func _miner_mode_accepts_block(mining_mode: String, block_id: int) -> bool:
	var stable_id := BlockRegistry.get_stable_id(block_id)
	return MINER_OUTPUTS.has(stable_id) \
		and (mining_mode == "automatic" or mining_mode == stable_id)


func _powered_crank_key(miner_position: Vector3i) -> String:
	for direction in DIRS6:
		var key := _key(miner_position + direction)
		if states.has(key) and str(states[key].get("kind", "")) == "crank" \
				and float(states[key].get("power", 0.0)) > 0.0:
			return key
	return ""


func _merge_machine_output(state: Dictionary, incoming: Dictionary) -> bool:
	var output: Dictionary = state.get("output", {})
	if output.is_empty():
		state["output"] = incoming.duplicate(true)
		return true
	if not Inventory._can_merge(output, incoming) \
			or int(output.get("count", 0)) + int(incoming.get("count", 0)) \
				> MINER_BUFFER_SIZE:
		return false
	output["count"] = int(output["count"]) + int(incoming["count"])
	state["output"] = output
	return true


func _dispatch_outputs() -> void:
	for key in states.keys():
		var state: Dictionary = states[key]
		if str(state.get("kind", "")) != "miner":
			continue
		var output: Dictionary = state.get("output", {})
		if output.is_empty() or _source_has_batch(Vector3i(state["position"])):
			continue
		var amount := mini(BATCH_SIZE, int(output.get("count", 0)))
		var route := _find_route(Vector3i(state["position"]), output, amount)
		if route.is_empty():
			if int(output.get("count", 0)) >= MINER_BUFFER_SIZE:
				_set_machine_status(state, "blocked", "output_blocked")
				states[key] = state
			continue
		var moved := output.duplicate(true)
		moved["count"] = amount
		output["count"] = int(output["count"]) - amount
		state["output"] = {} if int(output["count"]) <= 0 else output
		states[key] = state
		_create_batch(moved, route)

	for position in world.get_automation_endpoint_positions():
		if world.automation_endpoint_kind(position) != "furnace" \
				or _source_has_batch(position):
			continue
		var output: Dictionary = world.automation_peek_output(position)
		if output.is_empty():
			continue
		var amount := mini(BATCH_SIZE, int(output.get("count", 0)))
		var route := _find_route(position, output, amount)
		if route.is_empty():
			continue
		var moved: Dictionary = world.automation_take_output(position, amount)
		if moved.is_empty():
			continue
		_create_batch(moved, route)


func _source_has_batch(source: Vector3i) -> bool:
	for batch in batches:
		if Vector3i(batch.get("source", Vector3i.ZERO)) == source:
			return true
	return false


func _create_batch(stack: Dictionary, route: Dictionary) -> void:
	var batch_id := "automation.batch.%d" % _next_batch_serial
	_next_batch_serial += 1
	batches.append({
		"id": batch_id,
		"correlation_id": batch_id,
		"stack": stack.duplicate(true),
		"source": route["path"][0],
		"destination": route["path"][-1],
		"path": route["path"].duplicate(),
		"progress": 0.0,
		"blocked": false,
		"fault": "",
		"delivery_mode": str(route.get("delivery_mode", "donation")),
		"network_id": str(route.get("network_id", "")),
		"created_tick": _tick_serial,
	})
	changed.emit()


func _process_batches(delta: float) -> void:
	for index in range(batches.size() - 1, -1, -1):
		var batch: Dictionary = batches[index]
		var path: Array = batch.get("path", [])
		if path.size() < 2 or batch.get("stack", {}).is_empty():
			batches.remove_at(index)
			continue
		var final_progress := float(path.size() - 1)
		if not bool(batch.get("blocked", false)):
			batch["progress"] = minf(
				final_progress,
				float(batch.get("progress", 0.0)) + delta * BATCH_SPEED)
		if float(batch["progress"]) < final_progress:
			batches[index] = batch
			continue
		var destination := Vector3i(batch["destination"])
		var stack: Dictionary = batch["stack"]
		var mode := str(batch.get("delivery_mode", "donation"))
		if world.automation_receive(
				destination, stack, mode,
				str(batch.get("source", "")), str(batch["correlation_id"])):
			_free_visual(str(batch["id"]))
			batches.remove_at(index)
			changed.emit()
		else:
			batch["blocked"] = true
			batch["fault"] = world.automation_endpoint_fault(destination, stack, mode)
			batches[index] = batch
			_mark_endpoint_fault(destination, str(batch["fault"]))


func _mark_endpoint_fault(position: Vector3i, fault: String) -> void:
	var key := _key(position)
	if not states.has(key):
		return
	var state: Dictionary = states[key]
	_set_machine_status(state, "blocked", fault)
	states[key] = state


func retry_blocked_batches() -> void:
	for index in batches.size():
		var batch: Dictionary = batches[index]
		if bool(batch.get("blocked", false)):
			batch["blocked"] = false
			batch["fault"] = ""
			batches[index] = batch


func _find_route(source: Vector3i, stack: Dictionary, amount: int) -> Dictionary:
	if _topology_dirty:
		_rebuild_topology()
	var source_key := _key(source)
	if not _graph.has(source_key):
		return {}
	var previous := {source_key: ""}
	var distance := {source_key: 0}
	var queue: Array[String] = [source_key]
	var candidates: Array[Dictionary] = []
	var policy := _route_policy_for_source(source)
	while not queue.is_empty():
		var current: String = queue.pop_front()
		for neighbor_value in _graph.get(current, []):
			var neighbor := str(neighbor_value)
			if previous.has(neighbor):
				continue
			previous[neighbor] = current
			distance[neighbor] = int(distance[current]) + 1
			queue.append(neighbor)
			var position := _pos(neighbor)
			if position == source or not world.is_automation_endpoint(position):
				continue
			var mode := _delivery_mode_at(position)
			var pending := _pending_for_destination(position)
			if world.automation_endpoint_capacity_with_pending(
					position, stack, mode, pending) < amount:
				continue
			candidates.append({
				"key": neighbor,
				"priority": _endpoint_priority(
					world.automation_endpoint_kind(position), stack, policy,
					position),
				"distance": int(distance[neighbor]),
				"mode": mode,
			})
	if candidates.is_empty():
		return {}
	candidates.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var score_a := int(a["priority"]) * 10000 + int(a["distance"])
		var score_b := int(b["priority"]) * 10000 + int(b["distance"])
		return score_a < score_b
	)
	var selected: Dictionary = candidates[0]
	var cursor := str(selected["key"])
	var reverse_path: Array[Vector3i] = []
	while not cursor.is_empty():
		reverse_path.append(_pos(cursor))
		cursor = str(previous.get(cursor, ""))
	reverse_path.reverse()
	return {
		"path": reverse_path,
		"delivery_mode": str(selected["mode"]),
		"network_id": _network_id_for_source(source),
	}


func _endpoint_priority(
		kind: String, stack: Dictionary, policy: String,
		position: Vector3i = Vector3i.ZERO) -> int:
	if policy == "processing_first":
		return {"furnace": 0, "crate": 10, "warehouse_hatch": 20}.get(kind, 50)
	if policy == "storage_first":
		return {"crate": 0, "warehouse_hatch": 10, "furnace": 20}.get(kind, 50)
	if kind == "furnace" \
			and world.automation_endpoint_prefers_stack(position, stack):
		return {"furnace": 0, "warehouse_hatch": 10, "crate": 20}.get(kind, 50)
	return {"warehouse_hatch": 0, "crate": 10, "furnace": 20}.get(kind, 50)


func _route_policy_for_source(source: Vector3i) -> String:
	for neighbor_value in _graph.get(_key(source), []):
		var neighbor := str(neighbor_value)
		if states.has(neighbor) and str(states[neighbor].get("kind", "")) == "chute":
			return str(states[neighbor].get("route_policy", "automatic"))
	return "automatic"


func _delivery_mode_at(position: Vector3i) -> String:
	var state: Dictionary = states.get(_key(position), {})
	return str(state.get("delivery_mode", "donation"))


func _pending_for_destination(destination: Vector3i) -> Array:
	var pending: Array = []
	for batch in batches:
		if Vector3i(batch.get("destination", Vector3i.ZERO)) == destination:
			pending.append(batch.get("stack", {}).duplicate(true))
	return pending


func _rebuild_topology() -> void:
	_graph.clear()
	boundary_connectors.clear()
	var nodes: Dictionary = {}
	for key in states:
		var kind := str(states[key].get("kind", ""))
		if kind in ["miner", "chute", "warehouse_hatch"]:
			nodes[key] = Vector3i(states[key]["position"])
	for position in world.get_automation_endpoint_positions():
		nodes[_key(position)] = position
	for key in nodes:
		_graph[key] = []
	for key in nodes:
		var position: Vector3i = nodes[key]
		for direction in DIRS6:
			var other_key := _key(position + direction)
			if not nodes.has(other_key) or other_key <= str(key):
				continue
			if not _item_nodes_connect(str(key), other_key):
				continue
			_graph[key].append(other_key)
			_graph[other_key].append(key)
			if _chunk_of(position) != _chunk_of(position + direction):
				boundary_connectors.append({
					"a": position,
					"b": position + direction,
					"type": "item",
				})
	_assign_network_ids()
	_topology_dirty = false
	retry_blocked_batches()
	changed.emit()


func _item_nodes_connect(a_key: String, b_key: String) -> bool:
	var a_kind := _node_kind(a_key)
	var b_kind := _node_kind(b_key)
	# Chutes are the required physical transport edge. Machines and endpoints do
	# not teleport directly into one another.
	return a_kind == "chute" or b_kind == "chute"


func _node_kind(key: String) -> String:
	if states.has(key):
		return str(states[key].get("kind", ""))
	return world.automation_endpoint_kind(_pos(key))


func _assign_network_ids() -> void:
	var visited := {}
	for key in _graph:
		if visited.has(key):
			continue
		var component: Array[String] = []
		var queue: Array[String] = [str(key)]
		visited[key] = true
		while not queue.is_empty():
			var current: String = queue.pop_front()
			component.append(current)
			for neighbor_value in _graph.get(current, []):
				var neighbor := str(neighbor_value)
				if not visited.has(neighbor):
					visited[neighbor] = true
					queue.append(neighbor)
		component.sort()
		var network_id := "network.item.%s" % component[0].replace(",", ".")
		for member in component:
			if states.has(member):
				var state: Dictionary = states[member]
				state["network_id"] = network_id
				states[member] = state


func _network_id_for_source(source: Vector3i) -> String:
	var source_key := _key(source)
	var direct := str(states.get(source_key, {}).get("network_id", ""))
	if not direct.is_empty():
		return direct
	for neighbor_value in _graph.get(source_key, []):
		var neighbor := str(neighbor_value)
		var network_id := str(states.get(neighbor, {}).get("network_id", ""))
		if not network_id.is_empty():
			return network_id
	return ""


func get_inspection(gp: Vector3i) -> Dictionary:
	var state: Dictionary = states.get(_key(gp), {})
	if state.is_empty():
		return {}
	var kind := str(state.get("kind", ""))
	var lines: Array[String] = []
	var status := str(state.get("status", "idle")).capitalize()
	var fault := str(state.get("fault", ""))
	if not fault.is_empty():
		status += " - " + _fault_text(fault)
	var action := ""
	var requires_wrench := false
	match kind:
		"miner":
			var output: Dictionary = state.get("output", {})
			var mining_mode := str(state.get("mining_mode", "automatic"))
			lines.append("Mining target: %s" % _miner_mode_label(mining_mode))
			var target_value: Variant = state.get("deposit_target", [])
			if target_value is Array and target_value.size() == 3:
				var target := _array_to_pos(target_value)
				lines.append("Located deposit: %s at (%d, %d, %d)" % [
					BlockRegistry.get_block_name(world.get_persisted_block_id(target)),
					target.x, target.y, target.z,
				])
			lines.append("Output buffer: %s" % (
				"empty" if output.is_empty() else "%d x %s" % [
					int(output["count"]), Inventory.stack_name(output)]))
			lines.append("Cycle: %d%% (6s per ore)" % clampi(
				roundi(float(state.get("progress", 0.0)) / MINER_CYCLE_SECONDS * 100.0),
				0, 100))
			lines.append("Power: adjacent manual crank")
			action = "Cycle mining target"
			requires_wrench = true
		"crank":
			lines.append("Mechanical charge: %.1f / %.0f seconds" % [
				float(state.get("power", 0.0)), CRANK_CAPACITY])
			lines.append("Port: adjacent Basic Mechanical Miner")
			action = "Turn crank (+%d power seconds)" % int(CRANK_ACTION_POWER)
		"chute":
			lines.append("Routing: %s" % str(
				state.get("route_policy", "automatic")).replace("_", " ").capitalize())
			lines.append("Queued batches: %d" % _batch_count_for_position(gp))
			lines.append("Ports: auto-connect on all six faces")
			action = "Cycle route priority"
			requires_wrench = true
		"warehouse_hatch":
			lines.append("Delivery mode: %s" % str(
				state.get("delivery_mode", "donation")).capitalize())
			lines.append("Permission: %s" % (
				"Trusted Supplier import enabled"
				if HamletState.permission_enabled("automation_import")
				else "Blocked until Trusted Supplier"))
			lines.append("Queued batches: %d" % _batch_count_for_position(gp))
			action = "Cycle donation / project mode"
			requires_wrench = true
	lines.append("Network: %s" % str(
		state.get("network_id", "unconnected")).replace("network.item.", ""))
	return {
		"title": _title_for_kind(kind),
		"kind": kind,
		"status": status,
		"lines": lines,
		"action": action,
		"requires_wrench": requires_wrench,
	}


func perform_action(gp: Vector3i, selected_stable_id: String) -> Dictionary:
	var key := _key(gp)
	if not states.has(key):
		return {"ok": false, "message": "That automation block is no longer present."}
	var state: Dictionary = states[key]
	var kind := str(state.get("kind", ""))
	if kind == "crank":
		state["power"] = minf(
			CRANK_CAPACITY, float(state.get("power", 0.0)) + CRANK_ACTION_POWER)
		state["status"] = "charged"
		state["fault"] = ""
		states[key] = state
		changed.emit()
		return {"ok": true, "message": "Crank charged to %.0f power seconds." % state["power"]}
	if kind in ["chute", "warehouse_hatch"] \
			and selected_stable_id != "item.tool.wrench_basic":
		return {"ok": false, "message": "Select a Basic Wrench to configure this block."}
	if kind == "miner":
		if selected_stable_id != "item.tool.wrench_basic":
			return {
				"ok": false,
				"message": "Select a Basic Wrench to configure the mining target.",
			}
		var current := MINER_MODES.find(str(state.get("mining_mode", "automatic")))
		state["mining_mode"] = MINER_MODES[
			(maxi(0, current) + 1) % MINER_MODES.size()]
		state["deposit_target"] = []
		state["scan_cooldown"] = 0.0
		state["progress"] = 0.0
		state["status"] = "idle"
		state["fault"] = ""
		states[key] = state
		changed.emit()
		return {
			"ok": true,
			"message": "Miner target set to %s." % _miner_mode_label(
				str(state["mining_mode"])),
		}
	if kind == "chute":
		var policies := ["automatic", "processing_first", "storage_first"]
		var current := policies.find(str(state.get("route_policy", "automatic")))
		state["route_policy"] = policies[(maxi(0, current) + 1) % policies.size()]
		states[key] = state
		changed.emit()
		return {
			"ok": true,
			"message": "Chute routing set to %s." % str(
				state["route_policy"]).replace("_", " "),
		}
	if kind == "warehouse_hatch":
		state["delivery_mode"] = "project" \
			if str(state.get("delivery_mode", "donation")) == "donation" \
			else "donation"
		state["fault"] = ""
		states[key] = state
		retry_blocked_batches()
		changed.emit()
		return {
			"ok": true,
			"message": "Warehouse hatch set to %s deliveries." % state["delivery_mode"],
		}
	return {"ok": false, "message": "This block has no manual action."}


func serialize_state() -> Dictionary:
	var saved_states: Array = []
	for key in states:
		var state: Dictionary = states[key].duplicate(true)
		state["position"] = _pos_to_array(Vector3i(state["position"]))
		if state.has("output"):
			state["output"] = Inventory.serialize_stack(state["output"])
		saved_states.append(state)
	var saved_batches: Array = []
	for batch in batches:
		var saved: Dictionary = batch.duplicate(true)
		saved["stack"] = Inventory.serialize_stack(batch["stack"])
		saved["source"] = _pos_to_array(Vector3i(batch["source"]))
		saved["destination"] = _pos_to_array(Vector3i(batch["destination"]))
		var saved_path: Array = []
		for point in batch["path"]:
			saved_path.append(_pos_to_array(Vector3i(point)))
		saved["path"] = saved_path
		saved_batches.append(saved)
	var saved_connectors: Array = []
	for connector in boundary_connectors:
		saved_connectors.append({
			"a": _pos_to_array(Vector3i(connector["a"])),
			"b": _pos_to_array(Vector3i(connector["b"])),
			"type": str(connector.get("type", "item")),
		})
	return {
		"version": VERSION,
		"saved_at_unix": Time.get_unix_time_from_system(),
		"next_batch_serial": _next_batch_serial,
		"tick_serial": _tick_serial,
		"states": saved_states,
		"batches": saved_batches,
		"boundary_connectors": saved_connectors,
	}


func restore_state(value: Variant) -> void:
	_clear_visuals()
	states.clear()
	batches.clear()
	boundary_connectors.clear()
	_next_batch_serial = 1
	_tick_serial = 0
	if not (value is Dictionary):
		_topology_dirty = true
		return
	var data: Dictionary = value
	var saved_states: Variant = data.get("states", [])
	if saved_states is Array:
		for raw_value in saved_states:
			if not (raw_value is Dictionary):
				continue
			var state: Dictionary = raw_value.duplicate(true)
			var position_value: Variant = state.get("position", [])
			if not (position_value is Array) or position_value.size() != 3:
				continue
			var position := _array_to_pos(position_value)
			state["position"] = position
			if state.has("output"):
				state["output"] = Inventory.deserialize_stack(state["output"])
			states[_key(position)] = state
	var saved_batches: Variant = data.get("batches", [])
	if saved_batches is Array:
		for raw_value in saved_batches:
			if not (raw_value is Dictionary):
				continue
			var batch: Dictionary = raw_value.duplicate(true)
			batch["stack"] = Inventory.deserialize_stack(batch.get("stack", {}))
			batch["source"] = _array_to_pos(batch.get("source", []))
			batch["destination"] = _array_to_pos(batch.get("destination", []))
			var path: Array[Vector3i] = []
			for point in batch.get("path", []):
				path.append(_array_to_pos(point))
			batch["path"] = path
			if not batch["stack"].is_empty() and path.size() >= 2:
				batches.append(batch)
	_next_batch_serial = maxi(1, int(data.get("next_batch_serial", 1)))
	_tick_serial = maxi(0, int(data.get("tick_serial", 0)))
	var saved_at := float(data.get("saved_at_unix", Time.get_unix_time_from_system()))
	_pending_catchup = clampf(
		Time.get_unix_time_from_system() - saved_at, 0.0, MAX_OFFLINE_CATCHUP)
	_topology_dirty = true
	_reconcile_edited_blocks()
	changed.emit()


func _reconcile_edited_blocks() -> void:
	if world == null:
		return
	for entry in world.get_edited_automation_blocks():
		var position: Vector3i = entry["position"]
		var block_id := int(entry["id"])
		if not states.has(_key(position)):
			register_block(position, block_id)
	for key in states.keys():
		var position := Vector3i(states[key]["position"])
		var block_id: int = int(world.get_persisted_block_id(position))
		if not is_automation_block(block_id):
			states.erase(key)
			_topology_dirty = true


func _has_nearby_node(player_position: Vector3) -> bool:
	for key in states:
		var position := Vector3(Vector3i(states[key]["position"])) + Vector3.ONE * 0.5
		if position.distance_to(player_position) <= NEAR_DISTANCE:
			return true
	return false


func _sync_visuals(player_position: Vector3) -> void:
	var active := {}
	for batch in batches:
		var id := str(batch["id"])
		var position := _batch_visual_position(batch)
		if position.distance_to(player_position) > visual_distance:
			_free_visual(id)
			continue
		active[id] = true
		var visual: MeshInstance3D = _visuals.get(id)
		if visual == null or not is_instance_valid(visual):
			visual = _create_visual(batch["stack"])
			_visuals[id] = visual
		visual.position = position
	for id in _visuals.keys():
		if not active.has(id):
			_free_visual(str(id))


func _batch_visual_position(batch: Dictionary) -> Vector3:
	var path: Array = batch.get("path", [])
	if path.is_empty():
		return Vector3.ZERO
	var progress := clampf(float(batch.get("progress", 0.0)), 0.0, path.size() - 1)
	var from_index := mini(floori(progress), path.size() - 1)
	var to_index := mini(from_index + 1, path.size() - 1)
	var weight := progress - float(from_index)
	var from := Vector3(Vector3i(path[from_index])) + Vector3(0.5, 0.72, 0.5)
	var to := Vector3(Vector3i(path[to_index])) + Vector3(0.5, 0.72, 0.5)
	return from.lerp(to, weight)


func _create_visual(stack: Dictionary) -> MeshInstance3D:
	var visual := MeshInstance3D.new()
	visual.name = "AutomationBatch"
	var mesh := BoxMesh.new()
	mesh.size = Vector3(0.26, 0.26, 0.26)
	visual.mesh = mesh
	var material := StandardMaterial3D.new()
	var color := Inventory.stack_color(stack)
	material.albedo_color = color.lightened(0.18)
	material.emission_enabled = true
	material.emission = color * 0.22
	visual.material_override = material
	world.add_child(visual)
	return visual


func _free_visual(id: String) -> void:
	if not _visuals.has(id):
		return
	var visual: Node = _visuals[id]
	if is_instance_valid(visual):
		visual.queue_free()
	_visuals.erase(id)


func _clear_visuals() -> void:
	for id in _visuals.keys():
		_free_visual(str(id))


func _batch_count_for_position(gp: Vector3i) -> int:
	var count := 0
	for batch in batches:
		if _batch_uses_position(batch, gp):
			count += 1
	return count


func _batch_uses_position(batch: Dictionary, gp: Vector3i) -> bool:
	for point in batch.get("path", []):
		if Vector3i(point) == gp:
			return true
	return false


func _set_machine_status(state: Dictionary, status: String, fault: String) -> void:
	state["status"] = status
	state["fault"] = fault


func _title_for_kind(kind: String) -> String:
	return {
		"miner": "Basic Mechanical Miner",
		"crank": "Manual Crank",
		"chute": "Basic Item Chute",
		"warehouse_hatch": "Village Warehouse Input Hatch",
	}.get(kind, "Automation")


func _fault_text(fault: String) -> String:
	return {
		"no_power": "No power",
		"no_deposit": "No matching valuable ore in range",
		"missing_input": "Missing input",
		"output_blocked": "Output blocked",
		"full_storage": "Storage full",
		"permission_blocked": "Warehouse permission blocked",
		"invalid_input": "Destination rejects item",
	}.get(fault, fault.replace("_", " ").capitalize())


func _miner_mode_label(mining_mode: String) -> String:
	if mining_mode == "automatic":
		return "Automatic - nearest valuable ore"
	var block_id := BlockRegistry.get_id_by_stable_id(mining_mode)
	return BlockRegistry.get_block_name(block_id) \
		if block_id > BlockRegistry.AIR else "Automatic - nearest valuable ore"


func _chunk_of(gp: Vector3i) -> Vector3i:
	return Vector3i(
		world.chunk_coord(gp.x), world.chunk_coord(gp.y), world.chunk_coord(gp.z))


func _key(gp: Vector3i) -> String:
	return "%d,%d,%d" % [gp.x, gp.y, gp.z]


func _pos(key: String) -> Vector3i:
	var parts := key.split(",")
	if parts.size() != 3:
		return Vector3i.ZERO
	return Vector3i(int(parts[0]), int(parts[1]), int(parts[2]))


func _pos_to_array(gp: Vector3i) -> Array:
	return [gp.x, gp.y, gp.z]


func _array_to_pos(value: Variant) -> Vector3i:
	if value is Vector3i:
		return value
	if value is Array and value.size() == 3:
		return Vector3i(int(value[0]), int(value[1]), int(value[2]))
	return Vector3i.ZERO
