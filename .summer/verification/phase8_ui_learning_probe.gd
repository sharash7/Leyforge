extends Node

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _has_keyboard_binding(action: String) -> bool:
	for event in InputMap.action_get_events(action):
		if event is InputEventKey or event is InputEventMouseButton:
			return true
	return false


func _has_controller_binding(action: String) -> bool:
	for event in InputMap.action_get_events(action):
		if event is InputEventJoypadButton or event is InputEventJoypadMotion:
			return true
	return false


func _run() -> void:
	var main: Node3D = load("res://main.tscn").instantiate()
	add_child(main)
	await get_tree().process_frame
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	var hud: Hud = main.get_node("HUD")

	# Stage 8 input and accessibility profile.
	_check(hud.session == main, "HUD did not receive the save/session command boundary")
	_check(UIState.settings.has("ui_scale")
			and UIState.settings.has("captions")
			and UIState.settings.has("reduced_motion")
			and UIState.settings.has("high_contrast")
			and UIState.settings.has("aim_assist"),
		"accessibility profile omitted a required POC setting")
	for action in [
		"move_forward", "move_back", "move_left", "move_right", "jump", "sprint",
		"break_block", "place_block", "toggle_inventory", "toggle_craft",
		"toggle_guide", "toggle_map", "toggle_village",
		"toggle_action_bar", "toggle_abilities",
		"hotbar_previous", "hotbar_next",
	]:
		_check(InputMap.has_action(action), "missing Stage 8 action %s" % action)
		_check(_has_keyboard_binding(action), "%s has no keyboard/mouse binding" % action)
		_check(_has_controller_binding(action), "%s has no controller binding" % action)
	for action in ["look_left", "look_right", "look_up", "look_down"]:
		_check(InputMap.has_action(action) and _has_controller_binding(action),
			"controller look action %s is unavailable" % action)

	var original_ui := UIState.serialize_state()
	var remap := InputEventKey.new()
	remap.keycode = KEY_F8
	_check(UIState.rebind_action("toggle_map", remap),
		"runtime input rebinding rejected a valid keyboard event")
	_check("F8" in UIState.binding_text("toggle_map")
			and "/" in UIState.binding_text("toggle_map")
			and _has_controller_binding("toggle_map"),
		"device-family rebinding removed or hid either input profile")
	var conflicting_remap := InputEventKey.new()
	conflicting_remap.keycode = KEY_F8
	UIState.rebind_action("toggle_guide", conflicting_remap)
	_check("Guide / Help" in UIState.binding_conflicts("toggle_map"),
		"controls profile did not expose an input binding conflict")
	var rebound_save := UIState.serialize_state()
	UIState.restore_state(rebound_save)
	_check("F8" in UIState.binding_text("toggle_map"),
		"remapped input did not survive UI state serialization")
	UIState.restore_state(original_ui)

	_check(UIState.set_setting("ui_scale", 1.3)
			and is_equal_approx(UIState.setting_float("ui_scale"), 1.3),
		"UI scale did not accept a valid accessible value")
	_check(UIState.set_setting("high_contrast", true)
			and UIState.setting_bool("high_contrast"),
		"high-contrast presentation setting did not apply")
	_check(UIState.set_setting("reduced_motion", true)
			and UIState.setting_bool("reduced_motion"),
		"reduced-motion presentation setting did not apply")
	_check(is_equal_approx(get_window().content_scale_factor, 1.3),
		"HUD did not live-preview the saved UI/text scale")

	# The connected learning model derives steps from authoritative state rather
	# than maintaining a second quest truth inside the HUD.
	ProgressionState.reset()
	HamletState.initialized = false
	HamletState.initialize(world.world_seed, world.get_valley_anchors())
	MagicState.reset()
	CombatState.reset_raid()
	_check(str(UIState.current_objective().get("id", "")) == "gather",
		"fresh first-time flow did not begin with gathering")
	ProgressionState.record_harvest("resource.log.oak", 1)
	_check(str(UIState.current_objective().get("id", "")) == "craft",
		"gathering did not advance the learning flow to crafting")
	ProgressionState.record_craft(
		"recipe.hand.planks_oak", "construction.plank.oak", 1)
	_check(str(UIState.current_objective().get("id", "")) == "meet_elder",
		"crafting did not advance the learning flow to village discovery")
	HamletState.accept_introduction()
	_check(str(UIState.current_objective().get("id", "")) == "supply_project",
		"elder introduction did not expose the authoritative watchtower supply step")
	HamletState.project["complete"] = true
	_check(str(UIState.current_objective().get("id", "")) == "automate",
		"completed watchtower did not expose the conserved automation learning step")
	HamletState.delivery_ledger.append({
		"mode": "donation", "count": 1,
		"stable_id": "item.resource.iron_ingot",
	})
	_check(str(UIState.current_objective().get("id", "")) == "learn_magic",
		"automation contribution did not advance the learning flow to mana discovery")
	MagicState.unlock_poc_magic("probe.stage8")
	_check(str(UIState.current_objective().get("id", "")) == "prepare_raid",
		"magic knowledge did not advance the learning flow to raid preparation")
	CombatState.phase = "warning"
	_check(str(UIState.current_objective().get("id", "")) == "defend",
		"raid warning did not reprioritise the learning flow to defence")
	CombatState.phase = "resolved"
	CombatState.outcome = {"title": "Costly Victory"}
	CombatState.damage_records = [{
		"id": "probe.damage", "repaired": false,
		"position": [], "original_block": "",
	}]
	_check(str(UIState.current_objective().get("id", "")) == "repair",
		"persistent raid damage did not advance the flow to repair")
	CombatState.damage_records.clear()
	_check(str(UIState.current_objective().get("id", "")) == "complete",
		"resolved and repaired raid did not complete the connected loop")

	# HUD screens and focus/back paths are generated without main.tscn changes.
	for mode in [
		"guide", "inventory", "village", "map", "raid", "pause",
		"settings", "controls", "help",
	]:
		hud._open_mode(mode, Vector3i.ZERO)
		hud._refresh_all()
		await get_tree().process_frame
		_check(hud.craft_open and hud.craft_mode == mode,
			"%s screen could not be opened through the shared route" % mode)
		var focus_owner := get_viewport().gui_get_focus_owner()
		_check(focus_owner != null and focus_owner.is_visible_in_tree(),
			"%s screen did not establish controller/keyboard focus" % mode)
	hud._set_craft_open(false)
	_check(not hud.craft_open and not player.controls_locked,
		"shared back path did not restore gameplay controls")

	hud._open_mode("map", Vector3i.ZERO)
	UIState.update_world_discovery(player.global_position, world.get_valley_anchors())
	UIState.discover_anchor("hamlet")
	UIState.set_custom_pin(Vector2(12.0, -8.0))
	hud._refresh_map()
	_check(hud._map_view != null and hud._map_view.has_custom_pin
			and hud._map_view.objective_anchor == "hamlet"
			or not hud._map_view.objective_anchor.is_empty(),
		"local map did not show discovered knowledge, a custom pin, and the tracked goal")
	_check("landmarks discovered" in hud._map_summary.text,
		"map summary did not explain discovery state")

	hud._open_mode("village", Vector3i.ZERO)
	hud._refresh_stage8()
	_check("PERMISSIONS" in hud._village_project.text
			and ("[OPEN]" in hud._village_project.text
				or "[LOCKED]" in hud._village_project.text),
		"village overview omitted explicit non-colour permission reasons")
	hud._open_mode("raid", Vector3i.ZERO)
	hud._refresh_stage8()
	_check("CAUSE" in hud._raid_details.text
			and "CONSEQUENCES" in hud._raid_details.text
			and "FOLLOW-UP" in hud._raid_details.text,
		"aftermath screen did not explain cause, consequence, and recovery")

	# Screen registry basics: searchable inventory, replayable help, saved state,
	# adaptive mana reveal, and truthful save feedback are all present.
	_check(hud._inventory_search != null and hud._inventory_list != null,
		"inventory screen omitted search/filter-lite or item details")
	_check(hud._help_list.item_count == UIState.tutorial_entries().size()
			and hud._help_list.item_count >= 8,
		"help screen omitted replayable system tutorials")
	_check(hud._binding_buttons.size() >= 12,
		"controls screen omitted the core remappable action set")
	_check(hud._save_status_label != null and hud._pause_status != null,
		"pause flow omitted truthful save status presentation")
	_check(hud._mana_pips.visible == ProgressionState.has_basic_magic_knowledge(),
		"mana HUD did not follow discovery knowledge")
	var saved := UIState.serialize_state()
	_check(saved.get("settings", {}) is Dictionary
			and saved.get("bindings", {}) is Dictionary
			and saved.get("discovered_anchors", []) is Array,
		"Stage 8 UI state omitted settings, bindings, or map knowledge")

	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}
	print("PHASE8_UI_LEARNING_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
