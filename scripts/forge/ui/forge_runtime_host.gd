extends Control

var _workspace: Control
var _host_viewport: Viewport


func _ready() -> void:
	if not ForgeAccessPolicy.is_development_enabled():
		get_tree().change_scene_to_file("res://main_menu.tscn")
		return
	clip_contents = true
	_workspace = get_node_or_null("ForgeWorkspace")
	_host_viewport = get_viewport()
	if is_instance_valid(_host_viewport) \
			and not _host_viewport.size_changed.is_connected(_sync_runtime_rect):
		_host_viewport.size_changed.connect(_sync_runtime_rect)
	_sync_runtime_rect()
	call_deferred("_sync_runtime_rect")


func _exit_tree() -> void:
	if is_instance_valid(_host_viewport) \
			and _host_viewport.size_changed.is_connected(_sync_runtime_rect):
		_host_viewport.size_changed.disconnect(_sync_runtime_rect)


func _sync_runtime_rect() -> void:
	var viewport := get_viewport()
	if not is_instance_valid(viewport):
		return
	# A Control used as the root scene has no parent Control to resolve its
	# full-rect anchors. Size it from the logical viewport explicitly so window,
	# embedded-game and UI-scale changes all produce the same usable rectangle.
	# This is a root Control, so keep its own anchors absolute. Its child workspace
	# uses full-rect anchors against this explicit logical viewport rectangle.
	set_anchors_preset(Control.PRESET_TOP_LEFT)
	# The scene historically used GROW_DIRECTION_BOTH with full anchors. If left
	# unchanged, shrinking a standalone window moves the root by half the size
	# delta and clips its right/bottom edges. Grow from the fixed top-left instead.
	grow_horizontal = Control.GROW_DIRECTION_END
	grow_vertical = Control.GROW_DIRECTION_END
	size = viewport.get_visible_rect().size
	position = Vector2.ZERO
	if is_instance_valid(_workspace):
		_workspace.clip_contents = true
		ForgeEditorHostLayout.fill(_workspace)
