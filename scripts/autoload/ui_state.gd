extends Node
## Persistent Stage 8 interface, learning, accessibility, and input profile.
##
## Gameplay systems remain authoritative. This state only records presentation
## preferences, player knowledge, map discovery, and remappable input choices.

signal settings_changed
signal learning_changed
signal map_changed
signal bindings_changed

const SETTINGS_VERSION := 1
const MAP_ANCHORS: Array[String] = [
	"spawn", "hamlet", "warehouse", "watchtower_site", "base_site",
	"cave_entrance", "rune_ruin", "mana_pocket", "raid_approach",
	"goblin_camp",
]
const REBINDABLE_ACTIONS: Array[String] = [
	"move_forward", "move_back", "move_left", "move_right", "jump", "sprint",
	"break_block", "place_block", "toggle_inventory", "toggle_craft",
	"toggle_guide", "toggle_map", "toggle_village", "toggle_action_bar",
	"toggle_abilities", "hotbar_previous", "hotbar_next",
	"look_left", "look_right", "look_up", "look_down",
]
const ACTION_LABELS := {
	"move_forward": "Move Forward",
	"move_back": "Move Back",
	"move_left": "Move Left",
	"move_right": "Move Right",
	"jump": "Jump / Swim Up",
	"sprint": "Sprint",
	"break_block": "Primary Use / Attack",
	"place_block": "Interact / Place",
	"toggle_inventory": "Inventory",
	"toggle_craft": "Crafting",
	"toggle_guide": "Guide / Help",
	"toggle_map": "Local Map",
	"toggle_village": "Village Overview",
	"toggle_action_bar": "Item / Skill Bar",
	"toggle_abilities": "Assign Skills",
	"hotbar_previous": "Previous Slot",
	"hotbar_next": "Next Slot",
	"look_left": "Look Left",
	"look_right": "Look Right",
	"look_up": "Look Up",
	"look_down": "Look Down",
}

var settings: Dictionary = {}
var completed_hints: Dictionary = {}
var discovered_anchors: Dictionary = {}
var discovered_sites: Dictionary = {}
var custom_pin := Vector2.ZERO
var has_custom_pin := false


func _ready() -> void:
	reset()
	_ensure_stage8_actions()


func reset() -> void:
	reset_profile()
	reset_world_state()


func reset_profile() -> void:
	settings = {
		"hud_preset": "standard",
		"tutorial_mode": "contextual",
		"ui_scale": 1.0,
		"captions": true,
		"high_contrast": false,
		"reduced_motion": false,
		"reduce_flashes": true,
		"toggle_sprint": false,
		"aim_assist": 0.25,
		"notification_preset": "standard",
		"quality_profile": "balanced",
	}
	settings_changed.emit()


func reset_world_state() -> void:
	completed_hints.clear()
	discovered_anchors = {"spawn": true}
	discovered_sites.clear()
	custom_pin = Vector2.ZERO
	has_custom_pin = false
	learning_changed.emit()
	map_changed.emit()


func set_setting(key: String, value: Variant) -> bool:
	if not settings.has(key):
		return false
	match key:
		"ui_scale":
			value = clampf(float(value), 0.8, 1.5)
		"aim_assist":
			value = clampf(float(value), 0.0, 1.0)
		"hud_preset":
			if str(value) not in ["immersive", "standard", "accessibility"]:
				return false
		"tutorial_mode":
			if str(value) not in ["minimal", "contextual", "guided", "full"]:
				return false
		"notification_preset":
			if str(value) not in ["quiet", "standard", "detailed"]:
				return false
		"quality_profile":
			if str(value) not in ["performance", "balanced", "quality"]:
				return false
	settings[key] = value
	settings_changed.emit()
	return true


func setting_bool(key: String) -> bool:
	return bool(settings.get(key, false))


func setting_float(key: String, fallback: float = 0.0) -> float:
	return float(settings.get(key, fallback))


func mark_hint_complete(hint_id: String) -> void:
	if hint_id.is_empty() or completed_hints.has(hint_id):
		return
	completed_hints[hint_id] = true
	learning_changed.emit()


func reset_learning() -> void:
	completed_hints.clear()
	learning_changed.emit()


func discover_anchor(anchor_id: String) -> bool:
	if anchor_id not in MAP_ANCHORS or discovered_anchors.has(anchor_id):
		return false
	discovered_anchors[anchor_id] = true
	map_changed.emit()
	return true


