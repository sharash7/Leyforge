extends Node
## Authoritative Stage 7 player-combat and Forest Hamlet raid state.
## Local goblin actors are presentation; enemy health, preparation, aftermath,
## structure damage, and settings survive actor streaming and save/load.

signal state_changed
signal raid_phase_changed(phase: String)
signal enemy_changed(enemy_id: String)
signal player_health_changed

const RAID_WARNING_SECONDS := 8.0
const RAID_ASSAULT_SECONDS := 45.0
const DEFAULT_CAMP_PRESSURE := 55

var initialized := false
var world_seed := 0
var anchors: Dictionary = {}
var phase := "dormant"
var phase_seconds := 0.0
var assault_seconds := 0.0
var camp_pressure := DEFAULT_CAMP_PRESSURE
var camp_state: Dictionary = {}
var preparation: Dictionary = {}
var enemy_records: Dictionary = {}
var outcome: Dictionary = {}
var event_history: Array[Dictionary] = []
var damage_records: Array[Dictionary] = []
var stolen_stacks: Array[Dictionary] = []
var player_health := 100.0
var player_max_health := 100.0
var settings := {
	"npc_death": false,
	"structure_damage": true,
}
var _aftermath_applied := false


func initialize(seed_value: int, world_anchors: Dictionary) -> void:
	if initialized and world_seed == seed_value:
		return
	world_seed = seed_value
	anchors = _normalise_anchors(world_anchors)
	event_history.clear()
	_initialize_camp_state()
	initialized = true
	reset_raid()
	player_health = player_max_health


func _normalise_anchors(values: Dictionary) -> Dictionary:
	var out := {}
	for key in values:
		var value: Variant = values[key]
		if value is Vector2i:
			out[str(key)] = [value.x, value.y]
		elif value is Array and value.size() >= 2:
			out[str(key)] = [int(value[0]), int(value[1])]
	return out


func reset_raid() -> void:
	phase = "dormant"
	phase_seconds = 0.0
	assault_seconds = 0.0
	preparation.clear()
	enemy_records.clear()
	outcome.clear()
	damage_records.clear()
	stolen_stacks.clear()
	_aftermath_applied = false
	state_changed.emit()
	raid_phase_changed.emit(phase)


func _initialize_camp_state() -> void:
	var camp := _anchor("goblin_camp")
	var hamlet := _anchor("hamlet")
	var distance := Vector2(camp).distance_to(Vector2(hamlet))
	camp_state = {
		"id": "enemy_camp.goblin.hearthplain",
		"enemy_family": "goblin",
		"anchor": [camp.x, camp.y],
		"distance_to_hamlet": distance,
		"strength": 52,
		"supplies": 28,
		"losses": 0,
		"cleared": false,
		"spawn_volume_id": "",
		"spawner_active": true,
	}
	_refresh_camp_pressure()


func register_camp_spawn_volume(definition: Dictionary) -> void:
	if definition.is_empty():
		return
	camp_state["spawn_volume_id"] = str(definition.get("id", ""))
	camp_state["spawn_volume"] = definition.duplicate(true)
	if not camp_state.has("spawner_active"):
		camp_state["spawner_active"] = bool(definition.get("active", true))
	state_changed.emit()


func disable_camp_spawner() -> void:
	camp_state["spawner_active"] = false
	camp_state["cleared"] = true
	camp_state["strength"] = 0
	var spawn_volume: Dictionary = camp_state.get("spawn_volume", {}).duplicate(true)
	spawn_volume["active"] = false
	camp_state["spawn_volume"] = spawn_volume
	_refresh_camp_pressure()
	_record_event("camp_spawner_broken", {
		"camp_id": str(camp_state.get("id", "")),
	})
	state_changed.emit()


