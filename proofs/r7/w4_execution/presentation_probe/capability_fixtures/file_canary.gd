extends RefCounted


func _init(canary_path: String, _external_host: String, _external_port: int) -> void:
	if canary_path == "":
		return
	var file := FileAccess.open(canary_path, FileAccess.WRITE)
	if file != null:
		file.store_string("W4-CONTROLLED-FILESYSTEM-CALIBRATION")
		file.close()