func discover_site(site: Dictionary) -> bool:
	var site_id := str(site.get("site_id", ""))
	var position: Variant = site.get("position", Vector2i.ZERO)
	if site_id.is_empty() or discovered_sites.has(site_id):
		return false
	var point := Vector2i.ZERO
	if position is Vector2i:
		point = position
	elif position is Array and position.size() >= 2:
		point = Vector2i(int(position[0]), int(position[1]))
	discovered_sites[site_id] = {
		"type_id": str(site.get("type_id", "site")),
		"position": [point.x, point.y],
	}
	map_changed.emit()
	return true


func update_world_discovery(player_position: Vector3, anchors: Dictionary) -> void:
	for anchor_id in MAP_ANCHORS:
		if not anchors.has(anchor_id):
			continue
		var point: Vector2i = anchors[anchor_id]
		var distance := Vector2(player_position.x, player_position.z).distance_to(
			Vector2(point))
		var reveal_distance := 72.0 if anchor_id in [
			"hamlet", "warehouse", "watchtower_site",
		] else 34.0
		if distance <= reveal_distance:
			discover_anchor(anchor_id)
	if HamletState.reputation_state != HamletState.REP_STRANGER:
		for anchor_id in ["hamlet", "warehouse", "watchtower_site"]:
			discover_anchor(anchor_id)
	if ProgressionState.has_basic_magic_knowledge():
		for anchor_id in ["rune_ruin", "mana_pocket"]:
			discover_anchor(anchor_id)
	if CombatState.phase != "dormant" or not CombatState.outcome.is_empty():
		for anchor_id in ["raid_approach", "goblin_camp"]:
			discover_anchor(anchor_id)


func set_custom_pin(point: Vector2) -> void:
	custom_pin = point
	has_custom_pin = true
	map_changed.emit()


func clear_custom_pin() -> void:
	if not has_custom_pin:
		return
	has_custom_pin = false
	map_changed.emit()


func current_objective() -> Dictionary:
	if ProgressionState.harvested_counts.is_empty():
		return _objective(
			"gather", "Gather starter materials",
			"Hold Primary Use on trees or stone. Drops stay in the world if your inventory is full.",
			"spawn", "Gathering creates the real stacks used by crafting and village supply.")
	if ProgressionState.crafted_counts.is_empty():
		return _objective(
			"craft", "Craft a crude tool",
			"Open Crafting, place known ingredients in the 2x2 grid, then take the output.",
			"base_site", "A better tool harvests harder material and opens the iron supply chain.")
	if HamletState.reputation_state == HamletState.REP_STRANGER:
		return _objective(
			"meet_elder", "Meet the Forest Hamlet",
			"Follow the road to the hamlet and speak with Elder Maelin. The local map shows discovered landmarks.",
			"hamlet", "The elder grants request-board access; permissions are never implied by proximity.")
	if not bool(HamletState.project.get("complete", false)):
		if HamletState.project_is_building():
			return _objective(
				"watch_build", "Watch the tower stage take shape",
				"Reserved warehouse stock is being consumed by the builder. Inspect the project for progress and blockers.",
				"watchtower_site", "Only reserved stock advances construction; physical blocks and project state must agree.")
		var stage := HamletState.get_project_stage_definition()
		return _objective(
			"supply_project", "Supply the watchtower: %s" % str(
				stage.get("name", "current stage")),
			"Open the request board or warehouse overview to see exact shortages and permission reasons.",
			"warehouse", "Delivered resources enter village storage, reserve to the active stage, then become construction.")
	if HamletState.get_recent_automation_deliveries(1).is_empty():
		return _objective(
			"automate", "Connect production to village storage",
			"Craft a miner, crank, chute, furnace, and warehouse hatch. Inspect each machine for power, ports, blockage, and destination.",
			"base_site", "Conserved batches travel through typed ports; the warehouse ledger proves what arrived and where it was reserved.")
	if not ProgressionState.has_basic_magic_knowledge():
		return _objective(
			"learn_magic", "Follow the rune clues",
			"Explore the rune ruin or ask the village mage about the mana crystal chain.",
			"rune_ruin", "Learning basic runes reveals personal mana, spell loadouts, mana machines, and wards.")
	if CombatState.phase == "dormant":
		return _objective(
			"prepare_raid", "Prepare the hamlet for the goblin raid",
			"Review tower, guard, food, lighting, and ward readiness, then speak with Elric to sound the warning.",
			"watchtower_site", "The raid planner records preparation once; that snapshot deterministically changes the outcome.")
	if CombatState.phase in ["warning", "assault"]:
		return _objective(
			"defend", "Defend the Forest Hamlet",
			"Protect civilians and guards. Use your item or skill bar and watch the raid objective.",
			"raid_approach", "Enemy defeats and surviving defences feed the authoritative resolution.")
	if CombatState.phase == "resolved" and CombatState.unresolved_damage_count() > 0:
		return _objective(
			"repair", "Repair the raid damage",
			"Review the aftermath, then repair damaged warehouse voxels with one Oak Beam each.",
			"warehouse", "Repair restores the recorded original voxel and consumes the exact material cost.")
	return _objective(
		"complete", "Forest Hamlet loop complete",
		"Review the outcome history, continue building, or reset the raid from Elric for another preparation test.",
		"hamlet", "Resources, project progress, defence preparation, raid results, and repairs now form one persistent loop.")


