class_name MagicSystem
extends RefCounted
## Stage 6 mana-network, ward, and ruin-teaser runtime.
##
## Batteries own external mana. Conduits form typed, deterministic components;
## consumers request exact amounts from their connected component. Ward and
## spell visuals are views only, so near/far simulation and save/load share the
## same authoritative quantities.

signal changed

const VERSION := 1
const NEAR_DISTANCE := 48.0
const VISUAL_DISTANCE := 56.0
const NEAR_STEP := 0.25
const FAR_STEP := 2.0
const MAX_STEPS_PER_FRAME := 8
const MAX_OFFLINE_CATCHUP := 600.0
const BATTERY_CAPACITY := 256.0
const WARD_RADIUS := 12.0
const WARD_MANA_PER_SECOND := 0.25
const WARD_DEFENCE_BONUS := 20
const NETWORK_KINDS: Array[String] = [
	"battery", "conduit", "ward", "mana_furnace",
]
const BLOCK_KINDS := {
	"magic.battery.mana": "battery",
	"magic.conduit.mana_basic": "conduit",
	"magic.ward_lantern.basic": "ward",
	"magic.furnace.mana": "mana_furnace",
	"magic.portal_frame.ancient": "portal_teaser",
	"magic.portal.broken": "portal_teaser",
	"magic.corruption.ground": "corruption_teaser",
}
const MANA_FUEL_YIELDS := {
	"item.resource.raw_mana_crystal": 64.0,
	"item.resource.mana_shard": 16.0,
	"item.resource.mana_dust": 4.0,
}
const DIRS6: Array[Vector3i] = [
	Vector3i(1, 0, 0), Vector3i(-1, 0, 0),
	Vector3i(0, 1, 0), Vector3i(0, -1, 0),
	Vector3i(0, 0, 1), Vector3i(0, 0, -1),
]

var world: Node
var states: Dictionary = {}
var boundary_connectors: Array[Dictionary] = []

var _graph: Dictionary = {}
var _topology_dirty := true
var _accumulator := 0.0
var _pending_catchup := 0.0
var _ward_visuals: Dictionary = {}
var _sense_targets: Dictionary = {}
var _sense_visuals: Dictionary = {}


func setup(world_ref: Node) -> void:
	world = world_ref


func is_magic_block(block_id: int) -> bool:
	return BLOCK_KINDS.has(BlockRegistry.get_stable_id(block_id))


func is_magic_inspection_block(block_id: int) -> bool:
	var kind := str(BLOCK_KINDS.get(BlockRegistry.get_stable_id(block_id), ""))
	return kind in [
		"battery", "conduit", "ward", "portal_teaser", "corruption_teaser",
	]


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
	if kind == "battery":
		state["mana"] = 0.0
		state["capacity"] = BATTERY_CAPACITY
	elif kind == "ward":
		state["radius"] = WARD_RADIUS
		state["defence_bonus"] = WARD_DEFENCE_BONUS
	elif kind == "portal_teaser":
		state["note_claimed"] = false
		state["status"] = "dormant"
		state["fault"] = "future_ritual_required"
	elif kind == "corruption_teaser":
		state["status"] = "warning"
		state["fault"] = "cleansing_deferred"
	states[key] = state
	_topology_dirty = true
	changed.emit()


func ensure_block(gp: Vector3i, block_id: int) -> Dictionary:
	if not states.has(_key(gp)):
		register_block(gp, block_id)
	return states.get(_key(gp), {})


func unregister_block(gp: Vector3i) -> void:
	var key := _key(gp)
	if not states.has(key):
		return
	states.erase(key)
	_remove_visual(_ward_visuals, key)
	_topology_dirty = true
	changed.emit()


func can_remove(gp: Vector3i) -> bool:
	var state: Dictionary = states.get(_key(gp), {})
	return state.is_empty() \
		or str(state.get("kind", "")) != "battery" \
		or float(state.get("mana", 0.0)) <= 0.0001


func notify_topology_changed() -> void:
	_topology_dirty = true


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
	_tick_sense(delta)
	_sync_visuals(player_position)


