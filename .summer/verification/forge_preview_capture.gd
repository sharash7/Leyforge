extends Node
## Human-inspectable evidence capture for representative Forge live previews.

const ForgeHostScene = preload("res://forge_runtime_host.tscn")
const CAPTURE_ROOT := "res://.summer/verification/artifacts/forge_preview"
const STUDIO_IDS := [
	"home", "library_create", "items_blocks", "structures",
	"characters", "vfx", "audio", "test_delivery",
]

var failures: Array[String] = []
var captures := PackedStringArray()


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	ForgeAccessPolicy.test_override = true
	var directory_error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(CAPTURE_ROOT))
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		failures.append("Could not create preview capture directory.")
		_finish()
		return
	var host := ForgeHostScene.instantiate()
	add_child(host)
	await get_tree().process_frame
	await get_tree().process_frame
	var workspace: ForgeWorkspace = host.get_node("ForgeWorkspace")
	var visible_size := get_viewport().get_visible_rect().size
	for scroll_name in [
		"ForgeNavigationScroll", "ForgePageScroll", "ForgePreviewScroll",
	]:
		var scroll := workspace.find_child(scroll_name, true, false)
		if not scroll is ScrollContainer:
			failures.append("%s is missing." % scroll_name)
			continue
		var scroll_container: ScrollContainer = scroll
		var scroll_end: Vector2 = (
			scroll_container.global_position + scroll_container.size)
		if scroll_end.x > visible_size.x + 1.0 \
				or scroll_end.y > visible_size.y + 1.0:
			failures.append("%s extends outside the viewport." % scroll_name)
	for child in workspace.find_children("*", "Button", true, false):
		if child.text in ["←", "↑", "↓", "→"]:
			if child.global_position.y + child.size.y > visible_size.y \
					or child.global_position.x + child.size.x > visible_size.x:
				failures.append("%s control is outside the viewport." % child.text)
	await _capture_hubs(workspace, "runtime")
	await _capture_representative_pages(workspace, "runtime")
	await _capture_asset(
		workspace, "forge_asset.terrain.grass.basic", "grass_cube", true)
	await _capture_asset(
		workspace, "forge_asset.construction.brick.stone", "stone_brick")
	await _capture_asset(
		workspace, "forge_asset.automation.transport.chute", "wooden_chute")
	await _capture_asset(
		workspace, "forge_asset.item.tool.crude_pickaxe", "crude_pickaxe")
	await _capture_asset(
		workspace, "forge_asset.functional.furnace.stone", "stone_furnace")
	await _capture_active_furnace(workspace)
	await _capture_asset(
		workspace, "forge_asset.magic.conduit.mana_basic", "mana_conduit")
	await _capture_asset(
		workspace, "forge_asset.automation.crusher.basic", "basic_crusher")
	await _capture_compact_runtime(workspace)
	host.queue_free()
	await get_tree().process_frame
	var editor_host := Control.new()
	editor_host.name = "EditorHostCapture"
	editor_host.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(editor_host)
	var editor_workspace := ForgeWorkspace.new()
	editor_workspace.name = "LeyforgeForge"
	editor_workspace.host_mode = "editor"
	editor_workspace.hide()
	editor_host.add_child(editor_workspace)
	ForgeEditorHostLayout.fill(editor_workspace)
	await get_tree().process_frame
	await get_tree().process_frame
	editor_workspace.show()
	editor_workspace.refresh_host_layout()
	await get_tree().process_frame
	await get_tree().process_frame
	await _capture_hubs(editor_workspace, "editor")
	await _capture_representative_pages(editor_workspace, "editor")
	editor_host.queue_free()
	await get_tree().process_frame
	ForgeAccessPolicy.clear_test_override()
	_finish()


func _capture_hubs(workspace: ForgeWorkspace, host_label: String) -> void:
	for section_id in STUDIO_IDS:
		workspace.open_section(section_id)
		workspace.refresh_host_layout()
		await get_tree().process_frame
		await get_tree().process_frame
		var cards := workspace.find_child(
			"ForgeStudioWorkflowCards", true, false)
		var routes := ForgeNavigationCatalog.routes_for_section(section_id)
		if not cards is GridContainer or cards.get_child_count() != routes.size():
			failures.append("%s %s workflow cards are missing." % [
				host_label, section_id])
		else:
			for card in cards.get_children():
				if card.size.x < 245.0 or card.size.y < 96.0:
					failures.append("%s %s workflow card collapsed." % [
						host_label, section_id])
					break
		await RenderingServer.frame_post_draw
		_save_image(get_viewport().get_texture().get_image(),
			"%s_hub_%s.png" % [host_label, section_id])