func _objective(id: String, title: String, instruction: String,
		anchor_id: String, cause: String) -> Dictionary:
	return {
		"id": id,
		"title": title,
		"instruction": instruction,
		"anchor_id": anchor_id,
		"cause": cause,
	}


func tutorial_entries() -> Array[Dictionary]:
	var entries: Array[Dictionary] = [
		{"id": "controls", "title": "Move and interact", "text":
			"Use movement, Jump, Primary Use, and Interact. Open Controls to remap keyboard or controller inputs."},
		{"id": "inventory", "title": "Stacks and transfers", "text":
			"Open Inventory for stack details and search. Focus a slot and activate it, or drag between compatible endpoints."},
		{"id": "crafting", "title": "Recipe knowledge", "text":
			"Known recipes match the placed grid. Missing or undiscovered inputs are explained without revealing later content."},
		{"id": "village", "title": "Village authority", "text":
			"Requests, storage permissions, reserves, construction, and reputation are separate facts shown together in Village."},
		{"id": "automation", "title": "Machine cause and effect", "text":
			"Inspect a machine for input, output, power, route, destination, and a plain-language fault remedy."},
		{"id": "magic", "title": "Magic reveals through discovery", "text":
			"Mana and spell details stay hidden until a rune clue or village teacher provides basic knowledge."},
		{"id": "raid", "title": "Preparation changes outcomes", "text":
			"Tower stages, ward coverage, guard readiness, food, and lighting are recorded when the warning begins."},
		{"id": "recovery", "title": "Failure preserves state", "text":
			"Full inventories, blocked machines, denied permissions, defeat, and save warnings explain what remained safe and what to do next."},
	]
	return entries


func _ensure_stage8_actions() -> void:
	_action_key("toggle_inventory", KEY_I)
	_action_key("toggle_guide", KEY_TAB)
	_action_key("toggle_map", KEY_M)
	_action_key("toggle_village", KEY_V)
	_action_key("hotbar_previous", KEY_BRACKETLEFT)
	_action_key("hotbar_next", KEY_BRACKETRIGHT)
	_action_joy_button("toggle_guide", JOY_BUTTON_BACK)
	_action_joy_button("toggle_inventory", JOY_BUTTON_Y)
	_action_joy_button("toggle_craft", JOY_BUTTON_X)
	_action_joy_button("toggle_map", JOY_BUTTON_DPAD_UP)
	_action_joy_button("toggle_village", JOY_BUTTON_DPAD_DOWN)
	_action_joy_button("jump", JOY_BUTTON_A)
	_action_joy_button("sprint", JOY_BUTTON_LEFT_STICK)
	_action_joy_button("toggle_action_bar", JOY_BUTTON_LEFT_SHOULDER)
	_action_joy_button("toggle_abilities", JOY_BUTTON_RIGHT_SHOULDER)
	_action_joy_button("hotbar_previous", JOY_BUTTON_DPAD_LEFT)
	_action_joy_button("hotbar_next", JOY_BUTTON_DPAD_RIGHT)
	_action_joy_axis("move_left", JOY_AXIS_LEFT_X, -1.0)
	_action_joy_axis("move_right", JOY_AXIS_LEFT_X, 1.0)
	_action_joy_axis("move_forward", JOY_AXIS_LEFT_Y, -1.0)
	_action_joy_axis("move_back", JOY_AXIS_LEFT_Y, 1.0)
	_action_joy_axis("break_block", JOY_AXIS_TRIGGER_RIGHT, 1.0)
	_action_joy_axis("place_block", JOY_AXIS_TRIGGER_LEFT, 1.0)
	_action_joy_axis("look_left", JOY_AXIS_RIGHT_X, -1.0)
	_action_joy_axis("look_right", JOY_AXIS_RIGHT_X, 1.0)
	_action_joy_axis("look_up", JOY_AXIS_RIGHT_Y, -1.0)
	_action_joy_axis("look_down", JOY_AXIS_RIGHT_Y, 1.0)