func _simulate_step(delta: float) -> void:
	for key in states.keys():
		var state: Dictionary = states[key]
		var kind := str(state.get("kind", ""))
		match kind:
			"ward":
				var network_id := str(state.get("network_id", ""))
				if network_id.is_empty():
					_set_status(state, "offline", "unlinked")
				elif consume_mana(Vector3i(state["position"]),
						WARD_MANA_PER_SECOND * delta):
					_set_status(state, "active", "")
				else:
					_set_status(state, "offline", "no_mana")
			"battery":
				if str(state.get("network_id", "")).is_empty():
					_set_status(state, "idle", "unlinked")
				elif float(state.get("mana", 0.0)) <= 0.0001:
					_set_status(state, "empty", "no_mana")
				else:
					_set_status(state, "charged", "")
			"conduit":
				if str(state.get("network_id", "")).is_empty():
					_set_status(state, "offline", "unlinked")
				else:
					_set_status(state, "linked", "")
			"mana_furnace":
				if str(state.get("network_id", "")).is_empty():
					_set_status(state, "offline", "unlinked")
				elif available_mana_at(Vector3i(state["position"])) <= 0.0001:
					_set_status(state, "offline", "no_mana")
				else:
					_set_status(state, "ready", "")
		state["last_simulation_time"] = Time.get_unix_time_from_system()
		states[key] = state


func available_mana_at(gp: Vector3i) -> float:
	if _topology_dirty:
		_rebuild_topology()
	var network_id := str(states.get(_key(gp), {}).get("network_id", ""))
	if network_id.is_empty():
		return 0.0
	var total := 0.0
	for state in states.values():
		if str(state.get("kind", "")) == "battery" \
				and str(state.get("network_id", "")) == network_id:
			total += float(state.get("mana", 0.0))
	return total


func consume_mana(gp: Vector3i, amount: float) -> bool:
	if amount <= 0.0:
		return true
	if available_mana_at(gp) + 0.0001 < amount:
		return false
	var network_id := str(states.get(_key(gp), {}).get("network_id", ""))
	var battery_keys: Array[String] = []
	for key in states:
		var state: Dictionary = states[key]
		if str(state.get("kind", "")) == "battery" \
				and str(state.get("network_id", "")) == network_id:
			battery_keys.append(str(key))
	battery_keys.sort()
	var remaining := amount
	for key in battery_keys:
		if remaining <= 0.0001:
			break
		var state: Dictionary = states[key]
		var stored := float(state.get("mana", 0.0))
		var moved := minf(stored, remaining)
		state["mana"] = stored - moved
		remaining -= moved
		states[key] = state
	changed.emit()
	return remaining <= 0.0001


func report_consumer_fault(gp: Vector3i, fault: String) -> void:
	var key := _key(gp)
	if not states.has(key):
		return
	var state: Dictionary = states[key]
	_set_status(state, "offline" if not fault.is_empty() else "active", fault)
	states[key] = state


func ward_coverage_at(position: Vector3) -> Dictionary:
	var active_count := 0
	var best_distance := INF
	for state in states.values():
		if str(state.get("kind", "")) != "ward" \
				or str(state.get("status", "")) != "active":
			continue
		var centre := Vector3(Vector3i(state["position"])) + Vector3.ONE * 0.5
		var distance := Vector2(
			position.x - centre.x, position.z - centre.z).length()
		if distance <= float(state.get("radius", WARD_RADIUS)):
			active_count += 1
			best_distance = minf(best_distance, distance)
	return {
		"warded": active_count > 0,
		"active_wards": active_count,
		"defence_bonus": WARD_DEFENCE_BONUS if active_count > 0 else 0,
		"nearest_distance": best_distance if active_count > 0 else -1.0,
	}


func get_state(gp: Vector3i) -> Dictionary:
	var block_id: int = int(
		world.get_persisted_block_id(gp)) if world != null else -1
	var state := ensure_block(gp, block_id)
	return state.duplicate(true)


