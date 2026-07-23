extends Node
## Persistent personal-magic state for the Stage 6 POC.
##
## Infrastructure mana lives in MagicSystem batteries. This autoload owns only
## the player's learned spells, casting pool, cooldowns, and readable failures.

signal magic_changed

const MAX_MANA := 100.0
const REGEN_PER_SECOND := 2.0
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
	magic_changed.emit()


func unlock_poc_magic(source_id: String = "") -> void:
	known_spells["spell.stone_sense"] = true
	known_spells["spell.spark_bolt"] = true
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
	magic_changed.emit()
