extends Node
## Reachability and interaction probe for the four formerly planned creator routes.

var checks := 0
var failures: Array[String] = []
var workspace: ForgeWorkspace
var workspace_host: Control

const INPUT_VIEWPORT_SIZE := Vector2i(1800, 1000)
const COMPACT_FORGE_HOST_SIZE := Vector2(1152, 648)


func _ready() -> void:
	ForgeAccessPolicy.test_override = true
	# Headless Godot otherwise exposes a 64 x 64 root viewport. Size the actual
	# input viewport, then mount Forge inside the compact host we want to verify.
	get_window().size = INPUT_VIEWPORT_SIZE
	await get_tree().process_frame
	workspace_host = Control.new()
	workspace_host.name = "ForgeProbeHost"
	workspace_host.size = COMPACT_FORGE_HOST_SIZE
	workspace_host.clip_contents = true
	add_child(workspace_host)
	workspace = ForgeWorkspace.new()
	workspace.host_mode = "editor"
	workspace.size = workspace_host.size
	workspace_host.add_child(workspace)
	await get_tree().process_frame
	await get_tree().process_frame
	# Child minima are now responsive; re-assert the fixed host rectangle after
	# the first container sort so a direct Node test host behaves like the editor
	# or game viewport that normally owns ForgeWorkspace.
	workspace.size = workspace_host.size
	workspace.refresh_host_layout()
	await get_tree().process_frame
	await get_tree().process_frame
	_test_routes()
	await _test_structures()
	await _test_characters()
	await _test_vfx()
	await _test_audio()
	_test_accessibility()
	if is_instance_valid(workspace._creator_panel._audio_player):
		workspace._creator_panel._audio_player.stop()
		workspace._creator_panel._audio_player.stream = null
	await _test_library_and_delivery()
	workspace.queue_free()
	await get_tree().process_frame
	await get_tree().process_frame
	ForgeAccessPolicy.clear_test_override()
	print(JSON.stringify({"ok": failures.is_empty(), "checks": checks,
		"failures": failures}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_routes() -> void:
	for route_id in ["blueprint_editor", "entity_editor", "vfx_editor", "audio_editor"]:
		var route := ForgeNavigationCatalog.route(route_id)
		_expect(str(route.get("availability", "")) == ForgeNavigationCatalog.AUTHOR,
			"%s is an authoring route" % route_id)
		_expect(str(route.get("handler", "")) == "_show_creator_studio",
			"%s uses creator studio handler" % route_id)
		_expect(bool(route.get("show_preview", false)) == (route_id != "audio_editor"),
			"%s declares the correct contextual preview capability" % route_id)


func _test_structures() -> void:
	workspace.open_route("blueprint_editor")
	await get_tree().process_frame
	var panel := workspace._creator_panel
	_expect(panel != null and panel.domain == "structures", "structures creator opens")
	workspace._preview_user_visible = false
	workspace._apply_preview_visibility()
	_expect(not workspace._preview_toggle_button.disabled \
			and not workspace._preview_panel.visible,
		"structures preview can be user-hidden without disabling its toggle")
	workspace._preview_toggle_button.pressed.emit()
	_expect(workspace._preview_user_visible and workspace._preview_panel.visible \
			and workspace._preview_toggle_button.text == "Preview: On",
		"structures preview toggle turns the live panel on")
	_create(panel, "structure.module", "UI Probe Room", "ui_probe_room")
	_expect(panel.current_resource is ForgeBlueprintModuleDefinition,
		"structure module can be created in UI")
	_expect(workspace._preview.has_visible_presentation(),
		"structure source activation draws a contextual live preview")
	var module := panel.current_resource as ForgeBlueprintModuleDefinition
	_expect(module.connectors.size() == 2, "new room starts with two editable connection points")
	_expect(module.schema_version == 2 and module.physical_authoring_mode == "voxel_grid",
		"new structures opt into explicit schema-v2 visual authoring")
	_expect(panel.find_child("StructureVisualBuilder", true, false) is ForgeStructureVoxelBuilder \
			and panel.find_child("StructureVoxel3DCanvas", true, false) is ForgeVoxel3DCanvas,
		"structure module opens directly in the visual 3D block builder")
	_expect(panel.find_child("StructureToolTabs", true, false) is TabContainer,
		"structure block and stage tools remain accessible in responsive tabs")
	var builder := panel._structure_builder
	var canvas := builder._canvas
	var canvas_edits: Array[Dictionary] = []
	canvas.cell_pressed.connect(func(position: Vector3i, erase: bool, continuous: bool) -> void:
		canvas_edits.append({"position": position, "erase": erase,
			"continuous": continuous}))
	var orbit_before := canvas.camera_yaw
	var right_press := InputEventMouseButton.new()
	right_press.button_index = MOUSE_BUTTON_RIGHT
	right_press.pressed = true
	right_press.position = Vector2(120, 120)
	canvas._handle_mouse_button(right_press)
	var orbit_motion := InputEventMouseMotion.new()
	orbit_motion.position = Vector2(150, 125)
	orbit_motion.relative = Vector2(30, 5)
	canvas._handle_mouse_motion(orbit_motion)
	var right_release := InputEventMouseButton.new()
	right_release.button_index = MOUSE_BUTTON_RIGHT
	right_release.pressed = false
	right_release.position = Vector2(150, 125)
	canvas._handle_mouse_button(right_release)
	_expect(not is_equal_approx(canvas.camera_yaw, orbit_before) \
			and canvas_edits.is_empty(),
		"3D canvas right-drag orbits without accidentally erasing")
	var click_press := InputEventMouseButton.new()
	click_press.button_index = MOUSE_BUTTON_RIGHT
	click_press.pressed = true
	click_press.position = Vector2(120, 120)
	canvas._handle_mouse_button(click_press)
	var click_release := InputEventMouseButton.new()
	click_release.button_index = MOUSE_BUTTON_RIGHT
	click_release.pressed = false
	click_release.position = Vector2(120, 120)
	canvas._handle_mouse_button(click_release)
	_expect(canvas_edits.size() == 1 and bool(canvas_edits[0].get("erase", false)),
		"3D canvas preserves single-cell right-click erase")
	var routed_edit_count := canvas_edits.size()
	var routed_orbit_before := canvas.camera_yaw
	await _route_mouse_drag(canvas, MOUSE_BUTTON_RIGHT, Vector2(42, 9))
	_expect(not is_equal_approx(canvas.camera_yaw, routed_orbit_before) \
			and canvas_edits.size() == routed_edit_count,
		"assembled structure canvas receives right-drag orbit without editing "
		+ "(before=%0.3f after=%0.3f drag=%s rect=%s)" % [
			routed_orbit_before, canvas.camera_yaw, str(canvas._drag_button),
			str(canvas.get_global_rect())])
	var routed_pan_before := canvas.camera_target
	await _route_mouse_drag(canvas, MOUSE_BUTTON_MIDDLE, Vector2(26, -18))
	_expect(not canvas.camera_target.is_equal_approx(routed_pan_before),
		"assembled structure canvas receives middle-drag pan")
	var routed_zoom_before := canvas.camera_distance
	await _route_mouse_wheel(canvas, MOUSE_BUTTON_WHEEL_UP)
	_expect(canvas.camera_distance < routed_zoom_before,
		"assembled structure canvas receives wheel zoom")
	var preview_orbit_before := workspace._preview._yaw
	await _route_mouse_drag(workspace._preview, MOUSE_BUTTON_LEFT, Vector2(36, 8))
	_expect(not is_equal_approx(workspace._preview._yaw, preview_orbit_before),
		"assembled live preview receives left-drag orbit "
		+ "(before=%0.3f after=%0.3f dragging=%s rect=%s)" % [
			preview_orbit_before, workspace._preview._yaw,
			str(workspace._preview._dragging),
			str(workspace._preview.get_global_rect())])
	var registry_block_count := 0
	for record in ForgeRegistryBridge.new().all_gameplay_records():
		if str(record.get("kind", "")) == "block":
			registry_block_count += 1
	var palette_ids := {}
	for record in builder.block_records:
		palette_ids[str(record.get("gameplay_id", ""))] = true
	_expect(builder.block_records.size() == registry_block_count \
			and palette_ids.size() == registry_block_count,
		"visual block palette mirrors every live registry block exactly once")
	var advanced := panel.find_child("AdvancedSourceFields", true, false)
	_expect(advanced != null and not advanced.visible,
		"every typed field is preserved in a collapsed Advanced Source panel")
	var before_cells := module.structure_voxel_source.cells.size()
	builder._on_canvas_cell(Vector3i(1, 0, 1), false, false)
	builder._on_stroke_finished()
	_expect(module.structure_voxel_source.cells.size() == before_cells + 1,
		"one visual paint gesture commits one structure source change")
	_expect(panel.undo() and module.structure_voxel_source.cells.size() == before_cells,
		"visual structure gesture has grouped undo")
	_expect(panel.redo() and module.structure_voxel_source.cells.size() == before_cells + 1,
		"visual structure gesture has grouped redo")
	canvas._set_hover_cell(Vector3i(2, 0, 1))
	var cursor_highlight := canvas._highlight_root.find_child(
		"CursorTarget", true, false)
	_expect(canvas._has_hover_cell and canvas._hover_cell == Vector3i(2, 0, 1) \
			and cursor_highlight is MeshInstance3D,
		"3D canvas visibly highlights the exact prospective edit cell")
	builder.active_tool = "select"
	builder._on_canvas_cell(Vector3i(1, 0, 1), false, false)
	var selection_highlight := canvas._highlight_root.find_child(
		"Selected_1_0_1", true, false)
	_expect(builder.selection.has("1,0,1") \
			and selection_highlight is MeshInstance3D,
		"3D canvas keeps selected structure cells visibly highlighted")
	builder.active_tool = "pencil"
	_expect(panel.find_child("CreatorEditor", true, false) != null,
		"structure editor surface is mounted")
	var preview := panel.preview_current()
	_expect(bool(preview.get("ok", false)), "structure module provides source preview")
	_create(panel, "structure.state", "UI Probe State", "ui_probe_state")
	_expect(panel.current_resource is ForgeBlueprintStateDefinition,
		"building damage/construction state can be created in UI")
	_expect(workspace._preview.has_visible_presentation(),
		"building state keeps a visible state/envelope preview")
	var catalogue_state: ForgeBlueprintStateDefinition = load(
		"res://content/forge/blueprints/user/production/states/"
		+ "blueprint_leyforge_automation_automated_farm_greenhouse_a_light_damage.tres")
	panel._activate(catalogue_state, panel.registry.resolve("structure.state"))
	_expect(workspace._preview.visible_presentation_node_count() >= 8,
		"catalogue building state resolves and draws its owning blueprint geometry")
	_expect(workspace.find_child("GuideModeSelector", true, false) is OptionButton,
		"creator pages expose the Basic/In-depth guide switch")
	workspace._set_guide_mode(ForgeSectionGuides.IN_DEPTH)
	await get_tree().process_frame
	_expect(workspace._guide_mode == ForgeSectionGuides.IN_DEPTH \
			and workspace._creator_panel.domain == "structures",
		"switching guide detail preserves the active creator studio")
	var deep_steps := ForgeSectionGuides.steps_for_page(
		"Blueprint Composition Editor", ForgeSectionGuides.IN_DEPTH)
	_expect(not deep_steps.is_empty() and str(deep_steps[0]).contains("Why now:"),
		"in-depth structure guide explains why each capstone step happens now")
	workspace._set_guide_mode(ForgeSectionGuides.BASIC)
	await get_tree().process_frame


func _test_characters() -> void:
	workspace.open_route("entity_editor")
	await get_tree().process_frame
	var panel := workspace._creator_panel
	_expect(panel != null and panel.domain == "characters", "characters creator opens")
	_create(panel, "character.entity", "UI Probe Creature", "ui_probe_creature")
	_expect(panel.current_resource is ForgeEntityDefinition,
		"character entity can be created in UI")
	var entity := panel.current_resource as ForgeEntityDefinition
	_expect(entity.body_plan != null and entity.body_plan.body_parts.size() == 1,
		"new character has editable seeded body plan")
	_expect(not workspace._preview_toggle_button.disabled \
			and workspace._preview_panel.visible \
			and workspace._preview.has_visible_presentation(),
		"character entity opens with a visible voxel body preview")
	panel._select_body_part(entity.body_plan.body_parts[0])
	await get_tree().process_frame
	_expect(panel.find_child("CharacterVoxel3DCanvas", true, false) is ForgeVoxel3DCanvas,
		"character body part opens in direct 3D voxel sculpting")
	var character_canvas := panel.find_child(
		"CharacterVoxel3DCanvas", true, false) as ForgeVoxel3DCanvas
	var character_orbit_before := character_canvas.camera_yaw
	await _route_mouse_drag(
		character_canvas, MOUSE_BUTTON_RIGHT, Vector2(-34, 7))
	_expect(not is_equal_approx(
		character_canvas.camera_yaw, character_orbit_before),
		"assembled character 3D canvas receives orbit input")
	_expect(panel.find_child("CharacterVoxelCanvas", true, false) is ForgeVoxelSliceCanvas,
		"character body part exposes voxel sculpting canvas")
	var preview := panel.preview_current()
	_expect(bool(preview.get("ok", false)) and int(preview.get("parts", 0)) == 1,
		"character preview reports body composition")
	_create(panel, "character.rig", "UI Probe Rig", "ui_probe_rig")
	var rig := panel.current_resource as ForgeRigProfile
	panel._add_rig_binding(rig)
	panel._add_rig_binding(rig)
	panel._add_rig_joint(rig)
	_expect(rig.role_bindings.size() == 2 and rig.joints.size() == 1,
		"character rig UI authors semantic bindings and joints")
	_create(panel, "character.animation_library", "UI Probe Animation", "ui_probe_animation")
	var library := panel.current_resource as ForgeEntityAnimationLibrary
	panel._add_animation_clip(library)
	panel._add_animation_track(library.clips[0])
	panel._add_animation_marker(library.clips[0])
	_expect(library.clips.size() == 1 and library.clips[0].role_tracks.size() == 1 \
			and library.clips[0].event_markers.size() == 1,
		"character animation UI authors clips, tracks and event markers")
	_expect(panel.find_child("@ForgeAnimationTimeline@", true, false) is ForgeAnimationTimeline \
			or _find_type(panel, "ForgeAnimationTimeline") != null,
		"character animation opens a semantic dope-sheet timeline")


func _test_vfx() -> void:
	workspace.open_route("vfx_editor")
	await get_tree().process_frame
	var panel := workspace._creator_panel
	_expect(panel != null and panel.domain == "vfx", "VFX creator opens")
	_create(panel, "vfx.graph", "UI Probe Sparks", "ui_probe_sparks")
	_expect(panel.current_resource is ForgeVfxGraph, "VFX graph can be created in UI")
	var graph := panel.current_resource as ForgeVfxGraph
	_expect(panel.find_child("VfxVisualGraph", true, false) is GraphEdit,
		"VFX graph opens as a draggable visual node canvas")
	var before := graph.nodes.size()
	panel._add_vfx_node(graph, "colour")
	_expect(graph.nodes.size() == before + 1, "VFX UI adds bounded graph nodes")
	panel._connect_vfx_nodes(graph)
	_expect(graph.edges.size() == maxi(0, graph.nodes.size() - 1),
		"VFX UI connects graph nodes")
	_expect(not workspace._preview_toggle_button.disabled \
			and workspace._preview_panel.visible \
			and workspace._preview.has_visible_presentation(),
		"VFX graph opens with a visible contextual graph preview")
	var preview := panel.preview_current()
	_expect(bool(preview.get("ok", false)) and int(preview.get("nodes", 0)) >= 2,
		"VFX graph preview reports execution bounds")
	_create(panel, "vfx.form", "UI Probe Spark Form", "ui_probe_spark_form")
	var form := panel.current_resource as ForgeVfxForm
	_expect(panel.find_child("VfxVoxel3DCanvas", true, false) is ForgeVoxel3DCanvas,
		"VFX forms support direct 3D sculpting")
	var vfx_canvas := panel.find_child(
		"VfxVoxel3DCanvas", true, false) as ForgeVoxel3DCanvas
	var vfx_orbit_before := vfx_canvas.camera_yaw
	await _route_mouse_drag(vfx_canvas, MOUSE_BUTTON_RIGHT, Vector2(31, -6))
	_expect(not is_equal_approx(vfx_canvas.camera_yaw, vfx_orbit_before),
		"assembled VFX 3D canvas receives orbit input")
	_expect(panel.find_child("VfxFormVoxelCanvas", true, false) is ForgeVoxelSliceCanvas,
		"VFX form exposes a voxel sculpting canvas")
	panel._vfx_form_canvas.voxel_edit_requested.emit(Vector3i(1, 1, 0), 1)
	_expect(form.cell_records.size() == 2,
		"VFX form canvas records authored voxels")


func _test_audio() -> void:
	workspace.open_route("audio_editor")
	await get_tree().process_frame
	var panel := workspace._creator_panel
	_expect(panel != null and panel.domain == "audio", "audio creator opens")
	_create(panel, "audio.synth_patch", "UI Probe Instrument", "ui_probe_instrument")
	_expect(panel.current_resource is ForgeSynthPatchDefinition,
		"file-free synth patch can be created in UI")
	var patch := panel.current_resource as ForgeSynthPatchDefinition
	patch.sample_rate_hz = 8000
	patch.note_duration_seconds = 0.03
	patch.amplitude_envelope["release_seconds"] = 0.01
	patch.filter_settings["cutoff_hz"] = 3000.0
	var keyboard := panel.find_child("ForgeSynthKeyboard", true, false)
	_expect(keyboard is GridContainer and keyboard.get_child_count() == 24,
		"audio creator exposes a two-octave virtual keyboard")
	_expect(panel.find_child("VisualSynthKeyboard", true, false) is GridContainer \
			and _find_type(panel, "ForgeSynthEnvelopeCanvas") != null,
		"audio visual workspace exposes a playable keyboard and envelope graph")
	var preview := panel._play_synth_note(60)
	_expect(bool(preview.get("ok", false)), "virtual keyboard renders and plays a note")
	_expect(absf(float(preview.get("frequency_hz", 0.0)) - 261.6256) < 0.1,
		"virtual keyboard respects tunable piano pitch mapping")
	var validation := panel.validate_current()
	_expect(bool(validation.get("ok", false)), "UI-authored synth patch validates")
	panel._create_editable_source_from_synth(patch)
	var editable_source := panel.current_resource as ForgeSoundSource
	_expect(editable_source != null and editable_source.source_path.begins_with(
			"res://generated/forge/audio/working/") \
			and not bool(editable_source.provenance.get("file_upload_required", true)),
		"synth creates an editable Sound Source without an uploaded file")
	_expect(panel.find_child("VisualWaveformEditor", true, false) is ForgeWaveformPreview,
		"Sound Source exposes draggable non-destructive waveform handles")
	panel._create_sound_event_from_source(editable_source)
	var source_event := panel.current_resource as ForgeSoundEvent
	_expect(source_event != null and source_event.source_ids.has(editable_source.stable_id),
		"editable generated source hands off to a layered Sound Event")
	panel._activate(patch, panel.registry.resolve("audio.synth_patch"))
	panel._create_sound_event_from_synth(patch)
	var linked_event := panel.current_resource as ForgeSoundEvent
	_expect(linked_event != null and linked_event.source_ids.size() == 1 \
			and linked_event.layer_records.size() == 1,
		"synth handoff creates a layered Sound Event without an uploaded file")
	_create(panel, "audio.event", "UI Probe Sound Event", "ui_probe_sound_event")
	var event := panel.current_resource as ForgeSoundEvent
	panel._add_sound_layer(event)
	_expect(event.layer_records.size() == 1,
		"audio event UI adds editable layered playback records")
	_expect(panel.find_child("SoundEventVisualLanes", true, false) is VBoxContainer,
		"Sound Event exposes visual source lanes with mix controls")
	_create(panel, "audio.spatial_profile", "UI Probe Spatial", "ui_probe_spatial")
	_expect(panel.current_resource is ForgeSpatialAudioProfile,
		"audio creator exposes editable spatial profiles")
	_expect(_find_type(panel, "ForgeSpatialAudioCanvas") != null,
		"spatial audio opens an isolated draggable listener/source test view")
	_remove_if_present(editable_source.source_path)


func _test_library_and_delivery() -> void:
	workspace.open_route("asset_browser")
	await get_tree().process_frame
	var card_grid := workspace._browser_results as GridContainer
	_expect(card_grid != null and card_grid.columns == 3 and card_grid.get_child_count() > 0,
		"Library & Create presents canonical sources as filtered visual cards")
	_expect(workspace._library_kind_filter is OptionButton \
			and workspace._library_category_filter is OptionButton \
			and workspace._library_status_filter is OptionButton,
		"visual catalogue exposes type, category and source-state filters")
	workspace.open_route("test_laboratory")
	await get_tree().process_frame
	await get_tree().process_frame
	var composer := _find_type(workspace, "ForgeScenarioComposer")
	_expect(composer != null,
		"Test & Delivery mounts the isolated visual scenario composer")
	_expect(workspace.find_child("ScenarioVisualCanvas", true, false) is GraphEdit,
		"scenario fixtures are placed on a draggable visual canvas")
	_expect(workspace._capture_comparison_label != null \
			and workspace._capture_comparison_label.text.contains("Human review"),
		"side-by-side capture keeps human review explicitly open")
	if composer != null:
		composer.call("_new_scenario")
		var name_entry := composer.get("_name") as LineEdit
		name_entry.text = "UI Visual Scenario Probe"
		var palette := composer.get("_palette") as ItemList
		if palette.item_count > 0:
			palette.select(0)
			composer.call("_place_fixture")
			composer.call("_add_action")
			composer.call("_save_scenario")
		var scenario := composer.get("scenario") as ForgePresentationTestScenario
		var saved_path := "user://leyforge/forge/test_scenarios/%s.tres" % \
			ForgeId.safe_filename(scenario.stable_id)
		_expect(FileAccess.file_exists(saved_path),
			"visual scenario composer saves outside gameplay-world save data")
		var reopened := ResourceLoader.load(saved_path, "",
			ResourceLoader.CACHE_MODE_IGNORE) as ForgePresentationTestScenario
		_expect(reopened != null and reopened.fixture_ids.size() == 1 \
				and reopened.action_records.size() == 1,
			"isolated visual scenario reopens with fixtures and inputs intact")
		_remove_if_present(saved_path)


func _create(
		panel: ForgeCreatorStudioPanel, type_id: String,
		title: String, slug: String) -> void:
	for index in panel._type_selector.item_count:
		if str(panel._type_selector.get_item_metadata(index)) == type_id:
			panel._type_selector.select(index)
			break
	panel._name_entry.text = title
	panel._slug_entry.text = slug
	panel._create_new()


func _test_accessibility() -> void:
	var missing_labels := 0
	for node in _descendants(workspace):
		if node is Button and node.visible and node.get_meta("accessible_label", "").is_empty() \
				and node.text.strip_edges().is_empty():
			missing_labels += 1
	_expect(missing_labels == 0, "visible icon-only creator buttons have accessible labels")
	_expect(workspace._creator_panel._state_label.text.contains("|"),
		"creator state is written in text instead of colour alone")
	for title in ["Blueprint Composition Editor", "Entity Model Editor",
			"Live VFX Graph Editor", "Waveform & Event Editor"]:
		var steps := ForgeSectionGuides.steps_for_page(title, ForgeSectionGuides.IN_DEPTH)
		_expect(not steps.is_empty() and str(steps[-1]).contains("Why now:"),
			"%s has an explanatory in-depth capstone" % title)


func _route_mouse_drag(
		control: Control, button: MouseButton, delta: Vector2) -> void:
	await _reveal_control(control)
	var rect := _visible_control_rect(control)
	_expect(rect.size.x >= 32.0 and rect.size.y >= 32.0,
		"3D input target has a usable rendered rectangle")
	if rect.size.x < 32.0 or rect.size.y < 32.0:
		return
	var margin := Vector2(absf(delta.x), absf(delta.y)) + Vector2(8, 8)
	var safe_size := rect.size - margin
	if safe_size.x < 16.0 or safe_size.y < 16.0:
		return
	var start := rect.position + margin * 0.5 + safe_size * 0.5
	var finish := start + delta
	var button_mask := _mouse_button_mask(button)
	var press := InputEventMouseButton.new()
	press.button_index = button
	press.button_mask = button_mask
	press.pressed = true
	press.position = start
	press.global_position = start
	get_viewport().push_input(press, true)
	await get_tree().process_frame
	var motion := InputEventMouseMotion.new()
	motion.button_mask = button_mask
	motion.position = finish
	motion.global_position = finish
	motion.relative = delta
	get_viewport().push_input(motion, true)
	await get_tree().process_frame
	var release := InputEventMouseButton.new()
	release.button_index = button
	release.button_mask = 0
	release.pressed = false
	release.position = finish
	release.global_position = finish
	get_viewport().push_input(release, true)
	await get_tree().process_frame


func _route_mouse_wheel(control: Control, button: MouseButton) -> void:
	await _reveal_control(control)
	var rect := _visible_control_rect(control)
	_expect(rect.size.x >= 32.0 and rect.size.y >= 32.0,
		"3D wheel target has a usable visible rectangle")
	if rect.size.x < 32.0 or rect.size.y < 32.0:
		return
	var position := rect.position + rect.size * 0.5
	var wheel := InputEventMouseButton.new()
	wheel.button_index = button
	wheel.pressed = true
	wheel.position = position
	wheel.global_position = position
	get_viewport().push_input(wheel, true)
	await get_tree().process_frame


func _mouse_button_mask(button: MouseButton) -> int:
	match button:
		MOUSE_BUTTON_LEFT:
			return MOUSE_BUTTON_MASK_LEFT
		MOUSE_BUTTON_RIGHT:
			return MOUSE_BUTTON_MASK_RIGHT
		MOUSE_BUTTON_MIDDLE:
			return MOUSE_BUTTON_MASK_MIDDLE
	return 0


func _ensure_control_visible(control: Control) -> void:
	# Work from the nearest scroll host outward so nested editor pages settle in
	# the same order as a user revealing the canvas.
	var scroll_hosts: Array[ScrollContainer] = []
	var ancestor := control.get_parent()
	while ancestor != null:
		if ancestor is ScrollContainer:
			scroll_hosts.append(ancestor as ScrollContainer)
		ancestor = ancestor.get_parent()
	for scroll in scroll_hosts:
		# Oversized authoring canvases cannot fit wholly within the page scroller,
		# so align their leading edge with the scroll viewport exactly as a user
		# would. Godot's ensure_control_visible can alternate between the leading
		# and trailing edges when the child is taller than the viewport.
		var target_top := control.get_global_rect().position.y
		var viewport_top := scroll.get_global_rect().position.y
		scroll.scroll_vertical += roundi(target_top - viewport_top - 8.0)


func _reveal_control(control: Control) -> void:
	# Flow containers re-wrap after a scrollbar first appears, so revealing a
	# deep authoring canvas can need a second layout pass. Iterate to the stable
	# visible rectangle instead of assuming the first scroll extent was final.
	for _attempt in 4:
		_ensure_control_visible(control)
		await get_tree().process_frame
		await get_tree().process_frame
		var visible_rect := _visible_control_rect(control)
		if visible_rect.size.x >= 64.0 and visible_rect.size.y >= 64.0:
			return


func _visible_control_rect(control: Control) -> Rect2:
	var rect := control.get_global_rect().intersection(
		get_viewport().get_visible_rect())
	var ancestor := control.get_parent()
	while ancestor is Control:
		var ancestor_control := ancestor as Control
		if ancestor_control.clip_contents or ancestor_control is ScrollContainer:
			rect = rect.intersection(ancestor_control.get_global_rect())
		ancestor = ancestor.get_parent()
	return rect


func _descendants(root: Node) -> Array[Node]:
	var result: Array[Node] = []
	for child in root.get_children():
		result.append(child)
		result.append_array(_descendants(child))
	return result


func _find_type(root: Node, class_name_value: String) -> Node:
	for node in _descendants(root):
		if node.get_script() != null \
				and str(node.get_script().get_global_name()) == class_name_value:
			return node
	return null


func _expect(condition: bool, label: String) -> void:
	checks += 1
	if not condition:
		failures.append(label)


func _remove_if_present(path: String) -> void:
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
