@tool
extends EditorPlugin

var _workspace: ForgeWorkspace
var _main_screen: Control


func _enter_tree() -> void:
	_workspace = ForgeWorkspace.new()
	_workspace.name = "VoxelAssetForge"
	_workspace.host_mode = "editor"
	_workspace.hide()
	_main_screen = get_editor_interface().get_editor_main_screen()
	_main_screen.add_child(_workspace)
	_main_screen.resized.connect(_sync_workspace_rect)
	_sync_workspace_rect()


func _exit_tree() -> void:
	if is_instance_valid(_main_screen) \
			and _main_screen.resized.is_connected(_sync_workspace_rect):
		_main_screen.resized.disconnect(_sync_workspace_rect)
	if is_instance_valid(_workspace):
		_workspace.queue_free()
	_main_screen = null


func _has_main_screen() -> bool:
	return true


func _make_visible(visible: bool) -> void:
	if is_instance_valid(_workspace):
		_workspace.visible = visible
		if visible:
			_sync_workspace_rect()
			call_deferred("_sync_workspace_rect")


func _sync_workspace_rect() -> void:
	if not is_instance_valid(_workspace) \
			or not is_instance_valid(_main_screen):
		return
	# Editor main-screen children do not receive Container layout. Explicit
	# full-rect anchors and zero offsets keep the shared workspace filling the
	# editor when play mode or dock changes resize the available centre panel.
	ForgeEditorHostLayout.fill(_workspace)


func _get_plugin_name() -> String:
	return "Voxel Asset Forge"


func _get_plugin_icon() -> Texture2D:
	return get_editor_interface().get_base_control().get_theme_icon(
		"MeshInstance3D", "EditorIcons")
