extends Node
## Persistent personal-magic state for the Stage 6 POC.
##
## Infrastructure mana lives in MagicSystem batteries. This autoload owns only
## the player's learned spells, casting pool, cooldowns, and readable failures.

signal magic_changed
signal action_bar_changed(active: bool)

const MAX_MANA := 100.0
const REGEN_PER_SECOND := 2.0
const ABILITY_SLOT_COUNT := 9
const SPELLS := {
	"spell.stone_sense": {
		"name": "Stone Sense",
		"cost": 12.0,
		"cooldown": 4.0,
		"role": "utility",
	},
	"spell.spark_bolt": {
		"name": "Spark Bolt",
		"cost": 18.0,
		"cooldown": 1.5,
		"role": "combat",
		"damage": 8.0,
	},
}

var mana := MAX_MANA
var known_spells: Dictionary = {}
var cooldowns: Dictionary = {}
var cast_counts: Dictionary = {}
var last_fault := ""
var ability_slots: Array[String] = []
var selected_ability_slot := 0
var action_bar_active := false


func _ready() -> void:
	reset()


func _process(delta: float) -> void:
	if delta <= 0.0:
		return
	var changed := false
	for spell_id in cooldowns.keys():
		var remaining := maxf(0.0, float(cooldowns[spell_id]) - delta)
		if remaining <= 0.0:
			cooldowns.erase(spell_id)
		else:
			cooldowns[spell_id] = remaining
		changed = true
	if mana < MAX_MANA:
		mana = minf(MAX_MANA, mana + REGEN_PER_SECOND * delta)
		changed = true
	if changed:
		magic_changed.emit()


func reset() -> void:
	mana = MAX_MANA
	known_spells.clear()
	cooldowns.clear()
	cast_counts.clear()
	last_fault = ""
	ability_slots.clear()
	ability_slots.resize(ABILITY_SLOT_COUNT)
	ability_slots.fill("")
	selected_ability_slot = 0
	action_bar_active = false
	action_bar_changed.emit(action_bar_active)
	magic_changed.emit()


func unlock_poc_magic(source_id: String = "") -> void:
	known_spells["spell.stone_sense"] = true
	known_spells["spell.spark_bolt"] = true
	_assign_first_open_slot("spell.stone_sense")
	_assign_first_open_slot("spell.spark_bolt")
	last_fault = ""
	if not source_id.is_empty():
		ProgressionState.unlock_basic_magic(source_id)
	else:
		ProgressionState.unlock_basic_magic("knowledge.magic.basic_rune")
	magic_changed.emit()


func is_spell_known(spell_id: String) -> bool:
	return known_spells.has(spell_id)


func spell_definition(spell_id: String) -> Dictionary:
	return SPELLS.get(spell_id, {}).duplicate(true)


func get_known_abilities() -> Array[String]:
	var abilities: Array[String] = []
	for spell_id in known_spells:
		if SPELLS.has(spell_id):
			abilities.append(str(spell_id))
	abilities.sort()
	return abilities


func get_ability_slot(index: int) -> String:
	return ability_slots[index] \
		if index >= 0 and index < ability_slots.size() else ""


func assign_ability(index: int, ability_id: String) -> bool:
	if index < 0 or index >= ABILITY_SLOT_COUNT:
		return false
	if not ability_id.is_empty() and not is_spell_known(ability_id):
		return false
	if not ability_id.is_empty():
		for other_index in ability_slots.size():
			if other_index != index and ability_slots[other_index] == ability_id:
				ability_slots[other_index] = ""
	ability_slots[index] = ability_id
	magic_changed.emit()
	return true


func select_ability_slot(index: int) -> bool:
	if index < 0 or index >= ABILITY_SLOT_COUNT:
		return false
	selected_ability_slot = index
	magic_changed.emit()
	return true


func cycle_ability_slot(direction: int) -> void:
	selected_ability_slot = posmod(
		selected_ability_slot + direction, ABILITY_SLOT_COUNT)
	magic_changed.emit()


func set_action_bar_active(value: bool) -> void:
	if action_bar_active == value:
		return
	action_bar_active = value
	action_bar_changed.emit(action_bar_active)
	magic_changed.emit()


func toggle_action_bar() -> void:
	set_action_bar_active(not action_bar_active)


func _assign_first_open_slot(ability_id: String) -> void:
	if ability_slots.has(ability_id):
		return
	for i in ability_slots.size():
		if ability_slots[i].is_empty():
			ability_slots[i] = ability_id
			return