func migrate_active_raid_spawn_volume(definition: Dictionary) -> void:
	## Active v11 saves may contain approach-site enemy records. Move only
	## records that predate authored spawn volumes; current/moving raids retain
	## their persisted positions.
	if phase not in ["warning", "assault"] or definition.is_empty():
		return
	var points: Array = definition.get("spawn_points", [])
	if points.is_empty():
		return
	var ordered_ids := get_enemy_ids()
	for index in ordered_ids.size():
		var enemy_id := ordered_ids[index]
		var record: Dictionary = enemy_records[enemy_id]
		if not str(record.get("spawn_volume_id", "")).is_empty():
			continue
		var point: Array = points[index % points.size()]
		record["spawn_origin"] = "authored_volume"
		record["spawn_volume_id"] = str(definition.get("id", ""))
		record["spawn_volume_center"] = definition.get("center", []).duplicate()
		record["spawn_volume_size"] = definition.get("size", []).duplicate()
		record["spawn_position"] = [
			float(point[0]), 0.0, float(point[2])]
		record["staging_anchor"] = [
			roundi(float(definition.get("center", [0.0, 0.0, 0.0])[0])),
			roundi(float(definition.get("center", [0.0, 0.0, 0.0])[2])),
		]
		record["position"] = [float(point[0]), 0.0, float(point[2])]
		enemy_records[enemy_id] = record
	preparation["raid_spawn_volume"] = definition.duplicate(true)
	state_changed.emit()


func _refresh_camp_pressure() -> void:
	camp_pressure = clampi(
		20 + int(camp_state.get("strength", 0)) / 2
			+ int(camp_state.get("supplies", 0)) / 3,
		20, 85)


func begin_raid(preparation_snapshot: Dictionary) -> Dictionary:
	if phase in ["warning", "assault"]:
		return {"ok": false, "message": "The goblin raid is already underway."}
	var source_distance := float(camp_state.get("distance_to_hamlet", 0.0))
	if bool(camp_state.get("cleared", false)) \
			or not bool(camp_state.get("spawner_active", true)) \
			or int(camp_state.get("strength", 0)) <= 0:
		return {
			"ok": false,
			"message": "The known goblin camp has been cleared; it cannot launch a raid.",
		}
	if source_distance < 95.0 or source_distance > 165.0:
		return {
			"ok": false,
			"message": "No valid goblin camp is within the configured raid distance.",
		}
	_refresh_camp_pressure()
	preparation = preparation_snapshot.duplicate(true)
	preparation["raid_source"] = camp_state.duplicate(true)
	phase = "warning"
	phase_seconds = RAID_WARNING_SECONDS
	assault_seconds = 0.0
	outcome.clear()
	damage_records.clear()
	stolen_stacks.clear()
	_aftermath_applied = false
	_create_enemy_force()
	_record_event("warning", {
		"preparation_score": preparation_score(),
		"camp_pressure": camp_pressure,
	})
	raid_phase_changed.emit(phase)
	state_changed.emit()
	return {
		"ok": true,
		"message": "Raid warning sounded from the goblin camp %dm away. Arrival in %d seconds." \
			% [roundi(source_distance), int(RAID_WARNING_SECONDS)],
	}