func get_inspection(gp: Vector3i) -> Dictionary:
	var block_id: int = int(world.get_persisted_block_id(gp))
	var state := ensure_block(gp, block_id)
	if state.is_empty():
		return {}
	var kind := str(state.get("kind", ""))
	var fault := str(state.get("fault", ""))
	var status := str(state.get("status", "idle")).capitalize()
	if not fault.is_empty():
		status += " - " + _fault_text(fault)
	var lines: Array[String] = []
	var action := ""
	match kind:
		"battery":
			lines.append("External mana: %.1f / %.0f" % [
				float(state.get("mana", 0.0)),
				float(state.get("capacity", BATTERY_CAPACITY))])
			lines.append("Accepts Raw Mana Crystal, Mana Shards, or Mana Dust")
			action = "Charge from selected mana resource"
		"conduit":
			lines.append("Ports: auto-connect on all six faces")
			lines.append("Available network mana: %.1f" % available_mana_at(gp))
		"ward":
			lines.append("Coverage radius: %.0f blocks" % float(
				state.get("radius", WARD_RADIUS)))
			lines.append("Village defence contribution: +%d when powered" % int(
				state.get("defence_bonus", WARD_DEFENCE_BONUS)))
			lines.append("Draw: %.2f mana/second · available %.1f" % [
				WARD_MANA_PER_SECOND, available_mana_at(gp)])
		"portal_teaser":
			lines.append("The frame is deliberately dormant in the POC.")
			lines.append("A cracked seal warns that full portal rituals are deferred.")
			if not bool(state.get("note_claimed", false)):
				action = "Recover the Old Rune Note"
		"corruption_teaser":
			lines.append("Forbidden-magic residue: do not disturb.")
			lines.append("Cleansing rituals are beyond the current POC.")
	if NETWORK_KINDS.has(kind):
		var network_id := str(state.get("network_id", ""))
		lines.append("Network: %s" % (
			"unlinked" if network_id.is_empty()
			else network_id.replace("magic.network.", "")))
	return {
		"title": BlockRegistry.get_block_name(block_id),
		"kind": kind,
		"status": status,
		"lines": lines,
		"action": action,
	}


func perform_action(gp: Vector3i) -> Dictionary:
	var block_id: int = int(world.get_persisted_block_id(gp))
	var key := _key(gp)
	var state := ensure_block(gp, block_id)
	if state.is_empty():
		return {"ok": false, "message": "That magic block is no longer present."}
	var kind := str(state.get("kind", ""))
	if kind == "battery":
		var selected := Inventory.get_selected_stack()
		var stable_id := Inventory.stack_stable_id(selected)
		var mana_yield := float(MANA_FUEL_YIELDS.get(stable_id, 0.0))
		if mana_yield <= 0.0:
			return {
				"ok": false,
				"message": "Select Raw Mana Crystal, a Mana Shard, or Mana Dust.",
			}
		var capacity := float(state.get("capacity", BATTERY_CAPACITY))
		if float(state.get("mana", 0.0)) + mana_yield > capacity + 0.0001:
			return {"ok": false, "message": "The battery cannot hold that whole resource."}
		var taken := Inventory.take_selected_stack(1)
		if taken.is_empty():
			return {"ok": false, "message": "The selected mana resource could not be moved."}
		state["mana"] = float(state.get("mana", 0.0)) + mana_yield
		state["fault"] = ""
		state["status"] = "charged"
		states[key] = state
		changed.emit()
		return {
			"ok": true,
			"message": "Battery charged by %.0f mana (%.0f/%.0f)." % [
				mana_yield, state["mana"], capacity],
		}
	if kind == "portal_teaser":
		if bool(state.get("note_claimed", false)):
			return {
				"ok": false,
				"message": "The dormant frame hums, but full portal activation is deferred.",
			}
		var note := Inventory.make_stack_from_ref({
			"kind": "item",
			"stable_id": "item.knowledge.basic_rune_note",
			"count": 1,
		})
		if note.is_empty() or not Inventory.can_add_stack(note):
			return {"ok": false, "message": "Make room for the Old Rune Note first."}
		if not Inventory.add_stack(note).is_empty():
			return {"ok": false, "message": "The Old Rune Note could not be recovered."}
		state["note_claimed"] = true
		states[key] = state
		MagicState.unlock_poc_magic("item.knowledge.basic_rune_note")
		changed.emit()
		return {
			"ok": true,
			"message": "Old Rune Note recovered: Rune Table, Stone Sense, and Spark Bolt learned.",
		}
	return {"ok": false, "message": "This magic block has no manual action."}


func show_stone_sense(targets: Array[Vector3i], duration: float = 4.0) -> void:
	for target in targets:
		_sense_targets[_key(target)] = {
			"position": target,
			"remaining": maxf(0.1, duration),
		}