func begin_cast(spell_id: String) -> Dictionary:
	var definition := spell_definition(spell_id)
	if definition.is_empty():
		return _cast_failure("unknown_spell", "That spell does not exist.")
	if not is_spell_known(spell_id):
		return _cast_failure(
			"not_learned",
			"Find the rune ruin or ask the village mage about basic magic.")
	var remaining := float(cooldowns.get(spell_id, 0.0))
	if remaining > 0.0:
		return _cast_failure(
			"cooldown",
			"%s is cooling down for %.1fs." % [definition["name"], remaining])
	var cost := float(definition.get("cost", 0.0))
	if mana + 0.0001 < cost:
		return _cast_failure(
			"no_mana",
			"Not enough personal mana for %s (%d needed)." % [
				definition["name"], roundi(cost)])
	mana = maxf(0.0, mana - cost)
	cooldowns[spell_id] = float(definition.get("cooldown", 0.0))
	cast_counts[spell_id] = int(cast_counts.get(spell_id, 0)) + 1
	last_fault = ""
	magic_changed.emit()
	return {
		"ok": true,
		"spell_id": spell_id,
		"name": str(definition["name"]),
		"cost": cost,
	}


func cast_spark_bolt(target: Object = null) -> Dictionary:
	var result := begin_cast("spell.spark_bolt")
	if not bool(result.get("ok", false)):
		return result
	var definition := spell_definition("spell.spark_bolt")
	var packet := {
		"source": "spell.spark_bolt",
		"damage_type": "magic.shock",
		"amount": float(definition.get("damage", 8.0)),
		"status": "shock",
		"block_damage": false,
	}
	var hit := target != null and target.has_method("apply_magic_damage")
	if hit:
		target.call("apply_magic_damage", packet)
	result["hit"] = hit
	result["damage_packet"] = packet
	return result


func cooldown_remaining(spell_id: String) -> float:
	return float(cooldowns.get(spell_id, 0.0))


func status_text() -> String:
	var known := "Stone Sense + Spark Bolt" \
		if is_spell_known("spell.stone_sense") else "Magic not yet learned"
	return "Mana %d/%d · %s" % [roundi(mana), roundi(MAX_MANA), known]


func _cast_failure(code: String, message: String) -> Dictionary:
	last_fault = code
	magic_changed.emit()
	return {"ok": false, "fault": code, "message": message}


func serialize_state() -> Dictionary:
	return {
		"mana": mana,
		"known_spells": known_spells.keys(),
		"cooldowns": cooldowns.duplicate(),
		"cast_counts": cast_counts.duplicate(),
		"last_fault": last_fault,
		"ability_slots": ability_slots.duplicate(),
		"selected_ability_slot": selected_ability_slot,
		"action_bar_active": action_bar_active,
	}


func restore_state(data: Dictionary) -> void:
	reset()
	mana = clampf(float(data.get("mana", MAX_MANA)), 0.0, MAX_MANA)
	for spell_id_value in data.get("known_spells", []):
		var spell_id := str(spell_id_value)
		if SPELLS.has(spell_id):
			known_spells[spell_id] = true
	var cooldown_value: Variant = data.get("cooldowns", {})
	if cooldown_value is Dictionary:
		for spell_id in cooldown_value:
			if SPELLS.has(str(spell_id)):
				var remaining := maxf(0.0, float(cooldown_value[spell_id]))
				if remaining > 0.0:
					cooldowns[str(spell_id)] = remaining
	var count_value: Variant = data.get("cast_counts", {})
	if count_value is Dictionary:
		for spell_id in count_value:
			if SPELLS.has(str(spell_id)):
				cast_counts[str(spell_id)] = maxi(0, int(count_value[spell_id]))
	last_fault = str(data.get("last_fault", ""))
	var saved_slots: Variant = data.get("ability_slots", [])
	if saved_slots is Array:
		for i in mini(saved_slots.size(), ABILITY_SLOT_COUNT):
			var ability_id := str(saved_slots[i])
			if ability_id.is_empty() or is_spell_known(ability_id):
				ability_slots[i] = ability_id
	selected_ability_slot = clampi(
		int(data.get("selected_ability_slot", 0)), 0, ABILITY_SLOT_COUNT - 1)
	action_bar_active = bool(data.get("action_bar_active", false))
	if is_spell_known("spell.stone_sense"):
		_assign_first_open_slot("spell.stone_sense")
	if is_spell_known("spell.spark_bolt"):
		_assign_first_open_slot("spell.spark_bolt")
	action_bar_changed.emit(action_bar_active)
	magic_changed.emit()