func _create_enemy_force() -> void:
	enemy_records.clear()
	var camp := _anchor("goblin_camp")
	var hamlet := _anchor("hamlet")
	var spawn_volume: Dictionary = preparation.get(
		"raid_spawn_volume", camp_state.get("spawn_volume", {})).duplicate(true)
	var spawn_points: Array = spawn_volume.get("spawn_points", [])
	if spawn_points.size() < 4:
		var fallback_center := Vector3(
			float(camp.x) + 0.5, 0.0, float(camp.y) + 0.5)
		spawn_volume = {
			"id": "spawn_volume.goblin_camp.fallback",
			"owner_id": str(camp_state.get("id", "")),
			"mob_family": "goblin",
			"spawn_mode": "authored_structure",
			"center": [
				fallback_center.x, fallback_center.y, fallback_center.z],
			"size": [10.0, 5.0, 10.0],
		}
		spawn_points = [
			[fallback_center.x - 3.0, 0.0, fallback_center.z - 2.0],
			[fallback_center.x + 3.0, 0.0, fallback_center.z - 2.0],
			[fallback_center.x - 2.5, 0.0, fallback_center.z + 2.5],
			[fallback_center.x + 2.5, 0.0, fallback_center.z + 2.5],
		]
		spawn_volume["spawn_points"] = spawn_points
	var definitions := [
		["goblin.raider.1", "Goblin Raider", "raider", 20.0, 4.0],
		["goblin.raider.2", "Goblin Raider", "raider", 20.0, 4.0],
		["goblin.brute.1", "Goblin Brute", "brute", 36.0, 7.0],
		["goblin.captain.1", "Goblin Raid Captain", "captain", 44.0, 6.0],
	]
	for index in definitions.size():
		var definition: Array = definitions[index]
		var point: Array = spawn_points[index]
		var spawn_position := Vector2(float(point[0]), float(point[2]))
		var spawn_distance := Vector2(hamlet).distance_to(spawn_position)
		var id := str(definition[0])
		enemy_records[id] = {
			"id": id,
			"name": str(definition[1]),
			"role": str(definition[2]),
			"health": float(definition[3]),
			"max_health": float(definition[3]),
			"damage": float(definition[4]),
			"alive": true,
			"retreated": false,
			"morale": 1.0,
			"spawn_origin": "authored_volume",
			"spawn_volume_id": str(spawn_volume.get("id", "")),
			"spawn_volume_center": spawn_volume.get("center", []).duplicate(),
			"spawn_volume_size": spawn_volume.get("size", []).duplicate(),
			"spawn_position": [
				spawn_position.x, 0.0, spawn_position.y],
			"source_camp_id": str(camp_state.get("id", "")),
			"source_anchor": [camp.x, camp.y],
			"staging_anchor": [
				roundi(float(spawn_volume.get(
					"center", [camp.x, 0.0, camp.y])[0])),
				roundi(float(spawn_volume.get(
					"center", [camp.x, 0.0, camp.y])[2])),
			],
			"source_distance": float(
				camp_state.get("distance_to_hamlet", 0.0)),
			"spawn_distance": spawn_distance,
			"position": [
				spawn_position.x,
				0.0,
				spawn_position.y,
			],
		}


func _anchor(key: String) -> Vector2i:
	var value: Array = anchors.get(key, [0, 0])
	return Vector2i(int(value[0]), int(value[1]))


func advance(delta: float) -> void:
	if phase == "warning":
		phase_seconds = maxf(0.0, phase_seconds - delta)
		if phase_seconds <= 0.0:
			phase = "assault"
			_record_event("assault", {"enemy_count": enemy_records.size()})
			raid_phase_changed.emit(phase)
			state_changed.emit()
	elif phase == "assault":
		assault_seconds += delta
		if living_enemy_count() <= 0:
			resolve_raid()
		elif assault_seconds >= RAID_ASSAULT_SECONDS:
			resolve_raid()


func is_raid_active() -> bool:
	return phase in ["warning", "assault"]


func is_assault_active() -> bool:
	return phase == "assault"


func get_enemy_record(enemy_id: String) -> Dictionary:
	return enemy_records.get(enemy_id, {}).duplicate(true)


func get_enemy_ids() -> Array[String]:
	var ids: Array[String] = []
	for enemy_id in enemy_records:
		ids.append(str(enemy_id))
	ids.sort()
	return ids


func update_enemy_position(enemy_id: String, position: Vector3) -> void:
	if not enemy_records.has(enemy_id):
		return
	var record: Dictionary = enemy_records[enemy_id]
	record["position"] = [position.x, position.y, position.z]
	enemy_records[enemy_id] = record