func show_spell_impact(position: Vector3, hit: bool) -> void:
	if world == null or not world.is_inside_tree():
		return
	var visual := MeshInstance3D.new()
	var mesh := SphereMesh.new()
	mesh.radius = 0.24
	mesh.height = 0.48
	visual.mesh = mesh
	visual.material_override = _overlay_material(
		Color(0.35, 0.9, 1.0, 0.9) if hit else Color(0.7, 0.45, 1.0, 0.75),
		true)
	world.add_child(visual)
	visual.global_position = position
	var timer := world.get_tree().create_timer(0.35)
	timer.timeout.connect(func() -> void:
		if is_instance_valid(visual):
			visual.queue_free())


func serialize_state() -> Dictionary:
	var saved_states: Array = []
	for state_value in states.values():
		var state: Dictionary = state_value.duplicate(true)
		state["position"] = _pos_to_array(Vector3i(state["position"]))
		saved_states.append(state)
	var saved_connectors: Array = []
	for connector in boundary_connectors:
		saved_connectors.append({
			"a": _pos_to_array(Vector3i(connector["a"])),
			"b": _pos_to_array(Vector3i(connector["b"])),
			"type": str(connector.get("type", "mana")),
		})
	return {
		"version": VERSION,
		"saved_at_unix": Time.get_unix_time_from_system(),
		"states": saved_states,
		"boundary_connectors": saved_connectors,
	}


func restore_state(value: Variant) -> void:
	_clear_visuals()
	states.clear()
	boundary_connectors.clear()
	if value is Dictionary:
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
				states[_key(position)] = state
		var saved_at := float(data.get(
			"saved_at_unix", Time.get_unix_time_from_system()))
		_pending_catchup = clampf(
			Time.get_unix_time_from_system() - saved_at,
			0.0, MAX_OFFLINE_CATCHUP)
	_topology_dirty = true
	_reconcile_edited_blocks()
	changed.emit()


func _reconcile_edited_blocks() -> void:
	if world == null:
		return
	for entry in world.get_edited_magic_blocks():
		var position: Vector3i = entry["position"]
		var block_id := int(entry["id"])
		if not states.has(_key(position)):
			register_block(position, block_id)
	for key in states.keys():
		var position := Vector3i(states[key]["position"])
		var block_id := int(world.get_persisted_block_id(position))
		if not is_magic_block(block_id):
			states.erase(key)
			_remove_visual(_ward_visuals, str(key))
			_topology_dirty = true


func _rebuild_topology() -> void:
	_graph.clear()
	boundary_connectors.clear()
	var node_keys: Array[String] = []
	for key in states:
		if NETWORK_KINDS.has(str(states[key].get("kind", ""))):
			node_keys.append(str(key))
			_graph[str(key)] = []
	node_keys.sort()
	for key in node_keys:
		var position := Vector3i(states[key]["position"])
		for direction in DIRS6:
			var other_key := _key(position + direction)
			if not _graph.has(other_key) or other_key <= key:
				continue
			if not _nodes_connect(key, other_key):
				continue
			_graph[key].append(other_key)
			_graph[other_key].append(key)
			if _chunk_of(position) != _chunk_of(position + direction):
				boundary_connectors.append({
					"a": position,
					"b": position + direction,
					"type": "mana",
				})
	var visited := {}
	var network_serial := 1
	for root in node_keys:
		if visited.has(root):
			continue
		var component: Array[String] = []
		var queue: Array[String] = [root]
		visited[root] = true
		while not queue.is_empty():
			var current: String = queue.pop_front()
			component.append(current)
			for neighbor_value in _graph.get(current, []):
				var neighbor := str(neighbor_value)
				if visited.has(neighbor):
					continue
				visited[neighbor] = true
				queue.append(neighbor)
		var has_conduit := false
		for key in component:
			if str(states[key].get("kind", "")) == "conduit":
				has_conduit = true
				break
		var network_id := "magic.network.%d" % network_serial \
			if has_conduit and component.size() >= 2 else ""
		network_serial += 1
		for key in component:
			var state: Dictionary = states[key]
			state["network_id"] = network_id
			states[key] = state
	_topology_dirty = false
	changed.emit()


func _nodes_connect(a_key: String, b_key: String) -> bool:
	return str(states[a_key].get("kind", "")) == "conduit" \
		or str(states[b_key].get("kind", "")) == "conduit"


func _tick_sense(delta: float) -> void:
	for key in _sense_targets.keys():
		var record: Dictionary = _sense_targets[key]
		record["remaining"] = float(record.get("remaining", 0.0)) - delta
		if float(record["remaining"]) <= 0.0:
			_sense_targets.erase(key)
			_remove_visual(_sense_visuals, str(key))
		else:
			_sense_targets[key] = record


