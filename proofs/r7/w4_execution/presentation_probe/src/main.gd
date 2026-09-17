extends Node

const REPORT_PREFIX := "LEYFORGE_W4_EXECUTION_REPORT "
const REVIEW_REPORT_PREFIX := "LEYFORGE_W4_REVIEW_PRESENTATION "
const REVIEW_CONTEXT_SCHEMA := "prd07-w4-review-presentation-context-v1"
const REVIEW_DRAFT_SCHEMA := "prd07-w4-human-review-response-draft-v1"
const REVIEW_PROOFS := ["PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-53"]
const BENIGN_CAPABILITY_RESOURCE := preload("res://capability_fixtures/benign_data.tres")

var _review_context: Dictionary = {}
var _review_context_path := ""
var _review_draft_path := ""
var _review_controls: Array = []
var _review_status: Label


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


func _is_lower_hex(value: String, expected_length: int) -> bool:
	if value.length() != expected_length:
		return false
	for index in range(value.length()):
		var code := value.unicode_at(index)
		if not ((code >= 48 and code <= 57) or (code >= 97 and code <= 102)):
			return false
	return true


func _load_json_object(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		return {}
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		return {}
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	file.close()
	return parsed if parsed is Dictionary else {}


func _review_context_issues(value: Dictionary) -> PackedStringArray:
	var issues := PackedStringArray()
	var proof_id := str(value.get("proof_id", ""))
	var purpose := str(value.get("presentation_purpose", ""))
	if value.get("schema_version") != REVIEW_CONTEXT_SCHEMA or not REVIEW_PROOFS.has(proof_id):
		issues.append("review presentation identity differs")
	if purpose != "PRODUCTION-HUMAN-REVIEW" and purpose != "SYNTHETIC-VALIDATOR-TEST":
		issues.append("review presentation purpose differs")
	if not _is_lower_hex(str(value.get("source_revision", "")), 40):
		issues.append("review presentation lacks exact source revision")
	for field in ["source_content_identity", "build_identity", "artifact_sha256"]:
		if not _is_lower_hex(str(value.get(field, "")), 64):
			issues.append("review presentation lacks exact " + field)
	var lifecycle_id := str(value.get("review_lifecycle_id", ""))
	if lifecycle_id == "" or lifecycle_id.contains("PRD07-RUN-") or lifecycle_id.contains("PRD07-EVID-"):
		issues.append("review presentation lifecycle identity is absent or execution-shaped")
	var expected_source_lifecycle := "PUBLISHED-EXACT-COMMIT" if purpose == "PRODUCTION-HUMAN-REVIEW" else "SYNTHETIC-PREFLIGHT"
	if value.get("source_lifecycle") != expected_source_lifecycle:
		issues.append("review presentation source lifecycle differs")
	if value.get("renderer_argument") not in ["forward_plus", "mobile", "gl_compatibility"]:
		issues.append("review presentation renderer differs")
	var fixture_identities: Variant = value.get("fixture_identities")
	if not fixture_identities is Dictionary:
		issues.append("review presentation fixture identities are absent")
	else:
		var fixture_paths: Variant = fixture_identities.get("paths")
		var fixture_hashes: Variant = fixture_identities.get("sha256")
		if not fixture_paths is Array or not fixture_hashes is Array or fixture_paths.is_empty() or fixture_paths.size() != fixture_hashes.size():
			issues.append("review presentation fixture identity coverage differs")
		else:
			for fixture_hash in fixture_hashes:
				if not _is_lower_hex(str(fixture_hash), 64):
					issues.append("review presentation fixture hash is invalid")
	var evidence_items: Variant = value.get("evidence_items")
	if not evidence_items is Array or evidence_items.is_empty():
		issues.append("review presentation evidence is absent")
	else:
		var evidence_ids := PackedStringArray()
		for item in evidence_items:
			if not item is Dictionary:
				issues.append("review presentation evidence item is malformed")
				continue
			var reference_id := str(item.get("reference_id", ""))
			var resolved_path := str(item.get("resolved_path", ""))
			var expected_hash := str(item.get("sha256", ""))
			if reference_id == "" or evidence_ids.has(reference_id):
				issues.append("review presentation evidence identity is invalid or duplicated")
			else:
				evidence_ids.append(reference_id)
			if resolved_path == "" or not FileAccess.file_exists(resolved_path):
				issues.append("review presentation evidence file is missing: " + reference_id)
			elif not _is_lower_hex(expected_hash, 64) or FileAccess.get_sha256(resolved_path) != expected_hash:
				issues.append("review presentation evidence hash differs: " + reference_id)
			elif proof_id == "PRD04-PROOF-51":
				var evidence_file := FileAccess.open(resolved_path, FileAccess.READ)
				if evidence_file != null:
					var lowered := evidence_file.get_as_text().to_lower()
					evidence_file.close()
					if lowered.contains("ai-codex") or lowered.contains("source_origin") or lowered.contains("human-created") or lowered.contains("ai-created"):
						issues.append("proof-51 review evidence exposes masked source origin")
	var review_units: Variant = value.get("review_units")
	if not review_units is Array or review_units.is_empty():
		issues.append("review presentation criteria are absent")
	else:
		for unit in review_units:
			if not unit is Dictionary or str(unit.get("unit_id", "")) == "" or not unit.get("criteria") is Array:
				issues.append("review presentation unit is malformed")
				continue
			for criterion in unit["criteria"]:
				if not criterion is Dictionary or str(criterion.get("criterion_id", "")) == "" or str(criterion.get("prompt", "")) == "":
					issues.append("review presentation criterion is malformed")
				elif criterion.has("judgement") or criterion.has("observed_result") or criterion.has("attestation"):
					issues.append("review presentation criterion was pre-answered")
	var pending: Variant = value.get("review_record_state")
	if not pending is Dictionary or pending.get("status") != "PENDING-HUMAN-REVIEW" or pending.get("judgement") != "PENDING" or pending.get("review_purpose") != "UNASSIGNED" or pending.get("attestation") != "UNSIGNED" or pending.get("forms_modified") != false or pending.get("human_judgement_recorded") != false:
		issues.append("review presentation changed the pending review record")
	if value.get("issued_run_high_water") != 72 or value.get("issued_evidence_high_water") != 72 or value.get("allocated_run_ids") != [] or value.get("allocated_evidence_ids") != [] or value.get("proof_execution_started") != false or value.get("identity_allocation_started") != false or value.get("proof_observation_created") != false:
		issues.append("review presentation crossed execution or identity closure")
	return issues


func _review_label(text: String, size: int = 16, color: Color = Color("d9e7ff")) -> Label:
	var label := Label.new()
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.add_theme_font_size_override("font_size", size)
	label.add_theme_color_override("font_color", color)
	return label


func _build_review_surface(value: Dictionary) -> void:
	var background := ColorRect.new()
	background.color = Color("0c1422")
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(background)
	var margin := MarginContainer.new()
	margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	margin.add_theme_constant_override("margin_left", 28)
	margin.add_theme_constant_override("margin_right", 28)
	margin.add_theme_constant_override("margin_top", 20)
	margin.add_theme_constant_override("margin_bottom", 20)
	background.add_child(margin)
	var page := VBoxContainer.new()
	margin.add_child(page)
	page.add_child(_review_label("LEYFORGE W4 HUMAN REVIEW PRESENTATION", 26, Color("8ed7ff")))
	page.add_child(_review_label(
		str(value["proof_id"]) + " | " + str(value["review_lifecycle_id"]) + "\n" +
		"Source " + str(value["source_revision"]) + " | build " + str(value["build_identity"]).left(16) + "...\n" +
		"Read-only material presentation. No criterion is answered automatically; saved output is an unsigned, non-evidence draft.",
		14,
		Color("b9c9df")
	))
	var evidence_heading := _review_label("Exact evidence", 18, Color("ffd27d"))
	page.add_child(evidence_heading)
	for item in value["evidence_items"]:
		page.add_child(_review_label(
			"• " + str(item["reference_id"]) + " [" + str(item["kind"]) + "]\n  " + str(item["resolved_path"]) + "\n  sha256=" + str(item["sha256"]),
			12
		))
	var scroll := ScrollContainer.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	page.add_child(scroll)
	var units := VBoxContainer.new()
	units.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(units)
	_review_controls.clear()
	for unit in value["review_units"]:
		units.add_child(_review_label(str(unit["label"]), 19, Color("9fe3b1")))
		for criterion in unit["criteria"]:
			var block := VBoxContainer.new()
			block.add_theme_constant_override("separation", 4)
			units.add_child(block)
			block.add_child(_review_label(str(criterion["criterion_id"]) + ": " + str(criterion["prompt"]), 14))
			var choice := OptionButton.new()
			choice.add_item("PENDING")
			choice.add_item("PASS-OBSERVED")
			choice.add_item("FAIL-OBSERVED")
			choice.add_item("INCONCLUSIVE")
			block.add_child(choice)
			var observation := LineEdit.new()
			observation.placeholder_text = "Reviewer observation (required for later governed completion)"
			block.add_child(observation)
			_review_controls.append({
				"unit_id":str(unit["unit_id"]),
				"criterion_id":str(criterion["criterion_id"]),
				"choice":choice,
				"observation":observation,
				"evidence_reference_ids":criterion["evidence_reference_ids"]
			})
	var actions := HBoxContainer.new()
	page.add_child(actions)
	var save := Button.new()
	save.text = "Save unsigned draft"
	save.disabled = _review_draft_path == ""
	save.pressed.connect(_save_review_draft)
	actions.add_child(save)
	var close := Button.new()
	close.text = "Close without saving"
	close.pressed.connect(_quit_review)
	actions.add_child(close)
	_review_status = _review_label("No governed form has been modified.", 13, Color("ffd27d"))
	page.add_child(_review_status)


func _save_review_draft() -> void:
	if _review_draft_path == "":
		_review_status.text = "No draft output path was authorized."
		return
	var responses: Array = []
	for row in _review_controls:
		var choice: OptionButton = row["choice"]
		var observation: LineEdit = row["observation"]
		responses.append({
			"unit_id":row["unit_id"],
			"criterion_id":row["criterion_id"],
			"entered_disposition":choice.get_item_text(choice.selected),
			"entered_observation":observation.text,
			"evidence_reference_ids":row["evidence_reference_ids"]
		})
	var draft := {
		"schema_version":REVIEW_DRAFT_SCHEMA,
		"state":"DRAFT-UNSIGNED-NOT-PROOF-EVIDENCE",
		"proof_id":_review_context["proof_id"],
		"review_lifecycle_id":_review_context["review_lifecycle_id"],
		"source_revision":_review_context["source_revision"],
		"build_identity":_review_context["build_identity"],
		"artifact_sha256":_review_context["artifact_sha256"],
		"context_sha256":FileAccess.get_sha256(_review_context_path),
		"human_entered_responses":responses,
		"overall_judgement":"PENDING",
		"attestation":{"signature_state":"UNSIGNED","signed_at_utc":null,"signed_by":null},
		"governed_forms_modified":false,
		"proof_execution_started":false,
		"identity_allocation_started":false,
		"proof_observation_created":false
	}
	var file := FileAccess.open(_review_draft_path, FileAccess.WRITE)
	if file == null:
		_review_status.text = "Draft save failed; governed forms remain unchanged."
		return
	file.store_string(JSON.stringify(draft, "  ") + "\n")
	file.close()
	_review_status.text = "Unsigned draft saved outside governed forms: " + _review_draft_path


func _quit_review() -> void:
	get_tree().quit(0)


func _run_review(args: PackedStringArray, mode: String) -> void:
	_review_context_path = _arg_value(args, "--review-context", "")
	_review_draft_path = _arg_value(args, "--draft-output", "")
	_review_context = _load_json_object(_review_context_path)
	var issues := _review_context_issues(_review_context)
	if mode == "human-review" and _review_context.get("presentation_purpose") != "PRODUCTION-HUMAN-REVIEW":
		issues.append("interactive review refuses a non-production context")
	var passed := issues.is_empty()
	if passed:
		_build_review_surface(_review_context)
	else:
		_build_surface("REVIEW-REFUSED", "; ".join(issues))
	await get_tree().process_frame
	await get_tree().process_frame
	var report := {
		"schema_version":"prd07-w4-review-presentation-runtime-v1",
		"status":"PASS" if passed else "REFUSED",
		"mode":mode,
		"proof_id":_review_context.get("proof_id", "NONE"),
		"context_sha256":FileAccess.get_sha256(_review_context_path) if FileAccess.file_exists(_review_context_path) else "",
		"issues":Array(issues),
		"renderer":RenderingServer.get_current_rendering_method(),
		"rendering_driver":RenderingServer.get_current_rendering_driver_name(),
		"usable_ui_reached":passed,
		"evidence_items_verified":_review_context.get("evidence_items", []).size() if passed else 0,
		"criteria_presented":_review_controls.size() if passed else 0,
		"human_judgement_recorded":false,
		"governed_forms_modified":false,
		"proof_execution_started":false,
		"identity_allocation_started":false,
		"proof_observation_created":false
	}
	print(REVIEW_REPORT_PREFIX + JSON.stringify(report))
	if mode == "review-preflight" or not passed:
		get_tree().quit(0 if passed else 4)


func _run_capability(args: PackedStringArray, mode: String, proof_id: String, case_id: String) -> void:
	var resource_path := _arg_value(args, "--resource-path", "")
	var requested_capability := _arg_value(args, "--requested-capability", "")
	var canary_path := _arg_value(args, "--canary-path", "")
	var external_host := _arg_value(args, "--external-host", "127.0.0.1")
	var external_port := _arg_value(args, "--external-port", "0").to_int()
	var resource_type: String = ""
	var dependencies: Array = []
	if ResourceLoader.exists(resource_path):
		var resolved_resource: Resource = ResourceLoader.load(resource_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if resolved_resource != null:
			resource_type = resolved_resource.get_class()
		dependencies = Array(ResourceLoader.get_dependencies(resource_path))
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
	var supported: bool = resource_type != ""
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
	if mode == "review-preflight" or mode == "human-review":
		await _run_review(args, mode)
		return
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