func _capture_representative_pages(
		workspace: ForgeWorkspace, host_label: String) -> void:
	var record := workspace.asset_index.record_for_source_id(
		"forge_asset.terrain.grass.basic")
	workspace._open_record(record)
	await get_tree().process_frame
	workspace.open_route("block_surface")
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	_save_image(get_viewport().get_texture().get_image(),
		"%s_author_block_surface.png" % host_label)
	workspace.open_route("materials")
	await get_tree().process_frame
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	_save_image(get_viewport().get_texture().get_image(),
		"%s_author_materials.png" % host_label)
	workspace.open_route("validation")
	await get_tree().process_frame
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	_save_image(get_viewport().get_texture().get_image(),
		"%s_delivery_validation.png" % host_label)


func _capture_compact_runtime(workspace: ForgeWorkspace) -> void:
	var window := get_window()
	var original_size := window.size
	window.size = Vector2i(1280, 720)
	await get_tree().process_frame
	await get_tree().process_frame
	workspace.open_section("home")
	await get_tree().process_frame
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	_save_image(get_viewport().get_texture().get_image(),
		"runtime_compact_home_1280x720.png")
	var record := workspace.asset_index.record_for_source_id(
		"forge_asset.terrain.grass.basic")
	workspace._open_record(record)
	await get_tree().process_frame
	workspace.open_route("block_surface")
	await get_tree().process_frame
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	_save_image(get_viewport().get_texture().get_image(),
		"runtime_compact_author_1280x720.png")
	window.size = original_size
	await get_tree().process_frame
	await get_tree().process_frame


func _capture_asset(
		workspace: ForgeWorkspace, source_id: String, label: String,
		capture_workspace := false) -> void:
	var record := workspace.asset_index.record_for_source_id(source_id)
	workspace._open_record(record)
	await get_tree().process_frame
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	var preview_image := workspace._preview._viewport.get_texture().get_image()
	_save_image(preview_image, "%s_preview.png" % label)
	if capture_workspace:
		var workspace_image := get_viewport().get_texture().get_image()
		_save_image(workspace_image, "%s_workspace.png" % label)


func _capture_active_furnace(workspace: ForgeWorkspace) -> void:
	workspace._preview.show_runtime_package(
		"functional.furnace.stone", 1)
	await get_tree().process_frame
	var presentation := workspace._preview._presentation_root.get_child(0) \
		if workspace._preview._presentation_root.get_child_count() > 0 \
		else null
	if presentation == null:
		failures.append("Active furnace presentation could not be loaded.")
		return
	var adapter := presentation.get_node_or_null("StateAdapter")
	if adapter is ForgeStateAdapter:
		adapter.apply_snapshot({
			"processing": true,
			"blocked": false,
			"damaged": 0.0,
		})
	else:
		failures.append("Active furnace has no state adapter.")
		return
	await get_tree().create_timer(0.3).timeout
	await RenderingServer.frame_post_draw
	var image := workspace._preview._viewport.get_texture().get_image()
	_save_image(image, "stone_furnace_active_preview.png")


func _save_image(image: Image, filename: String) -> void:
	if image == null or image.is_empty():
		failures.append("%s was empty." % filename)
		return
	var path := CAPTURE_ROOT.path_join(filename)
	var save_error := image.save_png(ProjectSettings.globalize_path(path))
	if save_error != OK:
		failures.append("%s: %s" % [filename, error_string(save_error)])
		return
	captures.append(path)


func _finish() -> void:
	var report := {
		"ok": failures.is_empty(),
		"captures": Array(captures),
		"failures": failures,
	}
	print("FORGE_PREVIEW_CAPTURE %s" % JSON.stringify(report))
	get_tree().quit(0 if failures.is_empty() else 1)