func _ensure_action(action: String) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action, 0.25)


func _action_key(action: String, keycode: Key) -> void:
	_ensure_action(action)
	for existing in InputMap.action_get_events(action):
		if existing is InputEventKey and existing.keycode == keycode:
			return
	var event := InputEventKey.new()
	event.keycode = keycode
	InputMap.action_add_event(action, event)


func _action_joy_button(action: String, button: JoyButton) -> void:
	_ensure_action(action)
	for existing in InputMap.action_get_events(action):
		if existing is InputEventJoypadButton and existing.button_index == button:
			return
	var event := InputEventJoypadButton.new()
	event.button_index = button
	InputMap.action_add_event(action, event)


func _action_joy_axis(action: String, axis: JoyAxis, value: float) -> void:
	_ensure_action(action)
	for existing in InputMap.action_get_events(action):
		if existing is InputEventJoypadMotion \
				and existing.axis == axis and signf(existing.axis_value) == signf(value):
			return
	var event := InputEventJoypadMotion.new()
	event.axis = axis
	event.axis_value = value
	InputMap.action_add_event(action, event)


func rebind_action(action: String, event: InputEvent) -> bool:
	if action not in REBINDABLE_ACTIONS or not _is_bindable_event(event):
		return false
	_ensure_action(action)
	for existing in InputMap.action_get_events(action):
		if _same_device_family(existing, event):
			InputMap.action_erase_event(action, existing)
	var stored := event.duplicate()
	if stored is InputEventKey:
		stored.pressed = false
	elif stored is InputEventMouseButton:
		stored.pressed = false
	elif stored is InputEventJoypadButton:
		stored.pressed = false
	InputMap.action_add_event(action, stored)
	bindings_changed.emit()
	return true


func _is_bindable_event(event: InputEvent) -> bool:
	return event is InputEventKey or event is InputEventMouseButton \
		or event is InputEventJoypadButton or event is InputEventJoypadMotion


func _same_device_family(a: InputEvent, b: InputEvent) -> bool:
	if a is InputEventKey:
		return b is InputEventKey
	if a is InputEventMouseButton:
		return b is InputEventMouseButton
	return (a is InputEventJoypadButton or a is InputEventJoypadMotion) \
		and (b is InputEventJoypadButton or b is InputEventJoypadMotion)


func binding_text(action: String) -> String:
	if not InputMap.has_action(action):
		return "Unbound"
	var keyboard := ""
	var controller := ""
	for event in InputMap.action_get_events(action):
		var label := event.as_text().replace(" (Physical)", "")
		if event is InputEventKey or event is InputEventMouseButton:
			if keyboard.is_empty():
				keyboard = label
		elif (event is InputEventJoypadButton or event is InputEventJoypadMotion) \
				and controller.is_empty():
			controller = label
	var labels: Array[String] = []
	if not keyboard.is_empty():
		labels.append(keyboard)
	if not controller.is_empty():
		labels.append(controller)
	return " / ".join(labels) if not labels.is_empty() else "Unbound"


func binding_conflicts(action: String) -> Array[String]:
	var conflicts: Array[String] = []
	if not InputMap.has_action(action):
		return conflicts
	for event in InputMap.action_get_events(action):
		var binding_key := _event_binding_key(event)
		if binding_key.is_empty():
			continue
		for other_action in REBINDABLE_ACTIONS:
			if other_action == action or not InputMap.has_action(other_action):
				continue
			for other_event in InputMap.action_get_events(other_action):
				if _event_binding_key(other_event) == binding_key:
					var label := action_label(other_action)
					if label not in conflicts:
						conflicts.append(label)
	return conflicts


func _event_binding_key(event: InputEvent) -> String:
	if event is InputEventKey:
		return "key:%d" % event.keycode
	if event is InputEventMouseButton:
		return "mouse:%d" % event.button_index
	if event is InputEventJoypadButton:
		return "joy_button:%d" % event.button_index
	if event is InputEventJoypadMotion:
		return "joy_axis:%d:%d" % [event.axis, signi(roundi(event.axis_value))]
	return ""


func action_label(action: String) -> String:
	return str(ACTION_LABELS.get(action, action.replace("_", " ").capitalize()))


func serialize_state() -> Dictionary:
	## Combined v12-v14 compatibility payload. Save v15+ stores only
	## serialize_world_state() inside a world and keeps this profile global.
	return {
		"version": SETTINGS_VERSION,
		"settings": settings.duplicate(true),
		"completed_hints": completed_hints.keys(),
		"discovered_anchors": discovered_anchors.keys(),
		"discovered_sites": discovered_sites.duplicate(true),
		"custom_pin": [custom_pin.x, custom_pin.y] if has_custom_pin else [],
		"bindings": _serialize_bindings(),
	}