func _sync_visuals(player_position: Vector3) -> void:
	if world == null or not world.is_inside_tree():
		return
	var active_wards := {}
	for key in states:
		var state: Dictionary = states[key]
		if str(state.get("kind", "")) != "ward" \
				or str(state.get("status", "")) != "active":
			continue
		var centre := Vector3(Vector3i(state["position"])) + Vector3.ONE * 0.5
		if centre.distance_to(player_position) > VISUAL_DISTANCE:
			continue
		active_wards[key] = true
		if not _ward_visuals.has(key):
			_ward_visuals[key] = _create_ward_visual(
				centre, float(state.get("radius", WARD_RADIUS)))
	for key in _ward_visuals.keys():
		if not active_wards.has(key):
			_remove_visual(_ward_visuals, str(key))
	for key in _sense_targets:
		var target := Vector3i(_sense_targets[key]["position"])
		var centre := Vector3(target) + Vector3.ONE * 0.5
		if centre.distance_to(player_position) > VISUAL_DISTANCE:
			_remove_visual(_sense_visuals, str(key))
		elif not _sense_visuals.has(key):
			_sense_visuals[key] = _create_sense_visual(centre)


func _create_ward_visual(centre: Vector3, radius: float) -> MeshInstance3D:
	var visual := MeshInstance3D.new()
	var mesh := SphereMesh.new()
	mesh.radius = radius
	mesh.height = radius * 2.0
	mesh.radial_segments = 24
	mesh.rings = 12
	visual.mesh = mesh
	visual.material_override = _overlay_material(Color(0.38, 0.2, 0.85, 0.07), true)
	world.add_child(visual)
	visual.global_position = centre
	return visual


func _create_sense_visual(centre: Vector3) -> MeshInstance3D:
	var visual := MeshInstance3D.new()
	var mesh := BoxMesh.new()
	mesh.size = Vector3.ONE * 1.06
	visual.mesh = mesh
	visual.material_override = _overlay_material(Color(0.2, 0.9, 1.0, 0.34), true)
	world.add_child(visual)
	visual.global_position = centre
	return visual


func _overlay_material(color: Color, emissive: bool) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.cull_mode = BaseMaterial3D.CULL_DISABLED
	material.albedo_color = color
	if emissive:
		material.emission_enabled = true
		material.emission = Color(color.r, color.g, color.b)
		material.emission_energy_multiplier = 1.5
	return material


func _clear_visuals() -> void:
	for collection in [_ward_visuals, _sense_visuals]:
		for visual in collection.values():
			if is_instance_valid(visual):
				visual.queue_free()
		collection.clear()
	_sense_targets.clear()


func _remove_visual(collection: Dictionary, key: String) -> void:
	if not collection.has(key):
		return
	var visual: Variant = collection[key]
	if is_instance_valid(visual):
		visual.queue_free()
	collection.erase(key)


func _set_status(state: Dictionary, status: String, fault: String) -> void:
	state["status"] = status
	state["fault"] = fault


func _fault_text(fault: String) -> String:
	return {
		"unlinked": "no mana conduit link",
		"no_mana": "connected battery is empty",
		"invalid_input": "no valid mana-furnace recipe",
		"output_blocked": "finished output has no room",
		"future_ritual_required": "portal activation is future teaser scope",
		"cleansing_deferred": "cleansing ritual is not yet available",
	}.get(fault, fault.replace("_", " "))


func _has_nearby_node(player_position: Vector3) -> bool:
	for state in states.values():
		var position := Vector3(Vector3i(state["position"])) + Vector3.ONE * 0.5
		if position.distance_to(player_position) <= NEAR_DISTANCE:
			return true
	return false


func _key(gp: Vector3i) -> String:
	return "%d,%d,%d" % [gp.x, gp.y, gp.z]


func _pos_to_array(gp: Vector3i) -> Array[int]:
	return [gp.x, gp.y, gp.z]


func _array_to_pos(value: Array) -> Vector3i:
	return Vector3i(int(value[0]), int(value[1]), int(value[2])) \
		if value.size() == 3 else Vector3i.ZERO


func _chunk_of(gp: Vector3i) -> Vector3i:
	return Vector3i(
		floori(float(gp.x) / 16.0),
		floori(float(gp.y) / 16.0),
		floori(float(gp.z) / 16.0))
