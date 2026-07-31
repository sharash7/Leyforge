extends Control


func _ready() -> void:
	if not ForgeAccessPolicy.is_development_enabled():
		get_tree().change_scene_to_file("res://main_menu.tscn")