func damage_enemy(enemy_id: String, packet: Dictionary) -> Dictionary:
	if phase != "assault" or not enemy_records.has(enemy_id):
		return {"ok": false}
	var record: Dictionary = enemy_records[enemy_id]
	if not bool(record.get("alive", false)):
		return {"ok": false}
	var amount := maxf(0.0, float(packet.get("amount", 0.0)))
	record["health"] = maxf(0.0, float(record.get("health", 0.0)) - amount)
	record["last_damage_type"] = str(packet.get("damage_type", "physical"))
	record["last_damage_source"] = str(packet.get("source", "player"))
	if float(record["health"]) <= 0.0:
		record["alive"] = false
		record["morale"] = 0.0
		_record_event("enemy_defeated", {
			"enemy_id": enemy_id,
			"role": str(record.get("role", "raider")),
			"source": str(packet.get("source", "player")),
		})
		if str(record.get("role", "")) == "captain":
			for other_id in enemy_records:
				var other: Dictionary = enemy_records[other_id]
				if bool(other.get("alive", false)):
					other["morale"] = maxf(
						0.0, float(other.get("morale", 1.0)) - 0.55)
					enemy_records[other_id] = other
	enemy_records[enemy_id] = record
	enemy_changed.emit(enemy_id)
	state_changed.emit()
	return {
		"ok": true,
		"health": float(record["health"]),
		"defeated": not bool(record["alive"]),
	}


func living_enemy_count() -> int:
	var count := 0
	for record_value in enemy_records.values():
		var record: Dictionary = record_value
		if bool(record.get("alive", false)) and not bool(record.get("retreated", false)):
			count += 1
	return count


func defeated_enemy_count() -> int:
	var count := 0
	for record_value in enemy_records.values():
		var record: Dictionary = record_value
		if not bool(record.get("alive", true)):
			count += 1
	return count


func preparation_score() -> int:
	var score := 0
	score += clampi(int(preparation.get("tower_stages", 0)), 0, 4) * 10
	score += 20 if bool(preparation.get("ward_active", false)) else 0
	score += 15 if bool(preparation.get("guard_ready", false)) else 0
	score += 10 if bool(preparation.get("food_stocked", false)) else 0
	score += 10 if bool(preparation.get("lighting_ready", false)) else 0
	score += clampi(defeated_enemy_count() * 6, 0, 24)
	return score


func resolve_raid() -> Dictionary:
	if phase == "resolved":
		return outcome.duplicate(true)
	if phase not in ["warning", "assault"]:
		return {}
	var score := preparation_score()
	var pressure := camp_pressure
	var outcome_id := "partial_loss"
	var title := "Partial Loss"
	var injuries := 2
	var theft := 8
	var damage_count := 3
	var reputation_delta := 2
	if score >= pressure + 20:
		outcome_id = "prepared_victory"
		title = "Prepared Victory"
		injuries = 0
		theft = 0
		damage_count = 0
		reputation_delta = 12
	elif score >= pressure - 8:
		outcome_id = "costly_victory"
		title = "Costly Victory"
		injuries = 1
		theft = 3
		damage_count = 1
		reputation_delta = 7
	elif score < pressure - 30:
		outcome_id = "village_defeat"
		title = "Village Defeat"
		injuries = 3
		theft = 12
		damage_count = 5
		reputation_delta = -4
	outcome = {
		"id": outcome_id,
		"title": title,
		"preparation_score": score,
		"camp_pressure": pressure,
		"injuries": injuries,
		"theft_limit": theft,
		"damage_count": damage_count if bool(settings["structure_damage"]) else 0,
		"reputation_delta": reputation_delta,
		"defeated_enemies": defeated_enemy_count(),
		"captain_defeated": not bool(
			enemy_records.get("goblin.captain.1", {}).get("alive", true)),
	}
	phase = "resolved"
	phase_seconds = 0.0
	_build_damage_plan(int(outcome["damage_count"]))
	_apply_aftermath()
	var defeated := defeated_enemy_count()
	camp_state["losses"] = int(camp_state.get("losses", 0)) + defeated
	camp_state["strength"] = maxi(
		0, int(camp_state.get("strength", 0)) - defeated * 8)
	camp_state["supplies"] = maxi(
		0, int(camp_state.get("supplies", 0)) - 4)
	camp_state["cleared"] = int(camp_state["strength"]) <= 0
	_refresh_camp_pressure()
	_record_event("resolved", outcome)
	raid_phase_changed.emit(phase)
	state_changed.emit()
	return outcome.duplicate(true)


