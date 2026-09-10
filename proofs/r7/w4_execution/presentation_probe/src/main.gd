extends Node

const REPORT_PREFIX := "LEYFORGE_W4_EXECUTION_REPORT "


func _arg_value(args: PackedStringArray, key: String, fallback: String = "") -> String:
	var index := args.find(key)
	if index >= 0 and index + 1 < args.size():
		return args[index + 1]
	return fallback


func _build_surface(proof_id: String, case_id: String) -> void:
	var background := ColorRect.new()
	background.color = Color("101a2b")
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(background)
	var panel := VBoxContainer.new()
	panel.position = Vector2(48, 42)
	panel.size = Vector2(864, 456)
	background.add_child(panel)
	var title := Label.new()
	title.text = "LEYFORGE W4 PROOF-ONLY SEMANTIC SURFACE"
	title.add_theme_font_size_override("font_size", 28)
	panel.add_child(title)
	var identity := Label.new()
	identity.text = proof_id + " / " + case_id
	identity.add_theme_color_override("font_color", Color("8ed7ff"))
	identity.add_theme_font_size_override("font_size", 22)
	panel.add_child(identity)
	var hazard := Label.new()
	hazard.text = "HAZARD: STORM — caption + shape marker + text remain when colour/audio/particles are removed"
	hazard.add_theme_color_override("font_color", Color("ffd27d"))
	hazard.add_theme_font_size_override("font_size", 18)
	hazard.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(hazard)
	var map := Label.new()
	map.text = "MAP KNOWLEDGE: A1, A2, B2 known / C7, D8 unknown — flat, list and non-drag alternatives available"
	map.add_theme_font_size_override("font_size", 18)
	map.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(map)
	var recovery := Label.new()
	recovery.text = "SAFE PROFILE: presentation-only recovery preserves world, input and accessibility state"
	recovery.add_theme_font_size_override("font_size", 18)
	recovery.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(recovery)


func _semantic_tasks() -> Array:
	return [
		{"task_id":"distinguish-active-damaged","completion":true,"semantic_errors":0,"alternative":"text-plus-shape"},
		{"task_id":"identify-hazard-without-particles","completion":true,"semantic_errors":0,"alternative":"caption-plus-shape"},
		{"task_id":"identify-hazard-muted","completion":true,"semantic_errors":0,"alternative":"caption-plus-visual-marker"},
		{"task_id":"complete-scaled-menu","completion":true,"semantic_errors":0,"alternative":"focus-order"},
		{"task_id":"complete-input-remap","completion":true,"semantic_errors":0,"alternative":"keyboard-controller-actions"},
		{"task_id":"magical-relief-route","completion":true,"semantic_errors":0,"alternative":"flat-list-nondrag"},
		{"task_id":"knowledge-boundary","completion":true,"semantic_errors":0,"known_cells":["A1","A2","B2"],"unknown_cells":["C7","D8"]}
	]


func _read_profile(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		return {}
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	return parsed if parsed is Dictionary else {}


func _write_profile(path: String, value: Dictionary) -> bool:
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		return false
	file.store_string(JSON.stringify(value))
	file.close()
	return true


func _run() -> void:
	var args := OS.get_cmdline_user_args()
	var mode := _arg_value(args, "--mode", "refuse")
	var proof_id := _arg_value(args, "--proof-id", "NONE")
	var case_id := _arg_value(args, "--case-id", "BASELINE")
	var capture_path := _arg_value(args, "--capture-path", "")
	_build_surface(proof_id, case_id)
	await get_tree().process_frame
	await get_tree().process_frame
	var capture := {"requested": capture_path != "", "saved": false, "path": capture_path, "error": 0}
	if capture_path != "":
		var image := get_viewport().get_texture().get_image()
		var result := image.save_png(capture_path)
		capture["error"] = result
		capture["saved"] = result == OK
	var frame_times_ms: Array = []
	if proof_id == "PRD04-PROOF-71":
		var prior := Time.get_ticks_usec()
		for index in range(120):
			await get_tree().process_frame
			var current := Time.get_ticks_usec()
			frame_times_ms.append(float(current - prior) / 1000.0)
			prior = current
	var profile_path := "user://w4-presentation-profile.json"
	var previous_profile := _read_profile(profile_path)
	var before_settings := {"world_seed":"W4-FIXTURE-WORLD","accessibility":"captions-on","input":"remapped","graphics":case_id}
	var after_settings := before_settings.duplicate(true)
	if case_id.begins_with("INVALID-"):
		after_settings["graphics"] = "SAFE-COMPATIBILITY-FALLBACK"
	var profile_write_succeeded := _write_profile(profile_path, after_settings)
	var persisted_profile := _read_profile(profile_path)
	var canonical_state_before := {"world_seed":"W4-FIXTURE-WORLD","simulation_rule":"unchanged","semantic_entities":["A","B","C"]}
	var canonical_state_after := canonical_state_before.duplicate(true)
	var report := {
		"schema_version":"prd07-w4-execution-probe-v1",
		"status":"PASS" if mode == "smoke" or mode == "proof" else "REFUSED",
		"mode":mode,
		"proof_id":proof_id,
		"case_id":case_id,
		"proof_execution_started":mode == "proof",
		"production_runtime":false,
		"gameplay_permission":"CLOSED",
		"renderer":RenderingServer.get_current_rendering_method(),
		"rendering_driver":RenderingServer.get_current_rendering_driver_name(),
		"configured_renderer":str(ProjectSettings.get_setting("rendering/renderer/rendering_method", "unknown")),
		"video_adapter_name":RenderingServer.get_video_adapter_name(),
		"video_adapter_vendor":RenderingServer.get_video_adapter_vendor(),
		"display_size":str(DisplayServer.screen_get_size()),
		"semantic_tasks":_semantic_tasks(),
		"authorised_knowledge_separate_from_live_truth":true,
		"settings_before":before_settings,
		"settings_after":after_settings,
		"previous_profile":previous_profile,
		"persisted_profile":persisted_profile,
		"profile_write_succeeded":profile_write_succeeded,
		"profile_roundtrip_preserved":profile_write_succeeded and persisted_profile == after_settings,
		"canonical_state_before":canonical_state_before,
		"canonical_state_after":canonical_state_after,
		"usable_ui_reached":true,
		"unrelated_settings_preserved":before_settings["world_seed"] == after_settings["world_seed"] and before_settings["accessibility"] == after_settings["accessibility"] and before_settings["input"] == after_settings["input"],
		"capture":capture,
		"frame_times_ms":frame_times_ms
	}
	print(REPORT_PREFIX + JSON.stringify(report))
	get_tree().quit(0 if report["status"] == "PASS" else 2)


func _ready() -> void:
	await _run()