func serialize_profile_state() -> Dictionary:
	return {
		"version": SETTINGS_VERSION,
		"settings": settings.duplicate(true),
		"bindings": _serialize_bindings(),
	}


func serialize_world_state() -> Dictionary:
	return {
		"version": SETTINGS_VERSION,
		"completed_hints": completed_hints.keys(),
		"discovered_anchors": discovered_anchors.keys(),
		"discovered_sites": discovered_sites.duplicate(true),
		"custom_pin": [custom_pin.x, custom_pin.y] if has_custom_pin else [],
	}


func restore_state(value: Variant) -> void:
	## Legacy combined restore used by old saves and historical verification.
	reset()
	if not (value is Dictionary):
		return
	var data: Dictionary = value
	_restore_profile_fields(data)
	_restore_world_fields(data)


func restore_profile_state(value: Variant) -> void:
	reset_profile()
	_ensure_stage8_actions()
	if not (value is Dictionary):
		return
	_restore_profile_fields(value)


func restore_world_state(value: Variant) -> void:
	reset_world_state()
	if not (value is Dictionary):
		return
	_restore_world_fields(value)


func _restore_profile_fields(data: Dictionary) -> void:
	var saved_settings: Variant = data.get("settings", {})
	if saved_settings is Dictionary:
		for key in saved_settings:
			set_setting(str(key), saved_settings[key])
	_restore_bindings(data.get("bindings", {}))
	settings_changed.emit()


func _restore_world_fields(data: Dictionary) -> void:
	for hint_id in data.get("completed_hints", []):
		completed_hints[str(hint_id)] = true
	discovered_anchors.clear()
	for anchor_id in data.get("discovered_anchors", ["spawn"]):
		if str(anchor_id) in MAP_ANCHORS:
			discovered_anchors[str(anchor_id)] = true
	discovered_anchors["spawn"] = true
	discovered_sites.clear()
	var saved_sites: Variant = data.get("discovered_sites", {})
	if saved_sites is Dictionary:
		for site_id in saved_sites:
			var site: Variant = saved_sites[site_id]
			if site is Dictionary:
				discovered_sites[str(site_id)] = site.duplicate(true)
	var pin: Variant = data.get("custom_pin", [])
	if pin is Array and pin.size() == 2:
		custom_pin = Vector2(float(pin[0]), float(pin[1]))
		has_custom_pin = true
	learning_changed.emit()
	map_changed.emit()


func _serialize_bindings() -> Dictionary:
	var result := {}
	for action in REBINDABLE_ACTIONS:
		var entries: Array[Dictionary] = []
		for event in InputMap.action_get_events(action):
			var encoded := _encode_event(event)
			if not encoded.is_empty():
				entries.append(encoded)
		result[action] = entries
	return result


func _encode_event(event: InputEvent) -> Dictionary:
	if event is InputEventKey:
		return {"type": "key", "keycode": event.keycode}
	if event is InputEventMouseButton:
		return {"type": "mouse", "button": event.button_index}
	if event is InputEventJoypadButton:
		return {"type": "joy_button", "button": event.button_index}
	if event is InputEventJoypadMotion:
		return {"type": "joy_axis", "axis": event.axis, "value": event.axis_value}
	return {}


func _restore_bindings(value: Variant) -> void:
	if not (value is Dictionary):
		return
	var saved: Dictionary = value
	for action in saved:
		if str(action) not in REBINDABLE_ACTIONS or not (saved[action] is Array):
			continue
		InputMap.action_erase_events(str(action))
		for entry_value in saved[action]:
			if not (entry_value is Dictionary):
				continue
			var event := _decode_event(entry_value)
			if event != null:
				InputMap.action_add_event(str(action), event)
	bindings_changed.emit()


func _decode_event(entry: Dictionary) -> InputEvent:
	match str(entry.get("type", "")):
		"key":
			var key := InputEventKey.new()
			key.keycode = int(entry.get("keycode", 0))
			return key
		"mouse":
			var mouse := InputEventMouseButton.new()
			mouse.button_index = int(entry.get("button", 0))
			return mouse
		"joy_button":
			var button := InputEventJoypadButton.new()
			button.button_index = int(entry.get("button", 0))
			return button
		"joy_axis":
			var axis := InputEventJoypadMotion.new()
			axis.axis = int(entry.get("axis", 0))
			axis.axis_value = float(entry.get("value", 0.0))
			return axis
	return null