func _apply_aftermath() -> void:
	if _aftermath_applied or outcome.is_empty():
		return
	var injury_count := int(outcome.get("injuries", 0))
	var injury_candidates: Array[String] = [
		"npc.poc.forest_hamlet.guard_elric",
		"npc.poc.forest_hamlet.builder_talia",
		"npc.poc.forest_hamlet.farmer_bram",
	]
	var injured: Array[String] = []
	for index in mini(injury_count, injury_candidates.size()):
		injured.append(injury_candidates[index])
	stolen_stacks = HamletState.apply_raid_aftermath(
		str(outcome.get("id", "partial_loss")), injured,
		int(outcome.get("theft_limit", 0)),
		int(outcome.get("reputation_delta", 0)))
	_aftermath_applied = true


func _build_damage_plan(count: int) -> void:
	damage_records.clear()
	var offsets := [
		Vector3i(-3, 0, 0),
		Vector3i(3, 0, 0),
		Vector3i(0, 0, -2),
		Vector3i(0, 0, 2),
		Vector3i(-3, 0, 1),
	]
	for index in mini(count, offsets.size()):
		damage_records.append({
			"id": "raid.damage.%d" % index,
			"target": "warehouse",
			"offset": [offsets[index].x, offsets[index].y, offsets[index].z],
			"position": [],
			"original_block": "",
			"repaired": false,
		})


func materialize_damage(world: Object) -> void:
	if world == null or damage_records.is_empty():
		return
	var center: Vector3i = world.get_hamlet_station_position("warehouse")
	for index in damage_records.size():
		var record: Dictionary = damage_records[index]
		if bool(record.get("repaired", false)) \
				or not record.get("position", []).is_empty():
			continue
		var offset: Array = record.get("offset", [0, 0, 0])
		var position := center + Vector3i(
			int(offset[0]), int(offset[1]), int(offset[2]))
		world.prepare_player_column(
			Vector3(position) + Vector3(0.5, 1.0, 0.5))
		var block_id := int(world.get_block_global(position))
		if BlockRegistry.is_air(block_id):
			continue
		var stable_id := BlockRegistry.get_stable_id(block_id)
		if world.set_block_global(position, BlockRegistry.AIR):
			record["position"] = [position.x, position.y, position.z]
			record["original_block"] = stable_id
			damage_records[index] = record
	state_changed.emit()


func repair_next_damage(world: Object) -> Dictionary:
	if world == null:
		return {"ok": false, "message": "No world is available for repairs."}
	for index in damage_records.size():
		var record: Dictionary = damage_records[index]
		if bool(record.get("repaired", false)):
			continue
		var position_value: Array = record.get("position", [])
		var original := str(record.get("original_block", ""))
		if position_value.size() < 3 or original.is_empty():
			continue
		var repair_ref := {
			"kind": "item",
			"stable_id": "item.material.beam_oak",
			"count": 1,
		}
		if Inventory.count_ref(repair_ref) < 1:
			return {
				"ok": false,
				"message": "Repair requires 1 Oak Beam in your inventory.",
			}
		var position := Vector3i(
			int(position_value[0]), int(position_value[1]), int(position_value[2]))
		var block_id := BlockRegistry.get_id_by_stable_id(original)
		if block_id <= 0 or not BlockRegistry.is_air(world.get_block_global(position)):
			return {"ok": false, "message": "The damaged voxel cannot be repaired yet."}
		if not world.set_block_global(position, block_id):
			return {"ok": false, "message": "The repair edit could not be committed."}
		if not Inventory.remove_ref(repair_ref, 1):
			world.set_block_global(position, BlockRegistry.AIR)
			return {"ok": false, "message": "The repair transaction was rolled back."}
		record["repaired"] = true
		damage_records[index] = record
		state_changed.emit()
		return {
			"ok": true,
			"message": "Repaired raid damage with 1 Oak Beam.",
		}
	return {"ok": false, "message": "There is no remaining raid damage to repair."}


func unresolved_damage_count() -> int:
	var count := 0
	for record_value in damage_records:
		var record: Dictionary = record_value
		if not bool(record.get("repaired", false)):
			count += 1
	return count


