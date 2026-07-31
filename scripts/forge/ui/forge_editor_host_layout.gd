@tool
class_name ForgeEditorHostLayout
extends RefCounted
## Keeps a main-screen EditorPlugin child fitted to Godot's centre panel.


static func fill(workspace: Control) -> void:
	if workspace == null:
		return
	workspace.set_anchors_preset(Control.PRESET_FULL_RECT)
	workspace.offset_left = 0.0
	workspace.offset_top = 0.0
	workspace.offset_right = 0.0
	workspace.offset_bottom = 0.0
