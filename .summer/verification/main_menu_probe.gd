extends Node
## Menu surface, seed preview, and gameplay-scene ownership.

const MenuScene := preload("res://main_menu.tscn")
const GameScene := preload("res://main.tscn")

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var game = GameScene.instantiate()
	for child_name in [
		"VoxelWorld", "HamletRuntime", "RaidRuntime", "Player", "HUD",
	]:
		_check(
			game.has_node(NodePath(child_name)),
			"gameplay-owned main.tscn lost %s" % child_name)
	game.queue_free()

	ForgeAccessPolicy.test_override = true
	var menu = MenuScene.instantiate()
	add_child(menu)
	await get_tree().process_frame
	var button_texts: Array[String] = []
	_collect_button_text(menu, button_texts)
	for expected in [
		"Continue", "Worlds", "New World", "Settings & Accessibility",
		"Controls", "Developer Tools", "Quit",
	]:
		_check(expected in button_texts, "menu omitted %s" % expected)
	_check(menu._page_scroll != null, "menu content is not scrollable")
	_check(menu._dialog != null, "menu has no visible error boundary")
	_check(menu._delete_dialog != null, "menu has no world-delete confirmation")
	var deletion_card: Control = menu._world_card({
		"world_id": "world-probe-delete",
		"name": "Delete Probe",
		"validation_result": "valid",
		"save_health": "new_world",
		"save_version": WorldManager.CURRENT_SAVE_VERSION,
	})
	button_texts.clear()
	_collect_button_text(deletion_card, button_texts)
	_check("Delete" in button_texts, "world card omitted the delete action")
	menu._request_delete_world({
		"world_id": "world-probe-delete", "name": "Delete Probe"})
	_check(str(menu._pending_delete_world.get("world_id", "")) \
			== "world-probe-delete" and "Delete Probe" in menu._delete_dialog.dialog_text,
		"delete action did not require named-world confirmation")
	menu._cancel_delete_world()
	_check(menu._pending_delete_world.is_empty(),
		"cancelled world deletion retained a pending target")
	deletion_card.queue_free()

	menu._show_new_world()
	await get_tree().process_frame
	_check(menu._world_name != null, "new-world name field is missing")
	_check(menu._seed_entry != null, "new-world seed field is missing")
	menu._seed_entry.text = "CaseSensitive Seed"
	menu._refresh_seed_preview()
	var expected_seed := int(WorldManager.resolve_seed(
		"CaseSensitive Seed")["resolved"])
	_check(
		str(expected_seed) in menu._seed_preview.text,
		"text seed preview did not show its resolved seed")
	_check(
		"Valid plan:" in menu._create_status.text,
		"new-world seed was not validated before creation")
	menu._show_settings()
	await get_tree().process_frame
	_check(
		"global player profile" in _all_label_text(menu),
		"settings page does not explain global persistence")
	menu._show_controls()
	await get_tree().process_frame
	_check(
		menu._binding_buttons.size() == UIState.REBINDABLE_ACTIONS.size(),
		"controls page omitted rebindable actions")
	menu._show_developer_tools()
	await get_tree().process_frame
	button_texts.clear()
	_collect_button_text(menu, button_texts)
	_check(
		"Leyforge Forge" in button_texts,
		"developer tools page omitted Leyforge Forge")
	_check(
		ResourceLoader.exists("res://forge_runtime_host.tscn"),
		"Leyforge Forge runtime host scene is missing")
	menu.queue_free()
	await get_tree().process_frame

	ForgeAccessPolicy.test_override = false
	var release_menu = MenuScene.instantiate()
	add_child(release_menu)
	await get_tree().process_frame
	button_texts.clear()
	_collect_button_text(release_menu, button_texts)
	_check(
		"Developer Tools" not in button_texts,
		"developer tools leaked into a non-development menu")
	release_menu.queue_free()
	ForgeAccessPolicy.clear_test_override()

	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}
	print("MAIN_MENU_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if failures.is_empty() else 1)


func _collect_button_text(node: Node, out: Array[String]) -> void:
	if node is Button:
		out.append(node.text)
	for child in node.get_children():
		_collect_button_text(child, out)


func _all_label_text(node: Node) -> String:
	var parts: Array[String] = []
	_collect_label_text(node, parts)
	return "\n".join(parts)


func _collect_label_text(node: Node, out: Array[String]) -> void:
	if node is Label:
		out.append(node.text)
	for child in node.get_children():
		_collect_label_text(child, out)