func damage_player(amount: float, source: String = "") -> Dictionary:
	if amount <= 0.0:
		return {"ok": false}
	player_health = maxf(0.0, player_health - amount)
	player_health_changed.emit()
	state_changed.emit()
	return {
		"ok": true,
		"health": player_health,
		"downed": player_health <= 0.0,
		"source": source,
	}


func recover_player() -> void:
	player_health = player_max_health
	player_health_changed.emit()
	state_changed.emit()


func status_text() -> String:
	match phase:
		"warning":
			return "Raid warning: %ds" % ceili(phase_seconds)
		"assault":
			return "Raid: %d goblins" % living_enemy_count()
		"resolved":
			return "Aftermath: %s · %d repairs" % [
				str(outcome.get("title", "Resolved")), unresolved_damage_count()]
	return "Peaceful"


func _record_event(kind: String, facts: Dictionary) -> void:
	event_history.append({
		"kind": kind,
		"day": HamletState.day,
		"minute": HamletState.clock_minutes,
		"facts": facts.duplicate(true),
	})
	if event_history.size() > 32:
		event_history.pop_front()


func serialize_state() -> Dictionary:
	var saved_stolen: Array = []
	for stack in stolen_stacks:
		saved_stolen.append(Inventory.serialize_stack(stack))
	return {
		"version": 1,
		"world_seed": world_seed,
		"anchors": anchors.duplicate(true),
		"phase": phase,
		"phase_seconds": phase_seconds,
		"assault_seconds": assault_seconds,
		"camp_pressure": camp_pressure,
		"camp_state": camp_state.duplicate(true),
		"preparation": preparation.duplicate(true),
		"enemy_records": enemy_records.duplicate(true),
		"outcome": outcome.duplicate(true),
		"event_history": event_history.duplicate(true),
		"damage_records": damage_records.duplicate(true),
		"stolen_stacks": saved_stolen,
		"player_health": player_health,
		"player_max_health": player_max_health,
		"settings": settings.duplicate(true),
		"aftermath_applied": _aftermath_applied,
	}


func restore_state(value: Variant, expected_seed: int) -> bool:
	if not (value is Dictionary):
		return false
	var data: Dictionary = value
	if int(data.get("world_seed", -1)) != expected_seed:
		return false
	initialize(expected_seed, data.get("anchors", {}))
	phase = str(data.get("phase", "dormant"))
	if phase not in ["dormant", "warning", "assault", "resolved"]:
		phase = "dormant"
	phase_seconds = maxf(0.0, float(data.get("phase_seconds", 0.0)))
	assault_seconds = maxf(0.0, float(data.get("assault_seconds", 0.0)))
	camp_pressure = clampi(int(data.get("camp_pressure", DEFAULT_CAMP_PRESSURE)), 1, 100)
	var saved_camp: Variant = data.get("camp_state", {})
	if saved_camp is Dictionary and not saved_camp.is_empty():
		camp_state = saved_camp.duplicate(true)
	else:
		_initialize_camp_state()
	_refresh_camp_pressure()
	preparation = data.get("preparation", {}).duplicate(true)
	enemy_records = data.get("enemy_records", {}).duplicate(true)
	outcome = data.get("outcome", {}).duplicate(true)
	event_history.clear()
	for event_value in data.get("event_history", []):
		if event_value is Dictionary:
			event_history.append(event_value.duplicate(true))
	damage_records.clear()
	for damage_value in data.get("damage_records", []):
		if damage_value is Dictionary:
			damage_records.append(damage_value.duplicate(true))
	stolen_stacks.clear()
	for stack_value in data.get("stolen_stacks", []):
		var stack := Inventory.deserialize_stack(stack_value)
		if not stack.is_empty():
			stolen_stacks.append(stack)
	player_max_health = maxf(1.0, float(data.get("player_max_health", 100.0)))
	player_health = clampf(
		float(data.get("player_health", player_max_health)), 0.0, player_max_health)
	settings.merge(data.get("settings", {}), true)
	_aftermath_applied = bool(data.get("aftermath_applied", phase == "resolved"))
	initialized = true
	raid_phase_changed.emit(phase)
	player_health_changed.emit()
	state_changed.emit()
	return true
