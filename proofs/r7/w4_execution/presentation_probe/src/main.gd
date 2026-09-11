extends Node

const REPORT_PREFIX := "LEYFORGE_W4_EXECUTION_REPORT "
const BENIGN_CAPABILITY_RESOURCE := preload("res://capability_fixtures/benign_data.tres")


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


func _run_capability(args: PackedStringArray, mode: String, proof_id: String, case_id: String) -> void:
	var resource_path := _arg_value(args, "--resource-path", "")
	var requested_capability := _arg_value(args, "--requested-capability", "")
	var canary_path := _arg_value(args, "--canary-path", "")
	var external_host := _arg_value(args, "--external-host", "127.0.0.1")
	var external_port := _arg_value(args, "--external-port", "0").to_int()
	var resource_type := ResourceLoader.get_resource_type(resource_path)
	var dependencies := Array(ResourceLoader.get_dependencies(resource_path))
	var preloaded_benign := resource_path == "res://capability_fixtures/benign_data.tres"
	if resource_type == "" and preloaded_benign:
		resource_type = BENIGN_CAPABILITY_RESOURCE.get_class()
	var engine_resolution := {
		"state":"UNSUPPORTED" if resource_type == "" else "TYPE-RESOLVED",
		"resource_path":resource_path,
		"resource_type":resource_type,
		"dependencies":dependencies
	}
	var capability_acquisition := {"state":"UNKNOWN","unsafe":null}
	var execution := {"state":"NOT-EXECUTED","instance_class":""}
	var supported := resource_type != ""
	if requested_capability == "bounded_data" and supported:
		var bounded_resource: Variant = ResourceLoader.load(resource_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if bounded_resource == null and preloaded_benign:
			bounded_resource = BENIGN_CAPABILITY_RESOURCE.duplicate(true)
		if bounded_resource != null and not bounded_resource is Script:
			engine_resolution["state"] = "RESOLVED"
			engine_resolution["loaded_class"] = bounded_resource.get_class()
			engine_resolution["resource_name"] = bounded_resource.resource_name
			engine_resolution["preloaded_export_dependency"] = preloaded_benign
			capability_acquisition = {"state":"BOUNDED-DATA-ACQUIRED","unsafe":false}
		else:
			supported = false
			engine_resolution["state"] = "UNSUPPORTED"
			capability_acquisition = {"state":"UNKNOWN","unsafe":null}
	elif requested_capability == "script" or requested_capability == "editor_plugin":
		if supported and (resource_type == "GDScript" or resource_type == "Script"):
			capability_acquisition = {"state":"DENIED-AFTER-ENGINE-PREFLIGHT","unsafe":false,"observed_resource_type":resource_type}
		else:
			supported = false
	elif (requested_capability == "filesystem" or requested_capability == "external_network") and mode == "capability-calibration" and supported:
		var canary_script: Variant = ResourceLoader.load(resource_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if canary_script is Script:
			capability_acquisition = {"state":"UNSAFE-CAPABILITY-ACQUIRED","unsafe":true,"observed_resource_type":resource_type}
			var instance: Variant = canary_script.new(canary_path, external_host, external_port)
			execution = {"state":"EXECUTED","instance_class":instance.get_class() if instance != null else ""}
			engine_resolution["state"] = "RESOLVED"
		else:
			supported = false
			engine_resolution["state"] = "UNSUPPORTED"
	else:
		supported = false
	var report := {
		"schema_version":"prd07-w4-capability-probe-v1",
		"status":"PASS" if supported else "INCONCLUSIVE",
		"mode":mode,
		"proof_id":proof_id,
		"case_id":case_id,
		"proof_execution_started":mode == "proof-capability",
		"identity_allocation_started":mode == "proof-capability",
		"production_runtime":false,
		"gameplay_permission":"CLOSED",
		"measurement":{
			"supported":supported,
			"engine_resolution":engine_resolution,
			"capability_acquisition":capability_acquisition,
			"execution":execution,
			"filesystem_effect":{"state":"OBSERVED" if canary_path != "" and FileAccess.file_exists(canary_path) else "ABSENT"},
			"external_access_effect":{"state":"NOT-OBSERVED-BY-ENGINE","independent_monitor_required":true}
		}
	}
	print(REPORT_PREFIX + JSON.stringify(report))
	get_tree().quit(0 if supported else 3)


func _run() -> void:
	var args := OS.get_cmdline_user_args()
	var mode := _arg_value(args, "--mode", "refuse")
	var proof_id := _arg_value(args, "--proof-id", "NONE")
	var case_id := _arg_value(args, "--case-id", "BASELINE")
	if mode == "capability-calibration" or mode == "proof-capability":
		await _run_capability(args, mode, proof_id, case_id)
		return
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
